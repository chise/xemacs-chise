/* Generic GUI code. (menubars, scrollbars, toolbars, dialogs)
   Copyright (C) 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1995, 1996 Ben Wing.
   Copyright (C) 1995 Sun Microsystems, Inc.

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

/* Written by kkm on 12/24/97 */

#ifndef _XEMACS_GUI_H_
#define _XEMACS_GUI_H_

#ifdef HAVE_POPUPS
int separator_string_p (CONST char *s);
void get_gui_callback (Lisp_Object, Lisp_Object *, Lisp_Object *);

extern int popup_up_p;

/* This structure describes gui button,
   menu item or submenu properties */
struct gui_item
{
  Lisp_Object name;		/* String */
  Lisp_Object callback;		/* Symbol or form */
  Lisp_Object suffix;		/* String */
  Lisp_Object active;		/* Form */
  Lisp_Object included;		/* Form */
  Lisp_Object config;		/* Anything EQable */
  Lisp_Object filter;		/* Form */
  Lisp_Object style;		/* Symbol */
  Lisp_Object selected;		/* Form */
  Lisp_Object keys;		/* String */
};
#define GUI_ITEM_LAST_GCPROED keys
#define GUI_ITEM_GCPRO_COUNT \
  (slot_offset(struct gui_item, GUI_ITEM_LAST_GCPROED) / sizeof(Lisp_Object) + 1)

/*
 * gui_item is a struct containing a bunch of Lisp_Object
 * members.  We need to GC-protect all the member slots.
 * Rather than build a long chain of individual gcpro structs
 * that protect the slots individually, we protect all the
 * member slots by pretending the struct is an array.  ANSI C
 * requires this hack to work, ugly though it is.
 */
#define GCPRO_GUI_ITEM(pgui_item)					\
	do {								\
	  Lisp_Object *gui_item_array = (Lisp_Object *) pgui_item;	\
	  GCPRO1 (gui_item_array[0]);					\
	  gcpro1.nvars = GUI_ITEM_GCPRO_COUNT;				\
	} while (0);

extern Lisp_Object Q_accelerator, Q_active, Q_config, Q_filter, Q_included;
extern Lisp_Object Q_keys, Q_selected, Q_suffix, Qradio, Qtoggle;

void gui_item_init (struct gui_item *pgui_item);
void gui_item_add_keyval_pair (struct gui_item *pgui_item,
			       Lisp_Object key, Lisp_Object val);
void gui_parse_item_keywords (Lisp_Object item, struct gui_item *pgui_item);
int  gui_item_active_p (CONST struct gui_item *pgui_item);
int  gui_item_included_p (CONST struct gui_item *pgui_item, Lisp_Object into);
unsigned int gui_item_display_flush_left  (CONST struct gui_item *pgui_item,
					   char* buf, Bytecount buf_len);
unsigned int gui_item_display_flush_right (CONST struct gui_item *pgui_item,
					   char* buf, Bytecount buf_len);

#endif /* HAVE_POPUPS */

#endif /* _XEMACS_GUI_H_ */
