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
#ifdef ENABLE_COMPOSITE_CHARS
#endif
#define LEADING_BYTE_COMPOSITE		0x80 /* for a composite character */
#define LEADING_BYTE_CONTROL_1		0x8F /* represent normal 80-9F */

/* Note the gap in each official charset can cause core dump
   as first and last values are used to determine whether
   charset is defined or not in non_ascii_valid_char_p */

/** The following are for 1-byte characters in an official charset. **/
enum LEADING_BYTE_OFFICIAL_1
{
  LEADING_BYTE_LATIN_ISO8859_1 = 0x81, /* Right half of ISO 8859-1 */
  LEADING_BYTE_LATIN_ISO8859_2,   /* 0x82 Right half of ISO 8859-2 */
  LEADING_BYTE_LATIN_ISO8859_3,   /* 0x83 Right half of ISO 8859-3 */
  LEADING_BYTE_LATIN_ISO8859_4,   /* 0x84 Right half of ISO 8859-4 */
  LEADING_BYTE_THAI_TIS620,       /* 0x85 TIS620-2533 */
  LEADING_BYTE_GREEK_ISO8859_7,   /* 0x86 Right half of ISO 8859-7 */
  LEADING_BYTE_ARABIC_ISO8859_6,  /* 0x87 Right half of ISO 8859-6 */
  LEADING_BYTE_HEBREW_ISO8859_8,  /* 0x88 Right half of ISO 8859-8 */
  LEADING_BYTE_KATAKANA_JISX0201, /* 0x89 Right half of JIS X0201-1976 */
  LEADING_BYTE_LATIN_JISX0201,    /* 0x8A Left  half of JIS X0201-1976 */
  LEADING_BYTE_CYRILLIC_ISO8859_5,/* 0x8B Right half of ISO 8859-5 */
  LEADING_BYTE_LATIN_ISO8859_9    /* 0x8C Right half of ISO 8859-9 */
                                  /* 0x8D unused */
};

#define MIN_LEADING_BYTE_OFFICIAL_1	LEADING_BYTE_LATIN_ISO8859_1
#define MAX_LEADING_BYTE_OFFICIAL_1	LEADING_BYTE_LATIN_ISO8859_9

/** The following are for 2-byte characters in an official charset. **/
enum LEADING_BYTE_OFFICIAL_2
{
  LEADING_BYTE_JAPANESE_JISX0208_1978 = 0x90, /* Japanese JIS X0208-1978 */
  LEADING_BYTE_CHINESE_GB2312,           /* 0x91 Chinese Hanzi GB2312-1980 */
  LEADING_BYTE_JAPANESE_JISX0208,        /* 0x92 Japanese JIS X0208-1983 */
  LEADING_BYTE_KOREAN_KSC5601,           /* 0x93 Hangul KS C5601-1987 */
  LEADING_BYTE_JAPANESE_JISX0212,        /* 0x94 Japanese JIS X0212-1990 */
  LEADING_BYTE_CHINESE_CCITT_GB,	 /* 0x95 CCITT Extended GB */
  LEADING_BYTE_CHINESE_BIG5_1,           /* 0x96 Big5 Level 1 */
  LEADING_BYTE_CHINESE_CNS11643_1,       /* 0x97 Chinese CNS11643 Set 1 */
  LEADING_BYTE_CHINESE_CNS11643_2,       /* 0x98 Chinese CNS11643 Set 2 */
  LEADING_BYTE_CHINESE_CNS11643_3,	 /* 0x99 Chinese CNS11643 Set 3 */
  LEADING_BYTE_CHINESE_CNS11643_4,	 /* 0x9A Chinese CNS11643 Set 4 */
  LEADING_BYTE_CHINESE_CNS11643_5,	 /* 0x9B Chinese CNS11643 Set 5 */
  LEADING_BYTE_CHINESE_CNS11643_6,	 /* 0x9C Chinese CNS11643 Set 6 */
  LEADING_BYTE_CHINESE_CNS11643_7,	 /* 0x9D Chinese CNS11643 Set 7 */
  LEADING_BYTE_CHINESE_BIG5_2,           /* 0x9D Big5 Level 2 */
  LEADING_BYTE_KOREAN_KPS9566		 /* 0x9E DPRK Hangul KPS 9566-1997 */
                                         /* 0x99 unused */
                                         /* 0x9A unused */
                                         /* 0x9B unused */
                                         /* 0x9C unused */
};

#define MIN_LEADING_BYTE_OFFICIAL_2	LEADING_BYTE_JAPANESE_JISX0208_1978
#define MAX_LEADING_BYTE_OFFICIAL_2	LEADING_BYTE_CHINESE_BIG5_2

/** The following are for 1- and 2-byte characters in a private charset. **/

