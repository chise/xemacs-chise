/* Asynchronous subprocess implementation for Win32
   Copyright (C) 1985, 1986, 1987, 1988, 1992, 1993, 1994, 1995
   Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1995, 1996 Ben Wing.

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Written by Kirill M. Katsnelson <kkm@kis.ru>, April 1998 */

#include <config.h>
#include "lisp.h"

#include "hash.h"
#include "lstream.h"
#include "process.h"
#include "procimpl.h"
#include "sysdep.h"

#include <windows.h>
#ifndef __MINGW32__
#include <shellapi.h>
#else
#include <errno.h>
#endif
#include <signal.h>
#ifdef HAVE_SOCKETS
#include <winsock.h>
#endif

/* Arbitrary size limit for code fragments passed to run_in_other_process */
#define FRAGMENT_CODE_SIZE 32

/* Bound by winnt.el */
Lisp_Object Qnt_quote_process_args;

/* Implementation-specific data. Pointed to by Lisp_Process->process_data */
struct nt_process_data
{
  HANDLE h_process;
};

#define NT_DATA(p) ((struct nt_process_data*)((p)->process_data))

/*-----------------------------------------------------------------------*/
/* Process helpers							 */
/*-----------------------------------------------------------------------*/

/* This one breaks process abstraction. Prototype is in console-msw.h,
   used by select_process method in event-msw.c */
HANDLE
get_nt_process_handle (struct Lisp_Process *p)
{
  return (NT_DATA (p)->h_process);
}

/*-----------------------------------------------------------------------*/
/* Running remote threads. See Microsoft Systems Journal 1994 Number 5	 */
/* Jeffrey Richter, Load Your 32-bit DLL into Another Process's Address..*/
/*-----------------------------------------------------------------------*/

typedef struct
{
  HANDLE h_process;
  HANDLE h_thread;
  LPVOID address;
} process_memory;

/*
 * Allocate SIZE bytes in H_PROCESS address space. Fill in PMC used
 * further by other routines. Return nonzero if successful.
 *
 * The memory in other process is allocated by creating a suspended
 * thread. Initial stack of that thread is used as the memory
 * block. The thread entry point is the routine ExitThread in
 * kernel32.dll, so the allocated memory is freed just by resuming the 
 * thread, which immediately terminates after that.
 */

static int 
alloc_process_memory (HANDLE h_process, size_t size,
		      process_memory* pmc)
{
  LPTHREAD_START_ROUTINE adr_ExitThread =
    (LPTHREAD_START_ROUTINE)
    GetProcAddress (GetModuleHandle ("kernel32"), "ExitThread");
  DWORD dw_unused;
  CONTEXT context;
  MEMORY_BASIC_INFORMATION mbi;

  pmc->h_process = h_process;
  pmc->h_thread = CreateRemoteThread (h_process, NULL, size,
				     adr_ExitThread, NULL,
				     CREATE_SUSPENDED, &dw_unused);
  if (pmc->h_thread == NULL)
    return 0;

  /* Get context, for thread's stack pointer */
  context.ContextFlags = CONTEXT_CONTROL;
  if (!GetThreadContext (pmc->h_thread, &context))
    goto failure;

  /* Determine base address of the committed range */
  if (sizeof(mbi) != VirtualQueryEx (h_process,
#if defined (_X86_)
				     (LPDWORD)context.Esp - 1,
#elif defined (_ALPHA_)
				     (LPDWORD)context.IntSp - 1,
#else
#error Unknown processor architecture
#endif
				     &mbi, sizeof(mbi)))
    goto failure;

  /* Change the page protection of the allocated memory to executable,
     read, and write. */
  if (!VirtualProtectEx (h_process, mbi.BaseAddress, size,
			 PAGE_EXECUTE_READWRITE, &dw_unused))
    goto failure;

  pmc->address = mbi.BaseAddress;
  return 1;

 failure:
  ResumeThread (pmc->h_thread);
  pmc->address = 0;
  return 0;
}

