/* Functions to handle multilingual characters.
   Copyright (C) 1992, 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1999,2000 MORIOKA Tomohiko

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

/* Synched up with: FSF 20.3.  Not in FSF. */

/* Rewritten by Ben Wing <ben@xemacs.org>. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "chartab.h"
#include "elhash.h"
#include "lstream.h"
#include "device.h"
#include "faces.h"
#include "mule-ccl.h"

/* The various pre-defined charsets. */

Lisp_Object Vcharset_ascii;
Lisp_Object Vcharset_control_1;
Lisp_Object Vcharset_latin_iso8859_1;
Lisp_Object Vcharset_latin_iso8859_2;
Lisp_Object Vcharset_latin_iso8859_3;
Lisp_Object Vcharset_latin_iso8859_4;
Lisp_Object Vcharset_thai_tis620;
Lisp_Object Vcharset_greek_iso8859_7;
Lisp_Object Vcharset_arabic_iso8859_6;
Lisp_Object Vcharset_hebrew_iso8859_8;
Lisp_Object Vcharset_katakana_jisx0201;
Lisp_Object Vcharset_latin_jisx0201;
Lisp_Object Vcharset_cyrillic_iso8859_5;
Lisp_Object Vcharset_latin_iso8859_9;
Lisp_Object Vcharset_japanese_jisx0208_1978;
Lisp_Object Vcharset_chinese_gb2312;
Lisp_Object Vcharset_japanese_jisx0208;
Lisp_Object Vcharset_japanese_jisx0208_1990;
Lisp_Object Vcharset_korean_ksc5601;
Lisp_Object Vcharset_japanese_jisx0212;
Lisp_Object Vcharset_chinese_cns11643_1;
Lisp_Object Vcharset_chinese_cns11643_2;
#ifdef UTF2000
Lisp_Object Vcharset_ucs;
Lisp_Object Vcharset_ucs_bmp;
Lisp_Object Vcharset_latin_viscii;
Lisp_Object Vcharset_latin_tcvn5712;
Lisp_Object Vcharset_latin_viscii_lower;
Lisp_Object Vcharset_latin_viscii_upper;
Lisp_Object Vcharset_ideograph_daikanwa;
Lisp_Object Vcharset_mojikyo;
Lisp_Object Vcharset_mojikyo_pj_1;
Lisp_Object Vcharset_mojikyo_pj_2;
Lisp_Object Vcharset_mojikyo_pj_3;
Lisp_Object Vcharset_mojikyo_pj_4;
Lisp_Object Vcharset_mojikyo_pj_5;
Lisp_Object Vcharset_mojikyo_pj_6;
Lisp_Object Vcharset_mojikyo_pj_7;
Lisp_Object Vcharset_mojikyo_pj_8;
Lisp_Object Vcharset_mojikyo_pj_9;
Lisp_Object Vcharset_mojikyo_pj_10;
Lisp_Object Vcharset_mojikyo_pj_11;
Lisp_Object Vcharset_mojikyo_pj_12;
Lisp_Object Vcharset_mojikyo_pj_13;
Lisp_Object Vcharset_mojikyo_pj_14;
Lisp_Object Vcharset_mojikyo_pj_15;
Lisp_Object Vcharset_mojikyo_pj_16;
Lisp_Object Vcharset_mojikyo_pj_17;
Lisp_Object Vcharset_mojikyo_pj_18;
Lisp_Object Vcharset_mojikyo_pj_19;
Lisp_Object Vcharset_mojikyo_pj_20;
Lisp_Object Vcharset_mojikyo_pj_21;
Lisp_Object Vcharset_ethiopic_ucs;
#endif
Lisp_Object Vcharset_chinese_big5_1;
Lisp_Object Vcharset_chinese_big5_2;

#ifdef ENABLE_COMPOSITE_CHARS
Lisp_Object Vcharset_composite;

/* Hash tables for composite chars.  One maps string representing
   composed chars to their equivalent chars; one goes the
   other way. */
Lisp_Object Vcomposite_char_char2string_hash_table;
Lisp_Object Vcomposite_char_string2char_hash_table;

static int composite_char_row_next;
static int composite_char_col_next;

#endif /* ENABLE_COMPOSITE_CHARS */

struct charset_lookup *chlook;

static const struct lrecord_description charset_lookup_description_1[] = {
  { XD_LISP_OBJECT_ARRAY, offsetof (struct charset_lookup, charset_by_leading_byte),
#ifdef UTF2000
    128+4*128
#else
    128+4*128*2 
#endif
  }, { XD_END }
};

static const struct struct_description charset_lookup_description = {
  sizeof (struct charset_lookup),
  charset_lookup_description_1
};

#ifndef UTF2000
/* Table of number of bytes in the string representation of a character
   indexed by the first byte of that representation.

   rep_bytes_by_first_byte(c) is more efficient than the equivalent
   canonical computation:

   XCHARSET_REP_BYTES (CHARSET_BY_LEADING_BYTE (c)) */

const Bytecount rep_bytes_by_first_byte[0xA0] =
{ /* 0x00 - 0x7f are for straight ASCII */
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  /* 0x80 - 0x8f are for Dimension-1 official charsets */
#ifdef CHAR_IS_UCS4
  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
#else
  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
#endif
  /* 0x90 - 0x9d are for Dimension-2 official charsets */
  /* 0x9e is for Dimension-1 private charsets */
  /* 0x9f is for Dimension-2 private charsets */
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4
};
#endif

#ifdef UTF2000

static Lisp_Object
mark_byte_table (Lisp_Object obj)
{
  Lisp_Byte_Table *cte = XBYTE_TABLE (obj);
  int i;

  for (i = 0; i < 256; i++)
    {
      mark_object (cte->property[i]);
    }
  return Qnil;
}

static int
byte_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Byte_Table *cte1 = XBYTE_TABLE (obj1);
  Lisp_Byte_Table *cte2 = XBYTE_TABLE (obj2);
  int i;

  for (i = 0; i < 256; i++)
    if (BYTE_TABLE_P (cte1->property[i]))
      {
	if (BYTE_TABLE_P (cte2->property[i]))
	  {
	    if (!byte_table_equal (cte1->property[i],
				   cte2->property[i], depth + 1))
	      return 0;
	  }
	else
	  return 0;
      }
    else
      if (!internal_equal (cte1->property[i], cte2->property[i], depth + 1))
	return 0;
  return 1;
}

static unsigned long
byte_table_hash (Lisp_Object obj, int depth)
{
  Lisp_Byte_Table *cte = XBYTE_TABLE (obj);

  return internal_array_hash (cte->property, 256, depth);
}

static const struct lrecord_description byte_table_description[] = {
  { XD_LISP_OBJECT_ARRAY, offsetof(Lisp_Byte_Table, property), 256 },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("byte-table", byte_table,
                               mark_byte_table,
			       internal_object_printer,
			       0, byte_table_equal,
			       byte_table_hash,
			       byte_table_description,
			       Lisp_Byte_Table);

static Lisp_Object
make_byte_table (Lisp_Object initval)
{
  Lisp_Object obj;
  int i;
  Lisp_Byte_Table *cte
    = alloc_lcrecord_type (Lisp_Byte_Table, &lrecord_byte_table);

  for (i = 0; i < 256; i++)
    cte->property[i] = initval;

  XSETBYTE_TABLE (obj, cte);
  return obj;
}

static Lisp_Object
copy_byte_table (Lisp_Object entry)
{
  Lisp_Byte_Table *cte = XBYTE_TABLE (entry);
  Lisp_Object obj;
  int i;
  Lisp_Byte_Table *ctenew
    = alloc_lcrecord_type (Lisp_Byte_Table, &lrecord_byte_table);

  for (i = 0; i < 256; i++)
    {
      Lisp_Object new = cte->property[i];
      if (BYTE_TABLE_P (new))
	ctenew->property[i] = copy_byte_table (new);
      else
	ctenew->property[i] = new;
    }

  XSETBYTE_TABLE (obj, ctenew);
  return obj;
}


static Lisp_Object
mark_char_id_table (Lisp_Object obj)
{
  Lisp_Char_ID_Table *cte = XCHAR_ID_TABLE (obj);

  return cte->table;
}

static int
char_id_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Char_ID_Table *cte1 = XCHAR_ID_TABLE (obj1);
  Lisp_Char_ID_Table *cte2 = XCHAR_ID_TABLE (obj2);

  return byte_table_equal (cte1->table, cte2->table, depth + 1);
}

static unsigned long
char_id_table_hash (Lisp_Object obj, int depth)
{
  Lisp_Char_ID_Table *cte = XCHAR_ID_TABLE (obj);

  return char_id_table_hash (cte->table, depth + 1);
}

