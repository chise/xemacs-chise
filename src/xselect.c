/* X Selection processing for XEmacs
   Copyright (C) 1990, 1991, 1992, 1993, 1994 Free Software Foundation, Inc.

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

/* Synched up with: Not synched with FSF. */

/* Rewritten by jwz */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "console-x.h"
#include "objects-x.h"

#include "frame.h"
#include "opaque.h"
#include "systime.h"

int lisp_to_time (Lisp_Object, time_t *);
Lisp_Object time_to_lisp (time_t);

#ifdef LWLIB_USES_MOTIF
# define MOTIF_CLIPBOARDS
#endif

#ifdef MOTIF_CLIPBOARDS
# include <Xm/CutPaste.h>
static void hack_motif_clipboard_selection (Atom selection_atom,
					    Lisp_Object selection_value,
					    Time thyme, Display *display,
					    Window selecting_window,
					    Bool owned_p);
#endif

#define CUT_BUFFER_SUPPORT

Lisp_Object QPRIMARY, QSECONDARY, QSTRING, QINTEGER, QCLIPBOARD, QTIMESTAMP,
  QTEXT, QDELETE, QMULTIPLE, QINCR, QEMACS_TMP, QTARGETS, QATOM, QNULL,
  QATOM_PAIR, QCOMPOUND_TEXT;

#ifdef CUT_BUFFER_SUPPORT
Lisp_Object QCUT_BUFFER0, QCUT_BUFFER1, QCUT_BUFFER2, QCUT_BUFFER3,
  QCUT_BUFFER4, QCUT_BUFFER5, QCUT_BUFFER6, QCUT_BUFFER7;
#endif

Lisp_Object Vx_lost_selection_hooks;
Lisp_Object Vx_sent_selection_hooks;

/* If this is a smaller number than the max-request-size of the display,
   emacs will use INCR selection transfer when the selection is larger
   than this.  The max-request-size is usually around 64k, so if you want
   emacs to use incremental selection transfers when the selection is
   smaller than that, set this.  I added this mostly for debugging the
   incremental transfer stuff, but it might improve server performance.
 */
#define MAX_SELECTION_QUANTUM 0xFFFFFF

#define SELECTION_QUANTUM(dpy) ((XMaxRequestSize (dpy) << 2) - 100)

/* This is an association list whose elements are of the form
     ( selection-name selection-value selection-timestamp )
   selection-name is a lisp symbol, whose name is the name of an X Atom.
   selection-value is the value that emacs owns for that selection.
     It may be any kind of Lisp object.
   selection-timestamp is the time at which emacs began owning this selection,
     as a cons of two 16-bit numbers (making a 32 bit time).
   If there is an entry in this alist, then it can be assumed that emacs owns
    that selection.
   The only (eq) parts of this list that are visible from elisp are the
    selection-values.
 */
Lisp_Object Vselection_alist;

/* This is an alist whose CARs are selection-types (whose names are the same
   as the names of X Atoms) and whose CDRs are the names of Lisp functions to
   call to convert the given Emacs selection value to a string representing
   the given selection type.  This is for elisp-level extension of the emacs
   selection handling.
 */
Lisp_Object Vselection_converter_alist;

/* "Selection owner couldn't convert selection" */
Lisp_Object Qselection_conversion_error;

/* If the selection owner takes too long to reply to a selection request,
   we give up on it.  This is in seconds (0 = no timeout).
 */
int x_selection_timeout;


/* Utility functions */

static void lisp_data_to_selection_data (struct device *,
					 Lisp_Object obj,
					 unsigned char **data_ret,
					 Atom *type_ret,
					 unsigned int *size_ret,
					 int *format_ret);
static Lisp_Object selection_data_to_lisp_data (struct device *,
						unsigned char *data,
						size_t size,
						Atom type,
						int format);
static Lisp_Object x_get_window_property_as_lisp_data (Display *,
						       Window,
						       Atom property,
						       Lisp_Object target_type,
						       Atom selection_atom);

static int expect_property_change (Display *, Window, Atom prop, int state);
static void wait_for_property_change (long);
static void unexpect_property_change (int);
static int waiting_for_other_props_on_window (Display *, Window);

/* This converts a Lisp symbol to a server Atom, avoiding a server
   roundtrip whenever possible.
 */
static Atom
symbol_to_x_atom (struct device *d, Lisp_Object sym, int only_if_exists)
{
  Display *display = DEVICE_X_DISPLAY (d);

  if (NILP (sym))		return XA_PRIMARY;
  if (EQ (sym, Qt))		return XA_SECONDARY;
  if (EQ (sym, QPRIMARY))	return XA_PRIMARY;
  if (EQ (sym, QSECONDARY))	return XA_SECONDARY;
  if (EQ (sym, QSTRING))	return XA_STRING;
  if (EQ (sym, QINTEGER))	return XA_INTEGER;
  if (EQ (sym, QATOM))		return XA_ATOM;
  if (EQ (sym, QCLIPBOARD))	return DEVICE_XATOM_CLIPBOARD (d);
  if (EQ (sym, QTIMESTAMP))	return DEVICE_XATOM_TIMESTAMP (d);
  if (EQ (sym, QTEXT))		return DEVICE_XATOM_TEXT      (d);
  if (EQ (sym, QDELETE))	return DEVICE_XATOM_DELETE    (d);
  if (EQ (sym, QMULTIPLE))	return DEVICE_XATOM_MULTIPLE  (d);
  if (EQ (sym, QINCR))		return DEVICE_XATOM_INCR      (d);
  if (EQ (sym, QEMACS_TMP))	return DEVICE_XATOM_EMACS_TMP (d);
  if (EQ (sym, QTARGETS))	return DEVICE_XATOM_TARGETS   (d);
  if (EQ (sym, QNULL))		return DEVICE_XATOM_NULL      (d);
  if (EQ (sym, QATOM_PAIR))	return DEVICE_XATOM_ATOM_PAIR (d);
  if (EQ (sym, QCOMPOUND_TEXT)) return DEVICE_XATOM_COMPOUND_TEXT (d);

#ifdef CUT_BUFFER_SUPPORT
  if (EQ (sym, QCUT_BUFFER0))	return XA_CUT_BUFFER0;
  if (EQ (sym, QCUT_BUFFER1))	return XA_CUT_BUFFER1;
  if (EQ (sym, QCUT_BUFFER2))	return XA_CUT_BUFFER2;
  if (EQ (sym, QCUT_BUFFER3))	return XA_CUT_BUFFER3;
  if (EQ (sym, QCUT_BUFFER4))	return XA_CUT_BUFFER4;
  if (EQ (sym, QCUT_BUFFER5))	return XA_CUT_BUFFER5;
  if (EQ (sym, QCUT_BUFFER6))	return XA_CUT_BUFFER6;
  if (EQ (sym, QCUT_BUFFER7))	return XA_CUT_BUFFER7;
#endif /* CUT_BUFFER_SUPPORT */

  {
    CONST char *nameext;
    GET_C_STRING_CTEXT_DATA_ALLOCA (Fsymbol_name (sym), nameext);
    return XInternAtom (display, nameext, only_if_exists ? True : False);
  }
}


/* This converts a server Atom to a Lisp symbol, avoiding server roundtrips
   and calls to intern whenever possible.
 */
static Lisp_Object
x_atom_to_symbol (struct device *d, Atom atom)
{
  Display *display = DEVICE_X_DISPLAY (d);

  if (! atom) return Qnil;
  if (atom == XA_PRIMARY)	return QPRIMARY;
  if (atom == XA_SECONDARY)	return QSECONDARY;
  if (atom == XA_STRING)	return QSTRING;
  if (atom == XA_INTEGER)	return QINTEGER;
  if (atom == XA_ATOM)		return QATOM;
  if (atom == DEVICE_XATOM_CLIPBOARD (d)) return QCLIPBOARD;
  if (atom == DEVICE_XATOM_TIMESTAMP (d)) return QTIMESTAMP;
  if (atom == DEVICE_XATOM_TEXT      (d)) return QTEXT;
  if (atom == DEVICE_XATOM_DELETE    (d)) return QDELETE;
  if (atom == DEVICE_XATOM_MULTIPLE  (d)) return QMULTIPLE;
  if (atom == DEVICE_XATOM_INCR      (d)) return QINCR;
  if (atom == DEVICE_XATOM_EMACS_TMP (d)) return QEMACS_TMP;
  if (atom == DEVICE_XATOM_TARGETS   (d)) return QTARGETS;
  if (atom == DEVICE_XATOM_NULL      (d)) return QNULL;
  if (atom == DEVICE_XATOM_ATOM_PAIR (d)) return QATOM_PAIR;
  if (atom == DEVICE_XATOM_COMPOUND_TEXT (d)) return QCOMPOUND_TEXT;

#ifdef CUT_BUFFER_SUPPORT
  if (atom == XA_CUT_BUFFER0)	return QCUT_BUFFER0;
  if (atom == XA_CUT_BUFFER1)	return QCUT_BUFFER1;
  if (atom == XA_CUT_BUFFER2)	return QCUT_BUFFER2;
  if (atom == XA_CUT_BUFFER3)	return QCUT_BUFFER3;
  if (atom == XA_CUT_BUFFER4)	return QCUT_BUFFER4;
  if (atom == XA_CUT_BUFFER5)	return QCUT_BUFFER5;
  if (atom == XA_CUT_BUFFER6)	return QCUT_BUFFER6;
  if (atom == XA_CUT_BUFFER7)	return QCUT_BUFFER7;
#endif

  {
    Lisp_Object newsym;
    CONST Bufbyte *intstr;
    char *str = XGetAtomName (display, atom);

    if (! str) return Qnil;

    GET_C_CHARPTR_INT_CTEXT_DATA_ALLOCA (str, intstr);
    newsym = intern ((char *) intstr);
    XFree (str);
    return newsym;
  }
}