static void
free_process_memory (process_memory* pmc)
{
  ResumeThread (pmc->h_thread);
}

/*
 * Run ROUTINE in the context of process determined by H_PROCESS. The
 * routine is passed the address of DATA as parameter. The ROUTINE must
 * not be longer than ROUTINE_CODE_SIZE bytes. DATA_SIZE is the size of
 * DATA structure.
 *
 * Note that the code must be positionally independent, and compiled
 * without stack checks (they cause implicit calls into CRT so will
 * fail). DATA should not refer any data in calling process, as both
 * routine and its data are copied into remote process. Size of data
 * and code together should not exceed one page (4K on x86 systems).
 *
 * Return the value returned by ROUTINE, or (DWORD)-1 if call failed.
 */
static DWORD
run_in_other_process (HANDLE h_process,
		      LPTHREAD_START_ROUTINE routine,
		      LPVOID data, size_t data_size)
{
  process_memory pm;
  CONST size_t code_size = FRAGMENT_CODE_SIZE;
  /* Need at most 3 extra bytes of memory, for data alignment */
  size_t total_size = code_size + data_size + 3;
  LPVOID remote_data;
  HANDLE h_thread;
  DWORD dw_unused;

  /* Allocate memory */
  if (!alloc_process_memory (h_process, total_size, &pm))
    return (DWORD)-1;

  /* Copy code */
  if (!WriteProcessMemory (h_process, pm.address, (LPVOID)routine,
			   code_size, NULL))
    goto failure;

  /* Copy data */
  if (data_size)
    {
      remote_data = (LPBYTE)pm.address + ((code_size + 4) & ~3);
      if (!WriteProcessMemory (h_process, remote_data, data, data_size, NULL))
	goto failure;
    }
  else
    remote_data = NULL;

  /* Execute the remote copy of code, passing it remote data */
  h_thread = CreateRemoteThread (h_process, NULL, 0,
				 (LPTHREAD_START_ROUTINE) pm.address,
				 remote_data, 0, &dw_unused);
  if (h_thread == NULL)
    goto failure;

  /* Wait till thread finishes */
  WaitForSingleObject (h_thread, INFINITE);

  /* Free remote memory */
  free_process_memory (&pm);

  /* Return thread's exit code */
  {
    DWORD exit_code;
    GetExitCodeThread (h_thread, &exit_code);
    CloseHandle (h_thread);
    return exit_code;
  }

 failure:
  free_process_memory (&pm);
  return (DWORD)-1;
}

/*-----------------------------------------------------------------------*/
/* Sending signals							 */
/*-----------------------------------------------------------------------*/

/*
 * We handle the following signals:
 *
 * SIGKILL, SIGTERM, SIGQUIT, SIGHUP - These four translate to ExitProcess
 *    executed by the remote process
 * SIGINT - The remote process is sent CTRL_BREAK_EVENT
 *
 * The MSVC5.0 compiler feels free to re-order functions within a
 * compilation unit, so we have no way of finding out the size of the
 * following functions. Therefore these functions must not be larger than
 * FRAGMENT_CODE_SIZE.
 */

/*
 * Sending SIGKILL
 */
typedef struct
{
  void (WINAPI *adr_ExitProcess) (UINT);
} sigkill_data;

static DWORD WINAPI
sigkill_proc (sigkill_data* data)
{
  (*data->adr_ExitProcess)(255);
  return 1;
}

/*
 * Sending break or control c
 */
typedef struct
{
  BOOL (WINAPI *adr_GenerateConsoleCtrlEvent) (DWORD, DWORD);
  DWORD event;
} sigint_data;

static DWORD WINAPI
sigint_proc (sigint_data* data)
{
  return (*data->adr_GenerateConsoleCtrlEvent) (data->event, 0);
}

/*
 * Enabling signals
 */
typedef struct
{
  BOOL (WINAPI *adr_SetConsoleCtrlHandler) (LPVOID, BOOL);
} sig_enable_data;

