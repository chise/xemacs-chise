/* Portable data dumper for XEmacs.
   Copyright (C) 1999-2000 Olivier Galibert

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

#include <config.h>
#include "lisp.h"

#include "dump-id.h"
#include "specifier.h"
#include "alloc.h"
#include "elhash.h"
#include "sysfile.h"
#include "console-stream.h"
#include "dumper.h"

#ifdef WIN32_NATIVE
#include "nt.h"
#else
#ifdef HAVE_MMAP
#include <sys/mman.h>
#endif
#endif

#ifndef SEPCHAR
#define SEPCHAR ':'
#endif

typedef struct
{
  const struct lrecord_description *desc;
  int count;
} pdump_reloc_table;

static char *pdump_rt_list = 0;

void
pdump_objects_unmark (void)
{
  int i;
  char *p = pdump_rt_list;
  if (p)
    for (;;)
      {
	pdump_reloc_table *rt = (pdump_reloc_table *)p;
	p += sizeof (pdump_reloc_table);
	if (rt->desc)
	  {
	    for (i=0; i<rt->count; i++)
	      {
		struct lrecord_header *lh = * (struct lrecord_header **) p;
		if (! C_READONLY_RECORD_HEADER_P (lh))
		  UNMARK_RECORD_HEADER (lh);
		p += sizeof (EMACS_INT);
	      }
	  } else
	    break;
      }
}


/* The structure of the file
 *
 * 0			- header
 * 256			- dumped objects
 * stab_offset		- nb_staticpro*(Lisp_Object *) from staticvec
 *			- nb_staticpro*(relocated Lisp_Object) pointed to by staticpro
 *			- nb_structdmp*pair(void *, adr) for pointers to structures
 *			- lrecord_implementations_table[]
 *			- relocation table
 *                      - wired variable address/value couples with the count preceding the list
 */


#define DUMP_SIGNATURE "XEmacsDP"
#define DUMP_SIGNATURE_LEN (sizeof (DUMP_SIGNATURE) - 1)

typedef struct
{
  char signature[DUMP_SIGNATURE_LEN];
  unsigned int id;
  EMACS_UINT stab_offset;
  EMACS_UINT reloc_address;
  int nb_staticpro;
  int nb_structdmp;
  int nb_opaquedmp;
} dump_header;

char *pdump_start, *pdump_end;
static size_t pdump_length;

#ifdef WIN32_NATIVE
// Handle for the dump file
HANDLE pdump_hFile = INVALID_HANDLE_VALUE;
// Handle for the file mapping object for the dump file
HANDLE pdump_hMap = INVALID_HANDLE_VALUE;
#endif

void (*pdump_free) (void);

static const unsigned char align_table[256] =
{
  8, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,
  4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0
};

typedef struct pdump_entry_list_elmt
{
  struct pdump_entry_list_elmt *next;
  const void *obj;
  size_t size;
  int count;
  int is_lrecord;
  EMACS_INT save_offset;
} pdump_entry_list_elmt;

typedef struct
{
  pdump_entry_list_elmt *first;
  int align;
  int count;
} pdump_entry_list;

typedef struct pdump_struct_list_elmt
{
  pdump_entry_list list;
  const struct struct_description *sdesc;
} pdump_struct_list_elmt;

typedef struct
{
  pdump_struct_list_elmt *list;
  int count;
  int size;
} pdump_struct_list;

static pdump_entry_list pdump_object_table[256];
static pdump_entry_list pdump_opaque_data_list;
static pdump_struct_list pdump_struct_table;
static pdump_entry_list_elmt *pdump_qnil;

static int pdump_alert_undump_object[256];

static unsigned long cur_offset;
static size_t max_size;
static int pdump_fd;
static void *pdump_buf;

#define PDUMP_HASHSIZE 200001

static pdump_entry_list_elmt **pdump_hash;

/* Since most pointers are eight bytes aligned, the >>3 allows for a better hash */
static int
pdump_make_hash (const void *obj)
{
  return ((unsigned long)(obj)>>3) % PDUMP_HASHSIZE;
}

static pdump_entry_list_elmt *
pdump_get_entry (const void *obj)
{
  int pos = pdump_make_hash (obj);
  pdump_entry_list_elmt *e;

  assert (obj != 0);

  while ((e = pdump_hash[pos]) != 0)
    {
      if (e->obj == obj)
	return e;

      pos++;
      if (pos == PDUMP_HASHSIZE)
	pos = 0;
    }
  return 0;
}

static void
pdump_add_entry (pdump_entry_list *list, const void *obj, size_t size, int count, int is_lrecord)
{
  pdump_entry_list_elmt *e;
  int align;
  int pos = pdump_make_hash (obj);

  while ((e = pdump_hash[pos]) != 0)
    {
      if (e->obj == obj)
	return;

      pos++;
      if (pos == PDUMP_HASHSIZE)
	pos = 0;
    }

  e = xnew (pdump_entry_list_elmt);

  e->next = list->first;
  e->obj = obj;
  e->size = size;
  e->count = count;
  e->is_lrecord = is_lrecord;
  list->first = e;

  list->count += count;
  pdump_hash[pos] = e;

  align = align_table[size & 255];
  if (align < 2 && is_lrecord)
    align = 2;

  if (align < list->align)
    list->align = align;
}