/* Do protocol to assert ourself as a selection owner.
   Update the Vselection_alist so that we can reply to later requests for
   our selection.
 */
static void
x_own_selection (Lisp_Object selection_name, Lisp_Object selection_value)
{
  struct device *d = decode_x_device (Qnil);
  Display *display = DEVICE_X_DISPLAY (d);
  struct frame *sel_frame = selected_frame ();
  Window selecting_window = XtWindow (FRAME_X_TEXT_WIDGET (sel_frame));
  /* Use the time of the last-read mouse or keyboard event.
     For selection purposes, we use this as a sleazy way of knowing what the
     current time is in server-time.  This assumes that the most recently read
     mouse or keyboard event has something to do with the assertion of the
     selection, which is probably true.
     */
  Time thyme = DEVICE_X_MOUSE_TIMESTAMP (d);
  Atom selection_atom;

  CHECK_SYMBOL (selection_name);
  selection_atom = symbol_to_x_atom (d, selection_name, 0);

  XSetSelectionOwner (display, selection_atom, selecting_window, thyme);

  /* Now update the local cache */
  {
    /* We do NOT use time_to_lisp() here any more, like we used to.
       That assumed equivalence of time_t and Time, which is not
       necessarily the case (e.g. under OSF on the Alphas, where
       Time is a 64-bit quantity and time_t is a 32-bit quantity).

       Opaque pointers are the clean way to go here.
     */
    Lisp_Object selection_time = make_opaque (sizeof (thyme), (void *) &thyme);
    Lisp_Object selection_data = list3 (selection_name,
					selection_value,
					selection_time);
    Lisp_Object prev_value = assq_no_quit (selection_name, Vselection_alist);
    Vselection_alist = Fcons (selection_data, Vselection_alist);

    /* If we already owned the selection, remove the old selection data.
       Perhaps we should destructively modify it instead.
       Don't use Fdelq() as that may QUIT;.
     */
    if (!NILP (prev_value))
      {
	Lisp_Object rest;	/* we know it's not the CAR, so it's easy. */
	for (rest = Vselection_alist; !NILP (rest); rest = Fcdr (rest))
	  if (EQ (prev_value, Fcar (XCDR (rest))))
	    {
	      XCDR (rest) = Fcdr (XCDR (rest));
	      break;
	    }
      }
#ifdef MOTIF_CLIPBOARDS
    hack_motif_clipboard_selection (selection_atom, selection_value,
				    thyme, display, selecting_window,
				    !NILP (prev_value));
#endif
  }
}


#ifdef MOTIF_CLIPBOARDS /* Bend over baby.  Take it and like it. */

# ifdef MOTIF_INCREMENTAL_CLIPBOARDS_WORK
static void motif_clipboard_cb ();
# endif

static void
hack_motif_clipboard_selection (Atom selection_atom,
				Lisp_Object selection_value,
				Time thyme,
				Display *display,
				Window selecting_window,
				Bool owned_p)
{
  struct device *d = get_device_from_display (display);
  /* Those Motif wankers can't be bothered to follow the ICCCM, and do
     their own non-Xlib non-Xt clipboard processing.  So we have to do
     this so that linked-in Motif widgets don't get themselves wedged.
   */
  if (selection_atom == DEVICE_XATOM_CLIPBOARD (d)
      && STRINGP (selection_value)

      /* If we already own the clipboard, don't own it again in the Motif
	 way.  This might lose in some subtle way, since the timestamp won't
	 be current, but owning the selection on the Motif way does a
	 SHITLOAD of X protocol, and it makes killing text be incredibly
	 slow when using an X terminal.  ARRRRGGGHHH!!!!
       */
      /* No, this is no good, because then Motif text fields don't bother
	 to look up the new value, and you can't Copy from a buffer, Paste
	 into a text field, then Copy something else from the buffer and
	 paste it into the text field -- it pastes the first thing again. */
/*      && !owned_p */
      )
    {
#ifdef MOTIF_INCREMENTAL_CLIPBOARDS_WORK
      Widget widget = FRAME_X_TEXT_WIDGET (selected_frame());
#endif
      long itemid;
#if XmVersion >= 1002
      long dataid;
#else
      int dataid;	/* 1.2 wants long, but 1.1.5 wants int... */
#endif
      XmString fmh;
      String encoding = "STRING";
      CONST Extbyte *data  = XSTRING_DATA (selection_value);
      Extcount bytes = XSTRING_LENGTH (selection_value);

#ifdef MULE
      {
	enum { ASCII, LATIN_1, WORLD } chartypes = ASCII;
	CONST Bufbyte *ptr = data, *end = ptr + bytes;
	/* Optimize for the common ASCII case */
	while (ptr <= end)
	  {
	    if (BYTE_ASCII_P (*ptr))
	      {
		ptr++;
		continue;
	      }

	    if ((*ptr) == LEADING_BYTE_LATIN_ISO8859_1 ||
		(*ptr) == LEADING_BYTE_CONTROL_1)
	      {
		chartypes = LATIN_1;
		ptr += 2;
		continue;
	      }

	    chartypes = WORLD;
	    break;
	  }

	if (chartypes == LATIN_1)
	  GET_STRING_BINARY_DATA_ALLOCA (selection_value, data, bytes);
	else if (chartypes == WORLD)
	  {
	    GET_STRING_CTEXT_DATA_ALLOCA (selection_value, data, bytes);
	    encoding = "COMPOUND_TEXT";
	  }
      }
#endif /* MULE */

      fmh = XmStringCreateLtoR ("Clipboard", XmSTRING_DEFAULT_CHARSET);
      while (ClipboardSuccess !=
	     XmClipboardStartCopy (display, selecting_window, fmh, thyme,
#ifdef MOTIF_INCREMENTAL_CLIPBOARDS_WORK
				   widget, motif_clipboard_cb,
#else
				   0, NULL,
#endif
				   &itemid))
	;
      XmStringFree (fmh);
      while (ClipboardSuccess !=
	     XmClipboardCopy (display, selecting_window, itemid, encoding,
#ifdef MOTIF_INCREMENTAL_CLIPBOARDS_WORK
			      /* O'Reilly examples say size can be 0,
				 but this clearly is not the case. */
			      0, bytes, (int) selecting_window, /* private id */
#else /* !MOTIF_INCREMENTAL_CLIPBOARDS_WORK */
			      (XtPointer) data, bytes, 0,
#endif /* !MOTIF_INCREMENTAL_CLIPBOARDS_WORK */
			      &dataid))
	;
      while (ClipboardSuccess !=
	     XmClipboardEndCopy (display, selecting_window, itemid))
	;
    }
}

# ifdef MOTIF_INCREMENTAL_CLIPBOARDS_WORK
/* I tried to treat the clipboard like a real selection, and not send
   the data until it was requested, but it looks like that just doesn't
   work at all unless the selection owner and requestor are in different
   processes.  From reading the Motif source, it looks like they never
   even considered having two widgets in the same application transfer
   data between each other using "by-name" clipboard values.  What a
   bunch of fuckups.
 */
static void
motif_clipboard_cb (Widget widget, int *data_id, int *private_id, int *reason)
{
  switch (*reason)
    {
    case XmCR_CLIPBOARD_DATA_REQUEST:
      {
	Display *dpy = XtDisplay (widget);
	Window window = (Window) *private_id;
	Lisp_Object selection = assq_no_quit (QCLIPBOARD, Vselection_alist);
	if (NILP (selection)) abort ();
	selection = XCDR (selection);
	if (!STRINGP (selection)) abort ();
	XmClipboardCopyByName (dpy, window, *data_id,
			       (char *) XSTRING_DATA (selection),
			       XSTRING_LENGTH (selection) + 1,
			       0);
      }
      break;
    case XmCR_CLIPBOARD_DATA_DELETE:
    default:
      /* don't need to free anything */
      break;
    }
}
# endif /* MOTIF_INCREMENTAL_CLIPBOARDS_WORK */
#endif /* MOTIF_CLIPBOARDS */


/* Given a selection-name and desired type, this looks up our local copy of
   the selection value and converts it to the type.  It returns nil or a
   string.  This calls random elisp code, and may signal or gc.
 */
