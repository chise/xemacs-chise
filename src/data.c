/* Primitive operations on Lisp data types for XEmacs Lisp interpreter.
   Copyright (C) 1985, 1986, 1988, 1992, 1993, 1994, 1995
   Free Software Foundation, Inc.

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

/* Synched up with: Mule 2.0, FSF 19.30.  Some of FSF's data.c is in
   XEmacs' symbols.c. */

/* This file has been Mule-ized. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "bytecode.h"
#include "syssignal.h"

#ifdef LISP_FLOAT_TYPE
/* Need to define a differentiating symbol -- see sysfloat.h */
# define THIS_FILENAME data_c
# include "sysfloat.h"
#endif /* LISP_FLOAT_TYPE */

Lisp_Object Qnil, Qt, Qquote, Qlambda, Qunbound;
Lisp_Object Qerror_conditions, Qerror_message;
Lisp_Object Qerror, Qquit, Qwrong_type_argument, Qargs_out_of_range;
Lisp_Object Qvoid_variable, Qcyclic_variable_indirection;
Lisp_Object Qvoid_function, Qcyclic_function_indirection;
Lisp_Object Qsetting_constant, Qinvalid_read_syntax;
Lisp_Object Qmalformed_list, Qmalformed_property_list;
Lisp_Object Qcircular_list, Qcircular_property_list;
Lisp_Object Qinvalid_function, Qwrong_number_of_arguments, Qno_catch;
Lisp_Object Qio_error, Qend_of_file;
Lisp_Object Qarith_error, Qrange_error, Qdomain_error;
Lisp_Object Qsingularity_error, Qoverflow_error, Qunderflow_error;
Lisp_Object Qbeginning_of_buffer, Qend_of_buffer, Qbuffer_read_only;
Lisp_Object Qintegerp, Qnatnump, Qsymbolp, Qkeywordp;
Lisp_Object Qlistp, Qtrue_list_p, Qweak_listp;
Lisp_Object Qconsp, Qsubrp, Qcompiled_functionp;
Lisp_Object Qcharacterp, Qstringp, Qarrayp, Qsequencep, Qvectorp;
Lisp_Object Qchar_or_string_p, Qmarkerp, Qinteger_or_marker_p, Qbufferp;
Lisp_Object Qinteger_or_char_p, Qinteger_char_or_marker_p;
Lisp_Object Qnumberp, Qnumber_or_marker_p, Qnumber_char_or_marker_p;
Lisp_Object Qbit_vectorp, Qbitp, Qcons, Qkeyword, Qcdr, Qignore;

#ifdef LISP_FLOAT_TYPE
Lisp_Object Qfloatp;
#endif

#ifdef DEBUG_XEMACS

int debug_issue_ebola_notices;

int debug_ebola_backtrace_length;

#if 0
/*#ifndef LRECORD_SYMBOL*/
#include "backtrace.h"
#endif

int
eq_with_ebola_notice (Lisp_Object obj1, Lisp_Object obj2)
{
  if (((CHARP (obj1) && INTP (obj2)) || (CHARP (obj2) && INTP (obj1)))
      && (debug_issue_ebola_notices >= 2
	  || XCHAR_OR_INT (obj1) == XCHAR_OR_INT (obj2)))
    {
      stderr_out("Comparison between integer and character is constant nil (");
      Fprinc (obj1, Qexternal_debugging_output);
      stderr_out (" and ");
      Fprinc (obj2, Qexternal_debugging_output);
      stderr_out (")\n");
      debug_short_backtrace (debug_ebola_backtrace_length);
    }
  return EQ (obj1, obj2);
}

#endif /* DEBUG_XEMACS */



Lisp_Object
wrong_type_argument (Lisp_Object predicate, Lisp_Object value)
{
  /* This function can GC */
  REGISTER Lisp_Object tem;
  do
    {
      value = Fsignal (Qwrong_type_argument, list2 (predicate, value));
      tem = call1 (predicate, value);
    }
  while (NILP (tem));
  return value;
}

DOESNT_RETURN
dead_wrong_type_argument (Lisp_Object predicate, Lisp_Object value)
{
  signal_error (Qwrong_type_argument, list2 (predicate, value));
}

DEFUN ("wrong-type-argument", Fwrong_type_argument, 2, 2, 0, /*
Signal an error until the correct type value is given by the user.
This function loops, signalling a continuable `wrong-type-argument' error
with PREDICATE and VALUE as the data associated with the error and then
calling PREDICATE on the returned value, until the value gotten satisfies
PREDICATE.  At that point, the gotten value is returned.
*/
       (predicate, value))
{
  return wrong_type_argument (predicate, value);
}

DOESNT_RETURN
pure_write_error (Lisp_Object obj)
{
  signal_simple_error ("Attempt to modify read-only object", obj);
}

DOESNT_RETURN
args_out_of_range (Lisp_Object a1, Lisp_Object a2)
{
  signal_error (Qargs_out_of_range, list2 (a1, a2));
}

DOESNT_RETURN
args_out_of_range_3 (Lisp_Object a1, Lisp_Object a2, Lisp_Object a3)
{
  signal_error (Qargs_out_of_range, list3 (a1, a2, a3));
}

void
check_int_range (int val, int min, int max)
{
  if (val < min || val > max)
    args_out_of_range_3 (make_int (val), make_int (min), make_int (max));
}

/* On some machines, XINT needs a temporary location.
   Here it is, in case it is needed.  */

EMACS_INT sign_extend_temp;

/* On a few machines, XINT can only be done by calling this.  */
/* XEmacs:  only used by m/convex.h */
int sign_extend_lisp_int (EMACS_INT num);
int
sign_extend_lisp_int (EMACS_INT num)
{
  if (num & (1L << (VALBITS - 1)))
    return num | ((-1L) << VALBITS);
  else
    return num & ((1L << VALBITS) - 1);
}


/* Data type predicates */

DEFUN ("eq", Feq, 2, 2, 0, /*
Return t if the two args are the same Lisp object.
*/
       (obj1, obj2))
{
  return EQ_WITH_EBOLA_NOTICE (obj1, obj2) ? Qt : Qnil;
}

DEFUN ("old-eq", Fold_eq, 2, 2, 0, /*
Return t if the two args are (in most cases) the same Lisp object.

Special kludge: A character is considered `old-eq' to its equivalent integer
even though they are not the same object and are in fact of different
types.  This is ABSOLUTELY AND UTTERLY HORRENDOUS but is necessary to
preserve byte-code compatibility with v19.  This kludge is known as the
\"char-int confoundance disease\" and appears in a number of other
functions with `old-foo' equivalents.

Do not use this function!
*/
       (obj1, obj2))
{
  /* #### blasphemy */
  return HACKEQ_UNSAFE (obj1, obj2) ? Qt : Qnil;
}

DEFUN ("null", Fnull, 1, 1, 0, /*
Return t if OBJECT is nil.
*/
       (object))
{
  return NILP (object) ? Qt : Qnil;
}

DEFUN ("consp", Fconsp, 1, 1, 0, /*
Return t if OBJECT is a cons cell.
*/
       (object))
{
  return CONSP (object) ? Qt : Qnil;
}

DEFUN ("atom", Fatom, 1, 1, 0, /*
Return t if OBJECT is not a cons cell.  Atoms include nil.
*/
       (object))
{
  return CONSP (object) ? Qnil : Qt;
}

DEFUN ("listp", Flistp, 1, 1, 0, /*
Return t if OBJECT is a list.  Lists includes nil.
*/
       (object))
{
  return LISTP (object) ? Qt : Qnil;
}

DEFUN ("nlistp", Fnlistp, 1, 1, 0, /*
Return t if OBJECT is not a list.  Lists include nil.
*/
       (object))
{
  return LISTP (object) ? Qnil : Qt;
}

DEFUN ("true-list-p", Ftrue_list_p, 1, 1, 0, /*
Return t if OBJECT is a non-dotted, i.e. nil-terminated, list.
*/
       (object))
{
  return TRUE_LIST_P (object) ? Qt : Qnil;
}

DEFUN ("symbolp", Fsymbolp, 1, 1, 0, /*
Return t if OBJECT is a symbol.
*/
       (object))
{
  return SYMBOLP (object) ? Qt : Qnil;
}

DEFUN ("keywordp", Fkeywordp, 1, 1, 0, /*
Return t if OBJECT is a keyword.
*/
       (object))
{
  return KEYWORDP (object) ? Qt : Qnil;
}

DEFUN ("vectorp", Fvectorp, 1, 1, 0, /*
REturn t if OBJECT is a vector.
*/
       (object))
{
  return VECTORP (object) ? Qt : Qnil;
}

DEFUN ("bit-vector-p", Fbit_vector_p, 1, 1, 0, /*
Return t if OBJECT is a bit vector.
*/
       (object))
{
  return BIT_VECTORP (object) ? Qt : Qnil;
}

DEFUN ("stringp", Fstringp, 1, 1, 0, /*
Return t if OBJECT is a string.
*/
       (object))
{
  return STRINGP (object) ? Qt : Qnil;
}

