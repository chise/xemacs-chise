/* Allocations header
   Copyright (C) 2000 Olivier Galibert

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

#ifndef INCLUDED_alloc_h_
#define INCLUDED_alloc_h_

struct pdump_dumpstructinfo
{
  void *data;
  const struct struct_description *desc;
};

struct pdump_dumpopaqueinfo
{
  void *data;
  size_t size;
};

/* staticpro structures */
extern Lisp_Object *staticvec[];
extern int staticidx;

/* dumpstruct structures */
extern struct pdump_dumpstructinfo dumpstructvec[];
extern int dumpstructidx;

/* dumpopaque structures */
extern struct pdump_dumpopaqueinfo dumpopaquevec[];
extern int dumpopaqueidx;

/* pdump_wire structures */
extern Lisp_Object *pdump_wirevec[];
extern int pdump_wireidx;

/* pdump_wire_list structures */
extern Lisp_Object *pdump_wirevec_list[];
extern int pdump_wireidx_list;

#endif /* INCLUDED_alloc_h_ */