static Lisp_Object
x_get_local_selection (Lisp_Object selection_symbol, Lisp_Object target_type)
{
  /* This function can GC */
  Lisp_Object local_value = assq_no_quit (selection_symbol, Vselection_alist);
  Lisp_Object handler_fn, value, check;

  if (NILP (local_value)) return Qnil;

  /* TIMESTAMP and MULTIPLE are special cases 'cause that's easiest. */
  if (EQ (target_type, QTIMESTAMP))
    {
      handler_fn = Qnil;
      value = XCAR (XCDR (XCDR (local_value)));
    }

#if 0 /* #### MULTIPLE doesn't work yet */
  else if (CONSP (target_type) &&
	   XCAR (target_type) == QMULTIPLE)
    {
      Lisp_Object pairs = XCDR (target_type);
      int len = XVECTOR_LENGTH (pairs);
      int i;
      /* If the target is MULTIPLE, then target_type looks like
	  (MULTIPLE . [[SELECTION1 TARGET1] [SELECTION2 TARGET2] ... ])
	 We modify the second element of each pair in the vector and
	 return it as [[SELECTION1 <value1>] [SELECTION2 <value2>] ... ]
       */
      for (i = 0; i < len; i++)
	{
	  Lisp_Object pair = XVECTOR_DATA (pairs) [i];
	  XVECTOR_DATA (pair) [1] =
	    x_get_local_selection (XVECTOR_DATA (pair) [0],
				   XVECTOR_DATA (pair) [1]);
	}
      return pairs;
    }
#endif
  else
    {
      CHECK_SYMBOL (target_type);
      handler_fn = Fcdr (Fassq (target_type, Vselection_converter_alist));
      if (NILP (handler_fn)) return Qnil;
      value = call3 (handler_fn,
		     selection_symbol, target_type,
		     XCAR (XCDR (local_value)));
    }

  /* This lets the selection function to return (TYPE . VALUE).  For example,
     when the selected type is LINE_NUMBER, the returned type is SPAN, not
     INTEGER.
   */
  check = value;
  if (CONSP (value) && SYMBOLP (XCAR (value)))
    check = XCDR (value);

  /* Strings, vectors, and symbols are converted to selection data format in
     the obvious way.  Integers are converted to 16 bit quantities if they're
     small enough, otherwise 32 bits are used.
   */
  if (STRINGP (check) ||
      VECTORP (check) ||
      SYMBOLP (check) ||
      INTP    (check) ||
      CHARP   (check) ||
      NILP (value))
    return value;

  /* (N . M) or (N M) get turned into a 32 bit quantity.  So if you want to
     always return a small quantity as 32 bits, your converter routine needs
     to return a cons.
   */
  else if (CONSP (check) &&
	   INTP (XCAR (check)) &&
	   (INTP (XCDR (check)) ||
	    (CONSP (XCDR (check)) &&
	     INTP (XCAR (XCDR (check))) &&
	     NILP (XCDR (XCDR (check))))))
    return value;
  /* Otherwise the lisp converter function returned something unrecognized.
   */
  else
    signal_error (Qerror,
                  list3 (build_string
			 ("unrecognized selection-conversion type"),
                         handler_fn,
                         value));

  return Qnil;	/* suppress compiler warning */
}



/* Send a SelectionNotify event to the requestor with property=None, meaning
   we were unable to do what they wanted.
 */
static void
x_decline_selection_request (XSelectionRequestEvent *event)
{
  XSelectionEvent reply;
  reply.type      = SelectionNotify;
  reply.display   = event->display;
  reply.requestor = event->requestor;
  reply.selection = event->selection;
  reply.time      = event->time;
  reply.target    = event->target;
  reply.property  = None;

  XSendEvent (reply.display, reply.requestor, False, 0L, (XEvent *) &reply);
  XFlush (reply.display);
}


/* Used as an unwind-protect clause so that, if a selection-converter signals
   an error, we tell the requestor that we were unable to do what they wanted
   before we throw to top-level or go into the debugger or whatever.
 */
static Lisp_Object
x_selection_request_lisp_error (Lisp_Object closure)
{
  XSelectionRequestEvent *event = (XSelectionRequestEvent *)
    get_opaque_ptr (closure);

  free_opaque_ptr (closure);
  if (event->type == 0) /* we set this to mean "completed normally" */
    return Qnil;
  x_decline_selection_request (event);
  return Qnil;
}


/* Convert our selection to the requested type, and put that data where the
   requestor wants it.  Then tell them whether we've succeeded.
 */
static void
x_reply_selection_request (XSelectionRequestEvent *event, int format,
			   unsigned char *data, int size, Atom type)
{
  /* This function can GC */
  XSelectionEvent reply;
  Display *display = event->display;
  struct device *d = get_device_from_display (display);
  Window window = event->requestor;
  int bytes_remaining;
  int format_bytes = format/8;
  int max_bytes = SELECTION_QUANTUM (display);
  if (max_bytes > MAX_SELECTION_QUANTUM) max_bytes = MAX_SELECTION_QUANTUM;

  reply.type      = SelectionNotify;
  reply.display   = display;
  reply.requestor = window;
  reply.selection = event->selection;
  reply.time      = event->time;
  reply.target    = event->target;
  reply.property  = (event->property == None ? event->target : event->property);

  /* #### XChangeProperty can generate BadAlloc, and we must handle it! */

  /* Store the data on the requested property.
     If the selection is large, only store the first N bytes of it.
   */
  bytes_remaining = size * format_bytes;
  if (bytes_remaining <= max_bytes)
    {
      /* Send all the data at once, with minimal handshaking. */
#if 0
      stderr_out ("\nStoring all %d\n", bytes_remaining);
#endif
      XChangeProperty (display, window, reply.property, type, format,
		       PropModeReplace, data, size);
      /* At this point, the selection was successfully stored; ack it. */
      XSendEvent (display, window, False, 0L, (XEvent *) &reply);
      XFlush (display);
    }
  else
    {
      /* Send an INCR selection. */
      int prop_id;

      if (x_window_to_frame (d, window)) /* #### debug */
	error ("attempt to transfer an INCR to ourself!");
#if 0
      stderr_out ("\nINCR %d\n", bytes_remaining);
#endif
      prop_id = expect_property_change (display, window, reply.property,
					PropertyDelete);

      XChangeProperty (display, window, reply.property, DEVICE_XATOM_INCR (d),
		       32, PropModeReplace, (unsigned char *)
		       &bytes_remaining, 1);
      XSelectInput (display, window, PropertyChangeMask);
      /* Tell 'em the INCR data is there... */
      XSendEvent (display, window, False, 0L, (XEvent *) &reply);
      XFlush (display);

      /* First, wait for the requestor to ack by deleting the property.
	 This can run random lisp code (process handlers) or signal.
       */
      wait_for_property_change (prop_id);

      while (bytes_remaining)
	{
	  int i = ((bytes_remaining < max_bytes)
		   ? bytes_remaining
		   : max_bytes);
	  prop_id = expect_property_change (display, window, reply.property,
					    PropertyDelete);
#if 0
	  stderr_out ("  INCR adding %d\n", i);
#endif
	  /* Append the next chunk of data to the property. */
	  XChangeProperty (display, window, reply.property, type, format,
			   PropModeAppend, data, i / format_bytes);
	  bytes_remaining -= i;
	  data += i;

	  /* Now wait for the requestor to ack this chunk by deleting the
	     property.	 This can run random lisp code or signal.
	   */
	  wait_for_property_change (prop_id);
	}
      /* Now write a zero-length chunk to the property to tell the requestor
	 that we're done. */
#if 0
      stderr_out ("  INCR done\n");
#endif
      if (! waiting_for_other_props_on_window (display, window))
	XSelectInput (display, window, 0L);

      XChangeProperty (display, window, reply.property, type, format,
		       PropModeReplace, data, 0);
    }
}



/* Called from the event-loop in response to a SelectionRequest event.
 */
void
x_handle_selection_request (XSelectionRequestEvent *event)
{
  /* This function can GC */
  struct gcpro gcpro1, gcpro2, gcpro3;
  Lisp_Object local_selection_data = Qnil;
  Lisp_Object selection_symbol;
  Lisp_Object target_symbol = Qnil;
  Lisp_Object converted_selection = Qnil;
  Time local_selection_time;
  Lisp_Object successful_p = Qnil;
  int count;
  struct device *d = get_device_from_display (event->display);

  GCPRO3 (local_selection_data, converted_selection, target_symbol);

  selection_symbol = x_atom_to_symbol (d, event->selection);

  local_selection_data = assq_no_quit (selection_symbol, Vselection_alist);

#if 0
  /* This list isn't user-visible, so it can't "go bad." */
  assert (CONSP (local_selection_data));
  assert (CONSP (XCDR (local_selection_data)));
  assert (CONSP (XCDR (XCDR (local_selection_data))));
  assert (NILP  (XCDR (XCDR (XCDR (local_selection_data)))));
  assert (CONSP (XCAR (XCDR (XCDR (local_selection_data)))));
  assert (INTP  (XCAR (XCAR (XCDR (XCDR (local_selection_data))))));
  assert (INTP  (XCDR (XCAR (XCDR (XCDR (local_selection_data))))));
#endif

  if (NILP (local_selection_data))
    {
      /* Someone asked for the selection, but we don't have it any more. */
      x_decline_selection_request (event);
      goto DONE_LABEL;
    }

  local_selection_time =
    * (Time *) XOPAQUE_DATA (XCAR (XCDR (XCDR (local_selection_data))));

  if (event->time != CurrentTime &&
      local_selection_time > event->time)
    {
      /* Someone asked for the selection, and we have one, but not the one
	 they're looking for. */
      x_decline_selection_request (event);
      goto DONE_LABEL;
    }

  count = specpdl_depth ();
  record_unwind_protect (x_selection_request_lisp_error,
			 make_opaque_ptr (event));
  target_symbol = x_atom_to_symbol (d, event->target);

#if 0 /* #### MULTIPLE doesn't work yet */
  if (EQ (target_symbol, QMULTIPLE))
    target_symbol = fetch_multiple_target (event);
#endif

  /* Convert lisp objects back into binary data */

  converted_selection =
    x_get_local_selection (selection_symbol, target_symbol);

  if (! NILP (converted_selection))
    {
      unsigned char *data;
      unsigned int size;
      int format;
      Atom type;
      lisp_data_to_selection_data (d, converted_selection,
				   &data, &type, &size, &format);

      x_reply_selection_request (event, format, data, size, type);
      successful_p = Qt;
      /* Tell x_selection_request_lisp_error() it's cool. */
      event->type = 0;
      xfree (data);
    }
  unbind_to (count, Qnil);

 DONE_LABEL:

  UNGCPRO;

  /* Let random lisp code notice that the selection has been asked for. */
  {
    Lisp_Object rest;
    Lisp_Object val = Vx_sent_selection_hooks;
    if (!UNBOUNDP (val) && !NILP (val))
      {
	if (CONSP (val) && !EQ (XCAR (val), Qlambda))
	  for (rest = val; !NILP (rest); rest = Fcdr (rest))
	    call3 (Fcar(rest), selection_symbol, target_symbol,
		   successful_p);
	else
	  call3 (val, selection_symbol, target_symbol,
		 successful_p);
      }
  }
}


