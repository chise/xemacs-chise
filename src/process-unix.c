/* Asynchronous subprocess implementation for UNIX
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

/* This file has been Mule-ized except for `start-process-internal',
   `open-network-stream-internal' and `open-multicast-group-internal'. */

/* This file has been split into process.c and process-unix.c by
   Kirill M. Katsnelson <kkm@kis.ru>, so please bash him and not
   the original author(s) */

#include <config.h>

#if !defined (NO_SUBPROCESSES)

/* The entire file is within this conditional */

#include "lisp.h"

#include "buffer.h"
#include "events.h"
#include "frame.h"
#include "hash.h"
#include "lstream.h"
#include "opaque.h"
#include "process.h"
#include "procimpl.h"
#include "sysdep.h"
#include "window.h"
#ifdef FILE_CODING
#include "file-coding.h"
#endif

#include <setjmp.h>
#include "sysfile.h"
#include "sysproc.h"
#include "systime.h"
#include "syssignal.h" /* Always include before systty.h */
#include "systty.h"
#include "syswait.h"


/*
 * Implementation-specific data. Pointed to by Lisp_Process->process_data
 */

struct unix_process_data
{
  /* Non-0 if this is really a ToolTalk channel. */
  int connected_via_filedesc_p;
  /* Descriptor by which we read from this process.  -1 for dead process */
  int infd;
  /* Descriptor for the tty which this process is using.
     -1 if we didn't record it (on some systems, there's no need).  */
  int subtty;
  /* Name of subprocess terminal. */
  Lisp_Object tty_name;
  /* Non-false if communicating through a pty.  */
  char pty_flag;
};

#define UNIX_DATA(p) ((struct unix_process_data*)((p)->process_data))

#ifdef HAVE_PTYS
/* The file name of the pty opened by allocate_pty.  */

static char pty_name[24];
#endif



/**********************************************************************/
/*                    Static helper routines                          */
/**********************************************************************/

static SIGTYPE
close_safely_handler (int signo)
{
  EMACS_REESTABLISH_SIGNAL (signo, close_safely_handler);
  SIGRETURN;
}

static void
close_safely (int fd)
{
  stop_interrupts ();
  signal (SIGALRM, close_safely_handler);
  alarm (1);
  close (fd);
  alarm (0);
  start_interrupts ();
}

static void
close_descriptor_pair (int in, int out)
{
  if (in >= 0)
    close (in);
  if (out != in && out >= 0)
    close (out);
}

/* Close all descriptors currently in use for communication
   with subprocess.  This is used in a newly-forked subprocess
   to get rid of irrelevant descriptors.  */

static int
close_process_descs_mapfun (CONST void* key, void* contents, void* arg)
{
  Lisp_Object proc;
  CVOID_TO_LISP (proc, contents);
  event_stream_delete_stream_pair (XPROCESS(proc)->pipe_instream,
				   XPROCESS(proc)->pipe_outstream);
  return 0;
}

/* #### This function is currently called from child_setup
   in callproc.c. It should become static though - kkm */
void
close_process_descs (void)
{
  maphash (close_process_descs_mapfun, usid_to_process, 0);
}

/* connect to an existing file descriptor.  This is very similar to
   open-network-stream except that it assumes that the connection has
   already been initialized.  It is currently used for ToolTalk
   communication. */

/* This function used to be visible on the Lisp level, but there is no
   real point in doing that.  Here is the doc string:

  "Connect to an existing file descriptor.\n\
Returns a subprocess-object to represent the connection.\n\
Input and output work as for subprocesses; `delete-process' closes it.\n\
Args are NAME BUFFER INFD OUTFD.\n\
NAME is name for process.  It is modified if necessary to make it unique.\n\
BUFFER is the buffer (or buffer-name) to associate with the process.\n\
 Process output goes at end of that buffer, unless you specify\n\
 an output stream or filter function to handle the output.\n\
 BUFFER may be also nil, meaning that this process is not associated\n\
 with any buffer\n\
INFD and OUTFD specify the file descriptors to use for input and\n\
 output, respectively."
*/

Lisp_Object
connect_to_file_descriptor (Lisp_Object name, Lisp_Object buffer,
			    Lisp_Object infd, Lisp_Object outfd)
{
  /* This function can GC */
  Lisp_Object proc;
  int inch;

  CHECK_STRING (name);
  CHECK_INT (infd);
  CHECK_INT (outfd);

  inch = XINT (infd);
  if (get_process_from_usid (FD_TO_USID(inch)))
    error ("There is already a process connected to fd %d", inch);
  if (!NILP (buffer))
    buffer = Fget_buffer_create (buffer);
  proc = make_process_internal (name);

  XPROCESS (proc)->pid = Fcons (infd, name);
  XPROCESS (proc)->buffer = buffer;
  init_process_io_handles (XPROCESS (proc), (void*)inch, (void*)XINT (outfd), 0);
  UNIX_DATA (XPROCESS (proc))->connected_via_filedesc_p = 1;

  event_stream_select_process (XPROCESS (proc));

  return proc;
}

#ifdef HAVE_PTYS

/* Open an available pty, returning a file descriptor.
   Return -1 on failure.
   The file name of the terminal corresponding to the pty
   is left in the variable pty_name.  */

static int
allocate_pty (void)
{
#ifndef PTY_OPEN
  struct stat stb;

  /* Some systems name their pseudoterminals so that there are gaps in
     the usual sequence - for example, on HP9000/S700 systems, there
     are no pseudoterminals with names ending in 'f'.  So we wait for
     three failures in a row before deciding that we've reached the
     end of the ptys.  */
  int failed_count = 0;
#endif
  int i;
  int fd;
  int c;

#ifdef PTY_ITERATION
  PTY_ITERATION
#else
  for (c = FIRST_PTY_LETTER; c <= 'z'; c++)
    for (i = 0; i < 16; i++)
#endif
      {
#ifdef PTY_NAME_SPRINTF
	PTY_NAME_SPRINTF
#else
	sprintf (pty_name, "/dev/pty%c%x", c, i);
#endif /* no PTY_NAME_SPRINTF */

#ifdef PTY_OPEN
	PTY_OPEN;
#else /* no PTY_OPEN */
#ifdef IRIS
	/* Unusual IRIS code */
 	*ptyv = open ("/dev/ptc", O_RDWR | O_NONBLOCK | OPEN_BINARY, 0);
 	if (fd < 0)
 	  return -1;
	if (fstat (fd, &stb) < 0)
	  return -1;
#else /* not IRIS */
	if (stat (pty_name, &stb) < 0)
	  {
	    failed_count++;
	    if (failed_count >= 3)
	      return -1;
	  }
	else
	  failed_count = 0;
	fd = open (pty_name, O_RDWR | O_NONBLOCK | OPEN_BINARY, 0);
#endif /* not IRIS */
#endif /* no PTY_OPEN */

	if (fd >= 0)
	  {
	    /* check to make certain that both sides are available
	       this avoids a nasty yet stupid bug in rlogins */
#ifdef PTY_TTY_NAME_SPRINTF
	    PTY_TTY_NAME_SPRINTF
#else
            sprintf (pty_name, "/dev/tty%c%x", c, i);
#endif /* no PTY_TTY_NAME_SPRINTF */
#ifndef UNIPLUS
	    if (access (pty_name, 6) != 0)
	      {
		close (fd);
#if !defined(IRIS) && !defined(__sgi)
		continue;
#else
		return -1;
#endif /* IRIS */
	      }
#endif /* not UNIPLUS */
	    setup_pty (fd);
	    return fd;
	  }
      }
  return -1;
}
#endif /* HAVE_PTYS */