static const struct lrecord_description char_id_table_description[] = {
  { XD_LISP_OBJECT, offsetof(Lisp_Char_ID_Table, table) },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("char-id-table", char_id_table,
                               mark_char_id_table,
			       internal_object_printer,
			       0, char_id_table_equal,
			       char_id_table_hash,
			       char_id_table_description,
			       Lisp_Char_ID_Table);

static Lisp_Object
make_char_id_table (Lisp_Object initval)
{
  Lisp_Object obj;
  Lisp_Char_ID_Table *cte
    = alloc_lcrecord_type (Lisp_Char_ID_Table, &lrecord_char_id_table);

  cte->table = make_byte_table (initval);

  XSETCHAR_ID_TABLE (obj, cte);
  return obj;
}

static Lisp_Object
copy_char_id_table (Lisp_Object entry)
{
  Lisp_Char_ID_Table *cte = XCHAR_ID_TABLE (entry);
  Lisp_Object obj;
  Lisp_Char_ID_Table *ctenew
    = alloc_lcrecord_type (Lisp_Char_ID_Table, &lrecord_char_id_table);

  ctenew->table = copy_byte_table (cte->table);
  XSETCHAR_ID_TABLE (obj, ctenew);
  return obj;
}


Lisp_Object
get_char_id_table (Emchar ch, Lisp_Object table)
{
  unsigned int code = ch;
  Lisp_Byte_Table* cpt
    = XBYTE_TABLE (XCHAR_ID_TABLE (table)->table);
  Lisp_Object ret = cpt->property [(unsigned char)(code >> 24)];

  if (BYTE_TABLE_P (ret))
    cpt = XBYTE_TABLE (ret);
  else
    return ret;

  ret = cpt->property [(unsigned char) (code >> 16)];
  if (BYTE_TABLE_P (ret))
    cpt = XBYTE_TABLE (ret);
  else
    return ret;

  ret = cpt->property [(unsigned char) (code >> 8)];
  if (BYTE_TABLE_P (ret))
    cpt = XBYTE_TABLE (ret);
  else
    return ret;
  
  return cpt->property [(unsigned char) code];
}

void put_char_id_table (Emchar ch, Lisp_Object value, Lisp_Object table);
void
put_char_id_table (Emchar ch, Lisp_Object value, Lisp_Object table)
{
  unsigned int code = ch;
  Lisp_Byte_Table* cpt1 = XBYTE_TABLE (XCHAR_ID_TABLE (table)->table);
  Lisp_Object ret = cpt1->property[(unsigned char)(code >> 24)];

  if (BYTE_TABLE_P (ret))
    {
      Lisp_Byte_Table* cpt2 = XBYTE_TABLE (ret);
      
      ret = cpt2->property[(unsigned char)(code >> 16)];
      if (BYTE_TABLE_P (ret))
	{
	  Lisp_Byte_Table* cpt3 = XBYTE_TABLE (ret);
	  
	  ret = cpt3->property[(unsigned char)(code >> 8)];
	  if (BYTE_TABLE_P (ret))
	    {
	      Lisp_Byte_Table* cpt4 = XBYTE_TABLE (ret);
	      
	      cpt4->property[(unsigned char)code] = value;
	    }
	  else if (!EQ (ret, value))
	    {
	      Lisp_Object cpt4 = make_byte_table (ret);
	      
	      XBYTE_TABLE(cpt4)->property[(unsigned char)code] = value;
	      cpt3->property[(unsigned char)(code >> 8)] = cpt4;
	    }
	}
      else if (!EQ (ret, value))
	{
	  Lisp_Object cpt3 = make_byte_table (ret);
	  Lisp_Object cpt4 = make_byte_table (ret);
	  
	  XBYTE_TABLE(cpt4)->property[(unsigned char)code] = value;
	  XBYTE_TABLE(cpt3)->property[(unsigned char)(code >> 8)]
	    = cpt4;
	  cpt2->property[(unsigned char)(code >> 16)] = cpt3;
	}
    }
  else if (!EQ (ret, value))
    {
      Lisp_Object cpt2 = make_byte_table (ret);
      Lisp_Object cpt3 = make_byte_table (ret);
      Lisp_Object cpt4 = make_byte_table (ret);
      
      XBYTE_TABLE(cpt4)->property[(unsigned char)code] = value;
      XBYTE_TABLE(cpt3)->property[(unsigned char)(code >>  8)] = cpt4;
      XBYTE_TABLE(cpt2)->property[(unsigned char)(code >> 16)] = cpt3;
      cpt1->property[(unsigned char)(code >> 24)] = cpt2;
    }
}


Lisp_Object Vcharacter_attribute_table;
Lisp_Object Vcharacter_composition_table;
Lisp_Object Vcharacter_variant_table;

Lisp_Object Q_decomposition;
Lisp_Object Q_ucs;
Lisp_Object Qcompat;
Lisp_Object Qisolated;
Lisp_Object Qinitial;
Lisp_Object Qmedial;
Lisp_Object Qfinal;
Lisp_Object Qvertical;
Lisp_Object QnoBreak;
Lisp_Object Qfraction;
Lisp_Object Qsuper;
Lisp_Object Qsub;
Lisp_Object Qcircle;
Lisp_Object Qsquare;
Lisp_Object Qwide;
Lisp_Object Qnarrow;
Lisp_Object Qsmall;
Lisp_Object Qfont;

Emchar to_char_id (Lisp_Object v, char* err_msg, Lisp_Object err_arg);
Emchar
to_char_id (Lisp_Object v, char* err_msg, Lisp_Object err_arg)
{
  if (INTP (v))
    return XINT (v);
  if (CHARP (v))
    return XCHAR (v);
  else if (EQ (v, Qcompat))
    return -1;
  else if (EQ (v, Qisolated))
    return -2;
  else if (EQ (v, Qinitial))
    return -3;
  else if (EQ (v, Qmedial))
    return -4;
  else if (EQ (v, Qfinal))
    return -5;
  else if (EQ (v, Qvertical))
    return -6;
  else if (EQ (v, QnoBreak))
    return -7;
  else if (EQ (v, Qfraction))
    return -8;
  else if (EQ (v, Qsuper))
    return -9;
  else if (EQ (v, Qsub))
    return -10;
  else if (EQ (v, Qcircle))
    return -11;
  else if (EQ (v, Qsquare))
    return -12;
  else if (EQ (v, Qwide))
    return -13;
  else if (EQ (v, Qnarrow))
    return -14;
  else if (EQ (v, Qsmall))
    return -15;
  else if (EQ (v, Qfont))
    return -16;
  else 
    signal_simple_error (err_msg, err_arg);
}

DEFUN ("get-composite-char", Fget_composite_char, 1, 1, 0, /*
Return character corresponding with list.
*/
       (list))
{
  Lisp_Object table = Vcharacter_composition_table;
  Lisp_Object rest = list;

  while (CONSP (rest))
    {
      Lisp_Object v = Fcar (rest);
      Lisp_Object ret;
      Emchar c = to_char_id (v, "Invalid value for composition", list);

      ret = get_char_id_table (c, table);

      rest = Fcdr (rest);
      if (NILP (rest))
	{
	  if (!CHAR_ID_TABLE_P (ret))
	    return ret;
	  else
	    return Qt;
	}
      else if (!CONSP (rest))
	break;
      else if (CHAR_ID_TABLE_P (ret))
	table = ret;
      else
	signal_simple_error ("Invalid table is found with", list);
    }
  signal_simple_error ("Invalid value for composition", list);
}

DEFUN ("char-variants", Fchar_variants, 1, 1, 0, /*
Return variants of CHARACTER.
*/
       (character))
{
  CHECK_CHAR (character);
  return Fcopy_list (get_char_id_table (XCHAR (character),
					Vcharacter_variant_table));
}

DEFUN ("char-attribute-alist", Fchar_attribute_alist, 1, 1, 0, /*
Return the alist of attributes of CHARACTER.
*/
       (character))
{
  CHECK_CHAR (character);
  return Fcopy_alist (get_char_id_table (XCHAR (character),
					 Vcharacter_attribute_table));
}

DEFUN ("get-char-attribute", Fget_char_attribute, 2, 2, 0, /*
Return the value of CHARACTER's ATTRIBUTE.
*/
       (character, attribute))
{
  Lisp_Object ccs;

  CHECK_CHAR (character);
  if (!NILP (ccs = Ffind_charset (attribute)))
    {
      Lisp_Object encoding_table = XCHARSET_ENCODING_TABLE (ccs);

      if (CHAR_ID_TABLE_P (encoding_table))
	return get_char_id_table (XCHAR (character), encoding_table);
      else
	return Qnil;
    }
  else
    {
      Lisp_Object ret
	= get_char_id_table (XCHAR (character), Vcharacter_attribute_table);

      if (EQ (ret, Qnil))
	return Qnil;
      else
	return Fcdr (Fassq (attribute, ret));
    }
}

Lisp_Object put_char_attribute (Lisp_Object character,
				Lisp_Object attribute, Lisp_Object value);
Lisp_Object
put_char_attribute (Lisp_Object character, Lisp_Object attribute,
		    Lisp_Object value)
{
  Emchar char_id = XCHAR (character);
  Lisp_Object ret = get_char_id_table (char_id, Vcharacter_attribute_table);
  Lisp_Object cell;

  cell = Fassq (attribute, ret);

  if (NILP (cell))
    {
      ret = Fcons (Fcons (attribute, value), ret);
    }
  else if (!EQ (Fcdr (cell), value))
    {
      Fsetcdr (cell, value);
    }
  put_char_id_table (char_id, ret, Vcharacter_attribute_table);
  return ret;
}

Lisp_Object remove_char_attribute (Lisp_Object character,
				   Lisp_Object attribute);
Lisp_Object
remove_char_attribute (Lisp_Object character, Lisp_Object attribute)
{
  Emchar char_id = XCHAR (character);
  Lisp_Object alist = get_char_id_table (char_id, Vcharacter_attribute_table);

  if (EQ (attribute, Fcar (Fcar (alist))))
    {
      alist = Fcdr (alist);
    }
  else
    {
      Lisp_Object pr = alist;
      Lisp_Object r = Fcdr (alist);

      while (!NILP (r))
	{
	  if (EQ (attribute, Fcar (Fcar (r))))
	    {
	      XCDR (pr) = Fcdr (r);
	      break;
	    }
	  pr = r;
	  r = Fcdr (r);
	}
    }
  put_char_id_table (char_id, alist, Vcharacter_attribute_table);
  return alist;
}

Lisp_Object Qucs;

DEFUN ("put-char-attribute", Fput_char_attribute, 3, 3, 0, /*
Store CHARACTER's ATTRIBUTE with VALUE.
*/
       (character, attribute, value))
{
  Lisp_Object ccs;

  CHECK_CHAR (character);
  ccs = Ffind_charset (attribute);
  if (!NILP (ccs))
    {
      Lisp_Object encoding_table;

      if (!EQ (XCHARSET_NAME (ccs), Qucs)
	  || (XCHAR (character) != XINT (value)))
	{
	  Lisp_Object cpos, rest;
	  Lisp_Object v = XCHARSET_DECODING_TABLE (ccs);
	  Lisp_Object nv;
	  int i = -1;
	  int ccs_len;
	  int dim;
	  int code_point;

	  /* ad-hoc method for `ascii' */
	  if ((XCHARSET_CHARS (ccs) == 94) &&
	      (XCHARSET_BYTE_OFFSET (ccs) != 33))
	    ccs_len = 128 - XCHARSET_BYTE_OFFSET (ccs);
	  else
	    ccs_len = XCHARSET_CHARS (ccs);

	  if (CONSP (value))
	    {
	      Lisp_Object ret = Fcar (value);

	      if (!INTP (ret))
		signal_simple_error ("Invalid value for coded-charset", value);
	      code_point = XINT (ret);
	      if (XCHARSET_GRAPHIC (ccs) == 1)
		code_point &= 0x7F;
	      rest = Fcdr (value);
	      while (!NILP (rest))
		{
		  int j;

		  if (!CONSP (rest))
		    signal_simple_error ("Invalid value for coded-charset",
					 value);
		  ret = Fcar (rest);
		  if (!INTP (ret))
		    signal_simple_error ("Invalid value for coded-charset",
					 value);
		  j = XINT (ret);
		  if (XCHARSET_GRAPHIC (ccs) == 1)
		    j &= 0x7F;
		  code_point = (code_point << 8) | j;
		  rest = Fcdr (rest);
		}
	      value = make_int (code_point);
	    }
	  else if (INTP (value))
	    {
	      if (XCHARSET_GRAPHIC (ccs) == 1)
		value = make_int (XINT (value) & 0x7F7F7F7F);
	    }
	  else
	    signal_simple_error ("Invalid value for coded-charset", value);

	  attribute = ccs;
	  cpos = Fget_char_attribute (character, attribute);
	  if (VECTORP (v))
	    {
	      if (!NILP (cpos))
		{
		  dim = XCHARSET_DIMENSION (ccs);
		  code_point = XINT (cpos);
		  while (dim > 0)
		    {
		      dim--;
		      i = ((code_point >> (8 * dim)) & 255)
			- XCHARSET_BYTE_OFFSET (ccs);
		      nv = XVECTOR_DATA(v)[i];
		      if (!VECTORP (nv))
			break;
		      v = nv;
		    }
		  if (i >= 0)
		    XVECTOR_DATA(v)[i] = Qnil;
		  v = XCHARSET_DECODING_TABLE (ccs);
		}
	    }
	  else
	    {
	      XCHARSET_DECODING_TABLE (ccs) = v
		= make_older_vector (ccs_len, Qnil);
	    }

	  dim = XCHARSET_DIMENSION (ccs);
	  code_point = XINT (value);
	  i = -1;
	  while (dim > 0)
	    {
	      dim--;
	      i = ((code_point >> (8 * dim)) & 255)
		- XCHARSET_BYTE_OFFSET (ccs);
	      nv = XVECTOR_DATA(v)[i];
	      if (dim > 0)
		{
		  if (!VECTORP (nv))
		    nv = (XVECTOR_DATA(v)[i]
			  = make_older_vector (ccs_len, Qnil));
		  v = nv;
		}
	      else
		break;
	    }
	  XVECTOR_DATA(v)[i] = character;
	}
      else
	attribute = ccs;
      if (NILP (encoding_table = XCHARSET_ENCODING_TABLE (ccs)))
	{
	  XCHARSET_ENCODING_TABLE (ccs) = encoding_table
	    = make_char_id_table (Qnil);
	}
      put_char_id_table (XCHAR (character), value, encoding_table);
      return Qt;
    }
  else if (EQ (attribute, Q_decomposition))
    {
      if (!CONSP (value))
	signal_simple_error ("Invalid value for ->decomposition",
			     value);

      if (CONSP (Fcdr (value)))
	{
	  Lisp_Object rest = value;
	  Lisp_Object table = Vcharacter_composition_table;

	  while (CONSP (rest))
	    {
	      Lisp_Object v = Fcar (rest);
	      Lisp_Object ntable;
	      Emchar c
		= to_char_id (v, "Invalid value for ->decomposition", value);

	      rest = Fcdr (rest);
	      if (!CONSP (rest))
		{
		  put_char_id_table (c, character, table);
		  break;
		}
	      else
		{
		  ntable = get_char_id_table (c, table);
		  if (!CHAR_ID_TABLE_P (ntable))
		    {
		      ntable = make_char_id_table (Qnil);
		      put_char_id_table (c, ntable, table);
		    }
		  table = ntable;
		}
	    }
	}
      else
	{
	  Lisp_Object v = Fcar (value);

	  if (INTP (v))
	    {
	      Emchar c = XINT (v);
	      Lisp_Object ret
		= get_char_id_table (c, Vcharacter_variant_table);

	      if (NILP (Fmemq (v, ret)))
		{
		  put_char_id_table (c, Fcons (character, ret),
				     Vcharacter_variant_table);
		}
	    }
	}
    }
  else if (EQ (attribute, Q_ucs))
    {
      Lisp_Object ret;
      Emchar c;

      if (!INTP (value))
	signal_simple_error ("Invalid value for ->ucs", value);

      c = XINT (value);

      ret = get_char_id_table (c, Vcharacter_variant_table);
      if (NILP (Fmemq (character, ret)))
	{
	  put_char_id_table (c, Fcons (character, ret),
			     Vcharacter_variant_table);
	}
    }
  return put_char_attribute (character, attribute, value);
}
  
DEFUN ("remove-char-attribute", Fremove_char_attribute, 2, 2, 0, /*
Remove CHARACTER's ATTRIBUTE.
*/
       (character, attribute))
{
  Lisp_Object ccs;

  CHECK_CHAR (character);
  ccs = Ffind_charset (attribute);
  if (!NILP (ccs))
    {
      Lisp_Object cpos;
      Lisp_Object v = XCHARSET_DECODING_TABLE (ccs);
      Lisp_Object nv;
      int i = -1;
      int ccs_len;
      int dim;
      int code_point;
      Lisp_Object encoding_table;

      /* ad-hoc method for `ascii' */
      if ((XCHARSET_CHARS (ccs) == 94) &&
	  (XCHARSET_BYTE_OFFSET (ccs) != 33))
	ccs_len = 128 - XCHARSET_BYTE_OFFSET (ccs);
      else
	ccs_len = XCHARSET_CHARS (ccs);

      attribute = ccs;
      cpos = Fget_char_attribute (character, attribute);
      if (VECTORP (v))
	{
	  if (!NILP (cpos))
	    {
	      dim = XCHARSET_DIMENSION (ccs);
	      code_point = XINT (cpos);
	      while (dim > 0)
		{
		  dim--;
		  i = ((code_point >> (8 * dim)) & 255)
		    - XCHARSET_BYTE_OFFSET (ccs);
		  nv = XVECTOR_DATA(v)[i];
		  if (!VECTORP (nv))
		    break;
		  v = nv;
		}
	      if (i >= 0)
		XVECTOR_DATA(v)[i] = Qnil;
	      v = XCHARSET_DECODING_TABLE (ccs);
	    }
	}
      if (!NILP (encoding_table = XCHARSET_ENCODING_TABLE (ccs)))
	{
	  put_char_id_table (XCHAR (character), Qnil, encoding_table);
	}
      return Qt;
    }
  return remove_char_attribute (character, attribute);
}

EXFUN (Fmake_char, 3);
EXFUN (Fdecode_char, 2);

DEFUN ("define-char", Fdefine_char, 1, 1, 0, /*
Store character's ATTRIBUTES.
*/
       (attributes))
{
  Lisp_Object rest = attributes;
  Lisp_Object code = Fcdr (Fassq (Qucs, attributes));
  Lisp_Object character;

  if (NILP (code))
    {
      while (CONSP (rest))
	{
	  Lisp_Object cell = Fcar (rest);
	  Lisp_Object ccs;

	  if (!LISTP (cell))
	    signal_simple_error ("Invalid argument", attributes);
	  if (!NILP (ccs = Ffind_charset (Fcar (cell)))
	      && ((XCHARSET_FINAL (ccs) != 0) ||
		  (XCHARSET_UCS_MAX (ccs) > 0)) )
	    {
	      cell = Fcdr (cell);
	      if (CONSP (cell))
		character = Fmake_char (ccs, Fcar (cell), Fcar (Fcdr (cell)));
	      else
		character = Fdecode_char (ccs, cell);
	      goto setup_attributes;
	    }
	  rest = Fcdr (rest);
	}
      if (!NILP (code = Fcdr (Fassq (Q_ucs, attributes))))
	{
	  if (!INTP (code))
	    signal_simple_error ("Invalid argument", attributes);
	  else
	    character = make_char (XINT (code) + 0x100000);
	  goto setup_attributes;
	}
      return Qnil;
    }
  else if (!INTP (code))
    signal_simple_error ("Invalid argument", attributes);
  else
    character = make_char (XINT (code));

 setup_attributes:
  rest = attributes;
  while (CONSP (rest))
    {
      Lisp_Object cell = Fcar (rest);

      if (!LISTP (cell))
	signal_simple_error ("Invalid argument", attributes);
      Fput_char_attribute (character, Fcar (cell), Fcdr (cell));
      rest = Fcdr (rest);
    }
  return
    get_char_id_table (XCHAR (character), Vcharacter_attribute_table);
}

Lisp_Object Vutf_2000_version;
#endif

#ifndef UTF2000
int leading_code_private_11;
#endif

Lisp_Object Qcharsetp;

/* Qdoc_string, Qdimension, Qchars defined in general.c */
Lisp_Object Qregistry, Qfinal, Qgraphic;
Lisp_Object Qdirection;
Lisp_Object Qreverse_direction_charset;
Lisp_Object Qleading_byte;
Lisp_Object Qshort_name, Qlong_name;

Lisp_Object Qascii,
  Qcontrol_1,
  Qlatin_iso8859_1,
  Qlatin_iso8859_2,
  Qlatin_iso8859_3,
  Qlatin_iso8859_4,
  Qthai_tis620,
  Qgreek_iso8859_7,
  Qarabic_iso8859_6,
  Qhebrew_iso8859_8,
  Qkatakana_jisx0201,
  Qlatin_jisx0201,
  Qcyrillic_iso8859_5,
  Qlatin_iso8859_9,
  Qjapanese_jisx0208_1978,
  Qchinese_gb2312,
  Qjapanese_jisx0208,
  Qjapanese_jisx0208_1990,
  Qkorean_ksc5601,
  Qjapanese_jisx0212,
  Qchinese_cns11643_1,
  Qchinese_cns11643_2,
#ifdef UTF2000
  Qucs_bmp,
  Qlatin_viscii,
  Qlatin_tcvn5712,
  Qlatin_viscii_lower,
  Qlatin_viscii_upper,
  Qvietnamese_viscii_lower,
  Qvietnamese_viscii_upper,
  Qideograph_daikanwa,
  Qmojikyo,
  Qmojikyo_pj_1,
  Qmojikyo_pj_2,
  Qmojikyo_pj_3,
  Qmojikyo_pj_4,
  Qmojikyo_pj_5,
  Qmojikyo_pj_6,
  Qmojikyo_pj_7,
  Qmojikyo_pj_8,
  Qmojikyo_pj_9,
  Qmojikyo_pj_10,
  Qmojikyo_pj_11,
  Qmojikyo_pj_12,
  Qmojikyo_pj_13,
  Qmojikyo_pj_14,
  Qmojikyo_pj_15,
  Qmojikyo_pj_16,
  Qmojikyo_pj_17,
  Qmojikyo_pj_18,
  Qmojikyo_pj_19,
  Qmojikyo_pj_20,
  Qmojikyo_pj_21,
  Qethiopic_ucs,
#endif
  Qchinese_big5_1,
  Qchinese_big5_2,
  Qcomposite;

Lisp_Object Ql2r, Qr2l;

Lisp_Object Vcharset_hash_table;

/* Composite characters are characters constructed by overstriking two
   or more regular characters.

   1) The old Mule implementation involves storing composite characters
      in a buffer as a tag followed by all of the actual characters
      used to make up the composite character.  I think this is a bad
      idea; it greatly complicates code that wants to handle strings
      one character at a time because it has to deal with the possibility
      of great big ungainly characters.  It's much more reasonable to
      simply store an index into a table of composite characters.

   2) The current implementation only allows for 16,384 separate
      composite characters over the lifetime of the XEmacs process.
      This could become a potential problem if the user
      edited lots of different files that use composite characters.
      Due to FSF bogosity, increasing the number of allowable
      composite characters under Mule would decrease the number
      of possible faces that can exist.  Mule already has shrunk
      this to 2048, and further shrinkage would become uncomfortable.
      No such problems exist in XEmacs.

      Composite characters could be represented as 0x80 C1 C2 C3,
      where each C[1-3] is in the range 0xA0 - 0xFF.  This allows
      for slightly under 2^20 (one million) composite characters
      over the XEmacs process lifetime, and you only need to
      increase the size of a Mule character from 19 to 21 bits.
      Or you could use 0x80 C1 C2 C3 C4, allowing for about
      85 million (slightly over 2^26) composite characters. */


/************************************************************************/
/*                       Basic Emchar functions                         */
/************************************************************************/

/* Convert a non-ASCII Mule character C into a one-character Mule-encoded
   string in STR.  Returns the number of bytes stored.
   Do not call this directly.  Use the macro set_charptr_emchar() instead.
 */

Bytecount
non_ascii_set_charptr_emchar (Bufbyte *str, Emchar c)
{
  Bufbyte *p;
#ifndef UTF2000
  Charset_ID lb;
  int c1, c2;
  Lisp_Object charset;
#endif

  p = str;
#ifdef UTF2000
  if ( c <= 0x7f )
    {
      *p++ = c;
    }
  else if ( c <= 0x7ff )
    {
      *p++ = (c >> 6) | 0xc0;
      *p++ = (c & 0x3f) | 0x80;
    }
  else if ( c <= 0xffff )
    {
      *p++ =  (c >> 12) | 0xe0;
      *p++ = ((c >>  6) & 0x3f) | 0x80;
      *p++ =  (c        & 0x3f) | 0x80;
    }
  else if ( c <= 0x1fffff )
    {
      *p++ =  (c >> 18) | 0xf0;
      *p++ = ((c >> 12) & 0x3f) | 0x80;
      *p++ = ((c >>  6) & 0x3f) | 0x80;
      *p++ =  (c        & 0x3f) | 0x80;
    }
  else if ( c <= 0x3ffffff )
    {
      *p++ =  (c >> 24) | 0xf8;
      *p++ = ((c >> 18) & 0x3f) | 0x80;
      *p++ = ((c >> 12) & 0x3f) | 0x80;
      *p++ = ((c >>  6) & 0x3f) | 0x80;
      *p++ =  (c        & 0x3f) | 0x80;
    }
  else
    {
      *p++ =  (c >> 30) | 0xfc;
      *p++ = ((c >> 24) & 0x3f) | 0x80;
      *p++ = ((c >> 18) & 0x3f) | 0x80;
      *p++ = ((c >> 12) & 0x3f) | 0x80;
      *p++ = ((c >>  6) & 0x3f) | 0x80;
      *p++ =  (c        & 0x3f) | 0x80;
    }
#else
  BREAKUP_CHAR (c, charset, c1, c2);
  lb = CHAR_LEADING_BYTE (c);
  if (LEADING_BYTE_PRIVATE_P (lb))
    *p++ = PRIVATE_LEADING_BYTE_PREFIX (lb);
  *p++ = lb;
  if (EQ (charset, Vcharset_control_1))
    c1 += 0x20;
  *p++ = c1 | 0x80;
  if (c2)
    *p++ = c2 | 0x80;
#endif
  return (p - str);
}

/* Return the first character from a Mule-encoded string in STR,
   assuming it's non-ASCII.  Do not call this directly.
   Use the macro charptr_emchar() instead. */

Emchar
non_ascii_charptr_emchar (const Bufbyte *str)
{
#ifdef UTF2000
  Bufbyte b;
  Emchar ch;
  int len;

  b = *str++;
  if ( b >= 0xfc )
    {
      ch = (b & 0x01);
      len = 5;
    }
  else if ( b >= 0xf8 )
    {
      ch = b & 0x03;
      len = 4;
    }
  else if ( b >= 0xf0 )
    {
      ch = b & 0x07;
      len = 3;
    }
  else if ( b >= 0xe0 )
    {
      ch = b & 0x0f;
      len = 2;
    }
  else if ( b >= 0xc0 )
    {
      ch = b & 0x1f;
      len = 1;
    }
  else
    {
      ch = b;
      len = 0;
    }
  for( ; len > 0; len-- )
    {
      b = *str++;
      ch = ( ch << 6 ) | ( b & 0x3f );
    }
  return ch;
#else
  Bufbyte i0 = *str, i1, i2 = 0;
  Lisp_Object charset;

  if (i0 == LEADING_BYTE_CONTROL_1)
    return (Emchar) (*++str - 0x20);

  if (LEADING_BYTE_PREFIX_P (i0))
    i0 = *++str;

  i1 = *++str & 0x7F;

  charset = CHARSET_BY_LEADING_BYTE (i0);
  if (XCHARSET_DIMENSION (charset) == 2)
    i2 = *++str & 0x7F;

  return MAKE_CHAR (charset, i1, i2);
#endif
}

/* Return whether CH is a valid Emchar, assuming it's non-ASCII.
   Do not call this directly.  Use the macro valid_char_p() instead. */

#ifndef UTF2000
int
non_ascii_valid_char_p (Emchar ch)
{
  int f1, f2, f3;

  /* Must have only lowest 19 bits set */
  if (ch & ~0x7FFFF)
    return 0;

  f1 = CHAR_FIELD1 (ch);
  f2 = CHAR_FIELD2 (ch);
  f3 = CHAR_FIELD3 (ch);

  if (f1 == 0)
    {
      Lisp_Object charset;

      if (f2 < MIN_CHAR_FIELD2_OFFICIAL ||
	  (f2 > MAX_CHAR_FIELD2_OFFICIAL && f2 < MIN_CHAR_FIELD2_PRIVATE) ||
	   f2 > MAX_CHAR_FIELD2_PRIVATE)
	return 0;
      if (f3 < 0x20)
	return 0;

      if (f3 != 0x20 && f3 != 0x7F && !(f2 >= MIN_CHAR_FIELD2_PRIVATE &&
					f2 <= MAX_CHAR_FIELD2_PRIVATE))
	return 1;

      /*
	 NOTE: This takes advantage of the fact that
	 FIELD2_TO_OFFICIAL_LEADING_BYTE and
	 FIELD2_TO_PRIVATE_LEADING_BYTE are the same.
	 */
      charset = CHARSET_BY_LEADING_BYTE (f2 + FIELD2_TO_OFFICIAL_LEADING_BYTE);
      if (EQ (charset, Qnil))
	return 0;
      return (XCHARSET_CHARS (charset) == 96);
    }
  else
    {
      Lisp_Object charset;

      if (f1 < MIN_CHAR_FIELD1_OFFICIAL ||
	  (f1 > MAX_CHAR_FIELD1_OFFICIAL && f1 < MIN_CHAR_FIELD1_PRIVATE) ||
	  f1 > MAX_CHAR_FIELD1_PRIVATE)
	return 0;
      if (f2 < 0x20 || f3 < 0x20)
	return 0;

#ifdef ENABLE_COMPOSITE_CHARS
      if (f1 + FIELD1_TO_OFFICIAL_LEADING_BYTE == LEADING_BYTE_COMPOSITE)
	{
	  if (UNBOUNDP (Fgethash (make_int (ch),
				  Vcomposite_char_char2string_hash_table,
				  Qunbound)))
	    return 0;
	  return 1;
	}
#endif /* ENABLE_COMPOSITE_CHARS */

      if (f2 != 0x20 && f2 != 0x7F && f3 != 0x20 && f3 != 0x7F
	  && !(f1 >= MIN_CHAR_FIELD1_PRIVATE && f1 <= MAX_CHAR_FIELD1_PRIVATE))
	return 1;

      if (f1 <= MAX_CHAR_FIELD1_OFFICIAL)
	charset =
	  CHARSET_BY_LEADING_BYTE (f1 + FIELD1_TO_OFFICIAL_LEADING_BYTE);
      else
	charset =
	  CHARSET_BY_LEADING_BYTE (f1 + FIELD1_TO_PRIVATE_LEADING_BYTE);

      if (EQ (charset, Qnil))
	return 0;
      return (XCHARSET_CHARS (charset) == 96);
    }
}
#endif


/************************************************************************/
/*                       Basic string functions                         */
/************************************************************************/

/* Copy the character pointed to by PTR into STR, assuming it's
   non-ASCII.  Do not call this directly.  Use the macro
   charptr_copy_char() instead. */

Bytecount
non_ascii_charptr_copy_char (const Bufbyte *ptr, Bufbyte *str)
{
  Bufbyte *strptr = str;
  *strptr = *ptr++;
  switch (REP_BYTES_BY_FIRST_BYTE (*strptr))
    {
      /* Notice fallthrough. */
#ifdef UTF2000
    case 6: *++strptr = *ptr++;
    case 5: *++strptr = *ptr++;
#endif
    case 4: *++strptr = *ptr++;
    case 3: *++strptr = *ptr++;
    case 2: *++strptr = *ptr;
      break;
    default:
      abort ();
    }
  return strptr + 1 - str;
}


/************************************************************************/
/*                        streams of Emchars                            */
/************************************************************************/

/* Treat a stream as a stream of Emchar's rather than a stream of bytes.
   The functions below are not meant to be called directly; use
   the macros in insdel.h. */

Emchar
Lstream_get_emchar_1 (Lstream *stream, int ch)
{
  Bufbyte str[MAX_EMCHAR_LEN];
  Bufbyte *strptr = str;

  str[0] = (Bufbyte) ch;
  switch (REP_BYTES_BY_FIRST_BYTE (ch))
    {
      /* Notice fallthrough. */
#ifdef UTF2000
    case 6:
      ch = Lstream_getc (stream);
      assert (ch >= 0);
      *++strptr = (Bufbyte) ch;
    case 5:
      ch = Lstream_getc (stream);
      assert (ch >= 0);
      *++strptr = (Bufbyte) ch;
#endif
    case 4:
      ch = Lstream_getc (stream);
      assert (ch >= 0);
      *++strptr = (Bufbyte) ch;
    case 3:
      ch = Lstream_getc (stream);
      assert (ch >= 0);
      *++strptr = (Bufbyte) ch;
    case 2:
      ch = Lstream_getc (stream);
      assert (ch >= 0);
      *++strptr = (Bufbyte) ch;
      break;
    default:
      abort ();
    }
  return charptr_emchar (str);
}

int
Lstream_fput_emchar (Lstream *stream, Emchar ch)
{
  Bufbyte str[MAX_EMCHAR_LEN];
  Bytecount len = set_charptr_emchar (str, ch);
  return Lstream_write (stream, str, len);
}

void
Lstream_funget_emchar (Lstream *stream, Emchar ch)
{
  Bufbyte str[MAX_EMCHAR_LEN];
  Bytecount len = set_charptr_emchar (str, ch);
  Lstream_unread (stream, str, len);
}


/************************************************************************/
/*                            charset object                            */
/************************************************************************/

static Lisp_Object
mark_charset (Lisp_Object obj)
{
  Lisp_Charset *cs = XCHARSET (obj);

  mark_object (cs->short_name);
  mark_object (cs->long_name);
  mark_object (cs->doc_string);
  mark_object (cs->registry);
  mark_object (cs->ccl_program);
#ifdef UTF2000
  mark_object (cs->encoding_table);
  /* mark_object (cs->decoding_table); */
#endif
  return cs->name;
}

static void
print_charset (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  Lisp_Charset *cs = XCHARSET (obj);
  char buf[200];

  if (print_readably)
    error ("printing unreadable object #<charset %s 0x%x>",
           string_data (XSYMBOL (CHARSET_NAME (cs))->name),
	   cs->header.uid);

  write_c_string ("#<charset ", printcharfun);
  print_internal (CHARSET_NAME (cs), printcharfun, 0);
  write_c_string (" ", printcharfun);
  print_internal (CHARSET_SHORT_NAME (cs), printcharfun, 1);
  write_c_string (" ", printcharfun);
  print_internal (CHARSET_LONG_NAME (cs), printcharfun, 1);
  write_c_string (" ", printcharfun);
  print_internal (CHARSET_DOC_STRING (cs), printcharfun, 1);
  sprintf (buf, " %d^%d %s cols=%d g%d final='%c' reg=",
	   CHARSET_CHARS (cs),
	   CHARSET_DIMENSION (cs),
	   CHARSET_DIRECTION (cs) == CHARSET_LEFT_TO_RIGHT ? "l2r" : "r2l",
	   CHARSET_COLUMNS (cs),
	   CHARSET_GRAPHIC (cs),
	   CHARSET_FINAL (cs));
  write_c_string (buf, printcharfun);
  print_internal (CHARSET_REGISTRY (cs), printcharfun, 0);
  sprintf (buf, " 0x%x>", cs->header.uid);
  write_c_string (buf, printcharfun);
}

static const struct lrecord_description charset_description[] = {
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, name) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, doc_string) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, registry) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, short_name) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, long_name) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, reverse_direction_charset) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, ccl_program) },
#ifdef UTF2000
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, decoding_table) },
  { XD_LISP_OBJECT, offsetof (Lisp_Charset, encoding_table) },