static pdump_entry_list *
pdump_get_entry_list (const struct struct_description *sdesc)
{
  int i;
  for (i=0; i<pdump_struct_table.count; i++)
    if (pdump_struct_table.list[i].sdesc == sdesc)
      return &pdump_struct_table.list[i].list;

  if (pdump_struct_table.size <= pdump_struct_table.count)
    {
      if (pdump_struct_table.size == -1)
	pdump_struct_table.size = 10;
      else
	pdump_struct_table.size = pdump_struct_table.size * 2;
      pdump_struct_table.list = (pdump_struct_list_elmt *)
	xrealloc (pdump_struct_table.list,
		  pdump_struct_table.size * sizeof (pdump_struct_list_elmt));
    }
  pdump_struct_table.list[pdump_struct_table.count].list.first = 0;
  pdump_struct_table.list[pdump_struct_table.count].list.align = 8;
  pdump_struct_table.list[pdump_struct_table.count].list.count = 0;
  pdump_struct_table.list[pdump_struct_table.count].sdesc = sdesc;

  return &pdump_struct_table.list[pdump_struct_table.count++].list;
}

static struct
{
  struct lrecord_header *obj;
  int position;
  int offset;
} backtrace[65536];

static int depth;

static void pdump_backtrace (void)
{
  int i;
  stderr_out ("pdump backtrace :\n");
  for (i=0;i<depth;i++)
    {
      if (!backtrace[i].obj)
	stderr_out ("  - ind. (%d, %d)\n", backtrace[i].position, backtrace[i].offset);
      else
	{
	  stderr_out ("  - %s (%d, %d)\n",
		   LHEADER_IMPLEMENTATION (backtrace[i].obj)->name,
		   backtrace[i].position,
		   backtrace[i].offset);
	}
    }
}

static void pdump_register_object (Lisp_Object obj);
static void pdump_register_struct (const void *data, const struct struct_description *sdesc, int count);

static EMACS_INT
pdump_get_indirect_count (EMACS_INT code, const struct lrecord_description *idesc, const void *idata)
{
  EMACS_INT count;
  const void *irdata;

  int line = XD_INDIRECT_VAL (code);
  int delta = XD_INDIRECT_DELTA (code);

  irdata = ((char *)idata) + idesc[line].offset;
  switch (idesc[line].type)
    {
    case XD_SIZE_T:
      count = *(size_t *)irdata;
      break;
    case XD_INT:
      count = *(int *)irdata;
      break;
    case XD_LONG:
      count = *(long *)irdata;
      break;
    case XD_BYTECOUNT:
      count = *(Bytecount *)irdata;
      break;
    default:
      stderr_out ("Unsupported count type : %d (line = %d, code=%ld)\n", idesc[line].type, line, (long)code);
      pdump_backtrace ();
      abort ();
    }
  count += delta;
  return count;
}

static void
pdump_register_sub (const void *data, const struct lrecord_description *desc, int me)
{
  int pos;

 restart:
  for (pos = 0; desc[pos].type != XD_END; pos++)
    {
      const void *rdata = (const char *)data + desc[pos].offset;

      backtrace[me].position = pos;
      backtrace[me].offset = desc[pos].offset;

      switch (desc[pos].type)
	{
	case XD_SPECIFIER_END:
	  pos = 0;
	  desc = ((const Lisp_Specifier *)data)->methods->extra_description;
	  goto restart;
	case XD_SIZE_T:
	case XD_INT:
	case XD_LONG:
	case XD_BYTECOUNT:
	case XD_LO_RESET_NIL:
	case XD_INT_RESET:
	case XD_LO_LINK:
	  break;
	case XD_OPAQUE_DATA_PTR:
	  {
	    EMACS_INT count = desc[pos].data1;
	    if (XD_IS_INDIRECT (count))
	      count = pdump_get_indirect_count (count, desc, data);

	    pdump_add_entry (&pdump_opaque_data_list,
			     *(void **)rdata,
			     count,
			     1,
			     0);
	    break;
	  }
	case XD_C_STRING:
	  {
	    const char *str = *(const char **)rdata;
	    if (str)
	      pdump_add_entry (&pdump_opaque_data_list, str, strlen (str)+1, 1, 0);
	    break;
	  }
	case XD_DOC_STRING:
	  {
	    const char *str = *(const char **)rdata;
	    if ((EMACS_INT)str > 0)
	      pdump_add_entry (&pdump_opaque_data_list, str, strlen (str)+1, 1, 0);
	    break;
	  }
	case XD_LISP_OBJECT:
	  {
	    const Lisp_Object *pobj = (const Lisp_Object *)rdata;

	    assert (desc[pos].data1 == 0);

	    backtrace[me].offset = (const char *)pobj - (const char *)data;
	    pdump_register_object (*pobj);
	    break;
	  }
	case XD_LISP_OBJECT_ARRAY:
	  {
	    int i;
	    EMACS_INT count = desc[pos].data1;
	    if (XD_IS_INDIRECT (count))
	      count = pdump_get_indirect_count (count, desc, data);

	    for (i = 0; i < count; i++)
	      {
		const Lisp_Object *pobj = ((const Lisp_Object *)rdata) + i;
		Lisp_Object dobj = *pobj;

		backtrace[me].offset = (const char *)pobj - (const char *)data;
		pdump_register_object (dobj);
	      }
	    break;
	  }
	case XD_STRUCT_PTR:
	  {
	    EMACS_INT count = desc[pos].data1;
	    const struct struct_description *sdesc = desc[pos].data2;
	    const char *dobj = *(const char **)rdata;
	    if (dobj)
	      {
		if (XD_IS_INDIRECT (count))
		  count = pdump_get_indirect_count (count, desc, data);

		pdump_register_struct (dobj, sdesc, count);
	      }
	    break;
	  }
	default:
	  stderr_out ("Unsupported dump type : %d\n", desc[pos].type);
	  pdump_backtrace ();
	  abort ();
	};
    }
}

