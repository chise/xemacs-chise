/* Simple built-in editing commands.
   Copyright (C) 1985, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.

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

/* Synched up with: Mule 2.0, FSF 19.30. */

#include <config.h>
#include "lisp.h"
#include "commands.h"
#include "buffer.h"
#include "syntax.h"
#include "insdel.h"

Lisp_Object Qkill_forward_chars;
Lisp_Object Qself_insert_command;
Lisp_Object Qno_self_insert;

Lisp_Object Vblink_paren_function;

/* A possible value for a buffer's overwrite-mode variable.  */
Lisp_Object Qoverwrite_mode_binary;

/* Non-nil means put this face on the next self-inserting character.  */
Lisp_Object Vself_insert_face;

/* This is the command that set up Vself_insert_face.  */
Lisp_Object Vself_insert_face_command;

DEFUN ("forward-char", Fforward_char, 0, 2, "_p", /*
Move point right ARG characters (left if ARG negative).
On attempt to pass end of buffer, stop and signal `end-of-buffer'.
On attempt to pass beginning of buffer, stop and signal `beginning-of-buffer'.
On reaching end of buffer, stop and signal error.
*/
       (arg, buffer))
{
  struct buffer *buf = decode_buffer (buffer, 1);

  if (NILP (arg))
    arg = make_int (1);
  else
    CHECK_INT (arg);

  /* This used to just set point to point + XINT (arg), and then check
     to see if it was within boundaries.  But now that SET_PT can
     potentially do a lot of stuff (calling entering and exiting
     hooks, etcetera), that's not a good approach.  So we validate the
     proposed position, then set point.  */
  {
    Bufpos new_point = BUF_PT (buf) + XINT (arg);

    if (new_point < BUF_BEGV (buf))
      {
	BUF_SET_PT (buf, BUF_BEGV (buf));
	Fsignal (Qbeginning_of_buffer, Qnil);
	return Qnil;
      }
    if (new_point > BUF_ZV (buf))
      {
	BUF_SET_PT (buf, BUF_ZV (buf));
	Fsignal (Qend_of_buffer, Qnil);
	return Qnil;
      }

    BUF_SET_PT (buf, new_point);
  }

  return Qnil;
}

DEFUN ("backward-char", Fbackward_char, 0, 2, "_p", /*
Move point left ARG characters (right if ARG negative).
On attempt to pass end of buffer, stop and signal `end-of-buffer'.
On attempt to pass beginning of buffer, stop and signal `beginning-of-buffer'.
*/
       (arg, buffer))
{
  if (NILP (arg))
    arg = make_int (1);
  else
    CHECK_INT (arg);

  XSETINT (arg, - XINT (arg));
  return Fforward_char (arg, buffer);
}

DEFUN ("forward-line", Fforward_line, 0, 2, "_p", /*
Move ARG lines forward (backward if ARG is negative).
Precisely, if point is on line I, move to the start of line I + ARG.
If there isn't room, go as far as possible (no error).
Returns the count of lines left to move.  If moving forward,
that is ARG - number of lines moved; if backward, ARG + number moved.
With positive ARG, a non-empty line at the end counts as one line
  successfully moved (for the return value).
If BUFFER is nil, the current buffer is assumed.
*/
       (arg, buffer))
{
  struct buffer *buf = decode_buffer (buffer, 1);
  Bufpos pos2 = BUF_PT (buf);
  Bufpos pos;
  EMACS_INT count, shortage, negp;

  if (NILP (arg))
    count = 1;
  else
    {
      CHECK_INT (arg);
      count = XINT (arg);
    }

  negp = count <= 0;
  pos = scan_buffer (buf, '\n', pos2, 0, count - negp, &shortage, 1);
  if (shortage > 0
      && (negp
	  || (BUF_ZV (buf) > BUF_BEGV (buf)
	      && pos != pos2
	      && BUF_FETCH_CHAR (buf, pos - 1) != '\n')))
    shortage--;
  BUF_SET_PT (buf, pos);
  return make_int (negp ? - shortage : shortage);
}

