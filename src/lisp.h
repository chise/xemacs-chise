/* Fundamental definitions for XEmacs Lisp interpreter.
   Copyright (C) 1985-1987, 1992-1995 Free Software Foundation, Inc.
   Copyright (C) 1993-1996 Richard Mlynarik.
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

/* Synched up with: FSF 19.30. */

#ifndef _XEMACS_LISP_H_
#define _XEMACS_LISP_H_

/************************************************************************/
/*			  general definitions				*/
/************************************************************************/

/* We include the following generally useful header files so that you
   don't have to worry about prototypes when using the standard C
   library functions and macros.  These files shouldn't be excessively
   large so they shouldn't cause that much of a slowdown. */

#include <stdlib.h>
#include <string.h>		/* primarily for memcpy, etc. */
#include <stdio.h>		/* NULL, etc. */
#include <ctype.h>
#include <stdarg.h>

#ifdef __lucid
# include <sysent.h>
#endif

/* ---- Dynamic arrays ---- */

#define Dynarr_declare(type)	\
  type *base;			\
  int elsize;			\
  int cur;			\
  int largest;			\
  int max

typedef struct dynarr
{
  Dynarr_declare (void);
} Dynarr;

void *Dynarr_newf (int elsize);
void Dynarr_resize (void *dy, int size);
void Dynarr_insert_many (void *d, CONST void *el, int len, int start);
void Dynarr_delete_many (void *d, int start, int len);
void Dynarr_free (void *d);

#define Dynarr_new(type) ((type##_dynarr *) Dynarr_newf (sizeof(type)))
#define Dynarr_at(d, pos) ((d)->base[pos])
#define Dynarr_atp(d, pos) (&Dynarr_at (d, pos))
#define Dynarr_length(d) ((d)->cur)
#define Dynarr_largest(d) ((d)->largest)
#define Dynarr_reset(d) ((d)->cur = 0)
#define Dynarr_add_many(d, el, len) Dynarr_insert_many (d, el, len, (d)->cur)
#define Dynarr_insert_many_at_start(d, el, len)	\
  Dynarr_insert_many (d, el, len, 0)
#define Dynarr_add_literal_string(d, s) Dynarr_add_many (d, s, sizeof(s) - 1)
#define Dynarr_add_lisp_string(d, s) do {		\
  struct Lisp_String *dyna_ls_s = XSTRING (s);		\
  Dynarr_add_many (d, (char *) string_data (dyna_ls_s),	\
		   string_length (dyna_ls_s));		\
} while (0)

#define Dynarr_add(d, el) (						\
  (d)->cur >= (d)->max ? Dynarr_resize ((d), (d)->cur+1) : (void) 0,	\
  ((d)->base)[(d)->cur++] = (el),					\
  (d)->cur > (d)->largest ? (d)->largest = (d)->cur : (int) 0)

/* The following defines will get you into real trouble if you aren't
   careful.  But they can save a lot of execution time when used wisely. */
#define Dynarr_increment(d) ((d)->cur++)
#define Dynarr_set_size(d, n) ((d)->cur = n)

/* Minimum size in elements for dynamic array when resized; default is 32 */
extern int Dynarr_min_size;

#ifdef MEMORY_USAGE_STATS
struct overhead_stats;
size_t Dynarr_memory_usage (void *d, struct overhead_stats *stats);
#endif

#include "symsinit.h"		/* compiler warning suppression */

/* Also define min() and max(). (Some compilers put them in strange
   places that won't be referenced by the above include files, such
   as 'macros.h' under Solaris.) */

#ifndef min
#define min(a,b) (((a) <= (b)) ? (a) : (b))
#endif
#ifndef max
#define max(a,b) (((a) > (b)) ? (a) : (b))
#endif

/* Memory allocation */
void malloc_warning (CONST char *);
void *xmalloc (size_t size);
void *xmalloc_and_zero (size_t size);
void *xrealloc (void *, size_t size);
char *xstrdup (CONST char *);
/* generally useful */
#define countof(x) ((int) (sizeof(x)/sizeof(x[0])))
#define slot_offset(type, slot_name) \
  ((unsigned) (((char *) (&(((type *)0)->slot_name))) - ((char *)0)))
#define xnew(type) ((type *) xmalloc (sizeof (type)))
#define xnew_array(type, len) ((type *) xmalloc ((len) * sizeof (type)))
#define xnew_and_zero(type) ((type *) xmalloc_and_zero (sizeof (type)))
#define xzero(lvalue) ((void) memset (&(lvalue), 0, sizeof (lvalue)))
#define xnew_array_and_zero(type, len) ((type *) xmalloc_and_zero ((len) * sizeof (type)))
#define XREALLOC_ARRAY(ptr, type, len) ((void) (ptr = (type *) xrealloc (ptr, (len) * sizeof (type))))
#define alloca_array(type, len) ((type *) alloca ((len) * sizeof (type)))

/* also generally useful if you want to avoid arbitrary size limits
   but don't need a full dynamic array.  Assumes that BASEVAR points
   to a malloced array of TYPE objects (or possibly a NULL pointer,
   if SIZEVAR is 0), with the total size stored in SIZEVAR.  This
   macro will realloc BASEVAR as necessary so that it can hold at
   least NEEDED_SIZE objects.  The reallocing is done by doubling,
   which ensures constant amortized time per element. */
#define DO_REALLOC(basevar, sizevar, needed_size, type)	do	\
{								\
  /* Avoid side-effectualness. */				\
  /* Dammit! Macros suffer from dynamic scope! */		\
  /* We demand inline functions! */				\
  size_t do_realloc_needed_size = (needed_size);		\
  size_t do_realloc_newsize = 0;				\
  while ((sizevar) < (do_realloc_needed_size)) {		\
    do_realloc_newsize = 2*(sizevar);				\
    if (do_realloc_newsize < 32)				\
      do_realloc_newsize = 32;					\
    (sizevar) = do_realloc_newsize;				\
  }								\
  if (do_realloc_newsize)					\
    XREALLOC_ARRAY (basevar, type, do_realloc_newsize);		\
} while (0)

#ifdef ERROR_CHECK_MALLOC
void xfree_1 (void *);
#define xfree(lvalue) do			\
{						\
  void **xfree_ptr = (void **) &(lvalue);	\
  xfree_1 (*xfree_ptr);				\
  *xfree_ptr = (void *) 0xDEADBEEF;		\
} while (0)
#else
void xfree (void *);
#define xfree_1 xfree
#endif /* ERROR_CHECK_MALLOC */

#ifndef PRINTF_ARGS
# if defined (__GNUC__) && (__GNUC__ >= 2)
#  define PRINTF_ARGS(string_index,first_to_check) \
          __attribute__ ((format (printf, string_index, first_to_check)))
# else
#  define PRINTF_ARGS(string_index,first_to_check)
# endif /* GNUC */
#endif

#ifndef DOESNT_RETURN
# if defined __GNUC__
#  if ((__GNUC__ > 2) || (__GNUC__ == 2) && (__GNUC_MINOR__ >= 5))
#   define DOESNT_RETURN void volatile
#   define DECLARE_DOESNT_RETURN(decl) \
           extern void volatile decl __attribute__ ((noreturn))
#   define DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS(decl,str,idx) \
     /* Should be able to state multiple independent __attribute__s, but  \
        the losing syntax doesn't work that way, and screws losing cpp */ \
           extern void volatile decl \
                  __attribute__ ((noreturn, format (printf, str, idx)))
#  else
#   define DOESNT_RETURN void volatile
#   define DECLARE_DOESNT_RETURN(decl) extern void volatile decl
#   define DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS(decl,str,idx) \
           extern void volatile decl PRINTF_ARGS(str,idx)
#  endif /* GNUC 2.5 */
# else
#  define DOESNT_RETURN void
#  define DECLARE_DOESNT_RETURN(decl) extern void decl
#  define DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS(decl,str,idx) \
          extern void decl PRINTF_ARGS(str,idx)
# endif /* GNUC */
#endif

#ifndef ALIGNOF
# if defined (__GNUC__) && (__GNUC__ >= 2)
#  define ALIGNOF(x) __alignof (x)
# else
#  define ALIGNOF(x) sizeof (x)
# endif
#endif

#define ALIGN_SIZE(len, unit) \
  ((((len) + (unit) - 1) / (unit)) * (unit))

/* #### Yuck, this is kind of evil */
#define ALIGN_PTR(ptr, unit) \
  ((void *) ALIGN_SIZE ((long) (ptr), unit))

#ifndef DO_NOTHING
#define DO_NOTHING do {} while (0)
#endif

#ifndef DECLARE_NOTHING
#define DECLARE_NOTHING struct nosuchstruct
#endif

/* We define assert iff USE_ASSERTIONS or DEBUG_XEMACS is defined.
   Otherwise we define it to be empty.  Quantify has shown that the
   time the assert checks take is measurable so let's not include them
   in production binaries. */

#ifdef USE_ASSERTIONS
/* Highly dubious kludge */
/*   (thanks, Jamie, I feel better now -- ben) */
DECLARE_DOESNT_RETURN (assert_failed (CONST char *, int, CONST char *));
# define abort() (assert_failed (__FILE__, __LINE__, "abort()"))
# define assert(x) ((x) ? (void) 0 : assert_failed (__FILE__, __LINE__, #x))
#else
# ifdef DEBUG_XEMACS
#  define assert(x) ((x) ? (void) 0 : (void) abort ())
# else
#  define assert(x)
# endif
#endif

/*#ifdef DEBUG_XEMACS*/
#define REGISTER
#define register
/*#else*/
/*#define REGISTER register*/
/*#endif*/


/************************************************************************/
/*				  typedefs				*/
/************************************************************************/

/* We put typedefs here so that prototype declarations don't choke.
   Note that we don't actually declare the structures here (except
   maybe for simple structures like Dynarrs); that keeps them private
   to the routines that actually use them. */

/* The data representing the text in a buffer is logically a set
   of Bufbytes, declared as follows. */

typedef unsigned char Bufbyte;

/* The data representing a string in "external" format (simple
   binary format) is logically a set of Extbytes, declared as follows. */

typedef unsigned char Extbyte;

/* To the user, a buffer is made up of characters, declared as follows.
   In the non-Mule world, characters and Bufbytes are equivalent.
   In the Mule world, a character requires (typically) 1 to 4
   Bufbytes for its representation in a buffer. */

typedef int Emchar;

/* Different ways of referring to a position in a buffer.  We use
   the typedefs in preference to 'int' to make it clearer what
   sort of position is being used.  See extents.c for a description
   of the different positions.  We put them here instead of in
   buffer.h (where they rightfully belong) to avoid syntax errors
   in function prototypes. */

typedef int Bufpos;
typedef int Bytind;
typedef int Memind;

/* Counts of bytes or chars */

typedef int Bytecount;
typedef int Charcount;

/* Length in bytes of a string in external format */
typedef int Extcount;

typedef struct lstream Lstream;

typedef unsigned int face_index;

typedef struct
{
  Dynarr_declare (struct face_cachel);
} face_cachel_dynarr;

typedef unsigned int glyph_index;

/* This is shared by process.h, events.h and others in future.
   See events.h for description */
typedef unsigned int USID;

typedef struct
{
  Dynarr_declare (struct glyph_cachel);
} glyph_cachel_dynarr;

struct buffer;                  /* "buffer.h" */
struct console;			/* "console.h" */
struct device;			/* "device.h" */
struct extent_fragment;
struct extent;
typedef struct extent *EXTENT;
struct frame;			/* "frame.h" */
struct window;                  /* "window.h" */
struct Lisp_Event;              /* "events.h" */
typedef struct Lisp_Event Lisp_Event;
struct Lisp_Face;
typedef struct Lisp_Face Lisp_Face;
struct Lisp_Process;            /* "process.c" */
typedef struct Lisp_Process Lisp_Process;
struct stat;                    /* <sys/stat.h> */
struct Lisp_Color_Instance;
typedef struct Lisp_Color_Instance Lisp_Color_Instance;
struct Lisp_Font_Instance;
typedef struct Lisp_Font_Instance Lisp_Font_Instance;
struct Lisp_Image_Instance;
typedef struct Lisp_Image_Instance Lisp_Image_Instance;
struct display_line;
struct redisplay_info;
struct window_mirror;
struct scrollbar_instance;
struct font_metric_info;
struct face_cachel;
struct console_type_entry;

typedef struct
{
  Dynarr_declare (Bufbyte);
} Bufbyte_dynarr;

typedef struct
{
  Dynarr_declare (Extbyte);
} Extbyte_dynarr;

typedef struct
{
  Dynarr_declare (Emchar);
} Emchar_dynarr;

typedef struct
{
  Dynarr_declare (char);
} char_dynarr;

typedef unsigned char unsigned_char;
typedef struct
{
  Dynarr_declare (unsigned char);
} unsigned_char_dynarr;

typedef unsigned long unsigned_long;
typedef struct
{
  Dynarr_declare (unsigned long);
} unsigned_long_dynarr;

typedef struct
{
  Dynarr_declare (int);
} int_dynarr;

typedef struct
{
  Dynarr_declare (Bufpos);
} Bufpos_dynarr;

typedef struct
{
  Dynarr_declare (Bytind);
} Bytind_dynarr;

typedef struct
{
  Dynarr_declare (Charcount);
} Charcount_dynarr;

typedef struct
{
  Dynarr_declare (Bytecount);
} Bytecount_dynarr;

typedef struct
{
  Dynarr_declare (struct console_type_entry);
} console_type_entry_dynarr;

/* Need to declare this here. */
enum external_data_format
{
  /* Binary format.  This is the simplest format and is what we
     use in the absence of a more appropriate format.  This converts
     according to the `binary' coding system:

     a) On input, bytes 0 - 255 are converted into characters 0 - 255.
     b) On output, characters 0 - 255 are converted into bytes 0 - 255
        and other characters are converted into `X'.
   */
  FORMAT_BINARY,

  /* Format used for filenames.  In the original Mule, this is
     user-definable with the `pathname-coding-system' variable.
     For the moment, we just use the `binary' coding system. */
  FORMAT_FILENAME,

  /* Format used for output to the terminal.  This should be controlled
     by the `terminal-coding-system' variable.  Under kterm, this will
     be some ISO2022 system.  On some DOS machines, this is Shift-JIS. */
  FORMAT_TERMINAL,

  /* Format used for input from the terminal.  This should be controlled
     by the `keyboard-coding-system' variable. */
  FORMAT_KEYBOARD,

  /* Format used for the external Unix environment -- argv[], stuff
     from getenv(), stuff from the /etc/passwd file, etc.

     Perhaps should be the same as FORMAT_FILENAME. */
  FORMAT_OS,

  /* Compound-text format.  This is the standard X format used for
     data stored in properties, selections, and the like.  This is
     an 8-bit no-lock-shift ISO2022 coding system. */
  FORMAT_CTEXT
};

#define FORMAT_NATIVE FORMAT_FILENAME

enum run_hooks_condition
{
  RUN_HOOKS_TO_COMPLETION,
  RUN_HOOKS_UNTIL_SUCCESS,
  RUN_HOOKS_UNTIL_FAILURE
};

#ifdef HAVE_TOOLBARS
enum toolbar_pos
{
  TOP_TOOLBAR,
  BOTTOM_TOOLBAR,
  LEFT_TOOLBAR,
  RIGHT_TOOLBAR
};
#endif

#ifndef ERROR_CHECK_TYPECHECK

typedef enum error_behavior
{
  ERROR_ME,
  ERROR_ME_NOT,
  ERROR_ME_WARN
} Error_behavior;

#define ERRB_EQ(a, b) ((a) == (b))

#else

/* By defining it like this, we provide strict type-checking
   for code that lazily uses ints. */

typedef struct _error_behavior_struct_
{
  int really_unlikely_name_to_have_accidentally_in_a_non_errb_structure;
} Error_behavior;

extern Error_behavior ERROR_ME;
extern Error_behavior ERROR_ME_NOT;
extern Error_behavior ERROR_ME_WARN;

#define ERRB_EQ(a, b)							   \
 ((a).really_unlikely_name_to_have_accidentally_in_a_non_errb_structure == \
  (b).really_unlikely_name_to_have_accidentally_in_a_non_errb_structure)

#endif

enum munge_me_out_the_door
{
  MUNGE_ME_FUNCTION_KEY,
  MUNGE_ME_KEY_TRANSLATION
};


/************************************************************************/
/*		     Definition of Lisp_Object data type		*/
/************************************************************************/

#ifdef USE_MINIMAL_TAGBITS
# define LRECORD_CONS
# define LRECORD_VECTOR
# define LRECORD_SYMBOL
# define LRECORD_STRING
#endif

/* Define the fundamental Lisp data structures */

/* This is the set of Lisp data types */

#ifndef USE_MINIMAL_TAGBITS

