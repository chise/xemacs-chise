/* systty.h - System-dependent definitions for terminals.
   Copyright (C) 1992, 1993, 1994 Free Software Foundation, Inc.

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

/* Synched up with: FSF 19.30. */

#ifndef _XEMACS_SYSTTY_H_
#define _XEMACS_SYSTTY_H_

#ifdef HAVE_TERMIOS
# define HAVE_TCATTR
#endif

/* If we defined these before and we are about to redefine them,
   prevent alarming warnings.  */
#ifdef BSD_TERMIOS
#undef NL0
#undef NL1
#undef CR0
#undef CR1
#undef CR2
#undef CR3
#undef TAB0
#undef TAB1
#undef TAB2
#undef XTABS
#undef BS0
#undef BS1
#undef FF0
#undef FF1
#undef ECHO
#undef NOFLSH
#undef TOSTOP
#undef FLUSHO
#undef PENDIN
#endif

/* Include the proper files.  */

/* XEmacs: TERMIOS is mo' better than TERMIO so we use it if it's
   there.  Since TERMIO is backward-compatibility stuff if both it
   and TERMIOS exist, it's more likely to be broken. */

#if defined (HAVE_TERMIOS)

/*****     (1) The TERMIOS way (POSIX style)     *****/

# if defined (_AIX) && defined (_I386)
#  include <termios.h>		/* termios.h needs to be before termio.h */
#  include <termio.h>
# else
#  if !defined (NO_TERMIO)
#   include <termio.h>
#  endif
#  include <termios.h>
# endif /* _AIX && _I386 */
# ifndef INCLUDED_FCNTL
#  define INCLUDED_FCNTL
#  include <fcntl.h>
# endif

#elif defined (HAVE_TERMIO)

/*****    (2) The TERMIO way (system V style)    *****/

# ifdef __DGUX
#  include <sys/ioctl.h>
# endif
# ifndef NO_TERMIO
#  include <termio.h>
# endif /* not NO_TERMIO */
# ifndef INCLUDED_FCNTL
#  define INCLUDED_FCNTL
#  include <fcntl.h>
# endif

#elif defined (DOS_NT)

/*****             (3) The MSDOS/NT way              *****/

/* Nothing doing */

#else

/*****              (4) The BSD way              *****/

# ifdef linux /* XEmacs addition -- necessary? */
#  include <bsd/sgtty.h>
# else
#  include <sgtty.h>
# endif


#endif /* HAVE_TERMIOS */

/* XEmacs: I don't think we need the following crap. */
#ifdef __GNU_LIBRARY__
#include <termios.h>
#endif

/* Formerly there was a conditional that included sys/filio.h if
   USG5_4 was defined, but this is already included in s/usg5-4.h */

/* Generally useful to include this file: */

/* But Sun OS has broken include files and doesn't want it included */
#if !defined (DOS_NT) && !defined (WIN32) && !defined (SUNOS4)
# include <sys/ioctl.h>
#endif
/* UNIPLUS systems may have FIONREAD.  */
#ifdef UNIPLUS
#include <sys.ioctl.h>
#endif


/* ----------------------------------------------------- */
/*                 miscellaneous includes                */
/* ----------------------------------------------------- */

#ifdef AIXHFT
/* Get files for keyboard remapping */
#define HFNKEYS 2
#include <sys/hft.h>
#include <sys/devinfo.h>
#endif

/* XEmacs: We don't support BSD 4.1 any more */

#ifdef NEED_BSDTTY
#include <sys/bsdtty.h>
#endif

/* Include files for PTY's */

#if defined (HPUX) && defined (HAVE_PTYS)
#include <sys/ptyio.h>
#endif

#ifdef AIX
#include <sys/pty.h>
#endif /* AIX */

#ifdef SYSV_PTYS
# include <sys/types.h>
# include <sys/tty.h>
# ifdef titan
#  include <sys/ttyhw.h>
#  include <sys/stream.h>
# endif
# ifndef NO_PTY_H
#  include <sys/pty.h>
# endif
#endif

/* XEmacs: removed some random if defined (pfa) crap for FASYNC (SIGIO).
   We've cleaned SIGIO up. */


/* ----------------------------------------------------- */
/*           inhibiting particular features              */
/* ----------------------------------------------------- */


#ifdef APOLLO
#undef TIOCSTART
#endif

#if defined (XENIX) || defined (BROKEN_TIOCGETC)
#undef TIOCGETC  /* Avoid confusing some conditionals that test this.  */
#endif

/* XEmacs: SIGIO is cleaned up so we remove the crap here that messes
   with it (and FIONREAD and FASYNC, which are related). */

#ifdef BROKEN_TIOCGWINSZ /* XEmacs addition */
#undef TIOCGWINSZ
#undef TIOCSWINSZ
#endif

#ifdef BROKEN_O_NONBLOCK /* XEmacs addition */
# undef O_NONBLOCK
#endif /* BROKEN_O_NONBLOCK */

