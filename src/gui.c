/* Generic GUI code. (menubars, scrollbars, toolbars, dialogs)
   Copyright (C) 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1995, 1996 Ben Wing.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1998 Free Software Foundation, Inc.

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
#include "gui.h"
#include "elhash.h"
#include "bytecode.h"

Lisp_Object Q_active, Q_suffix, Q_keys, Q_style, Q_selected;
Lisp_Object Q_filter, Q_config, Q_included, Q_key_sequence;
Lisp_Object Q_accelerator, Q_label, Q_callback;
Lisp_Object Qtoggle, Qradio;

#ifdef HAVE_POPUPS

/* count of menus/dboxes currently up */
int popup_up_p;

DEFUN ("popup-up-p", Fpopup_up_p, 0, 0, 0, /*
Return t if a popup menu or dialog box is up, nil otherwise.
See `popup-menu' and `popup-dialog-box'.
*/
       ())
{
  return popup_up_p ? Qt : Qnil;
}
#endif /* HAVE_POPUPS */

int
separator_string_p (CONST char *s)
{
  CONST char *p;
  char first;

  if (!s || s[0] == '\0')
    return 0;
  first = s[0];
  if (first != '-' && first != '=')
    return 0;
  for (p = s; *p == first; p++)
    ;

  return (*p == '!' || *p == ':' || *p == '\0');
}

/* Massage DATA to find the correct function and argument.  Used by
   popup_selection_callback() and the msw code. */
void
get_gui_callback (Lisp_Object data, Lisp_Object *fn, Lisp_Object *arg)
{
  if (SYMBOLP (data)
      || (COMPILED_FUNCTIONP (data)
	  && XCOMPILED_FUNCTION (data)->flags.interactivep)
      || (EQ (XCAR (data), Qlambda)
	  && !NILP (Fassq (Qinteractive, Fcdr (Fcdr (data))))))
    {
      *fn = Qcall_interactively;
      *arg = data;
    }
  else if (CONSP (data))
    {
      *fn = Qeval;
      *arg = data;
    }
  else
    {
      *fn = Qeval;
      *arg = list3 (Qsignal,
		    list2 (Qquote, Qerror),
		    list2 (Qquote, list2 (build_translated_string
					  ("illegal callback"),
					  data)));
    }
}

/*
 * Add a value VAL associated with keyword KEY into PGUI_ITEM
 * structure. If KEY is not a keyword, or is an unknown keyword, then
 * error is signaled.
 */
void
gui_item_add_keyval_pair (Lisp_Object gui_item,
			  Lisp_Object key, Lisp_Object val, 
			  Error_behavior errb)
{
  struct Lisp_Gui_Item* pgui_item = XGUI_ITEM (gui_item);

  if (!KEYWORDP (key))
    signal_simple_error_2 ("Non-keyword in gui item", key, pgui_item->name);

  if	  (EQ (key, Q_suffix))	 pgui_item->suffix   = val;
  else if (EQ (key, Q_active))	 pgui_item->active   = val;
  else if (EQ (key, Q_included)) pgui_item->included = val;
  else if (EQ (key, Q_config))	 pgui_item->config   = val;
  else if (EQ (key, Q_filter))	 pgui_item->filter   = val;
  else if (EQ (key, Q_style))	 pgui_item->style    = val;
  else if (EQ (key, Q_selected)) pgui_item->selected = val;
  else if (EQ (key, Q_keys))	 pgui_item->keys     = val;
  else if (EQ (key, Q_callback))	 pgui_item->callback     = val;
  else if (EQ (key, Q_key_sequence)) ;   /* ignored for FSF compatability */
  else if (EQ (key, Q_label)) ;   /* ignored for 21.0 implement in 21.2  */
  else if (ERRB_EQ (errb, ERROR_ME))
    signal_simple_error_2 ("Unknown keyword in gui item", key, pgui_item->name);
}

void
gui_item_init (Lisp_Object gui_item)
{
  struct Lisp_Gui_Item *lp = XGUI_ITEM (gui_item);

  lp->name     = Qnil;
  lp->callback = Qnil;
  lp->suffix   = Qnil;
  lp->active   = Qt;
  lp->included = Qt;
  lp->config   = Qnil;
  lp->filter   = Qnil;
  lp->style    = Qnil;
  lp->selected = Qnil;
  lp->keys     = Qnil;
}

