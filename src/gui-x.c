/* General GUI code -- X-specific. (menubars, scrollbars, toolbars, dialogs)
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

#include "console-x.h"
#ifdef LWLIB_USES_MOTIF
#include <Xm/Xm.h> /* for XmVersion */
#endif
#include "gui-x.h"
#include "buffer.h"
#include "device.h"
#include "frame.h"
#include "gui.h"
#include "opaque.h"

#ifdef HAVE_POPUPS
Lisp_Object Qmenu_no_selection_hook;
#endif

/* we need a unique id for each popup menu, dialog box, and scrollbar */
static unsigned int lwlib_id_tick;

LWLIB_ID
new_lwlib_id (void)
{
  return ++lwlib_id_tick;
}

widget_value *
xmalloc_widget_value (void)
{
  widget_value *tmp = malloc_widget_value ();
  if (!tmp) memory_full ();
  return tmp;
}


#ifdef HAVE_POPUPS

struct mark_widget_value_closure
{
  void (*markobj) (Lisp_Object);
};

static int
mark_widget_value_mapper (widget_value *val, void *closure)
{
  Lisp_Object markee;

  struct mark_widget_value_closure *cl =
    (struct mark_widget_value_closure *) closure;
  if (val->call_data)
    {
      VOID_TO_LISP (markee, val->call_data);
      (cl->markobj) (markee);
    }

  if (val->accel)
    {
      VOID_TO_LISP (markee, val->accel);
      (cl->markobj) (markee);
    }
  return 0;
}

static Lisp_Object
mark_popup_data (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct popup_data *data = (struct popup_data *) XPOPUP_DATA (obj);

  /* Now mark the callbacks and such that are hidden in the lwlib
     call-data */

  if (data->id)
    {
      struct mark_widget_value_closure closure;

      closure.markobj = markobj;
      lw_map_widget_values (data->id, mark_widget_value_mapper, &closure);
    }

  return data->last_menubar_buffer;
}

DEFINE_LRECORD_IMPLEMENTATION ("popup-data", popup_data,
                               mark_popup_data, internal_object_printer,
			       0, 0, 0, struct popup_data);

/* This is like FRAME_MENUBAR_DATA (f), but contains an alist of
   (id . popup-data) for GCPRO'ing the callbacks of the popup menus
   and dialog boxes. */
static Lisp_Object Vpopup_callbacks;

void
gcpro_popup_callbacks (LWLIB_ID id)
{
  struct popup_data *pdata;
  Lisp_Object lid = make_int (id);
  Lisp_Object lpdata;

  assert (NILP (assq_no_quit (lid, Vpopup_callbacks)));
  pdata = alloc_lcrecord_type (struct popup_data, &lrecord_popup_data);
  pdata->id = id;
  pdata->last_menubar_buffer = Qnil;
  pdata->menubar_contents_up_to_date = 0;
  XSETPOPUP_DATA (lpdata, pdata);
  Vpopup_callbacks = Fcons (Fcons (lid, lpdata), Vpopup_callbacks);
}

void
ungcpro_popup_callbacks (LWLIB_ID id)
{
  Lisp_Object lid = make_int (id);
  Lisp_Object this = assq_no_quit (lid, Vpopup_callbacks);
  assert (!NILP (this));
  Vpopup_callbacks = delq_no_quit (this, Vpopup_callbacks);
}

int
popup_handled_p (LWLIB_ID id)
{
  return NILP (assq_no_quit (make_int (id), Vpopup_callbacks));
}

/* menu_item_descriptor_to_widget_value() et al. mallocs a
   widget_value, but then may signal lisp errors.  If an error does
   not occur, the opaque ptr we have here has had its pointer set to 0
   to tell us not to do anything.  Otherwise we free the widget value.
   (This has nothing to do with GC, it's just about not dropping
   pointers to malloc'd data when errors happen.) */

