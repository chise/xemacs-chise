/* scrollbar implementation -- mswindows interface.
   Copyright (C) 1994, 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1994 Amdhal Corporation.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1995 Darrell Kindred <dkindred+@cmu.edu>.

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

#include <config.h>
#include "lisp.h"

#include "console-msw.h"
#include "events.h"
#include "frame.h"
#include "scrollbar-msw.h"
#include "scrollbar.h"
#include "specifier.h"
#include "window.h"

/* We use a similar sort of vertical scrollbar drag hack for mswindows
 * scrollbars as is used for Motif or Lucid scrollbars under X.
 * We do character-based instead of line-based scrolling, which can mean that
 * without the hack it is impossible to drag to the end of a buffer. */
#define VERTICAL_SCROLLBAR_DRAG_HACK

static int vertical_drag_in_progress = 0;

static void
mswindows_create_scrollbar_instance (struct frame *f, int vertical,
				     struct scrollbar_instance *sb)
{
  int orientation;
  
  sb->scrollbar_data = xnew_and_zero (struct mswindows_scrollbar_data);
  
  if (vertical)
    orientation = SBS_VERT;
  else
    orientation = SBS_HORZ;
  
  SCROLLBAR_MSW_HANDLE (sb) =
    CreateWindowEx(0, "SCROLLBAR", 0, orientation|WS_CHILD,
		 CW_USEDEFAULT, CW_USEDEFAULT,
		 CW_USEDEFAULT, CW_USEDEFAULT,
		 FRAME_MSWINDOWS_HANDLE (f),
		 NULL, NULL, NULL);
  SCROLLBAR_MSW_INFO (sb).cbSize = sizeof(SCROLLINFO);
  SCROLLBAR_MSW_INFO (sb).fMask = SIF_ALL;
  GetScrollInfo(SCROLLBAR_MSW_HANDLE (sb), SB_CTL,
		&SCROLLBAR_MSW_INFO (sb));
  SetWindowLong (SCROLLBAR_MSW_HANDLE(sb), GWL_USERDATA, (LONG)sb);

#if 0
  {
	  HWND h = SCROLLBAR_MSW_HANDLE (sb);
	  int x = SetWindowLong (SCROLLBAR_MSW_HANDLE(sb), GWL_USERDATA, (LONG)sb);
	  int y = GetLastError();
	  struct scrollbar_instance *z = (struct scrollbar_instance *)GetWindowLong (SCROLLBAR_MSW_HANDLE(sb),
		  GWL_USERDATA);
	  *z = *z;
  }
#endif
}

static void
mswindows_free_scrollbar_instance (struct scrollbar_instance *sb)
{
  DestroyWindow (SCROLLBAR_MSW_HANDLE (sb));
  if (sb->scrollbar_data) 
    xfree (sb->scrollbar_data);
}

static void
mswindows_release_scrollbar_instance (struct scrollbar_instance *sb)
{
  ShowScrollBar (SCROLLBAR_MSW_HANDLE (sb), SB_CTL, 0);
  SCROLLBAR_MSW_SIZE (sb) = 0;
}

#define UPDATE_POS_FIELD(field)						   \
  if (new_##field >= 0 && SCROLLBAR_MSW_DATA (sb)->field != new_##field) { \
    SCROLLBAR_MSW_DATA (sb)->field = new_##field;			   \
    pos_changed = 1;							   \
  }

