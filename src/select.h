/* Generic select data structures functions
   Copyright (C) 1999 Andy Piper

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

/* Synched up with: Not in FSF. */

#ifndef INCLUDED_select_h_
#define INCLUDED_select_h_

extern Lisp_Object QPRIMARY, QSECONDARY, QSTRING, QINTEGER, QCLIPBOARD, QTIMESTAMP,
  QTEXT, QDELETE, QMULTIPLE, QINCR, QEMACS_TMP, QTARGETS, QATOM, QNULL,
  QATOM_PAIR, QCOMPOUND_TEXT;

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
extern Lisp_Object Vselection_alist;

/* "Selection owner couldn't convert selection" */
extern Lisp_Object Qselection_conversion_error;

Lisp_Object get_local_selection (Lisp_Object selection_symbol, Lisp_Object target_type);
void handle_selection_clear (Lisp_Object selection_symbol);

#endif /* INCLUDED_select_h_ */