#define PRE_LEADING_BYTE_PRIVATE_1	0x9E	/* 1-byte char-set */
#define PRE_LEADING_BYTE_PRIVATE_2	0x9F	/* 2-byte char-set */

#define MIN_LEADING_BYTE_PRIVATE_1	0xA0
#define MAX_LEADING_BYTE_PRIVATE_1	0xEF
#define MIN_LEADING_BYTE_PRIVATE_2	0xF0
#define MAX_LEADING_BYTE_PRIVATE_2	0xFF

#define NUM_LEADING_BYTES 128


/************************************************************************/
/*                    Operations on leading bytes                       */
/************************************************************************/

/* Is this leading byte for a private charset? */

#define LEADING_BYTE_PRIVATE_P(lb) ((lb) >= MIN_LEADING_BYTE_PRIVATE_1)

/* Is this a prefix for a private leading byte? */

INLINE_HEADER int LEADING_BYTE_PREFIX_P (Bufbyte lb);
INLINE_HEADER int
LEADING_BYTE_PREFIX_P (Bufbyte lb)
{
  return (lb == PRE_LEADING_BYTE_PRIVATE_1 ||
	  lb == PRE_LEADING_BYTE_PRIVATE_2);
}

/* Given a private leading byte, return the leading byte prefix stored
   in a string. */

#define PRIVATE_LEADING_BYTE_PREFIX(lb)	\
  ((unsigned int) (lb) < MIN_LEADING_BYTE_PRIVATE_2 ?	\
   PRE_LEADING_BYTE_PRIVATE_1 :		\
   PRE_LEADING_BYTE_PRIVATE_2)


/************************************************************************/
/*                     Operations on individual bytes                   */
/*                             of any format                            */
/************************************************************************/

/* These are carefully designed to work if BYTE is signed or unsigned. */
/* Note that SPC and DEL are considered ASCII, not control. */

#define BYTE_ASCII_P(byte) (((byte) & ~0x7f) == 0)
#define BYTE_C0_P(byte)    (((byte) & ~0x1f) == 0)
#define BYTE_C1_P(byte)    (((byte) & ~0x1f) == 0x80)


/************************************************************************/
/*                     Operations on individual bytes                   */
/*                       in a Mule-formatted string                     */
/************************************************************************/

/* Does BYTE represent the first byte of a character? */

#ifdef UTF2000
INLINE_HEADER int BUFBYTE_FIRST_BYTE_P (Bufbyte byte);
INLINE_HEADER int
BUFBYTE_FIRST_BYTE_P (Bufbyte byte)
{
  return (byte <= 0x7f) || (0xc0 <= byte);
}
#else
#define BUFBYTE_FIRST_BYTE_P(byte) ((byte) < 0xA0)
#endif

/* Does BYTE represent the first byte of a multi-byte character? */

#define BUFBYTE_LEADING_BYTE_P(byte) BYTE_C1_P (byte)


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
typedef struct Lisp_Charset Lisp_Charset;

DECLARE_LRECORD (charset, Lisp_Charset);
#define XCHARSET(x) XRECORD (x, charset, Lisp_Charset)
#define XSETCHARSET(x, p) XSETRECORD (x, p, charset)
#define CHARSETP(x) RECORDP (x, charset)
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
#define CHARSET_LEADING_BYTE(cs) ((Bufbyte) CHARSET_ID(cs))
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


#define CHARSET_PRIVATE_P(cs) LEADING_BYTE_PRIVATE_P (CHARSET_LEADING_BYTE (cs))

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
#define XCHARSET_PRIVATE_P(cs)	  CHARSET_PRIVATE_P    (XCHARSET (cs))
#define XCHARSET_REVERSE_DIRECTION_CHARSET(cs) \
  CHARSET_REVERSE_DIRECTION_CHARSET (XCHARSET (cs))

struct charset_lookup {
  /* Table of charsets indexed by leading byte. */
  Lisp_Object charset_by_leading_byte[NUM_LEADING_BYTES];

  /* Table of charsets indexed by type/final-byte/direction. */
  Lisp_Object charset_by_attributes[4][128][2];
  Bufbyte next_allocated_1_byte_leading_byte;
  Bufbyte next_allocated_2_byte_leading_byte;
};

INLINE_HEADER Lisp_Object CHARSET_BY_LEADING_BYTE (Bufbyte lb);
INLINE_HEADER Lisp_Object
CHARSET_BY_LEADING_BYTE (Bufbyte lb)
{
  extern struct charset_lookup *chlook;

#ifdef ERROR_CHECK_TYPECHECK
  /* When error-checking is on, x86 GCC 2.95.2 -O3 miscompiles the
     following unless we introduce `tem'. */
  int tem = lb;
  type_checking_assert (tem >= MIN_LEADING_BYTE &&
			tem <= (MIN_LEADING_BYTE + NUM_LEADING_BYTES));
#endif
  return chlook->charset_by_leading_byte[lb - 128];
}

