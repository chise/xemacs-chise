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

#ifndef _XEMACS_CHARACTER_H
#define _XEMACS_CHARACTER_H

#ifndef CHAR_IS_UCS4
#include "mule-charset.h"
#else

/************************************************************************/
/*                    Definition of leading bytes                       */
/************************************************************************/

#define MIN_LEADING_BYTE		0x80
/* These need special treatment in a string and/or character */
#define LEADING_BYTE_ASCII		0x8E /* Omitted in a buffer */
#define LEADING_BYTE_CONTROL_1		0x8F /* represent normal 80-9F */

/** The following are for 1-byte characters in an official charset. **/

#define LEADING_BYTE_LATIN_ISO8859_1	0x81 /* Right half of ISO 8859-1 */
#define LEADING_BYTE_LATIN_ISO8859_2	0x82 /* Right half of ISO 8859-2 */
#define LEADING_BYTE_LATIN_ISO8859_3	0x83 /* Right half of ISO 8859-3 */
#define LEADING_BYTE_LATIN_ISO8859_4	0x84 /* Right half of ISO 8859-4 */
#define LEADING_BYTE_THAI_TIS620	0x85 /* TIS620-2533 */
#define LEADING_BYTE_GREEK_ISO8859_7	0x86 /* Right half of ISO 8859-7 */
#define LEADING_BYTE_ARABIC_ISO8859_6	0x87 /* Right half of ISO 8859-6 */
#define LEADING_BYTE_HEBREW_ISO8859_8	0x88 /* Right half of ISO 8859-8 */
#define LEADING_BYTE_KATAKANA_JISX0201	0x89 /* Right half of JIS X0201-1976 */
#define LEADING_BYTE_LATIN_JISX0201	0x8A /* Left  half of JIS X0201-1976 */
#define LEADING_BYTE_CYRILLIC_ISO8859_5	0x8C /* Right half of ISO 8859-5 */
#define LEADING_BYTE_LATIN_ISO8859_9	0x8D /* Right half of ISO 8859-9 */

#define MIN_LEADING_BYTE_OFFICIAL_1	LEADING_BYTE_LATIN_ISO8859_1
#define MAX_LEADING_BYTE_OFFICIAL_1	LEADING_BYTE_LATIN_ISO8859_9

#define LEADING_BYTE_CHINESE_BIG5_1	0xB0	/* Big5 Level 1 */
#define LEADING_BYTE_CHINESE_BIG5_2	0xB1	/* Big5 Level 2 */
#define MIN_LEADING_BYTE_PRIVATE_2	0xB0
#define MAX_LEADING_BYTE_PRIVATE_2	0xBF

/** The following are for 2-byte characters in an official charset. **/

#define LEADING_BYTE_JAPANESE_JISX0208_1978 0xC0/* Japanese JIS X0208-1978 */
#define LEADING_BYTE_CHINESE_GB2312	0xC1	/* Chinese Hanzi GB2312-1980 */
#define LEADING_BYTE_JAPANESE_JISX0208	0xC2	/* Japanese JIS X0208-1983 */
#define LEADING_BYTE_KOREAN_KSC5601	0xC3	/* Hangul KS C5601-1987 */
#define LEADING_BYTE_JAPANESE_JISX0212	0xC4	/* Japanese JIS X0212-1990 */
#define LEADING_BYTE_CHINESE_CCITT_GB	0xC5	/* CCITT Extended GB */
#define LEADING_BYTE_CHINESE_CNS11643_1	0xC7	/* Chinese CNS11643 Set 1 */
#define LEADING_BYTE_CHINESE_CNS11643_2	0xC8	/* Chinese CNS11643 Set 2 */
#define LEADING_BYTE_CHINESE_CNS11643_3	0xC9	/* Chinese CNS11643 Set 3 */
#define LEADING_BYTE_CHINESE_CNS11643_4	0xCA	/* Chinese CNS11643 Set 4 */
#define LEADING_BYTE_CHINESE_CNS11643_5	0xCB	/* Chinese CNS11643 Set 5 */
#define LEADING_BYTE_CHINESE_CNS11643_6	0xCC	/* Chinese CNS11643 Set 6 */
#define LEADING_BYTE_CHINESE_CNS11643_7	0xCD	/* Chinese CNS11643 Set 7 */
#define LEADING_BYTE_KOREAN_KPS9566	0xCE	/* DPRK Hangul KPS 9566-1997 */

