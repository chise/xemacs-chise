/* mswindows output and frame manipulation routines.
   Copyright (C) 1994, 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1994 Lucid, Inc.
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

/* Synched up with:  Not in FSF. */

/* Authorship:

   Chuck Thompson
   Lots of work done by Ben Wing for Mule
   Partially rewritten for mswindows by Jonathan Harris, November 1997 for 21.0.
 */

#include <config.h>
#include "lisp.h"

#include "console-msw.h"
#include "objects-msw.h"

#include "buffer.h"
#include "debug.h"
#include "events.h"
#include "faces.h"
#include "frame.h"
#include "glyphs-msw.h"
#include "redisplay.h"
#include "sysdep.h"
#include "window.h"

#include "windows.h"
#ifdef MULE
#include "mule-ccl.h"
#include "character.h"
#endif

#define MSWINDOWS_EOL_CURSOR_WIDTH	5

/*
 * Random forward declarations
 */
static void mswindows_update_dc (HDC hdc, Lisp_Object font, Lisp_Object fg,
				 Lisp_Object bg, Lisp_Object bg_pmap);
static void mswindows_output_vertical_divider (struct window *w, int clear);
static void mswindows_redraw_exposed_windows (Lisp_Object window, int x,
					int y, int width, int height);
static void mswindows_output_dibitmap (struct frame *f, 
				       struct Lisp_Image_Instance *p,
				       int x, int y, 
				       int clip_x, int clip_y, 
				       int clip_width, int clip_height, 
				       int width, int height,
				       int pixmap_offset,
				       int offset_bitmap);
static void mswindows_output_pixmap (struct window *w, struct display_line *dl,
				     Lisp_Object image_instance, int xpos,
				     int xoffset, int start_pixpos, int width,
				     face_index findex, int cursor_start, 
				     int cursor_width, int cursor_height,
				     int offset_bitmap);

typedef struct textual_run
{
  Lisp_Object charset;
  unsigned char *ptr;
  int len;
  int dimension;
} textual_run;

/* Separate out the text in DYN into a series of textual runs of a
   particular charset.  Also convert the characters as necessary into
   the format needed by XDrawImageString(), XDrawImageString16(), et
   al.  (This means converting to one or two byte format, possibly
   tweaking the high bits, and possibly running a CCL program.) You
   must pre-allocate the space used and pass it in. (This is done so
   you can alloca() the space.)  You need to allocate (2 * len) bytes
   of TEXT_STORAGE and (len * sizeof (textual_run)) bytes of
   RUN_STORAGE, where LEN is the length of the dynarr.

   Returns the number of runs actually used. */

static int
separate_textual_runs (unsigned char *text_storage,
		       textual_run *run_storage,
		       CONST Emchar *str, Charcount len)
{
  Lisp_Object prev_charset = Qunbound; /* not Qnil because that is a
					  possible valid charset when
					  MULE is not defined */
  int runs_so_far = 0;
  int i;
#ifdef MULE
  struct ccl_program char_converter;
  int need_ccl_conversion = 0;
#endif

  for (i = 0; i < len; i++)
    {
      Emchar ch = str[i];
      Lisp_Object charset;
      int byte1, byte2;
      int dimension;
      int graphic;

      BREAKUP_CHAR (ch, charset, byte1, byte2);
      dimension = XCHARSET_DIMENSION (charset);
      graphic   = XCHARSET_GRAPHIC   (charset);

      if (!EQ (charset, prev_charset))
	{
	  run_storage[runs_so_far].ptr       = text_storage;
	  run_storage[runs_so_far].charset   = charset;
	  run_storage[runs_so_far].dimension = dimension;

	  if (runs_so_far)
	    {
	      run_storage[runs_so_far - 1].len =
		text_storage - run_storage[runs_so_far - 1].ptr;
	      if (run_storage[runs_so_far - 1].dimension == 2)
		run_storage[runs_so_far - 1].len >>= 1;
	    }
	  runs_so_far++;
	  prev_charset = charset;
#ifdef MULE
	  {
	    Lisp_Object ccl_prog = XCHARSET_CCL_PROGRAM (charset);
	    need_ccl_conversion = !NILP (ccl_prog);
	    if (need_ccl_conversion)
	      setup_ccl_program (&char_converter, ccl_prog);
	  }
#endif
	}

      if (graphic == 0)
	{
	  byte1 &= 0x7F;
	  byte2 &= 0x7F;
	}
      else if (graphic == 1)
	{
	  byte1 |= 0x80;
	  byte2 |= 0x80;
	}
#ifdef MULE
      if (need_ccl_conversion)
	{
	  char_converter.reg[0] = XCHARSET_ID (charset);
	  char_converter.reg[1] = byte1;
	  char_converter.reg[2] = byte2;
	  char_converter.ic = 0; /* start at beginning each time */
	  ccl_driver (&char_converter, 0, 0, 0, 0, CCL_MODE_ENCODING);
	  byte1 = char_converter.reg[1];
	  byte2 = char_converter.reg[2];
	}
#endif
      *text_storage++ = (unsigned char) byte1;
      if (dimension == 2)
	*text_storage++ = (unsigned char) byte2;
    }

  if (runs_so_far)
    {
      run_storage[runs_so_far - 1].len =
	text_storage - run_storage[runs_so_far - 1].ptr;
      if (run_storage[runs_so_far - 1].dimension == 2)
	run_storage[runs_so_far - 1].len >>= 1;
    }

  return runs_so_far;
}


static int
mswindows_text_width_single_run (HDC hdc, struct face_cachel *cachel,
				 textual_run *run)
{
  Lisp_Object font_inst = FACE_CACHEL_FONT (cachel, run->charset);
  struct Lisp_Font_Instance *fi = XFONT_INSTANCE (font_inst);
  SIZE size;

  if (!fi->proportional_p || !hdc)
    return (fi->width * run->len);
  else
    {
      assert(run->dimension == 1);	/* #### FIXME! */
      mswindows_update_dc (hdc, font_inst, Qnil, Qnil, Qnil);
      GetTextExtentPoint32 (hdc, run->ptr, run->len, &size);
      return(size.cx);
    }
}


/*****************************************************************************
 mswindows_update_dc

 Given a number of parameters munge the DC so it has those properties.
 ****************************************************************************/
