/* Generic selection processing for XEmacs
   Copyright (C) 1999 Free Software Foundation, Inc.
   Copyright (C) 1999 Andy Piper.

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

/* Synched up with: Not synched with FSF. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "device.h"
#include "console.h"
#include "objects.h"

#include "frame.h"
#include "opaque.h"
#include "select.h"

Lisp_Object QPRIMARY, QSECONDARY, QSTRING, QINTEGER, QCLIPBOARD, QTIMESTAMP,
  QTEXT, QDELETE, QMULTIPLE, QINCR, QEMACS_TMP, QTARGETS, QATOM, QNULL,
  QATOM_PAIR, QCOMPOUND_TEXT;

/* "Selection owner couldn't convert selection" */
Lisp_Object Qselection_conversion_error;

/* This is an alist whose CARs are selection-types (whose names are the same
   as the names of X Atoms) and whose CDRs are the names of Lisp functions to
   call to convert the given Emacs selection value to a string representing
   the given selection type.  This is for elisp-level extension of the emacs
   selection handling.
 */
Lisp_Object Vselection_converter_alist;

Lisp_Object Vlost_selection_hooks;

/* This is an association list whose elements are of the form
     ( selection-name selection-value selection-timestamp )
   selection-name is a lisp symbol, whose name is the name of an X Atom.
   selection-value is the value that emacs owns for that selection.
     It may be any kind of Lisp object.
   selection-timestamp is the time at which emacs began owning this selection,
     as a cons of two 16-bit numbers (making a 32 bit time).
   If there is an entry in this alist, then it can be assumed that emacs owns
    that selection.
   The only (eq) parts of this list that are visible from elisp are the
    selection-values.
 */
Lisp_Object Vselection_alist;

static Lisp_Object
clean_local_selection_data (Lisp_Object obj)
{
  if (CONSP (obj) &&
      INTP (XCAR (obj)) &&
      CONSP (XCDR (obj)) &&
      INTP (XCAR (XCDR (obj))) &&
      NILP (XCDR (XCDR (obj))))
    obj = Fcons (XCAR (obj), XCDR (obj));

  if (CONSP (obj) &&
      INTP (XCAR (obj)) &&
      INTP (XCDR (obj)))
    {
      if (XINT (XCAR (obj)) == 0)
	return XCDR (obj);
      if (XINT (XCAR (obj)) == -1)
	return make_int (- XINT (XCDR (obj)));
    }
  if (VECTORP (obj))
    {
      int i;
      int len = XVECTOR_LENGTH (obj);
      Lisp_Object copy;
      if (len == 1)
	return clean_local_selection_data (XVECTOR_DATA (obj) [0]);
      copy = make_vector (len, Qnil);
      for (i = 0; i < len; i++)
	XVECTOR_DATA (copy) [i] =
	  clean_local_selection_data (XVECTOR_DATA (obj) [i]);
      return copy;
    }
  return obj;
}

/* Given a selection-name and desired type, this looks up our local copy of
   the selection value and converts it to the type.  It returns nil or a
   string.  This calls random elisp code, and may signal or gc.
 */
