/* Header for UCS-4 character representation.
   Copyright (C) 1999 Electrotechnical Laboratory, JAPAN.
   Licensed to the Free Software Foundation.

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

/* Rewritten by MORIOKA Tomohiko <tomo@m17n.org>. */

#ifndef _XEMACS_CHAR_UCS_H
#define _XEMACS_CHAR_UCS_H

#define valid_char_p(ch) 1

#define CHAR_ASCII_P(ch) ((ch) <= 0x7F)


DECLARE_LRECORD (char_byte_table, struct Lisp_Char_Byte_Table);
#define XCHAR_BYTE_TABLE(x) \
  XRECORD (x, char_byte_table, struct Lisp_Char_Byte_Table)
#define XSETCHAR_BYTE_TABLE(x, p) XSETRECORD (x, p, char_byte_table)
#define CHAR_BYTE_TABLE_P(x) RECORDP (x, char_byte_table)
#define GC_CHAR_BYTE_TABLE_P(x) GC_RECORDP (x, char_byte_table)
/* #define CHECK_CHAR_BYTE_TABLE(x) CHECK_RECORD (x, char_byte_table)
   char table entries should never escape to Lisp */

struct Lisp_Char_Byte_Table
{
  struct lcrecord_header header;

  Lisp_Object property[256];
};

Lisp_Object get_char_code_table (Emchar ch, Lisp_Object table);


extern Lisp_Object Vcharset_ucs_bmp;
extern Lisp_Object Vcharset_latin_jisx0201;
extern Lisp_Object Vcharset_latin_iso8859_2;
extern Lisp_Object Vcharset_latin_iso8859_3;
extern Lisp_Object Vcharset_latin_iso8859_4;
extern Lisp_Object Vcharset_latin_iso8859_9;
extern Lisp_Object Vcharset_latin_viscii_lower;
extern Lisp_Object Vcharset_latin_viscii_upper;


/************************************************************************/
/*                    Definition of leading bytes                       */
/************************************************************************/

typedef int Charset_ID;

#define MIN_LEADING_BYTE		-0x40
#define CHARSET_ID_OFFSET		0x00

/* represent normal 80-9F */
#define LEADING_BYTE_CONTROL_1		(CHARSET_ID_OFFSET - 1)

/* ISO/IEC 10646 BMP */
#define LEADING_BYTE_UCS_BMP		(CHARSET_ID_OFFSET - 2)

/* VISCII 1.1 */
#define LEADING_BYTE_LATIN_VISCII	(CHARSET_ID_OFFSET - 3)

/* MULE VISCII-LOWER			(CHARSET_ID_OFFSET_96 + '1') */
#define LEADING_BYTE_LATIN_VISCII_LOWER	(CHARSET_ID_OFFSET - 4)

/* MULE VISCII-UPPER			(CHARSET_ID_OFFSET_96 + '2') */
#define LEADING_BYTE_LATIN_VISCII_UPPER	(CHARSET_ID_OFFSET - 5)

/* Big5 Level 1			2/4 2/{(8),9,10,11} 4/0 '0' */
#define LEADING_BYTE_CHINESE_BIG5_1	(CHARSET_ID_OFFSET - 6)

/* Big5 Level 2			2/4 2/{(8),9,10,11} 4/0 '1' */
#define LEADING_BYTE_CHINESE_BIG5_2	(CHARSET_ID_OFFSET - 7)

#define LEADING_BYTE_HIRAGANA_JISX0208	(CHARSET_ID_OFFSET - 8)
#define LEADING_BYTE_KATAKANA_JISX0208	(CHARSET_ID_OFFSET - 9)

#define MIN_LEADING_BYTE_PRIVATE	MIN_LEADING_BYTE
#define MAX_LEADING_BYTE_PRIVATE	(CHARSET_ID_OFFSET - 10)


/* #define CHARSET_ID_OFFSET_94		(CHARSET_ID_OFFSET - '0') */

/* #define MIN_CHARSET_ID_PRIVATE_94	(CHARSET_ID_OFFSET_94 + '0') */
/* #define MAX_CHARSET_ID_PRIVATE_94	(CHARSET_ID_OFFSET_94 + '?') */

