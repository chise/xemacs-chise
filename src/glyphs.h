/* Generic glyph data structures + display tables
   Copyright (C) 1994 Board of Trustees, University of Illinois.
   Copyright (C) 1995, 1996 Ben Wing

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

#ifndef _XEMACS_GLYPHS_H_
#define _XEMACS_GLYPHS_H_

#include "specifier.h"

/************************************************************************/
/*			Image Instantiators				*/
/************************************************************************/

struct image_instantiator_methods;

/* Remember the distinction between image instantiator formats and
   image instance types.  Here's an approximate mapping:

  image instantiator format	image instance type
  -------------------------	-------------------
  nothing			nothing
  string			text
  formatted-string		text
  xbm				mono-pixmap, color-pixmap, pointer
  xpm				color-pixmap, mono-pixmap, pointer
  xface				mono-pixmap, color-pixmap, pointer
  gif				color-pixmap
  jpeg				color-pixmap
  png				color-pixmap
  tiff				color-pixmap
  cursor-font			pointer
  font				pointer
  subwindow			subwindow
  inherit			mono-pixmap
  autodetect			mono-pixmap, color-pixmap, pointer, text
*/

/* These are methods specific to a particular format of image instantiator
   (e.g. xpm, string, etc.). */

typedef struct ii_keyword_entry ii_keyword_entry;
struct ii_keyword_entry
{
  Lisp_Object keyword;
  void (*validate) (Lisp_Object data);
  int multiple_p;
};

typedef struct
{
  Dynarr_declare (ii_keyword_entry);
} ii_keyword_entry_dynarr;

struct image_instantiator_methods
{
  Lisp_Object symbol;

  ii_keyword_entry_dynarr *keywords;
  /* Implementation specific methods: */

  /* Validate method: Given an instantiator vector, signal an error if
     it's invalid for this image-instantiator format.  Note that this
     validation only occurs after all the keyword-specific validation
     has already been performed.  This is chiefly useful for making
     sure that certain required keywords are present. */
  void (*validate_method) (Lisp_Object instantiator);

  /* Normalize method: Given an instantiator, convert it to the form
     that should be used in a glyph, for devices of type CONSOLE_TYPE.
     Signal an error if conversion fails. */
  Lisp_Object (*normalize_method) (Lisp_Object instantiator,
				   Lisp_Object console_type);

  /* Possible-dest-types method: Return a mask indicating what dest types
     are compatible with this format. */
  int (*possible_dest_types_method) (void);

  /* Instantiate method: Given an instantiator and a partially
     filled-in image instance, complete the filling-in.  Return
     non-zero if the instantiation succeeds, 0 if it fails.
     This must be present. */
  void (*instantiate_method) (Lisp_Object image_instance,
			      Lisp_Object instantiator,
			      Lisp_Object pointer_fg,
			      Lisp_Object pointer_bg,
			      int dest_mask,
			      Lisp_Object domain);
};

/***** Calling an image-instantiator method *****/

#define HAS_IIFORMAT_METH_P(mstruc, m) ((mstruc)->m##_method)
#define IIFORMAT_METH(mstruc, m, args) (((mstruc)->m##_method) args)

/* Call a void-returning specifier method, if it exists */
#define MAYBE_IIFORMAT_METH(mstruc, m, args)				     \
do {									     \
  struct image_instantiator_methods *_maybe_iiformat_meth_mstruc = (mstruc); \
  if (HAS_IIFORMAT_METH_P (_maybe_iiformat_meth_mstruc, m))		     \
    IIFORMAT_METH (_maybe_iiformat_meth_mstruc, m, args);		     \
} while (0)

/* Call a specifier method, if it exists; otherwise return
   the specified value */

#define IIFORMAT_METH_OR_GIVEN(mstruc, m, args, given)	\
  (HAS_IIFORMAT_METH_P (mstruc, m) ?			\
   IIFORMAT_METH (mstruc, m, args) : (given))

/***** Defining new image-instantiator types *****/

#define DECLARE_IMAGE_INSTANTIATOR_FORMAT(format)		\
extern struct image_instantiator_methods *format##_image_instantiator_methods

#define DEFINE_IMAGE_INSTANTIATOR_FORMAT(format)		\
struct image_instantiator_methods *format##_image_instantiator_methods

