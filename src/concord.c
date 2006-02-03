/* XEmacs routines to deal with CONCORD.
   Copyright (C) 2005 MORIOKA Tomohiko

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

/* Written by MORIOKA Tomohiko */

#include <config.h>
#include "lisp.h"
#include "sysfile.h"
#include "buffer.h"
#include <errno.h>
#include <concord.h>


EXFUN (Fread_from_string, 3);


Lisp_Object Qconcord;


typedef struct Lisp_CONCORD_DS Lisp_CONCORD_DS;
DECLARE_LRECORD (concord_ds, Lisp_CONCORD_DS);

Lisp_Object Qconcord_dsp;

struct Lisp_CONCORD_DS
{
  struct lcrecord_header header;
  CONCORD_DS ds;
};

#define XCONCORD_DS(x) XRECORD (x, concord_ds, Lisp_CONCORD_DS)
#define XSET_CONCORD_DS(x, p) XSETRECORD (x, p, concord_ds)
#define CONCORD_DS_P(x) RECORDP (x, concord_ds)
#define CHECK_CONCORD_DS(x) CHECK_RECORD (x, concord_ds)
#define CONCHECK_CONCORD_DS(x) CONCHECK_RECORD (x, concord_ds)

static Lisp_CONCORD_DS*
allocate_concord_ds (void)
{
  Lisp_CONCORD_DS* lds
    = alloc_lcrecord_type (Lisp_CONCORD_DS, &lrecord_concord_ds);

  lds->ds = NULL;
  return lds;
}

static Lisp_Object
mark_concord_ds (Lisp_Object object)
{
  return Qnil;
}

static void
print_concord_ds (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  Lisp_CONCORD_DS* lds = XCONCORD_DS (obj);

  if (print_readably)
    error ("printing unreadable object #<concord_ds 0x%x>", lds->header.uid);

  write_c_string ("#<concord_ds \"", printcharfun);
  write_c_string (concord_ds_location (lds->ds), printcharfun);
  write_c_string ("\">", printcharfun);
}

static void
finalize_concord_ds (void *header, int for_disksave)
{
  Lisp_CONCORD_DS *lds = (Lisp_CONCORD_DS *) header;

  if (for_disksave)
    {
      Lisp_Object object;
      XSET_CONCORD_DS (object, lds);

      signal_simple_error
	("Can't dump an emacs containing concord_ds objects", object);
    }
  if ( lds->ds != NULL)
    concord_close_ds (lds->ds);
}

DEFINE_LRECORD_IMPLEMENTATION ("concord_ds", concord_ds,
                               mark_concord_ds, print_concord_ds,
			       finalize_concord_ds, 0, 0, 0,
			       Lisp_CONCORD_DS);

DEFUN ("concord-close-ds", Fconcord_close_ds, 1, 1, 0, /*
Close concord-ds CONCORD-DS.
*/
       (concord_ds))
{
  Lisp_CONCORD_DS* lds;
  lds = XCONCORD_DS (concord_ds);
  if ( lds->ds != NULL)
    concord_close_ds (lds->ds);
  lds->ds = NULL;
  return Qnil;
}

DEFUN ("concord-ds-p", Fconcord_ds_p, 1, 1, 0, /*
Return t if OBJECT is a concord-ds.
*/
       (object))
{
  return CONCORD_DS_P (object) ? Qt : Qnil;
}