/* ISO 646 IRV */
#define LEADING_BYTE_ASCII		  6 /* (CHARSET_ID_OFFSET_94 + 'B') */

/* Right half of JIS X0201-1976 */
#define LEADING_BYTE_KATAKANA_JISX0201	 13 /* (CHARSET_ID_OFFSET_94 + 'I') */

/* Left  half of JIS X0201-1976 */
#define LEADING_BYTE_LATIN_JISX0201	 14 /* (CHARSET_ID_OFFSET_94 + 'J') */


/* #define CHARSET_ID_OFFSET_96		(CHARSET_ID_OFFSET_94 + 80) */

/* Right half of ISO 8859-1 */
#define LEADING_BYTE_LATIN_ISO8859_1	100 /* (CHARSET_ID_OFFSET_96 + 'A') */

/* Right half of ISO 8859-2 */
#define LEADING_BYTE_LATIN_ISO8859_2	101 /* (CHARSET_ID_OFFSET_96 + 'B') */

/* Right half of ISO 8859-3 */
#define LEADING_BYTE_LATIN_ISO8859_3	109 /* (CHARSET_ID_OFFSET_96 + 'C') */

/* Right half of ISO 8859-4 */
#define LEADING_BYTE_LATIN_ISO8859_4	110 /* (CHARSET_ID_OFFSET_96 + 'D') */

/* Right half of ISO 8859-7 */
#define LEADING_BYTE_GREEK_ISO8859_7	126 /* (CHARSET_ID_OFFSET_96 + 'F') */

/* Right half of ISO 8859-6 */
#define LEADING_BYTE_ARABIC_ISO8859_6	127 /* (CHARSET_ID_OFFSET_96 + 'G') */

/* Right half of ISO 8859-8 */
#define LEADING_BYTE_HEBREW_ISO8859_8	138 /* (CHARSET_ID_OFFSET_96 + 'H') */

/* Right half of ISO 8859-5 */
#define LEADING_BYTE_CYRILLIC_ISO8859_5	144 /* (CHARSET_ID_OFFSET_96 + 'L') */

/* Right half of ISO 8859-9 */
#define LEADING_BYTE_LATIN_ISO8859_9	148 /* (CHARSET_ID_OFFSET_96 + 'M') */

/* TIS620-2533 */
#define LEADING_BYTE_THAI_TIS620	166 /* (CHARSET_ID_OFFSET_96 + 'T') */


/* #define CHARSET_ID_OFFSET_94x94		(CHARSET_ID_OFFSET_96 + 80) */


/* #define MIN_LEADING_BYTE_PRIVATE_2	('0' + CHARSET_ID_OFFSET_94x94) */
/* #define MAX_LEADING_BYTE_PRIVATE_2	('?' + CHARSET_ID_OFFSET_94x94) */

/* Japanese JIS X0208-1978	2/4 2/{(8),9,10,11} 4/0 (@) */
#define LEADING_BYTE_JAPANESE_JISX0208_1978	 42

/* Chinese Hanzi GB2312-1980	2/4 2/{(8),9,10,11} 4/1 (A) */
#define LEADING_BYTE_CHINESE_GB2312		 58

/* Japanese JIS X0208-1983	2/4 2/{(8),9,10,11} 4/2 (B) */
#define LEADING_BYTE_JAPANESE_JISX0208		 87

/* Hangul KS C5601-1987		2/4 2/{8,9,10,11} 4/3 (C) */
#define LEADING_BYTE_KOREAN_KSC5601		149

/* Japanese JIS X0212-1990	2/4 2/{8,9,10,11} 4/4 (D) */
#define LEADING_BYTE_JAPANESE_JISX0212		159

/* CCITT Extended GB		2/4 2/{8,9,10,11} 4/5 (E) */
#define LEADING_BYTE_CHINESE_CCITT_GB		165

/* Chinese CNS11643 Set 1	2/4 2/{8,9,10,11} 4/7 (G) */
#define LEADING_BYTE_CHINESE_CNS11643_1		171

