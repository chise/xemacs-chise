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


/************************************************************************/
/*                    Definition of leading bytes                       */
/************************************************************************/

typedef int Charset_ID;

#define MIN_LEADING_BYTE		0x80

#define LEADING_BYTE_UCS_BMP		0x80
#define LEADING_BYTE_CONTROL_1		0x81 /* represent normal 80-9F */


#define CHARSET_ID_OFFSET_94		0x60

#define MIN_CHARSET_ID_PRIVATE_94	(CHARSET_ID_OFFSET_94 + '0')
#define MAX_CHARSET_ID_PRIVATE_94	(CHARSET_ID_OFFSET_94 + '?')

/* ISO 646 IRV */
#define LEADING_BYTE_ASCII		(CHARSET_ID_OFFSET_94 + 'B')

/* Right half of JIS X0201-1976 */
#define LEADING_BYTE_KATAKANA_JISX0201	(CHARSET_ID_OFFSET_94 + 'I')

/* Left  half of JIS X0201-1976 */
#define LEADING_BYTE_LATIN_JISX0201	(CHARSET_ID_OFFSET_94 + 'J')


#define CHARSET_ID_OFFSET_96		0x70

/* Right half of ISO 8859-1 */
#define LEADING_BYTE_LATIN_ISO8859_1	(CHARSET_ID_OFFSET_96 + 'A')

/* Right half of ISO 8859-2 */
#define LEADING_BYTE_LATIN_ISO8859_2	(CHARSET_ID_OFFSET_96 + 'B')

/* Right half of ISO 8859-3 */
#define LEADING_BYTE_LATIN_ISO8859_3	(CHARSET_ID_OFFSET_96 + 'C')

/* Right half of ISO 8859-4 */
#define LEADING_BYTE_LATIN_ISO8859_4	(CHARSET_ID_OFFSET_96 + 'D')

/* Right half of ISO 8859-7 */
#define LEADING_BYTE_GREEK_ISO8859_7	(CHARSET_ID_OFFSET_96 + 'F')

/* Right half of ISO 8859-6 */
#define LEADING_BYTE_ARABIC_ISO8859_6	(CHARSET_ID_OFFSET_96 + 'G')

/* Right half of ISO 8859-8 */
#define LEADING_BYTE_HEBREW_ISO8859_8	(CHARSET_ID_OFFSET_96 + 'H')

/* Right half of ISO 8859-5 */
#define LEADING_BYTE_CYRILLIC_ISO8859_5	(CHARSET_ID_OFFSET_96 + 'L')

/* Right half of ISO 8859-9 */
#define LEADING_BYTE_LATIN_ISO8859_9	(CHARSET_ID_OFFSET_96 + 'M')

/* TIS620-2533 */
#define LEADING_BYTE_THAI_TIS620	(CHARSET_ID_OFFSET_96 + 'T')


#define MIN_LEADING_BYTE_PRIVATE_1	0xD0
#define MAX_LEADING_BYTE_PRIVATE_1	0xDF


#define CHARSET_ID_OFFSET_94x94		0xB0

/* Big5 Level 1 */
#define LEADING_BYTE_CHINESE_BIG5_1	('0' + CHARSET_ID_OFFSET_94x94)

/* Big5 Level 2 */
#define LEADING_BYTE_CHINESE_BIG5_2	('1' + CHARSET_ID_OFFSET_94x94)

#define MIN_LEADING_BYTE_PRIVATE_2	('0' + CHARSET_ID_OFFSET_94x94)
#define MAX_LEADING_BYTE_PRIVATE_2	('?' + CHARSET_ID_OFFSET_94x94)

/* Japanese JIS X0208-1978 */
#define LEADING_BYTE_JAPANESE_JISX0208_1978 \
					('@' + CHARSET_ID_OFFSET_94x94)

/* Chinese Hanzi GB2312-1980 */
#define LEADING_BYTE_CHINESE_GB2312	('A' + CHARSET_ID_OFFSET_94x94)

/* Japanese JIS X0208-1983 */
#define LEADING_BYTE_JAPANESE_JISX0208	('B' + CHARSET_ID_OFFSET_94x94)

/* Hangul KS C5601-1987 */
#define LEADING_BYTE_KOREAN_KSC5601	('C' + CHARSET_ID_OFFSET_94x94)

/* Japanese JIS X0212-1990 */
#define LEADING_BYTE_JAPANESE_JISX0212	('D' + CHARSET_ID_OFFSET_94x94)

/* CCITT Extended GB */
#define LEADING_BYTE_CHINESE_CCITT_GB	('E' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 1 */
#define LEADING_BYTE_CHINESE_CNS11643_1	('G' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 2 */
#define LEADING_BYTE_CHINESE_CNS11643_2	('H' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 3 */
#define LEADING_BYTE_CHINESE_CNS11643_3	('I' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 4 */
#define LEADING_BYTE_CHINESE_CNS11643_4	('J' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 5 */
#define LEADING_BYTE_CHINESE_CNS11643_5	('K' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 6 */
#define LEADING_BYTE_CHINESE_CNS11643_6	('L' + CHARSET_ID_OFFSET_94x94)