DEFUN ("concord-open-ds", Fconcord_open_ds, 1, 4, 0, /*
Return a new concord_ds object opened on PATH.
Optional arguments TYPE and SUBTYPE specify the concord_ds type.
Optional argument MODE gives the permissions to use when opening PATH,
and defaults to 0755.
*/
       (path, type, subtype, mode))
{
  Lisp_Object retval;
  Lisp_CONCORD_DS* lds = NULL;
  CONCORD_DS ds;
  int modemask;
  char *pathname;
  struct gcpro gcpro1;

  CHECK_STRING (path);
  GCPRO1 (path);
  path = Fexpand_file_name (path, Qnil);
  UNGCPRO;

  TO_EXTERNAL_FORMAT (LISP_STRING, path,
		      C_STRING_ALLOCA, pathname,
		      Qfile_name);

  if (NILP (mode))
    {
      modemask = 0755;		/* rwxr-xr-x */
    }
  else
    {
      CHECK_INT (mode);
      modemask = XINT (mode);
    }

  ds = concord_open_ds (CONCORD_Backend_Berkeley_DB,
			pathname, 0, modemask);
  if ( ds == NULL )
    return Qnil;

  lds = allocate_concord_ds ();
  lds->ds = ds;
  XSET_CONCORD_DS (retval, lds);
  return retval;
}


struct closure_to_list_feature
{
  Lisp_Object feature_list;
} *concord_feature_list_closure;

static int
add_feature_to_list_mapper (CONCORD_Genre genre, unsigned char* name)
{
  /* This function can GC */
  concord_feature_list_closure->feature_list
    = Fcons (intern (name), concord_feature_list_closure->feature_list);
  return 0;
}

DEFUN ("concord-feature-list", Fconcord_feature_list, 1, 2, 0, /*
Return the list of all existing features in GENRE.
*/
       (genre, ds))
{
  Lisp_CONCORD_DS* lds;
  unsigned char* genre_name;
  CONCORD_Genre c_genre;
  struct gcpro gcpro1;

  if ( !STRINGP(genre) )
    genre = Fsymbol_name (genre);
  CHECK_CONCORD_DS (ds);
  lds = XCONCORD_DS (ds);
  if (lds->ds == NULL)
    return Qnil;
  TO_EXTERNAL_FORMAT (LISP_STRING, genre,
		      C_STRING_ALLOCA, genre_name,
		      Qfile_name);
  c_genre = concord_ds_get_genre (lds->ds, genre_name);
  if (c_genre == NULL)
    return Qnil;
  concord_feature_list_closure
    = alloca (sizeof (struct closure_to_list_feature));
  concord_feature_list_closure->feature_list = Qnil;
  GCPRO1 (concord_feature_list_closure->feature_list);
  concord_genre_foreach_feature_name (c_genre,
				      add_feature_to_list_mapper);
  UNGCPRO;
  return concord_feature_list_closure->feature_list;
}


typedef struct Lisp_CONCORD_Object Lisp_CONCORD_Object;
DECLARE_LRECORD (concord_object, Lisp_CONCORD_Object);

Lisp_Object Qconcord_objectp;

struct Lisp_CONCORD_Object
{
  struct lcrecord_header header;
  CONCORD_Genre genre;
  Lisp_Object id;
};

#define XCONCORD_OBJECT(x) XRECORD (x, concord_object, Lisp_CONCORD_Object)
#define XSET_CONCORD_OBJECT(x, p) XSETRECORD (x, p, concord_object)
#define CONCORD_OBJECT_P(x) RECORDP (x, concord_object)
#define CHECK_CONCORD_OBJECT(x) CHECK_RECORD (x, concord_object)
#define CONCHECK_CONCORD_OBJECT(x) CONCHECK_RECORD (x, concord_object)
#define CONCORD_OBJECT_GENRE(x)	((x)->genre)
#define CONCORD_OBJECT_ID(x)	((x)->id)
#define XCONCORD_OBJECT_ID(x)	CONCORD_OBJECT_ID (XCONCORD_OBJECT(x))
#define XCONCORD_OBJECT_GENRE(x) CONCORD_OBJECT_GENRE (XCONCORD_OBJECT(x))

static Lisp_CONCORD_Object*
allocate_concord_object (void)
{
  Lisp_CONCORD_Object* lcobj
    = alloc_lcrecord_type (Lisp_CONCORD_Object, &lrecord_concord_object);

  lcobj->genre = NULL;
  lcobj->id = Qunbound;
  return lcobj;
}