#endif
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("charset", charset,
                               mark_charset, print_charset, 0, 0, 0,
			       charset_description,
			       Lisp_Charset);
/* Make a new charset. */

static Lisp_Object
make_charset (Charset_ID id, Lisp_Object name,
	      unsigned short chars, unsigned char dimension,
	      unsigned char columns, unsigned char graphic,
	      Bufbyte final, unsigned char direction, Lisp_Object short_name,
	      Lisp_Object long_name, Lisp_Object doc,
	      Lisp_Object reg,
	      Lisp_Object decoding_table,
	      Emchar ucs_min, Emchar ucs_max,
	      Emchar code_offset, unsigned char byte_offset)
{
  unsigned char type = 0;
  Lisp_Object obj;
  Lisp_Charset *cs = alloc_lcrecord_type (Lisp_Charset, &lrecord_charset);

  zero_lcrecord (cs);

  XSETCHARSET (obj, cs);

  CHARSET_ID		(cs) = id;
  CHARSET_NAME		(cs) = name;
  CHARSET_SHORT_NAME	(cs) = short_name;
  CHARSET_LONG_NAME	(cs) = long_name;
  CHARSET_CHARS		(cs) = chars;
  CHARSET_DIMENSION	(cs) = dimension;
  CHARSET_DIRECTION	(cs) = direction;
  CHARSET_COLUMNS	(cs) = columns;
  CHARSET_GRAPHIC	(cs) = graphic;
  CHARSET_FINAL		(cs) = final;
  CHARSET_DOC_STRING	(cs) = doc;
  CHARSET_REGISTRY	(cs) = reg;
  CHARSET_CCL_PROGRAM	(cs) = Qnil;
  CHARSET_REVERSE_DIRECTION_CHARSET (cs) = Qnil;
#ifdef UTF2000
  CHARSET_DECODING_TABLE(cs) = Qnil;
  CHARSET_ENCODING_TABLE(cs) = Qnil;
  CHARSET_UCS_MIN(cs) = ucs_min;
  CHARSET_UCS_MAX(cs) = ucs_max;
  CHARSET_CODE_OFFSET(cs) = code_offset;
  CHARSET_BYTE_OFFSET(cs) = byte_offset;
#endif

  switch (CHARSET_CHARS (cs))
    {
    case 94:
      switch (CHARSET_DIMENSION (cs))
	{
	case 1:
	  type = CHARSET_TYPE_94;
	  break;
	case 2:
	  type = CHARSET_TYPE_94X94;
	  break;
	}
      break;
    case 96:
      switch (CHARSET_DIMENSION (cs))
	{
	case 1:
	  type = CHARSET_TYPE_96;
	  break;
	case 2:
	  type = CHARSET_TYPE_96X96;
	  break;
	}
      break;
#ifdef UTF2000
    case 128:
      switch (CHARSET_DIMENSION (cs))
	{
	case 1:
	  type = CHARSET_TYPE_128;
	  break;
	case 2:
	  type = CHARSET_TYPE_128X128;
	  break;
	}
      break;
    case 256:
      switch (CHARSET_DIMENSION (cs))
	{
	case 1:
	  type = CHARSET_TYPE_256;
	  break;
	case 2:
	  type = CHARSET_TYPE_256X256;
	  break;
	}
      break;
#endif
    }
#ifndef UTF2000
  CHARSET_TYPE (cs) = type;
#endif

#ifndef UTF2000
  if (id == LEADING_BYTE_ASCII)
    CHARSET_REP_BYTES (cs) = 1;
  else if (id < 0xA0)
    CHARSET_REP_BYTES (cs) = CHARSET_DIMENSION (cs) + 1;
  else
    CHARSET_REP_BYTES (cs) = CHARSET_DIMENSION (cs) + 2;
#endif

  if (final)
    {
      /* some charsets do not have final characters.  This includes
	 ASCII, Control-1, Composite, and the two faux private
	 charsets. */
#if UTF2000
      if (code_offset == 0)
	{
	  assert (NILP (chlook->charset_by_attributes[type][final]));
	  chlook->charset_by_attributes[type][final] = obj;
	}
#else
      assert (NILP (chlook->charset_by_attributes[type][final][direction]));
      chlook->charset_by_attributes[type][final][direction] = obj;
#endif
    }

  assert (NILP (chlook->charset_by_leading_byte[id - MIN_LEADING_BYTE]));
  chlook->charset_by_leading_byte[id - MIN_LEADING_BYTE] = obj;

  /* Some charsets are "faux" and don't have names or really exist at
     all except in the leading-byte table. */
  if (!NILP (name))
    Fputhash (name, obj, Vcharset_hash_table);
  return obj;
}

