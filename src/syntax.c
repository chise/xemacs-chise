/* XEmacs routines to deal with syntax tables; also word and list parsing.
   Copyright (C) 1985-1994 Free Software Foundation, Inc.
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

/* Synched up with: FSF 19.28. */

/* This file has been Mule-ized. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "syntax.h"

/* Here is a comment from Ken'ichi HANDA <handa@etl.go.jp>
   explaining the purpose of the Sextword syntax category:

Japanese words are not separated by spaces, which makes finding word
boundaries very difficult.  Theoretically it's impossible without
using natural language processing techniques.  But, by defining
pseudo-words as below (much simplified for letting you understand it
easily) for Japanese, we can have a convenient forward-word function
for Japanese.

	A Japanese word is a sequence of characters that consists of
	zero or more Kanji characters followed by zero or more
	Hiragana characters.

Then, the problem is that now we can't say that a sequence of
word-constituents makes up a WORD.  For instance, both Hiragana "A"
and Kanji "KAN" are word-constituents but the sequence of these two
letters can't be a single word.

So, we introduced Sextword for Japanese letters.  A character of
Sextword is a word-constituent but a word boundary may exist between
two such characters.  */

/* Mule 2.4 doesn't seem to have Sextword - I'm removing it -- mrb */
/* Recovered by tomo */

Lisp_Object Qsyntax_table_p;

int words_include_escapes;

int parse_sexp_ignore_comments;

/* The following two variables are provided to tell additional information
   to the regex routines.  We do it this way rather than change the
   arguments to re_search_2() in an attempt to maintain some call
   compatibility with other versions of the regex code. */

/* Tell the regex routines not to QUIT.  Normally there is a QUIT
   each iteration in re_search_2(). */
int no_quit_in_re_search;

/* Tell the regex routines which buffer to access for SYNTAX() lookups
   and the like. */
struct buffer *regex_emacs_buffer;

Lisp_Object Vstandard_syntax_table;

Lisp_Object Vsyntax_designator_chars_string;

/* This is the internal form of the parse state used in parse-partial-sexp.  */

struct lisp_parse_state
{
  int depth;		/* Depth at end of parsing */
  Emchar instring;	/* -1 if not within string, else desired terminator */
  int incomment;	/* Nonzero if within a comment at end of parsing */
  int comstyle;		/* comment style a=0, or b=1 */
  int quoted;		/* Nonzero if just after an escape char at end of
			   parsing */
  Bufpos thislevelstart;/* Char number of most recent start-of-expression
                           at current level */
  Bufpos prevlevelstart;/* Char number of start of containing expression */
  Bufpos location;	/* Char number at which parsing stopped */
  int mindepth;		/* Minimum depth seen while scanning  */
  Bufpos comstart;	/* Position just after last comment starter  */
};

/* These variables are a cache for finding the start of a defun.
   find_start_pos    is the place for which the defun start was found.
   find_start_value  is the defun start position found for it.
   find_start_buffer is the buffer it was found in.
   find_start_begv   is the BEGV value when it was found.
   find_start_modiff is the value of MODIFF when it was found.  */

static Bufpos find_start_pos;
static Bufpos find_start_value;
static struct buffer *find_start_buffer;
static Bufpos find_start_begv;
static int find_start_modiff;

/* Find a defun-start that is the last one before POS (or nearly the last).
   We record what we find, so that another call in the same area
   can return the same value right away.  */

static Bufpos
find_defun_start (struct buffer *buf, Bufpos pos)
{
  Bufpos tem;
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  /* Use previous finding, if it's valid and applies to this inquiry.  */
  if (buf == find_start_buffer
      /* Reuse the defun-start even if POS is a little farther on.
	 POS might be in the next defun, but that's ok.
	 Our value may not be the best possible, but will still be usable.  */
      && pos <= find_start_pos + 1000
      && pos >= find_start_value
      && BUF_BEGV (buf) == find_start_begv
      && BUF_MODIFF (buf) == find_start_modiff)
    return find_start_value;

  /* Back up to start of line.  */
  tem = find_next_newline (buf, pos, -1);

  while (tem > BUF_BEGV (buf))
    {
      /* Open-paren at start of line means we found our defun-start.  */
      if (SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, tem)) == Sopen)
	break;
      /* Move to beg of previous line.  */
      tem = find_next_newline (buf, tem, -2);
    }

  /* Record what we found, for the next try.  */
  find_start_value  = tem;
  find_start_buffer = buf;
  find_start_modiff = BUF_MODIFF (buf);
  find_start_begv   = BUF_BEGV (buf);
  find_start_pos    = pos;

  return find_start_value;
}

DEFUN ("syntax-table-p", Fsyntax_table_p, 1, 1, 0, /*
Return t if ARG is a syntax table.
Any vector of 256 elements will do.
*/
       (obj))
{
  return CHAR_TABLEP (obj) && XCHAR_TABLE_TYPE (obj) == CHAR_TABLE_TYPE_SYNTAX
    ? Qt : Qnil;
}

static Lisp_Object
check_syntax_table (Lisp_Object obj, Lisp_Object default_)
{
  if (NILP (obj))
    obj = default_;
  while (NILP (Fsyntax_table_p (obj)))
    obj = wrong_type_argument (Qsyntax_table_p, obj);
  return obj;
}

DEFUN ("syntax-table", Fsyntax_table, 0, 1, 0, /*
Return the current syntax table.
This is the one specified by the current buffer, or by BUFFER if it
is non-nil.
*/
       (buffer))
{
  return decode_buffer (buffer, 0)->syntax_table;
}

DEFUN ("standard-syntax-table", Fstandard_syntax_table, 0, 0, 0, /*
Return the standard syntax table.
This is the one used for new buffers.
*/
       ())
{
  return Vstandard_syntax_table;
}

DEFUN ("copy-syntax-table", Fcopy_syntax_table, 0, 1, 0, /*
Construct a new syntax table and return it.
It is a copy of the TABLE, which defaults to the standard syntax table.
*/
       (table))
{
  if (NILP (Vstandard_syntax_table))
    return Fmake_char_table (Qsyntax);

  table = check_syntax_table (table, Vstandard_syntax_table);
  return Fcopy_char_table (table);
}