/* Chinese CNS11643 Set 7 */
#define LEADING_BYTE_CHINESE_CNS11643_7	('M' + CHARSET_ID_OFFSET_94x94)

/* DPRK Hangul KPS 9566-1997 */
#define LEADING_BYTE_KOREAN_KPS9566	('N' + CHARSET_ID_OFFSET_94x94)

#define MIN_LEADING_BYTE_OFFICIAL_2	LEADING_BYTE_JAPANESE_JISX0208_1978
#define MAX_LEADING_BYTE_OFFICIAL_2	LEADING_BYTE_KOREAN_KPS9566

#define NUM_LEADING_BYTES 256


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

  /* Number of bytes (1 - 4) required in the internal representation
     for characters in this character set.  This is *not* the
     same as the dimension of the character set). */
  unsigned int rep_bytes;

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
};

DECLARE_LRECORD (charset, struct Lisp_Charset);
#define XCHARSET(x) XRECORD (x, charset, struct Lisp_Charset)
#define XSETCHARSET(x, p) XSETRECORD (x, p, charset)
#define CHARSETP(x) RECORDP (x, charset)
#define GC_CHARSETP(x) GC_RECORDP (x, charset)
#define CHECK_CHARSET(x) CHECK_RECORD (x, charset)
#define CONCHECK_CHARSET(x) CONCHECK_RECORD (x, charset)

#define CHARSET_TYPE_94      0 /* This charset includes 94    characters. */
#define CHARSET_TYPE_96      1 /* This charset includes 96    characters. */
#define CHARSET_TYPE_94X94   2 /* This charset includes 94x94 characters. */
#define CHARSET_TYPE_96X96   3 /* This charset includes 96x96 characters. */
#define CHARSET_TYPE_128X128 4 /* This charset includes 128x128 characters. */
#define CHARSET_TYPE_256X256 5 /* This charset includes 256x256 characters. */

#define CHARSET_LEFT_TO_RIGHT	0
#define CHARSET_RIGHT_TO_LEFT	1

/* Leading byte and id have been regrouped. -- OG */
#define CHARSET_ID(cs)		 ((cs)->id)
#define CHARSET_LEADING_BYTE(cs) ((Bufbyte)(CHARSET_ID(cs)))
#define CHARSET_NAME(cs)	 ((cs)->name)
#define CHARSET_SHORT_NAME(cs)	 ((cs)->short_name)
#define CHARSET_LONG_NAME(cs)	 ((cs)->long_name)
#define CHARSET_REP_BYTES(cs)	 ((cs)->rep_bytes)
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


#define XCHARSET_ID(cs)		  CHARSET_ID           (XCHARSET (cs))
#define XCHARSET_NAME(cs)	  CHARSET_NAME         (XCHARSET (cs))
#define XCHARSET_SHORT_NAME(cs)	  CHARSET_SHORT_NAME   (XCHARSET (cs))
#define XCHARSET_LONG_NAME(cs)	  CHARSET_LONG_NAME    (XCHARSET (cs))
#define XCHARSET_REP_BYTES(cs)	  CHARSET_REP_BYTES    (XCHARSET (cs))
#define XCHARSET_COLUMNS(cs)	  CHARSET_COLUMNS      (XCHARSET (cs))
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

#define MIN_CHAR_HALFWIDTH_KATAKANA	0xFF60
#define MAX_CHAR_HALFWIDTH_KATAKANA	0xFF9F

#define MIN_CHAR_94		0xE90940
#define MAX_CHAR_94		(MIN_CHAR_94 + 94 * 80 - 1)
#define MIN_CHAR_96		(MIN_CHAR_94 + 94 * 80)
#define MAX_CHAR_96		(MIN_CHAR_96 + 96 * 80 - 1)

#define MIN_CHAR_94x94		0xE9F6C0
#define MAX_CHAR_94x94		(MIN_CHAR_94x94 + 94 * 94 * 80 - 1)
#define MIN_CHAR_96x96		0xF4C000
#define MAX_CHAR_96x96		(MIN_CHAR_96x96 + 96 * 96 * 80 - 1)

extern Lisp_Object Vcharset_ucs_bmp;

/* Return a character whose charset is CHARSET and position-codes
   are C1 and C2.  TYPE9N character ignores C2. */

