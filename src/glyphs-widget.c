/* Widget-specific glyph objects.
   Copyright (C) 1998 Andy Piper

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

/* written by Andy Piper <andy@xemacs.org> */

#include <config.h>
#include "lisp.h"
#include "lstream.h"
#include "console.h"
#include "device.h"
#include "faces.h"
#include "glyphs.h"
#include "objects.h"
#include "bytecode.h"
#include "window.h"
#include "buffer.h"
#include "frame.h"
#include "insdel.h"
#include "opaque.h"

DEFINE_IMAGE_INSTANTIATOR_FORMAT (button);
DEFINE_IMAGE_INSTANTIATOR_FORMAT (combo_box);
Lisp_Object Qcombo_box;
DEFINE_IMAGE_INSTANTIATOR_FORMAT (edit_field);
Lisp_Object Qedit_field;
DEFINE_IMAGE_INSTANTIATOR_FORMAT (scrollbar);
Lisp_Object Qscrollbar;
DEFINE_IMAGE_INSTANTIATOR_FORMAT (widget);
#if 0
DEFINE_IMAGE_INSTANTIATOR_FORMAT (group);
Lisp_Object Qgroup;
#endif
DEFINE_IMAGE_INSTANTIATOR_FORMAT (label);
Lisp_Object Qlabel;
DEFINE_IMAGE_INSTANTIATOR_FORMAT (progress_gauge);
Lisp_Object Qprogress_gauge;
DEFINE_IMAGE_INSTANTIATOR_FORMAT (tree_view);
Lisp_Object Qtree_view;
DEFINE_IMAGE_INSTANTIATOR_FORMAT (tab_control);
Lisp_Object Qtab_control;

Lisp_Object Q_descriptor, Q_height, Q_width, Q_properties, Q_items;
Lisp_Object Q_image, Q_text, Q_percent;

#define WIDGET_BORDER_HEIGHT 2
#define WIDGET_BORDER_WIDTH 4

/* TODO:
   - more complex controls.
   - tooltips for controls.
 */

/* In windows normal windows work in pixels, dialog boxes work in
   dialog box units. Why? sigh. We could reuse the metrics for dialogs
   if this were not the case. As it is we have to position things
   pixel wise. I'm not even sure that X has this problem at least for
   buttons in groups. */
Lisp_Object
widget_face_font_info (Lisp_Object domain, Lisp_Object face,
		       int *height, int *width)
{
  Lisp_Object font_instance = FACE_FONT (face, domain, Vcharset_ascii);

  if (height)
    *height = XFONT_INSTANCE (font_instance)->height;
  if (width)
    *width = XFONT_INSTANCE (font_instance)->width;
  
  return font_instance;
}

void
widget_text_to_pixel_conversion (Lisp_Object domain, Lisp_Object face,
				 int th, int tw,
				 int* height, int* width)
{
  int ch=0, cw=0;
  widget_face_font_info (domain, face, &ch, &cw);
  if (height)
    *height = th * (ch + 2 * WIDGET_BORDER_HEIGHT);
  if (width)
    *width = tw * cw + 2 * WIDGET_BORDER_WIDTH;
}

static int
widget_possible_dest_types (void)
{
  return IMAGE_WIDGET_MASK;
}

static void
check_valid_glyph_or_image (Lisp_Object data)
{
  Lisp_Object glyph = data;
  if (SYMBOLP (data))
    glyph = XSYMBOL (data)->value;

  if (IMAGE_INSTANCEP (glyph))
    CHECK_IMAGE_INSTANCE (glyph);
  else if (!CONSP (glyph))
    CHECK_BUFFER_GLYPH (glyph);
}

static void
check_valid_anything (Lisp_Object data)
{
}

static void
check_valid_callback (Lisp_Object data)
{
    if (!SYMBOLP (data)
	&& !COMPILED_FUNCTIONP (data)
	&& !CONSP (data))
    {
	signal_simple_error (":callback must be a function or expression", data);
    }
}

static void
check_valid_symbol (Lisp_Object data)
{
    CHECK_SYMBOL (data);
}

static void
check_valid_string_or_vector (Lisp_Object data)
{
    if (!STRINGP (data) && !VECTORP (data))
	signal_simple_error (":descriptor must be a string or a vector", data);
}