Lisp_Object
allocate_gui_item ()
{
  struct Lisp_Gui_Item *lp =
    alloc_lcrecord_type (struct Lisp_Gui_Item, &lrecord_gui_item);
  Lisp_Object val;

  zero_lcrecord (lp);
  XSETGUI_ITEM (val, lp);

  gui_item_init (val);

  return val;
}

/*
 * ITEM is a lisp vector, describing a menu item or a button. The
 * function extracts the description of the item into the PGUI_ITEM
 * structure.
 */
static Lisp_Object
make_gui_item_from_keywords_internal (Lisp_Object item,
				      Error_behavior errb)
{
  int length, plist_p, start;
  Lisp_Object *contents;
  Lisp_Object gui_item = allocate_gui_item ();
  struct Lisp_Gui_Item* pgui_item = XGUI_ITEM (gui_item);

  CHECK_VECTOR (item);
  length = XVECTOR_LENGTH (item);
  contents = XVECTOR_DATA (item);

  if (length < 1)
    signal_simple_error ("GUI item descriptors must be at least 1 elts long", item);

  /* length 1:     		[ "name" ]
     length 2:		[ "name" callback ]
     length 3:		[ "name" callback active-p ]
     		   or	[ "name" keyword  value  ]
     length 4:		[ "name" callback active-p suffix ]
     		   or	[ "name" callback keyword  value  ]
     length 5+:		[ "name" callback [ keyword value ]+ ]
     		   or	[ "name" [ keyword value ]+ ]
  */
  plist_p = (length > 2 && (KEYWORDP (contents [1])
			    || KEYWORDP (contents [2])));

  pgui_item->name = contents [0];
  if (length > 1 && !KEYWORDP (contents [1]))
    {
      pgui_item->callback = contents [1];
      start = 2;
    }
  else 
    start =1;

  if (!plist_p && length > 2)
    /* the old way */
    {
      pgui_item->active = contents [2];
      if (length == 4)
	pgui_item->suffix = contents [3];
    }
  else
    /* the new way */
    {
      int i;
      if ((length - start) & 1)
	signal_simple_error (
		"GUI item descriptor has an odd number of keywords and values",
			     item);

      for (i = start; i < length;)
	{
	  Lisp_Object key = contents [i++];
	  Lisp_Object val = contents [i++];
	  gui_item_add_keyval_pair (gui_item, key, val, errb);
	}
    }
  return gui_item;
}

Lisp_Object
gui_parse_item_keywords (Lisp_Object item)
{
  return make_gui_item_from_keywords_internal (item, ERROR_ME);
}

Lisp_Object
gui_parse_item_keywords_no_errors (Lisp_Object item)
{
  return make_gui_item_from_keywords_internal (item, ERROR_ME_NOT);
}

/* convert a gui item into plist properties */
void
gui_add_item_keywords_to_plist (Lisp_Object plist, Lisp_Object gui_item)
{
  struct Lisp_Gui_Item* pgui_item = XGUI_ITEM (gui_item);
  
  if (!NILP (pgui_item->callback))
    Fplist_put (plist, Q_callback, pgui_item->callback);
  if (!NILP (pgui_item->suffix))
    Fplist_put (plist, Q_suffix, pgui_item->suffix);
  if (!NILP (pgui_item->active))
    Fplist_put (plist, Q_active, pgui_item->active);
  if (!NILP (pgui_item->included))
    Fplist_put (plist, Q_included, pgui_item->included);
  if (!NILP (pgui_item->config))
    Fplist_put (plist, Q_config, pgui_item->config);
  if (!NILP (pgui_item->filter))
    Fplist_put (plist, Q_filter, pgui_item->filter);
  if (!NILP (pgui_item->style))
    Fplist_put (plist, Q_style, pgui_item->style);
  if (!NILP (pgui_item->selected))
    Fplist_put (plist, Q_selected, pgui_item->selected);
  if (!NILP (pgui_item->keys))
    Fplist_put (plist, Q_keys, pgui_item->keys);
}

/*
 * Decide whether a GUI item is active by evaluating its :active form
 * if any
 */
int
gui_item_active_p (Lisp_Object gui_item)
{
  /* This function can call lisp */

  /* Shortcut to avoid evaluating Qt each time */
  return (EQ (XGUI_ITEM (gui_item)->active, Qt)
	  || !NILP (Feval (XGUI_ITEM (gui_item)->active)));
}