/* Called from the event-loop in response to a SelectionClear event.
 */
void
x_handle_selection_clear (XSelectionClearEvent *event)
{
  Display *display = event->display;
  struct device *d = get_device_from_display (display);
  Atom selection = event->selection;
  Time changed_owner_time = event->time;

  Lisp_Object selection_symbol, local_selection_data;
  Time local_selection_time;

  selection_symbol = x_atom_to_symbol (d, selection);

  local_selection_data = assq_no_quit (selection_symbol, Vselection_alist);

  /* Well, we already believe that we don't own it, so that's just fine. */
  if (NILP (local_selection_data)) return;

  local_selection_time =
    * (Time *) XOPAQUE_DATA (XCAR (XCDR (XCDR (local_selection_data))));

  /* This SelectionClear is for a selection that we no longer own, so we can
     disregard it.  (That is, we have reasserted the selection since this
     request was generated.)
   */
  if (changed_owner_time != CurrentTime &&
      local_selection_time > changed_owner_time)
    return;

  /* Otherwise, we're really honest and truly being told to drop it.
     Don't use Fdelq() as that may QUIT;.
   */
  if (EQ (local_selection_data, Fcar (Vselection_alist)))
    Vselection_alist = Fcdr (Vselection_alist);
  else
    {
      Lisp_Object rest;
      for (rest = Vselection_alist; !NILP (rest); rest = Fcdr (rest))
	if (EQ (local_selection_data, Fcar (XCDR (rest))))
	  {
	    XCDR (rest) = Fcdr (XCDR (rest));
	    break;
	  }
    }

  /* Let random lisp code notice that the selection has been stolen.
   */
  {
    Lisp_Object rest;
    Lisp_Object val = Vx_lost_selection_hooks;
    if (!UNBOUNDP (val) && !NILP (val))
      {
	if (CONSP (val) && !EQ (XCAR (val), Qlambda))
	  for (rest = val; !NILP (rest); rest = Fcdr (rest))
	    call1 (Fcar (rest), selection_symbol);
	else
	  call1 (val, selection_symbol);
      }
  }
}


/* This stuff is so that INCR selections are reentrant (that is, so we can
   be servicing multiple INCR selection requests simultaneously).  I haven't
   actually tested that yet.
 */

static int prop_location_tick;

static struct prop_location {
  int tick;
  Display *display;
  Window window;
  Atom property;
  int desired_state;
  struct prop_location *next;
} *for_whom_the_bell_tolls;


static int
property_deleted_p (void *tick)
{
  struct prop_location *rest = for_whom_the_bell_tolls;
  while (rest)
    if (rest->tick == (long) tick)
      return 0;
    else
      rest = rest->next;
  return 1;
}

static int
waiting_for_other_props_on_window (Display *display, Window window)
{
  struct prop_location *rest = for_whom_the_bell_tolls;
  while (rest)
    if (rest->display == display && rest->window == window)
      return 1;
    else
      rest = rest->next;
  return 0;
}


static int
expect_property_change (Display *display, Window window,
			Atom property, int state)
{
  struct prop_location *pl = xnew (struct prop_location);
  pl->tick = ++prop_location_tick;
  pl->display = display;
  pl->window = window;
  pl->property = property;
  pl->desired_state = state;
  pl->next = for_whom_the_bell_tolls;
  for_whom_the_bell_tolls = pl;
  return pl->tick;
}

static void
unexpect_property_change (int tick)
{
  struct prop_location *prev = 0, *rest = for_whom_the_bell_tolls;
  while (rest)
    {
      if (rest->tick == tick)
	{
	  if (prev)
	    prev->next = rest->next;
	  else
	    for_whom_the_bell_tolls = rest->next;
	  xfree (rest);
	  return;
	}
      prev = rest;
      rest = rest->next;
    }
}

static void
wait_for_property_change (long tick)
{
  /* This function can GC */
  wait_delaying_user_input (property_deleted_p, (void *) tick);
}


/* Called from the event-loop in response to a PropertyNotify event.
 */