static DWORD WINAPI
sig_enable_proc (sig_enable_data* data)
{
  (*data->adr_SetConsoleCtrlHandler) (NULL, FALSE);
  return 1;
}

/*
 * Send signal SIGNO to process H_PROCESS.
 * Return nonzero if successful.
 */

/* This code assigns a return value of GetProcAddress to function pointers
   of many different types. Instead of heavy obscure casts, we just disable
   warnings about assignments to different function pointer types. */
#pragma warning (disable : 4113)

static int
send_signal (HANDLE h_process, int signo)
{
  HMODULE h_kernel = GetModuleHandle ("kernel32");
  DWORD retval;
  
  assert (h_kernel != NULL);
  
  switch (signo)
    {
    case SIGKILL:
    case SIGTERM:
    case SIGQUIT:
    case SIGHUP:
      {
	sigkill_data d;
	d.adr_ExitProcess = GetProcAddress (h_kernel, "ExitProcess");
	assert (d.adr_ExitProcess);
	retval = run_in_other_process (h_process, 
				       (LPTHREAD_START_ROUTINE)sigkill_proc,
				       &d, sizeof (d));
	break;
      }
    case SIGINT:
      {
	sigint_data d;
	d.adr_GenerateConsoleCtrlEvent =
	  GetProcAddress (h_kernel, "GenerateConsoleCtrlEvent");
	assert (d.adr_GenerateConsoleCtrlEvent);
	d.event = CTRL_C_EVENT;
	retval = run_in_other_process (h_process, 
				       (LPTHREAD_START_ROUTINE)sigint_proc,
				       &d, sizeof (d));
	break;
      }
    default:
      assert (0);
    }

  return (int)retval > 0 ? 1 : 0;
}

/*
 * Enable CTRL_C_EVENT handling in a new child process
 */
static void
enable_child_signals (HANDLE h_process)
{
  HMODULE h_kernel = GetModuleHandle ("kernel32");
  sig_enable_data d;
  
  assert (h_kernel != NULL);
  d.adr_SetConsoleCtrlHandler =
    GetProcAddress (h_kernel, "SetConsoleCtrlHandler");
  assert (d.adr_SetConsoleCtrlHandler);
  run_in_other_process (h_process, (LPTHREAD_START_ROUTINE)sig_enable_proc,
			&d, sizeof (d));
}
  
#pragma warning (default : 4113)

/*
 * Signal error if SIGNO is not supported
 */
static void
validate_signal_number (int signo)
{
  if (signo != SIGKILL && signo != SIGTERM
      && signo != SIGQUIT && signo != SIGINT
      && signo != SIGHUP)
    signal_simple_error ("Signal number not supported", make_int (signo));
}
  
/*-----------------------------------------------------------------------*/
/* Process methods							 */
/*-----------------------------------------------------------------------*/

/*
 * Allocate and initialize Lisp_Process->process_data
 */

static void
nt_alloc_process_data (struct Lisp_Process *p)
{
  p->process_data = xnew_and_zero (struct nt_process_data);
}

static void
nt_finalize_process_data (struct Lisp_Process *p, int for_disksave)
{
  assert (!for_disksave);
  if (NT_DATA(p)->h_process)
    CloseHandle (NT_DATA(p)->h_process);
}

/*
 * Initialize XEmacs process implementation once
 */
static void
nt_init_process (void)
{
  /* Initialize winsock */
  WSADATA wsa_data;
  /* Request Winsock v1.1 Note the order: (minor=1, major=1) */
  WSAStartup (MAKEWORD (1,1), &wsa_data);
}

/*
 * Fork off a subprocess. P is a pointer to newly created subprocess
 * object. If this function signals, the caller is responsible for
 * deleting (and finalizing) the process object.
 *
 * The method must return PID of the new process, a (positive??? ####) number
 * which fits into Lisp_Int. No return value indicates an error, the method
 * must signal an error instead.
 */