Lisp_Object
get_local_selection (Lisp_Object selection_symbol, Lisp_Object target_type)
{
  /* This function can GC */
  Lisp_Object handler_fn, value, check;
  Lisp_Object local_value = assq_no_quit (selection_symbol, Vselection_alist);

  if (NILP (local_value)) return Qnil;

  /* TIMESTAMP and MULTIPLE are special cases 'cause that's easiest. */
  if (EQ (target_type, QTIMESTAMP))
    {
      handler_fn = Qnil;
      value = XCAR (XCDR (XCDR (local_value)));
    }

#if 0 /* #### MULTIPLE doesn't work yet and probably never will */
  else if (CONSP (target_type) &&
	   XCAR (target_type) == QMULTIPLE)
    {
      Lisp_Object pairs = XCDR (target_type);
      int len = XVECTOR_LENGTH (pairs);
      int i;
      /* If the target is MULTIPLE, then target_type looks like
	  (MULTIPLE . [[SELECTION1 TARGET1] [SELECTION2 TARGET2] ... ])
	 We modify the second element of each pair in the vector and
	 return it as [[SELECTION1 <value1>] [SELECTION2 <value2>] ... ]
       */
      for (i = 0; i < len; i++)
	{
	  Lisp_Object pair = XVECTOR_DATA (pairs) [i];
	  XVECTOR_DATA (pair) [1] =
	    x_get_local_selection (XVECTOR_DATA (pair) [0],
				   XVECTOR_DATA (pair) [1]);
	}
      return pairs;
    }
#endif
  else
    {
      CHECK_SYMBOL (target_type);
      handler_fn = Fcdr (Fassq (target_type, Vselection_converter_alist));
      if (NILP (handler_fn)) return Qnil;
      value = call3 (handler_fn,
		     selection_symbol, target_type,
		     XCAR (XCDR (local_value)));
    }

  /* This lets the selection function to return (TYPE . VALUE).  For example,
     when the selected type is LINE_NUMBER, the returned type is SPAN, not
     INTEGER.
   */
  check = value;
  if (CONSP (value) && SYMBOLP (XCAR (value)))
    check = XCDR (value);

  /* Strings, vectors, and symbols are converted to selection data format in
     the obvious way.  Integers are converted to 16 bit quantities if they're
     small enough, otherwise 32 bits are used.
   */
  if (STRINGP (check) ||
      VECTORP (check) ||
      SYMBOLP (check) ||
      INTP    (check) ||
      CHARP   (check) ||
      NILP (value))
    return value;

  /* (N . M) or (N M) get turned into a 32 bit quantity.  So if you want to
     always return a small quantity as 32 bits, your converter routine needs
     to return a cons.
   */
  else if (CONSP (check) &&
	   INTP (XCAR (check)) &&
	   (INTP (XCDR (check)) ||
	    (CONSP (XCDR (check)) &&
	     INTP (XCAR (XCDR (check))) &&
	     NILP (XCDR (XCDR (check))))))
    return value;
  /* Otherwise the lisp converter function returned something unrecognized.
   */
  else
    signal_error (Qerror,
                  list3 (build_string
			 ("unrecognized selection-conversion type"),
                         handler_fn,
                         value));

  return Qnil;	/* suppress compiler warning */
}

DEFUN ("own-selection-internal", Fown_selection_internal, 2, 3, 0, /*
Assert a selection of the given TYPE with the given VALUE.
TYPE is a symbol, typically PRIMARY, SECONDARY, or CLIPBOARD.
VALUE is typically a string, or a cons of two markers, but may be
anything that the functions on selection-converter-alist know about.
*/
       (selection_name, selection_value, device))
{
  Lisp_Object selection_time, selection_data, prev_value;

  CHECK_SYMBOL (selection_name);
  if (NILP (selection_value)) error ("selection-value may not be nil.");

  if (NILP (device))
    device = Fselected_device (Qnil);

  /* Now update the local cache */
  selection_data = list3 (selection_name,
			  selection_value,
			  Qnil);
  prev_value = assq_no_quit (selection_name, Vselection_alist);
  Vselection_alist = Fcons (selection_data, Vselection_alist);
    
  /* If we already owned the selection, remove the old selection data.
     Perhaps we should destructively modify it instead.
     Don't use Fdelq() as that may QUIT;.
  */
  if (!NILP (prev_value))
    {
      Lisp_Object rest;	/* we know it's not the CAR, so it's easy. */
      for (rest = Vselection_alist; !NILP (rest); rest = Fcdr (rest))
	if (EQ (prev_value, Fcar (XCDR (rest))))
	  {
	    XCDR (rest) = Fcdr (XCDR (rest));
	    break;
	  }
    }

  /* have to do device specific stuff last so that methods can access the 
     selection_alist */
  if (HAS_DEVMETH_P (XDEVICE (device), own_selection))
    selection_time = DEVMETH (XDEVICE (device), own_selection,
			      (selection_name, selection_value));
  else
    selection_time = Qnil;

  Fsetcar (XCDR (XCDR (selection_data)), selection_time);

  return selection_value;
}

/* remove a selection from our local copy
 */