static void
mswindows_update_scrollbar_instance_values (struct window *w,
					    struct scrollbar_instance *sb,
					    int new_line_increment,
					    int new_page_increment,
					    int new_minimum, int new_maximum,
					    int new_slider_size,
					    int new_slider_position,
					    int new_scrollbar_width,
					    int new_scrollbar_height,
					    int new_scrollbar_x,
					    int new_scrollbar_y)
{
  int pos_changed = 0;
  int vert = GetWindowLong (SCROLLBAR_MSW_HANDLE (sb), GWL_STYLE) & SBS_VERT;

#if 0
  stderr_out ("[%d, %d], page = %d, pos = %d, inhibit = %d\n", new_minimum, new_maximum,
	      new_slider_size, new_slider_position,inhibit_slider_size_change);
#endif

  /* These might be optimized, but since at least one will change at each
     call, it's probably not worth it. */
  SCROLLBAR_MSW_INFO (sb).nMin = new_minimum;
  SCROLLBAR_MSW_INFO (sb).nMax = new_maximum;
  SCROLLBAR_MSW_INFO (sb).nPage = new_slider_size + 1; /* +1 for DISABLENOSCROLL */
  SCROLLBAR_MSW_INFO (sb).nPos = new_slider_position;
#ifndef VERTICAL_SCROLLBAR_DRAG_HACK
  SCROLLBAR_MSW_INFO (sb).fMask = ((vert && vertical_drag_in_progress)
				   ? SIF_RANGE | SIF_POS
				   : SIF_ALL | SIF_DISABLENOSCROLL);
#else
  SCROLLBAR_MSW_INFO (sb).fMask = SIF_ALL | SIF_DISABLENOSCROLL;

  /* Ignore XEmacs' requests to update the thumb position and size; they don't
   * bear any relation to reality because we're reporting made-up positions */
  if (!(vert && vertical_drag_in_progress))
#endif
    SetScrollInfo (SCROLLBAR_MSW_HANDLE (sb), SB_CTL, &SCROLLBAR_MSW_INFO (sb),
		   TRUE);

  UPDATE_POS_FIELD (scrollbar_x);
  UPDATE_POS_FIELD (scrollbar_y);
  UPDATE_POS_FIELD (scrollbar_width);
  UPDATE_POS_FIELD (scrollbar_height);

  if (pos_changed) 
    {
      MoveWindow(SCROLLBAR_MSW_HANDLE (sb),
		 new_scrollbar_x, new_scrollbar_y,
		 new_scrollbar_width, new_scrollbar_height,
		 TRUE);
    }
}

static void
mswindows_update_scrollbar_instance_status (struct window *w,
					    int active, int size,
					    struct scrollbar_instance *sb)
{
  if (SCROLLBAR_MSW_SIZE (sb) != size)
    {
      SCROLLBAR_MSW_SIZE (sb) = size;
      ShowScrollBar (SCROLLBAR_MSW_HANDLE (sb), SB_CTL,
		     SCROLLBAR_MSW_SIZE (sb));
      SCROLLBAR_MSW_INFO(sb).fMask |= SIF_DISABLENOSCROLL;
      SetScrollInfo(SCROLLBAR_MSW_HANDLE (sb), SB_CTL, &SCROLLBAR_MSW_INFO (sb), TRUE);
    }
}

