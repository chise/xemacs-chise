/* Storage allocation and gc for XEmacs Lisp interpreter.
   Copyright (C) 1985-1998 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.
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

/* Synched up with: FSF 19.28, Mule 2.0.  Substantially different from
   FSF. */

/* Authorship:

   FSF: Original version; a long time ago.
   Mly: Significantly rewritten to use new 3-bit tags and
        nicely abstracted object definitions, for 19.8.
   JWZ: Improved code to keep track of purespace usage and
        issue nice purespace and GC stats.
   Ben Wing: Cleaned up frob-block lrecord code, added error-checking
        and various changes for Mule, for 19.12.
        Added bit vectors for 19.13.
	Added lcrecord lists for 19.14.
   slb: Lots of work on the purification and dump time code.
        Synched Doug Lea malloc support from Emacs 20.2.
*/

#include <config.h>
#include "lisp.h"

#include "backtrace.h"
#include "buffer.h"
#include "bytecode.h"
#include "chartab.h"
#include "device.h"
#include "elhash.h"
#include "events.h"
#include "extents.h"
#include "frame.h"
#include "glyphs.h"
#include "opaque.h"
#include "redisplay.h"
#include "specifier.h"
#include "sysfile.h"
#include "window.h"

#include <stddef.h>

#ifdef DOUG_LEA_MALLOC
#include <malloc.h>
#endif

EXFUN (Fgarbage_collect, 0);

/* #define GDB_SUCKS */

#if 0 /* this is _way_ too slow to be part of the standard debug options */
#if defined(DEBUG_XEMACS) && defined(MULE)
#define VERIFY_STRING_CHARS_INTEGRITY
#endif
#endif

/* Define this to see where all that space is going... */
/* But the length of the printout is obnoxious, so limit it to testers */
#ifdef MEMORY_USAGE_STATS
#define PURESTAT
#endif

/* Define this to use malloc/free with no freelist for all datatypes,
   the hope being that some debugging tools may help detect
   freed memory references */
#ifdef USE_DEBUG_MALLOC	/* Taking the above comment at face value -slb */
#include <dmalloc.h>
#define ALLOC_NO_POOLS
#endif

#include "puresize.h"

#ifdef DEBUG_XEMACS
static int debug_allocation;
static int debug_allocation_backtrace_length;
#endif

/* Number of bytes of consing done since the last gc */
EMACS_INT consing_since_gc;
#define INCREMENT_CONS_COUNTER_1(size) (consing_since_gc += (size))

#define debug_allocation_backtrace()				\
do {								\
  if (debug_allocation_backtrace_length > 0)			\
    debug_short_backtrace (debug_allocation_backtrace_length);	\
} while (0)

#ifdef DEBUG_XEMACS
#define INCREMENT_CONS_COUNTER(foosize, type)			\
  do {								\
    if (debug_allocation)					\
      {								\
	stderr_out ("allocating %s (size %ld)\n", type, (long)foosize);	\
	debug_allocation_backtrace ();				\
      }								\
    INCREMENT_CONS_COUNTER_1 (foosize);				\
  } while (0)
#define NOSEEUM_INCREMENT_CONS_COUNTER(foosize, type)		\
  do {								\
    if (debug_allocation > 1)					\
      {								\
	stderr_out ("allocating noseeum %s (size %ld)\n", type, (long)foosize); \
	debug_allocation_backtrace ();				\
      }								\
    INCREMENT_CONS_COUNTER_1 (foosize);				\
  } while (0)
#else
#define INCREMENT_CONS_COUNTER(size, type) INCREMENT_CONS_COUNTER_1 (size)
#define NOSEEUM_INCREMENT_CONS_COUNTER(size, type) \
  INCREMENT_CONS_COUNTER_1 (size)
#endif

#define DECREMENT_CONS_COUNTER(size) do {	\
  consing_since_gc -= (size);			\
  if (consing_since_gc < 0)			\
    consing_since_gc = 0;			\
} while (0)

/* Number of bytes of consing since gc before another gc should be done. */
EMACS_INT gc_cons_threshold;

/* Nonzero during gc */
int gc_in_progress;

/* Number of times GC has happened at this level or below.
 * Level 0 is most volatile, contrary to usual convention.
 *  (Of course, there's only one level at present) */
EMACS_INT gc_generation_number[1];

/* This is just for use by the printer, to allow things to print uniquely */
static int lrecord_uid_counter;

/* Nonzero when calling certain hooks or doing other things where
   a GC would be bad */
int gc_currently_forbidden;

/* Hooks. */
Lisp_Object Vpre_gc_hook, Qpre_gc_hook;
Lisp_Object Vpost_gc_hook, Qpost_gc_hook;

/* "Garbage collecting" */
Lisp_Object Vgc_message;
Lisp_Object Vgc_pointer_glyph;
static CONST char gc_default_message[] = "Garbage collecting";
Lisp_Object Qgarbage_collecting;

#ifndef VIRT_ADDR_VARIES
extern
#endif /* VIRT_ADDR_VARIES */
 EMACS_INT malloc_sbrk_used;

#ifndef VIRT_ADDR_VARIES
extern
#endif /* VIRT_ADDR_VARIES */
 EMACS_INT malloc_sbrk_unused;

/* Non-zero means defun should do purecopy on the function definition */
int purify_flag;

#ifdef HEAP_IN_DATA
extern void sheap_adjust_h();
#endif

/* Force linker to put it into data space! */
EMACS_INT pure[PURESIZE / sizeof (EMACS_INT)] = { (EMACS_INT) 0};

#define PUREBEG ((char *) pure)

#if 0 /* This is breathing_space in XEmacs */
/* Points to memory space allocated as "spare",
   to be freed if we run out of memory.  */
static char *spare_memory;

/* Amount of spare memory to keep in reserve.  */
#define SPARE_MEMORY (1 << 14)
#endif

/* Index in pure at which next pure object will be allocated. */
static size_t pure_bytes_used;

#define PURIFIED(ptr)				\
((char *) (ptr) >= PUREBEG &&			\
 (char *) (ptr) <  PUREBEG + get_PURESIZE())

/* Non-zero if pure_bytes_used > get_PURESIZE();
   accounts for excess purespace needs. */
static size_t pure_lossage;

#ifdef ERROR_CHECK_TYPECHECK

Error_behavior ERROR_ME, ERROR_ME_NOT, ERROR_ME_WARN;

#endif

int
purified (Lisp_Object obj)
{
  return POINTER_TYPE_P (XGCTYPE (obj)) && PURIFIED (XPNTR (obj));
}

size_t
purespace_usage (void)
{
  return pure_bytes_used;
}

static int
check_purespace (size_t size)
{
  if (pure_lossage)
    {
      pure_lossage += size;
      return 0;
    }
  else if (pure_bytes_used + size > get_PURESIZE())
    {
      /* This can cause recursive bad behavior, we'll yell at the end */
      /* when we're done. */
      /* message ("\nERROR:  Pure Lisp storage exhausted!\n"); */
      pure_lossage = size;
      return 0;
    }
  else
    return 1;
}



#ifndef PURESTAT

#define bump_purestat(p,b) DO_NOTHING

#else /* PURESTAT */

static int purecopying_function_constants;

static size_t pure_sizeof (Lisp_Object);

/* Keep statistics on how much of what is in purespace */
static struct purestat
{
  int nobjects;
  int nbytes;
  CONST char *name;
}
  purestat_cons = {0, 0, "cons cells"},
  purestat_float = {0, 0, "float objects"},
  purestat_string_pname = {0, 0, "symbol-name strings"},
  purestat_function = {0, 0, "compiled-function objects"},
  purestat_opaque_instructions = {0, 0, "compiled-function instructions"},
  purestat_vector_constants = {0, 0, "compiled-function constants vectors"},
  purestat_string_interactive = {0, 0, "interactive strings"},
#ifdef I18N3
  purestat_string_domain = {0, 0, "domain strings"},
#endif
  purestat_string_documentation = {0, 0, "documentation strings"},
  purestat_string_other_function = {0, 0, "other function strings"},
  purestat_vector_other = {0, 0, "other vectors"},
  purestat_string_other = {0, 0, "other strings"},
  purestat_string_all = {0, 0, "all strings"},
  purestat_vector_all = {0, 0, "all vectors"};

static void
bump_purestat (struct purestat *purestat, size_t nbytes)
{
  if (pure_lossage) return;
  purestat->nobjects += 1;
  purestat->nbytes += nbytes;
}

static void
print_purestat (struct purestat *purestat)
{
  char buf [100];
  sprintf(buf, "%s:", purestat->name);
  message ("   %-36s %5d  %7d  %2d%%",
	   buf,
	   purestat->nobjects,
	   purestat->nbytes,
	   (int) (purestat->nbytes / (pure_bytes_used / 100.0) + 0.5));
}
#endif /* PURESTAT */


/* Maximum amount of C stack to save when a GC happens.  */

#ifndef MAX_SAVE_STACK
#define MAX_SAVE_STACK 0 /* 16000 */
#endif

/* Non-zero means ignore malloc warnings.  Set during initialization.  */
int ignore_malloc_warnings;


static void *breathing_space;

void
release_breathing_space (void)
{
  if (breathing_space)
    {
      void *tmp = breathing_space;
      breathing_space = 0;
      xfree (tmp);
    }
}

/* malloc calls this if it finds we are near exhausting storage */
void
malloc_warning (CONST char *str)
{
  if (ignore_malloc_warnings)
    return;

  warn_when_safe
    (Qmemory, Qcritical,
     "%s\n"
     "Killing some buffers may delay running out of memory.\n"
     "However, certainly by the time you receive the 95%% warning,\n"
     "you should clean up, kill this Emacs, and start a new one.",
     str);
}

/* Called if malloc returns zero */
DOESNT_RETURN
memory_full (void)
{
  /* Force a GC next time eval is called.
     It's better to loop garbage-collecting (we might reclaim enough
     to win) than to loop beeping and barfing "Memory exhausted"
   */
  consing_since_gc = gc_cons_threshold + 1;
  release_breathing_space ();

  /* Flush some histories which might conceivably contain garbalogical
     inhibitors.  */
  if (!NILP (Fboundp (Qvalues)))
    Fset (Qvalues, Qnil);
  Vcommand_history = Qnil;

  error ("Memory exhausted");
}

/* like malloc and realloc but check for no memory left, and block input. */

#ifdef xmalloc
#undef xmalloc
#endif

void *
xmalloc (size_t size)
{
  void *val = (void *) malloc (size);

  if (!val && (size != 0)) memory_full ();
  return val;
}

static void *
xcalloc (size_t nelem, size_t elsize)
{
  void *val = (void *) calloc (nelem, elsize);

  if (!val && (nelem != 0)) memory_full ();
  return val;
}

void *
xmalloc_and_zero (size_t size)
{
  return xcalloc (size, sizeof (char));
}

#ifdef xrealloc
#undef xrealloc
#endif

void *
xrealloc (void *block, size_t size)
{
  /* We must call malloc explicitly when BLOCK is 0, since some
     reallocs don't do this.  */
  void *val = (void *) (block ? realloc (block, size) : malloc (size));

  if (!val && (size != 0)) memory_full ();
  return val;
}

void
#ifdef ERROR_CHECK_MALLOC
xfree_1 (void *block)
#else
xfree (void *block)
#endif
{
#ifdef ERROR_CHECK_MALLOC
  /* Unbelievably, calling free() on 0xDEADBEEF doesn't cause an
     error until much later on for many system mallocs, such as
     the one that comes with Solaris 2.3.  FMH!! */
  assert (block != (void *) 0xDEADBEEF);
  assert (block);
#endif /* ERROR_CHECK_MALLOC */
  free (block);
}

#ifdef ERROR_CHECK_GC

#if SIZEOF_INT == 4
typedef unsigned int four_byte_t;
#elif SIZEOF_LONG == 4
typedef unsigned long four_byte_t;
#elif SIZEOF_SHORT == 4
typedef unsigned short four_byte_t;
#else
What kind of strange-ass system are we running on?
#endif

static void
deadbeef_memory (void *ptr, size_t size)
{
  four_byte_t *ptr4 = (four_byte_t *) ptr;
  size_t beefs = size >> 2;

  /* In practice, size will always be a multiple of four.  */
  while (beefs--)
    (*ptr4++) = 0xDEADBEEF;
}

#else /* !ERROR_CHECK_GC */


#define deadbeef_memory(ptr, size)

#endif /* !ERROR_CHECK_GC */

#ifdef xstrdup
#undef xstrdup
#endif

char *
xstrdup (CONST char *str)
{
  int len = strlen (str) + 1;   /* for stupid terminating 0 */

  void *val = xmalloc (len);
  if (val == 0) return 0;
  memcpy (val, str, len);
  return (char *) val;
}

#ifdef NEED_STRDUP
char *
strdup (CONST char *s)
{
  return xstrdup (s);
}
#endif /* NEED_STRDUP */


static void *
allocate_lisp_storage (size_t size)
{
  void *p = xmalloc (size);
#ifndef USE_MINIMAL_TAGBITS
  char *lim = ((char *) p) + size;
  Lisp_Object val;

  XSETOBJ (val, Lisp_Type_Record, lim);
  if ((char *) XPNTR (val) != lim)
    {
      xfree (p);
      memory_full ();
    }
#endif /* ! USE_MINIMAL_TAGBITS */
  return p;
}


/* lrecords are chained together through their "next.v" field.
 * After doing the mark phase, the GC will walk this linked
 *  list and free any record which hasn't been marked.
 */
static struct lcrecord_header *all_lcrecords;

void *
alloc_lcrecord (size_t size, CONST struct lrecord_implementation *implementation)
{
  struct lcrecord_header *lcheader;

#ifdef ERROR_CHECK_GC
  if (implementation->static_size == 0)
    assert (implementation->size_in_bytes_method);
  else
    assert (implementation->static_size == size);
#endif

  lcheader = (struct lcrecord_header *) allocate_lisp_storage (size);
  set_lheader_implementation (&(lcheader->lheader), implementation);
  lcheader->next = all_lcrecords;
#if 1                           /* mly prefers to see small ID numbers */
  lcheader->uid = lrecord_uid_counter++;
#else				/* jwz prefers to see real addrs */
  lcheader->uid = (int) &lcheader;
#endif
  lcheader->free = 0;
  all_lcrecords = lcheader;
  INCREMENT_CONS_COUNTER (size, implementation->name);
  return lcheader;
}

#if 0 /* Presently unused */
/* Very, very poor man's EGC?
 * This may be slow and thrash pages all over the place.
 *  Only call it if you really feel you must (and if the
 *  lrecord was fairly recently allocated).
 * Otherwise, just let the GC do its job -- that's what it's there for
 */
void
free_lcrecord (struct lcrecord_header *lcrecord)
{
  if (all_lcrecords == lcrecord)
    {
      all_lcrecords = lcrecord->next;
    }
  else
    {
      struct lrecord_header *header = all_lcrecords;
      for (;;)
	{
	  struct lrecord_header *next = header->next;
	  if (next == lcrecord)
	    {
	      header->next = lrecord->next;
	      break;
	    }
	  else if (next == 0)
	    abort ();
	  else
	    header = next;
	}
    }
  if (lrecord->implementation->finalizer)
    lrecord->implementation->finalizer (lrecord, 0);
  xfree (lrecord);
  return;
}
#endif /* Unused */


static void
disksave_object_finalization_1 (void)
{
  struct lcrecord_header *header;

  for (header = all_lcrecords; header; header = header->next)
    {
      if (LHEADER_IMPLEMENTATION(&header->lheader)->finalizer &&
	  !header->free)
	((LHEADER_IMPLEMENTATION(&header->lheader)->finalizer)
	 (header, 1));
    }
}


/* This must not be called -- it just serves as for EQ test
 *  If lheader->implementation->finalizer is this_marks_a_marked_record,
 *  then lrecord has been marked by the GC sweeper
 * header->implementation is put back to its correct value by
 *  sweep_records */
void
this_marks_a_marked_record (void *dummy0, int dummy1)
{
  abort ();
}

/* Semi-kludge -- lrecord_symbol_value_forward objects get stuck
   in CONST space and you get SEGV's if you attempt to mark them.
   This sits in lheader->implementation->marker. */

Lisp_Object
this_one_is_unmarkable (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  abort ();
  return Qnil;
}

/* XGCTYPE for records */
int
gc_record_type_p (Lisp_Object frob, CONST struct lrecord_implementation *type)
{
  CONST struct lrecord_implementation *imp;

  if (XGCTYPE (frob) != Lisp_Type_Record)
    return 0;

  imp = XRECORD_LHEADER_IMPLEMENTATION (frob);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  return imp == type;
#else
  return imp == type || imp == type + 1;
#endif
}


/************************************************************************/
/*			  Debugger support				*/
/************************************************************************/
/* Give gdb/dbx enough information to decode Lisp Objects.
   We make sure certain symbols are defined, so gdb doesn't complain
   about expressions in src/gdbinit.  Values are randomly chosen.
   See src/gdbinit or src/dbxrc to see how this is used.  */

enum dbg_constants
{
#ifdef USE_MINIMAL_TAGBITS
  dbg_valmask = (EMACS_INT) (((1UL << VALBITS) - 1) << GCBITS),
  dbg_typemask = (EMACS_INT) ((1UL << GCTYPEBITS) - 1),
  dbg_USE_MINIMAL_TAGBITS = 1,
  dbg_Lisp_Type_Int = 100,
#else /* ! USE_MIMIMAL_TAGBITS */
  dbg_valmask = (EMACS_INT) ((1UL << VALBITS) - 1),
  dbg_typemask = (EMACS_INT) (((1UL << GCTYPEBITS) - 1) << (VALBITS + GCMARKBITS)),
  dbg_USE_MINIMAL_TAGBITS = 0,
  dbg_Lisp_Type_Int = Lisp_Type_Int,
#endif /* ! USE_MIMIMAL_TAGBITS */

#ifdef USE_UNION_TYPE
  dbg_USE_UNION_TYPE = 1,
#else
  dbg_USE_UNION_TYPE = 0,
#endif

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  dbg_USE_INDEXED_LRECORD_IMPLEMENTATION = 1,
#else
  dbg_USE_INDEXED_LRECORD_IMPLEMENTATION = 0,
#endif

  dbg_Lisp_Type_Char = Lisp_Type_Char,
  dbg_Lisp_Type_Record = Lisp_Type_Record,
#ifdef LRECORD_CONS
  dbg_Lisp_Type_Cons = 101,
#else
  dbg_Lisp_Type_Cons = Lisp_Type_Cons,
  lrecord_cons = 201,
#endif
#ifdef LRECORD_STRING
  dbg_Lisp_Type_String = 102,
#else
  dbg_Lisp_Type_String = Lisp_Type_String,
  lrecord_string = 202,
#endif
#ifdef LRECORD_VECTOR
  dbg_Lisp_Type_Vector = 103,
#else
  dbg_Lisp_Type_Vector = Lisp_Type_Vector,
  lrecord_vector = 203,
#endif
#ifdef LRECORD_SYMBOL
  dbg_Lisp_Type_Symbol = 104,
#else
  dbg_Lisp_Type_Symbol = Lisp_Type_Symbol,
  lrecord_symbol = 204,
#endif
#ifndef MULE
  lrecord_char_table_entry = 205,
  lrecord_charset          = 206,
  lrecord_coding_system    = 207,
#endif
#ifndef HAVE_TOOLBARS
  lrecord_toolbar_button   = 208,
#endif
#ifndef HAVE_TOOLTALK
  lrecord_tooltalk_message = 210,
  lrecord_tooltalk_pattern = 211,
#endif
#ifndef HAVE_DATABASE
  lrecord_database = 212,
#endif
  dbg_valbits = VALBITS,
  dbg_gctypebits = GCTYPEBITS
  /* If we don't have an actual object of this enum, pgcc (and perhaps
     other compilers) might optimize away the entire type declaration :-( */
} dbg_dummy;

/* A few macros turned into functions for ease of debugging.
   Debuggers don't know about macros! */
int dbg_eq (Lisp_Object obj1, Lisp_Object obj2);
int
dbg_eq (Lisp_Object obj1, Lisp_Object obj2)
{
  return EQ (obj1, obj2);
}


/************************************************************************/
/*			  Fixed-size type macros			*/
/************************************************************************/