DEFUN ("arrayp", Farrayp, 1, 1, 0, /*
Return t if OBJECT is an array (string, vector, or bit vector).
*/
       (object))
{
  return (VECTORP	(object) ||
	  STRINGP	(object) ||
	  BIT_VECTORP	(object))
    ? Qt : Qnil;
}

DEFUN ("sequencep", Fsequencep, 1, 1, 0, /*
Return t if OBJECT is a sequence (list or array).
*/
       (object))
{
  return (CONSP		(object) ||
	  NILP		(object) ||
	  VECTORP	(object) ||
	  STRINGP	(object) ||
	  BIT_VECTORP	(object))
    ? Qt : Qnil;
}

DEFUN ("markerp", Fmarkerp, 1, 1, 0, /*
Return t if OBJECT is a marker (editor pointer).
*/
       (object))
{
  return MARKERP (object) ? Qt : Qnil;
}

DEFUN ("subrp", Fsubrp, 1, 1, 0, /*
Return t if OBJECT is a built-in function.
*/
       (object))
{
  return SUBRP (object) ? Qt : Qnil;
}

DEFUN ("subr-min-args", Fsubr_min_args, 1, 1, 0, /*
Return minimum number of args built-in function SUBR may be called with.
*/
       (subr))
{
  CHECK_SUBR (subr);
  return make_int (XSUBR (subr)->min_args);
}

DEFUN ("subr-max-args", Fsubr_max_args, 1, 1, 0, /*
Return maximum number of args built-in function SUBR may be called with,
or nil if it takes an arbitrary number of arguments or is a special form.
*/
       (subr))
{
  int nargs;
  CHECK_SUBR (subr);
  nargs = XSUBR (subr)->max_args;
  if (nargs == MANY || nargs == UNEVALLED)
    return Qnil;
  else
    return make_int (nargs);
}

DEFUN ("subr-interactive", Fsubr_interactive, 1, 1, 0, /*
Return the interactive spec of the subr object, or nil.
If non-nil, the return value will be a list whose first element is
`interactive' and whose second element is the interactive spec.
*/
       (subr))
{
  CONST char *prompt;
  CHECK_SUBR (subr);
  prompt = XSUBR (subr)->prompt;
  return prompt ? list2 (Qinteractive, build_string (prompt)) : Qnil;
}

DEFUN ("compiled-function-p", Fcompiled_function_p, 1, 1, 0, /*
Return t if OBJECT is a byte-compiled function object.
*/
       (object))
{
  return COMPILED_FUNCTIONP (object) ? Qt : Qnil;
}


DEFUN ("characterp", Fcharacterp, 1, 1, 0, /*
Return t if OBJECT is a character.
Unlike in XEmacs v19 and FSF Emacs, a character is its own primitive type.
Any character can be converted into an equivalent integer using
`char-int'.  To convert the other way, use `int-char'; however,
only some integers can be converted into characters.  Such an integer
is called a `char-int'; see `char-int-p'.

Some functions that work on integers (e.g. the comparison functions
<, <=, =, /=, etc. and the arithmetic functions +, -, *, etc.)
accept characters and implicitly convert them into integers.  In
general, functions that work on characters also accept char-ints and
implicitly convert them into characters.  WARNING: Neither of these
behaviors is very desirable, and they are maintained for backward
compatibility with old E-Lisp programs that confounded characters and
integers willy-nilly.  These behaviors may change in the future; therefore,
do not rely on them.  Instead, use the character-specific functions such
as `char='.
*/
       (object))
{
  return CHARP (object) ? Qt : Qnil;
}

DEFUN ("char-to-int", Fchar_to_int, 1, 1, 0, /*
Convert a character into an equivalent integer.
The resulting integer will always be non-negative.  The integers in
the range 0 - 255 map to characters as follows:

0 - 31		Control set 0
32 - 127	ASCII
128 - 159	Control set 1
160 - 255	Right half of ISO-8859-1

If support for Mule does not exist, these are the only valid character
values.  When Mule support exists, the values assigned to other characters
may vary depending on the particular version of XEmacs, the order in which
character sets were loaded, etc., and you should not depend on them.
*/
       (ch))
{
  CHECK_CHAR (ch);
  return make_int (XCHAR (ch));
}

DEFUN ("int-to-char", Fint_to_char, 1, 1, 0, /*
Convert an integer into the equivalent character.
Not all integers correspond to valid characters; use `char-int-p' to
determine whether this is the case.  If the integer cannot be converted,
nil is returned.
*/
       (integer))
{
  CHECK_INT (integer);
  if (CHAR_INTP (integer))
    return make_char (XINT (integer));
  else
    return Qnil;
}

DEFUN ("char-int-p", Fchar_int_p, 1, 1, 0, /*
Return t if OBJECT is an integer that can be converted into a character.
See `char-int'.
*/
       (object))
{
  return CHAR_INTP (object) ? Qt : Qnil;
}

DEFUN ("char-or-char-int-p", Fchar_or_char_int_p, 1, 1, 0, /*
Return t if OBJECT is a character or an integer that can be converted into one.
*/
       (object))
{
  return CHAR_OR_CHAR_INTP (object) ? Qt : Qnil;
}

DEFUN ("char-or-string-p", Fchar_or_string_p, 1, 1, 0, /*
Return t if OBJECT is a character (or a char-int) or a string.
It is semi-hateful that we allow a char-int here, as it goes against
the name of this function, but it makes the most sense considering the
other steps we take to maintain compatibility with the old character/integer
confoundedness in older versions of E-Lisp.
*/
       (object))
{
  return CHAR_OR_CHAR_INTP (object) || STRINGP (object) ? Qt : Qnil;
}

DEFUN ("integerp", Fintegerp, 1, 1, 0, /*
Return t if OBJECT is an integer.
*/
       (object))
{
  return INTP (object) ? Qt : Qnil;
}

DEFUN ("integer-or-marker-p", Finteger_or_marker_p, 1, 1, 0, /*
Return t if OBJECT is an integer or a marker (editor pointer).
*/
       (object))
{
  return INTP (object) || MARKERP (object) ? Qt : Qnil;
}

DEFUN ("integer-or-char-p", Finteger_or_char_p, 1, 1, 0, /*
Return t if OBJECT is an integer or a character.
*/
       (object))
{
  return INTP (object) || CHARP (object) ? Qt : Qnil;
}

DEFUN ("integer-char-or-marker-p", Finteger_char_or_marker_p, 1, 1, 0, /*
Return t if OBJECT is an integer, character or a marker (editor pointer).
*/
       (object))
{
  return INTP (object) || CHARP (object) || MARKERP (object) ? Qt : Qnil;
}

DEFUN ("natnump", Fnatnump, 1, 1, 0, /*
Return t if OBJECT is a nonnegative integer.
*/
       (object))
{
  return NATNUMP (object) ? Qt : Qnil;
}

DEFUN ("bitp", Fbitp, 1, 1, 0, /*
Return t if OBJECT is a bit (0 or 1).
*/
       (object))
{
  return BITP (object) ? Qt : Qnil;
}

DEFUN ("numberp", Fnumberp, 1, 1, 0, /*
Return t if OBJECT is a number (floating point or integer).
*/
       (object))
{
  return INT_OR_FLOATP (object) ? Qt : Qnil;
}

DEFUN ("number-or-marker-p", Fnumber_or_marker_p, 1, 1, 0, /*
Return t if OBJECT is a number or a marker.
*/
       (object))
{
  return INT_OR_FLOATP (object) || MARKERP (object) ? Qt : Qnil;
}

DEFUN ("number-char-or-marker-p", Fnumber_char_or_marker_p, 1, 1, 0, /*
Return t if OBJECT is a number, character or a marker.
*/
       (object))
{
  return (INT_OR_FLOATP (object) ||
	  CHARP         (object) ||
	  MARKERP       (object))
    ? Qt : Qnil;
}

#ifdef LISP_FLOAT_TYPE
DEFUN ("floatp", Ffloatp, 1, 1, 0, /*
Return t if OBJECT is a floating point number.
*/
       (object))
{
  return FLOATP (object) ? Qt : Qnil;
}
#endif /* LISP_FLOAT_TYPE */

DEFUN ("type-of", Ftype_of, 1, 1, 0, /*
Return a symbol representing the type of OBJECT.
*/
       (object))
{
  if (CONSP    (object)) return Qcons;
  if (SYMBOLP  (object)) return Qsymbol;
  if (KEYWORDP (object)) return Qkeyword;
  if (INTP     (object)) return Qinteger;
  if (CHARP    (object)) return Qcharacter;
  if (STRINGP  (object)) return Qstring;
  if (VECTORP  (object)) return Qvector;

  assert (LRECORDP (object));
  return intern (XRECORD_LHEADER_IMPLEMENTATION (object)->name);
}


/* Extract and set components of lists */