enum Lisp_Type
{
  /* XRECORD_LHEADER (object) points to a struct lrecord_header
     lheader->implementation determines the type (and GC behavior)
     of the object. */
  Lisp_Type_Record,

  /* Integer.  XINT(obj) is the integer value. */
  Lisp_Type_Int,

#ifndef LRECORD_CONS
  /* Cons.  XCONS (object) points to a struct Lisp_Cons. */
  Lisp_Type_Cons,
#endif

#ifndef LRECORD_STRING
  /* String.  XSTRING (object) points to a struct Lisp_String.
     The length of the string, and its contents, are stored therein. */
  Lisp_Type_String,
#endif

#ifndef LRECORD_VECTOR
  /* Vector of Lisp objects.  XVECTOR(object) points to a struct Lisp_Vector.
     The length of the vector, and its contents, are stored therein. */
  Lisp_Type_Vector,
#endif /* !LRECORD_VECTOR */

#ifndef LRECORD_SYMBOL
  /* Symbol.  XSYMBOL (object) points to a struct Lisp_Symbol. */
  Lisp_Type_Symbol,
#endif /* !LRECORD_SYMBOL */

  Lisp_Type_Char
};

# define POINTER_TYPE_P(type) \
  ((type) != Lisp_Type_Int && (type) != Lisp_Type_Char)

#else /* USE_MINIMAL_TAGBITS */

enum Lisp_Type
{
  Lisp_Type_Record,
  Lisp_Type_Int_Even,
  Lisp_Type_Char,
  Lisp_Type_Int_Odd
};

#define POINTER_TYPE_P(type) ((type) == Lisp_Type_Record)

#endif /* USE_MINIMAL_TAGBITS */

/* EMACS_INT is the underlying integral type into which a Lisp_Object must fit.
   In particular, it must be large enough to contain a pointer.
   config.h can override this, e.g. to use `long long' for bigger lisp ints. */

#ifndef SIZEOF_EMACS_INT
# define SIZEOF_EMACS_INT SIZEOF_VOID_P
#endif

#ifndef EMACS_INT
# if   SIZEOF_EMACS_INT == SIZEOF_LONG
#  define EMACS_INT long
# elif SIZEOF_EMACS_INT == SIZEOF_INT
#  define EMACS_INT int
# elif SIZEOF_EMACS_INT == SIZEOF_LONG_LONG
#  define EMACS_INT long long
# else
#  error Unable to determine suitable type for EMACS_INT
# endif
#endif

#ifndef EMACS_UINT
# define EMACS_UINT unsigned EMACS_INT
#endif

#define BITS_PER_EMACS_INT (SIZEOF_EMACS_INT * BITS_PER_CHAR)

/* Overridden by m/next.h */
#ifndef ASSERT_VALID_POINTER
# define ASSERT_VALID_POINTER(pnt) (assert ((((EMACS_UINT) pnt) & 3) == 0))
#endif

#ifdef USE_MINIMAL_TAGBITS
# define GCMARKBITS  0
# define GCTYPEBITS  2
# define GCBITS      2
# define INT_GCBITS  1
#else
# define GCMARKBITS  1
# define GCTYPEBITS  3
# define GCBITS      4
# define INT_GCBITS  GCBITS
#endif

#define INT_VALBITS (BITS_PER_EMACS_INT - INT_GCBITS)
#define VALBITS (BITS_PER_EMACS_INT - GCBITS)
#define EMACS_INT_MAX ((1UL << INT_VALBITS) -1UL)

#ifdef USE_UNION_TYPE
# include "lisp-union.h"
#else /* !USE_UNION_TYPE */
# include "lisp-disunion.h"
#endif /* !USE_UNION_TYPE */

#ifdef HAVE_SHM
/* In this representation, data is found in two widely separated segments.  */
extern int pure_size;
# define XPNTR(x) \
  ((void *)(XPNTRVAL(x)) | (XPNTRVAL(x) > pure_size ? DATA_SEG_BITS : PURE_SEG_BITS)))
#else /* not HAVE_SHM */
# ifdef DATA_SEG_BITS
/* This case is used for the rt-pc and hp-pa.
   In the diffs I was given, it checked for ptr = 0
   and did not adjust it in that case.
   But I don't think that zero should ever be found
   in a Lisp object whose data type says it points to something.
 */
#  define XPNTR(x) ((void *)((XPNTRVAL(x)) | DATA_SEG_BITS))
# else /* not DATA_SEG_BITS */
#  define XPNTR(x) ((void *) (XPNTRVAL(x)))
# endif /* not DATA_SEG_BITS */
#endif /* not HAVE_SHM */


/* WARNING WARNING WARNING.  You must ensure on your own that proper
   GC protection is provided for the elements in this array. */
typedef struct
{
  Dynarr_declare (Lisp_Object);
} Lisp_Object_dynarr;

/* Close your eyes now lest you vomit or spontaneously combust ... */

#define HACKEQ_UNSAFE(obj1, obj2)				\
  (EQ (obj1, obj2) || (!POINTER_TYPE_P (XGCTYPE (obj1))		\
		       && !POINTER_TYPE_P (XGCTYPE (obj2))	\
		       && XCHAR_OR_INT (obj1) == XCHAR_OR_INT (obj2)))

#ifdef DEBUG_XEMACS
extern int debug_issue_ebola_notices;
int eq_with_ebola_notice (Lisp_Object, Lisp_Object);
#define EQ_WITH_EBOLA_NOTICE(obj1, obj2)				\
  (debug_issue_ebola_notices ? eq_with_ebola_notice (obj1, obj2)	\
   : EQ (obj1, obj2))
#else
#define EQ_WITH_EBOLA_NOTICE(obj1, obj2) EQ (obj1, obj2)
#endif

/* OK, you can open them again */


/************************************************************************/
/*		     Definitions of basic Lisp objects			*/
/************************************************************************/

#include "lrecord.h"

/*********** unbound ***********/

/* Qunbound is a special Lisp_Object (actually of type
   symbol-value-forward), that can never be visible to
   the Lisp caller and thus can be used in the C code
   to mean "no such value". */

#define UNBOUNDP(val) EQ (val, Qunbound)
#define GC_UNBOUNDP(val) GC_EQ (val, Qunbound)

/*********** cons ***********/

/* In a cons, the markbit of the car is the gc mark bit */

struct Lisp_Cons
{
#ifdef LRECORD_CONS
  struct lrecord_header lheader;
#endif
  Lisp_Object car, cdr;
};
typedef struct Lisp_Cons Lisp_Cons;

#if 0 /* FSFmacs */
/* Like a cons, but records info on where the text lives that it was read from */
/* This is not really in use now */

struct Lisp_Buffer_Cons
{
  Lisp_Object car, cdr;
  struct buffer *buffer;
  int bufpos;
};
#endif

#ifdef LRECORD_CONS

DECLARE_LRECORD (cons, Lisp_Cons);
#define XCONS(x) XRECORD (x, cons, Lisp_Cons)
#define XSETCONS(x, p) XSETRECORD (x, p, cons)
#define CONSP(x) RECORDP (x, cons)
#define GC_CONSP(x) GC_RECORDP (x, cons)
#define CHECK_CONS(x) CHECK_RECORD (x, cons)
#define CONCHECK_CONS(x) CONCHECK_RECORD (x, cons)

#define CONS_MARKED_P(c) MARKED_RECORD_HEADER_P(&((c)->lheader))
#define MARK_CONS(c) MARK_RECORD_HEADER (&((c)->lheader))

#else /* ! LRECORD_CONS */

DECLARE_NONRECORD (cons, Lisp_Type_Cons, Lisp_Cons);
#define XCONS(a) XNONRECORD (a, cons, Lisp_Type_Cons, Lisp_Cons)
#define XSETCONS(c, p) XSETOBJ (c, Lisp_Type_Cons, p)
#define CONSP(x) (XTYPE (x) == Lisp_Type_Cons)
#define GC_CONSP(x) (XGCTYPE (x) == Lisp_Type_Cons)
#define CHECK_CONS(x) CHECK_NONRECORD (x, Lisp_Type_Cons, Qconsp)
#define CONCHECK_CONS(x) CONCHECK_NONRECORD (x, Lisp_Type_Cons, Qconsp)

/* Define these because they're used in a few places, inside and
   out of alloc.c */
#define CONS_MARKED_P(c) XMARKBIT (c->car)
#define MARK_CONS(c) XMARK (c->car)

#endif /* ! LRECORD_CONS */

extern Lisp_Object Qnil;

#define NILP(x)  EQ (x, Qnil)
#define GC_NILP(x)  GC_EQ (x, Qnil)
#define XCAR(a) (XCONS (a)->car)
#define XCDR(a) (XCONS (a)->cdr)
#define LISTP(x) (CONSP(x) || NILP(x))

#define CHECK_LIST(x) do {			\
  if (!LISTP (x))				\
    dead_wrong_type_argument (Qlistp, x);	\
} while (0)

#define CONCHECK_LIST(x) do {			\
  if (!LISTP (x))				\
    x = wrong_type_argument (Qlistp, x);	\
} while (0)

/* For a list that's known to be in valid list format --
   will abort() if the list is not in valid format */
#define LIST_LOOP(tail, list)		\
  for (tail = list;			\
       !NILP (tail);			\
       tail = XCDR (tail))

#define LIST_LOOP_2(elt, list)		\
  Lisp_Object tail##elt;		\
  LIST_LOOP_3(elt, list, tail##elt)

#define LIST_LOOP_3(elt, list, tail)	\
  for (tail = list;			\
       NILP (tail) ?			\
	 0 : (elt = XCAR (tail), 1);	\
       tail = XCDR (tail))

#define GET_LIST_LENGTH(list, len) do {		\
  Lisp_Object GLL_tail;				\
  for (GLL_tail = list, len = 0;		\
       !NILP (GLL_tail);			\
       GLL_tail = XCDR (GLL_tail), ++len)	\
    DO_NOTHING;					\
} while (0)

#define GET_EXTERNAL_LIST_LENGTH(list, len)		\
do {							\
  Lisp_Object GELL_elt, GELL_tail;			\
  EXTERNAL_LIST_LOOP_4 (GELL_elt, list, GELL_tail, len)	\
    ;							\
} while (0)

/* For a list that's known to be in valid list format, where we may
   be deleting the current element out of the list --
   will abort() if the list is not in valid format */
#define LIST_LOOP_DELETING(consvar, nextconsvar, list)		\
  for (consvar = list;						\
       !NILP (consvar) ? (nextconsvar = XCDR (consvar), 1) :0;	\
       consvar = nextconsvar)

/* Delete all elements of external list LIST
   satisfying CONDITION, an expression referring to variable ELT */