static void
mswindows_update_dc (HDC hdc, Lisp_Object font, Lisp_Object fg,
		     Lisp_Object bg, Lisp_Object bg_pmap)
{
  if (!NILP (font))
    SelectObject(hdc, FONT_INSTANCE_MSWINDOWS_HFONT (XFONT_INSTANCE (font)));


  if (!NILP (fg))
    {
      SetTextColor (hdc, COLOR_INSTANCE_MSWINDOWS_COLOR 
		    (XCOLOR_INSTANCE (fg)));
    }
  if (!NILP (bg))
    { 
      SetBkMode (hdc, OPAQUE);
      SetBkColor (hdc, COLOR_INSTANCE_MSWINDOWS_COLOR (XCOLOR_INSTANCE (bg)));
    }
  else 
    {
      SetBkMode (hdc, TRANSPARENT);
    }
}


/*****************************************************************************
 mswindows_apply_face_effects

 Draw underline and strikeout as if this was X.
 #### On mswindows this really should be done as part of drawing the font.
 The line width used is chosen arbitrarily from the font height.
 ****************************************************************************/
static void
mswindows_apply_face_effects (HDC hdc, struct display_line *dl, int xpos,
			      int width, struct Lisp_Font_Instance *fi,
			      struct face_cachel *cachel,
			      struct face_cachel *color_cachel)
{
  int yclip;
  HBRUSH brush, oldbrush;
  RECT rect;

  brush = CreateSolidBrush (COLOR_INSTANCE_MSWINDOWS_COLOR (
			    XCOLOR_INSTANCE (color_cachel->foreground)));
  if (brush)
    {
      yclip = dl->ypos + dl->descent - dl->clip;
      rect.left = xpos;
      rect.right = xpos + width;
      oldbrush = SelectObject (hdc, brush);

      if (cachel->underline)
	{
	  rect.top = dl->ypos + dl->descent/2;
	  rect.bottom = rect.top + (fi->height >= 0x20 ? 2 : 1);
	  if (rect.bottom <= yclip)
	    FillRect (hdc, &rect, brush);
	}
      if (cachel->strikethru)
	{
	  rect.top = dl->ypos + dl->descent - (dl->ascent + dl->descent)/2;
	  rect.bottom = rect.top + (fi->height >= 0x20 ? 2 : 1);
	  if (rect.bottom <= yclip)
	    FillRect (hdc, &rect, brush);
	}

      SelectObject (hdc, oldbrush);
      DeleteObject (brush);
    }
}


/*****************************************************************************
 mswindows_output_hline

 Output a horizontal line in the foreground of its face.
 ****************************************************************************/
static void
mswindows_output_hline (struct window *w, struct display_line *dl, struct rune *rb)
{ /* XXX Implement me */
}


/*****************************************************************************
 mswindows_output_blank

 Output a blank by clearing the area it covers in the background color
 of its face.
 ****************************************************************************/
static void
mswindows_output_blank (struct window *w, struct display_line *dl, struct rune *rb, int start_pixpos)
{
  struct frame *f = XFRAME (w->frame);
  RECT rect = { rb->xpos, dl->ypos-dl->ascent,
		rb->xpos+rb->width, dl->ypos+dl->descent-dl->clip };
  struct face_cachel *cachel = WINDOW_FACE_CACHEL (w, rb->findex);

  Lisp_Object bg_pmap = WINDOW_FACE_CACHEL_BACKGROUND_PIXMAP (w, rb->findex);

  if (!IMAGE_INSTANCEP (bg_pmap)
      || !IMAGE_INSTANCE_PIXMAP_TYPE_P (XIMAGE_INSTANCE (bg_pmap)))
    bg_pmap = Qnil;

  if (!NILP(bg_pmap))
    {
      /* blank the background in the appropriate color */
      mswindows_update_dc (FRAME_MSWINDOWS_DC (f), Qnil, cachel->foreground,
			   cachel->background, Qnil);

      mswindows_output_pixmap (w, dl, bg_pmap, 
			       rb->xpos, 0 /*rb->object.dglyph.xoffset*/,
			       start_pixpos, rb->width, rb->findex,
			       0, 0, 0, TRUE);
    }
  else 
    {
      mswindows_update_dc (FRAME_MSWINDOWS_DC (f), Qnil, Qnil,
			   cachel->background, Qnil);
      
      ExtTextOut (FRAME_MSWINDOWS_DC (f), 0, 0, ETO_OPAQUE, 
		  &rect, NULL, 0, NULL);
    }
}


/*****************************************************************************
 mswindows_output_cursor

 Draw a normal or end-of-line cursor. The end-of-line cursor is
 narrower than the normal cursor.
 ****************************************************************************/
