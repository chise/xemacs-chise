/* Header for UCS-4 character representation.
   Copyright (C) 1999,2000,2001 MORIOKA Tomohiko

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

#ifndef INCLUDED_char_ucs_h_
#define INCLUDED_char_ucs_h_

#define valid_char_p(ch) 1

#define CHAR_ASCII_P(ch) ((ch) <= 0x7F)


struct Lisp_Uint8_Byte_Table
{
  struct lcrecord_header header;

  unsigned char property[256];
};
typedef struct Lisp_Uint8_Byte_Table Lisp_Uint8_Byte_Table;

DECLARE_LRECORD (uint8_byte_table, Lisp_Uint8_Byte_Table);
#define XUINT8_BYTE_TABLE(x) \
   XRECORD (x, uint8_byte_table, Lisp_Uint8_Byte_Table)
#define XSETUINT8_BYTE_TABLE(x, p) XSETRECORD (x, p, uint8_byte_table)
#define UINT8_BYTE_TABLE_P(x) RECORDP (x, uint8_byte_table)
#define GC_UINT8_BYTE_TABLE_P(x) GC_RECORDP (x, uint8_byte_table)
/* #define CHECK_UINT8_BYTE_TABLE(x) CHECK_RECORD (x, uint8_byte_table)
   char table entries should never escape to Lisp */


struct Lisp_Uint16_Byte_Table
{
  struct lcrecord_header header;

  unsigned short property[256];
};
typedef struct Lisp_Uint16_Byte_Table Lisp_Uint16_Byte_Table;

DECLARE_LRECORD (uint16_byte_table, Lisp_Uint16_Byte_Table);
#define XUINT16_BYTE_TABLE(x) \
   XRECORD (x, uint16_byte_table, Lisp_Uint16_Byte_Table)
#define XSETUINT16_BYTE_TABLE(x, p) XSETRECORD (x, p, uint16_byte_table)
#define UINT16_BYTE_TABLE_P(x) RECORDP (x, uint16_byte_table)
#define GC_UINT16_BYTE_TABLE_P(x) GC_RECORDP (x, uint16_byte_table)
/* #define CHECK_UINT16_BYTE_TABLE(x) CHECK_RECORD (x, uint16_byte_table)
   char table entries should never escape to Lisp */


struct Lisp_Byte_Table
{
  struct lcrecord_header header;

  Lisp_Object property[256];
};
typedef struct Lisp_Byte_Table Lisp_Byte_Table;

DECLARE_LRECORD (byte_table, Lisp_Byte_Table);
#define XBYTE_TABLE(x) XRECORD (x, byte_table, Lisp_Byte_Table)
#define XSETBYTE_TABLE(x, p) XSETRECORD (x, p, byte_table)
#define BYTE_TABLE_P(x) RECORDP (x, byte_table)
#define GC_BYTE_TABLE_P(x) GC_RECORDP (x, byte_table)
/* #define CHECK_BYTE_TABLE(x) CHECK_RECORD (x, byte_table)
   char table entries should never escape to Lisp */


struct Lisp_Char_ID_Table
{
  struct lcrecord_header header;

  Lisp_Object table;
};
typedef struct Lisp_Char_ID_Table Lisp_Char_ID_Table;

DECLARE_LRECORD (char_id_table, Lisp_Char_ID_Table);
#define XCHAR_ID_TABLE(x) XRECORD (x, char_id_table, Lisp_Char_ID_Table)
#define XSETCHAR_ID_TABLE(x, p) XSETRECORD (x, p, char_id_table)
#define CHAR_ID_TABLE_P(x) RECORDP (x, char_id_table)
#define GC_CHAR_ID_TABLE_P(x) GC_RECORDP (x, char_id_table)
/* #define CHECK_CHAR_ID_TABLE(x) CHECK_RECORD (x, char_id_table)
   char table entries should never escape to Lisp */


Lisp_Object get_char_id_table (Emchar ch, Lisp_Object table);


extern Lisp_Object Vcharset_mojikyo;
extern Lisp_Object Vcharset_mojikyo_2022_1;
extern Lisp_Object Vcharset_latin_jisx0201;


/************************************************************************/
/*                    Definition of leading bytes                       */
/************************************************************************/

typedef short Charset_ID;

#define MIN_LEADING_BYTE		-0x70
#define CHARSET_ID_OFFSET		0x00

/* ISO/IEC 10646 */
#define LEADING_BYTE_UCS		(CHARSET_ID_OFFSET - 1)