#define INITIALIZE_IMAGE_INSTANTIATOR_FORMAT(format, obj_name)	\
do {								\
  format##_image_instantiator_methods =				\
    xnew_and_zero (struct image_instantiator_methods);		\
  defsymbol (&Q##format, obj_name);				\
  format##_image_instantiator_methods->symbol = Q##format;	\
  format##_image_instantiator_methods->keywords =		\
    Dynarr_new (ii_keyword_entry);				\
  add_entry_to_image_instantiator_format_list			\
    (Q##format, format##_image_instantiator_methods);		\
} while (0)

/* Declare that image-instantiator format FORMAT has method M; used in
   initialization routines */
#define IIFORMAT_HAS_METHOD(format, m) \
  (format##_image_instantiator_methods->m##_method = format##_##m)

/* Declare that KEYW is a valid keyword for image-instantiator format
   FORMAT.  VALIDATE_FUN if a function that returns whether the data
   is valid.  The keyword may not appear more than once. */
#define IIFORMAT_VALID_KEYWORD(format, keyw, validate_fun)	\
  do {								\
    struct ii_keyword_entry entry;				\
								\
    entry.keyword = keyw;					\
    entry.validate = validate_fun;				\
    entry.multiple_p = 0;					\
    Dynarr_add (format##_image_instantiator_methods->keywords,	\
		entry);						\
  } while (0)

/* Same as IIFORMAT_VALID_KEYWORD except that the keyword may
   appear multiple times. */
#define IIFORMAT_VALID_MULTI_KEYWORD(format, keyword, validate_fun)	\
  do {									\
    struct ii_keyword_entry entry;					\
									\
    entry.keyword = keyword;						\
    entry.validate = validate_fun;					\
    entry.multiple_p = 1;						\
    Dynarr_add (format##_image_instantiator_methods->keywords,		\
		entry);							\
  } while (0)

void add_entry_to_image_instantiator_format_list (Lisp_Object symbol,
			struct image_instantiator_methods *meths);
Lisp_Object find_keyword_in_vector (Lisp_Object vector,
				    Lisp_Object keyword);
Lisp_Object find_keyword_in_vector_or_given (Lisp_Object vector,
					     Lisp_Object keyword,
					     Lisp_Object default_);
Lisp_Object simple_image_type_normalize (Lisp_Object inst, 
					 Lisp_Object console_type,
					 Lisp_Object image_type_tag);
Lisp_Object potential_pixmap_file_instantiator (Lisp_Object instantiator,
						Lisp_Object file_keyword,
						Lisp_Object data_keyword,
						Lisp_Object console_type);
void check_valid_string (Lisp_Object data);
void check_valid_int (Lisp_Object data);
DECLARE_DOESNT_RETURN (incompatible_image_types (Lisp_Object instantiator,
                                                 int given_dest_mask,
                                                 int desired_dest_mask));
DECLARE_DOESNT_RETURN (signal_image_error (CONST char *, Lisp_Object));
DECLARE_DOESNT_RETURN (signal_image_error_2 (CONST char *, Lisp_Object, Lisp_Object));

/************************************************************************/
/*			Image Specifier Object				*/
/************************************************************************/

DECLARE_SPECIFIER_TYPE (image);
#define XIMAGE_SPECIFIER(x) XSPECIFIER_TYPE (x, image)
#define XSETIMAGE_SPECIFIER(x, p) XSETSPECIFIER_TYPE (x, p, image)
#define IMAGE_SPECIFIERP(x) SPECIFIER_TYPEP (x, image)
#define CHECK_IMAGE_SPECIFIER(x) CHECK_SPECIFIER_TYPE (x, image)
#define CONCHECK_IMAGE_SPECIFIER(x) CONCHECK_SPECIFIER_TYPE (x, image)

void set_image_attached_to (Lisp_Object obj, Lisp_Object face_or_glyph,
			    Lisp_Object property);

struct image_specifier
{
  int allowed;
  Lisp_Object attachee;		/* face or glyph this is attached to, or nil */
  Lisp_Object attachee_property;/* property of that face or glyph */
};

#define IMAGE_SPECIFIER_DATA(g) (SPECIFIER_TYPE_DATA (g, image))
#define IMAGE_SPECIFIER_ALLOWED(g) (IMAGE_SPECIFIER_DATA (g)->allowed)
#define IMAGE_SPECIFIER_ATTACHEE(g) (IMAGE_SPECIFIER_DATA (g)->attachee)
#define IMAGE_SPECIFIER_ATTACHEE_PROPERTY(g) \
  (IMAGE_SPECIFIER_DATA (g)->attachee_property)

#define XIMAGE_SPECIFIER_ALLOWED(g) \
  IMAGE_SPECIFIER_ALLOWED (XIMAGE_SPECIFIER (g))

/************************************************************************/
/*			Image Instance Object				*/
/************************************************************************/

DECLARE_LRECORD (image_instance, struct Lisp_Image_Instance);
#define XIMAGE_INSTANCE(x) \
  XRECORD (x, image_instance, struct Lisp_Image_Instance)
#define XSETIMAGE_INSTANCE(x, p) XSETRECORD (x, p, image_instance)
#define IMAGE_INSTANCEP(x) RECORDP (x, image_instance)
#define GC_IMAGE_INSTANCEP(x) GC_RECORDP (x, image_instance)
#define CHECK_IMAGE_INSTANCE(x) CHECK_RECORD (x, image_instance)
#define CONCHECK_IMAGE_INSTANCE(x) CONCHECK_RECORD (x, image_instance)

enum image_instance_type
{
  IMAGE_UNKNOWN,
  IMAGE_NOTHING,
  IMAGE_TEXT,
  IMAGE_MONO_PIXMAP,
  IMAGE_COLOR_PIXMAP,
  IMAGE_POINTER,
  IMAGE_SUBWINDOW
};

#define IMAGE_NOTHING_MASK (1 << 0)
#define IMAGE_TEXT_MASK (1 << 1)
#define IMAGE_MONO_PIXMAP_MASK (1 << 2)
#define IMAGE_COLOR_PIXMAP_MASK (1 << 3)
#define IMAGE_POINTER_MASK (1 << 4)
#define IMAGE_SUBWINDOW_MASK (1 << 5)

#define IMAGE_INSTANCE_TYPE_P(ii, type) \
(IMAGE_INSTANCEP (ii) && XIMAGE_INSTANCE_TYPE (ii) == type)

#define NOTHING_IMAGE_INSTANCEP(ii) \
     IMAGE_INSTANCE_TYPE_P (ii, IMAGE_NOTHING)
#define TEXT_IMAGE_INSTANCEP(ii) \
     IMAGE_INSTANCE_TYPE_P (ii, IMAGE_TEXT)
#define MONO_PIXMAP_IMAGE_INSTANCEP(ii) \
     IMAGE_INSTANCE_TYPE_P (ii, IMAGE_MONO_PIXMAP)
#define COLOR_PIXMAP_IMAGE_INSTANCEP(ii) \
     IMAGE_INSTANCE_TYPE_P (ii, IMAGE_COLOR_PIXMAP)
#define POINTER_IMAGE_INSTANCEP(ii) \
     IMAGE_INSTANCE_TYPE_P (ii, IMAGE_POINTER)
#define SUBWINDOW_IMAGE_INSTANCEP(ii) \
     IMAGE_INSTANCE_TYPE_P (ii, IMAGE_SUBWINDOW)

#define CHECK_NOTHING_IMAGE_INSTANCE(x) do {			\
  CHECK_IMAGE_INSTANCE (x);					\
  if (!NOTHING_IMAGE_INSTANCEP (x))				\
    x = wrong_type_argument (Qnothing_image_instance_p, (x));	\
} while (0)

#define CHECK_TEXT_IMAGE_INSTANCE(x) do {			\
  CHECK_IMAGE_INSTANCE (x);					\
  if (!TEXT_IMAGE_INSTANCEP (x))				\
    x = wrong_type_argument (Qtext_image_instance_p, (x));	\
} while (0)

#define CHECK_MONO_PIXMAP_IMAGE_INSTANCE(x) do {			\
  CHECK_IMAGE_INSTANCE (x);						\
  if (!MONO_PIXMAP_IMAGE_INSTANCEP (x))					\
    x = wrong_type_argument (Qmono_pixmap_image_instance_p, (x));	\
} while (0)

