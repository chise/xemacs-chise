/* Random utility Lisp functions.
   Copyright (C) 1985, 86, 87, 93, 94, 95 Free Software Foundation, Inc.
   Copyright (C) 1995, 1996 Ben Wing.

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

/* Synched up with: Mule 2.0, FSF 19.30. */

/* This file has been Mule-ized. */

/* Note: FSF 19.30 has bool vectors.  We have bit vectors. */

/* Hacked on for Mule by Ben Wing, December 1994, January 1995. */

#include <config.h>

/* Note on some machines this defines `vector' as a typedef,
   so make sure we don't use that name in this file.  */
#undef vector
#define vector *****

#include "lisp.h"

#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#include <errno.h>

#include "buffer.h"
#include "bytecode.h"
#include "commands.h"
#include "device.h"
#include "events.h"
#include "extents.h"
#include "frame.h"
#include "systime.h"

/* NOTE: This symbol is also used in lread.c */
#define FEATUREP_SYNTAX

Lisp_Object Qstring_lessp;
Lisp_Object Qidentity;

static int internal_old_equal (Lisp_Object, Lisp_Object, int);

static Lisp_Object
mark_bit_vector (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  return Qnil;
}

static void
print_bit_vector (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  int i;
  struct Lisp_Bit_Vector *v = XBIT_VECTOR (obj);
  int len = bit_vector_length (v);
  int last = len;

  if (INTP (Vprint_length))
    last = min (len, XINT (Vprint_length));
  write_c_string ("#*", printcharfun);
  for (i = 0; i < last; i++)
    {
      if (bit_vector_bit (v, i))
	write_c_string ("1", printcharfun);
      else
	write_c_string ("0", printcharfun);
    }

  if (last != len)
    write_c_string ("...", printcharfun);
}

static int
bit_vector_equal (Lisp_Object o1, Lisp_Object o2, int depth)
{
  struct Lisp_Bit_Vector *v1 = XBIT_VECTOR (o1);
  struct Lisp_Bit_Vector *v2 = XBIT_VECTOR (o2);

  return ((bit_vector_length (v1) == bit_vector_length (v2)) &&
	  !memcmp (v1->bits, v2->bits,
		   BIT_VECTOR_LONG_STORAGE (bit_vector_length (v1)) *
		   sizeof (long)));
}

static unsigned long
bit_vector_hash (Lisp_Object obj, int depth)
{
  struct Lisp_Bit_Vector *v = XBIT_VECTOR (obj);
  return HASH2 (bit_vector_length (v),
		memory_hash (v->bits,
			     BIT_VECTOR_LONG_STORAGE (bit_vector_length (v)) *
			     sizeof (long)));
}

DEFINE_BASIC_LRECORD_IMPLEMENTATION ("bit-vector", bit_vector,
				     mark_bit_vector, print_bit_vector, 0,
				     bit_vector_equal, bit_vector_hash,
				     struct Lisp_Bit_Vector);

DEFUN ("identity", Fidentity, 1, 1, 0, /*
Return the argument unchanged.
*/
       (arg))
{
  return arg;
}

extern long get_random (void);
extern void seed_random (long arg);

DEFUN ("random", Frandom, 0, 1, 0, /*
Return a pseudo-random number.
All integers representable in Lisp are equally likely.
  On most systems, this is 28 bits' worth.
With positive integer argument N, return random number in interval [0,N).
With argument t, set the random number seed from the current time and pid.
*/
       (limit))
{
  EMACS_INT val;
  unsigned long denominator;

  if (EQ (limit, Qt))
    seed_random (getpid () + time (NULL));
  if (NATNUMP (limit) && !ZEROP (limit))
    {
      /* Try to take our random number from the higher bits of VAL,
	 not the lower, since (says Gentzel) the low bits of `random'
	 are less random than the higher ones.  We do this by using the
	 quotient rather than the remainder.  At the high end of the RNG
	 it's possible to get a quotient larger than limit; discarding
	 these values eliminates the bias that would otherwise appear
	 when using a large limit.  */
      denominator = ((unsigned long)1 << VALBITS) / XINT (limit);
      do
	val = get_random () / denominator;
      while (val >= XINT (limit));
    }
  else
    val = get_random ();

  return make_int (val);
}

/* Random data-structure functions */

#ifdef LOSING_BYTECODE

/* #### Delete this shit */

/* Charcount is a misnomer here as we might be dealing with the
   length of a vector or list, but emphasizes that we're not dealing
   with Bytecounts in strings */
static Charcount
length_with_bytecode_hack (Lisp_Object seq)
{
  if (!COMPILED_FUNCTIONP (seq))
    return XINT (Flength (seq));
  else
    {
      struct Lisp_Compiled_Function *b = XCOMPILED_FUNCTION (seq);

      return (b->flags.interactivep ? COMPILED_INTERACTIVE :
	      b->flags.domainp      ? COMPILED_DOMAIN :
	      COMPILED_DOC_STRING)
	+ 1;
    }
}

#endif /* LOSING_BYTECODE */

void
check_losing_bytecode (CONST char *function, Lisp_Object seq)
{
  if (COMPILED_FUNCTIONP (seq))
    error_with_frob
      (seq,
       "As of 20.3, `%s' no longer works with compiled-function objects",
       function);
}

DEFUN ("length", Flength, 1, 1, 0, /*
Return the length of vector, bit vector, list or string SEQUENCE.
*/
       (sequence))
{
 retry:
  if (STRINGP (sequence))
    return make_int (XSTRING_CHAR_LENGTH (sequence));
  else if (CONSP (sequence))
    {
      Lisp_Object tail;
      int i = 0;

      EXTERNAL_LIST_LOOP (tail, sequence)
	{
	  QUIT;
	  i++;
	}

      return make_int (i);
    }
  else if (VECTORP (sequence))
    return make_int (XVECTOR_LENGTH (sequence));
  else if (NILP (sequence))
    return Qzero;
  else if (BIT_VECTORP (sequence))
    return make_int (bit_vector_length (XBIT_VECTOR (sequence)));
  else
    {
      check_losing_bytecode ("length", sequence);
      sequence = wrong_type_argument (Qsequencep, sequence);
      goto retry;
    }
}

/* This does not check for quits.  That is safe
   since it must terminate.  */

DEFUN ("safe-length", Fsafe_length, 1, 1, 0, /*
Return the length of a list, but avoid error or infinite loop.
This function never gets an error.  If LIST is not really a list,
it returns 0.  If LIST is circular, it returns a finite value
which is at least the number of distinct elements.
*/
       (list))
{
  Lisp_Object halftail = list; /* Used to detect circular lists. */
  Lisp_Object tail;
  int len = 0;

  for (tail = list; CONSP (tail); tail = XCDR (tail))
    {
      if (EQ (tail, halftail) && len != 0)
	break;
      len++;
      if ((len & 1) == 0)
	halftail = XCDR (halftail);
    }

  return make_int (len);
}

/*** string functions. ***/

DEFUN ("string-equal", Fstring_equal, 2, 2, 0, /*
Return t if two strings have identical contents.
Case is significant.  Text properties are ignored.
\(Under XEmacs, `equal' also ignores text properties and extents in
strings, but this is not the case under FSF Emacs 19.  In FSF Emacs 20
`equal' is the same as in XEmacs, in that respect.)
Symbols are also allowed; their print names are used instead.
*/
       (s1, s2))
{
  Bytecount len;
  struct Lisp_String *p1, *p2;

  if (SYMBOLP (s1))
    p1 = XSYMBOL (s1)->name;
  else
    {
      CHECK_STRING (s1);
      p1 = XSTRING (s1);
    }

  if (SYMBOLP (s2))
    p2 = XSYMBOL (s2)->name;
  else
    {
      CHECK_STRING (s2);
      p2 = XSTRING (s2);
    }

  return (((len = string_length (p1)) == string_length (p2)) &&
	  !memcmp (string_data (p1), string_data (p2), len)) ? Qt : Qnil;
}


DEFUN ("string-lessp", Fstring_lessp, 2, 2, 0, /*
Return t if first arg string is less than second in lexicographic order.
If I18N2 support (but not Mule support) was compiled in, ordering is
determined by the locale. (Case is significant for the default C locale.)
In all other cases, comparison is simply done on a character-by-
character basis using the numeric value of a character. (Note that
this may not produce particularly meaningful results under Mule if
characters from different charsets are being compared.)

Symbols are also allowed; their print names are used instead.

The reason that the I18N2 locale-specific collation is not used under
Mule is that the locale model of internationalization does not handle
multiple charsets and thus has no hope of working properly under Mule.
What we really should do is create a collation table over all built-in
charsets.  This is extremely difficult to do from scratch, however.

Unicode is a good first step towards solving this problem.  In fact,
it is quite likely that a collation table exists (or will exist) for
Unicode.  When Unicode support is added to XEmacs/Mule, this problem
may be solved.
*/
       (s1, s2))
{
  struct Lisp_String *p1, *p2;
  Charcount end, len2;
  int i;

  if (SYMBOLP (s1))
    p1 = XSYMBOL (s1)->name;
  else
    {
      CHECK_STRING (s1);
      p1 = XSTRING (s1);
    }

  if (SYMBOLP (s2))
    p2 = XSYMBOL (s2)->name;
  else
    {
      CHECK_STRING (s2);
      p2 = XSTRING (s2);
    }

  end  = string_char_length (p1);
  len2 = string_char_length (p2);
  if (end > len2)
    end = len2;

#if defined (I18N2) && !defined (MULE)
  /* There is no hope of this working under Mule.  Even if we converted
     the data into an external format so that strcoll() processed it
     properly, it would still not work because strcoll() does not
     handle multiple locales.  This is the fundamental flaw in the
     locale model. */
  Bytecount bcend = charcount_to_bytecount (string_data (p1), end);
  /* Compare strings using collation order of locale. */
  /* Need to be tricky to handle embedded nulls. */

  for (i = 0; i < bcend; i += strlen((char *) string_data (p1) + i) + 1)
    {
      int val = strcoll ((char *) string_data (p1) + i,
			 (char *) string_data (p2) + i);
      if (val < 0)
	return Qt;
      if (val > 0)
	return Qnil;
    }
#else /* not I18N2, or MULE */
  /* #### It is not really necessary to do this: We could compare
     byte-by-byte and still get a reasonable comparison, since this
     would compare characters with a charset in the same way.
     With a little rearrangement of the leading bytes, we could
     make most inter-charset comparisons work out the same, too;
     even if some don't, this is not a big deal because inter-charset
     comparisons aren't really well-defined anyway. */
  for (i = 0; i < end; i++)
    {
      if (string_char (p1, i) != string_char (p2, i))
	return string_char (p1, i) < string_char (p2, i) ? Qt : Qnil;
    }
#endif /* not I18N2, or MULE */
  /* Can't do i < len2 because then comparison between "foo" and "foo^@"
     won't work right in I18N2 case */
  return end < len2 ? Qt : Qnil;
}

DEFUN ("string-modified-tick", Fstring_modified_tick, 1, 1, 0, /*
Return STRING's tick counter, incremented for each change to the string.
Each string has a tick counter which is incremented each time the contents
of the string are changed (e.g. with `aset').  It wraps around occasionally.
*/
       (string))
{
  struct Lisp_String *s;

  CHECK_STRING (string);
  s = XSTRING (string);
  if (CONSP (s->plist) && INTP (XCAR (s->plist)))
    return XCAR (s->plist);
  else
    return Qzero;
}

void
bump_string_modiff (Lisp_Object str)
{
  struct Lisp_String *s = XSTRING (str);
  Lisp_Object *ptr = &s->plist;

#ifdef I18N3
  /* #### remove the `string-translatable' property from the string,
     if there is one. */
#endif
  /* skip over extent info if it's there */
  if (CONSP (*ptr) && EXTENT_INFOP (XCAR (*ptr)))
    ptr = &XCDR (*ptr);
  if (CONSP (*ptr) && INTP (XCAR (*ptr)))
    XSETINT (XCAR (*ptr), 1+XINT (XCAR (*ptr)));
  else
    *ptr = Fcons (make_int (1), *ptr);
}


enum  concat_target_type { c_cons, c_string, c_vector, c_bit_vector };
static Lisp_Object concat (int nargs, Lisp_Object *args,
                           enum concat_target_type target_type,
                           int last_special);

Lisp_Object
concat2 (Lisp_Object s1, Lisp_Object s2)
{
  Lisp_Object args[2];
  args[0] = s1;
  args[1] = s2;
  return concat (2, args, c_string, 0);
}

Lisp_Object
concat3 (Lisp_Object s1, Lisp_Object s2, Lisp_Object s3)
{
  Lisp_Object args[3];
  args[0] = s1;
  args[1] = s2;
  args[2] = s3;
  return concat (3, args, c_string, 0);
}

Lisp_Object
vconcat2 (Lisp_Object s1, Lisp_Object s2)
{
  Lisp_Object args[2];
  args[0] = s1;
  args[1] = s2;
  return concat (2, args, c_vector, 0);
}