void
check_valid_item_list_1 (Lisp_Object items)
{
  Lisp_Object rest;

  CHECK_LIST (items);
  EXTERNAL_LIST_LOOP (rest, items)
    {
      if (STRINGP (XCAR (rest)))
	CHECK_STRING (XCAR (rest));
      else if (VECTORP (XCAR (rest)))
	gui_parse_item_keywords (XCAR (rest));
      else if (LISTP (XCAR (rest)))
	check_valid_item_list_1 (XCAR (rest));
      else
	signal_simple_error ("Items must be vectors, lists or strings", items);
    }
}

static void
check_valid_item_list (Lisp_Object data)
{
  Lisp_Object items;

  Fcheck_valid_plist (data);
  items = Fplist_get (data, Q_items, Qnil);

  check_valid_item_list_1 (items);
}

/* wire widget property invocations to specific widgets ...  The
 problem we are solving here is that when instantiators get converted
 to instances they lose some type information (they just become
 subwindows or widgets for example). For widgets we need to preserve
 this type information so that we can do widget specific operations on
 the instances. This is encoded in the widget type
 field. widget_property gets invoked by decoding the primary type
 (Qwidget), widget property then invokes based on the secondary type
 (Qedit_field for example). It is debatable that we should wire things in this
 generalised way rather than treating widgets specially in
 image_instance_property. */
static Lisp_Object 
widget_property (Lisp_Object image_instance, Lisp_Object prop)
{
  struct Lisp_Image_Instance* ii = XIMAGE_INSTANCE (image_instance);
  struct image_instantiator_methods* meths;

  /* first see if its a general property ... */
  if (!NILP (Fplist_member (IMAGE_INSTANCE_WIDGET_PROPS (ii), prop)))
    return Fplist_get (IMAGE_INSTANCE_WIDGET_PROPS (ii), prop, Qnil);

  /* .. then try device specific methods ... */
  meths = decode_device_ii_format (IMAGE_INSTANCE_DEVICE (ii), 
				   IMAGE_INSTANCE_WIDGET_TYPE (ii), 
				   ERROR_ME_NOT);
  if (meths && HAS_IIFORMAT_METH_P (meths, property))
    return IIFORMAT_METH (meths, property, (image_instance, prop));
  /* ... then format specific methods ... */
  meths = decode_device_ii_format (Qnil, IMAGE_INSTANCE_WIDGET_TYPE (ii), 
				   ERROR_ME_NOT);
  if (meths && HAS_IIFORMAT_METH_P (meths, property))
    return IIFORMAT_METH (meths, property, (image_instance, prop));
  /* ... then fail */
  return Qunbound;
}

static Lisp_Object 
widget_set_property (Lisp_Object image_instance, Lisp_Object prop, Lisp_Object val)
{
  struct Lisp_Image_Instance* ii = XIMAGE_INSTANCE (image_instance);
  struct image_instantiator_methods* meths;
  Lisp_Object ret;

  /* try device specific methods first ... */
  meths = decode_device_ii_format (IMAGE_INSTANCE_DEVICE (ii), 
				   IMAGE_INSTANCE_WIDGET_TYPE (ii), 
				   ERROR_ME_NOT);
  if (meths && HAS_IIFORMAT_METH_P (meths, set_property)
      &&
      !UNBOUNDP (ret = 
		 IIFORMAT_METH (meths, set_property, (image_instance, prop, val))))
    {
      return ret;
    }
  /* ... then format specific methods ... */
  meths = decode_device_ii_format (Qnil, IMAGE_INSTANCE_WIDGET_TYPE (ii), 
				   ERROR_ME_NOT);
  if (meths && HAS_IIFORMAT_METH_P (meths, set_property)
      &&
      !UNBOUNDP (ret = 
		 IIFORMAT_METH (meths, set_property, (image_instance, prop, val))))
    {
      return ret;
    }
  /* we didn't do any device specific properties, so shove the property in our plist */
  IMAGE_INSTANCE_WIDGET_PROPS (ii)
    = Fplist_put (IMAGE_INSTANCE_WIDGET_PROPS (ii), prop, val);
  return val;
}

