/* Console functions for mswindows.
   Copyright (C) 1996, 2000 Ben Wing.

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

/* Authorship:

   Ben Wing: January 1996, for 19.14.
   Rewritten for mswindows by Jonathan Harris, November 1997 for 21.0
 */

#include <config.h>
#include "lisp.h"
#include "events.h"
#include "opaque.h"

#include "console-msw.h"

DEFINE_CONSOLE_TYPE (mswindows);
DEFINE_CONSOLE_TYPE (msprinter);

/************************************************************************/
/*                       mswindows console methods                      */
/************************************************************************/

static int
mswindows_initially_selected_for_input (struct console *con)
{
  return 1;
}

static HWND msw_console_hwnd = 0;

#define KLUDGE_BUFSIZE 1024 /* buffer size for console window titles */

/* Direct from the horse's mouth: Microsoft KB article Q124103 */
static HWND
GetConsoleHwnd (void)
{ 
  HWND hwndFound;         /* this is what is returned to the caller */
  char pszNewWindowTitle[KLUDGE_BUFSIZE]; /* contains fabricated WindowTitle */
  char pszOldWindowTitle[KLUDGE_BUFSIZE]; /* contains original WindowTitle */

  /* fetch current window title */

  GetConsoleTitle(pszOldWindowTitle, KLUDGE_BUFSIZE);

  /* format a "unique" NewWindowTitle */

  wsprintf(pszNewWindowTitle,"%d/%d",
	   GetTickCount(),
	   GetCurrentProcessId());

  /* change current window title */

  SetConsoleTitle(pszNewWindowTitle);

  /* ensure window title has been updated */

  Sleep(40);

  /* look for NewWindowTitle */

  hwndFound=FindWindow(NULL, pszNewWindowTitle);

  /* restore original window title */

  SetConsoleTitle(pszOldWindowTitle);

  return(hwndFound);
} 

HWND
msw_get_console_hwnd (void)
{
  if (!msw_console_hwnd)
    msw_console_hwnd = GetConsoleHwnd ();
  return msw_console_hwnd;
}

int
msw_ensure_console_allocated (void)
{
  HWND fgwin = GetForegroundWindow ();
  /* stupid mswin api won't let you create the console window
     hidden!  creating it changes the focus!  fuck me! */
  if (AllocConsole ())
    {
      SetForegroundWindow (fgwin);
      return 1;
    }
  return 0;
}

static Lisp_Object
mswindows_canonicalize_console_connection (Lisp_Object connection,
					   Error_behavior errb)
{
  /* Do not allow more than one mswindows device, by explicitly
     requiring that CONNECTION is nil, the only allowed connection in
     Windows. */
  if (!NILP (connection))
    {
      if (ERRB_EQ (errb, ERROR_ME))
	signal_simple_error
	  ("Invalid (non-nil) connection for mswindows device/console",
	   connection);
      else
	return Qunbound;
    }

  return Qnil;
}

static Lisp_Object
mswindows_canonicalize_device_connection (Lisp_Object connection,
					  Error_behavior errb)
{
  return mswindows_canonicalize_console_connection (connection, errb);
}

void
msw_hide_console (void)
{
  ShowWindow (msw_get_console_hwnd (), SW_HIDE);
}

void
msw_show_console (void)
{
  HWND hwnd = msw_get_console_hwnd ();
  ShowWindow (hwnd, SW_SHOWNA);

  /* I tried to raise the window to the top without activating
     it, but this fails.  Apparently Windows just doesn't like
     having the active window not be on top.  So instead, we
     at least put it just below our own window, where part of it
     will likely be seen. */
  SetWindowPos (hwnd, GetForegroundWindow (), 0, 0, 0, 0,
		SWP_NOSIZE | SWP_NOMOVE | SWP_NOSENDCHANGING |
		SWP_NOACTIVATE);
}

static int msw_console_buffered = 0;
HANDLE msw_console_buffer;