#define EXTERNAL_LIST_LOOP_DELETE_IF(elt, list, condition) do {	\
  Lisp_Object prev_tail_##list = Qnil;				\
  Lisp_Object tail_##list;					\
  int len_##list;						\
  EXTERNAL_LIST_LOOP_4 (elt, list, tail_##list, len_##list)	\
    {								\
      if (condition)						\
	{							\
	  if (NILP (prev_tail_##list))				\
	    list = XCDR (tail_##list);				\
	  else							\
	    XCDR (prev_tail_##list) = XCDR (tail_##list);	\
          /* Keep tortoise from ever passing hare. */		\
	  len_##list = 0;					\
	}							\
      else							\
	prev_tail_##list = tail_##list;				\
    }								\
} while (0)

/* Delete all elements of true non-circular list LIST
   satisfying CONDITION, an expression referring to variable ELT */
#define LIST_LOOP_DELETE_IF(elt, list, condition) do {		\
  Lisp_Object prev_tail_##list = Qnil;				\
  Lisp_Object tail_##list;					\
  LIST_LOOP_3 (elt, list, tail_##list)				\
    {								\
      if (condition)						\
	{							\
	  if (NILP (prev_tail_##list))				\
	    list = XCDR (tail_##list);				\
	  else							\
	    XCDR (prev_tail_##list) = XCDR (tail_##list);	\
	}							\
      else							\
	prev_tail_##list = tail_##list;				\
    }								\
} while (0)

/* For a list that may not be in valid list format --
   will signal an error if the list is not in valid format */
#define EXTERNAL_LIST_LOOP(tail, list)			\
  for (tail = list; !NILP (tail); tail = XCDR (tail))	\
     if (!CONSP (tail))					\
       signal_malformed_list_error (list);		\
     else


/* The following macros are for traversing lisp lists.
   Signal an error if LIST is not properly acyclic and nil-terminated.

   Use tortoise/hare algorithm to check for cycles, but only if it
   looks like the list is getting too long.  Not only is the hare
   faster than the tortoise; it even gets a head start! */

/* Optimized and safe macros for looping over external lists.  */
#define CIRCULAR_LIST_SUSPICION_LENGTH 1024

#define EXTERNAL_LIST_LOOP_1(list)					\
Lisp_Object ELL1_elt, ELL1_hare, ELL1_tortoise;				\
int ELL1_len;								\
EXTERNAL_LIST_LOOP_6(ELL1_elt, list, ELL1_len, ELL1_hare,		\
		     ELL1_tortoise, CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_LIST_LOOP_2(elt, list)					\
Lisp_Object hare_##elt, tortoise_##elt;					\
int len_##elt;								\
EXTERNAL_LIST_LOOP_6(elt, list, len_##elt, hare_##elt,			\
		     tortoise_##elt, CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_LIST_LOOP_3(elt, list, tail)				\
Lisp_Object tortoise_##elt;						\
int len_##elt;								\
EXTERNAL_LIST_LOOP_6(elt, list, len_##elt, tail,			\
		     tortoise_##elt, CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_LIST_LOOP_4(elt, list, tail, len)			\
Lisp_Object tortoise_##elt;						\
EXTERNAL_LIST_LOOP_6(elt, list, len, tail,				\
		     tortoise_##elt, CIRCULAR_LIST_SUSPICION_LENGTH)


#define EXTERNAL_LIST_LOOP_6(elt, list, len, hare,		\
                             tortoise, suspicion_length)	\
  for (tortoise = hare = list, len = 0;				\
								\
       (CONSP (hare) ? ((elt = XCAR (hare)), 1) :		\
	(NILP (hare) ? 0 :					\
	 (signal_malformed_list_error (list), 0)));		\
								\
       hare = XCDR (hare),					\
	 ((++len < suspicion_length) ?				\
	  ((void) 0) :						\
	  (((len & 1) ?						\
	    ((void) (tortoise = XCDR (tortoise))) :		\
	    ((void) 0))						\
	   ,							\
	   (EQ (hare, tortoise) ?				\
	    ((void) signal_circular_list_error (list)) :	\
	    ((void) 0)))))



/* Optimized and safe macros for looping over external alists. */
#define EXTERNAL_ALIST_LOOP_4(elt, elt_car, elt_cdr, list)		\
Lisp_Object hare_##elt, tortoise_##elt;					\
int len_##elt;								\
EXTERNAL_ALIST_LOOP_8 (elt, elt_car, elt_cdr, list,			\
		       len_##elt, hare_##elt, tortoise_##elt,		\
		       CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_ALIST_LOOP_5(elt, elt_car, elt_cdr, list, tail)	\
Lisp_Object tortoise_##elt;						\
int len_##elt;								\
EXTERNAL_ALIST_LOOP_8(elt, elt_car, elt_cdr, list,			\
		      len_##elt, tail, tortoise_##elt,			\
		      CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_ALIST_LOOP_6(elt, elt_car, elt_cdr, list, tail, len)	\
Lisp_Object tortoise_##elt;						\
EXTERNAL_ALIST_LOOP_8(elt, elt_car, elt_cdr, list,			\
		      len, tail, tortoise_##elt,			\
		      CIRCULAR_LIST_SUSPICION_LENGTH)


#define EXTERNAL_ALIST_LOOP_8(elt, elt_car, elt_cdr, list, len, hare,	\
                             tortoise, suspicion_length)		\
EXTERNAL_LIST_LOOP_6(elt, list, len, hare, tortoise, suspicion_length)	\
  if (CONSP (elt) ? (elt_car = XCAR (elt), elt_cdr = XCDR (elt), 0) :1)	\
    continue;								\
  else


/* Optimized and safe macros for looping over external property lists. */
#define EXTERNAL_PROPERTY_LIST_LOOP_3(key, value, list)			\
Lisp_Object key, value, hare_##key, tortoise_##key;			\
int len_##key;								\
EXTERNAL_PROPERTY_LIST_LOOP_7(key, value, list, len_##key, hare_##key,\
		     tortoise_##key, CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_PROPERTY_LIST_LOOP_4(key, value, list, tail)		\
Lisp_Object key, value, tail, tortoise_##key;				\
int len_##key;								\
EXTERNAL_PROPERTY_LIST_LOOP_7(key, value, list, len_##key, tail,	\
		     tortoise_##key, CIRCULAR_LIST_SUSPICION_LENGTH)

#define EXTERNAL_PROPERTY_LIST_LOOP_5(key, value, list, tail, len)	\
Lisp_Object key, value, tail, tortoise_##key;				\
int len;								\
EXTERNAL_PROPERTY_LIST_LOOP_7(key, value, list, len, tail,		\
		     tortoise_##key, CIRCULAR_LIST_SUSPICION_LENGTH)


#define EXTERNAL_PROPERTY_LIST_LOOP_7(key, value, list, len, hare,	\
                             tortoise, suspicion_length)		\
  for (tortoise = hare = list, len = 0;					\
									\
       ((CONSP (hare) &&						\
	 (key = XCAR (hare),						\
	  hare = XCDR (hare),						\
	  CONSP (hare))) ?						\
	(value = XCAR (hare), 1) :					\
	(NILP (hare) ? 0 :						\
	 (signal_malformed_property_list_error (list), 0)));		\
									\
       hare = XCDR (hare),						\
	 ((++len < suspicion_length) ?					\
	  ((void) 0) :							\
	  (((len & 1) ?							\
	    ((void) (tortoise = XCDR (XCDR (tortoise)))) :		\
	    ((void) 0))							\
	   ,								\
	   (EQ (hare, tortoise) ?					\
	    ((void) signal_circular_property_list_error (list)) :	\
	    ((void) 0)))))

/* For a property list (alternating keywords/values) that may not be
   in valid list format -- will signal an error if the list is not in
   valid format.  CONSVAR is used to keep track of the iterations
   without modifying PLIST.

   We have to be tricky to still keep the same C format.*/
#define EXTERNAL_PROPERTY_LIST_LOOP(tail, key, value, plist)	\
  for (tail = plist;						\
       (CONSP (tail) && CONSP (XCDR (tail)) ?			\
	(key = XCAR (tail), value = XCAR (XCDR (tail))) :	\
	(key = Qunbound,    value = Qunbound)),			\
       !NILP (tail);						\
       tail = XCDR (XCDR (tail)))				\
    if (UNBOUNDP (key))						\
      Fsignal (Qmalformed_property_list, list1 (plist));	\
    else

#define PROPERTY_LIST_LOOP(tail, key, value, plist)	\
  for (tail = plist;					\
       NILP (tail) ? 0 :				\
	 (key   = XCAR (tail), tail = XCDR (tail),	\
	  value = XCAR (tail), tail = XCDR (tail), 1);	\
       )

/* Return 1 if LIST is properly acyclic and nil-terminated, else 0. */
INLINE int TRUE_LIST_P (Lisp_Object object);
INLINE int
TRUE_LIST_P (Lisp_Object object)
{
  Lisp_Object hare, tortoise;
  int len;

  for (hare = tortoise = object, len = 0;
       CONSP (hare);
       hare = XCDR (hare), len++)
    {
      if (len < CIRCULAR_LIST_SUSPICION_LENGTH)
	continue;

      if (len & 1)
	tortoise = XCDR (tortoise);
      else if (EQ (hare, tortoise))
	return 0;
    }

  return NILP (hare);
}

/* Signal an error if LIST is not properly acyclic and nil-terminated. */
#define CHECK_TRUE_LIST(list) do {			\
  Lisp_Object CTL_list = (list);			\
  Lisp_Object CTL_hare, CTL_tortoise;			\
  int CTL_len;						\
							\
  for (CTL_hare = CTL_tortoise = CTL_list, CTL_len = 0;	\
       CONSP (CTL_hare);				\
       CTL_hare = XCDR (CTL_hare), CTL_len++)		\
    {							\
      if (CTL_len < CIRCULAR_LIST_SUSPICION_LENGTH)	\
	continue;					\
							\
      if (CTL_len & 1)					\
	CTL_tortoise = XCDR (CTL_tortoise);		\
      else if (EQ (CTL_hare, CTL_tortoise))		\
	Fsignal (Qcircular_list, list1 (CTL_list));	\
    }							\
							\
  if (! NILP (CTL_hare))				\
    signal_malformed_list_error (CTL_list);		\
} while (0)

/*********** string ***********/

/* In a string, the markbit of the plist is used as the gc mark bit */

struct Lisp_String
{
#ifdef LRECORD_STRING
  struct lrecord_header lheader;
#endif
  Bytecount size;
  Bufbyte *data;
  Lisp_Object plist;
};
typedef struct Lisp_String Lisp_String;

#ifdef LRECORD_STRING

DECLARE_LRECORD (string, Lisp_String);
#define XSTRING(x) XRECORD (x, string, Lisp_String)
#define XSETSTRING(x, p) XSETRECORD (x, p, string)
#define STRINGP(x) RECORDP (x, string)
#define GC_STRINGP(x) GC_RECORDP (x, string)
#define CHECK_STRING(x) CHECK_RECORD (x, string)
#define CONCHECK_STRING(x) CONCHECK_RECORD (x, string)

#else /* ! LRECORD_STRING */

DECLARE_NONRECORD (string, Lisp_Type_String, Lisp_String);
#define XSTRING(x) XNONRECORD (x, string, Lisp_Type_String, Lisp_String)
#define XSETSTRING(x, p) XSETOBJ (x, Lisp_Type_String, p)
#define STRINGP(x) (XTYPE (x) == Lisp_Type_String)
#define GC_STRINGP(x) (XGCTYPE (x) == Lisp_Type_String)
#define CHECK_STRING(x) CHECK_NONRECORD (x, Lisp_Type_String, Qstringp)
#define CONCHECK_STRING(x) CONCHECK_NONRECORD (x, Lisp_Type_String, Qstringp)

#endif /* ! LRECORD_STRING */

#ifdef MULE

Charcount bytecount_to_charcount (CONST Bufbyte *ptr, Bytecount len);
Bytecount charcount_to_bytecount (CONST Bufbyte *ptr, Charcount len);

#else /* not MULE */

# define bytecount_to_charcount(ptr, len) (len)
# define charcount_to_bytecount(ptr, len) (len)

#endif /* not MULE */

#define string_length(s) ((s)->size)
#define XSTRING_LENGTH(s) string_length (XSTRING (s))
#define XSTRING_CHAR_LENGTH(s) string_char_length (XSTRING (s))
#define string_data(s) ((s)->data + 0)
#define XSTRING_DATA(s) string_data (XSTRING (s))
#define string_byte(s, i) ((s)->data[i] + 0)
#define XSTRING_BYTE(s, i) string_byte (XSTRING (s), i)
#define string_byte_addr(s, i) (&((s)->data[i]))
#define set_string_length(s, len) ((void) ((s)->size = (len)))
#define set_string_data(s, ptr) ((void) ((s)->data = (ptr)))
#define set_string_byte(s, i, c) ((void) ((s)->data[i] = (c)))

void resize_string (Lisp_String *s, Bytecount pos, Bytecount delta);

#ifdef MULE

INLINE Charcount string_char_length (Lisp_String *s);
INLINE Charcount
string_char_length (Lisp_String *s)
{
  return bytecount_to_charcount (string_data (s), string_length (s));
}

# define string_char(s, i) charptr_emchar_n (string_data (s), i)
# define string_char_addr(s, i) charptr_n_addr (string_data (s), i)
void set_string_char (Lisp_String *s, Charcount i, Emchar c);

#else /* not MULE */

# define string_char_length(s) string_length (s)
# define string_char(s, i) ((Emchar) string_byte (s, i))
# define string_char_addr(s, i) string_byte_addr (s, i)
# define set_string_char(s, i, c) set_string_byte (s, i, c)

#endif /* not MULE */

/*********** vector ***********/

struct Lisp_Vector
{
#ifdef LRECORD_VECTOR
  struct lcrecord_header header;
#endif
  long size;
  /* next is now chained through v->contents[size], terminated by Qzero.
     This means that pure vectors don't need a "next" */
  /* struct Lisp_Vector *next; */
  Lisp_Object contents[1];
};
typedef struct Lisp_Vector Lisp_Vector;

#ifdef LRECORD_VECTOR

DECLARE_LRECORD (vector, Lisp_Vector);
#define XVECTOR(x) XRECORD (x, vector, Lisp_Vector)
#define XSETVECTOR(x, p) XSETRECORD (x, p, vector)
#define VECTORP(x) RECORDP (x, vector)
#define GC_VECTORP(x) GC_RECORDP (x, vector)
#define CHECK_VECTOR(x) CHECK_RECORD (x, vector)
#define CONCHECK_VECTOR(x) CONCHECK_RECORD (x, vector)

#else

DECLARE_NONRECORD (vector, Lisp_Type_Vector, Lisp_Vector);
#define XVECTOR(x) XNONRECORD (x, vector, Lisp_Type_Vector, Lisp_Vector)
#define XSETVECTOR(x, p) XSETOBJ (x, Lisp_Type_Vector, p)
#define VECTORP(x) (XTYPE (x) == Lisp_Type_Vector)
#define GC_VECTORP(x) (XGCTYPE (x) == Lisp_Type_Vector)
#define CHECK_VECTOR(x) CHECK_NONRECORD (x, Lisp_Type_Vector, Qvectorp)
#define CONCHECK_VECTOR(x) CONCHECK_NONRECORD (x, Lisp_Type_Vector, Qvectorp)

#endif

#define vector_length(v) ((v)->size)
#define XVECTOR_LENGTH(s) vector_length (XVECTOR (s))
#define vector_data(v) ((v)->contents)
#define XVECTOR_DATA(s) vector_data (XVECTOR (s))
#ifndef LRECORD_VECTOR
# define vector_next(v) ((v)->contents[(v)->size])
#endif

/*********** bit vector ***********/

#if (LONGBITS < 16)
#error What the hell?!
#elif (LONGBITS < 32)
# define LONGBITS_LOG2 4
# define LONGBITS_POWER_OF_2 16
#elif (LONGBITS < 64)
# define LONGBITS_LOG2 5
# define LONGBITS_POWER_OF_2 32
#elif (LONGBITS < 128)
# define LONGBITS_LOG2 6
# define LONGBITS_POWER_OF_2 64
#else
#error You really have 128-bit integers?!
#endif

struct Lisp_Bit_Vector
{
  struct lrecord_header lheader;
  Lisp_Object next;
  size_t size;
  unsigned long bits[1];
};
typedef struct Lisp_Bit_Vector Lisp_Bit_Vector;

DECLARE_LRECORD (bit_vector, Lisp_Bit_Vector);
#define XBIT_VECTOR(x) XRECORD (x, bit_vector, Lisp_Bit_Vector)
#define XSETBIT_VECTOR(x, p) XSETRECORD (x, p, bit_vector)
#define BIT_VECTORP(x) RECORDP (x, bit_vector)
#define GC_BIT_VECTORP(x) GC_RECORDP (x, bit_vector)
#define CHECK_BIT_VECTOR(x) CHECK_RECORD (x, bit_vector)
#define CONCHECK_BIT_VECTOR(x) CONCHECK_RECORD (x, bit_vector)

#define BITP(x) (INTP (x) && (XINT (x) == 0 || XINT (x) == 1))
#define GC_BITP(x) (GC_INTP (x) && (XINT (x) == 0 || XINT (x) == 1))

#define CHECK_BIT(x) do {		\
  if (!BITP (x))			\
    dead_wrong_type_argument (Qbitp, x);\
} while (0)

#define CONCHECK_BIT(x) do {		\
  if (!BITP (x))			\
    x = wrong_type_argument (Qbitp, x);	\
} while (0)

#define bit_vector_length(v) ((v)->size)
#define bit_vector_next(v) ((v)->next)

INLINE int bit_vector_bit (Lisp_Bit_Vector *v, int i);
INLINE int
bit_vector_bit (Lisp_Bit_Vector *v, int i)
{
  unsigned int ui = (unsigned int) i;

  return (((v)->bits[ui >> LONGBITS_LOG2] >> (ui & (LONGBITS_POWER_OF_2 - 1)))
	  & 1);
}

INLINE void set_bit_vector_bit (Lisp_Bit_Vector *v, int i, int value);
INLINE void
set_bit_vector_bit (Lisp_Bit_Vector *v, int i, int value)
{
  unsigned int ui = (unsigned int) i;
  if (value)
    (v)->bits[ui >> LONGBITS_LOG2] |= (1U << (ui & (LONGBITS_POWER_OF_2 - 1)));
  else
    (v)->bits[ui >> LONGBITS_LOG2] &= ~(1U << (ui & (LONGBITS_POWER_OF_2 - 1)));
}

/* Number of longs required to hold LEN bits */
#define BIT_VECTOR_LONG_STORAGE(len) \
  ((len + LONGBITS_POWER_OF_2 - 1) >> LONGBITS_LOG2)


/*********** symbol ***********/

/* In a symbol, the markbit of the plist is used as the gc mark bit */

struct Lisp_Symbol
{
#ifdef LRECORD_SYMBOL
  struct lrecord_header lheader;
#endif
  /* next symbol in this obarray bucket */
  struct Lisp_Symbol *next;
  struct Lisp_String *name;
  Lisp_Object value;
  Lisp_Object function;
  /* non-nil if the symbol is interned in Vobarray */
  Lisp_Object obarray;
  Lisp_Object plist;
};
typedef struct Lisp_Symbol Lisp_Symbol;

#define SYMBOL_IS_KEYWORD(sym) (string_byte (XSYMBOL(sym)->name, 0) == ':')
#define KEYWORDP(obj) (SYMBOLP (obj) && SYMBOL_IS_KEYWORD (obj))

#ifdef LRECORD_SYMBOL

DECLARE_LRECORD (symbol, Lisp_Symbol);
#define XSYMBOL(x) XRECORD (x, symbol, Lisp_Symbol)
#define XSETSYMBOL(x, p) XSETRECORD (x, p, symbol)
#define SYMBOLP(x) RECORDP (x, symbol)
#define GC_SYMBOLP(x) GC_RECORDP (x, symbol)
#define CHECK_SYMBOL(x) CHECK_RECORD (x, symbol)
#define CONCHECK_SYMBOL(x) CONCHECK_RECORD (x, symbol)

#else

DECLARE_NONRECORD (symbol, Lisp_Type_Symbol, Lisp_Symbol);
#define XSYMBOL(x) XNONRECORD (x, symbol, Lisp_Type_Symbol, Lisp_Symbol)
#define XSETSYMBOL(s, p) XSETOBJ ((s), Lisp_Type_Symbol, (p))
#define SYMBOLP(x) (XTYPE (x) == Lisp_Type_Symbol)
#define GC_SYMBOLP(x) (XGCTYPE (x) == Lisp_Type_Symbol)
#define CHECK_SYMBOL(x) CHECK_NONRECORD (x, Lisp_Type_Symbol, Qsymbolp)
#define CONCHECK_SYMBOL(x) CONCHECK_NONRECORD (x, Lisp_Type_Symbol, Qsymbolp)

#endif

#define symbol_next(s) ((s)->next)
#define symbol_name(s) ((s)->name)
#define symbol_value(s) ((s)->value)
#define symbol_function(s) ((s)->function)
#define symbol_plist(s) ((s)->plist)

/*********** subr ***********/

typedef Lisp_Object (*lisp_fn_t) (void);

struct Lisp_Subr
{
  struct lrecord_header lheader;
  short min_args, max_args;
  CONST char *prompt;
  CONST char *doc;
  CONST char *name;
  lisp_fn_t subr_fn;
};
typedef struct Lisp_Subr Lisp_Subr;

DECLARE_LRECORD (subr, Lisp_Subr);
#define XSUBR(x) XRECORD (x, subr, Lisp_Subr)
#define XSETSUBR(x, p) XSETRECORD (x, p, subr)
#define SUBRP(x) RECORDP (x, subr)
#define GC_SUBRP(x) GC_RECORDP (x, subr)
#define CHECK_SUBR(x) CHECK_RECORD (x, subr)
#define CONCHECK_SUBR(x) CONCHECK_RECORD (x, subr)

#define subr_function(subr) (subr)->subr_fn
#define subr_name(subr) (subr)->name

/*********** marker ***********/

struct Lisp_Marker
{
  struct lrecord_header lheader;
  struct Lisp_Marker *next, *prev;
  struct buffer *buffer;
  Memind memind;
  char insertion_type;
};
typedef struct Lisp_Marker Lisp_Marker;

DECLARE_LRECORD (marker, Lisp_Marker);
#define XMARKER(x) XRECORD (x, marker, Lisp_Marker)
#define XSETMARKER(x, p) XSETRECORD (x, p, marker)
#define MARKERP(x) RECORDP (x, marker)
#define GC_MARKERP(x) GC_RECORDP (x, marker)
#define CHECK_MARKER(x) CHECK_RECORD (x, marker)
#define CONCHECK_MARKER(x) CONCHECK_RECORD (x, marker)

/* The second check was looking for GCed markers still in use */
/* if (INTP (XMARKER (x)->lheader.next.v)) abort (); */

#define marker_next(m) ((m)->next)
#define marker_prev(m) ((m)->prev)

/*********** char ***********/

#define CHARP(x) (XTYPE (x) == Lisp_Type_Char)
#define GC_CHARP(x) (XGCTYPE (x) == Lisp_Type_Char)

#ifdef ERROR_CHECK_TYPECHECK

INLINE Emchar XCHAR (Lisp_Object obj);
INLINE Emchar
XCHAR (Lisp_Object obj)
{
  assert (CHARP (obj));
  return XCHARVAL (obj);
}

#else

#define XCHAR(x) XCHARVAL (x)

#endif

#define CHECK_CHAR(x) CHECK_NONRECORD (x, Lisp_Type_Char, Qcharacterp)
#define CONCHECK_CHAR(x) CONCHECK_NONRECORD (x, Lisp_Type_Char, Qcharacterp)


/*********** float ***********/

#ifdef LISP_FLOAT_TYPE

/* Note: the 'unused_next_' field exists only to ensure that the
   `next' pointer fits within the structure, for the purposes of the
   free list.  This makes a difference in the unlikely case of
   sizeof(double) being smaller than sizeof(void *). */

struct Lisp_Float
{
  struct lrecord_header lheader;
  union { double d; struct Lisp_Float *unused_next_; } data;
};
typedef struct Lisp_Float Lisp_Float;

DECLARE_LRECORD (float, Lisp_Float);
#define XFLOAT(x) XRECORD (x, float, Lisp_Float)
#define XSETFLOAT(x, p) XSETRECORD (x, p, float)
#define FLOATP(x) RECORDP (x, float)
#define GC_FLOATP(x) GC_RECORDP (x, float)
#define CHECK_FLOAT(x) CHECK_RECORD (x, float)
#define CONCHECK_FLOAT(x) CONCHECK_RECORD (x, float)

#define float_data(f) ((f)->data.d)
#define XFLOAT_DATA(x) float_data (XFLOAT (x))

#define XFLOATINT(n) extract_float (n)

#define CHECK_INT_OR_FLOAT(x) do {		\
  if (!INT_OR_FLOATP (x))			\
    dead_wrong_type_argument (Qnumberp, x);	\
} while (0)

#define CONCHECK_INT_OR_FLOAT(x) do {		\
  if (!INT_OR_FLOATP (x))			\
    x = wrong_type_argument (Qnumberp, x);	\
} while (0)

# define INT_OR_FLOATP(x) (INTP (x) || FLOATP (x))
# define GC_INT_OR_FLOATP(x) (GC_INTP (x) || GC_FLOATP (x))

#else /* not LISP_FLOAT_TYPE */

#define XFLOAT(x) --- error!  No float support. ---
#define XSETFLOAT(x, p) --- error!  No float support. ---
#define FLOATP(x) 0
#define GC_FLOATP(x) 0
#define CHECK_FLOAT(x) --- error!  No float support. ---
#define CONCHECK_FLOAT(x) --- error!  No float support. ---

#define XFLOATINT(n) XINT(n)
#define CHECK_INT_OR_FLOAT CHECK_INT
#define CONCHECK_INT_OR_FLOAT CONCHECK_INT
#define INT_OR_FLOATP(x) (INTP (x))
# define GC_INT_OR_FLOATP(x) (GC_INTP (x))

#endif /* not LISP_FLOAT_TYPE */

/*********** int ***********/

#define GC_INTP(x) INTP (x)

#define ZEROP(x) EQ (x, Qzero)
#define GC_ZEROP(x) GC_EQ (x, Qzero)

#ifdef ERROR_CHECK_TYPECHECK

INLINE EMACS_INT XINT (Lisp_Object obj);
INLINE EMACS_INT
XINT (Lisp_Object obj)
{
  assert (INTP (obj));
  return XREALINT (obj);
}

INLINE EMACS_INT XCHAR_OR_INT (Lisp_Object obj);
INLINE EMACS_INT
XCHAR_OR_INT (Lisp_Object obj)
{
  assert (INTP (obj) || CHARP (obj));
  return CHARP (obj) ? XCHAR (obj) : XINT (obj);
}

#else /* no error checking */

#define XINT(obj) XREALINT (obj)
#define XCHAR_OR_INT(obj) (CHARP (obj) ? XCHAR (obj) : XINT (obj))

#endif /* no error checking */

#define CHECK_INT(x) do {			\
  if (!INTP (x))				\
    dead_wrong_type_argument (Qintegerp, x);	\
} while (0)

#define CONCHECK_INT(x) do {			\
  if (!INTP (x))				\
    x = wrong_type_argument (Qintegerp, x);	\
} while (0)

#define NATNUMP(x) (INTP (x) && XINT (x) >= 0)
#define GC_NATNUMP(x) (GC_INTP (x) && XINT (x) >= 0)

#define CHECK_NATNUM(x) do {			\
  if (!NATNUMP (x))				\
    dead_wrong_type_argument (Qnatnump, x);	\
} while (0)

#define CONCHECK_NATNUM(x) do {			\
  if (!NATNUMP (x))				\
    x = wrong_type_argument (Qnatnump, x);	\
} while (0)

/* next three always continuable because they coerce their arguments. */
#define CHECK_INT_COERCE_CHAR(x) do {			\
  if (INTP (x))						\
    ;							\
  else if (CHARP (x))					\
    x = make_int (XCHAR (x));				\
  else							\
    x = wrong_type_argument (Qinteger_or_char_p, x);	\
} while (0)

#define CHECK_INT_COERCE_MARKER(x) do {			\
  if (INTP (x))						\
    ;							\
  else if (MARKERP (x))					\
    x = make_int (marker_position (x));			\
  else							\
    x = wrong_type_argument (Qinteger_or_marker_p, x);	\
} while (0)

#define CHECK_INT_COERCE_CHAR_OR_MARKER(x) do {			\
  if (INTP (x))							\
    ;								\
  else if (CHARP (x))						\
    x = make_int (XCHAR (x));					\
  else if (MARKERP (x))						\
    x = make_int (marker_position (x));				\
  else								\
    x = wrong_type_argument (Qinteger_char_or_marker_p, x);	\
} while (0)


/*********** pure space ***********/

#define CHECK_IMPURE(obj)					\
  do { if (purified (obj)) pure_write_error (obj); } while (0)

/*********** structures ***********/

typedef struct structure_keyword_entry structure_keyword_entry;
struct structure_keyword_entry
{
  Lisp_Object keyword;
  int (*validate) (Lisp_Object keyword, Lisp_Object value,
		   Error_behavior errb);
};

typedef struct
{
  Dynarr_declare (structure_keyword_entry);
} structure_keyword_entry_dynarr;

typedef struct structure_type structure_type;
struct structure_type
{
  Lisp_Object type;
  structure_keyword_entry_dynarr *keywords;
  int (*validate) (Lisp_Object data, Error_behavior errb);
  Lisp_Object (*instantiate) (Lisp_Object data);
};

typedef struct
{
  Dynarr_declare (structure_type);
} structure_type_dynarr;

struct structure_type *define_structure_type (Lisp_Object type,
					      int (*validate)
					      (Lisp_Object data,
					       Error_behavior errb),
					      Lisp_Object (*instantiate)
					      (Lisp_Object data));
void define_structure_type_keyword (struct structure_type *st,
				    Lisp_Object keyword,
				    int (*validate) (Lisp_Object keyword,
						     Lisp_Object value,
						     Error_behavior errb));

/*********** weak lists ***********/

enum weak_list_type
{
  /* element disappears if it's unmarked. */
  WEAK_LIST_SIMPLE,
  /* element disappears if it's a cons and either its car or
     cdr is unmarked. */
  WEAK_LIST_ASSOC,
  /* element disappears if it's a cons and its car is unmarked. */
  WEAK_LIST_KEY_ASSOC,
  /* element disappears if it's a cons and its cdr is unmarked. */
  WEAK_LIST_VALUE_ASSOC
};

struct weak_list
{
  struct lcrecord_header header;
  Lisp_Object list; /* don't mark through this! */
  enum weak_list_type type;
  Lisp_Object next_weak; /* don't mark through this! */
};

DECLARE_LRECORD (weak_list, struct weak_list);
#define XWEAK_LIST(x) XRECORD (x, weak_list, struct weak_list)
#define XSETWEAK_LIST(x, p) XSETRECORD (x, p, weak_list)
#define WEAK_LISTP(x) RECORDP (x, weak_list)
#define GC_WEAK_LISTP(x) GC_RECORDP (x, weak_list)
#define CHECK_WEAK_LIST(x) CHECK_RECORD (x, weak_list)
#define CONCHECK_WEAK_LIST(x) CONCHECK_RECORD (x, weak_list)

#define weak_list_list(w) ((w)->list)
#define XWEAK_LIST_LIST(w) (XWEAK_LIST (w)->list)

Lisp_Object make_weak_list (enum weak_list_type type);
/* The following two are only called by the garbage collector */
int finish_marking_weak_lists (int (*obj_marked_p) (Lisp_Object),
			       void (*markobj) (Lisp_Object));
void prune_weak_lists (int (*obj_marked_p) (Lisp_Object));

/*********** lcrecord lists ***********/

struct lcrecord_list
{
  struct lcrecord_header header;
  Lisp_Object free;
  size_t size;
  CONST struct lrecord_implementation *implementation;
};

DECLARE_LRECORD (lcrecord_list, struct lcrecord_list);
#define XLCRECORD_LIST(x) XRECORD (x, lcrecord_list, struct lcrecord_list)
#define XSETLCRECORD_LIST(x, p) XSETRECORD (x, p, lcrecord_list)
#define LCRECORD_LISTP(x) RECORDP (x, lcrecord_list)
#define GC_LCRECORD_LISTP(x) GC_RECORDP (x, lcrecord_list)
/* #define CHECK_LCRECORD_LIST(x) CHECK_RECORD (x, lcrecord_list)
   Lcrecord lists should never escape to the Lisp level, so
   functions should not be doing this. */

Lisp_Object make_lcrecord_list (size_t size,
				CONST struct lrecord_implementation
				*implementation);
Lisp_Object allocate_managed_lcrecord (Lisp_Object lcrecord_list);
void free_managed_lcrecord (Lisp_Object lcrecord_list, Lisp_Object lcrecord);


/************************************************************************/
/*	   Definitions of primitive Lisp functions and variables	*/
/************************************************************************/


/* DEFUN - Define a built-in Lisp-visible C function or `subr'.
 `lname' should be the name to give the function in Lisp,
    as a null-terminated C string.
 `Fname' should be the C equivalent of `lname', using only characters
    valid in a C identifier, with an "F" prepended.
    The name of the C constant structure that records information
    on this function for internal use is "S" concatenated with Fname.
 `min_args' should be a number, the minimum number of arguments allowed.
 `max_args' should be a number, the maximum number of arguments allowed,
    or else MANY or UNEVALLED.
    MANY means pass a vector of evaluated arguments,
	 in the form of an integer number-of-arguments
	 followed by the address of a vector of Lisp_Objects
	 which contains the argument values.
    UNEVALLED means pass the list of unevaluated arguments.
 `prompt' says how to read arguments for an interactive call.
    See the doc string for `interactive'.
    A null string means call interactively with no arguments.
 `arglist' are the comma-separated arguments (always Lisp_Objects) for
    the function.
  The docstring for the function is placed as a "C" comment between
    the prompt and the `args' argument.  make-docfile reads the
    comment and creates the DOC file from it.
*/

#define EXFUN_0 void
#define EXFUN_1 Lisp_Object
#define EXFUN_2 Lisp_Object,Lisp_Object
#define EXFUN_3 Lisp_Object,Lisp_Object,Lisp_Object
#define EXFUN_4 Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object
#define EXFUN_5 Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object
#define EXFUN_6 Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object, \
Lisp_Object
#define EXFUN_7 Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object, \
Lisp_Object,Lisp_Object
#define EXFUN_8 Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object,Lisp_Object, \
Lisp_Object,Lisp_Object,Lisp_Object
#define EXFUN_MANY int, Lisp_Object*
#define EXFUN_UNEVALLED Lisp_Object
#define EXFUN(sym, max_args) Lisp_Object sym (EXFUN_##max_args)

#define SUBR_MAX_ARGS 8
#define MANY -2
#define UNEVALLED -1

/* Can't be const, because then subr->doc is read-only and
   Snarf_documentation chokes */

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
# define subr_lheader_initializer { 0, 0, 0 }
#else
# define subr_lheader_initializer { lrecord_subr }
#endif

#define DEFUN(lname, Fname, min_args, max_args, prompt, arglist)	\
  Lisp_Object Fname (EXFUN_##max_args);					\
  static struct Lisp_Subr S##Fname = { subr_lheader_initializer,	\
	min_args, max_args, prompt, 0, lname, (lisp_fn_t) Fname };	\
  Lisp_Object Fname (DEFUN_##max_args arglist)

/* Heavy ANSI C preprocessor hackery to get DEFUN to declare a
   prototype that matches max_args, and add the obligatory
   `Lisp_Object' type declaration to the formal C arguments.  */

#define DEFUN_MANY(named_int, named_Lisp_Object) named_int, named_Lisp_Object
#define DEFUN_UNEVALLED(args) Lisp_Object args
#define DEFUN_0() void
#define DEFUN_1(a)					Lisp_Object a
#define DEFUN_2(a,b)		 DEFUN_1(a),		Lisp_Object b
#define DEFUN_3(a,b,c)		 DEFUN_2(a,b),		Lisp_Object c
#define DEFUN_4(a,b,c,d)	 DEFUN_3(a,b,c),	Lisp_Object d
#define DEFUN_5(a,b,c,d,e)	 DEFUN_4(a,b,c,d),	Lisp_Object e
#define DEFUN_6(a,b,c,d,e,f)	 DEFUN_5(a,b,c,d,e),	Lisp_Object f
#define DEFUN_7(a,b,c,d,e,f,g)	 DEFUN_6(a,b,c,d,e,f),	Lisp_Object g
#define DEFUN_8(a,b,c,d,e,f,g,h) DEFUN_7(a,b,c,d,e,f,g),Lisp_Object h

/* WARNING: If you add defines here for higher values of max_args,
   make sure to also fix the clauses in PRIMITIVE_FUNCALL(),
   and change the define of SUBR_MAX_ARGS above.  */

#include "symeval.h"

/* `specpdl' is the special binding/unwind-protect stack.

   Knuth says (see the Jargon File):
   At MIT, `pdl' [abbreviation for `Push Down List'] used to
   be a more common synonym for `stack'.
   Everywhere else `stack' seems to be the preferred term.

   specpdl_depth is the current depth of `specpdl'.
   Save this for use later as arg to `unbind_to'.  */
extern int specpdl_depth_counter;
#define specpdl_depth() specpdl_depth_counter


/************************************************************************/
/*			   Checking for QUIT				*/
/************************************************************************/

/* Asynchronous events set something_happened, and then are processed
   within the QUIT macro.  At this point, we are guaranteed to not be in
   any sensitive code. */

extern volatile int something_happened;
int check_what_happened (void);

extern volatile int quit_check_signal_happened;
extern volatile int quit_check_signal_tick_count;
int check_quit (void);

void signal_quit (void);

/* Nonzero if ought to quit now.  */
#define QUITP							\
  ((quit_check_signal_happened ? check_quit () : 0),		\
   (!NILP (Vquit_flag) && (NILP (Vinhibit_quit)			\
			   || EQ (Vquit_flag, Qcritical))))

/* QUIT used to call QUITP, but there are some places where QUITP
   is called directly, and check_what_happened() should only be called
   when Emacs is actually ready to quit because it could do things
   like switch threads. */
#define INTERNAL_QUITP						\
  ((something_happened ? check_what_happened () : 0),		\
   (!NILP (Vquit_flag) &&					\
    (NILP (Vinhibit_quit) || EQ (Vquit_flag, Qcritical))))

#define INTERNAL_REALLY_QUITP					\
  (check_what_happened (),					\
   (!NILP (Vquit_flag) &&					\
    (NILP (Vinhibit_quit) || EQ (Vquit_flag, Qcritical))))

/* Check quit-flag and quit if it is non-nil.  Also do any other things
   that might have gotten queued until it was safe. */
#define QUIT do { if (INTERNAL_QUITP) signal_quit (); } while (0)

#define REALLY_QUIT do { if (INTERNAL_REALLY_QUITP) signal_quit (); } while (0)


/************************************************************************/
/*				 hashing				*/
/************************************************************************/

/* #### for a 64-bit machine, we should substitute a prime just over 2^32 */
#define GOOD_HASH 65599 /* prime number just over 2^16; Dragon book, p. 435 */
#define HASH2(a,b)               (GOOD_HASH * (a)                     + (b))
#define HASH3(a,b,c)             (GOOD_HASH * HASH2 (a,b)             + (c))
#define HASH4(a,b,c,d)           (GOOD_HASH * HASH3 (a,b,c)           + (d))
#define HASH5(a,b,c,d,e)         (GOOD_HASH * HASH4 (a,b,c,d)         + (e))
#define HASH6(a,b,c,d,e,f)       (GOOD_HASH * HASH5 (a,b,c,d,e)       + (f))
#define HASH7(a,b,c,d,e,f,g)     (GOOD_HASH * HASH6 (a,b,c,d,e,f)     + (g))
#define HASH8(a,b,c,d,e,f,g,h)   (GOOD_HASH * HASH7 (a,b,c,d,e,f,g)   + (h))
#define HASH9(a,b,c,d,e,f,g,h,i) (GOOD_HASH * HASH8 (a,b,c,d,e,f,g,h) + (i))

#define LISP_HASH(obj) ((unsigned long) LISP_TO_VOID (obj))
unsigned long string_hash (CONST void *xv);
unsigned long memory_hash (CONST void *xv, size_t size);
unsigned long internal_hash (Lisp_Object obj, int depth);
unsigned long internal_array_hash (Lisp_Object *arr, int size, int depth);


/************************************************************************/
/*			 String translation				*/
/************************************************************************/

#ifdef I18N3
#ifdef HAVE_LIBINTL_H
#include <libintl.h>
#else
char *dgettext       (CONST char *, CONST char *);
char *gettext        (CONST char *);
char *textdomain     (CONST char *);
char *bindtextdomain (CONST char *, CONST char *);
#endif /* HAVE_LIBINTL_H */

#define GETTEXT(x)  gettext(x)
#define LISP_GETTEXT(x)  Fgettext (x)
#else /* !I18N3 */
#define GETTEXT(x)  (x)
#define LISP_GETTEXT(x)  (x)
#endif /* !I18N3 */

/* DEFER_GETTEXT is used to identify strings which are translated when
   they are referenced instead of when they are defined.
   These include Qerror_messages and initialized arrays of strings.
*/
#define DEFER_GETTEXT(x) (x)


/************************************************************************/
/*		     Garbage collection / GC-protection			*/
/************************************************************************/

/* number of bytes of structure consed since last GC */

extern EMACS_INT consing_since_gc;

/* threshold for doing another gc */

extern EMACS_INT gc_cons_threshold;

/* Structure for recording stack slots that need marking */

/* This is a chain of structures, each of which points at a Lisp_Object
   variable whose value should be marked in garbage collection.
   Normally every link of the chain is an automatic variable of a function,
   and its `val' points to some argument or local variable of the function.
   On exit to the function, the chain is set back to the value it had on
   entry.  This way, no link remains in the chain when the stack frame
   containing the link disappears.

   Every function that can call Feval must protect in this fashion all
   Lisp_Object variables whose contents will be used again. */

extern struct gcpro *gcprolist;

struct gcpro
{
  struct gcpro *next;
  Lisp_Object *var;		/* Address of first protected variable */
  int nvars;			/* Number of consecutive protected variables */
};

/* Normally, you declare variables gcpro1, gcpro2, ... and use the
   GCPROn() macros.  However, if you need to have nested gcpro's,
   declare ngcpro1, ngcpro2, ... and use NGCPROn().  If you need
   to nest another level, use nngcpro1, nngcpro2, ... and use
   NNGCPROn().  If you need to nest yet another level, create
   the appropriate macros. */

#ifdef DEBUG_GCPRO

void debug_gcpro1 (char *, int, struct gcpro *, Lisp_Object *);
void debug_gcpro2 (char *, int, struct gcpro *, struct gcpro *,
		   Lisp_Object *, Lisp_Object *);
void debug_gcpro3 (char *, int, struct gcpro *, struct gcpro *, struct gcpro *,
		   Lisp_Object *, Lisp_Object *, Lisp_Object *);
void debug_gcpro4 (char *, int, struct gcpro *, struct gcpro *, struct gcpro *,
		   struct gcpro *, Lisp_Object *, Lisp_Object *, Lisp_Object *,
		   Lisp_Object *);
void debug_gcpro5 (char *, int, struct gcpro *, struct gcpro *, struct gcpro *,
		   struct gcpro *, struct gcpro *, Lisp_Object *, Lisp_Object *,
		   Lisp_Object *, Lisp_Object *, Lisp_Object *);
void debug_ungcpro(char *, int, struct gcpro *);

#define GCPRO1(v) \
 debug_gcpro1 (__FILE__, __LINE__,&gcpro1,&v)
#define GCPRO2(v1,v2) \
 debug_gcpro2 (__FILE__, __LINE__,&gcpro1,&gcpro2,&v1,&v2)
#define GCPRO3(v1,v2,v3) \
 debug_gcpro3 (__FILE__, __LINE__,&gcpro1,&gcpro2,&gcpro3,&v1,&v2,&v3)
#define GCPRO4(v1,v2,v3,v4) \
 debug_gcpro4 (__FILE__, __LINE__,&gcpro1,&gcpro2,&gcpro3,&gcpro4,\
	       &v1,&v2,&v3,&v4)
#define GCPRO5(v1,v2,v3,v4,v5) \
 debug_gcpro5 (__FILE__, __LINE__,&gcpro1,&gcpro2,&gcpro3,&gcpro4,&gcpro5,\
	       &v1,&v2,&v3,&v4,&v5)
#define UNGCPRO \
 debug_ungcpro(__FILE__, __LINE__,&gcpro1)

#define NGCPRO1(v) \
 debug_gcpro1 (__FILE__, __LINE__,&ngcpro1,&v)
#define NGCPRO2(v1,v2) \
 debug_gcpro2 (__FILE__, __LINE__,&ngcpro1,&ngcpro2,&v1,&v2)
#define NGCPRO3(v1,v2,v3) \
 debug_gcpro3 (__FILE__, __LINE__,&ngcpro1,&ngcpro2,&ngcpro3,&v1,&v2,&v3)
#define NGCPRO4(v1,v2,v3,v4) \
 debug_gcpro4 (__FILE__, __LINE__,&ngcpro1,&ngcpro2,&ngcpro3,&ngcpro4,\
	       &v1,&v2,&v3,&v4)
#define NGCPRO5(v1,v2,v3,v4,v5) \
 debug_gcpro5 (__FILE__, __LINE__,&ngcpro1,&ngcpro2,&ngcpro3,&ngcpro4,\
	       &ngcpro5,&v1,&v2,&v3,&v4,&v5)
#define NUNGCPRO \
 debug_ungcpro(__FILE__, __LINE__,&ngcpro1)

#define NNGCPRO1(v) \
 debug_gcpro1 (__FILE__, __LINE__,&nngcpro1,&v)
#define NNGCPRO2(v1,v2) \
 debug_gcpro2 (__FILE__, __LINE__,&nngcpro1,&nngcpro2,&v1,&v2)
#define NNGCPRO3(v1,v2,v3) \
 debug_gcpro3 (__FILE__, __LINE__,&nngcpro1,&nngcpro2,&nngcpro3,&v1,&v2,&v3)
#define NNGCPRO4(v1,v2,v3,v4) \
 debug_gcpro4 (__FILE__, __LINE__,&nngcpro1,&nngcpro2,&nngcpro3,&nngcpro4,\
	       &v1,&v2,&v3,&v4)
#define NNGCPRO5(v1,v2,v3,v4,v5) \
 debug_gcpro5 (__FILE__, __LINE__,&nngcpro1,&nngcpro2,&nngcpro3,&nngcpro4,\
	       &nngcpro5,&v1,&v2,&v3,&v4,&v5)
#define NUNNGCPRO \
 debug_ungcpro(__FILE__, __LINE__,&nngcpro1)

#else /* ! DEBUG_GCPRO */

#define GCPRO1(var1) ((void) (						\
  gcpro1.next = gcprolist, gcpro1.var = &var1, gcpro1.nvars = 1,	\
  gcprolist = &gcpro1 ))

#define GCPRO2(var1, var2) ((void) (					\
  gcpro1.next = gcprolist, gcpro1.var = &var1, gcpro1.nvars = 1,	\
  gcpro2.next = &gcpro1,   gcpro2.var = &var2, gcpro2.nvars = 1,	\
  gcprolist = &gcpro2 ))