INLINE_HEADER Lisp_Object
CHARSET_BY_ATTRIBUTES (unsigned int type, unsigned char final, int dir);
INLINE_HEADER Lisp_Object
CHARSET_BY_ATTRIBUTES (unsigned int type, unsigned char final, int dir)
{
  extern struct charset_lookup *chlook;

  type_checking_assert (type  < countof (chlook->charset_by_attributes) &&
			final < countof (chlook->charset_by_attributes[0]) &&
			dir   < countof (chlook->charset_by_attributes[0][0]));
  return chlook->charset_by_attributes[type][final][dir];
}

/* Table of number of bytes in the string representation of a character
   indexed by the first byte of that representation.

   This value can be derived in other ways -- e.g. something like
   XCHARSET_REP_BYTES (CHARSET_BY_LEADING_BYTE (first_byte))
   but it's faster this way. */
extern const Bytecount rep_bytes_by_first_byte[0xA0];

/* Number of bytes in the string representation of a character. */
#ifdef UTF2000
INLINE_HEADER int REP_BYTES_BY_FIRST_BYTE (int fb);
INLINE_HEADER int
REP_BYTES_BY_FIRST_BYTE (int fb)
{
  if ( fb >= 0xfc )
    return 6;
  else if ( fb >= 0xf8 )
    return 5;
  else if ( fb >= 0xf0 )
    return 4;
  else if ( fb >= 0xe0 )
    return 3;
  else if ( fb >= 0xc0 )
    return 2;
  else
    return 1;
}
#else /* MULE */
INLINE_HEADER int REP_BYTES_BY_FIRST_BYTE (int fb);
INLINE_HEADER int
REP_BYTES_BY_FIRST_BYTE (int fb)
{
  type_checking_assert (fb < 0xA0);
  return rep_bytes_by_first_byte[fb];
}
#endif


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

#define FIELD2_TO_OFFICIAL_LEADING_BYTE 0x80
#define FIELD2_TO_PRIVATE_LEADING_BYTE  0x80

#define FIELD1_TO_PRIVATE_LEADING_BYTE  0xc0
#define FIELD1_TO_OFFICIAL_LEADING_BYTE 0x50

INLINE_HEADER Emchar CHAR_FIELD2 (Emchar c);
INLINE_HEADER Emchar
CHAR_FIELD2 (Emchar c)
{
  if( (MIN_CHAR_GREEK <= c) && (c <= MAX_CHAR_GREEK) )
    return LEADING_BYTE_GREEK_ISO8859_7
      - FIELD2_TO_OFFICIAL_LEADING_BYTE;
  else if( (MIN_CHAR_CYRILLIC <= c) && (c <= MAX_CHAR_CYRILLIC) )
    return LEADING_BYTE_CYRILLIC_ISO8859_5
      - FIELD2_TO_OFFICIAL_LEADING_BYTE;
  else if( (MIN_CHAR_HEBREW <= c) && (c <= MAX_CHAR_HEBREW) )
    return LEADING_BYTE_HEBREW_ISO8859_8
      - FIELD2_TO_OFFICIAL_LEADING_BYTE;
  else if( (MIN_CHAR_THAI <= c) && (c <= MAX_CHAR_THAI) )
    return LEADING_BYTE_THAI_TIS620
      - FIELD2_TO_OFFICIAL_LEADING_BYTE;
  else if( (MIN_CHAR_HALFWIDTH_KATAKANA <= c)
	   && (c <= MAX_CHAR_HALFWIDTH_KATAKANA) )
    return LEADING_BYTE_KATAKANA_JISX0201
      - FIELD2_TO_OFFICIAL_LEADING_BYTE;
  else
    return CHAR_FIELD2_INTERNAL(c);
}

INLINE_HEADER Emchar CHAR_FIELD3 (Emchar c);
INLINE_HEADER Emchar
CHAR_FIELD3 (Emchar c)
{
  if( (MIN_CHAR_GREEK <= c) && (c <= MAX_CHAR_GREEK) )
    return c - MIN_CHAR_GREEK + 0x20;
  else if( (MIN_CHAR_CYRILLIC <= c) && (c <= MAX_CHAR_CYRILLIC) )
    return c - MIN_CHAR_CYRILLIC + 0x20;
  else if( (MIN_CHAR_HEBREW <= c) && (c <= MAX_CHAR_HEBREW) )
    return c - MIN_CHAR_HEBREW + 0x20;
  else if( (MIN_CHAR_THAI <= c) && (c <= MAX_CHAR_THAI) )
    return c - MIN_CHAR_THAI + 0x20;
  else if( (MIN_CHAR_HALFWIDTH_KATAKANA <= c)
	   && (c <= MAX_CHAR_HALFWIDTH_KATAKANA) )
    return c - MIN_CHAR_HALFWIDTH_KATAKANA + 0x20;
  else
    return CHAR_FIELD3_INTERNAL(c);
}

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