static void
signal_cannot_launch (Lisp_Object image_file, DWORD err)
{
  mswindows_set_errno (err);
  signal_simple_error_2 ("Error starting", image_file, lisp_strerror (errno));
}

static int
nt_create_process (struct Lisp_Process *p,
		   Lisp_Object *argv, int nargv,
		   Lisp_Object program, Lisp_Object cur_dir)
{
  HANDLE hmyshove, hmyslurp, hprocin, hprocout;
  LPTSTR command_line;
  BOOL do_io, windowed;
  char *proc_env;

  /* Find out whether the application is windowed or not */
  {
    /* SHGetFileInfo tends to return ERROR_FILE_NOT_FOUND on most
       errors. This leads to bogus error message. */
    DWORD image_type;
    char *p = strrchr ((char *)XSTRING_DATA (program), '.');
    if (p != NULL &&
	(stricmp (p, ".exe") == 0 ||
	 stricmp (p, ".com") == 0 ||
	 stricmp (p, ".bat") == 0 ||
	 stricmp (p, ".cmd") == 0))
      {
	image_type = SHGetFileInfo ((char *)XSTRING_DATA (program), 0,NULL,
				    0, SHGFI_EXETYPE);
      }
    else
      {
	char progname[MAX_PATH];
	sprintf (progname, "%s.exe", (char *)XSTRING_DATA (program));
	image_type = SHGetFileInfo (progname, 0, NULL, 0, SHGFI_EXETYPE);
      }
    if (image_type == 0)
      signal_cannot_launch (program, (GetLastError () == ERROR_FILE_NOT_FOUND
				      ? ERROR_BAD_FORMAT : GetLastError ()));
    windowed = HIWORD (image_type) != 0;
  }

  /* Decide whether to do I/O on process handles, or just mark the
     process exited immediately upon successful launching. We do I/O if the
     process is a console one, or if it is windowed but windowed_process_io
     is non-zero */
  do_io = !windowed || windowed_process_io ;
  
  if (do_io)
    {
      /* Create two unidirectional named pipes */
      HANDLE htmp;
      SECURITY_ATTRIBUTES sa;

      sa.nLength = sizeof(sa);
      sa.bInheritHandle = TRUE;
      sa.lpSecurityDescriptor = NULL;

      CreatePipe (&hprocin, &hmyshove, &sa, 0);
      CreatePipe (&hmyslurp, &hprocout, &sa, 0);

      /* Stupid Win32 allows to create a pipe with *both* ends either
	 inheritable or not. We need process ends inheritable, and local
	 ends not inheritable. */
      DuplicateHandle (GetCurrentProcess(), hmyshove, GetCurrentProcess(), &htmp,
		       0, FALSE, DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS);
      hmyshove = htmp;
      DuplicateHandle (GetCurrentProcess(), hmyslurp, GetCurrentProcess(), &htmp,
		       0, FALSE, DUPLICATE_CLOSE_SOURCE | DUPLICATE_SAME_ACCESS);
      hmyslurp = htmp;
    }

  /* Convert an argv vector into Win32 style command line by a call to
     lisp function `nt-quote-process-args' which see (in winnt.el)*/
  {
    int i;
    Lisp_Object args_or_ret = Qnil;
    struct gcpro gcpro1;

    GCPRO1 (args_or_ret);

    for (i = 0; i < nargv; ++i)
      args_or_ret = Fcons (*argv++, args_or_ret);
    args_or_ret = Fnreverse (args_or_ret);
    args_or_ret = Fcons (program, args_or_ret);

    args_or_ret = call1 (Qnt_quote_process_args, args_or_ret);

    if (!STRINGP (args_or_ret))
      /* Luser wrote his/her own clever version */
      error ("Bogus return value from `nt-quote-process-args'");

    command_line = alloca_array (char, (XSTRING_LENGTH (program)
					+ XSTRING_LENGTH (args_or_ret) + 2));
    strcpy (command_line, XSTRING_DATA (program));
    strcat (command_line, " ");
    strcat (command_line, XSTRING_DATA (args_or_ret));

    UNGCPRO; /* args_or_ret */
  }

  /* Set `proc_env' to a nul-separated array of the strings in
     Vprocess_environment terminated by 2 nuls.  */
 
  {
    extern int compare_env (const char **strp1, const char **strp2);
    char **env;
    REGISTER Lisp_Object tem;
    REGISTER char **new_env;
    REGISTER int new_length = 0, i, new_space;
    char *penv;
    
    for (tem = Vprocess_environment;
 	 (CONSP (tem)
 	  && STRINGP (XCAR (tem)));
 	 tem = XCDR (tem))
      new_length++;
    
    /* new_length + 1 to include terminating 0.  */
    env = new_env = alloca_array (char *, new_length + 1);
 
    /* Copy the Vprocess_environment strings into new_env.  */
    for (tem = Vprocess_environment;
 	 (CONSP (tem)
 	  && STRINGP (XCAR (tem)));
 	 tem = XCDR (tem))
      {
	char **ep = env;
	char *string = (char *) XSTRING_DATA (XCAR (tem));
	/* See if this string duplicates any string already in the env.
	   If so, don't put it in.
	   When an env var has multiple definitions,
	   we keep the definition that comes first in process-environment.  */
	for (; ep != new_env; ep++)
	  {
	    char *p = *ep, *q = string;
	    while (1)
	      {
		if (*q == 0)
		  /* The string is malformed; might as well drop it.  */
		  goto duplicate;
		if (*q != *p)
		  break;
		if (*q == '=')
		  goto duplicate;
		p++, q++;
	      }
	  }
	*new_env++ = string;
      duplicate: ;
      }
    *new_env = 0;
    
    /* Sort the environment variables */
    new_length = new_env - env;
    qsort (env, new_length, sizeof (char *), compare_env);
    
    /* Work out how much space to allocate */
    new_space = 0;
    for (i = 0; i < new_length; i++)
      {
 	new_space += strlen(env[i]) + 1;
      }
    new_space++;
    
    /* Allocate space and copy variables into it */
    penv = proc_env = alloca(new_space);
    for (i = 0; i < new_length; i++)
      {
 	strcpy(penv, env[i]);
 	penv += strlen(env[i]) + 1;
      }
    *penv = 0;
  }
  
  /* Create process */
  {
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    DWORD err;

    xzero (si);
    si.dwFlags = STARTF_USESHOWWINDOW;
    si.wShowWindow = windowed ? SW_SHOWNORMAL : SW_HIDE;
    if (do_io)
      {
	si.hStdInput = hprocin;
	si.hStdOutput = hprocout;
	si.hStdError = hprocout;
	si.dwFlags |= STARTF_USESTDHANDLES;
      }

    err = (CreateProcess (NULL, command_line, NULL, NULL, TRUE,
			  CREATE_NEW_CONSOLE | CREATE_NEW_PROCESS_GROUP
			  | CREATE_SUSPENDED,
			  proc_env, (char *) XSTRING_DATA (cur_dir), &si, &pi)
	   ? 0 : GetLastError ());

    if (do_io)
      {
	/* These just have been inherited; we do not need a copy */
	CloseHandle (hprocin);
	CloseHandle (hprocout);
      }
    
    /* Handle process creation failure */
    if (err)
      {
	if (do_io)
	  {
	    CloseHandle (hmyshove);
	    CloseHandle (hmyslurp);
	  }
	signal_cannot_launch (program, GetLastError ());
      }

    /* The process started successfully */
    if (do_io)
      {
	NT_DATA(p)->h_process = pi.hProcess;
	init_process_io_handles (p, (void*)hmyslurp, (void*)hmyshove, 0);
      }
    else
      {
	/* Indicate as if the process has exited immediately. */
	p->status_symbol = Qexit;
	CloseHandle (pi.hProcess);
      }

    if (!windowed)
      enable_child_signals (pi.hProcess);

    ResumeThread (pi.hThread);
    CloseHandle (pi.hThread);

    /* Hack to support Windows 95 negative pids */
    return ((int)pi.dwProcessId < 0
	    ? -(int)pi.dwProcessId : (int)pi.dwProcessId);
  }
}