/* For fixed-size types that are commonly used, we malloc() large blocks
   of memory at a time and subdivide them into chunks of the correct
   size for an object of that type.  This is more efficient than
   malloc()ing each object separately because we save on malloc() time
   and overhead due to the fewer number of malloc()ed blocks, and
   also because we don't need any extra pointers within each object
   to keep them threaded together for GC purposes.  For less common
   (and frequently large-size) types, we use lcrecords, which are
   malloc()ed individually and chained together through a pointer
   in the lcrecord header.  lcrecords do not need to be fixed-size
   (i.e. two objects of the same type need not have the same size;
   however, the size of a particular object cannot vary dynamically).
   It is also much easier to create a new lcrecord type because no
   additional code needs to be added to alloc.c.  Finally, lcrecords
   may be more efficient when there are only a small number of them.

   The types that are stored in these large blocks (or "frob blocks")
   are cons, float, compiled-function, symbol, marker, extent, event,
   and string.

   Note that strings are special in that they are actually stored in
   two parts: a structure containing information about the string, and
   the actual data associated with the string.  The former structure
   (a struct Lisp_String) is a fixed-size structure and is managed the
   same way as all the other such types.  This structure contains a
   pointer to the actual string data, which is stored in structures of
   type struct string_chars_block.  Each string_chars_block consists
   of a pointer to a struct Lisp_String, followed by the data for that
   string, followed by another pointer to a struct Lisp_String,
   followed by the data for that string, etc.  At GC time, the data in
   these blocks is compacted by searching sequentially through all the
   blocks and compressing out any holes created by unmarked strings.
   Strings that are more than a certain size (bigger than the size of
   a string_chars_block, although something like half as big might
   make more sense) are malloc()ed separately and not stored in
   string_chars_blocks.  Furthermore, no one string stretches across
   two string_chars_blocks.

   Vectors are each malloc()ed separately, similar to lcrecords.

   In the following discussion, we use conses, but it applies equally
   well to the other fixed-size types.

   We store cons cells inside of cons_blocks, allocating a new
   cons_block with malloc() whenever necessary.  Cons cells reclaimed
   by GC are put on a free list to be reallocated before allocating
   any new cons cells from the latest cons_block.  Each cons_block is
   just under 2^n - MALLOC_OVERHEAD bytes long, since malloc (at least
   the versions in malloc.c and gmalloc.c) really allocates in units
   of powers of two and uses 4 bytes for its own overhead.

   What GC actually does is to search through all the cons_blocks,
   from the most recently allocated to the oldest, and put all
   cons cells that are not marked (whether or not they're already
   free) on a cons_free_list.  The cons_free_list is a stack, and
   so the cons cells in the oldest-allocated cons_block end up
   at the head of the stack and are the first to be reallocated.
   If any cons_block is entirely free, it is freed with free()
   and its cons cells removed from the cons_free_list.  Because
   the cons_free_list ends up basically in memory order, we have
   a high locality of reference (assuming a reasonable turnover
   of allocating and freeing) and have a reasonable probability
   of entirely freeing up cons_blocks that have been more recently
   allocated.  This stage is called the "sweep stage" of GC, and
   is executed after the "mark stage", which involves starting
   from all places that are known to point to in-use Lisp objects
   (e.g. the obarray, where are all symbols are stored; the
   current catches and condition-cases; the backtrace list of
   currently executing functions; the gcpro list; etc.) and
   recursively marking all objects that are accessible.

   At the beginning of the sweep stage, the conses in the cons
   blocks are in one of three states: in use and marked, in use
   but not marked, and not in use (already freed).  Any conses
   that are marked have been marked in the mark stage just
   executed, because as part of the sweep stage we unmark any
   marked objects.  The way we tell whether or not a cons cell
   is in use is through the FREE_STRUCT_P macro.  This basically
   looks at the first 4 bytes (or however many bytes a pointer
   fits in) to see if all the bits in those bytes are 1.  The
   resulting value (0xFFFFFFFF) is not a valid pointer and is
   not a valid Lisp_Object.  All current fixed-size types have
   a pointer or Lisp_Object as their first element with the
   exception of strings; they have a size value, which can
   never be less than zero, and so 0xFFFFFFFF is invalid for
   strings as well.  Now assuming that a cons cell is in use,
   the way we tell whether or not it is marked is to look at
   the mark bit of its car (each Lisp_Object has one bit
   reserved as a mark bit, in case it's needed).  Note that
   different types of objects use different fields to indicate
   whether the object is marked, but the principle is the same.

   Conses on the free_cons_list are threaded through a pointer
   stored in the bytes directly after the bytes that are set
   to 0xFFFFFFFF (we cannot overwrite these because the cons
   is still in a cons_block and needs to remain marked as
   not in use for the next time that GC happens).  This
   implies that all fixed-size types must be at least big
   enough to store two pointers, which is indeed the case
   for all current fixed-size types.

   Some types of objects need additional "finalization" done
   when an object is converted from in use to not in use;
   this is the purpose of the ADDITIONAL_FREE_type macro.
   For example, markers need to be removed from the chain
   of markers that is kept in each buffer.  This is because
   markers in a buffer automatically disappear if the marker
   is no longer referenced anywhere (the same does not
   apply to extents, however).

   WARNING: Things are in an extremely bizarre state when
   the ADDITIONAL_FREE_type macros are called, so beware!

   When ERROR_CHECK_GC is defined, we do things differently
   so as to maximize our chances of catching places where
   there is insufficient GCPROing.  The thing we want to
   avoid is having an object that we're using but didn't
   GCPRO get freed by GC and then reallocated while we're
   in the process of using it -- this will result in something
   seemingly unrelated getting trashed, and is extremely
   difficult to track down.  If the object gets freed but
   not reallocated, we can usually catch this because we
   set all bytes of a freed object to 0xDEADBEEF. (The
   first four bytes, however, are 0xFFFFFFFF, and the next
   four are a pointer used to chain freed objects together;
   we play some tricks with this pointer to make it more
   bogus, so crashes are more likely to occur right away.)

   We want freed objects to stay free as long as possible,
   so instead of doing what we do above, we maintain the
   free objects in a first-in first-out queue.  We also
   don't recompute the free list each GC, unlike above;
   this ensures that the queue ordering is preserved.
   [This means that we are likely to have worse locality
   of reference, and that we can never free a frob block
   once it's allocated. (Even if we know that all cells
   in it are free, there's no easy way to remove all those
   cells from the free list because the objects on the
   free list are unlikely to be in memory order.)]
   Furthermore, we never take objects off the free list
   unless there's a large number (usually 1000, but
   varies depending on type) of them already on the list.
   This way, we ensure that an object that gets freed will
   remain free for the next 1000 (or whatever) times that
   an object of that type is allocated.
*/

#ifndef MALLOC_OVERHEAD
#ifdef GNU_MALLOC
#define MALLOC_OVERHEAD 0
#elif defined (rcheck)
#define MALLOC_OVERHEAD 20
#else
#define MALLOC_OVERHEAD 8
#endif
#endif /* MALLOC_OVERHEAD */

#if !defined(HAVE_MMAP) || defined(DOUG_LEA_MALLOC)
/* If we released our reserve (due to running out of memory),
   and we have a fair amount free once again,
   try to set aside another reserve in case we run out once more.

   This is called when a relocatable block is freed in ralloc.c.  */
void refill_memory_reserve (void);
void
refill_memory_reserve ()
{
  if (breathing_space == 0)
    breathing_space = (char *) malloc (4096 - MALLOC_OVERHEAD);
}
#endif

