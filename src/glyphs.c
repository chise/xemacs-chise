/* Generic glyph/image implementation + display tables
   Copyright (C) 1994, 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1995 Tinker Systems
   Copyright (C) 1995, 1996 Ben Wing
   Copyright (C) 1995 Sun Microsystems

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

/* Written by Ben Wing and Chuck Thompson */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "device.h"
#include "elhash.h"
#include "faces.h"
#include "frame.h"
#include "insdel.h"
#include "glyphs.h"
#include "objects.h"
#include "redisplay.h"
#include "window.h"

#ifdef HAVE_XPM
#include <X11/xpm.h>
#endif

Lisp_Object Qimage_conversion_error;

Lisp_Object Qglyphp, Qcontrib_p, Qbaseline;
Lisp_Object Qbuffer_glyph_p, Qpointer_glyph_p, Qicon_glyph_p;
Lisp_Object Qnothing_image_instance_p, Qtext_image_instance_p;
Lisp_Object Qmono_pixmap_image_instance_p;
Lisp_Object Qcolor_pixmap_image_instance_p;
Lisp_Object Qpointer_image_instance_p;
Lisp_Object Qsubwindow_image_instance_p;
Lisp_Object Qconst_glyph_variable;
Lisp_Object Qmono_pixmap, Qcolor_pixmap, Qsubwindow;
Lisp_Object Q_file, Q_data, Q_face;
Lisp_Object Qformatted_string;

Lisp_Object Vcurrent_display_table;
Lisp_Object Vtruncation_glyph, Vcontinuation_glyph, Voctal_escape_glyph;
Lisp_Object Vcontrol_arrow_glyph, Vinvisible_text_glyph, Vhscroll_glyph;
Lisp_Object Vxemacs_logo;
Lisp_Object Vthe_nothing_vector;
Lisp_Object Vimage_instantiator_format_list;
Lisp_Object Vimage_instance_type_list;
Lisp_Object Vglyph_type_list;

DEFINE_IMAGE_INSTANTIATOR_FORMAT (nothing);
DEFINE_IMAGE_INSTANTIATOR_FORMAT (inherit);
DEFINE_IMAGE_INSTANTIATOR_FORMAT (string);
DEFINE_IMAGE_INSTANTIATOR_FORMAT (formatted_string);

#ifdef HAVE_WINDOW_SYSTEM
DEFINE_IMAGE_INSTANTIATOR_FORMAT (xbm);
Lisp_Object Qxbm;

Lisp_Object Q_mask_file, Q_mask_data, Q_hotspot_x, Q_hotspot_y;
Lisp_Object Q_foreground, Q_background;
#ifndef BitmapSuccess
#define BitmapSuccess           0
#define BitmapOpenFailed        1
#define BitmapFileInvalid       2
#define BitmapNoMemory          3
#endif
#endif

#ifdef HAVE_XPM
DEFINE_IMAGE_INSTANTIATOR_FORMAT (xpm);
Lisp_Object Qxpm;
Lisp_Object Q_color_symbols;
#endif

typedef struct image_instantiator_format_entry image_instantiator_format_entry;
struct image_instantiator_format_entry
{
  Lisp_Object symbol;
  struct image_instantiator_methods *meths;
};

typedef struct
{
  Dynarr_declare (struct image_instantiator_format_entry);
} image_instantiator_format_entry_dynarr;

image_instantiator_format_entry_dynarr *
  the_image_instantiator_format_entry_dynarr;

static Lisp_Object allocate_image_instance (Lisp_Object device);
static void image_validate (Lisp_Object instantiator);
static void glyph_property_was_changed (Lisp_Object glyph,
					Lisp_Object property,
					Lisp_Object locale);
EXFUN (Fimage_instance_type, 1);
EXFUN (Fglyph_type, 1);


/****************************************************************************
 *                          Image Instantiators                             *
 ****************************************************************************/

static struct image_instantiator_methods *
decode_image_instantiator_format (Lisp_Object format, Error_behavior errb)
{
  int i;

  if (!SYMBOLP (format))
    {
      if (ERRB_EQ (errb, ERROR_ME))
	CHECK_SYMBOL (format);
      return 0;
    }

  for (i = 0; i < Dynarr_length (the_image_instantiator_format_entry_dynarr);
       i++)
    {
      if (EQ (format,
	      Dynarr_at (the_image_instantiator_format_entry_dynarr, i).
	      symbol))
	return Dynarr_at (the_image_instantiator_format_entry_dynarr, i).meths;
    }

  maybe_signal_simple_error ("Invalid image-instantiator format", format,
			     Qimage, errb);

  return 0;
}

static int
valid_image_instantiator_format_p (Lisp_Object format)
{
  return (decode_image_instantiator_format (format, ERROR_ME_NOT) != 0);
}

DEFUN ("valid-image-instantiator-format-p", Fvalid_image_instantiator_format_p,
       1, 1, 0, /*
Given an IMAGE-INSTANTIATOR-FORMAT, return non-nil if it is valid.
Valid formats are some subset of 'nothing, 'string, 'formatted-string,
'xpm, 'xbm, 'xface, 'gif, 'jpeg, 'png, 'tiff, 'cursor-font, 'font,
'autodetect, and 'subwindow, depending on how XEmacs was compiled.
*/
       (image_instantiator_format))
{
  return valid_image_instantiator_format_p (image_instantiator_format) ?
    Qt : Qnil;
}

DEFUN ("image-instantiator-format-list", Fimage_instantiator_format_list,
       0, 0, 0, /*
Return a list of valid image-instantiator formats.
*/
       ())
{
  return Fcopy_sequence (Vimage_instantiator_format_list);
}

void
add_entry_to_image_instantiator_format_list (Lisp_Object symbol,
					     struct
					     image_instantiator_methods *meths)
{
  struct image_instantiator_format_entry entry;

  entry.symbol = symbol;
  entry.meths = meths;
  Dynarr_add (the_image_instantiator_format_entry_dynarr, entry);
  Vimage_instantiator_format_list =
    Fcons (symbol, Vimage_instantiator_format_list);
}

static Lisp_Object *
get_image_conversion_list (Lisp_Object console_type)
{
  return &decode_console_type (console_type, ERROR_ME)->image_conversion_list;
}

DEFUN ("set-console-type-image-conversion-list", Fset_console_type_image_conversion_list,
       2, 2, 0, /*
Set the image-conversion-list for consoles of the given TYPE.
The image-conversion-list specifies how image instantiators that
are strings should be interpreted.  Each element of the list should be
a list of two elements (a regular expression string and a vector) or
a list of three elements (the preceding two plus an integer index into
the vector).  The string is converted to the vector associated with the
first matching regular expression.  If a vector index is specified, the
string itself is substituted into that position in the vector.

Note: The conversion above is applied when the image instantiator is
added to an image specifier, not when the specifier is actually
instantiated.  Therefore, changing the image-conversion-list only affects
newly-added instantiators.  Existing instantiators in glyphs and image
specifiers will not be affected.
*/
       (console_type, list))
{
  Lisp_Object tail;
  Lisp_Object *imlist = get_image_conversion_list (console_type);

  /* Check the list to make sure that it only has valid entries. */

  EXTERNAL_LIST_LOOP (tail, list)
    {
      Lisp_Object mapping = XCAR (tail);

      /* Mapping form should be (STRING VECTOR) or (STRING VECTOR INTEGER) */
      if (!CONSP (mapping) ||
	  !CONSP (XCDR (mapping)) ||
	  (!NILP (XCDR (XCDR (mapping))) &&
	   (!CONSP (XCDR (XCDR (mapping))) ||
	    !NILP (XCDR (XCDR (XCDR (mapping)))))))
	signal_simple_error ("Invalid mapping form", mapping);
      else
	{
	  Lisp_Object exp = XCAR (mapping);
	  Lisp_Object typevec = XCAR (XCDR (mapping));
	  Lisp_Object pos = Qnil;
	  Lisp_Object newvec;
	  struct gcpro gcpro1;

	  CHECK_STRING (exp);
	  CHECK_VECTOR (typevec);
	  if (!NILP (XCDR (XCDR (mapping))))
	    {
	      pos = XCAR (XCDR (XCDR (mapping)));
	      CHECK_INT (pos);
	      if (XINT (pos) < 0 ||
		  XINT (pos) >= XVECTOR_LENGTH (typevec))
		args_out_of_range_3
		  (pos, Qzero, make_int (XVECTOR_LENGTH (typevec) - 1));
	    }

	  newvec = Fcopy_sequence (typevec);
	  if (INTP (pos))
	    XVECTOR_DATA (newvec)[XINT (pos)] = exp;
	  GCPRO1 (newvec);
	  image_validate (newvec);
	  UNGCPRO;
	}
    }

  *imlist = Fcopy_tree (list, Qt);
  return list;
}

DEFUN ("console-type-image-conversion-list", Fconsole_type_image_conversion_list,
       1, 1, 0, /*
Return the image-conversion-list for devices of the given TYPE.
The image-conversion-list specifies how to interpret image string
instantiators for the specified console type.  See
`set-console-type-image-conversion-list' for a description of its syntax.
*/
       (console_type))
{
  return Fcopy_tree (*get_image_conversion_list (console_type), Qt);
}

/* Process a string instantiator according to the image-conversion-list for
   CONSOLE_TYPE.  Returns a vector. */

static Lisp_Object
process_image_string_instantiator (Lisp_Object data,
				   Lisp_Object console_type,
				   int dest_mask)
{
  Lisp_Object tail;

  LIST_LOOP (tail, *get_image_conversion_list (console_type))
    {
      Lisp_Object mapping = XCAR (tail);
      Lisp_Object exp = XCAR (mapping);
      Lisp_Object typevec = XCAR (XCDR (mapping));

      /* if the result is of a type that can't be instantiated
	 (e.g. a string when we're dealing with a pointer glyph),
	 skip it. */
      if (!(dest_mask &
	    IIFORMAT_METH (decode_image_instantiator_format
			   (XVECTOR_DATA (typevec)[0], ERROR_ME),
			   possible_dest_types, ())))
	continue;
      if (fast_string_match (exp, 0, data, 0, -1, 0, ERROR_ME, 0) >= 0)
	{
	  if (!NILP (XCDR (XCDR (mapping))))
	    {
	      int pos = XINT (XCAR (XCDR (XCDR (mapping))));
	      Lisp_Object newvec = Fcopy_sequence (typevec);
	      XVECTOR_DATA (newvec)[pos] = data;
	      return newvec;
	    }
	  else
	    return typevec;
	}
    }

  /* Oh well. */
  signal_simple_error ("Unable to interpret glyph instantiator",
		       data);

  return Qnil;
}

Lisp_Object
find_keyword_in_vector_or_given (Lisp_Object vector, Lisp_Object keyword,
				 Lisp_Object default_)
{
  Lisp_Object *elt;
  int instantiator_len;

  elt = XVECTOR_DATA (vector);
  instantiator_len = XVECTOR_LENGTH (vector);

  elt++;
  instantiator_len--;

  while (instantiator_len > 0)
    {
      if (EQ (elt[0], keyword))
	return elt[1];
      elt += 2;
      instantiator_len -= 2;
    }

  return default_;
}

Lisp_Object
find_keyword_in_vector (Lisp_Object vector, Lisp_Object keyword)
{
  return find_keyword_in_vector_or_given (vector, keyword, Qnil);
}

void
check_valid_string (Lisp_Object data)
{
  CHECK_STRING (data);
}

static void
check_valid_face (Lisp_Object data)
{
  Fget_face (data);
}

void
check_valid_int (Lisp_Object data)
{
  CHECK_INT (data);
}

void
file_or_data_must_be_present (Lisp_Object instantiator)
{
  if (NILP (find_keyword_in_vector (instantiator, Q_file)) &&
      NILP (find_keyword_in_vector (instantiator, Q_data)))
    signal_simple_error ("Must supply either :file or :data",
			 instantiator);
}

void
data_must_be_present (Lisp_Object instantiator)
{
  if (NILP (find_keyword_in_vector (instantiator, Q_data)))
    signal_simple_error ("Must supply :data", instantiator);
}

static void
face_must_be_present (Lisp_Object instantiator)
{
  if (NILP (find_keyword_in_vector (instantiator, Q_face)))
    signal_simple_error ("Must supply :face", instantiator);
}

/* utility function useful in retrieving data from a file. */

Lisp_Object
make_string_from_file (Lisp_Object file)
{
  /* This function can call lisp */
  int count = specpdl_depth ();
  Lisp_Object temp_buffer;
  struct gcpro gcpro1;
  Lisp_Object data;

  specbind (Qinhibit_quit, Qt);
  record_unwind_protect (Fset_buffer, Fcurrent_buffer ());
  temp_buffer = Fget_buffer_create (build_string (" *pixmap conversion*"));
  GCPRO1 (temp_buffer);
  set_buffer_internal (XBUFFER (temp_buffer));
  Ferase_buffer (Qnil);
  specbind (intern ("format-alist"), Qnil);
  Finsert_file_contents_internal (file, Qnil, Qnil, Qnil, Qnil, Qnil, Qnil);
  data = Fbuffer_substring (Qnil, Qnil, Qnil);
  unbind_to (count, Qnil);
  UNGCPRO;
  return data;
}

/* The following two functions are provided to make it easier for
   the normalize methods to work with keyword-value vectors.
   Hash tables are kind of heavyweight for this purpose.
   (If vectors were resizable, we could avoid this problem;
   but they're not.) An alternative approach that might be
   more efficient but require more work is to use a type of
   assoc-Dynarr and provide primitives for deleting elements out
   of it. (However, you'd also have to add an unwind-protect
   to make sure the Dynarr got freed in case of an error in
   the normalization process.) */

Lisp_Object
tagged_vector_to_alist (Lisp_Object vector)
{
  Lisp_Object *elt = XVECTOR_DATA (vector);
  int len = XVECTOR_LENGTH (vector);
  Lisp_Object result = Qnil;

  assert (len & 1);
  for (len -= 2; len >= 1; len -= 2)
    result = Fcons (Fcons (elt[len], elt[len+1]), result);

  return result;
}