static Lisp_Object
mark_concord_object (Lisp_Object object)
{
  mark_object (XCONCORD_OBJECT_ID(object));
  return Qnil;
}

static void
print_concord_object (Lisp_Object obj,
		      Lisp_Object printcharfun, int escapeflag)
{
  Lisp_CONCORD_Object* lcobj = XCONCORD_OBJECT (obj);
  struct gcpro gcpro1, gcpro2;

  if (print_readably)
    error ("printing unreadable object #<concord_object 0x%x>",
	   lcobj->header.uid);

  write_c_string ("#<concord_object \"", printcharfun);
  write_c_string (concord_ds_location
		  (concord_genre_get_data_source (lcobj->genre)),
		  printcharfun);
  write_c_string (":", printcharfun);
  write_c_string (concord_genre_get_name (lcobj->genre), printcharfun);
  write_c_string (";", printcharfun);
  GCPRO2 (obj, printcharfun);
  print_internal (lcobj->id, printcharfun, escapeflag);
  UNGCPRO;
  write_c_string ("\">", printcharfun);
}

static void
finalize_concord_object (void *header, int for_disksave)
{
  Lisp_CONCORD_Object* lcobj = (Lisp_CONCORD_Object *) header;

  if (for_disksave)
    {
      Lisp_Object object;
      XSET_CONCORD_OBJECT (object, lcobj);

      signal_simple_error
	("Can't dump an emacs containing concord_object objects", object);
    }
}