#define MIN_LEADING_BYTE_OFFICIAL_2	LEADING_BYTE_JAPANESE_JISX0208_1978
#define MAX_LEADING_BYTE_OFFICIAL_2	LEADING_BYTE_KOREAN_KPS9566

/** The following are for 1- and 2-byte characters in a private charset. **/

#define PRE_LEADING_BYTE_PRIVATE_1	0x120	/* 1-byte char-set */
#define PRE_LEADING_BYTE_PRIVATE_2	0x121	/* 2-byte char-set */

#define MIN_LEADING_BYTE_PRIVATE_1	0x0D0
#define MAX_LEADING_BYTE_PRIVATE_1	0x11f

#define NUM_LEADING_BYTES 256


/************************************************************************/
/*                     Operations on individual bytes                   */
/*                             of any format                            */
/************************************************************************/

/* Argument `c' should be (unsigned int) or (unsigned char). */
/* Note that SP and DEL are not included. */

#define BYTE_ASCII_P(c) ((c) < 0x80)
#define BYTE_C0_P(c) ((c) < 0x20)
/* Do some forced casting just to make *sure* things are gotten right. */
#define BYTE_C1_P(c) ((unsigned int) ((unsigned int) (c) - 0x80) < 0x20)


/************************************************************************/
/*                     Operations on individual bytes                   */
/*                       in a Mule-formatted string                     */
/************************************************************************/

/* Does this byte represent the first byte of a character? */

INLINE int
BUFBYTE_FIRST_BYTE_P(Bufbyte c)
{
  return (c <= 0x7f) || (0xc0 <= c);
}


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

#define CHARSET_TYPE_94    0	/* This charset includes 94    characters. */
#define CHARSET_TYPE_96    1	/* This charset includes 96    characters. */
#define CHARSET_TYPE_94X94 2	/* This charset includes 94x94 characters. */
#define CHARSET_TYPE_96X96 3	/* This charset includes 96x96 characters. */

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
#ifdef CHARSET_PRIVATE_P
#define XCHARSET_PRIVATE_P(cs)	  CHARSET_PRIVATE_P    (XCHARSET (cs))
#endif
#define XCHARSET_REVERSE_DIRECTION_CHARSET(cs) \
  CHARSET_REVERSE_DIRECTION_CHARSET (XCHARSET (cs))

/* Table of charsets indexed by (leading byte - 128). */
extern Lisp_Object charset_by_leading_byte[NUM_LEADING_BYTES];

/* Table of charsets indexed by type/final-byte/direction. */
extern Lisp_Object charset_by_attributes[4][128][2];

#ifdef ERROR_CHECK_TYPECHECK
/* int not Bufbyte even though that is the actual type of a leading byte.
   This way, out-ot-range values will get caught rather than automatically
   truncated. */
INLINE Lisp_Object CHARSET_BY_LEADING_BYTE (int lb);
INLINE Lisp_Object
CHARSET_BY_LEADING_BYTE (int lb)
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
  (charset_by_attributes[type][final][dir])

INLINE int REP_BYTES_BY_FIRST_BYTE (int fb);
INLINE int
REP_BYTES_BY_FIRST_BYTE (int fb)
{
  if ( fb < 0xc0 )
    return 1;
  else if ( fb < 0xe0 )
    return 2;
  else if ( fb < 0xf0 )
    return 3;
  else if ( fb < 0xf8 )
    return 4;
  else if ( fb < 0xfc )
    return 5;
  else
    return 6;
}


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

/* Is this character represented by more than one byte in a string? */

#define CHAR_MULTIBYTE_P(c) ((c) >= 0x80)

#define CHAR_ASCII_P(c) (!CHAR_MULTIBYTE_P (c))

/* The bit fields of character are divided into 3 parts:
   FIELD1(5bits):FIELD2(7bits):FIELD3(7bits) */

#define CHAR_FIELD1_MASK (0x7F << 14)
#define CHAR_FIELD2_MASK (0x7F << 7)
#define CHAR_FIELD3_MASK 0x7F

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

/* Macros to access each field of a character code of C.  */

#define CHAR_FIELD1(c) (((c) & CHAR_FIELD1_MASK) >> 14)
#define CHAR_FIELD2_INTERNAL(c) (((c) & CHAR_FIELD2_MASK) >> 7)
#define CHAR_FIELD3_INTERNAL(c)  ((c) & CHAR_FIELD3_MASK)

