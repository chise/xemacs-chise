/* gtk-xemacs.c
**
** Description: A widget to encapsulate a XEmacs 'text widget'
**
** Created by: William M. Perry
** Copyright (c) 2000 William M. Perry <wmperry@gnu.org>
**
*/

#include <config.h>

#include "lisp.h"
#include "console-gtk.h"
#include "objects-gtk.h"
#include "gtk-xemacs.h"
#include "window.h"
#include "faces.h"

extern Lisp_Object Vmodeline_face;
extern Lisp_Object Vscrollbar_on_left_p;

EXFUN (Fmake_image_instance, 4);

static void gtk_xemacs_class_init	(GtkXEmacsClass *klass);
static void gtk_xemacs_init		(GtkXEmacs *xemacs);
static void gtk_xemacs_size_allocate	(GtkWidget *widget, GtkAllocation *allocaction);
static void gtk_xemacs_draw		(GtkWidget *widget, GdkRectangle *area);
static void gtk_xemacs_paint		(GtkWidget *widget, GdkRectangle *area);
static void gtk_xemacs_size_request	(GtkWidget *widget, GtkRequisition *requisition);
static void gtk_xemacs_realize		(GtkWidget *widget);
static void gtk_xemacs_style_set        (GtkWidget *widget, GtkStyle *previous_style);
static gint gtk_xemacs_expose		(GtkWidget *widget, GdkEventExpose *event);

guint
gtk_xemacs_get_type (void)
{
  static guint xemacs_type = 0;

  if (!xemacs_type)
    {
      static const GtkTypeInfo xemacs_info =
      {
	"GtkXEmacs",
	sizeof (GtkXEmacs),
	sizeof (GtkXEmacsClass),
	(GtkClassInitFunc) gtk_xemacs_class_init,
	(GtkObjectInitFunc) gtk_xemacs_init,
	/* reserved_1 */ NULL,
        /* reserved_2 */ NULL,
        (GtkClassInitFunc) NULL,
      };

      xemacs_type = gtk_type_unique (gtk_fixed_get_type (), &xemacs_info);
    }

  return xemacs_type;
}

static GtkWidgetClass *parent_class;

extern gint emacs_gtk_button_event_handler(GtkWidget *widget, GdkEventButton *event);
extern gint emacs_gtk_key_event_handler(GtkWidget *widget, GdkEventKey *event);
extern gint emacs_gtk_motion_event_handler(GtkWidget *widget, GdkEventMotion *event);

static void
gtk_xemacs_class_init (GtkXEmacsClass *class)
{
  GtkWidgetClass *widget_class;

  widget_class = (GtkWidgetClass*) class;
  parent_class = (GtkWidgetClass *) gtk_type_class (gtk_fixed_get_type ());

  widget_class->size_allocate = gtk_xemacs_size_allocate;
  widget_class->size_request = gtk_xemacs_size_request;
  widget_class->draw = gtk_xemacs_draw;
  widget_class->expose_event = gtk_xemacs_expose;
  widget_class->realize = gtk_xemacs_realize;
  widget_class->button_press_event = emacs_gtk_button_event_handler;
  widget_class->button_release_event = emacs_gtk_button_event_handler;
  widget_class->key_press_event = emacs_gtk_key_event_handler;
  widget_class->key_release_event = emacs_gtk_key_event_handler;
  widget_class->motion_notify_event = emacs_gtk_motion_event_handler;
  widget_class->style_set = gtk_xemacs_style_set;
}

static void
gtk_xemacs_init (GtkXEmacs *xemacs)
{
    GTK_WIDGET_SET_FLAGS (xemacs, GTK_CAN_FOCUS);
}

GtkWidget*
gtk_xemacs_new (struct frame *f)
{
  GtkXEmacs *xemacs;

  xemacs = gtk_type_new (gtk_xemacs_get_type ());
  xemacs->f = f;

  return GTK_WIDGET (xemacs);
}