static const struct lrecord_description concord_object_description[] = {
  { XD_LISP_OBJECT, offsetof (Lisp_CONCORD_Object, id) },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("concord_object", concord_object,
                               mark_concord_object, print_concord_object,
			       finalize_concord_object, 0, 0,
			       concord_object_description,
			       Lisp_CONCORD_Object);

DEFUN ("concord-make-object",
       Fconcord_make_object, 1, 3, 0, /*
Make and return a Concord-object from ID and GENRE.
Optional argument DS specifies the data-source of the GENRE.
*/
       (id, genre, ds))
{
  Lisp_CONCORD_DS* lds;
  unsigned char* genre_name;
  CONCORD_Genre c_genre;
  Lisp_CONCORD_Object* lcobj;
  Lisp_Object retval;

  if ( !STRINGP(genre) )
    genre = Fsymbol_name (genre);
  CHECK_CONCORD_DS (ds);
  lds = XCONCORD_DS (ds);
  if (lds->ds == NULL)
    return Qnil;
  TO_EXTERNAL_FORMAT (LISP_STRING, genre,
		      C_STRING_ALLOCA, genre_name,
		      Qfile_name);
  c_genre = concord_ds_get_genre (lds->ds, genre_name);
  if (c_genre == NULL)
    return Qnil;
  lcobj = allocate_concord_object ();
  lcobj->genre = c_genre;
  lcobj->id = id;
  XSET_CONCORD_OBJECT (retval, lcobj);
  return retval;
}

DEFUN ("concord-object-p",
       Fconcord_object_p, 1, 1, 0, /*
Return t if OBJECT is a concord-object.
*/
       (object))
{
  return CONCORD_OBJECT_P (object) ? Qt : Qnil;
}

DEFUN ("concord-object-id",
       Fconcord_object_id, 1, 1, 0, /*
Return an id of Concord-object OBJECT.
*/
       (object))
{
  CHECK_CONCORD_OBJECT (object);
  return XCONCORD_OBJECT_ID (object);
}

DEFUN ("concord-decode-object",
       Fconcord_decode_object, 2, 4, 0, /*
Make and return a Concord-object from FEATURE and VALUE.
Optional argument GENRE specifies the GENRE of the object.
Optional argument DS specifies the data-source of the GENRE.
*/
       (feature, value, genre, ds))
{
  Lisp_CONCORD_DS* lds;
  unsigned char* genre_name;
  CONCORD_Genre c_genre;
  unsigned char* feature_name;
  CONCORD_INDEX c_index;
  Lisp_Object value_string;
  unsigned char* strid;
  CONCORD_String_Tank st_id;
  int status;
  Lisp_Object obj;
  struct gcpro gcpro1, gcpro2, gcpro3, gcpro4, gcpro5;

  if ( !STRINGP(feature) )
    feature = Fsymbol_name (feature);
  if ( !STRINGP(genre) )
    genre = Fsymbol_name (genre);
  CHECK_CONCORD_DS (ds);
  lds = XCONCORD_DS (ds);
  if (lds->ds == NULL)
    return Qnil;

  TO_EXTERNAL_FORMAT (LISP_STRING, genre,
		      C_STRING_ALLOCA, genre_name,
		      Qfile_name);
  c_genre = concord_ds_get_genre (lds->ds, genre_name);
  if (c_genre == NULL)
    {
      return Qnil;
    }

  TO_EXTERNAL_FORMAT (LISP_STRING, feature,
		      C_STRING_ALLOCA, feature_name,
		      Qfile_name);
  c_index = concord_genre_get_index (c_genre, feature_name);
  if (c_index == NULL)
    {
      return Qnil;
    }

  GCPRO5 (feature, value, genre, ds, value_string);
  value_string = Fprin1_to_string (value, Qnil);
  UNGCPRO;
  TO_EXTERNAL_FORMAT (LISP_STRING,
		      value_string, C_STRING_ALLOCA, strid,
		      Qfile_name);
  status = concord_index_strid_get_obj_string (c_index, strid, &st_id);
  if (!status)
    {
      GCPRO3 (genre, ds, obj);
#if 0
      obj = read_from_c_string (CONCORD_String_data (&st_id),
				CONCORD_String_size (&st_id) );
#else
      obj = Fcar (Fread_from_string (make_ext_string
				     (CONCORD_String_data (&st_id),
				      CONCORD_String_size (&st_id),
				      Qfile_name),
				     Qnil, Qnil));
#endif
      UNGCPRO;
      return Fconcord_make_object (obj, genre, ds);
    }
  return Qnil;
}

DEFUN ("concord-object-get",
       Fconcord_object_get, 2, 2, 0, /*
Return the value of OBJECT's FEATURE.
*/
       (object, feature))
{
  struct gcpro gcpro1, gcpro2;
  Lisp_Object obj_string;
  unsigned char* c_obj;
  CONCORD_Genre c_genre;
  unsigned char* feature_name;
  CONCORD_Feature c_feature;
  int status;
  CONCORD_String_Tank st_value;

  CHECK_CONCORD_OBJECT (object);
  if ( !STRINGP(feature) )
    feature = Fsymbol_name (feature);
  GCPRO2 (object, feature);
  obj_string = Fprin1_to_string (XCONCORD_OBJECT_ID(object), Qnil);
  UNGCPRO;
  TO_EXTERNAL_FORMAT (LISP_STRING, obj_string,
		      C_STRING_ALLOCA, c_obj, Qfile_name);
  c_genre = XCONCORD_OBJECT_GENRE(object);
  TO_EXTERNAL_FORMAT (LISP_STRING, feature,
		      C_STRING_ALLOCA, feature_name,
		      Qfile_name);
  c_feature = concord_genre_get_feature (c_genre, feature_name);
  if (c_feature == NULL)
    {
      return Qnil;
    }
  status = concord_obj_get_feature_value_string (c_obj, c_feature,
						 &st_value);
  if (!status)
    {
      return
	Fcar (Fread_from_string (make_ext_string
				 (CONCORD_String_data (&st_value),
				  CONCORD_String_size (&st_value),
				  Qfile_name),
				 Qnil, Qnil));
    }
  return Qnil;
}

DEFUN ("concord-object-put",
       Fconcord_object_put, 3, 3, 0, /*
Store a VALUE of OBJECT's FEATURE.
*/
       (object, feature, value))
{
  struct gcpro gcpro1, gcpro2, gcpro3;
  Lisp_Object obj_string;
  unsigned char* c_obj;
  CONCORD_Genre c_genre;
  unsigned char* feature_name;
  CONCORD_Feature c_feature;
  int status;
  Lisp_Object value_string;
  unsigned char* c_value;

  CHECK_CONCORD_OBJECT (object);
  if ( !STRINGP(feature) )
    feature = Fsymbol_name (feature);
  GCPRO3 (object, feature, value);
  obj_string = Fprin1_to_string (XCONCORD_OBJECT_ID(object), Qnil);
  UNGCPRO;
  TO_EXTERNAL_FORMAT (LISP_STRING, obj_string,
		      C_STRING_ALLOCA, c_obj, Qfile_name);
  c_genre = XCONCORD_OBJECT_GENRE(object);
  TO_EXTERNAL_FORMAT (LISP_STRING, feature,
		      C_STRING_ALLOCA, feature_name,
		      Qfile_name);
  c_feature = concord_genre_get_feature (c_genre, feature_name);
  if (c_feature == NULL)
    {
      return Qnil;
    }
  GCPRO3 (object, feature, value);
  value_string = Fprin1_to_string (value, Qnil);
  UNGCPRO;
  TO_EXTERNAL_FORMAT (LISP_STRING, value_string,
		      C_STRING_ALLOCA, c_value,
		      Qfile_name);
  status = concord_obj_put_feature_value_str (c_obj, c_feature, c_value);
  if (status)
    return Qnil;
  status = chise_feature_sync (c_feature);
  if (status)
    return Qnil;
  return Qt;
}

struct closure_for_object_spec
{
  unsigned char* object_id;
  Lisp_Object spec;
} *concord_object_spec_closure;

static int
add_feature_to_spec_mapper (CONCORD_Genre genre, unsigned char* name)
{
  /* This function can GC */
  CONCORD_String_Tank st_value;
  CONCORD_Feature c_feature;
  int status;

  c_feature = concord_genre_get_feature (genre, name);
  if (c_feature == NULL)
    return 0;

  status =
    concord_obj_get_feature_value_string
    (concord_object_spec_closure->object_id, c_feature, &st_value);
  if (!status)
    {
      concord_object_spec_closure->spec
	= Fcons (Fcons (intern (name),
			Fcar (Fread_from_string
			      (make_ext_string
			       (CONCORD_String_data (&st_value),
				CONCORD_String_size (&st_value),
				Qfile_name),
			       Qnil, Qnil))),
		 concord_object_spec_closure->spec);
    }
  return 0;
}

DEFUN ("concord-object-spec", Fconcord_object_spec, 1, 1, 0, /*
Return the spec of OBJECT.
*/
       (object))
{
  Lisp_Object obj_string;
  unsigned char* c_obj;
  CONCORD_Genre c_genre;
  struct gcpro gcpro1, gcpro2;

  CHECK_CONCORD_OBJECT (object);
  GCPRO1 (object);
  obj_string = Fprin1_to_string (XCONCORD_OBJECT_ID(object), Qnil);
  UNGCPRO;
  TO_EXTERNAL_FORMAT (LISP_STRING, obj_string,
		      C_STRING_ALLOCA, c_obj, Qfile_name);
  c_genre = XCONCORD_OBJECT_GENRE(object);
  concord_object_spec_closure
    = alloca (sizeof (struct closure_for_object_spec));
  concord_object_spec_closure->object_id = c_obj;
  concord_object_spec_closure->spec = Qnil;
  GCPRO2 (object, concord_object_spec_closure->spec);
  concord_genre_foreach_feature_name (c_genre,
				      add_feature_to_spec_mapper);
  UNGCPRO;
  return concord_object_spec_closure->spec;
}

struct closure_for_each_object
{
  Lisp_Object function;
  Lisp_Object genre;
  Lisp_Object ds;
} *for_each_object_closure;

static int
func_for_each_object (CONCORD_String object_id,
		      CONCORD_Feature feature,
		      CONCORD_String value)
{
  Lisp_Object obj, val, ret;

#if 0
  obj = read_from_c_string (CONCORD_String_data (object_id),
			    CONCORD_String_size (object_id) );
#else
  obj = Fcar (Fread_from_string (make_ext_string
				 (CONCORD_String_data (object_id),
				  CONCORD_String_size (object_id),
				  Qfile_name),
				 Qnil, Qnil));
#endif
  obj = Fconcord_make_object (obj,
			      for_each_object_closure->genre,
			      for_each_object_closure->ds);
#if 0
  val = read_from_c_string (CONCORD_String_data (value),
			    CONCORD_String_size (value) );
#else
  val = Fcar (Fread_from_string (make_ext_string
				 (CONCORD_String_data (value),
				  CONCORD_String_size (value),
				  Qfile_name),
				 Qnil, Qnil));
#endif
  ret = call2 (for_each_object_closure->function, obj, val);
  return !NILP (ret);
}

DEFUN ("concord-for-each-object-in-feature",
       Fconcord_foreach_object_in_feature, 2, 4, 0, /*
Do FUNCTION over objects in FEATURE, calling it with two args,
each key and value in the FEATURE table.
Optional argument GENRE specifies the genre of the FEATURE.
When the FUNCTION returns non-nil, it breaks the repeat.
*/
       (function, feature, genre, ds))
{
  Lisp_CONCORD_DS* lds;
  unsigned char* genre_name;
  CONCORD_Genre c_genre;
  unsigned char* feature_name;
  CONCORD_Feature c_feature;

  if ( !STRINGP(feature) )
    feature = Fsymbol_name (feature);
  if ( !STRINGP(genre) )
    genre = Fsymbol_name (genre);
  CHECK_CONCORD_DS (ds);
  lds = XCONCORD_DS (ds);
  if (lds->ds == NULL)
    return Qnil;
  TO_EXTERNAL_FORMAT (LISP_STRING, genre,
		      C_STRING_ALLOCA, genre_name,
		      Qfile_name);
  c_genre = concord_ds_get_genre (lds->ds, genre_name);
  if (c_genre == NULL)
    return Qnil;

  CHECK_STRING (feature);
  TO_EXTERNAL_FORMAT (LISP_STRING, feature,
		      C_STRING_ALLOCA, feature_name,
		      Qfile_name);
  c_feature = concord_genre_get_feature (c_genre, feature_name);
  if (c_feature == NULL)
    return Qnil;
  for_each_object_closure
    = alloca (sizeof (struct closure_for_each_object));
  for_each_object_closure->function = function;
  for_each_object_closure->genre = genre;
  for_each_object_closure->ds = ds;
  concord_feature_foreach_obj_string (c_feature, func_for_each_object);
  return Qt;
}

void
syms_of_concord (void)
{
  INIT_LRECORD_IMPLEMENTATION (concord_ds);
  INIT_LRECORD_IMPLEMENTATION (concord_object);

  defsymbol (&Qconcord, "concord");
  defsymbol (&Qconcord_dsp, "concord-dsp");
  defsymbol (&Qconcord_objectp, "concord-objectp");

  DEFSUBR (Fconcord_open_ds);
  DEFSUBR (Fconcord_ds_p);
  DEFSUBR (Fconcord_close_ds);
  DEFSUBR (Fconcord_feature_list);
  DEFSUBR (Fconcord_make_object);
  DEFSUBR (Fconcord_object_p);
  DEFSUBR (Fconcord_object_id);
  DEFSUBR (Fconcord_decode_object);
  DEFSUBR (Fconcord_object_get);
  DEFSUBR (Fconcord_object_put);
  DEFSUBR (Fconcord_object_spec);
  DEFSUBR (Fconcord_foreach_object_in_feature);
}

void
vars_of_concord (void)
{
  Fprovide (Qconcord);
}