static void
pdump_register_object (Lisp_Object obj)
{
  struct lrecord_header *objh;

  if (!POINTER_TYPE_P (XTYPE (obj)))
    return;

  objh = XRECORD_LHEADER (obj);
  if (!objh)
    return;

  if (pdump_get_entry (objh))
    return;

  if (LHEADER_IMPLEMENTATION (objh)->description)
    {
      int me = depth++;
      if (me>65536)
	{
	  stderr_out ("Backtrace overflow, loop ?\n");
	  abort ();
	}
      backtrace[me].obj = objh;
      backtrace[me].position = 0;
      backtrace[me].offset = 0;

      pdump_add_entry (pdump_object_table + objh->type,
		       objh,
		       LHEADER_IMPLEMENTATION (objh)->static_size ?
		       LHEADER_IMPLEMENTATION (objh)->static_size :
		       LHEADER_IMPLEMENTATION (objh)->size_in_bytes_method (objh),
		       1,
		       1);
      pdump_register_sub (objh,
			  LHEADER_IMPLEMENTATION (objh)->description,
			  me);
      --depth;
    }
  else
    {
      pdump_alert_undump_object[objh->type]++;
      stderr_out ("Undumpable object type : %s\n", LHEADER_IMPLEMENTATION (objh)->name);
      pdump_backtrace ();
    }
}

static void
pdump_register_struct (const void *data, const struct struct_description *sdesc, int count)
{
  if (data && !pdump_get_entry (data))
    {
      int me = depth++;
      int i;
      if (me>65536)
	{
	  stderr_out ("Backtrace overflow, loop ?\n");
	  abort ();
	}
      backtrace[me].obj = 0;
      backtrace[me].position = 0;
      backtrace[me].offset = 0;

      pdump_add_entry (pdump_get_entry_list (sdesc),
		       data,
		       sdesc->size,
		       count,
		       0);
      for (i=0; i<count; i++)
	{
	  pdump_register_sub (((char *)data) + sdesc->size*i,
			      sdesc->description,
			      me);
	}
      --depth;
    }
}

static void
pdump_dump_data (pdump_entry_list_elmt *elmt, const struct lrecord_description *desc)
{
  size_t size = elmt->size;
  int count = elmt->count;
  if (desc)
    {
      int pos, i;
      memcpy (pdump_buf, elmt->obj, size*count);

      for (i=0; i<count; i++)
	{
	  char *cur = ((char *)pdump_buf) + i*size;
	restart:
	  for (pos = 0; desc[pos].type != XD_END; pos++)
	    {
	      void *rdata = cur + desc[pos].offset;
	      switch (desc[pos].type)
		{
		case XD_SPECIFIER_END:
		  desc = ((const Lisp_Specifier *)(elmt->obj))->methods->extra_description;
		  goto restart;
		case XD_SIZE_T:
		case XD_INT:
		case XD_LONG:
		case XD_BYTECOUNT:
		  break;
		case XD_LO_RESET_NIL:
		  {
		    EMACS_INT num = desc[pos].data1;
		    int j;
		    if (XD_IS_INDIRECT (num))
		      num = pdump_get_indirect_count (num, desc, elmt->obj);
		    for (j=0; j<num; j++)
		      ((EMACS_INT *)rdata)[j] = pdump_qnil->save_offset;
		    break;
		  }
		case XD_INT_RESET:
		  {
		    EMACS_INT val = desc[pos].data1;
		    if (XD_IS_INDIRECT (val))
		      val = pdump_get_indirect_count (val, desc, elmt->obj);
		    *(int *)rdata = val;
		    break;
		  }
		case XD_OPAQUE_DATA_PTR:
		case XD_C_STRING:
		case XD_STRUCT_PTR:
		  {
		    void *ptr = *(void **)rdata;
		    if (ptr)
		      *(EMACS_INT *)rdata = pdump_get_entry (ptr)->save_offset;
		    break;
		  }
		case XD_LO_LINK:
		  {
		    Lisp_Object obj = *(Lisp_Object *)rdata;
		    pdump_entry_list_elmt *elmt1;
		    for (;;)
		      {
			elmt1 = pdump_get_entry (XRECORD_LHEADER (obj));
			if (elmt1)
			  break;
			obj = *(Lisp_Object *)(desc[pos].offset + (char *)(XRECORD_LHEADER (obj)));
		      }
		    *(EMACS_INT *)rdata = elmt1->save_offset;
		    break;
		  }
		case XD_LISP_OBJECT:
		  {
		    Lisp_Object *pobj = (Lisp_Object *) rdata;

		    assert (desc[pos].data1 == 0);

		    if (POINTER_TYPE_P (XTYPE (*pobj)) && XRECORD_LHEADER (*pobj))
		      *(EMACS_INT *)pobj =
			pdump_get_entry (XRECORD_LHEADER (*pobj))->save_offset;
		    break;
		  }
		case XD_LISP_OBJECT_ARRAY:
		  {
		    EMACS_INT num = desc[pos].data1;
		    int j;
		    if (XD_IS_INDIRECT (num))
		      num = pdump_get_indirect_count (num, desc, elmt->obj);

		    for (j=0; j<num; j++)
		      {
			Lisp_Object *pobj = ((Lisp_Object *)rdata) + j;
			if (POINTER_TYPE_P (XTYPE (*pobj)) && XRECORD_LHEADER (*pobj))
			  *(EMACS_INT *)pobj =
			    pdump_get_entry (XRECORD_LHEADER (*pobj))->save_offset;
		      }
		    break;
		  }
		case XD_DOC_STRING:
		  {
		    EMACS_INT str = *(EMACS_INT *)rdata;
		    if (str > 0)
		      *(EMACS_INT *)rdata = pdump_get_entry ((void *)str)->save_offset;
		    break;
		  }
		default:
		  stderr_out ("Unsupported dump type : %d\n", desc[pos].type);
		  abort ();
		};
	    }
	}
    }
  write (pdump_fd, desc ? pdump_buf : elmt->obj, size*count);
  if (elmt->is_lrecord && ((size*count) & 3))
    write (pdump_fd, "\0\0\0", 4-((size*count) & 3));
}

