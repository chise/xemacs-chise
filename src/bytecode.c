/* Execution of byte code produced by bytecomp.el.
   Copyright (C) 1992, 1993 Free Software Foundation, Inc.

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


/* Authorship:

   FSF: long ago.

hacked on by jwz@netscape.com 17-jun-91
  o  added a compile-time switch to turn on simple sanity checking;
  o  put back the obsolete byte-codes for error-detection;
  o  added a new instruction, unbind_all, which I will use for
     tail-recursion elimination;
  o  made temp_output_buffer_show be called with the right number
     of args;
  o  made the new bytecodes be called with args in the right order;
  o  added metering support.

by Hallvard:
  o  added relative jump instructions;
  o  all conditionals now only do QUIT if they jump.

   Ben Wing: some changes for Mule, June 1995.
 */

#include <config.h>
#include "lisp.h"
#include "buffer.h"
#include "syntax.h"

/*
 * define BYTE_CODE_SAFE to enable some minor sanity checking (useful for
 * debugging the byte compiler...)  Somewhat surprisingly, defining this
 * makes Fbyte_code about 8% slower.
 *
 * define BYTE_CODE_METER to enable generation of a byte-op usage histogram.
 */
/* This isn't defined in FSF Emacs and isn't defined in XEmacs v19 */
#ifdef DEBUG_XEMACS
#define BYTE_CODE_SAFE
#endif
/* #define BYTE_CODE_METER */


#ifdef BYTE_CODE_METER

Lisp_Object Vbyte_code_meter, Qbyte_code_meter;
int byte_metering_on;

#define METER_2(code1, code2) \
  XINT (XVECTOR_DATA (XVECTOR_DATA (Vbyte_code_meter)[(code1)])[(code2)])

#define METER_1(code) METER_2 (0, (code))

#define METER_CODE(last_code, this_code)			\
{								\
  if (byte_metering_on)						\
    {								\
      if (METER_1 (this_code) != ((1<<VALBITS)-1))		\
        METER_1 (this_code)++;					\
      if (last_code						\
	  && METER_2 (last_code, this_code) != ((1<<VALBITS)-1))\
        METER_2 (last_code, this_code)++;			\
    }								\
}

#endif /* no BYTE_CODE_METER */


Lisp_Object Qbyte_code;

/*  Byte codes: */

#define Bvarref 010
#define Bvarset 020
#define Bvarbind 030
#define Bcall 040
#define Bunbind 050

#define Bnth 070
#define Bsymbolp 071
#define Bconsp 072
#define Bstringp 073
#define Blistp 074
#define Bold_eq 075
#define Bold_memq 076
#define Bnot 077
#define Bcar 0100
#define Bcdr 0101
#define Bcons 0102
#define Blist1 0103
#define Blist2 0104
#define Blist3 0105
#define Blist4 0106
#define Blength 0107
#define Baref 0110
#define Baset 0111
#define Bsymbol_value 0112
#define Bsymbol_function 0113
#define Bset 0114
#define Bfset 0115
#define Bget 0116
#define Bsubstring 0117
#define Bconcat2 0120
#define Bconcat3 0121
#define Bconcat4 0122
#define Bsub1 0123
#define Badd1 0124
#define Beqlsign 0125
#define Bgtr 0126
#define Blss 0127
#define Bleq 0130
#define Bgeq 0131
#define Bdiff 0132
#define Bnegate 0133
#define Bplus 0134
#define Bmax 0135
#define Bmin 0136
#define Bmult 0137

#define Bpoint 0140
#define Beq 0141 /* was Bmark, but no longer generated as of v18 */
#define Bgoto_char 0142
#define Binsert 0143
#define Bpoint_max 0144
#define Bpoint_min 0145
#define Bchar_after 0146
#define Bfollowing_char 0147
#define Bpreceding_char 0150
#define Bcurrent_column 0151
#define Bindent_to 0152
#define Bequal 0153 /* was Bscan_buffer, but no longer generated as of v18 */
#define Beolp 0154
#define Beobp 0155
#define Bbolp 0156
#define Bbobp 0157
#define Bcurrent_buffer 0160
#define Bset_buffer 0161
#define Bsave_current_buffer 0162 /* was Bread_char, but no longer
				     generated as of v19 */