/*
 * Decide whether a GUI item is selected by evaluating its :selected form
 * if any
 */
int
gui_item_selected_p (Lisp_Object gui_item)
{
  /* This function can call lisp */

  /* Shortcut to avoid evaluating Qt each time */
  return (EQ (XGUI_ITEM (gui_item)->selected, Qt)
	  || !NILP (Feval (XGUI_ITEM (gui_item)->selected)));
}

/*
 * Decide whether a GUI item is included by evaluating its :included
 * form if given, and testing its :config form against supplied CONFLIST
 * configuration variable
 */
int
gui_item_included_p (Lisp_Object gui_item, Lisp_Object conflist)
{
  /* This function can call lisp */
  struct Lisp_Gui_Item* pgui_item = XGUI_ITEM (gui_item);

  /* Evaluate :included first. Shortcut to avoid evaluating Qt each time */
  if (!EQ (pgui_item->included, Qt)
      && NILP (Feval (pgui_item->included)))
    return 0;

  /* Do :config if conflist is given */
  if (!NILP (conflist) && !NILP (pgui_item->config)
      && NILP (Fmemq (pgui_item->config, conflist)))
    return 0;

  return 1;
}

static DOESNT_RETURN
signal_too_long_error (Lisp_Object name)
{
  signal_simple_error ("GUI item produces too long displayable string", name);
}

#ifdef HAVE_WINDOW_SYSTEM
/*
 * Format "left flush" display portion of an item into BUF, guarded by
 * maximum buffer size BUF_LEN. BUF_LEN does not count for terminating
 * null character, so actual maximum size of buffer consumed is
 * BUF_LEN + 1 bytes. If buffer is not big enough, then error is
 * signaled.
 * Return value is the offset to the terminating null character into the
 * buffer.
 */
unsigned int
gui_item_display_flush_left  (Lisp_Object gui_item,
			      char* buf, Bytecount buf_len)
{
  char *p = buf;
  Bytecount len;
  struct Lisp_Gui_Item* pgui_item = XGUI_ITEM (gui_item);

  /* Copy item name first */
  CHECK_STRING (pgui_item->name);
  len = XSTRING_LENGTH (pgui_item->name);
  if (len > buf_len)
    signal_too_long_error (pgui_item->name);
  memcpy (p, XSTRING_DATA (pgui_item->name), len);
  p += len;

  /* Add space and suffix, if there is a suffix.
   * If suffix is not string evaluate it */
  if (!NILP (pgui_item->suffix))
    {
      Lisp_Object suffix = pgui_item->suffix;
      /* Shortcut to avoid evaluating suffix each time */
      if (!STRINGP (suffix))
	{
	  suffix = Feval (suffix);
	  CHECK_STRING (suffix);
	}

      len = XSTRING_LENGTH (suffix);
      if (p + len + 1 > buf + buf_len)
	signal_too_long_error (pgui_item->name);
      *(p++) = ' ';
      memcpy (p, XSTRING_DATA (suffix), len);
      p += len;
    }
  *p = '\0';
  return p - buf;
}

/*
 * Format "right flush" display portion of an item into BUF, guarded by
 * maximum buffer size BUF_LEN. BUF_LEN does not count for terminating
 * null character, so actual maximum size of buffer consumed is
 * BUF_LEN + 1 bytes. If buffer is not big enough, then error is
 * signaled.
 * Return value is the offset to the terminating null character into the
 * buffer.
 */
unsigned int
gui_item_display_flush_right (Lisp_Object gui_item,
			      char* buf, Bytecount buf_len)
{
  struct Lisp_Gui_Item* pgui_item = XGUI_ITEM (gui_item);
  *buf = 0;

  /* Have keys? */
  if (!menubar_show_keybindings)
    return 0;

  /* Try :keys first */
  if (!NILP (pgui_item->keys))
    {
      CHECK_STRING (pgui_item->keys);
      if (XSTRING_LENGTH (pgui_item->keys) > buf_len)
	signal_too_long_error (pgui_item->name);
      strcpy (buf, (CONST char *) XSTRING_DATA (pgui_item->keys));
      return XSTRING_LENGTH (pgui_item->keys);
    }

  /* See if we can derive keys out of callback symbol */
  if (SYMBOLP (pgui_item->callback))
    {
      char buf2 [1024];
      Bytecount len;

      where_is_to_char (pgui_item->callback, buf2);
      len = strlen (buf2);
      if (len > buf_len)
	signal_too_long_error (pgui_item->name);
      strcpy (buf, buf2);
      return len;
    }

  /* No keys - no right flush display */
  return 0;
}
#endif /* HAVE_WINDOW_SYSTEM */

