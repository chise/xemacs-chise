/* The lwlib interface to "xlwmenu" menus.
   Copyright (C) 1992, 1994 Lucid, Inc.

This file is part of the Lucid Widget Library.

The Lucid Widget Library is free software; you can redistribute it and/or 
modify it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

The Lucid Widget Library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

#include <config.h>
#include <stdlib.h> /* for abort () */
#include <limits.h>

#include "lwlib-Xlw.h"
#include <X11/StringDefs.h>
#include <X11/IntrinsicP.h>
#include <X11/ObjectP.h>
#include <X11/CompositeP.h>
#include <X11/Shell.h>
#ifdef LWLIB_MENUBARS_LUCID
#include "xlwmenu.h"
#endif
#ifdef LWLIB_SCROLLBARS_LUCID
#include "xlwscrollbar.h"
#endif



#ifdef LWLIB_MENUBARS_LUCID

/* Menu callbacks */

static void
pre_hook (Widget w, XtPointer client_data, XtPointer call_data)
{
  widget_instance* instance = (widget_instance*)client_data;
  widget_value* val;
  
  if (w->core.being_destroyed)
    return;

  val = lw_get_widget_value_for_widget (instance, w);
#if 0
  /* #### - this code used to (for some random back_asswards reason) pass
  the expression below in the call_data slot.  For incremental menu
  construction, this needs to go.  I can't even figure out why it was done
  this way in the first place...it's just a historical weirdism. --Stig */
  call_data = (val ? val->call_data : NULL);
#endif 
  if (val && val->call_data)
    abort();			/* #### - the call_data for the top_level
				   "menubar" widget_value used to be passed
				   back to the pre_hook. */

  if (instance->info->pre_activate_cb)
    instance->info->pre_activate_cb (w, instance->info->id, call_data);
}

static void
pick_hook (Widget w, XtPointer client_data, XtPointer call_data)
{
  widget_instance* instance = (widget_instance*)client_data;
  widget_value* contents_val = (widget_value*)call_data;
  widget_value* widget_val;
  XtPointer widget_arg;
  LWLIB_ID id;
  lw_callback post_activate_cb;

  if (w->core.being_destroyed)
    return;

  /* Grab these values before running any functions, in case running
     the selection_cb causes the widget to be destroyed. */
  id = instance->info->id;
  post_activate_cb = instance->info->post_activate_cb;

  widget_val = lw_get_widget_value_for_widget (instance, w);
  widget_arg = widget_val ? widget_val->call_data : NULL;

  if (instance->info->selection_cb &&
      contents_val &&
      contents_val->enabled &&
      !contents_val->contents)
    instance->info->selection_cb (w, id, contents_val->call_data);

  if (post_activate_cb)
    post_activate_cb (w, id, widget_arg);
}



/* creation functions */
static Widget
xlw_create_menubar (widget_instance* instance)
{
  Arg al [1];
  Widget widget;
  
  XtSetArg (al [0], XtNmenu, instance->info->val);
  widget = XtCreateWidget (instance->info->name, xlwMenuWidgetClass,
			   instance->parent, al, 1);
  XtAddCallback (widget, XtNopen,   pre_hook,  (XtPointer)instance);
  XtAddCallback (widget, XtNselect, pick_hook, (XtPointer)instance);
  return widget;
}

static Widget
xlw_create_popup_menu (widget_instance* instance)
{
  Arg al [2];
  Widget popup_shell, widget;
  
  popup_shell = XtCreatePopupShell (instance->info->name,
				    overrideShellWidgetClass,
				    instance->parent, NULL, 0);
  XtSetArg (al [0], XtNmenu, instance->info->val);
  XtSetArg (al [1], XtNhorizontal, False);
  widget = XtCreateManagedWidget ("popup", xlwMenuWidgetClass,
				  popup_shell, al, 2);
  XtAddCallback (widget, XtNselect, pick_hook, (XtPointer)instance);

  return popup_shell;
}
#endif /* LWLIB_MENUBARS_LUCID */