/* represent normal 80-9F */
#define LEADING_BYTE_CONTROL_1		(CHARSET_ID_OFFSET - 2)

/* ISO/IEC 10646 BMP */
#define LEADING_BYTE_UCS_BMP		(CHARSET_ID_OFFSET - 3)

/* ISO/IEC 10646 for CNS */
#define LEADING_BYTE_UCS_CNS		(CHARSET_ID_OFFSET - 5)

/* ISO/IEC 10646 for JIS */
#define LEADING_BYTE_UCS_JIS		(CHARSET_ID_OFFSET - 6)

/* ISO/IEC 10646 for Big5 */
#define LEADING_BYTE_UCS_BIG5		(CHARSET_ID_OFFSET - 9)

/* Japanese JIS X0208-1990	2/4 2/{(8),9,10,11} 4/2 (B) */
#define LEADING_BYTE_JAPANESE_JISX0208_1990 (CHARSET_ID_OFFSET - 10)

/* Chinese GB 12345-1990 */
#define LEADING_BYTE_CHINESE_GB12345	(CHARSET_ID_OFFSET - 11)

#define LEADING_BYTE_CHINESE_BIG5	(CHARSET_ID_OFFSET - 20)

/* Big5 Level 1			2/4 2/{(8),9,10,11} 4/0 '0' */
#define LEADING_BYTE_CHINESE_BIG5_1	(CHARSET_ID_OFFSET - 21)

/* Big5 Level 2			2/4 2/{(8),9,10,11} 4/0 '1' */
#define LEADING_BYTE_CHINESE_BIG5_2	(CHARSET_ID_OFFSET - 22)

#define LEADING_BYTE_CHINESE_BIG5_CDP	(CHARSET_ID_OFFSET - 23)

/* VISCII 1.1 */
#define LEADING_BYTE_LATIN_VISCII	(CHARSET_ID_OFFSET - 24)

/* MULE VISCII-LOWER			(CHARSET_ID_OFFSET_96 + '1') */
#define LEADING_BYTE_LATIN_VISCII_LOWER	(CHARSET_ID_OFFSET - 25)

/* MULE VISCII-UPPER			(CHARSET_ID_OFFSET_96 + '2') */
#define LEADING_BYTE_LATIN_VISCII_UPPER	(CHARSET_ID_OFFSET - 26)

#define LEADING_BYTE_ETHIOPIC_UCS	(CHARSET_ID_OFFSET - 27)

#define LEADING_BYTE_DAIKANWA		(CHARSET_ID_OFFSET - 28)
#define LEADING_BYTE_DAIKANWA_EKANJI	(CHARSET_ID_OFFSET - 29)

#define LEADING_BYTE_GT			(CHARSET_ID_OFFSET - 30)
#define LEADING_BYTE_GT_PJ_1		(CHARSET_ID_OFFSET - 31)
#define LEADING_BYTE_GT_PJ_2		(CHARSET_ID_OFFSET - 32)
#define LEADING_BYTE_GT_PJ_3		(CHARSET_ID_OFFSET - 33)
#define LEADING_BYTE_GT_PJ_4		(CHARSET_ID_OFFSET - 34)
#define LEADING_BYTE_GT_PJ_5		(CHARSET_ID_OFFSET - 35)
#define LEADING_BYTE_GT_PJ_6		(CHARSET_ID_OFFSET - 36)
#define LEADING_BYTE_GT_PJ_7		(CHARSET_ID_OFFSET - 37)
#define LEADING_BYTE_GT_PJ_8		(CHARSET_ID_OFFSET - 38)
#define LEADING_BYTE_GT_PJ_9		(CHARSET_ID_OFFSET - 39)
#define LEADING_BYTE_GT_PJ_10		(CHARSET_ID_OFFSET - 40)
#define LEADING_BYTE_GT_PJ_11		(CHARSET_ID_OFFSET - 41)

#define LEADING_BYTE_MOJIKYO		(CHARSET_ID_OFFSET - 48)
#define LEADING_BYTE_MOJIKYO_2022_1	(CHARSET_ID_OFFSET - 49)
#define LEADING_BYTE_MOJIKYO_2022_2	(CHARSET_ID_OFFSET - 50)

