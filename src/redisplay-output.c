/* Synchronize redisplay structures and output changes.
   Copyright (C) 1994, 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1995, 1996 Ben Wing.
   Copyright (C) 1996 Chuck Thompson.

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

/* Synched up with: Not in FSF. */

/* This file has been Mule-ized. */

/* Author: Chuck Thompson */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "window.h"
#include "frame.h"
#include "device.h"
#include "glyphs.h"
#include "redisplay.h"
#include "faces.h"

static int compare_runes (struct window *w, struct rune *crb,
			  struct rune *drb);
static void redraw_cursor_in_window (struct window *w,
				     int run_end_begin_glyphs);
static void redisplay_output_display_block (struct window *w, struct display_line *dl,
					    int block, int start, int end, int start_pixpos,
					    int cursor_start, int cursor_width, 
					    int cursor_height);

/*****************************************************************************
 sync_rune_structs

 Synchronize the given rune blocks.
 ****************************************************************************/
static void
sync_rune_structs (struct window *w, rune_dynarr *cra, rune_dynarr *dra)
{
  int rune_elt;
  int max_move = ((Dynarr_length (dra) > Dynarr_largest (cra))
		  ? Dynarr_largest (cra)
		  : Dynarr_length (dra));

  if (max_move)
    {
      /* #### Doing this directly breaks the encapsulation.  But, the
         running time of this function has a measurable impact on
         redisplay performance so avoiding all excess overhead is a
         good thing.  Is all of this true? */
      memcpy (cra->base, dra->base, sizeof (struct rune) * max_move);
      Dynarr_set_size (cra, max_move);
    }
  else
    Dynarr_reset (cra);

  for (rune_elt = max_move; rune_elt < Dynarr_length (dra); rune_elt++)
    {
      struct rune rb, *crb;
      struct rune *drb = Dynarr_atp (dra, rune_elt);

      crb = &rb;
      memcpy (crb, drb, sizeof (struct rune));
      Dynarr_add (cra, *crb);
    }
}

/*****************************************************************************
 sync_display_line_structs

 For the given LINE in window W, make the current display line equal
 the desired display line.
 ****************************************************************************/
static void
sync_display_line_structs (struct window *w, int line, int do_blocks,
			   display_line_dynarr *cdla,
			   display_line_dynarr *ddla)
{
  int cdla_len = Dynarr_length (cdla);

  struct display_line dl, *clp, *dlp;
  int db_elt;

  dlp = Dynarr_atp (ddla, line);
  if (line >= Dynarr_largest (cdla))
    {
      clp = &dl;
      clp->display_blocks = Dynarr_new (display_block);
    }
  else
    {
      clp = Dynarr_atp (cdla, line);
      if (clp->display_blocks)
	Dynarr_reset (clp->display_blocks);
      if (clp->left_glyphs)
	{
	  Dynarr_free (clp->left_glyphs);
	  clp->left_glyphs = 0;
	}
      if (clp->right_glyphs)
	{
	  Dynarr_free (clp->right_glyphs);
	  clp->right_glyphs = 0;
	}
    }
  {
    display_block_dynarr *tdb = clp->display_blocks;

    memcpy (clp, dlp, sizeof (struct display_line));
    clp->display_blocks = tdb;
    clp->left_glyphs = 0;
    clp->right_glyphs = 0;
  }

  if (!do_blocks && line >= cdla_len)
    {
      Dynarr_add (cdla, *clp);
      return;
    }

  for (db_elt = 0; db_elt < Dynarr_length (dlp->display_blocks); db_elt++)
    {
      struct display_block db, *cdb;
      struct display_block *ddb = Dynarr_atp (dlp->display_blocks, db_elt);

      if (db_elt >= Dynarr_largest (clp->display_blocks))
	{
	  cdb = &db;
	  memcpy (cdb, ddb, sizeof (struct display_block));
	  cdb->runes = Dynarr_new (rune);
	  Dynarr_add (clp->display_blocks, *cdb);
	}
      else
	{
	  rune_dynarr *tr;

	  cdb = Dynarr_atp (clp->display_blocks, db_elt);
	  tr = cdb->runes;
	  memcpy (cdb, ddb, sizeof (struct display_block));
	  cdb->runes = tr;
	  Dynarr_increment (clp->display_blocks);
	}

      sync_rune_structs (w, cdb->runes, ddb->runes);
    }

  if (line >= cdla_len)
    Dynarr_add (cdla, *clp);
}

/*****************************************************************************
 compare_runes

 Compare to runes to see if each of their fields is equal.  If so,
 return true otherwise return false.
 ****************************************************************************/
static int
compare_runes (struct window *w, struct rune *crb, struct rune *drb)
{
  /* Do not compare the values of bufpos and endpos.  They do not
     affect the display characteristics. */

  if ((crb->findex != drb->findex) ||
      (WINDOW_FACE_CACHEL_DIRTY (w, drb->findex)))
    return 0;
  else if (crb->xpos != drb->xpos)
    return 0;
  else if (crb->width != drb->width)
    return 0;
  else if (crb->cursor_type != drb->cursor_type)
    return 0;
  else if (crb->type != drb->type)
    return 0;
  else if (crb->type == RUNE_CHAR &&
	   (crb->object.chr.ch != drb->object.chr.ch))
    return 0;
  else if (crb->type == RUNE_DGLYPH &&
	   (!EQ (crb->object.dglyph.glyph, drb->object.dglyph.glyph) ||
	    !EQ (crb->object.dglyph.extent, drb->object.dglyph.extent) ||
	    crb->object.dglyph.xoffset != drb->object.dglyph.xoffset))
    return 0;
  else if (crb->type == RUNE_HLINE &&
	   (crb->object.hline.thickness != drb->object.hline.thickness ||
	    crb->object.hline.yoffset != drb->object.hline.yoffset))
    return 0;
  else
    return 1;
}

/*****************************************************************************
 get_next_display_block

 Return the next display starting at or overlapping START_POS.  Return
 the start of the next region in NEXT_START.
 ****************************************************************************/