/* 
 * This method is called to update status fields of the process
 * structure. If the process has not existed, this method is expected
 * to do nothing.
 *
 * The method is called only for real child processes.  
 */

static void
nt_update_status_if_terminated (struct Lisp_Process* p)
{
  DWORD exit_code;
  if (GetExitCodeProcess (NT_DATA(p)->h_process, &exit_code)
      && exit_code != STILL_ACTIVE)
    {
      p->tick++;
      p->core_dumped = 0;
      /* The exit code can be a code returned by process, or an
	 NTSTATUS value. We cannot accurately handle the latter since
	 it is a full 32 bit integer */
      if (exit_code & 0xC0000000)
	{
	  p->status_symbol = Qsignal;
	  p->exit_code = exit_code & 0x1FFFFFFF;
	}
      else
	{
	  p->status_symbol = Qexit;
	  p->exit_code = exit_code;
	}
    }
}

/*
 * Stuff the entire contents of LSTREAM to the process output pipe
 */

/* #### If only this function could be somehow merged with
   unix_send_process... */

static void
nt_send_process (Lisp_Object proc, struct lstream* lstream)
{
  struct Lisp_Process *p = XPROCESS (proc);

  /* use a reasonable-sized buffer (somewhere around the size of the
     stream buffer) so as to avoid inundating the stream with blocked
     data. */
  Bufbyte chunkbuf[128];
  Bytecount chunklen;

  while (1)
    {
      ssize_t writeret;

      chunklen = Lstream_read (lstream, chunkbuf, 128);
      if (chunklen <= 0)
	break; /* perhaps should abort() if < 0?
		  This should never happen. */

      /* Lstream_write() will never successfully write less than the
	 amount sent in.  In the worst case, it just buffers the
	 unwritten data. */
      writeret = Lstream_write (XLSTREAM (DATA_OUTSTREAM(p)), chunkbuf,
				chunklen);
      Lstream_flush (XLSTREAM (DATA_OUTSTREAM(p)));
      if (writeret < 0)
	{
	  p->status_symbol = Qexit;
	  p->exit_code = ERROR_BROKEN_PIPE;
	  p->core_dumped = 0;
	  p->tick++;
	  process_tick++;
	  deactivate_process (proc);
	  error ("Broken pipe error sending to process %s; closed it",
		 XSTRING_DATA (p->name));
	}

      {
	int wait_ms = 25;
	while (Lstream_was_blocked_p (XLSTREAM (p->pipe_outstream)))
	  {
	    /* Buffer is full.  Wait, accepting input; that may allow
	       the program to finish doing output and read more.  */
	    Faccept_process_output (Qnil, Qzero, make_int (wait_ms));
	    Lstream_flush (XLSTREAM (p->pipe_outstream));
	    wait_ms = min (1000, 2 * wait_ms);
	  }
      }
    }
}