static void
mswindows_output_cursor (struct window *w, struct display_line *dl, int xpos,
			 int width, face_index findex, Emchar ch, int image_p)
{
  struct frame *f = XFRAME (w->frame);
  struct device *d = XDEVICE (f->device);
  struct face_cachel *cachel=0;
  Lisp_Object font = Qnil;
  int focus = EQ (w->frame, DEVICE_FRAME_WITH_FOCUS_REAL (d));
  HDC hdc = FRAME_MSWINDOWS_DC (f);
  unsigned int face_index=0;
  char *p_char = NULL;
  int n_char = 0;
  RECT rect = { xpos,
		dl->ypos - dl->ascent,
		xpos + width,
		dl->ypos + dl->descent - dl->clip};
  Lisp_Object bar = symbol_value_in_buffer (Qbar_cursor,
					    WINDOW_BUFFER (w));
  int bar_p = image_p || !NILP (bar);
  int cursor_p = !NILP (w->text_cursor_visible_p);
  int real_char_p = ch != 0;

  if (real_char_p)
    {
      /* Use the font from the underlying character */
      cachel = WINDOW_FACE_CACHEL (w, findex);

      /* #### MULE: Need to know the charset! */
      font = FACE_CACHEL_FONT (cachel, Vcharset_ascii);
    }

  if ((focus || bar_p) && real_char_p)
    {
      p_char = (char*) &ch;
      n_char = 1;
    }

  if (!image_p)
    {
      struct face_cachel *color_cachel;

      /* Use cursor fg/bg for block cursor, or character fg/bg for the bar
	 or when we need to erase the cursor. Output nothing at eol if bar
	 cursor */
      face_index = get_builtin_face_cache_index (w, Vtext_cursor_face);
      color_cachel = WINDOW_FACE_CACHEL (w, ((!cursor_p || bar_p) ?
					     findex : face_index));
      mswindows_update_dc (hdc, font, color_cachel->foreground,
			   color_cachel->background, Qnil);
      ExtTextOut (hdc, xpos, dl->ypos, ETO_OPAQUE|ETO_CLIPPED, &rect, p_char, n_char, NULL);
      if (real_char_p && (cachel->underline || cachel->strikethru))
        mswindows_apply_face_effects (hdc, dl, xpos, width,
				      XFONT_INSTANCE (font),
				      cachel, color_cachel);
    }

  if (!cursor_p)
    return;

  if (focus && bar_p)
    {
      rect.right = rect.left + (EQ (bar, Qt) ? 1 : min (2, width));
      face_index = get_builtin_face_cache_index (w, Vtext_cursor_face);
      cachel = WINDOW_FACE_CACHEL (w, face_index);
      mswindows_update_dc (hdc, Qnil, Qnil, cachel->background, Qnil);
      ExtTextOut (hdc, xpos, dl->ypos, ETO_OPAQUE, &rect, NULL, 0, NULL);
    }
  else if (!focus)
    {
      /* Now have real character drawn in its own color. We deflate
	 the rectangle so character cell will be bounded by the
	 previously drawn cursor shape */
      InflateRect (&rect, -1, -1);

      if (real_char_p)
	{
	  p_char = (char*) &ch;
	  n_char = 1;
	}

      face_index = get_builtin_face_cache_index (w, Vdefault_face);
      cachel = WINDOW_FACE_CACHEL (w, (real_char_p ? findex : face_index));
      mswindows_update_dc (hdc, Qnil, cachel->foreground,
			   cachel->background, Qnil);
      ExtTextOut (hdc, xpos, dl->ypos, ETO_OPAQUE | ETO_CLIPPED,
		  &rect, p_char, n_char, NULL);
      if (cachel->underline || cachel->strikethru)
        mswindows_apply_face_effects (hdc, dl, xpos+1, width-2,
				      XFONT_INSTANCE (font),
				      cachel, cachel);
    }
}


/*****************************************************************************
 mswindows_output_string

 Given a string and a starting position, output that string in the
 given face.
 Correctly handles multiple charsets in the string.

 The meaning of the parameters is something like this:

 W		Window that the text is to be displayed in.
 DL		Display line that this text is on.  The values in the
 		structure are used to determine the vertical position and
		clipping range of the text.
 BUF		Dynamic array of Emchars specifying what is actually to be
		drawn.
 XPOS		X position in pixels where the text should start being drawn.
 XOFFSET	Number of pixels to be chopped off the left side of the
 		text.  The effect is as if the text were shifted to the
		left this many pixels and clipped at XPOS.
 CLIP_START	Clip everything left of this X position.
 WIDTH		Clip everything right of XPOS + WIDTH.
 FINDEX		Index for the face cache element describing how to display
 		the text.
 ****************************************************************************/
void
mswindows_output_string (struct window *w, struct display_line *dl,
		   Emchar_dynarr *buf, int xpos, int xoffset, int clip_start,
		   int width, face_index findex)
{
  struct frame *f = XFRAME (w->frame);
  /* struct device *d = XDEVICE (f->device);*/
  Lisp_Object window;
  HDC hdc = FRAME_MSWINDOWS_DC (f);
  int clip_end;
  Lisp_Object bg_pmap;
  int len = Dynarr_length (buf);
  unsigned char *text_storage = (unsigned char *) alloca (2 * len);
  textual_run *runs = alloca_array (textual_run, len);
  int nruns;
  int i, height;
  RECT rect;
  struct face_cachel *cachel = WINDOW_FACE_CACHEL (w, findex);

  XSETWINDOW (window, w);

#if 0	/* #### FIXME? */
  /* We can't work out the width before we've set the font in the DC */
  if (width < 0)
    width = mswindows_text_width (cachel, Dynarr_atp (buf, 0), Dynarr_length (buf));
#else
  assert(width>=0);
#endif

  /* Regularize the variables passed in. */
  if (clip_start < xpos)
    clip_start = xpos;
  clip_end = xpos + width;
  if (clip_start >= clip_end)
    /* It's all clipped out. */
    return;

  xpos -= xoffset;

  /* sort out the destination rectangle */
  height = DISPLAY_LINE_HEIGHT (dl);
  rect.left = clip_start;
  rect.top  = dl->ypos - dl->ascent;
  rect.right = clip_end;
  rect.bottom = height + dl->ypos - dl->ascent;

  /* output the background pixmap if there is one */
  bg_pmap = cachel->background_pixmap;
  if (!IMAGE_INSTANCEP (bg_pmap)
      || !IMAGE_INSTANCE_PIXMAP_TYPE_P (XIMAGE_INSTANCE (bg_pmap)))
    bg_pmap = Qnil;

  if (!NILP(bg_pmap))
    {
      /* blank the background in the appropriate color */
      mswindows_update_dc (hdc, Qnil, cachel->foreground,
			   cachel->background, Qnil);

      mswindows_output_pixmap (w, dl, bg_pmap, 
			       xpos, xoffset,
			       clip_start, width, findex,
			       0, 0, 0, TRUE);
      /* output pixmap calls this so we have to recall to get correct
         references */
      cachel = WINDOW_FACE_CACHEL (w, findex);
    }

  nruns = separate_textual_runs (text_storage, runs, Dynarr_atp (buf, 0),
				 Dynarr_length (buf));

  for (i = 0; i < nruns; i++)
    {
      Lisp_Object font = FACE_CACHEL_FONT (cachel, runs[i].charset);
      struct Lisp_Font_Instance *fi = XFONT_INSTANCE (font);
      int this_width;

      if (EQ (font, Vthe_null_font_instance))
	continue;

      mswindows_update_dc (hdc, font, cachel->foreground,
			   NILP(bg_pmap) ? cachel->background : Qnil, Qnil);

      this_width = mswindows_text_width_single_run (hdc, cachel, runs + i);
      
      /* cope with fonts taller than lines */
      if ((int) fi->height < (int) (height + dl->clip))
	{
	  int clear_start = max (xpos, clip_start);
	  int clear_end = min (xpos + this_width, clip_end);
	  
	  {
	    redisplay_clear_region (window, findex, clear_start,
				    dl->ypos - dl->ascent, 
				    clear_end - clear_start,
				    height);
	    /* output pixmap calls this so we have to recall to get correct
	       references */
	    cachel = WINDOW_FACE_CACHEL (w, findex);
	  }
	}

      assert (runs[i].dimension == 1);	/* #### FIXME: Broken when Mule? */
      ExtTextOut (hdc, xpos, dl->ypos,
		  NILP(bg_pmap) ? ETO_CLIPPED | ETO_OPAQUE : ETO_CLIPPED,
		  &rect, (char *) runs[i].ptr, runs[i].len, NULL); 

      /* #### X does underline/strikethrough here so we do the same.
	 On mswindows, underline/strikethrough really belongs to the font */
      if (cachel->underline || cachel->strikethru)
        mswindows_apply_face_effects (hdc, dl, xpos, this_width, fi,
				      cachel, cachel);
      xpos += this_width;
    }
}

