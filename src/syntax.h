/* Declarations having to do with XEmacs syntax tables.
   Copyright (C) 1985, 1992, 1993 Free Software Foundation, Inc.
   Copyright (C) 2001 MORIOKA Tomohiko

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

/* Synched up with: FSF 19.28. */

#ifndef INCLUDED_syntax_h_
#define INCLUDED_syntax_h_

#include "chartab.h"

/* A syntax table is a type of char table.

The low 7 bits of the integer is a code, as follows. The 8th bit is
used as the prefix bit flag (see below).

The values in a syntax table are either integers or conses of
integers and chars.  The lowest 7 bits of the integer are the syntax
class.  If this is Sinherit, then the actual syntax value needs to
be retrieved from the standard syntax table.

Since the logic involved in finding the actual integer isn't very
complex, you'd think the time required to retrieve it is not a
factor.  If you thought that, however, you'd be wrong, due to the
high number of times (many per character) that the syntax value is
accessed in functions such as scan_lists().  To speed this up,
we maintain a mirror syntax table that contains the actual
integers.  We can do this successfully because syntax tables are
now an abstract type, where we control all access.
*/

/* The standard syntax table is stored where it will automatically
   be used in all new buffers.  */
extern Lisp_Object Vstandard_syntax_table;

enum syntaxcode
{
  Swhitespace,	/* whitespace character */
  Spunct,	/* random punctuation character */
  Sword,	/* word constituent */
  Ssymbol,	/* symbol constituent but not word constituent */
  Sopen,	/* a beginning delimiter */
  Sclose,	/* an ending delimiter */
  Squote,	/* a prefix character like Lisp ' */
  Sstring,	/* a string-grouping character like Lisp " */
  Smath,	/* delimiters like $ in TeX. */
  Sescape,	/* a character that begins a C-style escape */
  Scharquote,	/* a character that quotes the following character */
  Scomment,	/* a comment-starting character */
  Sendcomment,	/* a comment-ending character */
  Sinherit,	/* use the standard syntax table for this character */
  Scomment_fence, /* Starts/ends comment which is delimited on the
		     other side by a char with the same syntaxcode.  */
  Sstring_fence,  /* Starts/ends string which is delimited on the
		     other side by a char with the same syntaxcode.  */
  Smax	 /* Upper bound on codes that are meaningful */
};

enum syntaxcode charset_syntax (struct buffer *buf, Lisp_Object charset,
				int *multi_p_out);

/* Return the syntax code for a particular character and mirror table. */

#ifdef UTF2000
INLINE_HEADER int SYNTAX_CODE_UNSAFE (Lisp_Char_Table *table, Emchar c);
INLINE_HEADER int
SYNTAX_CODE_UNSAFE (Lisp_Char_Table *table, Emchar c)
{
  int code = CHAR_TABLE_VALUE_UNSAFE (table, c);
  int ret = Spunct;

  if (CONSP (code))
    code = XCAR (code);
  ret = XINT (code);

  if (ret == Sinherit)
    {
      code = CHAR_TABLE_VALUE_UNSAFE (XCHAR_TABLE
				      (Vstandard_syntax_table), c);
      if (CONSP (code))
	code = XCAR (code);
      return XINT (code);
    }
  else
    return ret;
}
#else
#define SYNTAX_CODE_UNSAFE(table, c) \
   XINT (CHAR_TABLE_VALUE_UNSAFE (table, c))
#endif

INLINE_HEADER int SYNTAX_CODE (Lisp_Char_Table *table, Emchar c);
INLINE_HEADER int
SYNTAX_CODE (Lisp_Char_Table *table, Emchar c)
{
  return SYNTAX_CODE_UNSAFE (table, c);
}

#define SYNTAX_UNSAFE(table, c) \
  ((enum syntaxcode) (SYNTAX_CODE_UNSAFE (table, c) & 0177))

#define SYNTAX_FROM_CODE(code) ((enum syntaxcode) ((code) & 0177))
#define SYNTAX(table, c) SYNTAX_FROM_CODE (SYNTAX_CODE (table, c))

