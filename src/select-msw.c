/* mswindows selection processing for XEmacs
   Copyright (C) 1990, 1991, 1992, 1993, 1994 Free Software Foundation, Inc.

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

/* Synched up with: Not synched with FSF. */

/* Authorship:

   Written by Kevin Gallo for FSF Emacs.
   Rewritten for mswindows by Jonathan Harris, December 1997 for 21.0.
 */


#include <config.h>
#include "lisp.h"
#include "frame.h"
#include "select.h"

#include "console-msw.h"

DEFUN ("mswindows-set-clipboard", Fmswindows_set_clipboard, 1, 1, 0, /*
Copy STRING to the mswindows clipboard.
*/
       (string))
{
  int rawsize, size, i;
  unsigned char *src, *dst, *next;
  HGLOBAL h = NULL;
  struct frame *f = NULL;

  CHECK_STRING (string);

  /* Calculate size with LFs converted to CRLFs because
   * CF_TEXT format uses CRLF delimited ASCIIZ */
  src = XSTRING_DATA (string);
  size = rawsize = XSTRING_LENGTH (string) + 1;
  for (i=0; i<rawsize; i++)
    if (src[i] == '\n')
      size++;

  f = selected_frame ();
  if (!OpenClipboard (FRAME_MSWINDOWS_HANDLE (f)))
    return Qnil;

  if (!EmptyClipboard () ||
      (h = GlobalAlloc (GMEM_MOVEABLE | GMEM_DDESHARE, size)) == NULL ||
      (dst = (unsigned char *) GlobalLock (h)) == NULL)
    {
      if (h != NULL) GlobalFree (h);
      CloseClipboard ();
      return Qnil;
    }
    
  /* Convert LFs to CRLFs */
  do
    {
      /* copy next line or remaining bytes including '\0' */
      next = (char*) memccpy (dst, src, '\n', rawsize);
      if (next)
	{
	  /* copied one line ending with '\n' */
	  int copied = next - dst;
	  rawsize -= copied;
	  src += copied;
	  /* insert '\r' before '\n' */
	  next[-1] = '\r';
	  next[0] = '\n';
	  dst = next+1;
	}	    
    }
  while (next);
    
  GlobalUnlock (h);
  
  i = (SetClipboardData (CF_TEXT, h) != NULL);
  
  CloseClipboard ();
  
  return i ? Qt : Qnil;
}

/* Do protocol to assert ourself as a selection owner. Under mswindows
this is easy, we just set the clipboard.  */
static Lisp_Object
mswindows_own_selection (Lisp_Object selection_name, Lisp_Object selection_value)
{
  Lisp_Object converted_value = get_local_selection (selection_name, QSTRING);
  if (!NILP (converted_value) &&
      CONSP (converted_value) &&
      EQ (XCAR (converted_value), QSTRING) &&
      /* pure mswindows behaviour only says we can own the selection 
	 if it is the clipboard */
      EQ (selection_name, QCLIPBOARD))
    Fmswindows_set_clipboard (XCDR (converted_value));

  return Qnil;
}

DEFUN ("mswindows-get-clipboard", Fmswindows_get_clipboard, 0, 0, 0, /*
Return the contents of the mswindows clipboard.
*/
       ())
{
  HANDLE h;
  unsigned char *src, *dst, *next;
  Lisp_Object ret = Qnil;

  if (!OpenClipboard (NULL))
    return Qnil;

  if ((h = GetClipboardData (CF_TEXT)) != NULL &&
      (src = (unsigned char *) GlobalLock (h)) != NULL)
    {
      int i;
      int size, rawsize;
      size = rawsize = strlen (src);

      for (i=0; i<rawsize; i++)
	if (src[i] == '\r' && src[i+1] == '\n')
	  size--;

      /* Convert CRLFs to LFs */
      ret = make_uninit_string (size);
      dst = XSTRING_DATA (ret);
      do
	{
	  /* copy next line or remaining bytes excluding '\0' */
	  next = (char*) memccpy (dst, src, '\r', rawsize);
	  if (next)
	    {
	      /* copied one line ending with '\r' */
	      int copied = next - dst;
	      rawsize -= copied;
	      src += copied;
	      if (*src == '\n')
		dst += copied - 1;		/* overwrite '\r' */
	      else
		dst += copied;
	    }	    
	}
      while (next);

      GlobalUnlock (h);
    }

  CloseClipboard ();

  return ret;
}

static Lisp_Object
mswindows_get_foreign_selection (Lisp_Object selection_symbol, Lisp_Object target_type)
{
  if (EQ (selection_symbol, QCLIPBOARD))
    return Fmswindows_get_clipboard ();
  else
    return Qnil;
}

DEFUN ("mswindows-selection-exists-p", Fmswindows_selection_exists_p, 0, 0, 0, /*
Whether there is an MS-Windows selection.
*/
       ())
{
  return IsClipboardFormatAvailable (CF_TEXT) ? Qt : Qnil;
}

DEFUN ("mswindows-delete-selection", Fmswindows_delete_selection, 0, 0, 0, /*
Remove the current MS-Windows selection from the clipboard.
*/
       ())
{
  BOOL success = OpenClipboard (NULL);
  if (success)
    {
      success = EmptyClipboard ();
      /* Close it regardless of whether empty worked. */
      if (!CloseClipboard ())
	success = FALSE;
    }

  return success ? Qt : Qnil;
}

static void
mswindows_disown_selection (Lisp_Object selection, Lisp_Object timeval)
{
  if (EQ (selection, QCLIPBOARD))
    Fmswindows_delete_selection ();
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
console_type_create_select_mswindows (void)
{
  CONSOLE_HAS_METHOD (mswindows, own_selection);
  CONSOLE_HAS_METHOD (mswindows, disown_selection);
  CONSOLE_HAS_METHOD (mswindows, get_foreign_selection);
}

void
syms_of_select_mswindows (void)
{
  DEFSUBR (Fmswindows_set_clipboard);
  DEFSUBR (Fmswindows_get_clipboard);
  DEFSUBR (Fmswindows_selection_exists_p);
  DEFSUBR (Fmswindows_delete_selection);
}

void
vars_of_select_mswindows (void)
{
}