DEFUN ("point-at-bol", Fpoint_at_bol, 0, 2, 0, /*
Return the character position of the first character on the current line.
With argument N not nil or 1, move forward N - 1 lines first.
If scan reaches end of buffer, return that position.
This function does not move point.
*/
       (arg, buffer))
{
  struct buffer *b = decode_buffer (buffer, 1);
  REGISTER int orig, end;

  XSETBUFFER (buffer, b);
  if (NILP (arg))
    arg = make_int (1);
  else
    CHECK_INT (arg);

  orig = BUF_PT(b);
  Fforward_line (make_int (XINT (arg) - 1), buffer);
  end = BUF_PT(b);
  BUF_SET_PT(b, orig);

  return make_int (end);
}

DEFUN ("beginning-of-line", Fbeginning_of_line, 0, 2, "_p", /*
Move point to beginning of current line.
With argument ARG not nil or 1, move forward ARG - 1 lines first.
If scan reaches end of buffer, stop there without error.
If BUFFER is nil, the current buffer is assumed.
*/
       (arg, buffer))
{
  struct buffer *b = decode_buffer (buffer, 1);

  BUF_SET_PT(b, XINT (Fpoint_at_bol(arg, buffer)));
  return Qnil;
}

DEFUN ("point-at-eol", Fpoint_at_eol, 0, 2, 0, /*
Return the character position of the last character on the current line.
With argument N not nil or 1, move forward N - 1 lines first.
If scan reaches end of buffer, return that position.
This function does not move point.
*/
       (arg, buffer))
{
  struct buffer *buf = decode_buffer (buffer, 1);

  XSETBUFFER (buffer, buf);

  if (NILP (arg))
    arg = make_int (1);
  else
    CHECK_INT (arg);

  return make_int (find_before_next_newline (buf, BUF_PT (buf), 0,
					     XINT (arg) - (XINT (arg) <= 0)));
}

DEFUN ("end-of-line", Fend_of_line, 0, 2, "_p", /*
Move point to end of current line.
With argument ARG not nil or 1, move forward ARG - 1 lines first.
If scan reaches end of buffer, stop there without error.
If BUFFER is nil, the current buffer is assumed.
*/
       (arg, buffer))
{
  struct buffer *b = decode_buffer (buffer, 1);

  BUF_SET_PT(b, XINT (Fpoint_at_eol (arg, buffer)));
  return Qnil;
}

DEFUN ("delete-char", Fdelete_char, 1, 2, "*p\nP", /*
Delete the following ARG characters (previous, with negative arg).
Optional second arg KILLFLAG non-nil means kill instead (save in kill ring).
Interactively, ARG is the prefix arg, and KILLFLAG is set if
ARG was explicitly specified.
*/
       (arg, killflag))
{
  /* This function can GC */
  Bufpos pos;
  struct buffer *buf = current_buffer;

  CHECK_INT (arg);

  pos = BUF_PT (buf) + XINT (arg);
  if (NILP (killflag))
    {
      if (XINT (arg) < 0)
	{
	  if (pos < BUF_BEGV (buf))
	    signal_error (Qbeginning_of_buffer, Qnil);
	  else
	    buffer_delete_range (buf, pos, BUF_PT (buf), 0);
	}
      else
	{
	  if (pos > BUF_ZV (buf))
	    signal_error (Qend_of_buffer, Qnil);
	  else
	    buffer_delete_range (buf, BUF_PT (buf), pos, 0);
	}
    }
  else
    {
      call1 (Qkill_forward_chars, arg);
    }
  return Qnil;
}

DEFUN ("delete-backward-char", Fdelete_backward_char, 1, 2, "*p\nP", /*
Delete the previous ARG characters (following, with negative ARG).
Optional second arg KILLFLAG non-nil means kill instead (save in kill ring).
Interactively, ARG is the prefix arg, and KILLFLAG is set if
ARG was explicitly specified.
*/
       (arg, killflag))
{
  /* This function can GC */
  CHECK_INT (arg);
  return Fdelete_char (make_int (-XINT (arg)), killflag);
}

static void internal_self_insert (Emchar ch, int noautofill);