INLINE_HEADER int WORD_SYNTAX_P (Lisp_Char_Table *table, Emchar c);
INLINE_HEADER int
WORD_SYNTAX_P (Lisp_Char_Table *table, Emchar c)
{
  return SYNTAX (table, c) == Sword;
}

/* OK, here's a graphic diagram of the format of the syntax values:

   Bit number:

 [ 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 ]
 [ 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 ]

   <-----> <-----> <-------------> <-------------> ^  <----------->
    ELisp  unused  |comment bits |     unused      |   syntax code
     tag           | | | | | | | |                 |
    stuff          | | | | | | | |                 |
                   | | | | | | | |                 |
                   | | | | | | | |                 `--> prefix flag
                   | | | | | | | |
                   | | | | | | | `--> comment end style B, second char
                   | | | | | | `----> comment end style A, second char
                   | | | | | `------> comment end style B, first char
                   | | | | `--------> comment end style A, first char
                   | | | `----------> comment start style B, second char
                   | | `------------> comment start style A, second char
                   | `--------------> comment start style B, first char
                   `----------------> comment start style A, first char

  In a 64-bit integer, there would be 32 more unused bits between
  the tag and the comment bits.

  Clearly, such a scheme will not work for Mule, because the matching
  paren could be any character and as such requires 19 bits, which
  we don't got.

  Remember that under Mule we use char tables instead of vectors.
  So what we do is use another char table for the matching paren
  and store a pointer to it in the first char table. (This frees
  code from having to worry about passing two tables around.)
*/


/* The prefix flag bit for backward-prefix-chars is now put into bit 7. */

#define SYNTAX_PREFIX_UNSAFE(table, c) \
  ((SYNTAX_CODE_UNSAFE (table, c) >> 7) & 1)
#define SYNTAX_PREFIX(table, c) \
  ((SYNTAX_CODE (table, c) >> 7) & 1)

/* Bits 23-16 are used to implement up to two comment styles
   in a single buffer. They have the following meanings:

  1. first of a one or two character comment-start sequence of style a.
  2. first of a one or two character comment-start sequence of style b.
  3. second of a two-character comment-start sequence of style a.
  4. second of a two-character comment-start sequence of style b.
  5. first of a one or two character comment-end sequence of style a.
  6. first of a one or two character comment-end sequence of style b.
  7. second of a two-character comment-end sequence of style a.
  8. second of a two-character comment-end sequence of style b.
 */

#define SYNTAX_COMMENT_BITS(table, c) \
  ((SYNTAX_CODE (table, c) >> 16) &0xff)

#define SYNTAX_FIRST_OF_START_A  0x80
#define SYNTAX_FIRST_OF_START_B  0x40
#define SYNTAX_SECOND_OF_START_A 0x20
#define SYNTAX_SECOND_OF_START_B 0x10
#define SYNTAX_FIRST_OF_END_A    0x08
#define SYNTAX_FIRST_OF_END_B    0x04
#define SYNTAX_SECOND_OF_END_A   0x02
#define SYNTAX_SECOND_OF_END_B   0x01

#define SYNTAX_COMMENT_STYLE_A   0xaa
#define SYNTAX_COMMENT_STYLE_B   0x55
#define SYNTAX_FIRST_CHAR_START  0xc0
#define SYNTAX_FIRST_CHAR_END    0x0c
#define SYNTAX_FIRST_CHAR        0xcc
#define SYNTAX_SECOND_CHAR_START 0x30
#define SYNTAX_SECOND_CHAR_END   0x03
#define SYNTAX_SECOND_CHAR       0x33


/* #### These are now more or less equivalent to
   SYNTAX_COMMENT_MATCH_START ...*/
/* a and b must be first and second start chars for a common type */
#define SYNTAX_START_P(table, a, b)                                     \
  (((SYNTAX_COMMENT_BITS (table, a) & SYNTAX_FIRST_CHAR_START) >> 2)    \
   & (SYNTAX_COMMENT_BITS (table, b) & SYNTAX_SECOND_CHAR_START))