void
x_handle_property_notify (XPropertyEvent *event)
{
  struct prop_location *prev = 0, *rest = for_whom_the_bell_tolls;
  while (rest)
    {
      if (rest->property == event->atom &&
	  rest->window == event->window &&
	  rest->display == event->display &&
	  rest->desired_state == event->state)
	{
#if 0
	  stderr_out ("Saw expected prop-%s on %s\n",
		   (event->state == PropertyDelete ? "delete" : "change"),
		      (char *) string_data (XSYMBOL (x_atom_to_symbol (get_device_from_display (event->display), event->atom))->name);
#endif
	  if (prev)
	    prev->next = rest->next;
	  else
	    for_whom_the_bell_tolls = rest->next;
	  xfree (rest);
	  return;
	}
      prev = rest;
      rest = rest->next;
    }
#if 0
  stderr_out ("Saw UNexpected prop-%s on %s\n",
	   (event->state == PropertyDelete ? "delete" : "change"),
	   (char *) string_data (XSYMBOL (x_atom_to_symbol (get_device_from_display (event->display), event->atom))->name));
#endif
}



#if 0 /* #### MULTIPLE doesn't work yet */

static Lisp_Object
fetch_multiple_target (XSelectionRequestEvent *event)
{
  /* This function can GC */
  Display *display = event->display;
  Window window = event->requestor;
  Atom target = event->target;
  Atom selection_atom = event->selection;
  int result;

  return
    Fcons (QMULTIPLE,
	   x_get_window_property_as_lisp_data (display, window, target,
					       QMULTIPLE,
					       selection_atom));
}

static Lisp_Object
copy_multiple_data (Lisp_Object obj)
{
  Lisp_Object vec;
  int i;
  int len;
  if (CONSP (obj))
    return Fcons (XCAR (obj), copy_multiple_data (XCDR (obj)));

  CHECK_VECTOR (obj);
  len = XVECTOR_LENGTH (obj);
  vec = make_vector (len, Qnil);
  for (i = 0; i < len; i++)
    {
      Lisp_Object vec2 = XVECTOR_DATA (obj) [i];
      CHECK_VECTOR (vec2);
      if (XVECTOR_LENGTH (vec2) != 2)
	signal_error (Qerror, list2 (build_string
				     ("vectors must be of length 2"),
                                     vec2));
      XVECTOR_DATA (vec) [i] = make_vector (2, Qnil);
      XVECTOR_DATA (XVECTOR_DATA (vec) [i]) [0] = XVECTOR_DATA (vec2) [0];
      XVECTOR_DATA (XVECTOR_DATA (vec) [i]) [1] = XVECTOR_DATA (vec2) [1];
    }
  return vec;
}

#endif /* 0 */


static Window reading_selection_reply;
static Atom reading_which_selection;
static int selection_reply_timed_out;

static int
selection_reply_done (void *ignore)
{
  return !reading_selection_reply;
}

static Lisp_Object Qx_selection_reply_timeout_internal;

DEFUN ("x-selection-reply-timeout-internal", Fx_selection_reply_timeout_internal,
       1, 1, 0, /*
*/
       (arg))
{
  selection_reply_timed_out = 1;
  reading_selection_reply = 0;
  return Qnil;
}


/* Do protocol to read selection-data from the server.
   Converts this to lisp data and returns it.
 */
static Lisp_Object
x_get_foreign_selection (Lisp_Object selection_symbol, Lisp_Object target_type)
{
  /* This function can GC */
  struct device *d = decode_x_device (Qnil);
  Display *display = DEVICE_X_DISPLAY (d);
  struct frame *sel_frame = selected_frame ();
  Window requestor_window = XtWindow (FRAME_X_TEXT_WIDGET (sel_frame));
  Time requestor_time = DEVICE_X_MOUSE_TIMESTAMP (d);
  Atom target_property = DEVICE_XATOM_EMACS_TMP (d);
  Atom selection_atom = symbol_to_x_atom (d, selection_symbol, 0);
  int speccount;
  Atom type_atom = symbol_to_x_atom (d, (CONSP (target_type) ?
					 XCAR (target_type) : target_type), 0);

  XConvertSelection (display, selection_atom, type_atom, target_property,
		     requestor_window, requestor_time);

  /* Block until the reply has been read. */
  reading_selection_reply = requestor_window;
  reading_which_selection = selection_atom;
  selection_reply_timed_out = 0;

  speccount = specpdl_depth ();

  /* add a timeout handler */
  if (x_selection_timeout > 0)
    {
      Lisp_Object id = Fadd_timeout (make_int (x_selection_timeout),
				     Qx_selection_reply_timeout_internal,
				     Qnil, Qnil);
      record_unwind_protect (Fdisable_timeout, id);
    }

  /* This is ^Gable */
  wait_delaying_user_input (selection_reply_done, 0);

  if (selection_reply_timed_out)
    error ("timed out waiting for reply from selection owner");

  unbind_to (speccount, Qnil);

  /* otherwise, the selection is waiting for us on the requested property. */
  return
    x_get_window_property_as_lisp_data (display, requestor_window,
					target_property, target_type,
					selection_atom);
}


static void
x_get_window_property (Display *display, Window window, Atom property,
		       unsigned char **data_ret, int *bytes_ret,
		       Atom *actual_type_ret, int *actual_format_ret,
		       unsigned long *actual_size_ret, int delete_p)
{
  int total_size;
  unsigned long bytes_remaining;
  int offset = 0;
  unsigned char *tmp_data = 0;
  int result;
  int buffer_size = SELECTION_QUANTUM (display);
  if (buffer_size > MAX_SELECTION_QUANTUM) buffer_size = MAX_SELECTION_QUANTUM;

  /* First probe the thing to find out how big it is. */
  result = XGetWindowProperty (display, window, property,
			       0, 0, False, AnyPropertyType,
			       actual_type_ret, actual_format_ret,
			       actual_size_ret,
			       &bytes_remaining, &tmp_data);
  if (result != Success)
    {
      *data_ret = 0;
      *bytes_ret = 0;
      return;
    }
  XFree ((char *) tmp_data);

  if (*actual_type_ret == None || *actual_format_ret == 0)
    {
      if (delete_p) XDeleteProperty (display, window, property);
      *data_ret = 0;
      *bytes_ret = 0;
      return;
    }

  total_size = bytes_remaining + 1;
  *data_ret = (unsigned char *) xmalloc (total_size);

  /* Now read, until we've gotten it all. */
  while (bytes_remaining)
    {
#if 0
      int last = bytes_remaining;
#endif
      result =
	XGetWindowProperty (display, window, property,
			    offset/4, buffer_size/4,
			    (delete_p ? True : False),
			    AnyPropertyType,
			    actual_type_ret, actual_format_ret,
			    actual_size_ret, &bytes_remaining, &tmp_data);
#if 0
      stderr_out ("<< read %d\n", last-bytes_remaining);
#endif
      /* If this doesn't return Success at this point, it means that
	 some clod deleted the selection while we were in the midst of
	 reading it.  Deal with that, I guess....
       */
      if (result != Success) break;
      *actual_size_ret *= *actual_format_ret / 8;
      memcpy ((*data_ret) + offset, tmp_data, *actual_size_ret);
      offset += *actual_size_ret;
      XFree ((char *) tmp_data);
    }
  *bytes_ret = offset;
}


static void
receive_incremental_selection (Display *display, Window window, Atom property,
			       /* this one is for error messages only */
			       Lisp_Object target_type,
			       unsigned int min_size_bytes,
			       unsigned char **data_ret, int *size_bytes_ret,
			       Atom *type_ret, int *format_ret,
			       unsigned long *size_ret)
{
  /* This function can GC */
  int offset = 0;
  int prop_id;
  *size_bytes_ret = min_size_bytes;
  *data_ret = (unsigned char *) xmalloc (*size_bytes_ret);
#if 0
  stderr_out ("\nread INCR %d\n", min_size_bytes);
#endif
  /* At this point, we have read an INCR property, and deleted it (which
     is how we ack its receipt: the sending window will be selecting
     PropertyNotify events on our window to notice this).

     Now, we must loop, waiting for the sending window to put a value on
     that property, then reading the property, then deleting it to ack.
     We are done when the sender places a property of length 0.
   */
  prop_id = expect_property_change (display, window, property,
				    PropertyNewValue);
  while (1)
    {
      unsigned char *tmp_data;
      int tmp_size_bytes;
      wait_for_property_change (prop_id);
      /* expect it again immediately, because x_get_window_property may
	 .. no it won't, I don't get it.
	 .. Ok, I get it now, the Xt code that implements INCR is broken.
       */
      prop_id = expect_property_change (display, window, property,
					PropertyNewValue);
      x_get_window_property (display, window, property,
			     &tmp_data, &tmp_size_bytes,
			     type_ret, format_ret, size_ret, 1);

      if (tmp_size_bytes == 0) /* we're done */
	{
#if 0
	  stderr_out ("  read INCR done\n");
#endif
	  unexpect_property_change (prop_id);
	  if (tmp_data) xfree (tmp_data);
	  break;
	}
#if 0
      stderr_out ("  read INCR %d\n", tmp_size_bytes);
#endif
      if (*size_bytes_ret < offset + tmp_size_bytes)
	{
#if 0
	  stderr_out ("  read INCR realloc %d -> %d\n",
		   *size_bytes_ret, offset + tmp_size_bytes);
#endif
	  *size_bytes_ret = offset + tmp_size_bytes;
	  *data_ret = (unsigned char *) xrealloc (*data_ret, *size_bytes_ret);
	}
      memcpy ((*data_ret) + offset, tmp_data, tmp_size_bytes);
      offset += tmp_size_bytes;
      xfree (tmp_data);
    }
}


static Lisp_Object
x_get_window_property_as_lisp_data (Display *display,
				    Window window,
				    Atom property,
				    /* next two for error messages only */
				    Lisp_Object target_type,
				    Atom selection_atom)
{
  /* This function can GC */
  Atom actual_type;
  int actual_format;
  unsigned long actual_size;
  unsigned char *data = NULL;
  int bytes = 0;
  Lisp_Object val;
  struct device *d = get_device_from_display (display);

  x_get_window_property (display, window, property, &data, &bytes,
			 &actual_type, &actual_format, &actual_size, 1);
  if (! data)
    {
      if (XGetSelectionOwner (display, selection_atom))
	/* there is a selection owner */
	signal_error
	  (Qselection_conversion_error,
	   Fcons (build_string ("selection owner couldn't convert"),
		  Fcons (x_atom_to_symbol (d, selection_atom),
			 actual_type ?
			 list2 (target_type, x_atom_to_symbol (d, actual_type)) :
			 list1 (target_type))));
      else
	signal_error (Qerror,
		      list2 (build_string ("no selection"),
			     x_atom_to_symbol (d, selection_atom)));
    }

  if (actual_type == DEVICE_XATOM_INCR (d))
    {
      /* Ok, that data wasn't *the* data, it was just the beginning. */

      unsigned int min_size_bytes = * ((unsigned int *) data);
      xfree (data);
      receive_incremental_selection (display, window, property, target_type,
				     min_size_bytes, &data, &bytes,
				     &actual_type, &actual_format,
				     &actual_size);
    }

  /* It's been read.  Now convert it to a lisp object in some semi-rational
     manner. */
  val = selection_data_to_lisp_data (d, data, bytes,
				     actual_type, actual_format);

  xfree (data);
  return val;
}

/* These functions convert from the selection data read from the server into
   something that we can use from elisp, and vice versa.

	Type:	Format:	Size:		Elisp Type:
	-----	-------	-----		-----------
	*	8	*		String
	ATOM	32	1		Symbol
	ATOM	32	> 1		Vector of Symbols
	*	16	1		Integer
	*	16	> 1		Vector of Integers
	*	32	1		if <=16 bits: Integer
					if > 16 bits: Cons of top16, bot16
	*	32	> 1		Vector of the above

   When converting a Lisp number to C, it is assumed to be of format 16 if
   it is an integer, and of format 32 if it is a cons of two integers.

   When converting a vector of numbers from Elisp to C, it is assumed to be
   of format 16 if every element in the vector is an integer, and is assumed
   to be of format 32 if any element is a cons of two integers.

   When converting an object to C, it may be of the form (SYMBOL . <data>)
   where SYMBOL is what we should claim that the type is.  Format and
   representation are as above.

   NOTE: Under Mule, when someone shoves us a string without a type, we
   set the type to 'COMPOUND_TEXT and automatically convert to Compound
   Text.  If the string has a type, we assume that the user wants the
   data sent as-is so we just do "binary" conversion.
 */


static Lisp_Object
selection_data_to_lisp_data (struct device *d,
			     unsigned char *data,
			     size_t size,
			     Atom type,
			     int format)
{
  if (type == DEVICE_XATOM_NULL (d))
    return QNULL;

  /* Convert any 8-bit data to a string, for compactness. */
  else if (format == 8)
    return make_ext_string (data, size,
			    type == DEVICE_XATOM_TEXT (d) ||
			    type == DEVICE_XATOM_COMPOUND_TEXT (d)
			    ? FORMAT_CTEXT : FORMAT_BINARY);

  /* Convert a single atom to a Lisp Symbol.
     Convert a set of atoms to a vector of symbols. */
  else if (type == XA_ATOM)
    {
      if (size == sizeof (Atom))
	return x_atom_to_symbol (d, *((Atom *) data));
      else
	{
	  int i;
	  int len = size / sizeof (Atom);
	  Lisp_Object v = Fmake_vector (make_int (len), Qzero);
	  for (i = 0; i < len; i++)
	    Faset (v, make_int (i), x_atom_to_symbol (d, ((Atom *) data) [i]));
	  return v;
	}
    }

  /* Convert a single 16 or small 32 bit number to a Lisp Int.
     If the number is > 16 bits, convert it to a cons of integers,
     16 bits in each half.
   */
  else if (format == 32 && size == sizeof (long))
    return word_to_lisp (((unsigned long *) data) [0]);
  else if (format == 16 && size == sizeof (short))
    return make_int ((int) (((unsigned short *) data) [0]));

  /* Convert any other kind of data to a vector of numbers, represented
     as above (as an integer, or a cons of two 16 bit integers).

     #### Perhaps we should return the actual type to lisp as well.

	(x-get-selection-internal 'PRIMARY 'LINE_NUMBER)
	==> [4 4]

     and perhaps it should be

	(x-get-selection-internal 'PRIMARY 'LINE_NUMBER)
	==> (SPAN . [4 4])

     Right now the fact that the return type was SPAN is discarded before
     lisp code gets to see it.
   */
  else if (format == 16)
    {
      int i;
      Lisp_Object v = make_vector (size / 4, Qzero);
      for (i = 0; i < (int) size / 4; i++)
	{
	  int j = (int) ((unsigned short *) data) [i];
	  Faset (v, make_int (i), make_int (j));
	}
      return v;
    }
  else
    {
      int i;
      Lisp_Object v = make_vector (size / 4, Qzero);
      for (i = 0; i < (int) size / 4; i++)
	{
	  unsigned long j = ((unsigned long *) data) [i];
	  Faset (v, make_int (i), word_to_lisp (j));
	}
      return v;
    }
}


static void
lisp_data_to_selection_data (struct device *d,
			     Lisp_Object obj,
			     unsigned char **data_ret,
			     Atom *type_ret,
			     unsigned int *size_ret,
			     int *format_ret)
{
  Lisp_Object type = Qnil;

  if (CONSP (obj) && SYMBOLP (XCAR (obj)))
    {
      type = XCAR (obj);
      obj = XCDR (obj);
      if (CONSP (obj) && NILP (XCDR (obj)))
	obj = XCAR (obj);
    }

  if (EQ (obj, QNULL) || (EQ (type, QNULL)))
    {				/* This is not the same as declining */
      *format_ret = 32;
      *size_ret = 0;
      *data_ret = 0;
      type = QNULL;
    }
  else if (STRINGP (obj))
    {
      CONST Extbyte *extval;
      Extcount extvallen;

      if (NILP (type))
	GET_STRING_CTEXT_DATA_ALLOCA (obj, extval, extvallen);
      else
	GET_STRING_BINARY_DATA_ALLOCA (obj, extval, extvallen);
      *format_ret = 8;
      *size_ret = extvallen;
      *data_ret = (unsigned char *) xmalloc (*size_ret);
      memcpy (*data_ret, extval, *size_ret);
#ifdef MULE
      if (NILP (type)) type = QCOMPOUND_TEXT;
#else
      if (NILP (type)) type = QSTRING;
#endif
    }
  else if (CHARP (obj))
    {
      Bufbyte buf[MAX_EMCHAR_LEN];
      Bytecount len;
      CONST Extbyte *extval;
      Extcount extvallen;

      *format_ret = 8;
      len = set_charptr_emchar (buf, XCHAR (obj));
      GET_CHARPTR_EXT_CTEXT_DATA_ALLOCA (buf, len, extval, extvallen);
      *size_ret = extvallen;
      *data_ret = (unsigned char *) xmalloc (*size_ret);
      memcpy (*data_ret, extval, *size_ret);
#ifdef MULE
      if (NILP (type)) type = QCOMPOUND_TEXT;
#else
      if (NILP (type)) type = QSTRING;
#endif
    }
  else if (SYMBOLP (obj))
    {
      *format_ret = 32;
      *size_ret = 1;
      *data_ret = (unsigned char *) xmalloc (sizeof (Atom) + 1);
      (*data_ret) [sizeof (Atom)] = 0;
      (*(Atom **) data_ret) [0] = symbol_to_x_atom (d, obj, 0);
      if (NILP (type)) type = QATOM;
    }
  else if (INTP (obj) &&
	   XINT (obj) <= 0x7FFF &&
	   XINT (obj) >= -0x8000)
    {
      *format_ret = 16;
      *size_ret = 1;
      *data_ret = (unsigned char *) xmalloc (sizeof (short) + 1);
      (*data_ret) [sizeof (short)] = 0;
      (*(short **) data_ret) [0] = (short) XINT (obj);
      if (NILP (type)) type = QINTEGER;
    }
  else if (INTP (obj) || CONSP (obj))
    {
      *format_ret = 32;
      *size_ret = 1;
      *data_ret = (unsigned char *) xmalloc (sizeof (long) + 1);
      (*data_ret) [sizeof (long)] = 0;
      (*(unsigned long **) data_ret) [0] = lisp_to_word (obj);
      if (NILP (type)) type = QINTEGER;
    }
  else if (VECTORP (obj))
    {
      /* Lisp Vectors may represent a set of ATOMs;
	 a set of 16 or 32 bit INTEGERs;
	 or a set of ATOM_PAIRs (represented as [[A1 A2] [A3 A4] ...]
       */
      int i;

      if (SYMBOLP (XVECTOR_DATA (obj) [0]))
	/* This vector is an ATOM set */
	{
	  if (NILP (type)) type = QATOM;
	  *size_ret = XVECTOR_LENGTH (obj);
	  *format_ret = 32;
	  *data_ret = (unsigned char *) xmalloc ((*size_ret) * sizeof (Atom));
	  for (i = 0; i < (int) (*size_ret); i++)
	    if (SYMBOLP (XVECTOR_DATA (obj) [i]))
	      (*(Atom **) data_ret) [i] =
		symbol_to_x_atom (d, XVECTOR_DATA (obj) [i], 0);
	    else
              signal_error (Qerror, /* Qselection_error */
                            list2 (build_string
		   ("all elements of the vector must be of the same type"),
                                   obj));
	}
#if 0 /* #### MULTIPLE doesn't work yet */
      else if (VECTORP (XVECTOR_DATA (obj) [0]))
	/* This vector is an ATOM_PAIR set */
	{
	  if (NILP (type)) type = QATOM_PAIR;
	  *size_ret = XVECTOR_LENGTH (obj);
	  *format_ret = 32;
	  *data_ret = (unsigned char *)
	    xmalloc ((*size_ret) * sizeof (Atom) * 2);
	  for (i = 0; i < *size_ret; i++)
	    if (VECTORP (XVECTOR_DATA (obj) [i]))
	      {
		Lisp_Object pair = XVECTOR_DATA (obj) [i];
		if (XVECTOR_LENGTH (pair) != 2)
		  signal_error (Qerror,
                                list2 (build_string
       ("elements of the vector must be vectors of exactly two elements"),
				  pair));

		(*(Atom **) data_ret) [i * 2] =
		  symbol_to_x_atom (d, XVECTOR_DATA (pair) [0], 0);
		(*(Atom **) data_ret) [(i * 2) + 1] =
		  symbol_to_x_atom (d, XVECTOR_DATA (pair) [1], 0);
	      }
	    else
	      signal_error (Qerror,
                            list2 (build_string
		   ("all elements of the vector must be of the same type"),
                                   obj));
	}
#endif
      else
	/* This vector is an INTEGER set, or something like it */
	{
	  *size_ret = XVECTOR_LENGTH (obj);
	  if (NILP (type)) type = QINTEGER;
	  *format_ret = 16;
	  for (i = 0; i < (int) (*size_ret); i++)
	    if (CONSP (XVECTOR_DATA (obj) [i]))
	      *format_ret = 32;
	    else if (!INTP (XVECTOR_DATA (obj) [i]))
	      signal_error (Qerror, /* Qselection_error */
                            list2 (build_string
	("all elements of the vector must be integers or conses of integers"),
                                   obj));

	  *data_ret = (unsigned char *) xmalloc (*size_ret * (*format_ret/8));
	  for (i = 0; i < (int) (*size_ret); i++)
	    if (*format_ret == 32)
	      (*((unsigned long **) data_ret)) [i] =
		lisp_to_word (XVECTOR_DATA (obj) [i]);
	    else
	      (*((unsigned short **) data_ret)) [i] =
		(unsigned short) lisp_to_word (XVECTOR_DATA (obj) [i]);
	}
    }
  else
    signal_error (Qerror, /* Qselection_error */
                  list2 (build_string ("unrecognized selection data"),
                         obj));

  *type_ret = symbol_to_x_atom (d, type, 0);
}

static Lisp_Object
clean_local_selection_data (Lisp_Object obj)
{
  if (CONSP (obj) &&
      INTP (XCAR (obj)) &&
      CONSP (XCDR (obj)) &&
      INTP (XCAR (XCDR (obj))) &&
      NILP (XCDR (XCDR (obj))))
    obj = Fcons (XCAR (obj), XCDR (obj));

  if (CONSP (obj) &&
      INTP (XCAR (obj)) &&
      INTP (XCDR (obj)))
    {
      if (XINT (XCAR (obj)) == 0)
	return XCDR (obj);
      if (XINT (XCAR (obj)) == -1)
	return make_int (- XINT (XCDR (obj)));
    }
  if (VECTORP (obj))
    {
      int i;
      int len = XVECTOR_LENGTH (obj);
      Lisp_Object copy;
      if (len == 1)
	return clean_local_selection_data (XVECTOR_DATA (obj) [0]);
      copy = make_vector (len, Qnil);
      for (i = 0; i < len; i++)
	XVECTOR_DATA (copy) [i] =
	  clean_local_selection_data (XVECTOR_DATA (obj) [i]);
      return copy;
    }
  return obj;
}


/* Called from the event loop to handle SelectionNotify events.
   I don't think this needs to be reentrant.
 */
void
x_handle_selection_notify (XSelectionEvent *event)
{
  if (! reading_selection_reply)
    message ("received an unexpected SelectionNotify event");
  else if (event->requestor != reading_selection_reply)
    message ("received a SelectionNotify event for the wrong window");
  else if (event->selection != reading_which_selection)
    message ("received the wrong selection type in SelectionNotify!");
  else
    reading_selection_reply = 0; /* we're done now. */
}


DEFUN ("x-own-selection-internal", Fx_own_selection_internal, 2, 2, 0, /*
Assert an X selection of the given TYPE with the given VALUE.
TYPE is a symbol, typically PRIMARY, SECONDARY, or CLIPBOARD.
VALUE is typically a string, or a cons of two markers, but may be
anything that the functions on selection-converter-alist know about.
*/
       (selection_name, selection_value))
{
  CHECK_SYMBOL (selection_name);
  if (NILP (selection_value)) error ("selection-value may not be nil.");
  x_own_selection (selection_name, selection_value);
  return selection_value;
}


/* Request the selection value from the owner.  If we are the owner,
   simply return our selection value.  If we are not the owner, this
   will block until all of the data has arrived.
 */
DEFUN ("x-get-selection-internal", Fx_get_selection_internal, 2, 2, 0, /*
Return text selected from some X window.
SELECTION_SYMBOL is a symbol, typically PRIMARY, SECONDARY, or CLIPBOARD.
TARGET_TYPE is the type of data desired, typically STRING or COMPOUND_TEXT.
Under Mule, if the resultant data comes back as 8-bit data in type
TEXT or COMPOUND_TEXT, it will be decoded as Compound Text.
*/
       (selection_symbol, target_type))
{
  /* This function can GC */
  Lisp_Object val = Qnil;
  struct gcpro gcpro1, gcpro2;
  GCPRO2 (target_type, val); /* we store newly consed data into these */
  CHECK_SYMBOL (selection_symbol);

#if 0 /* #### MULTIPLE doesn't work yet */
  if (CONSP (target_type) &&
      XCAR (target_type) == QMULTIPLE)
    {
      CHECK_VECTOR (XCDR (target_type));
      /* So we don't destructively modify this... */
      target_type = copy_multiple_data (target_type);
    }
  else
#endif
    CHECK_SYMBOL (target_type);

  val = x_get_local_selection (selection_symbol, target_type);

  if (NILP (val))
    {
      val = x_get_foreign_selection (selection_symbol, target_type);
    }
  else
    {
      if (CONSP (val) && SYMBOLP (XCAR (val)))
	{
	  val = XCDR (val);
	  if (CONSP (val) && NILP (XCDR (val)))
	    val = XCAR (val);
	}
      val = clean_local_selection_data (val);
    }
  UNGCPRO;
  return val;
}

DEFUN ("x-disown-selection-internal", Fx_disown_selection_internal, 1, 2, 0, /*
If we own the named selection, then disown it (make there be no selection).
*/
       (selection, timeval))
{
  struct device *d = decode_x_device (Qnil);
  Display *display = DEVICE_X_DISPLAY (d);
  Time timestamp;
  Atom selection_atom;
  XSelectionClearEvent event;

  CHECK_SYMBOL (selection);
  if (NILP (timeval))
    timestamp = DEVICE_X_MOUSE_TIMESTAMP (d);
  else
    {
      /* #### This is bogus.  See the comment above about problems
	 on OSF/1 and DEC Alphas.  Yet another reason why it sucks
	 to have the implementation (i.e. cons of two 16-bit
	 integers) exposed. */
      time_t the_time;
      lisp_to_time (timeval, &the_time);
      timestamp = (Time) the_time;
    }

  if (NILP (assq_no_quit (selection, Vselection_alist)))
    return Qnil;  /* Don't disown the selection when we're not the owner. */

  selection_atom = symbol_to_x_atom (d, selection, 0);

  XSetSelectionOwner (display, selection_atom, None, timestamp);

  /* It doesn't seem to be guaranteed that a SelectionClear event will be
     generated for a window which owns the selection when that window sets
     the selection owner to None.  The NCD server does, the MIT Sun4 server
     doesn't.  So we synthesize one; this means we might get two, but
     that's ok, because the second one won't have any effect.
   */
  event.display = display;
  event.selection = selection_atom;
  event.time = timestamp;
  x_handle_selection_clear (&event);

  return Qt;
}


DEFUN ("x-selection-owner-p", Fx_selection_owner_p, 0, 1, 0, /*
Return t if current emacs process owns the given X Selection.
The arg should be the name of the selection in question, typically one of
the symbols PRIMARY, SECONDARY, or CLIPBOARD.  (For convenience, the symbol
nil is the same as PRIMARY, and t is the same as SECONDARY.)
*/
       (selection))
{
  CHECK_SYMBOL (selection);
  if      (EQ (selection, Qnil)) selection = QPRIMARY;
  else if (EQ (selection, Qt))   selection = QSECONDARY;

  return NILP (Fassq (selection, Vselection_alist)) ? Qnil : Qt;
}

DEFUN ("x-selection-exists-p", Fx_selection_exists_p, 0, 1, 0, /*
Whether there is an owner for the given X Selection.
The arg should be the name of the selection in question, typically one of
the symbols PRIMARY, SECONDARY, or CLIPBOARD.  (For convenience, the symbol
nil is the same as PRIMARY, and t is the same as SECONDARY.)
*/
       (selection))
{
  struct device *d = decode_x_device (Qnil);
  Display *dpy = DEVICE_X_DISPLAY (d);
  CHECK_SYMBOL (selection);
  if (!NILP (Fx_selection_owner_p (selection)))
    return Qt;
  return XGetSelectionOwner (dpy, symbol_to_x_atom (d, selection, 0)) != None ?
    Qt : Qnil;
}


#ifdef CUT_BUFFER_SUPPORT

static int cut_buffers_initialized; /* Whether we're sure they all exist */

/* Ensure that all 8 cut buffers exist.  ICCCM says we gotta... */
static void
initialize_cut_buffers (Display *display, Window window)
{
  static unsigned CONST char * CONST data = (unsigned CONST char *) "";
#define FROB(atom) XChangeProperty (display, window, atom, XA_STRING, 8, \
				    PropModeAppend, data, 0)
  FROB (XA_CUT_BUFFER0);
  FROB (XA_CUT_BUFFER1);
  FROB (XA_CUT_BUFFER2);
  FROB (XA_CUT_BUFFER3);
  FROB (XA_CUT_BUFFER4);
  FROB (XA_CUT_BUFFER5);
  FROB (XA_CUT_BUFFER6);
  FROB (XA_CUT_BUFFER7);
#undef FROB
  cut_buffers_initialized = 1;
}