#define GCPRO3(var1, var2, var3) ((void) (				\
  gcpro1.next = gcprolist, gcpro1.var = &var1, gcpro1.nvars = 1,	\
  gcpro2.next = &gcpro1,   gcpro2.var = &var2, gcpro2.nvars = 1,	\
  gcpro3.next = &gcpro2,   gcpro3.var = &var3, gcpro3.nvars = 1,	\
  gcprolist = &gcpro3 ))

#define GCPRO4(var1, var2, var3, var4) ((void) (			\
  gcpro1.next = gcprolist, gcpro1.var = &var1, gcpro1.nvars = 1,	\
  gcpro2.next = &gcpro1,   gcpro2.var = &var2, gcpro2.nvars = 1,	\
  gcpro3.next = &gcpro2,   gcpro3.var = &var3, gcpro3.nvars = 1,	\
  gcpro4.next = &gcpro3,   gcpro4.var = &var4, gcpro4.nvars = 1,	\
  gcprolist = &gcpro4 ))

#define GCPRO5(var1, var2, var3, var4, var5)				\
  ((void) (								\
  gcpro1.next = gcprolist, gcpro1.var = &var1, gcpro1.nvars = 1,	\
  gcpro2.next = &gcpro1,   gcpro2.var = &var2, gcpro2.nvars = 1,	\
  gcpro3.next = &gcpro2,   gcpro3.var = &var3, gcpro3.nvars = 1,	\
  gcpro4.next = &gcpro3,   gcpro4.var = &var4, gcpro4.nvars = 1,	\
  gcpro5.next = &gcpro4,   gcpro5.var = &var5, gcpro5.nvars = 1,	\
  gcprolist = &gcpro5 ))