int
get_next_display_block (layout_bounds bounds, display_block_dynarr *dba,
			int start_pos, int *next_start)
{
  int next_display_block = NO_BLOCK;
  int priority = -1;
  int block;

  /* If we don't find a display block covering or starting at
     start_pos, then we return the starting point of the next display
     block or the next division boundary, whichever is closer to
     start_pos. */
  if (next_start)
    {
      if (start_pos >= bounds.left_out && start_pos < bounds.left_in)
	*next_start = bounds.left_in;
      else if (start_pos < bounds.left_white)
	*next_start = bounds.left_white;
      else if (start_pos < bounds.right_white)
	*next_start = bounds.right_white;
      else if (start_pos < bounds.right_in)
	*next_start = bounds.right_in;
      else if (start_pos <= bounds.right_out)
	*next_start = bounds.right_out;
      else
	abort ();
    }

  for (block = 0; block < Dynarr_length (dba); block++)
    {
      struct display_block *db = Dynarr_atp (dba, block);

      if (db->start_pos <= start_pos && db->end_pos > start_pos)
	{
	  if ((int) db->type > priority)
	    {
	      priority = db->type;
	      next_display_block = block;
	      if (next_start)
		*next_start = db->end_pos;
	    }
	}
      else if (next_start && db->start_pos > start_pos)
	{
	  if (db->start_pos < *next_start)
	    *next_start = db->start_pos;
	}
    }

  return next_display_block;
}

/*****************************************************************************
 get_cursor_size_and_location

 Return the information defining the pixel location of the cursor.
 ****************************************************************************/
static void
get_cursor_size_and_location (struct window *w, struct display_block *db,
			      int cursor_location,
			      int *cursor_start, int *cursor_width,
			      int *cursor_height)
{
  struct rune *rb;
  Lisp_Object window;
  int defheight, defwidth;

  if (Dynarr_length (db->runes) <= cursor_location)
    abort ();

  XSETWINDOW (window, w);

  rb = Dynarr_atp (db->runes, cursor_location);
  *cursor_start = rb->xpos;

  default_face_height_and_width (window, &defheight, &defwidth);
  *cursor_height = defheight;

  if (rb->type == RUNE_BLANK)
    *cursor_width = defwidth;
  else
    *cursor_width = rb->width;
}

/*****************************************************************************
 compare_display_blocks

 Given two display blocks, output only those areas where they differ.
 ****************************************************************************/
static int
compare_display_blocks (struct window *w, struct display_line *cdl,
			struct display_line *ddl, int c_block, int d_block,
			int start_pixpos, int cursor_start, int cursor_width,
			int cursor_height)
{
  struct frame *f = XFRAME (w->frame);
  struct display_block *cdb, *ddb;
  int start_pos;
  int stop_pos;
  int force = 0;
  int block_end;

  cdb = Dynarr_atp (cdl->display_blocks, c_block);
  ddb = Dynarr_atp (ddl->display_blocks, d_block);

  assert (cdb->type == ddb->type);

  start_pos = -1;
  stop_pos = min (Dynarr_length (cdb->runes), Dynarr_length (ddb->runes));

  block_end =
    (!Dynarr_length (ddb->runes)
     ? 0
     : (Dynarr_atp (ddb->runes, Dynarr_length (ddb->runes) - 1)->xpos +
	Dynarr_atp (ddb->runes, Dynarr_length (ddb->runes) - 1)->width));

  /* If the new block type is not text and the cursor status is
     changing and it overlaps the position of this block then force a
     full redraw of the block in order to make sure that the cursor is
     updated properly. */
  if (ddb->type != TEXT
#if 0
      /* I'm not sure exactly what this code wants to do, but it's
       * not right--it doesn't update when cursor_elt changes from, e.g.,
       * 0 to 8, and the new or old cursor loc overlaps this block.
       * I've replaced it with the more conservative test below.
       * -dkindred@cs.cmu.edu 23-Mar-1997 */
      && ((cdl->cursor_elt == -1 && ddl->cursor_elt != -1)
	  || (cdl->cursor_elt != -1 && ddl->cursor_elt == -1))
      && (ddl->cursor_elt == -1 ||
	  (cursor_start
	   && cursor_width
	   && (cursor_start + cursor_width) >= start_pixpos
	   && cursor_start <= block_end))
#else
      && (cdl->cursor_elt != ddl->cursor_elt)
#endif
      )
    force = 1;

  if (f->windows_structure_changed ||
      f->faces_changed ||
      f->glyphs_changed ||
      cdl->ypos != ddl->ypos ||
      cdl->ascent != ddl->ascent ||
      cdl->descent != ddl->descent ||
      cdl->clip != ddl->clip ||
      force)
    {
      start_pos = 0;
      force = 1;
    }
  else
    {
      int elt = 0;

      while (start_pos < 0 && elt < stop_pos)
	{
	  if (!compare_runes (w, Dynarr_atp (cdb->runes, elt),
			      Dynarr_atp (ddb->runes, elt)))
	    {
	      start_pos = elt;
	    }
	  else
	    {
	      elt++;
	    }
	}

      /* If nothing has changed in the area where the blocks overlap, but
	 there are new blocks in the desired block, then adjust the start
	 point accordingly. */
      if (elt == stop_pos && stop_pos < Dynarr_length (ddb->runes))
	start_pos = stop_pos;
    }

  if (start_pos >= 0)
    {
      if ((Dynarr_length (ddb->runes) != Dynarr_length (cdb->runes))
	  || force)
	{
	  stop_pos = Dynarr_length (ddb->runes);
	}
      else
	{
	  /* If the lines have the same number of runes and we are not
	     forcing a full redraw because the display line has
	     changed position then we try and optimize how much of the
	     line we actually redraw by scanning backwards from the
	     end for the first changed rune.  This optimization is
	     almost always triggered by face changes. */

	  int elt = Dynarr_length (ddb->runes) - 1;

	  while (elt > start_pos)
	    {
	      if (!compare_runes (w, Dynarr_atp (cdb->runes, elt),
				  Dynarr_atp (ddb->runes, elt)))
		break;
	      else
		elt--;
	    }
	  stop_pos = elt + 1;
	}

      redisplay_output_display_block (w, ddl, d_block, start_pos,
				      stop_pos, start_pixpos,
				      cursor_start, cursor_width,
				      cursor_height);
      return 1;
    }

  return 0;
}

/*****************************************************************************
 clear_left_border

 Clear the lefthand outside border.
 ****************************************************************************/
static void
clear_left_border (struct window *w, int y, int height)
{
  struct frame *f = XFRAME (w->frame);
  Lisp_Object window;

  XSETWINDOW (window, w);
  redisplay_clear_region (window, DEFAULT_INDEX,
		FRAME_LEFT_BORDER_START (f), y,
		FRAME_BORDER_WIDTH (f), height);
}

