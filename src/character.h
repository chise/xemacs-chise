/* Header for character representation.
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

#ifndef _XEMACS_CHARACTER_H
#define _XEMACS_CHARACTER_H

#if !defined(MULE) /* unibyte representation */
# include "char-1byte.h"
#elif !defined(CHAR_IS_UCS4) /* leading-byte representation */
# include "char-lb.h"
#else /* CHAR_IS_UCS4 */
# include "char-ucs.h"
#endif /* CHAR_IS_UCS4 */

/********************************/
/*                              */
/*   Interface for characters   */
/*                              */
/********************************/
/*
   valid_char_p (ch):
	Return whether the given Emchar is valid.

   CHARP (ch):
	Return whether the given Lisp_Object is a character.

   CHECK_CHAR_COERCE_INT (ch):
	Signal an error if CH is not a valid character or integer
	Lisp_Object.
	If CH is an integer Lisp_Object, convert it to a character
	Lisp_Object, but merely by repackaging, without performing
	tests for char validity.

Functions/macros when MULE is defined:

   CHAR_ASCII_P (ch):
        Return whether the given Emchar is ASCII.

   MAKE_CHAR (CHARSET, B1, B2):
	Return a character whose coded-charset is CHARSET and
	position-codes are B1 and B2.  1 byte character ignores B2.

   BREAKUP_CHAR (ch, charset, B1, B2):
	Break up the given Emchar, and store found coded-charset and
	position-codes to CHARSET, B1 and B2.

   CHAR_CHARSET (CH):
        Return coded-charset object of Emchar CH.

   CHAR_LEADING_BYTE (CH):
        Return Charset-ID of Emchar CH.
*/

#define CHAR_INTP(x) (INTP (x) && valid_char_p (XINT (x)))

#define CHAR_OR_CHAR_INTP(x) (CHARP (x) || CHAR_INTP (x))

#ifdef ERROR_CHECK_TYPECHECK

INLINE_HEADER Emchar XCHAR_OR_CHAR_INT (Lisp_Object obj);
INLINE_HEADER Emchar
XCHAR_OR_CHAR_INT (Lisp_Object obj)
{
  assert (CHAR_OR_CHAR_INTP (obj));
  return CHARP (obj) ? XCHAR (obj) : XINT (obj);
}

#else

#define XCHAR_OR_CHAR_INT(obj) (CHARP ((obj)) ? XCHAR ((obj)) : XINT ((obj)))

#endif

#define CHECK_CHAR_COERCE_INT(x) do {		\
  if (CHARP (x))				\
     ;						\
  else if (CHAR_INTP (x))			\
    x = make_char (XINT (x));			\
  else						\
    x = wrong_type_argument (Qcharacterp, x);	\
} while (0)

#endif /* _XEMACS_CHARACTER_H */
