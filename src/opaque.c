/* Opaque Lisp objects.
   Copyright (C) 1993, 1994, 1995 Sun Microsystems, Inc.
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

/* Synched up with: Not in FSF. */

/* Written by Ben Wing, October 1993. */

/* "Opaque" is used internally to hold keep track of allocated memory
   so it gets GC'd properly, and to store arbitrary data in places
   where a Lisp_Object is required and which may get GC'd. (e.g.  as
   the argument to record_unwind_protect()).  Once created in C,
   opaque objects cannot be resized.

   OPAQUE OBJECTS SHOULD NEVER ESCAPE TO THE LISP LEVEL.  Some code
   depends on this.  As such, opaque objects are a generalization
   of the Qunbound marker.

   "Opaque lists" are used to keep track of lots of opaque objects
   of a particular size so that they can be efficiently "freed" and
   re-used again without actually entering the Lisp allocation system
   (and consequently doing a malloc()).
 */

#include <config.h>
#include "lisp.h"
#include "opaque.h"

Lisp_Object Qopaquep;

static int in_opaque_list_marking;

/* Holds freed opaque objects created with make_opaque_ptr().
   We do this quite often so it's a noticeable win if we don't
   create GC junk. */
Lisp_Object Vopaque_ptr_free_list;

static Lisp_Object
mark_opaque (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
#ifdef ERROR_CHECK_GC
  if (!in_opaque_list_marking)
    /* size is non-int for objects on an opaque free list.  We sure
       as hell better not be marking any of these objects unless
       we're marking an opaque list. */
    assert (INTP (XOPAQUE (obj)->size_or_chain));
  else
    /* marking an opaque on the free list doesn't do any recursive
       markings, so we better not have non-freed opaques on a free
       list. */
    assert (!INTP (XOPAQUE (obj)->size_or_chain));
#endif
  if (INTP (XOPAQUE (obj)->size_or_chain) && XOPAQUE_MARKFUN (obj))
    return XOPAQUE_MARKFUN (obj) (obj, markobj);
  else
    return XOPAQUE (obj)->size_or_chain;
}

/* Should never, ever be called. (except by an external debugger) */
static void
print_opaque (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  char buf[200];
  if (INTP (XOPAQUE (obj)->size_or_chain))
    sprintf (buf, "#<INTERNAL EMACS BUG (opaque, size=%ld) 0x%lx>",
	     (long) XOPAQUE_SIZE (obj), (unsigned long) XPNTR (obj));
  else
    sprintf (buf, "#<INTERNAL EMACS BUG (opaque, freed) 0x%lx>",
	     (unsigned long) XPNTR (obj));
  write_c_string (buf, printcharfun);
}

static size_t
sizeof_opaque (CONST void *header)
{
  CONST struct Lisp_Opaque *p = (CONST struct Lisp_Opaque *) header;
  if (!INTP (p->size_or_chain))
    return sizeof (*p);
  return sizeof (*p) + XINT (p->size_or_chain) - sizeof (int);
}

Lisp_Object
make_opaque (int size, CONST void *data)
{
  struct Lisp_Opaque *p = (struct Lisp_Opaque *)
    alloc_lcrecord (sizeof (*p) + size - sizeof (int), lrecord_opaque);
  Lisp_Object val;

  p->markfun = 0;
  p->size_or_chain = make_int (size);
  if (data)
    memcpy (p->data, data, size);
  else
    memset (p->data, 0, size);
  XSETOPAQUE (val, p);
  return val;
}

/* This will not work correctly for opaques with subobjects! */

static int
equal_opaque (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
#ifdef DEBUG_XEMACS
  assert (!XOPAQUE_MARKFUN (obj1) && !XOPAQUE_MARKFUN (obj2));
  assert (INTP (XOPAQUE(obj1)->size_or_chain));
  assert (INTP (XOPAQUE(obj2)->size_or_chain));
#endif
  if (XOPAQUE_SIZE(obj1) != XOPAQUE_SIZE(obj2))
    return 0;
  return (XOPAQUE_SIZE(obj1) == sizeof(*XOPAQUE_DATA(obj1))
	  ? *XOPAQUE_DATA(obj1) == *XOPAQUE_DATA(obj2)
	  : memcmp (XOPAQUE_DATA(obj1), XOPAQUE_DATA(obj2),
		    XOPAQUE_SIZE(obj1)) == 0);
}