/* Field 1, if non-zero, usually holds a leading byte for a
   dimension-2 charset.  Field 2, if non-zero, usually holds a leading
   byte for a dimension-1 charset. */

/* Converting between field values and leading bytes.  */

#define FIELD1_TO_PRIVATE_LEADING_BYTE  0x80
#define FIELD1_TO_OFFICIAL_LEADING_BYTE 0x80
#define FIELD2_TO_PRIVATE_LEADING_BYTE  0xb0
#define FIELD2_TO_OFFICIAL_LEADING_BYTE 0x80

/* Minimum and maximum allowed values for the fields. */

#define MIN_CHAR_FIELD2_OFFICIAL \
  (MIN_LEADING_BYTE_OFFICIAL_1 - FIELD2_TO_OFFICIAL_LEADING_BYTE)
#define MAX_CHAR_FIELD2_OFFICIAL \
  (MAX_LEADING_BYTE_OFFICIAL_1 - FIELD2_TO_OFFICIAL_LEADING_BYTE)

#define MIN_CHAR_FIELD1_OFFICIAL \
  (MIN_LEADING_BYTE_OFFICIAL_2 - FIELD1_TO_OFFICIAL_LEADING_BYTE)
#define MAX_CHAR_FIELD1_OFFICIAL \
  (MAX_LEADING_BYTE_OFFICIAL_2 - FIELD1_TO_OFFICIAL_LEADING_BYTE)

#define MIN_CHAR_FIELD2_PRIVATE \
  (MIN_LEADING_BYTE_PRIVATE_1 - FIELD2_TO_PRIVATE_LEADING_BYTE)
#define MAX_CHAR_FIELD2_PRIVATE \
  (MAX_LEADING_BYTE_PRIVATE_1 - FIELD2_TO_PRIVATE_LEADING_BYTE)

#define MIN_CHAR_FIELD1_PRIVATE \
  (MIN_LEADING_BYTE_PRIVATE_2 - FIELD1_TO_PRIVATE_LEADING_BYTE)
#define MAX_CHAR_FIELD1_PRIVATE \
  (MAX_LEADING_BYTE_PRIVATE_2 - FIELD1_TO_PRIVATE_LEADING_BYTE)

/* Minimum character code of each <type> character.  */

#define MULE_CHAR_PRIVATE_OFFSET (0xe0 << 16)

#define MIN_CHAR_OFFICIAL_TYPE9N \
  (MULE_CHAR_PRIVATE_OFFSET | (MIN_CHAR_FIELD2_OFFICIAL <<  7))
#define MIN_CHAR_PRIVATE_TYPE9N \
  (MULE_CHAR_PRIVATE_OFFSET | (MIN_CHAR_FIELD2_PRIVATE  <<  7))
#define MIN_CHAR_PRIVATE_TYPE9NX9N \
  (MULE_CHAR_PRIVATE_OFFSET | (MIN_CHAR_FIELD1_PRIVATE  << 14))
#define MIN_CHAR_OFFICIAL_TYPE9NX9N \
  (MULE_CHAR_PRIVATE_OFFSET | (MIN_CHAR_FIELD1_OFFICIAL << 14))
#define MIN_CHAR_COMPOSITION \
  (MULE_CHAR_PRIVATE_OFFSET | (0x7f << 14))

/* Return a character whose charset is CHARSET and position-codes
   are C1 and C2.  TYPE9N character ignores C2.

   NOTE: This takes advantage of the fact that
   FIELD2_TO_OFFICIAL_LEADING_BYTE and
   FIELD2_TO_PRIVATE_LEADING_BYTE are the same.
   */

INLINE Emchar MAKE_CHAR (Lisp_Object charset, int c1, int c2);
INLINE Emchar
MAKE_CHAR (Lisp_Object charset, int c1, int c2)
{
  if (EQ (charset, Vcharset_ascii))
    return c1;
  else if (EQ (charset, Vcharset_control_1))
    return c1 | 0x80;
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
#ifdef ENABLE_COMPOSITE_CHARS
  else if (EQ (charset, Vcharset_composite))
    return (0x1F << 14) | ((c1) << 7) | (c2);
#endif
  else if (XCHARSET_DIMENSION (charset) == 1)
    return MULE_CHAR_PRIVATE_OFFSET
      | ((XCHARSET_LEADING_BYTE (charset) -
	  FIELD2_TO_OFFICIAL_LEADING_BYTE) << 7) | (c1);
  else
    return MULE_CHAR_PRIVATE_OFFSET
      | ((XCHARSET_LEADING_BYTE (charset) -
	  FIELD1_TO_PRIVATE_LEADING_BYTE) << 14) | ((c1) << 7) | (c2);
}