static Lisp_Object
mark_gui_item (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_Gui_Item *p = XGUI_ITEM (obj);

  markobj (p->name);
  markobj (p->callback);
  markobj (p->suffix);
  markobj (p->active);
  markobj (p->included);
  markobj (p->config);
  markobj (p->filter);
  markobj (p->style);
  markobj (p->selected);
  markobj (p->keys);

  return Qnil;
}

static unsigned long
gui_item_hash (Lisp_Object obj, int depth)
{
  struct Lisp_Gui_Item *p = XGUI_ITEM (obj);

  return HASH2 (HASH5 (internal_hash (p->name, depth + 1),
		       internal_hash (p->callback, depth + 1),
		       internal_hash (p->suffix, depth + 1),
		       internal_hash (p->active, depth + 1),
		       internal_hash (p->included, depth + 1)),
		HASH5 (internal_hash (p->config, depth + 1),
		       internal_hash (p->filter, depth + 1),
		       internal_hash (p->style, depth + 1),
		       internal_hash (p->selected, depth + 1),
		       internal_hash (p->keys, depth + 1)));
}

int
gui_item_id_hash (Lisp_Object hashtable, Lisp_Object gitem, int slot)
{
  int hashid = gui_item_hash (gitem, 0);
  int id = GUI_ITEM_ID_BITS (hashid, slot);
  while (!NILP (Fgethash (make_int (id),
			  hashtable, Qnil)))
    {
      id = GUI_ITEM_ID_BITS (id + 1, slot);
    }
  return id;
}

static int
gui_item_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  struct Lisp_Gui_Item *p1 = XGUI_ITEM (obj1);
  struct Lisp_Gui_Item *p2 = XGUI_ITEM (obj2);

  if (!(internal_equal (p1->name, p2->name, depth + 1)
	&&
	internal_equal (p1->callback, p2->callback, depth + 1)
	&&
	EQ (p1->suffix, p2->suffix)
	&&
	EQ (p1->active, p2->active)
	&&
	EQ (p1->included, p2->included)
	&&
	EQ (p1->config, p2->config)
	&&
	EQ (p1->filter, p2->filter)
	&&
	EQ (p1->style, p2->style)
	&&
	EQ (p1->selected, p2->selected)
	&&
	EQ (p1->keys, p2->keys)))
    return 0;
  return 1;
}

static void
print_gui_item (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  struct Lisp_Gui_Item *g = XGUI_ITEM (obj);
  char buf[20];

  if (print_readably)
    error ("printing unreadable object #<gui-item 0x%x>", g->header.uid);

  write_c_string ("#<gui-item ", printcharfun);
  sprintf (buf, "0x%x>", g->header.uid);
  write_c_string (buf, printcharfun);
}

DEFINE_LRECORD_IMPLEMENTATION ("gui-item", gui_item,
			       mark_gui_item, print_gui_item,
			       0, gui_item_equal,
			       gui_item_hash,
			       0,
			       struct Lisp_Gui_Item);

void
syms_of_gui (void)
{
  defkeyword (&Q_active,   ":active");
  defkeyword (&Q_suffix,   ":suffix");
  defkeyword (&Q_keys,     ":keys");
  defkeyword (&Q_key_sequence,":key-sequence");
  defkeyword (&Q_style,    ":style");
  defkeyword (&Q_selected, ":selected");
  defkeyword (&Q_filter,   ":filter");
  defkeyword (&Q_config,   ":config");
  defkeyword (&Q_included, ":included");
  defkeyword (&Q_accelerator, ":accelerator");
  defkeyword (&Q_label, ":label");
  defkeyword (&Q_callback, ":callback");

  defsymbol (&Qtoggle, "toggle");
  defsymbol (&Qradio, "radio");

#ifdef HAVE_POPUPS
  DEFSUBR (Fpopup_up_p);
#endif
}

void
vars_of_gui (void)
{
}