DEFUN ("set-syntax-table", Fset_syntax_table, 1, 2, 0, /*
Select a new syntax table for BUFFER.
One argument, a syntax table.
BUFFER defaults to the current buffer if omitted.
*/
       (table, buffer))
{
  struct buffer *buf = decode_buffer (buffer, 0);
  table = check_syntax_table (table, Qnil);
  buf->syntax_table = table;
  buf->mirror_syntax_table = XCHAR_TABLE (table)->mirror_table;
  /* Indicate that this buffer now has a specified syntax table.  */
  buf->local_var_flags |= XINT (buffer_local_flags.syntax_table);
  return table;
}

/* Convert a letter which signifies a syntax code
   into the code it signifies.
   This is used by modify-syntax-entry, and other things. */

const unsigned char syntax_spec_code[0400] =
{ 0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  (char) Swhitespace, 0377, (char) Sstring, 0377,
      (char) Smath, 0377, 0377, (char) Squote,
  (char) Sopen, (char) Sclose, 0377, 0377,
	0377, (char) Swhitespace, (char) Spunct, (char) Scharquote,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  0377, 0377, 0377, 0377,
	(char) Scomment, 0377, (char) Sendcomment, 0377,
  (char) Sinherit, 0377, 0377, 0377, 0377, 0377, 0377, 0377,   /* @, A ... */
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, (char) Sword,
  0377, 0377, 0377, 0377, (char) Sescape, 0377, 0377, (char) Ssymbol,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,   /* `, a, ... */
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, (char) Sword,
  0377, 0377, 0377, 0377, 0377, 0377, 0377, 0377
};

const unsigned char syntax_code_spec[] =  " .w_()'\"$\\/<>@";

DEFUN ("syntax-designator-chars", Fsyntax_designator_chars, 0, 0, 0, /*
Return a string of the recognized syntax designator chars.
The chars are ordered by their internal syntax codes, which are
numbered starting at 0.
*/
       ())
{
  return Vsyntax_designator_chars_string;
}

DEFUN ("char-syntax", Fchar_syntax, 1, 2, 0, /*
Return the syntax code of CHAR, described by a character.
For example, if CHAR is a word constituent, the character `?w' is returned.
The characters that correspond to various syntax codes
are listed in the documentation of `modify-syntax-entry'.
Optional second argument TABLE defaults to the current buffer's
syntax table.
*/
       (ch, table))
{
  Lisp_Char_Table *mirrortab;

  if (NILP(ch))
    {
      ch = make_char('\000');
    }
  CHECK_CHAR_COERCE_INT (ch);
  table = check_syntax_table (table, current_buffer->syntax_table);
  mirrortab = XCHAR_TABLE (XCHAR_TABLE (table)->mirror_table);
  return make_char (syntax_code_spec[(int) SYNTAX (mirrortab, XCHAR (ch))]);
}

#ifdef MULE

enum syntaxcode
charset_syntax (struct buffer *buf, Lisp_Object charset, int *multi_p_out)
{
  *multi_p_out = 1;
  /* #### get this right */
  return Spunct;
}

#endif

Lisp_Object
syntax_match (Lisp_Object table, Emchar ch)
{
  Lisp_Object code = XCHAR_TABLE_VALUE_UNSAFE (table, ch);
  Lisp_Object code2 = code;

  if (CONSP (code))
    code2 = XCAR (code);
  if (SYNTAX_FROM_CODE (XINT (code2)) == Sinherit)
    code = XCHAR_TABLE_VALUE_UNSAFE (Vstandard_syntax_table, ch);

  return CONSP (code) ? XCDR (code) : Qnil;
}

DEFUN ("matching-paren", Fmatching_paren, 1, 2, 0, /*
Return the matching parenthesis of CHAR, or nil if none.
Optional second argument TABLE defaults to the current buffer's
syntax table.
*/
       (ch, table))
{
  Lisp_Char_Table *mirrortab;
  int code;

  CHECK_CHAR_COERCE_INT (ch);
  table = check_syntax_table (table, current_buffer->syntax_table);
  mirrortab = XCHAR_TABLE (XCHAR_TABLE (table)->mirror_table);
  code = SYNTAX (mirrortab, XCHAR (ch));
  if (code == Sopen || code == Sclose || code == Sstring)
    return syntax_match (table, XCHAR (ch));
  return Qnil;
}



#ifdef MULE
/* Return 1 if there is a word boundary between two word-constituent
   characters C1 and C2 if they appear in this order, else return 0.
   There is no word boundary between two word-constituent ASCII
   characters.  */
#define WORD_BOUNDARY_P(c1, c2)			\
  (!(CHAR_ASCII_P (c1) && CHAR_ASCII_P (c2))	\
   && word_boundary_p (c1, c2))

extern int word_boundary_p (Emchar c1, Emchar c2);
#endif

/* Return the position across COUNT words from FROM.
   If that many words cannot be found before the end of the buffer, return 0.
   COUNT negative means scan backward and stop at word beginning.  */

Bufpos
scan_words (struct buffer *buf, Bufpos from, int count)
{
  Bufpos limit = count > 0 ? BUF_ZV (buf) : BUF_BEGV (buf);
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);
  Emchar ch0, ch1;
  enum syntaxcode code;

  /* #### is it really worth it to hand expand both cases? JV */
  while (count > 0)
    {
      QUIT;

      while (1)
	{
	  if (from == limit)
	    return 0;

	  ch0 = BUF_FETCH_CHAR (buf, from);
	  code = SYNTAX_UNSAFE (mirrortab, ch0);

	  from++;
	  if (words_include_escapes
	      && (code == Sescape || code == Scharquote))
	    break;
	  if (code == Sword)
	    break;
	}

      QUIT;

      while (from != limit)
	{
	  ch1 = BUF_FETCH_CHAR (buf, from);
	  code = SYNTAX_UNSAFE (mirrortab, ch1);
	  if (!(words_include_escapes
		&& (code == Sescape || code == Scharquote)))
	    if (code != Sword
#ifdef MULE
		|| WORD_BOUNDARY_P (ch0, ch1)
#endif
		)
	      break;
#ifdef MULE
	  ch0 = ch1;
#endif
	  from++;
	}
      count--;
    }

  while (count < 0)
    {
      QUIT;

      while (1)
	{
	  if (from == limit)
	    return 0;

	  ch1 = BUF_FETCH_CHAR (buf, from - 1);
	  code = SYNTAX_UNSAFE (mirrortab, ch1);

	  from--;
	  if (words_include_escapes
	      && (code == Sescape || code == Scharquote))
	    break;
	  if (code == Sword)
	    break;
	}

      QUIT;

      while (from != limit)
	{
	  ch0 = BUF_FETCH_CHAR (buf, from - 1);
	  code = SYNTAX_UNSAFE (mirrortab, ch0);
	  if (!(words_include_escapes
		&& (code == Sescape || code == Scharquote)))
	    if (code != Sword
#ifdef MULE
		|| WORD_BOUNDARY_P (ch0, ch1)
#endif
		)
	      break;
#ifdef MULE
	  ch1 = ch0;
#endif
	  from--;
	}
      count++;
    }

  return from;
}