DEFUN ("self-insert-command", Fself_insert_command, 1, 1, "*p", /*
Insert the character you type.
Whichever character you type to run this command is inserted.
*/
       (arg))
{
  /* This function can GC */
  int n;
  Emchar ch;
  Lisp_Object c;
  CHECK_INT (arg);

  if (CHAR_OR_CHAR_INTP (Vlast_command_char))
    c = Vlast_command_char;
  else
    c = Fevent_to_character (Vlast_command_event, Qnil, Qnil, Qt);

  if (NILP (c))
    signal_simple_error ("last typed character has no ASCII equivalent",
                         Fcopy_event (Vlast_command_event, Qnil));

  CHECK_CHAR_COERCE_INT (c);

  n = XINT (arg);
  ch = XCHAR (c);
#if 0 /* FSFmacs */
  /* #### This optimization won't work because of differences in
     how the start-open and end-open properties default for text
     properties.  See internal_self_insert(). */
  if (n >= 2 && NILP (current_buffer->overwrite_mode))
    {
      n -= 2;
      /* The first one might want to expand an abbrev.  */
      internal_self_insert (c, 1);
      /* The bulk of the copies of this char can be inserted simply.
	 We don't have to handle a user-specified face specially
	 because it will get inherited from the first char inserted.  */
      Finsert_char (make_char (c), make_int (n), Qt, Qnil);
      /* The last one might want to auto-fill.  */
      internal_self_insert (c, 0);
    }
  else
#endif /* 0 */
    while (n > 0)
      {
	n--;
	internal_self_insert (ch, (n != 0));
      }
  return Qnil;
}

/* Insert character C1.  If NOAUTOFILL is nonzero, don't do autofill
   even if it is enabled.

   FSF:

   If this insertion is suitable for direct output (completely simple),
   return 0.  A value of 1 indicates this *might* not have been simple.
   A value of 2 means this did things that call for an undo boundary.  */

static void
internal_self_insert (Emchar c1, int noautofill)
{
  /* This function can GC */
  /* int hairy = 0; -- unused */
  REGISTER enum syntaxcode synt;
  REGISTER Emchar c2;
  Lisp_Object overwrite;
  struct Lisp_Char_Table *syntax_table;
  struct buffer *buf = current_buffer;

  overwrite = buf->overwrite_mode;
  syntax_table = XCHAR_TABLE (buf->mirror_syntax_table);

#if 0
  /* No, this is very bad, it makes undo *always* undo a character at a time
     instead of grouping consecutive self-inserts together.  Nasty nasty.
   */
  if (!NILP (Vbefore_change_functions) || !NILP (Vafter_change_functions)
      || !NILP (Vbefore_change_function) || !NILP (Vafter_change_function))
    hairy = 1;
#endif

  if (!NILP (overwrite)
      && BUF_PT (buf) < BUF_ZV (buf)
      && (EQ (overwrite, Qoverwrite_mode_binary)
	  || (c1 != '\n' && BUF_FETCH_CHAR (buf, BUF_PT (buf)) != '\n'))
      && (EQ (overwrite, Qoverwrite_mode_binary)
          || BUF_FETCH_CHAR (buf, BUF_PT (buf)) != '\t'
	  || XINT (buf->tab_width) <= 0
	  || XINT (buf->tab_width) > 20
	  || !((current_column (buf) + 1) % XINT (buf->tab_width))))
    {
      buffer_delete_range (buf, BUF_PT (buf), BUF_PT (buf) + 1, 0);
      /* hairy = 2; */
    }

  if (!NILP (buf->abbrev_mode)
      && !WORD_SYNTAX_P (syntax_table, c1)
      && NILP (buf->read_only)
      && BUF_PT (buf) > BUF_BEGV (buf))
    {
      c2 = BUF_FETCH_CHAR (buf, BUF_PT (buf) - 1);

      if (WORD_SYNTAX_P (syntax_table, c2))
	{
#if 1
	  Fexpand_abbrev ();
#else  /* FSFmacs */
	  Lisp_Object sym = Fexpand_abbrev ();

	  /* I think this is too bogus to add.  The function should
             have a way of examining the character to be inserted, so
             it can decide whether to insert it or not.  We should
             design it better than that.  */

	  /* Here FSFmacs remembers MODIFF, compares it after
             Fexpand_abbrev() finishes, and updates HAIRY.  */

	  /* NOTE: we cannot simply check for Vlast_abbrev, because
	     Fexpand_abbrev() can bail out before setting it to
	     anything meaningful, leaving us stuck with an old value.
	     Thus Fexpand_abbrev() was extended to return the actual
	     abbrev symbol.  */
	  if (!NILP (sym)
	      && !NILP (symbol_function (XSYMBOL (sym)))
	      && SYMBOLP (symbol_function (XSYMBOL (sym))))
	    {
	      Lisp_Object prop = Fget (symbol_function (XSYMBOL (sym)),
				       Qno_self_insert, Qnil);
	      if (!NILP (prop))
		return;
	    }
#endif /* FSFmacs */
        }
    }
  if ((c1 == ' ' || c1 == '\n')
      && !noautofill
      && !NILP (buf->auto_fill_function))
    {
      buffer_insert_emacs_char (buf, c1);
      if (c1 == '\n')
	/* After inserting a newline, move to previous line and fill */
	/* that.  Must have the newline in place already so filling and */
	/* justification, if any, know where the end is going to be. */
	BUF_SET_PT (buf, BUF_PT (buf) - 1);
      call0 (buf->auto_fill_function);
      if (c1 == '\n')
	BUF_SET_PT (buf, BUF_PT (buf) + 1);
      /* hairy = 2; */
    }
  else
    buffer_insert_emacs_char (buf, c1);

  /* If previous command specified a face to use, use it.  */
  if (!NILP (Vself_insert_face)
      && EQ (Vlast_command, Vself_insert_face_command))
    {
      Lisp_Object before = make_int (BUF_PT (buf) - 1);
      Lisp_Object after  = make_int (BUF_PT (buf));
      Fput_text_property (before, after, Qface, Vself_insert_face, Qnil);
      Fput_text_property (before, after, Qstart_open, Qt, Qnil);
      Fput_text_property (before, after, Qend_open, Qnil, Qnil);
      /* #### FSFmacs properties are normally closed ("sticky") on the
	 end but not the beginning.  It's the opposite for us. */
      Vself_insert_face = Qnil;
    }
  synt = SYNTAX (syntax_table, c1);
  if ((synt == Sclose || synt == Smath)
      && !NILP (Vblink_paren_function) && INTERACTIVE
      && !noautofill)
    {
      call0 (Vblink_paren_function);
      /* hairy = 2; */
    }

  /* return hairy; */
}