Lisp_Object
vconcat3 (Lisp_Object s1, Lisp_Object s2, Lisp_Object s3)
{
  Lisp_Object args[3];
  args[0] = s1;
  args[1] = s2;
  args[2] = s3;
  return concat (3, args, c_vector, 0);
}

DEFUN ("append", Fappend, 0, MANY, 0, /*
Concatenate all the arguments and make the result a list.
The result is a list whose elements are the elements of all the arguments.
Each argument may be a list, vector, bit vector, or string.
The last argument is not copied, just used as the tail of the new list.
Also see: `nconc'.
*/
       (int nargs, Lisp_Object *args))
{
  return concat (nargs, args, c_cons, 1);
}

DEFUN ("concat", Fconcat, 0, MANY, 0, /*
Concatenate all the arguments and make the result a string.
The result is a string whose elements are the elements of all the arguments.
Each argument may be a string or a list or vector of characters.

As of XEmacs 21.0, this function does NOT accept individual integers
as arguments.  Old code that relies on, for example, (concat "foo" 50)
returning "foo50" will fail.  To fix such code, either apply
`int-to-string' to the integer argument, or use `format'.
*/
       (int nargs, Lisp_Object *args))
{
  return concat (nargs, args, c_string, 0);
}

DEFUN ("vconcat", Fvconcat, 0, MANY, 0, /*
Concatenate all the arguments and make the result a vector.
The result is a vector whose elements are the elements of all the arguments.
Each argument may be a list, vector, bit vector, or string.
*/
       (int nargs, Lisp_Object *args))
{
  return concat (nargs, args, c_vector, 0);
}

DEFUN ("bvconcat", Fbvconcat, 0, MANY, 0, /*
Concatenate all the arguments and make the result a bit vector.
The result is a bit vector whose elements are the elements of all the
arguments.  Each argument may be a list, vector, bit vector, or string.
*/
       (int nargs, Lisp_Object *args))
{
  return concat (nargs, args, c_bit_vector, 0);
}

DEFUN ("copy-sequence", Fcopy_sequence, 1, 1, 0, /*
Return a copy of a list, vector, bit vector or string.
The elements of a list or vector are not copied; they are shared
with the original.
*/
       (arg))
{
 again:
  if (NILP (arg)) return arg;
  /* We handle conses separately because concat() is big and hairy and
     doesn't handle (copy-sequence '(a b . c)) and it's easier to redo this
     than to fix concat() without worrying about breaking other things.
   */
  if (CONSP (arg))
    {
      Lisp_Object head = Fcons (XCAR (arg), XCDR (arg));
      Lisp_Object tail = head;

      for (arg = XCDR (arg); CONSP (arg); arg = XCDR (arg))
	{
	  XCDR (tail) = Fcons (XCAR (arg), XCDR (arg));
	  tail = XCDR (tail);
	  QUIT;
	}
      return head;
    }
  if (STRINGP     (arg)) return concat (1, &arg, c_string,     0);
  if (VECTORP     (arg)) return concat (1, &arg, c_vector,     0);
  if (BIT_VECTORP (arg)) return concat (1, &arg, c_bit_vector, 0);

  check_losing_bytecode ("copy-sequence", arg);
  arg = wrong_type_argument (Qsequencep, arg);
  goto again;
}

struct merge_string_extents_struct
{
  Lisp_Object string;
  Bytecount entry_offset;
  Bytecount entry_length;
};

static Lisp_Object
concat (int nargs, Lisp_Object *args,
        enum concat_target_type target_type,
        int last_special)
{
  Lisp_Object val;
  Lisp_Object tail = Qnil;
  int toindex;
  int argnum;
  Lisp_Object last_tail;
  Lisp_Object prev;
  struct merge_string_extents_struct *args_mse = 0;
  Bufbyte *string_result = 0;
  Bufbyte *string_result_ptr = 0;
  struct gcpro gcpro1;

  /* The modus operandi in Emacs is "caller gc-protects args".
     However, concat is called many times in Emacs on freshly
     created stuff.  So we help those callers out by protecting
     the args ourselves to save them a lot of temporary-variable
     grief. */

  GCPRO1 (args[0]);
  gcpro1.nvars = nargs;

#ifdef I18N3
  /* #### if the result is a string and any of the strings have a string
     for the `string-translatable' property, then concat should also
     concat the args but use the `string-translatable' strings, and store
     the result in the returned string's `string-translatable' property. */
#endif
  if (target_type == c_string)
    args_mse = alloca_array (struct merge_string_extents_struct, nargs);

  /* In append, the last arg isn't treated like the others */
  if (last_special && nargs > 0)
    {
      nargs--;
      last_tail = args[nargs];
    }
  else
    last_tail = Qnil;

  /* Check and coerce the arguments. */
  for (argnum = 0; argnum < nargs; argnum++)
    {
      Lisp_Object seq = args[argnum];
      if (LISTP (seq))
        ;
      else if (VECTORP (seq) || STRINGP (seq) || BIT_VECTORP (seq))
        ;
#ifdef LOSING_BYTECODE
      else if (COMPILED_FUNCTIONP (seq))
        /* Urk!  We allow this, for "compatibility"... */
        ;
#endif
#if 0				/* removed for XEmacs 21 */
      else if (INTP (seq))
        /* This is too revolting to think about but maintains
           compatibility with FSF (and lots and lots of old code). */
        args[argnum] = Fnumber_to_string (seq);
#endif
      else
	{
          check_losing_bytecode ("concat", seq);
          args[argnum] = wrong_type_argument (Qsequencep, seq);
	}

      if (args_mse)
        {
          if (STRINGP (seq))
            args_mse[argnum].string = seq;
          else
            args_mse[argnum].string = Qnil;
        }
    }

  {
    /* Charcount is a misnomer here as we might be dealing with the
       length of a vector or list, but emphasizes that we're not dealing
       with Bytecounts in strings */
    Charcount total_length;

    for (argnum = 0, total_length = 0; argnum < nargs; argnum++)
      {
#ifdef LOSING_BYTECODE
        Charcount thislen = length_with_bytecode_hack (args[argnum]);
#else
        Charcount thislen = XINT (Flength (args[argnum]));
#endif
        total_length += thislen;
      }

    switch (target_type)
      {
      case c_cons:
        if (total_length == 0)
          /* In append, if all but last arg are nil, return last arg */
          RETURN_UNGCPRO (last_tail);
        val = Fmake_list (make_int (total_length), Qnil);
        break;
      case c_vector:
        val = make_vector (total_length, Qnil);
        break;
      case c_bit_vector:
        val = make_bit_vector (total_length, Qzero);
        break;
      case c_string:
	/* We don't make the string yet because we don't know the
	   actual number of bytes.  This loop was formerly written
	   to call Fmake_string() here and then call set_string_char()
	   for each char.  This seems logical enough but is waaaaaaaay
	   slow -- set_string_char() has to scan the whole string up
	   to the place where the substitution is called for in order
	   to find the place to change, and may have to do some
	   realloc()ing in order to make the char fit properly.
	   O(N^2) yuckage. */
        val = Qnil;
	string_result = (Bufbyte *) alloca (total_length * MAX_EMCHAR_LEN);
	string_result_ptr = string_result;
        break;
      default:
        abort ();
      }
  }


  if (CONSP (val))
    tail = val, toindex = -1;	/* -1 in toindex is flag we are
				    making a list */
  else
    toindex = 0;

  prev = Qnil;

  for (argnum = 0; argnum < nargs; argnum++)
    {
      Charcount thisleni = 0;
      Charcount thisindex = 0;
      Lisp_Object seq = args[argnum];
      Bufbyte *string_source_ptr = 0;
      Bufbyte *string_prev_result_ptr = string_result_ptr;

      if (!CONSP (seq))
	{
#ifdef LOSING_BYTECODE
	  thisleni = length_with_bytecode_hack (seq);
#else
	  thisleni = XINT (Flength (seq));
#endif
	}
      if (STRINGP (seq))
	string_source_ptr = XSTRING_DATA (seq);

      while (1)
	{
	  Lisp_Object elt;

	  /* We've come to the end of this arg, so exit. */
	  if (NILP (seq))
	    break;

	  /* Fetch next element of `seq' arg into `elt' */
	  if (CONSP (seq))
            {
              elt = XCAR (seq);
              seq = XCDR (seq);
            }
	  else
	    {
	      if (thisindex >= thisleni)
		break;

	      if (STRINGP (seq))
		{
		  elt = make_char (charptr_emchar (string_source_ptr));
		  INC_CHARPTR (string_source_ptr);
		}
	      else if (VECTORP (seq))
                elt = XVECTOR_DATA (seq)[thisindex];
	      else if (BIT_VECTORP (seq))
		elt = make_int (bit_vector_bit (XBIT_VECTOR (seq),
						thisindex));
              else
		elt = Felt (seq, make_int (thisindex));
              thisindex++;
	    }

	  /* Store into result */
	  if (toindex < 0)
	    {
	      /* toindex negative means we are making a list */
	      XCAR (tail) = elt;
	      prev = tail;
	      tail = XCDR (tail);
	    }
	  else if (VECTORP (val))
	    XVECTOR_DATA (val)[toindex++] = elt;
	  else if (BIT_VECTORP (val))
	    {
	      CHECK_BIT (elt);
	      set_bit_vector_bit (XBIT_VECTOR (val), toindex++, XINT (elt));
	    }
	  else
	    {
	      CHECK_CHAR_COERCE_INT (elt);
	      string_result_ptr += set_charptr_emchar (string_result_ptr,
						       XCHAR (elt));
	    }
	}
      if (args_mse)
	{
	  args_mse[argnum].entry_offset =
	    string_prev_result_ptr - string_result;
	  args_mse[argnum].entry_length =
	    string_result_ptr - string_prev_result_ptr;
	}
    }

  /* Now we finally make the string. */
  if (target_type == c_string)
    {
      val = make_string (string_result, string_result_ptr - string_result);
      for (argnum = 0; argnum < nargs; argnum++)
	{
	  if (STRINGP (args_mse[argnum].string))
	    copy_string_extents (val, args_mse[argnum].string,
				 args_mse[argnum].entry_offset, 0,
				 args_mse[argnum].entry_length);
	}
    }

  if (!NILP (prev))
    XCDR (prev) = last_tail;

  RETURN_UNGCPRO (val);
}

DEFUN ("copy-alist", Fcopy_alist, 1, 1, 0, /*
Return a copy of ALIST.
This is an alist which represents the same mapping from objects to objects,
but does not share the alist structure with ALIST.
The objects mapped (cars and cdrs of elements of the alist)
are shared, however.
Elements of ALIST that are not conses are also shared.
*/
       (alist))
{
  Lisp_Object tail;

  if (NILP (alist))
    return alist;
  CHECK_CONS (alist);

  alist = concat (1, &alist, c_cons, 0);
  for (tail = alist; CONSP (tail); tail = XCDR (tail))
    {
      Lisp_Object car = XCAR (tail);

      if (CONSP (car))
	XCAR (tail) = Fcons (XCAR (car), XCDR (car));
    }
  return alist;
}

DEFUN ("copy-tree", Fcopy_tree, 1, 2, 0, /*
Return a copy of a list and substructures.
The argument is copied, and any lists contained within it are copied
recursively.  Circularities and shared substructures are not preserved.
Second arg VECP causes vectors to be copied, too.  Strings and bit vectors
are not copied.
*/
       (arg, vecp))
{
  if (CONSP (arg))
    {
      Lisp_Object rest;
      rest = arg = Fcopy_sequence (arg);
      while (CONSP (rest))
	{
	  Lisp_Object elt = XCAR (rest);
	  QUIT;
	  if (CONSP (elt) || VECTORP (elt))
	    XCAR (rest) = Fcopy_tree (elt, vecp);
	  if (VECTORP (XCDR (rest))) /* hack for (a b . [c d]) */
	    XCDR (rest) = Fcopy_tree (XCDR (rest), vecp);
	  rest = XCDR (rest);
	}
    }
  else if (VECTORP (arg) && ! NILP (vecp))
    {
      int i = XVECTOR_LENGTH (arg);
      int j;
      arg = Fcopy_sequence (arg);
      for (j = 0; j < i; j++)
	{
	  Lisp_Object elt = XVECTOR_DATA (arg) [j];
	  QUIT;
	  if (CONSP (elt) || VECTORP (elt))
	    XVECTOR_DATA (arg) [j] = Fcopy_tree (elt, vecp);
	}
    }
  return arg;
}

DEFUN ("substring", Fsubstring, 2, 3, 0, /*
Return a substring of STRING, starting at index FROM and ending before TO.
TO may be nil or omitted; then the substring runs to the end of STRING.
If FROM or TO is negative, it counts from the end.
Relevant parts of the string-extent-data are copied in the new string.
*/
       (string, from, to))
{
  Charcount ccfr, ccto;
  Bytecount bfr, bto;
  Lisp_Object val;

  CHECK_STRING (string);
  /* Historically, FROM could not be omitted.  Whatever ... */
  CHECK_INT (from);
  get_string_range_char (string, from, to, &ccfr, &ccto,
			 GB_HISTORICAL_STRING_BEHAVIOR);
  bfr = charcount_to_bytecount (XSTRING_DATA (string), ccfr);
  bto = charcount_to_bytecount (XSTRING_DATA (string), ccto);
  val = make_string (XSTRING_DATA (string) + bfr, bto - bfr);
  /* Copy any applicable extent information into the new string: */
  copy_string_extents (val, string, 0, bfr, bto - bfr);
  return val;
}