#define Bmemq 0163 /* was Bset_mark, but no longer generated as of v18 */
#define Binteractive_p 0164 /* Needed since interactive-p takes unevalled args */

#define Bforward_char 0165
#define Bforward_word 0166
#define Bskip_chars_forward 0167
#define Bskip_chars_backward 0170
#define Bforward_line 0171
#define Bchar_syntax 0172
#define Bbuffer_substring 0173
#define Bdelete_region 0174
#define Bnarrow_to_region 0175
#define Bwiden 0176
#define Bend_of_line 0177

#define Bconstant2 0201
#define Bgoto 0202
#define Bgotoifnil 0203
#define Bgotoifnonnil 0204
#define Bgotoifnilelsepop 0205
#define Bgotoifnonnilelsepop 0206
#define Breturn 0207
#define Bdiscard 0210
#define Bdup 0211

#define Bsave_excursion 0212
#define Bsave_window_excursion 0213
#define Bsave_restriction 0214
#define Bcatch 0215

#define Bunwind_protect 0216
#define Bcondition_case 0217
#define Btemp_output_buffer_setup 0220
#define Btemp_output_buffer_show 0221

#define Bunbind_all 0222

#define Bset_marker 0223
#define Bmatch_beginning 0224
#define Bmatch_end 0225
#define Bupcase 0226
#define Bdowncase 0227

#define Bstringeqlsign 0230
#define Bstringlss 0231
#define Bold_equal 0232
#define Bnthcdr 0233
#define Belt 0234
#define Bold_member 0235
#define Bold_assq 0236
#define Bnreverse 0237
#define Bsetcar 0240
#define Bsetcdr 0241
#define Bcar_safe 0242
#define Bcdr_safe 0243
#define Bnconc 0244
#define Bquo 0245
#define Brem 0246
#define Bnumberp 0247
#define Bintegerp 0250

#define BRgoto 0252
#define BRgotoifnil 0253
#define BRgotoifnonnil 0254
#define BRgotoifnilelsepop 0255
#define BRgotoifnonnilelsepop 0256

#define BlistN 0257
#define BconcatN 0260
#define BinsertN 0261
#define Bmember 0266 /* new in v20 */
#define Bassq 0267 /* new in v20 */

#define Bconstant 0300
#define CONSTANTLIM 0100

/* Fetch the next byte from the bytecode stream */

#define FETCH (massaged_code[pc++])

/* Fetch two bytes from the bytecode stream
 and make a 16-bit number out of them */

#define FETCH2 (op = FETCH, op + (FETCH << 8))

/* Push x onto the execution stack. */

#define PUSH(x) (*++stackp = (x))

/* Pop a value off the execution stack.  */

#define POP (*stackp--)

/* Discard n values from the execution stack.  */

#define DISCARD(n) (stackp -= (n))

/* Get the value which is at the top of the execution stack,
   but don't pop it. */

#define TOP (*stackp)