/*
 * Send a signal number SIGNO to PROCESS.
 * CURRENT_GROUP means send to the process group that currently owns
 * the terminal being used to communicate with PROCESS.
 * This is used for various commands in shell mode.
 * If NOMSG is zero, insert signal-announcements into process's buffers
 * right away.
 *
 * If we can, we try to signal PROCESS by sending control characters
 * down the pty.  This allows us to signal inferiors who have changed
 * their uid, for which killpg would return an EPERM error.
 *
 * The method signals an error if the given SIGNO is not valid
 */

static void
nt_kill_child_process (Lisp_Object proc, int signo,
		       int current_group, int nomsg)
{
  struct Lisp_Process *p = XPROCESS (proc);

  /* Signal error if SIGNO cannot be sent */
  validate_signal_number (signo);

  /* Send signal */
  if (!send_signal (NT_DATA(p)->h_process, signo))
    error ("Cannot send signal to process");
}

/*
 * Kill any process in the system given its PID.
 *
 * Returns zero if a signal successfully sent, or
 * negative number upon failure
 */
static int
nt_kill_process_by_pid (int pid, int signo)
{
  HANDLE h_process;
  int send_result;
  
  /* Signal error if SIGNO cannot be sent */
  validate_signal_number (signo);

  /* Try to open the process with required privileges */
  h_process = OpenProcess (PROCESS_CREATE_THREAD
			   | PROCESS_QUERY_INFORMATION 
			   | PROCESS_VM_OPERATION
			   | PROCESS_VM_WRITE,
			   FALSE, pid);
  if (h_process == NULL)
    return -1;
  
  send_result = send_signal (h_process, signo);
  
  CloseHandle (h_process);

  return send_result ? 0 : -1;
}

