/* Includes for memory limit warnings.
   Copyright (C) 1990, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.

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

/* #### This ancient code really sucks.
   configure should check for:
   HAVE_SYS_RESOURCE_H, HAVE_ULIMIT_H, HAVE_GETRLIMIT, HAVE_ULIMIT,
   and select action based on those values.
   getrlimit() should be preferred to ulimit().
   On Linux, ulimit() is deprecated and always returns -1. */

#ifndef INCLUDED_mem_limits_h_
#define INCLUDED_mem_limits_h_

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#ifdef HAVE_ULIMIT_H
#include <ulimit.h>
#endif

#ifdef MSDOS
#include <dpmi.h>
#endif

/* Some systems need this before <sys/resource.h>.  */
#include <sys/types.h>

#ifdef _LIBC

#include <sys/resource.h>
#define BSD4_2			/* Tell code below to use getrlimit.  */

/* Old Linux startup code won't define __data_start.  */
extern int etext, __data_start; weak_symbol (__data_start)
#define start_of_data()	(&__data_start ?: &etext)

#else /* not GNU libc */

#if defined (__osf__) && (defined (__mips) || defined (mips) || defined (__alpha))
#include <sys/time.h>
#include <sys/resource.h>
#endif

#if defined(__bsdi__) || defined(__NetBSD__) || defined(__linux__) || defined(__OpenBSD__)
#if defined(__linux__) && defined (powerpc)	/*Added by Fukui*/
#else					/*Added by Fukui*/
#define BSD4_2
#endif					/*Added by Fukui*/
#endif

#ifndef BSD4_2
#ifndef USG
#ifndef MSDOS
#ifndef WINDOWSNT
#ifndef __CYGWIN32__
#if defined(__linux__) && defined(powerpc)	/*Added Kaoru Fukui*/
#else						/*Added Kaoru Fukui*/
#include <sys/vlimit.h>
#endif				/*Added by Fukui*/
#endif /* not __CYGWIN32__ */
#endif /* not WINDOWSNT */
#endif /* not MSDOS */
#endif /* not USG */
#else /* if BSD4_2 */
#include <sys/time.h>
#include <sys/resource.h>
#endif /* BSD4_2 */

#ifdef emacs
/* The important properties of this type are that 1) it's a pointer, and
   2) arithmetic on it should work as if the size of the object pointed
   to has a size of 1.  */
#ifdef __STDC__
typedef void *POINTER;
#else
typedef char *POINTER;
#endif

#ifndef __CYGWIN32__
typedef unsigned long SIZE;
#endif

extern POINTER start_of_data (void);
#define EXCEEDS_LISP_PTR(ptr) 0

#ifdef BSD
#ifndef DATA_SEG_BITS
extern int etext;
#define start_of_data() &etext
#endif
#endif

#else  /* not emacs */
extern char etext;
#define start_of_data() &etext
#endif /* not emacs */

#endif /* not _LIBC */



/* start of data space; can be changed by calling malloc_init */
static POINTER data_space_start;

/* Number of bytes of writable memory we can expect to be able to get */
extern unsigned int lim_data;

#ifdef HEAP_IN_DATA
extern unsigned long static_heap_size;
extern int initialized;
static void
get_lim_data (void)
{
  if (!initialized)
    {
      lim_data = (unsigned int) -1; /* static_heap_size; */
    }
  else
    {
      lim_data = (unsigned int) -1;
    }
}
#else
#ifdef NO_LIM_DATA
static void
get_lim_data (void)
{
  lim_data = (unsigned int) -1;
}
#else /* not NO_LIM_DATA */

#ifdef USG

static void
get_lim_data (void)
{
  lim_data = (unsigned int) -1;

  /* Use the ulimit call, if we seem to have it.  */
#if !defined (ULIMIT_BREAK_VALUE) || defined (LINUX)
  lim_data = ulimit (3, 0);
#endif

  /* If that didn't work, just use the macro's value.  */
#ifdef ULIMIT_BREAK_VALUE
  if (lim_data == (unsigned int) -1)
    lim_data = ULIMIT_BREAK_VALUE;
#endif

  lim_data -= (long) data_space_start;
}

#else /* not USG */
#if defined( WINDOWSNT )

static void
get_lim_data (void)
{
  extern unsigned long data_region_size;
  lim_data = data_region_size;
}

#else
#if !defined (BSD4_2) && !defined (__osf__)

#ifdef MSDOS
void
get_lim_data (void)
{
  _go32_dpmi_meminfo info;

  _go32_dpmi_get_free_memory_information (&info);
  lim_data = info.available_memory;
}
#else /* not MSDOS */
static void
get_lim_data (void)
{
  lim_data = vlimit (LIM_DATA, -1);
}
#endif /* not MSDOS */

#else /* BSD4_2 */

static void
get_lim_data (void)
{
  struct rlimit XXrlimit;

  getrlimit (RLIMIT_DATA, &XXrlimit);
#ifdef RLIM_INFINITY
  lim_data = XXrlimit.rlim_cur & RLIM_INFINITY; /* soft limit */
#else
  lim_data = XXrlimit.rlim_cur;	/* soft limit */
#endif
}
#endif /* BSD4_2 */
#endif /* not WINDOWSNT */
#endif /* not USG */
#endif /* not NO_LIM_DATA */
#endif /* not HEAP_IN_DATA */

#endif /* INCLUDED_mem_limits_h_ */
