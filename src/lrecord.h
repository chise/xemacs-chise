/* The "lrecord" structure (header of a compound lisp object).
   Copyright (C) 1993, 1994, 1995 Free Software Foundation, Inc.
   Copyright (C) 1996 Ben Wing.

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

#ifndef _XEMACS_LRECORD_H_
#define _XEMACS_LRECORD_H_

/* The "lrecord" type of Lisp object is used for all object types
   other than a few simple ones.  This allows many types to be
   implemented but only a few bits required in a Lisp object for
   type information. (The tradeoff is that each object has its
   type marked in it, thereby increasing its size.) The first
   four bytes of all lrecords is either a pointer to a struct
   lrecord_implementation, which contains methods describing how
   to process this object, or an index into an array of pointers
   to struct lrecord_implementations plus some other data bits.

   Lrecords are of two types: straight lrecords, and lcrecords.
   Straight lrecords are used for those types of objects that have
   their own allocation routines (typically allocated out of 2K chunks
   of memory called `frob blocks').  These objects have a `struct
   lrecord_header' at the top, containing only the bits needed to find
   the lrecord_implementation for the object.  There are special
   routines in alloc.c to deal with each such object type.

   Lcrecords are used for less common sorts of objects that don't
   do their own allocation.  Each such object is malloc()ed
   individually, and the objects are chained together through
   a `next' pointer.  Lcrecords have a `struct lcrecord_header'
   at the top, which contains a `struct lrecord_header' and
   a `next' pointer, and are allocated using alloc_lcrecord().

   Creating a new lcrecord type is fairly easy; just follow the
   lead of some existing type (e.g. hash tables).  Note that you
   do not need to supply all the methods (see below); reasonable
   defaults are provided for many of them.  Alternatively, if you're
   just looking for a way of encapsulating data (which possibly
   could contain Lisp_Objects in it), you may well be able to use
   the opaque type. */

struct lrecord_header
{
  /* index into lrecord_implementations_table[] */
  unsigned char type;
  struct {
    /* 1 if the object is marked during GC. */
    unsigned mark :1;
    /* 1 if the object resides in read-only space */
    unsigned c_readonly : 1;
    /* 1 if the object is readonly from lisp */
    unsigned lisp_readonly : 1;
  } flags;
};

struct lrecord_implementation;
int lrecord_type_index (CONST struct lrecord_implementation *implementation);

# define set_lheader_implementation(header,imp) do {	\
  struct lrecord_header* SLI_header = (header);		\
  (SLI_header)->type = lrecord_type_index (imp);	\
  (SLI_header)->flags.mark = 0;				\
  (SLI_header)->flags.c_readonly = 0;			\
  (SLI_header)->flags.lisp_readonly = 0;		\
} while (0)

struct lcrecord_header
{
  struct lrecord_header lheader;

  /* The `next' field is normally used to chain all lrecords together
     so that the GC can find (and free) all of them.
     `alloc_lcrecord' threads records together.

     The `next' field may be used for other purposes as long as some
     other mechanism is provided for letting the GC do its work.

     For example, the event and marker object types allocate members
     out of memory chunks, and are able to find all unmarked members
     by sweeping through the elements of the list of chunks.  */
  struct lcrecord_header *next;

  /* The `uid' field is just for debugging/printing convenience.
     Having this slot doesn't hurt us much spacewise, since an
     lcrecord already has the above slots plus malloc overhead. */
  unsigned int uid :31;

  /* The `free' field is a flag that indicates whether this lcrecord
     is on a "free list".  Free lists are used to minimize the number
     of calls to malloc() when we're repeatedly allocating and freeing
     a number of the same sort of lcrecord.  Lcrecords on a free list
     always get marked in a different fashion, so we can use this flag
     as a sanity check to make sure that free lists only have freed
     lcrecords and there are no freed lcrecords elsewhere. */
  unsigned int free :1;
};

/* Used for lcrecords in an lcrecord-list. */
struct free_lcrecord_header
{
  struct lcrecord_header lcheader;
  Lisp_Object chain;
};

/* see alloc.c for an explanation */
Lisp_Object this_one_is_unmarkable (Lisp_Object obj,
				    void (*markobj) (Lisp_Object));