static int
get_unallocated_leading_byte (int dimension)
{
  Charset_ID lb;

#ifdef UTF2000
  if (chlook->next_allocated_leading_byte > MAX_LEADING_BYTE_PRIVATE)
    lb = 0;
  else
    lb = chlook->next_allocated_leading_byte++;
#else
  if (dimension == 1)
    {
      if (chlook->next_allocated_1_byte_leading_byte > MAX_LEADING_BYTE_PRIVATE_1)
	lb = 0;
      else
	lb = chlook->next_allocated_1_byte_leading_byte++;
    }
  else
    {
      if (chlook->next_allocated_2_byte_leading_byte > MAX_LEADING_BYTE_PRIVATE_2)
	lb = 0;
      else
	lb = chlook->next_allocated_2_byte_leading_byte++;
    }
#endif

  if (!lb)
    signal_simple_error
      ("No more character sets free for this dimension",
       make_int (dimension));

  return lb;
}

#ifdef UTF2000
Emchar
make_builtin_char (Lisp_Object charset, int c1, int c2)
{
  if (XCHARSET_UCS_MAX (charset))
    {
      Emchar code
	= (XCHARSET_DIMENSION (charset) == 1
	   ?
	   c1 - XCHARSET_BYTE_OFFSET (charset)
	   :
	   (c1 - XCHARSET_BYTE_OFFSET (charset)) * XCHARSET_CHARS (charset)
	   + c2  - XCHARSET_BYTE_OFFSET (charset))
	- XCHARSET_CODE_OFFSET (charset) + XCHARSET_UCS_MIN (charset);
      if ((code < XCHARSET_UCS_MIN (charset))
	  || (XCHARSET_UCS_MAX (charset) < code))
	signal_simple_error ("Arguments makes invalid character",
			     make_char (code));
      return code;
    }
  else if (XCHARSET_DIMENSION (charset) == 1)
    {
      switch (XCHARSET_CHARS (charset))
	{
	case 94:
	  return MIN_CHAR_94
	    + (XCHARSET_FINAL (charset) - '0') * 94 + (c1 - 33);
	case 96:
	  return MIN_CHAR_96
	    + (XCHARSET_FINAL (charset) - '0') * 96 + (c1 - 32);
	default:
	  abort ();
	}
    }
  else
    {
      switch (XCHARSET_CHARS (charset))
	{
	case 94:
	  return MIN_CHAR_94x94
	    + (XCHARSET_FINAL (charset) - '0') * 94 * 94
	    + (c1 - 33) * 94 + (c2 - 33);
	case 96:
	  return MIN_CHAR_96x96
	    + (XCHARSET_FINAL (charset) - '0') * 96 * 96
	    + (c1 - 32) * 96 + (c2 - 32);
	default:
	  abort ();
	}
    }
}

int
range_charset_code_point (Lisp_Object charset, Emchar ch)
{
  int d;

  if ((XCHARSET_UCS_MIN (charset) <= ch)
      && (ch <= XCHARSET_UCS_MAX (charset)))
    {
      d = ch - XCHARSET_UCS_MIN (charset) + XCHARSET_CODE_OFFSET (charset);

      if (XCHARSET_CHARS (charset) == 256)
	return d;
      else if (XCHARSET_DIMENSION (charset) == 1)
	return d + XCHARSET_BYTE_OFFSET (charset);
      else if (XCHARSET_DIMENSION (charset) == 2)
	return
	  ((d / XCHARSET_CHARS (charset)
	    + XCHARSET_BYTE_OFFSET (charset)) << 8)
	  | (d % XCHARSET_CHARS (charset) + XCHARSET_BYTE_OFFSET (charset));
      else if (XCHARSET_DIMENSION (charset) == 3)
	return
	  ((d / (XCHARSET_CHARS (charset) * XCHARSET_CHARS (charset))
	    + XCHARSET_BYTE_OFFSET (charset)) << 16)
	  | ((d / XCHARSET_CHARS (charset)
	      % XCHARSET_CHARS (charset)
	      + XCHARSET_BYTE_OFFSET (charset)) << 8)
	  | (d % XCHARSET_CHARS (charset) + XCHARSET_BYTE_OFFSET (charset));
      else /* if (XCHARSET_DIMENSION (charset) == 4) */
	return
	  ((d / (XCHARSET_CHARS (charset)
		 * XCHARSET_CHARS (charset) * XCHARSET_CHARS (charset))
	    + XCHARSET_BYTE_OFFSET (charset)) << 24)
	  | ((d / (XCHARSET_CHARS (charset) * XCHARSET_CHARS (charset))
	      % XCHARSET_CHARS (charset)
	      + XCHARSET_BYTE_OFFSET (charset)) << 16)
	  | ((d / XCHARSET_CHARS (charset) % XCHARSET_CHARS (charset)
	      + XCHARSET_BYTE_OFFSET (charset)) << 8)
	  | (d % XCHARSET_CHARS (charset) + XCHARSET_BYTE_OFFSET (charset));
    }
  else if (XCHARSET_CODE_OFFSET (charset) == 0)
    {
      if (XCHARSET_DIMENSION (charset) == 1)
	{
	  if (XCHARSET_CHARS (charset) == 94)
	    {
	      if (((d = ch - (MIN_CHAR_94
			      + (XCHARSET_FINAL (charset) - '0') * 94)) >= 0)
		  && (d < 94))
		return d + 33;
	    }
	  else if (XCHARSET_CHARS (charset) == 96)
	    {
	      if (((d = ch - (MIN_CHAR_96
			      + (XCHARSET_FINAL (charset) - '0') * 96)) >= 0)
		  && (d < 96))
		return d + 32;
	    }
	  else
	    return -1;
	}
      else if (XCHARSET_DIMENSION (charset) == 2)
	{
	  if (XCHARSET_CHARS (charset) == 94)
	    {
	      if (((d = ch - (MIN_CHAR_94x94
			      + (XCHARSET_FINAL (charset) - '0') * 94 * 94))
		   >= 0)
		  && (d < 94 * 94))
		return (((d / 94) + 33) << 8) | (d % 94 + 33);
	    }
	  else if (XCHARSET_CHARS (charset) == 96)
	    {
	      if (((d = ch - (MIN_CHAR_96x96
			      + (XCHARSET_FINAL (charset) - '0') * 96 * 96))
		   >= 0)
		  && (d < 96 * 96))
		return (((d / 96) + 32) << 8) | (d % 96 + 32);
	    }
	  else
	    return -1;
	}
    }
  return -1;
}

int
encode_builtin_char_1 (Emchar c, Lisp_Object* charset)
{
  if (c <= MAX_CHAR_BASIC_LATIN)
    {
      *charset = Vcharset_ascii;
      return c;
    }
  else if (c < 0xA0)
    {
      *charset = Vcharset_control_1;
      return c & 0x7F;
    }
  else if (c <= 0xff)
    {
      *charset = Vcharset_latin_iso8859_1;
      return c & 0x7F;
    }
  /*
  else if ((MIN_CHAR_GREEK <= c) && (c <= MAX_CHAR_GREEK))
    {
      *charset = Vcharset_greek_iso8859_7;
      return c - MIN_CHAR_GREEK + 0x20;
    }
  else if ((MIN_CHAR_CYRILLIC <= c) && (c <= MAX_CHAR_CYRILLIC))
    {
      *charset = Vcharset_cyrillic_iso8859_5;
      return c - MIN_CHAR_CYRILLIC + 0x20;
    }
  */
  else if ((MIN_CHAR_HEBREW <= c) && (c <= MAX_CHAR_HEBREW))
    {
      *charset = Vcharset_hebrew_iso8859_8;
      return c - MIN_CHAR_HEBREW + 0x20;
    }
  else if ((MIN_CHAR_THAI <= c) && (c <= MAX_CHAR_THAI))
    {
      *charset = Vcharset_thai_tis620;
      return c - MIN_CHAR_THAI + 0x20;
    }
  /*
  else if ((MIN_CHAR_HALFWIDTH_KATAKANA <= c)
	   && (c <= MAX_CHAR_HALFWIDTH_KATAKANA))
    {
      return list2 (Vcharset_katakana_jisx0201,
		    make_int (c - MIN_CHAR_HALFWIDTH_KATAKANA + 33));
    }
  */
  else if (c <= MAX_CHAR_BMP)
    {
      *charset = Vcharset_ucs_bmp;
      return c;
    }
  else if (c < MIN_CHAR_DAIKANWA)
    {
      *charset = Vcharset_ucs;
      return c;
    }
  /*
  else if (c <= MAX_CHAR_DAIKANWA)
    {
      *charset = Vcharset_ideograph_daikanwa;
      return c - MIN_CHAR_DAIKANWA;
    }
  */
  else if (c <= MAX_CHAR_MOJIKYO)
    {
      *charset = Vcharset_mojikyo;
      return c - MIN_CHAR_MOJIKYO;
    }
  else if (c < MIN_CHAR_94)
    {
      *charset = Vcharset_ucs;
      return c;
    }
  else if (c <= MAX_CHAR_94)
    {
      *charset = CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_94,
					((c - MIN_CHAR_94) / 94) + '0',
					CHARSET_LEFT_TO_RIGHT);
      if (!NILP (*charset))
	return ((c - MIN_CHAR_94) % 94) + 33;
      else
	{
	  *charset = Vcharset_ucs;
	  return c;
	}
    }
  else if (c <= MAX_CHAR_96)
    {
      *charset = CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_96,
					((c - MIN_CHAR_96) / 96) + '0',
					CHARSET_LEFT_TO_RIGHT);
      if (!NILP (*charset))
	return ((c - MIN_CHAR_96) % 96) + 32;
      else
	{
	  *charset = Vcharset_ucs;
	  return c;
	}
    }
  else if (c <= MAX_CHAR_94x94)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_94X94,
				 ((c - MIN_CHAR_94x94) / (94 * 94)) + '0',
				 CHARSET_LEFT_TO_RIGHT);
      if (!NILP (*charset))
	return (((((c - MIN_CHAR_94x94) / 94) % 94) + 33) << 8)
	  | (((c - MIN_CHAR_94x94) % 94) + 33);
      else
	{
	  *charset = Vcharset_ucs;
	  return c;
	}
    }
  else if (c <= MAX_CHAR_96x96)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_96X96,
				 ((c - MIN_CHAR_96x96) / (96 * 96)) + '0',
				 CHARSET_LEFT_TO_RIGHT);
      if (!NILP (*charset))
	return ((((c - MIN_CHAR_96x96) / 96) % 96) + 32) << 8
	  | (((c - MIN_CHAR_96x96) % 96) + 32);
      else
	{
	  *charset = Vcharset_ucs;
	  return c;
	}
    }
  else
    {
      *charset = Vcharset_ucs;
      return c;
    }
}

Lisp_Object Vdefault_coded_charset_priority_list;
#endif


/************************************************************************/
/*                      Basic charset Lisp functions                    */
/************************************************************************/

DEFUN ("charsetp", Fcharsetp, 1, 1, 0, /*
Return non-nil if OBJECT is a charset.
*/
       (object))
{
  return CHARSETP (object) ? Qt : Qnil;
}

DEFUN ("find-charset", Ffind_charset, 1, 1, 0, /*
Retrieve the charset of the given name.
If CHARSET-OR-NAME is a charset object, it is simply returned.
Otherwise, CHARSET-OR-NAME should be a symbol.  If there is no such charset,
nil is returned.  Otherwise the associated charset object is returned.
*/
       (charset_or_name))
{
  if (CHARSETP (charset_or_name))
    return charset_or_name;

  CHECK_SYMBOL (charset_or_name);
  return Fgethash (charset_or_name, Vcharset_hash_table, Qnil);
}