#define UNGCPRO ((void) (gcprolist = gcpro1.next))

#define NGCPRO1(var1) ((void) (						\
  ngcpro1.next = gcprolist, ngcpro1.var = &var1, ngcpro1.nvars = 1,	\
  gcprolist = &ngcpro1 ))

#define NGCPRO2(var1, var2) ((void) (					\
  ngcpro1.next = gcprolist, ngcpro1.var = &var1, ngcpro1.nvars = 1,	\
  ngcpro2.next = &ngcpro1,  ngcpro2.var = &var2, ngcpro2.nvars = 1,	\
  gcprolist = &ngcpro2 ))

#define NGCPRO3(var1, var2, var3) ((void) (				\
  ngcpro1.next = gcprolist, ngcpro1.var = &var1, ngcpro1.nvars = 1,	\
  ngcpro2.next = &ngcpro1,  ngcpro2.var = &var2, ngcpro2.nvars = 1,	\
  ngcpro3.next = &ngcpro2,  ngcpro3.var = &var3, ngcpro3.nvars = 1,	\
  gcprolist = &ngcpro3 ))

#define NGCPRO4(var1, var2, var3, var4) ((void) (			\
  ngcpro1.next = gcprolist, ngcpro1.var = &var1, ngcpro1.nvars = 1,	\
  ngcpro2.next = &ngcpro1,  ngcpro2.var = &var2, ngcpro2.nvars = 1,	\
  ngcpro3.next = &ngcpro2,  ngcpro3.var = &var3, ngcpro3.nvars = 1,	\
  ngcpro4.next = &ngcpro3,  ngcpro4.var = &var4, ngcpro4.nvars = 1,	\
  gcprolist = &ngcpro4 ))

#define NGCPRO5(var1, var2, var3, var4, var5)				\
  ((void) (								\
  ngcpro1.next = gcprolist, ngcpro1.var = &var1, ngcpro1.nvars = 1,	\
  ngcpro2.next = &ngcpro1,  ngcpro2.var = &var2, ngcpro2.nvars = 1,	\
  ngcpro3.next = &ngcpro2,  ngcpro3.var = &var3, ngcpro3.nvars = 1,	\
  ngcpro4.next = &ngcpro3,  ngcpro4.var = &var4, ngcpro4.nvars = 1,	\
  ngcpro5.next = &ngcpro4,  ngcpro5.var = &var5, ngcpro5.nvars = 1,	\
  gcprolist = &ngcpro5 ))

#define NUNGCPRO ((void) (gcprolist = ngcpro1.next))

#define NNGCPRO1(var1) ((void) (					\
  nngcpro1.next = gcprolist, nngcpro1.var = &var1, nngcpro1.nvars = 1,	\
  gcprolist = &nngcpro1 ))

#define NNGCPRO2(var1, var2) ((void) (					\
  nngcpro1.next = gcprolist, nngcpro1.var = &var1, nngcpro1.nvars = 1,	\
  nngcpro2.next = &nngcpro1, nngcpro2.var = &var2, nngcpro2.nvars = 1,	\
  gcprolist = &nngcpro2 ))

#define NNGCPRO3(var1, var2, var3) ((void) (				\
  nngcpro1.next = gcprolist, nngcpro1.var = &var1, nngcpro1.nvars = 1,	\
  nngcpro2.next = &nngcpro1, nngcpro2.var = &var2, nngcpro2.nvars = 1,	\
  nngcpro3.next = &nngcpro2, nngcpro3.var = &var3, nngcpro3.nvars = 1,	\
  gcprolist = &nngcpro3 ))

#define NNGCPRO4(var1, var2, var3, var4)  ((void) (			\
  nngcpro1.next = gcprolist, nngcpro1.var = &var1, nngcpro1.nvars = 1,	\
  nngcpro2.next = &nngcpro1, nngcpro2.var = &var2, nngcpro2.nvars = 1,	\
  nngcpro3.next = &nngcpro2, nngcpro3.var = &var3, nngcpro3.nvars = 1,	\
  nngcpro4.next = &nngcpro3, nngcpro4.var = &var4, nngcpro4.nvars = 1,	\
  gcprolist = &nngcpro4 ))

#define NNGCPRO5(var1, var2, var3, var4, var5)				\
  ((void) (								\
  nngcpro1.next = gcprolist, nngcpro1.var = &var1, nngcpro1.nvars = 1,	\
  nngcpro2.next = &nngcpro1, nngcpro2.var = &var2, nngcpro2.nvars = 1,	\
  nngcpro3.next = &nngcpro2, nngcpro3.var = &var3, nngcpro3.nvars = 1,	\
  nngcpro4.next = &nngcpro3, nngcpro4.var = &var4, nngcpro4.nvars = 1,	\
  nngcpro5.next = &nngcpro4, nngcpro5.var = &var5, nngcpro5.nvars = 1,	\
  gcprolist = &nngcpro5 ))

#define NNUNGCPRO ((void) (gcprolist = nngcpro1.next))

#endif /* ! DEBUG_GCPRO */

/* Another try to fix SunPro C compiler warnings */
/* "end-of-loop code not reached" */
/* "statement not reached */
#ifdef __SUNPRO_C
#define RETURN_SANS_WARNINGS if (1) return
#define RETURN_NOT_REACHED(value)
#else
#define RETURN_SANS_WARNINGS return
#define RETURN_NOT_REACHED(value) return value;
#endif

/* Evaluate expr, UNGCPRO, and then return the value of expr.  */
#define RETURN_UNGCPRO(expr) do		\
{					\
  Lisp_Object ret_ungc_val = (expr);	\
  UNGCPRO;				\
  RETURN_SANS_WARNINGS ret_ungc_val;	\
} while (0)

/* Evaluate expr, NUNGCPRO, UNGCPRO, and then return the value of expr.  */
#define RETURN_NUNGCPRO(expr) do	\
{					\
  Lisp_Object ret_ungc_val = (expr);	\
  NUNGCPRO;				\
  UNGCPRO;				\
  RETURN_SANS_WARNINGS ret_ungc_val;	\
} while (0)

/* Evaluate expr, NNUNGCPRO, NUNGCPRO, UNGCPRO, and then return the
   value of expr.  */
#define RETURN_NNUNGCPRO(expr) do	\
{					\
  Lisp_Object ret_ungc_val = (expr);	\
  NNUNGCPRO;				\
  NUNGCPRO;				\
  UNGCPRO;				\
  RETURN_SANS_WARNINGS ret_ungc_val;	\
} while (0)

/* Evaluate expr, return it if it's not Qunbound. */
#define RETURN_IF_NOT_UNBOUND(expr) do	\
{					\
  Lisp_Object ret_nunb_val = (expr);	\
  if (!UNBOUNDP (ret_nunb_val))		\
    RETURN_SANS_WARNINGS ret_nunb_val;	\
} while (0)

/* Call staticpro (&var) to protect static variable `var'. */
void staticpro (Lisp_Object *);