static void
mswindows_output_dibitmap (struct frame *f, struct Lisp_Image_Instance *p,
			   int x, int y, 
			   int clip_x, int clip_y, 
			   int clip_width, int clip_height, 
			   int width, int height, int pixmap_offset,
			   int offset_bitmap)
{
  HDC hdc = FRAME_MSWINDOWS_DC (f);
  HGDIOBJ old=NULL;
  COLORREF bgcolor = GetBkColor (hdc);
  int need_clipping = (clip_x || clip_y);
  int yoffset=0;
  int xoffset=0;

  /* do we need to offset the pixmap vertically? this is necessary
     for background pixmaps. */
  if (offset_bitmap)
    {
      yoffset = y % IMAGE_INSTANCE_PIXMAP_HEIGHT (p);
      xoffset = x % IMAGE_INSTANCE_PIXMAP_WIDTH (p);
      /* the width is handled by mswindows_output_pixmap_region */
    }

  if (need_clipping)
    {
    }

  /* first blt the mask */
  if (IMAGE_INSTANCE_MSWINDOWS_MASK (p))
    {
      RGBQUAD col;
      col.rgbBlue = GetBValue (bgcolor);
      col.rgbRed = GetRValue (bgcolor);
      col.rgbGreen = GetGValue (bgcolor);
      col.rgbReserved = 0;

      old = SelectObject (FRAME_MSWINDOWS_CDC (f),
			  IMAGE_INSTANCE_MSWINDOWS_MASK (p));
      
      SetDIBColorTable (FRAME_MSWINDOWS_CDC (f), 1, 1, &col);

      BitBlt (hdc, 
	      x,y,
	      width, height, 
	      FRAME_MSWINDOWS_CDC (f),
	      xoffset,yoffset, 
	      SRCCOPY);                  

      SelectObject (FRAME_MSWINDOWS_CDC (f), old);
    }
  
  /* now blt the bitmap itself. */
  old = SelectObject (FRAME_MSWINDOWS_CDC (f),
		      IMAGE_INSTANCE_MSWINDOWS_BITMAP (p));

  BitBlt (hdc, 
	  x,y,
	  width, height, 
	  FRAME_MSWINDOWS_CDC (f),
	  xoffset, yoffset, 
	  IMAGE_INSTANCE_MSWINDOWS_MASK (p) ? SRCINVERT : SRCCOPY);

  SelectObject (FRAME_MSWINDOWS_CDC (f),old);

  if (need_clipping)
    {
    }
}

/*
 * X gc's have this nice property that setting the bg pixmap will
 * output it offset relative to the window. Windows doesn't have this
 * feature so we have to emulate this by outputting multiple pixmaps 
 */
static void
mswindows_output_dibitmap_region (struct frame *f, 
				  struct Lisp_Image_Instance *p,
				  int x, int y, 
				  int clip_x, int clip_y, 
				  int clip_width, int clip_height, 
				  int width, int height, int pixmap_offset,
				  int offset_bitmap)
{
  int pwidth = min (width, IMAGE_INSTANCE_PIXMAP_WIDTH (p));
  int pheight = min (height, IMAGE_INSTANCE_PIXMAP_HEIGHT (p));
  int pxoffset = 0, pyoffset = 0;

  /* when doing a bg pixmap do a partial pixmap first so that we
     blt whole pixmaps thereafter */

  if (offset_bitmap)
    {
      pheight = min (pheight, IMAGE_INSTANCE_PIXMAP_HEIGHT (p) -
		     y % IMAGE_INSTANCE_PIXMAP_HEIGHT (p));
    }
  
  while (pheight > 0)
    {
      if (offset_bitmap)
	{
	  pwidth = min (min (width, IMAGE_INSTANCE_PIXMAP_WIDTH (p)),
			IMAGE_INSTANCE_PIXMAP_WIDTH (p) -
			x % IMAGE_INSTANCE_PIXMAP_WIDTH (p));
	  pxoffset = 0;
	}
      while (pwidth > 0)
	{
	  mswindows_output_dibitmap (f, p,
				     x + pxoffset, y + pyoffset, 
				     clip_x, clip_y, 
				     clip_width, clip_height, 
				     pwidth, pheight, pixmap_offset,
				     offset_bitmap);
	  pxoffset += pwidth;
	  pwidth = min ((width-pxoffset), 
			IMAGE_INSTANCE_PIXMAP_WIDTH (p));
	}
      pyoffset += pheight;
      pheight = min ((height-pyoffset), 
		     IMAGE_INSTANCE_PIXMAP_HEIGHT (p));
    }
}