static void
widget_validate (Lisp_Object instantiator)
{
  Lisp_Object desc = find_keyword_in_vector (instantiator, Q_descriptor);

  if (NILP (desc))
    signal_simple_error ("Must supply :descriptor", instantiator);

  if (VECTORP (desc))
    gui_parse_item_keywords (desc);

  if (!NILP (find_keyword_in_vector (instantiator, Q_width))
      && !NILP (find_keyword_in_vector (instantiator, Q_pixel_width)))
    signal_simple_error ("Must supply only one of :width and :pixel-width", instantiator);

  if (!NILP (find_keyword_in_vector (instantiator, Q_height))
	     && !NILP (find_keyword_in_vector (instantiator, Q_pixel_height)))
    signal_simple_error ("Must supply only one of :height and :pixel-height", instantiator);
}

static void
combo_box_validate (Lisp_Object instantiator)
{
  widget_validate (instantiator);
  if (NILP (find_keyword_in_vector (instantiator, Q_properties)))
    signal_simple_error ("Must supply item list", instantiator);
}

/* we need to convert things like glyphs to images, eval expressions
   etc.*/
static Lisp_Object
widget_normalize (Lisp_Object inst, Lisp_Object console_type)
{
  /* This function can call lisp */
  Lisp_Object glyph = find_keyword_in_vector (inst, Q_image);

  /* we need to eval glyph if its an expression, we do this for the
     same reasons we normalize file to data. */
  if (!NILP (glyph))
    {
      int i;
      struct gcpro gcpro1;
      if (SYMBOLP (glyph))
	glyph = XSYMBOL (glyph)->value;
      GCPRO1 (glyph);

      if (CONSP (glyph))
	glyph = Feval (glyph);
      /* substitute the new glyph */
      for (i = 0; i < XVECTOR_LENGTH (inst); i++)
	{
	  if (EQ (Q_image, XVECTOR_DATA (inst)[i]))
	    {
	      XVECTOR_DATA (inst)[i+1] = glyph;
	      break;
	    }
	}
      UNGCPRO;
    }
  return inst;
}

static void
initialize_widget_image_instance (struct Lisp_Image_Instance *ii, Lisp_Object type)
{
  /*  initialize_subwindow_image_instance (ii);*/
  IMAGE_INSTANCE_WIDGET_TYPE (ii) = type;
  IMAGE_INSTANCE_WIDGET_PROPS (ii) = Qnil;
  IMAGE_INSTANCE_WIDGET_FACE (ii) = Vwidget_face;
  IMAGE_INSTANCE_WIDGET_ITEM (ii) = allocate_gui_item ();
}

/* Instantiate a button widget. Unfortunately instantiated widgets are
   particular to a frame since they need to have a parent. It's not
   like images where you just select the image into the context you
   want to display it in and BitBlt it. So image instances can have a
   many-to-one relationship with things you see, whereas widgets can
   only be one-to-one (i.e. per frame) */