#ifdef LWLIB_SCROLLBARS_LUCID
static void
xlw_scrollbar_callback (Widget widget, XtPointer closure, XtPointer call_data)
{
  widget_instance *instance = (widget_instance *) closure;
  LWLIB_ID id;
  XlwScrollBarCallbackStruct *data =
    (XlwScrollBarCallbackStruct *) call_data;
  scroll_event event_data;
  scrollbar_values *val =
    (scrollbar_values *) instance->info->val->scrollbar_data;
  double percent;

  if (!instance || widget->core.being_destroyed)
    return;

  id = instance->info->id;

  percent = (double) (data->value - 1) / (double) (INT_MAX - 1);
  event_data.slider_value =
    (int) (percent * (double) (val->maximum - val->minimum)) + val->minimum;

  if (event_data.slider_value > val->maximum - val->slider_size)
      event_data.slider_value = val->maximum - val->slider_size;
  else if (event_data.slider_value < val->minimum)
           event_data.slider_value = val->minimum;

  if (data->event)
    {
      switch (data->event->type)
	{
	case KeyPress:
	case KeyRelease:
	  event_data.time = data->event->xkey.time;
	  break;
	case ButtonPress:
	case ButtonRelease:
	  event_data.time = data->event->xbutton.time;
	  break;
	case MotionNotify:
	  event_data.time = data->event->xmotion.time;
	  break;
	case EnterNotify:
	case LeaveNotify:
	  event_data.time = data->event->xcrossing.time;
	  break;
	default:
	  event_data.time = 0;
	  break;
	}
    }
  else
    event_data.time = 0;

  switch (data->reason)
    {
    case XmCR_DECREMENT:	event_data.action = SCROLLBAR_LINE_UP;   break;
    case XmCR_INCREMENT:	event_data.action = SCROLLBAR_LINE_DOWN; break;
    case XmCR_PAGE_DECREMENT:	event_data.action = SCROLLBAR_PAGE_UP;   break;
    case XmCR_PAGE_INCREMENT:	event_data.action = SCROLLBAR_PAGE_DOWN; break;
    case XmCR_TO_TOP:		event_data.action = SCROLLBAR_TOP;       break;
    case XmCR_TO_BOTTOM:	event_data.action = SCROLLBAR_BOTTOM;    break;
    case XmCR_DRAG:		event_data.action = SCROLLBAR_DRAG;      break;
    case XmCR_VALUE_CHANGED:	event_data.action = SCROLLBAR_CHANGE;    break;
    default:			event_data.action = SCROLLBAR_CHANGE;    break;
    }

  if (instance->info->pre_activate_cb)
    instance->info->pre_activate_cb (widget, id, (XtPointer) &event_data);
}

#define add_scrollbar_callback(resource) \
XtAddCallback (scrollbar, resource, xlw_scrollbar_callback, (XtPointer) instance)

/* #### Does not yet support horizontal scrollbars. */
static Widget
xlw_create_scrollbar (widget_instance *instance, int vertical)
{
  Arg al[20];
  int ac = 0;
  static XtCallbackRec callbacks[2] =
  { {xlw_scrollbar_callback, NULL}, {NULL, NULL} };

  callbacks[0].closure  = (XtPointer) instance;

  XtSetArg (al[ac], XmNminimum,       1); ac++;
  XtSetArg (al[ac], XmNmaximum, INT_MAX); ac++;
  XtSetArg (al[ac], XmNincrement,     1); ac++;
  XtSetArg (al[ac], XmNpageIncrement, 1); ac++;
  XtSetArg (al[ac], XmNorientation, (vertical ? XmVERTICAL : XmHORIZONTAL)); ac++;

  XtSetArg (al[ac], XmNdecrementCallback,	callbacks); ac++;
  XtSetArg (al[ac], XmNdragCallback,		callbacks); ac++;
  XtSetArg (al[ac], XmNincrementCallback,	callbacks); ac++;
  XtSetArg (al[ac], XmNpageDecrementCallback,	callbacks); ac++;
  XtSetArg (al[ac], XmNpageIncrementCallback,	callbacks); ac++;
  XtSetArg (al[ac], XmNtoBottomCallback,	callbacks); ac++;
  XtSetArg (al[ac], XmNtoTopCallback,		callbacks); ac++;
  XtSetArg (al[ac], XmNvalueChangedCallback,	callbacks); ac++;

  return XtCreateWidget (instance->info->name, xlwScrollBarWidgetClass,
			 instance->parent, al, ac);
}

static Widget
xlw_create_vertical_scrollbar (widget_instance *instance)
{
  return xlw_create_scrollbar (instance, 1);
}

static Widget
xlw_create_horizontal_scrollbar (widget_instance *instance)
{
  return xlw_create_scrollbar (instance, 0);
}