Lisp_Object
alist_to_tagged_vector (Lisp_Object tag, Lisp_Object alist)
{
  int len = 1 + 2 * XINT (Flength (alist));
  Lisp_Object *elt = alloca_array (Lisp_Object, len);
  int i;
  Lisp_Object rest;

  i = 0;
  elt[i++] = tag;
  LIST_LOOP (rest, alist)
    {
      Lisp_Object pair = XCAR (rest);
      elt[i] = XCAR (pair);
      elt[i+1] = XCDR (pair);
      i += 2;
    }

  return Fvector (len, elt);
}

static Lisp_Object
normalize_image_instantiator (Lisp_Object instantiator,
			      Lisp_Object contype,
			      Lisp_Object dest_mask)
{
  if (IMAGE_INSTANCEP (instantiator))
    return instantiator;

  if (STRINGP (instantiator))
    instantiator = process_image_string_instantiator (instantiator, contype,
						      XINT (dest_mask));

  assert (VECTORP (instantiator));
  /* We have to always store the actual pixmap data and not the
     filename even though this is a potential memory pig.  We have to
     do this because it is quite possible that we will need to
     instantiate a new instance of the pixmap and the file will no
     longer exist (e.g. w3 pixmaps are almost always from temporary
     files). */
  {
    struct image_instantiator_methods * meths =
      decode_image_instantiator_format (XVECTOR_DATA (instantiator)[0],
					ERROR_ME);
    return IIFORMAT_METH_OR_GIVEN (meths, normalize,
				   (instantiator, contype),
				   instantiator);
  }
}

static Lisp_Object
instantiate_image_instantiator (Lisp_Object device, Lisp_Object domain,
				Lisp_Object instantiator,
				Lisp_Object pointer_fg, Lisp_Object pointer_bg,
				int dest_mask)
{
  Lisp_Object ii = allocate_image_instance (device);
  struct image_instantiator_methods *meths;
  struct gcpro gcpro1;

  GCPRO1 (ii);
  meths = decode_image_instantiator_format (XVECTOR_DATA (instantiator)[0],
					    ERROR_ME);
  if (!HAS_IIFORMAT_METH_P (meths, instantiate))
    signal_simple_error
      ("Don't know how to instantiate this image instantiator?",
       instantiator);
  IIFORMAT_METH (meths, instantiate, (ii, instantiator, pointer_fg,
				      pointer_bg, dest_mask, domain));
  UNGCPRO;

  return ii;
}


/****************************************************************************
 *                          Image-Instance Object                           *
 ****************************************************************************/

Lisp_Object Qimage_instancep;

static Lisp_Object
mark_image_instance (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_Image_Instance *i = XIMAGE_INSTANCE (obj);

  (markobj) (i->name);
  switch (IMAGE_INSTANCE_TYPE (i))
    {
    case IMAGE_TEXT:
      (markobj) (IMAGE_INSTANCE_TEXT_STRING (i));
      break;
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
      (markobj) (IMAGE_INSTANCE_PIXMAP_FILENAME (i));
      (markobj) (IMAGE_INSTANCE_PIXMAP_MASK_FILENAME (i));
      (markobj) (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (i));
      (markobj) (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (i));
      (markobj) (IMAGE_INSTANCE_PIXMAP_FG (i));
      (markobj) (IMAGE_INSTANCE_PIXMAP_BG (i));
      break;
    case IMAGE_SUBWINDOW:
      /* #### implement me */
      break;
    default:
      break;
    }

  MAYBE_DEVMETH (XDEVICE (i->device), mark_image_instance, (i, markobj));

  return i->device;
}

static void
print_image_instance (Lisp_Object obj, Lisp_Object printcharfun,
		      int escapeflag)
{
  char buf[100];
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (obj);

  if (print_readably)
    error ("printing unreadable object #<image-instance 0x%x>",
           ii->header.uid);
  write_c_string ("#<image-instance (", printcharfun);
  print_internal (Fimage_instance_type (obj), printcharfun, 0);
  write_c_string (") ", printcharfun);
  if (!NILP (ii->name))
    {
      print_internal (ii->name, printcharfun, 1);
      write_c_string (" ", printcharfun);
    }
  write_c_string ("on ", printcharfun);
  print_internal (ii->device, printcharfun, 0);
  write_c_string (" ", printcharfun);
  switch (IMAGE_INSTANCE_TYPE (ii))
    {
    case IMAGE_NOTHING:
      break;

    case IMAGE_TEXT:
      print_internal (IMAGE_INSTANCE_TEXT_STRING (ii), printcharfun, 1);
      break;

    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      if (STRINGP (IMAGE_INSTANCE_PIXMAP_FILENAME (ii)))
	{
	  char *s;
	  Lisp_Object filename = IMAGE_INSTANCE_PIXMAP_FILENAME (ii);
	  s = strrchr ((char *) XSTRING_DATA (filename), '/');
	  if (s)
	    print_internal (build_string (s + 1), printcharfun, 1);
	  else
	    print_internal (filename, printcharfun, 1);
	}
      if (IMAGE_INSTANCE_PIXMAP_DEPTH (ii) > 1)
	sprintf (buf, " %dx%dx%d", IMAGE_INSTANCE_PIXMAP_WIDTH (ii),
		 IMAGE_INSTANCE_PIXMAP_HEIGHT (ii),
		 IMAGE_INSTANCE_PIXMAP_DEPTH (ii));
      else
	sprintf (buf, " %dx%d", IMAGE_INSTANCE_PIXMAP_WIDTH (ii),
		 IMAGE_INSTANCE_PIXMAP_HEIGHT (ii));
      write_c_string (buf, printcharfun);
      if (!NILP (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii)) ||
	  !NILP (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii)))
	{
	  write_c_string (" @", printcharfun);
	  if (!NILP (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii)))
	    {
	      long_to_string (buf, XINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (ii)));
	      write_c_string (buf, printcharfun);
	    }
	  else
	    write_c_string ("??", printcharfun);
	  write_c_string (",", printcharfun);
	  if (!NILP (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii)))
	    {
	      long_to_string (buf, XINT (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (ii)));
	      write_c_string (buf, printcharfun);
	    }
	  else
	    write_c_string ("??", printcharfun);
	}
      if (!NILP (IMAGE_INSTANCE_PIXMAP_FG (ii)) ||
	  !NILP (IMAGE_INSTANCE_PIXMAP_BG (ii)))
	{
	  write_c_string (" (", printcharfun);
	  if (!NILP (IMAGE_INSTANCE_PIXMAP_FG (ii)))
	    {
	      print_internal
		(XCOLOR_INSTANCE
		 (IMAGE_INSTANCE_PIXMAP_FG (ii))->name, printcharfun, 0);
	    }
	  write_c_string ("/", printcharfun);
	  if (!NILP (IMAGE_INSTANCE_PIXMAP_BG (ii)))
	    {
	      print_internal
		(XCOLOR_INSTANCE
		 (IMAGE_INSTANCE_PIXMAP_BG (ii))->name, printcharfun, 0);
	    }
	  write_c_string (")", printcharfun);
	}
      break;

    case IMAGE_SUBWINDOW:
      /* #### implement me */
      break;

    default:
      abort ();
    }

  MAYBE_DEVMETH (XDEVICE (ii->device), print_image_instance,
		 (ii, printcharfun, escapeflag));
  sprintf (buf, " 0x%x>", ii->header.uid);
  write_c_string (buf, printcharfun);
}

static void
finalize_image_instance (void *header, int for_disksave)
{
  struct Lisp_Image_Instance *i = (struct Lisp_Image_Instance *) header;

  if (IMAGE_INSTANCE_TYPE (i) == IMAGE_NOTHING)
    /* objects like this exist at dump time, so don't bomb out. */
    return;
  if (for_disksave) finalose (i);

  MAYBE_DEVMETH (XDEVICE (i->device), finalize_image_instance, (i));
}

static int
image_instance_equal (Lisp_Object o1, Lisp_Object o2, int depth)
{
  struct Lisp_Image_Instance *i1 = XIMAGE_INSTANCE (o1);
  struct Lisp_Image_Instance *i2 = XIMAGE_INSTANCE (o2);
  struct device *d1 = XDEVICE (i1->device);
  struct device *d2 = XDEVICE (i2->device);

  if (d1 != d2)
    return 0;
  if (IMAGE_INSTANCE_TYPE (i1) != IMAGE_INSTANCE_TYPE (i2))
    return 0;
  if (!internal_equal (IMAGE_INSTANCE_NAME (i1), IMAGE_INSTANCE_NAME (i2),
		       depth + 1))
    return 0;

  switch (IMAGE_INSTANCE_TYPE (i1))
    {
    case IMAGE_NOTHING:
      break;

    case IMAGE_TEXT:
      if (!internal_equal (IMAGE_INSTANCE_TEXT_STRING (i1),
			   IMAGE_INSTANCE_TEXT_STRING (i2),
			   depth + 1))
	return 0;
      break;

    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      if (!(IMAGE_INSTANCE_PIXMAP_WIDTH (i1) ==
	    IMAGE_INSTANCE_PIXMAP_WIDTH (i2) &&
	    IMAGE_INSTANCE_PIXMAP_HEIGHT (i1) ==
	    IMAGE_INSTANCE_PIXMAP_HEIGHT (i2) &&
	    IMAGE_INSTANCE_PIXMAP_DEPTH (i1) ==
	    IMAGE_INSTANCE_PIXMAP_DEPTH (i2) &&
	    EQ (IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (i1),
		IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (i2)) &&
	    EQ (IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (i1),
		IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (i2)) &&
	    internal_equal (IMAGE_INSTANCE_PIXMAP_FILENAME (i1),
			    IMAGE_INSTANCE_PIXMAP_FILENAME (i2),
			    depth + 1) &&
	    internal_equal (IMAGE_INSTANCE_PIXMAP_MASK_FILENAME (i1),
			    IMAGE_INSTANCE_PIXMAP_MASK_FILENAME (i2),
			    depth + 1)))
	return 0;
      break;

    case IMAGE_SUBWINDOW:
      /* #### implement me */
      break;

    default:
      abort ();
    }

  return DEVMETH_OR_GIVEN (d1, image_instance_equal, (i1, i2, depth), 1);
}

static unsigned long
image_instance_hash (Lisp_Object obj, int depth)
{
  struct Lisp_Image_Instance *i = XIMAGE_INSTANCE (obj);
  struct device *d = XDEVICE (i->device);
  unsigned long hash = (unsigned long) d;

  switch (IMAGE_INSTANCE_TYPE (i))
    {
    case IMAGE_NOTHING:
      break;

    case IMAGE_TEXT:
      hash = HASH2 (hash, internal_hash (IMAGE_INSTANCE_TEXT_STRING (i),
					 depth + 1));
      break;

    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      hash = HASH5 (hash, IMAGE_INSTANCE_PIXMAP_WIDTH (i),
		    IMAGE_INSTANCE_PIXMAP_HEIGHT (i),
		    IMAGE_INSTANCE_PIXMAP_DEPTH (i),
		    internal_hash (IMAGE_INSTANCE_PIXMAP_FILENAME (i),
				   depth + 1));
      break;

    case IMAGE_SUBWINDOW:
      /* #### implement me */
      break;

    default:
      abort ();
    }

  return HASH2 (hash, DEVMETH_OR_GIVEN (d, image_instance_hash, (i, depth),
					0));
}

DEFINE_LRECORD_IMPLEMENTATION ("image-instance", image_instance,
			       mark_image_instance, print_image_instance,
			       finalize_image_instance, image_instance_equal,
			       image_instance_hash,
			       struct Lisp_Image_Instance);

static Lisp_Object
allocate_image_instance (Lisp_Object device)
{
  struct Lisp_Image_Instance *lp =
    alloc_lcrecord_type (struct Lisp_Image_Instance, lrecord_image_instance);
  Lisp_Object val;

  zero_lcrecord (lp);
  lp->device = device;
  lp->type = IMAGE_NOTHING;
  lp->name = Qnil;
  XSETIMAGE_INSTANCE (val, lp);
  return val;
}

static enum image_instance_type
decode_image_instance_type (Lisp_Object type, Error_behavior errb)
{
  if (ERRB_EQ (errb, ERROR_ME))
    CHECK_SYMBOL (type);

  if (EQ (type, Qnothing))      return IMAGE_NOTHING;
  if (EQ (type, Qtext))         return IMAGE_TEXT;
  if (EQ (type, Qmono_pixmap))  return IMAGE_MONO_PIXMAP;
  if (EQ (type, Qcolor_pixmap)) return IMAGE_COLOR_PIXMAP;
  if (EQ (type, Qpointer))      return IMAGE_POINTER;
  if (EQ (type, Qsubwindow))    return IMAGE_SUBWINDOW;

  maybe_signal_simple_error ("Invalid image-instance type", type,
			     Qimage, errb);

  return IMAGE_UNKNOWN; /* not reached */
}

static Lisp_Object
encode_image_instance_type (enum image_instance_type type)
{
  switch (type)
    {
    case IMAGE_NOTHING:      return Qnothing;
    case IMAGE_TEXT:         return Qtext;
    case IMAGE_MONO_PIXMAP:  return Qmono_pixmap;
    case IMAGE_COLOR_PIXMAP: return Qcolor_pixmap;
    case IMAGE_POINTER:      return Qpointer;
    case IMAGE_SUBWINDOW:    return Qsubwindow;
    default:
      abort ();
    }

  return Qnil; /* not reached */
}

static int
image_instance_type_to_mask (enum image_instance_type type)
{
  /* This depends on the fact that enums are assigned consecutive
     integers starting at 0. (Remember that IMAGE_UNKNOWN is the
     first enum.) I'm fairly sure this behavior in ANSI-mandated,
     so there should be no portability problems here. */
  return (1 << ((int) (type) - 1));
}

static int
decode_image_instance_type_list (Lisp_Object list)
{
  Lisp_Object rest;
  int mask = 0;

  if (NILP (list))
    return ~0;

  if (!CONSP (list))
    {
      enum image_instance_type type =
	decode_image_instance_type (list, ERROR_ME);
      return image_instance_type_to_mask (type);
    }

  EXTERNAL_LIST_LOOP (rest, list)
    {
      enum image_instance_type type =
	decode_image_instance_type (XCAR (rest), ERROR_ME);
      mask |= image_instance_type_to_mask (type);
    }

  return mask;
}