#ifdef ALLOC_NO_POOLS
# define TYPE_ALLOC_SIZE(type, structtype) 1
#else
# define TYPE_ALLOC_SIZE(type, structtype)			\
    ((2048 - MALLOC_OVERHEAD - sizeof (struct type##_block *))	\
     / sizeof (structtype))
#endif /* ALLOC_NO_POOLS */

#define DECLARE_FIXED_TYPE_ALLOC(type, structtype)	\
							\
struct type##_block					\
{							\
  struct type##_block *prev;				\
  structtype block[TYPE_ALLOC_SIZE (type, structtype)];	\
};							\
							\
static struct type##_block *current_##type##_block;	\
static int current_##type##_block_index;		\
							\
static structtype *type##_free_list;			\
static structtype *type##_free_list_tail;		\
							\
static void						\
init_##type##_alloc (void)				\
{							\
  current_##type##_block = 0;				\
  current_##type##_block_index =			\
    countof (current_##type##_block->block);		\
  type##_free_list = 0;					\
  type##_free_list_tail = 0;				\
}							\
							\
static int gc_count_num_##type##_in_use;		\
static int gc_count_num_##type##_freelist

#define ALLOCATE_FIXED_TYPE_FROM_BLOCK(type, result) do {		\
  if (current_##type##_block_index					\
      == countof (current_##type##_block->block))			\
    {									\
      struct type##_block *AFTFB_new = (struct type##_block *)		\
	allocate_lisp_storage (sizeof (struct type##_block));		\
      AFTFB_new->prev = current_##type##_block;				\
      current_##type##_block = AFTFB_new;				\
      current_##type##_block_index = 0;					\
    }									\
  (result) =								\
    &(current_##type##_block->block[current_##type##_block_index++]);	\
} while (0)

/* Allocate an instance of a type that is stored in blocks.
   TYPE is the "name" of the type, STRUCTTYPE is the corresponding
   structure type. */

#ifdef ERROR_CHECK_GC

/* Note: if you get crashes in this function, suspect incorrect calls
   to free_cons() and friends.  This happened once because the cons
   cell was not GC-protected and was getting collected before
   free_cons() was called. */

#define ALLOCATE_FIXED_TYPE_1(type, structtype, result)			 \
do									 \
{									 \
  if (gc_count_num_##type##_freelist >					 \
      MINIMUM_ALLOWED_FIXED_TYPE_CELLS_##type) 				 \
    {									 \
      result = type##_free_list;					 \
      /* Before actually using the chain pointer, we complement all its	 \
         bits; see FREE_FIXED_TYPE(). */				 \
      type##_free_list =						 \
        (structtype *) ~(unsigned long)					 \
          (* (structtype **) ((char *) result + sizeof (void *)));	 \
      gc_count_num_##type##_freelist--;					 \
    }									 \
  else									 \
    ALLOCATE_FIXED_TYPE_FROM_BLOCK (type, result);			 \
  MARK_STRUCT_AS_NOT_FREE (result);					 \
} while (0)

#else /* !ERROR_CHECK_GC */

#define ALLOCATE_FIXED_TYPE_1(type, structtype, result)		\
do								\
{								\
  if (type##_free_list)						\
    {								\
      result = type##_free_list;				\
      type##_free_list =					\
        * (structtype **) ((char *) result + sizeof (void *));	\
    }								\
  else								\
    ALLOCATE_FIXED_TYPE_FROM_BLOCK (type, result);		\
  MARK_STRUCT_AS_NOT_FREE (result);				\
} while (0)

#endif /* !ERROR_CHECK_GC */

#define ALLOCATE_FIXED_TYPE(type, structtype, result)	\
do							\
{							\
  ALLOCATE_FIXED_TYPE_1 (type, structtype, result);	\
  INCREMENT_CONS_COUNTER (sizeof (structtype), #type);	\
} while (0)

#define NOSEEUM_ALLOCATE_FIXED_TYPE(type, structtype, result)	\
do								\
{								\
  ALLOCATE_FIXED_TYPE_1 (type, structtype, result);		\
  NOSEEUM_INCREMENT_CONS_COUNTER (sizeof (structtype), #type);	\
} while (0)

/* INVALID_POINTER_VALUE should be a value that is invalid as a pointer
   to a Lisp object and invalid as an actual Lisp_Object value.  We have
   to make sure that this value cannot be an integer in Lisp_Object form.
   0xFFFFFFFF could be so on a 64-bit system, so we extend it to 64 bits.
   On a 32-bit system, the type bits will be non-zero, making the value
   be a pointer, and the pointer will be misaligned.

   Even if Emacs is run on some weirdo system that allows and allocates
   byte-aligned pointers, this pointer is at the very top of the address
   space and so it's almost inconceivable that it could ever be valid. */

#if INTBITS == 32
# define INVALID_POINTER_VALUE 0xFFFFFFFF
#elif INTBITS == 48
# define INVALID_POINTER_VALUE 0xFFFFFFFFFFFF
#elif INTBITS == 64
# define INVALID_POINTER_VALUE 0xFFFFFFFFFFFFFFFF
#else
You have some weird system and need to supply a reasonable value here.
#endif

#define FREE_STRUCT_P(ptr) \
  (* (void **) ptr == (void *) INVALID_POINTER_VALUE)
#define MARK_STRUCT_AS_FREE(ptr) \
  (* (void **) ptr = (void *) INVALID_POINTER_VALUE)
#define MARK_STRUCT_AS_NOT_FREE(ptr) \
  (* (void **) ptr = 0)

#ifdef ERROR_CHECK_GC

#define PUT_FIXED_TYPE_ON_FREE_LIST(type, structtype, ptr)		\
do { if (type##_free_list_tail)						\
       {								\
	 /* When we store the chain pointer, we complement all		\
	    its bits; this should significantly increase its		\
	    bogosity in case someone tries to use the value, and	\
	    should make us dump faster if someone stores something	\
	    over the pointer because when it gets un-complemented in	\
	    ALLOCATED_FIXED_TYPE(), the resulting pointer will be	\
	    extremely bogus. */						\
	 * (structtype **)						\
	   ((char *) type##_free_list_tail + sizeof (void *)) =		\
	     (structtype *) ~(unsigned long) ptr;			\
       }								\
     else								\
       type##_free_list = ptr;						\
     type##_free_list_tail = ptr;					\
   } while (0)

#else /* !ERROR_CHECK_GC */

#define PUT_FIXED_TYPE_ON_FREE_LIST(type, structtype, ptr)	\
do { * (structtype **) ((char *) (ptr) + sizeof (void *)) =	\
       type##_free_list;					\
     type##_free_list = (ptr);					\
   } while (0)

#endif /* !ERROR_CHECK_GC */

/* TYPE and STRUCTTYPE are the same as in ALLOCATE_FIXED_TYPE(). */

#define FREE_FIXED_TYPE(type, structtype, ptr) do {		\
  structtype *FFT_ptr = (ptr);					\
  ADDITIONAL_FREE_##type (FFT_ptr);				\
  deadbeef_memory (FFT_ptr, sizeof (structtype));		\
  PUT_FIXED_TYPE_ON_FREE_LIST (type, structtype, FFT_ptr);	\
  MARK_STRUCT_AS_FREE (FFT_ptr);				\
} while (0)

/* Like FREE_FIXED_TYPE() but used when we are explicitly
   freeing a structure through free_cons(), free_marker(), etc.
   rather than through the normal process of sweeping.
   We attempt to undo the changes made to the allocation counters
   as a result of this structure being allocated.  This is not
   completely necessary but helps keep things saner: e.g. this way,
   repeatedly allocating and freeing a cons will not result in
   the consing-since-gc counter advancing, which would cause a GC
   and somewhat defeat the purpose of explicitly freeing. */

#define FREE_FIXED_TYPE_WHEN_NOT_IN_GC(type, structtype, ptr)	\
do { FREE_FIXED_TYPE (type, structtype, ptr);			\
     DECREMENT_CONS_COUNTER (sizeof (structtype));		\
     gc_count_num_##type##_freelist++;				\
   } while (0)



/************************************************************************/
/*			   Cons allocation				*/
/************************************************************************/

DECLARE_FIXED_TYPE_ALLOC (cons, struct Lisp_Cons);
/* conses are used and freed so often that we set this really high */
/* #define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_cons 20000 */
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_cons 2000

#ifdef LRECORD_CONS
static Lisp_Object
mark_cons (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  if (GC_NILP (XCDR (obj)))
    return XCAR (obj);

  markobj (XCAR (obj));
  return XCDR (obj);
}

static int
cons_equal (Lisp_Object ob1, Lisp_Object ob2, int depth)
{
  while (internal_equal (XCAR (ob1), XCAR (ob2), depth + 1))
    {
      ob1 = XCDR (ob1);
      ob2 = XCDR (ob2);
      if (! CONSP (ob1) || ! CONSP (ob2))
	return internal_equal (ob1, ob2, depth + 1);
    }
  return 0;
}

DEFINE_BASIC_LRECORD_IMPLEMENTATION ("cons", cons,
				     mark_cons, print_cons, 0,
				     cons_equal,
				     /*
				      * No `hash' method needed.
				      * internal_hash knows how to
				      * handle conses.
				      */
				     0,
				     struct Lisp_Cons);
#endif /* LRECORD_CONS */

DEFUN ("cons", Fcons, 2, 2, 0, /*
Create a new cons, give it CAR and CDR as components, and return it.
*/
       (car, cdr))
{
  /* This cannot GC. */
  Lisp_Object val;
  struct Lisp_Cons *c;

  ALLOCATE_FIXED_TYPE (cons, struct Lisp_Cons, c);
#ifdef LRECORD_CONS
  set_lheader_implementation (&(c->lheader), lrecord_cons);
#endif
  XSETCONS (val, c);
  c->car = car;
  c->cdr = cdr;
  return val;
}

/* This is identical to Fcons() but it used for conses that we're
   going to free later, and is useful when trying to track down
   "real" consing. */
Lisp_Object
noseeum_cons (Lisp_Object car, Lisp_Object cdr)
{
  Lisp_Object val;
  struct Lisp_Cons *c;

  NOSEEUM_ALLOCATE_FIXED_TYPE (cons, struct Lisp_Cons, c);
#ifdef LRECORD_CONS
  set_lheader_implementation (&(c->lheader), lrecord_cons);
#endif
  XSETCONS (val, c);
  XCAR (val) = car;
  XCDR (val) = cdr;
  return val;
}

DEFUN ("list", Flist, 0, MANY, 0, /*
Return a newly created list with specified arguments as elements.
Any number of arguments, even zero arguments, are allowed.
*/
       (int nargs, Lisp_Object *args))
{
  Lisp_Object val = Qnil;
  Lisp_Object *argp = args + nargs;

  while (argp > args)
    val = Fcons (*--argp, val);
  return val;
}

Lisp_Object
list1 (Lisp_Object obj0)
{
  /* This cannot GC. */
  return Fcons (obj0, Qnil);
}

Lisp_Object
list2 (Lisp_Object obj0, Lisp_Object obj1)
{
  /* This cannot GC. */
  return Fcons (obj0, Fcons (obj1, Qnil));
}

Lisp_Object
list3 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2)
{
  /* This cannot GC. */
  return Fcons (obj0, Fcons (obj1, Fcons (obj2, Qnil)));
}

Lisp_Object
cons3 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2)
{
  /* This cannot GC. */
  return Fcons (obj0, Fcons (obj1, obj2));
}

Lisp_Object
acons (Lisp_Object key, Lisp_Object value, Lisp_Object alist)
{
  return Fcons (Fcons (key, value), alist);
}

Lisp_Object
list4 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2, Lisp_Object obj3)
{
  /* This cannot GC. */
  return Fcons (obj0, Fcons (obj1, Fcons (obj2, Fcons (obj3, Qnil))));
}

Lisp_Object
list5 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2, Lisp_Object obj3,
       Lisp_Object obj4)
{
  /* This cannot GC. */
  return Fcons (obj0, Fcons (obj1, Fcons (obj2, Fcons (obj3, Fcons (obj4, Qnil)))));
}

Lisp_Object
list6 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2, Lisp_Object obj3,
       Lisp_Object obj4, Lisp_Object obj5)
{
  /* This cannot GC. */
  return Fcons (obj0, Fcons (obj1, Fcons (obj2, Fcons (obj3, Fcons (obj4, Fcons (obj5, Qnil))))));
}

DEFUN ("make-list", Fmake_list, 2, 2, 0, /*
Return a new list of length LENGTH, with each element being INIT.
*/
       (length, init))
{
  CHECK_NATNUM (length);

  {
    Lisp_Object val = Qnil;
    int size = XINT (length);

    while (size-- > 0)
      val = Fcons (init, val);
    return val;
  }
}


/************************************************************************/
/*			  Float allocation				*/
/************************************************************************/

#ifdef LISP_FLOAT_TYPE

DECLARE_FIXED_TYPE_ALLOC (float, struct Lisp_Float);
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_float 1000

Lisp_Object
make_float (double float_value)
{
  Lisp_Object val;
  struct Lisp_Float *f;

  ALLOCATE_FIXED_TYPE (float, struct Lisp_Float, f);
  set_lheader_implementation (&(f->lheader), lrecord_float);
  float_data (f) = float_value;
  XSETFLOAT (val, f);
  return val;
}

#endif /* LISP_FLOAT_TYPE */


/************************************************************************/
/*			   Vector allocation				*/
/************************************************************************/

#ifdef LRECORD_VECTOR
static Lisp_Object
mark_vector (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  Lisp_Vector *ptr = XVECTOR (obj);
  int len = vector_length (ptr);
  int i;

  for (i = 0; i < len - 1; i++)
    markobj (ptr->contents[i]);
  return (len > 0) ? ptr->contents[len - 1] : Qnil;
}

static size_t
size_vector (CONST void *lheader)
{
  return offsetof (Lisp_Vector, contents[((Lisp_Vector *) lheader)->size]);
}

static int
vector_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  int indice;
  int len = XVECTOR_LENGTH (obj1);
  if (len != XVECTOR_LENGTH (obj2))
    return 0;
  for (indice = 0; indice < len; indice++)
    {
      if (!internal_equal (XVECTOR_DATA (obj1) [indice],
			   XVECTOR_DATA (obj2) [indice],
			   depth + 1))
	return 0;
    }
  return 1;
}

DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION("vector", vector,
				       mark_vector, print_vector, 0,
				       vector_equal,
				       /*
				        * No `hash' method needed for
				        * vectors.  internal_hash
				        * knows how to handle vectors.
				        */
				       0,
				       size_vector, Lisp_Vector);

/* #### should allocate `small' vectors from a frob-block */
static Lisp_Vector *
make_vector_internal (size_t sizei)
{
  /* no vector_next */
  size_t sizem = offsetof (Lisp_Vector, contents[sizei]);
  Lisp_Vector *p = (Lisp_Vector *) alloc_lcrecord (sizem, lrecord_vector);

  p->size = sizei;
  return p;
}

#else /* ! LRECORD_VECTOR */

static Lisp_Object all_vectors;

/* #### should allocate `small' vectors from a frob-block */
static Lisp_Vector *
make_vector_internal (size_t sizei)
{
  /* + 1 to account for vector_next */
  size_t sizem = offsetof (Lisp_Vector, contents[sizei+1]);
  Lisp_Vector *p = (Lisp_Vector *) allocate_lisp_storage (sizem);

  INCREMENT_CONS_COUNTER (sizem, "vector");

  p->size = sizei;
  vector_next (p) = all_vectors;
  XSETVECTOR (all_vectors, p);
  return p;
}

#endif /* ! LRECORD_VECTOR */

Lisp_Object
make_vector (EMACS_INT length, Lisp_Object init)
{
  int elt;
  Lisp_Object vector;
  Lisp_Vector *p;

  if (length < 0)
    length = XINT (wrong_type_argument (Qnatnump, make_int (length)));

  p = make_vector_internal (length);
  XSETVECTOR (vector, p);

#if 0
  /* Initialize big arrays full of 0's quickly, for what that's worth */
  {
    char *travesty = (char *) &init;
    for (i = 1; i < sizeof (Lisp_Object); i++)
    {
      if (travesty[i] != travesty[0])
        goto fill;
    }
    memset (vector_data (p), travesty[0], length * sizeof (Lisp_Object));
    return vector;
  }
 fill:
#endif
  for (elt = 0; elt < length; elt++)
    vector_data(p)[elt] = init;

  return vector;
}

DEFUN ("make-vector", Fmake_vector, 2, 2, 0, /*
Return a new vector of length LENGTH, with each element being INIT.
See also the function `vector'.
*/
       (length, init))
{
  CHECK_NATNUM (length);
  return make_vector (XINT (length), init);
}

DEFUN ("vector", Fvector, 0, MANY, 0, /*
Return a newly created vector with specified arguments as elements.
Any number of arguments, even zero arguments, are allowed.
*/
       (int nargs, Lisp_Object *args))
{
  Lisp_Object vector;
  int elt;
  Lisp_Vector *p = make_vector_internal (nargs);

  for (elt = 0; elt < nargs; elt++)
    vector_data(p)[elt] = args[elt];

  XSETVECTOR (vector, p);
  return vector;
}

Lisp_Object
vector1 (Lisp_Object obj0)
{
  return Fvector (1, &obj0);
}

Lisp_Object
vector2 (Lisp_Object obj0, Lisp_Object obj1)
{
  Lisp_Object args[2];
  args[0] = obj0;
  args[1] = obj1;
  return Fvector (2, args);
}

Lisp_Object
vector3 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2)
{
  Lisp_Object args[3];
  args[0] = obj0;
  args[1] = obj1;
  args[2] = obj2;
  return Fvector (3, args);
}

#if 0 /* currently unused */

Lisp_Object
vector4 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2,
	 Lisp_Object obj3)
{
  Lisp_Object args[4];
  args[0] = obj0;
  args[1] = obj1;
  args[2] = obj2;
  args[3] = obj3;
  return Fvector (4, args);
}

Lisp_Object
vector5 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2,
	 Lisp_Object obj3, Lisp_Object obj4)
{
  Lisp_Object args[5];
  args[0] = obj0;
  args[1] = obj1;
  args[2] = obj2;
  args[3] = obj3;
  args[4] = obj4;
  return Fvector (5, args);
}

Lisp_Object
vector6 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2,
	 Lisp_Object obj3, Lisp_Object obj4, Lisp_Object obj5)
{
  Lisp_Object args[6];
  args[0] = obj0;
  args[1] = obj1;
  args[2] = obj2;
  args[3] = obj3;
  args[4] = obj4;
  args[5] = obj5;
  return Fvector (6, args);
}

Lisp_Object
vector7 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2,
	 Lisp_Object obj3, Lisp_Object obj4, Lisp_Object obj5,
	 Lisp_Object obj6)
{
  Lisp_Object args[7];
  args[0] = obj0;
  args[1] = obj1;
  args[2] = obj2;
  args[3] = obj3;
  args[4] = obj4;
  args[5] = obj5;
  args[6] = obj6;
  return Fvector (7, args);
}

Lisp_Object
vector8 (Lisp_Object obj0, Lisp_Object obj1, Lisp_Object obj2,
	 Lisp_Object obj3, Lisp_Object obj4, Lisp_Object obj5,
	 Lisp_Object obj6, Lisp_Object obj7)
{
  Lisp_Object args[8];
  args[0] = obj0;
  args[1] = obj1;
  args[2] = obj2;
  args[3] = obj3;
  args[4] = obj4;
  args[5] = obj5;
  args[6] = obj6;
  args[7] = obj7;
  return Fvector (8, args);
}
#endif /* unused */

/************************************************************************/
/*			 Bit Vector allocation				*/
/************************************************************************/

static Lisp_Object all_bit_vectors;

/* #### should allocate `small' bit vectors from a frob-block */
static struct Lisp_Bit_Vector *
make_bit_vector_internal (size_t sizei)
{
  size_t sizem =
    offsetof (Lisp_Bit_Vector, bits[BIT_VECTOR_LONG_STORAGE (sizei)]);
  Lisp_Bit_Vector *p = (Lisp_Bit_Vector *) allocate_lisp_storage (sizem);
  set_lheader_implementation (&(p->lheader), lrecord_bit_vector);

  INCREMENT_CONS_COUNTER (sizem, "bit-vector");

  bit_vector_length (p) = sizei;
  bit_vector_next   (p) = all_bit_vectors;
  /* make sure the extra bits in the last long are 0; the calling
     functions might not set them. */
  p->bits[BIT_VECTOR_LONG_STORAGE (sizei) - 1] = 0;
  XSETBIT_VECTOR (all_bit_vectors, p);
  return p;
}

Lisp_Object
make_bit_vector (EMACS_INT length, Lisp_Object init)
{
  Lisp_Object bit_vector;
  struct Lisp_Bit_Vector *p;
  EMACS_INT num_longs;

  CHECK_BIT (init);

  num_longs = BIT_VECTOR_LONG_STORAGE (length);
  p = make_bit_vector_internal (length);
  XSETBIT_VECTOR (bit_vector, p);

  if (ZEROP (init))
    memset (p->bits, 0, num_longs * sizeof (long));
  else
    {
      EMACS_INT bits_in_last = length & (LONGBITS_POWER_OF_2 - 1);
      memset (p->bits, ~0, num_longs * sizeof (long));
      /* But we have to make sure that the unused bits in the
	 last integer are 0, so that equal/hash is easy. */
      if (bits_in_last)
	p->bits[num_longs - 1] &= (1 << bits_in_last) - 1;
    }

  return bit_vector;
}

Lisp_Object
make_bit_vector_from_byte_vector (unsigned char *bytevec, EMACS_INT length)
{
  Lisp_Object bit_vector;
  struct Lisp_Bit_Vector *p;
  int i;

  if (length < 0)
    length = XINT (wrong_type_argument (Qnatnump, make_int (length)));

  p = make_bit_vector_internal (length);
  XSETBIT_VECTOR (bit_vector, p);

  for (i = 0; i < length; i++)
    set_bit_vector_bit (p, i, bytevec[i]);

  return bit_vector;
}

DEFUN ("make-bit-vector", Fmake_bit_vector, 2, 2, 0, /*
Return a new bit vector of length LENGTH. with each bit being INIT.
Each element is set to INIT.  See also the function `bit-vector'.
*/
       (length, init))
{
  CONCHECK_NATNUM (length);

  return make_bit_vector (XINT (length), init);
}

DEFUN ("bit-vector", Fbit_vector, 0, MANY, 0, /*
Return a newly created bit vector with specified arguments as elements.
Any number of arguments, even zero arguments, are allowed.
*/
       (int nargs, Lisp_Object *args))
{
  Lisp_Object bit_vector;
  int elt;
  struct Lisp_Bit_Vector *p;

  for (elt = 0; elt < nargs; elt++)
    CHECK_BIT (args[elt]);

  p = make_bit_vector_internal (nargs);

  for (elt = 0; elt < nargs; elt++)
    set_bit_vector_bit (p, elt, !ZEROP (args[elt]));

  XSETBIT_VECTOR (bit_vector, p);
  return bit_vector;
}


/************************************************************************/
/*		     Compiled-function allocation			*/
/************************************************************************/

DECLARE_FIXED_TYPE_ALLOC (compiled_function, Lisp_Compiled_Function);
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_compiled_function 1000

static Lisp_Object
make_compiled_function (int make_pure)
{
  Lisp_Compiled_Function *f;
  Lisp_Object fun;
  size_t size = sizeof (Lisp_Compiled_Function);

  if (make_pure && check_purespace (size))
    {
      f = (Lisp_Compiled_Function *) (PUREBEG + pure_bytes_used);
      set_lheader_implementation (&(f->lheader), lrecord_compiled_function);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
      f->lheader.pure = 1;
#endif
      pure_bytes_used += size;
      bump_purestat (&purestat_function, size);
    }
  else
    {
      ALLOCATE_FIXED_TYPE (compiled_function, Lisp_Compiled_Function, f);
      set_lheader_implementation (&(f->lheader), lrecord_compiled_function);
    }
  f->stack_depth = 0;
  f->specpdl_depth = 0;
  f->flags.documentationp = 0;
  f->flags.interactivep = 0;
  f->flags.domainp = 0; /* I18N3 */
  f->instructions = Qzero;
  f->constants = Qzero;
  f->arglist = Qnil;
  f->doc_and_interactive = Qnil;
#ifdef COMPILED_FUNCTION_ANNOTATION_HACK
  f->annotated = Qnil;
#endif
  XSETCOMPILED_FUNCTION (fun, f);
  return fun;
}

DEFUN ("make-byte-code", Fmake_byte_code, 4, MANY, 0, /*
Return a new compiled-function object.
Usage: (arglist instructions constants stack-depth
	&optional doc-string interactive)
Note that, unlike all other emacs-lisp functions, calling this with five
arguments is NOT the same as calling it with six arguments, the last of
which is nil.  If the INTERACTIVE arg is specified as nil, then that means
that this function was defined with `(interactive)'.  If the arg is not
specified, then that means the function is not interactive.
This is terrible behavior which is retained for compatibility with old
`.elc' files which expect these semantics.
*/
       (int nargs, Lisp_Object *args))
{
/* In a non-insane world this function would have this arglist...
   (arglist instructions constants stack_depth &optional doc_string interactive)
 */
  Lisp_Object fun = make_compiled_function (purify_flag);
  Lisp_Compiled_Function *f = XCOMPILED_FUNCTION (fun);

  Lisp_Object arglist      = args[0];
  Lisp_Object instructions = args[1];
  Lisp_Object constants    = args[2];
  Lisp_Object stack_depth  = args[3];
  Lisp_Object doc_string   = (nargs > 4) ? args[4] : Qnil;
  Lisp_Object interactive  = (nargs > 5) ? args[5] : Qunbound;

  /* Don't purecopy the doc references in instructions because it's
     wasteful; they will get fixed up later.

     #### If something goes wrong and they don't get fixed up,
     we're screwed, because pure stuff isn't marked and thus the
     cons references won't be marked and will get reused.

     Note: there will be a window after the byte code is created and
     before the doc references are fixed up in which there will be
     impure objects inside a pure object, which apparently won't
     get marked, leading to trouble.  But during that entire window,
     the objects are sitting on Vload_force_doc_string_list, which
     is staticpro'd, so we're OK. */
  Lisp_Object (*cons) (Lisp_Object, Lisp_Object)
    = purify_flag ? pure_cons : Fcons;

  if (nargs < 4 || nargs > 6)
    return Fsignal (Qwrong_number_of_arguments,
		    list2 (intern ("make-byte-code"), make_int (nargs)));

  /* Check for valid formal parameter list now, to allow us to use
     SPECBIND_FAST_UNSAFE() later in funcall_compiled_function(). */
  {
    Lisp_Object symbol, tail;
    EXTERNAL_LIST_LOOP_3 (symbol, arglist, tail)
      {
	CHECK_SYMBOL (symbol);
	if (EQ (symbol, Qt)   ||
	    EQ (symbol, Qnil) ||
	    SYMBOL_IS_KEYWORD (symbol))
	  signal_simple_error_2
	    ("Invalid constant symbol in formal parameter list",
	     symbol, arglist);
      }
  }
  f->arglist = arglist;

  /* `instructions' is a string or a cons (string . int) for a
     lazy-loaded function. */
  if (CONSP (instructions))
    {
      CHECK_STRING (XCAR (instructions));
      CHECK_INT (XCDR (instructions));
    }
  else
    {
      CHECK_STRING (instructions);
    }
  f->instructions = instructions;

  if (!NILP (constants))
    CHECK_VECTOR (constants);
  f->constants = constants;

  CHECK_NATNUM (stack_depth);
  f->stack_depth  = XINT (stack_depth);

#ifdef COMPILED_FUNCTION_ANNOTATION_HACK
  if (!NILP (Vcurrent_compiled_function_annotation))
    f->annotated = Fpurecopy (Vcurrent_compiled_function_annotation);
  else if (!NILP (Vload_file_name_internal_the_purecopy))
    f->annotated = Vload_file_name_internal_the_purecopy;
  else if (!NILP (Vload_file_name_internal))
    {
      struct gcpro gcpro1;
      GCPRO1 (fun);		/* don't let fun get reaped */
      Vload_file_name_internal_the_purecopy =
	Fpurecopy (Ffile_name_nondirectory (Vload_file_name_internal));
      f->annotated = Vload_file_name_internal_the_purecopy;
      UNGCPRO;
    }
#endif /* COMPILED_FUNCTION_ANNOTATION_HACK */

  /* doc_string may be nil, string, int, or a cons (string . int).
     interactive may be list or string (or unbound). */
  f->doc_and_interactive = Qunbound;
#ifdef I18N3
  if ((f->flags.domainp = !NILP (Vfile_domain)) != 0)
    f->doc_and_interactive = Vfile_domain;
#endif
  if ((f->flags.interactivep = !UNBOUNDP (interactive)) != 0)
    {
      if (purify_flag)
	{
	  interactive = Fpurecopy (interactive);
	  if (STRINGP (interactive))
	    bump_purestat (&purestat_string_interactive,
			   pure_sizeof (interactive));
	}
      f->doc_and_interactive
	= (UNBOUNDP (f->doc_and_interactive) ? interactive :
	   cons (interactive, f->doc_and_interactive));
    }
  if ((f->flags.documentationp = !NILP (doc_string)) != 0)
    {
      if (purify_flag)
	{
	  doc_string = Fpurecopy (doc_string);
	  if (STRINGP (doc_string))
	    /* These should have been snagged by make-docfile... */
	    bump_purestat (&purestat_string_documentation,
			   pure_sizeof (doc_string));
	}
      f->doc_and_interactive
	= (UNBOUNDP (f->doc_and_interactive) ? doc_string :
	   cons (doc_string, f->doc_and_interactive));
    }
  if (UNBOUNDP (f->doc_and_interactive))
    f->doc_and_interactive = Qnil;

  if (purify_flag)
    {

      if (!purified (f->arglist))
	f->arglist = Fpurecopy (f->arglist);

      /* Statistics are kept differently for the constants */
      if (!purified (f->constants))
	{
#ifdef PURESTAT
	  int old = purecopying_function_constants;
	  purecopying_function_constants = 1;
	  f->constants = Fpurecopy (f->constants);
	  bump_purestat (&purestat_vector_constants,
			 pure_sizeof (f->constants));
	  purecopying_function_constants = old;
#else
	  f->constants = Fpurecopy (f->constants);
#endif /* PURESTAT */
	}

      optimize_compiled_function (fun);

      bump_purestat (&purestat_opaque_instructions,
		     pure_sizeof (f->instructions));
    }

  return fun;
}


/************************************************************************/
/*			    Symbol allocation				*/
/************************************************************************/

DECLARE_FIXED_TYPE_ALLOC (symbol, struct Lisp_Symbol);
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_symbol 1000

DEFUN ("make-symbol", Fmake_symbol, 1, 1, 0, /*
Return a newly allocated uninterned symbol whose name is NAME.
Its value and function definition are void, and its property list is nil.
*/
       (name))
{
  Lisp_Object val;
  struct Lisp_Symbol *p;

  CHECK_STRING (name);

  ALLOCATE_FIXED_TYPE (symbol, struct Lisp_Symbol, p);
#ifdef LRECORD_SYMBOL
  set_lheader_implementation (&(p->lheader), lrecord_symbol);
#endif
  p->name     = XSTRING (name);
  p->plist    = Qnil;
  p->value    = Qunbound;
  p->function = Qunbound;
  p->obarray  = Qnil;
  symbol_next (p) = 0;
  XSETSYMBOL (val, p);
  return val;
}


/************************************************************************/
/*			   Extent allocation				*/
/************************************************************************/

DECLARE_FIXED_TYPE_ALLOC (extent, struct extent);
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_extent 1000

struct extent *
allocate_extent (void)
{
  struct extent *e;

  ALLOCATE_FIXED_TYPE (extent, struct extent, e);
  set_lheader_implementation (&(e->lheader), lrecord_extent);
  extent_object (e) = Qnil;
  set_extent_start (e, -1);
  set_extent_end (e, -1);
  e->plist = Qnil;

  xzero (e->flags);

  extent_face (e) = Qnil;
  e->flags.end_open = 1;  /* default is for endpoints to behave like markers */
  e->flags.detachable = 1;

  return e;
}


/************************************************************************/
/*			   Event allocation				*/
/************************************************************************/

DECLARE_FIXED_TYPE_ALLOC (event, struct Lisp_Event);
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_event 1000

Lisp_Object
allocate_event (void)
{
  Lisp_Object val;
  struct Lisp_Event *e;

  ALLOCATE_FIXED_TYPE (event, struct Lisp_Event, e);
  set_lheader_implementation (&(e->lheader), lrecord_event);

  XSETEVENT (val, e);
  return val;
}


/************************************************************************/
/*			 Marker allocation				*/
/************************************************************************/

DECLARE_FIXED_TYPE_ALLOC (marker, struct Lisp_Marker);
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_marker 1000

DEFUN ("make-marker", Fmake_marker, 0, 0, 0, /*
Return a new marker which does not point at any place.
*/
       ())
{
  Lisp_Object val;
  struct Lisp_Marker *p;

  ALLOCATE_FIXED_TYPE (marker, struct Lisp_Marker, p);
  set_lheader_implementation (&(p->lheader), lrecord_marker);
  p->buffer = 0;
  p->memind = 0;
  marker_next (p) = 0;
  marker_prev (p) = 0;
  p->insertion_type = 0;
  XSETMARKER (val, p);
  return val;
}

Lisp_Object
noseeum_make_marker (void)
{
  Lisp_Object val;
  struct Lisp_Marker *p;

  NOSEEUM_ALLOCATE_FIXED_TYPE (marker, struct Lisp_Marker, p);
  set_lheader_implementation (&(p->lheader), lrecord_marker);
  p->buffer = 0;
  p->memind = 0;
  marker_next (p) = 0;
  marker_prev (p) = 0;
  p->insertion_type = 0;
  XSETMARKER (val, p);
  return val;
}


/************************************************************************/
/*			  String allocation				*/
/************************************************************************/

/* The data for "short" strings generally resides inside of structs of type
   string_chars_block. The Lisp_String structure is allocated just like any
   other Lisp object (except for vectors), and these are freelisted when
   they get garbage collected. The data for short strings get compacted,
   but the data for large strings do not.

   Previously Lisp_String structures were relocated, but this caused a lot
   of bus-errors because the C code didn't include enough GCPRO's for
   strings (since EVERY REFERENCE to a short string needed to be GCPRO'd so
   that the reference would get relocated).

   This new method makes things somewhat bigger, but it is MUCH safer.  */

DECLARE_FIXED_TYPE_ALLOC (string, struct Lisp_String);
/* strings are used and freed quite often */
/* #define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_string 10000 */
#define MINIMUM_ALLOWED_FIXED_TYPE_CELLS_string 1000

#ifdef LRECORD_STRING
static Lisp_Object
mark_string (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_String *ptr = XSTRING (obj);

  if (GC_CONSP (ptr->plist) && GC_EXTENT_INFOP (XCAR (ptr->plist)))
    flush_cached_extent_info (XCAR (ptr->plist));
  return ptr->plist;
}

static int
string_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Bytecount len;
  return (((len = XSTRING_LENGTH (obj1)) == XSTRING_LENGTH (obj2)) &&
	  !memcmp (XSTRING_DATA (obj1), XSTRING_DATA (obj2), len));
}