/*****************************************************************************
 clear_right_border

 Clear the righthand outside border.
 ****************************************************************************/
static void
clear_right_border (struct window *w, int y, int height)
{
  struct frame *f = XFRAME (w->frame);
  Lisp_Object window;

  XSETWINDOW (window, w);
  redisplay_clear_region (window, DEFAULT_INDEX,
		FRAME_RIGHT_BORDER_START (f),
		y, FRAME_BORDER_WIDTH (f), height);
}

/*****************************************************************************
 output_display_line

 Ensure that the contents of the given display line is correct
 on-screen.  The force_ parameters are used by redisplay_move_cursor
 to correctly update cursor locations and only cursor locations.
 ****************************************************************************/
void
output_display_line (struct window *w, display_line_dynarr *cdla,
		     display_line_dynarr *ddla, int line, int force_start,
		     int force_end)

{
  struct frame *f = XFRAME (w->frame);
  struct buffer *b = XBUFFER (w->buffer);
  struct buffer *old_b = window_display_buffer (w);
  struct display_line *cdl, *ddl;
  display_block_dynarr *cdba, *ddba;
  int start_pixpos, end_pixpos;
  int cursor_start, cursor_width, cursor_height;

  int force = (force_start >= 0 || force_end >= 0);
  int clear_border = 0;
  int must_sync = 0;

  if (cdla && line < Dynarr_length (cdla))
    {
      cdl = Dynarr_atp (cdla, line);
      cdba = cdl->display_blocks;
    }
  else
    {
      cdl = NULL;
      cdba = NULL;
    }

  ddl = Dynarr_atp (ddla, line);      /* assert line < Dynarr_length (ddla) */
  ddba = ddl->display_blocks;

  if (force_start >= 0 && force_start >= ddl->bounds.left_out)
    start_pixpos = force_start;
  else
    start_pixpos = ddl->bounds.left_out;

  if (force_end >= 0 && force_end < ddl->bounds.right_out)
    end_pixpos = force_end;
  else
    end_pixpos = ddl->bounds.right_out;

  /* Get the cursor parameters. */
  if (ddl->cursor_elt != -1)
    {
      struct display_block *db;

      /* If the lines cursor parameter is not -1 then it indicates
         which rune in the TEXT block contains the cursor.  This means
         that there must be at least one display block.  The TEXT
         block, if present, must always be the first display block. */
      assert (Dynarr_length (ddba) != 0);

      db = Dynarr_atp (ddba, 0);
      assert (db->type == TEXT);

      get_cursor_size_and_location (w, db, ddl->cursor_elt, &cursor_start,
				    &cursor_width, &cursor_height);
    }
  else
    {
      cursor_start = cursor_width = cursor_height = 0;
    }

  /* The modeline should only have a single block and it had better be
     a TEXT block. */
  if (ddl->modeline)
    {
      /* The shadow thickness check is necessary if only the sign of
         the size changed. */
      if (cdba && !w->shadow_thickness_changed)
	{
	  must_sync |= compare_display_blocks (w, cdl, ddl, 0, 0,
					       start_pixpos, 0, 0, 0);
	}
      else
	{
	  redisplay_output_display_block (w, ddl, 0, 0, -1, start_pixpos,
					  0, 0, 0);
	  must_sync = 1;
	}

      if (must_sync)
	clear_border = 1;
    }

  while (!ddl->modeline && start_pixpos < end_pixpos)
    {
      int block;
      int next_start_pixpos;

      block = get_next_display_block (ddl->bounds, ddba, start_pixpos,
				      &next_start_pixpos);

      /* If we didn't find a block then we should blank the area
         between start_pos and next_start if necessary. */
      if (block == NO_BLOCK)
	{
	  /* We only erase those areas which were actually previously
             covered by a display block unless the window structure
             changed.  In that case we clear all areas since the current
             structures may actually represent a different buffer. */
	  while (start_pixpos < next_start_pixpos)
	    {
	      int block_end;
	      int old_block;

	      if (cdba)
		old_block = get_next_display_block (ddl->bounds, cdba,
						    start_pixpos, &block_end);
	      else
		{
		  old_block = NO_BLOCK;
		  block_end = next_start_pixpos;
		}

	      if (!cdba || old_block != NO_BLOCK || b != old_b ||
		  f->windows_structure_changed ||
		  f->faces_changed ||
		  force ||
		  (cdl && (cdl->ypos != ddl->ypos ||
			   cdl->ascent != ddl->ascent ||
			   cdl->descent != ddl->descent ||
			   cdl->clip != ddl->clip)))
		{
		  int x, y, width, height;
		  Lisp_Object face;

		  must_sync = 1;
		  x = start_pixpos;
		  y = ddl->ypos - ddl->ascent;
		  width = min (next_start_pixpos, block_end) - x;
		  height = ddl->ascent + ddl->descent - ddl->clip;

		  if (x < ddl->bounds.left_in)
		    face = Vleft_margin_face;
		  else if (x < ddl->bounds.right_in)
		    face = Vdefault_face;
		  else if (x < ddl->bounds.right_out)
		    face = Vright_margin_face;
		  else
		    face = Qnil;

		  if (!NILP (face))
		    {
		      Lisp_Object window;

		      XSETWINDOW (window, w);

		      /* Clear the empty area. */
		      redisplay_clear_region (window, get_builtin_face_cache_index (w, face),
				    x, y, width, height);

		      /* Mark that we should clear the border.  This is
			 necessary because italic fonts may leave
			 droppings in the border. */
		      clear_border = 1;
		    }
		}

	      start_pixpos = min (next_start_pixpos, block_end);
	    }
	}
      else
	{
	  struct display_block *cdb, *ddb;
	  int block_end;
	  int old_block;

	  if (cdba)
	    old_block = get_next_display_block (ddl->bounds, cdba,
						start_pixpos, &block_end);
	  else
	    old_block = NO_BLOCK;

	  ddb = Dynarr_atp (ddba, block);
	  cdb = (old_block != NO_BLOCK ? Dynarr_atp (cdba, old_block) : 0);

	  /* If there was formerly no block over the current
	     region or if it was a block of a different type, then
	     output the entire ddb.  Otherwise, compare cdb and
	     ddb and output only the changed region. */
	  if (!force && cdb && ddb->type == cdb->type && b == old_b)
	    {
	      must_sync |= compare_display_blocks (w, cdl, ddl, old_block,
						   block, start_pixpos,
						   cursor_start, cursor_width,
						   cursor_height);
	    }
	  else
	    {
	      int elt;
	      int first_elt = 0;
	      int last_elt = -1;

	      for (elt = 0; elt < Dynarr_length (ddb->runes); elt++)
		{
		  struct rune *rb = Dynarr_atp (ddb->runes, elt);

		  if (start_pixpos >= rb->xpos
		      && start_pixpos < rb->xpos + rb->width)
		    first_elt = elt;

		  if (end_pixpos > rb->xpos
		      && end_pixpos <= rb->xpos + rb->width)
		    {
		      last_elt = elt + 1;
		      if (last_elt > Dynarr_length (ddb->runes))
			last_elt = Dynarr_length (ddb->runes);
		      break;
		    }
		}

	      must_sync = 1;
	      redisplay_output_display_block (w, ddl, block, first_elt,
					      last_elt,
					      start_pixpos,
					      cursor_start, cursor_width,
					      cursor_height);
	    }
	  
	  start_pixpos = next_start_pixpos;
	}
    }

  /* Clear the internal border if we are next to it and the window
     structure or frame size has changed or if something caused
     clear_border to be tripped.  */
  /* #### Doing this on f->clear sucks but is necessary because of
     window-local background values. */
  if (f->windows_structure_changed || f->faces_changed || clear_border
      || f->clear)
    {
      int y = ddl->ypos - ddl->ascent;
      int height = ddl->ascent + ddl->descent - ddl->clip;

      if (ddl->modeline)
	{
	  y -= MODELINE_SHADOW_THICKNESS (w);
	  height += (2 * MODELINE_SHADOW_THICKNESS (w));
	}

      if (window_is_leftmost (w))
	clear_left_border (w, y, height);
      if (window_is_rightmost (w))
	clear_right_border (w, y, height);
    }

  if (cdla)
    sync_display_line_structs (w, line, must_sync, cdla, ddla);
}