DEFUN ("forward-word", Fforward_word, 1, 2, "_p", /*
Move point forward COUNT words (backward if COUNT is negative).
Normally returns t.
If an edge of the buffer is reached, point is left there
and nil is returned.

Optional argument BUFFER defaults to the current buffer.
*/
       (count, buffer))
{
  Bufpos val;
  struct buffer *buf = decode_buffer (buffer, 0);
  CHECK_INT (count);

  if (!(val = scan_words (buf, BUF_PT (buf), XINT (count))))
    {
      BUF_SET_PT (buf, XINT (count) > 0 ? BUF_ZV (buf) : BUF_BEGV (buf));
      return Qnil;
    }
  BUF_SET_PT (buf, val);
  return Qt;
}

static void scan_sexps_forward (struct buffer *buf,
				struct lisp_parse_state *,
				Bufpos from, Bufpos end,
				int targetdepth, int stopbefore,
				Lisp_Object oldstate,
				int commentstop);

static int
find_start_of_comment (struct buffer *buf, Bufpos from, Bufpos stop, int mask)
{
  Emchar c;
  enum syntaxcode code;
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  /* Look back, counting the parity of string-quotes,
     and recording the comment-starters seen.
     When we reach a safe place, assume that's not in a string;
     then step the main scan to the earliest comment-starter seen
     an even number of string quotes away from the safe place.

     OFROM[I] is position of the earliest comment-starter seen
     which is I+2X quotes from the comment-end.
     PARITY is current parity of quotes from the comment end.  */
  int parity = 0;
  Emchar my_stringend = 0;
  int string_lossage = 0;
  Bufpos comment_end = from;
  Bufpos comstart_pos = 0;
  int comstart_parity = 0;
  int styles_match_p = 0;

  /* At beginning of range to scan, we're outside of strings;
     that determines quote parity to the comment-end.  */
  while (from != stop)
    {
      /* Move back and examine a character.  */
      from--;

      c = BUF_FETCH_CHAR (buf, from);
      code = SYNTAX_UNSAFE (mirrortab, c);

      /* is this a 1-char comment end sequence? if so, try
	 to see if style matches previously extracted mask */
      if (code == Sendcomment)
	{
	  styles_match_p = SYNTAX_STYLES_MATCH_1CHAR_P (mirrortab, c, mask);
	}

      /* otherwise, is this a 2-char comment end sequence? */
      else if (from >= stop
	       && SYNTAX_END_P (mirrortab, c, BUF_FETCH_CHAR (buf, from+1)))
	{
	  code = Sendcomment;
	  styles_match_p =
	    SYNTAX_STYLES_MATCH_END_P (mirrortab, c,
				       BUF_FETCH_CHAR (buf, from+1),
				       mask);
	}

      /* or are we looking at a 1-char comment start sequence
	 of the style matching mask? */
      else if (code == Scomment
	       && SYNTAX_STYLES_MATCH_1CHAR_P (mirrortab, c, mask))
	{
	  styles_match_p = 1;
	}

      /* or possibly, a 2-char comment start sequence */
      else if (from >= stop
	       && SYNTAX_STYLES_MATCH_START_P (mirrortab, c,
					       BUF_FETCH_CHAR (buf, from+1),
					       mask))
	{
	  code = Scomment;
	  styles_match_p = 1;
	}

      /* Ignore escaped characters.  */
      if (char_quoted (buf, from))
	continue;

      /* Track parity of quotes.  */
      if (code == Sstring)
	{
	  parity ^= 1;
	  if (my_stringend == 0)
	    my_stringend = c;
	  /* If we have two kinds of string delimiters.
	     There's no way to grok this scanning backwards.  */
	  else if (my_stringend != c)
	    string_lossage = 1;
	}

      /* Record comment-starters according to that
	 quote-parity to the comment-end.  */
      if (code == Scomment && styles_match_p)
	{
	  comstart_parity = parity;
	  comstart_pos = from;
	}

      /* If we find another earlier comment-ender,
	 any comment-starts earlier than that don't count
	 (because they go with the earlier comment-ender).  */
      if (code == Sendcomment && styles_match_p)
	break;

      /* Assume a defun-start point is outside of strings.  */
      if (code == Sopen
	  && (from == stop || BUF_FETCH_CHAR (buf, from - 1) == '\n'))
	break;
    }

  if (comstart_pos == 0)
    from = comment_end;
  /* If the earliest comment starter
     is followed by uniform paired string quotes or none,
     we know it can't be inside a string
     since if it were then the comment ender would be inside one.
     So it does start a comment.  Skip back to it.  */
  else if (comstart_parity == 0 && !string_lossage)
    from = comstart_pos;
  else
    {
      /* We had two kinds of string delimiters mixed up
	 together.  Decode this going forwards.
	 Scan fwd from the previous comment ender
	 to the one in question; this records where we
	 last passed a comment starter.  */

      struct lisp_parse_state state;
      scan_sexps_forward (buf, &state, find_defun_start (buf, comment_end),
			  comment_end - 1, -10000, 0, Qnil, 0);
      if (state.incomment)
	from = state.comstart;
      else
	/* We can't grok this as a comment; scan it normally.  */
	from = comment_end;
    }
  return from;
}

static Bufpos
find_end_of_comment (struct buffer *buf, Bufpos from, Bufpos stop, int mask)
{
  int c;
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  while (1)
    {
      if (from == stop)
	{
	  return -1;
	}
      c = BUF_FETCH_CHAR (buf, from);
      if (SYNTAX_UNSAFE (mirrortab, c) == Sendcomment
	  && SYNTAX_STYLES_MATCH_1CHAR_P (mirrortab, c, mask))
	/* we have encountered a comment end of the same style
	   as the comment sequence which began this comment
	   section */
	break;

      from++;
      if (from < stop
	  && SYNTAX_STYLES_MATCH_END_P (mirrortab, c,
					BUF_FETCH_CHAR (buf, from), mask))
	/* we have encountered a comment end of the same style
	   as the comment sequence which began this comment
	   section */
	{ from++; break; }
    }
  return from;
}