static void
mswindows_output_pixmap (struct window *w, struct display_line *dl,
			 Lisp_Object image_instance, int xpos, int xoffset,
			 int start_pixpos, int width, face_index findex,
			 int cursor_start, int cursor_width, int cursor_height,
			 int offset_bitmap)
{
  struct frame *f = XFRAME (w->frame);
  HDC hdc = FRAME_MSWINDOWS_DC (f);

  struct Lisp_Image_Instance *p = XIMAGE_INSTANCE (image_instance);
  Lisp_Object window;

  int lheight = DISPLAY_LINE_HEIGHT (dl);
  int pheight = ((int) IMAGE_INSTANCE_PIXMAP_HEIGHT (p) > lheight ? lheight :
		 IMAGE_INSTANCE_PIXMAP_HEIGHT (p));
  int clip_x, clip_y, clip_width, clip_height;

  /* The pixmap_offset is used to center the pixmap on lines which are
     shorter than it is.  This results in odd effects when scrolling
     pixmaps off of the bottom.  Let's try not using it. */
#if 0
  int pixmap_offset = (int) (IMAGE_INSTANCE_PIXMAP_HEIGHT (p) - lheight) / 2;
#else
  int pixmap_offset = 0;
#endif

  XSETWINDOW (window, w);

  if ((start_pixpos >= 0 && start_pixpos > xpos) || xoffset)
    {
      if (start_pixpos > xpos && start_pixpos > xpos + width)
	return;

      clip_x = xoffset;
      clip_width = width;
      if (start_pixpos > xpos)
	{
	  clip_x += (start_pixpos - xpos);
	  clip_width -= (start_pixpos - xpos);
	}
    }
  else
    {
      clip_x = 0;
      clip_width = 0;
    }

  /* Place markers for possible future functionality (clipping the top
     half instead of the bottom half; think pixel scrolling). */
  clip_y = 0;
  clip_height = pheight;

  /* Clear the area the pixmap is going into.  The pixmap itself will
     always take care of the full width.  We don't want to clear where
     it is going to go in order to avoid flicker.  So, all we have to
     take care of is any area above or below the pixmap. */
  /* #### We take a shortcut for now.  We know that since we have
     pixmap_offset hardwired to 0 that the pixmap is against the top
     edge so all we have to worry about is below it. */
  /* #### Unless the pixmap has a mask in which case we have to clear
     the whole damn thing since we can't yet clear just the area not
     included in the mask. */
  if (((int) (dl->ypos - dl->ascent + pheight) <
       (int) (dl->ypos + dl->descent - dl->clip))
      || IMAGE_INSTANCE_MSWINDOWS_MASK (p))
    {
      int clear_x, clear_y, clear_width, clear_height;

      if (IMAGE_INSTANCE_MSWINDOWS_MASK (p))
	{
	  clear_y = dl->ypos - dl->ascent;
	  clear_height = lheight;
	}
      else
	{
	  clear_y = dl->ypos - dl->ascent + pheight;
	  clear_height = lheight - pheight;
	}

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

      if (!offset_bitmap)	/* i.e. not a bg pixmap */
	redisplay_clear_region (window, findex, clear_x, clear_y,
				clear_width, clear_height);
    }

  /* Output the pixmap. Have to do this as many times as is required
   to fill the given area */
  mswindows_update_dc (hdc, Qnil,
		       WINDOW_FACE_CACHEL_FOREGROUND (w, findex),
		       WINDOW_FACE_CACHEL_BACKGROUND (w, findex), Qnil);

  mswindows_output_dibitmap_region (f, p, xpos - xoffset,
				    dl->ypos - dl->ascent,
				    clip_x, clip_y, clip_width, clip_height,
				    width + xoffset, pheight, pixmap_offset,
				    offset_bitmap);
}

#ifdef HAVE_SCROLLBARS
/*
 * This function paints window's deadbox, a rectangle between window
 * borders and two short edges of both scrollbars.
 *
 * Function checks whether deadbox intersects with the rectangle pointed
 * to by PRC, and paints only the intersection
 */
static void
mswindows_redisplay_deadbox_maybe (struct window *w, CONST RECT* prc)
{
  int sbh = window_scrollbar_height (w);
  int sbw = window_scrollbar_width (w);
  RECT rect_dead, rect_paint;
  if (sbh == 0 || sbw == 0)
    return;

  if (!NILP (w->scrollbar_on_left_p))
    rect_dead.left = WINDOW_LEFT (w);
  else
    rect_dead.left = WINDOW_TEXT_RIGHT (w);
  rect_dead.right = rect_dead.left + sbw;

  if (!NILP (w->scrollbar_on_top_p))
    rect_dead.top = WINDOW_TOP (w);
  else
    rect_dead.top = WINDOW_TEXT_BOTTOM (w);
  rect_dead.bottom = rect_dead.top + sbh;
      
  if (IntersectRect (&rect_paint, &rect_dead, prc))
    {
      struct frame *f = XFRAME (WINDOW_FRAME (w));
      FillRect (FRAME_MSWINDOWS_DC (f), &rect_paint,
		(HBRUSH) (COLOR_BTNFACE+1));
    }
}

#endif /* HAVE_SCROLLBARS */

/*****************************************************************************
 mswindows_redraw_exposed_window

 Given a bounding box for an area that needs to be redrawn, determine
 what parts of what lines are contained within and re-output their
 contents.
 Copied from redisplay-x.c
 ****************************************************************************/
static void
mswindows_redraw_exposed_window (struct window *w, int x, int y, int width,
			   int height)
{
  struct frame *f = XFRAME (w->frame);
  int line;
  int orig_windows_structure_changed;
  RECT rect_window = { WINDOW_LEFT (w), WINDOW_TOP (w),
		       WINDOW_RIGHT (w), WINDOW_BOTTOM (w) };
  RECT rect_expose = { x, y, x + width, y + height };
  RECT rect_draw;

  display_line_dynarr *cdla = window_display_lines (w, CURRENT_DISP);

  if (!NILP (w->vchild))
    {
      mswindows_redraw_exposed_windows (w->vchild, x, y, width, height);
      return;
    }
  else if (!NILP (w->hchild))
    {
      mswindows_redraw_exposed_windows (w->hchild, x, y, width, height);
      return;
    }

  /* If the window doesn't intersect the exposed region, we're done here. */
  if (!IntersectRect (&rect_draw, &rect_window, &rect_expose))
      return;

  /* We do this to make sure that the 3D modelines get redrawn if
     they are in the exposed region. */
  orig_windows_structure_changed = f->windows_structure_changed;
  f->windows_structure_changed = 1;

  if (window_needs_vertical_divider (w))
    {
      mswindows_output_vertical_divider (w, 0);
    }

  for (line = 0; line < Dynarr_length (cdla); line++)
    {
      struct display_line *cdl = Dynarr_atp (cdla, line);
      int top_y = cdl->ypos - cdl->ascent;
      int bottom_y = cdl->ypos + cdl->descent;

      if (bottom_y >= rect_draw.top)
	{
	  if (top_y > rect_draw.bottom)
	    {
	      if (line == 0)
		continue;
	      else
		break;
	    }
	  else
	    {
	      output_display_line (w, 0, cdla, line,
				   rect_draw.left, rect_draw.right);
	    }
	}
    }

  f->windows_structure_changed = orig_windows_structure_changed;

  /* If there have never been any face cache_elements created, then this
     expose event doesn't actually have anything to do. */
  if (Dynarr_largest (w->face_cachels))
    redisplay_clear_bottom_of_window (w, cdla, rect_draw.top, rect_draw.bottom);

#ifdef HAVE_SCROLLBARS
  mswindows_redisplay_deadbox_maybe (w, &rect_expose);
#endif
}