DEFUN ("car", Fcar, 1, 1, 0, /*
Return the car of LIST.  If arg is nil, return nil.
Error if arg is not nil and not a cons cell.  See also `car-safe'.
*/
       (list))
{
  while (1)
    {
      if (CONSP (list))
	return XCAR (list);
      else if (NILP (list))
	return Qnil;
      else
	list = wrong_type_argument (Qlistp, list);
    }
}

DEFUN ("car-safe", Fcar_safe, 1, 1, 0, /*
Return the car of OBJECT if it is a cons cell, or else nil.
*/
       (object))
{
  return CONSP (object) ? XCAR (object) : Qnil;
}

DEFUN ("cdr", Fcdr, 1, 1, 0, /*
Return the cdr of LIST.  If arg is nil, return nil.
Error if arg is not nil and not a cons cell.  See also `cdr-safe'.
*/
       (list))
{
  while (1)
    {
      if (CONSP (list))
	return XCDR (list);
      else if (NILP (list))
	return Qnil;
      else
	list = wrong_type_argument (Qlistp, list);
    }
}

DEFUN ("cdr-safe", Fcdr_safe, 1, 1, 0, /*
Return the cdr of OBJECT if it is a cons cell, else nil.
*/
       (object))
{
  return CONSP (object) ? XCDR (object) : Qnil;
}

DEFUN ("setcar", Fsetcar, 2, 2, 0, /*
Set the car of CONSCELL to be NEWCAR.  Return NEWCAR.
*/
       (conscell, newcar))
{
  if (!CONSP (conscell))
    conscell = wrong_type_argument (Qconsp, conscell);

  CHECK_IMPURE (conscell);
  XCAR (conscell) = newcar;
  return newcar;
}

DEFUN ("setcdr", Fsetcdr, 2, 2, 0, /*
Set the cdr of CONSCELL to be NEWCDR.  Return NEWCDR.
*/
       (conscell, newcdr))
{
  if (!CONSP (conscell))
    conscell = wrong_type_argument (Qconsp, conscell);

  CHECK_IMPURE (conscell);
  XCDR (conscell) = newcdr;
  return newcdr;
}

/* Find the function at the end of a chain of symbol function indirections.  */

/* If OBJECT is a symbol, find the end of its function chain and
   return the value found there.  If OBJECT is not a symbol, just
   return it.  If there is a cycle in the function chain, signal a
   cyclic-function-indirection error.

   This is like Findirect_function, except that it doesn't signal an
   error if the chain ends up unbound.  */
Lisp_Object
indirect_function (Lisp_Object object, int errorp)
{
  Lisp_Object tortoise = object;
  Lisp_Object hare     = object;

  for (;;)
    {
      if (!SYMBOLP (hare) || UNBOUNDP (hare))
	break;
      hare = XSYMBOL (hare)->function;
      if (!SYMBOLP (hare) || UNBOUNDP (hare))
	break;
      hare = XSYMBOL (hare)->function;

      tortoise = XSYMBOL (tortoise)->function;

      if (EQ (hare, tortoise))
	return Fsignal (Qcyclic_function_indirection, list1 (object));
    }

  if (UNBOUNDP (hare) && errorp)
    return Fsignal (Qvoid_function, list1 (object));
  return hare;
}

DEFUN ("indirect-function", Findirect_function, 1, 1, 0, /*
Return the function at the end of OBJECT's function chain.
If OBJECT is a symbol, follow all function indirections and return
the final function binding.
If OBJECT is not a symbol, just return it.
Signal a void-function error if the final symbol is unbound.
Signal a cyclic-function-indirection error if there is a loop in the
function chain of symbols.
*/
       (object))
{
  return indirect_function (object, 1);
}

/* Extract and set vector and string elements */

DEFUN ("aref", Faref, 2, 2, 0, /*
Return the element of ARRAY at index INDEX.
ARRAY may be a vector, bit vector, string, or byte-code object.
IDX starts at 0.
*/
       (array, idx))
{
  int idxval;

 retry:
  CHECK_INT_COERCE_CHAR (idx); /* yuck! */
  idxval = XINT (idx);
  if (idxval < 0)
    {
    lose:
      args_out_of_range (array, idx);
    }
  if (VECTORP (array))
    {
      if (idxval >= XVECTOR_LENGTH (array)) goto lose;
      return XVECTOR_DATA (array)[idxval];
    }
  else if (BIT_VECTORP (array))
    {
      if (idxval >= bit_vector_length (XBIT_VECTOR (array))) goto lose;
      return make_int (bit_vector_bit (XBIT_VECTOR (array), idxval));
    }
  else if (STRINGP (array))
    {
      if (idxval >= XSTRING_CHAR_LENGTH (array)) goto lose;
      return make_char (string_char (XSTRING (array), idxval));
    }
#ifdef LOSING_BYTECODE
  else if (COMPILED_FUNCTIONP (array))
    {
      /* Weird, gross compatibility kludge */
      return Felt (array, idx);
    }
#endif
  else
    {
      check_losing_bytecode ("aref", array);
      array = wrong_type_argument (Qarrayp, array);
      goto retry;
    }
}

DEFUN ("aset", Faset, 3, 3, 0, /*
Store into the element of ARRAY at index IDX the value NEWVAL.
ARRAY may be a vector, bit vector, or string.  IDX starts at 0.
*/
       (array, idx, newval))
{
  int idxval;

  CHECK_INT_COERCE_CHAR (idx); /* yuck! */
  if (!VECTORP (array) && !BIT_VECTORP (array) && !STRINGP (array))
    array = wrong_type_argument (Qarrayp, array);

  idxval = XINT (idx);
  if (idxval < 0)
    {
    lose:
      args_out_of_range (array, idx);
    }
  CHECK_IMPURE (array);

  if (VECTORP (array))
    {
      if (idxval >= XVECTOR_LENGTH (array)) goto lose;
      XVECTOR_DATA (array)[idxval] = newval;
    }
  else if (BIT_VECTORP (array))
    {
      if (idxval >= bit_vector_length (XBIT_VECTOR (array))) goto lose;
      CHECK_BIT (newval);
      set_bit_vector_bit (XBIT_VECTOR (array), idxval, !ZEROP (newval));
    }
  else                          /* string */
    {
      CHECK_CHAR_COERCE_INT (newval);
      if (idxval >= XSTRING_CHAR_LENGTH (array)) goto lose;
      set_string_char (XSTRING (array), idxval, XCHAR (newval));
      bump_string_modiff (array);
    }

  return newval;
}


/**********************************************************************/
/*                      Compiled-function objects                     */
/**********************************************************************/

/* The compiled_function->doc_and_interactive slot uses the minimal
   number of conses, based on compiled_function->flags; it may take
   any of the following forms:

	doc
	interactive
	domain
	(doc . interactive)
	(doc . domain)
	(interactive . domain)
	(doc . (interactive . domain))
 */

/* Caller must check flags.interactivep first */
Lisp_Object
compiled_function_interactive (struct Lisp_Compiled_Function *b)
{
  assert (b->flags.interactivep);
  if (b->flags.documentationp && b->flags.domainp)
    return XCAR (XCDR (b->doc_and_interactive));
  else if (b->flags.documentationp)
    return XCDR (b->doc_and_interactive);
  else if (b->flags.domainp)
    return XCAR (b->doc_and_interactive);

  /* if all else fails... */
  return b->doc_and_interactive;
}

/* Caller need not check flags.documentationp first */
Lisp_Object
compiled_function_documentation (struct Lisp_Compiled_Function *b)
{
  if (! b->flags.documentationp)
    return Qnil;
  else if (b->flags.interactivep && b->flags.domainp)
    return XCAR (b->doc_and_interactive);
  else if (b->flags.interactivep)
    return XCAR (b->doc_and_interactive);
  else if (b->flags.domainp)
    return XCAR (b->doc_and_interactive);
  else
    return b->doc_and_interactive;
}

/* Caller need not check flags.domainp first */
Lisp_Object
compiled_function_domain (struct Lisp_Compiled_Function *b)
{
  if (! b->flags.domainp)
    return Qnil;
  else if (b->flags.documentationp && b->flags.interactivep)
    return XCDR (XCDR (b->doc_and_interactive));
  else if (b->flags.documentationp)
    return XCDR (b->doc_and_interactive);
  else if (b->flags.interactivep)
    return XCDR (b->doc_and_interactive);
  else
    return b->doc_and_interactive;
}

#ifdef COMPILED_FUNCTION_ANNOTATION_HACK

Lisp_Object
compiled_function_annotation (struct Lisp_Compiled_Function *b)
{
  return b->annotated;
}

#endif

/* used only by Snarf-documentation; there must be doc already. */
void
set_compiled_function_documentation (struct Lisp_Compiled_Function *b,
				     Lisp_Object new)
{
  assert (b->flags.documentationp);
  assert (INTP (new) || STRINGP (new));

  if (b->flags.interactivep && b->flags.domainp)
    XCAR (b->doc_and_interactive) = new;
  else if (b->flags.interactivep)
    XCAR (b->doc_and_interactive) = new;
  else if (b->flags.domainp)
    XCAR (b->doc_and_interactive) = new;
  else
    b->doc_and_interactive = new;
}