static void
pdump_reloc_one (void *data, EMACS_INT delta, const struct lrecord_description *desc)
{
  int pos;

 restart:
  for (pos = 0; desc[pos].type != XD_END; pos++)
    {
      void *rdata = (char *)data + desc[pos].offset;
      switch (desc[pos].type)
	{
	case XD_SPECIFIER_END:
	  pos = 0;
	  desc = ((const Lisp_Specifier *)data)->methods->extra_description;
	  goto restart;
	case XD_SIZE_T:
	case XD_INT:
	case XD_LONG:
	case XD_BYTECOUNT:
	case XD_INT_RESET:
	  break;
	case XD_OPAQUE_DATA_PTR:
	case XD_C_STRING:
	case XD_STRUCT_PTR:
	case XD_LO_LINK:
	  {
	    EMACS_INT ptr = *(EMACS_INT *)rdata;
	    if (ptr)
	      *(EMACS_INT *)rdata = ptr+delta;
	    break;
	  }
	case XD_LISP_OBJECT:
	  {
	    Lisp_Object *pobj = (Lisp_Object *) rdata;

	    assert (desc[pos].data1 == 0);

	    if (POINTER_TYPE_P (XTYPE (*pobj))
		&& ! EQ (*pobj, Qnull_pointer))
	      XSETOBJ (*pobj, XTYPE (*pobj), (char *) XPNTR (*pobj) + delta);

	    break;
	  }
	case XD_LISP_OBJECT_ARRAY:
	case XD_LO_RESET_NIL:
	  {
	    EMACS_INT num = desc[pos].data1;
	    int j;
	    if (XD_IS_INDIRECT (num))
	      num = pdump_get_indirect_count (num, desc, data);

	    for (j=0; j<num; j++)
	      {
		Lisp_Object *pobj = (Lisp_Object *) rdata + j;

		if (POINTER_TYPE_P (XTYPE (*pobj))
		    && ! EQ (*pobj, Qnull_pointer))
		  XSETOBJ (*pobj, XTYPE (*pobj), (char *) XPNTR (*pobj) + delta);
	      }
	    break;
	  }
	case XD_DOC_STRING:
	  {
	    EMACS_INT str = *(EMACS_INT *)rdata;
	    if (str > 0)
	      *(EMACS_INT *)rdata = str + delta;
	    break;
	  }
	default:
	  stderr_out ("Unsupported dump type : %d\n", desc[pos].type);
	  abort ();
	};
    }
}

static void
pdump_allocate_offset (pdump_entry_list_elmt *elmt, const struct lrecord_description *desc)
{
  size_t size = (elmt->is_lrecord ? (elmt->size + 3) & ~3 : elmt->size)*elmt->count;
  elmt->save_offset = cur_offset;
  if (size>max_size)
    max_size = size;
  cur_offset += size;
}

