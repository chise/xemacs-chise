/* device functions for mswindows.
   Copyright (C) 1994, 1995 Board of Trustees, University of Illinois.
   Copyright (C) 1994, 1995 Free Software Foundation, Inc.

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

   Original authors: Jamie Zawinski and the FSF
   Rewritten by Ben Wing and Chuck Thompson.
   Rewritten for mswindows by Jonathan Harris, November 1997 for 21.0.
*/


#include <config.h>
#include "lisp.h"

#include "console-msw.h"
#include "console-stream.h"
#include "events.h"
#include "faces.h"
#include "frame.h"
#include "sysdep.h"

/* win32 DDE management library globals */
#ifdef HAVE_DRAGNDROP
DWORD mswindows_dde_mlid;
HSZ mswindows_dde_service;
HSZ mswindows_dde_topic_system;
HSZ mswindows_dde_item_open;
#endif

/* Control conversion of upper case file names to lower case.
   nil means no, t means yes. */
Lisp_Object Vmswindows_downcase_file_names;

/* Control whether stat() attempts to determine file type and link count
   exactly, at the expense of slower operation.  Since true hard links
   are supported on NTFS volumes, this is only relevant on NT.  */
Lisp_Object Vmswindows_get_true_file_attributes;

Lisp_Object Qinit_pre_mswindows_win, Qinit_post_mswindows_win;


/************************************************************************/
/*                               helpers                                */
/************************************************************************/

static Lisp_Object
build_syscolor_string (int index)
{
  DWORD clr;
  char buf[16];

  if (index < 0)
    return Qnil;

  clr = GetSysColor (index);
  sprintf (buf, "#%02X%02X%02X",
	   GetRValue (clr),
	   GetGValue (clr),
	   GetBValue (clr));
  return build_string (buf);
}

static Lisp_Object
build_syscolor_cons (int index1, int index2)
{
  Lisp_Object color1, color2;
  struct gcpro gcpro1;
  GCPRO1 (color1);
  color1 = build_syscolor_string (index1);
  color2 = build_syscolor_string (index2);
  RETURN_UNGCPRO (Fcons (color1, color2));
}

static Lisp_Object
build_sysmetrics_cons (int index1, int index2)
{
  return Fcons (index1 < 0 ? Qnil : make_int (GetSystemMetrics (index1)),
		index2 < 0 ? Qnil : make_int (GetSystemMetrics (index2)));
}



/************************************************************************/
/*                               methods                                */
/************************************************************************/

static void
mswindows_init_device (struct device *d, Lisp_Object props)
{
  WNDCLASSEX wc;
  HDC hdc;

  DEVICE_CLASS (d) = Qcolor;
  DEVICE_INFD (d) = DEVICE_OUTFD (d) = -1;
  init_baud_rate (d);
  init_one_device (d);

  d->device_data = xnew_and_zero (struct mswindows_device);
  hdc = CreateCompatibleDC (NULL);
  assert (hdc!=NULL);
  DEVICE_MSWINDOWS_LOGPIXELSX(d) =  GetDeviceCaps(hdc, LOGPIXELSX);
  DEVICE_MSWINDOWS_LOGPIXELSY(d) =  GetDeviceCaps(hdc, LOGPIXELSY);
  DEVICE_MSWINDOWS_PLANES(d) = GetDeviceCaps(hdc, PLANES);
  /* #### SIZEPALETTE only valid if RC_PALETTE bit set in RASTERCAPS,
     what should we return for a non-palette-based device? */
  DEVICE_MSWINDOWS_CELLS(d) = GetDeviceCaps(hdc, SIZEPALETTE);
  DEVICE_MSWINDOWS_HORZRES(d) = GetDeviceCaps(hdc, HORZRES);
  DEVICE_MSWINDOWS_VERTRES(d) = GetDeviceCaps(hdc, VERTRES);
  DEVICE_MSWINDOWS_HORZSIZE(d) = GetDeviceCaps(hdc, HORZSIZE);
  DEVICE_MSWINDOWS_VERTSIZE(d) = GetDeviceCaps(hdc, VERTSIZE);
  DEVICE_MSWINDOWS_BITSPIXEL(d) = GetDeviceCaps(hdc, BITSPIXEL);
  DeleteDC (hdc);

  mswindows_enumerate_fonts (d);

  /* Register the main window class */
  wc.cbSize = sizeof (WNDCLASSEX);
  wc.style = CS_OWNDC;	/* One DC per window */
  wc.lpfnWndProc = (WNDPROC) mswindows_wnd_proc;
  wc.cbClsExtra = 0;
  wc.cbWndExtra = MSWINDOWS_WINDOW_EXTRA_BYTES;
  wc.hInstance = NULL;	/* ? */
  wc.hIcon = LoadIcon (GetModuleHandle(NULL), XEMACS_CLASS);
  wc.hCursor = LoadCursor (NULL, IDC_ARROW);
  /* Background brush is only used during sizing, when XEmacs cannot
     take over */
  wc.hbrBackground = (HBRUSH)(COLOR_APPWORKSPACE + 1);
  wc.lpszMenuName = NULL;

  wc.lpszClassName = XEMACS_CLASS;
  wc.hIconSm = LoadImage (GetModuleHandle (NULL), XEMACS_CLASS,
			  IMAGE_ICON, 16, 16, 0);
  RegisterClassEx (&wc);
#ifdef HAVE_TOOLBARS
  InitCommonControls ();
#endif
}