struct lrecord_implementation
{
  CONST char *name;
  /* This function is called at GC time, to make sure that all Lisp_Objects
     pointed to by this object get properly marked.  It should call
     the mark_object function on all Lisp_Objects in the object.  If
     the return value is non-nil, it should be a Lisp_Object to be
     marked (don't call the mark_object function explicitly on it,
     because the GC routines will do this).  Doing it this way reduces
     recursion, so the object returned should preferably be the one
     with the deepest level of Lisp_Object pointers.  This function
     can be NULL, meaning no GC marking is necessary. */
  Lisp_Object (*marker) (Lisp_Object, void (*mark_object) (Lisp_Object));
  /* This can be NULL if the object is an lcrecord; the
     default_object_printer() in print.c will be used. */
  void (*printer) (Lisp_Object, Lisp_Object printcharfun, int escapeflag);
  /* This function is called at GC time when the object is about to
     be freed, and at dump time (FOR_DISKSAVE will be non-zero in this
     case).  It should perform any necessary cleanup (e.g. freeing
     malloc()ed memory.  This can be NULL, meaning no special
     finalization is necessary.

     WARNING: remember that the finalizer is called at dump time even
     though the object is not being freed. */
  void (*finalizer) (void *header, int for_disksave);
  /* This can be NULL, meaning compare objects with EQ(). */
  int (*equal) (Lisp_Object obj1, Lisp_Object obj2, int depth);
  /* This can be NULL, meaning use the Lisp_Object itself as the hash;
     but *only* if the `equal' function is EQ (if two objects are
     `equal', they *must* hash to the same value or the hashing won't
     work). */
  unsigned long (*hash) (Lisp_Object, int);
  Lisp_Object (*getprop) (Lisp_Object obj, Lisp_Object prop);
  int (*putprop) (Lisp_Object obj, Lisp_Object prop, Lisp_Object val);
  int (*remprop) (Lisp_Object obj, Lisp_Object prop);
  Lisp_Object (*plist) (Lisp_Object obj);

  /* Only one of these is non-0.  If both are 0, it means that this type
     is not instantiable by alloc_lcrecord(). */
  size_t static_size;
  size_t (*size_in_bytes_method) (CONST void *header);
  /* A unique subtag-code (dynamically) assigned to this datatype. */
  /* (This is a pointer so the rest of this structure can be read-only.) */
  int *lrecord_type_index;
  /* A "basic" lrecord is any lrecord that's not an lcrecord, i.e.
     one that does not have an lcrecord_header at the front and which
     is (usually) allocated in frob blocks.  We only use this flag for
     some consistency checking, and that only when error-checking is
     enabled. */
  int basic_p;
};

extern CONST struct lrecord_implementation *lrecord_implementations_table[];

#define XRECORD_LHEADER_IMPLEMENTATION(obj) \
   (lrecord_implementations_table[XRECORD_LHEADER (obj)->type])
#define LHEADER_IMPLEMENTATION(lh) (lrecord_implementations_table[(lh)->type])

extern int gc_in_progress;

#define MARKED_RECORD_P(obj) (gc_in_progress && XRECORD_LHEADER (obj)->flags.mark)
#define MARKED_RECORD_HEADER_P(lheader) ((lheader)->flags.mark)
#define MARK_RECORD_HEADER(lheader)   ((void) ((lheader)->flags.mark = 1))
#define UNMARK_RECORD_HEADER(lheader) ((void) ((lheader)->flags.mark = 0))

#define UNMARKABLE_RECORD_HEADER_P(lheader) \
  (LHEADER_IMPLEMENTATION (lheader)->marker == this_one_is_unmarkable)

#define C_READONLY_RECORD_HEADER_P(lheader)  ((lheader)->flags.c_readonly)
#define LISP_READONLY_RECORD_HEADER_P(lheader)  ((lheader)->flags.lisp_readonly)
#define SET_C_READONLY_RECORD_HEADER(lheader) \
  ((void) ((lheader)->flags.c_readonly = (lheader)->flags.lisp_readonly = 1))
#define SET_LISP_READONLY_RECORD_HEADER(lheader) \
  ((void) ((lheader)->flags.lisp_readonly = 1))