DEFUN ("subseq", Fsubseq, 2, 3, 0, /*
Return a subsequence of SEQ, starting at index FROM and ending before TO.
TO may be nil or omitted; then the subsequence runs to the end of SEQ.
If FROM or TO is negative, it counts from the end.
The resulting subsequence is always the same type as the original
 sequence.
If SEQ is a string, relevant parts of the string-extent-data are copied
 to the new string.
*/
       (seq, from, to))
{
  int len, f, t;

  if (STRINGP (seq))
    return Fsubstring (seq, from, to);

  if (!LISTP (seq) && !VECTORP (seq) && !BIT_VECTORP (seq))
    {
      check_losing_bytecode ("subseq", seq);
      seq = wrong_type_argument (Qsequencep, seq);
    }

  len = XINT (Flength (seq));

  CHECK_INT (from);
  f = XINT (from);
  if (f < 0)
    f = len + f;

  if (NILP (to))
    t = len;
  else
    {
      CHECK_INT (to);
      t = XINT (to);
      if (t < 0)
	t = len + t;
    }

  if (!(0 <= f && f <= t && t <= len))
    args_out_of_range_3 (seq, make_int (f), make_int (t));

  if (VECTORP (seq))
    {
      Lisp_Object result = make_vector (t - f, Qnil);
      int i;
      Lisp_Object *in_elts  = XVECTOR_DATA (seq);
      Lisp_Object *out_elts = XVECTOR_DATA (result);

      for (i = f; i < t; i++)
	out_elts[i - f] = in_elts[i];
      return result;
    }

  if (LISTP (seq))
    {
      Lisp_Object result = Qnil;
      int i;

      seq = Fnthcdr (make_int (f), seq);

      for (i = f; i < t; i++)
	{
	  result = Fcons (Fcar (seq), result);
	  seq = Fcdr (seq);
	}

      return Fnreverse (result);
    }

  /* bit vector */
  {
    Lisp_Object result = make_bit_vector (t - f, Qzero);
    int i;

    for (i = f; i < t; i++)
      set_bit_vector_bit (XBIT_VECTOR (result), i - f,
			  bit_vector_bit (XBIT_VECTOR (seq), i));
    return result;
  }
}


DEFUN ("nthcdr", Fnthcdr, 2, 2, 0, /*
Take cdr N times on LIST, and return the result.
*/
       (n, list))
{
  REGISTER int i;
  REGISTER Lisp_Object tail = list;
  CHECK_NATNUM (n);
  for (i = XINT (n); i; i--)
    {
      if (CONSP (tail))
	tail = XCDR (tail);
      else if (NILP (tail))
	return Qnil;
      else
	{
	  tail = wrong_type_argument (Qlistp, tail);
	  i++;
	}
    }
  return tail;
}

DEFUN ("nth", Fnth, 2, 2, 0, /*
Return the Nth element of LIST.
N counts from zero.  If LIST is not that long, nil is returned.
*/
       (n, list))
{
  return Fcar (Fnthcdr (n, list));
}

DEFUN ("elt", Felt, 2, 2, 0, /*
Return element of SEQUENCE at index N.
*/
       (sequence, n))
{
 retry:
  CHECK_INT_COERCE_CHAR (n); /* yuck! */
  if (LISTP (sequence))
    {
      Lisp_Object tem = Fnthcdr (n, sequence);
      /* #### Utterly, completely, fucking disgusting.
       * #### The whole point of "elt" is that it operates on
       * #### sequences, and does error- (bounds-) checking.
       */
      if (CONSP (tem))
	return XCAR (tem);
      else
#if 1
	/* This is The Way It Has Always Been. */
	return Qnil;
#else
        /* This is The Way Mly and Cltl2 say It Should Be. */
        args_out_of_range (sequence, n);
#endif
    }
  else if (STRINGP (sequence)
           || VECTORP (sequence)
           || BIT_VECTORP (sequence))
    return Faref (sequence, n);
#ifdef LOSING_BYTECODE
  else if (COMPILED_FUNCTIONP (sequence))
    {
      int idx = XINT (n);
      if (idx < 0)
        {
        lose:
          args_out_of_range (sequence, n);
        }
      /* Utter perversity */
      {
        struct Lisp_Compiled_Function *b = XCOMPILED_FUNCTION (sequence);
        switch (idx)
          {
          case COMPILED_ARGLIST:
            return b->arglist;
          case COMPILED_BYTECODE:
            return b->bytecodes;
          case COMPILED_CONSTANTS:
            return b->constants;
          case COMPILED_STACK_DEPTH:
            return make_int (b->maxdepth);
          case COMPILED_DOC_STRING:
	    return compiled_function_documentation (b);
          case COMPILED_DOMAIN:
	    return compiled_function_domain (b);
          case COMPILED_INTERACTIVE:
	    if (b->flags.interactivep)
	      return compiled_function_interactive (b);
	    /* if we return nil, can't tell interactive with no args
	       from noninteractive. */
	    goto lose;
          default:
            goto lose;
          }
      }
    }
#endif /* LOSING_BYTECODE */
  else
    {
      check_losing_bytecode ("elt", sequence);
      sequence = wrong_type_argument (Qsequencep, sequence);
      goto retry;
    }
}

DEFUN ("member", Fmember, 2, 2, 0, /*
Return non-nil if ELT is an element of LIST.  Comparison done with `equal'.
The value is actually the tail of LIST whose car is ELT.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      CONCHECK_CONS (tail);
      if (internal_equal (elt, XCAR (tail), 0))
        return tail;
      QUIT;
    }
  return Qnil;
}

DEFUN ("old-member", Fold_member, 2, 2, 0, /*
Return non-nil if ELT is an element of LIST.  Comparison done with `old-equal'.
The value is actually the tail of LIST whose car is ELT.
This function is provided only for byte-code compatibility with v19.
Do not use it.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      CONCHECK_CONS (tail);
      if (internal_old_equal (elt, XCAR (tail), 0))
        return tail;
      QUIT;
    }
  return Qnil;
}

DEFUN ("memq", Fmemq, 2, 2, 0, /*
Return non-nil if ELT is an element of LIST.  Comparison done with `eq'.
The value is actually the tail of LIST whose car is ELT.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object tem;
      CONCHECK_CONS (tail);
      if (tem = XCAR (tail), EQ_WITH_EBOLA_NOTICE (elt, tem))
        return tail;
      QUIT;
    }
  return Qnil;
}

DEFUN ("old-memq", Fold_memq, 2, 2, 0, /*
Return non-nil if ELT is an element of LIST.  Comparison done with `old-eq'.
The value is actually the tail of LIST whose car is ELT.
This function is provided only for byte-code compatibility with v19.
Do not use it.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object tem;
      CONCHECK_CONS (tail);
      if (tem = XCAR (tail), HACKEQ_UNSAFE (elt, tem))
        return tail;
      QUIT;
    }
  return Qnil;
}

Lisp_Object
memq_no_quit (Lisp_Object elt, Lisp_Object list)
{
  REGISTER Lisp_Object tail;
  for (tail = list; CONSP (tail); tail = XCDR (tail))
    {
      REGISTER Lisp_Object tem;
      if (tem = XCAR (tail), EQ_WITH_EBOLA_NOTICE (elt, tem))
        return tail;
    }
  return Qnil;
}

DEFUN ("assoc", Fassoc, 2, 2, 0, /*
Return non-nil if KEY is `equal' to the car of an element of LIST.
The value is actually the element of LIST whose car equals KEY.
*/
       (key, list))
{
  /* This function can GC. */
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && internal_equal (XCAR (elt), key, 0))
	return elt;
      QUIT;
    }
  return Qnil;
}

DEFUN ("old-assoc", Fold_assoc, 2, 2, 0, /*
Return non-nil if KEY is `old-equal' to the car of an element of LIST.
The value is actually the element of LIST whose car equals KEY.
*/
       (key, list))
{
  /* This function can GC. */
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && internal_old_equal (XCAR (elt), key, 0))
	return elt;
      QUIT;
    }
  return Qnil;
}

Lisp_Object
assoc_no_quit (Lisp_Object key, Lisp_Object list)
{
  int speccount = specpdl_depth ();
  specbind (Qinhibit_quit, Qt);
  return unbind_to (speccount, Fassoc (key, list));
}

DEFUN ("assq", Fassq, 2, 2, 0, /*
Return non-nil if KEY is `eq' to the car of an element of LIST.
The value is actually the element of LIST whose car is KEY.
Elements of LIST that are not conses are ignored.
*/
       (key, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt, tem;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), EQ_WITH_EBOLA_NOTICE (key, tem)))
	return elt;
      QUIT;
    }
  return Qnil;
}

DEFUN ("old-assq", Fold_assq, 2, 2, 0, /*
Return non-nil if KEY is `old-eq' to the car of an element of LIST.
The value is actually the element of LIST whose car is KEY.
Elements of LIST that are not conses are ignored.
This function is provided only for byte-code compatibility with v19.
Do not use it.
*/
       (key, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt, tem;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), HACKEQ_UNSAFE (key, tem)))
	return elt;
      QUIT;
    }
  return Qnil;
}

/* Like Fassq but never report an error and do not allow quits.
   Use only on lists known never to be circular.  */

Lisp_Object
assq_no_quit (Lisp_Object key, Lisp_Object list)
{
  /* This cannot GC. */
  REGISTER Lisp_Object tail;
  for (tail = list; CONSP (tail); tail = XCDR (tail))
    {
      REGISTER Lisp_Object tem, elt;
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), EQ_WITH_EBOLA_NOTICE (key, tem)))
	  return elt;
    }
  return Qnil;
}

DEFUN ("rassoc", Frassoc, 2, 2, 0, /*
Return non-nil if KEY is `equal' to the cdr of an element of LIST.
The value is actually the element of LIST whose cdr equals KEY.
*/
       (key, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && internal_equal (XCDR (elt), key, 0))
	return elt;
      QUIT;
    }
  return Qnil;
}

DEFUN ("old-rassoc", Fold_rassoc, 2, 2, 0, /*
Return non-nil if KEY is `old-equal' to the cdr of an element of LIST.
The value is actually the element of LIST whose cdr equals KEY.
*/
       (key, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && internal_old_equal (XCDR (elt), key, 0))
	return elt;
      QUIT;
    }
  return Qnil;
}

DEFUN ("rassq", Frassq, 2, 2, 0, /*
Return non-nil if KEY is `eq' to the cdr of an element of LIST.
The value is actually the element of LIST whose cdr is KEY.
*/
       (key, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt, tem;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCDR (elt), EQ_WITH_EBOLA_NOTICE (key, tem)))
	return elt;
      QUIT;
    }
  return Qnil;
}

DEFUN ("old-rassq", Fold_rassq, 2, 2, 0, /*
Return non-nil if KEY is `old-eq' to the cdr of an element of LIST.
The value is actually the element of LIST whose cdr is KEY.
*/
       (key, list))
{
  REGISTER Lisp_Object tail;
  LIST_LOOP (tail, list)
    {
      REGISTER Lisp_Object elt, tem;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCDR (elt), HACKEQ_UNSAFE (key, tem)))
	return elt;
      QUIT;
    }
  return Qnil;
}

Lisp_Object
rassq_no_quit (Lisp_Object key, Lisp_Object list)
{
  REGISTER Lisp_Object tail;
  for (tail = list; CONSP (tail); tail = XCDR (tail))
    {
      REGISTER Lisp_Object elt, tem;
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCDR (elt), EQ_WITH_EBOLA_NOTICE (key, tem)))
	return elt;
    }
  return Qnil;
}


