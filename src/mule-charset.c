/* Functions to handle multilingual characters.
   Copyright (C) 1992, 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.

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
Lisp_Object Vcharset_korean_ksc5601;
Lisp_Object Vcharset_japanese_jisx0212;
Lisp_Object Vcharset_chinese_cns11643_1;
Lisp_Object Vcharset_chinese_cns11643_2;
#ifdef UTF2000
Lisp_Object Vcharset_ucs_bmp;
Lisp_Object Vcharset_latin_viscii;
Lisp_Object Vcharset_latin_viscii_lower;
Lisp_Object Vcharset_latin_viscii_upper;
Lisp_Object Vcharset_hiragana_jisx0208;
Lisp_Object Vcharset_katakana_jisx0208;
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

/* Table of charsets indexed by leading byte. */
Lisp_Object charset_by_leading_byte[NUM_LEADING_BYTES];

/* Table of charsets indexed by type/final-byte/direction. */
#ifdef UTF2000
Lisp_Object charset_by_attributes[4][128];
#else
Lisp_Object charset_by_attributes[4][128][2];
#endif

#ifndef UTF2000
/* Table of number of bytes in the string representation of a character
   indexed by the first byte of that representation.

   rep_bytes_by_first_byte(c) is more efficient than the equivalent
   canonical computation:

   (BYTE_ASCII_P (c) ? 1 : XCHARSET_REP_BYTES (CHARSET_BY_LEADING_BYTE (c))) */

Bytecount rep_bytes_by_first_byte[0xA0] =
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
mark_char_byte_table (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_Char_Byte_Table *cte = XCHAR_BYTE_TABLE (obj);
  int i;

  for (i = 0; i < 256; i++)
    {
      markobj (cte->property[i]);
    }
  return Qnil;
}