/* Konjaku-Mojikyo font (for pseudo-JIS X 0208 encoding) */
#define LEADING_BYTE_MOJIKYO_PJ_1	(CHARSET_ID_OFFSET - 51)
#define LEADING_BYTE_MOJIKYO_PJ_2	(CHARSET_ID_OFFSET - 52)
#define LEADING_BYTE_MOJIKYO_PJ_3	(CHARSET_ID_OFFSET - 53)
#define LEADING_BYTE_MOJIKYO_PJ_4	(CHARSET_ID_OFFSET - 54)
#define LEADING_BYTE_MOJIKYO_PJ_5	(CHARSET_ID_OFFSET - 55)
#define LEADING_BYTE_MOJIKYO_PJ_6	(CHARSET_ID_OFFSET - 56)
#define LEADING_BYTE_MOJIKYO_PJ_7	(CHARSET_ID_OFFSET - 57)
#define LEADING_BYTE_MOJIKYO_PJ_8	(CHARSET_ID_OFFSET - 58)
#define LEADING_BYTE_MOJIKYO_PJ_9	(CHARSET_ID_OFFSET - 59)
#define LEADING_BYTE_MOJIKYO_PJ_10	(CHARSET_ID_OFFSET - 60)
#define LEADING_BYTE_MOJIKYO_PJ_11	(CHARSET_ID_OFFSET - 61)
#define LEADING_BYTE_MOJIKYO_PJ_12	(CHARSET_ID_OFFSET - 62)
#define LEADING_BYTE_MOJIKYO_PJ_13	(CHARSET_ID_OFFSET - 63)
#define LEADING_BYTE_MOJIKYO_PJ_14	(CHARSET_ID_OFFSET - 64)
#define LEADING_BYTE_MOJIKYO_PJ_15	(CHARSET_ID_OFFSET - 65)
#define LEADING_BYTE_MOJIKYO_PJ_16	(CHARSET_ID_OFFSET - 66)
#define LEADING_BYTE_MOJIKYO_PJ_17	(CHARSET_ID_OFFSET - 67)
#define LEADING_BYTE_MOJIKYO_PJ_18	(CHARSET_ID_OFFSET - 68)
#define LEADING_BYTE_MOJIKYO_PJ_19	(CHARSET_ID_OFFSET - 69)
#define LEADING_BYTE_MOJIKYO_PJ_20	(CHARSET_ID_OFFSET - 70)
#define LEADING_BYTE_MOJIKYO_PJ_21	(CHARSET_ID_OFFSET - 71)

#define MIN_LEADING_BYTE_PRIVATE	MIN_LEADING_BYTE
#define MAX_LEADING_BYTE_PRIVATE	(CHARSET_ID_OFFSET - 72)


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

/* Right-hand Part of the VSCII-2 (TCVN 5712:1983) */
#define LEADING_BYTE_LATIN_TCVN5712	180 /* F = 5/10 0x5A `Z' */


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
  Lisp_Object doc_string;
  Lisp_Object registry;
  Lisp_Object short_name;
  Lisp_Object long_name;

  Lisp_Object reverse_direction_charset;

  Lisp_Object ccl_program;

  /* Final byte of this character set in ISO2022 designating escape sequence */
  Bufbyte final;

  /* Number of columns a character in this charset takes up, on TTY
     devices.  Not used for X devices. */
  unsigned int columns;

  /* Direction of this character set */
  unsigned int direction;

  /* Number of bytes used in encoding of this character set (1 .. 4) */
  unsigned short dimension;

  /* Number of chars in each dimension (94, 96, 128, 256) */
  unsigned short chars;

  /* Which half of font to be used to display this character set */
  unsigned int graphic;

  /* Code-point->character mapping table */
  Lisp_Object decoding_table;

  /* Character->code-point mapping table */
  Lisp_Object encoding_table;

  /* Range of character code */
  Emchar ucs_min, ucs_max;

  /* Offset for external code */
  Emchar code_offset;

  /* Offset for each byte */
  Emchar byte_offset;
};
typedef struct Lisp_Charset Lisp_Charset;

DECLARE_LRECORD (charset, Lisp_Charset);
#define XCHARSET(x) XRECORD (x, charset, Lisp_Charset)
#define XSETCHARSET(x, p) XSETRECORD (x, p, charset)
#define CHARSETP(x) RECORDP (x, charset)
#define GC_CHARSETP(x) GC_RECORDP (x, charset)
#define CHECK_CHARSET(x) CHECK_RECORD (x, charset)
#define CONCHECK_CHARSET(x) CONCHECK_RECORD (x, charset)

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

struct charset_lookup {
  /* Table of charsets indexed by (leading byte - 128). */
  Lisp_Object charset_by_leading_byte[NUM_LEADING_BYTES];
  