DEFUN ("byte-code", Fbyte_code, 3, 3, 0, /*
Function used internally in byte-compiled code.
The first argument is a string of byte code; the second, a vector of constants;
the third, the maximum stack depth used in this function.
If the third argument is incorrect, Emacs may crash.
*/
       (bytestr, vector, maxdepth))
{
  /* This function can GC */
  struct gcpro gcpro1, gcpro2, gcpro3;
  int speccount = specpdl_depth ();
#ifdef BYTE_CODE_METER
  int this_op = 0;
  int prev_op;
#endif
  REGISTER int op;
  int pc;
  Lisp_Object *stack;
  REGISTER Lisp_Object *stackp;
  Lisp_Object *stacke;
  REGISTER Lisp_Object v1, v2;
  REGISTER Lisp_Object *vectorp = XVECTOR_DATA (vector);
#ifdef BYTE_CODE_SAFE
  REGISTER int const_length = XVECTOR_LENGTH (vector);
#endif
  REGISTER Emchar *massaged_code;
  int massaged_code_len;

  CHECK_STRING (bytestr);
  if (!VECTORP (vector))
    vector = wrong_type_argument (Qvectorp, vector);
  CHECK_NATNUM (maxdepth);

  stackp = alloca_array (Lisp_Object, XINT (maxdepth));
  memset (stackp, 0, XINT (maxdepth) * sizeof (Lisp_Object));
  GCPRO3 (bytestr, vector, *stackp);
  gcpro3.nvars = XINT (maxdepth);

  --stackp;
  stack = stackp;
  stacke = stackp + XINT (maxdepth);

  /* Initialize the pc-register and convert the string into a fixed-width
     format for easier processing.  */
  massaged_code = alloca_array (Emchar, 1 + XSTRING_CHAR_LENGTH (bytestr));
  massaged_code_len =
    convert_bufbyte_string_into_emchar_string (XSTRING_DATA (bytestr),
				      XSTRING_LENGTH (bytestr),
				      massaged_code);
  massaged_code[massaged_code_len] = 0;
  pc = 0;

  while (1)
    {
#ifdef BYTE_CODE_SAFE
      if (stackp > stacke)
	error ("Byte code stack overflow (byte compiler bug), pc %d, depth %ld",
	       pc, (long) (stacke - stackp));
      if (stackp < stack)
	error ("Byte code stack underflow (byte compiler bug), pc %d",
	       pc);
#endif

#ifdef BYTE_CODE_METER
      prev_op = this_op;
      this_op = op = FETCH;
      METER_CODE (prev_op, op);
      switch (op)
#else
      switch (op = FETCH)
#endif
	{
	case Bvarref+6:
	  op = FETCH;
	  goto varref;

	case Bvarref+7:
	  op = FETCH2;
	  goto varref;

	case Bvarref: case Bvarref+1: case Bvarref+2: case Bvarref+3:
	case Bvarref+4: case Bvarref+5:
	  op = op - Bvarref;
	varref:
	  v1 = vectorp[op];
	  if (!SYMBOLP (v1))
	    v2 = Fsymbol_value (v1);
	  else
	    {
	      v2 = XSYMBOL (v1)->value;
	      if (SYMBOL_VALUE_MAGIC_P (v2))
                v2 = Fsymbol_value (v1);
	    }
	  PUSH (v2);
	  break;

	case Bvarset+6:
	  op = FETCH;
	  goto varset;

	case Bvarset+7:
	  op = FETCH2;
	  goto varset;

	case Bvarset: case Bvarset+1: case Bvarset+2: case Bvarset+3:
	case Bvarset+4: case Bvarset+5:
	  op -= Bvarset;
	varset:
	  Fset (vectorp[op], POP);
	  break;

	case Bvarbind+6:
	  op = FETCH;
	  goto varbind;

	case Bvarbind+7:
	  op = FETCH2;
	  goto varbind;

	case Bvarbind: case Bvarbind+1: case Bvarbind+2: case Bvarbind+3:
	case Bvarbind+4: case Bvarbind+5:
	  op -= Bvarbind;
	varbind:
	  specbind (vectorp[op], POP);
	  break;

	case Bcall+6:
	  op = FETCH;
	  goto docall;

	case Bcall+7:
	  op = FETCH2;
	  goto docall;

	case Bcall: case Bcall+1: case Bcall+2: case Bcall+3:
	case Bcall+4: case Bcall+5:
	  op -= Bcall;
	docall:
	  DISCARD (op);
#ifdef BYTE_CODE_METER
	  if (byte_metering_on && SYMBOLP (TOP))
	    {
	      v1 = TOP;
	      v2 = Fget (v1, Qbyte_code_meter, Qnil);
	      if (INTP (v2)
                  && XINT (v2) != ((1<<VALBITS)-1))
		{
		  XSETINT (v2, XINT (v2) + 1);
		  Fput (v1, Qbyte_code_meter, v2);
		}
	    }
#endif /* BYTE_CODE_METER */
	  TOP = Ffuncall (op + 1, &TOP);
	  break;

	case Bunbind+6:
	  op = FETCH;
	  goto dounbind;

	case Bunbind+7:
	  op = FETCH2;
	  goto dounbind;

	case Bunbind: case Bunbind+1: case Bunbind+2: case Bunbind+3:
	case Bunbind+4: case Bunbind+5:
	  op -= Bunbind;
	dounbind:
	  unbind_to (specpdl_depth () - op, Qnil);
	  break;

	case Bunbind_all:
	  /* To unbind back to the beginning of this frame.  Not used yet,
	     but will be needed for tail-recursion elimination. */
	  unbind_to (speccount, Qnil);
	  break;

	case Bgoto:
	  QUIT;
	  op = FETCH2;    /* pc = FETCH2 loses since FETCH2 contains pc++ */
	  pc = op;
	  break;

	case Bgotoifnil:
	  op = FETCH2;
	  if (NILP (POP))
	    {
	      QUIT;
	      pc = op;
	    }
	  break;

	case Bgotoifnonnil:
	  op = FETCH2;
	  if (!NILP (POP))
	    {
	      QUIT;
	      pc = op;
	    }
	  break;

	case Bgotoifnilelsepop:
	  op = FETCH2;
	  if (NILP (TOP))
	    {
	      QUIT;
	      pc = op;
	    }
	  else DISCARD (1);
	  break;

	case Bgotoifnonnilelsepop:
	  op = FETCH2;
	  if (!NILP (TOP))
	    {
	      QUIT;
	      pc = op;
	    }
	  else DISCARD (1);
	  break;

	case BRgoto:
	  QUIT;
	  pc += massaged_code[pc] - 127;
	  break;

	case BRgotoifnil:
	  if (NILP (POP))
	    {
	      QUIT;
	      pc += massaged_code[pc] - 128;
	    }
	  pc++;
	  break;

	case BRgotoifnonnil:
	  if (!NILP (POP))
	    {
	      QUIT;
	      pc += massaged_code[pc] - 128;
	    }
	  pc++;
	  break;

	case BRgotoifnilelsepop:
	  op = FETCH;
	  if (NILP (TOP))
	    {
	      QUIT;
	      pc += op - 128;
	    }
	  else DISCARD (1);
	  break;

	case BRgotoifnonnilelsepop:
	  op = FETCH;
	  if (!NILP (TOP))
	    {
	      QUIT;
	      pc += op - 128;
	    }
	  else DISCARD (1);
	  break;

	case Breturn:
	  v1 = POP;
	  goto exit;

	case Bdiscard:
	  DISCARD (1);
	  break;

	case Bdup:
	  v1 = TOP;
	  PUSH (v1);
	  break;

	case Bconstant2:
	  PUSH (vectorp[FETCH2]);
	  break;

	case Bsave_excursion:
	  record_unwind_protect (save_excursion_restore,
				 save_excursion_save ());
	  break;

	case Bsave_window_excursion:
          {
            int count = specpdl_depth ();
            record_unwind_protect (save_window_excursion_unwind,
                                   Fcurrent_window_configuration (Qnil));
            TOP = Fprogn (TOP);
            unbind_to (count, Qnil);
            break;
          }

	case Bsave_restriction:
	  record_unwind_protect (save_restriction_restore,
				 save_restriction_save ());
	  break;

	case Bcatch:
	  v1 = POP;
	  TOP = internal_catch (TOP, Feval, v1, 0);
	  break;

	case Bunwind_protect:
	  record_unwind_protect (Fprogn, POP);
	  break;

	case Bcondition_case:
          v1 = POP;           /* handlers */
          v2 = POP;           /* bodyform */
          TOP = condition_case_3 (v2, TOP, v1);
	  break;

	case Btemp_output_buffer_setup:
	  temp_output_buffer_setup ((char *) XSTRING_DATA (TOP));
	  TOP = Vstandard_output;
	  break;

	case Btemp_output_buffer_show:
	  v1 = POP;
	  temp_output_buffer_show (TOP, Qnil);
	  TOP = v1;
          /* GAG ME!! */
	  /* pop binding of standard-output */
	  unbind_to (specpdl_depth() - 1, Qnil);
	  break;

	case Bnth:
	  v1 = POP;
	  v2 = TOP;
	/* nth_entry: */
	  CHECK_NATNUM (v2);
	  for (op = XINT (v2); op; op--)
	    {
	      if (CONSP (v1))
		v1 = XCDR (v1);
	      else if (NILP (v1))
		{
		  TOP = Qnil;
		  goto Bnth_done;
		}
	      else
		{
		  v1 = wrong_type_argument (Qlistp, v1);
		  op++;
		}
	    }
	  goto docar;
	Bnth_done:
	  break;

	case Bsymbolp:
	  TOP = SYMBOLP (TOP) ? Qt : Qnil;
	  break;

	case Bconsp:
	  TOP = CONSP (TOP) ? Qt : Qnil;
	  break;

	case Bstringp:
	  TOP = STRINGP (TOP) ? Qt : Qnil;
	  break;

	case Blistp:
	  TOP = LISTP (TOP) ? Qt : Qnil;
	  break;

	case Beq:
	  v1 = POP;
	  TOP = EQ_WITH_EBOLA_NOTICE (v1, TOP) ? Qt : Qnil;
	  break;

	case Bold_eq:
	  v1 = POP;
	  TOP = HACKEQ_UNSAFE (v1, TOP) ? Qt : Qnil;
	  break;

	case Bmemq:
	  v1 = POP;
	  TOP = Fmemq (TOP, v1);
	  break;

	case Bold_memq:
	  v1 = POP;
	  TOP = Fold_memq (TOP, v1);
	  break;

	case Bnot:
	  TOP = NILP (TOP) ? Qt : Qnil;
	  break;

	case Bcar:
	  v1 = TOP;
	docar:
	  if (CONSP (v1)) TOP = XCAR (v1);
	  else if (NILP (v1)) TOP = Qnil;
	  else
	    {
	      TOP = wrong_type_argument (Qlistp, v1);
	      goto docar;
	    }
	  break;

	case Bcdr:
	  v1 = TOP;
	docdr:
	  if (CONSP (v1)) TOP = XCDR (v1);
	  else if (NILP (v1)) TOP = Qnil;
	  else
	    {
	      TOP = wrong_type_argument (Qlistp, v1);
	      goto docdr;
	    }
	  break;

	case Bcons:
	  v1 = POP;
	  TOP = Fcons (TOP, v1);
	  break;

	case Blist1:
	  TOP = Fcons (TOP, Qnil);
	  break;

	case Blist2:
	  v1 = POP;
	  TOP = Fcons (TOP, Fcons (v1, Qnil));
	  break;

	case Blist3:
	  DISCARD (2);
	  TOP = Flist (3, &TOP);
	  break;

	case Blist4:
	  DISCARD (3);
	  TOP = Flist (4, &TOP);
	  break;

	case BlistN:
	  op = FETCH;
	  DISCARD (op - 1);
	  TOP = Flist (op, &TOP);
	  break;

	case Blength:
	  TOP = Flength (TOP);
	  break;

	case Baref:
    	  v1 = POP;
	  TOP = Faref (TOP, v1);
	  break;

	case Baset:
	  v2 = POP; v1 = POP;
	  TOP = Faset (TOP, v1, v2);
	  break;

	case Bsymbol_value:
	  TOP = Fsymbol_value (TOP);
	  break;

	case Bsymbol_function:
	  TOP = Fsymbol_function (TOP);
	  break;

	case Bset:
	  v1 = POP;
	  TOP = Fset (TOP, v1);
	  break;

	case Bfset:
	  v1 = POP;
	  TOP = Ffset (TOP, v1);
	  break;

	case Bget:
	  v1 = POP;
	  TOP = Fget (TOP, v1, Qnil);
	  break;

	case Bsubstring:
	  v2 = POP; v1 = POP;
	  TOP = Fsubstring (TOP, v1, v2);
	  break;

	case Bconcat2:
	  DISCARD (1);
	  TOP = Fconcat (2, &TOP);
	  break;

	case Bconcat3:
	  DISCARD (2);
	  TOP = Fconcat (3, &TOP);
	  break;

	case Bconcat4:
	  DISCARD (3);
	  TOP = Fconcat (4, &TOP);
	  break;

	case BconcatN:
	  op = FETCH;
	  DISCARD (op - 1);
	  TOP = Fconcat (op, &TOP);
	  break;

	case Bsub1:
	  v1 = TOP;
	  if (INTP (v1))
	    {
	      XSETINT (v1, XINT (v1) - 1);
	      TOP = v1;
	    }
	  else
	    TOP = Fsub1 (v1);
	  break;

	case Badd1:
	  v1 = TOP;
	  if (INTP (v1))
	    {
	      XSETINT (v1, XINT (v1) + 1);
	      TOP = v1;
	    }
	  else
	    TOP = Fadd1 (v1);
	  break;

	case Beqlsign:
	  v2 = POP; v1 = TOP;
	  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (v1);
	  CHECK_INT_OR_FLOAT_COERCE_CHAR_OR_MARKER (v2);
#ifdef LISP_FLOAT_TYPE
	  if (FLOATP (v1) || FLOATP (v2))
	    {
	      double f1 = (FLOATP (v1) ? float_data (XFLOAT (v1)) : XINT (v1));
	      double f2 = (FLOATP (v2) ? float_data (XFLOAT (v2)) : XINT (v2));
	      TOP = (f1 == f2 ? Qt : Qnil);
	    }
	  else
#endif /* LISP_FLOAT_TYPE */
	    TOP = (XINT (v1) == XINT (v2) ? Qt : Qnil);
	  break;

	case Bgtr:
	  v1 = POP;
	  TOP = arithcompare (TOP, v1, arith_grtr);
	  break;

	case Blss:
	  v1 = POP;
	  TOP = arithcompare (TOP, v1, arith_less);
	  break;

	case Bleq:
	  v1 = POP;
	  TOP = arithcompare (TOP, v1, arith_less_or_equal);
	  break;

	case Bgeq:
	  v1 = POP;
	  TOP = arithcompare (TOP, v1, arith_grtr_or_equal);
	  break;

	case Bdiff:
	  DISCARD (1);
	  TOP = Fminus (2, &TOP);
	  break;

	case Bnegate:
	  v1 = TOP;
	  if (INTP (v1))
	    {
	      XSETINT (v1, - XINT (v1));
	      TOP = v1;
	    }
	  else
	    TOP = Fminus (1, &TOP);
	  break;

	case Bplus:
	  DISCARD (1);
	  TOP = Fplus (2, &TOP);
	  break;

	case Bmax:
	  DISCARD (1);
	  TOP = Fmax (2, &TOP);
	  break;

	case Bmin:
	  DISCARD (1);
	  TOP = Fmin (2, &TOP);
	  break;

	case Bmult:
	  DISCARD (1);
	  TOP = Ftimes (2, &TOP);
	  break;

	case Bquo:
	  DISCARD (1);
	  TOP = Fquo (2, &TOP);
	  break;

	case Brem:
	  v1 = POP;
	  TOP = Frem (TOP, v1);
	  break;

	case Bpoint:
	  v1 = make_int (BUF_PT (current_buffer));
	  PUSH (v1);
	  break;

	case Bgoto_char:
	  TOP = Fgoto_char (TOP, Qnil);
	  break;

	case Binsert:
	  TOP = Finsert (1, &TOP);
	  break;

	case BinsertN:
	  op = FETCH;
	  DISCARD (op - 1);
	  TOP = Finsert (op, &TOP);
	  break;

	case Bpoint_max:
	  v1 = make_int (BUF_ZV (current_buffer));
	  PUSH (v1);
	  break;

	case Bpoint_min:
	  v1 = make_int (BUF_BEGV (current_buffer));
	  PUSH (v1);
	  break;

	case Bchar_after:
	  TOP = Fchar_after (TOP, Qnil);
	  break;

	case Bfollowing_char:
	  v1 = Ffollowing_char (Qnil);
	  PUSH (v1);
	  break;

	case Bpreceding_char:
	  v1 = Fpreceding_char (Qnil);
	  PUSH (v1);
	  break;

	case Bcurrent_column:
	  v1 = make_int (current_column (current_buffer));
	  PUSH (v1);
	  break;

	case Bindent_to:
	  TOP = Findent_to (TOP, Qnil, Qnil);
	  break;

	case Beolp:
	  PUSH (Feolp (Qnil));
	  break;

	case Beobp:
	  PUSH (Feobp (Qnil));
	  break;

	case Bbolp:
	  PUSH (Fbolp (Qnil));
	  break;

	case Bbobp:
	  PUSH (Fbobp (Qnil));
	  break;

	case Bcurrent_buffer:
	  PUSH (Fcurrent_buffer ());
	  break;

	case Bset_buffer:
	  TOP = Fset_buffer (TOP);
	  break;

	case Bsave_current_buffer:
	  record_unwind_protect (save_current_buffer_restore,
				 Fcurrent_buffer ());
	  break;

	case Binteractive_p:
	  PUSH (Finteractive_p ());
	  break;

	case Bforward_char:
	  TOP = Fforward_char (TOP, Qnil);
	  break;

	case Bforward_word:
	  TOP = Fforward_word (TOP, Qnil);
	  break;

	case Bskip_chars_forward:
	  v1 = POP;
	  TOP = Fskip_chars_forward (TOP, v1, Qnil);
	  break;

	case Bskip_chars_backward:
	  v1 = POP;
	  TOP = Fskip_chars_backward (TOP, v1, Qnil);
	  break;

	case Bforward_line:
	  TOP = Fforward_line (TOP, Qnil);
	  break;

	case Bchar_syntax:
#if 0
	  CHECK_CHAR_COERCE_INT (TOP);
	  TOP = make_char (syntax_code_spec
			   [(int) SYNTAX
			    (XCHAR_TABLE
			     (current_buffer->mirror_syntax_table),
			     XCHAR (TOP))]);
#endif
	  /*v1 = POP;*/
	  TOP = Fchar_syntax(TOP, Qnil);
	  break;

	case Bbuffer_substring:
	  v1 = POP;
	  TOP = Fbuffer_substring (TOP, v1, Qnil);
	  break;

	case Bdelete_region:
	  v1 = POP;
	  TOP = Fdelete_region (TOP, v1, Qnil);
	  break;

	case Bnarrow_to_region:
	  v1 = POP;
	  TOP = Fnarrow_to_region (TOP, v1, Qnil);
	  break;

	case Bwiden:
	  PUSH (Fwiden (Qnil));
	  break;

	case Bend_of_line:
	  TOP = Fend_of_line (TOP, Qnil);
	  break;

	case Bset_marker:
	  v1 = POP;
	  v2 = POP;
	  TOP = Fset_marker (TOP, v2, v1);
	  break;

	case Bmatch_beginning:
	  TOP = Fmatch_beginning (TOP);
	  break;

	case Bmatch_end:
	  TOP = Fmatch_end (TOP);
	  break;

	case Bupcase:
	  TOP = Fupcase (TOP, Qnil);
	  break;

	case Bdowncase:
	  TOP = Fdowncase (TOP, Qnil);
	break;

	case Bstringeqlsign:
	  v1 = POP;
	  TOP = Fstring_equal (TOP, v1);
	  break;

	case Bstringlss:
	  v1 = POP;
	  TOP = Fstring_lessp (TOP, v1);
	  break;

	case Bequal:
	  v1 = POP;
	  TOP = Fequal (TOP, v1);
	  break;

	case Bold_equal:
	  v1 = POP;
	  TOP = Fold_equal (TOP, v1);
	  break;

	case Bnthcdr:
	  v1 = POP;
	  v2 = TOP;
	  CHECK_NATNUM (v2);
	  for (op = XINT (v2); op; op--)
	    {
	      if (CONSP (v1))
		v1 = XCDR (v1);
	      else if (NILP (v1))
		break;
	      else
		{
		  v1 = wrong_type_argument (Qlistp, v1);
		  op++;
		}
	    }
	  TOP = v1;
	  break;

	case Belt:
#if 0
	  /* probably this code is OK, but nth_entry is commented
	     out above --ben */
	  /* #### will not work if cons type is an lrecord. */
	  if (XTYPE (TOP) == Lisp_Type_Cons)
	    {
	      /* Exchange args and then do nth.  */
	      v2 = POP;
	      v1 = TOP;
	      goto nth_entry;
	    }
#endif
	  v1 = POP;
	  TOP = Felt (TOP, v1);
	  break;

	case Bmember:
	  v1 = POP;
	  TOP = Fmember (TOP, v1);
	  break;

	case Bold_member:
	  v1 = POP;
	  TOP = Fold_member (TOP, v1);
	  break;

	case Bassq:
	  v1 = POP;
	  TOP = Fassq (TOP, v1);
	  break;

	case Bold_assq:
	  v1 = POP;
	  TOP = Fold_assq (TOP, v1);
	  break;

	case Bnreverse:
	  TOP = Fnreverse (TOP);
	  break;

	case Bsetcar:
	  v1 = POP;
	  TOP = Fsetcar (TOP, v1);
	  break;

	case Bsetcdr:
	  v1 = POP;
	  TOP = Fsetcdr (TOP, v1);
	  break;

	case Bcar_safe:
	  v1 = TOP;
	  if (CONSP (v1))
	    TOP = XCAR (v1);
	  else
	    TOP = Qnil;
	  break;

	case Bcdr_safe:
	  v1 = TOP;
	  if (CONSP (v1))
	    TOP = XCDR (v1);
	  else
	    TOP = Qnil;
	  break;

	case Bnconc:
	  DISCARD (1);
	  TOP = Fnconc (2, &TOP);
	  break;

	case Bnumberp:
	  TOP = INT_OR_FLOATP (TOP) ? Qt : Qnil;
	  break;

	case Bintegerp:
	  TOP = INTP (TOP) ? Qt : Qnil;
	  break;

	default:
#ifdef BYTE_CODE_SAFE
	  if (op < Bconstant)
	    error ("unknown bytecode %d (byte compiler bug)", op);
	  if ((op -= Bconstant) >= const_length)
	    error ("no constant number %d (byte compiler bug)", op);
	  PUSH (vectorp[op]);
#else
	  PUSH (vectorp[op - Bconstant]);
#endif
	}
    }

 exit:
  UNGCPRO;
  /* Binds and unbinds are supposed to be compiled balanced.  */
  if (specpdl_depth() != speccount)
    /* FSF: abort() if BYTE_CODE_SAFE not defined */
    error ("binding stack not balanced (serious byte compiler bug)");
  return v1;
}