static int
char_byte_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  struct Lisp_Char_Byte_Table *cte1 = XCHAR_BYTE_TABLE (obj1);
  struct Lisp_Char_Byte_Table *cte2 = XCHAR_BYTE_TABLE (obj2);
  int i;

  for (i = 0; i < 256; i++)
    if (CHAR_BYTE_TABLE_P (cte1->property[i]))
      {
	if (CHAR_BYTE_TABLE_P (cte2->property[i]))
	  {
	    if (!char_byte_table_equal (cte1->property[i],
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
char_byte_table_hash (Lisp_Object obj, int depth)
{
  struct Lisp_Char_Byte_Table *cte = XCHAR_BYTE_TABLE (obj);

  return internal_array_hash (cte->property, 256, depth);
}

static const struct lrecord_description char_byte_table_description[] = {
  { XD_LISP_OBJECT, offsetof(struct Lisp_Char_Byte_Table, property), 256 },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("char-code-table", char_byte_table,
                               mark_char_byte_table,
			       internal_object_printer,
			       0, char_byte_table_equal,
			       char_byte_table_hash,
			       char_byte_table_description,
			       struct Lisp_Char_Byte_Table);


static Lisp_Object
make_char_byte_table (Lisp_Object initval)
{
  Lisp_Object obj;
  int i;
  struct Lisp_Char_Byte_Table *cte =
    alloc_lcrecord_type (struct Lisp_Char_Byte_Table,
			 &lrecord_char_byte_table);

  for (i = 0; i < 256; i++)
    cte->property[i] = initval;

  XSETCHAR_BYTE_TABLE (obj, cte);
  return obj;
}

static Lisp_Object
copy_char_byte_table (Lisp_Object entry)
{
  struct Lisp_Char_Byte_Table *cte = XCHAR_BYTE_TABLE (entry);
  Lisp_Object obj;
  int i;
  struct Lisp_Char_Byte_Table *ctenew =
    alloc_lcrecord_type (struct Lisp_Char_Byte_Table,
			 &lrecord_char_byte_table);

  for (i = 0; i < 256; i++)
    {
      Lisp_Object new = cte->property[i];
      if (CHAR_BYTE_TABLE_P (new))
	ctenew->property[i] = copy_char_byte_table (new);
      else
	ctenew->property[i] = new;
    }

  XSETCHAR_BYTE_TABLE (obj, ctenew);
  return obj;
}

#define make_char_code_table(initval) make_char_byte_table(initval)

Lisp_Object
get_char_code_table (Emchar ch, Lisp_Object table)
{
  struct Lisp_Char_Byte_Table* cpt = XCHAR_BYTE_TABLE (table);
  Lisp_Object ret = cpt->property [ch >> 24];

  if (CHAR_BYTE_TABLE_P (ret))
    cpt = XCHAR_BYTE_TABLE (ret);
  else
    return ret;

  ret = cpt->property [(unsigned char) (ch >> 16)];
  if (CHAR_BYTE_TABLE_P (ret))
    cpt = XCHAR_BYTE_TABLE (ret);
  else
    return ret;

  ret = cpt->property [(unsigned char) (ch >> 8)];
  if (CHAR_BYTE_TABLE_P (ret))
    cpt = XCHAR_BYTE_TABLE (ret);
  else
    return ret;
  
  return cpt->property [(unsigned char) ch];
}

void
put_char_code_table (Emchar ch, Lisp_Object value, Lisp_Object table)
{
  struct Lisp_Char_Byte_Table* cpt1 = XCHAR_BYTE_TABLE (table);
  Lisp_Object ret = cpt1->property[ch >> 24];

  if (CHAR_BYTE_TABLE_P (ret))
    {
      struct Lisp_Char_Byte_Table* cpt2 = XCHAR_BYTE_TABLE (ret);
      
      ret = cpt2->property[(unsigned char)(ch >> 16)];
      if (CHAR_BYTE_TABLE_P (ret))
	{
	  struct Lisp_Char_Byte_Table* cpt3 = XCHAR_BYTE_TABLE (ret);
	  
	  ret = cpt3->property[(unsigned char)(ch >> 8)];
	  if (CHAR_BYTE_TABLE_P (ret))
	    {
	      struct Lisp_Char_Byte_Table* cpt4
		= XCHAR_BYTE_TABLE (ret);
	      
	      cpt4->property[(unsigned char)ch] = value;
	    }
	  else if (!EQ (ret, value))
	    {
	      Lisp_Object cpt4 = make_char_byte_table (ret);
	      
	      XCHAR_BYTE_TABLE(cpt4)->property[(unsigned char)ch] = value;
	      cpt3->property[(unsigned char)(ch >> 8)] = cpt4;
	    }
	}
      else if (!EQ (ret, value))
	{
	  Lisp_Object cpt3 = make_char_byte_table (ret);
	  Lisp_Object cpt4 = make_char_byte_table (ret);
	  
	  XCHAR_BYTE_TABLE(cpt4)->property[(unsigned char)ch] = value;
	  XCHAR_BYTE_TABLE(cpt3)->property[(unsigned char)(ch >> 8)]
	    = cpt4;
	  cpt2->property[(unsigned char)(ch >> 16)] = cpt3;
	}
    }
  else if (!EQ (ret, value))
    {
      Lisp_Object cpt2 = make_char_byte_table (ret);
      Lisp_Object cpt3 = make_char_byte_table (ret);
      Lisp_Object cpt4 = make_char_byte_table (ret);
      
      XCHAR_BYTE_TABLE(cpt4)->property[(unsigned char)ch] = value;
      XCHAR_BYTE_TABLE(cpt3)->property[(unsigned char)(ch >>  8)] = cpt4;
      XCHAR_BYTE_TABLE(cpt2)->property[(unsigned char)(ch >> 16)] = cpt3;
      cpt1->property[(unsigned char)(ch >> 24)] = cpt2;
    }
}


Lisp_Object Vcharacter_attribute_table;

DEFUN ("char-attribute-alist", Fchar_attribute_alist, 1, 1, 0, /*
Return the alist of attributes of CHARACTER.
*/
       (character))
{
  return get_char_code_table (XCHAR (character), Vcharacter_attribute_table);
}

DEFUN ("get-char-attribute", Fget_char_attribute, 2, 2, 0, /*
Return the value of CHARACTER's ATTRIBUTE.
*/
       (character, attribute))
{
  Lisp_Object ret
    = get_char_code_table (XCHAR (character), Vcharacter_attribute_table);

  if (EQ (ret, Qnil))
    return Qnil;
  
  return Fcdr (Fassq (attribute, ret));
}

DEFUN ("put-char-attribute", Fput_char_attribute, 3, 3, 0, /*
Store CHARACTER's ATTRIBUTE with VALUE.
*/
       (character, attribute, value))
{
  Emchar char_code = XCHAR (character);
  Lisp_Object ret
    = get_char_code_table (char_code, Vcharacter_attribute_table);
  Lisp_Object cell = Fassq (attribute, ret);

  if (EQ (cell, Qnil))
    ret = Fcons (Fcons (attribute, value), ret);
  else
    Fsetcdr (cell, value);
  put_char_code_table (char_code, ret, Vcharacter_attribute_table);
  return ret;
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
  Qkorean_ksc5601,
  Qjapanese_jisx0212,
  Qchinese_cns11643_1,
  Qchinese_cns11643_2,
#ifdef UTF2000
  Qucs_bmp,
  Qlatin_viscii,
  Qlatin_viscii_lower,
  Qlatin_viscii_upper,
  Qvietnamese_viscii_lower,
  Qvietnamese_viscii_upper,
  Qhiragana_jisx0208,
  Qkatakana_jisx0208,
#endif
  Qchinese_big5_1,
  Qchinese_big5_2,
  Qcomposite;

Lisp_Object Ql2r, Qr2l;

Lisp_Object Vcharset_hash_table;

#ifdef UTF2000
static Charset_ID next_allocated_leading_byte;
#else
static Charset_ID next_allocated_1_byte_leading_byte;
static Charset_ID next_allocated_2_byte_leading_byte;
#endif

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
non_ascii_charptr_emchar (CONST Bufbyte *str)
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

      if (f3 != 0x20 && f3 != 0x7F)
	return 1;

      /*
	 NOTE: This takes advantage of the fact that
	 FIELD2_TO_OFFICIAL_LEADING_BYTE and
	 FIELD2_TO_PRIVATE_LEADING_BYTE are the same.
	 */
      charset = CHARSET_BY_LEADING_BYTE (f2 + FIELD2_TO_OFFICIAL_LEADING_BYTE);
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

      if (f2 != 0x20 && f2 != 0x7F && f3 != 0x20 && f3 != 0x7F)
	return 1;

      if (f1 <= MAX_CHAR_FIELD1_OFFICIAL)
	charset =
	  CHARSET_BY_LEADING_BYTE (f1 + FIELD1_TO_OFFICIAL_LEADING_BYTE);
      else
	charset =
	  CHARSET_BY_LEADING_BYTE (f1 + FIELD1_TO_PRIVATE_LEADING_BYTE);

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
non_ascii_charptr_copy_char (CONST Bufbyte *ptr, Bufbyte *str)
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
mark_charset (Lisp_Object obj, void (*markobj) (Lisp_Object))
{
  struct Lisp_Charset *cs = XCHARSET (obj);

  markobj (cs->short_name);
  markobj (cs->long_name);
  markobj (cs->doc_string);
  markobj (cs->registry);
  markobj (cs->ccl_program);
#ifdef UTF2000
  markobj (cs->decoding_table);
#endif
  return cs->name;
}

static void
print_charset (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  struct Lisp_Charset *cs = XCHARSET (obj);
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
  sprintf (buf, " %s %s cols=%d g%d final='%c' reg=",
	   CHARSET_TYPE (cs) == CHARSET_TYPE_94    ? "94" :
	   CHARSET_TYPE (cs) == CHARSET_TYPE_96    ? "96" :
	   CHARSET_TYPE (cs) == CHARSET_TYPE_94X94 ? "94x94" :
	   "96x96",
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
  { XD_LISP_OBJECT, offsetof(struct Lisp_Charset, name), 7 },
#ifdef UTF2000
  { XD_LISP_OBJECT, offsetof(struct Lisp_Charset, decoding_table), 2 },
#endif
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("charset", charset,
                               mark_charset, print_charset, 0, 0, 0,
			       charset_description,
			       struct Lisp_Charset);

/* Make a new charset. */

static Lisp_Object
make_charset (Charset_ID id, Lisp_Object name,
	      unsigned char type, unsigned char columns, unsigned char graphic,
	      Bufbyte final, unsigned char direction, Lisp_Object short_name,
	      Lisp_Object long_name, Lisp_Object doc,
	      Lisp_Object reg,
	      Lisp_Object decoding_table,
	      Emchar ucs_min, Emchar ucs_max,
	      Emchar code_offset, unsigned char byte_offset)
{
  Lisp_Object obj;
  struct Lisp_Charset *cs =
    alloc_lcrecord_type (struct Lisp_Charset, &lrecord_charset);
  XSETCHARSET (obj, cs);

  CHARSET_ID		(cs) = id;
  CHARSET_NAME		(cs) = name;
  CHARSET_SHORT_NAME	(cs) = short_name;
  CHARSET_LONG_NAME	(cs) = long_name;
  CHARSET_DIRECTION	(cs) = direction;
  CHARSET_TYPE		(cs) = type;
  CHARSET_COLUMNS	(cs) = columns;
  CHARSET_GRAPHIC	(cs) = graphic;
  CHARSET_FINAL		(cs) = final;
  CHARSET_DOC_STRING	(cs) = doc;
  CHARSET_REGISTRY	(cs) = reg;
  CHARSET_CCL_PROGRAM	(cs) = Qnil;
  CHARSET_REVERSE_DIRECTION_CHARSET (cs) = Qnil;
#ifdef UTF2000
  CHARSET_DECODING_TABLE(cs) = Qnil;
  CHARSET_UCS_MIN(cs) = ucs_min;
  CHARSET_UCS_MAX(cs) = ucs_max;
  CHARSET_CODE_OFFSET(cs) = code_offset;
  CHARSET_BYTE_OFFSET(cs) = byte_offset;
#endif

  switch (CHARSET_TYPE (cs))
    {
    case CHARSET_TYPE_94:
      CHARSET_DIMENSION (cs) = 1;
      CHARSET_CHARS (cs) = 94;
      break;
    case CHARSET_TYPE_96:
      CHARSET_DIMENSION (cs) = 1;
      CHARSET_CHARS (cs) = 96;
      break;
    case CHARSET_TYPE_94X94:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 94;
      break;
    case CHARSET_TYPE_96X96:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 96;
      break;
#ifdef UTF2000
    case CHARSET_TYPE_128:
      CHARSET_DIMENSION (cs) = 1;
      CHARSET_CHARS (cs) = 128;
      break;
    case CHARSET_TYPE_128X128:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 128;
      break;
    case CHARSET_TYPE_256:
      CHARSET_DIMENSION (cs) = 1;
      CHARSET_CHARS (cs) = 256;
      break;
    case CHARSET_TYPE_256X256:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 256;
      break;
#endif
    }

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
	  assert (NILP (charset_by_attributes[type][final]));
	  charset_by_attributes[type][final] = obj;
	}
#else
      assert (NILP (charset_by_attributes[type][final][direction]));
      charset_by_attributes[type][final][direction] = obj;
#endif
    }

  assert (NILP (charset_by_leading_byte[id - MIN_LEADING_BYTE]));
  charset_by_leading_byte[id - MIN_LEADING_BYTE] = obj;
#ifndef UTF2000
  if (id < 0xA0)
    /* official leading byte */
    rep_bytes_by_first_byte[id] = CHARSET_REP_BYTES (cs);
#endif

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
  if (next_allocated_leading_byte > MAX_LEADING_BYTE_PRIVATE)
    lb = 0;
  else
    lb = next_allocated_leading_byte++;
#else
  if (dimension == 1)
    {
      if (next_allocated_1_byte_leading_byte > MAX_LEADING_BYTE_PRIVATE_1)
	lb = 0;
      else
	lb = next_allocated_1_byte_leading_byte++;
    }
  else
    {
      if (next_allocated_2_byte_leading_byte > MAX_LEADING_BYTE_PRIVATE_2)
	lb = 0;
      else
	lb = next_allocated_2_byte_leading_byte++;
    }
#endif

  if (!lb)
    signal_simple_error
      ("No more character sets free for this dimension",
       make_int (dimension));

  return lb;
}

#ifdef UTF2000
Lisp_Object
range_charset_code_point (Lisp_Object charset, Emchar ch)
{
  int d;

  if ((XCHARSET_UCS_MIN (charset) <= ch)
      && (ch <= XCHARSET_UCS_MAX (charset)))
    {
      d = ch - XCHARSET_UCS_MIN (charset) + XCHARSET_CODE_OFFSET (charset);
		       
      if (XCHARSET_DIMENSION (charset) == 1)
	return list1 (make_int (d + XCHARSET_BYTE_OFFSET (charset)));
      else if (XCHARSET_DIMENSION (charset) == 2)
	return list2 (make_int (d / XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)),
		      make_int (d % XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)));
      else if (XCHARSET_DIMENSION (charset) == 3)
	return list3 (make_int (d / (XCHARSET_CHARS (charset)
					* XCHARSET_CHARS (charset))
				+ XCHARSET_BYTE_OFFSET (charset)),
		      make_int (d / XCHARSET_CHARS (charset)
				% XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)),
		      make_int (d % XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)));
      else /* if (XCHARSET_DIMENSION (charset) == 4) */
	return list4 (make_int (d / (XCHARSET_CHARS (charset)
					* XCHARSET_CHARS (charset)
					* XCHARSET_CHARS (charset))
				+ XCHARSET_BYTE_OFFSET (charset)),
		      make_int (d / (XCHARSET_CHARS (charset)
					* XCHARSET_CHARS (charset))
				% XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)),
		      make_int (d / XCHARSET_CHARS (charset)
				% XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)),
		      make_int (d % XCHARSET_CHARS (charset)
				+ XCHARSET_BYTE_OFFSET (charset)));
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
		return list1 (make_int (d + 33));
	    }
	  else if (XCHARSET_CHARS (charset) == 96)
	    {
	      if (((d = ch - (MIN_CHAR_96
			      + (XCHARSET_FINAL (charset) - '0') * 96)) >= 0)
		  && (d < 96))
		return list1 (make_int (d + 32));
	    }
	  else
	    return Qnil;
	}
      else if (XCHARSET_DIMENSION (charset) == 2)
	{
	  if (XCHARSET_CHARS (charset) == 94)
	    {
	      if (((d = ch - (MIN_CHAR_94x94
			      + (XCHARSET_FINAL (charset) - '0') * 94 * 94))
		   >= 0)
		  && (d < 94 * 94))
		return list2 ((d / 94) + 33, d % 94 + 33);
	    }
	  else if (XCHARSET_CHARS (charset) == 96)
	    {
	      if (((d = ch - (MIN_CHAR_96x96
			      + (XCHARSET_FINAL (charset) - '0') * 96 * 96))
		   >= 0)
		  && (d < 96 * 96))
		return list2 ((d / 96) + 32, d % 96 + 32);
	    }
	}
    }
  return Qnil;
}

