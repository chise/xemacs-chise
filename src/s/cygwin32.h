/* system description file for cygwin32.
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

/* Building under cygwin
 *
 * The approach I have taken with this port is to use primarily the UNIX 
 * code base adding stuff that is MS-Windows specific. This works quite 
 * well, and is in keeping with my perception of the cygwin philosophy.
 * Note that if you make changes to this file you do NOT want to define 
 * WINDOWSNT, I repeat - do not define this, it will break everything 
 * horribly. What does get defined is HAVE_MS_WINDOWS, but this is 
 * done by configure and only applies to the window system.
 *
 * When building make sure your HOME path is unix style - i.e. without
 * a drive letter.
 *
 * once you have done this, configure and make.
 *
 * windows '95 - I haven't tested this under '95, it will probably
 * build but I konw there are some limitations with cygwin under 95 so
 * YMMV. I build with NT4 SP3.
 *
 * Andy Piper <andy@xemacs.org> 8/1/98 
 * http://www.xemacs.freeserve.co.uk/ */

/* cheesy way to determine cygwin version */
#ifndef NOT_C_CODE
#include <signal.h>
#ifdef HAVE_CYGWIN_VERSION_H
#include <cygwin/version.h>
#else
#ifdef SIGIO
#define CYGWIN_B19
#else
#define BROKEN_CYGWIN
#endif
#endif

extern void cygwin32_win32_to_posix_path_list(const char*, char*);
extern int cygwin32_win32_to_posix_path_list_buf_size(const char*);
extern void cygwin32_posix_to_win32_path_list(const char*, char*);
extern int cygwin32_posix_to_win32_path_list_buf_size(const char*);
#ifndef CYGWIN_VERSION_DLL_MAJOR
struct timeval;
struct timezone;
struct itimerval;
struct stat;
extern int gettimeofday(struct timeval *tp, struct timezone *tzp);
extern int gethostname (char* name, int namelen);
extern char*	mktemp(char *);
extern double	logb(double);
extern void	sync();
extern int	ioctl(int, int, ...);
				/* sys/stat.h */
extern int lstat(const char *path, struct stat *buf);
				/* unistd.h */
extern int readlink(const char *path, void *buf, unsigned int bufsiz);
extern int symlink(const char *name1, const char *name2);
				/* sys/time.h */
extern int setitimer(int which, const struct itimerval *value,
		     struct itimerval *ovalue);
extern int utimes(char *file, struct timeval *tvp);

extern int srandom( unsigned seed);
extern long random();

#define SND_ASYNC		1
#define SND_NODEFAULT		2
#define SND_MEMORY		4
#define SND_FILENAME		0x2000L
#define VK_APPS			0x5D
#define SIF_TRACKPOS	0x0010
#define ICC_BAR_CLASSES 4
#define FW_BLACK	FW_HEAVY
#define FW_ULTRABOLD	FW_EXTRABOLD
#define FW_DEMIBOLD	FW_SEMIBOLD
#define FW_ULTRALIGHT	FW_EXTRALIGHT
#define APPCMD_FILTERINITS	0x20L
#define CBF_FAIL_SELFCONNECTIONS 0x1000
#define CBF_SKIP_ALLNOTIFICATIONS	0x3C0000
#define CBF_FAIL_ADVISES	0x4000
#define CBF_FAIL_POKES		0x10000
#define CBF_FAIL_REQUESTS	0x20000
#define SZDDESYS_TOPIC		"System"
#define JOHAB_CHARSET 		130
#define MAC_CHARSET 		77

#endif
#endif

#ifndef SPI_GETWHEELSCROLLLINES
#define SPI_GETWHEELSCROLLLINES 104
#endif
#ifndef WHEEL_PAGESCROLL
#define WHEEL_PAGESCROLL (UINT_MAX)
#endif
#ifndef WHEEL_DELTA
#define WHEEL_DELTA 120
#endif
#ifndef WM_MOUSEWHEEL
#define WM_MOUSEWHEEL 0x20A
#endif

#define PBS_SMOOTH              0x01

#ifdef HAVE_MS_WINDOWS
#define HAVE_NTGUI
#define HAVE_FACES
#endif

#ifndef ORDINARY_LINK
#define ORDINARY_LINK
#endif

#define C_SWITCH_SYSTEM -Wno-sign-compare -fno-caller-saves
#define LIBS_SYSTEM -lwinmm


#define TEXT_START -1
#define TEXT_END -1
#define DATA_END -1
#define HEAP_IN_DATA
#define UNEXEC "unexcw.o"

#ifdef CYGWIN_VERSION_DLL_MAJOR
#if 0
/* ### FIXME: although defining BROKEN_SIGIO is correct for proper ^G
   behavior, bugs in cygwin mean that xemacs locks up frequently if
   this is defined.  */
#define BROKEN_SIGIO
#endif
#else
#define PROCESS_IO_BLOCKING
#endif
#define strnicmp strncasecmp
#ifndef HAVE_SOCKETS
#define HAVE_SOCKETS
#endif
#define OBJECTS_SYSTEM	ntplay.o
#define HAVE_NATIVE_SOUND

