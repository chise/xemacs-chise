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
#include "objects-msw.h"
#include "events.h"
#include "faces.h"
#include "frame.h"
#include "sysdep.h"

#include <winspool.h>

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
build_syscolor_string (int idx)
{
  return (idx < 0 ? Qnil : mswindows_color_to_string (GetSysColor (idx)));
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

static Lisp_Object
build_devicecaps_cons (HDC hdc, int index1, int index2)
{
  return Fcons (index1 < 0 ? Qnil : make_int (GetDeviceCaps (hdc, index1)),
		index2 < 0 ? Qnil : make_int (GetDeviceCaps (hdc, index2)));
}



/************************************************************************/
/*                          display methods                             */
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
  DEVICE_MSWINDOWS_FONTLIST (d) = mswindows_enumerate_fonts (hdc);

  DeleteDC (hdc);

  /* Register the main window class */
  wc.cbSize = sizeof (WNDCLASSEX);
  wc.style = CS_OWNDC;	/* One DC per window */
  wc.lpfnWndProc = (WNDPROC) mswindows_wnd_proc;
  wc.cbClsExtra = 0;
  wc.cbWndExtra = MSWINDOWS_WINDOW_EXTRA_BYTES;
  /* This must match whatever is passed to CreateWIndowEx, NULL is ok
     for this. */
  wc.hInstance = NULL;	
  wc.hIcon = LoadIcon (GetModuleHandle(NULL), XEMACS_CLASS);
  wc.hCursor = LoadCursor (NULL, IDC_ARROW);
  /* Background brush is only used during sizing, when XEmacs cannot
     take over */
  wc.hbrBackground = (HBRUSH)(COLOR_APPWORKSPACE + 1);
  wc.lpszMenuName = NULL;

  wc.lpszClassName = XEMACS_CLASS;
  wc.hIconSm = (HICON) LoadImage (GetModuleHandle (NULL), XEMACS_CLASS,
			  IMAGE_ICON, 16, 16, 0);
  RegisterClassEx (&wc);

#ifdef HAVE_WIDGETS
  xzero (wc);
  /* Register the main window class */
  wc.cbSize = sizeof (WNDCLASSEX);
  wc.lpfnWndProc = (WNDPROC) mswindows_control_wnd_proc;
  wc.lpszClassName = XEMACS_CONTROL_CLASS;
  wc.hInstance = NULL;
  RegisterClassEx (&wc);
#endif

#if defined (HAVE_TOOLBARS) || defined (HAVE_WIDGETS)
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
#ifdef HAVE_DRAGNDROP
  DdeNameService (mswindows_dde_mlid, 0L, 0L, DNS_UNREGISTER);
  DdeFreeStringHandle (mswindows_dde_mlid, mswindows_dde_item_open);
  DdeFreeStringHandle (mswindows_dde_mlid, mswindows_dde_topic_system);
  DdeFreeStringHandle (mswindows_dde_mlid, mswindows_dde_service);
  DdeUninitialize (mswindows_dde_mlid);
#endif

  free (d->device_data);
}