Lisp_Object
widget_value_unwind (Lisp_Object closure)
{
  widget_value *wv = (widget_value *) get_opaque_ptr (closure);
  free_opaque_ptr (closure);
  if (wv)
    free_widget_value (wv);
  return Qnil;
}

#if 0
static void
print_widget_value (widget_value *wv, int depth)
{
  /* !!#### This function has not been Mule-ized */
  char d [200];
  int i;
  for (i = 0; i < depth; i++) d[i] = ' ';
  d[depth]=0;
  /* #### - print type field */
  printf ("%sname:    %s\n", d, (wv->name ? wv->name : "(null)"));
  if (wv->value) printf ("%svalue:   %s\n", d, wv->value);
  if (wv->key)   printf ("%skey:     %s\n", d, wv->key);
  printf ("%senabled: %d\n", d, wv->enabled);
  if (wv->contents)
    {
      printf ("\n%scontents: \n", d);
      print_widget_value (wv->contents, depth + 5);
    }
  if (wv->next)
    {
      printf ("\n");
      print_widget_value (wv->next, depth);
    }
}
#endif

/* This recursively calls free_widget_value() on the tree of widgets.
   It must free all data that was malloc'ed for these widget_values.

   It used to be that emacs only allocated new storage for the `key' slot.
   All other slots are pointers into the data of Lisp_Strings, and must be
   left alone.  */
void
free_popup_widget_value_tree (widget_value *wv)
{
  if (! wv) return;
  if (wv->key) xfree (wv->key);
  if (wv->value) xfree (wv->value);

  wv->name = wv->value = wv->key = (char *) 0xDEADBEEF;

  if (wv->contents && (wv->contents != (widget_value*)1))
    {
      free_popup_widget_value_tree (wv->contents);
      wv->contents = (widget_value *) 0xDEADBEEF;
    }
  if (wv->next)
    {
      free_popup_widget_value_tree (wv->next);
      wv->next = (widget_value *) 0xDEADBEEF;
    }
  free_widget_value (wv);
}

/* The following is actually called from somewhere within XtDispatchEvent(),
   called from XtAppProcessEvent() in event-Xt.c */

void
popup_selection_callback (Widget widget, LWLIB_ID ignored_id,
			  XtPointer client_data)
{
  Lisp_Object fn, arg;
  Lisp_Object data;
  Lisp_Object frame;
  struct device *d = get_device_from_display (XtDisplay (widget));
  struct frame *f = x_any_widget_or_parent_to_frame (d, widget);

  /* set in lwlib to the time stamp associated with the most recent menu
     operation */
  extern Time x_focus_timestamp_really_sucks_fix_me_better;

  if (!f)
    return;
  if (((EMACS_INT) client_data) == 0)
    return;
  VOID_TO_LISP (data, client_data);
  XSETFRAME (frame, f);

#if 0
  /* #### What the hell?  I can't understand why this call is here,
     and doing it is really courting disaster in the new event
     model, since popup_selection_callback is called from
     within next_event_internal() and Faccept_process_output()
     itself calls next_event_internal().  --Ben */

  /* Flush the X and process input */
  Faccept_process_output (Qnil, Qnil, Qnil);
#endif

  if (((EMACS_INT) client_data) == -1)
    {
      fn = Qrun_hooks;
      arg = Qmenu_no_selection_hook;
    }
  else
    get_gui_callback (data, &fn, &arg);

  /* This is the timestamp used for asserting focus so we need to get an
     up-to-date value event if no events has been dispatched to emacs
     */
#if defined(HAVE_MENUBARS)
  DEVICE_X_MOUSE_TIMESTAMP (d) = x_focus_timestamp_really_sucks_fix_me_better;
#else
  DEVICE_X_MOUSE_TIMESTAMP (d) = DEVICE_X_GLOBAL_MOUSE_TIMESTAMP (d);
#endif
  signal_special_Xt_user_event (frame, fn, arg);
}