DEFUN ("delete", Fdelete, 2, 2, 0, /*
Delete by side effect any occurrences of ELT as a member of LIST.
The modified LIST is returned.  Comparison is done with `equal'.
If the first member of LIST is ELT, there is no way to remove it by side
effect; therefore, write `(setq foo (delete element foo))' to be sure
of changing the value of `foo'.
Also see: `remove'.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      CONCHECK_CONS (tail);
      if (internal_equal (elt, XCAR (tail), 0))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

DEFUN ("old-delete", Fold_delete, 2, 2, 0, /*
Delete by side effect any occurrences of ELT as a member of LIST.
The modified LIST is returned.  Comparison is done with `old-equal'.
If the first member of LIST is ELT, there is no way to remove it by side
effect; therefore, write `(setq foo (old-delete element foo))' to be sure
of changing the value of `foo'.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      CONCHECK_CONS (tail);
      if (internal_old_equal (elt, XCAR (tail), 0))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

DEFUN ("delq", Fdelq, 2, 2, 0, /*
Delete by side effect any occurrences of ELT as a member of LIST.
The modified LIST is returned.  Comparison is done with `eq'.
If the first member of LIST is ELT, there is no way to remove it by side
effect; therefore, write `(setq foo (delq element foo))' to be sure of
changing the value of `foo'.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      REGISTER Lisp_Object tem;
      CONCHECK_CONS (tail);
      if (tem = XCAR (tail), EQ_WITH_EBOLA_NOTICE (elt, tem))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

DEFUN ("old-delq", Fold_delq, 2, 2, 0, /*
Delete by side effect any occurrences of ELT as a member of LIST.
The modified LIST is returned.  Comparison is done with `old-eq'.
If the first member of LIST is ELT, there is no way to remove it by side
effect; therefore, write `(setq foo (old-delq element foo))' to be sure of
changing the value of `foo'.
*/
       (elt, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      REGISTER Lisp_Object tem;
      CONCHECK_CONS (tail);
      if (tem = XCAR (tail), HACKEQ_UNSAFE (elt, tem))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

/* no quit, no errors; be careful */

Lisp_Object
delq_no_quit (Lisp_Object elt, Lisp_Object list)
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (CONSP (tail))
    {
      REGISTER Lisp_Object tem;
      if (tem = XCAR (tail), EQ_WITH_EBOLA_NOTICE (elt, tem))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
    }
  return list;
}

/* Be VERY careful with this.  This is like delq_no_quit() but
   also calls free_cons() on the removed conses.  You must be SURE
   that no pointers to the freed conses remain around (e.g.
   someone else is pointing to part of the list).  This function
   is useful on internal lists that are used frequently and where
   the actual list doesn't escape beyond known code bounds. */

Lisp_Object
delq_no_quit_and_free_cons (Lisp_Object elt, Lisp_Object list)
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;
  struct Lisp_Cons *cons_to_free = NULL;

  while (CONSP (tail))
    {
      REGISTER Lisp_Object tem;
      if (tem = XCAR (tail), EQ_WITH_EBOLA_NOTICE (elt, tem))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	  cons_to_free = XCONS (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      if (cons_to_free)
	{
	  free_cons (cons_to_free);
	  cons_to_free = NULL;
	}
    }
  return list;
}

DEFUN ("remassoc", Fremassoc, 2, 2, 0, /*
Delete by side effect any elements of LIST whose car is `equal' to KEY.
The modified LIST is returned.  If the first member of LIST has a car
that is `equal' to KEY, there is no way to remove it by side effect;
therefore, write `(setq foo (remassoc key foo))' to be sure of changing
the value of `foo'.
*/
       (key, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      REGISTER Lisp_Object elt;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && internal_equal (key, XCAR (elt), 0))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

Lisp_Object
remassoc_no_quit (Lisp_Object key, Lisp_Object list)
{
  int speccount = specpdl_depth ();
  specbind (Qinhibit_quit, Qt);
  return unbind_to (speccount, Fremassoc (key, list));
}

DEFUN ("remassq", Fremassq, 2, 2, 0, /*
Delete by side effect any elements of LIST whose car is `eq' to KEY.
The modified LIST is returned.  If the first member of LIST has a car
that is `eq' to KEY, there is no way to remove it by side effect;
therefore, write `(setq foo (remassq key foo))' to be sure of changing
the value of `foo'.
*/
       (key, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      REGISTER Lisp_Object elt, tem;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), EQ_WITH_EBOLA_NOTICE (key, tem)))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

/* no quit, no errors; be careful */

Lisp_Object
remassq_no_quit (Lisp_Object key, Lisp_Object list)
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (CONSP (tail))
    {
      REGISTER Lisp_Object elt, tem;
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), EQ_WITH_EBOLA_NOTICE (key, tem)))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
    }
  return list;
}

DEFUN ("remrassoc", Fremrassoc, 2, 2, 0, /*
Delete by side effect any elements of LIST whose cdr is `equal' to VALUE.
The modified LIST is returned.  If the first member of LIST has a car
that is `equal' to VALUE, there is no way to remove it by side effect;
therefore, write `(setq foo (remrassoc value foo))' to be sure of changing
the value of `foo'.
*/
       (value, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      REGISTER Lisp_Object elt;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && internal_equal (value, XCDR (elt), 0))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

DEFUN ("remrassq", Fremrassq, 2, 2, 0, /*
Delete by side effect any elements of LIST whose cdr is `eq' to VALUE.
The modified LIST is returned.  If the first member of LIST has a car
that is `eq' to VALUE, there is no way to remove it by side effect;
therefore, write `(setq foo (remrassq value foo))' to be sure of changing
the value of `foo'.
*/
       (value, list))
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (!NILP (tail))
    {
      REGISTER Lisp_Object elt, tem;
      CONCHECK_CONS (tail);
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), EQ_WITH_EBOLA_NOTICE (value, tem)))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
      QUIT;
    }
  return list;
}

/* no quit, no errors; be careful */

Lisp_Object
remrassq_no_quit (Lisp_Object value, Lisp_Object list)
{
  REGISTER Lisp_Object tail = list;
  REGISTER Lisp_Object prev = Qnil;

  while (CONSP (tail))
    {
      REGISTER Lisp_Object elt, tem;
      elt = XCAR (tail);
      if (CONSP (elt) && (tem = XCAR (elt), EQ_WITH_EBOLA_NOTICE (value, tem)))
	{
	  if (NILP (prev))
	    list = XCDR (tail);
	  else
	    XCDR (prev) = XCDR (tail);
	}
      else
	prev = tail;
      tail = XCDR (tail);
    }
  return list;
}

DEFUN ("nreverse", Fnreverse, 1, 1, 0, /*
Reverse LIST by destructively modifying cdr pointers.
Return the beginning of the reversed list.
Also see: `reverse'.
*/
       (list))
{
  struct gcpro gcpro1, gcpro2;
  REGISTER Lisp_Object prev = Qnil;
  REGISTER Lisp_Object tail = list;

  /* We gcpro our args; see `nconc' */
  GCPRO2 (prev, tail);
  while (!NILP (tail))
    {
      REGISTER Lisp_Object next;
      QUIT;
      CONCHECK_CONS (tail);
      next = XCDR (tail);
      XCDR (tail) = prev;
      prev = tail;
      tail = next;
    }
  UNGCPRO;
  return prev;
}

DEFUN ("reverse", Freverse, 1, 1, 0, /*
Reverse LIST, copying.  Return the beginning of the reversed list.
See also the function `nreverse', which is used more often.
*/
       (list))
{
  REGISTER Lisp_Object tail;
  Lisp_Object new = Qnil;

  for (tail = list; CONSP (tail); tail = XCDR (tail))
    {
      new = Fcons (XCAR (tail), new);
      QUIT;
    }
  if (!NILP (tail))
    dead_wrong_type_argument (Qlistp, tail);
  return new;
}

static Lisp_Object list_merge (Lisp_Object org_l1, Lisp_Object org_l2,
                               Lisp_Object lisp_arg,
                               int (*pred_fn) (Lisp_Object, Lisp_Object,
                                               Lisp_Object lisp_arg));

Lisp_Object
list_sort (Lisp_Object list,
           Lisp_Object lisp_arg,
           int (*pred_fn) (Lisp_Object, Lisp_Object,
                           Lisp_Object lisp_arg))
{
  struct gcpro gcpro1, gcpro2, gcpro3;
  Lisp_Object back, tem;
  Lisp_Object front = list;
  Lisp_Object len = Flength (list);
  int length = XINT (len);

  if (length < 2)
    return list;

  XSETINT (len, (length / 2) - 1);
  tem = Fnthcdr (len, list);
  back = Fcdr (tem);
  Fsetcdr (tem, Qnil);

  GCPRO3 (front, back, lisp_arg);
  front = list_sort (front, lisp_arg, pred_fn);
  back = list_sort (back, lisp_arg, pred_fn);
  UNGCPRO;
  return list_merge (front, back, lisp_arg, pred_fn);
}


static int
merge_pred_function (Lisp_Object obj1, Lisp_Object obj2,
                     Lisp_Object pred)
{
  Lisp_Object tmp;

  /* prevents the GC from happening in call2 */
  int speccount = specpdl_depth ();
/* Emacs' GC doesn't actually relocate pointers, so this probably
   isn't strictly necessary */
  record_unwind_protect (restore_gc_inhibit,
                         make_int (gc_currently_forbidden));
  gc_currently_forbidden = 1;
  tmp = call2 (pred, obj1, obj2);
  unbind_to (speccount, Qnil);

  if (NILP (tmp))
    return -1;
  else
    return 1;
}

DEFUN ("sort", Fsort, 2, 2, 0, /*
Sort LIST, stably, comparing elements using PREDICATE.
Returns the sorted list.  LIST is modified by side effects.
PREDICATE is called with two elements of LIST, and should return T
if the first element is "less" than the second.
*/
       (list, pred))
{
  return list_sort (list, pred, merge_pred_function);
}

Lisp_Object
merge (Lisp_Object org_l1, Lisp_Object org_l2,
       Lisp_Object pred)
{
  return list_merge (org_l1, org_l2, pred, merge_pred_function);
}


static Lisp_Object
list_merge (Lisp_Object org_l1, Lisp_Object org_l2,
            Lisp_Object lisp_arg,
            int (*pred_fn) (Lisp_Object, Lisp_Object, Lisp_Object lisp_arg))
{
  Lisp_Object value;
  Lisp_Object tail;
  Lisp_Object tem;
  Lisp_Object l1, l2;
  struct gcpro gcpro1, gcpro2, gcpro3, gcpro4;

  l1 = org_l1;
  l2 = org_l2;
  tail = Qnil;
  value = Qnil;

  /* It is sufficient to protect org_l1 and org_l2.
     When l1 and l2 are updated, we copy the new values
     back into the org_ vars.  */

  GCPRO4 (org_l1, org_l2, lisp_arg, value);

  while (1)
    {
      if (NILP (l1))
	{
	  UNGCPRO;
	  if (NILP (tail))
	    return l2;
	  Fsetcdr (tail, l2);
	  return value;
	}
      if (NILP (l2))
	{
	  UNGCPRO;
	  if (NILP (tail))
	    return l1;
	  Fsetcdr (tail, l1);
	  return value;
	}

      if (((*pred_fn) (Fcar (l2), Fcar (l1), lisp_arg)) < 0)
	{
	  tem = l1;
	  l1 = Fcdr (l1);
	  org_l1 = l1;
	}
      else
	{
	  tem = l2;
	  l2 = Fcdr (l2);
	  org_l2 = l2;
	}
      if (NILP (tail))
	value = tem;
      else
	Fsetcdr (tail, tem);
      tail = tem;
    }
}


/************************************************************************/
/*	  	        property-list functions				*/
/************************************************************************/

/* For properties of text, we need to do order-insensitive comparison of
   plists.  That is, we need to compare two plists such that they are the
   same if they have the same set of keys, and equivalent values.
   So (a 1 b 2) would be equal to (b 2 a 1).

   NIL_MEANS_NOT_PRESENT is as in `plists-eq' etc.
   LAXP means use `equal' for comparisons.
 */
int
plists_differ (Lisp_Object a, Lisp_Object b, int nil_means_not_present,
	       int laxp, int depth)
{
  int eqp = (depth == -1);	/* -1 as depth means us eq, not equal. */
  int la, lb, m, i, fill;
  Lisp_Object *keys, *vals;
  char *flags;
  Lisp_Object rest;

  if (NILP (a) && NILP (b))
    return 0;

  Fcheck_valid_plist (a);
  Fcheck_valid_plist (b);

  la = XINT (Flength (a));
  lb = XINT (Flength (b));
  m = (la > lb ? la : lb);
  fill = 0;
  keys  = alloca_array (Lisp_Object, m);
  vals  = alloca_array (Lisp_Object, m);
  flags = alloca_array (char, m);

  /* First extract the pairs from A. */
  for (rest = a; !NILP (rest); rest = XCDR (XCDR (rest)))
    {
      Lisp_Object k = XCAR (rest);
      Lisp_Object v = XCAR (XCDR (rest));
      /* Maybe be Ebolified. */
      if (nil_means_not_present && NILP (v)) continue;
      keys [fill] = k;
      vals [fill] = v;
      flags[fill] = 0;
      fill++;
    }
  /* Now iterate over B, and stop if we find something that's not in A,
     or that doesn't match.  As we match, mark them. */
  for (rest = b; !NILP (rest); rest = XCDR (XCDR (rest)))
    {
      Lisp_Object k = XCAR (rest);
      Lisp_Object v = XCAR (XCDR (rest));
      /* Maybe be Ebolified. */
      if (nil_means_not_present && NILP (v)) continue;
      for (i = 0; i < fill; i++)
	{
	  if (!laxp ? EQ (k, keys [i]) : internal_equal (k, keys [i], depth))
	    {
	      if ((eqp
		   /* We narrowly escaped being Ebolified here. */
		   ? !EQ_WITH_EBOLA_NOTICE (v, vals [i])
		   : !internal_equal (v, vals [i], depth)))
		/* a property in B has a different value than in A */
		goto MISMATCH;
	      flags [i] = 1;
	      break;
	    }
	}
      if (i == fill)
	/* there are some properties in B that are not in A */
	goto MISMATCH;
    }
  /* Now check to see that all the properties in A were also in B */
  for (i = 0; i < fill; i++)
    if (flags [i] == 0)
      goto MISMATCH;

  /* Ok. */
  return 0;

 MISMATCH:
  return 1;
}