/* Chinese CNS11643 Set 2	2/4 2/{8,9,10,11} 4/8 (H) */
#define LEADING_BYTE_CHINESE_CNS11643_2		172

/* Chinese CNS11643 Set 3	2/4 2/{8,9,10,11} 4/9 (I) */
#define LEADING_BYTE_CHINESE_CNS11643_3		183

/* Chinese CNS11643 Set 4	2/4 2/{8,9,10,11} 4/10 (J) */
#define LEADING_BYTE_CHINESE_CNS11643_4		184

/* Chinese CNS11643 Set 5	2/4 2/{8,9,10,11} 4/11 (K) */
#define LEADING_BYTE_CHINESE_CNS11643_5		185

/* Chinese CNS11643 Set 6	2/4 2/{8,9,10,11} 4/12 (L) */
#define LEADING_BYTE_CHINESE_CNS11643_6		186

/* Chinese CNS11643 Set 7	2/4 2/{8,9,10,11} 4/13 (M) */
#define LEADING_BYTE_CHINESE_CNS11643_7		187

/* DPRK Hangul KPS 9566-1997	2/4 2/{8,9,10,11} 4/14 (N) */
#define LEADING_BYTE_KOREAN_KPS9566		202


#define NUM_LEADING_BYTES	(80 * 3 - MIN_LEADING_BYTE)


/************************************************************************/
/*            Information about a particular character set              */
/************************************************************************/

struct Lisp_Charset
{
  struct lcrecord_header header;

  int id;
  Lisp_Object name;
  Lisp_Object doc_string, registry, short_name, long_name;

  Lisp_Object reverse_direction_charset;

  Lisp_Object ccl_program;

  /* Final byte of this character set in ISO2022 designating escape sequence */
  Bufbyte final;

  /* Number of columns a character in this charset takes up, on TTY
     devices.  Not used for X devices. */
  unsigned int columns;

  /* Direction of this character set */
  unsigned int direction;

  /* Type of this character set (94, 96, 94x94, 96x96) */
  unsigned int type;

  /* Number of bytes used in encoding of this character set (1 or 2) */
  unsigned int dimension;

  /* Number of chars in each dimension (usually 94 or 96) */
  unsigned int chars;

  /* Which half of font to be used to display this character set */
  unsigned int graphic;

  /* Byte->character mapping table */
  Lisp_Object decoding_table;

  /* Character->byte mapping table */
  Lisp_Object encoding_table;

  /* Range of character code */
  Emchar ucs_min, ucs_max;

  /* Offset for external code */
  Emchar code_offset;

  /* Offset for each byte */
  Emchar byte_offset;
};

DECLARE_LRECORD (charset, struct Lisp_Charset);
#define XCHARSET(x) XRECORD (x, charset, struct Lisp_Charset)
#define XSETCHARSET(x, p) XSETRECORD (x, p, charset)
#define CHARSETP(x) RECORDP (x, charset)
#define GC_CHARSETP(x) GC_RECORDP (x, charset)
#define CHECK_CHARSET(x) CHECK_RECORD (x, charset)
#define CONCHECK_CHARSET(x) CONCHECK_RECORD (x, charset)

#define CHARSET_TYPE_94      0 /* This charset includes 94      characters. */
#define CHARSET_TYPE_94X94   1 /* This charset includes 94x94   characters. */
#define CHARSET_TYPE_96      2 /* This charset includes 96      characters. */
#define CHARSET_TYPE_96X96   3 /* This charset includes 96x96   characters. */
#define CHARSET_TYPE_128     4 /* This charset includes 128     characters. */
#define CHARSET_TYPE_128X128 5 /* This charset includes 128x128 characters. */
#define CHARSET_TYPE_256     6 /* This charset includes 256     characters. */
#define CHARSET_TYPE_256X256 7 /* This charset includes 256x256 characters. */

#define CHARSET_LEFT_TO_RIGHT	0
#define CHARSET_RIGHT_TO_LEFT	1