/* #### between FSF 19.23 and 19.28 there are some changes to the logic
   in this function (and minor changes to find_start_of_comment(),
   above, which is part of Fforward_comment() in FSF).  Attempts to port
   that logic made this function break, so I'm leaving it out.  If anyone
   ever complains about this function not working properly, take a look
   at those changes.  --ben */

DEFUN ("forward-comment", Fforward_comment, 1, 2, 0, /*
Move forward across up to N comments.  If N is negative, move backward.
Stop scanning if we find something other than a comment or whitespace.
Set point to where scanning stops.
If N comments are found as expected, with nothing except whitespace
between them, return t; otherwise return nil.
Point is set in either case.
Optional argument BUFFER defaults to the current buffer.
*/
       (n, buffer))
{
  Bufpos from;
  Bufpos stop;
  Emchar c;
  enum syntaxcode code;
  EMACS_INT count;
  struct buffer *buf = decode_buffer (buffer, 0);
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  CHECK_INT (n);
  count = XINT (n);

  from = BUF_PT (buf);

  while (count > 0)
    {
      QUIT;

      stop = BUF_ZV (buf);
      while (from < stop)
	{
	  int mask = 0;         /* mask for finding matching comment style */

	  if (char_quoted (buf, from))
	    {
	      from++;
	      continue;
	    }

	  c = BUF_FETCH_CHAR (buf, from);
	  code = SYNTAX (mirrortab, c);

	  if (code == Scomment)
	    {
	      /* we have encountered a single character comment start
		 sequence, and we are ignoring all text inside comments.
		 we must record the comment style this character begins
		 so that later, only a comment end of the same style actually
		 ends the comment section */
	      mask = SYNTAX_COMMENT_1CHAR_MASK (mirrortab, c);
	    }

	  else if (from < stop
		   && SYNTAX_START_P (mirrortab, c, BUF_FETCH_CHAR (buf, from+1)))
	    {
	      /* we have encountered a 2char comment start sequence and we
		 are ignoring all text inside comments. we must record
		 the comment style this sequence begins so that later,
		 only a comment end of the same style actually ends
		 the comment section */
	      code = Scomment;
	      mask = SYNTAX_COMMENT_MASK_START (mirrortab, c,
						BUF_FETCH_CHAR (buf, from+1));
	      from++;
	    }

	  if (code == Scomment)
	    {
	      Bufpos newfrom;

	      newfrom = find_end_of_comment (buf, from, stop, mask);
	      if (newfrom < 0)
		{
		  /* we stopped because from==stop */
		  BUF_SET_PT (buf, stop);
		  return Qnil;
		}
	      from = newfrom;

	      /* We have skipped one comment.  */
	      break;
	    }
	  else if (code != Swhitespace
		   && code != Sendcomment
		   && code != Scomment )
	    {
	      BUF_SET_PT (buf, from);
	      return Qnil;
	    }
	  from++;
	}

      /* End of comment reached */
      count--;
    }

  while (count < 0)
    {
      QUIT;

      stop = BUF_BEGV (buf);
      while (from > stop)
	{
          int mask = 0;         /* mask for finding matching comment style */

	  from--;
	  if (char_quoted (buf, from))
	    {
	      from--;
	      continue;
	    }

	  c = BUF_FETCH_CHAR (buf, from);
	  code = SYNTAX (mirrortab, c);

	  if (code == Sendcomment)
	    {
	      /* we have found a single char end comment. we must record
		 the comment style encountered so that later, we can match
		 only the proper comment begin sequence of the same style */
	      mask = SYNTAX_COMMENT_1CHAR_MASK (mirrortab, c);
	    }

	  else if (from > stop
		   && SYNTAX_END_P (mirrortab, BUF_FETCH_CHAR (buf, from - 1), c)
		   && !char_quoted (buf, from - 1))
	    {
	      /* We must record the comment style encountered so that
		 later, we can match only the proper comment begin
		 sequence of the same style.  */
	      code = Sendcomment;
	      mask = SYNTAX_COMMENT_MASK_END (mirrortab,
					      BUF_FETCH_CHAR (buf, from - 1),
					      c);
	      from--;
	    }

	  if (code == Sendcomment)
 	    {
 	      from = find_start_of_comment (buf, from, stop, mask);
 	      break;
            }

	  else if (code != Swhitespace
		   && SYNTAX (mirrortab, c) != Scomment
		   && SYNTAX (mirrortab, c) != Sendcomment)
	    {
	      BUF_SET_PT (buf, from + 1);
	      return Qnil;
	    }
	}

      count++;
    }

  BUF_SET_PT (buf, from);
  return Qt;
}