DEFUN ("plists-eq", Fplists_eq, 2, 3, 0, /*
Return non-nil if property lists A and B are `eq'.
A property list is an alternating list of keywords and values.
 This function does order-insensitive comparisons of the property lists:
 For example, the property lists '(a 1 b 2) and '(b 2 a 1) are equal.
 Comparison between values is done using `eq'.  See also `plists-equal'.
If optional arg NIL-MEANS-NOT-PRESENT is non-nil, then a property with
 a nil value is ignored.  This feature is a virus that has infected
 old Lisp implementations, but should not be used except for backward
 compatibility.
*/
       (a, b, nil_means_not_present))
{
  return (plists_differ (a, b, !NILP (nil_means_not_present), 0, -1)
	  ? Qnil : Qt);
}

DEFUN ("plists-equal", Fplists_equal, 2, 3, 0, /*
Return non-nil if property lists A and B are `equal'.
A property list is an alternating list of keywords and values.  This
 function does order-insensitive comparisons of the property lists: For
 example, the property lists '(a 1 b 2) and '(b 2 a 1) are equal.
 Comparison between values is done using `equal'.  See also `plists-eq'.
If optional arg NIL-MEANS-NOT-PRESENT is non-nil, then a property with
 a nil value is ignored.  This feature is a virus that has infected
 old Lisp implementations, but should not be used except for backward
 compatibility.
*/
       (a, b, nil_means_not_present))
{
  return (plists_differ (a, b, !NILP (nil_means_not_present), 0, 1)
	  ? Qnil : Qt);
}


DEFUN ("lax-plists-eq", Flax_plists_eq, 2, 3, 0, /*
Return non-nil if lax property lists A and B are `eq'.
A property list is an alternating list of keywords and values.
 This function does order-insensitive comparisons of the property lists:
 For example, the property lists '(a 1 b 2) and '(b 2 a 1) are equal.
 Comparison between values is done using `eq'.  See also `plists-equal'.
A lax property list is like a regular one except that comparisons between
 keywords is done using `equal' instead of `eq'.
If optional arg NIL-MEANS-NOT-PRESENT is non-nil, then a property with
 a nil value is ignored.  This feature is a virus that has infected
 old Lisp implementations, but should not be used except for backward
 compatibility.
*/
       (a, b, nil_means_not_present))
{
  return (plists_differ (a, b, !NILP (nil_means_not_present), 1, -1)
	  ? Qnil : Qt);
}

DEFUN ("lax-plists-equal", Flax_plists_equal, 2, 3, 0, /*
Return non-nil if lax property lists A and B are `equal'.
A property list is an alternating list of keywords and values.  This
 function does order-insensitive comparisons of the property lists: For
 example, the property lists '(a 1 b 2) and '(b 2 a 1) are equal.
 Comparison between values is done using `equal'.  See also `plists-eq'.
A lax property list is like a regular one except that comparisons between
 keywords is done using `equal' instead of `eq'.
If optional arg NIL-MEANS-NOT-PRESENT is non-nil, then a property with
 a nil value is ignored.  This feature is a virus that has infected
 old Lisp implementations, but should not be used except for backward
 compatibility.
*/
       (a, b, nil_means_not_present))
{
  return (plists_differ (a, b, !NILP (nil_means_not_present), 1, 1)
	  ? Qnil : Qt);
}

/* Return the value associated with key PROPERTY in property list PLIST.
   Return nil if key not found.  This function is used for internal
   property lists that cannot be directly manipulated by the user.
   */

Lisp_Object
internal_plist_get (Lisp_Object plist, Lisp_Object property)
{
  Lisp_Object tail = plist;

  for (; !NILP (tail); tail = XCDR (XCDR (tail)))
    {
      struct Lisp_Cons *c = XCONS (tail);
      if (EQ (c->car, property))
	return XCAR (c->cdr);
    }

  return Qunbound;
}

/* Set PLIST's value for PROPERTY to VALUE.  Analogous to
   internal_plist_get(). */

void
internal_plist_put (Lisp_Object *plist, Lisp_Object property,
		    Lisp_Object value)
{
  Lisp_Object tail;

  for (tail = *plist; !NILP (tail); tail = XCDR (XCDR (tail)))
    {
      if (EQ (XCAR (tail), property))
	{
	  XCAR (XCDR (tail)) = value;
	  return;
	}
    }

  *plist = Fcons (property, Fcons (value, *plist));
}

int
internal_remprop (Lisp_Object *plist, Lisp_Object property)
{
  Lisp_Object tail = *plist;

  if (NILP (tail))
    return 0;

  if (EQ (XCAR (tail), property))
    {
      *plist = XCDR (XCDR (tail));
      return 1;
    }

  for (tail = XCDR (tail); !NILP (XCDR (tail));
       tail = XCDR (XCDR (tail)))
    {
      struct Lisp_Cons *c = XCONS (tail);
      if (EQ (XCAR (c->cdr), property))
	{
	  c->cdr = XCDR (XCDR (c->cdr));
	  return 1;
	}
    }

  return 0;
}

/* Called on a malformed property list.  BADPLACE should be some
   place where truncating will form a good list -- i.e. we shouldn't
   result in a list with an odd length. */

static Lisp_Object
bad_bad_bunny (Lisp_Object *plist, Lisp_Object *badplace, Error_behavior errb)
{
  if (ERRB_EQ (errb, ERROR_ME))
    return Fsignal (Qmalformed_property_list, list2 (*plist, *badplace));
  else
    {
      if (ERRB_EQ (errb, ERROR_ME_WARN))
	{
	  warn_when_safe_lispobj
	    (Qlist, Qwarning,
	     list2 (build_string
		    ("Malformed property list -- list has been truncated"),
		    *plist));
	  *badplace = Qnil;
	}
      return Qunbound;
    }
}

/* Called on a circular property list.  BADPLACE should be some place
   where truncating will result in an even-length list, as above.
   If doesn't particularly matter where we truncate -- anywhere we
   truncate along the entire list will break the circularity, because
   it will create a terminus and the list currently doesn't have one.
*/

static Lisp_Object
bad_bad_turtle (Lisp_Object *plist, Lisp_Object *badplace, Error_behavior errb)
{
  if (ERRB_EQ (errb, ERROR_ME))
    /* #### Eek, this will probably result in another error
       when PLIST is printed out */
    return Fsignal (Qcircular_property_list, list1 (*plist));
  else
    {
      if (ERRB_EQ (errb, ERROR_ME_WARN))
	{
	  warn_when_safe_lispobj
	    (Qlist, Qwarning,
	     list2 (build_string
		    ("Circular property list -- list has been truncated"),
		    *plist));
	  *badplace = Qnil;
	}
      return Qunbound;
    }
}

/* Advance the tortoise pointer by two (one iteration of a property-list
   loop) and the hare pointer by four and verify that no malformations
   or circularities exist.  If so, return zero and store a value into
   RETVAL that should be returned by the calling function.  Otherwise,
   return 1.  See external_plist_get().
 */

static int
advance_plist_pointers (Lisp_Object *plist,
			Lisp_Object **tortoise, Lisp_Object **hare,
			Error_behavior errb, Lisp_Object *retval)
{
  int i;
  Lisp_Object *tortsave = *tortoise;

  /* Note that our "fixing" may be more brutal than necessary,
     but it's the user's own problem, not ours. if they went in and
     manually fucked up a plist. */

  for (i = 0; i < 2; i++)
    {
      /* This is a standard iteration of a defensive-loop-checking
         loop.  We just do it twice because we want to advance past
	 both the property and its value.

	 If the pointer indirection is confusing you, remember that
	 one level of indirection on the hare and tortoise pointers
	 is only due to pass-by-reference for this function.  The other
	 level is so that the plist can be fixed in place. */

      /* When we reach the end of a well-formed plist, **HARE is
	 nil.  In that case, we don't do anything at all except
	 advance TORTOISE by one.  Otherwise, we advance HARE
	 by two (making sure it's OK to do so), then advance
	 TORTOISE by one (it will always be OK to do so because
	 the HARE is always ahead of the TORTOISE and will have
	 already verified the path), then make sure TORTOISE and
	 HARE don't contain the same non-nil object -- if the
	 TORTOISE and the HARE ever meet, then obviously we're
	 in a circularity, and if we're in a circularity, then
	 the TORTOISE and the HARE can't cross paths without
	 meeting, since the HARE only gains one step over the
	 TORTOISE per iteration. */

      if (!NILP (**hare))
	{
	  Lisp_Object *haresave = *hare;
	  if (!CONSP (**hare))
	    {
	      *retval = bad_bad_bunny (plist, haresave, errb);
	      return 0;
	    }
	  *hare = &XCDR (**hare);
	  /* In a non-plist, we'd check here for a nil value for
	     **HARE, which is OK (it just means the list has an
	     odd number of elements).  In a plist, it's not OK
	     for the list to have an odd number of elements. */
	  if (!CONSP (**hare))
	    {
	      *retval = bad_bad_bunny (plist, haresave, errb);
	      return 0;
	    }
	  *hare = &XCDR (**hare);
	}

      *tortoise = &XCDR (**tortoise);
      if (!NILP (**hare) && EQ (**tortoise, **hare))
	{
	  *retval = bad_bad_turtle (plist, tortsave, errb);
	  return 0;
	}
    }

  return 1;
}

/* Return the value of PROPERTY from PLIST, or Qunbound if
   property is not on the list.

   PLIST is a Lisp-accessible property list, meaning that it
   has to be checked for malformations and circularities.

   If ERRB is ERROR_ME, an error will be signalled.  Otherwise, the
   function will never signal an error; and if ERRB is ERROR_ME_WARN,
   on finding a malformation or a circularity, it issues a warning and
   attempts to silently fix the problem.

   A pointer to PLIST is passed in so that PLIST can be successfully
   "fixed" even if the error is at the beginning of the plist. */

Lisp_Object
external_plist_get (Lisp_Object *plist, Lisp_Object property,
		    int laxp, Error_behavior errb)
{
  Lisp_Object *tortoise = plist;
  Lisp_Object *hare = plist;

  while (!NILP (*tortoise))
    {
      Lisp_Object *tortsave = tortoise;
      Lisp_Object retval;

      /* We do the standard tortoise/hare march.  We isolate the
	 grungy stuff to do this in advance_plist_pointers(), though.
	 To us, all this function does is advance the tortoise
	 pointer by two and the hare pointer by four and make sure
	 everything's OK.  We first advance the pointers and then
	 check if a property matched; this ensures that our
	 check for a matching property is safe. */

      if (!advance_plist_pointers (plist, &tortoise, &hare, errb, &retval))
	return retval;

      if (!laxp ? EQ (XCAR (*tortsave), property)
	  : internal_equal (XCAR (*tortsave), property, 0))
	return XCAR (XCDR (*tortsave));
    }

  return Qunbound;
}

/* Set PLIST's value for PROPERTY to VALUE, given a possibly
   malformed or circular plist.  Analogous to external_plist_get(). */

void
external_plist_put (Lisp_Object *plist, Lisp_Object property,
		    Lisp_Object value, int laxp, Error_behavior errb)
{
  Lisp_Object *tortoise = plist;
  Lisp_Object *hare = plist;

  while (!NILP (*tortoise))
    {
      Lisp_Object *tortsave = tortoise;
      Lisp_Object retval;

      /* See above */
      if (!advance_plist_pointers (plist, &tortoise, &hare, errb, &retval))
	return;

      if (!laxp ? EQ (XCAR (*tortsave), property)
	  : internal_equal (XCAR (*tortsave), property, 0))
	{
	  XCAR (XCDR (*tortsave)) = value;
	  return;
	}
    }

  *plist = Fcons (property, Fcons (value, *plist));
}

int
external_remprop (Lisp_Object *plist, Lisp_Object property,
		  int laxp, Error_behavior errb)
{
  Lisp_Object *tortoise = plist;
  Lisp_Object *hare = plist;

  while (!NILP (*tortoise))
    {
      Lisp_Object *tortsave = tortoise;
      Lisp_Object retval;

      /* See above */
      if (!advance_plist_pointers (plist, &tortoise, &hare, errb, &retval))
	return 0;

      if (!laxp ? EQ (XCAR (*tortsave), property)
	  : internal_equal (XCAR (*tortsave), property, 0))
	{
	  /* Now you see why it's so convenient to have that level
	     of indirection. */
	  *tortsave = XCDR (XCDR (*tortsave));
	  return 1;
	}
    }

  return 0;
}

DEFUN ("plist-get", Fplist_get, 2, 3, 0, /*
Extract a value from a property list.
PLIST is a property list, which is a list of the form
\(PROP1 VALUE1 PROP2 VALUE2...).  This function returns the value
corresponding to the given PROP, or DEFAULT if PROP is not
one of the properties on the list.
*/
       (plist, prop, default_))
{
  Lisp_Object val = external_plist_get (&plist, prop, 0, ERROR_ME);
  if (UNBOUNDP (val))
    return default_;
  return val;
}