/*****************************************************************************
 redisplay_move_cursor

 For the given window W, move the cursor to NEW_POINT.  Returns a
 boolean indicating success or failure.
 ****************************************************************************/

#define ADJ_BUFPOS (rb->bufpos + dl->offset)
#define ADJ_ENDPOS (rb->endpos + dl->offset)

int
redisplay_move_cursor (struct window *w, Bufpos new_point, int no_output_end)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);

  display_line_dynarr *cla = window_display_lines (w, CURRENT_DISP);
  struct display_line *dl;
  struct display_block *db;
  struct rune *rb;
  int x = w->last_point_x[CURRENT_DISP];
  int y = w->last_point_y[CURRENT_DISP];

  /*
   * Bail if cursor_in_echo_area is non-zero and we're fiddling with
   * the cursor in a non-active minibuffer window, since that is a
   * special case that is handled elsewhere and this function need
   * not handle it.  Return 1 so the caller will assume we
   * succeeded.
   */
  if (cursor_in_echo_area && MINI_WINDOW_P (w) &&
      w != XWINDOW (FRAME_SELECTED_WINDOW (f)))
    return 1;

  if (y < 0 || y >= Dynarr_length (cla))
    return 0;

  dl = Dynarr_atp (cla, y);
  db = get_display_block_from_line (dl, TEXT);

  if (x < 0 || x >= Dynarr_length (db->runes))
    return 0;

  rb = Dynarr_atp (db->runes, x);

  if (rb->cursor_type == CURSOR_OFF)
    return 0;
  else if (ADJ_BUFPOS == new_point
	   || (ADJ_ENDPOS && (new_point >= ADJ_BUFPOS)
	       && (new_point <= ADJ_ENDPOS)))
    {
      w->last_point_x[CURRENT_DISP] = x;
      w->last_point_y[CURRENT_DISP] = y;
      Fset_marker (w->last_point[CURRENT_DISP], make_int (ADJ_BUFPOS),
		   w->buffer);
      dl->cursor_elt = x;
      return 1;
    }
  else
    {
      DEVMETH (d, output_begin, (d));

      /* #### This is a gross kludge.  Cursor handling is such a royal
         pain in the ass. */
      if (rb->type == RUNE_DGLYPH &&
	  (EQ (rb->object.dglyph.glyph, Vtruncation_glyph) ||
	   EQ (rb->object.dglyph.glyph, Vcontinuation_glyph)))
	rb->cursor_type = NO_CURSOR;
      else
	rb->cursor_type = CURSOR_OFF;
      dl->cursor_elt = -1;
      output_display_line (w, 0, cla, y, rb->xpos, rb->xpos + rb->width);
    }

  w->last_point_x[CURRENT_DISP] = -1;
  w->last_point_y[CURRENT_DISP] = -1;
  Fset_marker (w->last_point[CURRENT_DISP], Qnil, w->buffer);

  /* If this isn't the selected frame, then erasing the old cursor is
     all we actually had to do. */
  if (w != XWINDOW (FRAME_SELECTED_WINDOW (device_selected_frame (d))))
    {
      if (!no_output_end)
	DEVMETH (d, output_end, (d));

      return 1;
    }

  /* This should only occur in the minibuffer. */
  if (new_point == 0)
    {
      w->last_point_x[CURRENT_DISP] = 0;
      w->last_point_y[CURRENT_DISP] = y;
      Fset_marker (w->last_point[CURRENT_DISP], Qzero, w->buffer);

      rb = Dynarr_atp (db->runes, 0);
      rb->cursor_type = CURSOR_ON;
      dl->cursor_elt = 0;

      output_display_line (w, 0, cla, y, rb->xpos, rb->xpos + rb->width);

      if (!no_output_end)
	DEVMETH (d, output_end, (d));
      return 1;
    }
  else
    {
      int cur_rb = 0;
      int first = 0;
      int cur_dl, up;

      if (ADJ_BUFPOS < new_point)
	{
	  up = 1;
	  cur_rb = x + 1;
	  cur_dl = y;
	}
      else /* (rb->bufpos + dl->offset) > new_point */
	{
	  up = 0;

	  if (!x)
	    {
	      cur_dl = y - 1;
	      first = 0;
	    }
	  else
	    {
	      cur_rb = x - 1;
	      cur_dl = y;
	      first = 1;
	    }
	}

      while ((up ? (cur_dl < Dynarr_length (cla)) : (cur_dl >= 0)))
	{
	  dl = Dynarr_atp (cla, cur_dl);
	  db = get_display_block_from_line (dl, TEXT);

	  if (!up && !first)
	    cur_rb = Dynarr_length (db->runes) - 1;

	  while ((!scroll_on_clipped_lines || !dl->clip) &&
		 (up ? (cur_rb < Dynarr_length (db->runes)) : (cur_rb >= 0)))
	    {
	      rb = Dynarr_atp (db->runes, cur_rb);

	      if (rb->cursor_type != IGNORE_CURSOR
		  && rb->cursor_type != NO_CURSOR &&
		  (ADJ_BUFPOS == new_point
		   || (ADJ_ENDPOS && (new_point >= ADJ_BUFPOS)
		       && (new_point <= ADJ_BUFPOS))))
		{
		  rb->cursor_type = CURSOR_ON;
		  dl->cursor_elt = cur_rb;


		  output_display_line (w, 0, cla, cur_dl, rb->xpos,
				       rb->xpos + rb->width);

		  w->last_point_x[CURRENT_DISP] = cur_rb;
		  w->last_point_y[CURRENT_DISP] = cur_dl;
		  Fset_marker (w->last_point[CURRENT_DISP],
			       make_int (ADJ_BUFPOS), w->buffer);

		  if (!no_output_end)
		    DEVMETH (d, output_end, (d));
		  return 1;
		}

	      (up ? cur_rb++ : cur_rb--);
	    }

	  (up ? (cur_rb = 0) : (first = 0));
	  (up ? cur_dl++ : cur_dl--);
	}
    }

  if (!no_output_end)
    DEVMETH (d, output_end, (d));
  return 0;
}
#undef ADJ_BUFPOS
#undef ADJ_ENDPOS