#if 1
  /* Eval the activep slot of the menu item */
# define wv_set_evalable_slot(slot,form) do {	\
  Lisp_Object wses_form = (form);		\
  (slot) = (NILP (wses_form) ? 0 :		\
	    EQ (wses_form, Qt) ? 1 :		\
	    !NILP (Feval (wses_form)));		\
} while (0)
#else
  /* Treat the activep slot of the menu item as a boolean */
# define wv_set_evalable_slot(slot,form)	\
      ((void) (slot = (!NILP (form))))
#endif

char *
menu_separator_style (CONST char *s)
{
  CONST char *p;
  char first;

  if (!s || s[0] == '\0')
    return NULL;
  first = s[0];
  if (first != '-' && first != '=')
    return NULL;
  for (p = s; *p == first; p++)
    DO_NOTHING;

  /* #### - cannot currently specify a separator tag "--!tag" and a
     separator style "--:style" at the same time. */
  /* #### - Also, the motif menubar code doesn't deal with the
     double etched style yet, so it's not good to get into the habit of
     using "===" in menubars to get double-etched lines */
  if (*p == '!' || *p == '\0')
    return ((first == '-')
	    ? NULL			/* single etched is the default */
	    : xstrdup ("shadowDoubleEtchedIn"));
  else if (*p == ':')
    return xstrdup (p+1);

  return NULL;
}

/* set menu accelerator key to first underlined character in menu name */

Lisp_Object
menu_name_to_accelerator (char *name)
{
  while (*name) {
    if (*name=='%') {
      ++name;
      if (!(*name))
	return Qnil;
      if (*name=='_' && *(name+1))
	{
	  int accelerator = (int) (unsigned char) (*(name+1));
	  return make_char (tolower (accelerator));
	}
    }
    ++name;
  }
  return Qnil;
}

/* This does the dirty work.  gc_currently_forbidden is 1 when this is called.
 */