DEFUN ("plist-put", Fplist_put, 3, 3, 0, /*
Change value in PLIST of PROP to VAL.
PLIST is a property list, which is a list of the form \(PROP1 VALUE1
PROP2 VALUE2 ...).  PROP is usually a symbol and VAL is any object.
If PROP is already a property on the list, its value is set to VAL,
otherwise the new PROP VAL pair is added.  The new plist is returned;
use `(setq x (plist-put x prop val))' to be sure to use the new value.
The PLIST is modified by side effects.
*/
       (plist, prop, val))
{
  external_plist_put (&plist, prop, val, 0, ERROR_ME);
  return plist;
}

DEFUN ("plist-remprop", Fplist_remprop, 2, 2, 0, /*
Remove from PLIST the property PROP and its value.
PLIST is a property list, which is a list of the form \(PROP1 VALUE1
PROP2 VALUE2 ...).  PROP is usually a symbol.  The new plist is
returned; use `(setq x (plist-remprop x prop val))' to be sure to use
the new value.  The PLIST is modified by side effects.
*/
       (plist, prop))
{
  external_remprop (&plist, prop, 0, ERROR_ME);
  return plist;
}

DEFUN ("plist-member", Fplist_member, 2, 2, 0, /*
Return t if PROP has a value specified in PLIST.
*/
       (plist, prop))
{
  return UNBOUNDP (Fplist_get (plist, prop, Qunbound)) ? Qnil : Qt;
}

DEFUN ("check-valid-plist", Fcheck_valid_plist, 1, 1, 0, /*
Given a plist, signal an error if there is anything wrong with it.
This means that it's a malformed or circular plist.
*/
       (plist))
{
  Lisp_Object *tortoise;
  Lisp_Object *hare;

 start_over:
  tortoise = &plist;
  hare = &plist;
  while (!NILP (*tortoise))
    {
      Lisp_Object retval;

      /* See above */
      if (!advance_plist_pointers (&plist, &tortoise, &hare, ERROR_ME,
				   &retval))
	goto start_over;
    }

  return Qnil;
}

DEFUN ("valid-plist-p", Fvalid_plist_p, 1, 1, 0, /*
Given a plist, return non-nil if its format is correct.
If it returns nil, `check-valid-plist' will signal an error when given
the plist; that means it's a malformed or circular plist or has non-symbols
as keywords.
*/
       (plist))
{
  Lisp_Object *tortoise;
  Lisp_Object *hare;

  tortoise = &plist;
  hare = &plist;
  while (!NILP (*tortoise))
    {
      Lisp_Object retval;

      /* See above */
      if (!advance_plist_pointers (&plist, &tortoise, &hare, ERROR_ME_NOT,
				   &retval))
	return Qnil;
    }

  return Qt;
}

DEFUN ("canonicalize-plist", Fcanonicalize_plist, 1, 2, 0, /*
Destructively remove any duplicate entries from a plist.
In such cases, the first entry applies.

If optional arg NIL-MEANS-NOT-PRESENT is non-nil, then a property with
 a nil value is removed.  This feature is a virus that has infected
 old Lisp implementations, but should not be used except for backward
 compatibility.

The new plist is returned.  If NIL-MEANS-NOT-PRESENT is given, the
 return value may not be EQ to the passed-in value, so make sure to
 `setq' the value back into where it came from.
*/
       (plist, nil_means_not_present))
{
  Lisp_Object head = plist;

  Fcheck_valid_plist (plist);

  while (!NILP (plist))
    {
      Lisp_Object prop = Fcar (plist);
      Lisp_Object next = Fcdr (plist);

      CHECK_CONS (next); /* just make doubly sure we catch any errors */
      if (!NILP (nil_means_not_present) && NILP (Fcar (next)))
	{
	  if (EQ (head, plist))
	    head = Fcdr (next);
	  plist = Fcdr (next);
	  continue;
	}
      /* external_remprop returns 1 if it removed any property.
	 We have to loop till it didn't remove anything, in case
	 the property occurs many times. */
      while (external_remprop (&XCDR (next), prop, 0, ERROR_ME));
      plist = Fcdr (next);
    }

  return head;
}

DEFUN ("lax-plist-get", Flax_plist_get, 2, 3, 0, /*
Extract a value from a lax property list.

LAX-PLIST is a lax property list, which is a list of the form \(PROP1
VALUE1 PROP2 VALUE2...), where comparions between properties is done
using `equal' instead of `eq'.  This function returns the value
corresponding to the given PROP, or DEFAULT if PROP is not one of the
properties on the list.
*/
       (lax_plist, prop, default_))
{
  Lisp_Object val = external_plist_get (&lax_plist, prop, 1, ERROR_ME);
  if (UNBOUNDP (val))
    return default_;
  return val;
}

DEFUN ("lax-plist-put", Flax_plist_put, 3, 3, 0, /*
Change value in LAX-PLIST of PROP to VAL.
LAX-PLIST is a lax property list, which is a list of the form \(PROP1
VALUE1 PROP2 VALUE2...), where comparions between properties is done
using `equal' instead of `eq'.  PROP is usually a symbol and VAL is
any object.  If PROP is already a property on the list, its value is
set to VAL, otherwise the new PROP VAL pair is added.  The new plist
is returned; use `(setq x (lax-plist-put x prop val))' to be sure to
use the new value.  The LAX-PLIST is modified by side effects.
*/
       (lax_plist, prop, val))
{
  external_plist_put (&lax_plist, prop, val, 1, ERROR_ME);
  return lax_plist;
}

DEFUN ("lax-plist-remprop", Flax_plist_remprop, 2, 2, 0, /*
Remove from LAX-PLIST the property PROP and its value.
LAX-PLIST is a lax property list, which is a list of the form \(PROP1
VALUE1 PROP2 VALUE2...), where comparions between properties is done
using `equal' instead of `eq'.  PROP is usually a symbol.  The new
plist is returned; use `(setq x (lax-plist-remprop x prop val))' to be
sure to use the new value.  The LAX-PLIST is modified by side effects.
*/
       (lax_plist, prop))
{
  external_remprop (&lax_plist, prop, 1, ERROR_ME);
  return lax_plist;
}

DEFUN ("lax-plist-member", Flax_plist_member, 2, 2, 0, /*
Return t if PROP has a value specified in LAX-PLIST.
LAX-PLIST is a lax property list, which is a list of the form \(PROP1
VALUE1 PROP2 VALUE2...), where comparions between properties is done
using `equal' instead of `eq'.
*/
       (lax_plist, prop))
{
  return UNBOUNDP (Flax_plist_get (lax_plist, prop, Qunbound)) ? Qnil : Qt;
}

DEFUN ("canonicalize-lax-plist", Fcanonicalize_lax_plist, 1, 2, 0, /*
Destructively remove any duplicate entries from a lax plist.
In such cases, the first entry applies.

If optional arg NIL-MEANS-NOT-PRESENT is non-nil, then a property with
 a nil value is removed.  This feature is a virus that has infected
 old Lisp implementations, but should not be used except for backward
 compatibility.

The new plist is returned.  If NIL-MEANS-NOT-PRESENT is given, the
 return value may not be EQ to the passed-in value, so make sure to
 `setq' the value back into where it came from.
*/
       (lax_plist, nil_means_not_present))
{
  Lisp_Object head = lax_plist;

  Fcheck_valid_plist (lax_plist);

  while (!NILP (lax_plist))
    {
      Lisp_Object prop = Fcar (lax_plist);
      Lisp_Object next = Fcdr (lax_plist);

      CHECK_CONS (next); /* just make doubly sure we catch any errors */
      if (!NILP (nil_means_not_present) && NILP (Fcar (next)))
	{
	  if (EQ (head, lax_plist))
	    head = Fcdr (next);
	  lax_plist = Fcdr (next);
	  continue;
	}
      /* external_remprop returns 1 if it removed any property.
	 We have to loop till it didn't remove anything, in case
	 the property occurs many times. */
      while (external_remprop (&XCDR (next), prop, 1, ERROR_ME));
      lax_plist = Fcdr (next);
    }

  return head;
}

/* In C because the frame props stuff uses it */

DEFUN ("destructive-alist-to-plist", Fdestructive_alist_to_plist, 1, 1, 0, /*
Convert association list ALIST into the equivalent property-list form.
The plist is returned.  This converts from

\((a . 1) (b . 2) (c . 3))

into

\(a 1 b 2 c 3)

The original alist is destroyed in the process of constructing the plist.
See also `alist-to-plist'.
*/
       (alist))
{
  Lisp_Object head = alist;
  while (!NILP (alist))
    {
      /* remember the alist element. */
      Lisp_Object el = Fcar (alist);

      Fsetcar (alist, Fcar (el));
      Fsetcar (el, Fcdr (el));
      Fsetcdr (el, Fcdr (alist));
      Fsetcdr (alist, el);
      alist = Fcdr (Fcdr (alist));
    }

  return head;
}

/* Symbol plists are directly accessible, so we need to protect against
   invalid property list structure */

static Lisp_Object
symbol_getprop (Lisp_Object sym, Lisp_Object propname, Lisp_Object default_)
{
  Lisp_Object val = external_plist_get (&XSYMBOL (sym)->plist, propname,
					0, ERROR_ME);
  return UNBOUNDP (val) ? default_ : val;
}

static void
symbol_putprop (Lisp_Object sym, Lisp_Object propname, Lisp_Object value)
{
  external_plist_put (&XSYMBOL (sym)->plist, propname, value, 0, ERROR_ME);
}

static int
symbol_remprop (Lisp_Object symbol, Lisp_Object propname)
{
  return external_remprop (&XSYMBOL (symbol)->plist, propname, 0, ERROR_ME);
}

/* We store the string's extent info as the first element of the string's
   property list; and the string's MODIFF as the first or second element
   of the string's property list (depending on whether the extent info
   is present), but only if the string has been modified.  This is ugly
   but it reduces the memory allocated for the string in the vast
   majority of cases, where the string is never modified and has no
   extent info. */


static Lisp_Object *
string_plist_ptr (struct Lisp_String *s)
{
  Lisp_Object *ptr = &s->plist;

  if (CONSP (*ptr) && EXTENT_INFOP (XCAR (*ptr)))
    ptr = &XCDR (*ptr);
  if (CONSP (*ptr) && INTP (XCAR (*ptr)))
    ptr = &XCDR (*ptr);
  return ptr;
}

static Lisp_Object
string_getprop (struct Lisp_String *s, Lisp_Object property,
		Lisp_Object default_)
{
  Lisp_Object val = external_plist_get (string_plist_ptr (s), property, 0,
					ERROR_ME);
  return UNBOUNDP (val) ? default_ : val;
}

static void
string_putprop (struct Lisp_String *s, Lisp_Object property,
		Lisp_Object value)
{
  external_plist_put (string_plist_ptr (s), property, value, 0, ERROR_ME);
}

static int
string_remprop (struct Lisp_String *s, Lisp_Object property)
{
  return external_remprop (string_plist_ptr (s), property, 0, ERROR_ME);
}

static Lisp_Object
string_plist (struct Lisp_String *s)
{
  return *string_plist_ptr (s);
}

DEFUN ("get", Fget, 2, 3, 0, /*
Return the value of OBJECT's PROPNAME property.
This is the last VALUE stored with `(put OBJECT PROPNAME VALUE)'.
If there is no such property, return optional third arg DEFAULT
\(which defaults to `nil').  OBJECT can be a symbol, face, extent,
or string.  See also `put', `remprop', and `object-plist'.
*/
       (object, propname, default_))
{
  Lisp_Object val;

  /* Various places in emacs call Fget() and expect it not to quit,
     so don't quit. */

  /* It's easiest to treat symbols specially because they may not
     be an lrecord */
  if (SYMBOLP (object))
    val = symbol_getprop (object, propname, default_);
  else if (STRINGP (object))
    val = string_getprop (XSTRING (object), propname, default_);
  else if (LRECORDP (object))
    {
      CONST struct lrecord_implementation
	*imp = XRECORD_LHEADER_IMPLEMENTATION (object);
      if (imp->getprop)
	{
	  val = (imp->getprop) (object, propname);
	  if (UNBOUNDP (val))
	    val = default_;
	}
      else
	goto noprops;
    }
  else
    {
    noprops:
      signal_simple_error ("Object type has no properties", object);
    }

  return val;
}

DEFUN ("put", Fput, 3, 3, 0, /*
Store OBJECT's PROPNAME property with value VALUE.
It can be retrieved with `(get OBJECT PROPNAME)'.  OBJECT can be a
symbol, face, extent, or string.

For a string, no properties currently have predefined meanings.
For the predefined properties for extents, see `set-extent-property'.
For the predefined properties for faces, see `set-face-property'.

See also `get', `remprop', and `object-plist'.
*/
       (object, propname, value))
{
  CHECK_SYMBOL (propname);
  CHECK_IMPURE (object);

  if (SYMBOLP (object))
    symbol_putprop (object, propname, value);
  else if (STRINGP (object))
    string_putprop (XSTRING (object), propname, value);
  else if (LRECORDP (object))
    {
      CONST struct lrecord_implementation
	*imp = XRECORD_LHEADER_IMPLEMENTATION (object);
      if (imp->putprop)
	{
	  if (! (imp->putprop) (object, propname, value))
	    signal_simple_error ("Can't set property on object", propname);
	}
      else
	goto noprops;
    }
  else
    {
    noprops:
      signal_simple_error ("Object type has no settable properties", object);
    }

  return value;
}

