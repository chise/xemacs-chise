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
Lisp_Object Vcharset_latin_viscii_lower;
Lisp_Object Vcharset_latin_viscii_upper;
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
Emchar_to_byte_table*
make_byte_from_character_table ()
{
  Emchar_to_byte_table* table
    = (Emchar_to_byte_table*) xmalloc (sizeof (Emchar_to_byte_table));

  table->base = NULL;
  return table;
}

void
put_byte_from_character_table (Emchar ch, unsigned char val,
			       Emchar_to_byte_table* table)
{
  if (table->base == NULL)
    {
      table->base = xmalloc (128);
      table->offset = ch - (ch % 128);
      table->size = 128;
      table->base[ch - table->offset] = val;
    }
  else
    {
      int i = ch - table->offset;

      if (i < 0)
	{
	  size_t new_size = table->size - i;
	  size_t j;

	  new_size += 128 - (new_size % 128);
	  table->base = xrealloc (table->base, new_size);
      	  memmove (table->base + (new_size - table->size), table->base,
		   table->size);
	  for (j = 0; j < (new_size - table->size); j++)
	    table->base[j] = 0;
	  table->offset -= (new_size - table->size);
	  table->base[ch - table->offset] = val;
	  table->size = new_size;
	}
      else if (i >= table->size)
	{
	  size_t new_size = i + 1;
	  size_t j;

	  new_size += 128 - (new_size % 128);
	  table->base = xrealloc (table->base, new_size);
      	  for (j = table->size; j < new_size; j++)
	    table->base[j] = 0;
	  table->base[i] = val;
	  table->size = new_size;
	}
      else
	{
      	  table->base[i] = val;
	}
    }
}

unsigned char
get_byte_from_character_table (Emchar ch, Emchar_to_byte_table* table)
{
  size_t i = ch - table->offset;
  if (i < table->size)
    return table->base[i];
  else
    return 0;
}

Lisp_Object latin_jisx0201_to_ucs;
Lisp_Object latin_iso8859_2_to_ucs;
Lisp_Object latin_iso8859_3_to_ucs;
Lisp_Object latin_iso8859_4_to_ucs;
Lisp_Object latin_iso8859_9_to_ucs;
Lisp_Object latin_viscii_lower_to_ucs;
Lisp_Object latin_viscii_upper_to_ucs;

#if 0
Emchar latin_tcvn5712_to_ucs[96] =
{
  0x00A0 /* 0xA0  NO-BREAK SPACE */,
  0x0102 /* 0xA1  LATIN CAPITAL LETTER A WITH BREVE */,
  0x00C2 /* 0xA2  LATIN CAPITAL LETTER A WITH CIRCUMFLEX */,
  0x00CA /* 0xA3  LATIN CAPITAL LETTER E WITH CIRCUMFLEX */,
  0x00D4 /* 0xA4  LATIN CAPITAL LETTER O WITH CIRCUMFLEX */,
  0x01A0 /* 0xA5  LATIN CAPITAL LETTER O WITH HORN */,
  0x01AF /* 0xA6  LATIN CAPITAL LETTER U WITH HORN */,
  0x0110 /* 0xA7  LATIN CAPITAL LETTER D WITH STROKE */,
  0x0103 /* 0xA8  LATIN SMALL LETTER A WITH BREVE */,
  0x00E2 /* 0xA9  LATIN SMALL LETTER A WITH CIRCUMFLEX */,
  0x00EA /* 0xAA  LATIN SMALL LETTER E WITH CIRCUMFLEX */,
  0x00F4 /* 0xAB  LATIN SMALL LETTER O WITH CIRCUMFLEX */,
  0x01A1 /* 0xAC  LATIN SMALL LETTER O WITH HORN */,
  0x01B0 /* 0xAD  LATIN SMALL LETTER U WITH HORN */,
  0x0111 /* 0xAE  LATIN SMALL LETTER D WITH STROKE */,
  0x1EB0 /* 0xAF  LATIN CAPITAL LETTER A WITH BREVE AND GRAVE */,
  0x0300 /* 0xB0  COMBINING GRAVE ACCENT */,
  0x0309 /* 0xB1  COMBINING HOOK ABOVE */,
  0x0303 /* 0xB2  COMBINING TILDE */,
  0x0301 /* 0xB3  COMBINING ACUTE ACCENT */,
  0x0323 /* 0xB4  COMBINING DOT BELOW */,
  0x00E0 /* 0xB5  LATIN SMALL LETTER A WITH GRAVE */,
  0x1EA3 /* 0xB6  LATIN SMALL LETTER A WITH HOOK ABOVE */,
  0x00E3 /* 0xB7  LATIN SMALL LETTER A WITH TILDE */,
  0x00E1 /* 0xB8  LATIN SMALL LETTER A WITH ACUTE */,
  0x1EA1 /* 0xB9  LATIN SMALL LETTER A WITH DOT BELOW */,
  0x1EB2 /* 0xBA  LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE */,
  0x1EB1 /* 0xBB  LATIN SMALL LETTER A WITH BREVE AND GRAVE */,
  0x1EB3 /* 0xBC  LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE */,
  0x1EB5 /* 0xBD  LATIN SMALL LETTER A WITH BREVE AND TILDE */,
  0x1EAF /* 0xBE  LATIN SMALL LETTER A WITH BREVE AND ACUTE */,
  0x1EB4 /* 0xBF  LATIN CAPITAL LETTER A WITH BREVE AND TILDE */,
  0x1EAE /* 0xC0  LATIN CAPITAL LETTER A WITH BREVE AND ACUTE */,
  0x1EA6 /* 0xC1  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE */,
  0x1EA8 /* 0xC2  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE */,
  0x1EAA /* 0xC3  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE */,
  0x1EA4 /* 0xC4  LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE */,
  0x1EC0 /* 0xC5  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE */,
  0x1EB7 /* 0xC6  LATIN SMALL LETTER A WITH BREVE AND DOT BELOW */,
  0x1EA7 /* 0xC7  LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE */,
  0x1EA9 /* 0xC8  LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE */,
  0x1EAB /* 0xC9  LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE */,
  0x1EA5 /* 0xCA  LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE */,
  0x1EAD /* 0xCB  LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW */,
  0x00E8 /* 0xCC  LATIN SMALL LETTER E WITH GRAVE */,
  0x1EC2 /* 0xCD  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE */,
  0x1EBB /* 0xCE  LATIN SMALL LETTER E WITH HOOK ABOVE */,
  0x1EBD /* 0xCF  LATIN SMALL LETTER E WITH TILDE */,
  0x00E9 /* 0xD0  LATIN SMALL LETTER E WITH ACUTE */,
  0x1EB9 /* 0xD1  LATIN SMALL LETTER E WITH DOT BELOW */,
  0x1EC1 /* 0xD2  LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE */,
  0x1EC3 /* 0xD3  LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE */,
  0x1EC5 /* 0xD4  LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE */,
  0x1EBF /* 0xD5  LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE */,
  0x1EC7 /* 0xD6  LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW */,
  0x00EC /* 0xD7  LATIN SMALL LETTER I WITH GRAVE */,
  0x1EC9 /* 0xD8  LATIN SMALL LETTER I WITH HOOK ABOVE */,
  0x1EC4 /* 0xD9  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE */,
  0x1EBE /* 0xDA  LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE */,
  0x1ED2 /* 0xDB  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE */,
  0x0129 /* 0xDC  LATIN SMALL LETTER I WITH TILDE */,
  0x00ED /* 0xDD  LATIN SMALL LETTER I WITH ACUTE */,
  0x1ECB /* 0xDE  LATIN SMALL LETTER I WITH DOT BELOW */,
  0x00F2 /* 0xDF  LATIN SMALL LETTER O WITH GRAVE */,
  0x1ED4 /* 0xE0  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE */,
  0x1ECF /* 0xE1  LATIN SMALL LETTER O WITH HOOK ABOVE */,
  0x00F5 /* 0xE2  LATIN SMALL LETTER O WITH TILDE */,
  0x00F3 /* 0xE3  LATIN SMALL LETTER O WITH ACUTE */,
  0x1ECD /* 0xE4  LATIN SMALL LETTER O WITH DOT BELOW */,
  0x1ED3 /* 0xE5  LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE */,
  0x1ED5 /* 0xE6  LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE */,
  0x1ED7 /* 0xE7  LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE */,
  0x1ED1 /* 0xE8  LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE */,
  0x1ED9 /* 0xE9  LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW */,
  0x1EDD /* 0xEA  LATIN SMALL LETTER O WITH HORN AND GRAVE */,
  0x1EDF /* 0xEB  LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE */,
  0x1EE1 /* 0xEC  LATIN SMALL LETTER O WITH HORN AND TILDE */,
  0x1EDB /* 0xED  LATIN SMALL LETTER O WITH HORN AND ACUTE */,
  0x1EE3 /* 0xEE  LATIN SMALL LETTER O WITH HORN AND DOT BELOW */,
  0x00F9 /* 0xEF  LATIN SMALL LETTER U WITH GRAVE */,
  0x1ED6 /* 0xF0  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE */,
  0x1EE7 /* 0xF1  LATIN SMALL LETTER U WITH HOOK ABOVE */,
  0x0169 /* 0xF2  LATIN SMALL LETTER U WITH TILDE */,
  0x00FA /* 0xF3  LATIN SMALL LETTER U WITH ACUTE */,
  0x1EE5 /* 0xF4  LATIN SMALL LETTER U WITH DOT BELOW */,
  0x1EEB /* 0xF5  LATIN SMALL LETTER U WITH HORN AND GRAVE */,
  0x1EED /* 0xF6  LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE */,
  0x1EEF /* 0xF7  LATIN SMALL LETTER U WITH HORN AND TILDE */,
  0x1EE9 /* 0xF8  LATIN SMALL LETTER U WITH HORN AND ACUTE */,
  0x1EF1 /* 0xF9  LATIN SMALL LETTER U WITH HORN AND DOT BELOW */,
  0x1EF3 /* 0xFA  LATIN SMALL LETTER Y WITH GRAVE */,
  0x1EF7 /* 0xFB  LATIN SMALL LETTER Y WITH HOOK ABOVE */,
  0x1EF9 /* 0xFC  LATIN SMALL LETTER Y WITH TILDE */,
  0x00FD /* 0xFD  LATIN SMALL LETTER Y WITH ACUTE */,
  0x1EF5 /* 0xFE  LATIN SMALL LETTER Y WITH DOT BELOW */,
  0x1ED0 /* 0xFF  LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE */
};
#endif

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
  Qlatin_viscii_lower,
  Qlatin_viscii_upper,
#endif
  Qchinese_big5_1,
  Qchinese_big5_2,
  Qcomposite;

Lisp_Object Ql2r, Qr2l;

Lisp_Object Vcharset_hash_table;