static void
pdump_scan_by_alignment (void (*f)(pdump_entry_list_elmt *, const struct lrecord_description *))
{
  int align, i;
  const struct lrecord_description *idesc;
  pdump_entry_list_elmt *elmt;
  for (align=8; align>=0; align--)
    {
      for (i=0; i<lrecord_type_count; i++)
	if (pdump_object_table[i].align == align)
	  {
	    elmt = pdump_object_table[i].first;
	    if (!elmt)
	      continue;
	    idesc = lrecord_implementations_table[i]->description;
	    while (elmt)
	      {
		f (elmt, idesc);
		elmt = elmt->next;
	      }
	  }

      for (i=0; i<pdump_struct_table.count; i++)
	if (pdump_struct_table.list[i].list.align == align)
	  {
	    elmt = pdump_struct_table.list[i].list.first;
	    idesc = pdump_struct_table.list[i].sdesc->description;
	    while (elmt)
	      {
		f (elmt, idesc);
		elmt = elmt->next;
	      }
	  }

      elmt = pdump_opaque_data_list.first;
      while (elmt)
	{
	  if (align_table[elmt->size & 255] == align)
	    f (elmt, 0);
	  elmt = elmt->next;
	}
    }
}

static void
pdump_dump_staticvec (void)
{
  EMACS_INT *reloc = xnew_array (EMACS_INT, staticidx);
  int i;
  write (pdump_fd, staticvec, staticidx*sizeof (Lisp_Object *));

  for (i=0; i<staticidx; i++)
    {
      Lisp_Object obj = *staticvec[i];
      if (POINTER_TYPE_P (XTYPE (obj)))
	reloc[i] = pdump_get_entry (XRECORD_LHEADER (obj))->save_offset;
      else
	reloc[i] = *(EMACS_INT *)(staticvec[i]);
    }
  write (pdump_fd, reloc, staticidx*sizeof (Lisp_Object));
  free (reloc);
}

static void
pdump_dump_structvec (void)
{
  int i;
  for (i=0; i<dumpstructidx; i++)
    {
      EMACS_INT adr;
      write (pdump_fd, &(dumpstructvec[i].data), sizeof (void *));
      adr = pdump_get_entry (*(void **)(dumpstructvec[i].data))->save_offset;
      write (pdump_fd, &adr, sizeof (adr));
    }
}

static void
pdump_dump_opaquevec (void)
{
  int i;
  for (i=0; i<dumpopaqueidx; i++)
    {
      write (pdump_fd, &(dumpopaquevec[i]), sizeof (dumpopaquevec[i]));
      write (pdump_fd, dumpopaquevec[i].data, dumpopaquevec[i].size);
    }
}

static void
pdump_dump_itable (void)
{
  write (pdump_fd, lrecord_implementations_table, lrecord_type_count*sizeof (lrecord_implementations_table[0]));
}

static void
pdump_dump_rtables (void)
{
  int i, j;
  pdump_entry_list_elmt *elmt;
  pdump_reloc_table rt;

  for (i=0; i<lrecord_type_count; i++)
    {
      elmt = pdump_object_table[i].first;
      if (!elmt)
	continue;
      rt.desc = lrecord_implementations_table[i]->description;
      rt.count = pdump_object_table[i].count;
      write (pdump_fd, &rt, sizeof (rt));
      while (elmt)
	{
	  EMACS_INT rdata = pdump_get_entry (elmt->obj)->save_offset;
	  write (pdump_fd, &rdata, sizeof (rdata));
	  elmt = elmt->next;
	}
    }

  rt.desc = 0;
  rt.count = 0;
  write (pdump_fd, &rt, sizeof (rt));

  for (i=0; i<pdump_struct_table.count; i++)
    {
      elmt = pdump_struct_table.list[i].list.first;
      rt.desc = pdump_struct_table.list[i].sdesc->description;
      rt.count = pdump_struct_table.list[i].list.count;
      write (pdump_fd, &rt, sizeof (rt));
      while (elmt)
	{
	  EMACS_INT rdata = pdump_get_entry (elmt->obj)->save_offset;
	  for (j=0; j<elmt->count; j++)
	    {
	      write (pdump_fd, &rdata, sizeof (rdata));
	      rdata += elmt->size;
	    }
	  elmt = elmt->next;
	}
    }
  rt.desc = 0;
  rt.count = 0;
  write (pdump_fd, &rt, sizeof (rt));
}

static void
pdump_dump_wired (void)
{
  EMACS_INT count = pdump_wireidx + pdump_wireidx_list;
  int i;

  write (pdump_fd, &count, sizeof (count));

  for (i=0; i<pdump_wireidx; i++)
    {
      EMACS_INT obj = pdump_get_entry (XRECORD_LHEADER (*(pdump_wirevec[i])))->save_offset;
      write (pdump_fd, &pdump_wirevec[i], sizeof (pdump_wirevec[i]));
      write (pdump_fd, &obj, sizeof (obj));
    }

  for (i=0; i<pdump_wireidx_list; i++)
    {
      Lisp_Object obj = *(pdump_wirevec_list[i]);
      pdump_entry_list_elmt *elmt;
      EMACS_INT res;

      for (;;)
	{
	  const struct lrecord_description *desc;
	  int pos;
	  elmt = pdump_get_entry (XRECORD_LHEADER (obj));
	  if (elmt)
	    break;
	  desc = XRECORD_LHEADER_IMPLEMENTATION (obj)->description;
	  for (pos = 0; desc[pos].type != XD_LO_LINK; pos++)
	    assert (desc[pos].type != XD_END);

	  obj = *(Lisp_Object *)(desc[pos].offset + (char *)(XRECORD_LHEADER (obj)));
	}
      res = elmt->save_offset;

      write (pdump_fd, &pdump_wirevec_list[i], sizeof (pdump_wirevec_list[i]));
      write (pdump_fd, &res, sizeof (res));
    }
}