/* ... and  SYNTAX_COMMENT_MATCH_END */
/* a and b must be first and second end chars for a common type */
#define SYNTAX_END_P(table, a, b)                                       \
  (((SYNTAX_COMMENT_BITS (table, a) & SYNTAX_FIRST_CHAR_END) >> 2)      \
   & (SYNTAX_COMMENT_BITS (table, b) & SYNTAX_SECOND_CHAR_END))

#define SYNTAX_STYLES_MATCH_START_P(table, a, b, mask)			    \
  ((SYNTAX_COMMENT_BITS (table, a) & SYNTAX_FIRST_CHAR_START & (mask))	    \
   && (SYNTAX_COMMENT_BITS (table, b) & SYNTAX_SECOND_CHAR_START & (mask)))

#define SYNTAX_STYLES_MATCH_END_P(table, a, b, mask)			  \
  ((SYNTAX_COMMENT_BITS (table, a) & SYNTAX_FIRST_CHAR_END & (mask))	  \
   && (SYNTAX_COMMENT_BITS (table, b) & SYNTAX_SECOND_CHAR_END & (mask)))

#define SYNTAX_STYLES_MATCH_1CHAR_P(table, a, mask)	\
  ((SYNTAX_COMMENT_BITS (table, a) & (mask)))

#define STYLE_FOUND_P(table, a, b, startp, style)	\
  ((SYNTAX_COMMENT_BITS (table, a) &			\
    ((startp) ? SYNTAX_FIRST_CHAR_START :		\
     SYNTAX_FIRST_CHAR_END) & (style))			\
   && (SYNTAX_COMMENT_BITS (table, b) &			\
    ((startp) ? SYNTAX_SECOND_CHAR_START : 		\
     SYNTAX_SECOND_CHAR_END) & (style)))

#define SYNTAX_COMMENT_MASK_START(table, a, b)			\
  ((STYLE_FOUND_P (table, a, b, 1, SYNTAX_COMMENT_STYLE_A)	\
    ? SYNTAX_COMMENT_STYLE_A					\
    : (STYLE_FOUND_P (table, a, b, 1, SYNTAX_COMMENT_STYLE_B)	\
         ? SYNTAX_COMMENT_STYLE_B				\
	 : 0)))

#define SYNTAX_COMMENT_MASK_END(table, a, b)			\
  ((STYLE_FOUND_P (table, a, b, 0, SYNTAX_COMMENT_STYLE_A)	\
   ? SYNTAX_COMMENT_STYLE_A					\
   : (STYLE_FOUND_P (table, a, b, 0, SYNTAX_COMMENT_STYLE_B)	\
      ? SYNTAX_COMMENT_STYLE_B					\
      : 0)))

#define STYLE_FOUND_1CHAR_P(table, a, style)	\
  ((SYNTAX_COMMENT_BITS (table, a) & (style)))

#define SYNTAX_COMMENT_1CHAR_MASK(table, a)			\
  ((STYLE_FOUND_1CHAR_P (table, a, SYNTAX_COMMENT_STYLE_A)	\
   ? SYNTAX_COMMENT_STYLE_A					\
   : (STYLE_FOUND_1CHAR_P (table, a, SYNTAX_COMMENT_STYLE_B)	\
      ? SYNTAX_COMMENT_STYLE_B					\
	 : 0)))

EXFUN (Fchar_syntax, 2);
EXFUN (Fforward_word, 2);

/* This array, indexed by a character, contains the syntax code which
   that character signifies (as a char).
   For example, (enum syntaxcode) syntax_spec_code['w'] is Sword. */

extern const unsigned char syntax_spec_code[0400];

/* Indexed by syntax code, give the letter that describes it. */

extern const unsigned char syntax_code_spec[];

Lisp_Object scan_lists (struct buffer *buf, Bufpos from, int count,
			int depth, int sexpflag, int no_error);
int char_quoted (struct buffer *buf, Bufpos pos);

/* NOTE: This does not refer to the mirror table, but to the
   syntax table itself. */
Lisp_Object syntax_match (Lisp_Object table, Emchar ch);

extern int no_quit_in_re_search;
extern struct buffer *regex_emacs_buffer;

/* This is the string or buffer in which we are matching.  It is used
   for looking up syntax properties.  */