void
handle_selection_clear (Lisp_Object selection_symbol)
{
  Lisp_Object local_selection_data = assq_no_quit (selection_symbol, Vselection_alist);

  /* Well, we already believe that we don't own it, so that's just fine. */
  if (NILP (local_selection_data)) return;

  /* Otherwise, we're really honest and truly being told to drop it.
     Don't use Fdelq() as that may QUIT;.
   */
  if (EQ (local_selection_data, Fcar (Vselection_alist)))
    Vselection_alist = Fcdr (Vselection_alist);
  else
    {
      Lisp_Object rest;
      for (rest = Vselection_alist; !NILP (rest); rest = Fcdr (rest))
	if (EQ (local_selection_data, Fcar (XCDR (rest))))
	  {
	    XCDR (rest) = Fcdr (XCDR (rest));
	    break;
	  }
    }

  /* Let random lisp code notice that the selection has been stolen.
   */
  {
    Lisp_Object rest;
    Lisp_Object val = Vlost_selection_hooks;
    if (!UNBOUNDP (val) && !NILP (val))
      {
	if (CONSP (val) && !EQ (XCAR (val), Qlambda))
	  for (rest = val; !NILP (rest); rest = Fcdr (rest))
	    call1 (Fcar (rest), selection_symbol);
	else
	  call1 (val, selection_symbol);
      }
  }
}

DEFUN ("disown-selection-internal", Fdisown_selection_internal, 1, 3, 0, /*
If we own the named selection, then disown it (make there be no selection).
*/
       (selection_name, selection_time, device))
{
  if (NILP (assq_no_quit (selection_name, Vselection_alist)))
    return Qnil;  /* Don't disown the selection when we're not the owner. */

  if (NILP (device))
    device = Fselected_device (Qnil);

  MAYBE_DEVMETH (XDEVICE (device), disown_selection,
		 (selection_name, selection_time));
  
  handle_selection_clear (selection_name);

  return Qt;
}

DEFUN ("selection-owner-p", Fselection_owner_p, 0, 1, 0, /*
Return t if current emacs process owns the given Selection.
The arg should be the name of the selection in question, typically one of
the symbols PRIMARY, SECONDARY, or CLIPBOARD.  (For convenience, the symbol
nil is the same as PRIMARY, and t is the same as SECONDARY.)
*/
       (selection))
{
  CHECK_SYMBOL (selection);
  if      (EQ (selection, Qnil)) selection = QPRIMARY;
  else if (EQ (selection, Qt))   selection = QSECONDARY;

  return NILP (Fassq (selection, Vselection_alist)) ? Qnil : Qt;
}

DEFUN ("selection-exists-p", Fselection_exists_p, 0, 2, 0, /*
Whether there is an owner for the given Selection.
The arg should be the name of the selection in question, typically one of
the symbols PRIMARY, SECONDARY, or CLIPBOARD.  (For convenience, the symbol
nil is the same as PRIMARY, and t is the same as SECONDARY.)
*/
       (selection, device))
{
  CHECK_SYMBOL (selection);
  if (!NILP (Fselection_owner_p (selection)))
    return Qt;

  if (NILP (device))
    device = Fselected_device (Qnil);

  return HAS_DEVMETH_P (XDEVICE (device), selection_exists_p) ?
    DEVMETH (XDEVICE (device), selection_exists_p, (selection))
    : Qnil;
}

/* Request the selection value from the owner.  If we are the owner,
   simply return our selection value.  If we are not the owner, this
   will block until all of the data has arrived.
 */
DEFUN ("get-selection-internal", Fget_selection_internal, 2, 3, 0, /*
Return text selected from some window-system window.
SELECTION_SYMBOL is a symbol, typically PRIMARY, SECONDARY, or CLIPBOARD.
TARGET_TYPE is the type of data desired, typically STRING or COMPOUND_TEXT.
Under Mule, if the resultant data comes back as 8-bit data in type
TEXT or COMPOUND_TEXT, it will be decoded as Compound Text.
*/
       (selection_symbol, target_type, device))
{
  /* This function can GC */
  Lisp_Object val = Qnil;
  struct gcpro gcpro1, gcpro2;
  GCPRO2 (target_type, val); /* we store newly consed data into these */
  CHECK_SYMBOL (selection_symbol);

  if (NILP (device))
    device = Fselected_device (Qnil);

#if 0 /* #### MULTIPLE doesn't work yet and probably never will */
  if (CONSP (target_type) &&
      XCAR (target_type) == QMULTIPLE)
    {
      CHECK_VECTOR (XCDR (target_type));
      /* So we don't destructively modify this... */
      target_type = copy_multiple_data (target_type);
    }
  else
#endif
    CHECK_SYMBOL (target_type);

  val = get_local_selection (selection_symbol, target_type);

  if (NILP (val) && (HAS_DEVMETH_P (XDEVICE (device), get_foreign_selection)))
    {
      val = DEVMETH (XDEVICE (device), get_foreign_selection,
		     (selection_symbol, target_type));
    }
  else
    {
      if (CONSP (val) && SYMBOLP (XCAR (val)))
	{
	  val = XCDR (val);
	  if (CONSP (val) && NILP (XCDR (val)))
	    val = XCAR (val);
	}
      val = clean_local_selection_data (val);
    }
  UNGCPRO;
  return val;
}