/*****************************************************************************
 redraw_cursor_in_window

 For the given window W, redraw the cursor if it is contained within
 the window.
 ****************************************************************************/
static void
redraw_cursor_in_window (struct window *w, int run_end_begin_meths)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);

  display_line_dynarr *dla = window_display_lines (w, CURRENT_DISP);
  struct display_line *dl;
  struct display_block *db;
  struct rune *rb;

  int x = w->last_point_x[CURRENT_DISP];
  int y = w->last_point_y[CURRENT_DISP];

  if (cursor_in_echo_area && MINI_WINDOW_P (w) &&
      !echo_area_active (f) && minibuf_level == 0)
    {
      MAYBE_DEVMETH (d, set_final_cursor_coords, (f, w->pixel_top, 0));
    }

  if (y < 0 || y >= Dynarr_length (dla))
    return;

  if (MINI_WINDOW_P (w) && f != device_selected_frame (d) &&
      !is_surrogate_for_selected_frame (f))
    return;

  dl = Dynarr_atp (dla, y);
  db = get_display_block_from_line (dl, TEXT);

  if (x < 0 || x >= Dynarr_length (db->runes))
    return;

  rb = Dynarr_atp (db->runes, x);

  /* Don't call the output routine if the block isn't actually the
     cursor. */
  if (rb->cursor_type == CURSOR_ON)
    {
      MAYBE_DEVMETH (d, set_final_cursor_coords,
		     (f, dl->ypos - 1, rb->xpos));

      if (run_end_begin_meths)
	DEVMETH (d, output_begin, (d));

      output_display_line (w, 0, dla, y, rb->xpos, rb->xpos + rb->width);

      if (run_end_begin_meths)
	DEVMETH (d, output_end, (d));
    }
}

/*****************************************************************************
 redisplay_redraw_cursor

 For the given frame F, redraw the cursor on the selected window.
 This is used to update the cursor after focus changes.
 ****************************************************************************/
void
redisplay_redraw_cursor (struct frame *f, int run_end_begin_meths)
{
  Lisp_Object window;

  if (!cursor_in_echo_area)
    window = FRAME_SELECTED_WINDOW (f);
  else if (FRAME_HAS_MINIBUF_P (f))
    window = FRAME_MINIBUF_WINDOW (f);
  else
    return;

  redraw_cursor_in_window (XWINDOW (window), run_end_begin_meths);
}

/****************************************************************************
 redisplay_output_display_block

 Given a display line, a block number for that start line, output all
 runes between start and end in the specified display block.
 ****************************************************************************/
static void
redisplay_output_display_block (struct window *w, struct display_line *dl, int block,
				int start, int end, int start_pixpos, int cursor_start,
				int cursor_width, int cursor_height)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);

  DEVMETH (d, output_display_block, (w, dl, block, start,
				     end, start_pixpos,
				     cursor_start, cursor_width,
				     cursor_height));
}
  
/****************************************************************************
 redisplay_unmap_subwindows

 Remove subwindows from the area in the box defined by the given
 parameters.
 ****************************************************************************/
static void redisplay_unmap_subwindows (struct frame* f, int x, int y, int width, int height)
{
  int elt;

  for (elt = 0; elt < Dynarr_length (f->subwindow_cachels); elt++)
    {
      struct subwindow_cachel *cachel =
	Dynarr_atp (f->subwindow_cachels, elt);

      if (cachel->being_displayed
	  &&
	  cachel->x + cachel->width > x && cachel->x < x + width
	  &&
	  cachel->y + cachel->height > y && cachel->y < y + height)
	{
	  unmap_subwindow (cachel->subwindow);
	}
    }
}

/****************************************************************************
 redisplay_unmap_subwindows_maybe

 Potentially subwindows from the area in the box defined by the given
 parameters.
 ****************************************************************************/
void redisplay_unmap_subwindows_maybe (struct frame* f, int x, int y, int width, int height)
{
  if (Dynarr_length (FRAME_SUBWINDOW_CACHE (f)))
    {
      redisplay_unmap_subwindows (f, x, y, width, height);
    }
}

/****************************************************************************
 redisplay_output_subwindow


 output a subwindow.  This code borrows heavily from the pixmap stuff,
 although is much simpler not needing to account for partial
 pixmaps, backgrounds etc.
 ****************************************************************************/