#define CHECK_COLOR_PIXMAP_IMAGE_INSTANCE(x) do {			\
  CHECK_IMAGE_INSTANCE (x);						\
  if (!COLOR_PIXMAP_IMAGE_INSTANCEP (x))				\
    x = wrong_type_argument (Qcolor_pixmap_image_instance_p, (x));	\
} while (0)

#define CHECK_POINTER_IMAGE_INSTANCE(x) do {			\
  CHECK_IMAGE_INSTANCE (x);					\
  if (!POINTER_IMAGE_INSTANCEP (x))				\
    x = wrong_type_argument (Qpointer_image_instance_p, (x));	\
} while (0)

#define CHECK_SUBWINDOW_IMAGE_INSTANCE(x) do {			\
  CHECK_IMAGE_INSTANCE (x);					\
  if (!SUBWINDOW_IMAGE_INSTANCEP (x))				\
    x = wrong_type_argument (Qsubwindow_image_instance_p, (x));	\
} while (0)

struct Lisp_Image_Instance
{
  struct lcrecord_header header;
  Lisp_Object device;
  Lisp_Object name;
  enum image_instance_type type;
  union
  {
    struct
    {
      Lisp_Object string;
    } text;
    struct
    {
      int width, height, depth;
      Lisp_Object hotspot_x, hotspot_y; /* integer or Qnil */
      Lisp_Object filename;	 /* string or Qnil */
      Lisp_Object mask_filename; /* string or Qnil */
      Lisp_Object fg, bg; /* foreground and background colors,
			     if this is a colorized mono-pixmap
			     or a pointer */
      Lisp_Object auxdata;    /* list or Qnil: any additional data
				 to be seen from lisp */
    } pixmap; /* used for pointers as well */
    struct
    {
      int dummy; /* #### fill in this structure */
    } subwindow;
  } u;