  /* Table of charsets indexed by type/final-byte/direction. */
  Lisp_Object charset_by_attributes[4][128];

  Charset_ID next_allocated_leading_byte;
};

extern struct charset_lookup *chlook;

#ifdef ERROR_CHECK_TYPECHECK
/* int not Bufbyte even though that is the actual type of a leading byte.
   This way, out-ot-range values will get caught rather than automatically
   truncated. */
INLINE_HEADER Lisp_Object CHARSET_BY_LEADING_BYTE (Charset_ID lb);
INLINE_HEADER Lisp_Object
CHARSET_BY_LEADING_BYTE (Charset_ID lb)
{
  assert (lb >= MIN_LEADING_BYTE &&
	  lb < (MIN_LEADING_BYTE + NUM_LEADING_BYTES));
  return chlook->charset_by_leading_byte[lb - MIN_LEADING_BYTE];
}

#else

#define CHARSET_BY_LEADING_BYTE(lb) \
  (chlook->charset_by_leading_byte[(lb) - MIN_LEADING_BYTE])

#endif

INLINE_HEADER Lisp_Object
CHARSET_BY_ATTRIBUTES (int chars, int dimension, int final, int dir);
INLINE_HEADER Lisp_Object
CHARSET_BY_ATTRIBUTES (int chars, int dimension, int final, int dir)
{
  int type;

  if (chars == 94)
    type = 0;
  else if (chars == 96)
    type = 1;
  else
    return Qnil;
  type += dimension == 1 ? 0 : 2;
  return chlook->charset_by_attributes[type][final];
}


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

#define MAX_CHAR_BASIC_LATIN	0x007F

/*
#define MIN_CHAR_HEBREW		0x0590
#define MAX_CHAR_HEBREW		0x05EF
*/

#define MIN_CHAR_THAI		0x0E00
#define MAX_CHAR_THAI		0x0E5F

/*
#define MIN_CHAR_HIRAGANA	0x3041
#define MAX_CHAR_HIRAGANA	0x3093

#define MIN_CHAR_KATAKANA	0x30A1
#define MAX_CHAR_KATAKANA	0x30F6
*/

#define MIN_CHAR_HALFWIDTH_KATAKANA	0xFF61
#define MAX_CHAR_HALFWIDTH_KATAKANA	0xFF9F

#define MAX_CHAR_BMP		0x00FFFF

#define MIN_CHAR_DAIKANWA	0x00E00000
#define MAX_CHAR_DAIKANWA	(MIN_CHAR_DAIKANWA + 50100) /* 0xE0FFFF */
#define MIN_CHAR_MOJIKYO_0	MIN_CHAR_DAIKANWA
#define MAX_CHAR_MOJIKYO_0	(MIN_CHAR_MOJIKYO_0 + 94 * 60 * 22)

#define MIN_CHAR_94		0xE90940
#define MAX_CHAR_94		(MIN_CHAR_94 + 94 * 80 - 1)
#define MIN_CHAR_96		(MIN_CHAR_94 + 94 * 80)
#define MAX_CHAR_96		(MIN_CHAR_96 + 96 * 80 - 1)

#define MIN_CHAR_94x94		0xE9F6C0
#define MIN_CHAR_JIS_X0208_1990	(MIN_CHAR_94x94 + 94 * 94 * 79)
#define MAX_CHAR_94x94		(MIN_CHAR_94x94 + 94 * 94 * 80 - 1)
#define MAX_CHAR_JIS_X0208_1990	MAX_CHAR_94x94
#define MIN_CHAR_96x96		0xF4C000
#define MAX_CHAR_96x96		(MIN_CHAR_96x96 + 96 * 96 * 80 - 1)

#define MIN_CHAR_MOJIKYO	0x60000000
#define MAX_CHAR_MOJIKYO	(MIN_CHAR_MOJIKYO + 94 * 60 * 22)
#define MIN_CHAR_GT		0x61000000
#define MAX_CHAR_GT		(MIN_CHAR_GT + 66773)

Emchar decode_builtin_char (Lisp_Object charset, int code_point);