void
mswindows_handle_scrollbar_event (HWND hwnd, int code, int pos)
{
  struct frame *f;
  Lisp_Object win, frame;
  struct scrollbar_instance *sb;
  SCROLLINFO scrollinfo;
  int vert = GetWindowLong (hwnd, GWL_STYLE) & SBS_VERT;
  int value;

  sb = (struct scrollbar_instance *)GetWindowLong (hwnd, GWL_USERDATA);
  win = real_window (sb->mirror, 1);
  frame = XWINDOW (win)->frame;
  f = XFRAME (frame);

  /* SB_LINEDOWN == SB_CHARLEFT etc. This is the way they will
     always be - any Windows is binary compatible backward with 
     old programs */

  switch (code)
    {
    case SB_LINEDOWN:
      mswindows_enqueue_misc_user_event
	(frame, vert ? Qscrollbar_line_down : Qscrollbar_char_right, win);
      break;
	  
    case SB_LINEUP:
      mswindows_enqueue_misc_user_event
	(frame, vert ? Qscrollbar_line_up : Qscrollbar_char_left, win);
      break;
	  
    case SB_PAGEDOWN:
      mswindows_enqueue_misc_user_event
	(win, vert ? Qscrollbar_page_down : Qscrollbar_page_right,
	 vert ? Fcons (win, Qnil) : win);
      break;

    case SB_PAGEUP:
      mswindows_enqueue_misc_user_event
	(frame,
	 vert ? Qscrollbar_page_up : Qscrollbar_page_left,
	 vert ? Fcons (win, Qnil) : win);
      break;
	  
    case SB_BOTTOM:
      mswindows_enqueue_misc_user_event
	(frame, vert ? Qscrollbar_to_bottom : Qscrollbar_to_right, win);
      break;

    case SB_TOP:
      mswindows_enqueue_misc_user_event
	(frame, vert ? Qscrollbar_to_top : Qscrollbar_to_left, win);
      break;

    case SB_THUMBTRACK:
    case SB_THUMBPOSITION:
      scrollinfo.cbSize = sizeof(SCROLLINFO);
      scrollinfo.fMask = SIF_ALL;
      GetScrollInfo (hwnd, SB_CTL, &scrollinfo);
      vertical_drag_in_progress = vert;
#ifdef VERTICAL_SCROLLBAR_DRAG_HACK
      if (vert && (scrollinfo.nTrackPos > scrollinfo.nPos))
        /* new buffer position =
	 *  buffer position at start of drag +
	 *   ((text remaining in buffer at start of drag) *
	 *    (amount that the thumb has been moved) /
	 *    (space that remained past end of the thumb at start of drag)) */
	value = (int)
	  (scrollinfo.nPos
	   + (((double)
	      (scrollinfo.nMax - scrollinfo.nPos)
	       * (scrollinfo.nTrackPos - scrollinfo.nPos))
	      / (scrollinfo.nMax - scrollinfo.nPage - scrollinfo.nPos)))
	  - 2;	/* ensure that the last line doesn't disappear off screen */
      else
#endif
        value = scrollinfo.nTrackPos;
      mswindows_enqueue_misc_user_event
	(frame,
	 vert ? Qscrollbar_vertical_drag : Qscrollbar_horizontal_drag,
	 Fcons (win, make_int (value)));
      break;

    case SB_ENDSCROLL:
#ifdef VERTICAL_SCROLLBAR_DRAG_HACK
      if (vertical_drag_in_progress)
	/* User has just dropped the thumb - finally update it */
	SetScrollInfo (SCROLLBAR_MSW_HANDLE (sb), SB_CTL,
		       &SCROLLBAR_MSW_INFO (sb), TRUE);
#endif
      vertical_drag_in_progress = 0;
      break;
    }
}

#ifdef MEMORY_USAGE_STATS

static int
mswindows_compute_scrollbar_instance_usage (struct device *d,
				    struct scrollbar_instance *inst,
				    struct overhead_stats *ovstats)
{
  int total = 0;

  while (inst)
    {
      struct mswindows_scrollbar_data *data =
	(struct mswindows_scrollbar_data *) inst->scrollbar_data;

      total += malloced_storage_size (data, sizeof (*data), ovstats);
      inst = inst->next;
    }

  return total;
}

#endif /* MEMORY_USAGE_STATS */

/************************************************************************/
/*          Device-specific ghost specifiers initialization             */
/************************************************************************/

DEFUN ("mswindows-init-scrollbar-metrics", Fmswindows_init_scrollbar_metrics, 1, 1, 0, /*
*/
       (locale))
{
  if (DEVICEP (locale))
    {
      add_spec_to_ghost_specifier (Vscrollbar_width,
				   make_int (GetSystemMetrics (SM_CXVSCROLL)),
				   locale, Qmswindows, Qnil);
      add_spec_to_ghost_specifier (Vscrollbar_height,
				   make_int (GetSystemMetrics (SM_CYHSCROLL)),
				   locale, Qmswindows, Qnil);
    }
  return Qnil;
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
console_type_create_scrollbar_mswindows (void)
{
  CONSOLE_HAS_METHOD (mswindows, create_scrollbar_instance);
  CONSOLE_HAS_METHOD (mswindows, free_scrollbar_instance);
  CONSOLE_HAS_METHOD (mswindows, release_scrollbar_instance);
  CONSOLE_HAS_METHOD (mswindows, update_scrollbar_instance_values);
  CONSOLE_HAS_METHOD (mswindows, update_scrollbar_instance_status);
/*  CONSOLE_HAS_METHOD (mswindows, scrollbar_width_changed_in_frame); */
#ifdef MEMORY_USAGE_STATS
  CONSOLE_HAS_METHOD (mswindows, compute_scrollbar_instance_usage);
#endif
}

void
syms_of_scrollbar_mswindows(void)
{
  DEFSUBR (Fmswindows_init_scrollbar_metrics);
}

void
vars_of_scrollbar_mswindows(void)
{
  Fprovide (intern ("mswindows-scrollbars"));
}