void
redisplay_output_subwindow (struct window *w, struct display_line *dl,
			    Lisp_Object image_instance, int xpos, int xoffset,
			    int start_pixpos, int width, face_index findex,
			    int cursor_start, int cursor_width, int cursor_height)
{
  struct Lisp_Image_Instance *p = XIMAGE_INSTANCE (image_instance);
  Lisp_Object window;

  int lheight = dl->ascent + dl->descent - dl->clip;
  int pheight = ((int) IMAGE_INSTANCE_SUBWINDOW_HEIGHT (p) > lheight ? lheight :
		 IMAGE_INSTANCE_SUBWINDOW_HEIGHT (p));

  XSETWINDOW (window, w);

  /* Clear the area the subwindow is going into.  The subwindow itself
     will always take care of the full width.  We don't want to clear
     where it is going to go in order to avoid flicker.  So, all we
     have to take care of is any area above or below the subwindow. Of
     course this is rubbish if the subwindow has transparent areas
     (for instance with frames). */
  /* #### We take a shortcut for now.  We know that since we have
     subwindow_offset hardwired to 0 that the subwindow is against the top
     edge so all we have to worry about is below it. */
  if ((int) (dl->ypos - dl->ascent + pheight) <
      (int) (dl->ypos + dl->descent - dl->clip))
    {
      int clear_x, clear_width;

      int clear_y = dl->ypos - dl->ascent + pheight;
      int clear_height = lheight - pheight;

      if (start_pixpos >= 0 && start_pixpos > xpos)
	{
	  clear_x = start_pixpos;
	  clear_width = xpos + width - start_pixpos;
	}
      else
	{
	  clear_x = xpos;
	  clear_width = width;
	}

      redisplay_clear_region (window, findex, clear_x, clear_y,
			      clear_width, clear_height);
    }
#if 0
  redisplay_clear_region (window, findex, xpos - xoffset, dl->ypos - dl->ascent,
			  width, lheight);
#endif
  /* if we can't view the whole window we can't view any of it */
  if (IMAGE_INSTANCE_SUBWINDOW_HEIGHT (p) > lheight
      ||
      IMAGE_INSTANCE_SUBWINDOW_WIDTH (p) > width)
    {
      redisplay_clear_region (window, findex, xpos - xoffset, dl->ypos - dl->ascent,
			      width, lheight);
      unmap_subwindow (image_instance);
    }
  else
    map_subwindow (image_instance, xpos - xoffset, dl->ypos - dl->ascent);
}

/****************************************************************************
 redisplay_clear_region

 Clear the area in the box defined by the given parameters using the
 given face. This has been generalised so that subwindows can be
 coped with effectively.
 ****************************************************************************/
void
redisplay_clear_region (Lisp_Object locale, face_index findex, int x, int y,
			int width, int height)
{
  struct window *w = NULL;
  struct frame *f = NULL;
  struct device *d;
  Lisp_Object background_pixmap = Qunbound;
  Lisp_Object fcolor = Qnil, bcolor = Qnil;

  if (!width || !height)
     return;

  if (WINDOWP (locale))
    {
      w = XWINDOW (locale);
      f = XFRAME (w->frame);
    }
  else if (FRAMEP (locale))
    {
      w = NULL;
      f = XFRAME (locale);
    }
  else
    abort ();

  d = XDEVICE (f->device);

  /* if we have subwindows in the region we have to unmap them */
  if (Dynarr_length (FRAME_SUBWINDOW_CACHE (f)))
    {
      redisplay_unmap_subwindows (f, x, y, width, height);
    }

  /* #### This isn't quite right for when this function is called
     from the toolbar code. */
  
  /* Don't use a backing pixmap in the border area */
  if (x >= FRAME_LEFT_BORDER_END (f)
      && x < FRAME_RIGHT_BORDER_START (f)
      && y >= FRAME_TOP_BORDER_END (f)
      && y < FRAME_BOTTOM_BORDER_START (f))
    {
      Lisp_Object temp;
      
      if (w)
	{
	  temp = WINDOW_FACE_CACHEL_BACKGROUND_PIXMAP (w, findex);
	  
	  if (IMAGE_INSTANCEP (temp)
	      && IMAGE_INSTANCE_PIXMAP_TYPE_P (XIMAGE_INSTANCE (temp)))
	    {
	      /* #### maybe we could implement such that a string
		 can be a background pixmap? */
	      background_pixmap = temp;
	    }
	}
      else
	{
	  temp = FACE_BACKGROUND_PIXMAP (Vdefault_face, locale);
	  
	  if (IMAGE_INSTANCEP (temp)
	      && IMAGE_INSTANCE_PIXMAP_TYPE_P (XIMAGE_INSTANCE (temp)))
	    {
	      background_pixmap = temp;
	    }
	}
    }      

  if (!UNBOUNDP (background_pixmap) &&
      XIMAGE_INSTANCE_PIXMAP_DEPTH (background_pixmap) == 0)
    {
      if (w)
	{
	  fcolor = WINDOW_FACE_CACHEL_FOREGROUND (w, findex);
	  bcolor = WINDOW_FACE_CACHEL_BACKGROUND (w, findex);
	}
      else
	{
	  fcolor = FACE_FOREGROUND (Vdefault_face, locale);
	  bcolor = FACE_BACKGROUND (Vdefault_face, locale);
	}
    }
  else
    {
      fcolor = (w ?
		WINDOW_FACE_CACHEL_BACKGROUND (w, findex) :
		FACE_BACKGROUND (Vdefault_face, locale));
      
    }
  
  if (UNBOUNDP (background_pixmap))
    background_pixmap = Qnil;
  
  DEVMETH (d, clear_region, 
	   (locale, d, f, findex, x, y, width, height, fcolor, bcolor, background_pixmap));
}

/*****************************************************************************
 redisplay_clear_top_of_window

 If window is topmost, clear the internal border above it.
 ****************************************************************************/
static void
redisplay_clear_top_of_window (struct window *w)
{
  Lisp_Object window;
  XSETWINDOW (window, w);

  if (!NILP (Fwindow_highest_p (window)))
    {
      struct frame *f = XFRAME (w->frame);
      int x, y, width, height;

      x = w->pixel_left;
      width = w->pixel_width;

      if (window_is_leftmost (w))
	{
	  x -= FRAME_BORDER_WIDTH (f);
	  width += FRAME_BORDER_WIDTH (f);
	}
      if (window_is_rightmost (w))
	width += FRAME_BORDER_WIDTH (f);

      y = FRAME_TOP_BORDER_START (f) - 1;
      height = FRAME_BORDER_HEIGHT (f) + 1;

      redisplay_clear_region (window, DEFAULT_INDEX, x, y, width, height);
    }
}