Lisp_Object
scan_lists (struct buffer *buf, Bufpos from, int count, int depth,
	    int sexpflag, int no_error)
{
  Bufpos stop;
  Emchar c;
  int quoted;
  int mathexit = 0;
  enum syntaxcode code;
  int min_depth = depth;    /* Err out if depth gets less than this. */
  Lisp_Object syntaxtab = buf->syntax_table;
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  if (depth > 0) min_depth = 0;

  while (count > 0)
    {
      QUIT;

      stop = BUF_ZV (buf);
      while (from < stop)
	{
          int mask = 0;         /* mask for finding matching comment style */

	  c = BUF_FETCH_CHAR (buf, from);
	  code = SYNTAX_UNSAFE (mirrortab, c);
	  from++;

	  /* a 1-char comment start sequence */
	  if (code == Scomment && parse_sexp_ignore_comments)
	    {
	      mask = SYNTAX_COMMENT_1CHAR_MASK (mirrortab, c);
	    }

	  /* else, a 2-char comment start sequence? */
	  else if (from < stop
		   && SYNTAX_START_P (mirrortab, c, BUF_FETCH_CHAR (buf, from))
		   && parse_sexp_ignore_comments)
	    {
	      /* we have encountered a comment start sequence and we
		 are ignoring all text inside comments. we must record
		 the comment style this sequence begins so that later,
		 only a comment end of the same style actually ends
		 the comment section */
	      code = Scomment;
	      mask = SYNTAX_COMMENT_MASK_START (mirrortab, c,
						BUF_FETCH_CHAR (buf, from));
	      from++;
	    }

	  if (SYNTAX_PREFIX_UNSAFE (mirrortab, c))
	    continue;

	  switch (code)
	    {
	    case Sescape:
	    case Scharquote:
	      if (from == stop) goto lose;
	      from++;
	      /* treat following character as a word constituent */
	    case Sword:
	    case Ssymbol:
	      if (depth || !sexpflag) break;
	      /* This word counts as a sexp; return at end of it. */
	      while (from < stop)
		{
		  switch (SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, from)))
		    {
		    case Scharquote:
		    case Sescape:
		      from++;
		      if (from == stop) goto lose;
		      break;
		    case Sword:
		    case Ssymbol:
		    case Squote:
		      break;
		    default:
		      goto done;
		    }
		  from++;
		}
	      goto done;

	    case Scomment:
	      if (!parse_sexp_ignore_comments)
		break;
	      {
		Bufpos newfrom = find_end_of_comment (buf, from, stop, mask);
		if (newfrom < 0)
		  {
		    /* we stopped because from == stop in search forward */
		    from = stop;
		    if (depth == 0)
		      goto done;
		    goto lose;
		  }
		from = newfrom;
	      }
	      break;

	    case Smath:
	      if (!sexpflag)
		break;
	      if (from != stop && c == BUF_FETCH_CHAR (buf, from))
		from++;
	      if (mathexit)
		{
		  mathexit = 0;
		  goto close1;
		}
	      mathexit = 1;

	    case Sopen:
	      if (!++depth) goto done;
	      break;

	    case Sclose:
	    close1:
	    if (!--depth) goto done;
	    if (depth < min_depth)
	      {
		if (no_error)
		  return Qnil;
		error ("Containing expression ends prematurely");
	      }
	    break;

	    case Sstring:
              {
		/* XEmacs change: call syntax_match on character */
                Emchar ch = BUF_FETCH_CHAR (buf, from - 1);
		Lisp_Object stermobj = syntax_match (syntaxtab, ch);
		Emchar stringterm;

		if (CHARP (stermobj))
		  stringterm = XCHAR (stermobj);
		else
		  stringterm = ch;

                while (1)
		  {
		    if (from >= stop)
		      goto lose;
		    if (BUF_FETCH_CHAR (buf, from) == stringterm)
		      break;
		    switch (SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, from)))
		      {
		      case Scharquote:
		      case Sescape:
			from++;
			break;
		      default:
			break;
		      }
		    from++;
		  }
                from++;
                if (!depth && sexpflag) goto done;
                break;
              }

            default:
              break;
	    }
	}

      /* Reached end of buffer.  Error if within object,
	 return nil if between */
      if (depth) goto lose;

      return Qnil;

      /* End of object reached */
    done:
      count--;
    }

  while (count < 0)
    {
      QUIT;

      stop = BUF_BEGV (buf);
      while (from > stop)
	{
          int mask = 0;         /* mask for finding matching comment style */

	  from--;
          quoted = char_quoted (buf, from);
	  if (quoted)
	    from--;

	  c = BUF_FETCH_CHAR (buf, from);
	  code = SYNTAX_UNSAFE (mirrortab, c);

	  if (code == Sendcomment && parse_sexp_ignore_comments)
	    {
	      /* we have found a single char end comment. we must record
		 the comment style encountered so that later, we can match
		 only the proper comment begin sequence of the same style */
	      mask = SYNTAX_COMMENT_1CHAR_MASK (mirrortab, c);
	    }

	  else if (from > stop
		   && SYNTAX_END_P (mirrortab, BUF_FETCH_CHAR (buf, from-1), c)
		   && !char_quoted (buf, from - 1)
		   && parse_sexp_ignore_comments)
	    {
	      /* we must record the comment style encountered so that
		 later, we can match only the proper comment begin
		 sequence of the same style */
	      code = Sendcomment;
	      mask = SYNTAX_COMMENT_MASK_END (mirrortab,
					      BUF_FETCH_CHAR (buf, from - 1),
					      c);
	      from--;
	    }

	  if (SYNTAX_PREFIX_UNSAFE (mirrortab, c))
	    continue;

	  switch (quoted ? Sword : code)
	    {
	    case Sword:
	    case Ssymbol:
	      if (depth || !sexpflag) break;
	      /* This word counts as a sexp; count object finished after
		 passing it. */
	      while (from > stop)
		{
		  enum syntaxcode syncode;
		  quoted = char_quoted (buf, from - 1);

		  if (quoted)
		    from--;
		  if (! (quoted
                         || (syncode =
			     SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, from - 1)))
			 == Sword
			 || syncode == Ssymbol
			 || syncode == Squote))
            	    goto done2;
		  from--;
		}
	      goto done2;

	    case Smath:
	      if (!sexpflag)
		break;
	      if (from != stop && c == BUF_FETCH_CHAR (buf, from - 1))
		from--;
	      if (mathexit)
		{
		  mathexit = 0;
		  goto open2;
		}
	      mathexit = 1;

	    case Sclose:
	      if (!++depth) goto done2;
	      break;

	    case Sopen:
	    open2:
	    if (!--depth) goto done2;
	    if (depth < min_depth)
	      {
		if (no_error)
		  return Qnil;
		error ("Containing expression ends prematurely");
	      }
	    break;

	    case Sendcomment:
	      if (parse_sexp_ignore_comments)
		from = find_start_of_comment (buf, from, stop, mask);
	      break;

	    case Sstring:
              {
		/* XEmacs change: call syntax_match() on character */
                Emchar ch = BUF_FETCH_CHAR (buf, from);
		Lisp_Object stermobj = syntax_match (syntaxtab, ch);
		Emchar stringterm;

		if (CHARP (stermobj))
		  stringterm = XCHAR (stermobj);
		else
		  stringterm = ch;

                while (1)
		  {
		    if (from == stop) goto lose;
		    if (!char_quoted (buf, from - 1)
			&& stringterm == BUF_FETCH_CHAR (buf, from - 1))
		      break;
		    from--;
		  }
                from--;
                if (!depth && sexpflag) goto done2;
                break;
              }
            }
	}

      /* Reached start of buffer.  Error if within object,
	 return nil if between */
      if (depth) goto lose;

      return Qnil;

    done2:
      count++;
    }


  return (make_int (from));

lose:
  if (!no_error)
    error ("Unbalanced parentheses");
  return Qnil;
}

int
char_quoted (struct buffer *buf, Bufpos pos)
{
  enum syntaxcode code;
  Bufpos beg = BUF_BEGV (buf);
  int quoted = 0;
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  while (pos > beg
	 && ((code = SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, pos - 1)))
	     == Scharquote
	     || code == Sescape))
    pos--, quoted = !quoted;
  return quoted;
}