#define CHECK_CUTBUFFER(symbol)						\
  { CHECK_SYMBOL (symbol);						\
    if (!EQ((symbol),QCUT_BUFFER0) && !EQ((symbol),QCUT_BUFFER1) &&	\
	!EQ((symbol),QCUT_BUFFER2) && !EQ((symbol),QCUT_BUFFER3) &&	\
	!EQ((symbol),QCUT_BUFFER4) && !EQ((symbol),QCUT_BUFFER5) &&	\
	!EQ((symbol),QCUT_BUFFER6) && !EQ((symbol),QCUT_BUFFER7))	\
      signal_error (Qerror, list2 (build_string ("Doesn't name a cutbuffer"), \
                                   (symbol))); \
  }

DEFUN ("x-get-cutbuffer-internal", Fx_get_cutbuffer_internal, 1, 1, 0, /*
Return the value of the named CUTBUFFER (typically CUT_BUFFER0).
*/
       (cutbuffer))
{
  struct device *d = decode_x_device (Qnil);
  Display *display = DEVICE_X_DISPLAY (d);
  Window window = RootWindow (display, 0); /* Cutbuffers are on frame 0 */
  Atom cut_buffer_atom;
  unsigned char *data;
  int bytes;
  Atom type;
  int format;
  unsigned long size;
  Lisp_Object ret;

  CHECK_CUTBUFFER (cutbuffer);
  cut_buffer_atom = symbol_to_x_atom (d, cutbuffer, 0);

  x_get_window_property (display, window, cut_buffer_atom, &data, &bytes,
			 &type, &format, &size, 0);
  if (!data) return Qnil;

  if (format != 8 || type != XA_STRING)
    signal_simple_error_2 ("Cut buffer doesn't contain 8-bit STRING data",
			   x_atom_to_symbol (d, type),
			   make_int (format));

  /* We cheat - if the string contains an ESC character, that's
     technically not allowed in a STRING, so we assume it's
     COMPOUND_TEXT that we stored there ourselves earlier,
     in x-store-cutbuffer-internal  */
  ret = (bytes ?
	 make_ext_string (data, bytes,
			  memchr (data, 0x1b, bytes) ?
			  FORMAT_CTEXT : FORMAT_BINARY)
	 : Qnil);
  xfree (data);
  return ret;
}