DEFUN ("get-charset", Fget_charset, 1, 1, 0, /*
Retrieve the charset of the given name.
Same as `find-charset' except an error is signalled if there is no such
charset instead of returning nil.
*/
       (name))
{
  Lisp_Object charset = Ffind_charset (name);

  if (NILP (charset))
    signal_simple_error ("No such charset", name);
  return charset;
}

/* We store the charsets in hash tables with the names as the key and the
   actual charset object as the value.  Occasionally we need to use them
   in a list format.  These routines provide us with that. */
struct charset_list_closure
{
  Lisp_Object *charset_list;
};

static int
add_charset_to_list_mapper (Lisp_Object key, Lisp_Object value,
			    void *charset_list_closure)
{
  /* This function can GC */
  struct charset_list_closure *chcl =
    (struct charset_list_closure*) charset_list_closure;
  Lisp_Object *charset_list = chcl->charset_list;

  *charset_list = Fcons (XCHARSET_NAME (value), *charset_list);
  return 0;
}

DEFUN ("charset-list", Fcharset_list, 0, 0, 0, /*
Return a list of the names of all defined charsets.
*/
       ())
{
  Lisp_Object charset_list = Qnil;
  struct gcpro gcpro1;
  struct charset_list_closure charset_list_closure;

  GCPRO1 (charset_list);
  charset_list_closure.charset_list = &charset_list;
  elisp_maphash (add_charset_to_list_mapper, Vcharset_hash_table,
		 &charset_list_closure);
  UNGCPRO;

  return charset_list;
}

DEFUN ("charset-name", Fcharset_name, 1, 1, 0, /*
Return the name of the given charset.
*/
       (charset))
{
  return XCHARSET_NAME (Fget_charset (charset));
}

DEFUN ("make-charset", Fmake_charset, 3, 3, 0, /*
Define a new character set.
This function is for use with Mule support.
NAME is a symbol, the name by which the character set is normally referred.
DOC-STRING is a string describing the character set.
PROPS is a property list, describing the specific nature of the
character set.  Recognized properties are:

'short-name	Short version of the charset name (ex: Latin-1)
'long-name	Long version of the charset name (ex: ISO8859-1 (Latin-1))
'registry	A regular expression matching the font registry field for
		this character set.
'dimension	Number of octets used to index a character in this charset.
		Either 1 or 2.  Defaults to 1.
'columns	Number of columns used to display a character in this charset.
		Only used in TTY mode. (Under X, the actual width of a
		character can be derived from the font used to display the
		characters.) If unspecified, defaults to the dimension
		(this is almost	always the correct value).
'chars		Number of characters in each dimension (94 or 96).
		Defaults to 94.  Note that if the dimension is 2, the
		character set thus described is 94x94 or 96x96.
'final		Final byte of ISO 2022 escape sequence.  Must be
		supplied.  Each combination of (DIMENSION, CHARS) defines a
		separate namespace for final bytes.  Note that ISO
		2022 restricts the final byte to the range
		0x30 - 0x7E if dimension == 1, and 0x30 - 0x5F if
		dimension == 2.  Note also that final bytes in the range
		0x30 - 0x3F are reserved for user-defined (not official)
		character sets.
'graphic	0 (use left half of font on output) or 1 (use right half
		of font on output).  Defaults to 0.  For example, for
		a font whose registry is ISO8859-1, the left half
		(octets 0x20 - 0x7F) is the `ascii' character set, while
		the right half (octets 0xA0 - 0xFF) is the `latin-1'
		character set.  With 'graphic set to 0, the octets
		will have their high bit cleared; with it set to 1,
		the octets will have their high bit set.
'direction	'l2r (left-to-right) or 'r2l (right-to-left).
		Defaults to 'l2r.
'ccl-program	A compiled CCL program used to convert a character in
		this charset into an index into the font.  This is in
		addition to the 'graphic property.  The CCL program
		is passed the octets of the character, with the high
		bit cleared and set depending upon whether the value
		of the 'graphic property is 0 or 1.
*/
       (name, doc_string, props))
{
  int id, dimension = 1, chars = 94, graphic = 0, final = 0, columns = -1;
  int direction = CHARSET_LEFT_TO_RIGHT;
  int type;
  Lisp_Object registry = Qnil;
  Lisp_Object charset;
  Lisp_Object rest, keyword, value;
  Lisp_Object ccl_program = Qnil;
  Lisp_Object short_name = Qnil, long_name = Qnil;
  int byte_offset = -1;

  CHECK_SYMBOL (name);
  if (!NILP (doc_string))
    CHECK_STRING (doc_string);

  charset = Ffind_charset (name);
  if (!NILP (charset))
    signal_simple_error ("Cannot redefine existing charset", name);

  EXTERNAL_PROPERTY_LIST_LOOP (rest, keyword, value, props)
    {
      if (EQ (keyword, Qshort_name))
	{
	  CHECK_STRING (value);
	  short_name = value;
	}

      if (EQ (keyword, Qlong_name))
	{
	  CHECK_STRING (value);
	  long_name = value;
	}

      else if (EQ (keyword, Qdimension))
	{
	  CHECK_INT (value);
	  dimension = XINT (value);
	  if (dimension < 1 || dimension > 2)
	    signal_simple_error ("Invalid value for 'dimension", value);
	}

      else if (EQ (keyword, Qchars))
	{
	  CHECK_INT (value);
	  chars = XINT (value);
	  if (chars != 94 && chars != 96)
	    signal_simple_error ("Invalid value for 'chars", value);
	}

      else if (EQ (keyword, Qcolumns))
	{
	  CHECK_INT (value);
	  columns = XINT (value);
	  if (columns != 1 && columns != 2)
	    signal_simple_error ("Invalid value for 'columns", value);
	}

      else if (EQ (keyword, Qgraphic))
	{
	  CHECK_INT (value);
	  graphic = XINT (value);
#ifdef UTF2000
	  if (graphic < 0 || graphic > 2)
#else
	  if (graphic < 0 || graphic > 1)
#endif
	    signal_simple_error ("Invalid value for 'graphic", value);
	}

      else if (EQ (keyword, Qregistry))
	{
	  CHECK_STRING (value);
	  registry = value;
	}

      else if (EQ (keyword, Qdirection))
	{
	  if (EQ (value, Ql2r))
	    direction = CHARSET_LEFT_TO_RIGHT;
	  else if (EQ (value, Qr2l))
	    direction = CHARSET_RIGHT_TO_LEFT;
	  else
	    signal_simple_error ("Invalid value for 'direction", value);
	}

      else if (EQ (keyword, Qfinal))
	{
	  CHECK_CHAR_COERCE_INT (value);
	  final = XCHAR (value);
	  if (final < '0' || final > '~')
	    signal_simple_error ("Invalid value for 'final", value);
	}

      else if (EQ (keyword, Qccl_program))
	{
	  CHECK_VECTOR (value);
	  ccl_program = value;
	}

      else
	signal_simple_error ("Unrecognized property", keyword);
    }

  if (!final)
    error ("'final must be specified");
  if (dimension == 2 && final > 0x5F)
    signal_simple_error
      ("Final must be in the range 0x30 - 0x5F for dimension == 2",
       make_char (final));

  if (dimension == 1)
    type = (chars == 94) ? CHARSET_TYPE_94    : CHARSET_TYPE_96;
  else
    type = (chars == 94) ? CHARSET_TYPE_94X94 : CHARSET_TYPE_96X96;

  if (!NILP (CHARSET_BY_ATTRIBUTES (type, final, CHARSET_LEFT_TO_RIGHT)) ||
      !NILP (CHARSET_BY_ATTRIBUTES (type, final, CHARSET_RIGHT_TO_LEFT)))
    error
      ("Character set already defined for this DIMENSION/CHARS/FINAL combo");

  id = get_unallocated_leading_byte (dimension);

  if (NILP (doc_string))
    doc_string = build_string ("");

  if (NILP (registry))
    registry = build_string ("");

  if (NILP (short_name))
    XSETSTRING (short_name, XSYMBOL (name)->name);

  if (NILP (long_name))
    long_name = doc_string;

  if (columns == -1)
    columns = dimension;

  if (byte_offset < 0)
    {
      if (chars == 94)
	byte_offset = 33;
      else if (chars == 96)
	byte_offset = 32;
      else
	byte_offset = 0;
    }

  charset = make_charset (id, name, chars, dimension, columns, graphic,
			  final, direction, short_name, long_name,
			  doc_string, registry,
			  Qnil, 0, 0, 0, byte_offset);
  if (!NILP (ccl_program))
    XCHARSET_CCL_PROGRAM (charset) = ccl_program;
  return charset;
}

DEFUN ("make-reverse-direction-charset", Fmake_reverse_direction_charset,
       2, 2, 0, /*
Make a charset equivalent to CHARSET but which goes in the opposite direction.
NEW-NAME is the name of the new charset.  Return the new charset.
*/
       (charset, new_name))
{
  Lisp_Object new_charset = Qnil;
  int id, chars, dimension, columns, graphic, final;
  int direction;
  Lisp_Object registry, doc_string, short_name, long_name;
  Lisp_Charset *cs;

  charset = Fget_charset (charset);
  if (!NILP (XCHARSET_REVERSE_DIRECTION_CHARSET (charset)))
    signal_simple_error ("Charset already has reverse-direction charset",
			 charset);

  CHECK_SYMBOL (new_name);
  if (!NILP (Ffind_charset (new_name)))
    signal_simple_error ("Cannot redefine existing charset", new_name);

  cs = XCHARSET (charset);

  chars     = CHARSET_CHARS     (cs);
  dimension = CHARSET_DIMENSION (cs);
  columns   = CHARSET_COLUMNS   (cs);
  id = get_unallocated_leading_byte (dimension);

  graphic = CHARSET_GRAPHIC (cs);
  final = CHARSET_FINAL (cs);
  direction = CHARSET_RIGHT_TO_LEFT;
  if (CHARSET_DIRECTION (cs) == CHARSET_RIGHT_TO_LEFT)
    direction = CHARSET_LEFT_TO_RIGHT;
  doc_string = CHARSET_DOC_STRING (cs);
  short_name = CHARSET_SHORT_NAME (cs);
  long_name = CHARSET_LONG_NAME (cs);
  registry = CHARSET_REGISTRY (cs);

  new_charset = make_charset (id, new_name, chars, dimension, columns,
			      graphic, final, direction, short_name, long_name,
			      doc_string, registry,
#ifdef UTF2000
			      CHARSET_DECODING_TABLE(cs),
			      CHARSET_UCS_MIN(cs),
			      CHARSET_UCS_MAX(cs),
			      CHARSET_CODE_OFFSET(cs),
			      CHARSET_BYTE_OFFSET(cs)
#else
			      Qnil, 0, 0, 0, 0
#endif
);

  CHARSET_REVERSE_DIRECTION_CHARSET (cs) = new_charset;
  XCHARSET_REVERSE_DIRECTION_CHARSET (new_charset) = charset;

  return new_charset;
}

DEFUN ("define-charset-alias", Fdefine_charset_alias, 2, 2, 0, /*
Define symbol ALIAS as an alias for CHARSET.
*/
       (alias, charset))
{
  CHECK_SYMBOL (alias);
  charset = Fget_charset (charset);
  return Fputhash (alias, charset, Vcharset_hash_table);
}

/* #### Reverse direction charsets not yet implemented.  */
#if 0
DEFUN ("charset-reverse-direction-charset", Fcharset_reverse_direction_charset,
       1, 1, 0, /*
Return the reverse-direction charset parallel to CHARSET, if any.
This is the charset with the same properties (in particular, the same
dimension, number of characters per dimension, and final byte) as
CHARSET but whose characters are displayed in the opposite direction.
*/
       (charset))
{
  charset = Fget_charset (charset);
  return XCHARSET_REVERSE_DIRECTION_CHARSET (charset);
}
#endif

DEFUN ("charset-from-attributes", Fcharset_from_attributes, 3, 4, 0, /*
Return a charset with the given DIMENSION, CHARS, FINAL, and DIRECTION.
If DIRECTION is omitted, both directions will be checked (left-to-right
will be returned if character sets exist for both directions).
*/
       (dimension, chars, final, direction))
{
  int dm, ch, fi, di = -1;
  int type;
  Lisp_Object obj = Qnil;

  CHECK_INT (dimension);
  dm = XINT (dimension);
  if (dm < 1 || dm > 2)
    signal_simple_error ("Invalid value for DIMENSION", dimension);

  CHECK_INT (chars);
  ch = XINT (chars);
  if (ch != 94 && ch != 96)
    signal_simple_error ("Invalid value for CHARS", chars);

  CHECK_CHAR_COERCE_INT (final);
  fi = XCHAR (final);
  if (fi < '0' || fi > '~')
    signal_simple_error ("Invalid value for FINAL", final);

  if (EQ (direction, Ql2r))
    di = CHARSET_LEFT_TO_RIGHT;
  else if (EQ (direction, Qr2l))
    di = CHARSET_RIGHT_TO_LEFT;
  else if (!NILP (direction))
    signal_simple_error ("Invalid value for DIRECTION", direction);

  if (dm == 2 && fi > 0x5F)
    signal_simple_error
      ("Final must be in the range 0x30 - 0x5F for dimension == 2", final);

  if (dm == 1)
    type = (ch == 94) ? CHARSET_TYPE_94    : CHARSET_TYPE_96;
  else
    type = (ch == 94) ? CHARSET_TYPE_94X94 : CHARSET_TYPE_96X96;

  if (di == -1)
    {
      obj = CHARSET_BY_ATTRIBUTES (type, fi, CHARSET_LEFT_TO_RIGHT);
      if (NILP (obj))
	obj = CHARSET_BY_ATTRIBUTES (type, fi, CHARSET_RIGHT_TO_LEFT);
    }
  else
    obj = CHARSET_BY_ATTRIBUTES (type, fi, di);

  if (CHARSETP (obj))
    return XCHARSET_NAME (obj);
  return obj;
}

DEFUN ("charset-short-name", Fcharset_short_name, 1, 1, 0, /*
Return short name of CHARSET.
*/
       (charset))
{
  return XCHARSET_SHORT_NAME (Fget_charset (charset));
}

DEFUN ("charset-long-name", Fcharset_long_name, 1, 1, 0, /*
Return long name of CHARSET.
*/
       (charset))
{
  return XCHARSET_LONG_NAME (Fget_charset (charset));
}

DEFUN ("charset-description", Fcharset_description, 1, 1, 0, /*
Return description of CHARSET.
*/
       (charset))
{
  return XCHARSET_DOC_STRING (Fget_charset (charset));
}

DEFUN ("charset-dimension", Fcharset_dimension, 1, 1, 0, /*
Return dimension of CHARSET.
*/
       (charset))
{
  return make_int (XCHARSET_DIMENSION (Fget_charset (charset)));
}

