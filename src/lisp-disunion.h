/* Fundamental definitions for XEmacs Lisp interpreter -- non-union objects.
   Copyright (C) 1985, 1986, 1987, 1992, 1993 Free Software Foundation, Inc.

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

/* Synched up with: FSF 19.30.  Split out from lisp.h. */
/* This file has diverged greatly from FSF Emacs.  Syncing is no
   longer desirable or possible */

/*
 Format of a non-union-type Lisp Object

   For the USE_MINIMAL_TAGBITS implementation:

             3         2         1         0
       bit  10987654321098765432109876543210
            --------------------------------
            VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVTT

   Integers are treated specially, and look like this:

             3         2         1         0
       bit  10987654321098765432109876543210
            --------------------------------
            VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVT

   For the non-USE_MINIMAL_TAGBITS implementation:

             3         2         1         0
       bit  10987654321098765432109876543210
            --------------------------------
            TTTMVVVVVVVVVVVVVVVVVVVVVVVVVVVV

    V = value bits
    T = type bits
    M = mark bits

 For integral Lisp types, i.e. integers and characters, the value
 bits are the Lisp object.

     The object is obtained by masking off the type and mark
     bits.  In the USE_MINIMAL_TAGBITS implementation, bit 1 is
     used as a value bit by splitting the Lisp integer type into
     two subtypes, Lisp_Type_Int_Even and Lisp_Type_Int_Odd.  By
     this trickery we get 31 bits for integers instead of 30.

     In the non-USE_MINIMAL_TAGBITS world, Lisp integers are 28 bits,
     or more properly (BITS_PER_EMACS_INT - GCTYPEBITS - 1) bits.

 For non-integral types, the value bits of a Lisp_Object contain
 a pointer to a structure containing the object.  The pointer is
 obtained by masking off the type and mark bits.

     In the USE_MINIMAL_TAGBITS implementation, all
     pointer-based types are coalesced under a single type called
     Lisp_Type_Record.  The type bits for this type are required
     by the implementation to be 00, just like the least
     significant bits of word-aligned struct pointers on 32-bit
     hardware.  Because of this, Lisp_Object pointers don't have
     to be masked and are full-sized.

     In the non-USE_MINIMAL_TAGBITS implementation, the type and
     mark bits must be masked off and pointers are limited to 28
     bits (really BITS_PER_EMACS_INT - GCTYPEBITS - 1 bits).

 There are no mark bits in the USE_MINIMAL_TAGBITS implementation.
 Integers and characters don't need to be marked.  All other types
 are lrecord-based, which means they get marked by incrementing
 their ->implementation pointer.

 In the non-USE_MINIMAL_TAGBITS implementation, the markbit is stored
 in the Lisp_Object itself.  It is stored in the middle so that the
 type bits can be obtained by simply shifting them.

 Outside of garbage collection, all mark bits are always zero.

 Here is a brief description of the following macros:

 XMARKBIT  Extract the mark bit (non-USE_MINIMAL_TAGBITS)
 XMARK     Set the mark bit of this Lisp_Object (non-USE_MINIMAL_TAGBITS)
 XUNMARK   Clear the mark bit of this Lisp_Object (non-USE_MINIMAL_TAGBITS)
 XTYPE     The type bits of a Lisp_Object
 XPNTRVAL  The value bits of a Lisp_Object storing a pointer
 XCHARVAL  The value bits of a Lisp_Object storing a Emchar
 XREALINT  The value bits of a Lisp_Object storing an integer, signed
 XUINT     The value bits of a Lisp_Object storing an integer, unsigned
 INTP      Non-zero if this Lisp_Object an integer?
 Qzero     Lisp Integer 0
 EQ        Non-zero if two Lisp_Objects are identical
 GC_EQ     Version of EQ used during garbage collection
*/

typedef EMACS_INT Lisp_Object;

#ifdef USE_MINIMAL_TAGBITS

# define XUNMARK(x) DO_NOTHING
# define make_obj(vartype, x) ((Lisp_Object) (x))
# define make_int(x) ((Lisp_Object) (((x) << INT_GCBITS) + 1))
# define make_char(x) ((Lisp_Object) (((x) << GCBITS) + Lisp_Type_Char))
# define VALMASK (((1UL << VALBITS) - 1UL) << GCTYPEBITS)
# define XTYPE(x) ((enum Lisp_Type) (((EMACS_UINT)(x)) & ~VALMASK))
# define XPNTRVAL(x) (x) /* This depends on Lisp_Type_Record == 0 */
# define XCHARVAL(x) ((x) >> GCBITS)
# define GC_EQ(x,y) EQ (x,y)
# define XREALINT(x) ((x) >> INT_GCBITS)
# define XUINT(x) ((EMACS_UINT)(x) >> INT_GCBITS)
# define INTP(x) ((EMACS_UINT)(x) & 1)
# define Qzero ((Lisp_Object) 1UL)

#else /* !USE_MINIMAL_TAGBITS */

# define MARKBIT (1UL << VALBITS)
# define XMARKBIT(x) (((x) & MARKBIT) != 0)
# define XMARK(x) ((void) ((x) |= MARKBIT))
# define XUNMARK(x) ((void) ((x) &= ~MARKBIT))
# define make_obj(vartype, value) \
  ((Lisp_Object) (((EMACS_UINT) (vartype) << (VALBITS + GCMARKBITS)) \
		  + ((EMACS_UINT) (value) & VALMASK)))
# define make_int(value) make_obj (Lisp_Type_Int, value)
# define make_char(value) make_obj (Lisp_Type_Char, value)
# define VALMASK ((1UL << VALBITS) - 1UL)
# define XTYPE(x) ((enum Lisp_Type) (((EMACS_UINT)(x)) >> (VALBITS + GCMARKBITS)))
# define XPNTRVAL(x) ((x) & VALMASK)
# define XCHARVAL(x) XPNTRVAL(x)
# define GC_EQ(x,y) (((x) & ~MARKBIT) == ((y) & ~MARKBIT))
# define XREALINT(x) (((x) << INT_GCBITS) >> INT_GCBITS)
# define XUINT(x) ((EMACS_UINT) ((x) & VALMASK))
# define INTP(x) (XTYPE (x) == Lisp_Type_Int)
# define Qzero ((Lisp_Object) Lisp_Type_Int)

#endif /* !USE_MINIMAL_TAGBITS */

#define Qnull_pointer 0
#define XGCTYPE(x) XTYPE(x)
#define EQ(x,y) ((x) == (y))
#define XSETINT(var,  value) ((void) ((var) = make_int (value)))
#define XSETCHAR(var, value) ((void) ((var) = make_char (value)))
#define XSETOBJ(var, vartype, value) ((void) ((var) = make_obj (vartype, value)))

/* Convert between a (void *) and a Lisp_Object, as when the
   Lisp_Object is passed to a toolkit callback function */
#define VOID_TO_LISP(larg,varg) ((void) ((larg) = ((Lisp_Object) (varg))))
#define CVOID_TO_LISP VOID_TO_LISP
#define LISP_TO_VOID(larg) ((void *) (larg))
#define LISP_TO_CVOID(varg) ((CONST void *) (larg))

/* Convert a Lisp_Object into something that can't be used as an
   lvalue.  Useful for type-checking. */
#define NON_LVALUE(larg) ((larg) + 0)