static Lisp_Object
encode_image_instance_type_list (int mask)
{
  int count = 0;
  Lisp_Object result = Qnil;

  while (mask)
    {
      count++;
      if (mask & 1)
	result = Fcons (encode_image_instance_type
			((enum image_instance_type) count), result);
      mask >>= 1;
    }

  return Fnreverse (result);
}

DOESNT_RETURN
incompatible_image_types (Lisp_Object instantiator, int given_dest_mask,
			  int desired_dest_mask)
{
  signal_error
    (Qerror,
     list2
     (emacs_doprnt_string_lisp_2
      ((CONST Bufbyte *)
       "No compatible image-instance types given: wanted one of %s, got %s",
       Qnil, -1, 2,
       encode_image_instance_type_list (desired_dest_mask),
       encode_image_instance_type_list (given_dest_mask)),
      instantiator));
}

static int
valid_image_instance_type_p (Lisp_Object type)
{
  return !NILP (memq_no_quit (type, Vimage_instance_type_list));
}

DEFUN ("valid-image-instance-type-p", Fvalid_image_instance_type_p, 1, 1, 0, /*
Given an IMAGE-INSTANCE-TYPE, return non-nil if it is valid.
Valid types are some subset of 'nothing, 'text, 'mono-pixmap, 'color-pixmap,
'pointer, and 'subwindow, depending on how XEmacs was compiled.
*/
       (image_instance_type))
{
  return valid_image_instance_type_p (image_instance_type) ? Qt : Qnil;
}

DEFUN ("image-instance-type-list", Fimage_instance_type_list, 0, 0, 0, /*
Return a list of valid image-instance types.
*/
       ())
{
  return Fcopy_sequence (Vimage_instance_type_list);
}

Error_behavior
decode_error_behavior_flag (Lisp_Object no_error)
{
  if (NILP (no_error))        return ERROR_ME;
  else if (EQ (no_error, Qt)) return ERROR_ME_NOT;
  else                        return ERROR_ME_WARN;
}

Lisp_Object
encode_error_behavior_flag (Error_behavior errb)
{
  if (ERRB_EQ (errb, ERROR_ME))
    return Qnil;
  else if (ERRB_EQ (errb, ERROR_ME_NOT))
    return Qt;
  else
    {
      assert (ERRB_EQ (errb, ERROR_ME_WARN));
      return Qwarning;
    }
}

static Lisp_Object
make_image_instance_1 (Lisp_Object data, Lisp_Object device,
		       Lisp_Object dest_types)
{
  Lisp_Object ii;
  struct gcpro gcpro1;
  int dest_mask;

  XSETDEVICE (device, decode_device (device));
  /* instantiate_image_instantiator() will abort if given an
     image instance ... */
  if (IMAGE_INSTANCEP (data))
    signal_simple_error ("image instances not allowed here", data);
  image_validate (data);
  dest_mask = decode_image_instance_type_list (dest_types);
  data = normalize_image_instantiator (data, DEVICE_TYPE (XDEVICE (device)),
				       make_int (dest_mask));
  GCPRO1 (data);
  if (VECTORP (data) && EQ (XVECTOR_DATA (data)[0], Qinherit))
    signal_simple_error ("inheritance not allowed here", data);
  ii = instantiate_image_instantiator (device, device, data,
				       Qnil, Qnil, dest_mask);
  RETURN_UNGCPRO (ii);
}

DEFUN ("make-image-instance", Fmake_image_instance, 1, 4, 0, /*
Return a new `image-instance' object.

Image-instance objects encapsulate the way a particular image (pixmap,
etc.) is displayed on a particular device.  In most circumstances, you
do not need to directly create image instances; use a glyph instead.
However, it may occasionally be useful to explicitly create image
instances, if you want more control over the instantiation process.

DATA is an image instantiator, which describes the image; see
`image-specifier-p' for a description of the allowed values.

DEST-TYPES should be a list of allowed image instance types that can
be generated.  The recognized image instance types are

'nothing
  Nothing is displayed.
'text
  Displayed as text.  The foreground and background colors and the
  font of the text are specified independent of the pixmap.  Typically
  these attributes will come from the face of the surrounding text,
  unless a face is specified for the glyph in which the image appears.
'mono-pixmap
  Displayed as a mono pixmap (a pixmap with only two colors where the
  foreground and background can be specified independent of the pixmap;
  typically the pixmap assumes the foreground and background colors of
  the text around it, unless a face is specified for the glyph in which
  the image appears).
'color-pixmap
  Displayed as a color pixmap.
'pointer
  Used as the mouse pointer for a window.
'subwindow
  A child window that is treated as an image.  This allows (e.g.)
  another program to be responsible for drawing into the window.
  Not currently implemented.

The DEST-TYPES list is unordered.  If multiple destination types
are possible for a given instantiator, the "most natural" type
for the instantiator's format is chosen. (For XBM, the most natural
types are `mono-pixmap', followed by `color-pixmap', followed by
`pointer'.  For the other normal image formats, the most natural
types are `color-pixmap', followed by `mono-pixmap', followed by
`pointer'.  For the string and formatted-string formats, the most
natural types are `text', followed by `mono-pixmap' (not currently
implemented), followed by `color-pixmap' (not currently implemented).
The other formats can only be instantiated as one type. (If you
want to control more specifically the order of the types into which
an image is instantiated, just call `make-image-instance' repeatedly
until it succeeds, passing less and less preferred destination types
each time.

If DEST-TYPES is omitted, all possible types are allowed.

NO-ERROR controls what happens when the image cannot be generated.
If nil, an error message is generated.  If t, no messages are
generated and this function returns nil.  If anything else, a warning
message is generated and this function returns nil.
*/
       (data, device, dest_types, no_error))
{
  Error_behavior errb = decode_error_behavior_flag (no_error);

  return call_with_suspended_errors ((lisp_fn_t) make_image_instance_1,
				     Qnil, Qimage, errb,
				     3, data, device, dest_types);
}

DEFUN ("image-instance-p", Fimage_instance_p, 1, 1, 0, /*
Return non-nil if OBJECT is an image instance.
*/
       (object))
{
  return IMAGE_INSTANCEP (object) ? Qt : Qnil;
}

DEFUN ("image-instance-type", Fimage_instance_type, 1, 1, 0, /*
Return the type of the given image instance.
The return value will be one of 'nothing, 'text, 'mono-pixmap,
'color-pixmap, 'pointer, or 'subwindow.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);
  return encode_image_instance_type (XIMAGE_INSTANCE_TYPE (image_instance));
}

DEFUN ("image-instance-name", Fimage_instance_name, 1, 1, 0, /*
Return the name of the given image instance.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);
  return XIMAGE_INSTANCE_NAME (image_instance);
}

DEFUN ("image-instance-string", Fimage_instance_string, 1, 1, 0, /*
Return the string of the given image instance.
This will only be non-nil for text image instances.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);
  if (XIMAGE_INSTANCE_TYPE (image_instance) == IMAGE_TEXT)
    return XIMAGE_INSTANCE_TEXT_STRING (image_instance);
  else
    return Qnil;
}

DEFUN ("image-instance-file-name", Fimage_instance_file_name, 1, 1, 0, /*
Return the file name from which IMAGE-INSTANCE was read, if known.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_FILENAME (image_instance);

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-mask-file-name", Fimage_instance_mask_file_name, 1, 1, 0, /*
Return the file name from which IMAGE-INSTANCE's mask was read, if known.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_MASK_FILENAME (image_instance);

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-depth", Fimage_instance_depth, 1, 1, 0, /*
Return the depth of the image instance.
This is 0 for a bitmap, or a positive integer for a pixmap.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return make_int (XIMAGE_INSTANCE_PIXMAP_DEPTH (image_instance));

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-height", Fimage_instance_height, 1, 1, 0, /*
Return the height of the image instance, in pixels.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return make_int (XIMAGE_INSTANCE_PIXMAP_HEIGHT (image_instance));

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-width", Fimage_instance_width, 1, 1, 0, /*
Return the width of the image instance, in pixels.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return make_int (XIMAGE_INSTANCE_PIXMAP_WIDTH (image_instance));

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-hotspot-x", Fimage_instance_hotspot_x, 1, 1, 0, /*
Return the X coordinate of the image instance's hotspot, if known.
This is a point relative to the origin of the pixmap.  When an image is
 used as a mouse pointer, the hotspot is the point on the image that sits
 over the location that the pointer points to.  This is, for example, the
 tip of the arrow or the center of the crosshairs.
This will always be nil for a non-pointer image instance.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_HOTSPOT_X (image_instance);

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-hotspot-y", Fimage_instance_hotspot_y, 1, 1, 0, /*
Return the Y coordinate of the image instance's hotspot, if known.
This is a point relative to the origin of the pixmap.  When an image is
 used as a mouse pointer, the hotspot is the point on the image that sits
 over the location that the pointer points to.  This is, for example, the
 tip of the arrow or the center of the crosshairs.
This will always be nil for a non-pointer image instance.
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (image_instance);

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-foreground", Fimage_instance_foreground, 1, 1, 0, /*
Return the foreground color of IMAGE-INSTANCE, if applicable.
This will be a color instance or nil. (It will only be non-nil for
colorized mono pixmaps and for pointers.)
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_FG (image_instance);

    default:
      return Qnil;
    }
}

DEFUN ("image-instance-background", Fimage_instance_background, 1, 1, 0, /*
Return the background color of IMAGE-INSTANCE, if applicable.
This will be a color instance or nil. (It will only be non-nil for
colorized mono pixmaps and for pointers.)
*/
       (image_instance))
{
  CHECK_IMAGE_INSTANCE (image_instance);

  switch (XIMAGE_INSTANCE_TYPE (image_instance))
    {
    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_BG (image_instance);

    default:
      return Qnil;
    }
}


DEFUN ("colorize-image-instance", Fcolorize_image_instance, 3, 3, 0, /*
Make the image instance be displayed in the given colors.
This function returns a new image instance that is exactly like the
specified one except that (if possible) the foreground and background
colors and as specified.  Currently, this only does anything if the image
instance is a mono pixmap; otherwise, the same image instance is returned.
*/
       (image_instance, foreground, background))
{
  Lisp_Object new;
  Lisp_Object device;

  CHECK_IMAGE_INSTANCE (image_instance);
  CHECK_COLOR_INSTANCE (foreground);
  CHECK_COLOR_INSTANCE (background);

  device = XIMAGE_INSTANCE_DEVICE (image_instance);
  if (!HAS_DEVMETH_P (XDEVICE (device), colorize_image_instance))
    return image_instance;

  new = allocate_image_instance (device);
  copy_lcrecord (XIMAGE_INSTANCE (new), XIMAGE_INSTANCE (image_instance));
  /* note that if this method returns non-zero, this method MUST
     copy any window-system resources, so that when one image instance is
     freed, the other one is not hosed. */
  if (!DEVMETH (XDEVICE (device), colorize_image_instance, (new, foreground,
							    background)))
    return image_instance;
  return new;
}


/************************************************************************/
/*                              error helpers                           */
/************************************************************************/
DOESNT_RETURN
signal_image_error (CONST char *reason, Lisp_Object frob)
{
  signal_error (Qimage_conversion_error,
		list2 (build_translated_string (reason), frob));
}

DOESNT_RETURN
signal_image_error_2 (CONST char *reason, Lisp_Object frob0, Lisp_Object frob1)
{
  signal_error (Qimage_conversion_error,
		list3 (build_translated_string (reason), frob0, frob1));
}

/****************************************************************************
 *                                  nothing                                 *
 ****************************************************************************/

static int
nothing_possible_dest_types (void)
{
  return IMAGE_NOTHING_MASK;
}

static void
nothing_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		     Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		     int dest_mask, Lisp_Object domain)
{
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);

  if (dest_mask & IMAGE_NOTHING_MASK)
    IMAGE_INSTANCE_TYPE (ii) = IMAGE_NOTHING;
  else
    incompatible_image_types (instantiator, dest_mask, IMAGE_NOTHING_MASK);
}


/****************************************************************************
 *                                  inherit                                 *
 ****************************************************************************/

static void
inherit_validate (Lisp_Object instantiator)
{
  face_must_be_present (instantiator);
}

static Lisp_Object
inherit_normalize (Lisp_Object inst, Lisp_Object console_type)
{
  Lisp_Object face;

  assert (XVECTOR_LENGTH (inst) == 3);
  face = XVECTOR_DATA (inst)[2];
  if (!FACEP (face))
    inst = vector3 (Qinherit, Q_face, Fget_face (face));
  return inst;
}

static int
inherit_possible_dest_types (void)
{
  return IMAGE_MONO_PIXMAP_MASK;
}

static void
inherit_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		     Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		     int dest_mask, Lisp_Object domain)
{
  /* handled specially in image_instantiate */
  abort ();
}


/****************************************************************************
 *                                  string                                  *
 ****************************************************************************/

static void
string_validate (Lisp_Object instantiator)
{
  data_must_be_present (instantiator);
}

static int
string_possible_dest_types (void)
{
  return IMAGE_TEXT_MASK;
}

/* called from autodetect_instantiate() */
void
string_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		    Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		    int dest_mask, Lisp_Object domain)
{
  Lisp_Object data = find_keyword_in_vector (instantiator, Q_data);
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);

  assert (!NILP (data));
  if (dest_mask & IMAGE_TEXT_MASK)
    {
      IMAGE_INSTANCE_TYPE (ii) = IMAGE_TEXT;
      IMAGE_INSTANCE_TEXT_STRING (ii) = data;
    }
  else
    incompatible_image_types (instantiator, dest_mask, IMAGE_TEXT_MASK);
}


/****************************************************************************
 *                             formatted-string                             *
 ****************************************************************************/

static void
formatted_string_validate (Lisp_Object instantiator)
{
  data_must_be_present (instantiator);
}

static int
formatted_string_possible_dest_types (void)
{
  return IMAGE_TEXT_MASK;
}

static void
formatted_string_instantiate (Lisp_Object image_instance,
			      Lisp_Object instantiator,
			      Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			      int dest_mask, Lisp_Object domain)
{
  Lisp_Object data = find_keyword_in_vector (instantiator, Q_data);
  struct Lisp_Image_Instance *ii = XIMAGE_INSTANCE (image_instance);

  assert (!NILP (data));
  /* #### implement this */
  warn_when_safe (Qunimplemented, Qnotice,
		  "`formatted-string' not yet implemented; assuming `string'");
  if (dest_mask & IMAGE_TEXT_MASK)
    {
      IMAGE_INSTANCE_TYPE (ii) = IMAGE_TEXT;
      IMAGE_INSTANCE_TEXT_STRING (ii) = data;
    }
  else
    incompatible_image_types (instantiator, dest_mask, IMAGE_TEXT_MASK);
}