static Charset_ID next_allocated_1_byte_leading_byte;
static Charset_ID next_allocated_2_byte_leading_byte;

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
	      Emchar ucs_min, Emchar ucs_max, Emchar code_offset)
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
  CHARSET_DECODING_TABLE(cs) = decoding_table;
  CHARSET_UCS_MIN(cs) = ucs_min;
  CHARSET_UCS_MAX(cs) = ucs_max;
  CHARSET_CODE_OFFSET(cs) = code_offset;
#endif
  
  switch ( CHARSET_TYPE (cs) )
    {
    case CHARSET_TYPE_94:
      CHARSET_DIMENSION (cs) = 1;
      CHARSET_CHARS (cs) = 94;
#ifdef UTF2000
      if (!EQ (decoding_table, Qnil))
	{
	  size_t i;
	  CHARSET_TO_BYTE1_TABLE(cs) = make_byte_from_character_table();
	  for (i = 0; i < 94; i++)
	    {
	      Lisp_Object c = XVECTOR_DATA(decoding_table)[i];

	      if (!EQ (c, Qnil))
		put_byte_from_character_table (XCHAR (c), i + 33,
					       CHARSET_TO_BYTE1_TABLE(cs));
	    }
	}
      else
	CHARSET_TO_BYTE1_TABLE(cs) = NULL;
      CHARSET_TO_BYTE2_TABLE(cs) = NULL;
#endif
      break;
    case CHARSET_TYPE_96:
      CHARSET_DIMENSION (cs) = 1;
      CHARSET_CHARS (cs) = 96;
#ifdef UTF2000
      if (!EQ (decoding_table, Qnil))
	{
	  size_t i;
	  CHARSET_TO_BYTE1_TABLE(cs) = make_byte_from_character_table();
	  for (i = 0; i < 96; i++)
	    {
	      Lisp_Object c = XVECTOR_DATA(decoding_table)[i];

	      if (!EQ (c, Qnil))
		put_byte_from_character_table (XCHAR (c), i + 32,
					       CHARSET_TO_BYTE1_TABLE(cs));
	    }
	}
      else
	CHARSET_TO_BYTE1_TABLE(cs) = NULL;
      CHARSET_TO_BYTE2_TABLE(cs) = NULL;
#endif
      break;
    case CHARSET_TYPE_94X94:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 94;
#ifdef UTF2000
      CHARSET_TO_BYTE1_TABLE(cs) = NULL;
      CHARSET_TO_BYTE2_TABLE(cs) = NULL;
#endif
      break;
    case CHARSET_TYPE_96X96:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 96;
#ifdef UTF2000
      CHARSET_TO_BYTE1_TABLE(cs) = NULL;
      CHARSET_TO_BYTE2_TABLE(cs) = NULL;
#endif
      break;
#ifdef UTF2000
    case CHARSET_TYPE_128X128:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 128;
#ifdef UTF2000
      CHARSET_TO_BYTE1_TABLE(cs) = NULL;
      CHARSET_TO_BYTE2_TABLE(cs) = NULL;
#endif
      break;
    case CHARSET_TYPE_256X256:
      CHARSET_DIMENSION (cs) = 2;
      CHARSET_CHARS (cs) = 256;
#ifdef UTF2000
      CHARSET_TO_BYTE1_TABLE(cs) = NULL;
      CHARSET_TO_BYTE2_TABLE(cs) = NULL;
#endif
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
      assert (NILP (charset_by_attributes[type][final]));
      charset_by_attributes[type][final] = obj;
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

  if (!lb)
    signal_simple_error
      ("No more character sets free for this dimension",
       make_int (dimension));

  return lb;
}

#ifdef UTF2000
unsigned char
charset_get_byte1 (Lisp_Object charset, Emchar ch)
{
  Emchar_to_byte_table* table;
  int d;

  if ((table = XCHARSET_TO_BYTE1_TABLE (charset)) != NULL)
    return get_byte_from_character_table (ch, table);
  else if ((CHARSET_UCS_MIN (XCHARSET (charset)) <= ch)
	   && (ch <= CHARSET_UCS_MAX (XCHARSET (charset))))
    return ch - CHARSET_UCS_MIN (XCHARSET (charset))
      +  CHARSET_CODE_OFFSET (XCHARSET (charset));
  else if (XCHARSET_DIMENSION (charset) == 1)
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
	return 0;
    }
  else if (XCHARSET_DIMENSION (charset) == 2)
    {
      if (XCHARSET_CHARS (charset) == 94)
	{
	  if (((d = ch - (MIN_CHAR_94x94
			  + (XCHARSET_FINAL (charset) - '0') * 94 * 94)) >= 0)
	      && (d < 94 * 94))
	    return (d / 94) + 33;
	}
      else if (XCHARSET_CHARS (charset) == 96)
	{
	  if (((d = ch - (MIN_CHAR_96x96
			  + (XCHARSET_FINAL (charset) - '0') * 96 * 96)) >= 0)
	      && (d < 96 * 96))
	    return (d / 96) + 32;
	}
    }
  return 0;
}