  /* console-type- and image-type-specific data */
  void *data;
};

#define IMAGE_INSTANCE_DEVICE(i) ((i)->device)
#define IMAGE_INSTANCE_NAME(i) ((i)->name)
#define IMAGE_INSTANCE_TYPE(i) ((i)->type)
#define IMAGE_INSTANCE_PIXMAP_TYPE_P(i)					\
 ((IMAGE_INSTANCE_TYPE (i) == IMAGE_MONO_PIXMAP)			\
  || (IMAGE_INSTANCE_TYPE (i) == IMAGE_COLOR_PIXMAP))

#define IMAGE_INSTANCE_TEXT_STRING(i) ((i)->u.text.string)

#define IMAGE_INSTANCE_PIXMAP_WIDTH(i) ((i)->u.pixmap.width)
#define IMAGE_INSTANCE_PIXMAP_HEIGHT(i) ((i)->u.pixmap.height)
#define IMAGE_INSTANCE_PIXMAP_DEPTH(i) ((i)->u.pixmap.depth)
#define IMAGE_INSTANCE_PIXMAP_FILENAME(i) ((i)->u.pixmap.filename)
#define IMAGE_INSTANCE_PIXMAP_MASK_FILENAME(i) ((i)->u.pixmap.mask_filename)
#define IMAGE_INSTANCE_PIXMAP_HOTSPOT_X(i) ((i)->u.pixmap.hotspot_x)
#define IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y(i) ((i)->u.pixmap.hotspot_y)
#define IMAGE_INSTANCE_PIXMAP_FG(i) ((i)->u.pixmap.fg)
#define IMAGE_INSTANCE_PIXMAP_BG(i) ((i)->u.pixmap.bg)
#define IMAGE_INSTANCE_PIXMAP_AUXDATA(i) ((i)->u.pixmap.auxdata)