static void
mswindows_mark_device (struct device *d)
{
  mark_object (DEVICE_MSWINDOWS_FONTLIST (d));
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
    case DM_device_dpi:
      return Fcons (make_int (DEVICE_MSWINDOWS_LOGPIXELSX(d)),
		    make_int (DEVICE_MSWINDOWS_LOGPIXELSY(d)));
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
#define FROB(met, fore, back)				\
    case DM_##met:					\
      return build_syscolor_cons (fore, back);
      
      FROB (color_default, COLOR_WINDOWTEXT, COLOR_WINDOW);
      FROB (color_select, COLOR_HIGHLIGHTTEXT, COLOR_HIGHLIGHT);
      FROB (color_balloon, COLOR_INFOTEXT, COLOR_INFOBK);
      FROB (color_3d_face, COLOR_BTNTEXT, COLOR_BTNFACE);
      FROB (color_3d_light, COLOR_3DHILIGHT, COLOR_3DLIGHT);
      FROB (color_3d_dark, COLOR_3DDKSHADOW, COLOR_3DSHADOW);
      FROB (color_menu, COLOR_MENUTEXT, COLOR_MENU);
      FROB (color_menu_highlight, COLOR_HIGHLIGHTTEXT, COLOR_HIGHLIGHT);
      FROB (color_menu_button, COLOR_MENUTEXT, COLOR_MENU);
      FROB (color_menu_disabled, COLOR_GRAYTEXT, COLOR_MENU);
      FROB (color_toolbar, COLOR_BTNTEXT, COLOR_BTNFACE);
      FROB (color_scrollbar, COLOR_CAPTIONTEXT, COLOR_SCROLLBAR);
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
/*                          printer methods                             */
/************************************************************************/

static void
signal_open_printer_error (struct device *d)
{
  signal_simple_error ("Failed to open printer", DEVICE_CONNECTION (d));
}

static void
msprinter_init_device (struct device *d, Lisp_Object props)
{
  char* printer_name;

  DEVICE_INFD (d) = DEVICE_OUTFD (d) = -1;

  CHECK_STRING (DEVICE_CONNECTION (d));

  TO_EXTERNAL_FORMAT (LISP_STRING, DEVICE_CONNECTION (d),
		      C_STRING_ALLOCA, printer_name,
		      Qctext);

  d->device_data = xnew_and_zero (struct msprinter_device);

  DEVICE_MSPRINTER_NAME(d) = xstrdup (printer_name);

  if (!OpenPrinter (printer_name, &DEVICE_MSPRINTER_HPRINTER (d), NULL))
    {
      DEVICE_MSPRINTER_HPRINTER (d) = NULL;
      signal_open_printer_error (d);
    }

  DEVICE_MSPRINTER_HDC (d) = CreateDC ("WINSPOOL", printer_name,
				       NULL, NULL);
  if (DEVICE_MSPRINTER_HDC (d) == NULL)
    signal_open_printer_error (d);

  /* Determinie DEVMODE size and store the default DEVMODE */
  DEVICE_MSPRINTER_DEVMODE_SIZE(d) = 
    DocumentProperties (NULL, DEVICE_MSPRINTER_HPRINTER(d),
			printer_name, NULL, NULL, 0);
  if (DEVICE_MSPRINTER_DEVMODE_SIZE(d) <= 0)
    signal_open_printer_error (d);

  DEVICE_MSPRINTER_DEVMODE(d) =
    (DEVMODE*) xmalloc (DEVICE_MSPRINTER_DEVMODE_SIZE(d));
  DocumentProperties (NULL, DEVICE_MSPRINTER_HPRINTER(d),
		      printer_name, DEVICE_MSPRINTER_DEVMODE(d),
		      NULL, DM_OUT_BUFFER);

  /* We do not use printer fon list as we do with the display
     device. Rather, we allow GDI to pick the closest match to the
     display font. */
  DEVICE_MSPRINTER_FONTLIST (d) = Qnil;

  DEVICE_CLASS (d) = (GetDeviceCaps (DEVICE_MSPRINTER_HDC (d), BITSPIXEL)
		      * GetDeviceCaps (DEVICE_MSPRINTER_HDC (d), PLANES)
		      > 1) ? Qcolor : Qmono;
}

static Lisp_Object
msprinter_device_system_metrics (struct device *d,
				 enum device_metrics m)
{
  switch (m)
    {
      /* Device sizes - pixel and mm */
#define FROB(met, index1, index2)			\
    case DM_##met:					\
      return build_devicecaps_cons			\
         (DEVICE_MSPRINTER_HDC(d), index1, index2);

      FROB (size_device, PHYSICALWIDTH, PHYSICALHEIGHT);
      FROB (size_device_mm, HORZSIZE, VERTSIZE);
      FROB (size_workspace, HORZRES, VERTRES);
      FROB (offset_workspace, PHYSICALOFFSETX, PHYSICALOFFSETY);
      FROB (device_dpi, LOGPIXELSX, LOGPIXELSY);
#undef FROB

    case DM_num_bit_planes:
      /* this is what X means by bitplanes therefore we ought to be
         consistent. num planes is always 1 under mswindows and
         therefore useless */
      return make_int (GetDeviceCaps (DEVICE_MSPRINTER_HDC(d), BITSPIXEL));

    case DM_num_color_cells:	/* Prnters are non-palette devices */
    case DM_slow_device:	/* Animation would be a really bad idea */
    case DM_security:		/* Not provided by windows */
      return Qzero;
    }

  /* Do not know such property */
  return Qunbound;
}

static void
msprinter_delete_device (struct device *d)
{
  if (d->device_data)
    {
      if (DEVICE_MSPRINTER_HPRINTER (d))
	ClosePrinter (DEVICE_MSPRINTER_HPRINTER (d));
      if (DEVICE_MSPRINTER_HDC (d))
	DeleteDC (DEVICE_MSPRINTER_HDC (d));
      if (DEVICE_MSPRINTER_NAME (d))
	free (DEVICE_MSPRINTER_NAME (d));
      if (DEVICE_MSPRINTER_DEVMODE (d))
	free (DEVICE_MSPRINTER_DEVMODE (d));
      if (DEVICE_MSPRINTER_DEVMODE_MIRROR (d))
	free (DEVICE_MSPRINTER_DEVMODE_MIRROR (d));

      free (d->device_data);
    }
}

static void
msprinter_mark_device (struct device *d)
{
  mark_object (DEVICE_MSPRINTER_FONTLIST (d));
}

static unsigned int
msprinter_device_implementation_flags (void)
{
  return (  XDEVIMPF_PIXEL_GEOMETRY
	  | XDEVIMPF_IS_A_PRINTER
	  | XDEVIMPF_NO_AUTO_REDISPLAY
	  | XDEVIMPF_FRAMELESS_OK );
}


/************************************************************************/
/*                      printer external functions                      */
/************************************************************************/

/* 
 * Return a copy of default DEVMODE. The copy returned is in
 * a static buffer which will be overwritten by next call.
 */
DEVMODE*
msprinter_get_devmode_copy (struct device *d)
{
  assert (DEVICE_MSPRINTER_P (d));

  if (DEVICE_MSPRINTER_DEVMODE_MIRROR(d) == NULL)
    DEVICE_MSPRINTER_DEVMODE_MIRROR(d) = 
      (DEVMODE*) xmalloc (DEVICE_MSPRINTER_DEVMODE_SIZE(d));

  memcpy (DEVICE_MSPRINTER_DEVMODE_MIRROR(d),
	  DEVICE_MSPRINTER_DEVMODE(d),
	  DEVICE_MSPRINTER_DEVMODE_SIZE(d));

  return DEVICE_MSPRINTER_DEVMODE_MIRROR(d);
}

/*
 * Apply settings from the DEVMODE. The settings are considered
 * incremental to the default DEVMODE, so that changes in the
 * passed structure supercede parameters of the printer.
 *
 * The passed structure is overwritten by the fuction call;
 * complete printer settings are returned.
 */
void
msprinter_apply_devmode (struct device *d, DEVMODE *devmode)
{
  assert (DEVICE_MSPRINTER_P (d));

  DocumentProperties (NULL,
		      DEVICE_MSPRINTER_HPRINTER(d),
		      DEVICE_MSPRINTER_NAME(d),
		      devmode, devmode,
		      DM_IN_BUFFER | DM_OUT_BUFFER);

  ResetDC (DEVICE_MSPRINTER_HDC (d), devmode);
}


/************************************************************************/
/*                            initialization                            */
/************************************************************************/

void
syms_of_device_mswindows (void)
{
  defsymbol (&Qinit_pre_mswindows_win, "init-pre-mswindows-win");
  defsymbol (&Qinit_post_mswindows_win, "init-post-mswindows-win");
}

void
console_type_create_device_mswindows (void)
{
  CONSOLE_HAS_METHOD (mswindows, init_device);
  CONSOLE_HAS_METHOD (mswindows, finish_init_device);
  CONSOLE_HAS_METHOD (mswindows, mark_device);
  CONSOLE_HAS_METHOD (mswindows, delete_device);
  CONSOLE_HAS_METHOD (mswindows, device_system_metrics);
  CONSOLE_HAS_METHOD (mswindows, device_implementation_flags);

  CONSOLE_HAS_METHOD (msprinter, init_device);
  CONSOLE_HAS_METHOD (msprinter, mark_device);
  CONSOLE_HAS_METHOD (msprinter, delete_device);
  CONSOLE_HAS_METHOD (msprinter, device_system_metrics);
  CONSOLE_HAS_METHOD (msprinter, device_implementation_flags);
}


void
vars_of_device_mswindows (void)
{
  DEFVAR_LISP ("mswindows-downcase-file-names", &Vmswindows_downcase_file_names /*
Non-nil means convert all-upper case file names to lower case.
This applies when performing completions and file name expansion.
*/ );
  Vmswindows_downcase_file_names = Qnil;

  DEFVAR_LISP ("mswindows-get-true-file-attributes", &Vmswindows_get_true_file_attributes /*
Non-nil means determine accurate link count in file-attributes.
This option slows down file-attributes noticeably, so is disabled by
default.  Note that it is only useful for files on NTFS volumes,
where hard links are supported.
*/ );
  Vmswindows_get_true_file_attributes = Qnil;
}