/************************************************************************/
/*                        pixmap file functions                         */
/************************************************************************/

/* If INSTANTIATOR refers to inline data, return Qnil.
   If INSTANTIATOR refers to data in a file, return the full filename
   if it exists; otherwise, return a cons of (filename).

   FILE_KEYWORD and DATA_KEYWORD are symbols specifying the
   keywords used to look up the file and inline data,
   respectively, in the instantiator.  Normally these would
   be Q_file and Q_data, but might be different for mask data. */

Lisp_Object
potential_pixmap_file_instantiator (Lisp_Object instantiator,
				    Lisp_Object file_keyword,
				    Lisp_Object data_keyword,
				    Lisp_Object console_type)
{
  Lisp_Object file;
  Lisp_Object data;

  assert (VECTORP (instantiator));

  data = find_keyword_in_vector (instantiator, data_keyword);
  file = find_keyword_in_vector (instantiator, file_keyword);

  if (!NILP (file) && NILP (data))
    {
      Lisp_Object retval = MAYBE_LISP_CONTYPE_METH
	(decode_console_type(console_type, ERROR_ME), 
	 locate_pixmap_file, (file));

      if (!NILP (retval))
	return retval;
      else
	return Fcons (file, Qnil); /* should have been file */
    }
  
  return Qnil;
}

Lisp_Object
simple_image_type_normalize (Lisp_Object inst, Lisp_Object console_type,
			     Lisp_Object image_type_tag)
{
  /* This function can call lisp */
  Lisp_Object file = Qnil;
  struct gcpro gcpro1, gcpro2;
  Lisp_Object alist = Qnil;

  GCPRO2 (file, alist);

  /* Now, convert any file data into inline data.  At the end of this,
     `data' will contain the inline data (if any) or Qnil, and `file'
     will contain the name this data was derived from (if known) or
     Qnil.

     Note that if we cannot generate any regular inline data, we
     skip out. */

  file = potential_pixmap_file_instantiator (inst, Q_file, Q_data, 
					     console_type);

  if (CONSP (file)) /* failure locating filename */
    signal_double_file_error ("Opening pixmap file",
			      "no such file or directory",
			      Fcar (file));

  if (NILP (file)) /* no conversion necessary */
    RETURN_UNGCPRO (inst);

  alist = tagged_vector_to_alist (inst);

  {
    Lisp_Object data = make_string_from_file (file);
    alist = remassq_no_quit (Q_file, alist);
    /* there can't be a :data at this point. */
    alist = Fcons (Fcons (Q_file, file),
		   Fcons (Fcons (Q_data, data), alist));
  }

  {
    Lisp_Object result = alist_to_tagged_vector (image_type_tag, alist);
    free_alist (alist);
    RETURN_UNGCPRO (result);
  }
}


#ifdef HAVE_WINDOW_SYSTEM
/**********************************************************************
 *                             XBM                                    *
 **********************************************************************/

/* Check if DATA represents a valid inline XBM spec (i.e. a list
   of (width height bits), with checking done on the dimensions).
   If not, signal an error. */

static void
check_valid_xbm_inline (Lisp_Object data)
{
  Lisp_Object width, height, bits;

  if (!CONSP (data) ||
      !CONSP (XCDR (data)) ||
      !CONSP (XCDR (XCDR (data))) ||
      !NILP (XCDR (XCDR (XCDR (data)))))
    signal_simple_error ("Must be list of 3 elements", data);

  width  = XCAR (data);
  height = XCAR (XCDR (data));
  bits   = XCAR (XCDR (XCDR (data)));

  CHECK_STRING (bits);

  if (!NATNUMP (width))
    signal_simple_error ("Width must be a natural number", width);

  if (!NATNUMP (height))
    signal_simple_error ("Height must be a natural number", height);

  if (((XINT (width) * XINT (height)) / 8) > XSTRING_CHAR_LENGTH (bits))
    signal_simple_error ("data is too short for width and height",
			 vector3 (width, height, bits));
}

/* Validate method for XBM's. */

static void
xbm_validate (Lisp_Object instantiator)
{
  file_or_data_must_be_present (instantiator);
}

/* Given a filename that is supposed to contain XBM data, return
   the inline representation of it as (width height bits).  Return
   the hotspot through XHOT and YHOT, if those pointers are not 0.
   If there is no hotspot, XHOT and YHOT will contain -1.

   If the function fails:

   -- if OK_IF_DATA_INVALID is set and the data was invalid,
      return Qt.
   -- maybe return an error, or return Qnil.
 */

#ifndef HAVE_X_WINDOWS
#define XFree(data) free(data)
#endif

Lisp_Object
bitmap_to_lisp_data (Lisp_Object name, int *xhot, int *yhot,
		     int ok_if_data_invalid)
{
  unsigned int w, h;
  Extbyte *data;
  int result;
  CONST char *filename_ext;

  GET_C_STRING_FILENAME_DATA_ALLOCA (name, filename_ext);
  result = read_bitmap_data_from_file (filename_ext, &w, &h, 
				       &data, xhot, yhot);

  if (result == BitmapSuccess)
    {
      Lisp_Object retval;
      int len = (w + 7) / 8 * h;

      retval = list3 (make_int (w), make_int (h),
		      make_ext_string (data, len, FORMAT_BINARY));
      XFree ((char *) data);
      return retval;
    }

  switch (result)
    {
    case BitmapOpenFailed:
      {
	/* should never happen */
	signal_double_file_error ("Opening bitmap file",
				  "no such file or directory",
				  name);
      }
    case BitmapFileInvalid:
      {
	if (ok_if_data_invalid)
	  return Qt;
	signal_double_file_error ("Reading bitmap file",
				  "invalid data in file",
				  name);
      }
    case BitmapNoMemory:
      {
	signal_double_file_error ("Reading bitmap file",
				  "out of memory",
				  name);
      }
    default:
      {
	signal_double_file_error_2 ("Reading bitmap file",
				    "unknown error code",
				    make_int (result), name);
      }
    }

  return Qnil; /* not reached */
}

Lisp_Object
xbm_mask_file_munging (Lisp_Object alist, Lisp_Object file,
		       Lisp_Object mask_file, Lisp_Object console_type)
{
  /* This is unclean but it's fairly standard -- a number of the
     bitmaps in /usr/include/X11/bitmaps use it -- so we support
     it. */
  if (NILP (mask_file)
      /* don't override explicitly specified mask data. */
      && NILP (assq_no_quit (Q_mask_data, alist))
      && !NILP (file))
    {
      mask_file = MAYBE_LISP_CONTYPE_METH
	(decode_console_type(console_type, ERROR_ME), 
	 locate_pixmap_file, (concat2 (file, build_string ("Mask"))));
      if (NILP (mask_file))
	mask_file = MAYBE_LISP_CONTYPE_METH
	  (decode_console_type(console_type, ERROR_ME), 
	   locate_pixmap_file, (concat2 (file, build_string ("msk"))));
    }

  if (!NILP (mask_file))
    {
      Lisp_Object mask_data =
	bitmap_to_lisp_data (mask_file, 0, 0, 0);
      alist = remassq_no_quit (Q_mask_file, alist);
      /* there can't be a :mask-data at this point. */
      alist = Fcons (Fcons (Q_mask_file, mask_file),
		     Fcons (Fcons (Q_mask_data, mask_data), alist));
    }

  return alist;
}

/* Normalize method for XBM's. */

static Lisp_Object
xbm_normalize (Lisp_Object inst, Lisp_Object console_type)
{
  Lisp_Object file = Qnil, mask_file = Qnil;
  struct gcpro gcpro1, gcpro2, gcpro3;
  Lisp_Object alist = Qnil;

  GCPRO3 (file, mask_file, alist);

  /* Now, convert any file data into inline data for both the regular
     data and the mask data.  At the end of this, `data' will contain
     the inline data (if any) or Qnil, and `file' will contain
     the name this data was derived from (if known) or Qnil.
     Likewise for `mask_file' and `mask_data'.

     Note that if we cannot generate any regular inline data, we
     skip out. */

  file = potential_pixmap_file_instantiator (inst, Q_file, Q_data,
					     console_type);
  mask_file = potential_pixmap_file_instantiator (inst, Q_mask_file,
						  Q_mask_data, console_type);

  if (CONSP (file)) /* failure locating filename */
    signal_double_file_error ("Opening bitmap file",
			      "no such file or directory",
			      Fcar (file));

  if (NILP (file) && NILP (mask_file)) /* no conversion necessary */
    RETURN_UNGCPRO (inst);

  alist = tagged_vector_to_alist (inst);

  if (!NILP (file))
    {
      int xhot, yhot;
      Lisp_Object data = bitmap_to_lisp_data (file, &xhot, &yhot, 0);
      alist = remassq_no_quit (Q_file, alist);
      /* there can't be a :data at this point. */
      alist = Fcons (Fcons (Q_file, file),
		     Fcons (Fcons (Q_data, data), alist));

      if (xhot != -1 && NILP (assq_no_quit (Q_hotspot_x, alist)))
	alist = Fcons (Fcons (Q_hotspot_x, make_int (xhot)),
		       alist);
      if (yhot != -1 && NILP (assq_no_quit (Q_hotspot_y, alist)))
	alist = Fcons (Fcons (Q_hotspot_y, make_int (yhot)),
		       alist);
    }

  alist = xbm_mask_file_munging (alist, file, mask_file, console_type);

  {
    Lisp_Object result = alist_to_tagged_vector (Qxbm, alist);
    free_alist (alist);
    RETURN_UNGCPRO (result);
  }
}


static int
xbm_possible_dest_types (void)
{
  return
    IMAGE_MONO_PIXMAP_MASK  |
    IMAGE_COLOR_PIXMAP_MASK |
    IMAGE_POINTER_MASK;
}

static void
xbm_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		 int dest_mask, Lisp_Object domain)
{
  Lisp_Object device= IMAGE_INSTANCE_DEVICE (XIMAGE_INSTANCE (image_instance));

  MAYBE_DEVMETH (XDEVICE (device), 
		 xbm_instantiate,
		 (image_instance, instantiator, pointer_fg, 
		  pointer_bg, dest_mask, domain));
}

#endif


#ifdef HAVE_XPM

/**********************************************************************
 *                             XPM                                    *
 **********************************************************************/

Lisp_Object
pixmap_to_lisp_data (Lisp_Object name, int ok_if_data_invalid)
{
  char **data;
  int result;

  result = XpmReadFileToData ((char *) XSTRING_DATA (name), &data);

  if (result == XpmSuccess)
    {
      Lisp_Object retval = Qnil;
      struct buffer *old_buffer = current_buffer;
      Lisp_Object temp_buffer =
	Fget_buffer_create (build_string (" *pixmap conversion*"));
      int elt;
      int height, width, ncolors;
      struct gcpro gcpro1, gcpro2, gcpro3;
      int speccount = specpdl_depth ();

      GCPRO3 (name, retval, temp_buffer);

      specbind (Qinhibit_quit, Qt);
      set_buffer_internal (XBUFFER (temp_buffer));
      Ferase_buffer (Qnil);

      buffer_insert_c_string (current_buffer, "/* XPM */\r");
      buffer_insert_c_string (current_buffer, "static char *pixmap[] = {\r");

      sscanf (data[0], "%d %d %d", &height, &width, &ncolors);
      for (elt = 0; elt <= width + ncolors; elt++)
	{
	  buffer_insert_c_string (current_buffer, "\"");
	  buffer_insert_c_string (current_buffer, data[elt]);

	  if (elt < width + ncolors)
	    buffer_insert_c_string (current_buffer, "\",\r");
	  else
	    buffer_insert_c_string (current_buffer, "\"};\r");
	}

      retval = Fbuffer_substring (Qnil, Qnil, Qnil);
      XpmFree (data);

      set_buffer_internal (old_buffer);
      unbind_to (speccount, Qnil);

      RETURN_UNGCPRO (retval);
    }

  switch (result)
    {
    case XpmFileInvalid:
      {
	if (ok_if_data_invalid)
	  return Qt;
	signal_image_error ("invalid XPM data in file", name);
      }
    case XpmNoMemory:
      {
	signal_double_file_error ("Reading pixmap file",
				  "out of memory", name);
      }
    case XpmOpenFailed:
      {
	/* should never happen? */
	signal_double_file_error ("Opening pixmap file",
				  "no such file or directory", name);
      }
    default:
      {
	signal_double_file_error_2 ("Parsing pixmap file",
				    "unknown error code",
				    make_int (result), name);
	break;
      }
    }

  return Qnil; /* not reached */
}

static void
check_valid_xpm_color_symbols (Lisp_Object data)
{
  Lisp_Object rest;

  for (rest = data; !NILP (rest); rest = XCDR (rest))
    {
      if (!CONSP (rest) ||
	  !CONSP (XCAR (rest)) ||
	  !STRINGP (XCAR (XCAR (rest))) ||
	  (!STRINGP (XCDR (XCAR (rest))) &&
	   !COLOR_SPECIFIERP (XCDR (XCAR (rest)))))
	signal_simple_error ("Invalid color symbol alist", data);
    }
}

static void
xpm_validate (Lisp_Object instantiator)
{
  file_or_data_must_be_present (instantiator);
}

Lisp_Object Vxpm_color_symbols;

Lisp_Object
evaluate_xpm_color_symbols (void)
{
  Lisp_Object rest, results = Qnil;
  struct gcpro gcpro1, gcpro2;

  GCPRO2 (rest, results);
  for (rest = Vxpm_color_symbols; !NILP (rest); rest = XCDR (rest))
    {
      Lisp_Object name, value, cons;

      CHECK_CONS (rest);
      cons = XCAR (rest);
      CHECK_CONS (cons);
      name = XCAR (cons);
      CHECK_STRING (name);
      value = XCDR (cons);
      CHECK_CONS (value);
      value = XCAR (value);
      value = Feval (value);
      if (NILP (value))
	continue;
      if (!STRINGP (value) && !COLOR_SPECIFIERP (value))
	signal_simple_error
	  ("Result from xpm-color-symbols eval must be nil, string, or color",
	   value);
      results = Fcons (Fcons (name, value), results);
    }
  UNGCPRO;			/* no more evaluation */
  return results;
}