static void
mswindows_finish_init_device (struct device *d, Lisp_Object props)
{
  /* Initialize DDE management library and our related globals. We execute a
   * dde Open("file") by simulating a drop, so this depends on dnd support. */
#ifdef HAVE_DRAGNDROP
  mswindows_dde_mlid = 0;
  DdeInitialize (&mswindows_dde_mlid, (PFNCALLBACK)mswindows_dde_callback,
		 APPCMD_FILTERINITS|CBF_FAIL_SELFCONNECTIONS|CBF_FAIL_ADVISES|
		 CBF_FAIL_POKES|CBF_FAIL_REQUESTS|CBF_SKIP_ALLNOTIFICATIONS, 0);
  
  mswindows_dde_service = DdeCreateStringHandle (mswindows_dde_mlid, XEMACS_CLASS, 0);
  mswindows_dde_topic_system = DdeCreateStringHandle (mswindows_dde_mlid, SZDDESYS_TOPIC, 0);
  mswindows_dde_item_open = DdeCreateStringHandle (mswindows_dde_mlid,
						   TEXT(MSWINDOWS_DDE_ITEM_OPEN), 0);
  DdeNameService (mswindows_dde_mlid, mswindows_dde_service, 0L, DNS_REGISTER);
#endif
}

static void
mswindows_delete_device (struct device *d)
{
  struct mswindows_font_enum *fontlist, *next;

  fontlist = DEVICE_MSWINDOWS_FONTLIST (d);
  while (fontlist)
    {
      next = fontlist->next;
      free (fontlist);
      fontlist = next;
    }

#ifdef HAVE_DRAGNDROP
  DdeNameService (mswindows_dde_mlid, 0L, 0L, DNS_REGISTER);
  DdeUninitialize (mswindows_dde_mlid);
#endif

  free (d->device_data);
}