static int
create_bidirectional_pipe (int *inchannel, int *outchannel,
			   volatile int *forkin, volatile int *forkout)
{
  int sv[2];

#ifdef SKTPAIR
  if (socketpair (AF_UNIX, SOCK_STREAM, 0, sv) < 0)
    return -1;
  *outchannel = *inchannel = sv[0];
  *forkout = *forkin = sv[1];
#else /* not SKTPAIR */
  int temp;
  temp = pipe (sv);
  if (temp < 0) return -1;
  *inchannel = sv[0];
  *forkout = sv[1];
  temp = pipe (sv);
  if (temp < 0) return -1;
  *outchannel = sv[1];
  *forkin = sv[0];
#endif /* not SKTPAIR */
  return 0;
}


#ifdef HAVE_SOCKETS

static int
get_internet_address (Lisp_Object host, struct sockaddr_in *address,
		      Error_behavior errb)
{
  struct hostent *host_info_ptr = NULL;
#ifdef TRY_AGAIN
  int count = 0;
#endif

  xzero (*address);

  while (1)
    {
#ifdef TRY_AGAIN
      if (count++ > 10) break;
#ifndef BROKEN_CYGWIN
      h_errno = 0;
#endif
#endif
      /* Some systems can't handle SIGIO/SIGALARM in gethostbyname. */
      slow_down_interrupts ();
      host_info_ptr = gethostbyname ((char *) XSTRING_DATA (host));
      speed_up_interrupts ();
#ifdef TRY_AGAIN
      if (! (host_info_ptr == 0 && h_errno == TRY_AGAIN))
#endif
	break;
      Fsleep_for (make_int (1));
    }
  if (host_info_ptr)
    {
      address->sin_family = host_info_ptr->h_addrtype;
      memcpy (&address->sin_addr, host_info_ptr->h_addr, host_info_ptr->h_length);
    }
  else
    {
      IN_ADDR numeric_addr;
      /* Attempt to interpret host as numeric inet address */
      numeric_addr = inet_addr ((char *) XSTRING_DATA (host));
      if (NUMERIC_ADDR_ERROR)
	{
	  maybe_error (Qprocess, errb,
		       "Unknown host \"%s\"", XSTRING_DATA (host));
	  return 0;
	}

      /* There was some broken code here that called strlen() here
	 on (char *) &numeric_addr and even sometimes accessed
	 uninitialized data. */
      address->sin_family = AF_INET;
      * (IN_ADDR *) &address->sin_addr = numeric_addr;
    }

  return 1;
}

static void
set_socket_nonblocking_maybe (int fd, int port, CONST char* proto)
{
#ifdef PROCESS_IO_BLOCKING
  Lisp_Object tail;

  for (tail = network_stream_blocking_port_list; CONSP (tail); tail = XCDR (tail))
    {
      Lisp_Object tail_port = XCAR (tail);

      if (STRINGP (tail_port))
	{
	  struct servent *svc_info;
	  CHECK_STRING (tail_port);
	  svc_info = getservbyname ((char *) XSTRING_DATA (tail_port), proto);
	  if ((svc_info != 0) && (svc_info->s_port == port))
	    break;
	  else
	    continue;
	}
      else if ((INTP (tail_port)) && (htons ((unsigned short) XINT (tail_port)) == port))
	break;
    }

  if (!CONSP (tail))
    {
      set_descriptor_non_blocking (fd);
    }
#else
  set_descriptor_non_blocking (fd);
#endif	/* PROCESS_IO_BLOCKING */
}

#endif /* HAVE_SOCKETS */

/* Compute the Lisp form of the process status from
   the numeric status that was returned by `wait'.  */

static void
update_status_from_wait_code (struct Lisp_Process *p, int *w_fmh)
{
  /* C compiler lossage when attempting to pass w directly */
  int w = *w_fmh;

  if (WIFSTOPPED (w))
    {
      p->status_symbol = Qstop;
      p->exit_code = WSTOPSIG (w);
      p->core_dumped = 0;
    }
  else if (WIFEXITED (w))
    {
      p->status_symbol = Qexit;
      p->exit_code = WEXITSTATUS (w);
      p->core_dumped = 0;
    }
  else if (WIFSIGNALED (w))
    {
      p->status_symbol = Qsignal;
      p->exit_code = WTERMSIG (w);
      p->core_dumped = WCOREDUMP (w);
    }
  else
    {
      p->status_symbol = Qrun;
      p->exit_code = 0;
    }
}

#ifdef SIGCHLD

#define MAX_EXITED_PROCESSES 1000
static volatile pid_t exited_processes[MAX_EXITED_PROCESSES];
static volatile int exited_processes_status[MAX_EXITED_PROCESSES];
static volatile int exited_processes_index;

static volatile int sigchld_happened;

/* On receipt of a signal that a child status has changed,
 loop asking about children with changed statuses until
 the system says there are no more.  All we do is record
 the processes and wait status.

 This function could be called from within the SIGCHLD
 handler, so it must be completely reentrant.  When
 not called from a SIGCHLD handler, BLOCK_SIGCHLD should
 be non-zero so that SIGCHLD is blocked while this
 function is running. (This is necessary so avoid
 race conditions with the SIGCHLD_HAPPENED flag). */

