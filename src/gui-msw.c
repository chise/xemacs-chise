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
#include "console-msw.h"
#include "redisplay.h"
#include "gui.h"
#include "glyphs.h"
#include "frame.h"
#include "elhash.h"
#include "events.h"
#include "buffer.h"

/*
 * Return value is Qt if we have dispatched the command,
 * or Qnil if id has not been mapped to a callback.
 * Window procedure may try other targets to route the
 * command if we return nil
 */
Lisp_Object
mswindows_handle_gui_wm_command (struct frame* f, HWND ctrl, LPARAM id)
{
  /* Try to map the command id through the proper hash table */
  Lisp_Object callback, callback_ex, image_instance, frame, event;

  XSETFRAME (frame, f);

  /* #### make_int should assert that --kkm */
  assert (XINT (make_int (id)) == id);

  image_instance = Fgethash (make_int (id), 
			     FRAME_MSWINDOWS_WIDGET_HASH_TABLE1 (f), Qnil);
  callback = Fgethash (make_int (id), 
		       FRAME_MSWINDOWS_WIDGET_HASH_TABLE2 (f), Qnil);
  callback_ex = Fgethash (make_int (id), 
			  FRAME_MSWINDOWS_WIDGET_HASH_TABLE3 (f), Qnil);

  if (!NILP (callback_ex) && !UNBOUNDP (callback_ex))
    {
      event = Fmake_event (Qnil, Qnil);

      XEVENT (event)->event_type = misc_user_event;
      XEVENT (event)->channel = frame;
      XEVENT (event)->timestamp = GetTickCount ();
      XEVENT (event)->event.eval.function = Qeval;
      XEVENT (event)->event.eval.object =
	list4 (Qfuncall, callback_ex, image_instance, event);
    }
  else if (NILP (callback) || UNBOUNDP (callback))
    return Qnil;
  else
    {
      Lisp_Object fn, arg;

      event = Fmake_event (Qnil, Qnil);

      get_gui_callback (callback, &fn, &arg);
      XEVENT (event)->event_type = misc_user_event;
      XEVENT (event)->channel = frame;
      XEVENT (event)->timestamp = GetTickCount ();
      XEVENT (event)->event.eval.function = fn;
      XEVENT (event)->event.eval.object = arg;
    }

  mswindows_enqueue_dispatch_event (event);
  /* The result of this evaluation could cause other instances to change so 
     enqueue an update callback to check this. */
  enqueue_magic_eval_event (update_widget_instances, frame);
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
  /* Encode filename and current directory.  */
  Lisp_Object current_dir = Ffile_name_directory (document);
  char* path = NULL;
  char* doc = NULL;
  Extbyte* f=0;
  int ret;
  struct gcpro gcpro1, gcpro2;

  CHECK_STRING (document);

  if (NILP (current_dir))
    current_dir = current_buffer->directory;

  GCPRO2 (current_dir, document);

  /* Use mule and cygwin-safe APIs top get at file data. */
  if (STRINGP (current_dir))
    {
      TO_EXTERNAL_FORMAT (LISP_STRING, current_dir,
			  C_STRING_ALLOCA, f,
			  Qfile_name);
#ifdef __CYGWIN32__
      CYGWIN_WIN32_PATH (f, path);
#else
      path = f;
#endif
    }

  if (STRINGP (document))
    {
      TO_EXTERNAL_FORMAT (LISP_STRING, document,
			  C_STRING_ALLOCA, f,
			  Qfile_name);
#ifdef __CYGWIN32__
      CYGWIN_WIN32_PATH (f, doc);
#else
      doc = f;
#endif
    }

  UNGCPRO;

  ret = (int) ShellExecute (NULL,
			    (STRINGP (operation) ?
			     XSTRING_DATA (operation) : NULL),
			    doc, 
			    (STRINGP (parameters) ?
			     XSTRING_DATA (parameters) : NULL),
			    path,
			    (INTP (show_flag) ?
			     XINT (show_flag) : SW_SHOWDEFAULT));

  if (ret > 32)
    return Qt;
  
  if (ret == ERROR_FILE_NOT_FOUND)
    signal_simple_error ("file not found", document);
  else if (ret == ERROR_PATH_NOT_FOUND)
    signal_simple_error ("path not found", current_dir);
  else if (ret == ERROR_BAD_FORMAT)
    signal_simple_error ("bad executable format", document);
  else
    error ("internal error");

  return Qnil;
}

void
syms_of_gui_mswindows (void)
{
  DEFSUBR (Fmswindows_shell_execute);
}