static Lisp_Object
xpm_normalize (Lisp_Object inst, Lisp_Object console_type)
{
  Lisp_Object file = Qnil;
  Lisp_Object color_symbols;
  struct gcpro gcpro1, gcpro2;
  Lisp_Object alist = Qnil;

  GCPRO2 (file, alist);

  /* Now, convert any file data into inline data.  At the end of this,
     `data' will contain the inline data (if any) or Qnil, and
     `file' will contain the name this data was derived from (if
     known) or Qnil.

     Note that if we cannot generate any regular inline data, we
     skip out. */

  file = potential_pixmap_file_instantiator (inst, Q_file, Q_data, 
					     console_type);

  if (CONSP (file)) /* failure locating filename */
    signal_double_file_error ("Opening pixmap file",
			      "no such file or directory",
			      Fcar (file));

  color_symbols = find_keyword_in_vector_or_given (inst, Q_color_symbols,
						   Qunbound);

  if (NILP (file) && !UNBOUNDP (color_symbols))
    /* no conversion necessary */
    RETURN_UNGCPRO (inst);
  
  alist = tagged_vector_to_alist (inst);

  if (!NILP (file))
    {
      Lisp_Object data = pixmap_to_lisp_data (file, 0);
      alist = remassq_no_quit (Q_file, alist);
      /* there can't be a :data at this point. */
      alist = Fcons (Fcons (Q_file, file),
		     Fcons (Fcons (Q_data, data), alist));
    }
  
  if (UNBOUNDP (color_symbols))
    {
      color_symbols = evaluate_xpm_color_symbols ();
      alist = Fcons (Fcons (Q_color_symbols, color_symbols),
		     alist);
    }

  {
    Lisp_Object result = alist_to_tagged_vector (Qxpm, alist);
    free_alist (alist);
    RETURN_UNGCPRO (result);
  }
}

static int
xpm_possible_dest_types (void)
{
  return
    IMAGE_MONO_PIXMAP_MASK  |
    IMAGE_COLOR_PIXMAP_MASK |
    IMAGE_POINTER_MASK;
}

static void
xpm_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
		 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
		 int dest_mask, Lisp_Object domain)
{
  Lisp_Object device= IMAGE_INSTANCE_DEVICE (XIMAGE_INSTANCE (image_instance));

  MAYBE_DEVMETH (XDEVICE (device), 
		 xpm_instantiate,
		 (image_instance, instantiator, pointer_fg, 
		  pointer_bg, dest_mask, domain));
}

#endif /* HAVE_XPM */


/****************************************************************************
 *                         Image Specifier Object                           *
 ****************************************************************************/

DEFINE_SPECIFIER_TYPE (image);

static void
image_create (Lisp_Object obj)
{
  struct Lisp_Specifier *image = XIMAGE_SPECIFIER (obj);

  IMAGE_SPECIFIER_ALLOWED (image) = ~0; /* all are allowed */
  IMAGE_SPECIFIER_ATTACHEE (image) = Qnil;
  IMAGE_SPECIFIER_ATTACHEE_PROPERTY (image) = Qnil;
}

static void
image_mark (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_Specifier *image = XIMAGE_SPECIFIER (obj);

  ((markobj) (IMAGE_SPECIFIER_ATTACHEE (image)));
  ((markobj) (IMAGE_SPECIFIER_ATTACHEE_PROPERTY (image)));
}

static Lisp_Object
image_instantiate_cache_result (Lisp_Object locative)
{
  /* locative = (instance instantiator . subtable) */
  Fputhash (XCAR (XCDR (locative)), XCAR (locative), XCDR (XCDR (locative)));
  free_cons (XCONS (XCDR (locative)));
  free_cons (XCONS (locative));
  return Qnil;
}

/* Given a specification for an image, return an instance of
   the image which matches the given instantiator and which can be
   displayed in the given domain. */

static Lisp_Object
image_instantiate (Lisp_Object specifier, Lisp_Object matchspec,
		   Lisp_Object domain, Lisp_Object instantiator,
		   Lisp_Object depth)
{
  Lisp_Object device = DFW_DEVICE (domain);
  struct device *d = XDEVICE (device);
  int dest_mask = XIMAGE_SPECIFIER_ALLOWED (specifier);
  int pointerp = dest_mask & image_instance_type_to_mask (IMAGE_POINTER);

  if (IMAGE_INSTANCEP (instantiator))
    {
      /* make sure that the image instance's device and type are
	 matching. */

      if (EQ (device, XIMAGE_INSTANCE_DEVICE (instantiator)))
	{
	  int mask =
	    image_instance_type_to_mask (XIMAGE_INSTANCE_TYPE (instantiator));
	  if (mask & dest_mask)
	    return instantiator;
	  else
	    signal_simple_error ("Type of image instance not allowed here",
				 instantiator);
	}
      else
	signal_simple_error_2 ("Wrong device for image instance",
			       instantiator, device);
    }
  else if (VECTORP (instantiator)
	   && EQ (XVECTOR_DATA (instantiator)[0], Qinherit))
    {
      assert (XVECTOR_LENGTH (instantiator) == 3);
      return (FACE_PROPERTY_INSTANCE
	      (Fget_face (XVECTOR_DATA (instantiator)[2]),
	       Qbackground_pixmap, domain, 0, depth));
    }
  else
    {
      Lisp_Object instance;
      Lisp_Object subtable;
      Lisp_Object ls3 = Qnil;
      Lisp_Object pointer_fg = Qnil;
      Lisp_Object pointer_bg = Qnil;

      if (pointerp)
	{
	  pointer_fg = FACE_FOREGROUND (Vpointer_face, domain);
	  pointer_bg = FACE_BACKGROUND (Vpointer_face, domain);
	  ls3 = list3 (instantiator, pointer_fg, pointer_bg);
	}

      /* First look in the hash table. */
      subtable = Fgethash (make_int (dest_mask), d->image_instance_cache,
			   Qunbound);
      if (UNBOUNDP (subtable))
	{
	  /* For the image instance cache, we do comparisons with EQ rather
	     than with EQUAL, as we do for color and font names.
	     The reasons are:

	     1) pixmap data can be very long, and thus the hashing and
	     comparing will take awhile.
	     2) It's not so likely that we'll run into things that are EQUAL
	     but not EQ (that can happen a lot with faces, because their
	     specifiers are copied around); but pixmaps tend not to be
	     in faces.

	     However, if the image-instance could be a pointer, we have to
	     use EQUAL because we massaged the instantiator into a cons3
	     also containing the foreground and background of the
	     pointer face.
	   */

	  subtable = make_lisp_hashtable (20,
					  pointerp ? HASHTABLE_KEY_CAR_WEAK
					  : HASHTABLE_KEY_WEAK,
					  pointerp ? HASHTABLE_EQUAL
					  : HASHTABLE_EQ);
	  Fputhash (make_int (dest_mask), subtable,
		    d->image_instance_cache);
	  instance = Qunbound;
	}
      else
	instance = Fgethash (pointerp ? ls3 : instantiator,
			     subtable, Qunbound);

      if (UNBOUNDP (instance))
	{
	  Lisp_Object locative =
	    noseeum_cons (Qnil,
			  noseeum_cons (pointerp ? ls3 : instantiator,
					subtable));
	  int speccount = specpdl_depth ();

	  /* make sure we cache the failures, too.
	     Use an unwind-protect to catch such errors.
	     If we fail, the unwind-protect records nil in
	     the hash table.  If we succeed, we change the
	     car of the locative to the resulting instance,
	     which gets recorded instead. */
	  record_unwind_protect (image_instantiate_cache_result,
				 locative);
	  instance = instantiate_image_instantiator (device,
						     domain,
						     instantiator,
						     pointer_fg, pointer_bg,
						     dest_mask);
	  Fsetcar (locative, instance);
	  unbind_to (speccount, Qnil);
	}
      else
	free_list (ls3);

      if (NILP (instance))
	signal_simple_error ("Can't instantiate image (probably cached)",
			     instantiator);
      return instance;
    }

  abort ();
  return Qnil; /* not reached */
}

/* Validate an image instantiator. */

static void
image_validate (Lisp_Object instantiator)
{
  if (IMAGE_INSTANCEP (instantiator) || STRINGP (instantiator))
    return;
  else if (VECTORP (instantiator))
    {
      Lisp_Object *elt = XVECTOR_DATA (instantiator);
      int instantiator_len = XVECTOR_LENGTH (instantiator);
      struct image_instantiator_methods *meths;
      Lisp_Object already_seen = Qnil;
      struct gcpro gcpro1;
      int i;

      if (instantiator_len < 1)
	signal_simple_error ("Vector length must be at least 1",
			     instantiator);

      meths = decode_image_instantiator_format (elt[0], ERROR_ME);
      if (!(instantiator_len & 1))
	signal_simple_error
	  ("Must have alternating keyword/value pairs", instantiator);

      GCPRO1 (already_seen);

      for (i = 1; i < instantiator_len; i += 2)
	{
	  Lisp_Object keyword = elt[i];
	  Lisp_Object value = elt[i+1];
	  int j;

	  CHECK_SYMBOL (keyword);
	  if (!SYMBOL_IS_KEYWORD (keyword))
	    signal_simple_error ("Symbol must begin with a colon", keyword);

	  for (j = 0; j < Dynarr_length (meths->keywords); j++)
	    if (EQ (keyword, Dynarr_at (meths->keywords, j).keyword))
	      break;

	  if (j == Dynarr_length (meths->keywords))
	    signal_simple_error ("Unrecognized keyword", keyword);

	  if (!Dynarr_at (meths->keywords, j).multiple_p)
	    {
	      if (!NILP (memq_no_quit (keyword, already_seen)))
		signal_simple_error
		  ("Keyword may not appear more than once", keyword);
	      already_seen = Fcons (keyword, already_seen);
	    }

	  (Dynarr_at (meths->keywords, j).validate) (value);
	}

      UNGCPRO;

      MAYBE_IIFORMAT_METH (meths, validate, (instantiator));
    }
  else
    signal_simple_error ("Must be string or vector", instantiator);
}

static void
image_after_change (Lisp_Object specifier, Lisp_Object locale)
{
  Lisp_Object attachee =
    IMAGE_SPECIFIER_ATTACHEE (XIMAGE_SPECIFIER (specifier));
  Lisp_Object property =
    IMAGE_SPECIFIER_ATTACHEE_PROPERTY (XIMAGE_SPECIFIER (specifier));
  if (FACEP (attachee))
    face_property_was_changed (attachee, property, locale);
  else if (GLYPHP (attachee))
    glyph_property_was_changed (attachee, property, locale);
}

void
set_image_attached_to (Lisp_Object obj, Lisp_Object face_or_glyph,
		       Lisp_Object property)
{
  struct Lisp_Specifier *image = XIMAGE_SPECIFIER (obj);

  IMAGE_SPECIFIER_ATTACHEE (image) = face_or_glyph;
  IMAGE_SPECIFIER_ATTACHEE_PROPERTY (image) = property;
}

static Lisp_Object
image_going_to_add (Lisp_Object specifier, Lisp_Object locale,
		    Lisp_Object tag_set, Lisp_Object instantiator)
{
  Lisp_Object possible_console_types = Qnil;
  Lisp_Object rest;
  Lisp_Object retlist = Qnil;
  struct gcpro gcpro1, gcpro2;

  LIST_LOOP (rest, Vconsole_type_list)
    {
      Lisp_Object contype = XCAR (rest);
      if (!NILP (memq_no_quit (contype, tag_set)))
	possible_console_types = Fcons (contype, possible_console_types);
    }

  if (XINT (Flength (possible_console_types)) > 1)
    /* two conflicting console types specified */
    return Qnil;

  if (NILP (possible_console_types))
    possible_console_types = Vconsole_type_list;

  GCPRO2 (retlist, possible_console_types);

  LIST_LOOP (rest, possible_console_types)
    {
      Lisp_Object contype = XCAR (rest);
      Lisp_Object newinst = call_with_suspended_errors
	((lisp_fn_t) normalize_image_instantiator,
	 Qnil, Qimage, ERROR_ME_NOT, 3, instantiator, contype,
	 make_int (XIMAGE_SPECIFIER_ALLOWED (specifier)));

      if (!NILP (newinst))
	{
	  Lisp_Object newtag;
	  if (NILP (memq_no_quit (contype, tag_set)))
	    newtag = Fcons (contype, tag_set);
	  else
	    newtag = tag_set;
	  retlist = Fcons (Fcons (newtag, newinst), retlist);
	}
    }

  UNGCPRO;

  return retlist;
}

