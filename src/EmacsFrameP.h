/* Private header for the Emacs frame widget.
   Copyright (C) 1993-1995 Sun Microsystems, Inc.
   Copyright (C) 1995 Ben Wing.

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

#ifndef _EmacsFrameP_h
#define _EmacsFrameP_h

#include "xintrinsicp.h"
#include <X11/CoreP.h>
#ifdef LWLIB_USES_MOTIF
#include "xmprimitivep.h"
#endif
#include "EmacsFrame.h"

typedef struct {
  struct frame*	frame;		/* the *emacs* frame object */

  /* Resources that can't be done from lisp.
   */
  char*		geometry;		/* geometry spec of this frame */
  Boolean	iconic;			/* whether this frame is iconic */

  /* The rest of this is crap and should be deleted.
   */
  Boolean	minibuffer;	/* 0: normal frames with minibuffers.
				 * 1: frames without minibuffers
				 * 2: minibuffer only. */
  Boolean	unsplittable;	/* frame can only have one window */

  int		internal_border_width;	/* internal borders */
  int		scrollbar_width;	/* width of frame vertical sb's */
  int		scrollbar_height;	/* height of frame horizontal sb's */
  int		top_toolbar_height;	/* height of top toolbar */
  int		bottom_toolbar_height;	/* height of bottom toolbar */
  int		left_toolbar_width;	/* width of left toolbar */
  int		right_toolbar_width;	/* width of right toolbar */
  int		top_toolbar_border_width;	/* border width */
  int		bottom_toolbar_border_width;	/* ... of bottom toolbar */
  int		left_toolbar_border_width;	/* ... of left toolbar */
  int		right_toolbar_border_width;	/* ... of right toolbar */
  Pixel		top_toolbar_shadow_pixel;
  Pixel		bottom_toolbar_shadow_pixel;
  Pixel		background_toolbar_pixel;
  Pixel		foreground_toolbar_pixel;
  Pixmap	top_toolbar_shadow_pixmap;
  Pixmap	bottom_toolbar_shadow_pixmap;
  Dimension	toolbar_shadow_thickness;
  unsigned char scrollbar_placement;
  int		interline;		/* skips between lines */

  XFontStruct*	font;			/* font */
  Pixel		foreground_pixel;	/* foreground */
  Pixel		background_pixel;	/* background */

  Pixel		cursor_color;		/* text cursor color */
  Boolean	bar_cursor;		/* 1 if bar, 0 if block */

  Boolean	visual_bell;		/* flash instead of beep */
  int		bell_volume;		/* how loud is beep */

  Boolean	menubar_p;		/* initially show a menubar? */
  Boolean	initially_unmapped;	/* inhibit initial window mapping */
  Boolean	use_backing_store;	/* backing store for menubar & ew? */

  Dimension     preferred_width;        /* if non-zero, preferred size for */
  Dimension     preferred_height;	/* QueryGeometry() */
  /* private state */

} EmacsFramePart;

typedef struct _EmacsFrameRec {	/* full instance record */
    CorePart		core;
#ifdef LWLIB_USES_MOTIF
    XmPrimitivePart	primitive;
#endif
    EmacsFramePart	emacs_frame;
} EmacsFrameRec;

typedef struct {			/* new fields for EmacsFrame class */
    int dummy;
} EmacsFrameClassPart;

typedef struct _EmacsFrameClassRec {	/* full class record declaration */
    CoreClassPart		core_class;
#ifdef LWLIB_USES_MOTIF
    XmPrimitiveClassPart	primitive_class;
#endif
    EmacsFrameClassPart	emacs_frame_class;
} EmacsFrameClassRec;

extern EmacsFrameClassRec emacsFrameClassRec;	 /* class pointer */



#endif /* _EmacsFrameP_h */