void
syms_of_select (void)
{
  DEFSUBR (Fown_selection_internal);
  DEFSUBR (Fget_selection_internal);
  DEFSUBR (Fselection_exists_p);
  DEFSUBR (Fdisown_selection_internal);
  DEFSUBR (Fselection_owner_p);

  defsymbol (&QPRIMARY, "PRIMARY");
  defsymbol (&QSECONDARY, "SECONDARY");
  defsymbol (&QSTRING, "STRING");
  defsymbol (&QINTEGER, "INTEGER");
  defsymbol (&QCLIPBOARD, "CLIPBOARD");
  defsymbol (&QTIMESTAMP, "TIMESTAMP");
  defsymbol (&QTEXT, "TEXT");
  defsymbol (&QDELETE, "DELETE");
  defsymbol (&QMULTIPLE, "MULTIPLE");
  defsymbol (&QINCR, "INCR");
  defsymbol (&QEMACS_TMP, "_EMACS_TMP_");
  defsymbol (&QTARGETS, "TARGETS");
  defsymbol (&QATOM, "ATOM");
  defsymbol (&QATOM_PAIR, "ATOM_PAIR");
  defsymbol (&QCOMPOUND_TEXT, "COMPOUND_TEXT");
  defsymbol (&QNULL, "NULL");

  deferror (&Qselection_conversion_error,
	    "selection-conversion-error",
	    "selection-conversion error", Qio_error);
}

void
vars_of_select (void)
{
  Vselection_alist = Qnil;
  staticpro (&Vselection_alist);

  DEFVAR_LISP ("selection-converter-alist", &Vselection_converter_alist /*
An alist associating selection-types (such as STRING and TIMESTAMP) with
functions.  These functions will be called with three args: the name
of the selection (typically PRIMARY, SECONDARY, or CLIPBOARD); a
desired type to which the selection should be converted; and the local
selection value (whatever had been passed to `own-selection').  For
historical reasons these functions should return the value to send to
an X server, which should be one of:

-- nil (the conversion could not be done)
-- a cons of a symbol and any of the following values; the symbol
   explicitly specifies the type that will be sent.
-- a string (If the type is not specified, then if Mule support exists,
             the string will be converted to Compound Text and sent in
             the 'COMPOUND_TEXT format; otherwise (no Mule support),
             the string will be left as-is and sent in the 'STRING
             format.  If the type is specified, the string will be
             left as-is (or converted to binary format under Mule).
             In all cases, 8-bit data it sent.)
-- a character (With Mule support, will be converted to Compound Text
                whether or not a type is specified.  If a type is not
                specified, a type of 'STRING or 'COMPOUND_TEXT will be
		sent, as for strings.)
-- the symbol 'NULL (Indicates that there is no meaningful return value.
                     Empty 32-bit data with a type of 'NULL will be sent.)
-- a symbol (Will be converted into an atom.  If the type is not specified,
             a type of 'ATOM will be sent.)
-- an integer (Will be converted into a 16-bit or 32-bit integer depending
               on the value.  If the type is not specified, a type of
	       'INTEGER will be sent.)
-- a cons (HIGH . LOW) of integers (Will be converted into a 32-bit integer.
                                    If the type is not specified, a type of
				    'INTEGER will be sent.)
-- a vector of symbols (Will be converted into a list of atoms.  If the type
                        is not specified, a type of 'ATOM will be sent.)
-- a vector of integers (Will be converted into a list of 16-bit integers.
                         If the type is not specified, a type of 'INTEGER
			 will be sent.)
-- a vector of integers and/or conses (HIGH . LOW) of integers
                        (Will be converted into a list of 16-bit integers.
                         If the type is not specified, a type of 'INTEGER
			 will be sent.)  */ );
  Vselection_converter_alist = Qnil;

  DEFVAR_LISP ("lost-selection-hooks", &Vlost_selection_hooks /*
A function or functions to be called after we have been notified
that we have lost the selection.  The function(s) will be called with one
argument, a symbol naming the selection (typically PRIMARY, SECONDARY, or
CLIPBOARD).
*/ );
  Vlost_selection_hooks = Qunbound;
}