unsigned char
charset_get_byte2 (Lisp_Object charset, Emchar ch)
{
  if (XCHARSET_DIMENSION (charset) == 1)
    return 0;
  else
    {
      Emchar_to_byte_table* table;

      if ((table = XCHARSET_TO_BYTE2_TABLE (charset)) != NULL)
	return get_byte_from_character_table (ch, table);
      else if (EQ (charset, Vcharset_ucs_bmp))
	return (ch >> 8) & 0xff;
      else if (XCHARSET_CHARS (charset) == 94)
	return (MIN_CHAR_94x94
		+ (XCHARSET_FINAL (charset) - '0') * 94 * 94 <= ch)
	  && (ch < MIN_CHAR_94x94
	      + (XCHARSET_FINAL (charset) - '0' + 1) * 94 * 94) ?
	  ((ch - MIN_CHAR_94x94) % 94) + 33 : 0;
      else /* if (XCHARSET_CHARS (charset) == 96) */
	return (MIN_CHAR_96x96
		+ (XCHARSET_FINAL (charset) - '0') * 96 * 96 <= ch)
	  && (ch < MIN_CHAR_96x96
	      + (XCHARSET_FINAL (charset) - '0' + 1) * 96 * 96) ?
	  ((ch - MIN_CHAR_96x96) % 96) + 32 : 0;
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
	  if (graphic < 0 || graphic > 1)
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

#ifdef UTF2000
  if (dimension == 1)
    {
      if (chars == 94)
	{
	  /* id = CHARSET_ID_OFFSET_94 + final; */
	  id = get_unallocated_leading_byte (dimension);
	}
      else if (chars == 96)
	{
	  id = get_unallocated_leading_byte (dimension);
	}
      else
	{
	  abort ();
	}
    }
  else if (dimension == 2)
    {
      if (chars == 94)
	{
	  id = get_unallocated_leading_byte (dimension);
	}
      else if (chars == 96)
	{
	  id = get_unallocated_leading_byte (dimension);
	}
      else
	{
	  abort ();
	}
    }
  else
    {
      abort ();
    }
#else
  id = get_unallocated_leading_byte (dimension);
#endif

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
			  Qnil, 0, 0, 0);
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
			      CHARSET_CODE_OFFSET(cs)
#else
			      Qnil, 0, 0, 0
#endif
);

  CHARSET_REVERSE_DIRECTION_CHARSET (cs) = new_charset;
  XCHARSET_REVERSE_DIRECTION_CHARSET (new_charset) = charset;

  return new_charset;
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
Set the 'registry property of CHARSET to REGISTRY.
*/
       (charset))
{
  return XCHARSET_DECODING_TABLE (Fget_charset (charset));
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
  DEFSUBR (Fcharset_mapping_table);
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
  defsymbol (&Qlatin_viscii_lower,	"vietnamese-viscii-lower");
  defsymbol (&Qlatin_viscii_upper,	"vietnamese-viscii-upper");
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

  next_allocated_1_byte_leading_byte = MIN_LEADING_BYTE_PRIVATE_1;
#ifdef UTF2000
  next_allocated_2_byte_leading_byte = LEADING_BYTE_CHINESE_BIG5_2 + 1;
#else
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
  Vutf_2000_version = build_string("0.8 (Kami)");
  DEFVAR_LISP ("utf-2000-version", &Vutf_2000_version /*
Version number of UTF-2000.
*/ );

  Vdefault_coded_charset_priority_list = Qnil;
  DEFVAR_LISP ("default-coded-charset-priority-list",
	       &Vdefault_coded_charset_priority_list /*
Default order of preferred coded-character-set.
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
  staticpro (&latin_jisx0201_to_ucs);
  latin_jisx0201_to_ucs = make_vector (94, Qnil);
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x21 - 33]
    = make_char (0x0021) /* EXCLAMATION MARK */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x22 - 33]
    = make_char (0x0022) /* QUOTATION MARK */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x23 - 33]
    = make_char (0x0023) /* NUMBER SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x24 - 33]
    = make_char (0x0024) /* DOLLAR SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x25 - 33]
    = make_char (0x0025) /* PERCENT SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x26 - 33]
    = make_char (0x0026) /* AMPERSAND */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x27 - 33]
    = make_char (0x0027) /* APOSTROPHE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x28 - 33]
    = make_char (0x0028) /* LEFT PARENTHESIS */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x29 - 33]
    = make_char (0x0029) /* RIGHT PARENTHESIS */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x2A - 33]
    = make_char (0x002A) /* ASTERISK */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x2B - 33]
    = make_char (0x002B) /* PLUS SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x2C - 33]
    = make_char (0x002C) /* COMMA */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x2D - 33]
    = make_char (0x002D) /* HYPHEN-MINUS */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x2E - 33]
    = make_char (0x002E) /* FULL STOP */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x2F - 33]
    = make_char (0x002F) /* SOLIDUS */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x30 - 33]
    = make_char (0x0030) /* DIGIT ZERO */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x31 - 33]
    = make_char (0x0031) /* DIGIT ONE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x32 - 33]
    = make_char (0x0032) /* DIGIT TWO */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x33 - 33]
    = make_char (0x0033) /* DIGIT THREE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x34 - 33]
    = make_char (0x0034) /* DIGIT FOUR */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x35 - 33]
    = make_char (0x0035) /* DIGIT FIVE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x36 - 33]
    = make_char (0x0036) /* DIGIT SIX */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x37 - 33]
    = make_char (0x0037) /* DIGIT SEVEN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x38 - 33]
    = make_char (0x0038) /* DIGIT EIGHT */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x39 - 33]
    = make_char (0x0039) /* DIGIT NINE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x3A - 33]
    = make_char (0x003A) /* COLON */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x3B - 33]
    = make_char (0x003B) /* SEMICOLON */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x3C - 33]
    = make_char (0x003C) /* LESS-THAN SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x3D - 33]
    = make_char (0x003D) /* EQUALS SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x3E - 33]
    = make_char (0x003E) /* GREATER-THAN SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x3F - 33]
    = make_char (0x003F) /* QUESTION MARK */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x40 - 33]
    = make_char (0x0040) /* COMMERCIAL AT */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x41 - 33]
    = make_char (0x0041) /* LATIN CAPITAL LETTER A */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x42 - 33]
    = make_char (0x0042) /* LATIN CAPITAL LETTER B */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x43 - 33]
    = make_char (0x0043) /* LATIN CAPITAL LETTER C */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x44 - 33]
    = make_char (0x0044) /* LATIN CAPITAL LETTER D */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x45 - 33]
    = make_char (0x0045) /* LATIN CAPITAL LETTER E */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x46 - 33]
    = make_char (0x0046) /* LATIN CAPITAL LETTER F */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x47 - 33]
    = make_char (0x0047) /* LATIN CAPITAL LETTER G */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x48 - 33]
    = make_char (0x0048) /* LATIN CAPITAL LETTER H */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x49 - 33]
    = make_char (0x0049) /* LATIN CAPITAL LETTER I */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x4A - 33]
    = make_char (0x004A) /* LATIN CAPITAL LETTER J */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x4B - 33]
    = make_char (0x004B) /* LATIN CAPITAL LETTER K */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x4C - 33]
    = make_char (0x004C) /* LATIN CAPITAL LETTER L */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x4D - 33]
    = make_char (0x004D) /* LATIN CAPITAL LETTER M */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x4E - 33]
    = make_char (0x004E) /* LATIN CAPITAL LETTER N */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x4F - 33]
    = make_char (0x004F) /* LATIN CAPITAL LETTER O */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x50 - 33]
    = make_char (0x0050) /* LATIN CAPITAL LETTER P */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x51 - 33]
    = make_char (0x0051) /* LATIN CAPITAL LETTER Q */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x52 - 33]
    = make_char (0x0052) /* LATIN CAPITAL LETTER R */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x53 - 33]
    = make_char (0x0053) /* LATIN CAPITAL LETTER S */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x54 - 33]
    = make_char (0x0054) /* LATIN CAPITAL LETTER T */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x55 - 33]
    = make_char (0x0055) /* LATIN CAPITAL LETTER U */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x56 - 33]
    = make_char (0x0056) /* LATIN CAPITAL LETTER V */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x57 - 33]
    = make_char (0x0057) /* LATIN CAPITAL LETTER W */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x58 - 33]
    = make_char (0x0058) /* LATIN CAPITAL LETTER X */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x59 - 33]
    = make_char (0x0059) /* LATIN CAPITAL LETTER Y */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x5A - 33]
    = make_char (0x005A) /* LATIN CAPITAL LETTER Z */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x5B - 33]
    = make_char (0x005B) /* LEFT SQUARE BRACKET */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x5C - 33]
    = make_char (0x00A5) /* YEN SIGN */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x5D - 33]
    = make_char (0x005D) /* RIGHT SQUARE BRACKET */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x5E - 33]
    = make_char (0x005E) /* CIRCUMFLEX ACCENT */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x5F - 33]
    = make_char (0x005F) /* LOW LINE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x60 - 33]
    = make_char (0x0060) /* GRAVE ACCENT */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x61 - 33]
    = make_char (0x0061) /* LATIN SMALL LETTER A */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x62 - 33]
    = make_char (0x0062) /* LATIN SMALL LETTER B */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x63 - 33]
    = make_char (0x0063) /* LATIN SMALL LETTER C */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x64 - 33]
    = make_char (0x0064) /* LATIN SMALL LETTER D */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x65 - 33]
    = make_char (0x0065) /* LATIN SMALL LETTER E */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x66 - 33]
    = make_char (0x0066) /* LATIN SMALL LETTER F */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x67 - 33]
    = make_char (0x0067) /* LATIN SMALL LETTER G */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x68 - 33]
    = make_char (0x0068) /* LATIN SMALL LETTER H */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x69 - 33]
    = make_char (0x0069) /* LATIN SMALL LETTER I */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x6A - 33]
    = make_char (0x006A) /* LATIN SMALL LETTER J */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x6B - 33]
    = make_char (0x006B) /* LATIN SMALL LETTER K */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x6C - 33]
    = make_char (0x006C) /* LATIN SMALL LETTER L */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x6D - 33]
    = make_char (0x006D) /* LATIN SMALL LETTER M */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x6E - 33]
    = make_char (0x006E) /* LATIN SMALL LETTER N */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x6F - 33]
    = make_char (0x006F) /* LATIN SMALL LETTER O */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x70 - 33]
    = make_char (0x0070) /* LATIN SMALL LETTER P */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x71 - 33]
    = make_char (0x0071) /* LATIN SMALL LETTER Q */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x72 - 33]
    = make_char (0x0072) /* LATIN SMALL LETTER R */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x73 - 33]
    = make_char (0x0073) /* LATIN SMALL LETTER S */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x74 - 33]
    = make_char (0x0074) /* LATIN SMALL LETTER T */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x75 - 33]
    = make_char (0x0075) /* LATIN SMALL LETTER U */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x76 - 33]
    = make_char (0x0076) /* LATIN SMALL LETTER V */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x77 - 33]
    = make_char (0x0077) /* LATIN SMALL LETTER W */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x78 - 33]
    = make_char (0x0078) /* LATIN SMALL LETTER X */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x79 - 33]
    = make_char (0x0079) /* LATIN SMALL LETTER Y */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x7A - 33]
    = make_char (0x007A) /* LATIN SMALL LETTER Z */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x7B - 33]
    = make_char (0x007B) /* LEFT CURLY BRACKET */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x7C - 33]
    = make_char (0x007C) /* VERTICAL LINE */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x7D - 33]
    = make_char (0x007D) /* RIGHT CURLY BRACKET */;
  XVECTOR_DATA(latin_jisx0201_to_ucs)[0x7E - 33]
    = make_char (0x203E) /* OVERLINE */;
  
  staticpro (&latin_iso8859_2_to_ucs);
  latin_iso8859_2_to_ucs = make_vector (96, Qnil);
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA0 - 0xA0]
    = make_char (0x00A0) /* NO-BREAK SPACE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA1 - 0xA0]
    = make_char (0x0104) /* LATIN CAPITAL LETTER A WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA2 - 0xA0]
    = make_char (0x02D8) /* BREVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA3 - 0xA0]
    = make_char (0x0141) /* LATIN CAPITAL LETTER L WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA4 - 0xA0]
    = make_char (0x00A4) /* CURRENCY SIGN */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA5 - 0xA0]
    = make_char (0x013D) /* LATIN CAPITAL LETTER L WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA6 - 0xA0]
    = make_char (0x015A) /* LATIN CAPITAL LETTER S WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA7 - 0xA0]
    = make_char (0x00A7) /* SECTION SIGN */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA8 - 0xA0]
    = make_char (0x00A8) /* DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xA9 - 0xA0]
    = make_char (0x0160) /* LATIN CAPITAL LETTER S WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xAA - 0xA0]
    = make_char (0x015E) /* LATIN CAPITAL LETTER S WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xAB - 0xA0]
    = make_char (0x0164) /* LATIN CAPITAL LETTER T WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xAC - 0xA0]
    = make_char (0x0179) /* LATIN CAPITAL LETTER Z WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xAD - 0xA0]
    = make_char (0x00AD) /* SOFT HYPHEN */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xAE - 0xA0]
    = make_char (0x017D) /* LATIN CAPITAL LETTER Z WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xAF - 0xA0]
    = make_char (0x017B) /* LATIN CAPITAL LETTER Z WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB0 - 0xA0]
    = make_char (0x00B0) /* DEGREE SIGN */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB1 - 0xA0]
    = make_char (0x0105) /* LATIN SMALL LETTER A WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB2 - 0xA0]
    = make_char (0x02DB) /* OGONEK */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB3 - 0xA0]
    = make_char (0x0142) /* LATIN SMALL LETTER L WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB4 - 0xA0]
    = make_char (0x00B4) /* ACUTE ACCENT */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB5 - 0xA0]
    = make_char (0x013E) /* LATIN SMALL LETTER L WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB6 - 0xA0]
    = make_char (0x015B) /* LATIN SMALL LETTER S WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB7 - 0xA0]
    = make_char (0x02C7) /* CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB8 - 0xA0]
    = make_char (0x00B8) /* CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xB9 - 0xA0]
    = make_char (0x0161) /* LATIN SMALL LETTER S WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xBA - 0xA0]
    = make_char (0x015F) /* LATIN SMALL LETTER S WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xBB - 0xA0]
    = make_char (0x0165) /* LATIN SMALL LETTER T WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xBC - 0xA0]
    = make_char (0x017A) /* LATIN SMALL LETTER Z WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xBD - 0xA0]
    = make_char (0x02DD) /* DOUBLE ACUTE ACCENT */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xBE - 0xA0]
    = make_char (0x017E) /* LATIN SMALL LETTER Z WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xBF - 0xA0]
    = make_char (0x017C) /* LATIN SMALL LETTER Z WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC0 - 0xA0]
    = make_char (0x0154) /* LATIN CAPITAL LETTER R WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC1 - 0xA0]
    = make_char (0x00C1) /* LATIN CAPITAL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC2 - 0xA0]
    = make_char (0x00C2) /* LATIN CAPITAL LETTER A WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC3 - 0xA0]
    = make_char (0x0102) /* LATIN CAPITAL LETTER A WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC4 - 0xA0]
    = make_char (0x00C4) /* LATIN CAPITAL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC5 - 0xA0]
    = make_char (0x0139) /* LATIN CAPITAL LETTER L WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC6 - 0xA0]
    = make_char (0x0106) /* LATIN CAPITAL LETTER C WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC7 - 0xA0]
    = make_char (0x00C7) /* LATIN CAPITAL LETTER C WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC8 - 0xA0]
    = make_char (0x010C) /* LATIN CAPITAL LETTER C WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xC9 - 0xA0]
    = make_char (0x00C9) /* LATIN CAPITAL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xCA - 0xA0]
    = make_char (0x0118) /* LATIN CAPITAL LETTER E WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xCB - 0xA0]
    = make_char (0x00CB) /* LATIN CAPITAL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xCC - 0xA0]
    = make_char (0x011A) /* LATIN CAPITAL LETTER E WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xCD - 0xA0]
    = make_char (0x00CD) /* LATIN CAPITAL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xCE - 0xA0]
    = make_char (0x00CE) /* LATIN CAPITAL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xCF - 0xA0]
    = make_char (0x010E) /* LATIN CAPITAL LETTER D WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD0 - 0xA0]
    = make_char (0x0110) /* LATIN CAPITAL LETTER D WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD1 - 0xA0]
    = make_char (0x0143) /* LATIN CAPITAL LETTER N WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD2 - 0xA0]
    = make_char (0x0147) /* LATIN CAPITAL LETTER N WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD3 - 0xA0]
    = make_char (0x00D3) /* LATIN CAPITAL LETTER O WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD4 - 0xA0]
    = make_char (0x00D4) /* LATIN CAPITAL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD5 - 0xA0]
    = make_char (0x0150) /* LATIN CAPITAL LETTER O WITH DOUBLE ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD6 - 0xA0]
    = make_char (0x00D6) /* LATIN CAPITAL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD7 - 0xA0]
    = make_char (0x00D7) /* MULTIPLICATION SIGN */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD8 - 0xA0]
    = make_char (0x0158) /* LATIN CAPITAL LETTER R WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xD9 - 0xA0]
    = make_char (0x016E) /* LATIN CAPITAL LETTER U WITH RING ABOVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xDA - 0xA0]
    = make_char (0x00DA) /* LATIN CAPITAL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xDB - 0xA0]
    = make_char (0x0170) /* LATIN CAPITAL LETTER U WITH DOUBLE ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xDC - 0xA0]
    = make_char (0x00DC) /* LATIN CAPITAL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xDD - 0xA0]
    = make_char (0x00DD) /* LATIN CAPITAL LETTER Y WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xDE - 0xA0]
    = make_char (0x0162) /* LATIN CAPITAL LETTER T WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xDF - 0xA0]
    = make_char (0x00DF) /* LATIN SMALL LETTER SHARP S */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE0 - 0xA0]
    = make_char (0x0155) /* LATIN SMALL LETTER R WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE1 - 0xA0]
    = make_char (0x00E1) /* LATIN SMALL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE2 - 0xA0]
    = make_char (0x00E2) /* LATIN SMALL LETTER A WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE3 - 0xA0]
    = make_char (0x0103) /* LATIN SMALL LETTER A WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE4 - 0xA0]
    = make_char (0x00E4) /* LATIN SMALL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE5 - 0xA0]
    = make_char (0x013A) /* LATIN SMALL LETTER L WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE6 - 0xA0]
    = make_char (0x0107) /* LATIN SMALL LETTER C WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE7 - 0xA0]
    = make_char (0x00E7) /* LATIN SMALL LETTER C WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE8 - 0xA0]
    = make_char (0x010D) /* LATIN SMALL LETTER C WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xE9 - 0xA0]
    = make_char (0x00E9) /* LATIN SMALL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xEA - 0xA0]
    = make_char (0x0119) /* LATIN SMALL LETTER E WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xEB - 0xA0]
    = make_char (0x00EB) /* LATIN SMALL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xEC - 0xA0]
    = make_char (0x011B) /* LATIN SMALL LETTER E WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xED - 0xA0]
    = make_char (0x00ED) /* LATIN SMALL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xEE - 0xA0]
    = make_char (0x00EE) /* LATIN SMALL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xEF - 0xA0]
    = make_char (0x010F) /* LATIN SMALL LETTER D WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF0 - 0xA0]
    = make_char (0x0111) /* LATIN SMALL LETTER D WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF1 - 0xA0]
    = make_char (0x0144) /* LATIN SMALL LETTER N WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF2 - 0xA0]
    = make_char (0x0148) /* LATIN SMALL LETTER N WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF3 - 0xA0]
    = make_char (0x00F3) /* LATIN SMALL LETTER O WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF4 - 0xA0]
    = make_char (0x00F4) /* LATIN SMALL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF5 - 0xA0]
    = make_char (0x0151) /* LATIN SMALL LETTER O WITH DOUBLE ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF6 - 0xA0]
    = make_char (0x00F6) /* LATIN SMALL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF7 - 0xA0]
    = make_char (0x00F7) /* DIVISION SIGN */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF8 - 0xA0]
    = make_char (0x0159) /* LATIN SMALL LETTER R WITH CARON */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xF9 - 0xA0]
    = make_char (0x016F) /* LATIN SMALL LETTER U WITH RING ABOVE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xFA - 0xA0]
    = make_char (0x00FA) /* LATIN SMALL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xFB - 0xA0]
    = make_char (0x0171) /* LATIN SMALL LETTER U WITH DOUBLE ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xFC - 0xA0]
    = make_char (0x00FC) /* LATIN SMALL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xFD - 0xA0]
    = make_char (0x00FD) /* LATIN SMALL LETTER Y WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xFE - 0xA0]
    = make_char (0x0163) /* LATIN SMALL LETTER T WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_2_to_ucs)[0xFF - 0xA0]
    = make_char (0x02D9) /* DOT ABOVE */;
  
  staticpro (&latin_iso8859_3_to_ucs);
  latin_iso8859_3_to_ucs = make_vector (96, Qnil);
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA0 - 0xA0]
    = make_char (0x00A0) /* NO-BREAK SPACE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA1 - 0xA0]
    = make_char (0x0126) /* LATIN CAPITAL LETTER H WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA2 - 0xA0]
    = make_char (0x02D8) /* BREVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA3 - 0xA0]
    = make_char (0x00A3) /* POUND SIGN */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA4 - 0xA0]
    = make_char (0x00A4) /* CURRENCY SIGN */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA5 - 0xA0]
     = make_char (CHAR96('C', 0xA5));  */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA6 - 0xA0]
    = make_char (0x0124) /* LATIN CAPITAL LETTER H WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA7 - 0xA0]
    = make_char (0x00A7) /* SECTION SIGN */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA8 - 0xA0]
    = make_char (0x00A8) /* DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xA9 - 0xA0]
    = make_char (0x0130) /* LATIN CAPITAL LETTER I WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xAA - 0xA0]
    = make_char (0x015E) /* LATIN CAPITAL LETTER S WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xAB - 0xA0]
    = make_char (0x011E) /* LATIN CAPITAL LETTER G WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xAC - 0xA0]
    = make_char (0x0134) /* LATIN CAPITAL LETTER J WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xAD - 0xA0]
    = make_char (0x00AD) /* SOFT HYPHEN */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xAE - 0xA0]
     = make_char (CHAR96('C', 0xAE)); */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xAF - 0xA0]
    = make_char (0x017B) /* LATIN CAPITAL LETTER Z WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB0 - 0xA0]
    = make_char (0x00B0) /* DEGREE SIGN */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB1 - 0xA0]
    = make_char (0x0127) /* LATIN SMALL LETTER H WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB2 - 0xA0]
    = make_char (0x00B2) /* SUPERSCRIPT TWO */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB3 - 0xA0]
    = make_char (0x00B3) /* SUPERSCRIPT THREE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB4 - 0xA0]
    = make_char (0x00B4) /* ACUTE ACCENT */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB5 - 0xA0]
    = make_char (0x00B5) /* MICRO SIGN */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB6 - 0xA0]
    = make_char (0x0125) /* LATIN SMALL LETTER H WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB7 - 0xA0]
    = make_char (0x00B7) /* MIDDLE DOT */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB8 - 0xA0]
    = make_char (0x00B8) /* CEDILLA */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xB9 - 0xA0]
    = make_char (0x0131) /* LATIN SMALL LETTER DOTLESS I */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xBA - 0xA0]
    = make_char (0x015F) /* LATIN SMALL LETTER S WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xBB - 0xA0]
    = make_char (0x011F) /* LATIN SMALL LETTER G WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xBC - 0xA0]
    = make_char (0x0135) /* LATIN SMALL LETTER J WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xBD - 0xA0]
    = make_char (0x00BD) /* VULGAR FRACTION ONE HALF */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xBE - 0xA0]
     = make_char (CHAR96('C', 0xBE)); */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xBF - 0xA0]
    = make_char (0x017C) /* LATIN SMALL LETTER Z WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC0 - 0xA0]
    = make_char (0x00C0) /* LATIN CAPITAL LETTER A WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC1 - 0xA0]
    = make_char (0x00C1) /* LATIN CAPITAL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC2 - 0xA0]
    = make_char (0x00C2) /* LATIN CAPITAL LETTER A WITH CIRCUMFLEX */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC3 - 0xA0]
     = make_char (CHAR96('C', 0xC3)); */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC4 - 0xA0]
    = make_char (0x00C4) /* LATIN CAPITAL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC5 - 0xA0]
    = make_char (0x010A) /* LATIN CAPITAL LETTER C WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC6 - 0xA0]
    = make_char (0x0108) /* LATIN CAPITAL LETTER C WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC7 - 0xA0]
    = make_char (0x00C7) /* LATIN CAPITAL LETTER C WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC8 - 0xA0]
    = make_char (0x00C8) /* LATIN CAPITAL LETTER E WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xC9 - 0xA0]
    = make_char (0x00C9) /* LATIN CAPITAL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xCA - 0xA0]
    = make_char (0x00CA) /* LATIN CAPITAL LETTER E WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xCB - 0xA0]
    = make_char (0x00CB) /* LATIN CAPITAL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xCC - 0xA0]
    = make_char (0x00CC) /* LATIN CAPITAL LETTER I WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xCD - 0xA0]
    = make_char (0x00CD) /* LATIN CAPITAL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xCE - 0xA0]
    = make_char (0x00CE) /* LATIN CAPITAL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xCF - 0xA0]
    = make_char (0x00CF) /* LATIN CAPITAL LETTER I WITH DIAERESIS */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD0 - 0xA0]
     = make_char (CHAR96('C', 0xD0)); */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD1 - 0xA0]
    = make_char (0x00D1) /* LATIN CAPITAL LETTER N WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD2 - 0xA0]
    = make_char (0x00D2) /* LATIN CAPITAL LETTER O WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD3 - 0xA0]
    = make_char (0x00D3) /* LATIN CAPITAL LETTER O WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD4 - 0xA0]
    = make_char (0x00D4) /* LATIN CAPITAL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD5 - 0xA0]
    = make_char (0x0120) /* LATIN CAPITAL LETTER G WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD6 - 0xA0]
    = make_char (0x00D6) /* LATIN CAPITAL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD7 - 0xA0]
    = make_char (0x00D7) /* MULTIPLICATION SIGN */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD8 - 0xA0]
    = make_char (0x011C) /* LATIN CAPITAL LETTER G WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xD9 - 0xA0]
    = make_char (0x00D9) /* LATIN CAPITAL LETTER U WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xDA - 0xA0]
    = make_char (0x00DA) /* LATIN CAPITAL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xDB - 0xA0]
    = make_char (0x00DB) /* LATIN CAPITAL LETTER U WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xDC - 0xA0]
    = make_char (0x00DC) /* LATIN CAPITAL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xDD - 0xA0]
    = make_char (0x016C) /* LATIN CAPITAL LETTER U WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xDE - 0xA0]
    = make_char (0x015C) /* LATIN CAPITAL LETTER S WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xDF - 0xA0]
    = make_char (0x00DF) /* LATIN SMALL LETTER SHARP S */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE0 - 0xA0]
    = make_char (0x00E0) /* LATIN SMALL LETTER A WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE1 - 0xA0]
    = make_char (0x00E1) /* LATIN SMALL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE2 - 0xA0]
    = make_char (0x00E2) /* LATIN SMALL LETTER A WITH CIRCUMFLEX */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE3 - 0xA0]
     = make_char (CHAR96('C', 0xE3)); */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE4 - 0xA0]
    = make_char (0x00E4) /* LATIN SMALL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE5 - 0xA0]
    = make_char (0x010B) /* LATIN SMALL LETTER C WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE6 - 0xA0]
    = make_char (0x0109) /* LATIN SMALL LETTER C WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE7 - 0xA0]
    = make_char (0x00E7) /* LATIN SMALL LETTER C WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE8 - 0xA0]
    = make_char (0x00E8) /* LATIN SMALL LETTER E WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xE9 - 0xA0]
    = make_char (0x00E9) /* LATIN SMALL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xEA - 0xA0]
    = make_char (0x00EA) /* LATIN SMALL LETTER E WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xEB - 0xA0]
    = make_char (0x00EB) /* LATIN SMALL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xEC - 0xA0]
    = make_char (0x00EC) /* LATIN SMALL LETTER I WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xED - 0xA0]
    = make_char (0x00ED) /* LATIN SMALL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xEE - 0xA0]
    = make_char (0x00EE) /* LATIN SMALL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xEF - 0xA0]
    = make_char (0x00EF) /* LATIN SMALL LETTER I WITH DIAERESIS */;
  /* XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF0 - 0xA0]
     = make_char (CHAR96('C', 0xF0)); */
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF1 - 0xA0]
    = make_char (0x00F1) /* LATIN SMALL LETTER N WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF2 - 0xA0]
    = make_char (0x00F2) /* LATIN SMALL LETTER O WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF3 - 0xA0]
    = make_char (0x00F3) /* LATIN SMALL LETTER O WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF4 - 0xA0]
    = make_char (0x00F4) /* LATIN SMALL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF5 - 0xA0]
    = make_char (0x0121) /* LATIN SMALL LETTER G WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF6 - 0xA0]
    = make_char (0x00F6) /* LATIN SMALL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF7 - 0xA0]
    = make_char (0x00F7) /* DIVISION SIGN */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF8 - 0xA0]
    = make_char (0x011D) /* LATIN SMALL LETTER G WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xF9 - 0xA0]
    = make_char (0x00F9) /* LATIN SMALL LETTER U WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xFA - 0xA0]
    = make_char (0x00FA) /* LATIN SMALL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xFB - 0xA0]
    = make_char (0x00FB) /* LATIN SMALL LETTER U WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xFC - 0xA0]
    = make_char (0x00FC) /* LATIN SMALL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xFD - 0xA0]
    = make_char (0x016D) /* LATIN SMALL LETTER U WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xFE - 0xA0]
    = make_char (0x015D) /* LATIN SMALL LETTER S WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_3_to_ucs)[0xFF - 0xA0]
    = make_char (0x02D9) /* DOT ABOVE */;
  
  staticpro (&latin_iso8859_4_to_ucs);
  latin_iso8859_4_to_ucs = make_vector (96, Qnil);
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA0 - 0xA0]
    = make_char (0x00A0) /* NO-BREAK SPACE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA1 - 0xA0]
    = make_char (0x0104) /* LATIN CAPITAL LETTER A WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA2 - 0xA0]
    = make_char (0x0138) /* LATIN SMALL LETTER KRA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA3 - 0xA0]
    = make_char (0x0156) /* LATIN CAPITAL LETTER R WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA4 - 0xA0]
    = make_char (0x00A4) /* CURRENCY SIGN */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA5 - 0xA0]
    = make_char (0x0128) /* LATIN CAPITAL LETTER I WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA6 - 0xA0]
    = make_char (0x013B) /* LATIN CAPITAL LETTER L WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA7 - 0xA0]
    = make_char (0x00A7) /* SECTION SIGN */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA8 - 0xA0]
    = make_char (0x00A8) /* DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xA9 - 0xA0]
    = make_char (0x0160) /* LATIN CAPITAL LETTER S WITH CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xAA - 0xA0]
    = make_char (0x0112) /* LATIN CAPITAL LETTER E WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xAB - 0xA0]
    = make_char (0x0122) /* LATIN CAPITAL LETTER G WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xAC - 0xA0]
    = make_char (0x0166) /* LATIN CAPITAL LETTER T WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xAD - 0xA0]
    = make_char (0x00AD) /* SOFT HYPHEN */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xAE - 0xA0]
    = make_char (0x017D) /* LATIN CAPITAL LETTER Z WITH CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xAF - 0xA0]
    = make_char (0x00AF) /* MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB0 - 0xA0]
    = make_char (0x00B0) /* DEGREE SIGN */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB1 - 0xA0]
    = make_char (0x0105) /* LATIN SMALL LETTER A WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB2 - 0xA0]
    = make_char (0x02DB) /* OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB3 - 0xA0]
    = make_char (0x0157) /* LATIN SMALL LETTER R WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB4 - 0xA0]
    = make_char (0x00B4) /* ACUTE ACCENT */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB5 - 0xA0]
    = make_char (0x0129) /* LATIN SMALL LETTER I WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB6 - 0xA0]
    = make_char (0x013C) /* LATIN SMALL LETTER L WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB7 - 0xA0]
    = make_char (0x02C7) /* CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB8 - 0xA0]
    = make_char (0x00B8) /* CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xB9 - 0xA0]
    = make_char (0x0161) /* LATIN SMALL LETTER S WITH CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xBA - 0xA0]
    = make_char (0x0113) /* LATIN SMALL LETTER E WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xBB - 0xA0]
    = make_char (0x0123) /* LATIN SMALL LETTER G WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xBC - 0xA0]
    = make_char (0x0167) /* LATIN SMALL LETTER T WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xBD - 0xA0]
    = make_char (0x014A) /* LATIN CAPITAL LETTER ENG */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xBE - 0xA0]
    = make_char (0x017E) /* LATIN SMALL LETTER Z WITH CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xBF - 0xA0]
    = make_char (0x014B) /* LATIN SMALL LETTER ENG */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC0 - 0xA0]
    = make_char (0x0100) /* LATIN CAPITAL LETTER A WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC1 - 0xA0]
    = make_char (0x00C1) /* LATIN CAPITAL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC2 - 0xA0]
    = make_char (0x00C2) /* LATIN CAPITAL LETTER A WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC3 - 0xA0]
    = make_char (0x00C3) /* LATIN CAPITAL LETTER A WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC4 - 0xA0]
    = make_char (0x00C4) /* LATIN CAPITAL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC5 - 0xA0]
    = make_char (0x00C5) /* LATIN CAPITAL LETTER A WITH RING ABOVE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC6 - 0xA0]
    = make_char (0x00C6) /* LATIN CAPITAL LETTER AE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC7 - 0xA0]
    = make_char (0x012E) /* LATIN CAPITAL LETTER I WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC8 - 0xA0]
    = make_char (0x010C) /* LATIN CAPITAL LETTER C WITH CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xC9 - 0xA0]
    = make_char (0x00C9) /* LATIN CAPITAL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xCA - 0xA0]
    = make_char (0x0118) /* LATIN CAPITAL LETTER E WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xCB - 0xA0]
    = make_char (0x00CB) /* LATIN CAPITAL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xCC - 0xA0]
    = make_char (0x0116) /* LATIN CAPITAL LETTER E WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xCD - 0xA0]
    = make_char (0x00CD) /* LATIN CAPITAL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xCE - 0xA0]
    = make_char (0x00CE) /* LATIN CAPITAL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xCF - 0xA0]
    = make_char (0x012A) /* LATIN CAPITAL LETTER I WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD0 - 0xA0]
    = make_char (0x0110) /* LATIN CAPITAL LETTER D WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD1 - 0xA0]
    = make_char (0x0145) /* LATIN CAPITAL LETTER N WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD2 - 0xA0]
    = make_char (0x014C) /* LATIN CAPITAL LETTER O WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD3 - 0xA0]
    = make_char (0x0136) /* LATIN CAPITAL LETTER K WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD4 - 0xA0]
    = make_char (0x00D4) /* LATIN CAPITAL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD5 - 0xA0]
    = make_char (0x00D5) /* LATIN CAPITAL LETTER O WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD6 - 0xA0]
    = make_char (0x00D6) /* LATIN CAPITAL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD7 - 0xA0]
    = make_char (0x00D7) /* MULTIPLICATION SIGN */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD8 - 0xA0]
    = make_char (0x00D8) /* LATIN CAPITAL LETTER O WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xD9 - 0xA0]
    = make_char (0x0172) /* LATIN CAPITAL LETTER U WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xDA - 0xA0]
    = make_char (0x00DA) /* LATIN CAPITAL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xDB - 0xA0]
    = make_char (0x00DB) /* LATIN CAPITAL LETTER U WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xDC - 0xA0]
    = make_char (0x00DC) /* LATIN CAPITAL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xDD - 0xA0]
    = make_char (0x0168) /* LATIN CAPITAL LETTER U WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xDE - 0xA0]
    = make_char (0x016A) /* LATIN CAPITAL LETTER U WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xDF - 0xA0]
    = make_char (0x00DF) /* LATIN SMALL LETTER SHARP S */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE0 - 0xA0]
    = make_char (0x0101) /* LATIN SMALL LETTER A WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE1 - 0xA0]
    = make_char (0x00E1) /* LATIN SMALL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE2 - 0xA0]
    = make_char (0x00E2) /* LATIN SMALL LETTER A WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE3 - 0xA0]
    = make_char (0x00E3) /* LATIN SMALL LETTER A WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE4 - 0xA0]
    = make_char (0x00E4) /* LATIN SMALL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE5 - 0xA0]
    = make_char (0x00E5) /* LATIN SMALL LETTER A WITH RING ABOVE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE6 - 0xA0]
    = make_char (0x00E6) /* LATIN SMALL LETTER AE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE7 - 0xA0]
    = make_char (0x012F) /* LATIN SMALL LETTER I WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE8 - 0xA0]
    = make_char (0x010D) /* LATIN SMALL LETTER C WITH CARON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xE9 - 0xA0]
    = make_char (0x00E9) /* LATIN SMALL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xEA - 0xA0]
    = make_char (0x0119) /* LATIN SMALL LETTER E WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xEB - 0xA0]
    = make_char (0x00EB) /* LATIN SMALL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xEC - 0xA0]
    = make_char (0x0117) /* LATIN SMALL LETTER E WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xED - 0xA0]
    = make_char (0x00ED) /* LATIN SMALL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xEE - 0xA0]
    = make_char (0x00EE) /* LATIN SMALL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xEF - 0xA0]
    = make_char (0x012B) /* LATIN SMALL LETTER I WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF0 - 0xA0]
    = make_char (0x0111) /* LATIN SMALL LETTER D WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF1 - 0xA0]
    = make_char (0x0146) /* LATIN SMALL LETTER N WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF2 - 0xA0]
    = make_char (0x014D) /* LATIN SMALL LETTER O WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF3 - 0xA0]
    = make_char (0x0137) /* LATIN SMALL LETTER K WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF4 - 0xA0]
    = make_char (0x00F4) /* LATIN SMALL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF5 - 0xA0]
    = make_char (0x00F5) /* LATIN SMALL LETTER O WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF6 - 0xA0]
    = make_char (0x00F6) /* LATIN SMALL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF7 - 0xA0]
    = make_char (0x00F7) /* DIVISION SIGN */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF8 - 0xA0]
    = make_char (0x00F8) /* LATIN SMALL LETTER O WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xF9 - 0xA0]
    = make_char (0x0173) /* LATIN SMALL LETTER U WITH OGONEK */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xFA - 0xA0]
    = make_char (0x00FA) /* LATIN SMALL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xFB - 0xA0]
    = make_char (0x00FB) /* LATIN SMALL LETTER U WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xFC - 0xA0]
    = make_char (0x00FC) /* LATIN SMALL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xFD - 0xA0]
    = make_char (0x0169) /* LATIN SMALL LETTER U WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xFE - 0xA0]
    = make_char (0x016B) /* LATIN SMALL LETTER U WITH MACRON */;
  XVECTOR_DATA(latin_iso8859_4_to_ucs)[0xFF - 0xA0]
    = make_char (0x02D9) /* DOT ABOVE */;
  
  staticpro (&latin_iso8859_9_to_ucs);
  latin_iso8859_9_to_ucs = make_vector (96, Qnil);
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA0 - 0xA0]
    = make_char (0x00A0) /* NO-BREAK SPACE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA1 - 0xA0]
    = make_char (0x00A1) /* INVERTED EXCLAMATION MARK */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA2 - 0xA0]
    = make_char (0x00A2) /* CENT SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA3 - 0xA0]
    = make_char (0x00A3) /* POUND SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA4 - 0xA0]
    = make_char (0x00A4) /* CURRENCY SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA5 - 0xA0]
    = make_char (0x00A5) /* YEN SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA6 - 0xA0]
    = make_char (0x00A6) /* BROKEN BAR */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA7 - 0xA0]
    = make_char (0x00A7) /* SECTION SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA8 - 0xA0]
    = make_char (0x00A8) /* DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xA9 - 0xA0]
    = make_char (0x00A9) /* COPYRIGHT SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xAA - 0xA0]
    = make_char (0x00AA) /* FEMININE ORDINAL INDICATOR */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xAB - 0xA0]
    = make_char (0x00AB) /* LEFT-POINTING DOUBLE ANGLE QUOTATION MARK */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xAC - 0xA0]
    = make_char (0x00AC) /* NOT SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xAD - 0xA0]
    = make_char (0x00AD) /* SOFT HYPHEN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xAE - 0xA0]
    = make_char (0x00AE) /* REGISTERED SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xAF - 0xA0]
    = make_char (0x00AF) /* MACRON */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB0 - 0xA0]
    = make_char (0x00B0) /* DEGREE SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB1 - 0xA0]
    = make_char (0x00B1) /* PLUS-MINUS SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB2 - 0xA0]
    = make_char (0x00B2) /* SUPERSCRIPT TWO */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB3 - 0xA0]
    = make_char (0x00B3) /* SUPERSCRIPT THREE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB4 - 0xA0]
    = make_char (0x00B4) /* ACUTE ACCENT */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB5 - 0xA0]
    = make_char (0x00B5) /* MICRO SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB6 - 0xA0]
    = make_char (0x00B6) /* PILCROW SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB7 - 0xA0]
    = make_char (0x00B7) /* MIDDLE DOT */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB8 - 0xA0]
    = make_char (0x00B8) /* CEDILLA */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xB9 - 0xA0]
    = make_char (0x00B9) /* SUPERSCRIPT ONE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xBA - 0xA0]
    = make_char (0x00BA) /* MASCULINE ORDINAL INDICATOR */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xBB - 0xA0]
    = make_char (0x00BB) /* RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xBC - 0xA0]
    = make_char (0x00BC) /* VULGAR FRACTION ONE QUARTER */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xBD - 0xA0]
    = make_char (0x00BD) /* VULGAR FRACTION ONE HALF */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xBE - 0xA0]
    = make_char (0x00BE) /* VULGAR FRACTION THREE QUARTERS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xBF - 0xA0]
    = make_char (0x00BF) /* INVERTED QUESTION MARK */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC0 - 0xA0]
    = make_char (0x00C0) /* LATIN CAPITAL LETTER A WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC1 - 0xA0]
    = make_char (0x00C1) /* LATIN CAPITAL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC2 - 0xA0]
    = make_char (0x00C2) /* LATIN CAPITAL LETTER A WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC3 - 0xA0]
    = make_char (0x00C3) /* LATIN CAPITAL LETTER A WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC4 - 0xA0]
    = make_char (0x00C4) /* LATIN CAPITAL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC5 - 0xA0]
    = make_char (0x00C5) /* LATIN CAPITAL LETTER A WITH RING ABOVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC6 - 0xA0]
    = make_char (0x00C6) /* LATIN CAPITAL LETTER AE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC7 - 0xA0]
    = make_char (0x00C7) /* LATIN CAPITAL LETTER C WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC8 - 0xA0]
    = make_char (0x00C8) /* LATIN CAPITAL LETTER E WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xC9 - 0xA0]
    = make_char (0x00C9) /* LATIN CAPITAL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xCA - 0xA0]
    = make_char (0x00CA) /* LATIN CAPITAL LETTER E WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xCB - 0xA0]
    = make_char (0x00CB) /* LATIN CAPITAL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xCC - 0xA0]
    = make_char (0x00CC) /* LATIN CAPITAL LETTER I WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xCD - 0xA0]
    = make_char (0x00CD) /* LATIN CAPITAL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xCE - 0xA0]
    = make_char (0x00CE) /* LATIN CAPITAL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xCF - 0xA0]
    = make_char (0x00CF) /* LATIN CAPITAL LETTER I WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD0 - 0xA0]
    = make_char (0x011E) /* LATIN CAPITAL LETTER G WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD1 - 0xA0]
    = make_char (0x00D1) /* LATIN CAPITAL LETTER N WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD2 - 0xA0]
    = make_char (0x00D2) /* LATIN CAPITAL LETTER O WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD3 - 0xA0]
    = make_char (0x00D3) /* LATIN CAPITAL LETTER O WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD4 - 0xA0]
    = make_char (0x00D4) /* LATIN CAPITAL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD5 - 0xA0]
    = make_char (0x00D5) /* LATIN CAPITAL LETTER O WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD6 - 0xA0]
    = make_char (0x00D6) /* LATIN CAPITAL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD7 - 0xA0]
    = make_char (0x00D7) /* MULTIPLICATION SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD8 - 0xA0]
    = make_char (0x00D8) /* LATIN CAPITAL LETTER O WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xD9 - 0xA0]
    = make_char (0x00D9) /* LATIN CAPITAL LETTER U WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xDA - 0xA0]
    = make_char (0x00DA) /* LATIN CAPITAL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xDB - 0xA0]
    = make_char (0x00DB) /* LATIN CAPITAL LETTER U WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xDC - 0xA0]
    = make_char (0x00DC) /* LATIN CAPITAL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xDD - 0xA0]
    = make_char (0x0130) /* LATIN CAPITAL LETTER I WITH DOT ABOVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xDE - 0xA0]
    = make_char (0x015E) /* LATIN CAPITAL LETTER S WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xDF - 0xA0]
    = make_char (0x00DF) /* LATIN SMALL LETTER SHARP S */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE0 - 0xA0]
    = make_char (0x00E0) /* LATIN SMALL LETTER A WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE1 - 0xA0]
    = make_char (0x00E1) /* LATIN SMALL LETTER A WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE2 - 0xA0]
    = make_char (0x00E2) /* LATIN SMALL LETTER A WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE3 - 0xA0]
    = make_char (0x00E3) /* LATIN SMALL LETTER A WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE4 - 0xA0]
    = make_char (0x00E4) /* LATIN SMALL LETTER A WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE5 - 0xA0]
    = make_char (0x00E5) /* LATIN SMALL LETTER A WITH RING ABOVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE6 - 0xA0]
    = make_char (0x00E6) /* LATIN SMALL LETTER AE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE7 - 0xA0]
    = make_char (0x00E7) /* LATIN SMALL LETTER C WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE8 - 0xA0]
    = make_char (0x00E8) /* LATIN SMALL LETTER E WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xE9 - 0xA0]
    = make_char (0x00E9) /* LATIN SMALL LETTER E WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xEA - 0xA0]
    = make_char (0x00EA) /* LATIN SMALL LETTER E WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xEB - 0xA0]
    = make_char (0x00EB) /* LATIN SMALL LETTER E WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xEC - 0xA0]
    = make_char (0x00EC) /* LATIN SMALL LETTER I WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xED - 0xA0]
    = make_char (0x00ED) /* LATIN SMALL LETTER I WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xEE - 0xA0]
    = make_char (0x00EE) /* LATIN SMALL LETTER I WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xEF - 0xA0]
    = make_char (0x00EF) /* LATIN SMALL LETTER I WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF0 - 0xA0]
    = make_char (0x011F) /* LATIN SMALL LETTER G WITH BREVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF1 - 0xA0]
    = make_char (0x00F1) /* LATIN SMALL LETTER N WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF2 - 0xA0]
    = make_char (0x00F2) /* LATIN SMALL LETTER O WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF3 - 0xA0]
    = make_char (0x00F3) /* LATIN SMALL LETTER O WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF4 - 0xA0]
    = make_char (0x00F4) /* LATIN SMALL LETTER O WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF5 - 0xA0]
    = make_char (0x00F5) /* LATIN SMALL LETTER O WITH TILDE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF6 - 0xA0]
    = make_char (0x00F6) /* LATIN SMALL LETTER O WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF7 - 0xA0]
    = make_char (0x00F7) /* DIVISION SIGN */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF8 - 0xA0]
    = make_char (0x00F8) /* LATIN SMALL LETTER O WITH STROKE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xF9 - 0xA0]
    = make_char (0x00F9) /* LATIN SMALL LETTER U WITH GRAVE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xFA - 0xA0]
    = make_char (0x00FA) /* LATIN SMALL LETTER U WITH ACUTE */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xFB - 0xA0]
    = make_char (0x00FB) /* LATIN SMALL LETTER U WITH CIRCUMFLEX */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xFC - 0xA0]
    = make_char (0x00FC) /* LATIN SMALL LETTER U WITH DIAERESIS */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xFD - 0xA0]
    = make_char (0x0131) /* LATIN SMALL LETTER DOTLESS I */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xFE - 0xA0]
    = make_char (0x015F) /* LATIN SMALL LETTER S WITH CEDILLA */;
  XVECTOR_DATA(latin_iso8859_9_to_ucs)[0xFF - 0xA0]
    = make_char (0x00FF) /* LATIN SMALL LETTER Y WITH DIAERESIS */;
  
  staticpro (&latin_viscii_lower_to_ucs);
  latin_viscii_lower_to_ucs = make_vector (96, Qnil);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x20 - 32]
     = make_char (CHAR96('1', 0x20)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x21 - 32] = make_char (0x1eaf);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x22 - 32] = make_char (0x1eb1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x23 - 32] = make_char (0x1eb7);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x24 - 32] = make_char (0x1ea5);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x25 - 32] = make_char (0x1ea7);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x26 - 32] = make_char (0x1ea9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x27 - 32] = make_char (0x1ead);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x28 - 32] = make_char (0x1ebd);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x29 - 32] = make_char (0x1eb9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x2a - 32] = make_char (0x1ebf);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x2b - 32] = make_char (0x1ec1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x2c - 32] = make_char (0x1ec3);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x2d - 32] = make_char (0x1ec5);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x2e - 32] = make_char (0x1ec7);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x2f - 32] = make_char (0x1ed1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x30 - 32] = make_char (0x1ed3);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x31 - 32] = make_char (0x1ed5);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x32 - 32] = make_char (0x1ed7);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x33 - 32]
     = make_char (CHAR96('1', 0x33)); */
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x34 - 32]
     = make_char (CHAR96('1', 0x34)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x35 - 32] = make_char (0x1ed9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x36 - 32] = make_char (0x1edd);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x37 - 32] = make_char (0x1edf);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x38 - 32] = make_char (0x1ecb);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x39 - 32]
     = make_char (CHAR96('1', 0x39));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x3A - 32]
     = make_char (CHAR96('1', 0x3A));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x3B - 32]
     = make_char (CHAR96('1', 0x3B));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x3C - 32]
     = make_char (CHAR96('1', 0x3C)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x3d - 32] = make_char (0x01a1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x3e - 32] = make_char (0x1edb);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x3F - 32]
     = make_char (CHAR96('1', 0x3F));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x40 - 32]
     = make_char (CHAR96('1', 0x40));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x41 - 32]
     = make_char (CHAR96('1', 0x41));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x42 - 32]
     = make_char (CHAR96('1', 0x42));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x43 - 32]
     = make_char (CHAR96('1', 0x43));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x44 - 32]
     = make_char (CHAR96('1', 0x44));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x45 - 32]
     = make_char (CHAR96('1', 0x45)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x46 - 32] = make_char (0x1eb3);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x47 - 32] = make_char (0x1eb5);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x48 - 32]
     = make_char (CHAR96('1', 0x48));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x49 - 32]
     = make_char (CHAR96('1', 0x49));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x4A - 32]
     = make_char (CHAR96('1', 0x4A));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x4B - 32]
     = make_char (CHAR96('1', 0x4B));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x4C - 32]
     = make_char (CHAR96('1', 0x4C));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x4D - 32]
     = make_char (CHAR96('1', 0x4D));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x4E - 32]
     = make_char (CHAR96('1', 0x4E)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x4f - 32] = make_char (0x1ef3);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x50 - 32]
     = make_char (CHAR96('1', 0x50)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x51 - 32] = make_char (0x1ee9);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x52 - 32]
     = make_char (CHAR96('1', 0x52));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x53 - 32]
     = make_char (CHAR96('1', 0x53));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x54 - 32]
     = make_char (CHAR96('1', 0x54)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x55 - 32] = make_char (0x1ea1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x56 - 32] = make_char (0x1ef7);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x57 - 32] = make_char (0x1eeb);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x58 - 32] = make_char (0x1eed);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x59 - 32]
     = make_char (CHAR96('1', 0x59));
     XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x5A - 32]
     = make_char (CHAR96('1', 0x5A)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x5b - 32] = make_char (0x1ef9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x5c - 32] = make_char (0x1ef5);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x5D - 32]
     = make_char (CHAR96('1', 0x5D)); */
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x5e - 32] = make_char (0x1ee1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x5f - 32] = make_char (0x01b0);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x60 - 32] = make_char (0x00e0);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x61 - 32] = make_char (0x00e1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x62 - 32] = make_char (0x00e2);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x63 - 32] = make_char (0x00e3);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x64 - 32] = make_char (0x1ea3);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x65 - 32] = make_char (0x0103);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x66 - 32] = make_char (0x1eef);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x67 - 32] = make_char (0x1eab);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x68 - 32] = make_char (0x00e8);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x69 - 32] = make_char (0x00e9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x6a - 32] = make_char (0x00ea);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x6b - 32] = make_char (0x1ebb);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x6c - 32] = make_char (0x00ec);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x6d - 32] = make_char (0x00ed);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x6e - 32] = make_char (0x0129);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x6f - 32] = make_char (0x1ec9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x70 - 32] = make_char (0x0111);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x71 - 32] = make_char (0x1ef1);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x72 - 32] = make_char (0x00f2);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x73 - 32] = make_char (0x00f3);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x74 - 32] = make_char (0x00f4);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x75 - 32] = make_char (0x00f5);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x76 - 32] = make_char (0x1ecf);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x77 - 32] = make_char (0x1ecd);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x78 - 32] = make_char (0x1ee5);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x79 - 32] = make_char (0x00f9);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x7a - 32] = make_char (0x00fa);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x7b - 32] = make_char (0x0169);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x7c - 32] = make_char (0x1ee7);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x7d - 32] = make_char (0x00fd);
  XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x7e - 32] = make_char (0x1ee3);
  /* XVECTOR_DATA(latin_viscii_lower_to_ucs)[0x7F - 32]
     = make_char (CHAR96('1', 0x7F)); */

  staticpro (&latin_viscii_upper_to_ucs);
  latin_viscii_upper_to_ucs = make_vector (96, Qnil);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x20 - 32]
     = make_char (CHAR96('2', 0x20)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x21 - 32] = make_char (0x1eae);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x22 - 32] = make_char (0x1eb0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x23 - 32] = make_char (0x1eb6);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x24 - 32] = make_char (0x1ea4);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x25 - 32] = make_char (0x1ea6);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x26 - 32] = make_char (0x1ea8);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x27 - 32] = make_char (0x1eac);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x28 - 32] = make_char (0x1ebc);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x29 - 32] = make_char (0x1eb8);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x2a - 32] = make_char (0x1ebe);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x2b - 32] = make_char (0x1ec0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x2c - 32] = make_char (0x1ec2);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x2d - 32] = make_char (0x1ec4);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x2e - 32] = make_char (0x1ec6);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x2f - 32] = make_char (0x1ed0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x30 - 32] = make_char (0x1ed2);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x31 - 32] = make_char (0x1ed4);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x32 - 32] = make_char (0x1ed6);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x33 - 32]
     = make_char (CHAR96('2', 0x33)); */
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x34 - 32]
     = make_char (CHAR96('2', 0x34)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x35 - 32] = make_char (0x1ed8);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x36 - 32] = make_char (0x1edc);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x37 - 32] = make_char (0x1ede);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x38 - 32] = make_char (0x1eca);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x39 - 32]
     = make_char (CHAR96('2', 0x39));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x3a - 32]
     = make_char (CHAR96('2', 0x3a));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x3b - 32]
     = make_char (CHAR96('2', 0x3b));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x3c - 32]
     = make_char (CHAR96('2', 0x3c)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x3d - 32] = make_char (0x01a0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x3e - 32] = make_char (0x1eda);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x3f - 32]
     = make_char (CHAR96('2', 0x3f));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x40 - 32]
     = make_char (CHAR96('2', 0x40));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x41 - 32]
     = make_char (CHAR96('2', 0x41));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x42 - 32]
     = make_char (CHAR96('2', 0x42));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x43 - 32]
     = make_char (CHAR96('2', 0x43));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x44 - 32]
     = make_char (CHAR96('2', 0x44));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x45 - 32]
     = make_char (CHAR96('2', 0x45)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x46 - 32] = make_char (0x1eb2);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x47 - 32] = make_char (0x1eb4);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x48 - 32]
     = make_char (CHAR96('2', 0x48));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x49 - 32]
     = make_char (CHAR96('2', 0x49));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x4a - 32]
     = make_char (CHAR96('2', 0x4a));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x4b - 32]
     = make_char (CHAR96('2', 0x4b));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x4c - 32]
     = make_char (CHAR96('2', 0x4c));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x4d - 32]
     = make_char (CHAR96('2', 0x4d));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x4e - 32]
     = make_char (CHAR96('2', 0x4e)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x4f - 32] = make_char (0x1ef2);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x50 - 32]
     = make_char (CHAR96('2', 0x50)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x51 - 32] = make_char (0x1ee8);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x52 - 32]
     = make_char (CHAR96('2', 0x52));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x53 - 32]
     = make_char (CHAR96('2', 0x53));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x54 - 32]
     = make_char (CHAR96('2', 0x54)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x55 - 32] = make_char (0x1ea0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x56 - 32] = make_char (0x1ef6);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x57 - 32] = make_char (0x1eea);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x58 - 32] = make_char (0x1eec);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x59 - 32]
     = make_char (CHAR96('2', 0x59));
     XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x5a - 32]
     = make_char (CHAR96('2', 0x5a)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x5b - 32] = make_char (0x1ef8);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x5c - 32] = make_char (0x1ef4);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x5d - 32]
     = make_char (CHAR96('2', 0x5d)); */
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x5e - 32] = make_char (0x1ee0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x5f - 32] = make_char (0x01af);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x60 - 32] = make_char (0x00c0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x61 - 32] = make_char (0x00c1);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x62 - 32] = make_char (0x00c2);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x63 - 32] = make_char (0x00c3);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x64 - 32] = make_char (0x1ea2);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x65 - 32] = make_char (0x0102);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x66 - 32] = make_char (0x1eee);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x67 - 32] = make_char (0x1eaa);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x68 - 32] = make_char (0x00c8);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x69 - 32] = make_char (0x00c9);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x6a - 32] = make_char (0x00ca);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x6b - 32] = make_char (0x1eba);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x6c - 32] = make_char (0x00cc);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x6d - 32] = make_char (0x00cd);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x6e - 32] = make_char (0x0128);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x6f - 32] = make_char (0x1ec8);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x70 - 32] = make_char (0x0110);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x71 - 32] = make_char (0x1ef0);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x72 - 32] = make_char (0x00d2);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x73 - 32] = make_char (0x00d3);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x74 - 32] = make_char (0x00d4);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x75 - 32] = make_char (0x00d5);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x76 - 32] = make_char (0x1ece);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x77 - 32] = make_char (0x1ecc);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x78 - 32] = make_char (0x1ee4);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x79 - 32] = make_char (0x00d9);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x7a - 32] = make_char (0x00da);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x7b - 32] = make_char (0x0168);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x7c - 32] = make_char (0x1ee6);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x7d - 32] = make_char (0x00dd);
  XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x7e - 32] = make_char (0x1ee2);
  /* XVECTOR_DATA(latin_viscii_upper_to_ucs)[0x7f - 32]
     = make_char (CHAR96('2', 0x7f)); */

  Vcharset_ucs_bmp =
    make_charset (LEADING_BYTE_UCS_BMP, Qucs_bmp,
		  CHARSET_TYPE_256X256, 1, 0, 0,
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("BMP"),
		  build_string ("BMP"),
		  build_string ("BMP"),
		  build_string (""),
		  Qnil, 0, 0xFFFF, 0);