DEFINE_BASIC_LRECORD_IMPLEMENTATION ("string", string,
				     mark_string, print_string,
				     /*
				      * No `finalize', or `hash' methods.
				      * internal_hash already knows how
				      * to hash strings and finalization
				      * is done with the
				      * ADDITIONAL_FREE_string macro,
				      * which is the standard way to do
				      * finalization when using
				      * SWEEP_FIXED_TYPE_BLOCK().
				      */
				     0, string_equal, 0,
				     struct Lisp_String);
#endif /* LRECORD_STRING */

/* String blocks contain this many useful bytes. */
#define STRING_CHARS_BLOCK_SIZE					\
((Bytecount) (8192 - MALLOC_OVERHEAD -				\
	      ((2 * sizeof (struct string_chars_block *))	\
	       + sizeof (EMACS_INT))))
/* Block header for small strings. */
struct string_chars_block
{
  EMACS_INT pos;
  struct string_chars_block *next;
  struct string_chars_block *prev;
  /* Contents of string_chars_block->string_chars are interleaved
     string_chars structures (see below) and the actual string data */
  unsigned char string_chars[STRING_CHARS_BLOCK_SIZE];
};

struct string_chars_block *first_string_chars_block;
struct string_chars_block *current_string_chars_block;

/* If SIZE is the length of a string, this returns how many bytes
 *  the string occupies in string_chars_block->string_chars
 *  (including alignment padding).
 */
#define STRING_FULLSIZE(s) \
   ALIGN_SIZE (((s) + 1 + sizeof (struct Lisp_String *)),\
               ALIGNOF (struct Lisp_String *))

#define BIG_STRING_FULLSIZE_P(fullsize) ((fullsize) >= STRING_CHARS_BLOCK_SIZE)
#define BIG_STRING_SIZE_P(size) (BIG_STRING_FULLSIZE_P (STRING_FULLSIZE(size)))

#define CHARS_TO_STRING_CHAR(x) \
  ((struct string_chars *) \
   (((char *) (x)) - (slot_offset (struct string_chars, chars[0]))))


struct string_chars
{
  struct Lisp_String *string;
  unsigned char chars[1];
};

struct unused_string_chars
{
  struct Lisp_String *string;
  EMACS_INT fullsize;
};

static void
init_string_chars_alloc (void)
{
  first_string_chars_block = xnew (struct string_chars_block);
  first_string_chars_block->prev = 0;
  first_string_chars_block->next = 0;
  first_string_chars_block->pos = 0;
  current_string_chars_block = first_string_chars_block;
}

static struct string_chars *
allocate_string_chars_struct (struct Lisp_String *string_it_goes_with,
			      EMACS_INT fullsize)
{
  struct string_chars *s_chars;

  /* Allocate the string's actual data */
  if (BIG_STRING_FULLSIZE_P (fullsize))
    {
      s_chars = (struct string_chars *) xmalloc (fullsize);
    }
  else if (fullsize <=
           (countof (current_string_chars_block->string_chars)
            - current_string_chars_block->pos))
    {
      /* This string can fit in the current string chars block */
      s_chars = (struct string_chars *)
	(current_string_chars_block->string_chars
	 + current_string_chars_block->pos);
      current_string_chars_block->pos += fullsize;
    }
  else
    {
      /* Make a new current string chars block */
      struct string_chars_block *new = xnew (struct string_chars_block);

      current_string_chars_block->next = new;
      new->prev = current_string_chars_block;
      new->next = 0;
      current_string_chars_block = new;
      new->pos = fullsize;
      s_chars = (struct string_chars *)
	current_string_chars_block->string_chars;
    }

  s_chars->string = string_it_goes_with;

  INCREMENT_CONS_COUNTER (fullsize, "string chars");

  return s_chars;
}

Lisp_Object
make_uninit_string (Bytecount length)
{
  struct Lisp_String *s;
  struct string_chars *s_chars;
  EMACS_INT fullsize = STRING_FULLSIZE (length);
  Lisp_Object val;

  if ((length < 0) || (fullsize <= 0))
    abort ();

  /* Allocate the string header */
  ALLOCATE_FIXED_TYPE (string, struct Lisp_String, s);
#ifdef LRECORD_STRING
  set_lheader_implementation (&(s->lheader), lrecord_string);
#endif

  s_chars = allocate_string_chars_struct (s, fullsize);

  set_string_data (s, &(s_chars->chars[0]));
  set_string_length (s, length);
  s->plist = Qnil;

  set_string_byte (s, length, 0);

  XSETSTRING (val, s);
  return val;
}

#ifdef VERIFY_STRING_CHARS_INTEGRITY
static void verify_string_chars_integrity (void);
#endif

/* Resize the string S so that DELTA bytes can be inserted starting
   at POS.  If DELTA < 0, it means deletion starting at POS.  If
   POS < 0, resize the string but don't copy any characters.  Use
   this if you're planning on completely overwriting the string.
*/

void
resize_string (struct Lisp_String *s, Bytecount pos, Bytecount delta)
{
#ifdef VERIFY_STRING_CHARS_INTEGRITY
  verify_string_chars_integrity ();
#endif

#ifdef ERROR_CHECK_BUFPOS
  if (pos >= 0)
    {
      assert (pos <= string_length (s));
      if (delta < 0)
	assert (pos + (-delta) <= string_length (s));
    }
  else
    {
      if (delta < 0)
	assert ((-delta) <= string_length (s));
    }
#endif /* ERROR_CHECK_BUFPOS */

  if (pos >= 0 && delta < 0)
  /* If DELTA < 0, the functions below will delete the characters
     before POS.  We want to delete characters *after* POS, however,
     so convert this to the appropriate form. */
    pos += -delta;

  if (delta == 0)
    /* simplest case: no size change. */
    return;
  else
    {
      Bytecount oldfullsize = STRING_FULLSIZE (string_length (s));
      Bytecount newfullsize = STRING_FULLSIZE (string_length (s) + delta);

      if (oldfullsize == newfullsize)
	{
	  /* next simplest case; size change but the necessary
	     allocation size won't change (up or down; code somewhere
	     depends on there not being any unused allocation space,
	     modulo any alignment constraints). */
	  if (pos >= 0)
	    {
	      Bufbyte *addroff = pos + string_data (s);

	      memmove (addroff + delta, addroff,
		       /* +1 due to zero-termination. */
		       string_length (s) + 1 - pos);
	    }
	}
      else if (BIG_STRING_FULLSIZE_P (oldfullsize) &&
	       BIG_STRING_FULLSIZE_P (newfullsize))
	{
	  /* next simplest case; the string is big enough to be malloc()ed
	     itself, so we just realloc.

	     It's important not to let the string get below the threshold
	     for making big strings and still remain malloc()ed; if that
	     were the case, repeated calls to this function on the same
	     string could result in memory leakage. */
	  set_string_data (s, (Bufbyte *) xrealloc (string_data (s),
						    newfullsize));
	  if (pos >= 0)
	    {
	      Bufbyte *addroff = pos + string_data (s);

	      memmove (addroff + delta, addroff,
		       /* +1 due to zero-termination. */
		       string_length (s) + 1 - pos);
	    }
	}
      else
	{
	  /* worst case.  We make a new string_chars struct and copy
	     the string's data into it, inserting/deleting the delta
	     in the process.  The old string data will either get
	     freed by us (if it was malloc()ed) or will be reclaimed
	     in the normal course of garbage collection. */
	  struct string_chars *s_chars =
	    allocate_string_chars_struct (s, newfullsize);
	  Bufbyte *new_addr = &(s_chars->chars[0]);
	  Bufbyte *old_addr = string_data (s);
	  if (pos >= 0)
	    {
	      memcpy (new_addr, old_addr, pos);
	      memcpy (new_addr + pos + delta, old_addr + pos,
		      string_length (s) + 1 - pos);
	    }
	  set_string_data (s, new_addr);
	  if (BIG_STRING_FULLSIZE_P (oldfullsize))
	    xfree (old_addr);
	  else
	    {
	      /* We need to mark this chunk of the string_chars_block
		 as unused so that compact_string_chars() doesn't
		 freak. */
	      struct string_chars *old_s_chars =
		(struct string_chars *) ((char *) old_addr -
					 sizeof (struct Lisp_String *));
	      /* Sanity check to make sure we aren't hosed by strange
	         alignment/padding. */
	      assert (old_s_chars->string == s);
	      MARK_STRUCT_AS_FREE (old_s_chars);
	      ((struct unused_string_chars *) old_s_chars)->fullsize =
		oldfullsize;
	    }
	}

      set_string_length (s, string_length (s) + delta);
      /* If pos < 0, the string won't be zero-terminated.
	 Terminate now just to make sure. */
      string_data (s)[string_length (s)] = '\0';

      if (pos >= 0)
	{
	  Lisp_Object string;

	  XSETSTRING (string, s);
	  /* We also have to adjust all of the extent indices after the
	     place we did the change.  We say "pos - 1" because
	     adjust_extents() is exclusive of the starting position
	     passed to it. */
	  adjust_extents (string, pos - 1, string_length (s),
			  delta);
	}
    }

#ifdef VERIFY_STRING_CHARS_INTEGRITY
  verify_string_chars_integrity ();
#endif
}

#ifdef MULE

void
set_string_char (struct Lisp_String *s, Charcount i, Emchar c)
{
  Bytecount oldlen, newlen;
  Bufbyte newstr[MAX_EMCHAR_LEN];
  Bytecount bytoff = charcount_to_bytecount (string_data (s), i);

  oldlen = charcount_to_bytecount (string_data (s) + bytoff, 1);
  newlen = set_charptr_emchar (newstr, c);

  if (oldlen != newlen)
    resize_string (s, bytoff, newlen - oldlen);
  /* Remember, string_data (s) might have changed so we can't cache it. */
  memcpy (string_data (s) + bytoff, newstr, newlen);
}

#endif /* MULE */

DEFUN ("make-string", Fmake_string, 2, 2, 0, /*
Return a new string of length LENGTH, with each character being INIT.
LENGTH must be an integer and INIT must be a character.
*/
       (length, init))
{
  CHECK_NATNUM (length);
  CHECK_CHAR_COERCE_INT (init);
  {
    Bufbyte init_str[MAX_EMCHAR_LEN];
    int len = set_charptr_emchar (init_str, XCHAR (init));
    Lisp_Object val = make_uninit_string (len * XINT (length));

    if (len == 1)
      /* Optimize the single-byte case */
      memset (XSTRING_DATA (val), XCHAR (init), XSTRING_LENGTH (val));
    else
      {
	int i;
	Bufbyte *ptr = XSTRING_DATA (val);

	for (i = XINT (length); i; i--)
	  {
	    Bufbyte *init_ptr = init_str;
	    switch (len)
	      {
	      case 4: *ptr++ = *init_ptr++;
	      case 3: *ptr++ = *init_ptr++;
	      case 2: *ptr++ = *init_ptr++;
	      case 1: *ptr++ = *init_ptr++;
	      }
	  }
      }
    return val;
  }
}

DEFUN ("string", Fstring, 0, MANY, 0, /*
Concatenate all the argument characters and make the result a string.
*/
       (int nargs, Lisp_Object *args))
{
  Bufbyte *storage = alloca_array (Bufbyte, nargs * MAX_EMCHAR_LEN);
  Bufbyte *p = storage;

  for (; nargs; nargs--, args++)
    {
      Lisp_Object lisp_char = *args;
      CHECK_CHAR_COERCE_INT (lisp_char);
      p += set_charptr_emchar (p, XCHAR (lisp_char));
    }
  return make_string (storage, p - storage);
}

/* Take some raw memory, which MUST already be in internal format,
   and package it up into a Lisp string. */
Lisp_Object
make_string (CONST Bufbyte *contents, Bytecount length)
{
  Lisp_Object val;

  /* Make sure we find out about bad make_string's when they happen */
#if defined (ERROR_CHECK_BUFPOS) && defined (MULE)
  bytecount_to_charcount (contents, length); /* Just for the assertions */
#endif

  val = make_uninit_string (length);
  memcpy (XSTRING_DATA (val), contents, length);
  return val;
}

/* Take some raw memory, encoded in some external data format,
   and convert it into a Lisp string. */
Lisp_Object
make_ext_string (CONST Extbyte *contents, EMACS_INT length,
		 enum external_data_format fmt)
{
  Bufbyte *intstr;
  Bytecount intlen;

  GET_CHARPTR_INT_DATA_ALLOCA (contents, length, fmt, intstr, intlen);
  return make_string (intstr, intlen);
}

Lisp_Object
build_string (CONST char *str)
{
  /* Some strlen's crash and burn if passed null. */
  return make_string ((CONST Bufbyte *) str, (str ? strlen(str) : 0));
}

Lisp_Object
build_ext_string (CONST char *str, enum external_data_format fmt)
{
  /* Some strlen's crash and burn if passed null. */
  return make_ext_string ((CONST Extbyte *) str, (str ? strlen(str) : 0), fmt);
}

Lisp_Object
build_translated_string (CONST char *str)
{
  return build_string (GETTEXT (str));
}


/************************************************************************/
/*                           lcrecord lists                             */
/************************************************************************/

/* Lcrecord lists are used to manage the allocation of particular
   sorts of lcrecords, to avoid calling alloc_lcrecord() (and thus
   malloc() and garbage-collection junk) as much as possible.
   It is similar to the Blocktype class.

   It works like this:

   1) Create an lcrecord-list object using make_lcrecord_list().
      This is often done at initialization.  Remember to staticpro
      this object!  The arguments to make_lcrecord_list() are the
      same as would be passed to alloc_lcrecord().
   2) Instead of calling alloc_lcrecord(), call allocate_managed_lcrecord()
      and pass the lcrecord-list earlier created.
   3) When done with the lcrecord, call free_managed_lcrecord().
      The standard freeing caveats apply: ** make sure there are no
      pointers to the object anywhere! **
   4) Calling free_managed_lcrecord() is just like kissing the
      lcrecord goodbye as if it were garbage-collected.  This means:
      -- the contents of the freed lcrecord are undefined, and the
         contents of something produced by allocate_managed_lcrecord()
	 are undefined, just like for alloc_lcrecord().
      -- the mark method for the lcrecord's type will *NEVER* be called
         on freed lcrecords.
      -- the finalize method for the lcrecord's type will be called
         at the time that free_managed_lcrecord() is called.

   */

static Lisp_Object
mark_lcrecord_list (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct lcrecord_list *list = XLCRECORD_LIST (obj);
  Lisp_Object chain = list->free;

  while (!NILP (chain))
    {
      struct lrecord_header *lheader = XRECORD_LHEADER (chain);
      struct free_lcrecord_header *free_header =
	(struct free_lcrecord_header *) lheader;

#ifdef ERROR_CHECK_GC
      CONST struct lrecord_implementation *implementation
	= LHEADER_IMPLEMENTATION(lheader);

      /* There should be no other pointers to the free list. */
      assert (!MARKED_RECORD_HEADER_P (lheader));
      /* Only lcrecords should be here. */
      assert (!implementation->basic_p);
      /* Only free lcrecords should be here. */
      assert (free_header->lcheader.free);
      /* The type of the lcrecord must be right. */
      assert (implementation == list->implementation);
      /* So must the size. */
      assert (implementation->static_size == 0
	      || implementation->static_size == list->size);
#endif /* ERROR_CHECK_GC */

      MARK_RECORD_HEADER (lheader);
      chain = free_header->chain;
    }

  return Qnil;
}

DEFINE_LRECORD_IMPLEMENTATION ("lcrecord-list", lcrecord_list,
			       mark_lcrecord_list, internal_object_printer,
			       0, 0, 0, struct lcrecord_list);
Lisp_Object
make_lcrecord_list (size_t size,
		    CONST struct lrecord_implementation *implementation)
{
  struct lcrecord_list *p = alloc_lcrecord_type (struct lcrecord_list,
						 lrecord_lcrecord_list);
  Lisp_Object val;

  p->implementation = implementation;
  p->size = size;
  p->free = Qnil;
  XSETLCRECORD_LIST (val, p);
  return val;
}

Lisp_Object
allocate_managed_lcrecord (Lisp_Object lcrecord_list)
{
  struct lcrecord_list *list = XLCRECORD_LIST (lcrecord_list);
  if (!NILP (list->free))
    {
      Lisp_Object val = list->free;
      struct free_lcrecord_header *free_header =
	(struct free_lcrecord_header *) XPNTR (val);

#ifdef ERROR_CHECK_GC
      struct lrecord_header *lheader =
	(struct lrecord_header *) free_header;
      CONST struct lrecord_implementation *implementation
	= LHEADER_IMPLEMENTATION (lheader);

      /* There should be no other pointers to the free list. */
      assert (!MARKED_RECORD_HEADER_P (lheader));
      /* Only lcrecords should be here. */
      assert (!implementation->basic_p);
      /* Only free lcrecords should be here. */
      assert (free_header->lcheader.free);
      /* The type of the lcrecord must be right. */
      assert (implementation == list->implementation);
      /* So must the size. */
      assert (implementation->static_size == 0
	      || implementation->static_size == list->size);
#endif /* ERROR_CHECK_GC */
      list->free = free_header->chain;
      free_header->lcheader.free = 0;
      return val;
    }
  else
    {
      Lisp_Object val;

      XSETOBJ (val, Lisp_Type_Record,
	       alloc_lcrecord (list->size, list->implementation));
      return val;
    }
}

void
free_managed_lcrecord (Lisp_Object lcrecord_list, Lisp_Object lcrecord)
{
  struct lcrecord_list *list = XLCRECORD_LIST (lcrecord_list);
  struct free_lcrecord_header *free_header =
    (struct free_lcrecord_header *) XPNTR (lcrecord);
  struct lrecord_header *lheader =
    (struct lrecord_header *) free_header;
  CONST struct lrecord_implementation *implementation
    = LHEADER_IMPLEMENTATION (lheader);

#ifdef ERROR_CHECK_GC
  /* Make sure the size is correct.  This will catch, for example,
     putting a window configuration on the wrong free list. */
  if (implementation->size_in_bytes_method)
    assert (implementation->size_in_bytes_method (lheader) == list->size);
  else
    assert (implementation->static_size == list->size);
#endif /* ERROR_CHECK_GC */

  if (implementation->finalizer)
    implementation->finalizer (lheader, 0);
  free_header->chain = list->free;
  free_header->lcheader.free = 1;
  list->free = lcrecord;
}


/************************************************************************/
/*		   Purity of essence, peace on earth			*/
/************************************************************************/

static int symbols_initialized;