DEFUN ("image-specifier-p", Fimage_specifier_p, 1, 1, 0, /*
Return non-nil if OBJECT is an image specifier.

An image specifier is used for images (pixmaps and the like).  It is used
to describe the actual image in a glyph.  It is instanced as an image-
instance.

Image instantiators come in many formats: `xbm', `xpm', `gif', `jpeg',
etc.  This describes the format of the data describing the image.  The
resulting image instances also come in many types -- `mono-pixmap',
`color-pixmap', `text', `pointer', etc.  This refers to the behavior of
the image and the sorts of places it can appear. (For example, a
color-pixmap image has fixed colors specified for it, while a
mono-pixmap image comes in two unspecified shades "foreground" and
"background" that are determined from the face of the glyph or
surrounding text; a text image appears as a string of text and has an
unspecified foreground, background, and font; a pointer image behaves
like a mono-pixmap image but can only be used as a mouse pointer
\[mono-pixmap images cannot be used as mouse pointers]; etc.) It is
important to keep the distinction between image instantiator format and
image instance type in mind.  Typically, a given image instantiator
format can result in many different image instance types (for example,
`xpm' can be instanced as `color-pixmap', `mono-pixmap', or `pointer';
whereas `cursor-font' can be instanced only as `pointer'), and a
particular image instance type can be generated by many different
image instantiator formats (e.g.  `color-pixmap' can be generated by `xpm',
`gif', `jpeg', etc.).

See `make-image-instance' for a more detailed discussion of image
instance types.

An image instantiator should be a string or a vector of the form

 [FORMAT :KEYWORD VALUE ...]

i.e. a format symbol followed by zero or more alternating keyword-value
pairs.  FORMAT should be one of

'nothing
  (Don't display anything; no keywords are valid for this.
   Can only be instanced as `nothing'.)
'string
  (Display this image as a text string.  Can only be instanced
   as `text', although support for instancing as `mono-pixmap'
   should be added.)
'formatted-string
  (Display this image as a text string, with replaceable fields;
  not currently implemented.)
'xbm
  (An X bitmap; only if X support was compiled into this XEmacs.
   Can be instanced as `mono-pixmap', `color-pixmap', or `pointer'.)
'xpm
  (An XPM pixmap; only if XPM support was compiled into this XEmacs.
   Can be instanced as `color-pixmap', `mono-pixmap', or `pointer'.)
'xface
  (An X-Face bitmap, used to encode people's faces in e-mail messages;
  only if X-Face support was compiled into this XEmacs.  Can be
  instanced as `mono-pixmap', `color-pixmap', or `pointer'.)
'gif
  (A GIF87 or GIF89 image; only if GIF support was compiled into this
   XEmacs.  Can be instanced as `color-pixmap'.)
'jpeg
  (A JPEG image; only if JPEG support was compiled into this XEmacs.
   Can be instanced as `color-pixmap'.)
'png
  (A PNG/GIF24 image; only if PNG support was compiled into this XEmacs.
   Can be instanced as `color-pixmap'.)
'tiff
  (A TIFF image; not currently implemented.)
'cursor-font
  (One of the standard cursor-font names, such as "watch" or
   "right_ptr" under X.  Under X, this is, more specifically, any
   of the standard cursor names from appendix B of the Xlib manual
   [also known as the file <X11/cursorfont.h>] minus the XC_ prefix.
   On other window systems, the valid names will be specific to the
   type of window system.  Can only be instanced as `pointer'.)
'font
  (A glyph from a font; i.e. the name of a font, and glyph index into it
   of the form "FONT fontname index [[mask-font] mask-index]".
   Currently can only be instanced as `pointer', although this should
   probably be fixed.)
'subwindow
  (An embedded X window; not currently implemented.)
'autodetect
  (XEmacs tries to guess what format the data is in.  If X support
  exists, the data string will be checked to see if it names a filename.
  If so, and this filename contains XBM or XPM data, the appropriate
  sort of pixmap or pointer will be created. [This includes picking up
  any specified hotspot or associated mask file.] Otherwise, if `pointer'
  is one of the allowable image-instance types and the string names a
  valid cursor-font name, the image will be created as a pointer.
  Otherwise, the image will be displayed as text.  If no X support
  exists, the image will always be displayed as text.)
'inherit
  Inherit from the background-pixmap property of a face.

The valid keywords are:

:data
  (Inline data.  For most formats above, this should be a string.  For
  XBM images, this should be a list of three elements: width, height, and
  a string of bit data.  This keyword is not valid for instantiator
  formats `nothing' and `inherit'.)
:file
  (Data is contained in a file.  The value is the name of this file.
  If both :data and :file are specified, the image is created from
  what is specified in :data and the string in :file becomes the
  value of the `image-instance-file-name' function when applied to
  the resulting image-instance.  This keyword is not valid for
  instantiator formats `nothing', `string', `formatted-string',
  `cursor-font', `font', `autodetect', and `inherit'.)
:foreground
:background
  (For `xbm', `xface', `cursor-font', and `font'.  These keywords
  allow you to explicitly specify foreground and background colors.
  The argument should be anything acceptable to `make-color-instance'.
  This will cause what would be a `mono-pixmap' to instead be colorized
  as a two-color color-pixmap, and specifies the foreground and/or
  background colors for a pointer instead of black and white.)
:mask-data
  (For `xbm' and `xface'.  This specifies a mask to be used with the
  bitmap.  The format is a list of width, height, and bits, like for
  :data.)
:mask-file
  (For `xbm' and `xface'.  This specifies a file containing the mask data.
  If neither a mask file nor inline mask data is given for an XBM image,
  and the XBM image comes from a file, XEmacs will look for a mask file
  with the same name as the image file but with "Mask" or "msk"
  appended.  For example, if you specify the XBM file "left_ptr"
  [usually located in "/usr/include/X11/bitmaps"], the associated
  mask file "left_ptrmsk" will automatically be picked up.)
:hotspot-x
:hotspot-y
  (For `xbm' and `xface'.  These keywords specify a hotspot if the image
  is instantiated as a `pointer'.  Note that if the XBM image file
  specifies a hotspot, it will automatically be picked up if no
  explicit hotspot is given.)
:color-symbols
  (Only for `xpm'.  This specifies an alist that maps strings
  that specify symbolic color names to the actual color to be used
  for that symbolic color (in the form of a string or a color-specifier
  object).  If this is not specified, the contents of `xpm-color-symbols'
  are used to generate the alist.)
:face
  (Only for `inherit'.  This specifies the face to inherit from.)

If instead of a vector, the instantiator is a string, it will be
converted into a vector by looking it up according to the specs in the
`console-type-image-conversion-list' (q.v.) for the console type of
the domain (usually a window; sometimes a frame or device) over which
the image is being instantiated.

If the instantiator specifies data from a file, the data will be read
in at the time that the instantiator is added to the image (which may
be well before when the image is actually displayed), and the
instantiator will be converted into one of the inline-data forms, with
the filename retained using a :file keyword.  This implies that the
file must exist when the instantiator is added to the image, but does
not need to exist at any other time (e.g. it may safely be a temporary
file).
*/
       (object))
{
  return IMAGE_SPECIFIERP (object) ? Qt : Qnil;
}


/****************************************************************************
 *                             Glyph Object                                 *
 ****************************************************************************/

static Lisp_Object
mark_glyph (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_Glyph *glyph = XGLYPH (obj);

  ((markobj) (glyph->image));
  ((markobj) (glyph->contrib_p));
  ((markobj) (glyph->baseline));
  ((markobj) (glyph->face));

  return glyph->plist;
}

static void
print_glyph (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  struct Lisp_Glyph *glyph = XGLYPH (obj);
  char buf[20];

  if (print_readably)
    error ("printing unreadable object #<glyph 0x%x>", glyph->header.uid);

  write_c_string ("#<glyph (", printcharfun);
  print_internal (Fglyph_type (obj), printcharfun, 0);
  write_c_string (") ", printcharfun);
  print_internal (glyph->image, printcharfun, 1);
  sprintf (buf, "0x%x>", glyph->header.uid);
  write_c_string (buf, printcharfun);
}

/* Glyphs are equal if all of their display attributes are equal.  We
   don't compare names or doc-strings, because that would make equal
   be eq.

   This isn't concerned with "unspecified" attributes, that's what
   #'glyph-differs-from-default-p is for. */
static int
glyph_equal (Lisp_Object o1, Lisp_Object o2, int depth)
{
  struct Lisp_Glyph *g1 = XGLYPH (o1);
  struct Lisp_Glyph *g2 = XGLYPH (o2);

  depth++;

  return (internal_equal (g1->image,     g2->image,     depth) &&
	  internal_equal (g1->contrib_p, g2->contrib_p, depth) &&
	  internal_equal (g1->baseline,  g2->baseline,  depth) &&
	  internal_equal (g1->face,      g2->face,      depth) &&
	  !plists_differ (g1->plist,     g2->plist, 0, 0, depth + 1));
}

static unsigned long
glyph_hash (Lisp_Object obj, int depth)
{
  depth++;

  /* No need to hash all of the elements; that would take too long.
     Just hash the most common ones. */
  return HASH2 (internal_hash (XGLYPH (obj)->image, depth),
		internal_hash (XGLYPH (obj)->face,  depth));
}

static Lisp_Object
glyph_getprop (Lisp_Object obj, Lisp_Object prop)
{
  struct Lisp_Glyph *g = XGLYPH (obj);

  if (EQ (prop, Qimage))     return g->image;
  if (EQ (prop, Qcontrib_p)) return g->contrib_p;
  if (EQ (prop, Qbaseline))  return g->baseline;
  if (EQ (prop, Qface))      return g->face;

  return external_plist_get (&g->plist, prop, 0, ERROR_ME);
}

static int
glyph_putprop (Lisp_Object obj, Lisp_Object prop, Lisp_Object value)
{
  if ((EQ (prop, Qimage))     ||
      (EQ (prop, Qcontrib_p)) ||
      (EQ (prop, Qbaseline)))
    return 0;

  if (EQ (prop, Qface))
    {
      XGLYPH (obj)->face = Fget_face (value);
      return 1;
    }

  external_plist_put (&XGLYPH (obj)->plist, prop, value, 0, ERROR_ME);
  return 1;
}

static int
glyph_remprop (Lisp_Object obj, Lisp_Object prop)
{
  if ((EQ (prop, Qimage))     ||
      (EQ (prop, Qcontrib_p)) ||
      (EQ (prop, Qbaseline)))
    return -1;

  if (EQ (prop, Qface))
    {
      XGLYPH (obj)->face = Qnil;
      return 1;
    }

  return external_remprop (&XGLYPH (obj)->plist, prop, 0, ERROR_ME);
}

static Lisp_Object
glyph_plist (Lisp_Object obj)
{
  struct Lisp_Glyph *glyph = XGLYPH (obj);
  Lisp_Object result = glyph->plist;

  result = cons3 (Qface,      glyph->face,      result);
  result = cons3 (Qbaseline,  glyph->baseline,  result);
  result = cons3 (Qcontrib_p, glyph->contrib_p, result);
  result = cons3 (Qimage,     glyph->image,     result);

  return result;
}

DEFINE_LRECORD_IMPLEMENTATION_WITH_PROPS ("glyph", glyph,
					  mark_glyph, print_glyph, 0,
					  glyph_equal, glyph_hash,
					  glyph_getprop, glyph_putprop,
					  glyph_remprop, glyph_plist,
					  struct Lisp_Glyph);

Lisp_Object
allocate_glyph (enum glyph_type type,
		void (*after_change) (Lisp_Object glyph, Lisp_Object property,
				      Lisp_Object locale))
{
  /* This function can GC */
  Lisp_Object obj = Qnil;
  struct Lisp_Glyph *g =
    alloc_lcrecord_type (struct Lisp_Glyph, lrecord_glyph);

  g->type = type;
  g->image = Fmake_specifier (Qimage); /* This function can GC */
  switch (g->type)
    {
    case GLYPH_BUFFER:
      XIMAGE_SPECIFIER_ALLOWED (g->image) =
	IMAGE_NOTHING_MASK | IMAGE_TEXT_MASK | IMAGE_MONO_PIXMAP_MASK |
	  IMAGE_COLOR_PIXMAP_MASK | IMAGE_SUBWINDOW_MASK;
      break;
    case GLYPH_POINTER:
      XIMAGE_SPECIFIER_ALLOWED (g->image) =
	IMAGE_NOTHING_MASK | IMAGE_POINTER_MASK;
      break;
    case GLYPH_ICON:
      XIMAGE_SPECIFIER_ALLOWED (g->image) =
	IMAGE_NOTHING_MASK | IMAGE_MONO_PIXMAP_MASK | IMAGE_COLOR_PIXMAP_MASK;
      break;
    default:
      abort ();
    }

  /* I think Fmake_specifier can GC.  I think set_specifier_fallback can GC. */
  /* We're getting enough reports of odd behavior in this area it seems */
  /* best to GCPRO everything. */
  {
    Lisp_Object tem1 = list1 (Fcons (Qnil, Vthe_nothing_vector));
    Lisp_Object tem2 = list1 (Fcons (Qnil, Qt));
    Lisp_Object tem3 = list1 (Fcons (Qnil, Qnil));
    struct gcpro gcpro1, gcpro2, gcpro3, gcpro4;

    GCPRO4 (obj, tem1, tem2, tem3);

    set_specifier_fallback (g->image, tem1);
    g->contrib_p = Fmake_specifier (Qboolean);
    set_specifier_fallback (g->contrib_p, tem2);
    /* #### should have a specifier for the following */
    g->baseline = Fmake_specifier (Qgeneric);
    set_specifier_fallback (g->baseline, tem3);
    g->face = Qnil;
    g->plist = Qnil;
    g->after_change = after_change;
    XSETGLYPH (obj, g);

    set_image_attached_to (g->image, obj, Qimage);
    UNGCPRO;
  }

  return obj;
}

static enum glyph_type
decode_glyph_type (Lisp_Object type, Error_behavior errb)
{
  if (NILP (type))
    return GLYPH_BUFFER;

  if (ERRB_EQ (errb, ERROR_ME))
    CHECK_SYMBOL (type);

  if (EQ (type, Qbuffer))  return GLYPH_BUFFER;
  if (EQ (type, Qpointer)) return GLYPH_POINTER;
  if (EQ (type, Qicon))    return GLYPH_ICON;

  maybe_signal_simple_error ("Invalid glyph type", type, Qimage, errb);

  return GLYPH_UNKNOWN;
}

static int
valid_glyph_type_p (Lisp_Object type)
{
  return !NILP (memq_no_quit (type, Vglyph_type_list));
}

DEFUN ("valid-glyph-type-p", Fvalid_glyph_type_p, 1, 1, 0, /*
Given a GLYPH-TYPE, return non-nil if it is valid.
Valid types are `buffer', `pointer', and `icon'.
*/
       (glyph_type))
{
  return valid_glyph_type_p (glyph_type) ? Qt : Qnil;
}

DEFUN ("glyph-type-list", Fglyph_type_list, 0, 0, 0, /*
Return a list of valid glyph types.
*/
       ())
{
  return Fcopy_sequence (Vglyph_type_list);
}