static Lisp_Object
mswindows_device_system_metrics (struct device *d,
				 enum device_metrics m)
{
  switch (m)
    {
    case DM_size_device:
      return Fcons (make_int (DEVICE_MSWINDOWS_HORZRES(d)),
		    make_int (DEVICE_MSWINDOWS_VERTRES(d)));
      break;
    case DM_size_device_mm:
      return Fcons (make_int (DEVICE_MSWINDOWS_HORZSIZE(d)),
		    make_int (DEVICE_MSWINDOWS_VERTSIZE(d)));
      break;
    case DM_num_bit_planes:
      /* this is what X means by bitplanes therefore we ought to be
         consistent. num planes is always 1 under mswindows and
         therefore useless */
      return make_int (DEVICE_MSWINDOWS_BITSPIXEL(d));
      break;
    case DM_num_color_cells:
      return make_int (DEVICE_MSWINDOWS_CELLS(d));
      break;

      /*** Colors ***/
#define FROB(met, index1, index2)			\
    case DM_##met:					\
      return build_syscolor_cons (index1, index2);
      
      FROB (color_default, COLOR_WINDOW, COLOR_WINDOWTEXT);
      FROB (color_select, COLOR_HIGHLIGHT, COLOR_HIGHLIGHTTEXT);
      FROB (color_balloon, COLOR_INFOBK, COLOR_INFOTEXT);
      FROB (color_3d_face, COLOR_3DFACE, COLOR_BTNTEXT);
      FROB (color_3d_light, COLOR_3DLIGHT, COLOR_3DHILIGHT);
      FROB (color_3d_dark, COLOR_3DSHADOW, COLOR_3DDKSHADOW);
      FROB (color_menu, COLOR_MENU, COLOR_MENUTEXT);
      FROB (color_menu_highlight, COLOR_HIGHLIGHT, COLOR_HIGHLIGHTTEXT);
      FROB (color_menu_button, COLOR_MENU, COLOR_MENUTEXT);
      FROB (color_menu_disabled, COLOR_MENU, COLOR_GRAYTEXT);
      FROB (color_toolbar, COLOR_BTNFACE, COLOR_BTNTEXT);
      FROB (color_scrollbar, COLOR_SCROLLBAR, COLOR_CAPTIONTEXT);
      FROB (color_desktop, -1, COLOR_DESKTOP);
      FROB (color_workspace, -1, COLOR_APPWORKSPACE);
#undef FROB

      /*** Sizes ***/
#define FROB(met, index1, index2)			\
    case DM_##met:					\
      return build_sysmetrics_cons (index1, index2);

      FROB (size_cursor, SM_CXCURSOR, SM_CYCURSOR);
      FROB (size_scrollbar, SM_CXVSCROLL, SM_CYHSCROLL);
      FROB (size_menu, -1, SM_CYMENU);
      FROB (size_icon, SM_CXICON, SM_CYICON);
      FROB (size_icon_small, SM_CXSMICON, SM_CYSMICON);
#undef FROB

    case DM_size_workspace:
      {
	RECT rc;
	SystemParametersInfo (SPI_GETWORKAREA, 0, &rc, 0);
	return Fcons (make_int (rc.right - rc.left),
		      make_int (rc.bottom - rc.top));
      }
      /*
	case DM_size_toolbar:
	case DM_size_toolbar_button:
	case DM_size_toolbar_border:
      */

      /*** Features ***/
#define FROB(met, index)			\
    case DM_##met:				\
      return make_int (GetSystemMetrics (index));

      FROB (mouse_buttons, SM_CMOUSEBUTTONS);
      FROB (swap_buttons, SM_SWAPBUTTON);
      FROB (show_sounds, SM_SHOWSOUNDS);
      FROB (slow_device, SM_SLOWMACHINE);
      FROB (security, SM_SECURE);
#undef FROB

    }

  /* Do not know such property */
  return Qunbound;
}

static unsigned int
mswindows_device_implementation_flags (void)
{
  return XDEVIMPF_PIXEL_GEOMETRY;
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_device_mswindows (void)
{
  defsymbol (&Qinit_pre_mswindows_win, "init-pre-mswindows-win");
  defsymbol (&Qinit_post_mswindows_win, "init-post-mswindows-win");

  DEFVAR_LISP ("mswindows-downcase-file-names", &Vmswindows_downcase_file_names /*
Non-nil means convert all-upper case file names to lower case.
This applies when performing completions and file name expansion.*/ );
  Vmswindows_downcase_file_names = Qnil;

  DEFVAR_LISP ("mswindows-get-true-file-attributes", &Vmswindows_get_true_file_attributes /*
    "Non-nil means determine accurate link count in file-attributes.
This option slows down file-attributes noticeably, so is disabled by
default.  Note that it is only useful for files on NTFS volumes,
where hard links are supported.
*/ );
  Vmswindows_get_true_file_attributes = Qnil;
}

void
console_type_create_device_mswindows (void)
{
  CONSOLE_HAS_METHOD (mswindows, init_device);
  CONSOLE_HAS_METHOD (mswindows, finish_init_device);
/*  CONSOLE_HAS_METHOD (mswindows, mark_device); */
  CONSOLE_HAS_METHOD (mswindows, delete_device);
  CONSOLE_HAS_METHOD (mswindows, device_system_metrics);
  CONSOLE_HAS_METHOD (mswindows, device_implementation_flags);
}

void
vars_of_device_mswindows (void)
{
}