DEFUN ("x-store-cutbuffer-internal", Fx_store_cutbuffer_internal, 2, 2, 0, /*
Set the value of the named CUTBUFFER (typically CUT_BUFFER0) to STRING.
*/
       (cutbuffer, string))
{
  struct device *d = decode_x_device (Qnil);
  Display *display = DEVICE_X_DISPLAY (d);
  Window window = RootWindow (display, 0); /* Cutbuffers are on frame 0 */
  Atom cut_buffer_atom;
  CONST Extbyte *data  = XSTRING_DATA (string);
  Extcount bytes = XSTRING_LENGTH (string);
  Extcount bytes_remaining;
  int max_bytes = SELECTION_QUANTUM (display);
#ifdef MULE
  CONST Bufbyte *ptr, *end;
  enum { ASCII, LATIN_1, WORLD } chartypes = ASCII;
#endif

  if (max_bytes > MAX_SELECTION_QUANTUM)
    max_bytes = MAX_SELECTION_QUANTUM;

  CHECK_CUTBUFFER (cutbuffer);
  CHECK_STRING (string);
  cut_buffer_atom = symbol_to_x_atom (d, cutbuffer, 0);

  if (! cut_buffers_initialized)
    initialize_cut_buffers (display, window);

  /* We use the STRING encoding (Latin-1 only) if we can, else COMPOUND_TEXT.
     We cheat and use type = `STRING' even when using COMPOUND_TEXT.
     The ICCCM requires that this be so, and other clients assume it,
     as we do ourselves in initialize_cut_buffers.  */

#ifdef MULE
  /* Optimize for the common ASCII case */
  for (ptr = data, end = ptr + bytes; ptr <= end; )
    {
      if (BYTE_ASCII_P (*ptr))
	{
	  ptr++;
	  continue;
	}

      if ((*ptr) == LEADING_BYTE_LATIN_ISO8859_1 ||
	  (*ptr) == LEADING_BYTE_CONTROL_1)
	{
	  chartypes = LATIN_1;
	  ptr += 2;
	  continue;
	}

      chartypes = WORLD;
      break;
    }

  if (chartypes == LATIN_1)
    GET_STRING_BINARY_DATA_ALLOCA (string, data, bytes);
  else if (chartypes == WORLD)
    GET_STRING_CTEXT_DATA_ALLOCA  (string, data, bytes);
#endif /* MULE */

  bytes_remaining = bytes;

  while (bytes_remaining)
    {
      int chunk = bytes_remaining < max_bytes ? bytes_remaining : max_bytes;
      XChangeProperty (display, window, cut_buffer_atom, XA_STRING, 8,
		       (bytes_remaining == bytes
			? PropModeReplace : PropModeAppend),
		       data, chunk);
      data += chunk;
      bytes_remaining -= chunk;
    }
  return string;
}