DEFUN ("compiled-function-instructions", Fcompiled_function_instructions, 1, 1, 0, /*
Return the byte-opcode string of the compiled-function object.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return XCOMPILED_FUNCTION (function)->bytecodes;
}

DEFUN ("compiled-function-constants", Fcompiled_function_constants, 1, 1, 0, /*
Return the constants vector of the compiled-function object.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return XCOMPILED_FUNCTION (function)->constants;
}

DEFUN ("compiled-function-stack-depth", Fcompiled_function_stack_depth, 1, 1, 0, /*
Return the max stack depth of the compiled-function object.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return make_int (XCOMPILED_FUNCTION (function)->maxdepth);
}

DEFUN ("compiled-function-arglist", Fcompiled_function_arglist, 1, 1, 0, /*
Return the argument list of the compiled-function object.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return XCOMPILED_FUNCTION (function)->arglist;
}

DEFUN ("compiled-function-interactive", Fcompiled_function_interactive, 1, 1, 0, /*
Return the interactive spec of the compiled-function object, or nil.
If non-nil, the return value will be a list whose first element is
`interactive' and whose second element is the interactive spec.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return XCOMPILED_FUNCTION (function)->flags.interactivep
    ? list2 (Qinteractive,
	     compiled_function_interactive (XCOMPILED_FUNCTION (function)))
    : Qnil;
}

DEFUN ("compiled-function-doc-string", Fcompiled_function_doc_string, 1, 1, 0, /*
Return the doc string of the compiled-function object, if available.
Functions that had their doc strings snarfed into the DOC file will have
an integer returned instead of a string.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return compiled_function_documentation (XCOMPILED_FUNCTION (function));
}

#ifdef COMPILED_FUNCTION_ANNOTATION_HACK

/* Remove the `xx' if you wish to restore this feature */
xxDEFUN ("compiled-function-annotation", Fcompiled_function_annotation, 1, 1, 0, /*
Return the annotation of the compiled-function object, or nil.
The annotation is a piece of information indicating where this
compiled-function object came from.  Generally this will be
a symbol naming a function; or a string naming a file, if the
compiled-function object was not defined in a function; or nil,
if the compiled-function object was not created as a result of
a `load'.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return compiled_function_annotation (XCOMPILED_FUNCTION (function));
}

#endif /* COMPILED_FUNCTION_ANNOTATION_HACK */

DEFUN ("compiled-function-domain", Fcompiled_function_domain, 1, 1, 0, /*
Return the domain of the compiled-function object, or nil.
This is only meaningful if I18N3 was enabled when emacs was compiled.
*/
       (function))
{
  CHECK_COMPILED_FUNCTION (function);
  return XCOMPILED_FUNCTION (function)->flags.domainp
    ? compiled_function_domain (XCOMPILED_FUNCTION (function))
    : Qnil;
}


/**********************************************************************/
/*                       Arithmetic functions                         */
/**********************************************************************/

Lisp_Object
arithcompare (Lisp_Object num1, Lisp_Object num2,
	      enum arith_comparison comparison)
{
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (num1);
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (num2);

#ifdef LISP_FLOAT_TYPE
  if (FLOATP (num1) || FLOATP (num2))
    {
      double f1 = FLOATP (num1) ? float_data (XFLOAT (num1)) : XINT (num1);
      double f2 = FLOATP (num2) ? float_data (XFLOAT (num2)) : XINT (num2);

      switch (comparison)
	{
	case arith_equal:         return f1 == f2 ? Qt : Qnil;
	case arith_notequal:      return f1 != f2 ? Qt : Qnil;
	case arith_less:          return f1 <  f2 ? Qt : Qnil;
	case arith_less_or_equal: return f1 <= f2 ? Qt : Qnil;
	case arith_grtr:          return f1 >  f2 ? Qt : Qnil;
	case arith_grtr_or_equal: return f1 >= f2 ? Qt : Qnil;
	}
    }
#endif /* LISP_FLOAT_TYPE */

  switch (comparison)
    {
    case arith_equal:         return XINT (num1) == XINT (num2) ? Qt : Qnil;
    case arith_notequal:      return XINT (num1) != XINT (num2) ? Qt : Qnil;
    case arith_less:          return XINT (num1) <  XINT (num2) ? Qt : Qnil;
    case arith_less_or_equal: return XINT (num1) <= XINT (num2) ? Qt : Qnil;
    case arith_grtr:          return XINT (num1) >  XINT (num2) ? Qt : Qnil;
    case arith_grtr_or_equal: return XINT (num1) >= XINT (num2) ? Qt : Qnil;
    }

  abort ();
  return Qnil;	/* suppress compiler warning */
}

static Lisp_Object
arithcompare_many (enum arith_comparison comparison,
		   int nargs, Lisp_Object *args)
{
  for (; --nargs > 0; args++)
    if (NILP (arithcompare (*args, *(args + 1), comparison)))
      return Qnil;

  return Qt;
}

DEFUN ("=", Feqlsign, 1, MANY, 0, /*
Return t if all the arguments are numerically equal.
The arguments may be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arithcompare_many (arith_equal, nargs, args);
}

DEFUN ("<", Flss, 1, MANY, 0, /*
Return t if the sequence of arguments is monotonically increasing.
The arguments may be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arithcompare_many (arith_less, nargs, args);
}

DEFUN (">", Fgtr, 1, MANY, 0, /*
Return t if the sequence of arguments is monotonically decreasing.
The arguments may be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arithcompare_many (arith_grtr, nargs, args);
}

DEFUN ("<=", Fleq, 1, MANY, 0, /*
Return t if the sequence of arguments is monotonically nondecreasing.
The arguments may be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arithcompare_many (arith_less_or_equal, nargs, args);
}

DEFUN (">=", Fgeq, 1, MANY, 0, /*
Return t if the sequence of arguments is monotonically nonincreasing.
The arguments may be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arithcompare_many (arith_grtr_or_equal, nargs, args);
}

DEFUN ("/=", Fneq, 1, MANY, 0, /*
Return t if no two arguments are numerically equal.
The arguments may be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arithcompare_many (arith_notequal, nargs, args);
}

DEFUN ("zerop", Fzerop, 1, 1, 0, /*
Return t if NUMBER is zero.
*/
       (number))
{
  CHECK_INT_OR_FLOAT (number);

#ifdef LISP_FLOAT_TYPE
  if (FLOATP (number))
    return float_data (XFLOAT (number)) == 0.0 ? Qt : Qnil;
#endif /* LISP_FLOAT_TYPE */

  return EQ (number, Qzero) ? Qt : Qnil;
}

/* Convert between a 32-bit value and a cons of two 16-bit values.
   This is used to pass 32-bit integers to and from the user.
   Use time_to_lisp() and lisp_to_time() for time values.

   If you're thinking of using this to store a pointer into a Lisp Object
   for internal purposes (such as when calling record_unwind_protect()),
   try using make_opaque_ptr()/get_opaque_ptr() instead. */
Lisp_Object
word_to_lisp (unsigned int item)
{
  return Fcons (make_int (item >> 16), make_int (item & 0xffff));
}

unsigned int
lisp_to_word (Lisp_Object item)
{
  if (INTP (item))
    return XINT (item);
  else
    {
      Lisp_Object top = Fcar (item);
      Lisp_Object bot = Fcdr (item);
      CHECK_INT (top);
      CHECK_INT (bot);
      return (XINT (top) << 16) | (XINT (bot) & 0xffff);
    }
}


DEFUN ("number-to-string", Fnumber_to_string, 1, 1, 0, /*
Convert NUM to a string by printing it in decimal.
Uses a minus sign if negative.
NUM may be an integer or a floating point number.
*/
       (num))
{
  char buffer[VALBITS];

  CHECK_INT_OR_FLOAT (num);

#ifdef LISP_FLOAT_TYPE
  if (FLOATP (num))
    {
      char pigbuf[350];	/* see comments in float_to_string */

      float_to_string (pigbuf, float_data (XFLOAT (num)));
      return build_string (pigbuf);
    }
#endif /* LISP_FLOAT_TYPE */

  long_to_string (buffer, XINT (num));
  return build_string (buffer);
}

static int
digit_to_number (int character, int base)
{
  /* Assumes ASCII */
  int digit = ((character >= '0' && character <= '9') ? character - '0'      :
	       (character >= 'a' && character <= 'z') ? character - 'a' + 10 :
	       (character >= 'A' && character <= 'Z') ? character - 'A' + 10 :
	       -1);

  return digit >= base ? -1 : digit;
}

DEFUN ("string-to-number", Fstring_to_number, 1, 2, 0, /*
Convert STRING to a number by parsing it as a decimal number.
This parses both integers and floating point numbers.
It ignores leading spaces and tabs.

If BASE, interpret STRING as a number in that base.  If BASE isn't
present, base 10 is used.  BASE must be between 2 and 16 (inclusive).
Floating point numbers always use base 10.
*/
       (string, base))
{
  char *p;
  int b;

  CHECK_STRING (string);

  if (NILP (base))
    b = 10;
  else
    {
      CHECK_INT (base);
      b = XINT (base);
      check_int_range (b, 2, 16);
    }

  p = (char *) XSTRING_DATA (string);

  /* Skip any whitespace at the front of the number.  Some versions of
     atoi do this anyway, so we might as well make Emacs lisp consistent.  */
  while (*p == ' ' || *p == '\t')
    p++;

#ifdef LISP_FLOAT_TYPE
  if (isfloat_string (p))
    return make_float (atof (p));
#endif /* LISP_FLOAT_TYPE */

  if (b == 10)
    {
      /* Use the system-provided functions for base 10. */
#if SIZEOF_EMACS_INT == SIZEOF_INT
      return make_int (atoi (p));
#elif SIZEOF_EMACS_INT == SIZEOF_LONG
      return make_int (atol (p));
#elif SIZEOF_EMACS_INT == SIZEOF_LONG_LONG
      return make_int (atoll (p));
#endif
    }
  else
    {
      int digit, negative = 1;
      EMACS_INT v = 0;

      if (*p == '-')
	{
	  negative = -1;
	  p++;
	}
      else if (*p == '+')
	p++;
      while (1)
	{
	  digit = digit_to_number (*p++, b);
	  if (digit < 0)
	    break;
	  v = v * b + digit;
	}
      return make_int (negative * v);
    }
}

enum arithop
  { Aadd, Asub, Amult, Adiv, Alogand, Alogior, Alogxor, Amax, Amin };


#ifdef LISP_FLOAT_TYPE
static Lisp_Object
float_arith_driver (double accum, int argnum, enum arithop code, int nargs,
		    Lisp_Object *args)
{
  REGISTER Lisp_Object val;
  double next;

  for (; argnum < nargs; argnum++)
    {
      /* using args[argnum] as argument to CHECK_INT_OR_FLOAT_... */
      val = args[argnum];
      CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (val);

      if (FLOATP (val))
	{
	  next = float_data (XFLOAT (val));
	}
      else
	{
	  args[argnum] = val;    /* runs into a compiler bug. */
	  next = XINT (args[argnum]);
	}
      switch (code)
	{
	case Aadd:
	  accum += next;
	  break;
	case Asub:
	  if (!argnum && nargs != 1)
	    next = - next;
	  accum -= next;
	  break;
	case Amult:
	  accum *= next;
	  break;
	case Adiv:
	  if (!argnum)
	    accum = next;
	  else
	    {
	      if (next == 0)
		Fsignal (Qarith_error, Qnil);
	      accum /= next;
	    }
	  break;
	case Alogand:
	case Alogior:
	case Alogxor:
	  return wrong_type_argument (Qinteger_char_or_marker_p, val);
	case Amax:
	  if (!argnum || isnan (next) || next > accum)
	    accum = next;
	  break;
	case Amin:
	  if (!argnum || isnan (next) || next < accum)
	    accum = next;
	  break;
	}
    }

  return make_float (accum);
}
#endif /* LISP_FLOAT_TYPE */

static Lisp_Object
arith_driver (enum arithop code, int nargs, Lisp_Object *args)
{
  Lisp_Object val;
  REGISTER int argnum;
  REGISTER EMACS_INT accum = 0;
  REGISTER EMACS_INT next;

  switch (code)
    {
    case Alogior:
    case Alogxor:
    case Aadd:
    case Asub:
      accum = 0; break;
    case Amult:
      accum = 1; break;
    case Alogand:
      accum = -1; break;
    case Adiv:
    case Amax:
    case Amin:
      accum = 0; break;
    default:
      abort ();
    }

  for (argnum = 0; argnum < nargs; argnum++)
    {
      /* using args[argnum] as argument to CHECK_INT_OR_FLOAT_... */
      val = args[argnum];
      CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (val);

#ifdef LISP_FLOAT_TYPE
      if (FLOATP (val)) /* time to do serious math */
	return float_arith_driver ((double) accum, argnum, code,
				   nargs, args);
#endif /* LISP_FLOAT_TYPE */
      args[argnum] = val;    /* runs into a compiler bug. */
      next = XINT (args[argnum]);
      switch (code)
	{
	case Aadd: accum += next; break;
	case Asub:
	  if (!argnum && nargs != 1)
	    next = - next;
	  accum -= next;
	  break;
	case Amult: accum *= next; break;
	case Adiv:
	  if (!argnum) accum = next;
	  else
	    {
	      if (next == 0)
		Fsignal (Qarith_error, Qnil);
	      accum /= next;
	    }
	  break;
	case Alogand: accum &= next; break;
	case Alogior: accum |= next; break;
	case Alogxor: accum ^= next; break;
	case Amax: if (!argnum || next > accum) accum = next; break;
	case Amin: if (!argnum || next < accum) accum = next; break;
	}
    }

  XSETINT (val, accum);
  return val;
}

DEFUN ("+", Fplus, 0, MANY, 0, /*
Return sum of any number of arguments.
The arguments should all be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Aadd, nargs, args);
}

DEFUN ("-", Fminus, 0, MANY, 0, /*
Negate number or subtract numbers, characters or markers.
With one arg, negates it.  With more than one arg,
subtracts all but the first from the first.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Asub, nargs, args);
}

DEFUN ("*", Ftimes, 0, MANY, 0, /*
Return product of any number of arguments.
The arguments should all be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Amult, nargs, args);
}

DEFUN ("/", Fquo, 2, MANY, 0, /*
Return first argument divided by all the remaining arguments.
The arguments must be numbers, characters or markers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Adiv, nargs, args);
}

DEFUN ("%", Frem, 2, 2, 0, /*
Return remainder of first arg divided by second.
Both must be integers, characters or markers.
*/
       (num1, num2))
{
  CHECK_INT_COERCE_CHAR_OR_MARKER (num1);
  CHECK_INT_COERCE_CHAR_OR_MARKER (num2);

  if (ZEROP (num2))
    Fsignal (Qarith_error, Qnil);

  return make_int (XINT (num1) % XINT (num2));
}

/* Note, ANSI *requires* the presence of the fmod() library routine.
   If your system doesn't have it, complain to your vendor, because
   that is a bug. */

#ifndef HAVE_FMOD
double
fmod (double f1, double f2)
{
  if (f2 < 0.0)
    f2 = -f2;
  return f1 - f2 * floor (f1/f2);
}
#endif /* ! HAVE_FMOD */


DEFUN ("mod", Fmod, 2, 2, 0, /*
Return X modulo Y.
The result falls between zero (inclusive) and Y (exclusive).
Both X and Y must be numbers, characters or markers.
If either argument is a float, a float will be returned.
*/
       (x, y))
{
  EMACS_INT i1, i2;

#ifdef LISP_FLOAT_TYPE
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (x);
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (y);

  if (FLOATP (x) || FLOATP (y))
    {
      double f1, f2;

      f1 = ((FLOATP (x)) ? float_data (XFLOAT (x)) : XINT (x));
      f2 = ((FLOATP (y)) ? float_data (XFLOAT (y)) : XINT (y));
      if (f2 == 0)
	Fsignal (Qarith_error, Qnil);

      f1 = fmod (f1, f2);

      /* If the "remainder" comes out with the wrong sign, fix it.  */
      if (f2 < 0 ? f1 > 0 : f1 < 0)
	f1 += f2;
      return make_float (f1);
    }
#else /* not LISP_FLOAT_TYPE */
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (x);
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (y);
#endif /* not LISP_FLOAT_TYPE */

  i1 = XINT (x);
  i2 = XINT (y);

  if (i2 == 0)
    Fsignal (Qarith_error, Qnil);

  i1 %= i2;

  /* If the "remainder" comes out with the wrong sign, fix it.  */
  if (i2 < 0 ? i1 > 0 : i1 < 0)
    i1 += i2;

  return make_int (i1);
}


DEFUN ("max", Fmax, 1, MANY, 0, /*
Return largest of all the arguments.
All arguments must be numbers, characters or markers.
The value is always a number; markers and characters are converted
to numbers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Amax, nargs, args);
}

DEFUN ("min", Fmin, 1, MANY, 0, /*
Return smallest of all the arguments.
All arguments must be numbers, characters or markers.
The value is always a number; markers and characters are converted
to numbers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Amin, nargs, args);
}

DEFUN ("logand", Flogand, 0, MANY, 0, /*
Return bitwise-and of all the arguments.
Arguments may be integers, or markers or characters converted to integers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Alogand, nargs, args);
}

DEFUN ("logior", Flogior, 0, MANY, 0, /*
Return bitwise-or of all the arguments.
Arguments may be integers, or markers or characters converted to integers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Alogior, nargs, args);
}

DEFUN ("logxor", Flogxor, 0, MANY, 0, /*
Return bitwise-exclusive-or of all the arguments.
Arguments may be integers, or markers or characters converted to integers.
*/
       (int nargs, Lisp_Object *args))
{
  return arith_driver (Alogxor, nargs, args);
}

DEFUN ("ash", Fash, 2, 2, 0, /*
Return VALUE with its bits shifted left by COUNT.
If COUNT is negative, shifting is actually to the right.
In this case, the sign bit is duplicated.
*/
       (value, count))
{
  CHECK_INT_COERCE_CHAR (value);
  CHECK_INT (count);

  return make_int (XINT (count) > 0 ?
		   XINT (value) <<  XINT (count) :
		   XINT (value) >> -XINT (count));
}

DEFUN ("lsh", Flsh, 2, 2, 0, /*
Return VALUE with its bits shifted left by COUNT.
If COUNT is negative, shifting is actually to the right.
In this case, zeros are shifted in on the left.
*/
       (value, count))
{
  CHECK_INT_COERCE_CHAR (value);
  CHECK_INT (count);

  return make_int (XINT (count) > 0 ?
		   XUINT (value) <<  XINT (count) :
		   XUINT (value) >> -XINT (count));
}

DEFUN ("1+", Fadd1, 1, 1, 0, /*
Return NUMBER plus one.  NUMBER may be a number or a marker.
Markers and characters are converted to integers.
*/
       (number))
{
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (number);

#ifdef LISP_FLOAT_TYPE
  if (FLOATP (number))
    return make_float (1.0 + float_data (XFLOAT (number)));
#endif /* LISP_FLOAT_TYPE */

  return make_int (XINT (number) + 1);
}

DEFUN ("1-", Fsub1, 1, 1, 0, /*
Return NUMBER minus one.  NUMBER may be a number or a marker.
Markers and characters are converted to integers.
*/
       (number))
{
  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (number);

#ifdef LISP_FLOAT_TYPE
  if (FLOATP (number))
    return make_float (-1.0 + (float_data (XFLOAT (number))));
#endif /* LISP_FLOAT_TYPE */

  return make_int (XINT (number) - 1);
}

DEFUN ("lognot", Flognot, 1, 1, 0, /*
Return the bitwise complement of NUMBER.  NUMBER must be an integer.
*/
       (number))
{
  CHECK_INT (number);
  return make_int (~XINT (number));
}


/************************************************************************/
/*                              weak lists                              */
/************************************************************************/

/* A weak list is like a normal list except that elements automatically
   disappear when no longer in use, i.e. when no longer GC-protected.
   The basic idea is that we don't mark the elements during GC, but
   wait for them to be marked elsewhere.  If they're not marked, we
   remove them.  This is analogous to weak hashtables; see the explanation
   there for more info. */

static Lisp_Object Vall_weak_lists; /* Gemarke es nicht!!! */

static Lisp_Object encode_weak_list_type (enum weak_list_type type);

static Lisp_Object
mark_weak_list (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  return Qnil; /* nichts ist gemarkt */
}

static void
print_weak_list (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  if (print_readably)
    error ("printing unreadable object #<weak-list>");

  write_c_string ("#<weak-list ", printcharfun);
  print_internal (encode_weak_list_type (XWEAK_LIST (obj)->type),
		  printcharfun, 0);
  write_c_string (" ", printcharfun);
  print_internal (XWEAK_LIST (obj)->list, printcharfun, escapeflag);
  write_c_string (">", printcharfun);
}

static int
weak_list_equal (Lisp_Object o1, Lisp_Object o2, int depth)
{
  struct weak_list *w1 = XWEAK_LIST (o1);
  struct weak_list *w2 = XWEAK_LIST (o2);

  return ((w1->type == w2->type) &&
	  internal_equal (w1->list, w2->list, depth + 1));
}

static unsigned long
weak_list_hash (Lisp_Object obj, int depth)
{
  struct weak_list *w = XWEAK_LIST (obj);

  return HASH2 ((unsigned long) w->type,
		internal_hash (w->list, depth + 1));
}

Lisp_Object
make_weak_list (enum weak_list_type type)
{
  Lisp_Object result;
  struct weak_list *wl =
    alloc_lcrecord_type (struct weak_list, lrecord_weak_list);

  wl->list = Qnil;
  wl->type = type;
  XSETWEAK_LIST (result, wl);
  wl->next_weak = Vall_weak_lists;
  Vall_weak_lists = result;
  return result;
}

DEFINE_LRECORD_IMPLEMENTATION ("weak-list", weak_list,
			       mark_weak_list, print_weak_list,
			       0, weak_list_equal, weak_list_hash,
			       struct weak_list);
/*
   -- we do not mark the list elements (either the elements themselves
      or the cons cells that hold them) in the normal marking phase.
   -- at the end of marking, we go through all weak lists that are
      marked, and mark the cons cells that hold all marked
      objects, and possibly parts of the objects themselves.
      (See alloc.c, "after-mark".)
   -- after that, we prune away all the cons cells that are not marked.

   WARNING WARNING WARNING WARNING WARNING:

   The code in the following two functions is *unbelievably* tricky.
   Don't mess with it.  You'll be sorry.

   Linked lists just majorly suck, d'ya know?
*/

int
finish_marking_weak_lists (int (*obj_marked_p) (Lisp_Object),
			   void (*markobj) (Lisp_Object))
{
  Lisp_Object rest;
  int did_mark = 0;

  for (rest = Vall_weak_lists;
       !GC_NILP (rest);
       rest = XWEAK_LIST (rest)->next_weak)
    {
      Lisp_Object rest2;
      enum weak_list_type type = XWEAK_LIST (rest)->type;

      if (! ((*obj_marked_p) (rest)))
	/* The weak list is probably garbage.  Ignore it. */
	continue;

      for (rest2 = XWEAK_LIST (rest)->list;
	   /* We need to be trickier since we're inside of GC;
	      use CONSP instead of !NILP in case of user-visible
	      imperfect lists */
	   GC_CONSP (rest2);
	   rest2 = XCDR (rest2))
	{
	  Lisp_Object elem;
	  /* If the element is "marked" (meaning depends on the type
	     of weak list), we need to mark the cons containing the
	     element, and maybe the element itself (if only some part
	     was already marked). */
	  int need_to_mark_cons = 0;
	  int need_to_mark_elem = 0;

	  /* If a cons is already marked, then its car is already marked
	     (either because of an external pointer or because of
	     a previous call to this function), and likewise for all
	     the rest of the elements in the list, so we can stop now. */
	  if ((*obj_marked_p) (rest2))
	    break;

	  elem = XCAR (rest2);

	  switch (type)
	    {
	    case WEAK_LIST_SIMPLE:
	      if ((*obj_marked_p) (elem))
		need_to_mark_cons = 1;
	      break;

	    case WEAK_LIST_ASSOC:
	      if (!GC_CONSP (elem))
		{
		  /* just leave bogus elements there */
		  need_to_mark_cons = 1;
		  need_to_mark_elem = 1;
		}
	      else if ((*obj_marked_p) (XCAR (elem)) &&
		  (*obj_marked_p) (XCDR (elem)))
		{
		  need_to_mark_cons = 1;
		  /* We still need to mark elem, because it's
		     probably not marked. */
		  need_to_mark_elem = 1;
		}
	      break;

	    case WEAK_LIST_KEY_ASSOC:
	      if (!GC_CONSP (elem))
		{
		  /* just leave bogus elements there */
		  need_to_mark_cons = 1;
		  need_to_mark_elem = 1;
		}
	      else if ((*obj_marked_p) (XCAR (elem)))
		{
		  need_to_mark_cons = 1;
		  /* We still need to mark elem and XCDR (elem);
		     marking elem does both */
		  need_to_mark_elem = 1;
		}
	      break;

	    case WEAK_LIST_VALUE_ASSOC:
	      if (!GC_CONSP (elem))
		{
		  /* just leave bogus elements there */
		  need_to_mark_cons = 1;
		  need_to_mark_elem = 1;
		}
	      else if ((*obj_marked_p) (XCDR (elem)))
		{
		  need_to_mark_cons = 1;
		  /* We still need to mark elem and XCAR (elem);
		     marking elem does both */
		  need_to_mark_elem = 1;
		}
	      break;

	    default:
	      abort ();
	    }

	  if (need_to_mark_elem && ! (*obj_marked_p) (elem))
	    {
	      (*markobj) (elem);
	      did_mark = 1;
	    }

	  /* We also need to mark the cons that holds the elem or
	     assoc-pair.  We do *not* want to call (markobj) here
	     because that will mark the entire list; we just want to
	     mark the cons itself.
	     */
	  if (need_to_mark_cons)
	    {
	      struct Lisp_Cons *ptr = XCONS (rest2);
	      if (!CONS_MARKED_P (ptr))
		{
		  MARK_CONS (ptr);
		  did_mark = 1;
		}
	    }
	}

      /* In case of imperfect list, need to mark the final cons
         because we're not removing it */
      if (!GC_NILP (rest2) && ! (obj_marked_p) (rest2))
	{
	  (markobj) (rest2);
	  did_mark = 1;
	}
    }

  return did_mark;
}

void
prune_weak_lists (int (*obj_marked_p) (Lisp_Object))
{
  Lisp_Object rest, prev = Qnil;

  for (rest = Vall_weak_lists;
       !GC_NILP (rest);
       rest = XWEAK_LIST (rest)->next_weak)
    {
      if (! ((*obj_marked_p) (rest)))
	{
	  /* This weak list itself is garbage.  Remove it from the list. */
	  if (GC_NILP (prev))
	    Vall_weak_lists = XWEAK_LIST (rest)->next_weak;
	  else
	    XWEAK_LIST (prev)->next_weak =
	      XWEAK_LIST (rest)->next_weak;
	}
      else
	{
	  Lisp_Object rest2, prev2 = Qnil;
	  Lisp_Object tortoise;
	  int go_tortoise = 0;

          for (rest2 = XWEAK_LIST (rest)->list, tortoise = rest2;
	       /* We need to be trickier since we're inside of GC;
		  use CONSP instead of !NILP in case of user-visible
		  imperfect lists */
	       GC_CONSP (rest2);)
	    {
	      /* It suffices to check the cons for marking,
		 regardless of the type of weak list:

		 -- if the cons is pointed to somewhere else,
		    then it should stay around and will be marked.
		 -- otherwise, if it should stay around, it will
		    have been marked in finish_marking_weak_lists().
		 -- otherwise, it's not marked and should disappear.
		 */
	      if (!(*obj_marked_p) (rest2))
		{
		  /* bye bye :-( */
		  if (GC_NILP (prev2))
		    XWEAK_LIST (rest)->list = XCDR (rest2);
		  else
		    XCDR (prev2) = XCDR (rest2);
		  rest2 = XCDR (rest2);
		  /* Ouch.  Circularity checking is even trickier
		     than I thought.  When we cut out a link
		     like this, we can't advance the turtle or
		     it'll catch up to us.  Imagine that we're
		     standing on floor tiles and moving forward --
		     what we just did here is as if the floor
		     tile under us just disappeared and all the
		     ones ahead of us slid one tile towards us.
		     In other words, we didn't move at all;
		     if the tortoise was one step behind us
		     previously, it still is, and therefore
		     it must not move. */
		}
	      else
		{
		  prev2 = rest2;

		  /* Implementing circularity checking is trickier here
		     than in other places because we have to guarantee
		     that we've processed all elements before exiting
		     due to a circularity. (In most places, an error
		     is issued upon encountering a circularity, so it
		     doesn't really matter if all elements are processed.)
		     The idea is that we process along with the hare
		     rather than the tortoise.  If at any point in
		     our forward process we encounter the tortoise,
		     we must have already visited the spot, so we exit.
		     (If we process with the tortoise, we can fail to
		     process cases where a cons points to itself, or
		     where cons A points to cons B, which points to
		     cons A.) */

		  rest2 = XCDR (rest2);
		  if (go_tortoise)
		    tortoise = XCDR (tortoise);
		  go_tortoise = !go_tortoise;
		  if (GC_EQ (rest2, tortoise))
		    break;
		}
	    }

	  prev = rest;
	}
    }
}

static enum weak_list_type
decode_weak_list_type (Lisp_Object symbol)
{
  CHECK_SYMBOL (symbol);
  if (EQ (symbol, Qsimple))	 return WEAK_LIST_SIMPLE;
  if (EQ (symbol, Qassoc))	 return WEAK_LIST_ASSOC;
  if (EQ (symbol, Qold_assoc))	 return WEAK_LIST_ASSOC;  /* EBOLA ALERT! */
  if (EQ (symbol, Qkey_assoc))	 return WEAK_LIST_KEY_ASSOC;
  if (EQ (symbol, Qvalue_assoc)) return WEAK_LIST_VALUE_ASSOC;

  signal_simple_error ("Invalid weak list type", symbol);
  return WEAK_LIST_SIMPLE; /* not reached */
}

static Lisp_Object
encode_weak_list_type (enum weak_list_type type)
{
  switch (type)
    {
    case WEAK_LIST_SIMPLE:      return Qsimple;
    case WEAK_LIST_ASSOC:       return Qassoc;
    case WEAK_LIST_KEY_ASSOC:   return Qkey_assoc;
    case WEAK_LIST_VALUE_ASSOC: return Qvalue_assoc;
    default:
      abort ();
    }

  return Qnil; /* not reached */
}

DEFUN ("weak-list-p", Fweak_list_p, 1, 1, 0, /*
Return non-nil if OBJECT is a weak list.
*/
       (object))
{
  return WEAK_LISTP (object) ? Qt : Qnil;
}

DEFUN ("make-weak-list", Fmake_weak_list, 0, 1, 0, /*
Return a new weak list object of type TYPE.
A weak list object is an object that contains a list.  This list behaves
like any other list except that its elements do not count towards
garbage collection -- if the only pointer to an object in inside a weak
list (other than pointers in similar objects such as weak hash tables),
the object is garbage collected and automatically removed from the list.
This is used internally, for example, to manage the list holding the
children of an extent -- an extent that is unused but has a parent will
still be reclaimed, and will automatically be removed from its parent's
list of children.

Optional argument TYPE specifies the type of the weak list, and defaults
to `simple'.  Recognized types are

`simple'	Objects in the list disappear if not pointed to.
`assoc'		Objects in the list disappear if they are conses
		and either the car or the cdr of the cons is not
		pointed to.
`key-assoc'	Objects in the list disappear if they are conses
		and the car is not pointed to.
`value-assoc'	Objects in the list disappear if they are conses
		and the cdr is not pointed to.
*/
       (type))
{
  if (NILP (type))
    type = Qsimple;

  return make_weak_list (decode_weak_list_type (type));
}

DEFUN ("weak-list-type", Fweak_list_type, 1, 1, 0, /*
Return the type of the given weak-list object.
*/
       (weak))
{
  CHECK_WEAK_LIST (weak);
  return encode_weak_list_type (XWEAK_LIST (weak)->type);
}

DEFUN ("weak-list-list", Fweak_list_list, 1, 1, 0, /*
Return the list contained in a weak-list object.
*/
       (weak))
{
  CHECK_WEAK_LIST (weak);
  return XWEAK_LIST_LIST (weak);
}

DEFUN ("set-weak-list-list", Fset_weak_list_list, 2, 2, 0, /*
Change the list contained in a weak-list object.
*/
       (weak, new_list))
{
  CHECK_WEAK_LIST (weak);
  XWEAK_LIST_LIST (weak) = new_list;
  return new_list;
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

static SIGTYPE
arith_error (int signo)
{
  EMACS_REESTABLISH_SIGNAL (signo, arith_error);
  EMACS_UNBLOCK_SIGNAL (signo);
  signal_error (Qarith_error, Qnil);
}

void
init_data_very_early (void)
{
  /* Don't do this if just dumping out.
     We don't want to call `signal' in this case
     so that we don't have trouble with dumping
     signal-delivering routines in an inconsistent state.  */
#ifndef CANNOT_DUMP
  if (!initialized)
    return;
#endif /* CANNOT_DUMP */
  signal (SIGFPE, arith_error);
#ifdef uts
  signal (SIGEMT, arith_error);
#endif /* uts */
}

void
init_errors_once_early (void)
{
  defsymbol (&Qerror_conditions, "error-conditions");
  defsymbol (&Qerror_message, "error-message");

  /* We declare the errors here because some other deferrors depend
     on some of the errors below. */

  /* ERROR is used as a signaler for random errors for which nothing
     else is right */

  deferror (&Qerror, "error", "error", Qnil);
  deferror (&Qquit, "quit", "Quit", Qnil);

  deferror (&Qwrong_type_argument, "wrong-type-argument",
	    "Wrong type argument", Qerror);
  deferror (&Qargs_out_of_range, "args-out-of-range", "Args out of range",
	    Qerror);
  deferror (&Qvoid_function, "void-function",
	    "Symbol's function definition is void", Qerror);
  deferror (&Qcyclic_function_indirection, "cyclic-function-indirection",
	    "Symbol's chain of function indirections contains a loop", Qerror);
  deferror (&Qvoid_variable, "void-variable",
	    "Symbol's value as variable is void", Qerror);
  deferror (&Qcyclic_variable_indirection, "cyclic-variable-indirection",
	    "Symbol's chain of variable indirections contains a loop", Qerror);
  deferror (&Qsetting_constant, "setting-constant",
	    "Attempt to set a constant symbol", Qerror);
  deferror (&Qinvalid_read_syntax, "invalid-read-syntax",
	    "Invalid read syntax", Qerror);
  deferror (&Qmalformed_list, "malformed-list",
	    "Malformed list", Qerror);
  deferror (&Qmalformed_property_list, "malformed-property-list",
	    "Malformed property list", Qerror);
  deferror (&Qcircular_list, "circular-list",
	    "Circular list", Qerror);
  deferror (&Qcircular_property_list, "circular-property-list",
	    "Circular property list", Qerror);
  deferror (&Qinvalid_function, "invalid-function", "Invalid function",
	    Qerror);
  deferror (&Qwrong_number_of_arguments, "wrong-number-of-arguments",
	    "Wrong number of arguments", Qerror);
  deferror (&Qno_catch, "no-catch", "No catch for tag",
	    Qerror);
  deferror (&Qbeginning_of_buffer, "beginning-of-buffer",
	    "Beginning of buffer", Qerror);
  deferror (&Qend_of_buffer, "end-of-buffer", "End of buffer", Qerror);
  deferror (&Qbuffer_read_only, "buffer-read-only", "Buffer is read-only",
	    Qerror);

  deferror (&Qio_error, "io-error", "IO Error", Qerror);
  deferror (&Qend_of_file, "end-of-file", "End of stream", Qio_error);

  deferror (&Qarith_error, "arith-error", "Arithmetic error", Qerror);
  deferror (&Qrange_error, "range-error", "Arithmetic range error",
	    Qarith_error);
  deferror (&Qdomain_error, "domain-error", "Arithmetic domain error",
	    Qarith_error);
  deferror (&Qsingularity_error, "singularity-error",
	    "Arithmetic singularity error", Qdomain_error);
  deferror (&Qoverflow_error, "overflow-error",
	    "Arithmetic overflow error", Qdomain_error);
  deferror (&Qunderflow_error, "underflow-error",
	    "Arithmetic underflow error", Qdomain_error);
}

void
syms_of_data (void)
{
  defsymbol (&Qcons, "cons");
  defsymbol (&Qkeyword, "keyword");
  defsymbol (&Qquote, "quote");
  defsymbol (&Qlambda, "lambda");
  defsymbol (&Qignore, "ignore");
  defsymbol (&Qlistp, "listp");
  defsymbol (&Qtrue_list_p, "true-list-p");
  defsymbol (&Qconsp, "consp");
  defsymbol (&Qsubrp, "subrp");
  defsymbol (&Qsymbolp, "symbolp");
  defsymbol (&Qkeywordp, "keywordp");
  defsymbol (&Qintegerp, "integerp");
  defsymbol (&Qcharacterp, "characterp");
  defsymbol (&Qnatnump, "natnump");
  defsymbol (&Qstringp, "stringp");
  defsymbol (&Qarrayp, "arrayp");
  defsymbol (&Qsequencep, "sequencep");
  defsymbol (&Qbufferp, "bufferp");
  defsymbol (&Qbitp, "bitp");
  defsymbol (&Qbit_vectorp, "bit-vector-p");
  defsymbol (&Qvectorp, "vectorp");
  defsymbol (&Qcompiled_functionp, "compiled-function-p");
  defsymbol (&Qchar_or_string_p, "char-or-string-p");
  defsymbol (&Qmarkerp, "markerp");
  defsymbol (&Qinteger_or_marker_p, "integer-or-marker-p");
  defsymbol (&Qinteger_or_char_p, "integer-or-char-p");
  defsymbol (&Qinteger_char_or_marker_p, "integer-char-or-marker-p");
  defsymbol (&Qnumberp, "numberp");
  defsymbol (&Qnumber_or_marker_p, "number-or-marker-p");
  defsymbol (&Qnumber_char_or_marker_p, "number-char-or-marker-p");
  defsymbol (&Qcdr, "cdr");
  defsymbol (&Qweak_listp, "weak-list-p");

#ifdef LISP_FLOAT_TYPE
  defsymbol (&Qfloatp, "floatp");
#endif /* LISP_FLOAT_TYPE */

  DEFSUBR (Fwrong_type_argument);

  DEFSUBR (Feq);
  DEFSUBR (Fold_eq);
  DEFSUBR (Fnull);
  DEFSUBR (Flistp);
  DEFSUBR (Fnlistp);
  DEFSUBR (Ftrue_list_p);
  DEFSUBR (Fconsp);
  DEFSUBR (Fatom);
  DEFSUBR (Fchar_or_string_p);
  DEFSUBR (Fcharacterp);
  DEFSUBR (Fchar_int_p);
  DEFSUBR (Fchar_to_int);
  DEFSUBR (Fint_to_char);
  DEFSUBR (Fchar_or_char_int_p);
  DEFSUBR (Fintegerp);
  DEFSUBR (Finteger_or_marker_p);
  DEFSUBR (Finteger_or_char_p);
  DEFSUBR (Finteger_char_or_marker_p);
  DEFSUBR (Fnumberp);
  DEFSUBR (Fnumber_or_marker_p);
  DEFSUBR (Fnumber_char_or_marker_p);
#ifdef LISP_FLOAT_TYPE
  DEFSUBR (Ffloatp);
#endif /* LISP_FLOAT_TYPE */
  DEFSUBR (Fnatnump);
  DEFSUBR (Fsymbolp);
  DEFSUBR (Fkeywordp);
  DEFSUBR (Fstringp);
  DEFSUBR (Fvectorp);
  DEFSUBR (Fbitp);
  DEFSUBR (Fbit_vector_p);
  DEFSUBR (Farrayp);
  DEFSUBR (Fsequencep);
  DEFSUBR (Fmarkerp);
  DEFSUBR (Fsubrp);
  DEFSUBR (Fsubr_min_args);
  DEFSUBR (Fsubr_max_args);
  DEFSUBR (Fsubr_interactive);
  DEFSUBR (Fcompiled_function_p);
  DEFSUBR (Ftype_of);
  DEFSUBR (Fcar);
  DEFSUBR (Fcdr);
  DEFSUBR (Fcar_safe);
  DEFSUBR (Fcdr_safe);
  DEFSUBR (Fsetcar);
  DEFSUBR (Fsetcdr);
  DEFSUBR (Findirect_function);
  DEFSUBR (Faref);
  DEFSUBR (Faset);

  DEFSUBR (Fcompiled_function_instructions);
  DEFSUBR (Fcompiled_function_constants);
  DEFSUBR (Fcompiled_function_stack_depth);
  DEFSUBR (Fcompiled_function_arglist);
  DEFSUBR (Fcompiled_function_interactive);
  DEFSUBR (Fcompiled_function_doc_string);
  DEFSUBR (Fcompiled_function_domain);
#ifdef COMPILED_FUNCTION_ANNOTATION_HACK
  DEFSUBR (Fcompiled_function_annotation);
#endif

  DEFSUBR (Fnumber_to_string);
  DEFSUBR (Fstring_to_number);
  DEFSUBR (Feqlsign);
  DEFSUBR (Flss);
  DEFSUBR (Fgtr);
  DEFSUBR (Fleq);
  DEFSUBR (Fgeq);
  DEFSUBR (Fneq);
  DEFSUBR (Fzerop);
  DEFSUBR (Fplus);
  DEFSUBR (Fminus);
  DEFSUBR (Ftimes);
  DEFSUBR (Fquo);
  DEFSUBR (Frem);
  DEFSUBR (Fmod);
  DEFSUBR (Fmax);
  DEFSUBR (Fmin);
  DEFSUBR (Flogand);
  DEFSUBR (Flogior);
  DEFSUBR (Flogxor);
  DEFSUBR (Flsh);
  DEFSUBR (Fash);
  DEFSUBR (Fadd1);
  DEFSUBR (Fsub1);
  DEFSUBR (Flognot);

  DEFSUBR (Fweak_list_p);
  DEFSUBR (Fmake_weak_list);
  DEFSUBR (Fweak_list_type);
  DEFSUBR (Fweak_list_list);
  DEFSUBR (Fset_weak_list_list);
}

void
vars_of_data (void)
{
  /* This must not be staticpro'd */
  Vall_weak_lists = Qnil;

#ifdef DEBUG_XEMACS
  DEFVAR_INT ("debug-issue-ebola-notices", &debug_issue_ebola_notices /*
If non-nil, note when your code may be suffering from char-int confoundance.
That is to say, if XEmacs encounters a usage of `eq', `memq', `equal',
etc. where a int and a char with the same value are being compared,
it will issue a notice on stderr to this effect, along with a backtrace.
In such situations, the result would be different in XEmacs 19 versus
XEmacs 20, and you probably don't want this.

Note that in order to see these notices, you have to byte compile your
code under XEmacs 20 -- any code byte-compiled under XEmacs 19 will
have its chars and ints all confounded in the byte code, making it
impossible to accurately determine Ebola infection.
*/ );

  debug_issue_ebola_notices = 2; /* #### temporary hack */

  DEFVAR_INT ("debug-ebola-backtrace-length",
	      &debug_ebola_backtrace_length /*
Length (in stack frames) of short backtrace printed out in Ebola notices.
See `debug-issue-ebola-notices'.
*/ );
  debug_ebola_backtrace_length = 32;

#endif /* DEBUG_XEMACS */
}