static void
widget_instantiate_1 (Lisp_Object image_instance, Lisp_Object instantiator,
		      Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		      int dest_mask, Lisp_Object domain, int default_textheight,
		      int default_pixheight, int default_textwidth)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);
  Lisp_Object face = find_keyword_in_vector (instantiator, Q_face);
  Lisp_Object height = find_keyword_in_vector (instantiator, Q_height);
  Lisp_Object width = find_keyword_in_vector (instantiator, Q_width);
  Lisp_Object pixwidth = find_keyword_in_vector (instantiator, Q_pixel_width);
  Lisp_Object pixheight = find_keyword_in_vector (instantiator, Q_pixel_height);
  Lisp_Object desc = find_keyword_in_vector (instantiator, Q_descriptor);
  Lisp_Object glyph = find_keyword_in_vector (instantiator, Q_image);
  int pw=0, ph=0, tw=0, th=0;
  
  /* this just does pixel type sizing */
  subwindow_instantiate (image_instance, instantiator, pointer_fg, pointer_bg,
			 dest_mask, domain);

  if (!(dest_mask & IMAGE_WIDGET_MASK))
    incompatible_image_types (instantiator, dest_mask, IMAGE_WIDGET_MASK);

  initialize_widget_image_instance (ii, XVECTOR_DATA (instantiator)[0]);

  /* retrieve the fg and bg colors */
  if (!NILP (face))
    IMAGE_INSTANCE_WIDGET_FACE (ii) = Fget_face (face);
  
  /* data items for some widgets */
  IMAGE_INSTANCE_WIDGET_PROPS (ii) = 
    find_keyword_in_vector (instantiator, Q_properties);

  /* retrieve the gui item information. This is easy if we have been
     provided with a vector, more difficult if we have just been given
     keywords */
  if (STRINGP (desc) || NILP (desc))
    {
      /* big cheat - we rely on the fact that a gui item looks like an instantiator */
      IMAGE_INSTANCE_WIDGET_ITEM (ii) = 
	gui_parse_item_keywords_no_errors (instantiator);
      IMAGE_INSTANCE_WIDGET_TEXT (ii) = desc;
    }
  else
    IMAGE_INSTANCE_WIDGET_ITEM (ii) =
      gui_parse_item_keywords_no_errors (desc);

  /* normalize size information */
  if (!NILP (width))
    tw = XINT (width);
  if (!NILP (height))
    th = XINT (height);
  if (!NILP (pixwidth))
    pw = XINT (pixwidth);
  if (!NILP (pixheight))
    ph = XINT (pixheight);

  /* for a widget with an image pick up the dimensions from that */
  if (!NILP (glyph))
    {
      if (!pw && !tw)
	pw = glyph_width (glyph, Qnil, DEFAULT_INDEX, domain) 
	  + 2 * WIDGET_BORDER_WIDTH;
      if (!ph && !th)
	ph = glyph_height (glyph, Qnil, DEFAULT_INDEX, domain) 
	  + 2 * WIDGET_BORDER_HEIGHT;
    }

  /* if we still don' t have sizes, guess from text size */
  if (!tw && !pw)
    {
      if (default_textwidth)
	tw = default_textwidth;
      else if (!NILP (IMAGE_INSTANCE_WIDGET_TEXT (ii)))
	tw = XSTRING_LENGTH (IMAGE_INSTANCE_WIDGET_TEXT (ii));
    }

  if (!th && !ph)
    {
      if (default_textheight)
	th = default_textheight;
      else if (!NILP (IMAGE_INSTANCE_WIDGET_TEXT (ii)))
	th = 1;
      else
	ph = default_pixheight;
    }
  
  if (tw !=0 || th !=0)
    widget_text_to_pixel_conversion (domain,
				     IMAGE_INSTANCE_WIDGET_FACE (ii),
				     th, tw, th ? &ph : 0, tw ? &pw : 0);

  IMAGE_INSTANCE_SUBWINDOW_WIDTH (ii) = pw;
  IMAGE_INSTANCE_SUBWINDOW_HEIGHT (ii) = ph;
}

static void
widget_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		    int dest_mask, Lisp_Object domain)
{
  widget_instantiate_1 (image_instance, instantiator, pointer_fg,
			       pointer_bg, dest_mask, domain, 1, 0, 0);
}

/* combo-box generic instantiation - get he heigh right */
static void
combo_box_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		   Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		   int dest_mask, Lisp_Object domain)
{
  Lisp_Object data = Fplist_get (find_keyword_in_vector (instantiator, Q_properties),
				 Q_items, Qnil);
  int len;
  GET_LIST_LENGTH (data, len);
  widget_instantiate_1 (image_instance, instantiator, pointer_fg,
			pointer_bg, dest_mask, domain, len + 1, 0, 0);
}

static void
tab_control_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		 int dest_mask, Lisp_Object domain)
{
  Lisp_Object data = Fplist_get (find_keyword_in_vector (instantiator, Q_properties),
				 Q_items, Qnil);
  Lisp_Object rest;
  int len = 0;

  LIST_LOOP (rest, data)
    {
      len += 3;			/* some bias */
      if (STRINGP (XCAR (rest)))
	len += XSTRING_LENGTH (XCAR (rest));
      else if (VECTORP (XCAR (rest)))
	{
	  Lisp_Object gui = gui_parse_item_keywords (XCAR (rest));
	  len += XSTRING_LENGTH (XGUI_ITEM (gui)->name);
	}
    }

  widget_instantiate_1 (image_instance, instantiator, pointer_fg,
			pointer_bg, dest_mask, domain, 0, 0, len);
}