void
pure_put (Lisp_Object sym, Lisp_Object prop, Lisp_Object val)
{
  Fput (sym, prop, Fpurecopy (val));
}

DEFUN ("remprop", Fremprop, 2, 2, 0, /*
Remove from OBJECT's property list the property PROPNAME and its
value.  OBJECT can be a symbol, face, extent, or string.  Returns
non-nil if the property list was actually changed (i.e. if PROPNAME
was present in the property list).  See also `get', `put', and
`object-plist'.
*/
       (object, propname))
{
  int retval = 0;

  CHECK_SYMBOL (propname);
  CHECK_IMPURE (object);

  if (SYMBOLP (object))
    retval = symbol_remprop (object, propname);
  else if (STRINGP (object))
    retval = string_remprop (XSTRING (object), propname);
  else if (LRECORDP (object))
    {
      CONST struct lrecord_implementation
	*imp = XRECORD_LHEADER_IMPLEMENTATION (object);
      if (imp->remprop)
	{
	  retval = (imp->remprop) (object, propname);
	  if (retval == -1)
	    signal_simple_error ("Can't remove property from object",
				 propname);
	}
      else
	goto noprops;
    }
  else
    {
    noprops:
      signal_simple_error ("Object type has no removable properties", object);
    }

  return retval ? Qt : Qnil;
}

DEFUN ("object-plist", Fobject_plist, 1, 1, 0, /*
Return a property list of OBJECT's props.
For a symbol this is equivalent to `symbol-plist'.
Do not modify the property list directly; this may or may not have
the desired effects. (In particular, for a property with a special
interpretation, this will probably have no effect at all.)
*/
       (object))
{
  if (SYMBOLP (object))
    return Fsymbol_plist (object);
  else if (STRINGP (object))
    return string_plist (XSTRING (object));
  else if (LRECORDP (object))
    {
      CONST struct lrecord_implementation
	*imp = XRECORD_LHEADER_IMPLEMENTATION (object);
      if (imp->plist)
	return (imp->plist) (object);
      else
	signal_simple_error ("Object type has no properties", object);
    }
  else
    signal_simple_error ("Object type has no properties", object);

  return Qnil;
}


int
internal_equal (Lisp_Object o1, Lisp_Object o2, int depth)
{
  if (depth > 200)
    error ("Stack overflow in equal");
#ifndef LRECORD_CONS
 do_cdr:
#endif
  QUIT;
  if (EQ_WITH_EBOLA_NOTICE (o1, o2))
    return 1;
  /* Note that (equal 20 20.0) should be nil */
  else if (XTYPE (o1) != XTYPE (o2))
    return 0;
#ifndef LRECORD_CONS
  else if (CONSP (o1))
    {
      if (!internal_equal (XCAR (o1), XCAR (o2), depth + 1))
        return 0;
      o1 = XCDR (o1);
      o2 = XCDR (o2);
      goto do_cdr;
    }
#endif
#ifndef LRECORD_VECTOR
  else if (VECTORP (o1))
    {
      Lisp_Object *v1 = XVECTOR_DATA (o1);
      Lisp_Object *v2 = XVECTOR_DATA (o2);
      int len = XVECTOR_LENGTH (o1);
      if (len != XVECTOR_LENGTH (o2))
	return 0;
      while (len--)
	if (!internal_equal (*v1++, *v2++, depth + 1))
	  return 0;
      return 1;
    }
#endif
#ifndef LRECORD_STRING
  else if (STRINGP (o1))
    {
      Bytecount len;
      return (((len = XSTRING_LENGTH (o1)) == XSTRING_LENGTH (o2)) &&
	      !memcmp (XSTRING_DATA (o1), XSTRING_DATA (o2), len));
    }
#endif
  else if (LRECORDP (o1))
    {
      CONST struct lrecord_implementation
	*imp1 = XRECORD_LHEADER_IMPLEMENTATION (o1),
	*imp2 = XRECORD_LHEADER_IMPLEMENTATION (o2);
      if (imp1 != imp2)
	return 0;
      else if (imp1->equal == 0)
	/* EQ-ness of the objects was noticed above */
	return 0;
      else
	return (imp1->equal) (o1, o2, depth);
    }

  return 0;
}

/* Note that we may be calling sub-objects that will use
   internal_equal() (instead of internal_old_equal()).  Oh well.
   We will get an Ebola note if there's any possibility of confusion,
   but that seems unlikely. */

static int
internal_old_equal (Lisp_Object o1, Lisp_Object o2, int depth)
{
  if (depth > 200)
    error ("Stack overflow in equal");
#ifndef LRECORD_CONS
 do_cdr:
#endif
  QUIT;
  if (HACKEQ_UNSAFE (o1, o2))
    return 1;
  /* Note that (equal 20 20.0) should be nil */
  else if (XTYPE (o1) != XTYPE (o2))
    return 0;
#ifndef LRECORD_CONS
  else if (CONSP (o1))
    {
      if (!internal_old_equal (XCAR (o1), XCAR (o2), depth + 1))
        return 0;
      o1 = XCDR (o1);
      o2 = XCDR (o2);
      goto do_cdr;
    }
#endif
#ifndef LRECORD_VECTOR
  else if (VECTORP (o1))
    {
      int indice;
      int len = XVECTOR_LENGTH (o1);
      if (len != XVECTOR_LENGTH (o2))
	return 0;
      for (indice = 0; indice < len; indice++)
	{
	  if (!internal_old_equal (XVECTOR_DATA (o1) [indice],
				   XVECTOR_DATA (o2) [indice],
				   depth + 1))
            return 0;
	}
      return 1;
    }
#endif
#ifndef LRECORD_STRING
  else if (STRINGP (o1))
    {
      Bytecount len = XSTRING_LENGTH (o1);
      if (len != XSTRING_LENGTH (o2))
	return 0;
      if (memcmp (XSTRING_DATA (o1), XSTRING_DATA (o2), len))
	return 0;
      return 1;
    }
#endif
  else if (LRECORDP (o1))
    {
      CONST struct lrecord_implementation
	*imp1 = XRECORD_LHEADER_IMPLEMENTATION (o1),
	*imp2 = XRECORD_LHEADER_IMPLEMENTATION (o2);
      if (imp1 != imp2)
	return 0;
      else if (imp1->equal == 0)
	/* EQ-ness of the objects was noticed above */
	return 0;
      else
	return (imp1->equal) (o1, o2, depth);
    }

  return 0;
}

DEFUN ("equal", Fequal, 2, 2, 0, /*
Return t if two Lisp objects have similar structure and contents.
They must have the same data type.
Conses are compared by comparing the cars and the cdrs.
Vectors and strings are compared element by element.
Numbers are compared by value.  Symbols must match exactly.
*/
       (o1, o2))
{
  return internal_equal (o1, o2, 0) ? Qt : Qnil;
}

DEFUN ("old-equal", Fold_equal, 2, 2, 0, /*
Return t if two Lisp objects have similar structure and contents.
They must have the same data type.
\(Note, however, that an exception is made for characters and integers;
this is known as the "char-int confoundance disease." See `eq' and
`old-eq'.)
This function is provided only for byte-code compatibility with v19.
Do not use it.
*/
       (o1, o2))
{
  return internal_old_equal (o1, o2, 0) ? Qt : Qnil;
}


DEFUN ("fillarray", Ffillarray, 2, 2, 0, /*
Store each element of ARRAY with ITEM.
ARRAY is a vector, bit vector, or string.
*/
       (array, item))
{
 retry:
  if (STRINGP (array))
    {
      Emchar charval;
      struct Lisp_String *s = XSTRING (array);
      Charcount len = string_char_length (s);
      Charcount i;
      CHECK_CHAR_COERCE_INT (item);
      CHECK_IMPURE (array);
      charval = XCHAR (item);
      for (i = 0; i < len; i++)
	set_string_char (s, i, charval);
      bump_string_modiff (array);
    }
  else if (VECTORP (array))
    {
      Lisp_Object *p = XVECTOR_DATA (array);
      int len = XVECTOR_LENGTH (array);
      CHECK_IMPURE (array);
      while (len--)
	*p++ = item;
    }
  else if (BIT_VECTORP (array))
    {
      struct Lisp_Bit_Vector *v = XBIT_VECTOR (array);
      int len = bit_vector_length (v);
      int bit;
      CHECK_BIT (item);
      CHECK_IMPURE (array);
      bit = XINT (item);
      while (len--)
	set_bit_vector_bit (v, len, bit);
    }
  else
    {
      array = wrong_type_argument (Qarrayp, array);
      goto retry;
    }
  return array;
}

Lisp_Object
nconc2 (Lisp_Object s1, Lisp_Object s2)
{
  Lisp_Object args[2];
  args[0] = s1;
  args[1] = s2;
  return Fnconc (2, args);
}

DEFUN ("nconc", Fnconc, 0, MANY, 0, /*
Concatenate any number of lists by altering them.
Only the last argument is not altered, and need not be a list.
Also see: `append'.
If the first argument is nil, there is no way to modify it by side
effect; therefore, write `(setq foo (nconc foo list))' to be sure of
changing the value of `foo'.
*/
       (int nargs, Lisp_Object *args))
{
  int argnum = 0;
  struct gcpro gcpro1;

  /* The modus operandi in Emacs is "caller gc-protects args".
     However, nconc (particularly nconc2 ()) is called many times
     in Emacs on freshly created stuff (e.g. you see the idiom
     nconc2 (Fcopy_sequence (foo), bar) a lot).  So we help those
     callers out by protecting the args ourselves to save them
     a lot of temporary-variable grief. */

  GCPRO1 (args[0]);
  gcpro1.nvars = nargs;

  while (argnum < nargs)
    {
      Lisp_Object val = args[argnum];
      if (CONSP (val))
	{
	  /* Found the first cons, which will be our return value.  */
	  Lisp_Object last = val;

	  for (argnum++; argnum < nargs; argnum++)
	    {
	      Lisp_Object next = args[argnum];
	    redo:
	      if (CONSP (next) || argnum == nargs -1)
		{
		  /* (setcdr (last val) next) */
		  while (CONSP (XCDR (last)))
		    {
		      last = XCDR (last);
		      QUIT;
		    }
		  XCDR (last) = next;
		}
	      else if (NILP (next))
		{
		  continue;
		}
	      else
		{
		  next = wrong_type_argument (next, Qlistp);
		  goto redo;
		}
	    }
	  RETURN_UNGCPRO (val);
        }
      else if (NILP (val))
	argnum++;
      else if (argnum == nargs - 1) /* last arg? */
	RETURN_UNGCPRO (val);
      else
	args[argnum] = wrong_type_argument (val, Qlistp);
    }
  RETURN_UNGCPRO (Qnil);  /* No non-nil args provided. */
}


/* This is the guts of all mapping functions.
 Apply fn to each element of seq, one by one,
 storing the results into elements of vals, a C vector of Lisp_Objects.
 leni is the length of vals, which should also be the length of seq.

 If VALS is a null pointer, do not accumulate the results. */

static void
mapcar1 (int leni, Lisp_Object *vals, Lisp_Object fn, Lisp_Object seq)
{
  Lisp_Object tail;
  Lisp_Object dummy = Qnil;
  int i;
  struct gcpro gcpro1, gcpro2, gcpro3;
  Lisp_Object result;

  GCPRO3 (dummy, fn, seq);

  if (vals)
    {
      /* Don't let vals contain any garbage when GC happens.  */
      for (i = 0; i < leni; i++)
	vals[i] = Qnil;
      gcpro1.var = vals;
      gcpro1.nvars = leni;
    }

  /* We need not explicitly protect `tail' because it is used only on
    lists, and 1) lists are not relocated and 2) the list is marked
    via `seq' so will not be freed */

  if (VECTORP (seq))
    {
      for (i = 0; i < leni; i++)
	{
	  dummy = XVECTOR_DATA (seq)[i];
	  result = call1 (fn, dummy);
	  if (vals)
	    vals[i] = result;
	}
    }
  else if (BIT_VECTORP (seq))
    {
      struct Lisp_Bit_Vector *v = XBIT_VECTOR (seq);
      for (i = 0; i < leni; i++)
	{
	  XSETINT (dummy, bit_vector_bit (v, i));
	  result = call1 (fn, dummy);
	  if (vals)
	    vals[i] = result;
	}
    }
  else if (STRINGP (seq))
    {
      for (i = 0; i < leni; i++)
	{
	  result = call1 (fn, make_char (string_char (XSTRING (seq), i)));
	  if (vals)
	    vals[i] = result;
	}
    }
  else   /* Must be a list, since Flength did not get an error */
    {
      tail = seq;
      for (i = 0; i < leni; i++)
	{
	  result = call1 (fn, Fcar (tail));
	  if (vals)
	    vals[i] = result;
	  tail = Fcdr (tail);
	}
    }

  UNGCPRO;
}

