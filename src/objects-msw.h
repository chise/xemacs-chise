/* mswindows-specific Lisp objects.
   Copyright (C) 1993, 1994 Free Software Foundation, Inc.
   Copyright (C) 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1995, 1996 Ben Wing.
   Copyright (C) 1997, Jonathan Harris.

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

   Ultimately based on FSF.
   Rewritten by Ben Wing.
   Rewritten for mswindows by Jonathan Harris, November 1997 for 21.0.
 */


#ifndef _XEMACS_OBJECTS_MSW_H_
#define _XEMACS_OBJECTS_MSW_H_

#include "objects.h"

struct mswindows_color_instance_data
{
  COLORREF  color;
};

#define MSWINDOWS_COLOR_INSTANCE_DATA(c)	\
	((struct mswindows_color_instance_data *) (c)->data)
#define COLOR_INSTANCE_MSWINDOWS_COLOR(c)	\
	(MSWINDOWS_COLOR_INSTANCE_DATA (c)->color)

#define FONT_INSTANCE_MSWINDOWS_HFONT(c)	((HFONT) (c)->data)

#endif /* _XEMACS_OBJECTS_MSW_H_ */