/* On TERMIOS systems, the tcmumbleattr calls take care of these
   parameters, and it's a bad idea to use them (on AIX, it makes the
   tty hang for a long time).  */
#if defined (TIOCGLTC) && !defined (HAVE_TERMIOS)
#define HAVE_LTCHARS
#endif

#if defined (TIOCGETC) && !defined (HAVE_TERMIOS)
#define HAVE_TCHARS
#endif


/* ----------------------------------------------------- */
/*             disabling terminal functions              */
/* ----------------------------------------------------- */

/* Try to establish the correct character to disable terminal functions
   in a system-independent manner.  Note that USG (at least) define
   _POSIX_VDISABLE as 0!  */

#ifdef _POSIX_VDISABLE
#define CDISABLE _POSIX_VDISABLE
#else /* not _POSIX_VDISABLE */
#ifdef CDEL
#undef CDISABLE
#define CDISABLE CDEL
#else /* not CDEL */
#define CDISABLE 255
#endif /* not CDEL */
#endif /* not _POSIX_VDISABLE */


/* ----------------------------------------------------- */
/*    Get the number of characters queued for output     */
/* ----------------------------------------------------- */

/* EMACS_OUTQSIZE(FD, int *SIZE) stores the number of characters
   queued for output to the terminal FD in *SIZE, if FD is a tty.
   Returns -1 if there was an error (i.e. FD is not a tty), 0
   otherwise.  */
#ifdef TIOCOUTQ
#define EMACS_OUTQSIZE(fd, size) ioctl (fd, TIOCOUTQ, size)
#endif

#ifdef HAVE_TERMIO
#ifdef TCOUTQ
#undef EMACS_OUTQSIZE
#define EMACS_OUTQSIZE(fd, size) ioctl (fd, TCOUTQ, size)
#endif
#endif


/* -------------------------------------------------------------------- */
/*       Manipulate a terminal's current (foreground) process group     */
/* -------------------------------------------------------------------- */

/* EMACS_HAVE_TTY_PGRP is true if we can get and set the tty's current
   controlling process group.

   EMACS_GET_TTY_PGRP(int FD, int *PGID) sets *PGID the terminal FD's
   current process group.  Return -1 if there is an error.

   EMACS_SET_TTY_PGRP(int FD, int *PGID) sets the terminal FD's
   current process group to *PGID.  Return -1 if there is an error.  */

/* HPUX tty process group stuff doesn't work, says the anonymous voice
   from the past.  */
/* But HPUX people say it does, so I've removed it.  --ben */
# ifdef TIOCGPGRP
#  define EMACS_HAVE_TTY_PGRP
# else
#  ifdef HAVE_TERMIOS
#   define EMACS_HAVE_TTY_PGRP
#  endif
# endif

#ifdef EMACS_HAVE_TTY_PGRP

#if defined (HAVE_TERMIOS) && ! defined (BSD_TERMIOS)

/* Resist the urge to insert needless extra parentheses. */
#define EMACS_GET_TTY_PGRP(fd, pgid) (*(pgid) = tcgetpgrp (fd))
#define EMACS_SET_TTY_PGRP(fd, pgid) tcsetpgrp (fd, *(pgid))

#elif defined (TIOCSPGRP)

#define EMACS_GET_TTY_PGRP(fd, pgid) (ioctl ((fd), TIOCGPGRP, (pgid)))
#define EMACS_SET_TTY_PGRP(fd, pgid) (ioctl ((fd), TIOCSPGRP, (pgid)))

#endif

#endif /* EMACS_HAVE_TTY_PGRP */

#ifndef EMACS_GET_TTY_PGRP

/* Just ignore this for now and hope for the best */
#define EMACS_GET_TTY_PGRP(fd, pgid) 0
#define EMACS_SET_TTY_PGRP(fd, pgif) 0

#endif

/* XEmacs interim backward-compatibility */
#define EMACS_GET_TTY_PROCESS_GROUP EMACS_GET_TTY_PGRP
#define EMACS_SET_TTY_PROCESS_GROUP EMACS_SET_TTY_PGRP

/* EMACS_GETPGRP (arg) returns the process group of the terminal.  */

#ifdef GETPGRP_VOID
#define EMACS_GETPGRP(x) getpgrp()
#else
#define EMACS_GETPGRP(x) getpgrp(x)
#endif /* GETPGRP_VOID */

/* XEmacs backward-compatibility.  Is 0 always a reasonable argument? */
#define EMACS_GET_PROCESS_GROUP() EMACS_GETPGRP (0)

/* XEmacs addition? */

/* EMACS_SEPARATE_PROCESS_GROUP () creates a separate process group for the
   running process. */

/* EMACS_SET_PROCESS_GROUP () sets our process group as specified. */

/* POSIX calls for setpgid(), so we use it if it's available.
   Otherwise use setpgrp(), in USG or BSD flavor.  Note that
   on newer systems, setpgrp() has unwanted effects (e.g.
   creating a new session), so we want to avoid its use
   if possible.

   NOTE: On some older systems, we should consider using setpgrp2()
   if it exists.  This is sufficiently rare, though, that there
   seems no point in autodetecting it.  Currently dgux.h is the
   only place where this has to be munged. */

