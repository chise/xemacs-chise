/* Support for Non-ASCII Path Name
   Copyright (C) 1985, 1986, 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.

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

/* Synched up with: Mule 2.3.  Not in FSF. */

/* This part cannot be surround with #ifdef emacs, because it is needed */
/* during generate xmakefile. */
#ifndef MCPATH
# define MCPATH
#endif /* !MCPATH */

/* not to confuse while compiling etc/*.c */
#ifdef emacs
#ifdef MCPATH
#  ifndef _MCPATH_H			/* enable to include twice */

#if 1

/* !!! This page is copied from dired.c except that DIRENTRY is
   changed to SYSTEM_DIRENTRY.  Don't modify this page. */

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>

/* The d_nameln member of a struct dirent includes the '\0' character
   on some systems, but not on others.  What's worse, you can't tell
   at compile-time which one it will be, since it really depends on
   the sort of system providing the filesystem you're reading from,
   not the system you are running on.  Paul Eggert
   <eggert@bi.twinsun.com> says this occurs when Emacs is running on a
   SunOS 4.1.2 host, reading a directory that is remote-mounted from a
   Solaris 2.1 host and is in a native Solaris 2.1 filesystem.

   Since applying strlen to the name always works, we'll just do that.  */
#define NAMLEN(p) strlen (p->d_name)

#ifdef SYSV_SYSTEM_DIR

#include <dirent.h>
#define SYSTEM_DIRENTRY struct dirent

#else /* not SYSV_SYSTEM_DIR */

#ifdef NONSYSTEM_DIR_LIBRARY
#include "ndir.h"
#else /* not NONSYSTEM_DIR_LIBRARY */
#ifdef MSDOS
#include <dirent.h>
#else
#include <sys/dir.h>
#endif
#endif /* not NONSYSTEM_DIR_LIBRARY */

#ifndef MSDOS
#define SYSTEM_DIRENTRY struct direct

extern DIR *opendir ();
extern struct direct *readdir ();

#endif /* not MSDOS */
#endif /* not SYSV_SYSTEM_DIR */
#endif

				/* maximum buffer size to do conversion. */
#define MCPATH_BUFSIZ(s) (((s) * 3) + 256)
#define MC_MAXPATHLEN MCPATH_BUFSIZ (MAXPATHLEN)

#define DIRENTRY struct mcpath_direntry
struct mcpath_direntry
{
				/* emacs 19.28 uses d_ino and d_name. */
#ifndef MSDOS
  int d_ino;
#endif /* not MSDOS */
  unsigned char d_name [MCPATH_BUFSIZ (MAXNAMLEN) + 1];
};