void
pdump (void)
{
  int i;
  Lisp_Object t_console, t_device, t_frame;
  int none;
  dump_header hd;

  /* These appear in a DEFVAR_LISP, which does a staticpro() */
  t_console = Vterminal_console;
  t_frame   = Vterminal_frame;
  t_device  = Vterminal_device;

  Vterminal_console = Qnil;
  Vterminal_frame   = Qnil;
  Vterminal_device  = Qnil;

  pdump_hash = xnew_array_and_zero (pdump_entry_list_elmt *, PDUMP_HASHSIZE);

  for (i=0; i<lrecord_type_count; i++)
    {
      pdump_object_table[i].first = 0;
      pdump_object_table[i].align = 8;
      pdump_object_table[i].count = 0;
      pdump_alert_undump_object[i] = 0;
    }
  pdump_struct_table.count = 0;
  pdump_struct_table.size = -1;

  pdump_opaque_data_list.first = 0;
  pdump_opaque_data_list.align = 8;
  pdump_opaque_data_list.count = 0;
  depth = 0;

  for (i=0; i<staticidx; i++)
    pdump_register_object (*staticvec[i]);
  for (i=0; i<pdump_wireidx; i++)
    pdump_register_object (*pdump_wirevec[i]);

  none = 1;
  for (i=0; i<lrecord_type_count; i++)
    if (pdump_alert_undump_object[i])
      {
	if (none)
	  printf ("Undumpable types list :\n");
	none = 0;
	printf ("  - %s (%d)\n", lrecord_implementations_table[i]->name, pdump_alert_undump_object[i]);
      }
  if (!none)
    return;

  for (i=0; i<dumpstructidx; i++)
    pdump_register_struct (*(void **)(dumpstructvec[i].data), dumpstructvec[i].desc, 1);

  memcpy (hd.signature, DUMP_SIGNATURE, DUMP_SIGNATURE_LEN);
  hd.id = dump_id;
  hd.reloc_address = 0;
  hd.nb_staticpro = staticidx;
  hd.nb_structdmp = dumpstructidx;
  hd.nb_opaquedmp = dumpopaqueidx;

  cur_offset = 256;
  max_size = 0;

  pdump_scan_by_alignment (pdump_allocate_offset);
  pdump_qnil = pdump_get_entry (XRECORD_LHEADER (Qnil));

  pdump_buf = xmalloc (max_size);
  /* Avoid use of the `open' macro.  We want the real function. */
#undef open
  pdump_fd = open (EMACS_PROGNAME ".dmp",
		   O_WRONLY | O_CREAT | O_TRUNC | OPEN_BINARY, 0666);
  hd.stab_offset = (cur_offset + 3) & ~3;

  write (pdump_fd, &hd, sizeof (hd));
  lseek (pdump_fd, 256, SEEK_SET);

  pdump_scan_by_alignment (pdump_dump_data);

  lseek (pdump_fd, hd.stab_offset, SEEK_SET);

  pdump_dump_staticvec ();
  pdump_dump_structvec ();
  pdump_dump_opaquevec ();
  pdump_dump_itable ();
  pdump_dump_rtables ();
  pdump_dump_wired ();

  close (pdump_fd);
  free (pdump_buf);

  free (pdump_hash);

  Vterminal_console = t_console;
  Vterminal_frame   = t_frame;
  Vterminal_device  = t_device;
}

static int pdump_load_check (void)
{
  return (!memcmp (((dump_header *)pdump_start)->signature, DUMP_SIGNATURE, DUMP_SIGNATURE_LEN)
	  && ((dump_header *)pdump_start)->id == dump_id);
}