/* This will not work correctly for opaques with subobjects! */

static unsigned long
hash_opaque (Lisp_Object obj, int depth)
{
#ifdef DEBUG_XEMACS
  assert (!XOPAQUE_MARKFUN (obj));
  assert (INTP (XOPAQUE(obj)->size_or_chain));
#endif
  if (XOPAQUE_SIZE(obj) == sizeof (unsigned long))
    return (unsigned int) *XOPAQUE_DATA(obj);
  else
    return memory_hash (XOPAQUE_DATA(obj), XOPAQUE_SIZE(obj));
}

DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION ("opaque", opaque,
					mark_opaque, print_opaque, 0,
					equal_opaque, hash_opaque,
					sizeof_opaque, struct Lisp_Opaque);

static Lisp_Object
mark_opaque_list (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  in_opaque_list_marking++;
  (markobj) (XOPAQUE_LIST (obj)->free);
  in_opaque_list_marking--;
  return Qnil;
}

Lisp_Object
make_opaque_list (int size,
		  Lisp_Object (*markfun) (Lisp_Object obj,
					  void (*markobj) (Lisp_Object)))
{
  Lisp_Object val;
  struct Lisp_Opaque_List *p =
    alloc_lcrecord_type (struct Lisp_Opaque_List, lrecord_opaque_list);

  p->markfun = markfun;
  p->size = size;
  p->free = Qnil;
  XSETOPAQUE_LIST (val, p);
  return val;
}

DEFINE_LRECORD_IMPLEMENTATION ("opaque-list", opaque_list,
			       mark_opaque_list, internal_object_printer,
			       0, 0, 0, struct Lisp_Opaque_List);

Lisp_Object
allocate_managed_opaque (Lisp_Object opaque_list, CONST void *data)
{
  struct Lisp_Opaque_List *li = XOPAQUE_LIST (opaque_list);
  Lisp_Object val;

  if (!NILP (li->free))
    {
      val = li->free;
      li->free = XOPAQUE (val)->size_or_chain;
#ifdef ERROR_CHECK_GC
      assert (NILP (li->free) || OPAQUEP (li->free));
#endif
      XOPAQUE (val)->size_or_chain = make_int (li->size);
      if (data)
	memcpy (XOPAQUE (val)->data, data, li->size);
      else
	memset (XOPAQUE (val)->data, 0, li->size);
    }
  else
    val = make_opaque (li->size, data);
  XOPAQUE (val)->markfun = li->markfun;
  return val;
}

void
free_managed_opaque (Lisp_Object opaque_list, Lisp_Object opaque)
{
  struct Lisp_Opaque_List *li = XOPAQUE_LIST (opaque_list);

#ifdef ERROR_CHECK_GC
  assert (INTP (XOPAQUE (opaque)->size_or_chain));
#endif
  XOPAQUE (opaque)->size_or_chain = li->free;
  li->free = opaque;
}

/* stuff to handle opaque pointers */

Lisp_Object
make_opaque_ptr (CONST void *val)
{
  return allocate_managed_opaque (Vopaque_ptr_free_list,
				  (CONST void *) &val);
}

/* Be wery wery careful with this.  Same admonitions as with
   free_cons() apply. */

void
free_opaque_ptr (Lisp_Object ptr)
{
  free_managed_opaque (Vopaque_ptr_free_list, ptr);
}

Lisp_Object
make_opaque_long (long val)
{
  return make_opaque (sizeof (val), (void *) &val);
}

void
init_opaque_once_early (void)
{
  Vopaque_ptr_free_list = make_opaque_list (sizeof (void *), 0);
  staticpro (&Vopaque_ptr_free_list);
}