DEFUN ("scan-lists", Fscan_lists, 3, 5, 0, /*
Scan from character number FROM by COUNT lists.
Returns the character number of the position thus found.

If DEPTH is nonzero, paren depth begins counting from that value,
only places where the depth in parentheses becomes zero
are candidates for stopping; COUNT such places are counted.
Thus, a positive value for DEPTH means go out levels.

Comments are ignored if `parse-sexp-ignore-comments' is non-nil.

If the beginning or end of (the accessible part of) the buffer is reached
and the depth is wrong, an error is signaled.
If the depth is right but the count is not used up, nil is returned.

If optional arg BUFFER is non-nil, scanning occurs in that buffer instead
of in the current buffer.

If optional arg NOERROR is non-nil, scan-lists will return nil instead of
signalling an error.
*/
       (from, count, depth, buffer, no_error))
{
  struct buffer *buf;

  CHECK_INT (from);
  CHECK_INT (count);
  CHECK_INT (depth);
  buf = decode_buffer (buffer, 0);

  return scan_lists (buf, XINT (from), XINT (count), XINT (depth), 0,
		     !NILP (no_error));
}

DEFUN ("scan-sexps", Fscan_sexps, 2, 4, 0, /*
Scan from character number FROM by COUNT balanced expressions.
If COUNT is negative, scan backwards.
Returns the character number of the position thus found.

Comments are ignored if `parse-sexp-ignore-comments' is non-nil.

If the beginning or end of (the accessible part of) the buffer is reached
in the middle of a parenthetical grouping, an error is signaled.
If the beginning or end is reached between groupings
but before count is used up, nil is returned.

If optional arg BUFFER is non-nil, scanning occurs in that buffer instead
of in the current buffer.

If optional arg NOERROR is non-nil, scan-sexps will return nil instead of
signalling an error.
*/
       (from, count, buffer, no_error))
{
  struct buffer *buf = decode_buffer (buffer, 0);
  CHECK_INT (from);
  CHECK_INT (count);

  return scan_lists (buf, XINT (from), XINT (count), 0, 1, !NILP (no_error));
}

DEFUN ("backward-prefix-chars", Fbackward_prefix_chars, 0, 1, 0, /*
Move point backward over any number of chars with prefix syntax.
This includes chars with "quote" or "prefix" syntax (' or p).

Optional arg BUFFER defaults to the current buffer.
*/
       (buffer))
{
  struct buffer *buf = decode_buffer (buffer, 0);
  Bufpos beg = BUF_BEGV (buf);
  Bufpos pos = BUF_PT (buf);
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  while (pos > beg && !char_quoted (buf, pos - 1)
	 && (SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, pos - 1)) == Squote
	     || SYNTAX_PREFIX (mirrortab, BUF_FETCH_CHAR (buf, pos - 1))))
    pos--;

  BUF_SET_PT (buf, pos);

  return Qnil;
}

/* Parse forward from FROM to END,
   assuming that FROM has state OLDSTATE (nil means FROM is start of function),
   and return a description of the state of the parse at END.
   If STOPBEFORE is nonzero, stop at the start of an atom.
   If COMMENTSTOP is nonzero, stop at the start of a comment.  */