Lisp_Object
make_pure_string (CONST Bufbyte *data, Bytecount length,
		  Lisp_Object plist, int no_need_to_copy_data)
{
  Lisp_Object new;
  struct Lisp_String *s;
  size_t size = sizeof (struct Lisp_String) +
    (no_need_to_copy_data ? 0 : (length + 1)); /* + 1 for terminating 0 */
  size = ALIGN_SIZE (size, ALIGNOF (Lisp_Object));

  if (symbols_initialized && !pure_lossage)
    {
      /* Try to share some names.  Saves a few kbytes. */
      Lisp_Object tem = oblookup (Vobarray, data, length);
      if (SYMBOLP (tem))
	{
	  s = XSYMBOL (tem)->name;
	  if (!PURIFIED (s)) abort ();
	  XSETSTRING (new, s);
	  return new;
	}
    }

  if (!check_purespace (size))
    return make_string (data, length);

  s = (struct Lisp_String *) (PUREBEG + pure_bytes_used);
#ifdef LRECORD_STRING
  set_lheader_implementation (&(s->lheader), lrecord_string);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  s->lheader.pure = 1;
#endif
#endif
  set_string_length (s, length);
  if (no_need_to_copy_data)
    {
      set_string_data (s, (Bufbyte *) data);
    }
  else
    {
      set_string_data (s, (Bufbyte *) s + sizeof (struct Lisp_String));
      memcpy (string_data (s), data, length);
      set_string_byte (s, length, 0);
    }
  s->plist = Qnil;
  pure_bytes_used += size;

#ifdef PURESTAT
  bump_purestat (&purestat_string_all, size);
  if (purecopying_function_constants)
    bump_purestat (&purestat_string_other_function, size);
#endif /* PURESTAT */

  /* Do this after the official "completion" of the purecopying. */
  s->plist = Fpurecopy (plist);

  XSETSTRING (new, s);
  return new;
}


Lisp_Object
make_pure_pname (CONST Bufbyte *data, Bytecount length,
		 int no_need_to_copy_data)
{
  Lisp_Object name = make_pure_string (data, length, Qnil,
				       no_need_to_copy_data);
  bump_purestat (&purestat_string_pname, pure_sizeof (name));

  /* We've made (at least) Qnil now, and Vobarray will soon be set up. */
  symbols_initialized = 1;

  return name;
}


Lisp_Object
pure_cons (Lisp_Object car, Lisp_Object cdr)
{
  Lisp_Object new;
  struct Lisp_Cons *c;

  if (!check_purespace (sizeof (struct Lisp_Cons)))
    return Fcons (Fpurecopy (car), Fpurecopy (cdr));

  c = (struct Lisp_Cons *) (PUREBEG + pure_bytes_used);
#ifdef LRECORD_CONS
  set_lheader_implementation (&(c->lheader), lrecord_cons);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  c->lheader.pure = 1;
#endif
#endif
  pure_bytes_used += sizeof (struct Lisp_Cons);
  bump_purestat (&purestat_cons, sizeof (struct Lisp_Cons));

  c->car = Fpurecopy (car);
  c->cdr = Fpurecopy (cdr);
  XSETCONS (new, c);
  return new;
}

Lisp_Object
pure_list (int nargs, Lisp_Object *args)
{
  Lisp_Object val = Qnil;

  for (--nargs; nargs >= 0; nargs--)
    val = pure_cons (args[nargs], val);

  return val;
}

#ifdef LISP_FLOAT_TYPE

static Lisp_Object
make_pure_float (double num)
{
  struct Lisp_Float *f;
  Lisp_Object val;

  /* Make sure that PUREBEG + pure_bytes_used is aligned on at least a sizeof
     (double) boundary.  Some architectures (like the sparc) require
     this, and I suspect that floats are rare enough that it's no
     tragedy for those that don't. */
  {
#if defined (__GNUC__) && (__GNUC__ >= 2)
    /* In gcc, we can directly ask what the alignment constraints of a
       structure are, but in general, that's not possible...  Arrgh!!
     */
    int alignment = __alignof (struct Lisp_Float);
#else /* !GNUC */
    /* Best guess is to make the `double' slot be aligned to the size
       of double (which is probably 8 bytes).  This assumes that it's
       ok to align the beginning of the structure to the same boundary
       that the `double' slot in it is supposed to be aligned to; this
       should be ok because presumably there is padding in the layout
       of the struct to account for this.
     */
    int alignment = sizeof (float_data (f));
#endif /* !GNUC */
    char *p = ((char *) PUREBEG + pure_bytes_used);

    p = (char *) (((EMACS_UINT) p + alignment - 1) & - alignment);
    pure_bytes_used = p - (char *) PUREBEG;
  }

  if (!check_purespace (sizeof (struct Lisp_Float)))
    return make_float (num);

  f = (struct Lisp_Float *) (PUREBEG + pure_bytes_used);
  set_lheader_implementation (&(f->lheader), lrecord_float);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  f->lheader.pure = 1;
#endif
  pure_bytes_used += sizeof (struct Lisp_Float);
  bump_purestat (&purestat_float, sizeof (struct Lisp_Float));

  float_data (f) = num;
  XSETFLOAT (val, f);
  return val;
}

#endif /* LISP_FLOAT_TYPE */

Lisp_Object
make_pure_vector (size_t len, Lisp_Object init)
{
  Lisp_Object new;
  Lisp_Vector *v;
  size_t size = offsetof (Lisp_Vector, contents[len]);

  init = Fpurecopy (init);

  if (!check_purespace (size))
    return make_vector (len, init);

  v = (Lisp_Vector *) (PUREBEG + pure_bytes_used);
#ifdef LRECORD_VECTOR
  set_lheader_implementation (&(v->header.lheader), lrecord_vector);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  v->header.lheader.pure = 1;
#endif
#endif
  pure_bytes_used += size;
  bump_purestat (&purestat_vector_all, size);

  v->size = len;

  for (size = 0; size < len; size++)
    v->contents[size] = init;

  XSETVECTOR (new, v);
  return new;
}

#if 0
/* Presently unused */
void *
alloc_pure_lrecord (int size, struct lrecord_implementation *implementation)
{
  struct lrecord_header *header = (void *) (PUREBEG + pure_bytes_used);

  if (pure_bytes_used + size > get_PURESIZE())
    pure_storage_exhausted ();

  set_lheader_implementation (header, implementation);
  header->next = 0;
  return header;
}
#endif /* unused */



DEFUN ("purecopy", Fpurecopy, 1, 1, 0, /*
Make a copy of OBJECT in pure storage.
Recursively copies contents of vectors and cons cells.
Does not copy symbols.
*/
       (obj))
{
  if (!purify_flag)
    {
      return obj;
    }
  else if (!POINTER_TYPE_P (XTYPE (obj))
	   || PURIFIED (XPNTR (obj))
	   /* happens when bootstrapping Qnil */
	   || EQ (obj, Qnull_pointer))
    {
      return obj;
    }
  /* Order of subsequent tests determined via profiling. */
  else if (SYMBOLP (obj))
    {
      /* Symbols can't be made pure (and thus read-only), because
	 assigning to their function, value or plist slots would
	 produced a SEGV in the dumped XEmacs.  So we previously would
	 just return the symbol unchanged.

	 But purified aggregate objects like lists and vectors can
	 contain uninterned symbols.  If there are no other non-pure
	 references to the symbol, then the symbol is not protected
	 from garbage collection because the collector does not mark
	 the contents of purified objects.  So to protect the symbols,
	 an impure reference has to be kept for each uninterned symbol
	 that is referenced by a pure object.  All such symbols are
	 stored in the hash table pointed to by
	 Vpure_uninterned_symbol_table, which is itself
	 staticpro'd. */
      if (NILP (XSYMBOL (obj)->obarray))
	Fputhash (obj, Qnil, Vpure_uninterned_symbol_table);
      return obj;
    }
  else if (CONSP (obj))
    {
      return pure_cons (XCAR (obj), XCDR (obj));
    }
  else if (STRINGP (obj))
    {
      return make_pure_string (XSTRING_DATA (obj),
			       XSTRING_LENGTH (obj),
			       XSTRING (obj)->plist,
			       0);
    }
  else if (VECTORP (obj))
    {
      int i;
      Lisp_Vector *o = XVECTOR (obj);
      Lisp_Object pure_obj = make_pure_vector (vector_length (o), Qnil);
      for (i = 0; i < vector_length (o); i++)
	XVECTOR_DATA (pure_obj)[i] = Fpurecopy (o->contents[i]);
      return pure_obj;
    }
#ifdef LISP_FLOAT_TYPE
  else if (FLOATP (obj))
    {
      return make_pure_float (XFLOAT_DATA (obj));
    }
#endif
  else if (COMPILED_FUNCTIONP (obj))
    {
      Lisp_Object pure_obj = make_compiled_function (1);
      Lisp_Compiled_Function *o = XCOMPILED_FUNCTION (obj);
      Lisp_Compiled_Function *n = XCOMPILED_FUNCTION (pure_obj);
      n->flags		       = o->flags;
      n->instructions	       = o->instructions;
      n->constants	       = Fpurecopy (o->constants);
      n->arglist	       = Fpurecopy (o->arglist);
      n->doc_and_interactive   = Fpurecopy (o->doc_and_interactive);
      n->stack_depth	       = o->stack_depth;
      optimize_compiled_function (pure_obj);
      return pure_obj;
    }
  else if (OPAQUEP (obj))
    {
      Lisp_Object pure_obj;
      Lisp_Opaque *old_opaque = XOPAQUE (obj);
      Lisp_Opaque *new_opaque = (Lisp_Opaque *) (PUREBEG + pure_bytes_used);
      struct lrecord_header *lheader = XRECORD_LHEADER (obj);
      CONST struct lrecord_implementation *implementation
	= LHEADER_IMPLEMENTATION (lheader);
      size_t size = implementation->size_in_bytes_method (lheader);
      size_t pure_size = ALIGN_SIZE (size, ALIGNOF (Lisp_Object));
      if (!check_purespace (pure_size))
	return obj;
      pure_bytes_used += pure_size;

      memcpy (new_opaque, old_opaque, size);
#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
      lheader->pure = 1;
#endif
      new_opaque->header.next = 0;

      XSETOPAQUE (pure_obj, new_opaque);
      return pure_obj;
    }
  else
    {
      signal_simple_error ("Can't purecopy %S", obj);
    }
  return obj; /* Unreached */
}



static void
puresize_adjust_h (size_t puresize)
{
  FILE *stream = fopen ("puresize-adjust.h", "w");

  if (stream == NULL)
    report_file_error ("Opening puresize adjustment file",
		       Fcons (build_string ("puresize-adjust.h"), Qnil));

  fprintf (stream,
	   "/*\tDo not edit this file!\n"
	   "\tAutomatically generated by XEmacs */\n"
	   "# define PURESIZE_ADJUSTMENT (%ld)\n",
	   (long) (puresize - RAW_PURESIZE));
  fclose (stream);
}

void
report_pure_usage (int report_impurities,
                   int die_if_pure_storage_exceeded)
{
  int rc = 0;

  if (pure_lossage)
    {
      message ("\n****\tPure Lisp storage exhausted!\n"
	       "\tPurespace usage: %ld of %ld\n"
	       "****",
               (long) get_PURESIZE() + pure_lossage,
	       (long) get_PURESIZE());
      if (die_if_pure_storage_exceeded)
	{
	  puresize_adjust_h (get_PURESIZE() + pure_lossage);
#ifdef HEAP_IN_DATA
	  sheap_adjust_h();
#endif
	  rc = -1;
	}
    }
  else
    {
      size_t lost = (get_PURESIZE() - pure_bytes_used) / 1024;
      char buf[200];
      /* extern Lisp_Object Vemacs_beta_version; */
      /* This used to be NILP(Vemacs_beta_version) ? 512 : 4; */
#ifndef PURESIZE_SLOP
#define PURESIZE_SLOP 0
#endif
      size_t slop = PURESIZE_SLOP;

      sprintf (buf, "Purespace usage: %ld of %ld (%d%%",
               (long) pure_bytes_used,
	       (long) get_PURESIZE(),
               (int) (pure_bytes_used / (get_PURESIZE() / 100.0) + 0.5));
      if (lost > ((slop ? slop : 1) / 1024)) {
        sprintf (buf + strlen (buf), " -- %ldk wasted", (long)lost);
	if (die_if_pure_storage_exceeded) {
	  puresize_adjust_h (pure_bytes_used + slop);
#ifdef HEAP_IN_DATA
	  sheap_adjust_h();
#endif
	  rc = -1;
	}
      }

      strcat (buf, ").");
      message ("%s", buf);
    }

#ifdef PURESTAT

  purestat_vector_other.nbytes =
    purestat_vector_all.nbytes -
    purestat_vector_constants.nbytes;
  purestat_vector_other.nobjects =
    purestat_vector_all.nobjects -
    purestat_vector_constants.nobjects;

  purestat_string_other.nbytes =
    purestat_string_all.nbytes -
    (purestat_string_pname.nbytes +
     purestat_string_interactive.nbytes +
     purestat_string_documentation.nbytes +
#ifdef I18N3
     purestat_string_domain.nbytes +
#endif
     purestat_string_other_function.nbytes);

  purestat_string_other.nobjects =
    purestat_string_all.nobjects -
    (purestat_string_pname.nobjects +
     purestat_string_interactive.nobjects +
     purestat_string_documentation.nobjects +
#ifdef I18N3
     purestat_string_domain.nobjects +
#endif
     purestat_string_other_function.nobjects);

  message ("   %-34s Objects    Bytes", "");

  print_purestat (&purestat_cons);
  print_purestat (&purestat_float);
  print_purestat (&purestat_string_pname);
  print_purestat (&purestat_function);
  print_purestat (&purestat_opaque_instructions);
  print_purestat (&purestat_vector_constants);
  print_purestat (&purestat_string_interactive);
#ifdef I18N3
  print_purestat (&purestat_string_domain);
#endif
  print_purestat (&purestat_string_documentation);
  print_purestat (&purestat_string_other_function);
  print_purestat (&purestat_vector_other);
  print_purestat (&purestat_string_other);
  print_purestat (&purestat_string_all);
  print_purestat (&purestat_vector_all);

#endif /* PURESTAT */


  if (report_impurities)
    {
      Lisp_Object plist;
      struct gcpro gcpro1;
      plist = XCAR (XCDR (XCDR (XCDR (XCDR (XCDR (Fgarbage_collect()))))));
      GCPRO1 (plist);
      message ("\nImpurities:");
      for (; CONSP (plist); plist = XCDR (XCDR (plist)))
	{
	  Lisp_Object symbol = XCAR (plist);
	  int size = XINT (XCAR (XCDR (plist)));
	  if (size > 0)
	    {
	      char buf [100];
	      char *s = buf;
	      memcpy (buf,
		      string_data   (XSYMBOL (symbol)->name),
		      string_length (XSYMBOL (symbol)->name) + 1);
	      while (*s++) if (*s == '-') *s = ' ';
	      *(s-1) = ':'; *s = 0;
	      message ("   %-34s %6d", buf, size);
	    }
	}
      UNGCPRO;
      garbage_collect_1 ();	/* collect Fgarbage_collect()'s garbage */
    }
  clear_message ();

  if (rc < 0) {
    unlink("SATISFIED");
    fatal ("Pure size adjusted, Don't Panic!  I will restart the `make'");
  } else if (pure_lossage && die_if_pure_storage_exceeded) {
    fatal ("Pure storage exhausted");
  }
}


/************************************************************************/
/*			   Garbage Collection				*/
/************************************************************************/

/* This will be used more extensively In The Future */
static int last_lrecord_type_index_assigned;

CONST struct lrecord_implementation *lrecord_implementations_table[128];
#define max_lrecord_type (countof (lrecord_implementations_table) - 1)

struct gcpro *gcprolist;

/* 415 used Mly 29-Jun-93 */
/* 1327 used slb 28-Feb-98 */
#ifdef HAVE_SHLIB
#define NSTATICS 4000
#else
#define NSTATICS 2000
#endif
/* Not "static" because of linker lossage on some systems */
Lisp_Object *staticvec[NSTATICS]
     /* Force it into data space! */
     = {0};
static int staticidx;

/* Put an entry in staticvec, pointing at the variable whose address is given
 */
void
staticpro (Lisp_Object *varaddress)
{
  if (staticidx >= countof (staticvec))
    /* #### This is now a dubious abort() since this routine may be called */
    /* by Lisp attempting to load a DLL. */
    abort ();
  staticvec[staticidx++] = varaddress;
}


/* Mark reference to a Lisp_Object.  If the object referred to has not been
   seen yet, recursively mark all the references contained in it. */

static void
mark_object (Lisp_Object obj)
{
 tail_recurse:

#ifdef ERROR_CHECK_GC
  assert (! (GC_EQ (obj, Qnull_pointer)));
#endif
  /* Checks we used to perform */
  /* if (EQ (obj, Qnull_pointer)) return; */
  /* if (!POINTER_TYPE_P (XGCTYPE (obj))) return; */
  /* if (PURIFIED (XPNTR (obj))) return; */

  switch (XGCTYPE (obj))
    {
#ifndef LRECORD_CONS
    case Lisp_Type_Cons:
      {
	struct Lisp_Cons *ptr = XCONS (obj);
	if (PURIFIED (ptr))
	  break;
	if (CONS_MARKED_P (ptr))
	  break;
	MARK_CONS (ptr);
	/* If the cdr is nil, tail-recurse on the car.  */
	if (GC_NILP (ptr->cdr))
	  {
	    obj = ptr->car;
	  }
	else
	  {
	    mark_object (ptr->car);
	    obj = ptr->cdr;
	  }
	goto tail_recurse;
      }
#endif

    case Lisp_Type_Record:
      {
	struct lrecord_header *lheader = XRECORD_LHEADER (obj);
#if defined (ERROR_CHECK_GC) && defined (USE_INDEXED_LRECORD_IMPLEMENTATION)
	assert (lheader->type <= last_lrecord_type_index_assigned);
#endif
	if (PURIFIED (lheader))
	  return;

	if (! MARKED_RECORD_HEADER_P (lheader) &&
	    ! UNMARKABLE_RECORD_HEADER_P (lheader))
	  {
	    CONST struct lrecord_implementation *implementation =
	      LHEADER_IMPLEMENTATION (lheader);
	    MARK_RECORD_HEADER (lheader);
#ifdef ERROR_CHECK_GC
	    if (!implementation->basic_p)
	      assert (! ((struct lcrecord_header *) lheader)->free);
#endif
	    if (implementation->marker)
	      {
		obj = implementation->marker (obj, mark_object);
		if (!GC_NILP (obj)) goto tail_recurse;
	      }
	  }
      }
      break;

#ifndef LRECORD_STRING
    case Lisp_Type_String:
      {
	struct Lisp_String *ptr = XSTRING (obj);
	if (PURIFIED (ptr))
	  return;

	if (!XMARKBIT (ptr->plist))
	  {
	    if (CONSP (ptr->plist) &&
		EXTENT_INFOP (XCAR (ptr->plist)))
	      flush_cached_extent_info (XCAR (ptr->plist));
	    XMARK (ptr->plist);
	    obj = ptr->plist;
	    goto tail_recurse;
	  }
      }
      break;
#endif /* ! LRECORD_STRING */

#ifndef LRECORD_VECTOR
    case Lisp_Type_Vector:
      {
	struct Lisp_Vector *ptr = XVECTOR (obj);
	int len, i;

	if (PURIFIED (ptr))
	  return;

	len = vector_length (ptr);

	if (len < 0)
	  break;		/* Already marked */
	ptr->size = -1 - len;	/* Else mark it */
	for (i = 0; i < len - 1; i++) /* and then mark its elements */
	  mark_object (ptr->contents[i]);
        if (len > 0)
        {
          obj = ptr->contents[len - 1];
          goto tail_recurse;
        }
      }
      break;
#endif /* !LRECORD_VECTOR */

#ifndef LRECORD_SYMBOL
    case Lisp_Type_Symbol:
      {
	struct Lisp_Symbol *sym = XSYMBOL (obj);

	if (PURIFIED (sym))
	  return;

	while (!XMARKBIT (sym->plist))
	  {
	    XMARK (sym->plist);
	    mark_object (sym->value);
	    mark_object (sym->function);
	    {
	      /*
	       * symbol->name is a struct Lisp_String *, not a
	       * Lisp_Object.  Fix it up and pass to mark_object.
	       */
	      Lisp_Object symname;
	      XSETSTRING (symname, sym->name);
	      mark_object (symname);
	    }
	    if (!symbol_next (sym))
	      {
		obj = sym->plist;
		goto tail_recurse;
	      }
	    mark_object (sym->plist);
	    /* Mark the rest of the symbols in the hash-chain */
	    sym = symbol_next (sym);
	  }
      }
      break;
#endif /* !LRECORD_SYMBOL */

      /* Check for invalid Lisp_Object types */
#if defined (ERROR_CHECK_GC) && ! defined (USE_MINIMAL_TAGBITS)
    case Lisp_Type_Int:
    case Lisp_Type_Char:
      break;
    default:
      abort();
      break;
#endif /* ERROR_CHECK_GC && ! USE_MINIMAL_TAGBITS */
    }
}