DEFUN ("make-glyph-internal", Fmake_glyph_internal, 0, 1, 0, /*
Create and return a new uninitialized glyph or type TYPE.

TYPE specifies the type of the glyph; this should be one of `buffer',
`pointer', or `icon', and defaults to `buffer'.  The type of the glyph
specifies in which contexts the glyph can be used, and controls the
allowable image types into which the glyph's image can be
instantiated.

`buffer' glyphs can be used as the begin-glyph or end-glyph of an
extent, in the modeline, and in the toolbar.  Their image can be
instantiated as `nothing', `mono-pixmap', `color-pixmap', `text',
and `subwindow'.

`pointer' glyphs can be used to specify the mouse pointer.  Their
image can be instantiated as `pointer'.

`icon' glyphs can be used to specify the icon used when a frame is
iconified.  Their image can be instantiated as `mono-pixmap' and
`color-pixmap'.
*/
       (type))
{
  enum glyph_type typeval = decode_glyph_type (type, ERROR_ME);
  return allocate_glyph (typeval, 0);
}

DEFUN ("glyphp", Fglyphp, 1, 1, 0, /*
Return non-nil if OBJECT is a glyph.

A glyph is an object used for pixmaps and the like.  It is used
in begin-glyphs and end-glyphs attached to extents, in marginal and textual
annotations, in overlay arrows (overlay-arrow-* variables), in toolbar
buttons, and the like.  Its image is described using an image specifier --
see `image-specifier-p'.
*/
       (object))
{
  return GLYPHP (object) ? Qt : Qnil;
}

DEFUN ("glyph-type", Fglyph_type, 1, 1, 0, /*
Return the type of the given glyph.
The return value will be one of 'buffer, 'pointer, or 'icon.
*/
       (glyph))
{
  CHECK_GLYPH (glyph);
  switch (XGLYPH_TYPE (glyph))
    {
    case GLYPH_BUFFER:  return Qbuffer;
    case GLYPH_POINTER: return Qpointer;
    case GLYPH_ICON:    return Qicon;
    default:
      abort ();
      return Qnil; /* not reached */
    }
}

/*****************************************************************************
 glyph_width

 Return the width of the given GLYPH on the given WINDOW.  If the
 instance is a string then the width is calculated using the font of
 the given FACE, unless a face is defined by the glyph itself.
 ****************************************************************************/
unsigned short
glyph_width (Lisp_Object glyph, Lisp_Object frame_face,
	     face_index window_findex, Lisp_Object window)
{
  Lisp_Object instance;
  Lisp_Object frame = XWINDOW (window)->frame;

  /* #### We somehow need to distinguish between the user causing this
     error condition and a bug causing it. */
  if (!GLYPHP (glyph))
    return 0;
  else
    instance = glyph_image_instance (glyph, window, ERROR_ME_NOT, 1);

  if (!IMAGE_INSTANCEP (instance))
    return 0;

  switch (XIMAGE_INSTANCE_TYPE (instance))
    {
    case IMAGE_TEXT:
      {
	Lisp_Object str = XIMAGE_INSTANCE_TEXT_STRING (instance);
        Lisp_Object private_face = XGLYPH_FACE(glyph);

	if (!NILP (private_face))
	  return redisplay_frame_text_width_string (XFRAME (frame),
						    private_face,
						    0, str, 0, -1);
	else
	if (!NILP (frame_face))
	  return redisplay_frame_text_width_string (XFRAME (frame),
						    frame_face,
						    0, str, 0, -1);
	else
	  return redisplay_text_width_string (XWINDOW (window),
					      window_findex,
					      0, str, 0, -1);
      }

    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      return XIMAGE_INSTANCE_PIXMAP_WIDTH (instance);

    case IMAGE_NOTHING:
      return 0;

    case IMAGE_SUBWINDOW:
      /* #### implement me */
      return 0;

    default:
      abort ();
      return 0;
    }
}

DEFUN ("glyph-width", Fglyph_width, 1, 2, 0, /*
Return the width of GLYPH on WINDOW.
This may not be exact as it does not take into account all of the context
that redisplay will.
*/
       (glyph, window))
{
  XSETWINDOW (window, decode_window (window));
  CHECK_GLYPH (glyph);

  return make_int (glyph_width (glyph, Qnil, DEFAULT_INDEX, window));
}

#define RETURN_ASCENT	0
#define RETURN_DESCENT	1
#define RETURN_HEIGHT	2

Lisp_Object
glyph_image_instance (Lisp_Object glyph, Lisp_Object domain,
		      Error_behavior errb, int no_quit)
{
  Lisp_Object specifier = GLYPH_IMAGE (XGLYPH (glyph));

  /* This can never return Qunbound.  All glyphs have 'nothing as
     a fallback. */
  return specifier_instance (specifier, Qunbound, domain, errb, no_quit, 0,
			     Qzero);
}

static unsigned short
glyph_height_internal (Lisp_Object glyph, Lisp_Object frame_face,
		       face_index window_findex, Lisp_Object window,
		       int function)
{
  Lisp_Object instance;
  Lisp_Object frame = XWINDOW (window)->frame;

  if (!GLYPHP (glyph))
    return 0;
  else
    instance = glyph_image_instance (glyph, window, ERROR_ME_NOT, 1);

  if (!IMAGE_INSTANCEP (instance))
    return 0;

  switch (XIMAGE_INSTANCE_TYPE (instance))
    {
    case IMAGE_TEXT:
      {
	struct font_metric_info fm;
	Lisp_Object string = XIMAGE_INSTANCE_TEXT_STRING (instance);
	unsigned char charsets[NUM_LEADING_BYTES];
	struct face_cachel frame_cachel;
	struct face_cachel *cachel;

	find_charsets_in_bufbyte_string (charsets,
					 XSTRING_DATA   (string),
					 XSTRING_LENGTH (string));

	if (!NILP (frame_face))
	  {
	    reset_face_cachel (&frame_cachel);
	    update_face_cachel_data (&frame_cachel, frame, frame_face);
	    cachel = &frame_cachel;
	  }
	else
	  cachel = WINDOW_FACE_CACHEL (XWINDOW (window), window_findex);
	ensure_face_cachel_complete (cachel, window, charsets);

	face_cachel_charset_font_metric_info (cachel, charsets, &fm);

	switch (function)
	  {
	  case RETURN_ASCENT:  return fm.ascent;
	  case RETURN_DESCENT: return fm.descent;
	  case RETURN_HEIGHT:  return fm.ascent + fm.descent;
	  default:
	    abort ();
	    return 0; /* not reached */
	  }
      }

    case IMAGE_MONO_PIXMAP:
    case IMAGE_COLOR_PIXMAP:
    case IMAGE_POINTER:
      /* #### Ugh ugh ugh -- temporary crap */
      if (function == RETURN_ASCENT || function == RETURN_HEIGHT)
	return XIMAGE_INSTANCE_PIXMAP_HEIGHT (instance);
      else
	return 0;

    case IMAGE_NOTHING:
      return 0;

    case IMAGE_SUBWINDOW:
      /* #### implement me */
      return 0;

    default:
      abort ();
      return 0;
    }
}

unsigned short
glyph_ascent (Lisp_Object glyph, Lisp_Object frame_face,
	      face_index window_findex, Lisp_Object window)
{
  return glyph_height_internal (glyph, frame_face, window_findex, window,
				RETURN_ASCENT);
}

unsigned short
glyph_descent (Lisp_Object glyph, Lisp_Object frame_face,
	       face_index window_findex, Lisp_Object window)
{
  return glyph_height_internal (glyph, frame_face, window_findex, window,
				RETURN_DESCENT);
}

/* strictly a convenience function. */
unsigned short
glyph_height (Lisp_Object glyph, Lisp_Object frame_face,
	      face_index window_findex, Lisp_Object window)
{
  return glyph_height_internal (glyph, frame_face, window_findex, window,
				RETURN_HEIGHT);
}

DEFUN ("glyph-ascent", Fglyph_ascent, 1, 2, 0, /*
Return the ascent value of GLYPH on WINDOW.
This may not be exact as it does not take into account all of the context
that redisplay will.
*/
       (glyph, window))
{
  XSETWINDOW (window, decode_window (window));
  CHECK_GLYPH (glyph);

  return make_int (glyph_ascent (glyph, Qnil, DEFAULT_INDEX, window));
}

DEFUN ("glyph-descent", Fglyph_descent, 1, 2, 0, /*
Return the descent value of GLYPH on WINDOW.
This may not be exact as it does not take into account all of the context
that redisplay will.
*/
       (glyph, window))
{
  XSETWINDOW (window, decode_window (window));
  CHECK_GLYPH (glyph);

  return make_int (glyph_descent (glyph, Qnil, DEFAULT_INDEX, window));
}

/* This is redundant but I bet a lot of people expect it to exist. */
DEFUN ("glyph-height", Fglyph_height, 1, 2, 0, /*
Return the height of GLYPH on WINDOW.
This may not be exact as it does not take into account all of the context
that redisplay will.
*/
       (glyph, window))
{
  XSETWINDOW (window, decode_window (window));
  CHECK_GLYPH (glyph);

  return make_int (glyph_height (glyph, Qnil, DEFAULT_INDEX, window));
}

#undef RETURN_ASCENT
#undef RETURN_DESCENT
#undef RETURN_HEIGHT

/* #### do we need to cache this info to speed things up? */

Lisp_Object
glyph_baseline (Lisp_Object glyph, Lisp_Object domain)
{
  if (!GLYPHP (glyph))
    return Qnil;
  else
    {
      Lisp_Object retval =
	specifier_instance_no_quit (GLYPH_BASELINE (XGLYPH (glyph)),
				    /* #### look into ERROR_ME_NOT */
				    Qunbound, domain, ERROR_ME_NOT,
				    0, Qzero);
      if (!NILP (retval) && !INTP (retval))
	retval = Qnil;
      else if (INTP (retval))
	{
	  if (XINT (retval) < 0)
	    retval = Qzero;
	  if (XINT (retval) > 100)
	    retval = make_int (100);
	}
      return retval;
    }
}

Lisp_Object
glyph_face (Lisp_Object glyph, Lisp_Object domain)
{
  /* #### Domain parameter not currently used but it will be */
  return GLYPHP (glyph) ? GLYPH_FACE (XGLYPH (glyph)) : Qnil;
}

int
glyph_contrib_p (Lisp_Object glyph, Lisp_Object domain)
{
  if (!GLYPHP (glyph))
    return 0;
  else
    return !NILP (specifier_instance_no_quit
		  (GLYPH_CONTRIB_P (XGLYPH (glyph)), Qunbound, domain,
		   /* #### look into ERROR_ME_NOT */
		   ERROR_ME_NOT, 0, Qzero));
}

static void
glyph_property_was_changed (Lisp_Object glyph, Lisp_Object property,
			    Lisp_Object locale)
{
  if (XGLYPH (glyph)->after_change)
    (XGLYPH (glyph)->after_change) (glyph, property, locale);
}


/*****************************************************************************
 *                     glyph cachel functions                         	     *
 *****************************************************************************/

/*
 #### All of this is 95% copied from face cachels.
      Consider consolidating.
 #### We need to add a dirty flag to the glyphs.
 */

void
mark_glyph_cachels (glyph_cachel_dynarr *elements,
		    void (*markobj) (Lisp_Object))
{
  int elt;

  if (!elements)
    return;

  for (elt = 0; elt < Dynarr_length (elements); elt++)
    {
      struct glyph_cachel *cachel = Dynarr_atp (elements, elt);
      ((markobj) (cachel->glyph));
    }
}

static void
update_glyph_cachel_data (struct window *w, Lisp_Object glyph,
			  struct glyph_cachel *cachel)
{
  /* #### This should be || !cachel->updated */
  if (NILP (cachel->glyph) || !EQ (cachel->glyph, glyph))
    {
      Lisp_Object window;

      XSETWINDOW (window, w);

    /* #### This could be sped up if we redid things to grab the glyph
       instantiation and passed it to the size functions. */
      cachel->glyph   = glyph;
      cachel->width   = glyph_width   (glyph, Qnil, DEFAULT_INDEX, window);
      cachel->ascent  = glyph_ascent  (glyph, Qnil, DEFAULT_INDEX, window);
      cachel->descent = glyph_descent (glyph, Qnil, DEFAULT_INDEX, window);
    }

  cachel->updated = 1;
}

static void
add_glyph_cachel (struct window *w, Lisp_Object glyph)
{
  struct glyph_cachel new_cachel;

  xzero (new_cachel);
  new_cachel.glyph = Qnil;

  update_glyph_cachel_data (w, glyph, &new_cachel);
  Dynarr_add (w->glyph_cachels, new_cachel);
}

static glyph_index
get_glyph_cachel_index (struct window *w, Lisp_Object glyph)
{
  int elt;

  if (noninteractive)
    return 0;

  for (elt = 0; elt < Dynarr_length (w->glyph_cachels); elt++)
    {
      struct glyph_cachel *cachel =
	Dynarr_atp (w->glyph_cachels, elt);

      if (EQ (cachel->glyph, glyph) && !NILP (glyph))
	{
	  if (!cachel->updated)
	    update_glyph_cachel_data (w, glyph, cachel);
	  return elt;
	}
    }

  /* If we didn't find the glyph, add it and then return its index. */
  add_glyph_cachel (w, glyph);
  return elt;
}

void
reset_glyph_cachels (struct window *w)
{
  Dynarr_reset (w->glyph_cachels);
  get_glyph_cachel_index (w, Vcontinuation_glyph);
  get_glyph_cachel_index (w, Vtruncation_glyph);
  get_glyph_cachel_index (w, Vhscroll_glyph);
  get_glyph_cachel_index (w, Vcontrol_arrow_glyph);
  get_glyph_cachel_index (w, Voctal_escape_glyph);
  get_glyph_cachel_index (w, Vinvisible_text_glyph);
}

void
mark_glyph_cachels_as_not_updated (struct window *w)
{
  int elt;

  /* We need to have a dirty flag to tell if the glyph has changed.
     We can check to see if each glyph variable is actually a
     completely different glyph, though. */
#define FROB(glyph_obj, gindex)						\
  update_glyph_cachel_data (w, glyph_obj,				\
			      Dynarr_atp (w->glyph_cachels, gindex))

  FROB (Vcontinuation_glyph, CONT_GLYPH_INDEX);
  FROB (Vtruncation_glyph, TRUN_GLYPH_INDEX);
  FROB (Vhscroll_glyph, HSCROLL_GLYPH_INDEX);
  FROB (Vcontrol_arrow_glyph, CONTROL_GLYPH_INDEX);
  FROB (Voctal_escape_glyph, OCT_ESC_GLYPH_INDEX);
  FROB (Vinvisible_text_glyph, INVIS_GLYPH_INDEX);
#undef FROB

  for (elt = 0; elt < Dynarr_length (w->glyph_cachels); elt++)
    Dynarr_atp (w->glyph_cachels, elt)->updated = 0;
}