static int pdump_load_finish (void)
{
  int i;
  char *p;
  EMACS_INT delta;
  EMACS_INT count;

  pdump_end = pdump_start + pdump_length;

#define PDUMP_READ(p, type) (p = (char*) (((type *) p) + 1), *((type *) p - 1))

  staticidx = ((dump_header *)(pdump_start))->nb_staticpro;
  delta = ((EMACS_INT)pdump_start) - ((dump_header *)pdump_start)->reloc_address;
  p = pdump_start + ((dump_header *)pdump_start)->stab_offset;

  /* Put back the staticvec in place */
  memcpy (staticvec, p, staticidx*sizeof (Lisp_Object *));
  p += staticidx*sizeof (Lisp_Object *);
  for (i=0; i<staticidx; i++)
    {
      Lisp_Object obj = PDUMP_READ (p, Lisp_Object);
      if (POINTER_TYPE_P (XTYPE (obj)))
	XSETOBJ (obj, XTYPE (obj), (char *) XPNTR (obj) + delta);
      *staticvec[i] = obj;
    }

  /* Put back the dumpstructs */
  for (i=0; i<((dump_header *)pdump_start)->nb_structdmp; i++)
    {
      void **adr = PDUMP_READ (p, void **);
      *adr = (void *) (PDUMP_READ (p, char *) + delta);
    }

  /* Put back the opaques */
  for (i=0; i<((dump_header *)pdump_start)->nb_opaquedmp; i++)
    {
      struct pdump_dumpopaqueinfo di = PDUMP_READ (p, struct pdump_dumpopaqueinfo);
      memcpy (di.data, p, di.size);
      p += di.size;
    }

  /* Put back the lrecord_implementations_table */
  /* The (void *) cast is there to make Ben happy. */
  memcpy ((void *) lrecord_implementations_table, p, lrecord_type_count*sizeof (lrecord_implementations_table[0]));
  p += lrecord_type_count*sizeof (lrecord_implementations_table[0]);

  /* Reinitialize lrecord_markers from lrecord_implementations_table */
  for (i=0; i < lrecord_type_count; i++)
    if (lrecord_implementations_table[i])
      lrecord_markers[i] = lrecord_implementations_table[i]->marker;

  /* Do the relocations */
  pdump_rt_list = p;
  count = 2;
  for (;;)
    {
      pdump_reloc_table rt = PDUMP_READ (p, pdump_reloc_table);
      if (rt.desc)
	{
	  for (i=0; i < rt.count; i++)
	    {
	      char *adr = delta + *(char **)p;
	      *(char **)p = adr;
	      pdump_reloc_one (adr, delta, rt.desc);
	      p += sizeof (char *);
	    }
	} else
	  if (!(--count))
	    break;
    }

  /* Put the pdump_wire variables in place */
  count = PDUMP_READ (p, EMACS_INT);

  for (i=0; i<count; i++)
    {
      Lisp_Object *var = PDUMP_READ (p, Lisp_Object *);
      Lisp_Object  obj = PDUMP_READ (p, Lisp_Object);

      if (POINTER_TYPE_P (XTYPE (obj)))
	XSETOBJ (obj, XTYPE (obj), (char *) XPNTR (obj) + delta);

      *var = obj;
    }

  /* Final cleanups */
  /*   reorganize hash tables */
  p = pdump_rt_list;
  for (;;)
    {
      pdump_reloc_table rt = PDUMP_READ (p, pdump_reloc_table);
      if (!rt.desc)
	break;
      if (rt.desc == hash_table_description)
	{
	  for (i=0; i < rt.count; i++)
	    pdump_reorganize_hash_table (PDUMP_READ (p, Lisp_Object));
	  break;
	} else
	  p += sizeof (Lisp_Object) * rt.count;
    }

  /* Put back noninteractive1 to its real value */
  noninteractive1 = noninteractive;

  return 1;
}

#ifdef WIN32_NATIVE
/* Free the mapped file if we decide we don't want it after all */
static void pdump_file_unmap(void)
{
  UnmapViewOfFile (pdump_start);
  CloseHandle (pdump_hFile);
  CloseHandle (pdump_hMap);
}

static int pdump_file_get(const char *path)
{

  pdump_hFile = CreateFile (path, 
		            GENERIC_READ + GENERIC_WRITE,  /* Required for copy on write */
			    0,		            /* Not shared */
			    NULL,		    /* Not inheritable */
			    OPEN_EXISTING, 
			    FILE_ATTRIBUTE_NORMAL,
			    NULL);		    /* No template file */
  if (pdump_hFile == INVALID_HANDLE_VALUE)
    return 0;

  pdump_length = GetFileSize (pdump_hFile, NULL);
  pdump_hMap = CreateFileMapping (pdump_hFile,
				  NULL,		    /* No security attributes */
				  PAGE_WRITECOPY,   /* Copy on write */
				  0,		    /* Max size, high half */
				  0,		    /* Max size, low half */
				  NULL);	    /* Unnamed */
  if (pdump_hMap == INVALID_HANDLE_VALUE)
    return 0;

  pdump_start = MapViewOfFile (pdump_hMap,
			       FILE_MAP_COPY,  /* Copy on write */
			       0,	      /* Start at zero */
			       0,
			       0);	      /* Map all of it */
  pdump_free = pdump_file_unmap;
  return 1;
}

/* pdump_resource_free is called (via the pdump_free pointer) to release
   any resources allocated by pdump_resource_get.  Since the Windows API
   specs specifically state that you don't need to (and shouldn't) free the
   resources allocated by FindResource, LoadResource, and LockResource this
   routine does nothing.  */
static void pdump_resource_free (void)
{
}