int
button_item_to_widget_value (Lisp_Object desc, widget_value *wv,
			     int allow_text_field_p, int no_keys_p)
{
  /* !!#### This function has not been Mule-ized */
  /* This function cannot GC because gc_currently_forbidden is set when
     it's called */
  Lisp_Object name       = Qnil;
  Lisp_Object callback   = Qnil;
  Lisp_Object suffix     = Qnil;
  Lisp_Object active_p   = Qt;
  Lisp_Object include_p  = Qt;
  Lisp_Object selected_p = Qnil;
  Lisp_Object keys       = Qnil;
  Lisp_Object style      = Qnil;
  Lisp_Object config_tag = Qnil;
  Lisp_Object accel = Qnil;
  int length = XVECTOR_LENGTH (desc);
  Lisp_Object *contents = XVECTOR_DATA (desc);
  int plist_p;
  int selected_spec = 0, included_spec = 0;

  if (length < 2)
    signal_simple_error ("Button descriptors must be at least 2 long", desc);

  /* length 2:		[ "name" callback ]
     length 3:		[ "name" callback active-p ]
     length 4:		[ "name" callback active-p suffix ]
     		   or	[ "name" callback keyword  value  ]
     length 5+:		[ "name" callback [ keyword value ]+ ]
   */
  plist_p = (length >= 5 || (length > 2 && KEYWORDP (contents [2])));

  if (!plist_p && length > 2)
    /* the old way */
    {
      name = contents [0];
      callback = contents [1];
      active_p = contents [2];
      if (length == 4)
	suffix = contents [3];
    }
  else
    {
      /* the new way */
      int i;
      if (length & 1)
	signal_simple_error (
		"Button descriptor has an odd number of keywords and values",
			     desc);

      name = contents [0];
      callback = contents [1];
      for (i = 2; i < length;)
	{
	  Lisp_Object key = contents [i++];
	  Lisp_Object val = contents [i++];
	  if (!KEYWORDP (key))
	    signal_simple_error_2 ("Not a keyword", key, desc);

	  if      (EQ (key, Q_active))   active_p   = val;
	  else if (EQ (key, Q_suffix))   suffix     = val;
	  else if (EQ (key, Q_keys))     keys       = val;
	  else if (EQ (key, Q_style))    style      = val;
	  else if (EQ (key, Q_selected)) selected_p = val, selected_spec = 1;
	  else if (EQ (key, Q_included)) include_p  = val, included_spec = 1;
	  else if (EQ (key, Q_config))	 config_tag = val;
	  else if (EQ (key, Q_accelerator))
	    {
	      if ( SYMBOLP (val)
		   || CHARP (val))
		accel = val;
	      else
		signal_simple_error ("Bad keyboard accelerator", val);
	    }
	  else if (EQ (key, Q_filter))
	    signal_simple_error(":filter keyword not permitted on leaf nodes", desc);
	  else
	    signal_simple_error_2 ("Unknown menu item keyword", key, desc);
	}
    }

#ifdef HAVE_MENUBARS
  if ((!NILP (config_tag) && NILP (Fmemq (config_tag, Vmenubar_configuration)))
      || (included_spec && NILP (Feval (include_p))))
    {
      /* the include specification says to ignore this item. */
      return 0;
    }
#endif /* HAVE_MENUBARS */

  CHECK_STRING (name);
  wv->name = (char *) XSTRING_DATA (name);

  if (NILP (accel))
    accel = menu_name_to_accelerator (wv->name);
  wv->accel = LISP_TO_VOID (accel);

  if (!NILP (suffix))
    {
      CONST char *const_bogosity;
      Lisp_Object suffix2;

      /* Shortcut to avoid evaluating suffix each time */
      if (STRINGP (suffix))
	suffix2 = suffix;
      else
	{
	  suffix2 = Feval (suffix);
	  CHECK_STRING (suffix2);
	}

      GET_C_STRING_FILENAME_DATA_ALLOCA (suffix2, const_bogosity);
      wv->value = (char *) const_bogosity;
      wv->value = xstrdup (wv->value);
    }

  wv_set_evalable_slot (wv->enabled, active_p);
  wv_set_evalable_slot (wv->selected, selected_p);

  wv->call_data = LISP_TO_VOID (callback);

  if (no_keys_p
#ifdef HAVE_MENUBARS
      || !menubar_show_keybindings
#endif
      )
    wv->key = 0;
  else if (!NILP (keys))	/* Use this string to generate key bindings */
    {
      CHECK_STRING (keys);
      keys = Fsubstitute_command_keys (keys);
      if (XSTRING_LENGTH (keys) > 0)
	wv->key = xstrdup ((char *) XSTRING_DATA (keys));
      else
	wv->key = 0;
    }
  else if (SYMBOLP (callback))	/* Show the binding of this command. */
    {
      char buf [1024];
      /* #### Warning, dependency here on current_buffer and point */
      where_is_to_char (callback, buf);
      if (buf [0])
	wv->key = xstrdup (buf);
      else
	wv->key = 0;
    }

  CHECK_SYMBOL (style);
  if (NILP (style))
    {
      /* If the callback is nil, treat this item like unselectable text.
	 This way, dashes will show up as a separator. */
      if (!wv->enabled)
	wv->type = BUTTON_TYPE;
      if (separator_string_p (wv->name))
	{
	  wv->type = SEPARATOR_TYPE;
	  wv->value = menu_separator_style (wv->name);
	}
      else
	{
#if 0
	  /* #### - this is generally desirable for menubars, but it breaks
	     a package that uses dialog boxes and next_command_event magic
	     to use the callback slot in dialog buttons for data instead of
	     a real callback.

	     Code is data, right?  The beauty of LISP abuse.   --Stig */
	  if (NILP (callback))
	    wv->type = TEXT_TYPE;
	  else
#endif
	    wv->type = BUTTON_TYPE;
	}
    }
  else if (EQ (style, Qbutton))
    wv->type = BUTTON_TYPE;
  else if (EQ (style, Qtoggle))
    wv->type = TOGGLE_TYPE;
  else if (EQ (style, Qradio))
    wv->type = RADIO_TYPE;
  else if (EQ (style, Qtext))
    {
      wv->type = TEXT_TYPE;
#if 0
      wv->value = wv->name;
      wv->name = "value";
#endif
    }
  else
    signal_simple_error_2 ("Unknown style", style, desc);

  if (!allow_text_field_p && (wv->type == TEXT_TYPE))
    signal_simple_error ("Text field not allowed in this context", desc);

  if (selected_spec && EQ (style, Qtext))
    signal_simple_error (
         ":selected only makes sense with :style toggle, radio or button",
			 desc);
  return 1;
}