/* mark all of the conses in a list and mark the final cdr; but
   DO NOT mark the cars.

   Use only for internal lists!  There should never be other pointers
   to the cons cells, because if so, the cars will remain unmarked
   even when they maybe should be marked. */
void
mark_conses_in_list (Lisp_Object obj)
{
  Lisp_Object rest;

  for (rest = obj; CONSP (rest); rest = XCDR (rest))
    {
      if (CONS_MARKED_P (XCONS (rest)))
	return;
      MARK_CONS (XCONS (rest));
    }

  mark_object (rest);
}


#ifdef PURESTAT
/* Simpler than mark-object, because pure structure can't
   have any circularities */

static size_t
pure_string_sizeof (Lisp_Object obj)
{
  struct Lisp_String *ptr = XSTRING (obj);

  if (string_data (ptr) != (Bufbyte *) ptr + sizeof (*ptr))
    {
      /* string-data not allocated contiguously.
	 Probably (better be!!) a pointer constant "C" data. */
      return sizeof (*ptr);
    }
  else
    {
      size_t size = sizeof (*ptr) + string_length (ptr) + 1;
      size = ALIGN_SIZE (size, sizeof (Lisp_Object));
      return size;
    }
}

static size_t
pure_sizeof (Lisp_Object obj)
{
  if (!POINTER_TYPE_P (XTYPE (obj))
      || !PURIFIED (XPNTR (obj)))
    return 0;
  /* symbol sizes are accounted for separately */
  else if (SYMBOLP (obj))
    return 0;
  else if (STRINGP (obj))
    return pure_string_sizeof (obj);
  else if (LRECORDP (obj))
    {
      struct lrecord_header *lheader = XRECORD_LHEADER (obj);
      CONST struct lrecord_implementation *implementation
	= LHEADER_IMPLEMENTATION (lheader);

        return implementation->size_in_bytes_method
	  ? implementation->size_in_bytes_method (lheader)
	  : implementation->static_size;
    }
#ifndef LRECORD_VECTOR
  else if (VECTORP (obj))
    return offsetof (Lisp_Vector, contents[XVECTOR_LENGTH (obj)]);
#endif /* !LRECORD_VECTOR */

#ifndef LRECORD_CONS
  else if (CONSP (obj))
    return sizeof (struct Lisp_Cons);
#endif /* !LRECORD_CONS */
  else
    /* Others can't be purified */
    abort ();
  return 0; /* unreached */
}
#endif /* PURESTAT */




/* Find all structures not marked, and free them. */

#ifndef LRECORD_VECTOR
static int gc_count_num_vector_used, gc_count_vector_total_size;
static int gc_count_vector_storage;
#endif
static int gc_count_num_bit_vector_used, gc_count_bit_vector_total_size;
static int gc_count_bit_vector_storage;
static int gc_count_num_short_string_in_use;
static int gc_count_string_total_size;
static int gc_count_short_string_total_size;

/* static int gc_count_total_records_used, gc_count_records_total_size; */


int
lrecord_type_index (CONST struct lrecord_implementation *implementation)
{
  int type_index = *(implementation->lrecord_type_index);
  /* Have to do this circuitous validation test because of problems
     dumping out initialized variables (ie can't set xxx_type_index to -1
     because that would make xxx_type_index read-only in a dumped emacs. */
  if (type_index < 0 || type_index > max_lrecord_type
      || lrecord_implementations_table[type_index] != implementation)
    {
      if (last_lrecord_type_index_assigned == max_lrecord_type)
        abort ();
      type_index = ++last_lrecord_type_index_assigned;
      lrecord_implementations_table[type_index] = implementation;
      *(implementation->lrecord_type_index) = type_index;
    }
  return type_index;
}

/* stats on lcrecords in use - kinda kludgy */

static struct
{
  int instances_in_use;
  int bytes_in_use;
  int instances_freed;
  int bytes_freed;
  int instances_on_free_list;
} lcrecord_stats [countof (lrecord_implementations_table)];


static void
reset_lcrecord_stats (void)
{
  int i;
  for (i = 0; i < countof (lcrecord_stats); i++)
    {
      lcrecord_stats[i].instances_in_use = 0;
      lcrecord_stats[i].bytes_in_use = 0;
      lcrecord_stats[i].instances_freed = 0;
      lcrecord_stats[i].bytes_freed = 0;
      lcrecord_stats[i].instances_on_free_list = 0;
    }
}

static void
tick_lcrecord_stats (CONST struct lrecord_header *h, int free_p)
{
  CONST struct lrecord_implementation *implementation =
    LHEADER_IMPLEMENTATION (h);
  int type_index = lrecord_type_index (implementation);

  if (((struct lcrecord_header *) h)->free)
    {
      assert (!free_p);
      lcrecord_stats[type_index].instances_on_free_list++;
    }
  else
    {
      size_t sz = (implementation->size_in_bytes_method
		   ? implementation->size_in_bytes_method (h)
		   : implementation->static_size);

      if (free_p)
	{
	  lcrecord_stats[type_index].instances_freed++;
	  lcrecord_stats[type_index].bytes_freed += sz;
	}
      else
	{
	  lcrecord_stats[type_index].instances_in_use++;
	  lcrecord_stats[type_index].bytes_in_use += sz;
	}
    }
}


/* Free all unmarked records */
static void
sweep_lcrecords_1 (struct lcrecord_header **prev, int *used)
{
  struct lcrecord_header *header;
  int num_used = 0;
  /* int total_size = 0; */
  reset_lcrecord_stats ();

  /* First go through and call all the finalize methods.
     Then go through and free the objects.  There used to
     be only one loop here, with the call to the finalizer
     occurring directly before the xfree() below.  That
     is marginally faster but much less safe -- if the
     finalize method for an object needs to reference any
     other objects contained within it (and many do),
     we could easily be screwed by having already freed that
     other object. */

  for (header = *prev; header; header = header->next)
    {
      struct lrecord_header *h = &(header->lheader);
      if (!MARKED_RECORD_HEADER_P (h) && ! (header->free))
	{
	  if (LHEADER_IMPLEMENTATION (h)->finalizer)
	    LHEADER_IMPLEMENTATION (h)->finalizer (h, 0);
	}
    }

  for (header = *prev; header; )
    {
      struct lrecord_header *h = &(header->lheader);
      if (MARKED_RECORD_HEADER_P (h))
	{
	  UNMARK_RECORD_HEADER (h);
	  num_used++;
	  /* total_size += n->implementation->size_in_bytes (h);*/
	  prev = &(header->next);
	  header = *prev;
	  tick_lcrecord_stats (h, 0);
	}
      else
	{
	  struct lcrecord_header *next = header->next;
          *prev = next;
	  tick_lcrecord_stats (h, 1);
	  /* used to call finalizer right here. */
	  xfree (header);
	  header = next;
	}
    }
  *used = num_used;
  /* *total = total_size; */
}

#ifndef LRECORD_VECTOR

static void
sweep_vectors_1 (Lisp_Object *prev,
                 int *used, int *total, int *storage)
{
  Lisp_Object vector;
  int num_used = 0;
  int total_size = 0;
  int total_storage = 0;

  for (vector = *prev; VECTORP (vector); )
    {
      Lisp_Vector *v = XVECTOR (vector);
      int len = v->size;
      if (len < 0)     /* marked */
	{
          len = - (len + 1);
	  v->size = len;
	  total_size += len;
          total_storage +=
	    MALLOC_OVERHEAD + offsetof (Lisp_Vector, contents[len + 1]);
	  num_used++;
	  prev = &(vector_next (v));
	  vector = *prev;
	}
      else
	{
          Lisp_Object next = vector_next (v);
          *prev = next;
	  xfree (v);
	  vector = next;
	}
    }
  *used = num_used;
  *total = total_size;
  *storage = total_storage;
}

#endif /* ! LRECORD_VECTOR */

static void
sweep_bit_vectors_1 (Lisp_Object *prev,
		     int *used, int *total, int *storage)
{
  Lisp_Object bit_vector;
  int num_used = 0;
  int total_size = 0;
  int total_storage = 0;

  /* BIT_VECTORP fails because the objects are marked, which changes
     their implementation */
  for (bit_vector = *prev; !EQ (bit_vector, Qzero); )
    {
      Lisp_Bit_Vector *v = XBIT_VECTOR (bit_vector);
      int len = v->size;
      if (MARKED_RECORD_P (bit_vector))
	{
	  UNMARK_RECORD_HEADER (&(v->lheader));
	  total_size += len;
          total_storage +=
	    MALLOC_OVERHEAD
	    + offsetof (Lisp_Bit_Vector, bits[BIT_VECTOR_LONG_STORAGE (len)]);
	  num_used++;
	  prev = &(bit_vector_next (v));
	  bit_vector = *prev;
	}
      else
	{
          Lisp_Object next = bit_vector_next (v);
          *prev = next;
	  xfree (v);
	  bit_vector = next;
	}
    }
  *used = num_used;
  *total = total_size;
  *storage = total_storage;
}

/* And the Lord said: Thou shalt use the `c-backslash-region' command
   to make macros prettier. */

#ifdef ERROR_CHECK_GC

