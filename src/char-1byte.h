/* Header for UCS-4 character representation.
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

#ifndef _XEMACS_CHAR_1BYTE_H
#define _XEMACS_CHAR_1BYTE_H

#define valid_char_p(ch) ((unsigned int) (ch) <= 0xff)


/************************************************************************/
/*                    Definition of leading bytes                       */
/************************************************************************/

typedef int Charset_ID;

#define MIN_LEADING_BYTE 0x80
#define LEADING_BYTE_ASCII 0x80
#define NUM_LEADING_BYTES 1


/************************************************************************/
/*            Information about a particular character set              */
/************************************************************************/

#define CHARSETP(cs) 1
#define CHARSET_BY_LEADING_BYTE(lb) Vcharset_ascii
#define XCHARSET_LEADING_BYTE(cs) LEADING_BYTE_ASCII
#define XCHARSET_GRAPHIC(cs) -1
#define XCHARSET_COLUMNS(cs) 1
#define XCHARSET_DIMENSION(cs) 1


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

#define CHAR_CHARSET(ch) Vcharset_ascii
#define CHAR_LEADING_BYTE(ch) LEADING_BYTE_ASCII

#define BREAKUP_CHAR(ch, charset, byte1, byte2) do {	\
  (charset) = Vcharset_ascii;				\
  (byte1) = (ch);					\
  (byte2) = 0;						\
} while (0)


/************************************************************************/
/*                            Exported functions                        */
/************************************************************************/

#define Vcharset_ascii Qnil

#endif /* _XEMACS_CHAR_1BYTE_H */