/*****************************************************************************
 mswindows_redraw_exposed_windows

 For each window beneath the given window in the window hierarchy,
 ensure that it is redrawn if necessary after an Expose event.
 ****************************************************************************/
static void
mswindows_redraw_exposed_windows (Lisp_Object window, int x, int y, int width,
			    int height)
{
  for (; !NILP (window); window = XWINDOW (window)->next)
    mswindows_redraw_exposed_window (XWINDOW (window), x, y, width, height);
}

/*****************************************************************************
 mswindows_redraw_exposed_area

 For each window on the given frame, ensure that any area in the
 Exposed area is redrawn.
 ****************************************************************************/
void
mswindows_redraw_exposed_area (struct frame *f, int x, int y, int width, int height)
{
  /* If any window on the frame has had its face cache reset then the
     redisplay structures are effectively invalid.  If we attempt to
     use them we'll blow up.  We mark the frame as changed to ensure
     that redisplay will do a full update.  This probably isn't
     necessary but it can't hurt. */
#ifdef HAVE_TOOLBARS
  /* #### We would rather put these off as well but there is currently
     no combination of flags which will force an unchanged toolbar to
     redraw anyhow. */
  MAYBE_FRAMEMETH (f, redraw_exposed_toolbars, (f, x, y, width, height));
#endif

  if (!f->window_face_cache_reset)
	{
	  mswindows_redraw_exposed_windows (f->root_window, x, y, width, height);
	  GdiFlush();
	}
  else
    MARK_FRAME_CHANGED (f);
}


/*****************************************************************************
 mswindows_bevel_modeline

 Draw a 3d border around the modeline on window W.
 ****************************************************************************/
static void
mswindows_bevel_modeline (struct window *w, struct display_line *dl)
{
  struct frame *f = XFRAME (w->frame);
  Lisp_Object color;
  int shadow_width = MODELINE_SHADOW_THICKNESS (w);
  RECT rect = {	WINDOW_MODELINE_LEFT (w), 
		dl->ypos - dl->ascent - shadow_width,
		WINDOW_MODELINE_RIGHT (w),
		dl->ypos + dl->descent + shadow_width};
  UINT edge;

  color = WINDOW_FACE_CACHEL_BACKGROUND (w, MODELINE_INDEX);
  mswindows_update_dc (FRAME_MSWINDOWS_DC (f), Qnil, Qnil, color, Qnil);

  if (XINT (w->modeline_shadow_thickness) < 0)
    shadow_width = -shadow_width;

  if (shadow_width < -1)
    edge = EDGE_SUNKEN;
  else if (shadow_width < 0)
    edge = BDR_SUNKENINNER;
  else if (shadow_width == 1)
    edge = BDR_RAISEDINNER;
  else
    edge = EDGE_RAISED;
    
  DrawEdge (FRAME_MSWINDOWS_DC (f), &rect, edge, BF_RECT);
}


/*****************************************************************************
 Display methods
*****************************************************************************/

/*****************************************************************************
 mswindows_divider_height

 Return the height of the horizontal divider.
 ****************************************************************************/
static int
mswindows_divider_height (void)
{
  return 1;   /* XXX Copied from redisplay-X.c. What is this? */
}

/*****************************************************************************
 mswindows_eol_cursor_width

 Return the width of the end-of-line cursor.
 ****************************************************************************/
static int
mswindows_eol_cursor_width (void)
{
  return MSWINDOWS_EOL_CURSOR_WIDTH;
}

/*****************************************************************************
 mswindows_output_begin

 Perform any necessary initialization prior to an update.
 ****************************************************************************/
static void
mswindows_output_begin (struct device *d)
{
}

/*****************************************************************************
 mswindows_output_end

 Perform any necessary flushing of queues when an update has completed.
 ****************************************************************************/
static void
mswindows_output_end (struct device *d)
{
  GdiFlush();
}

static int
mswindows_flash (struct device *d)
{
  struct frame *f = device_selected_frame (d);
  RECT rc;

  GetClientRect (FRAME_MSWINDOWS_HANDLE (f), &rc);
  InvertRect (FRAME_MSWINDOWS_DC (f), &rc);
  GdiFlush ();
  Sleep (25);
  InvertRect (FRAME_MSWINDOWS_DC (f), &rc);

  return 1;
}

static void
mswindows_ring_bell (struct device *d, int volume, int pitch, int duration)
{
  /* Beep does not work at all, anyways! -kkm */
  MessageBeep (MB_OK);
}

/*****************************************************************************
 mswindows_output_display_block

 Given a display line, a block number for that start line, output all
 runes between start and end in the specified display block.
 Ripped off with minimal thought from the corresponding X routine.
 ****************************************************************************/