static void
record_exited_processes (int block_sigchld)
{
  if (!sigchld_happened)
    {
      return;
    }

#ifdef EMACS_BLOCK_SIGNAL
  if (block_sigchld)
    EMACS_BLOCK_SIGNAL (SIGCHLD);
#endif

  while (sigchld_happened)
    {
      int pid;
      int w;

      /* Keep trying to get a status until we get a definitive result.  */
      do
	{
	  errno = 0;
#ifdef WNOHANG
#  ifndef WUNTRACED
#    define WUNTRACED 0
#  endif /* not WUNTRACED */
#  ifdef HAVE_WAITPID
	  pid = waitpid ((pid_t) -1, &w, WNOHANG | WUNTRACED);
#  else
	  pid = wait3 (&w, WNOHANG | WUNTRACED, 0);
#  endif
#else /* not WNOHANG */
	  pid = wait (&w);
#endif /* not WNOHANG */
	}
      while (pid <= 0 && errno == EINTR);

      if (pid <= 0)
	break;

      if (exited_processes_index < MAX_EXITED_PROCESSES)
	{
	  exited_processes[exited_processes_index] = pid;
	  exited_processes_status[exited_processes_index] = w;
	  exited_processes_index++;
	}

      /* On systems with WNOHANG, we just ignore the number
	 of times that SIGCHLD was signalled, and keep looping
	 until there are no more processes to wait on.  If we
	 don't have WNOHANG, we have to rely on the count in
	 SIGCHLD_HAPPENED. */
#ifndef WNOHANG
      sigchld_happened--;
#endif /* not WNOHANG */
    }

  sigchld_happened = 0;

  if (block_sigchld)
    EMACS_UNBLOCK_SIGNAL (SIGCHLD);
}

/* For any processes that have changed status and are recorded
   and such, update the corresponding struct Lisp_Process.
   We separate this from record_exited_processes() so that
   we never have to call this function from within a signal
   handler.  We block SIGCHLD in case record_exited_processes()
   is called from a signal handler. */

/** USG WARNING:  Although it is not obvious from the documentation
 in signal(2), on a USG system the SIGCLD handler MUST NOT call
 signal() before executing at least one wait(), otherwise the handler
 will be called again, resulting in an infinite loop.  The relevant
 portion of the documentation reads "SIGCLD signals will be queued
 and the signal-catching function will be continually reentered until
 the queue is empty".  Invoking signal() causes the kernel to reexamine
 the SIGCLD queue.   Fred Fish, UniSoft Systems Inc.

 (Note that now this only applies in SYS V Release 2 and before.
 On SYS V Release 3, we use sigset() to set the signal handler for
 the first time, and so we don't have to reestablish the signal handler
 in the handler below.  On SYS V Release 4, we don't get this weirdo
 behavior when we use sigaction(), which we do use.) */

static SIGTYPE
sigchld_handler (int signo)
{
#ifdef OBNOXIOUS_SYSV_SIGCLD_BEHAVIOR
  int old_errno = errno;

  sigchld_happened++;
  record_exited_processes (0);
  errno = old_errno;
#else
  sigchld_happened++;
#endif
#ifdef HAVE_UNIXOID_EVENT_LOOP
  signal_fake_event ();
#endif
  /* WARNING - must come after wait3() for USG systems */
  EMACS_REESTABLISH_SIGNAL (signo, sigchld_handler);
  SIGRETURN;
}

#endif /* SIGCHLD */

#ifdef SIGNALS_VIA_CHARACTERS
/* Get signal character to send to process if SIGNALS_VIA_CHARACTERS */

static int
process_signal_char (int tty_fd, int signo)
{
  /* If it's not a tty, pray that these default values work */
  if (!isatty(tty_fd)) {
#define CNTL(ch) (037 & (ch))
    switch (signo)
      {
      case SIGINT:  return CNTL('C');
      case SIGQUIT: return CNTL('\\');
#ifdef SIGTSTP
      case SIGTSTP: return CNTL('Z');
#endif
      }
  }

#ifdef HAVE_TERMIOS
  /* TERMIOS is the latest and bestest, and seems most likely to work.
     If the system has it, use it. */
  {
    struct termios t;
    tcgetattr (tty_fd, &t);
    switch (signo)
      {
      case SIGINT:  return t.c_cc[VINTR];
      case SIGQUIT: return t.c_cc[VQUIT];
#if defined(SIGTSTP) && defined(VSUSP)
      case SIGTSTP: return t.c_cc[VSUSP];
#endif
      }
  }

# elif defined (TIOCGLTC) && defined (TIOCGETC) /* not HAVE_TERMIOS */
  {
    /* On Berkeley descendants, the following IOCTL's retrieve the
       current control characters.  */
    struct tchars c;
    struct ltchars lc;
    switch (signo)
      {
      case SIGINT:  ioctl (tty_fd, TIOCGETC, &c);  return c.t_intrc;
      case SIGQUIT: ioctl (tty_fd, TIOCGETC, &c);  return c.t_quitc;
#  ifdef SIGTSTP
      case SIGTSTP: ioctl (tty_fd, TIOCGLTC, &lc); return lc.t_suspc;
#  endif /* SIGTSTP */
      }
  }

# elif defined (TCGETA) /* ! defined (TIOCGLTC) && defined (TIOCGETC) */
  {
    /* On SYSV descendants, the TCGETA ioctl retrieves the current
       control characters.  */
    struct termio t;
    ioctl (tty_fd, TCGETA, &t);
    switch (signo) {
    case SIGINT:  return t.c_cc[VINTR];
    case SIGQUIT: return t.c_cc[VQUIT];
#  ifdef SIGTSTP
    case SIGTSTP: return t.c_cc[VSWTCH];
#  endif /* SIGTSTP */
    }
  }
# else /* ! defined (TCGETA) */
#error ERROR! Using SIGNALS_VIA_CHARACTERS, but not HAVE_TERMIOS || (TIOCGLTC && TIOCGETC) || TCGETA
  /* If your system configuration files define SIGNALS_VIA_CHARACTERS,
     you'd better be using one of the alternatives above!  */
# endif /* ! defined (TCGETA) */
  return '\0';
}
#endif /* SIGNALS_VIA_CHARACTERS */




/**********************************************************************/
/*              Process implementation methods                        */
/**********************************************************************/

/*
 * Allocate and initialize Lisp_Process->process_data
 */

static void
unix_alloc_process_data (struct Lisp_Process *p)
{
  p->process_data = xnew (struct unix_process_data);

  UNIX_DATA(p)->connected_via_filedesc_p = 0;
  UNIX_DATA(p)->infd   = -1;
  UNIX_DATA(p)->subtty = -1;
  UNIX_DATA(p)->tty_name = Qnil;
  UNIX_DATA(p)->pty_flag = 0;
}

/*
 * Mark any Lisp objects in Lisp_Process->process_data
 */

static void
unix_mark_process_data (struct Lisp_Process *proc,
			void (*markobj) (Lisp_Object))
{
  markobj (UNIX_DATA(proc)->tty_name);
}

/*
 * Initialize XEmacs process implementation once
 */

#ifdef SIGCHLD
static void
unix_init_process (void)
{
#ifndef CANNOT_DUMP
  if (! noninteractive || initialized)
#endif
    signal (SIGCHLD, sigchld_handler);
}
#endif /* SIGCHLD */

/*
 * Initialize any process local data. This is called when newly
 * created process is connected to real OS file handles. The
 * handles are generally represented by void* type, but are
 * of type int (file descriptors) for UNIX
 */