#ifdef MEMORY_USAGE_STATS

int
compute_glyph_cachel_usage (glyph_cachel_dynarr *glyph_cachels,
			    struct overhead_stats *ovstats)
{
  int total = 0;

  if (glyph_cachels)
    total += Dynarr_memory_usage (glyph_cachels, ovstats);

  return total;
}

#endif /* MEMORY_USAGE_STATS */


/*****************************************************************************
 *                              display tables                               *
 *****************************************************************************/

/* Get the display table for use currently on window W with face FACE.
   Precedence:

   -- FACE's display table
   -- W's display table (comes from specifier `current-display-table')

   Ignore the specified tables if they are not valid;
   if no valid table is specified, return 0.  */

struct Lisp_Vector *
get_display_table (struct window *w, face_index findex)
{
  Lisp_Object tem;

  tem = WINDOW_FACE_CACHEL_DISPLAY_TABLE (w, findex);
  if (VECTORP (tem) && XVECTOR_LENGTH (tem) == DISP_TABLE_SIZE)
    return XVECTOR (tem);

  tem = w->display_table;
  if (VECTORP (tem) && XVECTOR_LENGTH (tem) == DISP_TABLE_SIZE)
    return XVECTOR (tem);

  return 0;
}


/*****************************************************************************
 *                              initialization                               *
 *****************************************************************************/

void
syms_of_glyphs (void)
{
  /* image instantiators */

  DEFSUBR (Fimage_instantiator_format_list);
  DEFSUBR (Fvalid_image_instantiator_format_p);
  DEFSUBR (Fset_console_type_image_conversion_list);
  DEFSUBR (Fconsole_type_image_conversion_list);

  defkeyword (&Q_file, ":file");
  defkeyword (&Q_data, ":data");
  defkeyword (&Q_face, ":face");

#ifdef HAVE_XPM
  defkeyword (&Q_color_symbols, ":color-symbols");
#endif
#ifdef HAVE_WINDOW_SYSTEM
  defkeyword (&Q_mask_file, ":mask-file");
  defkeyword (&Q_mask_data, ":mask-data");
  defkeyword (&Q_hotspot_x, ":hotspot-x");
  defkeyword (&Q_hotspot_y, ":hotspot-y");
  defkeyword (&Q_foreground, ":foreground");
  defkeyword (&Q_background, ":background");
#endif
  /* image specifiers */

  DEFSUBR (Fimage_specifier_p);
  /* Qimage in general.c */

  /* image instances */

  defsymbol (&Qimage_instancep, "image-instance-p");

  defsymbol (&Qnothing_image_instance_p, "nothing-image-instance-p");
  defsymbol (&Qtext_image_instance_p, "text-image-instance-p");
  defsymbol (&Qmono_pixmap_image_instance_p, "mono-pixmap-image-instance-p");
  defsymbol (&Qcolor_pixmap_image_instance_p, "color-pixmap-image-instance-p");
  defsymbol (&Qpointer_image_instance_p, "pointer-image-instance-p");
  defsymbol (&Qsubwindow_image_instance_p, "subwindow-image-instance-p");

  DEFSUBR (Fmake_image_instance);
  DEFSUBR (Fimage_instance_p);
  DEFSUBR (Fimage_instance_type);
  DEFSUBR (Fvalid_image_instance_type_p);
  DEFSUBR (Fimage_instance_type_list);
  DEFSUBR (Fimage_instance_name);
  DEFSUBR (Fimage_instance_string);
  DEFSUBR (Fimage_instance_file_name);
  DEFSUBR (Fimage_instance_mask_file_name);
  DEFSUBR (Fimage_instance_depth);
  DEFSUBR (Fimage_instance_height);
  DEFSUBR (Fimage_instance_width);
  DEFSUBR (Fimage_instance_hotspot_x);
  DEFSUBR (Fimage_instance_hotspot_y);
  DEFSUBR (Fimage_instance_foreground);
  DEFSUBR (Fimage_instance_background);
  DEFSUBR (Fcolorize_image_instance);

  /* Qnothing defined as part of the "nothing" image-instantiator
     type. */
  /* Qtext defined in general.c */
  defsymbol (&Qmono_pixmap, "mono-pixmap");
  defsymbol (&Qcolor_pixmap, "color-pixmap");
  /* Qpointer defined in general.c */
  defsymbol (&Qsubwindow, "subwindow");

  /* glyphs */

  defsymbol (&Qglyphp, "glyphp");
  defsymbol (&Qcontrib_p, "contrib-p");
  defsymbol (&Qbaseline, "baseline");

  defsymbol (&Qbuffer_glyph_p, "buffer-glyph-p");
  defsymbol (&Qpointer_glyph_p, "pointer-glyph-p");
  defsymbol (&Qicon_glyph_p, "icon-glyph-p");

  defsymbol (&Qconst_glyph_variable, "const-glyph-variable");

  DEFSUBR (Fglyph_type);
  DEFSUBR (Fvalid_glyph_type_p);
  DEFSUBR (Fglyph_type_list);
  DEFSUBR (Fglyphp);
  DEFSUBR (Fmake_glyph_internal);
  DEFSUBR (Fglyph_width);
  DEFSUBR (Fglyph_ascent);
  DEFSUBR (Fglyph_descent);
  DEFSUBR (Fglyph_height);

  /* Qbuffer defined in general.c. */
  /* Qpointer defined above */

  /* Errors */
  deferror (&Qimage_conversion_error,
	    "image-conversion-error",
	    "image-conversion error", Qio_error);

}

void
specifier_type_create_image (void)
{
  /* image specifiers */

  INITIALIZE_SPECIFIER_TYPE_WITH_DATA (image, "image", "imagep");

  SPECIFIER_HAS_METHOD (image, create);
  SPECIFIER_HAS_METHOD (image, mark);
  SPECIFIER_HAS_METHOD (image, instantiate);
  SPECIFIER_HAS_METHOD (image, validate);
  SPECIFIER_HAS_METHOD (image, after_change);
  SPECIFIER_HAS_METHOD (image, going_to_add);
}

void
image_instantiator_format_create (void)
{
  /* image instantiators */

  the_image_instantiator_format_entry_dynarr =
    Dynarr_new (image_instantiator_format_entry);

  Vimage_instantiator_format_list = Qnil;
  staticpro (&Vimage_instantiator_format_list);

  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (nothing, "nothing");

  IIFORMAT_HAS_METHOD (nothing, possible_dest_types);
  IIFORMAT_HAS_METHOD (nothing, instantiate);

  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (inherit, "inherit");

  IIFORMAT_HAS_METHOD (inherit, validate);
  IIFORMAT_HAS_METHOD (inherit, normalize);
  IIFORMAT_HAS_METHOD (inherit, possible_dest_types);
  IIFORMAT_HAS_METHOD (inherit, instantiate);

  IIFORMAT_VALID_KEYWORD (inherit, Q_face, check_valid_face);

  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (string, "string");

  IIFORMAT_HAS_METHOD (string, validate);
  IIFORMAT_HAS_METHOD (string, possible_dest_types);
  IIFORMAT_HAS_METHOD (string, instantiate);

  IIFORMAT_VALID_KEYWORD (string, Q_data, check_valid_string);

  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (formatted_string, "formatted-string");

  IIFORMAT_HAS_METHOD (formatted_string, validate);
  IIFORMAT_HAS_METHOD (formatted_string, possible_dest_types);
  IIFORMAT_HAS_METHOD (formatted_string, instantiate);

  IIFORMAT_VALID_KEYWORD (formatted_string, Q_data, check_valid_string);

#ifdef HAVE_WINDOW_SYSTEM
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (xbm, "xbm");

  IIFORMAT_HAS_METHOD (xbm, validate);
  IIFORMAT_HAS_METHOD (xbm, normalize);
  IIFORMAT_HAS_METHOD (xbm, possible_dest_types);
  IIFORMAT_HAS_METHOD (xbm, instantiate);

  IIFORMAT_VALID_KEYWORD (xbm, Q_data, check_valid_xbm_inline);
  IIFORMAT_VALID_KEYWORD (xbm, Q_file, check_valid_string);
  IIFORMAT_VALID_KEYWORD (xbm, Q_mask_data, check_valid_xbm_inline);
  IIFORMAT_VALID_KEYWORD (xbm, Q_mask_file, check_valid_string);
  IIFORMAT_VALID_KEYWORD (xbm, Q_hotspot_x, check_valid_int);
  IIFORMAT_VALID_KEYWORD (xbm, Q_hotspot_y, check_valid_int);
  IIFORMAT_VALID_KEYWORD (xbm, Q_foreground, check_valid_string);
  IIFORMAT_VALID_KEYWORD (xbm, Q_background, check_valid_string);
#endif /* HAVE_WINDOW_SYSTEM */

#ifdef HAVE_XPM
  INITIALIZE_IMAGE_INSTANTIATOR_FORMAT (xpm, "xpm");

  IIFORMAT_HAS_METHOD (xpm, validate);
  IIFORMAT_HAS_METHOD (xpm, normalize);
  IIFORMAT_HAS_METHOD (xpm, possible_dest_types);
  IIFORMAT_HAS_METHOD (xpm, instantiate);

  IIFORMAT_VALID_KEYWORD (xpm, Q_data, check_valid_string);
  IIFORMAT_VALID_KEYWORD (xpm, Q_file, check_valid_string);
  IIFORMAT_VALID_KEYWORD (xpm, Q_color_symbols, check_valid_xpm_color_symbols);
#endif /* HAVE_XPM */
}

void
vars_of_glyphs (void)
{
  Vthe_nothing_vector = vector1 (Qnothing);
  staticpro (&Vthe_nothing_vector);

  /* image instances */

  Vimage_instance_type_list = list6 (Qnothing, Qtext, Qmono_pixmap,
				     Qcolor_pixmap, Qpointer, Qsubwindow);
  staticpro (&Vimage_instance_type_list);

  /* glyphs */

  Vglyph_type_list = list3 (Qbuffer, Qpointer, Qicon);
  staticpro (&Vglyph_type_list);

  /* The octal-escape glyph, control-arrow-glyph and
     invisible-text-glyph are completely initialized in glyphs.el */

  DEFVAR_LISP ("octal-escape-glyph", &Voctal_escape_glyph /*
What to prefix character codes displayed in octal with.
*/);
  Voctal_escape_glyph = allocate_glyph (GLYPH_BUFFER, redisplay_glyph_changed);

  DEFVAR_LISP ("control-arrow-glyph", &Vcontrol_arrow_glyph /*
What to use as an arrow for control characters.
*/);
  Vcontrol_arrow_glyph = allocate_glyph (GLYPH_BUFFER,
					 redisplay_glyph_changed);

  DEFVAR_LISP ("invisible-text-glyph", &Vinvisible_text_glyph /*
What to use to indicate the presence of invisible text.
This is the glyph that is displayed when an ellipsis is called for
\(see `selective-display-ellipses' and `buffer-invisibility-spec').
Normally this is three dots ("...").
*/);
  Vinvisible_text_glyph = allocate_glyph (GLYPH_BUFFER,
					  redisplay_glyph_changed);

  /* Partially initialized in glyphs.el */
  DEFVAR_LISP ("hscroll-glyph", &Vhscroll_glyph /*
What to display at the beginning of horizontally scrolled lines.
*/);
  Vhscroll_glyph = allocate_glyph (GLYPH_BUFFER, redisplay_glyph_changed);

#ifdef HAVE_XPM
  Fprovide (Qxpm);

  DEFVAR_LISP ("xpm-color-symbols", &Vxpm_color_symbols /*
Definitions of logical color-names used when reading XPM files.
Elements of this list should be of the form (COLOR-NAME FORM-TO-EVALUATE).
The COLOR-NAME should be a string, which is the name of the color to define;
the FORM should evaluate to a `color' specifier object, or a string to be
passed to `make-color-instance'.  If a loaded XPM file references a symbolic
color called COLOR-NAME, it will display as the computed color instead.

The default value of this variable defines the logical color names
\"foreground\" and \"background\" to be the colors of the `default' face.
*/ );
  Vxpm_color_symbols = Qnil; /* initialized in x-faces.el */
#endif /* HAVE_XPM */
}

void
specifier_vars_of_glyphs (void)
{
  /* #### Can we GC here? The set_specifier_* calls definitely need */
  /* protection. */
  /* display tables */

  DEFVAR_SPECIFIER ("current-display-table", &Vcurrent_display_table /*
*The display table currently in use.
This is a specifier; use `set-specifier' to change it.
The display table is a vector created with `make-display-table'.
The 256 elements control how to display each possible text character.
Each value should be a string, a glyph, a vector or nil.
If a value is a vector it must be composed only of strings and glyphs.
nil means display the character in the default fashion.
Faces can have their own, overriding display table.
*/ );
  Vcurrent_display_table = Fmake_specifier (Qdisplay_table);
  set_specifier_fallback (Vcurrent_display_table,
			  list1 (Fcons (Qnil, Qnil)));
  set_specifier_caching (Vcurrent_display_table,
			 slot_offset (struct window,
				      display_table),
			 some_window_value_changed,
			 0, 0);
}

void
complex_vars_of_glyphs (void)
{
  /* Partially initialized in glyphs-x.c, glyphs.el */
  DEFVAR_LISP ("truncation-glyph", &Vtruncation_glyph /*
What to display at the end of truncated lines.
*/ );
  Vtruncation_glyph = allocate_glyph (GLYPH_BUFFER, redisplay_glyph_changed);

  /* Partially initialized in glyphs-x.c, glyphs.el */
  DEFVAR_LISP ("continuation-glyph", &Vcontinuation_glyph /*
What to display at the end of wrapped lines.
*/ );
  Vcontinuation_glyph = allocate_glyph (GLYPH_BUFFER, redisplay_glyph_changed);

  /* Partially initialized in glyphs-x.c, glyphs.el */
  DEFVAR_LISP ("xemacs-logo", &Vxemacs_logo /*
The glyph used to display the XEmacs logo at startup.
*/ );
  Vxemacs_logo = allocate_glyph (GLYPH_BUFFER, 0);
}