/* (this comes from Mule but is a generally good idea) */

DEFUN ("self-insert-internal", Fself_insert_internal, 1, 1, 0, /*
Invoke `self-insert-command' as if CH is entered from keyboard.
*/
       (ch))
{
  /* This function can GC */
  CHECK_CHAR_COERCE_INT (ch);
  internal_self_insert (XCHAR (ch), 0);
  return Qnil;
}

/* module initialization */

void
syms_of_cmds (void)
{
  defsymbol (&Qkill_forward_chars, "kill-forward-chars");
  defsymbol (&Qself_insert_command, "self-insert-command");
  defsymbol (&Qoverwrite_mode_binary, "overwrite-mode-binary");
  defsymbol (&Qno_self_insert, "no-self-insert");

  DEFSUBR (Fforward_char);
  DEFSUBR (Fbackward_char);
  DEFSUBR (Fforward_line);
  DEFSUBR (Fbeginning_of_line);
  DEFSUBR (Fend_of_line);

  DEFSUBR (Fpoint_at_bol);
  DEFSUBR (Fpoint_at_eol);

  DEFSUBR (Fdelete_char);
  DEFSUBR (Fdelete_backward_char);

  DEFSUBR (Fself_insert_command);
  DEFSUBR (Fself_insert_internal);
}

void
vars_of_cmds (void)
{
  DEFVAR_LISP ("self-insert-face", &Vself_insert_face /*
If non-nil, set the face of the next self-inserting character to this.
See also `self-insert-face-command'.
*/ );
  Vself_insert_face = Qnil;

  DEFVAR_LISP ("self-insert-face-command", &Vself_insert_face_command /*
This is the command that set up `self-insert-face'.
If `last-command' does not equal this value, we ignore `self-insert-face'.
*/ );
  Vself_insert_face_command = Qnil;

  DEFVAR_LISP ("blink-paren-function", &Vblink_paren_function /*
Function called, if non-nil, whenever a close parenthesis is inserted.
More precisely, a char with closeparen syntax is self-inserted.
*/ );
  Vblink_paren_function = Qnil;
}