#if defined (HAVE_SETPGID)
#  define EMACS_SEPARATE_PROCESS_GROUP() setpgid (0, 0)
#  define EMACS_SET_PROCESS_GROUP(pg) setpgid (0, pg)
#elif defined (USG)
#  define EMACS_SEPARATE_PROCESS_GROUP() setpgrp ()
/* old (pre-SVR4) USG's don't provide any way to do this.
   No big loss -- it just means that ^Z won't work right
   if we're run from sh. */
#  define EMACS_SET_PROCESS_GROUP(pg)
#else
/* Under NeXTstep, a process group of 0 is not the same as specifying
   your own process ID, so we go ahead and specify it explicitly. */
#  define EMACS_SEPARATE_PROCESS_GROUP() setpgrp (0, getpid ())
#  define EMACS_SET_PROCESS_GROUP(pg) setpgrp (0, pg)
#endif


/* --------------------------------------------------------- */
/*   Manipulate a TTY's input/output processing parameters   */
/* --------------------------------------------------------- */

/* struct emacs_tty is a structure used to hold the current tty
   parameters.  If the terminal has several structures describing its
   state, for example a struct tchars, a struct sgttyb, a struct
   tchars, a struct ltchars, and a struct pagechars, struct
   emacs_tty should contain an element for each parameter struct
   that Emacs may change.

   EMACS_GET_TTY (int FD, struct emacs_tty *P) stores the parameters
   of the tty on FD in *P.  Return zero if all's well, or -1 if we ran
   into an error we couldn't deal with.

   EMACS_SET_TTY (int FD, struct emacs_tty *P, int flushp)
   sets the parameters of the tty on FD according to the contents of
   *P.  If flushp is non-zero, we discard queued input to be
   written before making the change.
   Return 0 if all went well, and -1 if anything failed.

   EMACS_TTY_TABS_OK (struct emacs_tty *P) is false iff the kernel
   expands tabs to spaces upon output; in that case, there is no
   advantage to using tabs over spaces.  */


/* For each tty parameter structure that Emacs might want to save and restore,
   - include an element for it in this structure, and
   - extend the emacs_{get,set}_tty functions in sysdep.c to deal with the
     new members.  */

struct emacs_tty {

/* There is always one of the following elements, so there is no need
   for dummy get and set definitions.  */
#ifdef HAVE_TCATTR
  struct termios main;
#else /* !HAVE_TCATTR */
#ifdef HAVE_TERMIO
  struct termio main;
#else /* !HAVE_TERMIO */
#ifdef DOS_NT
  int main;
#else  /* not DOS_NT */
  struct sgttyb main;
#endif /* not DOS_NT */
#endif /* !HAVE_TERMIO */
#endif /* !HAVE_TCATTR */

/* If we have TERMIOS, we don't need to do this - they're taken care of
   by the tc*attr calls.  */
#ifndef HAVE_TERMIOS
#ifdef HAVE_LTCHARS
  struct ltchars ltchars;
#endif /* HAVE_LTCHARS */

#ifdef HAVE_TCHARS
  struct tchars tchars;
  int lmode;
#endif /* HAVE_TCHARS */
#endif /* HAVE_TERMIOS */
};

/* Define EMACS_GET_TTY and EMACS_SET_TTY,
   the macros for reading and setting parts of `struct emacs_tty'.

   These got pretty unmanageable (huge macros are hard to debug), and
   finally needed some code which couldn't be done as part of an
   expression, so we moved them out to their own functions in sysdep.c.  */
#define EMACS_GET_TTY(fd, p)        emacs_get_tty (fd, p)
#define EMACS_SET_TTY(fd, p, waitp) emacs_set_tty (fd, p, waitp)


/* --------------------------------------------------------- */
/*                Define EMACS_TTY_TABS_OK                   */
/* --------------------------------------------------------- */

#ifdef HAVE_TERMIOS

#ifdef TABDLY
#define EMACS_TTY_TABS_OK(p) (((p)->main.c_oflag & TABDLY) != TAB3)
#else
#define EMACS_TTY_TABS_OK(p) 1
#endif /* TABDLY */

#else /* not def HAVE_TERMIOS */
#ifdef HAVE_TERMIO

#define EMACS_TTY_TABS_OK(p) (((p)->main.c_oflag & TABDLY) != TAB3)

#else /* neither HAVE_TERMIO nor HAVE_TERMIOS */
#ifdef DOS_NT
#define EMACS_TTY_TABS_OK(p) 0
#else /* not DOS_NT */
#define EMACS_TTY_TABS_OK(p) (((p)->main.sg_flags & XTABS) != XTABS)
#endif /* not DOS_NT */

#endif /* not def HAVE_TERMIO */
#endif /* not def HAVE_TERMIOS */

#endif /* _XEMACS_SYSTTY_H_ */