#else
# define latin_iso8859_2_to_ucs NULL
# define latin_iso8859_3_to_ucs NULL
# define latin_iso8859_4_to_ucs NULL
# define latin_iso8859_9_to_ucs NULL
# define latin_jisx0201_to_ucs NULL
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
		  Qnil, 0, 0x7F, 0);
  Vcharset_control_1 =
    make_charset (LEADING_BYTE_CONTROL_1, Qcontrol_1,
		  CHARSET_TYPE_94, 1, 1, 0,
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("C1"),
		  build_string ("Control characters"),
		  build_string ("Control characters 128-191"),
		  build_string (""),
		  Qnil, 0x80, 0x9F, 0);
  Vcharset_latin_iso8859_1 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_1, Qlatin_iso8859_1,
		  CHARSET_TYPE_96, 1, 1, 'A',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-1"),
		  build_string ("ISO8859-1 (Latin-1)"),
		  build_string ("ISO8859-1 (Latin-1)"),
		  build_string ("iso8859-1"),
		  Qnil, 0xA0, 0xFF, 32);
  Vcharset_latin_iso8859_2 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_2, Qlatin_iso8859_2,
		  CHARSET_TYPE_96, 1, 1, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-2"),
		  build_string ("ISO8859-2 (Latin-2)"),
		  build_string ("ISO8859-2 (Latin-2)"),
		  build_string ("iso8859-2"),
		  latin_iso8859_2_to_ucs, 0, 0, 32);
  Vcharset_latin_iso8859_3 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_3, Qlatin_iso8859_3,
		  CHARSET_TYPE_96, 1, 1, 'C',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-3"),
		  build_string ("ISO8859-3 (Latin-3)"),
		  build_string ("ISO8859-3 (Latin-3)"),
		  build_string ("iso8859-3"),
		  latin_iso8859_3_to_ucs, 0, 0, 32);
  Vcharset_latin_iso8859_4 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_4, Qlatin_iso8859_4,
		  CHARSET_TYPE_96, 1, 1, 'D',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-4"),
		  build_string ("ISO8859-4 (Latin-4)"),
		  build_string ("ISO8859-4 (Latin-4)"),
		  build_string ("iso8859-4"),
		  latin_iso8859_4_to_ucs, 0, 0, 32);
  Vcharset_thai_tis620 =
    make_charset (LEADING_BYTE_THAI_TIS620, Qthai_tis620,
		  CHARSET_TYPE_96, 1, 1, 'T',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("TIS620"),
		  build_string ("TIS620 (Thai)"),
		  build_string ("TIS620.2529 (Thai)"),
		  build_string ("tis620"),
		  Qnil, MIN_CHAR_THAI, MAX_CHAR_THAI, 32);
  Vcharset_greek_iso8859_7 =
    make_charset (LEADING_BYTE_GREEK_ISO8859_7, Qgreek_iso8859_7,
		  CHARSET_TYPE_96, 1, 1, 'F',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("ISO8859-7"),
		  build_string ("ISO8859-7 (Greek)"),
		  build_string ("ISO8859-7 (Greek)"),
		  build_string ("iso8859-7"),
		  Qnil, MIN_CHAR_GREEK, MAX_CHAR_GREEK, 32);
  Vcharset_arabic_iso8859_6 =
    make_charset (LEADING_BYTE_ARABIC_ISO8859_6, Qarabic_iso8859_6,
		  CHARSET_TYPE_96, 1, 1, 'G',
		  CHARSET_RIGHT_TO_LEFT,
		  build_string ("ISO8859-6"),
		  build_string ("ISO8859-6 (Arabic)"),
		  build_string ("ISO8859-6 (Arabic)"),
		  build_string ("iso8859-6"),
		  Qnil, 0, 0, 32);
  Vcharset_hebrew_iso8859_8 =
    make_charset (LEADING_BYTE_HEBREW_ISO8859_8, Qhebrew_iso8859_8,
		  CHARSET_TYPE_96, 1, 1, 'H',
		  CHARSET_RIGHT_TO_LEFT,
		  build_string ("ISO8859-8"),
		  build_string ("ISO8859-8 (Hebrew)"),
		  build_string ("ISO8859-8 (Hebrew)"),
		  build_string ("iso8859-8"),
		  Qnil, MIN_CHAR_HEBREW, MAX_CHAR_HEBREW, 32);
  Vcharset_katakana_jisx0201 =
    make_charset (LEADING_BYTE_KATAKANA_JISX0201, Qkatakana_jisx0201,
		  CHARSET_TYPE_94, 1, 1, 'I',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0201 Kana"),
		  build_string ("JISX0201.1976 (Japanese Kana)"),
		  build_string ("JISX0201.1976 Japanese Kana"),
		  build_string ("jisx0201.1976"),
		  Qnil,
		  MIN_CHAR_HALFWIDTH_KATAKANA,
		  MAX_CHAR_HALFWIDTH_KATAKANA, 33);
  Vcharset_latin_jisx0201 =
    make_charset (LEADING_BYTE_LATIN_JISX0201, Qlatin_jisx0201,
		  CHARSET_TYPE_94, 1, 0, 'J',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0201 Roman"),
		  build_string ("JISX0201.1976 (Japanese Roman)"),
		  build_string ("JISX0201.1976 Japanese Roman"),
		  build_string ("jisx0201.1976"),
		  latin_jisx0201_to_ucs, 0, 0, 33);
  Vcharset_cyrillic_iso8859_5 =
    make_charset (LEADING_BYTE_CYRILLIC_ISO8859_5, Qcyrillic_iso8859_5,
		  CHARSET_TYPE_96, 1, 1, 'L',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("ISO8859-5"),
		  build_string ("ISO8859-5 (Cyrillic)"),
		  build_string ("ISO8859-5 (Cyrillic)"),
		  build_string ("iso8859-5"),
		  Qnil, MIN_CHAR_CYRILLIC, MAX_CHAR_CYRILLIC, 32);
  Vcharset_latin_iso8859_9 =
    make_charset (LEADING_BYTE_LATIN_ISO8859_9, Qlatin_iso8859_9,
		  CHARSET_TYPE_96, 1, 1, 'M',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Latin-5"),
		  build_string ("ISO8859-9 (Latin-5)"),
		  build_string ("ISO8859-9 (Latin-5)"),
		  build_string ("iso8859-9"),
		  latin_iso8859_9_to_ucs, 0, 0, 32);
  Vcharset_japanese_jisx0208_1978 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208_1978, Qjapanese_jisx0208_1978,
		  CHARSET_TYPE_94X94, 2, 0, '@',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0208.1978"),
		  build_string ("JISX0208.1978 (Japanese)"),
		  build_string
		  ("JISX0208.1978 Japanese Kanji (so called \"old JIS\")"),
		  build_string ("\\(jisx0208\\|jisc6226\\)\\.1978"),
		  Qnil, 0, 0, 33);
  Vcharset_chinese_gb2312 =
    make_charset (LEADING_BYTE_CHINESE_GB2312, Qchinese_gb2312,
		  CHARSET_TYPE_94X94, 2, 0, 'A',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("GB2312"),
		  build_string ("GB2312)"),
		  build_string ("GB2312 Chinese simplified"),
		  build_string ("gb2312"),
		  Qnil, 0, 0, 33);
  Vcharset_japanese_jisx0208 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0208, Qjapanese_jisx0208,
		  CHARSET_TYPE_94X94, 2, 0, 'B',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0208"),
		  build_string ("JISX0208.1983/1990 (Japanese)"),
		  build_string ("JISX0208.1983/1990 Japanese Kanji"),
		  build_string ("jisx0208.19\\(83\\|90\\)"),
		  Qnil, 0, 0, 33);
  Vcharset_korean_ksc5601 =
    make_charset (LEADING_BYTE_KOREAN_KSC5601, Qkorean_ksc5601,
		  CHARSET_TYPE_94X94, 2, 0, 'C',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("KSC5601"),
		  build_string ("KSC5601 (Korean"),
		  build_string ("KSC5601 Korean Hangul and Hanja"),
		  build_string ("ksc5601"),
		  Qnil, 0, 0, 33);
  Vcharset_japanese_jisx0212 =
    make_charset (LEADING_BYTE_JAPANESE_JISX0212, Qjapanese_jisx0212,
		  CHARSET_TYPE_94X94, 2, 0, 'D',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("JISX0212"),
		  build_string ("JISX0212 (Japanese)"),
		  build_string ("JISX0212 Japanese Supplement"),
		  build_string ("jisx0212"),
		  Qnil, 0, 0, 33);

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
		  Qnil, 0, 0, 33);
  Vcharset_chinese_cns11643_2 =
    make_charset (LEADING_BYTE_CHINESE_CNS11643_2, Qchinese_cns11643_2,
		  CHARSET_TYPE_94X94, 2, 0, 'H',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("CNS11643-2"),
		  build_string ("CNS11643-2 (Chinese traditional)"),
		  build_string
		  ("CNS 11643 Plane 2 Chinese traditional"),
		  build_string (CHINESE_CNS_PLANE_RE("2")),
		  Qnil, 0, 0, 33);