DEFUN ("charset-property", Fcharset_property, 2, 2, 0, /*
Return property PROP of CHARSET.
Recognized properties are those listed in `make-charset', as well as
'name and 'doc-string.
*/
       (charset, prop))
{
  Lisp_Charset *cs;

  charset = Fget_charset (charset);
  cs = XCHARSET (charset);

  CHECK_SYMBOL (prop);
  if (EQ (prop, Qname))        return CHARSET_NAME (cs);
  if (EQ (prop, Qshort_name))  return CHARSET_SHORT_NAME (cs);
  if (EQ (prop, Qlong_name))   return CHARSET_LONG_NAME (cs);
  if (EQ (prop, Qdoc_string))  return CHARSET_DOC_STRING (cs);
  if (EQ (prop, Qdimension))   return make_int (CHARSET_DIMENSION (cs));
  if (EQ (prop, Qcolumns))     return make_int (CHARSET_COLUMNS (cs));
  if (EQ (prop, Qgraphic))     return make_int (CHARSET_GRAPHIC (cs));
  if (EQ (prop, Qfinal))       return make_char (CHARSET_FINAL (cs));
  if (EQ (prop, Qchars))       return make_int (CHARSET_CHARS (cs));
  if (EQ (prop, Qregistry))    return CHARSET_REGISTRY (cs);
  if (EQ (prop, Qccl_program)) return CHARSET_CCL_PROGRAM (cs);
  if (EQ (prop, Qdirection))
    return CHARSET_DIRECTION (cs) == CHARSET_LEFT_TO_RIGHT ? Ql2r : Qr2l;
  if (EQ (prop, Qreverse_direction_charset))
    {
      Lisp_Object obj = CHARSET_REVERSE_DIRECTION_CHARSET (cs);
      if (NILP (obj))
	return Qnil;
      else
	return XCHARSET_NAME (obj);
    }
  signal_simple_error ("Unrecognized charset property name", prop);
  return Qnil; /* not reached */
}

DEFUN ("charset-id", Fcharset_id, 1, 1, 0, /*
Return charset identification number of CHARSET.
*/
	(charset))
{
  return make_int(XCHARSET_LEADING_BYTE (Fget_charset (charset)));
}

/* #### We need to figure out which properties we really want to
   allow to be set. */

DEFUN ("set-charset-ccl-program", Fset_charset_ccl_program, 2, 2, 0, /*
Set the 'ccl-program property of CHARSET to CCL-PROGRAM.
*/
       (charset, ccl_program))
{
  charset = Fget_charset (charset);
  CHECK_VECTOR (ccl_program);
  XCHARSET_CCL_PROGRAM (charset) = ccl_program;
  return Qnil;
}

static void
invalidate_charset_font_caches (Lisp_Object charset)
{
  /* Invalidate font cache entries for charset on all devices. */
  Lisp_Object devcons, concons, hash_table;
  DEVICE_LOOP_NO_BREAK (devcons, concons)
    {
      struct device *d = XDEVICE (XCAR (devcons));
      hash_table = Fgethash (charset, d->charset_font_cache, Qunbound);
      if (!UNBOUNDP (hash_table))
        Fclrhash (hash_table);
    }
}

DEFUN ("set-charset-registry", Fset_charset_registry, 2, 2, 0, /*
Set the 'registry property of CHARSET to REGISTRY.
*/
       (charset, registry))
{
  charset = Fget_charset (charset);
  CHECK_STRING (registry);
  XCHARSET_REGISTRY (charset) = registry;
  invalidate_charset_font_caches (charset);
  face_property_was_changed (Vdefault_face, Qfont, Qglobal);
  return Qnil;
}

#ifdef UTF2000
DEFUN ("charset-mapping-table", Fcharset_mapping_table, 1, 1, 0, /*
Return mapping-table of CHARSET.
*/
       (charset))
{
  return XCHARSET_DECODING_TABLE (Fget_charset (charset));
}

DEFUN ("set-charset-mapping-table", Fset_charset_mapping_table, 2, 2, 0, /*
Set mapping-table of CHARSET to TABLE.
*/
       (charset, table))
{
  struct Lisp_Charset *cs;
  Lisp_Object old_table;
  size_t i;

  charset = Fget_charset (charset);
  cs = XCHARSET (charset);

  if (EQ (table, Qnil))
    {
      CHARSET_DECODING_TABLE(cs) = table;
      return table;
    }
  else if (VECTORP (table))
    {
      int ccs_len;

      /* ad-hoc method for `ascii' */
      if ((CHARSET_CHARS (cs) == 94) &&
	  (CHARSET_BYTE_OFFSET (cs) != 33))
	ccs_len = 128 - CHARSET_BYTE_OFFSET (cs);
      else
	ccs_len = CHARSET_CHARS (cs);

      if (XVECTOR_LENGTH (table) > ccs_len)
	args_out_of_range (table, make_int (CHARSET_CHARS (cs)));
      old_table = CHARSET_DECODING_TABLE(cs);
      CHARSET_DECODING_TABLE(cs) = table;
    }
  else
    signal_error (Qwrong_type_argument,
		  list2 (build_translated_string ("vector-or-nil-p"),
			 table));
  /* signal_simple_error ("Wrong type argument: vector-or-nil-p", table); */

  switch (CHARSET_DIMENSION (cs))
    {
    case 1:
      for (i = 0; i < XVECTOR_LENGTH (table); i++)
	{
	  Lisp_Object c = XVECTOR_DATA(table)[i];

	  if (CHARP (c))
	    put_char_attribute
	      (c, charset,
	       make_int (i + CHARSET_BYTE_OFFSET (cs)));
	}
      break;
    case 2:
      for (i = 0; i < XVECTOR_LENGTH (table); i++)
	{
	  Lisp_Object v = XVECTOR_DATA(table)[i];

	  if (VECTORP (v))
	    {
	      size_t j;

	      if (XVECTOR_LENGTH (v) > CHARSET_CHARS (cs))
		{
		  CHARSET_DECODING_TABLE(cs) = old_table;
		  args_out_of_range (v, make_int (CHARSET_CHARS (cs)));
		}
	      for (j = 0; j < XVECTOR_LENGTH (v); j++)
		{
		  Lisp_Object c = XVECTOR_DATA(v)[j];

		  if (CHARP (c))
		    put_char_attribute
		      (c, charset,
		       make_int ( ((i + CHARSET_BYTE_OFFSET (cs)) << 8)
				  | (j + CHARSET_BYTE_OFFSET (cs)) ));
		}
	    }
	  else if (CHARP (v))
	    put_char_attribute (v, charset,
				make_int (i + CHARSET_BYTE_OFFSET (cs)));
	}
      break;
    }
  return table;
}
#endif


/************************************************************************/
/*              Lisp primitives for working with characters             */
/************************************************************************/

#ifdef UTF2000
DEFUN ("decode-char", Fdecode_char, 2, 2, 0, /*
Make a character from CHARSET and code-point CODE.
*/
       (charset, code))
{
  int c;

  charset = Fget_charset (charset);
  CHECK_INT (code);
  c = XINT (code);
  if (XCHARSET_GRAPHIC (charset) == 1)
    c &= 0x7F7F7F7F;
  return make_char (DECODE_CHAR (charset, c));
}
#endif

DEFUN ("make-char", Fmake_char, 2, 3, 0, /*
Make a character from CHARSET and octets ARG1 and ARG2.
ARG2 is required only for characters from two-dimensional charsets.
For example, (make-char 'latin-iso8859-2 185) will return the Latin 2
character s with caron.
*/
       (charset, arg1, arg2))
{
  Lisp_Charset *cs;
  int a1, a2;
  int lowlim, highlim;

  charset = Fget_charset (charset);
  cs = XCHARSET (charset);

  if      (EQ (charset, Vcharset_ascii))     lowlim =  0, highlim = 127;
  else if (EQ (charset, Vcharset_control_1)) lowlim =  0, highlim =  31;
#ifdef UTF2000
  else if (CHARSET_CHARS (cs) == 256)        lowlim =  0, highlim = 255;
#endif
  else if (CHARSET_CHARS (cs) == 94)         lowlim = 33, highlim = 126;
  else	/* CHARSET_CHARS (cs) == 96) */	     lowlim = 32, highlim = 127;

  CHECK_INT (arg1);
  /* It is useful (and safe, according to Olivier Galibert) to strip
     the 8th bit off ARG1 and ARG2 becaue it allows programmers to
     write (make-char 'latin-iso8859-2 CODE) where code is the actual
     Latin 2 code of the character.  */
#ifdef UTF2000
  a1 = XINT (arg1);
  if (highlim < 128)
    a1 &= 0x7f;
#else
  a1 = XINT (arg1);
#endif
  if (a1 < lowlim || a1 > highlim)
    args_out_of_range_3 (arg1, make_int (lowlim), make_int (highlim));

  if (CHARSET_DIMENSION (cs) == 1)
    {
      if (!NILP (arg2))
        signal_simple_error
          ("Charset is of dimension one; second octet must be nil", arg2);
      return make_char (MAKE_CHAR (charset, a1, 0));
    }

  CHECK_INT (arg2);
#ifdef UTF2000
  a2 = XINT (arg2);
  if (highlim < 128)
    a2 &= 0x7f;
#else
  a2 = XINT (arg2) & 0x7f;
#endif
  if (a2 < lowlim || a2 > highlim)
    args_out_of_range_3 (arg2, make_int (lowlim), make_int (highlim));

  return make_char (MAKE_CHAR (charset, a1, a2));
}

DEFUN ("char-charset", Fchar_charset, 1, 1, 0, /*
Return the character set of char CH.
*/
       (ch))
{
  CHECK_CHAR_COERCE_INT (ch);

  return XCHARSET_NAME (CHAR_CHARSET (XCHAR (ch)));
}

DEFUN ("char-octet", Fchar_octet, 1, 2, 0, /*
Return the octet numbered N (should be 0 or 1) of char CH.
N defaults to 0 if omitted.
*/
       (ch, n))
{
  Lisp_Object charset;
  int octet0, octet1;

  CHECK_CHAR_COERCE_INT (ch);

  BREAKUP_CHAR (XCHAR (ch), charset, octet0, octet1);

  if (NILP (n) || EQ (n, Qzero))
    return make_int (octet0);
  else if (EQ (n, make_int (1)))
    return make_int (octet1);
  else
    signal_simple_error ("Octet number must be 0 or 1", n);
}

DEFUN ("split-char", Fsplit_char, 1, 1, 0, /*
Return list of charset and one or two position-codes of CHAR.
*/
       (character))
{
  /* This function can GC */
  struct gcpro gcpro1, gcpro2;
  Lisp_Object charset = Qnil;
  Lisp_Object rc = Qnil;
#ifdef UTF2000
  int code_point;
  int dimension;
#else
  int c1, c2;
#endif

  GCPRO2 (charset, rc);
  CHECK_CHAR_COERCE_INT (character);

#ifdef UTF2000
  code_point = ENCODE_CHAR (XCHAR (character), charset);
  dimension = XCHARSET_DIMENSION (charset);
  while (dimension > 0)
    {
      rc = Fcons (make_int (code_point & 255), rc);
      code_point >>= 8;
      dimension--;
    }
  rc = Fcons (XCHARSET_NAME (charset), rc);
#else
  BREAKUP_CHAR (XCHAR (character), charset, c1, c2);

  if (XCHARSET_DIMENSION (Fget_charset (charset)) == 2)
    {
      rc = list3 (XCHARSET_NAME (charset), make_int (c1), make_int (c2));
    }
  else
    {
      rc = list2 (XCHARSET_NAME (charset), make_int (c1));
    }
#endif
  UNGCPRO;

  return rc;
}


#ifdef ENABLE_COMPOSITE_CHARS
/************************************************************************/
/*                     composite character functions                    */
/************************************************************************/

Emchar
lookup_composite_char (Bufbyte *str, int len)
{
  Lisp_Object lispstr = make_string (str, len);
  Lisp_Object ch = Fgethash (lispstr,
			     Vcomposite_char_string2char_hash_table,
			     Qunbound);
  Emchar emch;

  if (UNBOUNDP (ch))
    {
      if (composite_char_row_next >= 128)
	signal_simple_error ("No more composite chars available", lispstr);
      emch = MAKE_CHAR (Vcharset_composite, composite_char_row_next,
			composite_char_col_next);
      Fputhash (make_char (emch), lispstr,
	        Vcomposite_char_char2string_hash_table);
      Fputhash (lispstr, make_char (emch),
		Vcomposite_char_string2char_hash_table);
      composite_char_col_next++;
      if (composite_char_col_next >= 128)
	{
	  composite_char_col_next = 32;
	  composite_char_row_next++;
	}
    }
  else
    emch = XCHAR (ch);
  return emch;
}

Lisp_Object
composite_char_string (Emchar ch)
{
  Lisp_Object str = Fgethash (make_char (ch),
			      Vcomposite_char_char2string_hash_table,
			      Qunbound);
  assert (!UNBOUNDP (str));
  return str;
}

xxDEFUN ("make-composite-char", Fmake_composite_char, 1, 1, 0, /*
Convert a string into a single composite character.
The character is the result of overstriking all the characters in
the string.
*/
       (string))
{
  CHECK_STRING (string);
  return make_char (lookup_composite_char (XSTRING_DATA (string),
					   XSTRING_LENGTH (string)));
}