extern Lisp_Object regex_match_object;

#ifndef UTF2000
void update_syntax_table (Lisp_Char_Table *ct);
#endif

#ifdef emacs

extern int lookup_syntax_properties;

struct syntax_cache
{
  int use_code;				/* Whether to use syntax_code
					   or current_syntax_table. */
  struct buffer* buffer;		/* The buffer the current syntax cache
					   applies to. */
  Lisp_Object object;			/* The buffer or string the current
					   syntax cache applies to. */
  int syntax_code;			/* Syntax code of current char. */
  Lisp_Object current_syntax_table;	/* Syntax table for current pos. */
  Lisp_Object old_prop;			/* Syntax-table prop at prev pos. */

  Bufpos next_change;			/* Position of the next extent
                                           change. */
  Bufpos prev_change;			/* Position of the previous
                                           extent change. */
};
extern struct syntax_cache syntax_cache;

void update_syntax_cache (int pos, int count, int init);

/* Make syntax cache state good for CHARPOS, assuming it is
   currently good for a position before CHARPOS.  */
#define UPDATE_SYNTAX_CACHE_FORWARD(pos)	\
   (lookup_syntax_properties			\
    ? (update_syntax_cache ((pos), 1, 0), 1)	\
    : 0)

/* Make syntax cache state good for CHARPOS, assuming it is
   currently good for a position after CHARPOS.  */
#define UPDATE_SYNTAX_CACHE_BACKWARD(pos)	\
   (lookup_syntax_properties			\
    ? (update_syntax_cache ((pos), -1, 0), 1)	\
    : 0)

/* Make syntax cache state good for CHARPOS */
#define UPDATE_SYNTAX_CACHE(pos)		\
   (lookup_syntax_properties			\
    ? (update_syntax_cache ((pos), 0, 0), 1)	\
    : 0)

#define SYNTAX_FROM_CACHE(table, c)			\
   SYNTAX_FROM_CODE (SYNTAX_CODE_FROM_CACHE (table, c))

#define SYNTAX_CODE_FROM_CACHE(table, c)				\
  ( syntax_cache.use_code						\
      ? syntax_cache.syntax_code					\
      : SYNTAX_CODE (XCHAR_TABLE (syntax_cache.current_syntax_table),	\
		     c)							\
 )

/* Convert the byte offset BYTEPOS into a character position,
   for the object recorded in syntax_cache with SETUP_SYNTAX_TABLE_FOR_OBJECT.

   The value is meant for use in the UPDATE_SYNTAX_TABLE... macros.
   These macros do nothing when parse_sexp_lookup_properties is 0,
   so we return 0 in that case, for speed.  */
#define SYNTAX_CACHE_BYTE_TO_CHAR(bytepos)					\
  (! lookup_syntax_properties							\
   ? 0										\
   : STRINGP (syntax_cache.object)						\
   ? bytecount_to_charcount (XSTRING_DATA (syntax_cache.object), bytepos)	\
   : (BUFFERP (syntax_cache.object) || NILP (syntax_cache.object))		\
   ? bytind_to_bufpos (syntax_cache.buffer,					\
		       bytepos + BI_BUF_BEGV (syntax_cache.buffer))		\
   : (bytepos))

#define SYNTAX_CACHE_OBJECT_BYTE_TO_CHAR(obj, buf, bytepos)	\
  (! lookup_syntax_properties					\
   ? 0								\
   : STRINGP (obj)						\
   ? bytecount_to_charcount (XSTRING_DATA (obj), bytepos)	\
   : (BUFFERP (obj) || NILP (obj))				\
   ? bytind_to_bufpos (buf, bytepos + BI_BUF_BEGV (buf))	\
   : (bytepos))

#else  /* not emacs */

#define update_syntax_cache(pos, count, init)
#define UPDATE_SYNTAX_CACHE_FORWARD(pos)
#define UPDATE_SYNTAX_CACHE_BACKWARD(pos)
#define UPDATE_SYNTAX_CACHE(pos)
#define SYNTAX_FROM_CACHE SYNTAX
#define SYNTAX_CODE_FROM_CACHE SYNTAX_CODE