/*-----------------------------------------------------------------------*/
/* Sockets connections							 */
/*-----------------------------------------------------------------------*/
#ifdef HAVE_SOCKETS

/* #### Hey MS, how long Winsock 2 for '95 will be in beta? */

#define SOCK_TIMER_ID 666
#define XM_SOCKREPLY (WM_USER + 666)

static int
get_internet_address (Lisp_Object host, struct sockaddr_in *address,
		      Error_behavior errb)
{
  char buf [MAXGETHOSTSTRUCT];
  HWND hwnd;
  HANDLE hasync;
  int success = 0;

  address->sin_family = AF_INET;

  /* First check if HOST is already a numeric address */
  {
    unsigned long inaddr = inet_addr (XSTRING_DATA (host));
    if (inaddr != INADDR_NONE)
      {
	address->sin_addr.s_addr = inaddr;
	return 1;
      }
  }

  /* Create a window which will receive completion messages */
  hwnd = CreateWindow ("STATIC", NULL, WS_OVERLAPPED, 0, 0, 1, 1,
		       NULL, NULL, NULL, NULL);
  assert (hwnd);

  /* Post name resolution request */
  hasync = WSAAsyncGetHostByName (hwnd, XM_SOCKREPLY, XSTRING_DATA (host),
				  buf, sizeof (buf));
  if (hasync == NULL)
    goto done;

  /* Set a timer to poll for quit every 250 ms */
  SetTimer (hwnd, SOCK_TIMER_ID, 250, NULL);

  while (1)
    {
      MSG msg;
      GetMessage (&msg, hwnd, 0, 0);
      if (msg.message == XM_SOCKREPLY)
	{
	  /* Ok, got an answer */
	  if (WSAGETASYNCERROR(msg.lParam) == NO_ERROR)
	    success = 1;
	  goto done;
	}
      else if (msg.message == WM_TIMER && msg.wParam == SOCK_TIMER_ID)
	{
	  if (QUITP)
	    {
	      WSACancelAsyncRequest (hasync);
	      KillTimer (hwnd, SOCK_TIMER_ID);
	      DestroyWindow (hwnd);
	      REALLY_QUIT;
	    }
	}
      DispatchMessage (&msg);
    }

 done:
  KillTimer (hwnd, SOCK_TIMER_ID);
  DestroyWindow (hwnd);
  if (success)
    {
      /* BUF starts with struct hostent */
      struct hostent* he = (struct hostent*) buf;
      address->sin_addr.s_addr = *(unsigned long*)he->h_addr_list[0];
    }
  return success;
}

static Lisp_Object
nt_canonicalize_host_name (Lisp_Object host)
{
  struct sockaddr_in address;

  if (!get_internet_address (host, &address, ERROR_ME_NOT))
    return host;

  if (address.sin_family == AF_INET)
    return build_string (inet_ntoa (address.sin_addr));
  else
    return host;
}

/* open a TCP network connection to a given HOST/SERVICE.  Treated
   exactly like a normal process when reading and writing.  Only
   differences are in status display and process deletion.  A network
   connection has no PID; you cannot signal it.  All you can do is
   deactivate and close it via delete-process */

