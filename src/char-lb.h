/* Header for leading-byte character representation.
   Copyright (C) 1999 Electrotechnical Laboratory, JAPAN.
   Licensed to the Free Software Foundation.

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

/* Rewritten by MORIOKA Tomohiko <tomo@m17n.org>. */

#ifndef _XEMACS_CHAR_LB_H
#define _XEMACS_CHAR_LB_H

#include "mule-charset.h"

int non_ascii_valid_char_p (Emchar ch);

INLINE int valid_char_p (Emchar ch);
INLINE int
valid_char_p (Emchar ch)
{
  return ((unsigned int) (ch) <= 0xff) || non_ascii_valid_char_p (ch);
}

#endif /* _XEMACS_CHAR_LB_H */
