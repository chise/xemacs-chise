/* Definition of PURESIZE.
   Copyright (C) 1986, 1988, 1992, 1993, 1994 Free Software Foundation, Inc.
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

/* Synched up with: Not in FSF. */

#ifndef PURESIZE_H
#define PURESIZE_H

/* If RAW_PURESIZE is already defined then the user overrode it at
   configure time. */
#ifndef RAW_PURESIZE

/* Basic amount of purespace to use, in the absence of extra
   things configured in. */


/* This computation is Barbra Streisand, BS
#if (LONGBITS == 64)
# define BASE_PURESIZE 938000
#else
# define BASE_PURESIZE 563000
#endif
*/

#define BASE_PURESIZE 1400000

/* If any particular systems need to change the base puresize, they
   should define SYSTEM_PURESIZE_EXTRA.  Note that this can be
   negative as well as positive.

   Do NOT define PURESIZE or any other values.  This allows the
   other values to shift while still keeping things in sync. */

#ifndef SYSTEM_PURESIZE_EXTRA
# define SYSTEM_PURESIZE_EXTRA 0
#endif

/* Extra amount of purespace needed for menubars. */

#ifdef HAVE_DIALOGS
# if (LONGBITS == 64)
#  define DIALOG_PURESIZE_EXTRA 43000
# else
#  define DIALOG_PURESIZE_EXTRA 1800
# endif
#else
# define DIALOG_PURESIZE_EXTRA 0
#endif

#ifdef HAVE_MENUBARS
# if (LONGBITS == 64)
#  define MENUBAR_PURESIZE_EXTRA 43000
# else
#  define MENUBAR_PURESIZE_EXTRA 36000
# endif
#else
# define MENUBAR_PURESIZE_EXTRA 0
#endif

#ifdef HAVE_SCROLLBARS
# if (LONGBITS == 64)
#  define SCROLLBAR_PURESIZE_EXTRA 4000
# else
#  define SCROLLBAR_PURESIZE_EXTRA 1800
# endif
#else
# define SCROLLBAR_PURESIZE_EXTRA 0
#endif

#ifdef HAVE_TOOLBARS
# if (LONGBITS == 64)
#  define TOOLBAR_PURESIZE_EXTRA 4000
# else
#  define TOOLBAR_PURESIZE_EXTRA 8400
# endif
#else
# define TOOLBAR_PURESIZE_EXTRA 0
#endif

/* Extra amount of purespace needed for X11, separate from menubars
   and scrollbars. */

#ifdef HAVE_X_WINDOWS
# if (LONGBITS == 64)
#  define X11_PURESIZE_EXTRA 95000
# else
#  define X11_PURESIZE_EXTRA 68000
# endif
#else
# define X11_PURESIZE_EXTRA 0
#endif

/* Extra amount of purespace needed for Mule. */

#ifdef MULE
#ifdef HAVE_CANNA
# define MULE_PURESIZE_CANNA 5000
#else
# define MULE_PURESIZE_CANNA 0
#endif
#ifdef HAVE_WNN
# define MULE_PURESIZE_WNN 5000
#else
# define MULE_PURESIZE_WNN 0
#endif
# if (LONGBITS == 64)
#  define MULE_PURESIZE_EXTRA 99000+MULE_PURESIZE_CANNA+MULE_PURESIZE_WNN
# else
#  define MULE_PURESIZE_EXTRA 78000+MULE_PURESIZE_CANNA+MULE_PURESIZE_WNN
# endif
#else
# define MULE_PURESIZE_EXTRA 0
#endif

/* Extra amount of purespace needed for Tooltalk. */

#ifdef TOOLTALK
# if (LONGBITS == 64)
#  define TOOLTALK_PURESIZE_EXTRA 100000
# else
#  define TOOLTALK_PURESIZE_EXTRA 8300
# endif
#else
# define TOOLTALK_PURESIZE_EXTRA 0
#endif

/* Extra amount of purespace needed for Sunpro builds. */

#ifdef SUNPRO
#define SUNPRO_PURESIZE_EXTRA 95000
#else
# define SUNPRO_PURESIZE_EXTRA 0
#endif

#define RAW_PURESIZE ((BASE_PURESIZE) +					\
		      (DIALOG_PURESIZE_EXTRA) +				\
		      (MENUBAR_PURESIZE_EXTRA) +			\
		      (SCROLLBAR_PURESIZE_EXTRA) +			\
		      (TOOLBAR_PURESIZE_EXTRA) +			\
		      (X11_PURESIZE_EXTRA) +				\
		      (SYSTEM_PURESIZE_EXTRA) +				\
		      (MULE_PURESIZE_EXTRA) +				\
		      (TOOLTALK_PURESIZE_EXTRA) +			\
		      (SUNPRO_PURESIZE_EXTRA))

#endif /* !RAW_PURESIZE */

size_t get_PURESIZE (void);
extern EMACS_INT pure[];

#endif /* PURESIZE_H */
