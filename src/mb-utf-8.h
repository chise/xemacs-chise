/* Header for UTF-8 buffer/string representation.
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

#ifndef _XEMACS_MB_UTF_8_H
#define _XEMACS_MB_UTF_8_H

/************************************************************************/
/*                     Operations on individual bytes                   */
/*                       in a Mule-formatted string                     */
/************************************************************************/

/* Does this byte represent the first byte of a character? */

INLINE int
BUFBYTE_FIRST_BYTE_P(Bufbyte c)
{
  return (c <= 0x7f) || (0xc0 <= c);
}

#endif /* _XEMACS_MB_UTF_8_H */
