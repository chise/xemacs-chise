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
#include "buffer.h"

/*
 * Return value is Qt if we have dispatched the command,
 * or Qnil if id has not been mapped to a callback.
 * Window procedure may try other targets to route the
 * command if we return nil
 */
Lisp_Object
mswindows_handle_gui_wm_command (struct frame* f, HWND ctrl, DWORD id)
{
  /* Try to map the command id through the proper hash table */
  Lisp_Object data, fn, arg, frame;

  /* #### make_int should assert that --kkm */
  assert (XINT (make_int (id)) == id);

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

DEFUN ("mswindows-shell-execute", Fmswindows_shell_execute, 2, 4, 0, /*
Get Windows to perform OPERATION on DOCUMENT.
This is a wrapper around the ShellExecute system function, which
invokes the application registered to handle OPERATION for DOCUMENT.
OPERATION is typically \"open\", \"print\" or \"explore\" (but can be
nil for the default action), and DOCUMENT is typically the name of a
document file or URL, but can also be a program executable to run or
a directory to open in the Windows Explorer.

If DOCUMENT is a program executable, PARAMETERS can be a string
containing command line parameters, but otherwise should be nil.

SHOW-FLAG can be used to control whether the invoked application is hidden
or minimized.  If SHOW-FLAG is nil, the application is displayed normally,
otherwise it is an integer representing a ShowWindow flag:

  0 - start hidden
  1 - start normally
  3 - start maximized
  6 - start minimized
*/
       (operation, document, parameters, show_flag))
{
  Lisp_Object current_dir;

  CHECK_STRING (document);

  /* Encode filename and current directory.  */
  current_dir = current_buffer->directory;
  if ((int) ShellExecute (NULL,
			  (STRINGP (operation) ?
			   XSTRING (operation)->data : NULL),
			  XSTRING (document)->data,
			  (STRINGP (parameters) ?
			   XSTRING (parameters)->data : NULL),
			  XSTRING (current_dir)->data,
			  (INTP (show_flag) ?
			   XINT (show_flag) : SW_SHOWDEFAULT))
      > 32)
    return Qt;

  error ("ShellExecute failed");
  return Qnil;
}

void
syms_of_gui_mswindows (void)
{
  DEFSUBR (Fmswindows_shell_execute);
}