#endif /* emacs */

#ifdef UTF2000
#define SETUP_SYNTAX_CACHE(FROM, COUNT)				\
  do {								\
    syntax_cache.buffer = current_buffer;			\
    syntax_cache.object = Qnil;					\
    syntax_cache.current_syntax_table				\
      = current_buffer->syntax_table;				\
    syntax_cache.use_code = 0;					\
    if (lookup_syntax_properties)				\
      update_syntax_cache ((COUNT) > 0 ? (FROM) : (FROM) - 1,	\
			   (COUNT), 1);				\
  } while (0)
#else
#define SETUP_SYNTAX_CACHE(FROM, COUNT)				\
  do {								\
    syntax_cache.buffer = current_buffer;			\
    syntax_cache.object = Qnil;					\
    syntax_cache.current_syntax_table				\
      = current_buffer->mirror_syntax_table;			\
    syntax_cache.use_code = 0;					\
    if (lookup_syntax_properties)				\
      update_syntax_cache ((COUNT) > 0 ? (FROM) : (FROM) - 1,	\
			   (COUNT), 1);				\
  } while (0)
#endif

#ifdef UTF2000
#define SETUP_SYNTAX_CACHE_FOR_BUFFER(BUFFER, FROM, COUNT)	\
  do {								\
    syntax_cache.buffer = (BUFFER);				\
    syntax_cache.object = Qnil;					\
    syntax_cache.current_syntax_table =				\
      syntax_cache.buffer->syntax_table;			\
    syntax_cache.use_code = 0;					\
    if (lookup_syntax_properties)				\
      update_syntax_cache ((FROM) + ((COUNT) > 0 ? 0 : -1),	\
			   (COUNT), 1);				\
  } while (0)
#else
#define SETUP_SYNTAX_CACHE_FOR_BUFFER(BUFFER, FROM, COUNT)	\
  do {								\
    syntax_cache.buffer = (BUFFER);				\
    syntax_cache.object = Qnil;					\
    syntax_cache.current_syntax_table =				\
      syntax_cache.buffer->mirror_syntax_table;			\
    syntax_cache.use_code = 0;					\
    if (lookup_syntax_properties)				\
      update_syntax_cache ((FROM) + ((COUNT) > 0 ? 0 : -1),	\
			   (COUNT), 1);				\
  } while (0)
#endif

#ifdef UTF2000
#define SETUP_SYNTAX_CACHE_FOR_OBJECT(OBJECT, BUFFER, FROM, COUNT)	\
  do {									\
    syntax_cache.buffer = (BUFFER);					\
    syntax_cache.object = (OBJECT);					\
    if (NILP (syntax_cache.object))					\
      {									\
        /* do nothing */;						\
      }									\
    else if (EQ (syntax_cache.object, Qt))				\
      {									\
        /* do nothing */;						\
      }									\
    else if (STRINGP (syntax_cache.object))				\
      {									\
        /* do nothing */;						\
      }									\
    else if (BUFFERP (syntax_cache.object))				\
      {									\
        syntax_cache.buffer = XBUFFER (syntax_cache.object);		\
      }									\
    else								\
      {									\
        /* OBJECT must be buffer/string/t/nil */			\
        assert(0);							\
      }									\
    syntax_cache.current_syntax_table					\
      = syntax_cache.buffer->syntax_table;				\
    syntax_cache.use_code = 0;						\
    if (lookup_syntax_properties)					\
      update_syntax_cache ((FROM) + ((COUNT) > 0 ? 0 : -1),		\
			   (COUNT), 1);					\
  } while (0)
