/* System description file for Windows NT.
   Copyright (C) 1993, 1994, 1995 Free Software Foundation, Inc.

This file is part of GNU Emacs.

GNU Emacs is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GNU Emacs is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: FSF 19.31. */

#ifndef WINDOWSNT
#define WINDOWSNT
#endif

#ifndef DOS_NT
#define DOS_NT 	/* MSDOS or WINDOWSNT */
#endif

/* In case non-Microsoft compiler is used, we fake _MSC_VER */
#ifndef _MSC_VER
#define _MSC_VER  1
#endif

typedef unsigned short mode_t;
/* typedef long ptrdiff_t; -kkm */
typedef int pid_t;

#include <stddef.h>

/* If you are compiling with a non-C calling convention but need to
   declare vararg routines differently, put it here */
#define _VARARGS_ __cdecl

/* If you are providing a function to something that will call the
   function back (like a signal handler and signal, or main) its calling
   convention must be whatever standard the libraries expect */
#define _CALLBACK_ __cdecl

/* SYSTEM_TYPE should indicate the kind of system you are using.
 It sets the Lisp variable system-type.  */

#define SYSTEM_TYPE "windows-nt"

#define NO_MATHERR

#define SIZEOF_SHORT 2
#define SIZEOF_INT 4
#define SIZEOF_LONG 4
#define SIZEOF_LONG_LONG 0
#define SIZEOF_VOID_P 4

/* NOMULTIPLEJOBS should be defined if your system's shell
 does not have "job control" (the ability to stop a program,
 run some other program, then continue the first one).  */

/* #define NOMULTIPLEJOBS */

/* Letter to use in finding device name of first pty,
  if system supports pty's.  'a' means it is /dev/ptya0  */

#define FIRST_PTY_LETTER 'a'

/*
 *      Define HAVE_TIMEVAL if the system supports the BSD style clock values.
 *      Look in <sys/time.h> for a timeval structure.
 */

#define HAVE_TIMEVAL

/*
 *      Define HAVE_SELECT if the system supports the `select' system call.
 */

/* #define HAVE_SELECT */

/*
 *      Define HAVE_PTYS if the system supports pty devices.
 */

/* #define HAVE_PTYS */

/* If your system uses COFF (Common Object File Format) then define the
   preprocessor symbol "COFF". */

#define COFF

/* NT supports Winsock which is close enough (with some hacks) */

#define HAVE_SOCKETS

/* define MAIL_USE_FLOCK if the mailer uses flock
   to interlock access to /usr/spool/mail/$USER.
   The alternative is that a lock file named
   /usr/spool/mail/$USER.lock.  */

#define MAIL_USE_POP
#define HAVE_LOCKING
#define MAIL_USE_LOCKING

/* If the character used to separate elements of the executable path
   is not ':', #define this to be the appropriate character constant.  */
#define SEPCHAR ';'

/* ============================================================ */

/* Here, add any special hacks needed
   to make Emacs work on this system.  For example,
   you might define certain system call names that don't
   exist on your system, or that do different things on
   your system and must be used only through an encapsulation
   (Which you should place, by convention, in sysdep.c).  */

/* XEmacs file I/O for DOS text files requires FILE_CODING */
#define FILE_CODING

#define DIRECTORY_SEP ((char)XCHAR(Vdirectory_sep_char))

/* Define this to be the separator between devices and paths */
#define DEVICE_SEP ':'

/* We'll support either convention on NT.  */
#define IS_DIRECTORY_SEP(_c_) ((_c_) == '/' || (_c_) == '\\')
#define IS_ANY_SEP(_c_) (IS_DIRECTORY_SEP (_c_) || IS_DEVICE_SEP (_c_))

/* The null device on Windows NT. */
#define NULL_DEVICE     "NUL:"
#define EXEC_SUFFIXES   ".exe:.com:.bat:.cmd:"

#ifndef MAXPATHLEN
#define MAXPATHLEN      _MAX_PATH
#endif

#define LISP_FLOAT_TYPE

#define HAVE_GETTIMEOFDAY
#define HAVE_GETHOSTNAME
#define HAVE_DUP2
#define HAVE_RENAME
#define HAVE_CLOSEDIR

#define HAVE_TZNAME

#define HAVE_LONG_FILE_NAMES

#define HAVE_MKDIR
#define HAVE_RMDIR
#define HAVE_RANDOM
#define HAVE_LOGB
#define HAVE_FREXP
#define HAVE_FMOD
#define HAVE_FTIME
#define HAVE_MKTIME