static void
mswindows_output_display_block (struct window *w, struct display_line *dl, int block,
			  int start, int end, int start_pixpos, int cursor_start,
			  int cursor_width, int cursor_height)
{
  struct frame *f = XFRAME (w->frame);
  Emchar_dynarr *buf = Dynarr_new (Emchar);
  Lisp_Object window;

  struct display_block *db = Dynarr_atp (dl->display_blocks, block);
  rune_dynarr *rba = db->runes;
  struct rune *rb;

  int elt = start;
  face_index findex;
  int xpos, width;
  Lisp_Object charset = Qunbound; /* Qnil is a valid charset when
				     MULE is not defined */
  XSETWINDOW (window, w);
  rb = Dynarr_atp (rba, start);

  if (!rb)
    {
      /* Nothing to do so don't do anything. */
      return;
    }
  else
    {
      findex = rb->findex;
      xpos = rb->xpos;
      width = 0;
      if (rb->type == RUNE_CHAR)
	charset = CHAR_CHARSET (rb->object.chr.ch);
    }

  if (end < 0)
    end = Dynarr_length (rba);
  Dynarr_reset (buf);

  while (elt < end)
    {
      rb = Dynarr_atp (rba, elt);

      if (rb->findex == findex && rb->type == RUNE_CHAR
	  && rb->object.chr.ch != '\n' && rb->cursor_type != CURSOR_ON
	  && EQ (charset, CHAR_CHARSET (rb->object.chr.ch)))
	{
	  Dynarr_add (buf, rb->object.chr.ch);
	  width += rb->width;
	  elt++;
	}
      else
	{
	  if (Dynarr_length (buf))
	    {
	      mswindows_output_string (w, dl, buf, xpos, 0, start_pixpos, width,
				 findex);
	      xpos = rb->xpos;
	      width = 0;
	    }
	  Dynarr_reset (buf);
	  width = 0;

	  if (rb->type == RUNE_CHAR)
	    {
	      findex = rb->findex;
	      xpos = rb->xpos;
	      charset = CHAR_CHARSET (rb->object.chr.ch);

	      if (rb->cursor_type == CURSOR_ON)
		{
		  if (rb->object.chr.ch == '\n')
		    {
		      mswindows_output_cursor (w, dl, xpos, cursor_width,
					       findex, 0, 0);
		    }
		  else
		    {
		      Dynarr_add (buf, rb->object.chr.ch);
		      mswindows_output_cursor (w, dl, xpos, cursor_width,
					       findex, rb->object.chr.ch, 0);
		      Dynarr_reset (buf);
		    }

		  xpos += rb->width;
		  elt++;
		}
	      else if (rb->object.chr.ch == '\n')
		{
		  /* Clear in case a cursor was formerly here. */
		  int height = DISPLAY_LINE_HEIGHT (dl);

		  redisplay_clear_region (window, findex, xpos, dl->ypos - dl->ascent,
				    rb->width, height);
		  elt++;
		}
	    }
	  else if (rb->type == RUNE_BLANK || rb->type == RUNE_HLINE)
	    {
	      if (rb->type == RUNE_BLANK)
		mswindows_output_blank (w, dl, rb, start_pixpos);
	      else
		{
		  /* #### Our flagging of when we need to redraw the
                     modeline shadows sucks.  Since RUNE_HLINE is only used
                     by the modeline at the moment it is a good bet
                     that if it gets redrawn then we should also
                     redraw the shadows.  This won't be true forever.
                     We borrow the shadow_thickness_changed flag for
                     now. */
		  w->shadow_thickness_changed = 1;
		  mswindows_output_hline (w, dl, rb);
		}

	      if (rb->cursor_type == CURSOR_ON)
		mswindows_output_cursor (w, dl, xpos, cursor_width, rb->findex, 0, 0);

	      elt++;
	      if (elt < end)
		{
		  rb = Dynarr_atp (rba, elt);

		  findex = rb->findex;
		  xpos = rb->xpos;
		}
	    }
	  else if (rb->type == RUNE_DGLYPH)
	    {
	      Lisp_Object instance;

	      XSETWINDOW (window, w);
	      instance = glyph_image_instance (rb->object.dglyph.glyph,
					       window, ERROR_ME_NOT, 1);
	      findex = rb->findex;

	      if (IMAGE_INSTANCEP (instance))
		switch (XIMAGE_INSTANCE_TYPE (instance))
		  {
		  case IMAGE_TEXT:
		    {
		      /* #### This is way losing.  See the comment in
			 add_glyph_rune(). */
		      Lisp_Object string =
			XIMAGE_INSTANCE_TEXT_STRING (instance);
		      convert_bufbyte_string_into_emchar_dynarr
			(XSTRING_DATA (string), XSTRING_LENGTH (string), buf);

		      if (rb->cursor_type == CURSOR_ON)
			mswindows_output_cursor (w, dl, xpos, cursor_width,
						 findex, Dynarr_at (buf, 0), 0);
		      else /* #### redisplay-x passes -1 as the width: why ? */
			mswindows_output_string (w, dl, buf, xpos,
					   rb->object.dglyph.xoffset,
					   start_pixpos, rb->width, findex);
		      Dynarr_reset (buf);
		    }
		    break;

		  case IMAGE_MONO_PIXMAP:
		  case IMAGE_COLOR_PIXMAP:
		    mswindows_output_pixmap (w, dl, instance, xpos,
				     rb->object.dglyph.xoffset, start_pixpos,
				     rb->width, findex, cursor_start,
				     cursor_width, cursor_height, 0);
		    if (rb->cursor_type == CURSOR_ON)
		      mswindows_output_cursor (w, dl, xpos, cursor_width,
					       findex, 0, 1);
		    break;

		  case IMAGE_POINTER:
		    abort ();

		  case IMAGE_SUBWINDOW:
		  case IMAGE_WIDGET:
		    redisplay_output_subwindow (w, dl, instance, xpos,
						rb->object.dglyph.xoffset, start_pixpos,
						rb->width, findex, cursor_start,
						cursor_width, cursor_height);
		    if (rb->cursor_type == CURSOR_ON)
		      mswindows_output_cursor (w, dl, xpos, cursor_width,
					       findex, 0, 1);
		    break;

		  case IMAGE_NOTHING:
		    /* nothing is as nothing does */
		    break;

		  default:
		    abort ();
		  }

	      xpos += rb->width;
	      elt++;
	    }
	  else
	    abort ();
	}
    }

  if (Dynarr_length (buf))
    mswindows_output_string (w, dl, buf, xpos, 0, start_pixpos, width, findex);

  if (dl->modeline
      && !EQ (Qzero, w->modeline_shadow_thickness)
      && (f->clear
	  || f->windows_structure_changed
	  || w->shadow_thickness_changed))
    mswindows_bevel_modeline (w, dl);

  Dynarr_free (buf);
}


/*****************************************************************************
 mswindows_output_vertical_divider

 Draw a vertical divider down the right side of the given window.
 ****************************************************************************/
