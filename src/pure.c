/* This file is part of XEmacs.

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

/* Synched up with: FSF 19.30.  Split out of alloc.c. */

#include <config.h>
#include "lisp.h"
#include "puresize.h"

/* Moved from puresize.h to here so alloc.c does not get recompiled */

# include <puresize-adjust.h>
#define PURESIZE ((RAW_PURESIZE) + (PURESIZE_ADJUSTMENT))

size_t
get_PURESIZE (void)
{
  return PURESIZE;
}

/* Force linker to put it into data space! */
EMACS_INT pure[PURESIZE / sizeof (EMACS_INT)] = { (EMACS_INT) 0};