#define XIMAGE_INSTANCE_DEVICE(i) \
  IMAGE_INSTANCE_DEVICE (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_NAME(i) \
  IMAGE_INSTANCE_NAME (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_TYPE(i) \
  IMAGE_INSTANCE_TYPE (XIMAGE_INSTANCE (i))

#define XIMAGE_INSTANCE_TEXT_STRING(i) \
  IMAGE_INSTANCE_TEXT_STRING (XIMAGE_INSTANCE (i))

#define XIMAGE_INSTANCE_PIXMAP_WIDTH(i) \
  IMAGE_INSTANCE_PIXMAP_WIDTH (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_HEIGHT(i) \
  IMAGE_INSTANCE_PIXMAP_HEIGHT (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_DEPTH(i) \
  IMAGE_INSTANCE_PIXMAP_DEPTH (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_FILENAME(i) \
  IMAGE_INSTANCE_PIXMAP_FILENAME (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_MASK_FILENAME(i) \
  IMAGE_INSTANCE_PIXMAP_MASK_FILENAME (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_HOTSPOT_X(i) \
  IMAGE_INSTANCE_PIXMAP_HOTSPOT_X (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_HOTSPOT_Y(i) \
  IMAGE_INSTANCE_PIXMAP_HOTSPOT_Y (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_FG(i) \
  IMAGE_INSTANCE_PIXMAP_FG (XIMAGE_INSTANCE (i))
#define XIMAGE_INSTANCE_PIXMAP_BG(i) \
  IMAGE_INSTANCE_PIXMAP_BG (XIMAGE_INSTANCE (i))

#ifdef HAVE_XPM
Lisp_Object evaluate_xpm_color_symbols (void);
Lisp_Object pixmap_to_lisp_data (Lisp_Object name, int ok_if_data_invalid);
#endif /* HAVE_XPM */
#ifdef HAVE_WINDOW_SYSTEM
Lisp_Object bitmap_to_lisp_data (Lisp_Object name, int *xhot, int *yhot,
				 int ok_if_data_invalid);
int read_bitmap_data_from_file (CONST char *filename, unsigned int *width, 
				unsigned int *height, unsigned char **datap,
				int *x_hot, int *y_hot);
Lisp_Object xbm_mask_file_munging (Lisp_Object alist, Lisp_Object file,
				   Lisp_Object mask_file, 
				   Lisp_Object console_type);
#endif

/************************************************************************/
/*				Glyph Object				*/
/************************************************************************/

enum glyph_type
{
  GLYPH_UNKNOWN,
  GLYPH_BUFFER,
  GLYPH_POINTER,
  GLYPH_ICON
};

struct Lisp_Glyph
{
  struct lcrecord_header header;

  enum glyph_type type;

  /* specifiers: */
  Lisp_Object image;		/* the actual image */
  Lisp_Object contrib_p;	/* whether to figure into line height */
  Lisp_Object baseline;		/* percent above baseline */

  Lisp_Object face;		/* if non-nil, face to use when displaying */

  Lisp_Object plist;
  void (*after_change) (Lisp_Object glyph, Lisp_Object property,
			Lisp_Object locale);
};

DECLARE_LRECORD (glyph, struct Lisp_Glyph);
#define XGLYPH(x) XRECORD (x, glyph, struct Lisp_Glyph)
#define XSETGLYPH(x, p) XSETRECORD (x, p, glyph)
#define GLYPHP(x) RECORDP (x, glyph)
#define GC_GLYPHP(x) GC_RECORDP (x, glyph)
#define CHECK_GLYPH(x) CHECK_RECORD (x, glyph)
#define CONCHECK_GLYPH(x) CONCHECK_RECORD (x, glyph)

#define CHECK_BUFFER_GLYPH(x) do {			\
  CHECK_GLYPH (x);					\
  if (XGLYPH (x)->type != GLYPH_BUFFER)			\
    x = wrong_type_argument (Qbuffer_glyph_p, (x));	\
} while (0)

#define CHECK_POINTER_GLYPH(x) do {			\
  CHECK_GLYPH (x);					\
  if (XGLYPH (x)->type != GLYPH_POINTER)		\
    x = wrong_type_argument (Qpointer_glyph_p, (x));	\
} while (0)

#define CHECK_ICON_GLYPH(x) do {			\
  CHECK_GLYPH (x);					\
  if (XGLYPH (x)->type != GLYPH_ICON)			\
    x = wrong_type_argument (Qicon_glyph_p, (x));	\
} while (0)

#define GLYPH_TYPE(g) ((g)->type)
#define GLYPH_IMAGE(g) ((g)->image)
#define GLYPH_CONTRIB_P(g) ((g)->contrib_p)
#define GLYPH_BASELINE(g) ((g)->baseline)
#define GLYPH_FACE(g) ((g)->face)

#define XGLYPH_TYPE(g) GLYPH_TYPE (XGLYPH (g))
#define XGLYPH_IMAGE(g) GLYPH_IMAGE (XGLYPH (g))
#define XGLYPH_CONTRIB_P(g) GLYPH_CONTRIB_P (XGLYPH (g))
#define XGLYPH_BASELINE(g) GLYPH_BASELINE (XGLYPH (g))
#define XGLYPH_FACE(g) GLYPH_FACE (XGLYPH (g))

extern Lisp_Object Qxpm;
extern Lisp_Object Q_data, Q_file, Q_color_symbols, Qconst_glyph_variable;
extern Lisp_Object Qxbm;
extern Lisp_Object Q_mask_file, Q_mask_data, Q_hotspot_x, Q_hotspot_y;
extern Lisp_Object Q_foreground, Q_background;
extern Lisp_Object Qimage_conversion_error;
extern Lisp_Object Vcontinuation_glyph, Vcontrol_arrow_glyph, Vhscroll_glyph;
extern Lisp_Object Vinvisible_text_glyph, Voctal_escape_glyph, Vtruncation_glyph;
extern Lisp_Object Vxemacs_logo;

unsigned short glyph_width (Lisp_Object glyph, Lisp_Object frame_face,
			    face_index window_findex,
			    Lisp_Object window);
unsigned short glyph_ascent (Lisp_Object glyph,  Lisp_Object frame_face,
			     face_index window_findex,
			     Lisp_Object window);
unsigned short glyph_descent (Lisp_Object glyph,
			      Lisp_Object frame_face,
			      face_index window_findex,
			      Lisp_Object window);
unsigned short glyph_height (Lisp_Object glyph,  Lisp_Object frame_face,
			     face_index window_findex,
			     Lisp_Object window);
Lisp_Object glyph_baseline (Lisp_Object glyph, Lisp_Object domain);
Lisp_Object glyph_face (Lisp_Object glyph, Lisp_Object domain);
int glyph_contrib_p (Lisp_Object glyph, Lisp_Object domain);
Lisp_Object glyph_image_instance (Lisp_Object glyph,
				  Lisp_Object domain,
				  Error_behavior errb, int no_quit);
void file_or_data_must_be_present (Lisp_Object instantiator);
void data_must_be_present (Lisp_Object instantiator);
Lisp_Object make_string_from_file (Lisp_Object file);
Lisp_Object tagged_vector_to_alist (Lisp_Object vector);
Lisp_Object alist_to_tagged_vector (Lisp_Object tag, Lisp_Object alist);
void string_instantiate (Lisp_Object image_instance, Lisp_Object instantiator,
			 Lisp_Object pointer_fg, Lisp_Object pointer_bg,
			 int dest_mask, Lisp_Object domain);
Lisp_Object allocate_glyph (enum glyph_type type,
			    void (*after_change) (Lisp_Object glyph,
						  Lisp_Object property,
						  Lisp_Object locale));

/************************************************************************/
/*				Glyph Cachels				*/
/************************************************************************/

typedef struct glyph_cachel glyph_cachel;
struct glyph_cachel
{
  Lisp_Object glyph;

  unsigned int updated :1;
  unsigned short width;
  unsigned short ascent;
  unsigned short descent;
};

#define CONT_GLYPH_INDEX	(glyph_index) 0
#define TRUN_GLYPH_INDEX	(glyph_index) 1
#define HSCROLL_GLYPH_INDEX	(glyph_index) 2
#define CONTROL_GLYPH_INDEX	(glyph_index) 3
#define OCT_ESC_GLYPH_INDEX	(glyph_index) 4
#define INVIS_GLYPH_INDEX	(glyph_index) 5

#define GLYPH_CACHEL(window, index)			\
  Dynarr_atp (window->glyph_cachels, index)
#define GLYPH_CACHEL_GLYPH(window, index)		\
  Dynarr_atp (window->glyph_cachels, index)->glyph
#define GLYPH_CACHEL_WIDTH(window, index)		\
  Dynarr_atp (window->glyph_cachels, index)->width
#define GLYPH_CACHEL_ASCENT(window, index)		\
  Dynarr_atp (window->glyph_cachels, index)->ascent
#define GLYPH_CACHEL_DESCENT(window, index)		\
  Dynarr_atp (window->glyph_cachels, index)->descent

void mark_glyph_cachels (glyph_cachel_dynarr *elements,
			 void (*markobj) (Lisp_Object));
void mark_glyph_cachels_as_not_updated (struct window *w);
void reset_glyph_cachels (struct window *w);
#ifdef MEMORY_USAGE_STATS
int compute_glyph_cachel_usage (glyph_cachel_dynarr *glyph_cachels,
				struct overhead_stats *ovstats);
#endif /* MEMORY_USAGE_STATS */

/************************************************************************/
/*				Display Tables				*/
/************************************************************************/

#define DISP_TABLE_SIZE	256
#define DISP_CHAR_ENTRY(dp, c) ((c < (dp)->size) ? (dp)->contents[c] : Qnil)

struct Lisp_Vector *get_display_table (struct window *, face_index);

#endif /* _XEMACS_GLYPHS_H_ */