/* Leading byte and id have been regrouped. -- OG */
#define CHARSET_ID(cs)		 ((cs)->id)
#define CHARSET_LEADING_BYTE(cs) (CHARSET_ID(cs))
#define CHARSET_NAME(cs)	 ((cs)->name)
#define CHARSET_SHORT_NAME(cs)	 ((cs)->short_name)
#define CHARSET_LONG_NAME(cs)	 ((cs)->long_name)
#define CHARSET_COLUMNS(cs)	 ((cs)->columns)
#define CHARSET_GRAPHIC(cs)	 ((cs)->graphic)
#define CHARSET_TYPE(cs)	 ((cs)->type)
#define CHARSET_DIRECTION(cs)	 ((cs)->direction)
#define CHARSET_FINAL(cs)	 ((cs)->final)
#define CHARSET_DOC_STRING(cs)	 ((cs)->doc_string)
#define CHARSET_REGISTRY(cs)	 ((cs)->registry)
#define CHARSET_CCL_PROGRAM(cs)  ((cs)->ccl_program)
#define CHARSET_DIMENSION(cs)	 ((cs)->dimension)
#define CHARSET_CHARS(cs)	 ((cs)->chars)
#define CHARSET_REVERSE_DIRECTION_CHARSET(cs) ((cs)->reverse_direction_charset)
#define CHARSET_DECODING_TABLE(cs) ((cs)->decoding_table)
#define CHARSET_ENCODING_TABLE(cs) ((cs)->encoding_table)
#define CHARSET_UCS_MIN(cs)	 ((cs)->ucs_min)
#define CHARSET_UCS_MAX(cs)	 ((cs)->ucs_max)
#define CHARSET_CODE_OFFSET(cs)	 ((cs)->code_offset)
#define CHARSET_BYTE_OFFSET(cs)	 ((cs)->byte_offset)


#define XCHARSET_ID(cs)		  CHARSET_ID           (XCHARSET (cs))
#define XCHARSET_NAME(cs)	  CHARSET_NAME         (XCHARSET (cs))
#define XCHARSET_SHORT_NAME(cs)	  CHARSET_SHORT_NAME   (XCHARSET (cs))
#define XCHARSET_LONG_NAME(cs)	  CHARSET_LONG_NAME    (XCHARSET (cs))
#define XCHARSET_GRAPHIC(cs)      CHARSET_GRAPHIC      (XCHARSET (cs))
#define XCHARSET_TYPE(cs)	  CHARSET_TYPE         (XCHARSET (cs))
#define XCHARSET_DIRECTION(cs)	  CHARSET_DIRECTION    (XCHARSET (cs))
#define XCHARSET_FINAL(cs)	  CHARSET_FINAL        (XCHARSET (cs))
#define XCHARSET_DOC_STRING(cs)	  CHARSET_DOC_STRING   (XCHARSET (cs))
#define XCHARSET_REGISTRY(cs)	  CHARSET_REGISTRY     (XCHARSET (cs))
#define XCHARSET_LEADING_BYTE(cs) CHARSET_LEADING_BYTE (XCHARSET (cs))
#define XCHARSET_CCL_PROGRAM(cs)  CHARSET_CCL_PROGRAM  (XCHARSET (cs))
#define XCHARSET_DIMENSION(cs)	  CHARSET_DIMENSION    (XCHARSET (cs))
#define XCHARSET_CHARS(cs)	  CHARSET_CHARS        (XCHARSET (cs))
#define XCHARSET_REVERSE_DIRECTION_CHARSET(cs) \
  CHARSET_REVERSE_DIRECTION_CHARSET (XCHARSET (cs))
#define XCHARSET_DECODING_TABLE(cs) CHARSET_DECODING_TABLE(XCHARSET(cs))
#define XCHARSET_ENCODING_TABLE(cs) CHARSET_ENCODING_TABLE(XCHARSET(cs))
#define XCHARSET_UCS_MIN(cs)	  CHARSET_UCS_MIN(XCHARSET(cs))
#define XCHARSET_UCS_MAX(cs)	  CHARSET_UCS_MAX(XCHARSET(cs))
#define XCHARSET_CODE_OFFSET(cs)  CHARSET_CODE_OFFSET(XCHARSET(cs))
#define XCHARSET_BYTE_OFFSET(cs)  CHARSET_BYTE_OFFSET(XCHARSET(cs))