static void
scan_sexps_forward (struct buffer *buf, struct lisp_parse_state *stateptr,
		    Bufpos from, Bufpos end,
		    int targetdepth, int stopbefore,
		    Lisp_Object oldstate,
		    int commentstop)
{
  struct lisp_parse_state state;

  enum syntaxcode code;
  struct level { int last, prev; };
  struct level levelstart[100];
  struct level *curlevel = levelstart;
  struct level *endlevel = levelstart + 100;
  int depth;	/* Paren depth of current scanning location.
			   level - levelstart equals this except
			   when the depth becomes negative.  */
  int mindepth;		/* Lowest DEPTH value seen.  */
  int start_quoted = 0;		/* Nonzero means starting after a char quote */
  Lisp_Object tem;
  int mask;				     /* comment mask */
  Lisp_Object syntaxtab = buf->syntax_table;
  Lisp_Char_Table *mirrortab = XCHAR_TABLE (buf->mirror_syntax_table);

  if (NILP (oldstate))
    {
      depth = 0;
      state.instring = -1;
      state.incomment = 0;
      state.comstyle = 0;	/* comment style a by default */
      mask = SYNTAX_COMMENT_STYLE_A;
    }
  else
    {
      tem = Fcar (oldstate);    /* elt 0, depth */
      if (!NILP (tem))
	depth = XINT (tem);
      else
	depth = 0;

      oldstate = Fcdr (oldstate);
      oldstate = Fcdr (oldstate);
      oldstate = Fcdr (oldstate);
      tem = Fcar (oldstate);    /* elt 3, instring */
      state.instring = !NILP (tem) ? XINT (tem) : -1;

      oldstate = Fcdr (oldstate); /* elt 4, incomment */
      tem = Fcar (oldstate);
      state.incomment = !NILP (tem);

      oldstate = Fcdr (oldstate);
      tem = Fcar (oldstate);    /* elt 5, follows-quote */
      start_quoted = !NILP (tem);

      /* if the eighth element of the list is nil, we are in comment style
	 a. if it is non-nil, we are in comment style b */
      oldstate = Fcdr (oldstate);
      oldstate = Fcdr (oldstate);
      oldstate = Fcdr (oldstate);
      tem = Fcar (oldstate);    /* elt 8, comment style a */
      state.comstyle = !NILP (tem);
      mask = state.comstyle ? SYNTAX_COMMENT_STYLE_B : SYNTAX_COMMENT_STYLE_A;
    }
  state.quoted = 0;
  mindepth = depth;

  curlevel->prev = -1;
  curlevel->last = -1;

  /* Enter the loop at a place appropriate for initial state. */

  if (state.incomment) goto startincomment;
  if (state.instring >= 0)
    {
      if (start_quoted) goto startquotedinstring;
      goto startinstring;
    }
  if (start_quoted) goto startquoted;

  while (from < end)
    {
      QUIT;

      code = SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, from));
      from++;

      if (code == Scomment)
	{
	  /* record the comment style we have entered so that only the
	     comment-ender sequence (or single char) of the same style
	     actually terminates the comment section. */
	  mask = SYNTAX_COMMENT_1CHAR_MASK (mirrortab,
					    BUF_FETCH_CHAR (buf, from-1));
	  state.comstyle = (mask == SYNTAX_COMMENT_STYLE_B);
	  state.comstart = from - 1;
	}

      else if (from < end &&
	       SYNTAX_START_P (mirrortab, BUF_FETCH_CHAR (buf, from-1),
			       BUF_FETCH_CHAR (buf, from)))
	{
	  /* Record the comment style we have entered so that only
	     the comment-end sequence of the same style actually
	     terminates the comment section.  */
	  code = Scomment;
	  mask = SYNTAX_COMMENT_MASK_START (mirrortab,
                                            BUF_FETCH_CHAR (buf, from-1),
					    BUF_FETCH_CHAR (buf, from));
	  state.comstyle = (mask == SYNTAX_COMMENT_STYLE_B);
	  state.comstart = from-1;
	  from++;
	}

      if (SYNTAX_PREFIX (mirrortab, BUF_FETCH_CHAR (buf, from - 1)))
	continue;
      switch (code)
	{
	case Sescape:
	case Scharquote:
	  if (stopbefore) goto stop;  /* this arg means stop at sexp start */
	  curlevel->last = from - 1;
	startquoted:
	  if (from == end) goto endquoted;
	  from++;
	  goto symstarted;
	  /* treat following character as a word constituent */
	case Sword:
	case Ssymbol:
	  if (stopbefore) goto stop;  /* this arg means stop at sexp start */
	  curlevel->last = from - 1;
	symstarted:
	  while (from < end)
	    {
	      switch (SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, from)))
		{
		case Scharquote:
		case Sescape:
		  from++;
		  if (from == end) goto endquoted;
		  break;
		case Sword:
		case Ssymbol:
		case Squote:
		  break;
		default:
		  goto symdone;
		}
	      from++;
	    }
	symdone:
	  curlevel->prev = curlevel->last;
	  break;

	case Scomment:
	  state.incomment = 1;
	startincomment:
	  if (commentstop)
	    goto done;
	  {
	    Bufpos newfrom = find_end_of_comment (buf, from, end, mask);
	    if (newfrom < 0)
	      {
		/* we terminated search because from == end */
		from = end;
		goto done;
	      }
	    from = newfrom;
	  }
	  state.incomment = 0;
	  state.comstyle = 0;		     /* reset the comment style */
	  mask = 0;
	  break;

	case Sopen:
	  if (stopbefore) goto stop;  /* this arg means stop at sexp start */
	  depth++;
	  /* curlevel++->last ran into compiler bug on Apollo */
	  curlevel->last = from - 1;
	  if (++curlevel == endlevel)
	    error ("Nesting too deep for parser");
	  curlevel->prev = -1;
	  curlevel->last = -1;
	  if (targetdepth == depth) goto done;
	  break;

	case Sclose:
	  depth--;
	  if (depth < mindepth)
	    mindepth = depth;
	  if (curlevel != levelstart)
	    curlevel--;
	  curlevel->prev = curlevel->last;
	  if (targetdepth == depth) goto done;
	  break;

	case Sstring:
          {
            Emchar ch;
            if (stopbefore) goto stop; /* this arg means stop at sexp start */
            curlevel->last = from - 1;
	    /* XEmacs change: call syntax_match() on character */
            ch = BUF_FETCH_CHAR (buf, from - 1);
	    {
	      Lisp_Object stermobj = syntax_match (syntaxtab, ch);

	      if (CHARP (stermobj))
		state.instring = XCHAR (stermobj);
	      else
		state.instring = ch;
	    }
          }
	startinstring:
	  while (1)
	    {
	      if (from >= end) goto done;
	      if (BUF_FETCH_CHAR (buf, from) == state.instring) break;
	      switch (SYNTAX (mirrortab, BUF_FETCH_CHAR (buf, from)))
		{
		case Scharquote:
		case Sescape:
                  {
                    from++;
                  startquotedinstring:
                    if (from >= end) goto endquoted;
                    break;
                  }
                default:
                  break;
		}
	      from++;
	    }
	  state.instring = -1;
	  curlevel->prev = curlevel->last;
	  from++;
	  break;

	case Smath:
	  break;

        case Swhitespace:
        case Spunct:
        case Squote:
        case Sendcomment:
	case Sinherit:
        case Smax:
          break;
	}
    }
  goto done;

 stop:   /* Here if stopping before start of sexp. */
  from--;    /* We have just fetched the char that starts it; */
  goto done; /* but return the position before it. */

 endquoted:
  state.quoted = 1;
 done:
  state.depth = depth;
  state.mindepth = mindepth;
  state.thislevelstart = curlevel->prev;
  state.prevlevelstart
    = (curlevel == levelstart) ? -1 : (curlevel - 1)->last;
  state.location = from;

  *stateptr = state;
}

DEFUN ("parse-partial-sexp", Fparse_partial_sexp, 2, 7, 0, /*
Parse Lisp syntax starting at FROM until TO; return status of parse at TO.
Parsing stops at TO or when certain criteria are met;
 point is set to where parsing stops.
If fifth arg STATE is omitted or nil,
 parsing assumes that FROM is the beginning of a function.
Value is a list of eight elements describing final state of parsing:
 0. depth in parens.
 1. character address of start of innermost containing list; nil if none.
 2. character address of start of last complete sexp terminated.
 3. non-nil if inside a string.
    (It is the character that will terminate the string.)
 4. t if inside a comment.
 5. t if following a quote character.
 6. the minimum paren-depth encountered during this scan.
 7. nil if in comment style a, or not in a comment; t if in comment style b
If third arg TARGETDEPTH is non-nil, parsing stops if the depth
in parentheses becomes equal to TARGETDEPTH.
Fourth arg STOPBEFORE non-nil means stop when come to
 any character that starts a sexp.
Fifth arg STATE is an eight-element list like what this function returns.
It is used to initialize the state of the parse.  Its second and third
elements are ignored.
Sixth arg COMMENTSTOP non-nil means stop at the start of a comment.
*/
       (from, to, targetdepth, stopbefore, oldstate, commentstop, buffer))
{
  struct lisp_parse_state state;
  int target;
  Bufpos start, end;
  struct buffer *buf = decode_buffer (buffer, 0);
  Lisp_Object val;

  if (!NILP (targetdepth))
    {
      CHECK_INT (targetdepth);
      target = XINT (targetdepth);
    }
  else
    target = -100000;		/* We won't reach this depth */

  get_buffer_range_char (buf, from, to, &start, &end, 0);
  scan_sexps_forward (buf, &state, start, end,
		      target, !NILP (stopbefore), oldstate,
		      !NILP (commentstop));

  BUF_SET_PT (buf, state.location);

  /* reverse order */
  val = Qnil;
  val = Fcons (state.comstyle  ? Qt : Qnil, val);
  val = Fcons (make_int (state.mindepth),   val);
  val = Fcons (state.quoted    ? Qt : Qnil, val);
  val = Fcons (state.incomment ? Qt : Qnil, val);
  val = Fcons (state.instring       < 0 ? Qnil : make_int (state.instring),       val);
  val = Fcons (state.thislevelstart < 0 ? Qnil : make_int (state.thislevelstart), val);
  val = Fcons (state.prevlevelstart < 0 ? Qnil : make_int (state.prevlevelstart), val);
  val = Fcons (make_int (state.depth), val);

  return val;
}