/* Instantiate a static control */
static void
static_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		    int dest_mask, Lisp_Object domain)
{
  widget_instantiate_1 (image_instance, instantiator, pointer_fg,
			pointer_bg, dest_mask, domain, 0, 4, 0);
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_glyphs_widget (void)
{
  defkeyword (&Q_descriptor, ":descriptor");
  defkeyword (&Q_height, ":height");
  defkeyword (&Q_width, ":width");
  defkeyword (&Q_properties, ":properties");
  defkeyword (&Q_items, ":items");
  defkeyword (&Q_image, ":image");
  defkeyword (&Q_percent, ":percent");
  defkeyword (&Q_text, ":text");
}

void
image_instantiator_format_create_glyphs_widget (void)
{
#define VALID_GUI_KEYWORDS(type) \
  IIFORMAT_VALID_KEYWORD (type, Q_active, check_valid_anything); \
  IIFORMAT_VALID_KEYWORD (type, Q_suffix, check_valid_anything); \
  IIFORMAT_VALID_KEYWORD (type, Q_keys, check_valid_string);		\
  IIFORMAT_VALID_KEYWORD (type, Q_style, check_valid_symbol);		\
  IIFORMAT_VALID_KEYWORD (type, Q_selected, check_valid_anything);	\
  IIFORMAT_VALID_KEYWORD (type, Q_filter, check_valid_anything);		\
  IIFORMAT_VALID_KEYWORD (type, Q_config, check_valid_symbol);		\
  IIFORMAT_VALID_KEYWORD (type, Q_included, check_valid_anything);	\
  IIFORMAT_VALID_KEYWORD (type, Q_key_sequence, check_valid_string);	\
  IIFORMAT_VALID_KEYWORD (type, Q_accelerator, check_valid_string);	\
  IIFORMAT_VALID_KEYWORD (type, Q_label, check_valid_anything);		\
  IIFORMAT_VALID_KEYWORD (type, Q_callback, check_valid_callback); 		\
  IIFORMAT_VALID_KEYWORD (type, Q_descriptor, check_valid_string_or_vector)

#define VALID_WIDGET_KEYWORDS(type) \
  IIFORMAT_VALID_KEYWORD (type, Q_width, check_valid_int);		\
  IIFORMAT_VALID_KEYWORD (type, Q_height, check_valid_int);		\
  IIFORMAT_VALID_KEYWORD (type, Q_pixel_width, check_valid_int);	\
  IIFORMAT_VALID_KEYWORD (type, Q_pixel_height, check_valid_int);	\
  IIFORMAT_VALID_KEYWORD (type, Q_face, check_valid_face)

  /* we only do this for properties */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT_NO_SYM (widget, "widget");
  IIFORMAT_HAS_METHOD (widget, property);
  IIFORMAT_HAS_METHOD (widget, set_property);

  /* widget image-instantiator types - buttons */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (button, "button");
  IIFORMAT_HAS_SHARED_METHOD (button, validate, widget);
  IIFORMAT_HAS_SHARED_METHOD (button, possible_dest_types, widget);
  IIFORMAT_HAS_SHARED_METHOD (button, instantiate, widget);
  IIFORMAT_HAS_SHARED_METHOD (button, normalize, widget);
  IIFORMAT_VALID_KEYWORD (button, Q_image, check_valid_glyph_or_image);
  VALID_WIDGET_KEYWORDS (button);
  VALID_GUI_KEYWORDS (button);

  /* edit fields */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (edit_field, "edit-field");
  IIFORMAT_HAS_SHARED_METHOD (edit_field, validate, widget);
  IIFORMAT_HAS_SHARED_METHOD (edit_field, possible_dest_types, widget);
  IIFORMAT_HAS_SHARED_METHOD (edit_field, instantiate, widget);
  VALID_WIDGET_KEYWORDS (edit_field);
  VALID_GUI_KEYWORDS (edit_field);

  /* combo box */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (combo_box, "combo-box");
  IIFORMAT_HAS_METHOD (combo_box, validate);
  IIFORMAT_HAS_SHARED_METHOD (combo_box, possible_dest_types, widget);
  IIFORMAT_HAS_METHOD (combo_box, instantiate);
  VALID_GUI_KEYWORDS (combo_box);

  IIFORMAT_VALID_KEYWORD (combo_box, Q_width, check_valid_int);
  IIFORMAT_VALID_KEYWORD (combo_box, Q_height, check_valid_int);
  IIFORMAT_VALID_KEYWORD (combo_box, Q_pixel_width, check_valid_int);
  IIFORMAT_VALID_KEYWORD (combo_box, Q_face, check_valid_face);
  IIFORMAT_VALID_KEYWORD (combo_box, Q_properties, check_valid_item_list);

  /* scrollbar */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (scrollbar, "scrollbar");
  IIFORMAT_HAS_SHARED_METHOD (scrollbar, validate, widget);
  IIFORMAT_HAS_SHARED_METHOD (scrollbar, possible_dest_types, widget);
  IIFORMAT_HAS_SHARED_METHOD (scrollbar, instantiate, widget);
  VALID_GUI_KEYWORDS (scrollbar);

  IIFORMAT_VALID_KEYWORD (scrollbar, Q_pixel_width, check_valid_int);
  IIFORMAT_VALID_KEYWORD (scrollbar, Q_pixel_height, check_valid_int);
  IIFORMAT_VALID_KEYWORD (scrollbar, Q_face, check_valid_face);

  /* progress guage */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (progress_gauge, "progress-gauge");
  IIFORMAT_HAS_SHARED_METHOD (progress_gauge, validate, widget);
  IIFORMAT_HAS_SHARED_METHOD (progress_gauge, possible_dest_types, widget);
  IIFORMAT_HAS_SHARED_METHOD (progress_gauge, instantiate, combo_box);
  VALID_WIDGET_KEYWORDS (progress_gauge);
  VALID_GUI_KEYWORDS (progress_gauge);

  /* tree view */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (tree_view, "tree-view");
  IIFORMAT_HAS_SHARED_METHOD (tree_view, validate, combo_box);
  IIFORMAT_HAS_SHARED_METHOD (tree_view, possible_dest_types, widget);
  IIFORMAT_HAS_SHARED_METHOD (tree_view, instantiate, combo_box);
  VALID_WIDGET_KEYWORDS (tree_view);
  VALID_GUI_KEYWORDS (tree_view);
  IIFORMAT_VALID_KEYWORD (tree_view, Q_properties, check_valid_item_list);

  /* tab control */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (tab_control, "tab-control");
  IIFORMAT_HAS_SHARED_METHOD (tab_control, validate, combo_box);
  IIFORMAT_HAS_SHARED_METHOD (tab_control, possible_dest_types, widget);
  IIFORMAT_HAS_METHOD (tab_control, instantiate);
  VALID_WIDGET_KEYWORDS (tab_control);
  VALID_GUI_KEYWORDS (tab_control);
  IIFORMAT_VALID_KEYWORD (tab_control, Q_properties, check_valid_item_list);

  /* labels */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (label, "label");
  IIFORMAT_HAS_SHARED_METHOD (label, possible_dest_types, widget);
  IIFORMAT_HAS_SHARED_METHOD (label, instantiate, static);
  VALID_WIDGET_KEYWORDS (label);
  IIFORMAT_VALID_KEYWORD (label, Q_descriptor, check_valid_string);

#if 0
  /* group */
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (group, "group");
  IIFORMAT_HAS_SHARED_METHOD (group, possible_dest_types, widget);
  IIFORMAT_HAS_METHOD (group, instantiate);

  IIFORMAT_VALID_KEYWORD (group, Q_width, check_valid_int);
  IIFORMAT_VALID_KEYWORD (group, Q_height, check_valid_int);
  IIFORMAT_VALID_KEYWORD (group, Q_pixel_width, check_valid_int);
  IIFORMAT_VALID_KEYWORD (group, Q_pixel_height, check_valid_int);
  IIFORMAT_VALID_KEYWORD (group, Q_face, check_valid_face);
  IIFORMAT_VALID_KEYWORD (group, Q_background, check_valid_string);
  IIFORMAT_VALID_KEYWORD (group, Q_descriptor, check_valid_string);
#endif
}

void
vars_of_glyphs_widget (void)
{
}