static void
mswindows_output_vertical_divider (struct window *w, int clear_unused)
{
  struct frame *f = XFRAME (w->frame);
  RECT rect;
  int spacing = XINT (w->vertical_divider_spacing);
  int shadow = XINT (w->vertical_divider_shadow_thickness);
  int abs_shadow = abs (shadow);
  int line_width = XINT (w->vertical_divider_line_width);
  int div_left = WINDOW_RIGHT (w) - window_divider_width (w);

  /* Clear left and right spacing areas */
  if (spacing)
    {
      rect.top = WINDOW_TOP (w);
      rect.bottom = WINDOW_BOTTOM (w);
      mswindows_update_dc (FRAME_MSWINDOWS_DC (f), Qnil, Qnil,
		   WINDOW_FACE_CACHEL_BACKGROUND (w, DEFAULT_INDEX), Qnil);
      rect.right = WINDOW_RIGHT (w);
      rect.left = rect.right - spacing;
      ExtTextOut (FRAME_MSWINDOWS_DC (f), 0, 0, ETO_OPAQUE, 
		  &rect, NULL, 0, NULL);
      rect.left = div_left;
      rect.right = div_left + spacing;
      ExtTextOut (FRAME_MSWINDOWS_DC (f), 0, 0, ETO_OPAQUE, 
		  &rect, NULL, 0, NULL);
    }
  
  /* Clear divider face */
  rect.top = WINDOW_TOP (w) + abs_shadow;
  rect.bottom = WINDOW_BOTTOM (w) - abs_shadow;
  rect.left = div_left + spacing + abs_shadow;
  rect.right = rect.left + line_width;
  if (rect.left < rect.right)
    {
      face_index div_face
	= get_builtin_face_cache_index (w, Vvertical_divider_face);
      mswindows_update_dc (FRAME_MSWINDOWS_DC (f), Qnil, Qnil,
		   WINDOW_FACE_CACHEL_BACKGROUND (w, div_face), Qnil);
      ExtTextOut (FRAME_MSWINDOWS_DC (f), 0, 0, ETO_OPAQUE, 
		  &rect, NULL, 0, NULL);
    }

  /* Draw a shadow around the divider */
  if (shadow != 0)
    {
      /* #### This will be fixed to support arbitrary thickness */
      InflateRect (&rect, abs_shadow, abs_shadow);
      DrawEdge (FRAME_MSWINDOWS_DC (f), &rect,
		shadow > 0 ? EDGE_RAISED : EDGE_SUNKEN, BF_RECT);
    }
}

/****************************************************************************
 mswindows_text_width

 Given a string and a face, return the string's length in pixels when
 displayed in the font associated with the face.
 ****************************************************************************/
static int
mswindows_text_width (struct frame *f, struct face_cachel *cachel,
		      CONST Emchar *str, Charcount len)
{
  int width_so_far = 0;
  unsigned char *text_storage = (unsigned char *) alloca (2 * len);
  textual_run *runs = alloca_array (textual_run, len);
  int nruns;
  int i;

  nruns = separate_textual_runs (text_storage, runs, str, len);

  for (i = 0; i < nruns; i++)
    width_so_far += mswindows_text_width_single_run (FRAME_MSWINDOWS_DC (f),
						     cachel, runs + i);

  return width_so_far;
}


/****************************************************************************
 mswindows_clear_region

 Clear the area in the box defined by the given parameters using the
 given face.
 ****************************************************************************/
static void
mswindows_clear_region (Lisp_Object locale, struct device* d, struct frame* f, 
			face_index findex, int x, int y,
			int width, int height, Lisp_Object fcolor, Lisp_Object bcolor,
			Lisp_Object background_pixmap)
{
  RECT rect = { x, y, x+width, y+height };

  if (!NILP (background_pixmap))
    {
      mswindows_update_dc (FRAME_MSWINDOWS_DC (f),
			   Qnil, fcolor, bcolor, background_pixmap);

      mswindows_output_dibitmap_region 
	( f, XIMAGE_INSTANCE (background_pixmap),
	  x, y, 0, 0, 0, 0, width, height, 0, TRUE);
    }
  else
    {
      mswindows_update_dc (FRAME_MSWINDOWS_DC (f), Qnil, Qnil, fcolor, Qnil);
      ExtTextOut (FRAME_MSWINDOWS_DC (f), 0, 0, ETO_OPAQUE, 
		  &rect, NULL, 0, NULL);
    }

#ifdef HAVE_SCROLLBARS
  if (WINDOWP (locale))
    mswindows_redisplay_deadbox_maybe (XWINDOW (locale), &rect);
#endif
}

/*****************************************************************************
 mswindows_clear_to_window_end

 Clear the area between ypos1 and ypos2.  Each margin area and the
 text area is handled separately since they may each have their own
 background color.
 ****************************************************************************/
static void
mswindows_clear_to_window_end (struct window *w, int ypos1, int ypos2)
{
  int height = ypos2 - ypos1;

  if (height)
    {
      struct frame *f = XFRAME (w->frame);
      Lisp_Object window;
      int bflag = (window_needs_vertical_divider (w) ? 0 : 1);
      layout_bounds bounds;

      bounds = calculate_display_line_boundaries (w, bflag);
      XSETWINDOW (window, w);

      if (window_is_leftmost (w))
	redisplay_clear_region (window, DEFAULT_INDEX, FRAME_LEFT_BORDER_START (f),
			  ypos1, FRAME_BORDER_WIDTH (f), height);

      if (bounds.left_in - bounds.left_out > 0)
	redisplay_clear_region (window,
			  get_builtin_face_cache_index (w, Vleft_margin_face),
			  bounds.left_out, ypos1,
			  bounds.left_in - bounds.left_out, height);

      if (bounds.right_in - bounds.left_in > 0)
	redisplay_clear_region (window, DEFAULT_INDEX, bounds.left_in, ypos1,
			  bounds.right_in - bounds.left_in, height);

      if (bounds.right_out - bounds.right_in > 0)
	redisplay_clear_region (window,
			  get_builtin_face_cache_index (w, Vright_margin_face),
			  bounds.right_in, ypos1,
			  bounds.right_out - bounds.right_in, height);

      if (window_is_rightmost (w))
	redisplay_clear_region (window, DEFAULT_INDEX, FRAME_RIGHT_BORDER_START (f),
			  ypos1, FRAME_BORDER_WIDTH (f), height);
    }

}


/* XXX Implement me! */
static void
mswindows_clear_frame (struct frame *f)
{
  GdiFlush();
}



/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
console_type_create_redisplay_mswindows (void)
{
  /* redisplay methods */
  CONSOLE_HAS_METHOD (mswindows, text_width);
  CONSOLE_HAS_METHOD (mswindows, output_display_block);
  CONSOLE_HAS_METHOD (mswindows, divider_height);
  CONSOLE_HAS_METHOD (mswindows, eol_cursor_width);
  CONSOLE_HAS_METHOD (mswindows, output_vertical_divider);
  CONSOLE_HAS_METHOD (mswindows, clear_to_window_end);
  CONSOLE_HAS_METHOD (mswindows, clear_region);
  CONSOLE_HAS_METHOD (mswindows, clear_frame);
  CONSOLE_HAS_METHOD (mswindows, output_begin);
  CONSOLE_HAS_METHOD (mswindows, output_end);
  CONSOLE_HAS_METHOD (mswindows, flash);
  CONSOLE_HAS_METHOD (mswindows, ring_bell);
}