/* Nonzero means Emacs has already been initialized.
   Used during startup to detect startup of dumped Emacs.  */
extern int initialized;

#ifdef MEMORY_USAGE_STATS

/* This structure is used to keep statistics on the amount of memory
   in use.

   WAS_REQUESTED stores the actual amount of memory that was requested
   of the allocation function.  The *_OVERHEAD fields store the
   additional amount of memory that was grabbed by the functions to
   facilitate allocation, reallocation, etc.  MALLOC_OVERHEAD is for
   memory allocated with malloc(); DYNARR_OVERHEAD is for dynamic
   arrays; GAP_OVERHEAD is for gap arrays.  Note that for (e.g.)
   dynamic arrays, there is both MALLOC_OVERHEAD and DYNARR_OVERHEAD
   memory: The dynamic array allocates memory above and beyond what
   was asked of it, and when it in turns allocates memory using
   malloc(), malloc() allocates memory beyond what it was asked
   to allocate.

   Functions that accept a structure of this sort do not initialize
   the fields to 0, and add any existing values to whatever was there
   before; this way, you can get a cumulative effect. */

struct overhead_stats
{
  int was_requested;
  int malloc_overhead;
  int dynarr_overhead;
  int gap_overhead;
};

#endif /* MEMORY_USAGE_STATS */

#ifndef DIRECTORY_SEP
#define DIRECTORY_SEP '/'
#endif
#ifndef IS_DIRECTORY_SEP
#define IS_DIRECTORY_SEP(c) ((c) == DIRECTORY_SEP)
#endif
#ifndef IS_DEVICE_SEP
#ifndef DEVICE_SEP
#define IS_DEVICE_SEP(c) 0
#else
#define IS_DEVICE_SEP(c) ((c) == DEVICE_SEP)
#endif
#endif
#ifndef IS_ANY_SEP
#define IS_ANY_SEP(c) (IS_DIRECTORY_SEP (c))
#endif

#ifdef HAVE_INTTYPES_H
#include <inttypes.h>
#elif SIZEOF_VOID_P == SIZEOF_INT
typedef int intptr_t;
typedef unsigned int uintptr_t;
#elif SIZEOF_VOID_P == SIZEOF_LONG
typedef long intptr_t;
typedef unsigned long uintptr_t;
#elif defined(SIZEOF_LONG_LONG) && SIZEOF_VOID_P == SIZEOF_LONG_LONG
typedef long long intptr_t;
typedef unsigned long long uintptr_t;
#else
/* Just pray. May break, may not. */
typedef long intptr_t;
typedef unsigned long uintptr_t;
#endif

/* Defined in alloc.c */
void release_breathing_space (void);
Lisp_Object noseeum_cons (Lisp_Object, Lisp_Object);
Lisp_Object make_vector (EMACS_INT, Lisp_Object);
Lisp_Object vector1 (Lisp_Object);
Lisp_Object vector2 (Lisp_Object, Lisp_Object);
Lisp_Object vector3 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object make_bit_vector (EMACS_INT, Lisp_Object);
Lisp_Object make_bit_vector_from_byte_vector (unsigned char *, EMACS_INT);
Lisp_Object noseeum_make_marker (void);
void garbage_collect_1 (void);
Lisp_Object acons (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object cons3 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object list1 (Lisp_Object);
Lisp_Object list2 (Lisp_Object, Lisp_Object);
Lisp_Object list3 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object list4 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object list5 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object);
Lisp_Object list6 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object, Lisp_Object);
DECLARE_DOESNT_RETURN (memory_full (void));
void disksave_object_finalization (void);
extern int purify_flag;
extern int gc_currently_forbidden;
Lisp_Object restore_gc_inhibit (Lisp_Object);
extern EMACS_INT gc_generation_number[1];
int purified (Lisp_Object);
Lisp_Object build_string (CONST char *);
Lisp_Object build_ext_string (CONST char *, enum external_data_format);
Lisp_Object build_translated_string (CONST char *);
Lisp_Object make_string (CONST Bufbyte *, Bytecount);
Lisp_Object make_ext_string (CONST Extbyte *, EMACS_INT,
			     enum external_data_format);
Lisp_Object make_uninit_string (Bytecount);
Lisp_Object make_float (double);
size_t purespace_usage (void);
void report_pure_usage (int, int);
Lisp_Object make_pure_string (CONST Bufbyte *, Bytecount, Lisp_Object, int);
Lisp_Object make_pure_pname (CONST Bufbyte *, Bytecount, int);
Lisp_Object pure_cons (Lisp_Object, Lisp_Object);
Lisp_Object pure_list (int, Lisp_Object *);
Lisp_Object make_pure_vector (size_t, Lisp_Object);
void free_cons (Lisp_Cons *);
void free_list (Lisp_Object);
void free_alist (Lisp_Object);
void mark_conses_in_list (Lisp_Object);
void free_marker (Lisp_Marker *);
int object_dead_p (Lisp_Object);

#ifdef MEMORY_USAGE_STATS
size_t malloced_storage_size (void *, size_t, struct overhead_stats *);
size_t fixed_type_block_overhead (size_t);
#endif

/* Defined in buffer.c */
Lisp_Object make_buffer (struct buffer *);
Lisp_Object get_truename_buffer (Lisp_Object);
void switch_to_buffer (Lisp_Object, Lisp_Object);
extern int find_file_compare_truenames;
extern int find_file_use_truenames;

/* Defined in callproc.c */
char *egetenv (CONST char *);

/* Defined in console.c */
void stuff_buffered_input (Lisp_Object);

/* Defined in data.c */
DECLARE_DOESNT_RETURN (pure_write_error (Lisp_Object));
DECLARE_DOESNT_RETURN (args_out_of_range (Lisp_Object, Lisp_Object));
DECLARE_DOESNT_RETURN (args_out_of_range_3 (Lisp_Object, Lisp_Object,
					    Lisp_Object));
Lisp_Object wrong_type_argument (Lisp_Object, Lisp_Object);
DECLARE_DOESNT_RETURN (dead_wrong_type_argument (Lisp_Object, Lisp_Object));
void check_int_range (int, int, int);

enum arith_comparison {
  arith_equal,
  arith_notequal,
  arith_less,
  arith_grtr,
  arith_less_or_equal,
  arith_grtr_or_equal };
Lisp_Object arithcompare (Lisp_Object, Lisp_Object, enum arith_comparison);

Lisp_Object word_to_lisp (unsigned int);
unsigned int lisp_to_word (Lisp_Object);

/* Defined in dired.c */
Lisp_Object make_directory_hash_table (CONST char *);
Lisp_Object wasteful_word_to_lisp (unsigned int);

/* Defined in doc.c */
Lisp_Object unparesseuxify_doc_string (int, EMACS_INT, char *, Lisp_Object);
Lisp_Object read_doc_string (Lisp_Object);

/* Defined in doprnt.c */
Bytecount emacs_doprnt_c (Lisp_Object, CONST Bufbyte *, Lisp_Object,
			  Bytecount, ...);
Bytecount emacs_doprnt_va (Lisp_Object, CONST Bufbyte *, Lisp_Object,
			   Bytecount, va_list);
Bytecount emacs_doprnt_lisp (Lisp_Object, CONST Bufbyte *, Lisp_Object,
			     Bytecount, int, CONST Lisp_Object *);
Bytecount emacs_doprnt_lisp_2 (Lisp_Object, CONST Bufbyte *, Lisp_Object,
			       Bytecount, int, ...);
Lisp_Object emacs_doprnt_string_c (CONST Bufbyte *, Lisp_Object,
				   Bytecount, ...);
Lisp_Object emacs_doprnt_string_va (CONST Bufbyte *, Lisp_Object,
				    Bytecount, va_list);
Lisp_Object emacs_doprnt_string_lisp (CONST Bufbyte *, Lisp_Object,
				      Bytecount, int, CONST Lisp_Object *);
Lisp_Object emacs_doprnt_string_lisp_2 (CONST Bufbyte *, Lisp_Object,
					Bytecount, int, ...);

/* Defined in editfns.c */
void uncache_home_directory (void);
char *get_home_directory (void);
char *user_login_name (int *);
Bufpos bufpos_clip_to_bounds (Bufpos, Bufpos, Bufpos);
Bytind bytind_clip_to_bounds (Bytind, Bytind, Bytind);
void buffer_insert1 (struct buffer *, Lisp_Object);
Lisp_Object make_string_from_buffer (struct buffer *, int, int);
Lisp_Object make_string_from_buffer_no_extents (struct buffer *, int, int);
Lisp_Object save_excursion_save (void);
Lisp_Object save_restriction_save (void);
Lisp_Object save_excursion_restore (Lisp_Object);
Lisp_Object save_restriction_restore (Lisp_Object);

/* Defined in emacsfns.c */
Lisp_Object save_current_buffer_restore (Lisp_Object);

/* Defined in emacs.c */
DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS (fatal (CONST char *,
							   ...), 1, 2);
int stderr_out (CONST char *, ...) PRINTF_ARGS (1, 2);
int stdout_out (CONST char *, ...) PRINTF_ARGS (1, 2);
SIGTYPE fatal_error_signal (int);
Lisp_Object make_arg_list (int, char **);
void make_argc_argv (Lisp_Object, int *, char ***);
void free_argc_argv (char **);
Lisp_Object decode_env_path (CONST char *, CONST char *);
Lisp_Object decode_path (CONST char *);
/* Nonzero means don't do interactive redisplay and don't change tty modes */
extern int noninteractive;
extern int preparing_for_armageddon;
extern int emacs_priority;
extern int running_asynch_code;
extern int suppress_early_error_handler_backtrace;

/* Defined in eval.c */
DECLARE_DOESNT_RETURN (signal_error (Lisp_Object, Lisp_Object));
void maybe_signal_error (Lisp_Object, Lisp_Object, Lisp_Object, Error_behavior);
Lisp_Object maybe_signal_continuable_error (Lisp_Object, Lisp_Object,
					    Lisp_Object, Error_behavior);
DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS (error (CONST char *,
							   ...), 1, 2);
void maybe_error (Lisp_Object, Error_behavior, CONST char *,
		  ...) PRINTF_ARGS (3, 4);
Lisp_Object continuable_error (CONST char *, ...) PRINTF_ARGS (1, 2);
Lisp_Object maybe_continuable_error (Lisp_Object, Error_behavior,
				     CONST char *, ...) PRINTF_ARGS (3, 4);
DECLARE_DOESNT_RETURN (signal_simple_error (CONST char *, Lisp_Object));
void maybe_signal_simple_error (CONST char *, Lisp_Object,
				Lisp_Object, Error_behavior);
Lisp_Object signal_simple_continuable_error (CONST char *, Lisp_Object);
Lisp_Object maybe_signal_simple_continuable_error (CONST char *, Lisp_Object,
						   Lisp_Object, Error_behavior);
DECLARE_DOESNT_RETURN_GCC_ATTRIBUTE_SYNTAX_SUCKS (error_with_frob
						    (Lisp_Object, CONST char *,
						     ...), 2, 3);
void maybe_error_with_frob (Lisp_Object, Lisp_Object, Error_behavior,
			    CONST char *, ...) PRINTF_ARGS (4, 5);
Lisp_Object continuable_error_with_frob (Lisp_Object, CONST char *,
					 ...) PRINTF_ARGS (2, 3);
Lisp_Object maybe_continuable_error_with_frob
(Lisp_Object, Lisp_Object, Error_behavior, CONST char *, ...) PRINTF_ARGS (4, 5);
DECLARE_DOESNT_RETURN (signal_simple_error_2 (CONST char *,
					      Lisp_Object, Lisp_Object));
void maybe_signal_simple_error_2 (CONST char *, Lisp_Object, Lisp_Object,
				  Lisp_Object, Error_behavior);
Lisp_Object signal_simple_continuable_error_2 (CONST char *,
					       Lisp_Object, Lisp_Object);
Lisp_Object maybe_signal_simple_continuable_error_2 (CONST char *, Lisp_Object,
						     Lisp_Object, Lisp_Object,
						     Error_behavior);
void signal_malformed_list_error (Lisp_Object);
void signal_malformed_property_list_error (Lisp_Object);
void signal_circular_list_error (Lisp_Object);
void signal_circular_property_list_error (Lisp_Object);
void signal_void_function_error (Lisp_Object);
Lisp_Object run_hook_with_args_in_buffer (struct buffer *, int, Lisp_Object *,
					  enum run_hooks_condition);
Lisp_Object run_hook_with_args (int, Lisp_Object *, enum run_hooks_condition);
void va_run_hook_with_args (Lisp_Object, int, ...);
void va_run_hook_with_args_in_buffer (struct buffer *, Lisp_Object, int, ...);
Lisp_Object run_hook (Lisp_Object);
Lisp_Object apply1 (Lisp_Object, Lisp_Object);
Lisp_Object call0 (Lisp_Object);
Lisp_Object call1 (Lisp_Object, Lisp_Object);
Lisp_Object call2 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object call3 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object call4 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object);
Lisp_Object call5 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object, Lisp_Object);
Lisp_Object call6 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object call7 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object call8 (Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object, Lisp_Object, Lisp_Object, Lisp_Object,
		   Lisp_Object);
Lisp_Object call0_in_buffer (struct buffer *, Lisp_Object);
Lisp_Object call1_in_buffer (struct buffer *, Lisp_Object, Lisp_Object);
Lisp_Object call2_in_buffer (struct buffer *, Lisp_Object, Lisp_Object,
			     Lisp_Object);
Lisp_Object call3_in_buffer (struct buffer *, Lisp_Object, Lisp_Object,
			     Lisp_Object, Lisp_Object);