/* Declaring the following structures as const puts them in the
   text (read-only) segment, which makes debugging inconvenient
   because this segment is not mapped when processing a core-
   dump file */

#ifdef DEBUG_XEMACS
#define CONST_IF_NOT_DEBUG
#else
#define CONST_IF_NOT_DEBUG CONST
#endif

/* DEFINE_LRECORD_IMPLEMENTATION is for objects with constant size.
   DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION is for objects whose size varies.
 */

#if defined (ERROR_CHECK_TYPECHECK)
# define DECLARE_ERROR_CHECK_TYPECHECK(c_name, structtype)
#else
# define DECLARE_ERROR_CHECK_TYPECHECK(c_name, structtype)
#endif

#define DEFINE_BASIC_LRECORD_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,structtype) \
DEFINE_BASIC_LRECORD_IMPLEMENTATION_WITH_PROPS(name,c_name,marker,printer,nuker,equal,hash,0,0,0,0,structtype)

#define DEFINE_BASIC_LRECORD_IMPLEMENTATION_WITH_PROPS(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,structtype) \
MAKE_LRECORD_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,sizeof(structtype),0,1,structtype)

#define DEFINE_LRECORD_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,structtype) \
DEFINE_LRECORD_IMPLEMENTATION_WITH_PROPS(name,c_name,marker,printer,nuker,equal,hash,0,0,0,0,structtype)

#define DEFINE_LRECORD_IMPLEMENTATION_WITH_PROPS(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,structtype) \
MAKE_LRECORD_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,sizeof (structtype),0,0,structtype)

#define DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,sizer,structtype) \
DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION_WITH_PROPS(name,c_name,marker,printer,nuker,equal,hash,0,0,0,0,sizer,structtype)

#define DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION_WITH_PROPS(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,sizer,structtype) \
MAKE_LRECORD_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,0,sizer,0,structtype) \