/* Table of charsets indexed by (leading byte - 128). */
extern Lisp_Object charset_by_leading_byte[NUM_LEADING_BYTES];

/* Table of charsets indexed by type/final-byte. */
extern Lisp_Object charset_by_attributes[4][128];

#ifdef ERROR_CHECK_TYPECHECK
/* int not Bufbyte even though that is the actual type of a leading byte.
   This way, out-ot-range values will get caught rather than automatically
   truncated. */
INLINE Lisp_Object CHARSET_BY_LEADING_BYTE (Charset_ID lb);
INLINE Lisp_Object
CHARSET_BY_LEADING_BYTE (Charset_ID lb)
{
  assert (lb >= MIN_LEADING_BYTE &&
	  lb < (MIN_LEADING_BYTE + NUM_LEADING_BYTES));
  return charset_by_leading_byte[lb - MIN_LEADING_BYTE];
}

#else

#define CHARSET_BY_LEADING_BYTE(lb) \
  (charset_by_leading_byte[(lb) - MIN_LEADING_BYTE])

#endif

#define CHARSET_BY_ATTRIBUTES(type, final, dir) \
  (charset_by_attributes[type][final])


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

#define MAX_CHAR_BASIC_LATIN	0x007F

#define MIN_CHAR_GREEK		0x0370
#define MAX_CHAR_GREEK		0x03CF

#define MIN_CHAR_CYRILLIC	0x0400
#define MAX_CHAR_CYRILLIC	0x045F

#define MIN_CHAR_HEBREW		0x0590
#define MAX_CHAR_HEBREW		0x05EF

#define MIN_CHAR_THAI		0x0E00
#define MAX_CHAR_THAI		0x0E5F

#define MIN_CHAR_HIRAGANA	0x3041
#define MAX_CHAR_HIRAGANA	0x3093

#define MIN_CHAR_KATAKANA	0x30A1
#define MAX_CHAR_KATAKANA	0x30F6

#define MIN_CHAR_HALFWIDTH_KATAKANA	0xFF61
#define MAX_CHAR_HALFWIDTH_KATAKANA	0xFF9F

#define MIN_CHAR_OBS_94x94	0xE00000
#define MAX_CHAR_OBS_94x94	(0xE00000 + 94 * 94 * 14 - 1)

#define MIN_CHAR_94		0xE90940
#define MAX_CHAR_94		(MIN_CHAR_94 + 94 * 80 - 1)
#define MIN_CHAR_96		(MIN_CHAR_94 + 94 * 80)
#define MAX_CHAR_96		(MIN_CHAR_96 + 96 * 80 - 1)

#define MIN_CHAR_94x94		0xE9F6C0
#define MAX_CHAR_94x94		(MIN_CHAR_94x94 + 94 * 94 * 80 - 1)
#define MIN_CHAR_96x96		0xF4C000
#define MAX_CHAR_96x96		(MIN_CHAR_96x96 + 96 * 96 * 80 - 1)


/* Return a character whose charset is CHARSET and position-codes
   are C1 and C2.  TYPE9N character ignores C2. */