#undef MAIL_USE_SYSTEM_LOCK
#define MAIL_USE_POP

/* Define NO_ARG_ARRAY if you cannot take the address of the first of a
 * group of arguments and treat it as an array of the arguments.  */

#define NO_ARG_ARRAY

/* Define WORD_MACHINE if addresses and such have
 * to be corrected before they can be used as byte counts.  */

#define WORD_MACHINE

/* Define EXPLICIT_SIGN_EXTEND if XINT must explicitly sign-extend
   the 24-bit bit field into an int.  In other words, if bit fields
   are always unsigned.

   If you use NO_UNION_TYPE, this flag does not matter.  */

#define EXPLICIT_SIGN_EXTEND

/* Data type of load average, as read out of kmem.  */

#define LOAD_AVE_TYPE long

/* Convert that into an integer that is 100 for a load average of 1.0  */

#define LOAD_AVE_CVT(x) (int) (((double) (x)) * 100.0 / FSCALE)

/* Define VIRT_ADDR_VARIES if the virtual addresses of
   pure and impure space as loaded can vary, and even their
   relative order cannot be relied on.

   Otherwise Emacs assumes that text space precedes data space,
   numerically.  */

/* Text does precede data space, but this is never a safe assumption.  */
#define VIRT_ADDR_VARIES

/* set this if you have a new version of cygwin
#define DATA_SEG_BITS 0x10000000
*/

/* If you are compiling with a non-C calling convention but need to
   declare vararg routines differently, put it here */
#define _VARARGS_ __cdecl

/* If you are providing a function to something that will call the
   function back (like a signal handler and signal, or main) its calling
   convention must be whatever standard the libraries expect */
#define _CALLBACK_ __cdecl

/* SYSTEM_TYPE should indicate the kind of system you are using.
 It sets the Lisp variable system-type.  */

#define SYSTEM_TYPE "cygwin32"

#define NO_MATHERR

/* define MAIL_USE_FLOCK if the mailer uses flock
   to interlock access to /usr/spool/mail/$USER.
   The alternative is that a lock file named
   /usr/spool/mail/$USER.lock.  */

/* If the character used to separate elements of the executable path
   is not ':', #define this to be the appropriate character constant.  */
#define SEPCHAR ':'

/* ============================================================ */

/* Here, add any special hacks needed
   to make Emacs work on this system.  For example,
   you might define certain system call names that don't
   exist on your system, or that do different things on
   your system and must be used only through an encapsulation
   (Which you should place, by convention, in sysdep.c).  */

/* Define this to be the separator between path elements */
/* #define DIRECTORY_SEP XINT (Vdirectory_sep_char) */

/* Define this to be the separator between devices and paths */
#define DEVICE_SEP ':'

/* We'll support either convention on NT.  */
#define IS_DIRECTORY_SEP(_c_) ((_c_) == '/' || (_c_) == '\\')
#define IS_ANY_SEP(_c_) (IS_DIRECTORY_SEP (_c_) || IS_DEVICE_SEP (_c_))
#define EXEC_SUFFIXES   ".exe:.com:.bat:.cmd:"

/* We need a little extra space, see ../../lisp/loadup.el */
#define SYSTEM_PURESIZE_EXTRA 15000

#define CYGWIN_CONV_PATH(src, dst) \
dst = alloca (cygwin32_win32_to_posix_path_list_buf_size(src)); \
cygwin32_win32_to_posix_path_list(src, dst)
#define CYGWIN_WIN32_PATH(src, dst) \
dst = alloca (cygwin32_posix_to_win32_path_list_buf_size(src)); \
cygwin32_posix_to_win32_path_list(src, dst)

/*
 * stolen from usg.
 */
#define HAVE_PTYS
#define FIRST_PTY_LETTER 'z'

/* Pseudo-terminal support under SVR4 only loops to deal with errors. */

#define PTY_ITERATION for (i = 0, c = 0; i < 1; i++)

/* This sets the name of the master side of the PTY. */

#define PTY_NAME_SPRINTF strcpy (pty_name, "/dev/ptmx");

/* This sets the name of the slave side of the PTY.  On SysVr4,
   grantpt(3) forks a subprocess, so keep sigchld_handler() from
   intercepting that death.  If any child but grantpt's should die
   within, it should be caught after EMACS_UNBLOCK_SIGNAL. */

#define PTY_OPEN \
   fd = open (pty_name, O_RDWR | O_NONBLOCK | OPEN_BINARY, 0)

#define PTY_TTY_NAME_SPRINTF				\
  {							\
    extern char* ptsname(int);				\
    char *ptyname;					\
							\
    if (!(ptyname = ptsname (fd)))			\
      { close (fd); return -1; }			\
    strncpy (pty_name, ptyname, sizeof (pty_name));	\
    pty_name[sizeof (pty_name) - 1] = 0;		\
  }

/* ============================================================ */