/*****************************************************************************
 redisplay_clear_bottom_of_window

 Clear window from right below the last display line to right above
 the modeline.  The calling function can limit the area actually
 erased by setting min_start and/or max_end to positive values.
 ****************************************************************************/
void
redisplay_clear_bottom_of_window (struct window *w, display_line_dynarr *ddla,
				  int min_start, int max_end)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);
  int ypos1, ypos2;
  int ddla_len = Dynarr_length (ddla);

  ypos2 = WINDOW_TEXT_BOTTOM (w);
#ifdef HAVE_SCROLLBARS
  /* This adjustment is to catch the intersection of any scrollbars. */
  if (f->windows_structure_changed && NILP (w->scrollbar_on_top_p))
    ypos2 += window_scrollbar_height (w);
#endif

  if (ddla_len)
    {
      if (ddla_len == 1 && Dynarr_atp (ddla, 0)->modeline)
	{
	  ypos1 = WINDOW_TEXT_TOP (w);
#ifdef HAVE_SCROLLBARS
	  /* This adjustment is to catch the intersection of any scrollbars. */
	  if (f->windows_structure_changed && !NILP (w->scrollbar_on_top_p))
	    ypos1 -= window_scrollbar_height (w);
#endif
	}
      else
	{
	  struct display_line *dl = Dynarr_atp (ddla, ddla_len - 1);
	  ypos1 = dl->ypos + dl->descent - dl->clip;
	}
    }
  else
    ypos1 = WINDOW_TEXT_TOP (w);

  /* #### See if this can be made conditional on the frame
     changing size. */
  if (MINI_WINDOW_P (w))
    ypos2 += FRAME_BORDER_HEIGHT (f);

  if (min_start >= 0 && ypos1 < min_start)
    ypos1 = min_start;
  if (max_end >= 0 && ypos2 > max_end)
    ypos2 = max_end;

  if (ypos2 <= ypos1)
    return;

  DEVMETH (d, clear_to_window_end, (w, ypos1, ypos2));
}

/*****************************************************************************
 redisplay_update_line

 This is used during incremental updates to update a single line and
 correct the offsets on all lines below it.  At the moment
 update_values is false if we are only updating the modeline.
 ****************************************************************************/
void
redisplay_update_line (struct window *w, int first_line, int last_line,
		       int update_values)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);

  display_line_dynarr *cdla = window_display_lines (w, CURRENT_DISP);
  display_line_dynarr *ddla = window_display_lines (w, DESIRED_DISP);

  DEVMETH (d, output_begin, (d));

  while (first_line <= last_line)
    {
      Charcount old_len = (Dynarr_atp (cdla, first_line)->end_bufpos -
			   Dynarr_atp (cdla, first_line)->bufpos);
      Charcount new_len = (Dynarr_atp (ddla, first_line)->end_bufpos -
			   Dynarr_atp (ddla, first_line)->bufpos);

      assert (Dynarr_length (cdla) == Dynarr_length (ddla));

      /* Output the changes. */
      output_display_line (w, cdla, ddla, first_line, -1, -1);

      /* Update the offsets. */
      if (update_values)
	{
	  int cur_line = first_line + 1;
	  while (cur_line < Dynarr_length (cdla))
	    {
	      Dynarr_atp (cdla, cur_line)->offset += (new_len - old_len);
	      Dynarr_atp (ddla, cur_line)->offset += (new_len - old_len);
	      cur_line++;
	    }
	}

      /* Update the window_end_pos and other settings. */
      if (update_values)
	{
	  w->window_end_pos[CURRENT_DISP] -= (new_len - old_len);

	  if (Dynarr_atp (ddla, first_line)->cursor_elt != -1)
	    {
	      w->last_point_x[CURRENT_DISP] = w->last_point_x[DESIRED_DISP];
	      w->last_point_y[CURRENT_DISP] = w->last_point_y[DESIRED_DISP];
	    }
	}

      first_line++;
    }

  /* Update the window max line length.  We have to scan the entire
     set of display lines otherwise we might not detect if the max is
     supposed to shrink. */
  if (update_values)
    {
      int line = 0;

      w->max_line_len = 0;
      while (line < Dynarr_length (ddla))
	{
	  struct display_line *dl = Dynarr_atp (ddla, line);

	  if (!dl->modeline)
	    w->max_line_len = max (dl->num_chars, w->max_line_len);

	  line++;
	}
    }

  w->last_modified[CURRENT_DISP] = w->last_modified[DESIRED_DISP];
  w->last_facechange[CURRENT_DISP] = w->last_facechange[DESIRED_DISP];
  Fset_marker (w->last_point[CURRENT_DISP],
	       Fmarker_position (w->last_point[DESIRED_DISP]), w->buffer);
  Fset_marker (w->last_start[CURRENT_DISP],
	       Fmarker_position (w->last_start[DESIRED_DISP]), w->buffer);

  /* We don't bother updating the vertical scrollbars here.  This
     gives us a performance increase while having minimal loss of
     quality to the scrollbar slider size and position since when this
     function is called we know that the changes to the buffer were
     very localized.  We have to update the horizontal scrollbars,
     though, because this routine could cause a change which has a
     larger impact on their sizing. */
  /* #### See if we can get away with only calling this if
     max_line_len is greater than the window_char_width. */
#if defined(HAVE_SCROLLBARS) && defined(HAVE_X_WINDOWS)
  {
    extern int stupid_vertical_scrollbar_drag_hack;

    update_window_scrollbars (w, NULL, 1, stupid_vertical_scrollbar_drag_hack);
    stupid_vertical_scrollbar_drag_hack = 1;
  }
#endif

  /* This has to be done after we've updated the values.  We don't
     call output_end for tty frames.  Redisplay will do this after all
     tty windows have been updated.  This cuts down on cursor
     flicker. */
  if (FRAME_TTY_P (f))
    redisplay_redraw_cursor (f, 0);
  else
    DEVMETH (d, output_end, (d));
}