INLINE void breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2);
INLINE void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2)
{
  if (CHAR_ASCII_P (c))
    {
      *charset = Vcharset_ascii;
      *c1 = c;
      *c2 = 0;
    }
  else if (c < 0xA0)
    {
      *charset = Vcharset_control_1;
      *c1 = CHAR_FIELD3_INTERNAL (c);
      *c2 = 0;
    }
  else if (c <= 0xff)
    {
      *charset = Vcharset_latin_iso8859_1;
      *c1 = CHAR_FIELD3_INTERNAL (c);
      *c2 = 0;
    }
  else if (c < MIN_CHAR_GREEK)
    {
      abort ();
    }
  else if (c <= MAX_CHAR_GREEK)
    {
      *charset = Vcharset_greek_iso8859_7;
      *c1 = c - MIN_CHAR_GREEK + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_CYRILLIC)
    {
      abort ();
    }
  else if (c <= MAX_CHAR_CYRILLIC)
    {
      *charset = Vcharset_cyrillic_iso8859_5;
      *c1 = c - MIN_CHAR_CYRILLIC + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_HEBREW)
    {
      abort ();
    }
  else if (c <= MAX_CHAR_HEBREW)
    {
      *charset = Vcharset_hebrew_iso8859_8;
      *c1 = c - MIN_CHAR_HEBREW + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_THAI)
    {
      abort ();
    }
  else if (c <= MAX_CHAR_THAI)
    {
      *charset = Vcharset_thai_tis620;
      *c1 = c - MIN_CHAR_THAI + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_HALFWIDTH_KATAKANA)
    {
      abort ();
    }
  else if (c <= MAX_CHAR_HALFWIDTH_KATAKANA)
    {
      *charset = Vcharset_katakana_jisx0201;
      *c1 = c - MIN_CHAR_HALFWIDTH_KATAKANA + 0x20;
      *c2 = 0;
    }
  else if (c < MIN_CHAR_PRIVATE_TYPE9NX9N)
    {
      *charset
	= CHARSET_BY_LEADING_BYTE (CHAR_FIELD2_INTERNAL (c) +
				   FIELD2_TO_OFFICIAL_LEADING_BYTE);
      *c1 = CHAR_FIELD3_INTERNAL(c);
      *c2 = 0;
    }
  else if (c < MIN_CHAR_COMPOSITION)
    {
      *charset
	= CHARSET_BY_LEADING_BYTE (CHAR_FIELD1 (c) +
				   FIELD1_TO_OFFICIAL_LEADING_BYTE);
      *c1 = CHAR_FIELD2_INTERNAL(c);
      *c2 = CHAR_FIELD3_INTERNAL(c);
    }
  else
    {
#ifdef ENABLE_COMPOSITE_CHARS
      return LEADING_BYTE_COMPOSITE;
#else
      printf("u+%x", c);
      abort();
#endif /* ENABLE_COMPOSITE_CHARS */
    }
}

#define BREAKUP_CHAR(c, charset, c1, c2) \
  breakup_char_1 (c, &(charset), &(c1), &(c2))

INLINE Lisp_Object CHAR_CHARSET (Emchar c);
INLINE Lisp_Object
CHAR_CHARSET (Emchar c)
{
  Lisp_Object charset;
  int c1, c2;

  BREAKUP_CHAR(c, charset, c1, c2);
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

Emchar Lstream_get_emchar_1 (Lstream *stream, int first_char);
int Lstream_fput_emchar (Lstream *stream, Emchar ch);
void Lstream_funget_emchar (Lstream *stream, Emchar ch);

int copy_internal_to_external (CONST Bufbyte *internal, Bytecount len,
			       unsigned char *external);
Bytecount copy_external_to_internal (CONST unsigned char *external,
				     int len, Bufbyte *internal);

#endif /* CHAR_IS_UCS4 */
#endif /* _XEMACS_CHARACTER_H */