INLINE_HEADER int
DECODE_MOJIKYO_2022 (unsigned char b1, unsigned char b2, unsigned char b3);
INLINE_HEADER int
DECODE_MOJIKYO_2022 (unsigned char b1, unsigned char b2, unsigned char b3)
{
  if (b2 < 16 + 32)
    return 0;
  else if (b2 < 16 + 32 + 30)
    return
      (b1 - 33) * (94 * 60)
      + (b2 - (16 + 32)) * 94
      + (b3 - 33)
      + 1;
  else if (b2 < 18 + 32 + 30)
    return 0;
  else if (b2 < 18 + 32 + 60)
    return
      (b1 - 33) * (94 * 60)
      + (b2 - (18 + 32)) * 94
      + (b3 - 33)
      + 1;
  else
    return 0;
}

extern Lisp_Object Vcharset_chinese_big5;
extern Lisp_Object Vcharset_chinese_big5_1;
extern Lisp_Object Vcharset_chinese_big5_2;

INLINE_HEADER Emchar DECODE_CHAR (Lisp_Object charset, int code_point);
INLINE_HEADER Emchar
DECODE_CHAR (Lisp_Object charset, int code_point)
{
  int dim = XCHARSET_DIMENSION (charset);
  Lisp_Object decoding_table = XCHARSET_DECODING_TABLE (charset);
  int idx;
  Lisp_Object ch;

  while (dim > 0)
    {
      dim--;
      if ( VECTORP (decoding_table)
	   && ( 0 <= (idx = ((code_point >> (dim * 8))
			     & 255) - XCHARSET_BYTE_OFFSET (charset)) )
	   && ( idx < XVECTOR_LENGTH (decoding_table) )
	   && !NILP (ch = XVECTOR_DATA(decoding_table)[idx]) )
	{
	  if (CHARP (ch))
	    return XCHAR (ch);
	  else
	    decoding_table = ch;
	}
      else
	break;
    }
  if (XCHARSET_DIMENSION (charset) == 1)
    return decode_builtin_char (charset, code_point);
  else if (EQ (charset, Vcharset_chinese_big5_1))
    {
      unsigned int I
	= ((code_point >> 8) - 33) * (0xFF - 0xA1)
	+ ((code_point & 0xFF) - 33);
      unsigned char b1 = I / (0xFF - 0xA1 + 0x7F - 0x40) + 0xA1;
      unsigned char b2 = I % (0xFF - 0xA1 + 0x7F - 0x40);

      b2 += b2 < 0x3F ? 0x40 : 0x62;
      return DECODE_CHAR (Vcharset_chinese_big5, (b1 << 8) | b2);
    }
  else if (EQ (charset, Vcharset_chinese_big5_2))
    {
      unsigned int I
	= ((code_point >> 8) - 33) * (0xFF - 0xA1)
	+ ((code_point & 0xFF) - 33);
      unsigned char b1, b2;

      I += (0xFF - 0xA1 + 0x7F - 0x40) * (0xC9 - 0xA1);
      b1 = I / (0xFF - 0xA1 + 0x7F - 0x40) + 0xA1;
      b2 = I % (0xFF - 0xA1 + 0x7F - 0x40);
      b2 += b2 < 0x3F ? 0x40 : 0x62;
      return DECODE_CHAR (Vcharset_chinese_big5, (b1 << 8) | b2);
    }
  else if (EQ (charset, Vcharset_mojikyo_2022_1))
    {
      int m =
	DECODE_MOJIKYO_2022
	((unsigned char)(code_point >> 16),
	 (unsigned char)(code_point >>  8),
	 (unsigned char) code_point);

      if (m > 0)
	return DECODE_CHAR (Vcharset_mojikyo, m);
      else
	return ' ';
    }
  else
    {
      int plane = LEADING_BYTE_MOJIKYO_PJ_1 - XCHARSET_ID (charset);

      if ( (0 <= plane) && (plane <= 21) )
	{
	  int m = DECODE_MOJIKYO_2022 (plane + 33,
				       code_point >> 8,
				       (unsigned char)code_point);
	  if (m > 0)
	    return DECODE_CHAR (Vcharset_mojikyo, m);
	  else
	    return ' ';
	}
      else
	return decode_builtin_char (charset, code_point);
    }
}

/* Return a character whose charset is CHARSET and position-codes
   are C1 and C2.  TYPE9N character ignores C2. */

INLINE_HEADER Emchar MAKE_CHAR (Lisp_Object charset, int c1, int c2);
INLINE_HEADER Emchar
MAKE_CHAR (Lisp_Object charset, int c1, int c2)
{
  if (XCHARSET_DIMENSION (charset) == 1)
    return DECODE_CHAR (charset, c1);
  else
    return DECODE_CHAR (charset, (c1 << 8) | c2);
}

extern Lisp_Object Vcharacter_attribute_table;