#define SWEEP_FIXED_TYPE_BLOCK(typename, obj_type)			\
do {									\
  struct typename##_block *SFTB_current;				\
  struct typename##_block **SFTB_prev;					\
  int SFTB_limit;							\
  int num_free = 0, num_used = 0;					\
									\
  for (SFTB_prev = &current_##typename##_block,				\
       SFTB_current = current_##typename##_block,			\
       SFTB_limit = current_##typename##_block_index;			\
       SFTB_current;							\
       )								\
    {									\
      int SFTB_iii;							\
									\
      for (SFTB_iii = 0; SFTB_iii < SFTB_limit; SFTB_iii++)		\
	{								\
	  obj_type *SFTB_victim = &(SFTB_current->block[SFTB_iii]);	\
									\
	  if (FREE_STRUCT_P (SFTB_victim))				\
	    {								\
	      num_free++;						\
	    }								\
	  else if (!MARKED_##typename##_P (SFTB_victim))		\
	    {								\
	      num_free++;						\
	      FREE_FIXED_TYPE (typename, obj_type, SFTB_victim);	\
	    }								\
	  else								\
	    {								\
	      num_used++;						\
	      UNMARK_##typename (SFTB_victim);				\
	    }								\
	}								\
      SFTB_prev = &(SFTB_current->prev);				\
      SFTB_current = SFTB_current->prev;				\
      SFTB_limit = countof (current_##typename##_block->block);		\
    }									\
									\
  gc_count_num_##typename##_in_use = num_used;				\
  gc_count_num_##typename##_freelist = num_free;			\
} while (0)

#else /* !ERROR_CHECK_GC */

#define SWEEP_FIXED_TYPE_BLOCK(typename, obj_type)				\
do {										\
  struct typename##_block *SFTB_current;					\
  struct typename##_block **SFTB_prev;						\
  int SFTB_limit;								\
  int num_free = 0, num_used = 0;						\
										\
  typename##_free_list = 0;							\
										\
  for (SFTB_prev = &current_##typename##_block,					\
       SFTB_current = current_##typename##_block,				\
       SFTB_limit = current_##typename##_block_index;				\
       SFTB_current;								\
       )									\
    {										\
      int SFTB_iii;								\
      int SFTB_empty = 1;							\
      obj_type *SFTB_old_free_list = typename##_free_list;			\
										\
      for (SFTB_iii = 0; SFTB_iii < SFTB_limit; SFTB_iii++)			\
	{									\
	  obj_type *SFTB_victim = &(SFTB_current->block[SFTB_iii]);		\
										\
	  if (FREE_STRUCT_P (SFTB_victim))					\
	    {									\
	      num_free++;							\
	      PUT_FIXED_TYPE_ON_FREE_LIST (typename, obj_type, SFTB_victim);	\
	    }									\
	  else if (!MARKED_##typename##_P (SFTB_victim))			\
	    {									\
	      num_free++;							\
	      FREE_FIXED_TYPE (typename, obj_type, SFTB_victim);		\
	    }									\
	  else									\
	    {									\
	      SFTB_empty = 0;							\
	      num_used++;							\
	      UNMARK_##typename (SFTB_victim);					\
	    }									\
	}									\
      if (!SFTB_empty)								\
	{									\
	  SFTB_prev = &(SFTB_current->prev);					\
	  SFTB_current = SFTB_current->prev;					\
	}									\
      else if (SFTB_current == current_##typename##_block			\
	       && !SFTB_current->prev)						\
	{									\
	  /* No real point in freeing sole allocation block */			\
	  break;								\
	}									\
      else									\
	{									\
	  struct typename##_block *SFTB_victim_block = SFTB_current;		\
	  if (SFTB_victim_block == current_##typename##_block)			\
	    current_##typename##_block_index					\
	      = countof (current_##typename##_block->block);			\
	  SFTB_current = SFTB_current->prev;					\
	  {									\
	    *SFTB_prev = SFTB_current;						\
	    xfree (SFTB_victim_block);						\
	    /* Restore free list to what it was before victim was swept */	\
	    typename##_free_list = SFTB_old_free_list;				\
	    num_free -= SFTB_limit;						\
	  }									\
	}									\
      SFTB_limit = countof (current_##typename##_block->block);			\
    }										\
										\
  gc_count_num_##typename##_in_use = num_used;					\
  gc_count_num_##typename##_freelist = num_free;				\
} while (0)

#endif /* !ERROR_CHECK_GC */




static void
sweep_conses (void)
{
#ifndef LRECORD_CONS
# define MARKED_cons_P(ptr) XMARKBIT ((ptr)->car)
# define UNMARK_cons(ptr) do { XUNMARK ((ptr)->car); } while (0)
#else /* LRECORD_CONS */
# define MARKED_cons_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
# define UNMARK_cons(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#endif /* LRECORD_CONS */
#define ADDITIONAL_FREE_cons(ptr)

  SWEEP_FIXED_TYPE_BLOCK (cons, struct Lisp_Cons);
}

/* Explicitly free a cons cell.  */
void
free_cons (struct Lisp_Cons *ptr)
{
#ifdef ERROR_CHECK_GC
  /* If the CAR is not an int, then it will be a pointer, which will
     always be four-byte aligned.  If this cons cell has already been
     placed on the free list, however, its car will probably contain
     a chain pointer to the next cons on the list, which has cleverly
     had all its 0's and 1's inverted.  This allows for a quick
     check to make sure we're not freeing something already freed. */
  if (POINTER_TYPE_P (XTYPE (ptr->car)))
    ASSERT_VALID_POINTER (XPNTR (ptr->car));
#endif /* ERROR_CHECK_GC */

#ifndef ALLOC_NO_POOLS
  FREE_FIXED_TYPE_WHEN_NOT_IN_GC (cons, struct Lisp_Cons, ptr);
#endif /* ALLOC_NO_POOLS */
}

/* explicitly free a list.  You **must make sure** that you have
   created all the cons cells that make up this list and that there
   are no pointers to any of these cons cells anywhere else.  If there
   are, you will lose. */

void
free_list (Lisp_Object list)
{
  Lisp_Object rest, next;

  for (rest = list; !NILP (rest); rest = next)
    {
      next = XCDR (rest);
      free_cons (XCONS (rest));
    }
}

/* explicitly free an alist.  You **must make sure** that you have
   created all the cons cells that make up this alist and that there
   are no pointers to any of these cons cells anywhere else.  If there
   are, you will lose. */

void
free_alist (Lisp_Object alist)
{
  Lisp_Object rest, next;

  for (rest = alist; !NILP (rest); rest = next)
    {
      next = XCDR (rest);
      free_cons (XCONS (XCAR (rest)));
      free_cons (XCONS (rest));
    }
}

static void
sweep_compiled_functions (void)
{
#define MARKED_compiled_function_P(ptr) \
  MARKED_RECORD_HEADER_P (&((ptr)->lheader))
#define UNMARK_compiled_function(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#define ADDITIONAL_FREE_compiled_function(ptr)

  SWEEP_FIXED_TYPE_BLOCK (compiled_function, Lisp_Compiled_Function);
}


#ifdef LISP_FLOAT_TYPE
static void
sweep_floats (void)
{
#define MARKED_float_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
#define UNMARK_float(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#define ADDITIONAL_FREE_float(ptr)

  SWEEP_FIXED_TYPE_BLOCK (float, struct Lisp_Float);
}
#endif /* LISP_FLOAT_TYPE */

static void
sweep_symbols (void)
{
#ifndef LRECORD_SYMBOL
# define MARKED_symbol_P(ptr) XMARKBIT ((ptr)->plist)
# define UNMARK_symbol(ptr) do { XUNMARK ((ptr)->plist); } while (0)
#else
# define MARKED_symbol_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
# define UNMARK_symbol(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#endif /* !LRECORD_SYMBOL */
#define ADDITIONAL_FREE_symbol(ptr)

  SWEEP_FIXED_TYPE_BLOCK (symbol, struct Lisp_Symbol);
}

static void
sweep_extents (void)
{
#define MARKED_extent_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
#define UNMARK_extent(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#define ADDITIONAL_FREE_extent(ptr)

  SWEEP_FIXED_TYPE_BLOCK (extent, struct extent);
}

static void
sweep_events (void)
{
#define MARKED_event_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
#define UNMARK_event(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#define ADDITIONAL_FREE_event(ptr)

  SWEEP_FIXED_TYPE_BLOCK (event, struct Lisp_Event);
}

static void
sweep_markers (void)
{
#define MARKED_marker_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
#define UNMARK_marker(ptr) UNMARK_RECORD_HEADER (&((ptr)->lheader))
#define ADDITIONAL_FREE_marker(ptr)					\
  do { Lisp_Object tem;							\
       XSETMARKER (tem, ptr);						\
       unchain_marker (tem);						\
     } while (0)

  SWEEP_FIXED_TYPE_BLOCK (marker, struct Lisp_Marker);
}

/* Explicitly free a marker.  */
void
free_marker (struct Lisp_Marker *ptr)
{
#ifdef ERROR_CHECK_GC
  /* Perhaps this will catch freeing an already-freed marker. */
  Lisp_Object temmy;
  XSETMARKER (temmy, ptr);
  assert (GC_MARKERP (temmy));
#endif /* ERROR_CHECK_GC */

#ifndef ALLOC_NO_POOLS
  FREE_FIXED_TYPE_WHEN_NOT_IN_GC (marker, struct Lisp_Marker, ptr);
#endif /* ALLOC_NO_POOLS */
}


#if defined (MULE) && defined (VERIFY_STRING_CHARS_INTEGRITY)

static void
verify_string_chars_integrity (void)
{
  struct string_chars_block *sb;

  /* Scan each existing string block sequentially, string by string.  */
  for (sb = first_string_chars_block; sb; sb = sb->next)
    {
      int pos = 0;
      /* POS is the index of the next string in the block.  */
      while (pos < sb->pos)
        {
          struct string_chars *s_chars =
            (struct string_chars *) &(sb->string_chars[pos]);
          struct Lisp_String *string;
	  int size;
	  int fullsize;

	  /* If the string_chars struct is marked as free (i.e. the STRING
	     pointer is 0xFFFFFFFF) then this is an unused chunk of string
             storage. (See below.) */

	  if (FREE_STRUCT_P (s_chars))
	    {
	      fullsize = ((struct unused_string_chars *) s_chars)->fullsize;
	      pos += fullsize;
	      continue;
            }

          string = s_chars->string;
	  /* Must be 32-bit aligned. */
	  assert ((((int) string) & 3) == 0);

          size = string_length (string);
          fullsize = STRING_FULLSIZE (size);

          assert (!BIG_STRING_FULLSIZE_P (fullsize));
	  assert (string_data (string) == s_chars->chars);
	  pos += fullsize;
        }
      assert (pos == sb->pos);
    }
}

#endif /* MULE && ERROR_CHECK_GC */

/* Compactify string chars, relocating the reference to each --
   free any empty string_chars_block we see. */
static void
compact_string_chars (void)
{
  struct string_chars_block *to_sb = first_string_chars_block;
  int to_pos = 0;
  struct string_chars_block *from_sb;

  /* Scan each existing string block sequentially, string by string.  */
  for (from_sb = first_string_chars_block; from_sb; from_sb = from_sb->next)
    {
      int from_pos = 0;
      /* FROM_POS is the index of the next string in the block.  */
      while (from_pos < from_sb->pos)
        {
          struct string_chars *from_s_chars =
            (struct string_chars *) &(from_sb->string_chars[from_pos]);
          struct string_chars *to_s_chars;
          struct Lisp_String *string;
	  int size;
	  int fullsize;

	  /* If the string_chars struct is marked as free (i.e. the STRING
	     pointer is 0xFFFFFFFF) then this is an unused chunk of string
             storage.  This happens under Mule when a string's size changes
	     in such a way that its fullsize changes. (Strings can change
	     size because a different-length character can be substituted
	     for another character.) In this case, after the bogus string
	     pointer is the "fullsize" of this entry, i.e. how many bytes
	     to skip. */

	  if (FREE_STRUCT_P (from_s_chars))
	    {
	      fullsize = ((struct unused_string_chars *) from_s_chars)->fullsize;
	      from_pos += fullsize;
	      continue;
            }

          string = from_s_chars->string;
	  assert (!(FREE_STRUCT_P (string)));

          size = string_length (string);
          fullsize = STRING_FULLSIZE (size);

          if (BIG_STRING_FULLSIZE_P (fullsize))
            abort ();

          /* Just skip it if it isn't marked.  */
#ifdef LRECORD_STRING
	  if (! MARKED_RECORD_HEADER_P (&(string->lheader)))
#else
          if (!XMARKBIT (string->plist))
#endif
            {
              from_pos += fullsize;
              continue;
            }

          /* If it won't fit in what's left of TO_SB, close TO_SB out
             and go on to the next string_chars_block.  We know that TO_SB
             cannot advance past FROM_SB here since FROM_SB is large enough
             to currently contain this string. */
          if ((to_pos + fullsize) > countof (to_sb->string_chars))
            {
              to_sb->pos = to_pos;
              to_sb = to_sb->next;
              to_pos = 0;
            }

          /* Compute new address of this string
             and update TO_POS for the space being used.  */
          to_s_chars = (struct string_chars *) &(to_sb->string_chars[to_pos]);

          /* Copy the string_chars to the new place.  */
          if (from_s_chars != to_s_chars)
            memmove (to_s_chars, from_s_chars, fullsize);

          /* Relocate FROM_S_CHARS's reference */
          set_string_data (string, &(to_s_chars->chars[0]));

          from_pos += fullsize;
          to_pos += fullsize;
        }
    }

  /* Set current to the last string chars block still used and
     free any that follow. */
  {
    struct string_chars_block *victim;

    for (victim = to_sb->next; victim; )
      {
	struct string_chars_block *next = victim->next;
	xfree (victim);
	victim = next;
      }

    current_string_chars_block = to_sb;
    current_string_chars_block->pos = to_pos;
    current_string_chars_block->next = 0;
  }
}

#if 1 /* Hack to debug missing purecopy's */
static int debug_string_purity;

static void
debug_string_purity_print (struct Lisp_String *p)
{
  Charcount i;
  Charcount s = string_char_length (p);
  putc ('\"', stderr);
  for (i = 0; i < s; i++)
  {
    Emchar ch = string_char (p, i);
    if (ch < 32 || ch >= 126)
      stderr_out ("\\%03o", ch);
    else if (ch == '\\' || ch == '\"')
      stderr_out ("\\%c", ch);
    else
      stderr_out ("%c", ch);
  }
  stderr_out ("\"\n");
}
#endif /* 1 */


static void
sweep_strings (void)
{
  int num_small_used = 0, num_small_bytes = 0, num_bytes = 0;
  int debug = debug_string_purity;

#ifdef LRECORD_STRING

# define MARKED_string_P(ptr) MARKED_RECORD_HEADER_P (&((ptr)->lheader))
# define UNMARK_string(ptr)				\
  do { struct Lisp_String *p = (ptr);			\
       int size = string_length (p);			\
       UNMARK_RECORD_HEADER (&(p->lheader));		\
       num_bytes += size;				\
       if (!BIG_STRING_SIZE_P (size))			\
	 { num_small_bytes += size;			\
	   num_small_used++;				\
	 }						\
       if (debug) debug_string_purity_print (p);	\
     } while (0)
# define ADDITIONAL_FREE_string(p)				\
  do { int size = string_length (p);				\
       if (BIG_STRING_SIZE_P (size))				\
	 xfree_1 (CHARS_TO_STRING_CHAR (string_data (p)));	\
     } while (0)

#else

# define MARKED_string_P(ptr) XMARKBIT ((ptr)->plist)
# define UNMARK_string(ptr)				\
  do { struct Lisp_String *p = (ptr);			\
       int size = string_length (p);			\
       XUNMARK (p->plist);				\
       num_bytes += size;				\
       if (!BIG_STRING_SIZE_P (size))			\
	 { num_small_bytes += size;			\
	   num_small_used++;				\
	 }						\
       if (debug) debug_string_purity_print (p);	\
     } while (0)
# define ADDITIONAL_FREE_string(p)				\
  do { int size = string_length (p);				\
       if (BIG_STRING_SIZE_P (size))				\
	 xfree_1 (CHARS_TO_STRING_CHAR (string_data (p)));	\
     } while (0)

#endif /* ! LRECORD_STRING */

  SWEEP_FIXED_TYPE_BLOCK (string, struct Lisp_String);

  gc_count_num_short_string_in_use = num_small_used;
  gc_count_string_total_size = num_bytes;
  gc_count_short_string_total_size = num_small_bytes;
}


/* I hate duplicating all this crap! */
static int
marked_p (Lisp_Object obj)
{
#ifdef ERROR_CHECK_GC
  assert (! (GC_EQ (obj, Qnull_pointer)));
#endif
  /* Checks we used to perform. */
  /* if (EQ (obj, Qnull_pointer)) return 1; */
  /* if (!POINTER_TYPE_P (XGCTYPE (obj))) return 1; */
  /* if (PURIFIED (XPNTR (obj))) return 1; */

  switch (XGCTYPE (obj))
    {
#ifndef LRECORD_CONS
    case Lisp_Type_Cons:
      {
	struct Lisp_Cons *ptr = XCONS (obj);
	return PURIFIED (ptr) || XMARKBIT (ptr->car);
      }
#endif
    case Lisp_Type_Record:
      {
	struct lrecord_header *lheader = XRECORD_LHEADER (obj);
#if defined (ERROR_CHECK_GC) && defined (USE_INDEXED_LRECORD_IMPLEMENTATION)
	assert (lheader->type <= last_lrecord_type_index_assigned);
#endif
	return PURIFIED (lheader) || MARKED_RECORD_HEADER_P (lheader);
      }
#ifndef LRECORD_STRING
    case Lisp_Type_String:
      {
	struct Lisp_String *ptr = XSTRING (obj);
	return PURIFIED (ptr) || XMARKBIT (ptr->plist);
      }
#endif /* ! LRECORD_STRING */
#ifndef LRECORD_VECTOR
    case Lisp_Type_Vector:
      {
	struct Lisp_Vector *ptr = XVECTOR (obj);
	return PURIFIED (ptr) || vector_length (ptr) < 0;
      }
#endif /* !LRECORD_VECTOR */
#ifndef LRECORD_SYMBOL
    case Lisp_Type_Symbol:
      {
	struct Lisp_Symbol *ptr = XSYMBOL (obj);
	return PURIFIED (ptr) || XMARKBIT (ptr->plist);
      }
#endif

      /* Ints and Chars don't need GC */
#if defined (USE_MINIMAL_TAGBITS) || ! defined (ERROR_CHECK_GC)
    default:
      return 1;
#else
    default:
      abort();
    case Lisp_Type_Int:
    case Lisp_Type_Char:
      return 1;
#endif
    }
}

static void
gc_sweep (void)
{
  /* Free all unmarked records.  Do this at the very beginning,
     before anything else, so that the finalize methods can safely
     examine items in the objects.  sweep_lcrecords_1() makes
     sure to call all the finalize methods *before* freeing anything,
     to complete the safety. */
  {
    int ignored;
    sweep_lcrecords_1 (&all_lcrecords, &ignored);
  }

  compact_string_chars ();

  /* Finalize methods below (called through the ADDITIONAL_FREE_foo
     macros) must be *extremely* careful to make sure they're not
     referencing freed objects.  The only two existing finalize
     methods (for strings and markers) pass muster -- the string
     finalizer doesn't look at anything but its own specially-
     created block, and the marker finalizer only looks at live
     buffers (which will never be freed) and at the markers before
     and after it in the chain (which, by induction, will never be
     freed because if so, they would have already removed themselves
     from the chain). */

  /* Put all unmarked strings on free list, free'ing the string chars
     of large unmarked strings */
  sweep_strings ();

  /* Put all unmarked conses on free list */
  sweep_conses ();

#ifndef LRECORD_VECTOR
  /* Free all unmarked vectors */
  sweep_vectors_1 (&all_vectors,
                   &gc_count_num_vector_used, &gc_count_vector_total_size,
                   &gc_count_vector_storage);
#endif

  /* Free all unmarked bit vectors */
  sweep_bit_vectors_1 (&all_bit_vectors,
		       &gc_count_num_bit_vector_used,
		       &gc_count_bit_vector_total_size,
		       &gc_count_bit_vector_storage);

  /* Free all unmarked compiled-function objects */
  sweep_compiled_functions ();

#ifdef LISP_FLOAT_TYPE
  /* Put all unmarked floats on free list */
  sweep_floats ();
#endif

  /* Put all unmarked symbols on free list */
  sweep_symbols ();

  /* Put all unmarked extents on free list */
  sweep_extents ();

  /* Put all unmarked markers on free list.
     Dechain each one first from the buffer into which it points. */
  sweep_markers ();

  sweep_events ();

}

/* Clearing for disksave. */

void
disksave_object_finalization (void)
{
  /* It's important that certain information from the environment not get
     dumped with the executable (pathnames, environment variables, etc.).
     To make it easier to tell when this has happened with strings(1) we
     clear some known-to-be-garbage blocks of memory, so that leftover
     results of old evaluation don't look like potential problems.
     But first we set some notable variables to nil and do one more GC,
     to turn those strings into garbage.
   */

  /* Yeah, this list is pretty ad-hoc... */
  Vprocess_environment = Qnil;
  Vexec_directory = Qnil;
  Vdata_directory = Qnil;
  Vsite_directory = Qnil;
  Vdoc_directory = Qnil;
  Vconfigure_info_directory = Qnil;
  Vexec_path = Qnil;
  Vload_path = Qnil;
  /* Vdump_load_path = Qnil; */
  uncache_home_directory();

#if defined(LOADHIST) && !(defined(LOADHIST_DUMPED) || \
			   defined(LOADHIST_BUILTIN))
  Vload_history = Qnil;
#endif
  Vshell_file_name = Qnil;

  garbage_collect_1 ();

  /* Run the disksave finalization methods of all live objects. */
  disksave_object_finalization_1 ();

#if 0 /* I don't see any point in this.  The purespace starts out all 0's */
  /* Zero out the unused portion of purespace */
  if (!pure_lossage)
    memset (  (char *) (PUREBEG + pure_bytes_used), 0,
	    (((char *) (PUREBEG + get_PURESIZE())) -
	     ((char *) (PUREBEG + pure_bytes_used))));
#endif

  /* Zero out the uninitialized (really, unused) part of the containers
     for the live strings. */
  {
    struct string_chars_block *scb;
    for (scb = first_string_chars_block; scb; scb = scb->next)
      {
	int count = sizeof (scb->string_chars) - scb->pos;

	assert (count >= 0 && count < STRING_CHARS_BLOCK_SIZE);
	if (count != 0) {
	  /* from the block's fill ptr to the end */
	  memset ((scb->string_chars + scb->pos), 0, count);
	}
      }
  }

  /* There, that ought to be enough... */

}


Lisp_Object
restore_gc_inhibit (Lisp_Object val)
{
  gc_currently_forbidden = XINT (val);
  return val;
}

/* Maybe we want to use this when doing a "panic" gc after memory_full()? */
static int gc_hooks_inhibited;


void
garbage_collect_1 (void)
{
#if MAX_SAVE_STACK > 0
  char stack_top_variable;
  extern char *stack_bottom;
#endif
  int i;
  struct frame *f;
  int speccount;
  int cursor_changed;
  Lisp_Object pre_gc_cursor;
  struct gcpro gcpro1;

  if (gc_in_progress
      || gc_currently_forbidden
      || in_display
      || preparing_for_armageddon)
    return;

  /* We used to call selected_frame() here.

     The following functions cannot be called inside GC
     so we move to after the above tests. */
  {
    Lisp_Object frame;
    Lisp_Object device = Fselected_device (Qnil);
    if (NILP (device)) /* Could happen during startup, eg. if always_gc */
      return;
    frame = DEVICE_SELECTED_FRAME (XDEVICE (device));
    if (NILP (frame))
      signal_simple_error ("No frames exist on device", device);
    f = XFRAME (frame);
  }

  pre_gc_cursor = Qnil;
  cursor_changed = 0;

  GCPRO1 (pre_gc_cursor);

  /* Very important to prevent GC during any of the following
     stuff that might run Lisp code; otherwise, we'll likely
     have infinite GC recursion. */
  speccount = specpdl_depth ();
  record_unwind_protect (restore_gc_inhibit,
                         make_int (gc_currently_forbidden));
  gc_currently_forbidden = 1;

  if (!gc_hooks_inhibited)
    run_hook_trapping_errors ("Error in pre-gc-hook", Qpre_gc_hook);

  /* Now show the GC cursor/message. */
  if (!noninteractive)
    {
      if (FRAME_WIN_P (f))
	{
	  Lisp_Object frame = make_frame (f);
	  Lisp_Object cursor = glyph_image_instance (Vgc_pointer_glyph,
						     FRAME_SELECTED_WINDOW (f),
						     ERROR_ME_NOT, 1);
	  pre_gc_cursor = f->pointer;
	  if (POINTER_IMAGE_INSTANCEP (cursor)
	      /* don't change if we don't know how to change back. */
	      && POINTER_IMAGE_INSTANCEP (pre_gc_cursor))
	    {
	      cursor_changed = 1;
	      Fset_frame_pointer (frame, cursor);
	    }
	}

      /* Don't print messages to the stream device. */
      if (!cursor_changed && !FRAME_STREAM_P (f))
	{
	  char *msg = (STRINGP (Vgc_message)
		       ? GETTEXT ((char *) XSTRING_DATA (Vgc_message))
		       : 0);
	  Lisp_Object args[2], whole_msg;
	  args[0] = build_string (msg ? msg :
				  GETTEXT ((CONST char *) gc_default_message));
	  args[1] = build_string ("...");
	  whole_msg = Fconcat (2, args);
	  echo_area_message (f, (Bufbyte *) 0, whole_msg, 0, -1,
			     Qgarbage_collecting);
	}
    }

  /***** Now we actually start the garbage collection. */

  gc_in_progress = 1;

  gc_generation_number[0]++;

#if MAX_SAVE_STACK > 0

  /* Save a copy of the contents of the stack, for debugging.  */
  if (!purify_flag)
    {
      /* Static buffer in which we save a copy of the C stack at each GC.  */
      static char *stack_copy;
      static size_t stack_copy_size;

      ptrdiff_t stack_diff = &stack_top_variable - stack_bottom;
      size_t stack_size = (stack_diff > 0 ? stack_diff : -stack_diff);
      if (stack_size < MAX_SAVE_STACK)
	{
	  if (stack_copy_size < stack_size)
	    {
	      stack_copy = (char *) xrealloc (stack_copy, stack_size);
	      stack_copy_size = stack_size;
	    }

	  memcpy (stack_copy,
		  stack_diff > 0 ? stack_bottom : &stack_top_variable,
		  stack_size);
	}
    }
#endif /* MAX_SAVE_STACK > 0 */

  /* Do some totally ad-hoc resource clearing. */
  /* #### generalize this? */
  clear_event_resource ();
  cleanup_specifiers ();

  /* Mark all the special slots that serve as the roots of accessibility. */
  {
    struct gcpro *tail;
    struct catchtag *catch;
    struct backtrace *backlist;
    struct specbinding *bind;

    for (i = 0; i < staticidx; i++)
      {
        mark_object (*(staticvec[i]));
      }

    for (tail = gcprolist; tail; tail = tail->next)
      {
	for (i = 0; i < tail->nvars; i++)
	  mark_object (tail->var[i]);
      }

    for (bind = specpdl; bind != specpdl_ptr; bind++)
      {
	mark_object (bind->symbol);
	mark_object (bind->old_value);
      }

    for (catch = catchlist; catch; catch = catch->next)
      {
	mark_object (catch->tag);
	mark_object (catch->val);
      }

    for (backlist = backtrace_list; backlist; backlist = backlist->next)
      {
	int nargs = backlist->nargs;

	mark_object (*backlist->function);
	if (nargs == UNEVALLED || nargs == MANY)
	  mark_object (backlist->args[0]);
	else
	  for (i = 0; i < nargs; i++)
	    mark_object (backlist->args[i]);
      }

    mark_redisplay (mark_object);
    mark_profiling_info (mark_object);
  }

  /* OK, now do the after-mark stuff.  This is for things that
     are only marked when something else is marked (e.g. weak hash tables).
     There may be complex dependencies between such objects -- e.g.
     a weak hash table might be unmarked, but after processing a later
     weak hash table, the former one might get marked.  So we have to
     iterate until nothing more gets marked. */

  while (finish_marking_weak_hash_tables (marked_p, mark_object) > 0 ||
	 finish_marking_weak_lists       (marked_p, mark_object) > 0)
    ;

  /* And prune (this needs to be called after everything else has been
     marked and before we do any sweeping). */
  /* #### this is somewhat ad-hoc and should probably be an object
     method */
  prune_weak_hash_tables (marked_p);
  prune_weak_lists (marked_p);
  prune_specifiers (marked_p);
  prune_syntax_tables (marked_p);

  gc_sweep ();

  consing_since_gc = 0;
#ifndef DEBUG_XEMACS
  /* Allow you to set it really fucking low if you really want ... */
  if (gc_cons_threshold < 10000)
    gc_cons_threshold = 10000;
#endif

  gc_in_progress = 0;

  /******* End of garbage collection ********/

  run_hook_trapping_errors ("Error in post-gc-hook", Qpost_gc_hook);

  /* Now remove the GC cursor/message */
  if (!noninteractive)
    {
      if (cursor_changed)
	Fset_frame_pointer (make_frame (f), pre_gc_cursor);
      else if (!FRAME_STREAM_P (f))
	{
	  char *msg = (STRINGP (Vgc_message)
		       ? GETTEXT ((char *) XSTRING_DATA (Vgc_message))
		       : 0);

	  /* Show "...done" only if the echo area would otherwise be empty. */
	  if (NILP (clear_echo_area (selected_frame (),
				     Qgarbage_collecting, 0)))
	    {
	      Lisp_Object args[2], whole_msg;
	      args[0] = build_string (msg ? msg :
				      GETTEXT ((CONST char *)
					       gc_default_message));
	      args[1] = build_string ("... done");
	      whole_msg = Fconcat (2, args);
	      echo_area_message (selected_frame (), (Bufbyte *) 0,
				 whole_msg, 0, -1,
				 Qgarbage_collecting);
	    }
	}
    }

  /* now stop inhibiting GC */
  unbind_to (speccount, Qnil);

  if (!breathing_space)
    {
      breathing_space = malloc (4096 - MALLOC_OVERHEAD);
    }

  UNGCPRO;
  return;
}

/* Debugging aids.  */

static Lisp_Object
gc_plist_hack (CONST char *name, int value, Lisp_Object tail)
{
  /* C doesn't have local functions (or closures, or GC, or readable syntax,
     or portable numeric datatypes, or bit-vectors, or characters, or
     arrays, or exceptions, or ...) */
  return cons3 (intern (name), make_int (value), tail);
}

#define HACK_O_MATIC(type, name, pl) do {				\
  int s = 0;								\
  struct type##_block *x = current_##type##_block;			\
  while (x) { s += sizeof (*x) + MALLOC_OVERHEAD; x = x->prev; }	\
  (pl) = gc_plist_hack ((name), s, (pl));				\
} while (0)

DEFUN ("garbage-collect", Fgarbage_collect, 0, 0, "", /*
Reclaim storage for Lisp objects no longer needed.
Return info on amount of space in use:
 ((USED-CONSES . FREE-CONSES) (USED-SYMS . FREE-SYMS)
  (USED-MARKERS . FREE-MARKERS) USED-STRING-CHARS USED-VECTOR-SLOTS
  PLIST)
  where `PLIST' is a list of alternating keyword/value pairs providing
  more detailed information.
Garbage collection happens automatically if you cons more than
`gc-cons-threshold' bytes of Lisp data since previous garbage collection.
*/
       ())
{
  Lisp_Object pl = Qnil;
  int i;
#ifdef LRECORD_VECTOR
  int gc_count_vector_total_size = 0;
#endif

  if (purify_flag && pure_lossage)
    return Qnil;

  garbage_collect_1 ();

  for (i = 0; i < last_lrecord_type_index_assigned; i++)
    {
      if (lcrecord_stats[i].bytes_in_use != 0
          || lcrecord_stats[i].bytes_freed != 0
	  || lcrecord_stats[i].instances_on_free_list != 0)
        {
          char buf [255];
          CONST char *name = lrecord_implementations_table[i]->name;
	  int len = strlen (name);
#ifdef LRECORD_VECTOR
	  /* save this for the FSFmacs-compatible part of the summary */
	  if (i == *lrecord_vector[0].lrecord_type_index)
	    gc_count_vector_total_size =
	      lcrecord_stats[i].bytes_in_use + lcrecord_stats[i].bytes_freed;
#endif
          sprintf (buf, "%s-storage", name);
          pl = gc_plist_hack (buf, lcrecord_stats[i].bytes_in_use, pl);
	  /* Okay, simple pluralization check for `symbol-value-varalias' */
	  if (name[len-1] == 's')
	    sprintf (buf, "%ses-freed", name);
	  else
	    sprintf (buf, "%ss-freed", name);
          if (lcrecord_stats[i].instances_freed != 0)
            pl = gc_plist_hack (buf, lcrecord_stats[i].instances_freed, pl);
	  if (name[len-1] == 's')
	    sprintf (buf, "%ses-on-free-list", name);
	  else
	    sprintf (buf, "%ss-on-free-list", name);
          if (lcrecord_stats[i].instances_on_free_list != 0)
            pl = gc_plist_hack (buf, lcrecord_stats[i].instances_on_free_list,
				pl);
	  if (name[len-1] == 's')
	    sprintf (buf, "%ses-used", name);
	  else
	    sprintf (buf, "%ss-used", name);
          pl = gc_plist_hack (buf, lcrecord_stats[i].instances_in_use, pl);
        }
    }

  HACK_O_MATIC (extent, "extent-storage", pl);
  pl = gc_plist_hack ("extents-free", gc_count_num_extent_freelist, pl);
  pl = gc_plist_hack ("extents-used", gc_count_num_extent_in_use, pl);
  HACK_O_MATIC (event, "event-storage", pl);
  pl = gc_plist_hack ("events-free", gc_count_num_event_freelist, pl);
  pl = gc_plist_hack ("events-used", gc_count_num_event_in_use, pl);
  HACK_O_MATIC (marker, "marker-storage", pl);
  pl = gc_plist_hack ("markers-free", gc_count_num_marker_freelist, pl);
  pl = gc_plist_hack ("markers-used", gc_count_num_marker_in_use, pl);
#ifdef LISP_FLOAT_TYPE
  HACK_O_MATIC (float, "float-storage", pl);
  pl = gc_plist_hack ("floats-free", gc_count_num_float_freelist, pl);
  pl = gc_plist_hack ("floats-used", gc_count_num_float_in_use, pl);
#endif /* LISP_FLOAT_TYPE */
  HACK_O_MATIC (string, "string-header-storage", pl);
  pl = gc_plist_hack ("long-strings-total-length",
                      gc_count_string_total_size
		      - gc_count_short_string_total_size, pl);
  HACK_O_MATIC (string_chars, "short-string-storage", pl);
  pl = gc_plist_hack ("short-strings-total-length",
                      gc_count_short_string_total_size, pl);
  pl = gc_plist_hack ("strings-free", gc_count_num_string_freelist, pl);
  pl = gc_plist_hack ("long-strings-used",
                      gc_count_num_string_in_use
		      - gc_count_num_short_string_in_use, pl);
  pl = gc_plist_hack ("short-strings-used",
                      gc_count_num_short_string_in_use, pl);

  HACK_O_MATIC (compiled_function, "compiled-function-storage", pl);
  pl = gc_plist_hack ("compiled-functions-free",
		      gc_count_num_compiled_function_freelist, pl);
  pl = gc_plist_hack ("compiled-functions-used",
		      gc_count_num_compiled_function_in_use, pl);

#ifndef LRECORD_VECTOR
  pl = gc_plist_hack ("vector-storage", gc_count_vector_storage, pl);
  pl = gc_plist_hack ("vectors-total-length",
                      gc_count_vector_total_size, pl);
  pl = gc_plist_hack ("vectors-used", gc_count_num_vector_used, pl);
#endif

  pl = gc_plist_hack ("bit-vector-storage", gc_count_bit_vector_storage, pl);
  pl = gc_plist_hack ("bit-vectors-total-length",
                      gc_count_bit_vector_total_size, pl);
  pl = gc_plist_hack ("bit-vectors-used", gc_count_num_bit_vector_used, pl);

  HACK_O_MATIC (symbol, "symbol-storage", pl);
  pl = gc_plist_hack ("symbols-free", gc_count_num_symbol_freelist, pl);
  pl = gc_plist_hack ("symbols-used", gc_count_num_symbol_in_use, pl);

  HACK_O_MATIC (cons, "cons-storage", pl);
  pl = gc_plist_hack ("conses-free", gc_count_num_cons_freelist, pl);
  pl = gc_plist_hack ("conses-used", gc_count_num_cons_in_use, pl);

  /* The things we do for backwards-compatibility */
  return
    list6 (Fcons (make_int (gc_count_num_cons_in_use),
		  make_int (gc_count_num_cons_freelist)),
	   Fcons (make_int (gc_count_num_symbol_in_use),
		  make_int (gc_count_num_symbol_freelist)),
	   Fcons (make_int (gc_count_num_marker_in_use),
		  make_int (gc_count_num_marker_freelist)),
	   make_int (gc_count_string_total_size),
	   make_int (gc_count_vector_total_size),
	   pl);
}
#undef HACK_O_MATIC

DEFUN ("consing-since-gc", Fconsing_since_gc, 0, 0, "", /*
Return the number of bytes consed since the last garbage collection.
\"Consed\" is a misnomer in that this actually counts allocation
of all different kinds of objects, not just conses.

If this value exceeds `gc-cons-threshold', a garbage collection happens.
*/
       ())
{
  return make_int (consing_since_gc);
}

DEFUN ("memory-limit", Fmemory_limit, 0, 0, "", /*
Return the address of the last byte Emacs has allocated, divided by 1024.
This may be helpful in debugging Emacs's memory usage.
The value is divided by 1024 to make sure it will fit in a lisp integer.
*/
       ())
{
  return make_int ((EMACS_INT) sbrk (0) / 1024);
}



int
object_dead_p (Lisp_Object obj)
{
  return ((BUFFERP  (obj) && !BUFFER_LIVE_P  (XBUFFER  (obj))) ||
	  (FRAMEP   (obj) && !FRAME_LIVE_P   (XFRAME   (obj))) ||
	  (WINDOWP  (obj) && !WINDOW_LIVE_P  (XWINDOW  (obj))) ||
	  (DEVICEP  (obj) && !DEVICE_LIVE_P  (XDEVICE  (obj))) ||
	  (CONSOLEP (obj) && !CONSOLE_LIVE_P (XCONSOLE (obj))) ||
	  (EVENTP   (obj) && !EVENT_LIVE_P   (XEVENT   (obj))) ||
	  (EXTENTP  (obj) && !EXTENT_LIVE_P  (XEXTENT  (obj))));
}

#ifdef MEMORY_USAGE_STATS

/* Attempt to determine the actual amount of space that is used for
   the block allocated starting at PTR, supposedly of size "CLAIMED_SIZE".

   It seems that the following holds:

   1. When using the old allocator (malloc.c):

      -- blocks are always allocated in chunks of powers of two.  For
	 each block, there is an overhead of 8 bytes if rcheck is not
	 defined, 20 bytes if it is defined.  In other words, a
	 one-byte allocation needs 8 bytes of overhead for a total of
	 9 bytes, and needs to have 16 bytes of memory chunked out for
	 it.

   2. When using the new allocator (gmalloc.c):

      -- blocks are always allocated in chunks of powers of two up
         to 4096 bytes.  Larger blocks are allocated in chunks of
	 an integral multiple of 4096 bytes.  The minimum block
         size is 2*sizeof (void *), or 16 bytes if SUNOS_LOCALTIME_BUG
	 is defined.  There is no per-block overhead, but there
	 is an overhead of 3*sizeof (size_t) for each 4096 bytes
	 allocated.

    3. When using the system malloc, anything goes, but they are
       generally slower and more space-efficient than the GNU
       allocators.  One possibly reasonable assumption to make
       for want of better data is that sizeof (void *), or maybe
       2 * sizeof (void *), is required as overhead and that
       blocks are allocated in the minimum required size except
       that some minimum block size is imposed (e.g. 16 bytes). */

size_t
malloced_storage_size (void *ptr, size_t claimed_size,
		       struct overhead_stats *stats)
{
  size_t orig_claimed_size = claimed_size;

#ifdef GNU_MALLOC

  if (claimed_size < 2 * sizeof (void *))
    claimed_size = 2 * sizeof (void *);
# ifdef SUNOS_LOCALTIME_BUG
  if (claimed_size < 16)
    claimed_size = 16;
# endif
  if (claimed_size < 4096)
    {
      int log = 1;

      /* compute the log base two, more or less, then use it to compute
	 the block size needed. */
      claimed_size--;
      /* It's big, it's heavy, it's wood! */
      while ((claimed_size /= 2) != 0)
	++log;
      claimed_size = 1;
      /* It's better than bad, it's good! */
      while (log > 0)
        {
	  claimed_size *= 2;
          log--;
        }
      /* We have to come up with some average about the amount of
	 blocks used. */
      if ((size_t) (rand () & 4095) < claimed_size)
	claimed_size += 3 * sizeof (void *);
    }
  else
    {
      claimed_size += 4095;
      claimed_size &= ~4095;
      claimed_size += (claimed_size / 4096) * 3 * sizeof (size_t);
    }

#elif defined (SYSTEM_MALLOC)

  if (claimed_size < 16)
    claimed_size = 16;
  claimed_size += 2 * sizeof (void *);

#else /* old GNU allocator */

# ifdef rcheck /* #### may not be defined here */
  claimed_size += 20;
# else
  claimed_size += 8;
# endif
  {
    int log = 1;

    /* compute the log base two, more or less, then use it to compute
       the block size needed. */
    claimed_size--;
    /* It's big, it's heavy, it's wood! */
    while ((claimed_size /= 2) != 0)
      ++log;
    claimed_size = 1;
    /* It's better than bad, it's good! */
    while (log > 0)
      {
	claimed_size *= 2;
        log--;
      }
  }

#endif /* old GNU allocator */

  if (stats)
    {
      stats->was_requested += orig_claimed_size;
      stats->malloc_overhead += claimed_size - orig_claimed_size;
    }
  return claimed_size;
}

size_t
fixed_type_block_overhead (size_t size)
{
  size_t per_block = TYPE_ALLOC_SIZE (cons, unsigned char);
  size_t overhead = 0;
  size_t storage_size = malloced_storage_size (0, per_block, 0);
  while (size >= per_block)
    {
      size -= per_block;
      overhead += sizeof (void *) + per_block - storage_size;
    }
  if (rand () % per_block < size)
    overhead += sizeof (void *) + per_block - storage_size;
  return overhead;
}

#endif /* MEMORY_USAGE_STATS */


/* Initialization */
void
init_alloc_once_early (void)
{
  int iii;

  last_lrecord_type_index_assigned = -1;
  for (iii = 0; iii < countof (lrecord_implementations_table); iii++)
    {
      lrecord_implementations_table[iii] = 0;
    }

#ifdef USE_INDEXED_LRECORD_IMPLEMENTATION
  /*
   * If USE_INDEXED_LRECORD_IMPLEMENTATION is defined, all the staticly
   * defined subr lrecords were initialized with lheader->type == 0.
   * See subr_lheader_initializer in lisp.h.  Force type index 0 to be
   * assigned to lrecord_subr so that those predefined indexes match
   * reality.
   */
  lrecord_type_index (lrecord_subr);
  assert (*(lrecord_subr[0].lrecord_type_index) == 0);
  /*
   * The same is true for symbol_value_forward objects, except the
   * type is 1.
   */
  lrecord_type_index (lrecord_symbol_value_forward);
  assert (*(lrecord_symbol_value_forward[0].lrecord_type_index) == 1);
#endif /* USE_INDEXED_LRECORD_IMPLEMENTATION */

  symbols_initialized = 0;

  gc_generation_number[0] = 0;
  /* purify_flag 1 is correct even if CANNOT_DUMP.
   * loadup.el will set to nil at end. */
  purify_flag = 1;
  pure_bytes_used = 0;
  pure_lossage = 0;
  breathing_space = 0;
#ifndef LRECORD_VECTOR
  XSETINT (all_vectors, 0); /* Qzero may not be set yet. */
#endif
  XSETINT (all_bit_vectors, 0); /* Qzero may not be set yet. */
  XSETINT (Vgc_message, 0);
  all_lcrecords = 0;
  ignore_malloc_warnings = 1;
#ifdef DOUG_LEA_MALLOC
  mallopt (M_TRIM_THRESHOLD, 128*1024); /* trim threshold */
  mallopt (M_MMAP_THRESHOLD, 64*1024); /* mmap threshold */
#if 0 /* Moved to emacs.c */
  mallopt (M_MMAP_MAX, 64); /* max. number of mmap'ed areas */
#endif
#endif
  init_string_alloc ();
  init_string_chars_alloc ();
  init_cons_alloc ();
  init_symbol_alloc ();
  init_compiled_function_alloc ();
#ifdef LISP_FLOAT_TYPE
  init_float_alloc ();
#endif /* LISP_FLOAT_TYPE */
  init_marker_alloc ();
  init_extent_alloc ();
  init_event_alloc ();

  ignore_malloc_warnings = 0;
  staticidx = 0;
  consing_since_gc = 0;
#if 1
  gc_cons_threshold = 500000; /* XEmacs change */
#else
  gc_cons_threshold = 15000; /* debugging */
#endif
#ifdef VIRT_ADDR_VARIES
  malloc_sbrk_unused = 1<<22;	/* A large number */
  malloc_sbrk_used = 100000;	/* as reasonable as any number */
#endif /* VIRT_ADDR_VARIES */
  lrecord_uid_counter = 259;
  debug_string_purity = 0;
  gcprolist = 0;

  gc_currently_forbidden = 0;
  gc_hooks_inhibited = 0;

#ifdef ERROR_CHECK_TYPECHECK
  ERROR_ME.really_unlikely_name_to_have_accidentally_in_a_non_errb_structure =
    666;
  ERROR_ME_NOT.
    really_unlikely_name_to_have_accidentally_in_a_non_errb_structure = 42;
  ERROR_ME_WARN.
    really_unlikely_name_to_have_accidentally_in_a_non_errb_structure =
      3333632;
#endif /* ERROR_CHECK_TYPECHECK */
}

void
reinit_alloc (void)
{
  gcprolist = 0;
}

void
syms_of_alloc (void)
{
  defsymbol (&Qpre_gc_hook, "pre-gc-hook");
  defsymbol (&Qpost_gc_hook, "post-gc-hook");
  defsymbol (&Qgarbage_collecting, "garbage-collecting");

  DEFSUBR (Fcons);
  DEFSUBR (Flist);
  DEFSUBR (Fvector);
  DEFSUBR (Fbit_vector);
  DEFSUBR (Fmake_byte_code);
  DEFSUBR (Fmake_list);
  DEFSUBR (Fmake_vector);
  DEFSUBR (Fmake_bit_vector);
  DEFSUBR (Fmake_string);
  DEFSUBR (Fstring);
  DEFSUBR (Fmake_symbol);
  DEFSUBR (Fmake_marker);
  DEFSUBR (Fpurecopy);
  DEFSUBR (Fgarbage_collect);
  DEFSUBR (Fmemory_limit);
  DEFSUBR (Fconsing_since_gc);
}

void
vars_of_alloc (void)
{
  DEFVAR_INT ("gc-cons-threshold", &gc_cons_threshold /*
*Number of bytes of consing between garbage collections.
\"Consing\" is a misnomer in that this actually counts allocation
of all different kinds of objects, not just conses.
Garbage collection can happen automatically once this many bytes have been
allocated since the last garbage collection.  All data types count.

Garbage collection happens automatically when `eval' or `funcall' are
called.  (Note that `funcall' is called implicitly as part of evaluation.)
By binding this temporarily to a large number, you can effectively
prevent garbage collection during a part of the program.

See also `consing-since-gc'.
*/ );

  DEFVAR_INT ("pure-bytes-used", &pure_bytes_used /*
Number of bytes of sharable Lisp data allocated so far.
*/ );

#if 0
  DEFVAR_INT ("data-bytes-used", &malloc_sbrk_used /*
Number of bytes of unshared memory allocated in this session.
*/ );

  DEFVAR_INT ("data-bytes-free", &malloc_sbrk_unused /*
Number of bytes of unshared memory remaining available in this session.
*/ );
#endif

#ifdef DEBUG_XEMACS
  DEFVAR_INT ("debug-allocation", &debug_allocation /*
If non-zero, print out information to stderr about all objects allocated.
See also `debug-allocation-backtrace-length'.
*/ );
  debug_allocation = 0;

  DEFVAR_INT ("debug-allocation-backtrace-length",
	      &debug_allocation_backtrace_length /*
Length (in stack frames) of short backtrace printed out by `debug-allocation'.
*/ );
  debug_allocation_backtrace_length = 2;
#endif

  DEFVAR_BOOL ("purify-flag", &purify_flag /*
Non-nil means loading Lisp code in order to dump an executable.
This means that certain objects should be allocated in shared (pure) space.
*/ );

  DEFVAR_LISP ("pre-gc-hook", &Vpre_gc_hook /*
Function or functions to be run just before each garbage collection.
Interrupts, garbage collection, and errors are inhibited while this hook
runs, so be extremely careful in what you add here.  In particular, avoid
consing, and do not interact with the user.
*/ );
  Vpre_gc_hook = Qnil;

  DEFVAR_LISP ("post-gc-hook", &Vpost_gc_hook /*
Function or functions to be run just after each garbage collection.
Interrupts, garbage collection, and errors are inhibited while this hook
runs, so be extremely careful in what you add here.  In particular, avoid
consing, and do not interact with the user.
*/ );
  Vpost_gc_hook = Qnil;

  DEFVAR_LISP ("gc-message", &Vgc_message /*
String to print to indicate that a garbage collection is in progress.
This is printed in the echo area.  If the selected frame is on a
window system and `gc-pointer-glyph' specifies a value (i.e. a pointer
image instance) in the domain of the selected frame, the mouse pointer
will change instead of this message being printed.
*/ );
  Vgc_message = make_pure_string ((CONST Bufbyte *) gc_default_message,
				  countof (gc_default_message) - 1,
				  Qnil, 1);

  DEFVAR_LISP ("gc-pointer-glyph", &Vgc_pointer_glyph /*
Pointer glyph used to indicate that a garbage collection is in progress.
If the selected window is on a window system and this glyph specifies a
value (i.e. a pointer image instance) in the domain of the selected
window, the pointer will be changed as specified during garbage collection.
Otherwise, a message will be printed in the echo area, as controlled
by `gc-message'.
*/ );
}

void
complex_vars_of_alloc (void)
{
  Vgc_pointer_glyph = Fmake_glyph_internal (Qpointer);
}