#endif /* HAVE_POPUPS */

/* This is a kludge to make sure emacs can only link against a version of
   lwlib that was compiled in the right way.  Emacs references symbols which
   correspond to the way it thinks lwlib was compiled, and if lwlib wasn't
   compiled in that way, then somewhat meaningful link errors will result.
   The alternatives to this range from obscure link errors, to obscure
   runtime errors that look a lot like bugs.
 */

static void
sanity_check_lwlib (void)
{
#define MACROLET(v) { extern int v; v = 1; }

#if (XlibSpecificationRelease == 4)
  MACROLET (lwlib_uses_x11r4);
#elif (XlibSpecificationRelease == 5)
  MACROLET (lwlib_uses_x11r5);
#elif (XlibSpecificationRelease == 6)
  MACROLET (lwlib_uses_x11r6);
#else
  MACROLET (lwlib_uses_unknown_x11);
#endif
#ifdef LWLIB_USES_MOTIF
  MACROLET (lwlib_uses_motif);
#else
  MACROLET (lwlib_does_not_use_motif);
#endif
#if (XmVersion >= 1002)
  MACROLET (lwlib_uses_motif_1_2);
#else
  MACROLET (lwlib_does_not_use_motif_1_2);
#endif
#ifdef LWLIB_MENUBARS_LUCID
  MACROLET (lwlib_menubars_lucid);
#elif defined (HAVE_MENUBARS)
  MACROLET (lwlib_menubars_motif);
#endif
#ifdef LWLIB_SCROLLBARS_LUCID
  MACROLET (lwlib_scrollbars_lucid);
#elif defined (LWLIB_SCROLLBARS_MOTIF)
  MACROLET (lwlib_scrollbars_motif);
#elif defined (HAVE_SCROLLBARS)
  MACROLET (lwlib_scrollbars_athena);
#endif
#ifdef LWLIB_DIALOGS_MOTIF
  MACROLET (lwlib_dialogs_motif);
#elif defined (HAVE_DIALOGS)
  MACROLET (lwlib_dialogs_athena);
#endif

#undef MACROLET
}

void
syms_of_gui_x (void)
{
#ifdef HAVE_POPUPS
  defsymbol (&Qmenu_no_selection_hook, "menu-no-selection-hook");
#endif
}

void
vars_of_gui_x (void)
{
  lwlib_id_tick = (1<<16);	/* start big, to not conflict with Energize */

#ifdef HAVE_POPUPS
  popup_up_p = 0;

  Vpopup_callbacks = Qnil;
  staticpro (&Vpopup_callbacks);

#if 0
  /* This DEFVAR_LISP is just for the benefit of make-docfile. */
  /* #### misnamed */
  DEFVAR_LISP ("menu-no-selection-hook", &Vmenu_no_selection_hook /*
Function or functions to call when a menu or dialog box is dismissed
without a selection having been made.
*/ );
#endif
  Fset (Qmenu_no_selection_hook, Qnil);
#endif /* HAVE_POPUPS */

  /* this makes only safe calls as in emacs.c */
  sanity_check_lwlib ();
}