#define MAKE_LRECORD_IMPLEMENTATION(name,c_name,marker,printer,nuker,equal,hash,getprop,putprop,remprop,props,size,sizer,basic_p,structtype) \
DECLARE_ERROR_CHECK_TYPECHECK(c_name, structtype)			\
static int lrecord_##c_name##_lrecord_type_index;			\
CONST_IF_NOT_DEBUG struct lrecord_implementation lrecord_##c_name =	\
  { name, marker, printer, nuker, equal, hash,				\
    getprop, putprop, remprop, props, size, sizer,			\
    &(lrecord_##c_name##_lrecord_type_index), basic_p }			\

#define LRECORDP(a) (XTYPE ((a)) == Lisp_Type_Record)
#define XRECORD_LHEADER(a) ((struct lrecord_header *) XPNTR (a))

#define RECORD_TYPEP(x, ty) \
  (LRECORDP (x) && \
   lrecord_implementations_table[XRECORD_LHEADER (x)->type] == (ty))

/* NOTE: the DECLARE_LRECORD() must come before the associated
   DEFINE_LRECORD_*() or you will get compile errors.

   Furthermore, you always need to put the DECLARE_LRECORD() in a header
   file, and make sure the header file is included in inline.c, even
   if the type is private to a particular file.  Otherwise, you will
   get undefined references for the error_check_foo() inline function
   under GCC. */

#ifdef ERROR_CHECK_TYPECHECK

# define DECLARE_LRECORD(c_name, structtype)			\
extern CONST_IF_NOT_DEBUG struct lrecord_implementation		\
  lrecord_##c_name;						\
INLINE structtype *error_check_##c_name (Lisp_Object obj);	\
INLINE structtype *						\
error_check_##c_name (Lisp_Object obj)				\
{								\
  assert (RECORD_TYPEP (obj, &lrecord_##c_name) ||		\
	  MARKED_RECORD_P (obj));				\
  return (structtype *) XPNTR (obj);				\
}								\
extern Lisp_Object Q##c_name##p

# define DECLARE_NONRECORD(c_name, type_enum, structtype)	\
INLINE structtype *error_check_##c_name (Lisp_Object obj);	\
INLINE structtype *						\
error_check_##c_name (Lisp_Object obj)				\
{								\
  assert (XGCTYPE (obj) == type_enum);				\
  return (structtype *) XPNTR (obj);				\
}								\
extern Lisp_Object Q##c_name##p

# define XRECORD(x, c_name, structtype) error_check_##c_name (x)
# define XNONRECORD(x, c_name, type_enum, structtype) error_check_##c_name (x)

# define XSETRECORD(var, p, c_name) do				\
{								\
  XSETOBJ (var, Lisp_Type_Record, p);				\
  assert (RECORD_TYPEP (var, &lrecord_##c_name) ||		\
	  MARKED_RECORD_P (var));				\
} while (0)

#else /* not ERROR_CHECK_TYPECHECK */

# define DECLARE_LRECORD(c_name, structtype)			\
extern Lisp_Object Q##c_name##p;				\
extern CONST_IF_NOT_DEBUG struct lrecord_implementation		\
  lrecord_##c_name
# define DECLARE_NONRECORD(c_name, type_enum, structtype)	\
extern Lisp_Object Q##c_name##p
# define XRECORD(x, c_name, structtype) ((structtype *) XPNTR (x))
# define XNONRECORD(x, c_name, type_enum, structtype)		\
  ((structtype *) XPNTR (x))
# define XSETRECORD(var, p, c_name) XSETOBJ (var, Lisp_Type_Record, p)

#endif /* not ERROR_CHECK_TYPECHECK */

#define RECORDP(x, c_name) RECORD_TYPEP (x, &lrecord_##c_name)
#define GC_RECORDP(x, c_name) gc_record_type_p (x, &lrecord_##c_name)

/* Note: we now have two different kinds of type-checking macros.
   The "old" kind has now been renamed CONCHECK_foo.  The reason for
   this is that the CONCHECK_foo macros signal a continuable error,
   allowing the user (through debug-on-error) to substitute a different
   value and return from the signal, which causes the lvalue argument
   to get changed.  Quite a lot of code would crash if that happened,
   because it did things like

   foo = XCAR (list);
   CHECK_STRING (foo);

   and later on did XSTRING (XCAR (list)), assuming that the type
   is correct (when it might be wrong, if the user substituted a
   correct value in the debugger).

   To get around this, I made all the CHECK_foo macros signal a
   non-continuable error.  Places where a continuable error is OK
   (generally only when called directly on the argument of a Lisp
   primitive) should be changed to use CONCHECK().

   FSF Emacs does not have this problem because RMS took the cheesy
   way out and disabled returning from a signal entirely. */

#define CONCHECK_RECORD(x, c_name) do {			\
 if (!RECORD_TYPEP (x, &lrecord_##c_name))		\
   x = wrong_type_argument (Q##c_name##p, x);		\
}  while (0)
#define CONCHECK_NONRECORD(x, lisp_enum, predicate) do {\
 if (XTYPE (x) != lisp_enum)				\
   x = wrong_type_argument (predicate, x);		\
 } while (0)
#define CHECK_RECORD(x, c_name) do {			\
 if (!RECORD_TYPEP (x, &lrecord_##c_name))		\
   dead_wrong_type_argument (Q##c_name##p, x);		\
 } while (0)
#define CHECK_NONRECORD(x, lisp_enum, predicate) do {	\
 if (XTYPE (x) != lisp_enum)				\
   dead_wrong_type_argument (predicate, x);		\
 } while (0)

void *alloc_lcrecord (size_t size, CONST struct lrecord_implementation *);

#define alloc_lcrecord_type(type, lrecord_implementation) \
  ((type *) alloc_lcrecord (sizeof (type), lrecord_implementation))

int gc_record_type_p (Lisp_Object frob,
		      CONST struct lrecord_implementation *type);

/* Copy the data from one lcrecord structure into another, but don't
   overwrite the header information. */

#define copy_lcrecord(dst, src)					\
  memcpy ((char *) dst + sizeof (struct lcrecord_header),	\
	  (char *) src + sizeof (struct lcrecord_header),	\
	  sizeof (*dst) - sizeof (struct lcrecord_header))

#define zero_lcrecord(lcr)					\
   memset ((char *) lcr + sizeof (struct lcrecord_header), 0,	\
	   sizeof (*lcr) - sizeof (struct lcrecord_header))

#endif /* _XEMACS_LRECORD_H_ */
