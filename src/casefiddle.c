/* XEmacs case conversion functions.
   Copyright (C) 1985, 1992, 1993, 1994 Free Software Foundation, Inc.

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

/* Synched up with: FSF 19.34. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "commands.h"
#include "insdel.h"
#include "syntax.h"

enum case_action {CASE_UP, CASE_DOWN, CASE_CAPITALIZE, CASE_CAPITALIZE_UP};

static Lisp_Object
casify_object (enum case_action flag, Lisp_Object obj, Lisp_Object buffer)
{
  struct buffer *buf = decode_buffer (buffer, 0);
  REGISTER int inword = (flag == CASE_DOWN);
  struct Lisp_Char_Table *syntax_table = XCHAR_TABLE (buf->mirror_syntax_table);

  while (1)
    {
      if (CHAR_OR_CHAR_INTP (obj))
	{
	  Emchar c;
	  CHECK_CHAR_COERCE_INT (obj);
	  c = XCHAR (obj);
	  if (IN_TRT_TABLE_DOMAIN (c))
	    {
	      if (inword)
		obj = make_char (DOWNCASE (buf, c));
	      else if (!UPPERCASEP (buf, c))
		obj = make_char (UPCASE1 (buf, c));
	    }
	  return obj;
	}
      if (STRINGP (obj))
	{
	  Charcount i;
	  Charcount len = XSTRING_CHAR_LENGTH (obj);
	  obj = Fcopy_sequence (obj);
	  for (i = 0; i < len; i++)
	    {
	      Emchar c = string_char (XSTRING (obj), i);
	      if (inword && flag != CASE_CAPITALIZE_UP)
		c = DOWNCASE (buf, c);
	      else if (!UPPERCASEP (buf, c)
		       && (!inword || flag != CASE_CAPITALIZE_UP))
		c = UPCASE1 (buf, c);
	      set_string_char (XSTRING (obj), i, c);
	      if ((int) flag >= (int) CASE_CAPITALIZE)
		inword = WORD_SYNTAX_P (syntax_table, c);
	    }
	  return obj;
	}
      obj = wrong_type_argument (Qchar_or_string_p, obj);
    }
}

DEFUN ("upcase", Fupcase, 1, 2, 0, /*
Convert argument to upper case and return that.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.
See also `capitalize', `downcase' and `upcase-initials'.
Optional second arg BUFFER specifies which buffer's case tables to use,
 and defaults to the current buffer.
*/
       (obj, buffer))
{
  return casify_object (CASE_UP, obj, buffer);
}

DEFUN ("downcase", Fdowncase, 1, 2, 0, /*
Convert argument to lower case and return that.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.
Optional second arg BUFFER specifies which buffer's case tables to use,
 and defaults to the current buffer.
*/
       (obj, buffer))
{
  return casify_object (CASE_DOWN, obj, buffer);
}

DEFUN ("capitalize", Fcapitalize, 1, 2, 0, /*
Convert argument to capitalized form and return that.
This means that each word's first character is upper case
and the rest is lower case.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.
Optional second arg BUFFER specifies which buffer's case tables to use,
 and defaults to the current buffer.
*/
       (obj, buffer))
{
  return casify_object (CASE_CAPITALIZE, obj, buffer);
}

/* Like Fcapitalize but change only the initials.  */

DEFUN ("upcase-initials", Fupcase_initials, 1, 2, 0, /*
Convert the initial of each word in the argument to upper case.
Do not change the other letters of each word.
The argument may be a character or string.  The result has the same type.
The argument object is not altered--the value is a copy.
Optional second arg BUFFER specifies which buffer's case tables to use,
 and defaults to the current buffer.
*/
       (obj, buffer))
{
  return casify_object (CASE_CAPITALIZE_UP, obj, buffer);
}

/* flag is CASE_UP, CASE_DOWN or CASE_CAPITALIZE or CASE_CAPITALIZE_UP.
   b and e specify range of buffer to operate on. */

static void
casify_region_internal (enum case_action flag, Lisp_Object b, Lisp_Object e,
			struct buffer *buf)
{
  /* This function can GC */
  REGISTER Bufpos i;
  Bufpos start, end;
  REGISTER int inword = (flag == CASE_DOWN);
  struct Lisp_Char_Table *syntax_table = XCHAR_TABLE (buf->mirror_syntax_table);
  int mccount;

  if (EQ (b, e))
    /* Not modifying because nothing marked */
    return;

  get_buffer_range_char (buf, b, e, &start, &end, 0);

  mccount = begin_multiple_change (buf, start, end);
  record_change (buf, start, end - start);