static void
msw_ensure_console_buffered (void)
{
  if (!msw_console_buffered)
    {
      COORD new_size;

      new_size.X = 80;
      new_size.Y = 1000;
      msw_ensure_console_allocated ();
      msw_console_buffer =
	CreateConsoleScreenBuffer (GENERIC_WRITE, 0, NULL,
				   CONSOLE_TEXTMODE_BUFFER, NULL);
      SetConsoleScreenBufferSize (msw_console_buffer, new_size);
      SetConsoleActiveScreenBuffer (msw_console_buffer);
      msw_console_buffered = 1;
    }
}

int
msw_output_console_string (CONST Extbyte *str, Extcount len)
{
  DWORD num_written;

  msw_ensure_console_buffered ();
  msw_show_console ();
  return WriteConsole (msw_console_buffer, str, len, &num_written, NULL);
}

/* Determine if running on Windows 9x and not NT */
int
msw_windows9x_p (void)
{
  return GetVersion () & 0x80000000;
}


#ifdef DEBUG_XEMACS

/*
 * Random helper functions for debugging.
 * Intended for use in the MSVC "Watch" window which doesn't like
 * the aborts that the error_check_foo() functions can make.
 */
struct lrecord_header *
DHEADER (Lisp_Object obj)
{
  return LRECORDP (obj) ? XRECORD_LHEADER (obj) : NULL;
}

void *
DOPAQUE_DATA (Lisp_Object obj)
{
  return OPAQUEP (obj) ? OPAQUE_DATA (XOPAQUE (obj)) : NULL;
}

Lisp_Event *
DEVENT (Lisp_Object obj)
{
  return EVENTP (obj) ? XEVENT (obj) : NULL;
}

Lisp_Cons *
DCONS (Lisp_Object obj)
{
  return CONSP (obj) ? XCONS (obj) : NULL;
}

Lisp_Cons *
DCONSCDR (Lisp_Object obj)
{
  return (CONSP (obj) && CONSP (XCDR (obj))) ? XCONS (XCDR (obj)) : 0;
}

Bufbyte *
DSTRING (Lisp_Object obj)
{
  return STRINGP (obj) ? XSTRING_DATA (obj) : NULL;
}

Lisp_Vector *
DVECTOR (Lisp_Object obj)
{
  return VECTORP (obj) ? XVECTOR (obj) : NULL;
}

Lisp_Symbol *
DSYMBOL (Lisp_Object obj)
{
  return SYMBOLP (obj) ? XSYMBOL (obj) : NULL;
}

Bufbyte *
DSYMNAME (Lisp_Object obj)
{
  return SYMBOLP (obj) ? string_data (XSYMBOL (obj)->name) : NULL;
}

#endif /* DEBUG_XEMACS */



/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_console_mswindows (void)
{
}

void
console_type_create_mswindows (void)
{
  INITIALIZE_CONSOLE_TYPE (mswindows, "mswindows", "console-mswindows-p");

  /* console methods */
/*  CONSOLE_HAS_METHOD (mswindows, init_console); */
/*  CONSOLE_HAS_METHOD (mswindows, mark_console); */
  CONSOLE_HAS_METHOD (mswindows, initially_selected_for_input);
/*  CONSOLE_HAS_METHOD (mswindows, delete_console); */
  CONSOLE_HAS_METHOD (mswindows, canonicalize_console_connection);
  CONSOLE_HAS_METHOD (mswindows, canonicalize_device_connection);
/*  CONSOLE_HAS_METHOD (mswindows, semi_canonicalize_console_connection); */
/*  CONSOLE_HAS_METHOD (mswindows, semi_canonicalize_device_connection); */

  INITIALIZE_CONSOLE_TYPE (msprinter, "msprinter", "console-msprinter-p");
}

void
reinit_console_type_create_mswindows (void)
{
  REINITIALIZE_CONSOLE_TYPE (mswindows);
  REINITIALIZE_CONSOLE_TYPE (msprinter);
}

void
vars_of_console_mswindows (void)
{
  Fprovide (Qmswindows);
}