INLINE Emchar MAKE_CHAR (Lisp_Object charset, int c1, int c2);
INLINE Emchar
MAKE_CHAR (Lisp_Object charset, int c1, int c2)
{
  Lisp_Object decoding_table = XCHARSET_DECODING_TABLE (charset);
  int idx;
  Lisp_Object ch;

  if (!EQ (decoding_table, Qnil)
      && (0 <= (idx = c1 - XCHARSET_BYTE_OFFSET (charset)))
      && (idx < XVECTOR_LENGTH (decoding_table))
      && !EQ (ch = XVECTOR_DATA(decoding_table)[idx], Qnil))
    {
      if (VECTORP (ch))
	{
	  if ((0 <= (idx = c2 - XCHARSET_BYTE_OFFSET (charset)))
	      && (idx < XVECTOR_LENGTH (ch))
	      && !EQ (ch = XVECTOR_DATA(ch)[idx], Qnil))
	    return XCHAR (ch);
	}
      else
	return XCHAR (ch);
    }
  if (EQ (charset, Vcharset_katakana_jisx0201))
    if (c1 < 0x60)
      return c1 + MIN_CHAR_HALFWIDTH_KATAKANA - 33;
    else
      /* return MIN_CHAR_94 + ('I' - '0') * 94 + (c1 - 33); */
      return ' ';
  else if (XCHARSET_UCS_MAX (charset))
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

extern Lisp_Object Vcharacter_attribute_table;

unsigned char charset_get_byte1 (Lisp_Object charset, Emchar ch);
unsigned char charset_get_byte2 (Lisp_Object charset, Emchar ch);

extern Lisp_Object Vdefault_coded_charset_priority_list;
EXFUN (Ffind_charset, 1);

INLINE void breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2);
INLINE void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2)
{
  Lisp_Object cdef = get_char_code_table (c, Vcharacter_attribute_table);

  if (!EQ (cdef, Qnil))
    {
      Lisp_Object charsets = Vdefault_coded_charset_priority_list;
      Lisp_Object field;

      while (!EQ (charsets, Qnil))
	{
	  *charset = Ffind_charset (Fcar (charsets));
	  if (!EQ (*charset, Qnil))
	    {
	      if (!EQ (field = Fcdr (Fassq (*charset, cdef)), Qnil))
		{
		  Lisp_Object ret = Fcar (field);
		  if (INTP (ret))
		    {
		      *c1 = XINT (ret);
		      if (INTP (ret = Fcar (Fcdr (field))))
			*c2 = XINT (ret);
		      return;
		    }
		}
	      else if ((*c1 = charset_get_byte1 (*charset, c)))
		{
		  *c2 = charset_get_byte2 (*charset, c);
		  return;
		}
	    }
	  charsets = Fcdr (charsets);	      
	}
    }
  if (c < MIN_CHAR_OBS_94x94)
    {
#if 0
      Lisp_Object charsets = Vdefault_coded_charset_priority_list;
      while (!EQ (charsets, Qnil))
	{
	  *charset = Ffind_charset (Fcar (charsets));
	  if (!EQ (*charset, Qnil)
	      && (*c1 = charset_get_byte1 (*charset, c)) )
	    {
	      *c2 = charset_get_byte2 (*charset, c);
	      return;
	    }
	  charsets = Fcdr (charsets);	      
	}
#endif
      /* otherwise --- maybe for bootstrap */
      if (c <= MAX_CHAR_BASIC_LATIN)
	{
	  *charset = Vcharset_ascii;
	  *c1 = charset_get_byte1 (*charset, c);
	  *c2 = charset_get_byte2 (*charset, c);
	}
      else if (c < 0xA0)
	{
	  *charset = Vcharset_control_1;
	  *c1 = charset_get_byte1 (*charset, c);
	  *c2 = charset_get_byte2 (*charset, c);
	}
      else if (c <= 0xff)
	{
	  *charset = Vcharset_latin_iso8859_1;
	  *c1 = charset_get_byte1 (*charset, c);
	  *c2 = charset_get_byte2 (*charset, c);
	}
      else if ((MIN_CHAR_GREEK <= c) && (c <= MAX_CHAR_GREEK))
	{
	  *charset = Vcharset_greek_iso8859_7;
	  *c1 = c - MIN_CHAR_GREEK + 0x20;
	  *c2 = 0;
	}
      else if ((MIN_CHAR_CYRILLIC <= c) && (c <= MAX_CHAR_CYRILLIC))
	{
	  *charset = Vcharset_cyrillic_iso8859_5;
	  *c1 = c - MIN_CHAR_CYRILLIC + 0x20;
	  *c2 = 0;
	}
      else if ((MIN_CHAR_HEBREW <= c) && (c <= MAX_CHAR_HEBREW))
	{
	  *charset = Vcharset_hebrew_iso8859_8;
	  *c1 = c - MIN_CHAR_HEBREW + 0x20;
	  *c2 = 0;
	}
      else if ((MIN_CHAR_THAI <= c) && (c <= MAX_CHAR_THAI))
	{
	  *charset = Vcharset_thai_tis620;
	  *c1 = c - MIN_CHAR_THAI + 0x20;
	  *c2 = 0;
	}
      else if ((MIN_CHAR_HALFWIDTH_KATAKANA <= c)
	       && (c <= MAX_CHAR_HALFWIDTH_KATAKANA))
	{
	  *charset = Vcharset_katakana_jisx0201;
	  *c1 = c - MIN_CHAR_HALFWIDTH_KATAKANA + 33;
	  *c2 = 0;
	}
      else
	{
	  *charset = Vcharset_ucs_bmp;
	  *c1 = c >> 8;
	  *c2 = c & 0xff;
	}
    }
  else if (c <= MAX_CHAR_OBS_94x94)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_94X94,
				 ((c - MIN_CHAR_OBS_94x94) / (94 * 94)) + '@',
				 CHARSET_LEFT_TO_RIGHT);
      *c1 = (((c - MIN_CHAR_OBS_94x94) / 94) % 94) + 33;
      *c2 = ((c - MIN_CHAR_OBS_94x94) % 94) + 33;
    }
  else if (c <= MAX_CHAR_94)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_94,
				 ((c - MIN_CHAR_94) / 94) + '0',
				 CHARSET_LEFT_TO_RIGHT);
      *c1 = ((c - MIN_CHAR_94) % 94) + 33;
      *c2 = 0;
    }
  else if (c <= MAX_CHAR_96)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_96,
				 ((c - MIN_CHAR_96) / 96) + '0',
				 CHARSET_LEFT_TO_RIGHT);
      *c1 = ((c - MIN_CHAR_96) % 96) + 32;
      *c2 = 0;
    }
  else if (c <= MAX_CHAR_94x94)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_94X94,
				 ((c - MIN_CHAR_94x94) / (94 * 94)) + '0',
				 CHARSET_LEFT_TO_RIGHT);
      *c1 = (((c - MIN_CHAR_94x94) / 94) % 94) + 33;
      *c2 = ((c - MIN_CHAR_94x94) % 94) + 33;
    }
  else if (c <= MAX_CHAR_96x96)
    {
      *charset
	= CHARSET_BY_ATTRIBUTES (CHARSET_TYPE_96X96,
				 ((c - MIN_CHAR_96x96) / (96 * 96)) + '0',
				 CHARSET_LEFT_TO_RIGHT);
      *c1 = (((c - MIN_CHAR_96x96) / 96) % 96) + 32;
      *c2 = ((c - MIN_CHAR_96x96) % 96) + 32;
    }
  else
    {
      printf("u+%x", c);
      abort();
    }
}

#define BREAKUP_CHAR(ch, charset, b1, b2) \
  breakup_char_1 (ch, &(charset), &(b1), &(b2))

INLINE Lisp_Object CHAR_CHARSET (Emchar ch);
INLINE Lisp_Object
CHAR_CHARSET (Emchar ch)
{
  Lisp_Object charset;
  int b1, b2;

  BREAKUP_CHAR(ch, charset, b1, b2);
  return charset;
}

#define CHAR_CHARSET_ID(c)  (XCHARSET_ID(CHAR_CHARSET(c)))
#define CHAR_COLUMNS(c)     (CHARSET_COLUMNS(XCHARSET(CHAR_CHARSET(c))))


/************************************************************************/
/*                            Exported functions                        */
/************************************************************************/

EXFUN (Fget_charset, 1);

extern Lisp_Object Vcharset_chinese_big5_1;
extern Lisp_Object Vcharset_chinese_big5_2;
extern Lisp_Object Vcharset_japanese_jisx0208;
extern Lisp_Object Vcharset_japanese_jisx0212;

#endif /* _XEMACS_CHAR_UCS_H */
