/* Opaque Lisp objects.
   Copyright (C) 1993 Sun Microsystems, Inc.
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

#ifndef _XEMACS_OPAQUE_H_
#define _XEMACS_OPAQUE_H_

typedef union {
  struct { Lisp_Object obj; } obj;
  struct { void *p; } p;
  struct { double d; } d;
} max_align_t;

typedef struct Lisp_Opaque
{
  struct lcrecord_header header;
  Lisp_Object (*markfun) (Lisp_Object obj, void (*markobj) (Lisp_Object));
  /* An integral size for non-freed objects, an opaque or nil for
     freed objects. */
  Lisp_Object size_or_chain;
  max_align_t data[1];
} Lisp_Opaque;

typedef struct Lisp_Opaque_List
{
  struct lcrecord_header header;
  /* `markfun' allows you to put lisp objects inside of opaque objects
     without having to create a new object type. */
  Lisp_Object (*markfun) (Lisp_Object obj, void (*markobj) (Lisp_Object));
  Lisp_Object free;
  size_t size;
} Lisp_Opaque_List;

DECLARE_LRECORD (opaque, Lisp_Opaque);
#define XOPAQUE(x) XRECORD (x, opaque, Lisp_Opaque)
#define XSETOPAQUE(x, p) XSETRECORD (x, p, opaque)
#define OPAQUEP(x) RECORDP (x, opaque)
#define GC_OPAQUEP(x) GC_RECORDP (x, opaque)
/* #define CHECK_OPAQUE(x) CHECK_RECORD (x, opaque)
   Opaque pointers should never escape to the Lisp level, so
   functions should not be doing this. */

DECLARE_LRECORD (opaque_list, Lisp_Opaque_List);
#define XOPAQUE_LIST(x) XRECORD (x, opaque_list, Lisp_Opaque_List)
#define XSETOPAQUE_LIST(x, p) XSETRECORD (x, p, opaque_list)
#define OPAQUE_LISTP(x) RECORDP (x, opaque_list)
#define GC_OPAQUE_LISTP(x) GC_RECORDP (x, opaque_list)
/* #define CHECK_OPAQUE_LIST(x) CHECK_RECORD (x, opaque_list)
   Opaque lists should never escape to the Lisp level, so
   functions should not be doing this. */

/* Alternative DATA arguments to make_opaque */
#define OPAQUE_CLEAR  ((CONST void *)  0)
#define OPAQUE_UNINIT ((CONST void *) -1)

Lisp_Object make_opaque (size_t size, CONST void *data);
Lisp_Object make_opaque_ptr (CONST void *val);
Lisp_Object make_opaque_long (long val);
void free_opaque_ptr (Lisp_Object ptr);

#define OPAQUE_SIZE(op) XINT ((op)->size_or_chain)
#define OPAQUE_DATA(op) ((void *) ((op)->data))
#define OPAQUE_MARKFUN(op) ((op)->markfun)
#define XOPAQUE_SIZE(op) OPAQUE_SIZE (XOPAQUE (op))
#define XOPAQUE_DATA(op) OPAQUE_DATA (XOPAQUE (op))
#define XOPAQUE_MARKFUN(op) OPAQUE_MARKFUN (XOPAQUE (op))

#define get_opaque_ptr(op) (* (void **) XOPAQUE_DATA (op))
#define set_opaque_ptr(op, ptr) (get_opaque_ptr (op) = (void *) ptr)
#define get_opaque_long(op) (* (long *) XOPAQUE_DATA (op))
#define set_opaque_long(op, ptr) (get_opaque_long (op) = ptr)
#define set_opaque_markfun(op, fun) (XOPAQUE_MARKFUN (op) = fun)

Lisp_Object make_opaque_list (size_t size,
			      Lisp_Object (*markfun)
			      (Lisp_Object obj,
			       void (*markobj) (Lisp_Object)));
Lisp_Object allocate_managed_opaque (Lisp_Object opaque_list,
				     CONST void *data);
void free_managed_opaque (Lisp_Object opaque_list, Lisp_Object opaque);

#endif /* _XEMACS_OPAQUE_H_ */