#define HAVE_MOUSE
#define HAVE_H_ERRNO
#define HAVE_STRUCT_UTIMBUF

#ifdef HAVE_NTGUI
#define HAVE_WINDOW_SYSTEM
#define HAVE_FACES
#endif

#define HAVE_STRCASECMP

/* Compatibility macros. Some used to be routines in nt.c */
#define strcasecmp(x,y) _stricmp(x,y)
#define random() (rand() << 15 | rand())
#define srandom(seed) (srand(seed))
#define setpgrp(pid,gid)

#define MODE_LINE_BINARY_TEXT(_b_) (NILP ((_b_)->buffer_file_type) ? "T" : "B")


#include <stdio.h>

/* subprocess calls that are emulated */
#ifndef DONT_ENCAPSULATE
#define spawnve sys_spawnve
int spawnve (int mode, const char *cmdname, 
	     const char * const *argv, const char *const *envp);
#endif

/* IO calls that are emulated or shadowed */
#define pipe    sys_pipe
int sys_pipe (int * phandles);

#ifndef HAVE_X_WINDOWS
#define sleep   sys_sleep
void sleep (int seconds);
#endif

#define wait    sys_wait
int wait (int *status);

#define kill    sys_kill
int kill (int pid, int sig);

/* map to MSVC names */
#define popen     _popen
#define pclose    _pclose

typedef int uid_t;
typedef int gid_t;
typedef int pid_t;
typedef int ssize_t;

/* Encapsulation of system calls */
#ifndef DONT_ENCAPSULATE
#define getpid sys_getpid
pid_t getpid (void);
#endif

/* Random global functions called everywhere. Implemented in nt.c */
/* #### Most of these are FSFisms and must be avoided */
/* #### All of these are FSFisms and must be avoided */
void dostounix_filename (char *p);
void unixtodos_filename (char *p);
int crlf_to_lf (int n, unsigned char *buf, unsigned int *lf_count);

char *getwd (char *dir);

void *sbrk (unsigned long increment);

struct passwd;
struct passwd *getpwuid (uid_t uid);
struct passwd *getpwnam (const char *name);
uid_t getuid (void);
uid_t geteuid (void);
gid_t getgid (void);
gid_t getegid (void);

/* Setitimer is emulated */
#define HAVE_SETITIMER

/* We now have emulation for some signals */
#define HAVE_SIGHOLD
#define sigset(s,h) msw_sigset(s,h)
#define sighold(s) msw_sighold(s)
#define sigrelse(s) msw_sigrelse(s)
#define sigpause(s) msw_sigpause(s)

/* Defines that we need that aren't in the standard signal.h  */
#define SIGHUP  1               /* Hang up */
#define SIGQUIT 3               /* Quit process */
#define SIGKILL 9               /* Die, die die */
#define SIGALRM 14              /* Alarm */
#define SIGPROF 29		/* Profiling timer exp */

/* For integration with MSDOS support.  */
#define getdisk()               (_getdrive () - 1)
#define getdefdir(_drv, _buf)   _getdcwd (_drv, _buf, MAXPATHLEN)

/* Defines size_t and alloca ().  */
#include <malloc.h>

#include <sys/stat.h>

/* Define for those source files that do not include enough NT 
   system files.  */
#ifndef NULL
#ifdef __cplusplus
#define NULL	0
#else
#define NULL	((void *)0)
#endif
#endif

/* For proper declaration of environ.  */
#include <stdlib.h>
#include <string.h>

/* Define process implementation */
#define HAVE_WIN32_PROCESSES

/* We need a little extra space, see ../../lisp/loadup.el */
#define SYSTEM_PURESIZE_EXTRA 15000

/* ============================================================ */

/* See unexnt.c */
#if (_MSC_VER >= 1100)
#define DUMP_SEPARATE_SECTION
#endif
#ifdef DUMP_SEPARATE_SECTION
#pragma data_seg("xdata")
#pragma bss_seg("xdata")
#endif

#ifdef HAVE_SCROLLBARS
/* Ensure the NT 4 mouse definitions in winuser.h are available */
 #ifndef _WIN32_WINNT
  #define _WIN32_WINNT 0x0400
 #endif
#endif

/* MSVC 6.0 has a mechanism to declare functions which never return */
#if (_MSC_VER >= 1200)
#define DOESNT_RETURN __declspec(noreturn) void
#define DECLARE_DOESNT_RETURN(decl) __declspec(noreturn) extern void decl
#define DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS(decl,str,idx) \
          __declspec(noreturn) extern void decl PRINTF_ARGS(str,idx)
#endif /* MSVC 6.0 */