xxDEFUN ("composite-char-string", Fcomposite_char_string, 1, 1, 0, /*
Return a string of the characters comprising a composite character.
*/
       (ch))
{
  Emchar emch;

  CHECK_CHAR (ch);
  emch = XCHAR (ch);
  if (CHAR_LEADING_BYTE (emch) != LEADING_BYTE_COMPOSITE)
    signal_simple_error ("Must be composite char", ch);
  return composite_char_string (emch);
}
#endif /* ENABLE_COMPOSITE_CHARS */


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_mule_charset (void)
{
#ifdef UTF2000
  INIT_LRECORD_IMPLEMENTATION (byte_table);
  INIT_LRECORD_IMPLEMENTATION (char_id_table);
#endif
  INIT_LRECORD_IMPLEMENTATION (charset);

  DEFSUBR (Fcharsetp);
  DEFSUBR (Ffind_charset);
  DEFSUBR (Fget_charset);
  DEFSUBR (Fcharset_list);
  DEFSUBR (Fcharset_name);
  DEFSUBR (Fmake_charset);
  DEFSUBR (Fmake_reverse_direction_charset);
  /*  DEFSUBR (Freverse_direction_charset); */
  DEFSUBR (Fdefine_charset_alias);
  DEFSUBR (Fcharset_from_attributes);
  DEFSUBR (Fcharset_short_name);
  DEFSUBR (Fcharset_long_name);
  DEFSUBR (Fcharset_description);
  DEFSUBR (Fcharset_dimension);
  DEFSUBR (Fcharset_property);
  DEFSUBR (Fcharset_id);
  DEFSUBR (Fset_charset_ccl_program);
  DEFSUBR (Fset_charset_registry);
#ifdef UTF2000
  DEFSUBR (Fchar_attribute_alist);
  DEFSUBR (Fget_char_attribute);
  DEFSUBR (Fput_char_attribute);
  DEFSUBR (Fremove_char_attribute);
  DEFSUBR (Fdefine_char);
  DEFSUBR (Fchar_variants);
  DEFSUBR (Fget_composite_char);
  DEFSUBR (Fcharset_mapping_table);
  DEFSUBR (Fset_charset_mapping_table);
#endif

#ifdef UTF2000
  DEFSUBR (Fdecode_char);
#endif
  DEFSUBR (Fmake_char);
  DEFSUBR (Fchar_charset);
  DEFSUBR (Fchar_octet);
  DEFSUBR (Fsplit_char);

#ifdef ENABLE_COMPOSITE_CHARS
  DEFSUBR (Fmake_composite_char);
  DEFSUBR (Fcomposite_char_string);
#endif

  defsymbol (&Qcharsetp, "charsetp");
  defsymbol (&Qregistry, "registry");
  defsymbol (&Qfinal, "final");
  defsymbol (&Qgraphic, "graphic");
  defsymbol (&Qdirection, "direction");
  defsymbol (&Qreverse_direction_charset, "reverse-direction-charset");
  defsymbol (&Qshort_name, "short-name");
  defsymbol (&Qlong_name, "long-name");

  defsymbol (&Ql2r, "l2r");
  defsymbol (&Qr2l, "r2l");

  /* Charsets, compatible with FSF 20.3
     Naming convention is Script-Charset[-Edition] */
  defsymbol (&Qascii,			"ascii");
  defsymbol (&Qcontrol_1,		"control-1");
  defsymbol (&Qlatin_iso8859_1,		"latin-iso8859-1");
  defsymbol (&Qlatin_iso8859_2,		"latin-iso8859-2");
  defsymbol (&Qlatin_iso8859_3,		"latin-iso8859-3");
  defsymbol (&Qlatin_iso8859_4,		"latin-iso8859-4");
  defsymbol (&Qthai_tis620,		"thai-tis620");
  defsymbol (&Qgreek_iso8859_7,		"greek-iso8859-7");
  defsymbol (&Qarabic_iso8859_6,	"arabic-iso8859-6");
  defsymbol (&Qhebrew_iso8859_8,	"hebrew-iso8859-8");
  defsymbol (&Qkatakana_jisx0201,	"katakana-jisx0201");
  defsymbol (&Qlatin_jisx0201,		"latin-jisx0201");
  defsymbol (&Qcyrillic_iso8859_5, 	"cyrillic-iso8859-5");
  defsymbol (&Qlatin_iso8859_9,		"latin-iso8859-9");
  defsymbol (&Qjapanese_jisx0208_1978,	"japanese-jisx0208-1978");
  defsymbol (&Qchinese_gb2312,		"chinese-gb2312");
  defsymbol (&Qjapanese_jisx0208, 	"japanese-jisx0208");
  defsymbol (&Qjapanese_jisx0208_1990, 	"japanese-jisx0208-1990");
  defsymbol (&Qkorean_ksc5601,		"korean-ksc5601");
  defsymbol (&Qjapanese_jisx0212,	"japanese-jisx0212");
  defsymbol (&Qchinese_cns11643_1,	"chinese-cns11643-1");
  defsymbol (&Qchinese_cns11643_2,	"chinese-cns11643-2");
#ifdef UTF2000
  defsymbol (&Q_ucs,			"->ucs");
  defsymbol (&Q_decomposition,		"->decomposition");
  defsymbol (&Qcompat,			"compat");
  defsymbol (&Qisolated,		"isolated");
  defsymbol (&Qinitial,			"initial");
  defsymbol (&Qmedial,			"medial");
  defsymbol (&Qfinal,			"final");
  defsymbol (&Qvertical,		"vertical");
  defsymbol (&QnoBreak,			"noBreak");
  defsymbol (&Qfraction,		"fraction");
  defsymbol (&Qsuper,			"super");
  defsymbol (&Qsub,			"sub");
  defsymbol (&Qcircle,			"circle");
  defsymbol (&Qsquare,			"square");
  defsymbol (&Qwide,			"wide");
  defsymbol (&Qnarrow,			"narrow");
  defsymbol (&Qsmall,			"small");
  defsymbol (&Qfont,			"font");
  defsymbol (&Qucs,			"ucs");
  defsymbol (&Qucs_bmp,			"ucs-bmp");
  defsymbol (&Qlatin_viscii,		"latin-viscii");
  defsymbol (&Qlatin_tcvn5712,		"latin-tcvn5712");
  defsymbol (&Qlatin_viscii_lower,	"latin-viscii-lower");
  defsymbol (&Qlatin_viscii_upper,	"latin-viscii-upper");
  defsymbol (&Qvietnamese_viscii_lower,	"vietnamese-viscii-lower");
  defsymbol (&Qvietnamese_viscii_upper,	"vietnamese-viscii-upper");
  defsymbol (&Qideograph_daikanwa,	"ideograph-daikanwa");
  defsymbol (&Qmojikyo,			"mojikyo");
  defsymbol (&Qmojikyo_pj_1,		"mojikyo-pj-1");
  defsymbol (&Qmojikyo_pj_2,		"mojikyo-pj-2");
  defsymbol (&Qmojikyo_pj_3,		"mojikyo-pj-3");
  defsymbol (&Qmojikyo_pj_4,		"mojikyo-pj-4");
  defsymbol (&Qmojikyo_pj_5,		"mojikyo-pj-5");
  defsymbol (&Qmojikyo_pj_6,		"mojikyo-pj-6");
  defsymbol (&Qmojikyo_pj_7,		"mojikyo-pj-7");
  defsymbol (&Qmojikyo_pj_8,		"mojikyo-pj-8");
  defsymbol (&Qmojikyo_pj_9,		"mojikyo-pj-9");
  defsymbol (&Qmojikyo_pj_10,		"mojikyo-pj-10");
  defsymbol (&Qmojikyo_pj_11,		"mojikyo-pj-11");
  defsymbol (&Qmojikyo_pj_12,		"mojikyo-pj-12");
  defsymbol (&Qmojikyo_pj_13,		"mojikyo-pj-13");
  defsymbol (&Qmojikyo_pj_14,		"mojikyo-pj-14");
  defsymbol (&Qmojikyo_pj_15,		"mojikyo-pj-15");
  defsymbol (&Qmojikyo_pj_16,		"mojikyo-pj-16");
  defsymbol (&Qmojikyo_pj_17,		"mojikyo-pj-17");
  defsymbol (&Qmojikyo_pj_18,		"mojikyo-pj-18");
  defsymbol (&Qmojikyo_pj_19,		"mojikyo-pj-19");
  defsymbol (&Qmojikyo_pj_20,		"mojikyo-pj-20");
  defsymbol (&Qmojikyo_pj_21,		"mojikyo-pj-21");
  defsymbol (&Qethiopic_ucs,		"ethiopic-ucs");
#endif
  defsymbol (&Qchinese_big5_1,		"chinese-big5-1");
  defsymbol (&Qchinese_big5_2,		"chinese-big5-2");

  defsymbol (&Qcomposite,		"composite");
}

void
vars_of_mule_charset (void)
{
  int i, j;
#ifndef UTF2000
  int k;
#endif

  chlook = xnew (struct charset_lookup);
  dumpstruct (&chlook, &charset_lookup_description);

  /* Table of charsets indexed by leading byte. */
  for (i = 0; i < countof (chlook->charset_by_leading_byte); i++)
    chlook->charset_by_leading_byte[i] = Qnil;

#ifdef UTF2000
  /* Table of charsets indexed by type/final-byte. */
  for (i = 0; i < countof (chlook->charset_by_attributes); i++)
    for (j = 0; j < countof (chlook->charset_by_attributes[0]); j++)
      chlook->charset_by_attributes[i][j] = Qnil;
#else
  /* Table of charsets indexed by type/final-byte/direction. */
  for (i = 0; i < countof (chlook->charset_by_attributes); i++)
    for (j = 0; j < countof (chlook->charset_by_attributes[0]); j++)
      for (k = 0; k < countof (chlook->charset_by_attributes[0][0]); k++)
	chlook->charset_by_attributes[i][j][k] = Qnil;
#endif

#ifdef UTF2000
  chlook->next_allocated_leading_byte = MIN_LEADING_BYTE_PRIVATE;
#else
  chlook->next_allocated_1_byte_leading_byte = MIN_LEADING_BYTE_PRIVATE_1;
  chlook->next_allocated_2_byte_leading_byte = MIN_LEADING_BYTE_PRIVATE_2;
#endif

#ifndef UTF2000
  leading_code_private_11 = PRE_LEADING_BYTE_PRIVATE_1;
  DEFVAR_INT ("leading-code-private-11", &leading_code_private_11 /*
Leading-code of private TYPE9N charset of column-width 1.
*/ );
  leading_code_private_11 = PRE_LEADING_BYTE_PRIVATE_1;
#endif

#ifdef UTF2000
  Vutf_2000_version = build_string("0.15 (Sangō)");
  DEFVAR_LISP ("utf-2000-version", &Vutf_2000_version /*
Version number of UTF-2000.
*/ );

  staticpro (&Vcharacter_attribute_table);
  Vcharacter_attribute_table = make_char_id_table (Qnil);

  staticpro (&Vcharacter_composition_table);
  Vcharacter_composition_table = make_char_id_table (Qnil);

  staticpro (&Vcharacter_variant_table);
  Vcharacter_variant_table = make_char_id_table (Qnil);

  Vdefault_coded_charset_priority_list = Qnil;
  DEFVAR_LISP ("default-coded-charset-priority-list",
	       &Vdefault_coded_charset_priority_list /*
Default order of preferred coded-character-sets.
*/ );
#endif
}