#else
#define SETUP_SYNTAX_CACHE_FOR_OBJECT(OBJECT, BUFFER, FROM, COUNT)	\
  do {									\
    syntax_cache.buffer = (BUFFER);					\
    syntax_cache.object = (OBJECT);					\
    if (NILP (syntax_cache.object))					\
      {									\
        /* do nothing */;						\
      }									\
    else if (EQ (syntax_cache.object, Qt))				\
      {									\
        /* do nothing */;						\
      }									\
    else if (STRINGP (syntax_cache.object))				\
      {									\
        /* do nothing */;						\
      }									\
    else if (BUFFERP (syntax_cache.object))				\
      {									\
        syntax_cache.buffer = XBUFFER (syntax_cache.object);		\
      }									\
    else								\
      {									\
        /* OBJECT must be buffer/string/t/nil */			\
        assert(0);							\
      }									\
    syntax_cache.current_syntax_table					\
      = syntax_cache.buffer->mirror_syntax_table;			\
    syntax_cache.use_code = 0;						\
    if (lookup_syntax_properties)					\
      update_syntax_cache ((FROM) + ((COUNT) > 0 ? 0 : -1),		\
			   (COUNT), 1);					\
  } while (0)
#endif

#define SYNTAX_CODE_PREFIX(c) \
  ((c >> 7) & 1)

#define SYNTAX_CODE_COMMENT_BITS(c) \
  ((c >> 16) &0xff)

#define SYNTAX_CODES_START_P(a, b)                                    \
  (((SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_FIRST_CHAR_START) >> 2)    \
   & (SYNTAX_CODE_COMMENT_BITS (b) & SYNTAX_SECOND_CHAR_START))

#define SYNTAX_CODES_END_P(a, b)                                    \
  (((SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_FIRST_CHAR_END) >> 2)    \
   & (SYNTAX_CODE_COMMENT_BITS (b) & SYNTAX_SECOND_CHAR_END))

#define SYNTAX_CODES_COMMENT_MASK_START(a, b)			\
  (SYNTAX_CODES_MATCH_START_P (a, b, SYNTAX_COMMENT_STYLE_A) 	\
   ? SYNTAX_COMMENT_STYLE_A					\
   : (SYNTAX_CODES_MATCH_START_P (a, b, SYNTAX_COMMENT_STYLE_B)	\
      ? SYNTAX_COMMENT_STYLE_B					\
      : 0))
#define SYNTAX_CODES_COMMENT_MASK_END(a, b)			\
  (SYNTAX_CODES_MATCH_END_P (a, b, SYNTAX_COMMENT_STYLE_A) 	\
   ? SYNTAX_COMMENT_STYLE_A					\
   : (SYNTAX_CODES_MATCH_END_P (a, b, SYNTAX_COMMENT_STYLE_B)	\
      ? SYNTAX_COMMENT_STYLE_B					\
      : 0))

#define SYNTAX_CODE_START_FIRST_P(a) \
  (SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_FIRST_CHAR_START)

#define SYNTAX_CODE_START_SECOND_P(a) \
  (SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_SECOND_CHAR_START)

#define SYNTAX_CODE_END_FIRST_P(a) \
  (SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_FIRST_CHAR_END)

#define SYNTAX_CODE_END_SECOND_P(a) \
  (SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_SECOND_CHAR_END)


#define SYNTAX_CODES_MATCH_START_P(a, b, mask)				\
  ((SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_FIRST_CHAR_START & (mask))	\
   && (SYNTAX_CODE_COMMENT_BITS (b)					\
       & SYNTAX_SECOND_CHAR_START & (mask)))

#define SYNTAX_CODES_MATCH_END_P(a, b, mask)				\
  ((SYNTAX_CODE_COMMENT_BITS (a) & SYNTAX_FIRST_CHAR_END & (mask))	\
   && (SYNTAX_CODE_COMMENT_BITS (b) & SYNTAX_SECOND_CHAR_END & (mask)))

#define SYNTAX_CODE_MATCHES_1CHAR_P(a, mask)	\
  ((SYNTAX_CODE_COMMENT_BITS (a) & (mask)))

#define SYNTAX_CODE_COMMENT_1CHAR_MASK(a)			\
  ((SYNTAX_CODE_MATCHES_1CHAR_P (a, SYNTAX_COMMENT_STYLE_A)	\
    ? SYNTAX_COMMENT_STYLE_A					\
    : (SYNTAX_CODE_MATCHES_1CHAR_P (a, SYNTAX_COMMENT_STYLE_B)	\
       ? SYNTAX_COMMENT_STYLE_B					\
       : 0)))


#endif /* INCLUDED_syntax_h_ */
