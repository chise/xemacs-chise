/* Define generic menubar support.
   Copyright (C) 1995 Board of Trustees, University of Illinois.

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

/* #### Not properly abstracted for device-independence. */

#ifndef INCLUDED_menubar_h_
#define INCLUDED_menubar_h_

#ifdef HAVE_MENUBARS
#include "gui.h"
void update_frame_menubars (struct frame *f);
void free_frame_menubars (struct frame *f);
Lisp_Object menu_parse_submenu_keywords (Lisp_Object desc,
					 Lisp_Object gui_item);
Lisp_Object current_frame_menubar (const struct frame* f);

EXFUN (Fmenu_find_real_submenu, 2);

#endif /* HAVE_MENUBARS */

#endif /* INCLUDED_menubar_h_ */