  for (i = start; i < end; i++)
    {
      Emchar c = BUF_FETCH_CHAR (buf, i);
      Emchar oldc = c;

      if (inword && flag != CASE_CAPITALIZE_UP)
	c = DOWNCASE (buf, c);
      else if (!UPPERCASEP (buf, c)
	       && (!inword || flag != CASE_CAPITALIZE_UP))
	c = UPCASE1 (buf, c);

      if (oldc != c)
	{
	  buffer_replace_char (buf, i, c, 1, (i == start));
	  BUF_MODIFF (buf)++;
	}
      /* !!#### need to revalidate the start and end pointers in case
	 the buffer was changed */
      if ((int) flag >= (int) CASE_CAPITALIZE)
	inword = WORD_SYNTAX_P (syntax_table, c);
    }
  end_multiple_change (buf, mccount);
}

static Lisp_Object
casify_region (enum case_action flag, Lisp_Object b, Lisp_Object e,
	       Lisp_Object buffer)
{
  casify_region_internal (flag, b, e, decode_buffer (buffer, 1));
  return Qnil;
}

DEFUN ("upcase-region", Fupcase_region, 2, 3, "r", /*
Convert the region to upper case.  In programs, wants two arguments.
These arguments specify the starting and ending character numbers of
 the region to operate on.  When used as a command, the text between
 point and the mark is operated on.
See also `capitalize-region'.
Optional third arg BUFFER defaults to the current buffer.
*/
       (b, e, buffer))
{
  /* This function can GC */
  return casify_region (CASE_UP, b, e, buffer);
}

DEFUN ("downcase-region", Fdowncase_region, 2, 3, "r", /*
Convert the region to lower case.  In programs, wants two arguments.
These arguments specify the starting and ending character numbers of
 the region to operate on.  When used as a command, the text between
 point and the mark is operated on.
Optional third arg BUFFER defaults to the current buffer.
*/
       (b, e, buffer))
{
  /* This function can GC */
  return casify_region (CASE_DOWN, b, e, buffer);
}

DEFUN ("capitalize-region", Fcapitalize_region, 2, 3, "r", /*
Convert the region to capitalized form.
Capitalized form means each word's first character is upper case
 and the rest of it is lower case.
In programs, give two arguments, the starting and ending
 character positions to operate on.
Optional third arg BUFFER defaults to the current buffer.
*/
       (b, e, buffer))
{
  /* This function can GC */
  return casify_region (CASE_CAPITALIZE, b, e, buffer);
}

/* Like Fcapitalize_region but change only the initials.  */

DEFUN ("upcase-initials-region", Fupcase_initials_region, 2, 3, "r", /*
Upcase the initial of each word in the region.
Subsequent letters of each word are not changed.
In programs, give two arguments, the starting and ending
 character positions to operate on.
Optional third arg BUFFER defaults to the current buffer.
*/
       (b, e, buffer))
{
  return casify_region (CASE_CAPITALIZE_UP, b, e, buffer);
}


static Lisp_Object
casify_word (enum case_action flag, Lisp_Object arg, Lisp_Object buffer)
{
  Bufpos farend;
  struct buffer *buf = decode_buffer (buffer, 1);

  CHECK_INT (arg);

  farend = scan_words (buf, BUF_PT (buf), XINT (arg));
  if (!farend)
    farend = XINT (arg) > 0 ? BUF_ZV (buf) : BUF_BEGV (buf);

  casify_region_internal (flag, make_int (BUF_PT (buf)), make_int (farend), buf);
  BUF_SET_PT (buf, max (BUF_PT (buf), farend));
  return Qnil;
}

DEFUN ("upcase-word", Fupcase_word, 1, 2, "p", /*
Convert following word (or ARG words) to upper case, moving over.
With negative argument, convert previous words but do not move.
See also `capitalize-word'.
Optional second arg BUFFER defaults to the current buffer.
*/
       (arg, buffer))
{
  /* This function can GC */
  return casify_word (CASE_UP, arg, buffer);
}

DEFUN ("downcase-word", Fdowncase_word, 1, 2, "p", /*
Convert following word (or ARG words) to lower case, moving over.
With negative argument, convert previous words but do not move.
Optional second arg BUFFER defaults to the current buffer.
*/
       (arg, buffer))
{
  /* This function can GC */
  return casify_word (CASE_DOWN, arg, buffer);
}

DEFUN ("capitalize-word", Fcapitalize_word, 1, 2, "p", /*
Capitalize the following word (or ARG words), moving over.
This gives the word(s) a first character in upper case
 and the rest lower case.
With negative argument, capitalize previous words but do not move.
Optional second arg BUFFER defaults to the current buffer.
*/
       (arg, buffer))
{
  /* This function can GC */
  return casify_word (CASE_CAPITALIZE, arg, buffer);
}


void
syms_of_casefiddle (void)
{
  DEFSUBR (Fupcase);
  DEFSUBR (Fdowncase);
  DEFSUBR (Fcapitalize);
  DEFSUBR (Fupcase_initials);
  DEFSUBR (Fupcase_region);
  DEFSUBR (Fdowncase_region);
  DEFSUBR (Fcapitalize_region);
  DEFSUBR (Fupcase_initials_region);
  DEFSUBR (Fupcase_word);
  DEFSUBR (Fdowncase_word);
  DEFSUBR (Fcapitalize_word);
}