void
syms_of_bytecode (void)
{
  defsymbol (&Qbyte_code, "byte-code");
  DEFSUBR (Fbyte_code);
#ifdef BYTE_CODE_METER
  defsymbol (&Qbyte_code_meter, "byte-code-meter");
#endif
}

void
vars_of_bytecode (void)
{
#ifdef BYTE_CODE_METER

  DEFVAR_LISP ("byte-code-meter", &Vbyte_code_meter /*
A vector of vectors which holds a histogram of byte-code usage.
\(aref (aref byte-code-meter 0) CODE) indicates how many times the byte
opcode CODE has been executed.
\(aref (aref byte-code-meter CODE1) CODE2), where CODE1 is not 0,
indicates how many times the byte opcodes CODE1 and CODE2 have been
executed in succession.
*/ );
  DEFVAR_BOOL ("byte-metering-on", &byte_metering_on /*
If non-nil, keep profiling information on byte code usage.
The variable byte-code-meter indicates how often each byte opcode is used.
If a symbol has a property named `byte-code-meter' whose value is an
integer, it is incremented each time that symbol's function is called.
*/ );

  byte_metering_on = 0;
  Vbyte_code_meter = make_vector (256, Qzero);
  {
    int i = 256;
    while (i--)
      XVECTOR_DATA (Vbyte_code_meter)[i] =
	make_vector (256, Qzero);
  }
#endif
}