/* Leading byte of a character.

   NOTE: This takes advantage of the fact that
   FIELD2_TO_OFFICIAL_LEADING_BYTE and
   FIELD2_TO_PRIVATE_LEADING_BYTE are the same.
   */

INLINE_HEADER Bufbyte CHAR_LEADING_BYTE (Emchar c);
INLINE_HEADER Bufbyte
CHAR_LEADING_BYTE (Emchar c)
{
  if (CHAR_ASCII_P (c))
    return LEADING_BYTE_ASCII;
  else if (c < 0xA0)
    return LEADING_BYTE_CONTROL_1;
  else if (c <= 0xff)
    return LEADING_BYTE_LATIN_ISO8859_1;
  else if (c <= MAX_CHAR_GREEK)
    return LEADING_BYTE_GREEK_ISO8859_7;
  else if (c <= MAX_CHAR_CYRILLIC)
    return LEADING_BYTE_CYRILLIC_ISO8859_5;
  else if (c <= MAX_CHAR_HEBREW)
    return LEADING_BYTE_HEBREW_ISO8859_8;
  else if (c <= MAX_CHAR_THAI)
    return LEADING_BYTE_THAI_TIS620;
  else if (c <= MAX_CHAR_HALFWIDTH_KATAKANA)
    return LEADING_BYTE_KATAKANA_JISX0201;
  else if (c < MIN_CHAR_PRIVATE_TYPE9NX9N)
    return CHAR_FIELD2 (c) + FIELD2_TO_OFFICIAL_LEADING_BYTE;
  else if (c < MIN_CHAR_OFFICIAL_TYPE9NX9N)
    return CHAR_FIELD1 (c) + FIELD1_TO_PRIVATE_LEADING_BYTE;
  else if (c < MIN_CHAR_COMPOSITION)
    return CHAR_FIELD1 (c) + FIELD1_TO_OFFICIAL_LEADING_BYTE;
  else
    {
#ifdef ENABLE_COMPOSITE_CHARS
      return LEADING_BYTE_COMPOSITE;
#else
      abort();
      return 0;
#endif /* ENABLE_COMPOSITE_CHARS */
    }
}

#define CHAR_CHARSET(c) CHARSET_BY_LEADING_BYTE (CHAR_LEADING_BYTE (c))

/* Return a character whose charset is CHARSET and position-codes
   are C1 and C2.  TYPE9N character ignores C2.

   NOTE: This takes advantage of the fact that
   FIELD2_TO_OFFICIAL_LEADING_BYTE and
   FIELD2_TO_PRIVATE_LEADING_BYTE are the same.
   */

INLINE_HEADER Emchar MAKE_CHAR (Lisp_Object charset, int c1, int c2);
INLINE_HEADER Emchar
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
  else if (!XCHARSET_PRIVATE_P (charset))
    return MULE_CHAR_PRIVATE_OFFSET
      | ((XCHARSET_LEADING_BYTE (charset) -
	  FIELD1_TO_OFFICIAL_LEADING_BYTE) << 14) | ((c1) << 7) | (c2);
  else
    return MULE_CHAR_PRIVATE_OFFSET
      | ((XCHARSET_LEADING_BYTE (charset) -
	  FIELD1_TO_PRIVATE_LEADING_BYTE) << 14) | ((c1) << 7) | (c2);
}

/* The charset of character C is set to CHARSET, and the
   position-codes of C are set to C1 and C2.  C2 of TYPE9N character
   is 0.  */

/* BREAKUP_CHAR_1_UNSAFE assumes that the charset has already been
   calculated, and just computes c1 and c2.

   BREAKUP_CHAR also computes and stores the charset. */

#define BREAKUP_CHAR_1_UNSAFE(c, charset, c1, c2)	\
  XCHARSET_DIMENSION (charset) == 1			\
  ? ((c1) = CHAR_FIELD3 (c), (c2) = 0)			\
  : ((c1) = CHAR_FIELD2 (c),				\
     (c2) = CHAR_FIELD3 (c))

INLINE_HEADER void breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2);
INLINE_HEADER void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2)
{
  *charset = CHAR_CHARSET (c);
  BREAKUP_CHAR_1_UNSAFE (c, *charset, *c1, *c2);
}

#define BREAKUP_CHAR(c, charset, c1, c2) \
  breakup_char_1 (c, &(charset), &(c1), &(c2))



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

#endif /* CHAR_IS_UCS4 */
#endif /* _XEMACS_CHARACTER_H */