static void
xlw_update_scrollbar (widget_instance *instance, Widget widget,
		      widget_value *val)
{
  if (val->scrollbar_data)
    {
      scrollbar_values *data = val->scrollbar_data;
      int widget_sliderSize, widget_val;
      int new_sliderSize, new_value;
      double percent;
      Arg al [4];

      /* First size and position the scrollbar widget. */
      XtSetArg (al [0], XtNx,      data->scrollbar_x);
      XtSetArg (al [1], XtNy,      data->scrollbar_y);
      XtSetArg (al [2], XtNwidth,  data->scrollbar_width);
      XtSetArg (al [3], XtNheight, data->scrollbar_height);
      XtSetValues (widget, al, 4);

      /* Now size the scrollbar's slider. */
      XtSetArg (al [0], XmNsliderSize, &widget_sliderSize);
      XtSetArg (al [1], XmNvalue,      &widget_val);
      XtGetValues (widget, al, 2);

      percent = (double) data->slider_size /
	(double) (data->maximum - data->minimum);
      percent = (percent > 1.0 ? 1.0 : percent);
      new_sliderSize = (int) ((double) (INT_MAX - 1) * percent);

      percent = (double) (data->slider_position - data->minimum) /
	(double) (data->maximum - data->minimum);
      percent = (percent > 1.0 ? 1.0 : percent);
      new_value = (int) ((double) (INT_MAX - 1) * percent);

      if (new_sliderSize > INT_MAX - 1)
	new_sliderSize = INT_MAX - 1;
      else if (new_sliderSize < 1)
	new_sliderSize = 1;

      if (new_value > (INT_MAX - new_sliderSize))
	new_value = INT_MAX - new_sliderSize;
      else if (new_value < 1)
	new_value = 1;

      if (new_sliderSize != widget_sliderSize || new_value != widget_val)
	XlwScrollBarSetValues (widget, new_value, new_sliderSize, 1, 1, False);
    }
}

#endif /* LWLIB_SCROLLBARS_LUCID */

widget_creation_entry 
xlw_creation_table [] =
{
#ifdef LWLIB_MENUBARS_LUCID
  {"menubar", xlw_create_menubar},
  {"popup", xlw_create_popup_menu},
#endif
#ifdef LWLIB_SCROLLBARS_LUCID
  {"vertical-scrollbar",	xlw_create_vertical_scrollbar},
  {"horizontal-scrollbar",	xlw_create_horizontal_scrollbar},
#endif
  {NULL, NULL}
};

Boolean
lw_lucid_widget_p (Widget widget)
{
  WidgetClass the_class = XtClass (widget);
#ifdef LWLIB_MENUBARS_LUCID
  if (the_class == xlwMenuWidgetClass)
    return True;
#endif
#ifdef LWLIB_SCROLLBARS_LUCID
  if (the_class == xlwScrollBarWidgetClass)
    return True;
#endif
#ifdef LWLIB_MENUBARS_LUCID
  if (the_class == overrideShellWidgetClass)
    return
      XtClass (((CompositeWidget)widget)->composite.children [0])
	== xlwMenuWidgetClass;
#endif
  return False;
}

void
xlw_update_one_widget (widget_instance* instance, Widget widget,
		       widget_value* val, Boolean deep_p)
{
  WidgetClass class;

  class = XtClass (widget);

  if (0)
    ;
#ifdef LWLIB_MENUBARS_LUCID
  else if (class == xlwMenuWidgetClass)
    {
      XlwMenuWidget mw;
      Arg al [1];
      if (XtIsShell (widget))
	mw = (XlwMenuWidget)((CompositeWidget)widget)->composite.children [0];
      else
	mw = (XlwMenuWidget)widget;
      XtSetArg (al [0], XtNmenu, val);
      XtSetValues (widget, al, 1);
    }
#endif
#ifdef LWLIB_SCROLLBARS_LUCID
  else if (class == xlwScrollBarWidgetClass)
    {
      xlw_update_scrollbar (instance, widget, val);
    }
#endif
}

void
xlw_update_one_value (widget_instance* instance, Widget widget,
		      widget_value* val)
{
  return;
}

void
xlw_pop_instance (widget_instance* instance, Boolean up)
{
}

#ifdef LWLIB_MENUBARS_LUCID
void
xlw_popup_menu (Widget widget, XEvent *event)
{
  XlwMenuWidget mw;

  if (!XtIsShell (widget))
    return;

  if (event->type == ButtonPress || event->type == ButtonRelease)
    {
      mw = (XlwMenuWidget)((CompositeWidget)widget)->composite.children [0];
      xlw_pop_up_menu (mw, (XButtonPressedEvent *)event);
    }
  else
    abort ();
}
#endif /* LWLIB_MENUBARS_LUCID */

/* Destruction of instances */
void
xlw_destroy_instance (widget_instance* instance)
{
  if (instance->widget)
    XtDestroyWidget (instance->widget);
}