/* Updating of the mirror syntax table.

   Each syntax table has a corresponding mirror table in it.
   Whenever we make a change to a syntax table, we call
   update_syntax_table() on it.

   #### We really only need to map over the changed range.

   If we change the standard syntax table, we need to map over
   all tables because any of them could be inheriting from the
   standard syntax table.

   When `set-syntax-table' is called, we set the buffer's mirror
   syntax table as well.
   */

struct cmst_arg
{
  Lisp_Object mirrortab;
  int check_inherit;
};

static int
cmst_mapfun (struct chartab_range *range, Lisp_Object val, void *arg)
{
  struct cmst_arg *closure = (struct cmst_arg *) arg;

  if (CONSP (val))
    val = XCAR (val);
  if (SYNTAX_FROM_CODE (XINT (val)) == Sinherit
      && closure->check_inherit)
    {
      struct cmst_arg recursive;

      recursive.mirrortab = closure->mirrortab;
      recursive.check_inherit = 0;
      map_char_table (XCHAR_TABLE (Vstandard_syntax_table), range,
				   cmst_mapfun, &recursive);
    }
  else
    put_char_table (XCHAR_TABLE (closure->mirrortab), range, val);
  return 0;
}

static void
update_just_this_syntax_table (Lisp_Char_Table *ct)
{
  struct chartab_range range;
  struct cmst_arg arg;

  arg.mirrortab = ct->mirror_table;
  arg.check_inherit = (CHAR_TABLEP (Vstandard_syntax_table)
		       && ct != XCHAR_TABLE (Vstandard_syntax_table));
  range.type = CHARTAB_RANGE_ALL;
  map_char_table (ct, &range, cmst_mapfun, &arg);
}

/* Called from chartab.c when a change is made to a syntax table.
   If this is the standard syntax table, we need to recompute
   *all* syntax tables (yuck).  Otherwise we just recompute this
   one. */

void
update_syntax_table (Lisp_Char_Table *ct)
{
  /* Don't be stymied at startup. */
  if (CHAR_TABLEP (Vstandard_syntax_table)
      && ct == XCHAR_TABLE (Vstandard_syntax_table))
    {
      Lisp_Object syntab;

      for (syntab = Vall_syntax_tables; !NILP (syntab);
	   syntab = XCHAR_TABLE (syntab)->next_table)
	update_just_this_syntax_table (XCHAR_TABLE (syntab));
    }
  else
    update_just_this_syntax_table (ct);
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_syntax (void)
{
  defsymbol (&Qsyntax_table_p, "syntax-table-p");

  DEFSUBR (Fsyntax_table_p);
  DEFSUBR (Fsyntax_table);
  DEFSUBR (Fstandard_syntax_table);
  DEFSUBR (Fcopy_syntax_table);
  DEFSUBR (Fset_syntax_table);
  DEFSUBR (Fsyntax_designator_chars);
  DEFSUBR (Fchar_syntax);
  DEFSUBR (Fmatching_paren);
  /* DEFSUBR (Fmodify_syntax_entry); now in Lisp. */
  /* DEFSUBR (Fdescribe_syntax); now in Lisp. */

  DEFSUBR (Fforward_word);

  DEFSUBR (Fforward_comment);
  DEFSUBR (Fscan_lists);
  DEFSUBR (Fscan_sexps);
  DEFSUBR (Fbackward_prefix_chars);
  DEFSUBR (Fparse_partial_sexp);
}

void
vars_of_syntax (void)
{
  DEFVAR_BOOL ("parse-sexp-ignore-comments", &parse_sexp_ignore_comments /*
Non-nil means `forward-sexp', etc., should treat comments as whitespace.
*/ );
  parse_sexp_ignore_comments = 0;

  DEFVAR_BOOL ("words-include-escapes", &words_include_escapes /*
Non-nil means `forward-word', etc., should treat escape chars part of words.
*/ );
  words_include_escapes = 0;

  no_quit_in_re_search = 0;
}

static void
define_standard_syntax (const char *p, enum syntaxcode syn)
{
  for (; *p; p++)
    Fput_char_table (make_char (*p), make_int (syn), Vstandard_syntax_table);
}

void
complex_vars_of_syntax (void)
{
  Emchar i;
  const char *p;
  /* Set this now, so first buffer creation can refer to it. */
  /* Make it nil before calling copy-syntax-table
     so that copy-syntax-table will know not to try to copy from garbage */
  Vstandard_syntax_table = Qnil;
  Vstandard_syntax_table = Fcopy_syntax_table (Qnil);
  staticpro (&Vstandard_syntax_table);

  Vsyntax_designator_chars_string = make_string_nocopy (syntax_code_spec,
							Smax);
  staticpro (&Vsyntax_designator_chars_string);

  fill_char_table (XCHAR_TABLE (Vstandard_syntax_table), make_int (Spunct));

  for (i = 0; i <= 32; i++)	/* Control 0 plus SPACE */
    Fput_char_table (make_char (i), make_int (Swhitespace),
		     Vstandard_syntax_table);
  for (i = 127; i <= 159; i++)	/* DEL plus Control 1 */
    Fput_char_table (make_char (i), make_int (Swhitespace),
		     Vstandard_syntax_table);

  define_standard_syntax ("abcdefghijklmnopqrstuvwxyz"
			  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			  "0123456789"
			  "$%", Sword);
  define_standard_syntax ("\"", Sstring);
  define_standard_syntax ("\\", Sescape);
  define_standard_syntax ("_-+*/&|<>=", Ssymbol);
  define_standard_syntax (".,;:?!#@~^'`", Spunct);

  for (p = "()[]{}"; *p; p+=2)
    {
      Fput_char_table (make_char (p[0]),
		       Fcons (make_int (Sopen), make_char (p[1])),
		       Vstandard_syntax_table);
      Fput_char_table (make_char (p[1]),
		       Fcons (make_int (Sclose), make_char (p[0])),
		       Vstandard_syntax_table);
    }
}
