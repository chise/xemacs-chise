/* mswindows GUI code. (menubars, scrollbars, toolbars, dialogs)
   Copyright (C) 1998 Andy Piper.

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
#include "gui.h"
#include "redisplay.h"
#include "frame.h"
#include "elhash.h"
#include "console-msw.h"

/*
 * Return value is Qt if we have dispatched the command,
 * or Qnil if id has not been mapped to a callback.
 * Window procedure may try other targets to route the
 * command if we return nil
 */
Lisp_Object
mswindows_handle_gui_wm_command (struct frame* f, HWND ctrl, WORD id)
{
  /* Try to map the command id through the proper hash table */
  Lisp_Object data, fn, arg, frame;

  data = Fgethash (make_int (id), 
		   FRAME_MSWINDOWS_WIDGET_HASH_TABLE (f), Qnil);
  
  if (NILP (data) || UNBOUNDP (data))
    return Qnil;

  MARK_SUBWINDOWS_STATE_CHANGED;
  /* Ok, this is our one. Enqueue it. */
  get_gui_callback (data, &fn, &arg);
  XSETFRAME (frame, f);
  mswindows_enqueue_misc_user_event (frame, fn, arg);

  return Qt;
}