void
complex_vars_of_mule_charset (void)
{
  staticpro (&Vcharset_hash_table);
  Vcharset_hash_table =
    make_lisp_hash_table (50, HASH_TABLE_NON_WEAK, HASH_TABLE_EQ);

  /* Predefined character sets.  We store them into variables for
     ease of access. */

#ifdef UTF2000
  staticpro (&Vcharset_ucs);
  Vcharset_ucs =
    make_charset (LEADING_BYTE_UCS, Qucs, 256, 4,
		  1, 2, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("UCS"),
		  build_string ("UCS"),
		  build_string ("ISO/IEC 10646"),
		  build_string (""),
		  Qnil, 0, 0xFFFFFFF, 0, 0);
  staticpro (&Vcharset_ucs_bmp);
  Vcharset_ucs_bmp =
    make_charset (LEADING_BYTE_UCS_BMP, Qucs_bmp, 256, 2,
		  1, 2, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("BMP"),
		  build_string ("BMP"),
		  build_string ("ISO/IEC 10646 Group 0 Plane 0 (BMP)"),
		  build_string ("\\(ISO10646.*-1\\|UNICODE[23]?-0\\)"),
		  Qnil, 0, 0xFFFF, 0, 0);
#else
# define MIN_CHAR_THAI 0
# define MAX_CHAR_THAI 0
# define MIN_CHAR_HEBREW 0
# define MAX_CHAR_HEBREW 0
# define MIN_CHAR_HALFWIDTH_KATAKANA 0
# define MAX_CHAR_HALFWIDTH_KATAKANA 0
#endif
  staticpro (&Vcharset_ascii);
  Vcharset_ascii =
    make_charset (LEADING_BYTE_ASCII, Qascii, 94, 1,
		  1, 0, 'B', CHARSET_LEFT_TO_RIGHT,
		  build_string ("ASCII"),
		  build_string ("ASCII)"),
		  build_string ("ASCII (ISO646 IRV)"),
		  build_string ("\\(iso8859-[0-9]*\\|-ascii\\)"),
		  Qnil, 0, 0x7F, 0, 0);
  staticpro (&Vcharset_control_1);
  Vcharset_control_1 =
    make_charset (LEADING_BYTE_CONTROL_1, Qcontrol_1, 94, 1,
		  1, 1, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("C1"),
		  build_string ("Control characters"),
		  build_string ("Control characters 128-191"),
		  build_string (""),
		  Qnil, 0x80, 0x9F, 0, 0);
  staticpro (&Vcharset_latin_iso8859_1);
  Vcharset_latin_iso8859_1 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_1, Qlatin_iso8859_1, 96, 1,
		  1, 1, 'A', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-1"),
		  build_string ("ISO8859-1 (Latin-1)"),
		  build_string ("ISO8859-1 (Latin-1)"),
		  build_string ("iso8859-1"),
		  Qnil, 0xA0, 0xFF, 0, 32);
  staticpro (&Vcharset_latin_iso8859_2);
  Vcharset_latin_iso8859_2 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_2, Qlatin_iso8859_2, 96, 1,
		  1, 1, 'B', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-2"),
		  build_string ("ISO8859-2 (Latin-2)"),
		  build_string ("ISO8859-2 (Latin-2)"),
		  build_string ("iso8859-2"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_latin_iso8859_3);
  Vcharset_latin_iso8859_3 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_3, Qlatin_iso8859_3, 96, 1,
		  1, 1, 'C', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-3"),
		  build_string ("ISO8859-3 (Latin-3)"),
		  build_string ("ISO8859-3 (Latin-3)"),
		  build_string ("iso8859-3"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_latin_iso8859_4);
  Vcharset_latin_iso8859_4 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_4, Qlatin_iso8859_4, 96, 1,
		  1, 1, 'D', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-4"),
		  build_string ("ISO8859-4 (Latin-4)"),
		  build_string ("ISO8859-4 (Latin-4)"),
		  build_string ("iso8859-4"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_thai_tis620);
  Vcharset_thai_tis620 =
    make_charset (LEADING_BYTE_THAI_TIS620, Qthai_tis620, 96, 1,
		  1, 1, 'T', CHARSET_LEFT_TO_RIGHT,
		  build_string ("TIS620"),
		  build_string ("TIS620 (Thai)"),
		  build_string ("TIS620.2529 (Thai)"),
		  build_string ("tis620"),
		  Qnil, MIN_CHAR_THAI, MAX_CHAR_THAI, 0, 32);
  staticpro (&Vcharset_greek_iso8859_7);
  Vcharset_greek_iso8859_7 =
    make_charset (LEADING_BYTE_GREEK_ISO8859_7, Qgreek_iso8859_7, 96, 1,
		  1, 1, 'F', CHARSET_LEFT_TO_RIGHT,
		  build_string ("ISO8859-7"),
		  build_string ("ISO8859-7 (Greek)"),
		  build_string ("ISO8859-7 (Greek)"),
		  build_string ("iso8859-7"),
		  Qnil,
		  0 /* MIN_CHAR_GREEK */,
		  0 /* MAX_CHAR_GREEK */, 0, 32);
  staticpro (&Vcharset_arabic_iso8859_6);
  Vcharset_arabic_iso8859_6 =
    make_charset (LEADING_BYTE_ARABIC_ISO8859_6, Qarabic_iso8859_6, 96, 1,
		  1, 1, 'G', CHARSET_RIGHT_TO_LEFT,
		  build_string ("ISO8859-6"),
		  build_string ("ISO8859-6 (Arabic)"),
		  build_string ("ISO8859-6 (Arabic)"),
		  build_string ("iso8859-6"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_hebrew_iso8859_8);
  Vcharset_hebrew_iso8859_8 =
    make_charset (LEADING_BYTE_HEBREW_ISO8859_8, Qhebrew_iso8859_8, 96, 1,
		  1, 1, 'H', CHARSET_RIGHT_TO_LEFT,
		  build_string ("ISO8859-8"),
		  build_string ("ISO8859-8 (Hebrew)"),
		  build_string ("ISO8859-8 (Hebrew)"),
		  build_string ("iso8859-8"),
		  Qnil, MIN_CHAR_HEBREW, MAX_CHAR_HEBREW, 0, 32);
  staticpro (&Vcharset_katakana_jisx0201);
  Vcharset_katakana_jisx0201 =
    make_charset (LEADING_BYTE_KATAKANA_JISX0201, Qkatakana_jisx0201, 94, 1,
		  1, 1, 'I', CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0201 Kana"),
		  build_string ("JISX0201.1976 (Japanese Kana)"),
		  build_string ("JISX0201.1976 Japanese Kana"),
		  build_string ("jisx0201\\.1976"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_latin_jisx0201);
  Vcharset_latin_jisx0201 =
    make_charset (LEADING_BYTE_LATIN_JISX0201, Qlatin_jisx0201, 94, 1,
		  1, 0, 'J', CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0201 Roman"),
		  build_string ("JISX0201.1976 (Japanese Roman)"),
		  build_string ("JISX0201.1976 Japanese Roman"),
		  build_string ("jisx0201\\.1976"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_cyrillic_iso8859_5);
  Vcharset_cyrillic_iso8859_5 =
    make_charset (LEADING_BYTE_CYRILLIC_ISO8859_5, Qcyrillic_iso8859_5, 96, 1,
		  1, 1, 'L', CHARSET_LEFT_TO_RIGHT,
		  build_string ("ISO8859-5"),
		  build_string ("ISO8859-5 (Cyrillic)"),
		  build_string ("ISO8859-5 (Cyrillic)"),
		  build_string ("iso8859-5"),
		  Qnil,
		  0 /* MIN_CHAR_CYRILLIC */,
		  0 /* MAX_CHAR_CYRILLIC */, 0, 32);
  staticpro (&Vcharset_latin_iso8859_9);
  Vcharset_latin_iso8859_9 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_9, Qlatin_iso8859_9, 96, 1,
		  1, 1, 'M', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-5"),
		  build_string ("ISO8859-9 (Latin-5)"),
		  build_string ("ISO8859-9 (Latin-5)"),
		  build_string ("iso8859-9"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_japanese_jisx0208_1978);
  Vcharset_japanese_jisx0208_1978 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208_1978,
		  Qjapanese_jisx0208_1978, 94, 2,
		  2, 0, '@', CHARSET_LEFT_TO_RIGHT,
		  build_string ("JIS X0208:1978"),
		  build_string ("JIS X0208:1978 (Japanese)"),
		  build_string
		  ("JIS X0208:1978 Japanese Kanji (so called \"old JIS\")"),
		  build_string ("\\(jisx0208\\|jisc6226\\)\\.1978"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_chinese_gb2312);
  Vcharset_chinese_gb2312 =
    make_charset (LEADING_BYTE_CHINESE_GB2312, Qchinese_gb2312, 94, 2,
		  2, 0, 'A', CHARSET_LEFT_TO_RIGHT,
		  build_string ("GB2312"),
		  build_string ("GB2312)"),
		  build_string ("GB2312 Chinese simplified"),
		  build_string ("gb2312"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_japanese_jisx0208);
  Vcharset_japanese_jisx0208 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208, Qjapanese_jisx0208, 94, 2,
		  2, 0, 'B', CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0208"),
		  build_string ("JIS X0208:1983 (Japanese)"),
		  build_string ("JIS X0208:1983 Japanese Kanji"),
		  build_string ("jisx0208\\.1983"),
		  Qnil, 0, 0, 0, 33);
#ifdef UTF2000
  staticpro (&Vcharset_japanese_jisx0208_1990);
  Vcharset_japanese_jisx0208_1990 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208_1990,
		  Qjapanese_jisx0208_1990, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0208-1990"),
		  build_string ("JIS X0208:1990 (Japanese)"),
		  build_string ("JIS X0208:1990 Japanese Kanji"),
		  build_string ("jisx0208\\.1990"),
		  Qnil,
		  MIN_CHAR_JIS_X0208_1990,
		  MAX_CHAR_JIS_X0208_1990, 0, 33);
#endif
  staticpro (&Vcharset_korean_ksc5601);
  Vcharset_korean_ksc5601 =
    make_charset (LEADING_BYTE_KOREAN_KSC5601, Qkorean_ksc5601, 94, 2,
		  2, 0, 'C', CHARSET_LEFT_TO_RIGHT,
		  build_string ("KSC5601"),
		  build_string ("KSC5601 (Korean"),
		  build_string ("KSC5601 Korean Hangul and Hanja"),
		  build_string ("ksc5601"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_japanese_jisx0212);
  Vcharset_japanese_jisx0212 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0212, Qjapanese_jisx0212, 94, 2,
		  2, 0, 'D', CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0212"),
		  build_string ("JISX0212 (Japanese)"),
		  build_string ("JISX0212 Japanese Supplement"),
		  build_string ("jisx0212"),
		  Qnil, 0, 0, 0, 33);

#define CHINESE_CNS_PLANE_RE(n) "cns11643[.-]\\(.*[.-]\\)?" n "$"
  staticpro (&Vcharset_chinese_cns11643_1);
  Vcharset_chinese_cns11643_1 =
    make_charset (LEADING_BYTE_CHINESE_CNS11643_1, Qchinese_cns11643_1, 94, 2,
		  2, 0, 'G', CHARSET_LEFT_TO_RIGHT,
		  build_string ("CNS11643-1"),
		  build_string ("CNS11643-1 (Chinese traditional)"),
		  build_string
		  ("CNS 11643 Plane 1 Chinese traditional"),
		  build_string (CHINESE_CNS_PLANE_RE("1")),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_chinese_cns11643_2);
  Vcharset_chinese_cns11643_2 =
    make_charset (LEADING_BYTE_CHINESE_CNS11643_2, Qchinese_cns11643_2, 94, 2,
		  2, 0, 'H', CHARSET_LEFT_TO_RIGHT,
		  build_string ("CNS11643-2"),
		  build_string ("CNS11643-2 (Chinese traditional)"),
		  build_string
		  ("CNS 11643 Plane 2 Chinese traditional"),
		  build_string (CHINESE_CNS_PLANE_RE("2")),
		  Qnil, 0, 0, 0, 33);
#ifdef UTF2000
  staticpro (&Vcharset_latin_tcvn5712);
  Vcharset_latin_tcvn5712 =
    make_charset (LEADING_BYTE_LATIN_TCVN5712, Qlatin_tcvn5712, 96, 1,
		  1, 1, 'Z', CHARSET_LEFT_TO_RIGHT,
		  build_string ("TCVN 5712"),
		  build_string ("TCVN 5712 (VSCII-2)"),
		  build_string ("Vietnamese TCVN 5712:1983 (VSCII-2)"),
		  build_string ("tcvn5712-1"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_latin_viscii_lower);
  Vcharset_latin_viscii_lower =
    make_charset (LEADING_BYTE_LATIN_VISCII_LOWER, Qlatin_viscii_lower, 96, 1,
		  1, 1, '1', CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII lower"),
		  build_string ("VISCII lower (Vietnamese)"),
		  build_string ("VISCII lower (Vietnamese)"),
		  build_string ("MULEVISCII-LOWER"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_latin_viscii_upper);
  Vcharset_latin_viscii_upper =
    make_charset (LEADING_BYTE_LATIN_VISCII_UPPER, Qlatin_viscii_upper, 96, 1,
		  1, 1, '2', CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII upper"),
		  build_string ("VISCII upper (Vietnamese)"),
		  build_string ("VISCII upper (Vietnamese)"),
		  build_string ("MULEVISCII-UPPER"),
		  Qnil, 0, 0, 0, 32);
  staticpro (&Vcharset_latin_viscii);
  Vcharset_latin_viscii =
    make_charset (LEADING_BYTE_LATIN_VISCII, Qlatin_viscii, 256, 1,
		  1, 2, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII"),
		  build_string ("VISCII 1.1 (Vietnamese)"),
		  build_string ("VISCII 1.1 (Vietnamese)"),
		  build_string ("VISCII1\\.1"),
		  Qnil, 0, 0, 0, 0);
  staticpro (&Vcharset_ideograph_daikanwa);
  Vcharset_ideograph_daikanwa =
    make_charset (LEADING_BYTE_DAIKANWA, Qideograph_daikanwa, 256, 2,
		  2, 2, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Daikanwa"),
		  build_string ("Morohashi's Daikanwa"),
		  build_string ("Daikanwa dictionary by MOROHASHI Tetsuji"),
		  build_string ("Daikanwa"),
		  Qnil, MIN_CHAR_DAIKANWA, MAX_CHAR_DAIKANWA, 0, 0);
  staticpro (&Vcharset_mojikyo);
  Vcharset_mojikyo =
    make_charset (LEADING_BYTE_MOJIKYO, Qmojikyo, 256, 3,
		  2, 2, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo"),
		  build_string ("Mojikyo"),
		  build_string ("Konjaku-Mojikyo"),
		  build_string (""),
		  Qnil, MIN_CHAR_MOJIKYO, MAX_CHAR_MOJIKYO, 0, 0);
  staticpro (&Vcharset_mojikyo_pj_1);
  Vcharset_mojikyo_pj_1 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_1, Qmojikyo_pj_1, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-1"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 1"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 1"),
		  build_string ("jisx0208\\.Mojikyo-1$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_2);
  Vcharset_mojikyo_pj_2 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_2, Qmojikyo_pj_2, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-2"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 2"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 2"),
		  build_string ("jisx0208\\.Mojikyo-2$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_3);
  Vcharset_mojikyo_pj_3 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_3, Qmojikyo_pj_3, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-3"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 3"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 3"),
		  build_string ("jisx0208\\.Mojikyo-3$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_4);
  Vcharset_mojikyo_pj_4 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_4, Qmojikyo_pj_4, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-4"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 4"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 4"),
		  build_string ("jisx0208\\.Mojikyo-4$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_5);
  Vcharset_mojikyo_pj_5 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_5, Qmojikyo_pj_5, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-5"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 5"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 5"),
		  build_string ("jisx0208\\.Mojikyo-5$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_6);
  Vcharset_mojikyo_pj_6 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_6, Qmojikyo_pj_6, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-6"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 6"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 6"),
		  build_string ("jisx0208\\.Mojikyo-6$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_7);
  Vcharset_mojikyo_pj_7 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_7, Qmojikyo_pj_7, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-7"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 7"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 7"),
		  build_string ("jisx0208\\.Mojikyo-7$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_8);
  Vcharset_mojikyo_pj_8 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_8, Qmojikyo_pj_8, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-8"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 8"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 8"),
		  build_string ("jisx0208\\.Mojikyo-8$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_9);
  Vcharset_mojikyo_pj_9 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_9, Qmojikyo_pj_9, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-9"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 9"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 9"),
		  build_string ("jisx0208\\.Mojikyo-9$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_10);
  Vcharset_mojikyo_pj_10 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_10, Qmojikyo_pj_10, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-10"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 10"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 10"),
		  build_string ("jisx0208\\.Mojikyo-10$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_11);
  Vcharset_mojikyo_pj_11 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_11, Qmojikyo_pj_11, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-11"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 11"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 11"),
		  build_string ("jisx0208\\.Mojikyo-11$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_12);
  Vcharset_mojikyo_pj_12 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_12, Qmojikyo_pj_12, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-12"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 12"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 12"),
		  build_string ("jisx0208\\.Mojikyo-12$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_13);
  Vcharset_mojikyo_pj_13 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_13, Qmojikyo_pj_13, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-13"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 13"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 13"),
		  build_string ("jisx0208\\.Mojikyo-13$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_14);
  Vcharset_mojikyo_pj_14 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_14, Qmojikyo_pj_14, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-14"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 14"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 14"),
		  build_string ("jisx0208\\.Mojikyo-14$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_15);
  Vcharset_mojikyo_pj_15 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_15, Qmojikyo_pj_15, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-15"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 15"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 15"),
		  build_string ("jisx0208\\.Mojikyo-15$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_16);
  Vcharset_mojikyo_pj_16 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_16, Qmojikyo_pj_16, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-16"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 16"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 16"),
		  build_string ("jisx0208\\.Mojikyo-16$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_17);
  Vcharset_mojikyo_pj_17 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_17, Qmojikyo_pj_17, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-17"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 17"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 17"),
		  build_string ("jisx0208\\.Mojikyo-17$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_18);
  Vcharset_mojikyo_pj_18 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_18, Qmojikyo_pj_18, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-18"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 18"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 18"),
		  build_string ("jisx0208\\.Mojikyo-18$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_19);
  Vcharset_mojikyo_pj_19 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_19, Qmojikyo_pj_19, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-19"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 19"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 19"),
		  build_string ("jisx0208\\.Mojikyo-19$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_20);
  Vcharset_mojikyo_pj_20 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_20, Qmojikyo_pj_20, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-20"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 20"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 20"),
		  build_string ("jisx0208\\.Mojikyo-20$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_mojikyo_pj_21);
  Vcharset_mojikyo_pj_21 =
    make_charset (LEADING_BYTE_MOJIKYO_PJ_21, Qmojikyo_pj_21, 94, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Mojikyo-PJ-21"),
		  build_string ("Mojikyo (pseudo JIS encoding) part 21"),
		  build_string
		  ("Konjaku-Mojikyo (pseudo JIS encoding) part 21"),
		  build_string ("jisx0208\\.Mojikyo-21$"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_ethiopic_ucs);
  Vcharset_ethiopic_ucs =
    make_charset (LEADING_BYTE_ETHIOPIC_UCS, Qethiopic_ucs, 256, 2,
		  2, 2, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Ethiopic (UCS)"),
		  build_string ("Ethiopic (UCS)"),
		  build_string ("Ethiopic of UCS"),
		  build_string ("Ethiopic-Unicode"),
		  Qnil, 0x1200, 0x137F, 0x1200, 0);
#endif
  staticpro (&Vcharset_chinese_big5_1);
  Vcharset_chinese_big5_1 =
    make_charset (LEADING_BYTE_CHINESE_BIG5_1, Qchinese_big5_1, 94, 2,
		  2, 0, '0', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Big5"),
		  build_string ("Big5 (Level-1)"),
		  build_string
		  ("Big5 Level-1 Chinese traditional"),
		  build_string ("big5"),
		  Qnil, 0, 0, 0, 33);
  staticpro (&Vcharset_chinese_big5_2);
  Vcharset_chinese_big5_2 =
    make_charset (LEADING_BYTE_CHINESE_BIG5_2, Qchinese_big5_2, 94, 2,
		  2, 0, '1', CHARSET_LEFT_TO_RIGHT,
		  build_string ("Big5"),
		  build_string ("Big5 (Level-2)"),
		  build_string
		  ("Big5 Level-2 Chinese traditional"),
		  build_string ("big5"),
		  Qnil, 0, 0, 0, 33);

#ifdef ENABLE_COMPOSITE_CHARS
  /* #### For simplicity, we put composite chars into a 96x96 charset.
     This is going to lead to problems because you can run out of
     room, esp. as we don't yet recycle numbers. */
  staticpro (&Vcharset_composite);
  Vcharset_composite =
    make_charset (LEADING_BYTE_COMPOSITE, Qcomposite, 96, 2,
		  2, 0, 0, CHARSET_LEFT_TO_RIGHT,
		  build_string ("Composite"),
		  build_string ("Composite characters"),
		  build_string ("Composite characters"),
		  build_string (""));

  /* #### not dumped properly */
  composite_char_row_next = 32;
  composite_char_col_next = 32;

  Vcomposite_char_string2char_hash_table =
    make_lisp_hash_table (500, HASH_TABLE_NON_WEAK, HASH_TABLE_EQUAL);
  Vcomposite_char_char2string_hash_table =
    make_lisp_hash_table (500, HASH_TABLE_NON_WEAK, HASH_TABLE_EQ);
  staticpro (&Vcomposite_char_string2char_hash_table);
  staticpro (&Vcomposite_char_char2string_hash_table);
#endif /* ENABLE_COMPOSITE_CHARS */

}