DEFUN ("mapconcat", Fmapconcat, 3, 3, 0, /*
Apply FN to each element of SEQ, and concat the results as strings.
In between each pair of results, stick in SEP.
Thus, " " as SEP results in spaces between the values returned by FN.
*/
       (fn, seq, sep))
{
  int len = XINT (Flength (seq));
  Lisp_Object *args;
  int i;
  struct gcpro gcpro1;
  int nargs = len + len - 1;

  if (nargs < 0) return build_string ("");

  args = alloca_array (Lisp_Object, nargs);

  GCPRO1 (sep);
  mapcar1 (len, args, fn, seq);
  UNGCPRO;

  for (i = len - 1; i >= 0; i--)
    args[i + i] = args[i];

  for (i = 1; i < nargs; i += 2)
    args[i] = sep;

  return Fconcat (nargs, args);
}

DEFUN ("mapcar", Fmapcar, 2, 2, 0, /*
Apply FUNCTION to each element of SEQUENCE, and make a list of the results.
The result is a list just as long as SEQUENCE.
SEQUENCE may be a list, a vector, a bit vector, or a string.
*/
       (fn, seq))
{
  int len = XINT (Flength (seq));
  Lisp_Object *args = alloca_array (Lisp_Object, len);

  mapcar1 (len, args, fn, seq);

  return Flist (len, args);
}

DEFUN ("mapvector", Fmapvector, 2, 2, 0, /*
Apply FUNCTION to each element of SEQUENCE, making a vector of the results.
The result is a vector of the same length as SEQUENCE.
SEQUENCE may be a list, a vector or a string.
*/
       (fn, seq))
{
  int len = XINT (Flength (seq));
  /* Ideally, this should call make_vector_internal, because we don't
     need initialization.  */
  Lisp_Object result = make_vector (len, Qnil);
  struct gcpro gcpro1;

  GCPRO1 (result);
  mapcar1 (len, XVECTOR_DATA (result), fn, seq);
  UNGCPRO;

  return result;
}

DEFUN ("mapc", Fmapc, 2, 2, 0, /*
Apply FUNCTION to each element of SEQUENCE.
SEQUENCE may be a list, a vector, a bit vector, or a string.
This function is like `mapcar' but does not accumulate the results,
which is more efficient if you do not use the results.
*/
       (fn, seq))
{
  mapcar1 (XINT (Flength (seq)), 0, fn, seq);

  return seq;
}


/* #### this function doesn't belong in this file! */

DEFUN ("load-average", Fload_average, 0, 1, 0, /*
Return list of 1 minute, 5 minute and 15 minute load averages.
Each of the three load averages is multiplied by 100,
then converted to integer.

When USE-FLOATS is non-nil, floats will be used instead of integers.
These floats are not multiplied by 100.

If the 5-minute or 15-minute load averages are not available, return a
shortened list, containing only those averages which are available.

On some systems, this won't work due to permissions on /dev/kmem,
in which case you can't use this.
*/
       (use_floats))
{
  double load_ave[3];
  int loads = getloadavg (load_ave, countof (load_ave));
  Lisp_Object ret = Qnil;

  if (loads == -2)
    error ("load-average not implemented for this operating system");
  else if (loads < 0)
    signal_simple_error ("Could not get load-average",
			 lisp_strerror (errno));

  while (loads-- > 0)
    {
      Lisp_Object load = (NILP (use_floats) ?
			  make_int ((int) (100.0 * load_ave[loads]))
			  : make_float (load_ave[loads]));
      ret = Fcons (load, ret);
    }
  return ret;
}


Lisp_Object Vfeatures;

DEFUN ("featurep", Ffeaturep, 1, 1, 0, /*
Return non-nil if feature FEXP is present in this Emacs.
Use this to conditionalize execution of lisp code based on the
 presence or absence of emacs or environment extensions.
FEXP can be a symbol, a number, or a list.
If it is a symbol, that symbol is looked up in the `features' variable,
 and non-nil will be returned if found.
If it is a number, the function will return non-nil if this Emacs
 has an equal or greater version number than FEXP.
If it is a list whose car is the symbol `and', it will return
 non-nil if all the features in its cdr are non-nil.
If it is a list whose car is the symbol `or', it will return non-nil
 if any of the features in its cdr are non-nil.
If it is a list whose car is the symbol `not', it will return
 non-nil if the feature is not present.

Examples:

  (featurep 'xemacs)
    => ; Non-nil on XEmacs.

  (featurep '(and xemacs gnus))
    => ; Non-nil on XEmacs with Gnus loaded.

  (featurep '(or tty-frames (and emacs 19.30)))
    => ; Non-nil if this Emacs supports TTY frames.

  (featurep '(or (and xemacs 19.15) (and emacs 19.34)))
    => ; Non-nil on XEmacs 19.15 and later, or FSF Emacs 19.34 and later.

NOTE: The advanced arguments of this function (anything other than a
symbol) are not yet supported by FSF Emacs.  If you feel they are useful
for supporting multiple Emacs variants, lobby Richard Stallman at
<bug-gnu-emacs@prep.ai.mit.edu>.
*/
       (fexp))
{
#ifndef FEATUREP_SYNTAX
  CHECK_SYMBOL (fexp);
  return NILP (Fmemq (fexp, Vfeatures)) ? Qnil : Qt;
#else  /* FEATUREP_SYNTAX */
  static double featurep_emacs_version;

  /* Brute force translation from Erik Naggum's lisp function. */
  if (SYMBOLP (fexp))
    {
      /* Original definition */
      return NILP (Fmemq (fexp, Vfeatures)) ? Qnil : Qt;
    }
  else if (INTP (fexp) || FLOATP (fexp))
    {
      double d = extract_float (fexp);

      if (featurep_emacs_version == 0.0)
	{
	  featurep_emacs_version = XINT (Vemacs_major_version) +
	    (XINT (Vemacs_minor_version) / 100.0);
	}
      return featurep_emacs_version >= d ? Qt : Qnil;
    }
  else if (CONSP (fexp))
    {
      Lisp_Object tem = XCAR (fexp);
      if (EQ (tem, Qnot))
	{
	  Lisp_Object negate;

	  tem = XCDR (fexp);
	  negate = Fcar (tem);
	  if (!NILP (tem))
	    return NILP (call1 (Qfeaturep, negate)) ? Qt : Qnil;
	  else
	    return Fsignal (Qinvalid_read_syntax, list1 (tem));
	}
      else if (EQ (tem, Qand))
	{
	  tem = XCDR (fexp);
	  /* Use Fcar/Fcdr for error-checking. */
	  while (!NILP (tem) && !NILP (call1 (Qfeaturep, Fcar (tem))))
	    {
	      tem = Fcdr (tem);
	    }
	  return NILP (tem) ? Qt : Qnil;
	}
      else if (EQ (tem, Qor))
	{
	  tem = XCDR (fexp);
	  /* Use Fcar/Fcdr for error-checking. */
	  while (!NILP (tem) && NILP (call1 (Qfeaturep, Fcar (tem))))
	    {
	      tem = Fcdr (tem);
	    }
	  return NILP (tem) ? Qnil : Qt;
	}
      else
	{
	  return Fsignal (Qinvalid_read_syntax, list1 (XCDR (fexp)));
	}
    }
  else
    {
      return Fsignal (Qinvalid_read_syntax, list1 (fexp));
    }
}
#endif /* FEATUREP_SYNTAX */

DEFUN ("provide", Fprovide, 1, 1, 0, /*
Announce that FEATURE is a feature of the current Emacs.
This function updates the value of the variable `features'.
*/
       (feature))
{
  Lisp_Object tem;
  CHECK_SYMBOL (feature);
  if (!NILP (Vautoload_queue))
    Vautoload_queue = Fcons (Fcons (Vfeatures, Qnil), Vautoload_queue);
  tem = Fmemq (feature, Vfeatures);
  if (NILP (tem))
    Vfeatures = Fcons (feature, Vfeatures);
  LOADHIST_ATTACH (Fcons (Qprovide, feature));
  return feature;
}

DEFUN ("require", Frequire, 1, 2, 0, /*
If feature FEATURE is not loaded, load it from FILENAME.
If FEATURE is not a member of the list `features', then the feature
is not loaded; so load the file FILENAME.
If FILENAME is omitted, the printname of FEATURE is used as the file name.
*/
       (feature, file_name))
{
  Lisp_Object tem;
  CHECK_SYMBOL (feature);
  tem = Fmemq (feature, Vfeatures);
  LOADHIST_ATTACH (Fcons (Qrequire, feature));
  if (!NILP (tem))
    return feature;
  else
    {
      int speccount = specpdl_depth ();

      /* Value saved here is to be restored into Vautoload_queue */
      record_unwind_protect (un_autoload, Vautoload_queue);
      Vautoload_queue = Qt;

      call4 (Qload, NILP (file_name) ? Fsymbol_name (feature) : file_name,
	     Qnil, Qt, Qnil);

      tem = Fmemq (feature, Vfeatures);
      if (NILP (tem))
	error ("Required feature %s was not provided",
	       string_data (XSYMBOL (feature)->name));

      /* Once loading finishes, don't undo it.  */
      Vautoload_queue = Qt;
      return unbind_to (speccount, feature);
    }
}


Lisp_Object Qyes_or_no_p;

void
syms_of_fns (void)
{
  defsymbol (&Qstring_lessp, "string-lessp");
  defsymbol (&Qidentity, "identity");
  defsymbol (&Qyes_or_no_p, "yes-or-no-p");

  DEFSUBR (Fidentity);
  DEFSUBR (Frandom);
  DEFSUBR (Flength);
  DEFSUBR (Fsafe_length);
  DEFSUBR (Fstring_equal);
  DEFSUBR (Fstring_lessp);
  DEFSUBR (Fstring_modified_tick);
  DEFSUBR (Fappend);
  DEFSUBR (Fconcat);
  DEFSUBR (Fvconcat);
  DEFSUBR (Fbvconcat);
  DEFSUBR (Fcopy_sequence);
  DEFSUBR (Fcopy_alist);
  DEFSUBR (Fcopy_tree);
  DEFSUBR (Fsubstring);
  DEFSUBR (Fsubseq);
  DEFSUBR (Fnthcdr);
  DEFSUBR (Fnth);
  DEFSUBR (Felt);
  DEFSUBR (Fmember);
  DEFSUBR (Fold_member);
  DEFSUBR (Fmemq);
  DEFSUBR (Fold_memq);
  DEFSUBR (Fassoc);
  DEFSUBR (Fold_assoc);
  DEFSUBR (Fassq);
  DEFSUBR (Fold_assq);
  DEFSUBR (Frassoc);
  DEFSUBR (Fold_rassoc);
  DEFSUBR (Frassq);
  DEFSUBR (Fold_rassq);
  DEFSUBR (Fdelete);
  DEFSUBR (Fold_delete);
  DEFSUBR (Fdelq);
  DEFSUBR (Fold_delq);
  DEFSUBR (Fremassoc);
  DEFSUBR (Fremassq);
  DEFSUBR (Fremrassoc);
  DEFSUBR (Fremrassq);
  DEFSUBR (Fnreverse);
  DEFSUBR (Freverse);
  DEFSUBR (Fsort);
  DEFSUBR (Fplists_eq);
  DEFSUBR (Fplists_equal);
  DEFSUBR (Flax_plists_eq);
  DEFSUBR (Flax_plists_equal);
  DEFSUBR (Fplist_get);
  DEFSUBR (Fplist_put);
  DEFSUBR (Fplist_remprop);
  DEFSUBR (Fplist_member);
  DEFSUBR (Fcheck_valid_plist);
  DEFSUBR (Fvalid_plist_p);
  DEFSUBR (Fcanonicalize_plist);
  DEFSUBR (Flax_plist_get);
  DEFSUBR (Flax_plist_put);
  DEFSUBR (Flax_plist_remprop);
  DEFSUBR (Flax_plist_member);
  DEFSUBR (Fcanonicalize_lax_plist);
  DEFSUBR (Fdestructive_alist_to_plist);
  DEFSUBR (Fget);
  DEFSUBR (Fput);
  DEFSUBR (Fremprop);
  DEFSUBR (Fobject_plist);
  DEFSUBR (Fequal);
  DEFSUBR (Fold_equal);
  DEFSUBR (Ffillarray);
  DEFSUBR (Fnconc);
  DEFSUBR (Fmapcar);
  DEFSUBR (Fmapvector);
  DEFSUBR (Fmapc);
  DEFSUBR (Fmapconcat);
  DEFSUBR (Fload_average);
  DEFSUBR (Ffeaturep);
  DEFSUBR (Frequire);
  DEFSUBR (Fprovide);
}

void
init_provide_once (void)
{
  DEFVAR_LISP ("features", &Vfeatures /*
A list of symbols which are the features of the executing emacs.
Used by `featurep' and `require', and altered by `provide'.
*/ );
  Vfeatures = Qnil;
}