DEFUN ("x-rotate-cutbuffers-internal", Fx_rotate_cutbuffers_internal, 1, 1, 0, /*
Rotate the values of the cutbuffers by the given number of steps;
positive means move values forward, negative means backward.
*/
       (n))
{
  struct device *d = decode_x_device (Qnil);
  Display *display = DEVICE_X_DISPLAY (d);
  Window window = RootWindow (display, 0); /* Cutbuffers are on frame 0 */
  Atom props [8];

  CHECK_INT (n);
  if (XINT (n) == 0)
    return n;
  if (! cut_buffers_initialized)
    initialize_cut_buffers (display, window);
  props[0] = XA_CUT_BUFFER0;
  props[1] = XA_CUT_BUFFER1;
  props[2] = XA_CUT_BUFFER2;
  props[3] = XA_CUT_BUFFER3;
  props[4] = XA_CUT_BUFFER4;
  props[5] = XA_CUT_BUFFER5;
  props[6] = XA_CUT_BUFFER6;
  props[7] = XA_CUT_BUFFER7;
  XRotateWindowProperties (display, window, props, 8, XINT (n));
  return n;
}

#endif /* CUT_BUFFER_SUPPORT */



/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_xselect (void)
{
  DEFSUBR (Fx_get_selection_internal);
  DEFSUBR (Fx_own_selection_internal);
  DEFSUBR (Fx_disown_selection_internal);
  DEFSUBR (Fx_selection_owner_p);
  DEFSUBR (Fx_selection_exists_p);

#ifdef CUT_BUFFER_SUPPORT
  DEFSUBR (Fx_get_cutbuffer_internal);
  DEFSUBR (Fx_store_cutbuffer_internal);
  DEFSUBR (Fx_rotate_cutbuffers_internal);
#endif /* CUT_BUFFER_SUPPORT */

  /* Unfortunately, timeout handlers must be lisp functions. */
  defsymbol (&Qx_selection_reply_timeout_internal,
             "x-selection-reply-timeout-internal");
  DEFSUBR (Fx_selection_reply_timeout_internal);

  defsymbol (&QPRIMARY, "PRIMARY");
  defsymbol (&QSECONDARY, "SECONDARY");
  defsymbol (&QSTRING, "STRING");
  defsymbol (&QINTEGER, "INTEGER");
  defsymbol (&QCLIPBOARD, "CLIPBOARD");
  defsymbol (&QTIMESTAMP, "TIMESTAMP");
  defsymbol (&QTEXT, "TEXT");
  defsymbol (&QDELETE, "DELETE");
  defsymbol (&QMULTIPLE, "MULTIPLE");
  defsymbol (&QINCR, "INCR");
  defsymbol (&QEMACS_TMP, "_EMACS_TMP_");
  defsymbol (&QTARGETS, "TARGETS");
  defsymbol (&QATOM, "ATOM");
  defsymbol (&QATOM_PAIR, "ATOM_PAIR");
  defsymbol (&QCOMPOUND_TEXT, "COMPOUND_TEXT");
  defsymbol (&QNULL, "NULL");

#ifdef CUT_BUFFER_SUPPORT
  defsymbol (&QCUT_BUFFER0, "CUT_BUFFER0");
  defsymbol (&QCUT_BUFFER1, "CUT_BUFFER1");
  defsymbol (&QCUT_BUFFER2, "CUT_BUFFER2");
  defsymbol (&QCUT_BUFFER3, "CUT_BUFFER3");
  defsymbol (&QCUT_BUFFER4, "CUT_BUFFER4");
  defsymbol (&QCUT_BUFFER5, "CUT_BUFFER5");
  defsymbol (&QCUT_BUFFER6, "CUT_BUFFER6");
  defsymbol (&QCUT_BUFFER7, "CUT_BUFFER7");
#endif /* CUT_BUFFER_SUPPORT */

  deferror (&Qselection_conversion_error,
	    "selection-conversion-error",
	    "selection-conversion error", Qio_error);
}

void
vars_of_xselect (void)
{
#ifdef CUT_BUFFER_SUPPORT
  cut_buffers_initialized = 0;
  Fprovide (intern ("cut-buffer"));
#endif

  reading_selection_reply = 0;
  reading_which_selection = 0;
  selection_reply_timed_out = 0;
  for_whom_the_bell_tolls = 0;
  prop_location_tick = 0;

  Vselection_alist = Qnil;
  staticpro (&Vselection_alist);

  DEFVAR_LISP ("selection-converter-alist", &Vselection_converter_alist /*
An alist associating selection-types (such as STRING and TIMESTAMP) with
functions.  These functions will be called with three args: the name of the
selection (typically PRIMARY, SECONDARY, or CLIPBOARD); a desired type to
which the selection should be converted; and the local selection value
 (whatever had been passed to `x-own-selection').  These functions should
return the value to send to the X server, which should be one of:

-- nil (the conversion could not be done)
-- a cons of a symbol and any of the following values; the symbol
   explicitly specifies the type that will be sent.
-- a string (If the type is not specified, then if Mule support exists,
             the string will be converted to Compound Text and sent in
             the 'COMPOUND_TEXT format; otherwise (no Mule support),
             the string will be left as-is and sent in the 'STRING
             format.  If the type is specified, the string will be
             left as-is (or converted to binary format under Mule).
             In all cases, 8-bit data it sent.)
-- a character (With Mule support, will be converted to Compound Text
                whether or not a type is specified.  If a type is not
                specified, a type of 'STRING or 'COMPOUND_TEXT will be
		sent, as for strings.)
-- the symbol 'NULL (Indicates that there is no meaningful return value.
                     Empty 32-bit data with a type of 'NULL will be sent.)
-- a symbol (Will be converted into an atom.  If the type is not specified,
             a type of 'ATOM will be sent.)
-- an integer (Will be converted into a 16-bit or 32-bit integer depending
               on the value.  If the type is not specified, a type of
	       'INTEGER will be sent.)
-- a cons (HIGH . LOW) of integers (Will be converted into a 32-bit integer.
                                    If the type is not specified, a type of
				    'INTEGER will be sent.)
-- a vector of symbols (Will be converted into a list of atoms.  If the type
                        is not specified, a type of 'ATOM will be sent.)
-- a vector of integers (Will be converted into a list of 16-bit integers.
                         If the type is not specified, a type of 'INTEGER
			 will be sent.)
-- a vector of integers and/or conses (HIGH . LOW) of integers
                        (Will be converted into a list of 16-bit integers.
                         If the type is not specified, a type of 'INTEGER
			 will be sent.)
*/ );
  Vselection_converter_alist = Qnil;

  DEFVAR_LISP ("x-lost-selection-hooks", &Vx_lost_selection_hooks /*
A function or functions to be called after the X server has notified us
that we have lost the selection.  The function(s) will be called with one
argument, a symbol naming the selection (typically PRIMARY, SECONDARY, or
CLIPBOARD).
*/ );
  Vx_lost_selection_hooks = Qunbound;

  DEFVAR_LISP ("x-sent-selection-hooks", &Vx_sent_selection_hooks /*
A function or functions to be called after we have responded to some
other client's request for the value of a selection that we own.  The
function(s) will be called with four arguments:
  - the name of the selection (typically PRIMARY, SECONDARY, or CLIPBOARD);
  - the name of the selection-type which we were requested to convert the
    selection into before sending (for example, STRING or LENGTH);
  - and whether we successfully transmitted the selection.
We might have failed (and declined the request) for any number of reasons,
including being asked for a selection that we no longer own, or being asked
to convert into a type that we don't know about or that is inappropriate.
This hook doesn't let you change the behavior of emacs's selection replies,
it merely informs you that they have happened.
*/ );
  Vx_sent_selection_hooks = Qunbound;

  DEFVAR_INT ("x-selection-timeout", &x_selection_timeout /*
If the selection owner doesn't reply in this many seconds, we give up.
A value of 0 means wait as long as necessary.  This is initialized from the
\"*selectionTimeout\" resource (which is expressed in milliseconds).
*/ );
  x_selection_timeout = 0;
}

void
Xatoms_of_xselect (struct device *d)
{
  Display *D = DEVICE_X_DISPLAY (d);

  /* Non-predefined atoms that we might end up using a lot */
  DEVICE_XATOM_CLIPBOARD     (d) = XInternAtom (D, "CLIPBOARD",     False);
  DEVICE_XATOM_TIMESTAMP     (d) = XInternAtom (D, "TIMESTAMP",     False);
  DEVICE_XATOM_TEXT          (d) = XInternAtom (D, "TEXT",          False);
  DEVICE_XATOM_DELETE        (d) = XInternAtom (D, "DELETE",        False);
  DEVICE_XATOM_MULTIPLE      (d) = XInternAtom (D, "MULTIPLE",      False);
  DEVICE_XATOM_INCR          (d) = XInternAtom (D, "INCR",          False);
  DEVICE_XATOM_TARGETS       (d) = XInternAtom (D, "TARGETS",       False);
  DEVICE_XATOM_NULL          (d) = XInternAtom (D, "NULL",          False);
  DEVICE_XATOM_ATOM_PAIR     (d) = XInternAtom (D, "ATOM_PAIR",     False);
  DEVICE_XATOM_COMPOUND_TEXT (d) = XInternAtom (D, "COMPOUND_TEXT", False);
  DEVICE_XATOM_EMACS_TMP     (d) = XInternAtom (D, "_EMACS_TMP_",   False);
}