Lisp_Object
charset_code_point (Lisp_Object charset, Emchar ch)
{
  Lisp_Object cdef = get_char_code_table (ch, Vcharacter_attribute_table);

  if (!EQ (cdef, Qnil))
    {
      Lisp_Object field = Fassq (charset, cdef);

      if (!EQ (field, Qnil))
	return Fcdr (field);
    }
  return range_charset_code_point (charset, ch);
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
#ifdef UTF2000
  unsigned char byte_offset = 0;
#endif

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
  charset = make_charset (id, name, type, columns, graphic,
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
  int id, dimension, columns, graphic, final;
  int direction, type;
  Lisp_Object registry, doc_string, short_name, long_name;
  struct Lisp_Charset *cs;

  charset = Fget_charset (charset);
  if (!NILP (XCHARSET_REVERSE_DIRECTION_CHARSET (charset)))
    signal_simple_error ("Charset already has reverse-direction charset",
			 charset);

  CHECK_SYMBOL (new_name);
  if (!NILP (Ffind_charset (new_name)))
    signal_simple_error ("Cannot redefine existing charset", new_name);

  cs = XCHARSET (charset);

  type      = CHARSET_TYPE      (cs);
  columns   = CHARSET_COLUMNS   (cs);
  dimension = CHARSET_DIMENSION (cs);
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

  new_charset = make_charset (id, new_name, type, columns,
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
  struct Lisp_Charset *cs;

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
      if (XVECTOR_LENGTH (table) > CHARSET_CHARS (cs))
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
	    Fput_char_attribute
	      (c, charset,
	       list1 (make_int (i + CHARSET_BYTE_OFFSET (cs))));
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
		    Fput_char_attribute (c, charset,
					 list2
					 (make_int
					  (i + CHARSET_BYTE_OFFSET (cs)),
					  make_int
					  (j + CHARSET_BYTE_OFFSET (cs))));
		}
	    }
	  else if (CHARP (v))
	    Fput_char_attribute (v, charset,
				 list1
				 (make_int (i + CHARSET_BYTE_OFFSET (cs))));
	}
      break;
    }
  return table;
}
#endif