static void
__nuke_background_items (GtkWidget *widget)
{
  /* This bit of voodoo is here to get around the annoying flicker
     when GDK tries to futz with our background pixmap as well as
     XEmacs doing it

     We do NOT set the background of this widget window, that way
     there is NO flickering, etc.  The downside is the XEmacs frame
     appears as 'seethru' when XEmacs is too busy to redraw the
     frame.

     Well, wait, we do... otherwise there sre weird 'seethru' areas
     even when XEmacs does a full redisplay.  Most noticable in some
     areas of the modeline, or in the right-hand-side of the window
     between the scrollbar ad n the edge of the window.
  */
  if (widget->window)
    {
      gdk_window_set_back_pixmap (widget->window, NULL, 0);
      gdk_window_set_back_pixmap (widget->parent->window, NULL, 0);
      gdk_window_set_background (widget->parent->window,
				 &widget->style->bg[GTK_STATE_NORMAL]);
      gdk_window_set_background (widget->window,
				 &widget->style->bg[GTK_STATE_NORMAL]);
    }
}

extern Lisp_Object xemacs_gtk_convert_color(GdkColor *c, GtkWidget *w);

/* From objects-gtk.c */
extern Lisp_Object __get_gtk_font_truename (GdkFont *gdk_font, int expandp);

#define convert_font(f) __get_gtk_font_truename (f, 0)

static void
smash_face_fallbacks (struct frame *f, GtkStyle *style)
{
#define FROB(face,prop,slot) do { 							\
				Lisp_Object fallback = Qnil;				\
				Lisp_Object specifier = Fget (face, prop, Qnil);	\
   				struct Lisp_Specifier *sp = NULL;			\
 				if (NILP (specifier)) continue;				\
 				sp = XSPECIFIER (specifier);				\
 				fallback = sp->fallback;				\
 				if (EQ (Fcar (Fcar (Fcar (fallback))), Qgtk))		\
 					fallback = XCDR (fallback);			\
 				if (! NILP (slot))					\
 					fallback = acons (list1 (Qgtk),			\
 								  slot,			\
 								  fallback);		\
 				set_specifier_fallback (specifier, fallback);		\
			     } while (0);
#define FROB_FACE(face,fg_slot,bg_slot) \
do {											\
	FROB (face, Qforeground, xemacs_gtk_convert_color (&style->fg_slot[GTK_STATE_NORMAL], FRAME_GTK_SHELL_WIDGET (f)));	\
	FROB (face, Qbackground, xemacs_gtk_convert_color (&style->bg_slot[GTK_STATE_NORMAL], FRAME_GTK_SHELL_WIDGET (f)));	\
	if (style->rc_style && style->rc_style->bg_pixmap_name[GTK_STATE_NORMAL])	\
	{										\
		FROB (Vdefault_face, Qbackground_pixmap,				\
			Fmake_image_instance (build_string (style->rc_style->bg_pixmap_name[GTK_STATE_NORMAL]), \
					  f->device, Qnil, make_int (5)));			\
	}										\
	else										\
	{										\
		FROB (Vdefault_face, Qbackground_pixmap, Qnil);				\
	}										\
} while (0)

  FROB (Vdefault_face, Qfont, convert_font (style->font));
  FROB_FACE (Vdefault_face, fg, bg);
  FROB_FACE (Vgui_element_face, text, mid);

#undef FROB
#undef FROB_FACE
}

#ifdef HAVE_SCROLLBARS
static void
smash_scrollbar_specifiers (struct frame *f, GtkStyle *style)
{
  Lisp_Object frame;
  int slider_size = 0;
  int hsize, vsize;
  GtkRangeClass *klass;

  XSETFRAME (frame, f);

  klass = (GtkRangeClass *) gtk_type_class (GTK_TYPE_SCROLLBAR);
  slider_size = klass->slider_width;
  hsize = slider_size + (style->klass->ythickness * 2);
  vsize = slider_size + (style->klass->xthickness * 2);

  style = gtk_style_attach (style,
			    GTK_WIDGET (DEVICE_GTK_APP_SHELL (XDEVICE (FRAME_DEVICE (f))))->window);

  Fadd_spec_to_specifier (Vscrollbar_width, make_int (vsize), frame, Qnil, Qnil);
  Fadd_spec_to_specifier (Vscrollbar_height, make_int (hsize), frame, Qnil, Qnil);
}
#else
#define smash_scrollbar_specifiers(x,y)
#endif /* HAVE_SCROLLBARS */