#ifdef UTF2000
  Vcharset_latin_viscii_lower =
    make_charset (LEADING_BYTE_LATIN_VISCII_LOWER, Qlatin_viscii_lower,
		  CHARSET_TYPE_96, 1, 1, '1',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII lower"),
		  build_string ("VISCII lower (Vietnamese)"),
		  build_string ("VISCII lower (Vietnamese)"),
		  build_string ("VISCII1.1"),
		  latin_viscii_lower_to_ucs, 0, 0, 32);
  Vcharset_latin_viscii_upper =
    make_charset (LEADING_BYTE_LATIN_VISCII_UPPER, Qlatin_viscii_upper,
		  CHARSET_TYPE_96, 1, 1, '2',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("VISCII upper"),
		  build_string ("VISCII upper (Vietnamese)"),
		  build_string ("VISCII upper (Vietnamese)"),
		  build_string ("VISCII1.1"),
		  latin_viscii_upper_to_ucs, 0, 0, 32);
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
		  Qnil, 0, 0, 33);
  Vcharset_chinese_big5_2 =
    make_charset (LEADING_BYTE_CHINESE_BIG5_2, Qchinese_big5_2,
		  CHARSET_TYPE_94X94, 2, 0, '1',
		  CHARSET_LEFT_TO_RIGHT,
		  build_string ("Big5"),
		  build_string ("Big5 (Level-2)"),
		  build_string
		  ("Big5 Level-2 Chinese traditional"),
		  build_string ("big5"),
		  Qnil, 0, 0, 33);

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