INLINE Emchar MAKE_CHAR (Lisp_Object charset, int c1, int c2);
INLINE Emchar
MAKE_CHAR (Lisp_Object charset, int c1, int c2)
{
  if (EQ (charset, Vcharset_ascii))
    return c1;
  else if (EQ (charset, Vcharset_control_1))
    return c1 | 0x80;
  else if (EQ (charset, Vcharset_ucs_bmp))
    return (c1 << 8) | c2;
  else if (EQ (charset, Vcharset_latin_iso8859_1))
    return c1 | 0x80;
  else if (EQ (charset, Vcharset_greek_iso8859_7))
    return c1 + MIN_CHAR_GREEK - 0x20;
  else if (EQ (charset, Vcharset_cyrillic_iso8859_5))
    return c1 + MIN_CHAR_CYRILLIC - 0x20;
  else if (EQ (charset, Vcharset_hebrew_iso8859_8))
    return c1 + MIN_CHAR_HEBREW - 0x20;
  else if (EQ (charset, Vcharset_thai_tis620))
    return c1 + MIN_CHAR_THAI - 0x20;
  else if (EQ (charset, Vcharset_katakana_jisx0201))
    if (c1 < 0x60)
      return c1 + MIN_CHAR_HALFWIDTH_KATAKANA - 0x20;
    else
      return 32;
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

extern Charset_ID    latin_a_char_to_charset[128];
extern unsigned char latin_a_char_to_byte1[128];
extern unsigned char latin_a_char_to_byte2[128];

INLINE void breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2);
INLINE void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2)
{
  if (c <= MAX_CHAR_BASIC_LATIN)
    {
      *charset = Vcharset_ascii;
      *c1 = c;
      *c2 = 0;
    }
  else if (c < 0xA0)
    {
      *charset = Vcharset_control_1;
      *c1 = c & 0x7f;
      *c2 = 0;
    }
  else if (c <= 0xff)
    {
      *charset = Vcharset_latin_iso8859_1;
      *c1 = c & 0x7f;
      *c2 = 0;
    }
  else if (c <= 0x17f)
    {
      *charset
	= CHARSET_BY_LEADING_BYTE (latin_a_char_to_charset[c - 0x100]);
      *c1 = latin_a_char_to_byte1[c - 0x100];
      *c2 = latin_a_char_to_byte2[c - 0x100];
    }
  else if (c < MIN_CHAR_GREEK)
    {
      *charset = Vcharset_ucs_bmp;
      *c1 = c >> 8;
      *c2 = c & 0xff;
    }
  else if (c <= MAX_CHAR_GREEK)
    {
      *charset = Vcharset_greek_iso8859_7;
      *c1 = c - MIN_CHAR_GREEK + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_CYRILLIC)
    {
      *charset = Vcharset_ucs_bmp;
      *c1 = c >> 8;
      *c2 = c & 0xff;
    }
  else if (c <= MAX_CHAR_CYRILLIC)
    {
      *charset = Vcharset_cyrillic_iso8859_5;
      *c1 = c - MIN_CHAR_CYRILLIC + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_HEBREW)
    {
      *charset = Vcharset_ucs_bmp;
      *c1 = c >> 8;
      *c2 = c & 0xff;
    }
  else if (c <= MAX_CHAR_HEBREW)
    {
      *charset = Vcharset_hebrew_iso8859_8;
      *c1 = c - MIN_CHAR_HEBREW + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_THAI)
    {
      *charset = Vcharset_ucs_bmp;
      *c1 = c >> 8;
      *c2 = c & 0xff;
    }
  else if (c <= MAX_CHAR_THAI)
    {
      *charset = Vcharset_thai_tis620;
      *c1 = c - MIN_CHAR_THAI + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_HALFWIDTH_KATAKANA)
    {
      *charset = Vcharset_ucs_bmp;
      *c1 = c >> 8;
      *c2 = c & 0xff;
    }
  else if (c <= MAX_CHAR_HALFWIDTH_KATAKANA)
    {
      *charset = Vcharset_katakana_jisx0201;
      *c1 = c - MIN_CHAR_HALFWIDTH_KATAKANA + 0x20;
      *c2 = 0;
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

#define CHAR_LEADING_BYTE(c) (XCHARSET_LEADING_BYTE(CHAR_CHARSET(c)))


#ifdef ENABLE_COMPOSITE_CHARS
/************************************************************************/
/*                           Composite characters                       */
/************************************************************************/

Emchar lookup_composite_char (Bufbyte *str, int len);
Lisp_Object composite_char_string (Emchar ch);
#endif /* ENABLE_COMPOSITE_CHARS */


/************************************************************************/
/*                            Exported functions                        */
/************************************************************************/

EXFUN (Ffind_charset, 1);
EXFUN (Fget_charset, 1);

extern Lisp_Object Vcharset_chinese_big5_1;
extern Lisp_Object Vcharset_chinese_big5_2;
extern Lisp_Object Vcharset_japanese_jisx0208;
extern Lisp_Object Vcharset_japanese_jisx0212;

#endif /* _XEMACS_CHAR_UCS_H */
