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
   lead of some existing type (e.g. hashtables).  Note that you
   do not need to supply all the methods (see below); reasonable
   defaults are provided for many of them.  Alternatively, if you're
   just looking for a way of encapsulating data (which possibly
   could contain Lisp_Objects in it), you may well be able to use
   the opaque type. */

struct lrecord_header
{
  /* It would be better to put the mark-bit together with the
     following datatype identification field in an 8- or 16-bit
     integer rather than playing funny games with changing
     header->implementation and "wasting" 32 bits on the below
     pointer.  The type-id would then be a 7 or 15 bit index into a
     table of lrecord-implementations rather than a direct pointer.
     There would be 24 (or 16) bits left over for datatype-specific
     per-instance flags.

     The below is the simplest thing to do for the present,
     and doesn't incur that much overhead as most Emacs records
     are of such a size that the overhead isn't too bad.
     (The marker datatype is the worst case.)

     It also has the very very very slight advantage that type-checking
     involves one memory read (of the "implementation" slot) and a
     comparison against a link-time constant address rather than a
     read and a comparison against a variable value. (Variable since
     it is a very good idea to assign the indices into the hypothetical
     type-code table dynamically rather that pre-defining them.)
     I think I remember that Elk Lisp does something like this.
     Gee, I wonder if some cretin has patented it? */

  /*
   * If USE_INDEXED_LRECORD_IMPLEMENTATION is defined, we are
   * implementing the scheme described in the 'It would be better
   * ...' paragraph above.
   */
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  /* index into lrecord_implementations_table[] */
  unsigned type:8;
  /* 1 if the object is marked during GC, 0 otherwise. */
  unsigned mark:1;
  /* 1 if the object resides in pure (read-only) space */
  unsigned pure:1;
#else
  CONST struct lrecord_implementation *implementation;
#endif
};

struct lrecord_implementation;
int lrecord_type_index (CONST struct lrecord_implementation *implementation);

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
# define set_lheader_implementation(header,imp) do	\
{							\
  (header)->type = lrecord_type_index (imp);		\
  (header)->mark = 0;					\
  (header)->pure = 0;					\
} while (0)
#else
# define set_lheader_implementation(header,imp) \
  ((void) ((header)->implementation = (imp)))
#endif

struct lcrecord_header
{
  struct lrecord_header lheader;
  /* The "next" field is normally used to chain all lrecords together
     so that the GC can find (and free) all of them.
     "alloc_lcrecord" threads records together.

     The "next" field may be used for other purposes as long as some
     other mechanism is provided for letting the GC do its work.  (For
     example, the event and marker datatypes allocate members out of
     memory chunks, and are able to find all unmarked members by
     sweeping through the elements of the list of chunks) */
  struct lcrecord_header *next;
  /* This is just for debugging/printing convenience.
     Having this slot doesn't hurt us much spacewise, since an lcrecord
     already has the above slots together with malloc overhead. */
  unsigned int uid :31;
  /* A flag that indicates whether this lcrecord is on a "free list".
     Free lists are used to minimize the number of calls to malloc()
     when we're repeatedly allocating and freeing a number of the
     same sort of lcrecord.  Lcrecords on a free list always get
     marked in a different fashion, so we can use this flag as a
     sanity check to make sure that free lists only have freed lcrecords
     and there are no freed lcrecords elsewhere. */
  unsigned int free :1;
};

/* Used for lcrecords in an lcrecord-list. */
struct free_lcrecord_header
{
  struct lcrecord_header lcheader;
  Lisp_Object chain;
};

/* This as the value of lheader->implementation->finalizer
 *  means that this record is already marked */
void this_marks_a_marked_record (void *, int);

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

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
extern CONST struct lrecord_implementation *lrecord_implementations_table[];

# define XRECORD_LHEADER_IMPLEMENTATION(obj) \
   (lrecord_implementations_table[XRECORD_LHEADER (obj)->type])
# define LHEADER_IMPLEMENTATION(lh) (lrecord_implementations_table[(lh)->type])
#else
# define XRECORD_LHEADER_IMPLEMENTATION(obj) \
   (XRECORD_LHEADER (obj)->implementation)
# define LHEADER_IMPLEMENTATION(lh) ((lh)->implementation)
#endif

extern int gc_in_progress;

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
# define MARKED_RECORD_P(obj) (gc_in_progress && XRECORD_LHEADER (obj)->mark)
#else
# define MARKED_RECORD_P(obj) (gc_in_progress &&	\
  XRECORD_LHEADER (obj)->implementation->finalizer ==	\
  this_marks_a_marked_record)
#endif

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION

# define MARKED_RECORD_HEADER_P(lheader) (lheader)->mark
# define MARK_RECORD_HEADER(lheader) (lheader)->mark = 1
# define UNMARK_RECORD_HEADER(lheader) (lheader)->mark = 0

#else /* ! USE_INDEXED_LRECORD_IMPLEMENTATION */

# define MARKED_RECORD_HEADER_P(lheader) \
  (((lheader)->implementation->finalizer) == this_marks_a_marked_record)
# define MARK_RECORD_HEADER(lheader) \
  do { (((lheader)->implementation)++); } while (0)
# define UNMARK_RECORD_HEADER(lheader) \
  do { (((lheader)->implementation)--); } while (0)

#endif /* ! USE_INDEXED_LRECORD_IMPLEMENTATION */

#define UNMARKABLE_RECORD_HEADER_P(lheader) \
  ((LHEADER_IMPLEMENTATION (lheader)->marker) \
   == this_one_is_unmarkable)

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
CONST_IF_NOT_DEBUG struct lrecord_implementation lrecord_##c_name[2] =	\
  { { name, marker, printer, nuker, equal, hash,			\
      getprop, putprop, remprop, props, size, sizer,			\
      &(lrecord_##c_name##_lrecord_type_index), basic_p },		\
    { 0, 0, 0, this_marks_a_marked_record, 0, 0, 0, 0, 0, 0, 0, 0, 0, basic_p } }

#define LRECORDP(a) (XTYPE ((a)) == Lisp_Type_Record)
#define XRECORD_LHEADER(a) ((struct lrecord_header *) XPNTR (a))

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
# define RECORD_TYPEP(x, ty) \
  (LRECORDP (x) && \
   lrecord_implementations_table[XRECORD_LHEADER (x)->type] == (ty))
#else
# define RECORD_TYPEP(x, ty) \
  (LRECORDP (x) && XRECORD_LHEADER (x)->implementation == (ty))
#endif

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
  lrecord_##c_name[];						\
INLINE structtype *error_check_##c_name (Lisp_Object _obj);	\
INLINE structtype *						\
error_check_##c_name (Lisp_Object _obj)				\
{								\
  XUNMARK (_obj);						\
  assert (RECORD_TYPEP (_obj, lrecord_##c_name) ||		\
	  MARKED_RECORD_P (_obj));				\
  return (structtype *) XPNTR (_obj);				\
}								\
extern Lisp_Object Q##c_name##p

# define DECLARE_NONRECORD(c_name, type_enum, structtype)	\
INLINE structtype *error_check_##c_name (Lisp_Object _obj);	\
INLINE structtype *						\
error_check_##c_name (Lisp_Object _obj)				\
{								\
  XUNMARK (_obj);						\
  assert (XGCTYPE (_obj) == type_enum);				\
  return (structtype *) XPNTR (_obj);				\
}								\
extern Lisp_Object Q##c_name##p

# define XRECORD(x, c_name, structtype) error_check_##c_name (x)
# define XNONRECORD(x, c_name, type_enum, structtype) error_check_##c_name (x)

# define XSETRECORD(var, p, c_name) do				\
{								\
  XSETOBJ (var, Lisp_Type_Record, p);				\
  assert (RECORD_TYPEP (var, lrecord_##c_name) ||		\
	  MARKED_RECORD_P (var));				\
} while (0)

#else /* not ERROR_CHECK_TYPECHECK */

# define DECLARE_LRECORD(c_name, structtype)			\
extern Lisp_Object Q##c_name##p;				\
extern CONST_IF_NOT_DEBUG struct lrecord_implementation		\
  lrecord_##c_name[]
# define DECLARE_NONRECORD(c_name, type_enum, structtype)	\
extern Lisp_Object Q##c_name##p
# define XRECORD(x, c_name, structtype) ((structtype *) XPNTR (x))
# define XNONRECORD(x, c_name, type_enum, structtype)		\
  ((structtype *) XPNTR (x))
# define XSETRECORD(var, p, c_name) XSETOBJ (var, Lisp_Type_Record, p)

#endif /* not ERROR_CHECK_TYPECHECK */

#define RECORDP(x, c_name) RECORD_TYPEP (x, lrecord_##c_name)
#define GC_RECORDP(x, c_name) gc_record_type_p (x, lrecord_##c_name)

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
 if (!RECORD_TYPEP (x, lrecord_##c_name))		\
   x = wrong_type_argument (Q##c_name##p, x);		\
}  while (0)
#define CONCHECK_NONRECORD(x, lisp_enum, predicate) do {\
 if (XTYPE (x) != lisp_enum)				\
   x = wrong_type_argument (predicate, x);		\
 } while (0)
#define CHECK_RECORD(x, c_name) do {			\
 if (!RECORD_TYPEP (x, lrecord_##c_name))		\
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
