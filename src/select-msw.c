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


/* Do protocol to assert ourself as a selection owner. Under mswindows
this is easy, we just set the clipboard.  */
static Lisp_Object
mswindows_own_selection (Lisp_Object selection_name,
			 Lisp_Object selection_value)
{
  Lisp_Object converted_value = get_local_selection (selection_name, QSTRING);

  if (!NILP (converted_value) &&
      CONSP (converted_value) &&
      EQ (XCAR (converted_value), QSTRING) &&
      /* pure mswindows behaviour only says we can own the selection 
	 if it is the clipboard */
      EQ (selection_name, QCLIPBOARD))
    {
      int rawsize, size, i;
      unsigned char *src, *dst, *next;
      HGLOBAL h = NULL;
      struct frame *f = NULL;
      struct gcpro gcpro1, gcpro2;
      Lisp_Object string = XCDR (converted_value);

      GCPRO2 (converted_value, string);

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
	{
	  UNGCPRO;
	  return Qnil;
	}

      /* This call to EmptyClipboard may post an event back to us if
	 we already own the clipboard (to tell us we lost it) and this
	 event may execute random lisp code.  Hence we must protect
	 the string and get its address again after the call. */
      if (!EmptyClipboard () ||
	  (h = GlobalAlloc (GMEM_MOVEABLE | GMEM_DDESHARE, size)) == NULL ||
	  (dst = (unsigned char *) GlobalLock (h)) == NULL)
	{
	  if (h != NULL) GlobalFree (h);
	  CloseClipboard ();
	  UNGCPRO;
	  return Qnil;
	}
      src = XSTRING_DATA (string);

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

      UNGCPRO;
      /* #### we are supposed to return a time! */
      /* return i ? Qt : Qnil; */
      return Qnil;
    }

  return Qnil;
}

static Lisp_Object
mswindows_get_foreign_selection (Lisp_Object selection_symbol,
				 Lisp_Object target_type)
{
  if (EQ (selection_symbol, QCLIPBOARD))
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
	      next = (unsigned char *) memccpy (dst, src, '\r', rawsize);
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
  else
    return Qnil;
}

static void
mswindows_disown_selection (Lisp_Object selection, Lisp_Object timeval)
{
  if (EQ (selection, QCLIPBOARD))
    {
      BOOL success = OpenClipboard (NULL);
      if (success)
	{
	  success = EmptyClipboard ();
	  /* Close it regardless of whether empty worked. */
	  if (!CloseClipboard ())
	    success = FALSE;
	}

      /* #### return success ? Qt : Qnil; */
    }
}

static Lisp_Object
mswindows_selection_exists_p (Lisp_Object selection)
{
  if (EQ (selection, QCLIPBOARD))
    return IsClipboardFormatAvailable (CF_TEXT) ? Qt : Qnil;
  else
    return Qnil;
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
console_type_create_select_mswindows (void)
{
  CONSOLE_HAS_METHOD (mswindows, own_selection);
  CONSOLE_HAS_METHOD (mswindows, disown_selection);
  CONSOLE_HAS_METHOD (mswindows, selection_exists_p);
  CONSOLE_HAS_METHOD (mswindows, get_foreign_selection);
}

void
syms_of_select_mswindows (void)
{
}

void
vars_of_select_mswindows (void)
{
}