Lisp_Object call4_in_buffer (struct buffer *, Lisp_Object, Lisp_Object,
			     Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object call5_in_buffer (struct buffer *, Lisp_Object, Lisp_Object,
			     Lisp_Object, Lisp_Object, Lisp_Object,
			     Lisp_Object);
Lisp_Object call6_in_buffer (struct buffer *, Lisp_Object, Lisp_Object,
			     Lisp_Object, Lisp_Object, Lisp_Object,
			     Lisp_Object, Lisp_Object);
Lisp_Object eval_in_buffer (struct buffer *, Lisp_Object);
Lisp_Object call0_with_handler (Lisp_Object, Lisp_Object);
Lisp_Object call1_with_handler (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object eval_in_buffer_trapping_errors (CONST char *, struct buffer *,
					    Lisp_Object);
Lisp_Object run_hook_trapping_errors (CONST char *, Lisp_Object);
Lisp_Object safe_run_hook_trapping_errors (CONST char *, Lisp_Object, int);
Lisp_Object call0_trapping_errors (CONST char *, Lisp_Object);
Lisp_Object call1_trapping_errors (CONST char *, Lisp_Object, Lisp_Object);
Lisp_Object call2_trapping_errors (CONST char *,
				   Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object call_with_suspended_errors (lisp_fn_t, volatile Lisp_Object, Lisp_Object,
					Error_behavior, int, ...);
/* C Code should be using internal_catch, record_unwind_p, condition_case_1 */
Lisp_Object internal_catch (Lisp_Object, Lisp_Object (*) (Lisp_Object),
			    Lisp_Object, int * volatile);
Lisp_Object condition_case_1 (Lisp_Object,
			      Lisp_Object (*) (Lisp_Object),
			      Lisp_Object,
			      Lisp_Object (*) (Lisp_Object, Lisp_Object),
			      Lisp_Object);
Lisp_Object condition_case_3 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object unbind_to (int, Lisp_Object);
void specbind (Lisp_Object, Lisp_Object);
void record_unwind_protect (Lisp_Object (*) (Lisp_Object), Lisp_Object);
void do_autoload (Lisp_Object, Lisp_Object);
Lisp_Object un_autoload (Lisp_Object);
void warn_when_safe_lispobj (Lisp_Object, Lisp_Object, Lisp_Object);
void warn_when_safe (Lisp_Object, Lisp_Object, CONST char *,
		     ...) PRINTF_ARGS (3, 4);


/* Defined in event-stream.c */
void wait_delaying_user_input (int (*) (void *), void *);
int detect_input_pending (void);
void reset_this_command_keys (Lisp_Object, int);
Lisp_Object enqueue_misc_user_event (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object enqueue_misc_user_event_pos (Lisp_Object, Lisp_Object,
					 Lisp_Object, int, int, int, int);

/* Defined in event-Xt.c */
void signal_special_Xt_user_event (Lisp_Object, Lisp_Object, Lisp_Object);


/* Defined in events.c */
void clear_event_resource (void);
Lisp_Object allocate_event (void);
int event_to_character (Lisp_Event *, int, int, int);

/* Defined in fileio.c */
void record_auto_save (void);
void force_auto_save_soon (void);
DECLARE_DOESNT_RETURN (report_file_error (CONST char *, Lisp_Object));
void maybe_report_file_error (CONST char *, Lisp_Object,
			      Lisp_Object, Error_behavior);
DECLARE_DOESNT_RETURN (signal_file_error (CONST char *, Lisp_Object));
void maybe_signal_file_error (CONST char *, Lisp_Object,
			      Lisp_Object, Error_behavior);
DECLARE_DOESNT_RETURN (signal_double_file_error (CONST char *, CONST char *,
						 Lisp_Object));
void maybe_signal_double_file_error (CONST char *, CONST char *,
				     Lisp_Object, Lisp_Object, Error_behavior);
DECLARE_DOESNT_RETURN (signal_double_file_error_2 (CONST char *, CONST char *,
						   Lisp_Object, Lisp_Object));
void maybe_signal_double_file_error_2 (CONST char *, CONST char *,
				       Lisp_Object, Lisp_Object, Lisp_Object,
				       Error_behavior);
Lisp_Object lisp_strerror (int);
Lisp_Object expand_and_dir_to_file (Lisp_Object, Lisp_Object);
int read_allowing_quit (int, void *, size_t);
int write_allowing_quit (int, CONST void *, size_t);
int internal_delete_file (Lisp_Object);

/* Defined in filelock.c */
void lock_file (Lisp_Object);
void unlock_file (Lisp_Object);
void unlock_all_files (void);
void unlock_buffer (struct buffer *);

/* Defined in filemode.c */
void filemodestring (struct stat *, char *);

/* Defined in floatfns.c */
double extract_float (Lisp_Object);

/* Defined in fns.c */
Lisp_Object list_sort (Lisp_Object, Lisp_Object,
		       int (*) (Lisp_Object, Lisp_Object, Lisp_Object));
Lisp_Object merge (Lisp_Object, Lisp_Object, Lisp_Object);

void bump_string_modiff (Lisp_Object);
Lisp_Object memq_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object assoc_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object assq_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object rassq_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object delq_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object delq_no_quit_and_free_cons (Lisp_Object, Lisp_Object);
Lisp_Object remassoc_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object remassq_no_quit (Lisp_Object, Lisp_Object);
Lisp_Object remrassq_no_quit (Lisp_Object, Lisp_Object);

void pure_put (Lisp_Object, Lisp_Object, Lisp_Object);
int plists_differ (Lisp_Object, Lisp_Object, int, int, int);
Lisp_Object internal_plist_get (Lisp_Object, Lisp_Object);
void internal_plist_put (Lisp_Object *, Lisp_Object, Lisp_Object);
int internal_remprop (Lisp_Object *, Lisp_Object);
Lisp_Object external_plist_get (Lisp_Object *, Lisp_Object,
				int, Error_behavior);
void external_plist_put (Lisp_Object *, Lisp_Object,
			 Lisp_Object, int, Error_behavior);
int external_remprop (Lisp_Object *, Lisp_Object, int, Error_behavior);
int internal_equal (Lisp_Object, Lisp_Object, int);
Lisp_Object concat2 (Lisp_Object, Lisp_Object);
Lisp_Object concat3 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object vconcat2 (Lisp_Object, Lisp_Object);
Lisp_Object vconcat3 (Lisp_Object, Lisp_Object, Lisp_Object);
Lisp_Object nconc2 (Lisp_Object, Lisp_Object);
Lisp_Object bytecode_nconc2 (Lisp_Object *);
void check_losing_bytecode (CONST char *, Lisp_Object);

/* Defined in getloadavg.c */
int getloadavg (double[], int);

/* Defined in glyphs.c */
Error_behavior decode_error_behavior_flag (Lisp_Object);
Lisp_Object encode_error_behavior_flag (Error_behavior);

/* Defined in indent.c */
int bi_spaces_at_point (struct buffer *, Bytind);
int column_at_point (struct buffer *, Bufpos, int);
int current_column (struct buffer *);
void invalidate_current_column (void);
Bufpos vmotion (struct window *, Bufpos, int, int *);
Bufpos vmotion_pixels (Lisp_Object, Bufpos, int, int, int *);

/* Defined in keymap.c */
void where_is_to_char (Lisp_Object, char *);

/* Defined in lread.c */
void ebolify_bytecode_constants (Lisp_Object);
void close_load_descs (void);
int locate_file (Lisp_Object, Lisp_Object, CONST char *, Lisp_Object *, int);
int isfloat_string (CONST char *);

/* Well, I've decided to enable this. -- ben */
/* And I've decided to make it work right.  -- sb */
#define LOADHIST
/* Define the following symbol to enable load history of dumped files */
#define LOADHIST_DUMPED
/* Define the following symbol to enable load history of C source */
#define LOADHIST_BUILTIN

#ifdef LOADHIST /* this is just a stupid idea */
#define LOADHIST_ATTACH(x) \
 do { if (initialized) Vcurrent_load_list = Fcons (x, Vcurrent_load_list); } \
 while (0)
#else /*! LOADHIST */
# define LOADHIST_ATTACH(x)
#endif /*! LOADHIST */

/* Defined in marker.c */
Bytind bi_marker_position (Lisp_Object);
Bufpos marker_position (Lisp_Object);
void set_bi_marker_position (Lisp_Object, Bytind);
void set_marker_position (Lisp_Object, Bufpos);
void unchain_marker (Lisp_Object);
Lisp_Object noseeum_copy_marker (Lisp_Object, Lisp_Object);
Lisp_Object set_marker_restricted (Lisp_Object, Lisp_Object, Lisp_Object);
#ifdef MEMORY_USAGE_STATS
int compute_buffer_marker_usage (struct buffer *, struct overhead_stats *);
#endif

/* Defined in menubar.c */
extern int popup_menu_up_p;
extern int menubar_show_keybindings;
extern int popup_menu_titles;

/* Defined in minibuf.c */
extern int minibuf_level;
Charcount scmp_1 (CONST Bufbyte *, CONST Bufbyte *, Charcount, int);
#define scmp(s1, s2, len) scmp_1 (s1, s2, len, completion_ignore_case)
extern int completion_ignore_case;
int regexp_ignore_completion_p (CONST Bufbyte *, Lisp_Object,
				Bytecount, Bytecount);
Lisp_Object clear_echo_area (struct frame *, Lisp_Object, int);
Lisp_Object clear_echo_area_from_print (struct frame *, Lisp_Object, int);
void echo_area_append (struct frame *, CONST Bufbyte *, Lisp_Object,
		       Bytecount, Bytecount, Lisp_Object);
void echo_area_message (struct frame *, CONST Bufbyte *, Lisp_Object,
			Bytecount, Bytecount, Lisp_Object);
Lisp_Object echo_area_status (struct frame *);
int echo_area_active (struct frame *);
Lisp_Object echo_area_contents (struct frame *);
void message_internal (CONST Bufbyte *, Lisp_Object, Bytecount, Bytecount);
void message_append_internal (CONST Bufbyte *, Lisp_Object,
			      Bytecount, Bytecount);
void message (CONST char *, ...) PRINTF_ARGS (1, 2);
void message_append (CONST char *, ...) PRINTF_ARGS (1, 2);
void message_no_translate (CONST char *, ...) PRINTF_ARGS (1, 2);
void clear_message (void);

/* Defined in print.c */
void write_string_to_stdio_stream (FILE *, struct console *,
				   CONST Bufbyte *, Bytecount, Bytecount,
				   enum external_data_format);
void debug_print (Lisp_Object);
void debug_short_backtrace (int);
void temp_output_buffer_setup (Lisp_Object);
void temp_output_buffer_show (Lisp_Object, Lisp_Object);
/* NOTE: Do not call this with the data of a Lisp_String.  Use princ.
 * Note: stream should be defaulted before calling
 *  (eg Qnil means stdout, not Vstandard_output, etc) */
void write_c_string (CONST char *, Lisp_Object);
/* Same goes for this function. */
void write_string_1 (CONST Bufbyte *, Bytecount, Lisp_Object);
void print_cons (Lisp_Object, Lisp_Object, int);
void print_vector (Lisp_Object, Lisp_Object, int);
void print_string (Lisp_Object, Lisp_Object, int);
void long_to_string (char *, long);
void print_internal (Lisp_Object, Lisp_Object, int);
void print_symbol (Lisp_Object, Lisp_Object, int);
void print_float (Lisp_Object, Lisp_Object, int);
extern int print_escape_newlines;
extern int print_readably;
Lisp_Object internal_with_output_to_temp_buffer (Lisp_Object,
						 Lisp_Object (*) (Lisp_Object),
						 Lisp_Object, Lisp_Object);
void float_to_string (char *, double);
void internal_object_printer (Lisp_Object, Lisp_Object, int);

/* Defined in profile.c */
void mark_profiling_info (void (*) (Lisp_Object));
void profile_increase_call_count (Lisp_Object);
extern int profiling_active;
extern int profiling_redisplay_flag;

/* Defined in rangetab.c */
void put_range_table (Lisp_Object, EMACS_INT, EMACS_INT, Lisp_Object);
int unified_range_table_bytes_needed (Lisp_Object);
int unified_range_table_bytes_used (void *);
void unified_range_table_copy_data (Lisp_Object, void *);
Lisp_Object unified_range_table_lookup (void *, EMACS_INT, Lisp_Object);
int unified_range_table_nentries (void *);
void unified_range_table_get_range (void *, int, EMACS_INT *, EMACS_INT *,
				    Lisp_Object *);

/* Defined in search.c */
struct re_pattern_buffer;
struct re_registers;
Bufpos scan_buffer (struct buffer *, Emchar, Bufpos, Bufpos, EMACS_INT, EMACS_INT *, int);
Bufpos find_next_newline (struct buffer *, Bufpos, int);
Bufpos find_next_newline_no_quit (struct buffer *, Bufpos, int);
Bytind bi_find_next_newline_no_quit (struct buffer *, Bytind, int);
Bufpos find_before_next_newline (struct buffer *, Bufpos, Bufpos, int);
struct re_pattern_buffer *compile_pattern (Lisp_Object, struct re_registers *,
					   char *, int, Error_behavior);
Bytecount fast_string_match (Lisp_Object,  CONST Bufbyte *,
			     Lisp_Object, Bytecount,
			     Bytecount, int, Error_behavior, int);
Bytecount fast_lisp_string_match (Lisp_Object, Lisp_Object);
void restore_match_data (void);

/* Defined in signal.c */
void init_interrupts_late (void);
extern int dont_check_for_quit;
void begin_dont_check_for_quit (void);
void emacs_sleep (int);

/* Defined in sound.c */
void init_device_sound (struct device *);

/* Defined in specifier.c */
Lisp_Object specifier_instance (Lisp_Object, Lisp_Object, Lisp_Object,
				Error_behavior, int, int, Lisp_Object);
Lisp_Object specifier_instance_no_quit (Lisp_Object, Lisp_Object, Lisp_Object,
					Error_behavior, int, Lisp_Object);

/* Defined in symbols.c */
int hash_string (CONST Bufbyte *, Bytecount);
Lisp_Object intern (CONST char *);
Lisp_Object oblookup (Lisp_Object, CONST Bufbyte *, Bytecount);
void map_obarray (Lisp_Object, int (*) (Lisp_Object, void *), void *);
Lisp_Object indirect_function (Lisp_Object, int);
Lisp_Object symbol_value_in_buffer (Lisp_Object, Lisp_Object);
void kill_buffer_local_variables (struct buffer *);
int symbol_value_buffer_local_info (Lisp_Object, struct buffer *);
Lisp_Object find_symbol_value (Lisp_Object);
Lisp_Object find_symbol_value_quickly (Lisp_Object, int);
Lisp_Object top_level_value (Lisp_Object);
void reject_constant_symbols (Lisp_Object sym, Lisp_Object newval,
			      int function_p,
			      Lisp_Object follow_past_lisp_magic);

/* Defined in syntax.c */
int scan_words (struct buffer *, int, int);

/* Defined in undo.c */
Lisp_Object truncate_undo_list (Lisp_Object, int, int);
void record_extent (Lisp_Object, int);
void record_insert (struct buffer *, Bufpos, Charcount);
void record_delete (struct buffer *, Bufpos, Charcount);
void record_change (struct buffer *, Bufpos, Charcount);

/* Defined in unex*.c */
int unexec (char *, char *, uintptr_t, uintptr_t, uintptr_t);
#ifdef RUN_TIME_REMAP
int run_time_remap (char *);
#endif

/* Defined in vm-limit.c */
void memory_warnings (void *, void (*) (CONST char *));

/* Defined in window.c */
Lisp_Object save_window_excursion_unwind (Lisp_Object);
Lisp_Object display_buffer (Lisp_Object, Lisp_Object, Lisp_Object);

/* The following were machine generated 19980312 */


EXFUN (Faccept_process_output, 3);
EXFUN (Fadd1, 1);
EXFUN (Fadd_spec_to_specifier, 5);
EXFUN (Fadd_timeout, 4);
EXFUN (Fappend, MANY);
EXFUN (Fapply, MANY);
EXFUN (Faref, 2);
EXFUN (Faset, 3);
EXFUN (Fassoc, 2);
EXFUN (Fassq, 2);
EXFUN (Fbacktrace, 2);
EXFUN (Fbeginning_of_line, 2);
EXFUN (Fbobp, 1);
EXFUN (Fbolp, 1);
EXFUN (Fboundp, 1);
EXFUN (Fbuffer_substring, 3);
EXFUN (Fbuilt_in_variable_type, 1);
EXFUN (Fbyte_code, 3);
EXFUN (Fcall_interactively, 3);
EXFUN (Fcanonicalize_lax_plist, 2);
EXFUN (Fcanonicalize_plist, 2);
EXFUN (Fcar, 1);
EXFUN (Fcar_safe, 1);
EXFUN (Fcdr, 1);
EXFUN (Fchar_after, 2);
EXFUN (Fchar_to_string, 1);
EXFUN (Fcheck_valid_plist, 1);
EXFUN (Fclear_range_table, 1);
EXFUN (Fcoding_category_list, 0);
EXFUN (Fcoding_category_system, 1);
EXFUN (Fcoding_priority_list, 0);
EXFUN (Fcoding_system_charset, 2);
EXFUN (Fcoding_system_doc_string, 1);
EXFUN (Fcoding_system_list, 0);
EXFUN (Fcoding_system_name, 1);
EXFUN (Fcoding_system_p, 1);
EXFUN (Fcoding_system_property, 2);
EXFUN (Fcoding_system_type, 1);
EXFUN (Fcommand_execute, 3);
EXFUN (Fcommandp, 1);
EXFUN (Fconcat, MANY);
EXFUN (Fcons, 2);
EXFUN (Fcopy_alist, 1);
EXFUN (Fcopy_coding_system, 2);
EXFUN (Fcopy_event, 2);
EXFUN (Fcopy_list, 1);
EXFUN (Fcopy_marker, 2);
EXFUN (Fcopy_sequence, 1);
EXFUN (Fcopy_tree, 2);
EXFUN (Fcurrent_window_configuration, 1);
EXFUN (Fdecode_big5_char, 1);
EXFUN (Fdecode_coding_region, 4);
EXFUN (Fdecode_shift_jis_char, 1);
EXFUN (Fdefault_boundp, 1);
EXFUN (Fdefault_value, 1);
EXFUN (Fdefine_key, 3);
EXFUN (Fdelete_region, 3);
EXFUN (Fdelq, 2);
EXFUN (Fdestructive_alist_to_plist, 1);
EXFUN (Fdetect_coding_region, 3);
EXFUN (Fdgettext, 2);
EXFUN (Fding, 3);
EXFUN (Fdirectory_file_name, 1);
EXFUN (Fdisable_timeout, 1);
EXFUN (Fdiscard_input, 0);
EXFUN (Fdispatch_event, 1);
EXFUN (Fdisplay_error, 2);
EXFUN (Fdo_auto_save, 2);
EXFUN (Fdowncase, 2);
EXFUN (Felt, 2);
EXFUN (Fencode_big5_char, 1);
EXFUN (Fencode_coding_region, 4);
EXFUN (Fencode_shift_jis_char, 1);
EXFUN (Fend_of_line, 2);
EXFUN (Fenqueue_eval_event, 2);
EXFUN (Feobp, 1);
EXFUN (Feolp, 1);
EXFUN (Fequal, 2);
EXFUN (Ferror_message_string, 1);
EXFUN (Feval, 1);
EXFUN (Fevent_to_character, 4);
EXFUN (Fexecute_kbd_macro, 2);
EXFUN (Fexpand_abbrev, 0);
EXFUN (Fexpand_file_name, 2);
EXFUN (Fextent_at, 5);
EXFUN (Fextent_property, 3);
EXFUN (Ffboundp, 1);
EXFUN (Ffile_accessible_directory_p, 1);
EXFUN (Ffile_directory_p, 1);
EXFUN (Ffile_executable_p, 1);
EXFUN (Ffile_exists_p, 1);
EXFUN (Ffile_name_absolute_p, 1);
EXFUN (Ffile_name_as_directory, 1);
EXFUN (Ffile_name_directory, 1);
EXFUN (Ffile_name_nondirectory, 1);
EXFUN (Ffile_readable_p, 1);
EXFUN (Ffile_symlink_p, 1);
EXFUN (Ffile_truename, 2);
EXFUN (Ffind_coding_system, 1);
EXFUN (Ffind_file_name_handler, 2);
EXFUN (Ffollowing_char, 1);
EXFUN (Fformat, MANY);
EXFUN (Fforward_char, 2);
EXFUN (Fforward_line, 2);
EXFUN (Ffset, 2);
EXFUN (Ffuncall, MANY);
EXFUN (Fgeq, MANY);
EXFUN (Fget, 3);
EXFUN (Fget_buffer_process, 1);
EXFUN (Fget_coding_system, 1);
EXFUN (Fget_process, 1);
EXFUN (Fget_range_table, 3);
EXFUN (Fgettext, 1);
EXFUN (Fgoto_char, 2);
EXFUN (Fgtr, MANY);
EXFUN (Findent_to, 3);
EXFUN (Findirect_function, 1);
EXFUN (Finsert, MANY);
EXFUN (Finsert_buffer_substring, 3);
EXFUN (Finsert_char, 4);
EXFUN (Finsert_file_contents_internal, 7);
EXFUN (Finteractive_p, 0);
EXFUN (Fintern, 2);
EXFUN (Fintern_soft, 2);
EXFUN (Fkey_description, 1);
EXFUN (Fkill_emacs, 1);
EXFUN (Fkill_local_variable, 1);
EXFUN (Flax_plist_get, 3);
EXFUN (Flax_plist_remprop, 2);
EXFUN (Flength, 1);
EXFUN (Fleq, MANY);
EXFUN (Flist, MANY);
EXFUN (Flistp, 1);
EXFUN (Flss, MANY);
EXFUN (Fmake_byte_code, MANY);
EXFUN (Fmake_coding_system, 4);
EXFUN (Fmake_glyph_internal, 1);
EXFUN (Fmake_list, 2);
EXFUN (Fmake_marker, 0);
EXFUN (Fmake_range_table, 0);
EXFUN (Fmake_sparse_keymap, 1);
EXFUN (Fmake_string, 2);
EXFUN (Fmake_symbol, 1);
EXFUN (Fmake_vector, 2);
EXFUN (Fmapcar, 2);
EXFUN (Fmarker_buffer, 1);
EXFUN (Fmarker_position, 1);
EXFUN (Fmatch_beginning, 1);
EXFUN (Fmatch_end, 1);
EXFUN (Fmax, MANY);
EXFUN (Fmember, 2);
EXFUN (Fmemq, 2);
EXFUN (Fmin, MANY);
EXFUN (Fminus, MANY);
EXFUN (Fnarrow_to_region, 3);
EXFUN (Fnconc, MANY);
EXFUN (Fnext_event, 2);
EXFUN (Fnreverse, 1);
EXFUN (Fnthcdr, 2);
EXFUN (Fnumber_to_string, 1);
EXFUN (Fold_assq, 2);
EXFUN (Fold_equal, 2);
EXFUN (Fold_member, 2);
EXFUN (Fold_memq, 2);
EXFUN (Fplist_get, 3);
EXFUN (Fplist_put, 3);
EXFUN (Fplus, MANY);
EXFUN (Fpoint, 1);
EXFUN (Fpoint_marker, 2);
EXFUN (Fpoint_max, 1);
EXFUN (Fpoint_min, 1);
EXFUN (Fpreceding_char, 1);
EXFUN (Fprefix_numeric_value, 1);
EXFUN (Fprin1, 2);
EXFUN (Fprin1_to_string, 2);
EXFUN (Fprinc, 2);
EXFUN (Fprint, 2);
EXFUN (Fprocess_status, 1);
EXFUN (Fprogn, UNEVALLED);
EXFUN (Fprovide, 1);
EXFUN (Fpurecopy, 1);
EXFUN (Fput, 3);
EXFUN (Fput_range_table, 4);
EXFUN (Fput_text_property, 5);
EXFUN (Fquo, MANY);
EXFUN (Frassq, 2);
EXFUN (Fread, 1);
EXFUN (Fread_key_sequence, 3);
EXFUN (Freally_free, 1);
EXFUN (Frem, 2);
EXFUN (Fremassq, 2);
EXFUN (Fselected_frame, 1);
EXFUN (Fset, 2);
EXFUN (Fset_coding_category_system, 2);
EXFUN (Fset_coding_priority_list, 1);
EXFUN (Fset_default, 2);
EXFUN (Fset_marker, 3);
EXFUN (Fset_standard_case_table, 1);
EXFUN (Fsetcar, 2);
EXFUN (Fsetcdr, 2);
EXFUN (Fsignal, 2);
EXFUN (Fsit_for, 2);
EXFUN (Fskip_chars_backward, 3);
EXFUN (Fskip_chars_forward, 3);
EXFUN (Fsleep_for, 1);
EXFUN (Fsort, 2);
EXFUN (Fspecifier_spec_list, 4);
EXFUN (Fstring_equal, 2);
EXFUN (Fstring_lessp, 2);
EXFUN (Fstring_match, 4);
EXFUN (Fsub1, 1);
EXFUN (Fsubr_max_args, 1);
EXFUN (Fsubr_min_args, 1);
EXFUN (Fsubsidiary_coding_system, 2);
EXFUN (Fsubstitute_command_keys, 1);
EXFUN (Fsubstitute_in_file_name, 1);
EXFUN (Fsubstring, 3);
EXFUN (Fsymbol_function, 1);
EXFUN (Fsymbol_name, 1);
EXFUN (Fsymbol_plist, 1);
EXFUN (Fsymbol_value, 1);
EXFUN (Fsystem_name, 0);
EXFUN (Fthrow, 2);
EXFUN (Ftimes, MANY);
EXFUN (Ftruncate, 1);
EXFUN (Fundo_boundary, 0);
EXFUN (Funhandled_file_name_directory, 1);
EXFUN (Funlock_buffer, 0);
EXFUN (Fupcase, 2);
EXFUN (Fupcase_initials, 2);
EXFUN (Fupcase_initials_region, 3);
EXFUN (Fupcase_region, 3);
EXFUN (Fuser_home_directory, 0);
EXFUN (Fuser_login_name, 1);
EXFUN (Fvector, MANY);
EXFUN (Fverify_visited_file_modtime, 1);
EXFUN (Fvertical_motion, 3);
EXFUN (Fwiden, 1);


extern Lisp_Object Q_style, Qactually_requested, Qactivate_menubar_hook;
extern Lisp_Object Qafter, Qall, Qand;
extern Lisp_Object Qarith_error, Qarrayp, Qassoc, Qat, Qautodetect, Qautoload;
extern Lisp_Object Qbackground, Qbackground_pixmap, Qbad_variable, Qbefore;
extern Lisp_Object Qbeginning_of_buffer, Qbig5, Qbinary, Qbitmap, Qbitp, Qblinking;
extern Lisp_Object Qboolean, Qbottom, Qbuffer, Qbuffer_file_coding_system;
extern Lisp_Object Qbuffer_glyph_p, Qbuffer_live_p, Qbuffer_read_only, Qbutton;
extern Lisp_Object Qbyte_code, Qcall_interactively, Qcategory;
extern Lisp_Object Qcategory_designator_p, Qcategory_table_value_p, Qccl, Qcdr;
extern Lisp_Object Qchannel, Qchar, Qchar_or_string_p, Qcharacter, Qcharacterp;
extern Lisp_Object Qchars, Qcharset_g0, Qcharset_g1, Qcharset_g2, Qcharset_g3;
extern Lisp_Object Qcircular_list, Qcircular_property_list;
extern Lisp_Object Qcoding_system_error, Qcoding_system_p;
extern Lisp_Object Qcolor, Qcolor_pixmap_image_instance_p;
extern Lisp_Object Qcolumns, Qcommand, Qcommandp, Qcompletion_ignore_case;
extern Lisp_Object Qconsole, Qconsole_live_p, Qconst_specifier, Qcr, Qcritical;
extern Lisp_Object Qcrlf, Qctext, Qcurrent_menubar, Qcursor;
extern Lisp_Object Qcyclic_variable_indirection, Qdata, Qdead, Qdecode;
extern Lisp_Object Qdefault, Qdefun, Qdelete, Qdelq, Qdevice, Qdevice_live_p;
extern Lisp_Object Qdim, Qdimension, Qdisabled, Qdisplay, Qdisplay_table;
extern Lisp_Object Qdoc_string, Qdomain_error, Qdynarr_overhead;
extern Lisp_Object Qempty, Qencode, Qend_of_buffer, Qend_of_file, Qend_open;
extern Lisp_Object Qeol_cr, Qeol_crlf, Qeol_lf, Qeol_type, Qeq, Qeql, Qequal;
extern Lisp_Object Qerror, Qerror_conditions, Qerror_message, Qescape_quoted;
extern Lisp_Object Qeval, Qevent_live_p, Qexit, Qextent_live_p, Qextents;
extern Lisp_Object Qexternal_debugging_output, Qface, Qfeaturep, Qfile_error;
extern Lisp_Object Qfont, Qforce_g0_on_output, Qforce_g1_on_output;
extern Lisp_Object Qforce_g2_on_output, Qforce_g3_on_output, Qforeground;
extern Lisp_Object Qformat, Qframe, Qframe_live_p, Qfunction, Qgap_overhead;
extern Lisp_Object Qgeneric, Qgeometry, Qglobal, Qheight, Qhighlight, Qicon;
extern Lisp_Object Qicon_glyph_p, Qid, Qidentity, Qimage, Qinfo, Qinherit;
extern Lisp_Object Qinhibit_quit, Qinhibit_read_only;
extern Lisp_Object Qinput_charset_conversion, Qinteger;
extern Lisp_Object Qinteger_char_or_marker_p, Qinteger_or_char_p;
extern Lisp_Object Qinteger_or_marker_p, Qintegerp, Qinteractive, Qinternal;
extern Lisp_Object Qinvalid_function, Qinvalid_read_syntax, Qio_error;
extern Lisp_Object Qiso2022, Qkey, Qkey_assoc, Qkeymap, Qlambda, Qleft, Qlf;
extern Lisp_Object Qlist, Qlistp, Qload, Qlock_shift, Qmacro, Qmagic;
extern Lisp_Object Qmalformed_list, Qmalformed_property_list;
extern Lisp_Object Qmalloc_overhead, Qmark, Qmarkers;
extern Lisp_Object Qmax, Qmemory, Qmessage, Qminus, Qmnemonic, Qmodifiers;
extern Lisp_Object Qmono_pixmap_image_instance_p, Qmotion;
extern Lisp_Object Qmouse_leave_buffer_hook, Qmswindows, Qname, Qnas, Qnatnump;
extern Lisp_Object Qno_ascii_cntl, Qno_ascii_eol, Qno_catch;
extern Lisp_Object Qno_conversion, Qno_iso6429, Qnone, Qnot, Qnothing;
extern Lisp_Object Qnothing_image_instance_p, Qnotice;
extern Lisp_Object Qnumber_char_or_marker_p, Qnumber_or_marker_p, Qnumberp;
extern Lisp_Object Qobject, Qold_assoc, Qold_delete, Qold_delq, Qold_rassoc;
extern Lisp_Object Qold_rassq, Qonly, Qor, Qother, Qoutput_charset_conversion;
extern Lisp_Object Qoverflow_error, Qpath, Qpoint, Qpointer, Qpointer_glyph_p;
extern Lisp_Object Qpointer_image_instance_p, Qpost_read_conversion;
extern Lisp_Object Qpre_write_conversion, Qprint, Qprint_length;
extern Lisp_Object Qprint_string_length, Qprocess, Qprogn, Qprovide, Qquit;
extern Lisp_Object Qquote, Qrange_error, Qrassoc, Qrassq, Qread_char;
extern Lisp_Object Qread_from_minibuffer, Qreally_early_error_handler;
extern Lisp_Object Qregion_beginning, Qregion_end, Qrequire, Qresource;
extern Lisp_Object Qreturn, Qreverse, Qright, Qrun_hooks, Qsans_modifiers;
extern Lisp_Object Qsave_buffers_kill_emacs, Qsearch, Qself_insert_command;
extern Lisp_Object Qsequencep, Qsetting_constant, Qseven, Qshift_jis, Qshort;
extern Lisp_Object Qsignal, Qsimple, Qsingularity_error, Qsize, Qspace;
extern Lisp_Object Qspecifier, Qstandard_input, Qstandard_output, Qstart_open;
extern Lisp_Object Qstream, Qstring, Qstring_lessp;
extern Lisp_Object Qsubwindow_image_instance_p, Qsymbol, Qsyntax, Qt, Qtest;
extern Lisp_Object Qtext, Qtext_image_instance_p, Qtimeout, Qtimestamp;
extern Lisp_Object Qtoolbar, Qtop, Qtop_level, Qtrue_list_p, Qtty, Qtype;
extern Lisp_Object Qunbound, Qundecided, Qundefined, Qunderflow_error;
extern Lisp_Object Qunderline, Qunimplemented, Quser_files_and_directories;
extern Lisp_Object Qvalue_assoc, Qvalues;
extern Lisp_Object Qvariable_documentation, Qvariable_domain, Qvector;
extern Lisp_Object Qvoid_function, Qvoid_variable, Qwarning, Qwidth, Qwindow;
extern Lisp_Object Qwindow_live_p, Qwindow_system, Qwrong_number_of_arguments;
extern Lisp_Object Qwrong_type_argument, Qx, Qy, Qyes_or_no_p;
extern Lisp_Object Vactivate_menubar_hook, Vascii_canon_table;
extern Lisp_Object Vascii_downcase_table, Vascii_eqv_table;
extern Lisp_Object Vascii_upcase_table, Vautoload_queue, Vbinary_process_input;
extern Lisp_Object Vbinary_process_output, Vblank_menubar;
extern Lisp_Object Vcharset_ascii, Vcharset_composite, Vcharset_control_1;
extern Lisp_Object Vcoding_system_for_read, Vcoding_system_for_write;
extern Lisp_Object Vcoding_system_hash_table, Vcommand_history;
extern Lisp_Object Vcommand_line_args, Vconfigure_info_directory;
extern Lisp_Object Vconsole_list, Vcontrolling_terminal;
extern Lisp_Object Vcurrent_compiled_function_annotation, Vcurrent_load_list;
extern Lisp_Object Vcurrent_mouse_event, Vcurrent_prefix_arg, Vdata_directory;
extern Lisp_Object Vdisabled_command_hook, Vdoc_directory, Vinternal_doc_file_name;
extern Lisp_Object Vecho_area_buffer, Vemacs_major_version;
extern Lisp_Object Vemacs_minor_version, Vexec_directory, Vexec_path;
extern Lisp_Object Vexecuting_macro, Vfeatures, Vfile_domain;
extern Lisp_Object Vfile_name_coding_system, Vinhibit_quit;
extern Lisp_Object Vinvocation_directory, Vinvocation_name;
extern Lisp_Object Vkeyboard_coding_system, Vlast_command, Vlast_command_char;
extern Lisp_Object Vlast_command_event, Vlast_input_event;
extern Lisp_Object Vload_file_name_internal;
extern Lisp_Object Vload_file_name_internal_the_purecopy, Vload_history;
extern Lisp_Object Vload_path, Vmark_even_if_inactive, Vmenubar_configuration;
extern Lisp_Object Vminibuf_preprompt, Vminibuf_prompt, Vminibuffer_zero;
extern Lisp_Object Vmirror_ascii_canon_table, Vmirror_ascii_downcase_table;
extern Lisp_Object Vmirror_ascii_eqv_table, Vmirror_ascii_upcase_table;
extern Lisp_Object Vmswindows_downcase_file_names;
extern Lisp_Object Vmswindows_get_true_file_attributes, Vobarray;
extern Lisp_Object Vprint_length, Vprint_level, Vprocess_environment;
extern Lisp_Object Vpure_uninterned_symbol_table, Vquit_flag;
extern Lisp_Object Vrecent_keys_ring, Vshell_file_name, Vsite_directory;
extern Lisp_Object Vstandard_input, Vstandard_output, Vstdio_str;
extern Lisp_Object Vsynchronous_sounds, Vsystem_name, Vterminal_coding_system;
extern Lisp_Object Vthis_command_keys, Vunread_command_event;
extern Lisp_Object Vwin32_generate_fake_inodes, Vwin32_pipe_read_delay;
extern Lisp_Object Vx_initial_argv_list;

extern Lisp_Object Qmakunbound, Qset;

#endif /* _XEMACS_LISP_H_ */
