/* XEmacs routines to deal with case tables.
   Copyright (C) 1987, 1992, 1993, 1994 Free Software Foundation, Inc.
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

 /* Synched up with: FSF 19.28.  Between FSF 19.28 and 19.30, casetab.c
   was rewritten to use junky FSF char tables.  Meanwhile I rewrote it
   to use more logical char tables.  RMS also discards the "list of four
   tables" format and instead stuffs the other tables as "extra slots"
   in the downcase table.  I've kept the four-lists format for now. */

/* Written by Howard Gayle.  See some mythical and not-in-the-Emacs-
   distribution file chartab.c for details. */

/* Modified for Mule by Ben Wing. */

/* #### We do not currently deal properly with translating non-ASCII
   (including Latin-1!) characters under Mule.  Getting this right is
   *hard*, way fucking hard.  So we at least preserve consistency by
   sanitizing all the case tables to remove translations that would
   get us into trouble and possibly result in inconsistent internal
   text, which would likely lead to crashes. */

#include <config.h>
#include "lisp.h"
#include "buffer.h"
#include "opaque.h"

Lisp_Object Qcase_tablep;
Lisp_Object Vascii_downcase_table, Vascii_upcase_table;
Lisp_Object Vascii_canon_table, Vascii_eqv_table;
#ifdef MULE
Lisp_Object Vmirror_ascii_downcase_table, Vmirror_ascii_upcase_table;
Lisp_Object Vmirror_ascii_canon_table, Vmirror_ascii_eqv_table;
#endif

static void compute_trt_inverse (Lisp_Object trt, Lisp_Object inverse);

#define STRING256_P(obj) (STRINGP (obj) && XSTRING_CHAR_LENGTH (obj) == 256)

DEFUN ("case-table-p", Fcase_table_p, 1, 1, 0, /*
Return t if ARG is a case table.
See `set-case-table' for more information on these data structures.
*/
       (table))
{
  Lisp_Object down, up, canon, eqv;
  if (!CONSP (table)) return Qnil; down  = XCAR (table); table = XCDR (table);
  if (!CONSP (table)) return Qnil; up    = XCAR (table); table = XCDR (table);
  if (!CONSP (table)) return Qnil; canon = XCAR (table); table = XCDR (table);
  if (!CONSP (table)) return Qnil; eqv   = XCAR (table);

  return (STRING256_P (down)
	  && (NILP (up) || STRING256_P (up))
	  && ((NILP (canon) && NILP (eqv))
	      || (STRING256_P (canon)
                  && (NILP (eqv) || STRING256_P (eqv))))
	  ? Qt : Qnil);
}

static Lisp_Object
check_case_table (Lisp_Object obj)
{
  REGISTER Lisp_Object tem;

  while (tem = Fcase_table_p (obj), NILP (tem))
    obj = wrong_type_argument (Qcase_tablep, obj);
  return (obj);
}

DEFUN ("current-case-table", Fcurrent_case_table, 0, 1, 0, /*
Return the case table of BUFFER, which defaults to the current buffer.
*/
       (buffer))
{
  struct buffer *buf = decode_buffer (buffer, 0);

  return list4 (buf->downcase_table,
		buf->upcase_table,
		buf->case_canon_table,
		buf->case_eqv_table);
}

DEFUN ("standard-case-table", Fstandard_case_table, 0, 0, 0, /*
Return the standard case table.
This is the one used for new buffers.
*/
       ())
{
  return list4 (Vascii_downcase_table,
		Vascii_upcase_table,
		Vascii_canon_table,
		Vascii_eqv_table);
}

static Lisp_Object set_case_table (Lisp_Object table, int standard);


DEFUN ("set-case-table", Fset_case_table, 1, 1, 0, /*
Select a new case table for the current buffer.
A case table is a list (DOWNCASE UPCASE CANONICALIZE EQUIVALENCES)
 where each element is either nil or a string of length 256.
DOWNCASE maps each character to its lower-case equivalent.
UPCASE maps each character to its upper-case equivalent;
 if lower and upper case characters are in 1-1 correspondence,
 you may use nil and the upcase table will be deduced from DOWNCASE.
CANONICALIZE maps each character to a canonical equivalent;
 any two characters that are related by case-conversion have the same
 canonical equivalent character; it may be nil, in which case it is
 deduced from DOWNCASE and UPCASE.
EQUIVALENCES is a map that cyclicly permutes each equivalence class
 (of characters with the same canonical equivalent); it may be nil,
 in which case it is deduced from CANONICALIZE.

BUG: Under XEmacs/Mule, translations to or from non-ASCII characters
 (this includes chars in the range 128 - 255) are ignored by
 the string/buffer-searching routines.  Thus, `case-fold-search'
 will not correctly conflate a-umlaut and A-umlaut even if the
 case tables call for this.
*/
       (table))
{
  return set_case_table (table, 0);
}

DEFUN ("set-standard-case-table", Fset_standard_case_table, 1, 1, 0, /*
Select a new standard case table for new buffers.
See `set-case-table' for more info on case tables.
*/
       (table))
{
  return set_case_table (table, 1);
}

#ifdef MULE

static Lisp_Object
make_mirror_trt_table (Lisp_Object table)
{
  Lisp_Object new_table;

  if (!STRING256_P (table))
    {
#ifdef DEBUG_XEMACS
      /* This should be caught farther up. */
      abort ();
#else
      signal_simple_error ("Invalid translate table", table);
#endif
    }

  new_table = MAKE_MIRROR_TRT_TABLE ();
  {
    int i;

    for (i = 0; i < 256; i++)
      {
	Emchar newval = string_char (XSTRING (table), i);
	if ((i >= 128 && newval != i)
	    || (i < 128 && newval >= 128))
	  {
	    newval = (Emchar) i;
	  }
	SET_MIRROR_TRT_TABLE_CHAR_1 (new_table, i, newval);
      }
  }
  return new_table;
}