int encode_builtin_char_1 (Emchar c, Lisp_Object* charset);
int range_charset_code_point (Lisp_Object charset, Emchar ch);

INLINE_HEADER int charset_code_point (Lisp_Object charset, Emchar ch);
INLINE_HEADER int
charset_code_point (Lisp_Object charset, Emchar ch)
{
  Lisp_Object encoding_table = XCHARSET_ENCODING_TABLE (charset);
  Lisp_Object ret;

  if ( CHAR_ID_TABLE_P (encoding_table)
       && INTP (ret = get_char_id_table (ch, encoding_table)) )
    return XINT (ret);
  else
    return range_charset_code_point (charset, ch);
}

extern Lisp_Object Vdefault_coded_charset_priority_list;
EXFUN (Ffind_charset, 1);

INLINE_HEADER int encode_char_1 (Emchar ch, Lisp_Object* charset);
INLINE_HEADER int
encode_char_1 (Emchar ch, Lisp_Object* charset)
{
  Lisp_Object charsets = Vdefault_coded_charset_priority_list;

  while (!NILP (charsets))
    {
      *charset = Ffind_charset (Fcar (charsets));
      if (!NILP (*charset))
	{
	  Lisp_Object encoding_table = XCHARSET_ENCODING_TABLE (*charset);
	  Lisp_Object ret;

	  if ( CHAR_ID_TABLE_P (encoding_table)
	       && INTP (ret = get_char_id_table (ch, encoding_table)) )
	    return XINT (ret);
	  else
	    {
	      int code_point = range_charset_code_point (*charset, ch);

	      if (code_point >= 0)
		return code_point;
	    }
	}
      charsets = Fcdr (charsets);	      
    }
  
  /* otherwise --- maybe for bootstrap */
  return encode_builtin_char_1 (ch, charset);
}

#define ENCODE_CHAR(ch, charset)	encode_char_1 (ch, &(charset))

INLINE_HEADER void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2);
INLINE_HEADER void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2)
{
  int code_point = encode_char_1 (c, charset);

  if (code_point >= 0)
    {
      int dim = XCHARSET_DIMENSION (*charset);

       if (dim == 1)
	 {
	   *c1 = code_point;
	   *c2 = 0;
	 }
       else /* if (dim == 2) */
	 {
	   *c1 = code_point >> 8;
	   *c2 = code_point & 255;
	 }
    }
  else{
    *c1 = *c2 = 0;
  }
}

#define BREAKUP_CHAR(ch, charset, b1, b2) \
  breakup_char_1 (ch, &(charset), &(b1), &(b2))

INLINE_HEADER Lisp_Object CHAR_CHARSET (Emchar ch);
INLINE_HEADER Lisp_Object
CHAR_CHARSET (Emchar ch)
{
  Lisp_Object charset;
 
  ENCODE_CHAR (ch, charset);
  return charset;
}

#define CHAR_CHARSET_ID(c)  (XCHARSET_ID(CHAR_CHARSET(c)))
#define CHAR_COLUMNS(c)     (CHARSET_COLUMNS(XCHARSET(CHAR_CHARSET(c))))


typedef struct Charc
{
  Lisp_Object charset;
  int code_point;
} Charc;

INLINE_HEADER Charc CHAR_TO_CHARC (Emchar ch);
INLINE_HEADER Charc
CHAR_TO_CHARC (Emchar ch)
{
  Charc cc;

  cc.code_point = encode_char_1 (ch, &cc.charset);
  if (EQ (cc.charset, Vcharset_mojikyo))
    {
      int plane, byte1, byte2;

      cc.code_point--;
      plane = cc.code_point / (94 * 60);
      byte1 = (cc.code_point % (94 * 60)) / 94;
      if (byte1 < 30)
	byte1 += 16 + 32;
      else
	byte1 += 18 + 32;
      byte2 = cc.code_point % 94 + 33;
      cc.charset
	= CHARSET_BY_LEADING_BYTE (LEADING_BYTE_MOJIKYO_PJ_1 - plane);
      cc.code_point = (byte1 << 8) | byte2;
    }
  return cc;
}


/************************************************************************/
/*                            Exported functions                        */
/************************************************************************/

EXFUN (Fget_charset, 1);

extern Lisp_Object Vcharset_japanese_jisx0208;
extern Lisp_Object Vcharset_japanese_jisx0208_1990;
extern Lisp_Object Vcharset_japanese_jisx0212;

#endif /* INCLUDED_char_ucs_h_ */