static int pdump_resource_get (void)
{
  HRSRC hRes;	      /* Handle to dump resource */
  HRSRC hResLoad;	      /* Handle to loaded dump resource */

  /* See Q126630 which describes how Windows NT and 95 trap writes to
     resource sections and duplicate the page to allow the write to proceed.
     It also describes how to make the resource section read/write (and hence
     private to each process).  Doing this avoids the exceptions and related
     overhead, but causes the resource section to be private to each process
     that is running XEmacs.  Since the resource section contains little
     other than the dumped data, which should be private to each process, we
     make the whole resource section read/write so we don't have to copy it. */

  hRes = FindResource (NULL, MAKEINTRESOURCE(101), "DUMP");
  if (hRes == NULL)
    return 0;

  /* Found it, use the data in the resource */
  hResLoad = LoadResource (NULL, hRes);
  if (hResLoad == NULL)
    return 0;

  pdump_start = LockResource (hResLoad);
  if (pdump_start == NULL)
    return 0;

  pdump_free = pdump_resource_free;
  pdump_length = SizeofResource (NULL, hRes);
  if (pdump_length <= sizeof(dump_header))
    {
      pdump_start = 0;
      return 0;
    }

  return 1;
}

#else /* !WIN32_NATIVE */

static void *pdump_mallocadr;

static void pdump_file_free(void)
{
  xfree (pdump_mallocadr);
}

#ifdef HAVE_MMAP
static void pdump_file_unmap(void)
{
  munmap (pdump_start, pdump_length);
}
#endif

static int pdump_file_get(const char *path)
{
  int fd = open (path, O_RDONLY | OPEN_BINARY);
  if (fd<0)
    return 0;

  pdump_length = lseek (fd, 0, SEEK_END);
  if (pdump_length < sizeof (dump_header))
    {
      close (fd);
      return 0;
    }

  lseek (fd, 0, SEEK_SET);

#ifdef HAVE_MMAP
  pdump_start = (char *) mmap (0, pdump_length, PROT_READ|PROT_WRITE, MAP_PRIVATE, fd, 0);
  if (pdump_start != MAP_FAILED)
    {
      pdump_free = pdump_file_unmap;
      close (fd);
      return 1;
    }
#endif

  pdump_mallocadr = xmalloc(pdump_length+255);
  pdump_free = pdump_file_free;
  pdump_start = (char *)((255 + (unsigned long)pdump_mallocadr) & ~255);
  read (pdump_fd, pdump_start, pdump_length);

  close (pdump_fd);
  return 1;
}
#endif /* !WIN32_NATIVE */


static int pdump_file_try(char *exe_path)
{
  char *w;

  w = exe_path + strlen(exe_path);
  do
    {
      sprintf (w, "-%s-%08x.dmp", EMACS_VERSION, dump_id);
      if (pdump_file_get (exe_path))
	{
	  if (pdump_load_check ())
	    return 1;
	  pdump_free();
	}
      
      sprintf (w, "-%08x.dmp", dump_id);
      if (pdump_file_get (exe_path))
	{
	  if (pdump_load_check ())
	    return 1;
	  pdump_free();
	}
      
      sprintf (w, ".dmp");
      if (pdump_file_get (exe_path))
	{
	  if (pdump_load_check ())
	    return 1;
	  pdump_free();
	}
      
      do
	w--;
      while (w>exe_path && !IS_DIRECTORY_SEP (*w) && (*w != '-') && (*w != '.'));	
    }
  while (w>exe_path && !IS_DIRECTORY_SEP (*w));
  return 0;
}

int pdump_load(const char *argv0)
{
  char exe_path[PATH_MAX];
#ifdef WIN32_NATIVE
  GetModuleFileName (NULL, exe_path, PATH_MAX);  
#else /* !WIN32_NATIVE */
  char *w;
  const char *dir, *p;

  dir = argv0;
  if (dir[0] == '-')
    {
      /* XEmacs as a login shell, oh goody! */
      dir = getenv("SHELL");
    }

  p = dir + strlen(dir);
  while (p != dir && !IS_ANY_SEP (p[-1])) p--;
  
  if (p != dir)
    {
      /* invocation-name includes a directory component -- presumably it
	 is relative to cwd, not $PATH */
      strcpy (exe_path, dir);
    }
  else
    {
      const char *path = getenv ("PATH");
      const char *name = p;
      for (;;)
	{
	  p = path;
	  while (*p && *p != SEPCHAR)
	    p++;
	  if (p == path)
	    {
	      exe_path[0] = '.';
	      w = exe_path + 1;
	    }
	  else
	    {
	      memcpy (exe_path, path, p - path);
	      w = exe_path + (p - path);
	    }
	  if (!IS_DIRECTORY_SEP (w[-1]))
	    {
	      *w++ = '/';
	    }
	  strcpy(w, name);
	  
	  /* ### #$%$#^$^@%$^#%@$ ! */
#ifdef access
#undef access
#endif
	  
	  if (!access (exe_path, X_OK))
	    break;
	  if (!*p)
	    {
	      /* Oh well, let's have some kind of default */
	      sprintf (exe_path, "./%s", name);
	      break;
	    }
	  path = p+1;	    
	}
    }
#endif /* WIN32_NATIVE */

  if (pdump_file_try (exe_path))
    {
      pdump_load_finish ();
      return 1;
    }

#ifdef WIN32_NATIVE
  if (pdump_resource_get ())
    {
      if (pdump_load_check ())
	{
	  pdump_load_finish ();
	  return 1;
	}
      pdump_free ();
    }
#endif

  return 0;
}