static void
nt_open_network_stream (Lisp_Object name, Lisp_Object host, Lisp_Object service,
			Lisp_Object protocol, void** vinfd, void** voutfd)
{
  struct sockaddr_in address;
  SOCKET s;
  int port;
  int retval;

  CHECK_STRING (host);

  if (!EQ (protocol, Qtcp))
    error ("Unsupported protocol \"%s\"",
	   string_data (symbol_name (XSYMBOL (protocol))));

  if (INTP (service))
    port = htons ((unsigned short) XINT (service));
  else
    {
      struct servent *svc_info;
      CHECK_STRING (service);
      svc_info = getservbyname ((char *) XSTRING_DATA (service), "tcp");
      if (svc_info == 0)
	error ("Unknown service \"%s\"", XSTRING_DATA (service));
      port = svc_info->s_port;
    }

  get_internet_address (host, &address, ERROR_ME);
  address.sin_port = port;

  s = socket (address.sin_family, SOCK_STREAM, 0);
  if (s < 0)
    report_file_error ("error creating socket", list1 (name));

  /* We don't want to be blocked on connect */
  {
    unsigned long nonblock = 1;
    ioctlsocket (s, FIONBIO, &nonblock);
  }
  
  retval = connect (s, (struct sockaddr *) &address, sizeof (address));
  if (retval != NO_ERROR && WSAGetLastError() != WSAEWOULDBLOCK)
    goto connect_failed;

  /* Wait while connection is established */
  while (1)
    {
      fd_set fdset;
      struct timeval tv;
      int nsel;

      if (QUITP)
	{
	  closesocket (s);
	  REALLY_QUIT;
	}

      /* Poll for quit every 250 ms */
      tv.tv_sec = 0;
      tv.tv_usec = 250 * 1000;

      FD_ZERO (&fdset);
      FD_SET (s, &fdset);
      nsel = select (0, NULL, &fdset, &fdset, &tv);

      if (nsel > 0)
	{
	  /* Check: was connection successful or not? */
	  tv.tv_usec = 0;
	  nsel = select (0, NULL, NULL, &fdset, &tv);
	  if (nsel > 0)
	    goto connect_failed;
	  else
	    break;
	}
    }

  /* We are connected at this point */
  *vinfd = (void*)s;
  DuplicateHandle (GetCurrentProcess(), (HANDLE)s,
		   GetCurrentProcess(), (LPHANDLE)voutfd,
		   0, FALSE, DUPLICATE_SAME_ACCESS);
  return;

 connect_failed:  
  closesocket (s);
  report_file_error ("connection failed", list2 (host, name));
}

#endif

/*-----------------------------------------------------------------------*/
/* Initialization							 */
/*-----------------------------------------------------------------------*/

void
process_type_create_nt (void)
{
  PROCESS_HAS_METHOD (nt, alloc_process_data);
  PROCESS_HAS_METHOD (nt, finalize_process_data);
  PROCESS_HAS_METHOD (nt, init_process);
  PROCESS_HAS_METHOD (nt, create_process);
  PROCESS_HAS_METHOD (nt, update_status_if_terminated);
  PROCESS_HAS_METHOD (nt, send_process);
  PROCESS_HAS_METHOD (nt, kill_child_process);
  PROCESS_HAS_METHOD (nt, kill_process_by_pid);
#ifdef HAVE_SOCKETS
  PROCESS_HAS_METHOD (nt, canonicalize_host_name);
  PROCESS_HAS_METHOD (nt, open_network_stream);
#ifdef HAVE_MULTICAST
#error I won't do this until '95 has winsock2
  PROCESS_HAS_METHOD (nt, open_multicast_group);
#endif
#endif
}

void
syms_of_process_nt (void)
{
  defsymbol (&Qnt_quote_process_args, "nt-quote-process-args");
}

void
vars_of_process_nt (void)
{
}