#endif /* MULE */

static Lisp_Object
set_case_table (Lisp_Object table, int standard)
{
  Lisp_Object down, up, canon, eqv, tail = table;
  struct buffer *buf =
    standard ? XBUFFER(Vbuffer_defaults) : current_buffer;

  check_case_table (table);

  down  = XCAR (tail); tail = XCDR (tail);
  up    = XCAR (tail); tail = XCDR (tail);
  canon = XCAR (tail); tail = XCDR (tail);
  eqv   = XCAR (tail);

  if (NILP (up))
    {
      up = MAKE_TRT_TABLE ();
      compute_trt_inverse (down, up);
    }

  if (NILP (canon))
    {
      REGISTER Charcount i;

      canon = MAKE_TRT_TABLE ();

      /* Set up the CANON vector; for each character,
	 this sequence of upcasing and downcasing ought to
	 get the "preferred" lowercase equivalent.  */
      for (i = 0; i < 256; i++)
	SET_TRT_TABLE_CHAR_1 (canon, i,
			      TRT_TABLE_CHAR_1
			      (down,
			       TRT_TABLE_CHAR_1
			       (up,
				TRT_TABLE_CHAR_1 (down, i))));
    }

  if (NILP (eqv))
    {
      eqv = MAKE_TRT_TABLE ();

      compute_trt_inverse (canon, eqv);
    }

  if (standard)
    {
      Vascii_downcase_table = down;
      Vascii_upcase_table = up;
      Vascii_canon_table = canon;
      Vascii_eqv_table = eqv;
#ifdef MULE
      Vmirror_ascii_downcase_table = make_mirror_trt_table (down);
      Vmirror_ascii_upcase_table = make_mirror_trt_table (up);
      Vmirror_ascii_canon_table = make_mirror_trt_table (canon);
      Vmirror_ascii_eqv_table = make_mirror_trt_table (eqv);
#endif
    }
  buf->downcase_table = down;
  buf->upcase_table = up;
  buf->case_canon_table = canon;
  buf->case_eqv_table = eqv;
#ifdef MULE
  buf->mirror_downcase_table = make_mirror_trt_table (down);
  buf->mirror_upcase_table = make_mirror_trt_table (up);
  buf->mirror_case_canon_table = make_mirror_trt_table (canon);
  buf->mirror_case_eqv_table = make_mirror_trt_table (eqv);
#endif

  return table;
}

/* Given a translate table TRT, store the inverse mapping into INVERSE.
   Since TRT is not one-to-one, INVERSE is not a simple mapping.
   Instead, it divides the space of characters into equivalence classes.
   All characters in a given class form one circular list, chained through
   the elements of INVERSE.  */

static void
compute_trt_inverse (Lisp_Object trt, Lisp_Object inverse)
{
  Charcount i = 0400;
  Emchar c, q;

  while (--i)
    SET_TRT_TABLE_CHAR_1 (inverse, i, (Emchar) i);
  i = 0400;
  while (--i)
    {
      if ((q = TRT_TABLE_CHAR_1 (trt, i)) != (Emchar) i)
	{
	  c = TRT_TABLE_CHAR_1 (inverse, q);
	  SET_TRT_TABLE_CHAR_1 (inverse, q, (Emchar) i);
	  SET_TRT_TABLE_CHAR_1 (inverse, i, c);
	}
    }
}


void
syms_of_casetab (void)
{
  defsymbol (&Qcase_tablep, "case-table-p");

  DEFSUBR (Fcase_table_p);
  DEFSUBR (Fcurrent_case_table);
  DEFSUBR (Fstandard_case_table);
  DEFSUBR (Fset_case_table);
  DEFSUBR (Fset_standard_case_table);
}

void
complex_vars_of_casetab (void)
{
  REGISTER Emchar i;
  Lisp_Object tem;

  staticpro (&Vascii_downcase_table);
  staticpro (&Vascii_upcase_table);
  staticpro (&Vascii_canon_table);
  staticpro (&Vascii_eqv_table);

#ifdef MULE
  staticpro (&Vmirror_ascii_downcase_table);
  staticpro (&Vmirror_ascii_upcase_table);
  staticpro (&Vmirror_ascii_canon_table);
  staticpro (&Vmirror_ascii_eqv_table);
#endif

  tem = MAKE_TRT_TABLE ();
  Vascii_downcase_table = tem;
  Vascii_canon_table = tem;

  /* Under Mule, can't do set_string_char() until Vcharset_control_1
     and Vcharset_ascii are initialized. */
  for (i = 0; i < 256; i++)
    {
      unsigned char lowered = tolower (i);

      SET_TRT_TABLE_CHAR_1 (tem, i, lowered);
    }

#ifdef MULE
  tem = make_mirror_trt_table (tem);
  Vmirror_ascii_downcase_table = tem;
  Vmirror_ascii_canon_table = tem;
#endif

  tem = MAKE_TRT_TABLE ();
  Vascii_upcase_table = tem;
  Vascii_eqv_table = tem;

  for (i = 0; i < 256; i++)
    {
      unsigned char flipped = (isupper (i) ? tolower (i)
			       : (islower (i) ? toupper (i) : i));

      SET_TRT_TABLE_CHAR_1 (tem, i, flipped);
    }

#ifdef MULE
  tem = make_mirror_trt_table (tem);
  Vmirror_ascii_upcase_table = tem;
  Vmirror_ascii_eqv_table = tem;
#endif
}
