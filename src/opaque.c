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
#include <stddef.h>

Lisp_Object Qopaquep;

static int in_opaque_list_marking;

/* Holds freed opaque objects created with make_opaque_ptr().
   We do this quite often so it's a noticeable win if we don't
   create GC junk. */
Lisp_Object Vopaque_ptr_free_list;

static Lisp_Object
mark_opaque (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  Lisp_Opaque *p = XOPAQUE (obj);
  /* Egcs 1.1.1 sometimes crashes on INTP (p->size_or_chain) */
  Lisp_Object size_or_chain = p->size_or_chain;
#ifdef ERROR_CHECK_GC
  if (!in_opaque_list_marking)
    /* size is non-int for objects on an opaque free list.  We sure
       as hell better not be marking any of these objects unless
       we're marking an opaque list. */
    assert (GC_INTP (size_or_chain));
  else
    /* marking an opaque on the free list doesn't do any recursive
       markings, so we better not have non-freed opaques on a free
       list. */
    assert (!GC_INTP (size_or_chain));
#endif
  if (GC_INTP (size_or_chain) && OPAQUE_MARKFUN (p))
    return OPAQUE_MARKFUN (p) (obj, markobj);
  else
    return size_or_chain;
}

/* Should never, ever be called. (except by an external debugger) */
static void
print_opaque (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  CONST Lisp_Opaque *p = XOPAQUE (obj);
  /* Egcs 1.1.1 sometimes crashes on INTP (p->size_or_chain) */
  Lisp_Object size_or_chain = p->size_or_chain;
  char buf[200];
  char size_buf[50];

  if (INTP (size_or_chain))
    sprintf (size_buf, "size=%lu", (unsigned long) OPAQUE_SIZE (p));
  else
    sprintf (size_buf, "freed");

  sprintf (buf, "#<INTERNAL OBJECT (XEmacs bug?) (opaque, %s) 0x%lx>",
	   size_buf, (unsigned long) p);
  write_c_string (buf, printcharfun);
}

static size_t
sizeof_opaque (CONST void *header)
{
  CONST Lisp_Opaque *p = (CONST Lisp_Opaque *) header;
  /* Egcs 1.1.1 sometimes crashes on INTP (p->size_or_chain) */
  Lisp_Object size_or_chain = p->size_or_chain;
  return offsetof (Lisp_Opaque, data)
    + (GC_INTP (size_or_chain) ? XINT (size_or_chain) : 0);
}

/* Return an opaque object of size SIZE.
   If DATA is OPAQUE_CLEAR, the object's data is memset to '\0' bytes.
   If DATA is OPAQUE_UNINIT, the object's data is uninitialized.
   Else the object's data is initialized by copying from DATA. */
Lisp_Object
make_opaque (size_t size, CONST void *data)
{
  Lisp_Opaque *p = (Lisp_Opaque *)
    alloc_lcrecord (offsetof (Lisp_Opaque, data) + size, &lrecord_opaque);
  p->markfun = 0;
  p->size_or_chain = make_int (size);

  if (data == OPAQUE_CLEAR)
    memset (p->data, '\0', size);
  else if (data == OPAQUE_UNINIT)
    DO_NOTHING;
  else
    memcpy (p->data, data, size);

  {
    Lisp_Object val;
    XSETOPAQUE (val, p);
    return val;
  }
}

/* This will not work correctly for opaques with subobjects! */

static int
equal_opaque (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
#ifdef DEBUG_XEMACS
  {
    /* Egcs 1.1.1 sometimes crashes on INTP (p->size_or_chain) */
    Lisp_Object size_or_chain_1 = XOPAQUE (obj1)->size_or_chain;
    Lisp_Object size_or_chain_2 = XOPAQUE (obj2)->size_or_chain;
    assert (INTP (size_or_chain_1));
    assert (INTP (size_or_chain_2));
    assert (!XOPAQUE_MARKFUN (obj1) && !XOPAQUE_MARKFUN (obj2));
  }
#endif
  {
    size_t size;
    return ((size = XOPAQUE_SIZE (obj1)) == XOPAQUE_SIZE (obj2) &&
	    !memcmp (XOPAQUE_DATA (obj1), XOPAQUE_DATA (obj2), size));
  }
}

/* This will not work correctly for opaques with subobjects! */

static unsigned long
hash_opaque (Lisp_Object obj, int depth)
{
#ifdef DEBUG_XEMACS
  {
    /* Egcs 1.1.1 sometimes crashes on INTP (p->size_or_chain) */
    Lisp_Object size_or_chain = XOPAQUE (obj)->size_or_chain;
    assert (INTP (size_or_chain));
    assert (!XOPAQUE_MARKFUN (obj));
  }
#endif
  if (XOPAQUE_SIZE (obj) == sizeof (unsigned long))
    return *((unsigned long *) XOPAQUE_DATA (obj));
  else
    return memory_hash (XOPAQUE_DATA (obj), XOPAQUE_SIZE (obj));
}

DEFINE_LRECORD_SEQUENCE_IMPLEMENTATION ("opaque", opaque,
					mark_opaque, print_opaque, 0,
					equal_opaque, hash_opaque,
					sizeof_opaque, Lisp_Opaque);

static Lisp_Object
mark_opaque_list (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  in_opaque_list_marking++;
  markobj (XOPAQUE_LIST (obj)->free);
  in_opaque_list_marking--;
  return Qnil;
}

Lisp_Object
make_opaque_list (size_t size,
		  Lisp_Object (*markfun) (Lisp_Object obj,
					  void (*markobj) (Lisp_Object)))
{
  Lisp_Object val;
  Lisp_Opaque_List *p =
    alloc_lcrecord_type (Lisp_Opaque_List, &lrecord_opaque_list);

  p->markfun = markfun;
  p->size = size;
  p->free = Qnil;
  XSETOPAQUE_LIST (val, p);
  return val;
}

DEFINE_LRECORD_IMPLEMENTATION ("opaque-list", opaque_list,
			       mark_opaque_list, internal_object_printer,
			       0, 0, 0, Lisp_Opaque_List);

Lisp_Object
allocate_managed_opaque (Lisp_Object opaque_list, CONST void *data)
{
  Lisp_Opaque_List *li = XOPAQUE_LIST (opaque_list);
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
  Lisp_Opaque_List *li = XOPAQUE_LIST (opaque_list);

#ifdef ERROR_CHECK_GC
  {
    /* Egcs 1.1.1 sometimes crashes on INTP (p->size_or_chain) */
    Lisp_Object size_or_chain = XOPAQUE (opaque)->size_or_chain;
    assert (INTP (size_or_chain));
  }
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

/* Be very very careful with this.  Same admonitions as with
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