/************************************************************************/
/*              Lisp primitives for working with characters             */
/************************************************************************/

DEFUN ("make-char", Fmake_char, 2, 3, 0, /*
Make a character from CHARSET and octets ARG1 and ARG2.
ARG2 is required only for characters from two-dimensional charsets.
For example, (make-char 'latin-iso8859-2 185) will return the Latin 2
character s with caron.
*/
       (charset, arg1, arg2))
{
  struct Lisp_Charset *cs;
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

DEFUN ("split-char", Fsplit_char, 1, 1, 0, /*
Return list of charset and one or two position-codes of CHAR.
*/
       (character))
{
  /* This function can GC */
  struct gcpro gcpro1, gcpro2;
  Lisp_Object charset = Qnil;
  Lisp_Object rc = Qnil;
  int c1, c2;

  GCPRO2 (charset, rc);
  CHECK_CHAR_COERCE_INT (character);

  BREAKUP_CHAR (XCHAR (character), charset, c1, c2);

  if (XCHARSET_DIMENSION (Fget_charset (charset)) == 2)
    {
      rc = list3 (XCHARSET_NAME (charset), make_int (c1), make_int (c2));
    }
  else
    {
      rc = list2 (XCHARSET_NAME (charset), make_int (c1));
    }
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
  DEFSUBR (Fcharset_mapping_table);
  DEFSUBR (Fset_charset_mapping_table);
#endif

  DEFSUBR (Fmake_char);
  DEFSUBR (Fchar_charset);
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
  defsymbol (&Qkorean_ksc5601,		"korean-ksc5601");
  defsymbol (&Qjapanese_jisx0212,	"japanese-jisx0212");
  defsymbol (&Qchinese_cns11643_1,	"chinese-cns11643-1");
  defsymbol (&Qchinese_cns11643_2,	"chinese-cns11643-2");
#ifdef UTF2000
  defsymbol (&Qucs_bmp,			"ucs-bmp");
  defsymbol (&Qlatin_viscii,		"latin-viscii");
  defsymbol (&Qlatin_viscii_lower,	"latin-viscii-lower");
  defsymbol (&Qlatin_viscii_upper,	"latin-viscii-upper");
  defsymbol (&Qvietnamese_viscii_lower,	"vietnamese-viscii-lower");
  defsymbol (&Qvietnamese_viscii_upper,	"vietnamese-viscii-upper");
  defsymbol (&Qhiragana_jisx0208, 	"hiragana-jisx0208");
  defsymbol (&Qkatakana_jisx0208, 	"katakana-jisx0208");
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

  /* Table of charsets indexed by leading byte. */
  for (i = 0; i < countof (charset_by_leading_byte); i++)
    charset_by_leading_byte[i] = Qnil;

#ifdef UTF2000
  /* Table of charsets indexed by type/final-byte. */
  for (i = 0; i < countof (charset_by_attributes); i++)
    for (j = 0; j < countof (charset_by_attributes[0]); j++)
	charset_by_attributes[i][j] = Qnil;
#else
  /* Table of charsets indexed by type/final-byte/direction. */
  for (i = 0; i < countof (charset_by_attributes); i++)
    for (j = 0; j < countof (charset_by_attributes[0]); j++)
      for (k = 0; k < countof (charset_by_attributes[0][0]); k++)
	charset_by_attributes[i][j][k] = Qnil;
#endif

#ifdef UTF2000
  next_allocated_leading_byte = MIN_LEADING_BYTE_PRIVATE;
#else
  next_allocated_1_byte_leading_byte = MIN_LEADING_BYTE_PRIVATE_1;
  next_allocated_2_byte_leading_byte = MIN_LEADING_BYTE_PRIVATE_2;
#endif

#ifndef UTF2000
  leading_code_private_11 = PRE_LEADING_BYTE_PRIVATE_1;
  DEFVAR_INT ("leading-code-private-11", &leading_code_private_11 /*
Leading-code of private TYPE9N charset of column-width 1.
*/ );
  leading_code_private_11 = PRE_LEADING_BYTE_PRIVATE_1;
#endif

#ifdef UTF2000
  Vutf_2000_version = build_string("0.10 (Yao)");
  DEFVAR_LISP ("utf-2000-version", &Vutf_2000_version /*
Version number of UTF-2000.
*/ );

  staticpro (&Vcharacter_attribute_table);
  Vcharacter_attribute_table = make_char_code_table (Qnil);

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
  Vcharset_ucs_bmp =
    make_charset (LEADING_BYTE_UCS_BMP, Qucs_bmp,
		  CHARSET_TYPE_256X256, 1, 2, 0,
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("BMP"),
		  build_string ("BMP"),
		  build_string ("ISO/IEC 10646 Group 0 Plane 0 (BMP)"),
		  build_string ("\\(ISO10646.*-1\\|UNICODE[23]?-0\\)"),
		  Qnil, 0, 0xFFFF, 0, 0);
#else
# define MIN_CHAR_THAI 0
# define MAX_CHAR_THAI 0
# define MIN_CHAR_GREEK 0
# define MAX_CHAR_GREEK 0
# define MIN_CHAR_HEBREW 0
# define MAX_CHAR_HEBREW 0
# define MIN_CHAR_HALFWIDTH_KATAKANA 0
# define MAX_CHAR_HALFWIDTH_KATAKANA 0
# define MIN_CHAR_CYRILLIC 0
# define MAX_CHAR_CYRILLIC 0
#endif
  Vcharset_ascii =
    make_charset (LEADING_BYTE_ASCII, Qascii,
		  CHARSET_TYPE_94, 1, 0, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("ASCII"),
		  build_string ("ASCII)"),
		  build_string ("ASCII (ISO646 IRV)"),
		  build_string ("\\(iso8859-[0-9]*\\|-ascii\\)"),
		  Qnil, 0, 0x7F, 0, 0);
  Vcharset_control_1 =
    make_charset (LEADING_BYTE_CONTROL_1, Qcontrol_1,
		  CHARSET_TYPE_94, 1, 1, 0,
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("C1"),
		  build_string ("Control characters"),
		  build_string ("Control characters 128-191"),
		  build_string (""),
		  Qnil, 0x80, 0x9F, 0, 0);
  Vcharset_latin_iso8859_1 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_1, Qlatin_iso8859_1,
		  CHARSET_TYPE_96, 1, 1, 'A',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-1"),
		  build_string ("ISO8859-1 (Latin-1)"),
		  build_string ("ISO8859-1 (Latin-1)"),
		  build_string ("iso8859-1"),
		  Qnil, 0xA0, 0xFF, 0, 32);
  Vcharset_latin_iso8859_2 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_2, Qlatin_iso8859_2,
		  CHARSET_TYPE_96, 1, 1, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-2"),
		  build_string ("ISO8859-2 (Latin-2)"),
		  build_string ("ISO8859-2 (Latin-2)"),
		  build_string ("iso8859-2"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_latin_iso8859_3 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_3, Qlatin_iso8859_3,
		  CHARSET_TYPE_96, 1, 1, 'C',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-3"),
		  build_string ("ISO8859-3 (Latin-3)"),
		  build_string ("ISO8859-3 (Latin-3)"),
		  build_string ("iso8859-3"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_latin_iso8859_4 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_4, Qlatin_iso8859_4,
		  CHARSET_TYPE_96, 1, 1, 'D',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-4"),
		  build_string ("ISO8859-4 (Latin-4)"),
		  build_string ("ISO8859-4 (Latin-4)"),
		  build_string ("iso8859-4"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_thai_tis620 =
    make_charset (LEADING_BYTE_THAI_TIS620, Qthai_tis620,
		  CHARSET_TYPE_96, 1, 1, 'T',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("TIS620"),
		  build_string ("TIS620 (Thai)"),
		  build_string ("TIS620.2529 (Thai)"),
		  build_string ("tis620"),
		  Qnil, MIN_CHAR_THAI, MAX_CHAR_THAI, 0, 32);
  Vcharset_greek_iso8859_7 =
    make_charset (LEADING_BYTE_GREEK_ISO8859_7, Qgreek_iso8859_7,
		  CHARSET_TYPE_96, 1, 1, 'F',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("ISO8859-7"),
		  build_string ("ISO8859-7 (Greek)"),
		  build_string ("ISO8859-7 (Greek)"),
		  build_string ("iso8859-7"),
		  Qnil, MIN_CHAR_GREEK, MAX_CHAR_GREEK, 0, 32);
  Vcharset_arabic_iso8859_6 =
    make_charset (LEADING_BYTE_ARABIC_ISO8859_6, Qarabic_iso8859_6,
		  CHARSET_TYPE_96, 1, 1, 'G',
		  CHARSET_RIGHT_TO_LEFT,
		  build_string ("ISO8859-6"),
		  build_string ("ISO8859-6 (Arabic)"),
		  build_string ("ISO8859-6 (Arabic)"),
		  build_string ("iso8859-6"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_hebrew_iso8859_8 =
    make_charset (LEADING_BYTE_HEBREW_ISO8859_8, Qhebrew_iso8859_8,
		  CHARSET_TYPE_96, 1, 1, 'H',
		  CHARSET_RIGHT_TO_LEFT,
		  build_string ("ISO8859-8"),
		  build_string ("ISO8859-8 (Hebrew)"),
		  build_string ("ISO8859-8 (Hebrew)"),
		  build_string ("iso8859-8"),
		  Qnil, MIN_CHAR_HEBREW, MAX_CHAR_HEBREW, 0, 32);
  Vcharset_katakana_jisx0201 =
    make_charset (LEADING_BYTE_KATAKANA_JISX0201, Qkatakana_jisx0201,
		  CHARSET_TYPE_94, 1, 1, 'I',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0201 Kana"),
		  build_string ("JISX0201.1976 (Japanese Kana)"),
		  build_string ("JISX0201.1976 Japanese Kana"),
		  build_string ("jisx0201\\.1976"),
		  Qnil,
		  MIN_CHAR_HALFWIDTH_KATAKANA,
		  MAX_CHAR_HALFWIDTH_KATAKANA, 0, 33);
  Vcharset_latin_jisx0201 =
    make_charset (LEADING_BYTE_LATIN_JISX0201, Qlatin_jisx0201,
		  CHARSET_TYPE_94, 1, 0, 'J',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0201 Roman"),
		  build_string ("JISX0201.1976 (Japanese Roman)"),
		  build_string ("JISX0201.1976 Japanese Roman"),
		  build_string ("jisx0201\\.1976"),
		  Qnil, 0, 0, 0, 33);
  Vcharset_cyrillic_iso8859_5 =
    make_charset (LEADING_BYTE_CYRILLIC_ISO8859_5, Qcyrillic_iso8859_5,
		  CHARSET_TYPE_96, 1, 1, 'L',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("ISO8859-5"),
		  build_string ("ISO8859-5 (Cyrillic)"),
		  build_string ("ISO8859-5 (Cyrillic)"),
		  build_string ("iso8859-5"),
		  Qnil, MIN_CHAR_CYRILLIC, MAX_CHAR_CYRILLIC, 0, 32);
  Vcharset_latin_iso8859_9 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_9, Qlatin_iso8859_9,
		  CHARSET_TYPE_96, 1, 1, 'M',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-5"),
		  build_string ("ISO8859-9 (Latin-5)"),
		  build_string ("ISO8859-9 (Latin-5)"),
		  build_string ("iso8859-9"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_japanese_jisx0208_1978 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208_1978, Qjapanese_jisx0208_1978,
		  CHARSET_TYPE_94X94, 2, 0, '@',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JIS X0208:1978"),
		  build_string ("JIS X0208:1978 (Japanese)"),
		  build_string
		  ("JIS X0208:1978 Japanese Kanji (so called \"old JIS\")"),
		  build_string ("\\(jisx0208\\|jisc6226\\)\\.1978"),
		  Qnil, 0, 0, 0, 33);
  Vcharset_chinese_gb2312 =
    make_charset (LEADING_BYTE_CHINESE_GB2312, Qchinese_gb2312,
		  CHARSET_TYPE_94X94, 2, 0, 'A',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("GB2312"),
		  build_string ("GB2312)"),
		  build_string ("GB2312 Chinese simplified"),
		  build_string ("gb2312"),
		  Qnil, 0, 0, 0, 33);
  Vcharset_japanese_jisx0208 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208, Qjapanese_jisx0208,
		  CHARSET_TYPE_94X94, 2, 0, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0208"),
		  build_string ("JIS X0208:1983 (Japanese)"),
		  build_string ("JIS X0208:1983 Japanese Kanji"),
		  build_string ("jisx0208\\.1983"),
		  Qnil, 0, 0, 0, 33);
  Vcharset_korean_ksc5601 =
    make_charset (LEADING_BYTE_KOREAN_KSC5601, Qkorean_ksc5601,
		  CHARSET_TYPE_94X94, 2, 0, 'C',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("KSC5601"),
		  build_string ("KSC5601 (Korean"),
		  build_string ("KSC5601 Korean Hangul and Hanja"),
		  build_string ("ksc5601"),
		  Qnil, 0, 0, 0, 33);
  Vcharset_japanese_jisx0212 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0212, Qjapanese_jisx0212,
		  CHARSET_TYPE_94X94, 2, 0, 'D',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0212"),
		  build_string ("JISX0212 (Japanese)"),
		  build_string ("JISX0212 Japanese Supplement"),
		  build_string ("jisx0212"),
		  Qnil, 0, 0, 0, 33);

#define CHINESE_CNS_PLANE_RE(n) "cns11643[.-]\\(.*[.-]\\)?" n "$"
  Vcharset_chinese_cns11643_1 =
    make_charset (LEADING_BYTE_CHINESE_CNS11643_1, Qchinese_cns11643_1,
		  CHARSET_TYPE_94X94, 2, 0, 'G',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("CNS11643-1"),
		  build_string ("CNS11643-1 (Chinese traditional)"),
		  build_string
		  ("CNS 11643 Plane 1 Chinese traditional"),
		  build_string (CHINESE_CNS_PLANE_RE("1")),
		  Qnil, 0, 0, 0, 33);
  Vcharset_chinese_cns11643_2 =
    make_charset (LEADING_BYTE_CHINESE_CNS11643_2, Qchinese_cns11643_2,
		  CHARSET_TYPE_94X94, 2, 0, 'H',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("CNS11643-2"),
		  build_string ("CNS11643-2 (Chinese traditional)"),
		  build_string
		  ("CNS 11643 Plane 2 Chinese traditional"),
		  build_string (CHINESE_CNS_PLANE_RE("2")),
		  Qnil, 0, 0, 0, 33);
#ifdef UTF2000
  Vcharset_latin_viscii_lower =
    make_charset (LEADING_BYTE_LATIN_VISCII_LOWER, Qlatin_viscii_lower,
		  CHARSET_TYPE_96, 1, 1, '1',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII lower"),
		  build_string ("VISCII lower (Vietnamese)"),
		  build_string ("VISCII lower (Vietnamese)"),
		  build_string ("MULEVISCII-LOWER"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_latin_viscii_upper =
    make_charset (LEADING_BYTE_LATIN_VISCII_UPPER, Qlatin_viscii_upper,
		  CHARSET_TYPE_96, 1, 1, '2',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII upper"),
		  build_string ("VISCII upper (Vietnamese)"),
		  build_string ("VISCII upper (Vietnamese)"),
		  build_string ("MULEVISCII-UPPER"),
		  Qnil, 0, 0, 0, 32);
  Vcharset_latin_viscii =
    make_charset (LEADING_BYTE_LATIN_VISCII, Qlatin_viscii,
		  CHARSET_TYPE_256, 1, 2, 0,
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII"),
		  build_string ("VISCII 1.1 (Vietnamese)"),
		  build_string ("VISCII 1.1 (Vietnamese)"),
		  build_string ("VISCII1\\.1"),
		  Qnil, 0, 0, 0, 0);
  Vcharset_hiragana_jisx0208 =
    make_charset (LEADING_BYTE_HIRAGANA_JISX0208, Qhiragana_jisx0208,
		  CHARSET_TYPE_94X94, 2, 0, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Hiragana"),
		  build_string ("Hiragana of JIS X0208"),
		  build_string ("Japanese Hiragana of JIS X0208"),
		  build_string ("jisx0208\\.19\\(78\\|83\\|90\\)"),
		  Qnil, MIN_CHAR_HIRAGANA, MAX_CHAR_HIRAGANA,
		  (0x24 - 33) * 94 + (0x21 - 33), 33);
  Vcharset_katakana_jisx0208 =
    make_charset (LEADING_BYTE_KATAKANA_JISX0208, Qkatakana_jisx0208,
		  CHARSET_TYPE_94X94, 2, 0, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Katakana"),
		  build_string ("Katakana of JIS X0208"),
		  build_string ("Japanese Katakana of JIS X0208"),
		  build_string ("jisx0208\\.19\\(78\\|83\\|90\\)"),
		  Qnil, MIN_CHAR_KATAKANA, MAX_CHAR_KATAKANA,
		  (0x25 - 33) * 94 + (0x21 - 33), 33);
#endif
  Vcharset_chinese_big5_1 =
    make_charset (LEADING_BYTE_CHINESE_BIG5_1, Qchinese_big5_1,
		  CHARSET_TYPE_94X94, 2, 0, '0',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Big5"),
		  build_string ("Big5 (Level-1)"),
		  build_string
		  ("Big5 Level-1 Chinese traditional"),
		  build_string ("big5"),
		  Qnil, 0, 0, 0, 33);
  Vcharset_chinese_big5_2 =
    make_charset (LEADING_BYTE_CHINESE_BIG5_2, Qchinese_big5_2,
		  CHARSET_TYPE_94X94, 2, 0, '1',
		  CHARSET_LEFT_TO_RIGHT,
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
  Vcharset_composite =
    make_charset (LEADING_BYTE_COMPOSITE, Qcomposite,
		  CHARSET_TYPE_96X96, 2, 0, 0,
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Composite"),
		  build_string ("Composite characters"),
		  build_string ("Composite characters"),
		  build_string (""));

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