/*****************************************************************************
 redisplay_output_window

 For the given window W, ensure that the current display lines are
 equal to the desired display lines, outputing changes as necessary.

 #### Fuck me.  This just isn't going to cut it for tty's.  The output
 decisions for them must be based on the contents of the entire frame
 because that is how the available output capabilities think.  The
 solution is relatively simple.  Create redisplay_output_frame.  This
 will basically merge all of the separate window display structs into
 a single one for the frame.  This combination structure will be able
 to be passed to the same output_display_line which works for windows
 on X frames and the right things will happen.  It just takes time to
 do.
 ****************************************************************************/
void
redisplay_output_window (struct window *w)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);

  display_line_dynarr *cdla = window_display_lines (w, CURRENT_DISP);
  display_line_dynarr *ddla = window_display_lines (w, DESIRED_DISP);

  int cdla_len = Dynarr_length (cdla);
  int ddla_len = Dynarr_length (ddla);

  int line;
  int need_to_clear_bottom = 0;
  int need_to_clear_start = -1;
  int need_to_clear_end = -1;

  /* Backgrounds may have changed or windows may have gone away
     leaving dividers lying around. */
  if (f->faces_changed
      || f->windows_structure_changed
      || w->shadow_thickness_changed)
    need_to_clear_bottom = 1;

  /* The first thing we do is determine if we are going to need to
     clear the bottom of the window.  We only need to do this if the
     bottom of the current display lines is below the bottom of the
     desired display lines.  Note that the number of lines is
     irrelevant.  Only the position matters.  We also clear to the
     bottom of the window if the modeline has shifted position. */
  /* #### We can't blindly not clear the bottom if f->clear is true
     since there might be a window-local background.  However, for
     those cases where there isn't, clearing the end of the window in
     this case sucks. */
  if (!need_to_clear_bottom)
    {
      struct display_line *cdl, *ddl;

      /* If the modeline has changed position or size, clear the bottom
	 of the window. */
      if (!need_to_clear_bottom)
	{
	  cdl = ddl = 0;

	  if (cdla_len)
	    cdl = Dynarr_atp (cdla, 0);
	  if (ddla_len)
	    ddl = Dynarr_atp (ddla, 0);

	  if (!cdl || !ddl)
	    need_to_clear_bottom = 1;
	  else if ((!cdl->modeline && ddl->modeline)
		   || (cdl->modeline && !ddl->modeline))
	    need_to_clear_bottom = 1;
	  else if (cdl->ypos != ddl->ypos ||
		   cdl->ascent != ddl->ascent ||
		   cdl->descent != ddl->descent ||
		   cdl->clip != ddl->clip)
	    need_to_clear_bottom = 1;

	  /* #### This kludge is to make sure the modeline shadows get
	     redrawn if the modeline position shifts. */
	  if (need_to_clear_bottom)
	    w->shadow_thickness_changed = 1;
	}

      if (!need_to_clear_bottom)
	{
	  cdl = ddl = 0;

	  if (cdla_len)
	    cdl = Dynarr_atp (cdla, cdla_len - 1);
	  if (ddla_len)
	    ddl = Dynarr_atp (ddla, ddla_len - 1);

	  if (!cdl || !ddl)
	    need_to_clear_bottom = 1;
	  else
	    {
	      int cdl_bottom, ddl_bottom;

	      cdl_bottom = cdl->ypos + cdl->descent;
	      ddl_bottom = ddl->ypos + ddl->descent;

	      if (cdl_bottom > ddl_bottom)
		{
		  need_to_clear_bottom = 1;
		  need_to_clear_start = ddl_bottom;
		  need_to_clear_end = cdl_bottom;
		}
	    }
	}
    }

  /* Perform any output initialization. */
  DEVMETH (d, output_begin, (d));

  /* If the window's structure has changed clear the internal border
     above it if it is topmost (the function will check). */
  if (f->windows_structure_changed)
    redisplay_clear_top_of_window (w);

  /* Output each line. */
  for (line = 0; line < Dynarr_length (ddla); line++)
    {
      output_display_line (w, cdla, ddla, line, -1, -1);
    }

  /* If the number of display lines has shrunk, adjust. */
  if (cdla_len > ddla_len)
    {
      Dynarr_length (cdla) = ddla_len;
    }

  /* Output a vertical divider between windows, if necessary. */
  if (window_needs_vertical_divider (w)
      && (f->windows_structure_changed || f->clear))
    {
      DEVMETH (d, output_vertical_divider, (w, f->windows_structure_changed));
    }

  /* Clear the rest of the window, if necessary. */
  if (need_to_clear_bottom)
    {
      redisplay_clear_bottom_of_window (w, ddla, need_to_clear_start,
					need_to_clear_end);
    }

  w->window_end_pos[CURRENT_DISP] = w->window_end_pos[DESIRED_DISP];
  Fset_marker (w->start[CURRENT_DISP],
	       make_int (marker_position (w->start[DESIRED_DISP])),
	       w->buffer);
  Fset_marker (w->pointm[CURRENT_DISP],
	       make_int (marker_position (w->pointm[DESIRED_DISP])),
	       w->buffer);
  w->last_modified[CURRENT_DISP] = w->last_modified[DESIRED_DISP];
  w->last_facechange[CURRENT_DISP] = w->last_facechange[DESIRED_DISP];
  Fset_marker (w->last_start[CURRENT_DISP],
	       Fmarker_position (w->last_start[DESIRED_DISP]), w->buffer);
  Fset_marker (w->last_point[CURRENT_DISP],
	       Fmarker_position (w->last_point[DESIRED_DISP]), w->buffer);
  w->last_point_x[CURRENT_DISP] = w->last_point_x[DESIRED_DISP];
  w->last_point_y[CURRENT_DISP] = w->last_point_y[DESIRED_DISP];
  w->shadow_thickness_changed = 0;

  set_window_display_buffer (w, XBUFFER (w->buffer));
  find_window_mirror (w)->truncate_win = window_truncation_on (w);

  /* Overkill on invalidating the cache.  It is very bad for it to not
     get invalidated when it should be. */
  INVALIDATE_DEVICE_PIXEL_TO_GLYPH_CACHE (d);

  /* We don't call output_end for tty frames.  Redisplay will do this
     after all tty windows have been updated.  This cuts down on
     cursor flicker. */
  if (FRAME_TTY_P (f))
    redisplay_redraw_cursor (f, 0);
  else
    DEVMETH (d, output_end, (d));

#ifdef HAVE_SCROLLBARS
  update_window_scrollbars (w, NULL, !MINI_WINDOW_P (w), 0);
#endif
}
