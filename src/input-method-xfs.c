/* input-method-xfs.c provides just only locale initialize
   for non Motif people. (stoled from input-method-xlib.c)
   Why I made this code is to initialize X locale environment for
   the purpose of use XFontSet correctly in lwlib/xlwmenu.c.
   And this code donot provides input methods under Xlib while they
   prefer to use Canna, Wnn, skk or something like that.
   This code has been tested on FreeBSD 2.2.1 and Solaris2.5.

   Copyright (C) 1997 Kazuyuki IENAGA.

This file is a part of XEmacs.

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

#include <config.h>
#include <X11/Xlocale.h>        /* More portable than <locale.h> ? */
#include "lisp.h"
#include "frame.h"
#include "device.h"
#include "window.h"
#include "buffer.h"
#include "console-x.h"
#include "EmacsFrame.h"
#include "events.h"

#ifdef USE_XFONTSET
void
Initialize_Locale (void)
{
  char *locale;

  /* dverna - Nov. 98: #### DON'T DO THIS !!! The default XtLanguageProc
     routine calls setlocale(LC_ALL, lang) which fucks up our lower-level
     locale management, and especially the value of LC_NUMERIC. Anyway, since
     at this point, we don't know yet whether we're gonna need an X11 frame,
     we should really do it manually and not use Xlib's dumb default routine */
  /*XtSetLanguageProc (NULL, (XtLanguageProc) NULL, NULL);*/
  if ((locale = setlocale (LC_ALL, "")) == NULL)
    {
      stderr_out ("Can't set locale.\n");
      stderr_out ("Using C locale instead.\n");
      putenv ("LANG=C");
      putenv ("LC_ALL=C");
      if ((locale = setlocale (LC_ALL, "C")) == NULL)
	{
	  stderr_out ("Can't even set locale to `C'!\n");
	  return;
	}
    }

  if (!XSupportsLocale ())
    {
      stderr_out ("X Windows does not support locale `%s'\n", locale);
      stderr_out ("Using C Locale instead\n");
      putenv ("LANG=C");
      putenv ("LC_ALL=C");
      if ((locale = setlocale (LC_ALL, "C")) == NULL)
	{
	  stderr_out ("Can't even set locale to `C'!\n");
	  return;
	}
      if (!XSupportsLocale ())
        {
          stderr_out ("X Windows does not even support locale `C'!\n");
          return;
        }
    }

  setlocale(LC_NUMERIC, "C");
  setlocale(LC_CTYPE, ""); /* take back CTYPE to previous state */
  
  if (XSetLocaleModifiers ("") == NULL)
    {
      stderr_out ("XSetLocaleModifiers(\"\") failed\n");
      stderr_out ("Check the value of the XMODIFIERS environment variable.\n");
    }
}
#endif /* USE_XFONTSET */