static void
unix_init_process_io_handles (struct Lisp_Process *p, void* in, void* out, int flags)
{
  UNIX_DATA(p)->infd = (int)in;
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

static int
unix_create_process (struct Lisp_Process *p,
		     Lisp_Object *argv, int nargv,
		     Lisp_Object program, Lisp_Object cur_dir)
{
  /* This function rewritten by ben@xemacs.org. */

  int pid, inchannel, outchannel;
  /* Use volatile to protect variables from being clobbered by longjmp.  */
  volatile int forkin, forkout;
  volatile int pty_flag = 0;
  char **env;
  char **new_argv;
  char *current_dir;
  int i;

  env = environ;

  inchannel = outchannel = forkin = forkout = -1;

  /* Nothing below here GCs so our string pointers shouldn't move. */
  new_argv = alloca_array (char *, nargv + 2);
  GET_C_STRING_FILENAME_DATA_ALLOCA (program, new_argv[0]);
  for (i = 0; i < nargv; i++)
    {
      Lisp_Object tem = argv[i];
      CHECK_STRING (tem);
      new_argv[i + 1] = (char *) XSTRING_DATA (tem);
    }
  new_argv[i + 1] = 0;
  GET_C_STRING_FILENAME_DATA_ALLOCA (cur_dir, current_dir);

#ifdef HAVE_PTYS
  if (!NILP (Vprocess_connection_type))
    {
      /* find a new pty, open the master side, return the opened
	 file handle, and store the name of the corresponding slave
	 side in global variable pty_name. */
      outchannel = inchannel = allocate_pty ();
    }

  if (inchannel >= 0)
    {
      /* You're "supposed" to now open the slave in the child.
	 On some systems, we can open it here; this allows for
	 better error checking. */
#if !defined(USG)
      /* On USG systems it does not work to open the pty's tty here
	       and then close and reopen it in the child.  */
#ifdef O_NOCTTY
      /* Don't let this terminal become our controlling terminal
	 (in case we don't have one).  */
      forkout = forkin = open (pty_name, O_RDWR | O_NOCTTY | OPEN_BINARY, 0);
#else
      forkout = forkin = open (pty_name, O_RDWR | OPEN_BINARY, 0);
#endif
      if (forkin < 0)
	goto io_failure;
#endif /* not USG */
      UNIX_DATA(p)->pty_flag = pty_flag = 1;
    }
  else
#endif /* HAVE_PTYS */
    if (create_bidirectional_pipe (&inchannel, &outchannel,
				   &forkin, &forkout) < 0)
      goto io_failure;

#if 0
  /* Replaced by close_process_descs */
  set_exclusive_use (inchannel);
  set_exclusive_use (outchannel);
#endif

  set_descriptor_non_blocking (inchannel);

  /* Record this as an active process, with its channels.
     As a result, child_setup will close Emacs's side of the pipes.  */
  init_process_io_handles (p, (void*)inchannel, (void*)outchannel,
			   pty_flag ? STREAM_PTY_FLUSHING : 0);
  /* Record the tty descriptor used in the subprocess.  */
  UNIX_DATA(p)->subtty = forkin;

  {
#if !defined(__CYGWIN32__)
    /* child_setup must clobber environ on systems with true vfork.
       Protect it from permanent change.  */
    char **save_environ = environ;
#endif

    pid = fork ();
    if (pid == 0)
      {
	/**** Now we're in the child process ****/
	int xforkin = forkin;
	int xforkout = forkout;

	if (!pty_flag)
	  EMACS_SEPARATE_PROCESS_GROUP ();
#ifdef HAVE_PTYS
	else
	  {
	    /* Disconnect the current controlling terminal, pursuant to
	       making the pty be the controlling terminal of the process.
	       Also put us in our own process group. */

	    disconnect_controlling_terminal ();

	    /* Open the pty connection and make the pty's terminal
	       our controlling terminal.

	       On systems with TIOCSCTTY, we just use it to set
	       the controlling terminal.  On other systems, the
	       first TTY we open becomes the controlling terminal.
	       So, we end up with four possibilities:

	       (1) on USG and TIOCSCTTY systems, we open the pty
	           and use TIOCSCTTY.
	       (2) on other USG systems, we just open the pty.
	       (3) on non-USG systems with TIOCSCTTY, we
	           just use TIOCSCTTY. (On non-USG systems, we
		   already opened the pty in the parent process.)
	       (4) on non-USG systems without TIOCSCTTY, we
	           close the pty and reopen it.

	       This would be cleaner if we didn't open the pty
	       in the parent process, but doing it that way
	       makes it possible to trap error conditions.
	       It's harder to convey an error from the child
	       process, and I don't feel like messing with
	       this now. */

	    /* There was some weirdo, probably wrong,
	       conditionalization on RTU and UNIPLUS here.
	       I deleted it.  So sue me. */

	    /* SunOS has TIOCSCTTY but the close/open method
	       also works. */

#  if defined (USG) || !defined (TIOCSCTTY)
	    /* Now close the pty (if we had it open) and reopen it.
	       This makes the pty the controlling terminal of the
	       subprocess.  */
	    /* I wonder if close (open (pty_name, ...)) would work?  */
	    if (xforkin >= 0)
	      close (xforkin);
	    xforkout = xforkin = open (pty_name, O_RDWR | OPEN_BINARY, 0);
	    if (xforkin < 0)
	      {
		write (1, "Couldn't open the pty terminal ", 31);
		write (1, pty_name, strlen (pty_name));
		write (1, "\n", 1);
		_exit (1);
	      }
#  endif /* USG or not TIOCSCTTY */

	    /* Miscellaneous setup required for some systems.
               Must be done before using tc* functions on xforkin.
               This guarantees that isatty(xforkin) is true. */

# ifdef SETUP_SLAVE_PTY
	    SETUP_SLAVE_PTY;
# endif /* SETUP_SLAVE_PTY */

#  ifdef TIOCSCTTY
	    /* We ignore the return value
	       because faith@cs.unc.edu says that is necessary on Linux.  */
            assert (isatty (xforkin));
	    ioctl (xforkin, TIOCSCTTY, 0);
#  endif /* TIOCSCTTY */

	    /* Change the line discipline. */

# if defined (HAVE_TERMIOS) && defined (LDISC1)
	    {
	      struct termios t;
              assert (isatty (xforkin));
	      tcgetattr (xforkin, &t);
	      t.c_lflag = LDISC1;
	      if (tcsetattr (xforkin, TCSANOW, &t) < 0)
		perror ("create_process/tcsetattr LDISC1 failed\n");
	    }
# elif defined (NTTYDISC) && defined (TIOCSETD)
	    {
	      /* Use new line discipline.  TIOCSETD is accepted and
                 ignored on Sys5.4 systems with ttcompat. */
	      int ldisc = NTTYDISC;
              assert (isatty (xforkin));
	      ioctl (xforkin, TIOCSETD, &ldisc);
	    }
# endif /* TIOCSETD & NTTYDISC */

	    /* Make our process group be the foreground group
	       of our new controlling terminal. */

	    {
	      int piddly = EMACS_GET_PROCESS_GROUP ();
	      EMACS_SET_TTY_PROCESS_GROUP (xforkin, &piddly);
	    }

	    /* On AIX, we've disabled SIGHUP above once we start a
	       child on a pty.  Now reenable it in the child, so it
	       will die when we want it to.
	       JV: This needs to be done ALWAYS as we might have inherited
	       a SIG_IGN handling from our parent (nohup) and we are in new
	       process group.
	    */
	    signal (SIGHUP, SIG_DFL);
	  }
#endif /* HAVE_PTYS */

	signal (SIGINT, SIG_DFL);
	signal (SIGQUIT, SIG_DFL);

	if (pty_flag)
	  {
	    /* Set up the terminal characteristics of the pty. */
	    child_setup_tty (xforkout);
	  }

	child_setup (xforkin, xforkout, xforkout, new_argv, current_dir);
      }

#if !defined(__CYGWIN32__)
    environ = save_environ;
#endif
  }

  if (pid < 0)
    {
      close_descriptor_pair (forkin, forkout);
      report_file_error ("Doing fork", Qnil);
    }

  /* #### dmoore - why is this commented out, otherwise we leave
     subtty = forkin, but then we close forkin just below. */
  /* UNIX_DATA(p)->subtty = -1; */

  /* If the subfork execv fails, and it exits,
     this close hangs.  I don't know why.
     So have an interrupt jar it loose.  */
  if (forkin >= 0)
    close_safely (forkin);
  if (forkin != forkout && forkout >= 0)
    close (forkout);

#ifdef HAVE_PTYS
  if (pty_flag)
    UNIX_DATA (p)->tty_name = build_string (pty_name);
  else
#endif
    UNIX_DATA (p)->tty_name = Qnil;

  /* Notice that SIGCHLD was not blocked. (This is not possible on
     some systems.) No biggie if SIGCHLD occurs right around the
     time that this call happens, because SIGCHLD() does not actually
     deselect the process (that doesn't occur until the next time
     we're waiting for an event, when status_notify() is called). */
  return pid;

io_failure:
  {
    int temp = errno;
    close_descriptor_pair (forkin, forkout);
    close_descriptor_pair (inchannel, outchannel);
    errno = temp;
    report_file_error ("Opening pty or pipe", Qnil);
  }

  RETURN_NOT_REACHED (0);
}

/* Return nonzero if this process is a ToolTalk connection. */

static int
unix_tooltalk_connection_p (struct Lisp_Process *p)
{
  return UNIX_DATA(p)->connected_via_filedesc_p;
}

/* This is called to set process' virtual terminal size */

static int
unix_set_window_size (struct Lisp_Process* p, int cols, int rows)
{
  return set_window_size (UNIX_DATA(p)->infd, cols, rows);
}

/*
 * This method is called to update status fields of the process
 * structure. If the process has not existed, this method is
 * expected to do nothing.
 *
 * The method is called only for real child processes.
 */

#ifdef HAVE_WAITPID
static void
unix_update_status_if_terminated (struct Lisp_Process* p)
{
  int w;
#ifdef SIGCHLD
  EMACS_BLOCK_SIGNAL (SIGCHLD);
#endif
  if (waitpid (XINT (p->pid), &w, WNOHANG) == XINT (p->pid))
    {
      p->tick++;
      update_status_from_wait_code (p, &w);
    }
#ifdef SIGCHLD
  EMACS_UNBLOCK_SIGNAL (SIGCHLD);
#endif
}
#endif

/*
 * Update status of all exited processes. Called when SIGCLD has signaled.
 */

#ifdef SIGCHLD
static void
unix_reap_exited_processes (void)
{
  int i;
  struct Lisp_Process *p;

#ifndef OBNOXIOUS_SYSV_SIGCLD_BEHAVIOR
  record_exited_processes (1);
#endif

  if (exited_processes_index <= 0)
    {
      return;
    }

#ifdef  EMACS_BLOCK_SIGNAL
  EMACS_BLOCK_SIGNAL (SIGCHLD);
#endif
  for (i = 0; i < exited_processes_index; i++)
    {
      int pid = exited_processes[i];
      int w = exited_processes_status[i];

      /* Find the process that signaled us, and record its status.  */

      p = 0;
      {
        Lisp_Object tail;
	LIST_LOOP (tail, Vprocess_list)
	  {
	    Lisp_Object proc = XCAR (tail);
	    p = XPROCESS (proc);
	    if (INTP (p->pid) && XINT (p->pid) == pid)
	      break;
	    p = 0;
	  }
      }

      if (p)
	{
	  /* Change the status of the process that was found.  */
	  p->tick++;
	  process_tick++;
	  update_status_from_wait_code (p, &w);

          /* If process has terminated, stop waiting for its output.  */
	  if (WIFSIGNALED (w) || WIFEXITED (w))
	    {
	      if (!NILP(p->pipe_instream))
		{
		  /* We can't just call event_stream->unselect_process_cb (p)
		     here, because that calls XtRemoveInput, which is not
		     necessarily reentrant, so we can't call this at interrupt
		     level.
		   */
		}
	    }
	}
      else
	{
          /* There was no asynchronous process found for that id.  Check
	     if we have a synchronous process. Only set sync process status
	     if there is one, so we work OK with the waitpid() call in
	     wait_for_termination(). */
	  if (synch_process_alive != 0)
	    { /* Set the global sync process status variables. */
	      synch_process_alive = 0;

	      /* Report the status of the synchronous process.  */
	      if (WIFEXITED (w))
		synch_process_retcode = WEXITSTATUS (w);
	      else if (WIFSIGNALED (w))
		synch_process_death = signal_name (WTERMSIG (w));
	    }
        }
    }

  exited_processes_index = 0;

  EMACS_UNBLOCK_SIGNAL (SIGCHLD);
}
#endif /* SIGCHLD */

/*
 * Stuff the entire contents of LSTREAM to the process output pipe
 */

static JMP_BUF send_process_frame;

static SIGTYPE
send_process_trap (int signum)
{
  EMACS_REESTABLISH_SIGNAL (signum, send_process_trap);
  EMACS_UNBLOCK_SIGNAL (signum);
  LONGJMP (send_process_frame, 1);
}

static void
unix_send_process (Lisp_Object proc, struct lstream* lstream)
{
  /* Use volatile to protect variables from being clobbered by longjmp.  */
  SIGTYPE (*volatile old_sigpipe) (int) = 0;
  volatile Lisp_Object vol_proc = proc;
  struct Lisp_Process *volatile p = XPROCESS (proc);

  if (!SETJMP (send_process_frame))
    {
      /* use a reasonable-sized buffer (somewhere around the size of the
	 stream buffer) so as to avoid inundating the stream with blocked
	 data. */
      Bufbyte chunkbuf[512];
      Bytecount chunklen;

      while (1)
	{
	  int writeret;

	  chunklen = Lstream_read (lstream, chunkbuf, 512);
	  if (chunklen <= 0)
	    break; /* perhaps should abort() if < 0?
		      This should never happen. */
	  old_sigpipe =
	    (SIGTYPE (*) (int)) signal (SIGPIPE, send_process_trap);
	  /* Lstream_write() will never successfully write less than
	     the amount sent in.  In the worst case, it just buffers
	     the unwritten data. */
	  writeret = Lstream_write (XLSTREAM (DATA_OUTSTREAM(p)), chunkbuf,
				    chunklen);
	  signal (SIGPIPE, old_sigpipe);
	  if (writeret < 0)
	    /* This is a real error.  Blocking errors are handled
	       specially inside of the filedesc stream. */
	    report_file_error ("writing to process", list1 (proc));
	  while (Lstream_was_blocked_p (XLSTREAM (p->pipe_outstream)))
	    {
	      /* Buffer is full.  Wait, accepting input;
		 that may allow the program
		 to finish doing output and read more.  */
	      Faccept_process_output (Qnil, make_int (1), Qnil);
	      old_sigpipe =
		(SIGTYPE (*) (int)) signal (SIGPIPE, send_process_trap);
	      Lstream_flush (XLSTREAM (p->pipe_outstream));
	      signal (SIGPIPE, old_sigpipe);
	    }
	}
    }
  else
    { /* We got here from a longjmp() from the SIGPIPE handler */
      signal (SIGPIPE, old_sigpipe);
      /* Close the file lstream so we don't attempt to write to it further */
      /* #### There is controversy over whether this might cause fd leakage */
      /*      my tests say no. -slb */
      XLSTREAM (p->pipe_outstream)->flags &= ~LSTREAM_FL_IS_OPEN;
      p->status_symbol = Qexit;
      p->exit_code = 256; /* #### SIGPIPE ??? */
      p->core_dumped = 0;
      p->tick++;
      process_tick++;
      deactivate_process (*((Lisp_Object *) (&vol_proc)));
      error ("SIGPIPE raised on process %s; closed it",
	     XSTRING_DATA (p->name));
    }

  old_sigpipe = (SIGTYPE (*) (int)) signal (SIGPIPE, send_process_trap);
  Lstream_flush (XLSTREAM (DATA_OUTSTREAM(p)));
  signal (SIGPIPE, old_sigpipe);
}

/*
 * Send EOF to the process. The default implementation simply
 * closes the output stream. The method must return 0 to call
 * the default implementation, or 1 if it has taken all care about
 * sending EOF to the process.
 */

static int
unix_process_send_eof (Lisp_Object proc)
{
  if (!UNIX_DATA (XPROCESS (proc))->pty_flag)
    return 0;

  /* #### get_eof_char simply doesn't return the correct character
     here.  Maybe it is needed to determine the right eof
     character in init_process_io_handles but here it simply screws
     things up. */
#if 0
  Bufbyte eof_char = get_eof_char (XPROCESS (proc));
  send_process (proc, Qnil, &eof_char, 0, 1);
#else
  send_process (proc, Qnil, (CONST Bufbyte *) "\004", 0, 1);
#endif
  return 1;
}

/*
 * Called before the process is deactivated. The process object
 * is not immediately finalized, just undergoes a transition to
 * inactive state.
 *
 * The return value is a unique stream ID, as returned by
 * event_stream_delete_stream_pair
 *
 * In the lack of this method, only event_stream_delete_stream_pair
 * is called on both I/O streams of the process.
 *
 * The UNIX version guards this by ignoring possible SIGPIPE.
 */

static USID
unix_deactivate_process (struct Lisp_Process *p)
{
  SIGTYPE (*old_sigpipe) (int) = 0;
  USID usid;

  if (UNIX_DATA(p)->infd >= 0)
    flush_pending_output (UNIX_DATA(p)->infd);

  /* closing the outstream could result in SIGPIPE, so ignore it. */
  old_sigpipe = (SIGTYPE (*) (int)) signal (SIGPIPE, SIG_IGN);
  usid = event_stream_delete_stream_pair (p->pipe_instream, p->pipe_outstream);
  signal (SIGPIPE, old_sigpipe);

  UNIX_DATA(p)->infd  = -1;

  return usid;
}

/* send a signal number SIGNO to PROCESS.
   CURRENT_GROUP means send to the process group that currently owns
   the terminal being used to communicate with PROCESS.
   This is used for various commands in shell mode.
   If NOMSG is zero, insert signal-announcements into process's buffers
   right away.

   If we can, we try to signal PROCESS by sending control characters
   down the pty.  This allows us to signal inferiors who have changed
   their uid, for which killpg would return an EPERM error.

   The method signals an error if the given SIGNO is not valid
*/

static void
unix_kill_child_process (Lisp_Object proc, int signo,
			 int current_group, int nomsg)
{
  int gid;
  int no_pgrp = 0;
  int kill_retval;
  struct Lisp_Process *p = XPROCESS (proc);

  if (!UNIX_DATA(p)->pty_flag)
    current_group = 0;

  /* If we are using pgrps, get a pgrp number and make it negative.  */
  if (current_group)
    {
#ifdef SIGNALS_VIA_CHARACTERS
      /* If possible, send signals to the entire pgrp
	 by sending an input character to it.  */
      {
        char sigchar = process_signal_char(UNIX_DATA(p)->subtty, signo);
        if (sigchar) {
          send_process (proc, Qnil, (Bufbyte *) &sigchar, 0, 1);
          return;
        }
      }
#endif /* ! defined (SIGNALS_VIA_CHARACTERS) */

#ifdef TIOCGPGRP
      /* Get the pgrp using the tty itself, if we have that.
	 Otherwise, use the pty to get the pgrp.
	 On pfa systems, saka@pfu.fujitsu.co.JP writes:
	 "TIOCGPGRP symbol defined in sys/ioctl.h at E50.
	 But, TIOCGPGRP does not work on E50 ;-P works fine on E60"
	 His patch indicates that if TIOCGPGRP returns an error, then
	 we should just assume that p->pid is also the process group id.  */
      {
	int err;

        err = ioctl ( (UNIX_DATA(p)->subtty != -1
		       ? UNIX_DATA(p)->subtty
		       : UNIX_DATA(p)->infd), TIOCGPGRP, &gid);

#ifdef pfa
	if (err == -1)
	  gid = - XINT (p->pid);
#endif /* ! defined (pfa) */
      }
      if (gid == -1)
	no_pgrp = 1;
      else
	gid = - gid;
#else /* ! defined (TIOCGPGRP ) */
      /* Can't select pgrps on this system, so we know that
	 the child itself heads the pgrp.  */
      gid = - XINT (p->pid);
#endif /* ! defined (TIOCGPGRP ) */
    }
  else
    gid = - XINT (p->pid);

  switch (signo)
    {
#ifdef SIGCONT
    case SIGCONT:
      p->status_symbol = Qrun;
      p->exit_code = 0;
      p->tick++;
      process_tick++;
      if (!nomsg)
	status_notify ();
      break;
#endif /* ! defined (SIGCONT) */
    case SIGINT:
    case SIGQUIT:
    case SIGKILL:
      flush_pending_output (UNIX_DATA(p)->infd);
      break;
    }

  /* If we don't have process groups, send the signal to the immediate
     subprocess.  That isn't really right, but it's better than any
     obvious alternative.  */
  if (no_pgrp)
    {
      kill_retval = kill (XINT (p->pid), signo) ? errno : 0;
    }
  else
    {
      /* gid may be a pid, or minus a pgrp's number */
#if defined (TIOCSIGNAL) || defined (TIOCSIGSEND)
      if (current_group)
	{
#ifdef TIOCSIGNAL
	  kill_retval = ioctl (UNIX_DATA(p)->infd, TIOCSIGNAL, signo);
#else /* ! defined (TIOCSIGNAL) */
	  kill_retval = ioctl (UNIX_DATA(p)->infd, TIOCSIGSEND, signo);
#endif /* ! defined (TIOCSIGNAL) */
	}
      else
	kill_retval = kill (- XINT (p->pid), signo) ? errno : 0;
#else /* ! (defined (TIOCSIGNAL) || defined (TIOCSIGSEND)) */
      kill_retval = EMACS_KILLPG (-gid, signo) ? errno : 0;
#endif /* ! (defined (TIOCSIGNAL) || defined (TIOCSIGSEND)) */
    }

  if (kill_retval < 0 && errno == EINVAL)
    error ("Signal number %d is invalid for this system", signo);
}

/*
 * Kill any process in the system given its PID.
 *
 * Returns zero if a signal successfully sent, or
 * negative number upon failure
 */

static int
unix_kill_process_by_pid (int pid, int sigcode)
{
  return kill (pid, sigcode);
}

/*
 * Return TTY name used to communicate with subprocess
 */

static Lisp_Object
unix_get_tty_name (struct Lisp_Process *p)
{
  return UNIX_DATA (p)->tty_name;
}

/*
 * Canonicalize host name HOST, and return its canonical form
 *
 * The default implementation just takes HOST for a canonical name.
 */

#ifdef HAVE_SOCKETS
static Lisp_Object
unix_canonicalize_host_name (Lisp_Object host)
{
  struct sockaddr_in address;

  if (!get_internet_address (host, &address, ERROR_ME_NOT))
    return host;

  if (address.sin_family == AF_INET)
    return build_string (inet_ntoa (address.sin_addr));
  else
    /* #### any clue what to do here? */
    return host;
}

/* open a TCP network connection to a given HOST/SERVICE.  Treated
   exactly like a normal process when reading and writing.  Only
   differences are in status display and process deletion.  A network
   connection has no PID; you cannot signal it.  All you can do is
   deactivate and close it via delete-process */

static void
unix_open_network_stream (Lisp_Object name, Lisp_Object host, Lisp_Object service,
			  Lisp_Object family, void** vinfd, void** voutfd)
{
  struct sockaddr_in address;
  int s, inch, outch;
  volatile int port;
  volatile int retry = 0;
  int retval;

  CHECK_STRING (host);

  if (!EQ (family, Qtcpip))
    error ("Unsupported protocol family \"%s\"",
	   string_data (symbol_name (XSYMBOL (family))));

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

  /* Turn off interrupts here -- see comments below.  There used to
     be code which called bind_polling_period() to slow the polling
     period down rather than turn it off, but that seems rather
     bogus to me.  Best thing here is to use a non-blocking connect
     or something, to check for QUIT. */

  /* Comments that are not quite valid: */

  /* Kernel bugs (on Ultrix at least) cause lossage (not just EINTR)
     when connect is interrupted.  So let's not let it get interrupted.
     Note we do not turn off polling, because polling is only used
     when not interrupt_input, and thus not normally used on the systems
     which have this bug.  On systems which use polling, there's no way
     to quit if polling is turned off.  */

  /* Slow down polling.  Some kernels have a bug which causes retrying
     connect to fail after a connect.  */

  slow_down_interrupts ();

 loop:

  /* A system call interrupted with a SIGALRM or SIGIO comes back
     here, with can_break_system_calls reset to 0. */
  SETJMP (break_system_call_jump);
  if (QUITP)
    {
      speed_up_interrupts ();
      REALLY_QUIT;
      /* In case something really weird happens ... */
      slow_down_interrupts ();
    }

  /* Break out of connect with a signal (it isn't otherwise possible).
     Thus you don't get screwed with a hung network. */
  can_break_system_calls = 1;
  retval = connect (s, (struct sockaddr *) &address, sizeof (address));
  can_break_system_calls = 0;
  if (retval == -1 && errno != EISCONN)
    {
      int xerrno = errno;
      if (errno == EINTR)
	goto loop;
      if (errno == EADDRINUSE && retry < 20)
	{
	  /* A delay here is needed on some FreeBSD systems,
	     and it is harmless, since this retrying takes time anyway
	     and should be infrequent.
             `sleep-for' allowed for quitting this loop with interrupts
             slowed down so it can't be used here.  Async timers should
             already be disabled at this point so we can use `sleep'. */
          sleep (1);
	  retry++;
	  goto loop;
	}

      close (s);

      speed_up_interrupts ();

      errno = xerrno;
      report_file_error ("connection failed", list2 (host, name));
    }

  speed_up_interrupts ();

  inch = s;
  outch = dup (s);
  if (outch < 0)
    {
      close (s); /* this used to be leaked; from Kyle Jones */
      report_file_error ("error duplicating socket", list1 (name));
    }

  set_socket_nonblocking_maybe (inch, port, "tcp");

  *vinfd = (void*)inch;
  *voutfd = (void*)outch;
}


#ifdef HAVE_MULTICAST

/* Didier Verna <verna@inf.enst.fr> Nov. 28 1997.

   This function is similar to open-network-stream-internal, but provides a
   mean to open an UDP multicast connection instead of a TCP one. Like in the
   TCP case, the multicast connection will be seen as a sub-process,

   Some notes:
   - Normally, we should use sendto and recvfrom with non connected
   sockets. The current code doesn't allow us to do this. In the future, it
   would be a good idea to extend the process data structure in order to deal
   properly with the different types network connections.
   - For the same reason, when leaving a multicast group, it is better to make
   a setsockopt - IP_DROP_MEMBERSHIP before closing the descriptors.
   Unfortunately, this can't be done here because delete_process doesn't know
   about the kind of connection we have. However, this is not such an
   important issue.
*/

static void
unix_open_multicast_group (Lisp_Object name, Lisp_Object dest, Lisp_Object port,
			   Lisp_Object ttl, void** vinfd, void** voutfd)
{
  struct ip_mreq imr;
  struct sockaddr_in sa;
  struct protoent *udp;
  int ws, rs;
  int theport;
  unsigned char thettl;
  int one = 1; /* For REUSEADDR */
  int ret;
  volatile int retry = 0;

  CHECK_STRING (dest);

  CHECK_NATNUM (port);
  theport = htons ((unsigned short) XINT (port));

  CHECK_NATNUM (ttl);
  thettl = (unsigned char) XINT (ttl);

  if ((udp = getprotobyname ("udp")) == NULL)
    error ("No info available for UDP protocol");

  /* Init the sockets. Yes, I need 2 sockets. I couldn't duplicate one. */
  if ((rs = socket (PF_INET, SOCK_DGRAM, udp->p_proto)) < 0)
    report_file_error ("error creating socket", list1(name));
  if ((ws = socket (PF_INET, SOCK_DGRAM, udp->p_proto)) < 0)
    {
      close (rs);
      report_file_error ("error creating socket", list1(name));
    }

  /* This will be used for both sockets */
  memset (&sa, 0, sizeof(sa));
  sa.sin_family = AF_INET;
  sa.sin_port = theport;
  sa.sin_addr.s_addr = htonl (inet_addr ((char *) XSTRING_DATA (dest)));

  /* Socket configuration for reading ------------------------ */

  /* Multiple connections from the same machine. This must be done before
     bind. If it fails, it shouldn't be fatal. The only consequence is that
     people won't be able to connect twice from the same machine. */
  if (setsockopt (rs, SOL_SOCKET, SO_REUSEADDR, (char *) &one, sizeof (one))
      < 0)
    warn_when_safe (Qmulticast, Qwarning, "Cannot reuse socket address");

  /* bind socket name */
  if (bind (rs, (struct sockaddr *)&sa, sizeof(sa)))
    {
      close (rs);
      close (ws);
      report_file_error ("error binding socket", list2(name, port));
    }

  /* join multicast group */
  imr.imr_multiaddr.s_addr = htonl (inet_addr ((char *) XSTRING_DATA (dest)));
  imr.imr_interface.s_addr = htonl (INADDR_ANY);
  if (setsockopt (rs, IPPROTO_IP, IP_ADD_MEMBERSHIP,
		 (char *) &imr, sizeof (struct ip_mreq)) < 0)
    {
      close (ws);
      close (rs);
      report_file_error ("error adding membership", list2(name, dest));
    }

  /* Socket configuration for writing ----------------------- */

  /* Normally, there's no 'connect' in multicast, since we prefer to use
     'sendto' and 'recvfrom'. However, in order to handle this connection in
     the process-like way it is done for TCP, we must be able to use 'write'
     instead of 'sendto'. Consequently, we 'connect' this socket. */

  /* See open-network-stream-internal for comments on this part of the code */
  slow_down_interrupts ();

 loop:

  /* A system call interrupted with a SIGALRM or SIGIO comes back
     here, with can_break_system_calls reset to 0. */
  SETJMP (break_system_call_jump);
  if (QUITP)
    {
      speed_up_interrupts ();
      REALLY_QUIT;
      /* In case something really weird happens ... */
      slow_down_interrupts ();
    }

  /* Break out of connect with a signal (it isn't otherwise possible).
     Thus you don't get screwed with a hung network. */
  can_break_system_calls = 1;
  ret = connect (ws, (struct sockaddr *) &sa, sizeof (sa));
  can_break_system_calls = 0;
  if (ret == -1 && errno != EISCONN)
    {
      int xerrno = errno;

      if (errno == EINTR)
	goto loop;
      if (errno == EADDRINUSE && retry < 20)
	{
	  /* A delay here is needed on some FreeBSD systems,
	     and it is harmless, since this retrying takes time anyway
	     and should be infrequent.
	     `sleep-for' allowed for quitting this loop with interrupts
	     slowed down so it can't be used here.  Async timers should
	     already be disabled at this point so we can use `sleep'. */
	  sleep (1);
	  retry++;
	  goto loop;
	}

      close (rs);
      close (ws);
      speed_up_interrupts ();

      errno = xerrno;
      report_file_error ("error connecting socket", list2(name, port));
    }

  speed_up_interrupts ();

  /* scope */
  if (setsockopt (ws, IPPROTO_IP, IP_MULTICAST_TTL,
		  (char *) &thettl, sizeof (thettl)) < 0)
    {
      close (rs);
      close (ws);
      report_file_error ("error setting ttl", list2(name, ttl));
    }

  set_socket_nonblocking_maybe (rs, theport, "udp");

  *vinfd = (void*)rs;
  *voutfd = (void*)ws;
}

#endif /* HAVE_MULTICAST */

#endif /* HAVE_SOCKETS */


/**********************************************************************/
/*                            Initialization                          */
/**********************************************************************/

void
process_type_create_unix (void)
{
  PROCESS_HAS_METHOD (unix, alloc_process_data);
  PROCESS_HAS_METHOD (unix, mark_process_data);
#ifdef SIGCHLD
  PROCESS_HAS_METHOD (unix, init_process);
  PROCESS_HAS_METHOD (unix, reap_exited_processes);
#endif
  PROCESS_HAS_METHOD (unix, init_process_io_handles);
  PROCESS_HAS_METHOD (unix, create_process);
  PROCESS_HAS_METHOD (unix, tooltalk_connection_p);
  PROCESS_HAS_METHOD (unix, set_window_size);
#ifdef HAVE_WAITPID
  PROCESS_HAS_METHOD (unix, update_status_if_terminated);
#endif
  PROCESS_HAS_METHOD (unix, send_process);
  PROCESS_HAS_METHOD (unix, process_send_eof);
  PROCESS_HAS_METHOD (unix, deactivate_process);
  PROCESS_HAS_METHOD (unix, kill_child_process);
  PROCESS_HAS_METHOD (unix, kill_process_by_pid);
  PROCESS_HAS_METHOD (unix, get_tty_name);
#ifdef HAVE_SOCKETS
  PROCESS_HAS_METHOD (unix, canonicalize_host_name);
  PROCESS_HAS_METHOD (unix, open_network_stream);
#ifdef HAVE_MULTICAST
  PROCESS_HAS_METHOD (unix, open_multicast_group);
#endif
#endif
}

void
vars_of_process_unix (void)
{
  Fprovide (intern ("unix-processes"));
}

#endif /* !defined (NO_SUBPROCESSES) */