static void
gtk_xemacs_realize (GtkWidget *widget)
{
  parent_class->realize (widget);
  gtk_xemacs_style_set (widget, gtk_widget_get_style (widget));
}

static void
gtk_xemacs_style_set (GtkWidget *widget, GtkStyle *previous_style)
{
  GtkStyle *new_style = gtk_widget_get_style (widget);
  GtkXEmacs *x = GTK_XEMACS (widget);

  parent_class->style_set (widget, previous_style);

  if (x->f)
    {
      __nuke_background_items (widget);
#if 0
      smash_face_fallbacks (x->f, new_style);
#endif
      smash_scrollbar_specifiers (x->f, new_style);
    }
}

static void
gtk_xemacs_size_request (GtkWidget *widget, GtkRequisition *requisition)
{
    GtkXEmacs *x = GTK_XEMACS (widget);
    struct frame *f = GTK_XEMACS_FRAME (x);
    int width, height;

    if (f)
      {
	char_to_pixel_size (f, FRAME_WIDTH (f), FRAME_HEIGHT (f),
			    &width, &height);
	requisition->width = width;
	requisition->height = height;
      }
    else
      {
	parent_class->size_request (widget, requisition);
      }
}

static void
gtk_xemacs_size_allocate (GtkWidget *widget, GtkAllocation *allocation)
{
    GtkXEmacs *x = GTK_XEMACS (widget);
    struct frame *f = GTK_XEMACS_FRAME (x);
    int columns, rows;

    parent_class->size_allocate(widget, allocation);

    if (f)
      {
	f->pixwidth = allocation->width;
	f->pixheight = allocation->height;

	pixel_to_char_size (f,
			    allocation->width,
			    allocation->height, &columns, &rows);

	change_frame_size (f, rows, columns, 1);
      }
}

static void
gtk_xemacs_paint (GtkWidget *widget, GdkRectangle *area)
{
    GtkXEmacs *x = GTK_XEMACS (widget);
    struct frame *f = GTK_XEMACS_FRAME (x);
    gtk_redraw_exposed_area (f, area->x, area->y, area->width, area->height);
}

static void
gtk_xemacs_draw (GtkWidget *widget, GdkRectangle *area)
{
    GtkFixed *fixed = GTK_FIXED (widget);
    GtkFixedChild *child;
    GdkRectangle child_area;
    GList *children;

    /* I need to manually iterate over the children instead of just
       chaining to parent_class->draw() because it calls
       gtk_fixed_paint() directly, which clears the background window,
       which causes A LOT of flashing. */

    gtk_xemacs_paint (widget, area);

    children = fixed->children;

    while (children)
      {
	child = children->data;
	children = children->next;
	/* #### This is what causes the scrollbar flickering!
	   Evidently the scrollbars pretty much take care of drawing
	   themselves in most cases.  Then we come along and tell them
	   to redraw again!

	   But if we just leave it out, then they do not get drawn
	   correctly the first time!

	   Scrollbar flickering has been greatly helped by the
	   optimizations in scrollbar-gtk.c /
	   gtk_update_scrollbar_instance_status (), so this is not that
	   big a deal anymore.
	*/
	if (gtk_widget_intersect (child->widget, area, &child_area))
	  {
	    gtk_widget_draw (child->widget, &child_area);
	  }
      }
}

static gint
gtk_xemacs_expose (GtkWidget *widget, GdkEventExpose *event)
{
    GtkXEmacs *x = GTK_XEMACS (widget);
    struct frame *f = GTK_XEMACS_FRAME (x);
    GdkRectangle *a = &event->area;

    /* This takes care of drawing the scrollbars, etc */
    parent_class->expose_event (widget, event);

    /* Now draw the actual frame data */
    if (!check_for_ignored_expose (f, a->x, a->y, a->width, a->height) &&
	!find_matching_subwindow (f, a->x, a->y, a->width, a->height))
      gtk_redraw_exposed_area (f, a->x, a->y, a->width, a->height);
    return (TRUE);
}

Lisp_Object
xemacs_gtk_convert_color(GdkColor *c, GtkWidget *w)
{
  char color_buf[255];

  sprintf (color_buf, "#%04x%04x%04x", c->red, c->green, c->blue);

  return (build_string (color_buf));
}
