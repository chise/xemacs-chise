/* Define mswindows-specific console, device, and frame object for XEmacs.
   Copyright (C) 1989, 1992, 1993, 1994, 1995 Free Software Foundation, Inc.
   Copyright (C) 1994, 1995 Board of Trustees, University of Illinois.

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

   Ultimately based on FSF, then later on JWZ work for Lemacs.
   Rewritten over time by Ben Wing and Chuck Thompson.
   Rewritten for mswindows by Jonathan Harris, November 1997 for 21.0.
 */

#ifndef INCLUDED_console_msw_h_
#define INCLUDED_console_msw_h_

#include "console.h"
#include <windows.h>
#include <ddeml.h>	/* DDE management library */
#if !defined(__CYGWIN32__) && !defined(__MINGW32__) \
	|| CYGWIN_VERSION_DLL_MAJOR > 20
#include <shellapi.h>	/* FileManager/Explorer drag and drop */
#include <commctrl.h>
#endif

#ifdef HAVE_XPM
#include <X11/xpm.h>
#endif

/* The name of the main window class */
#define XEMACS_CLASS "XEmacs"

#define XEMACS_CONTROL_CLASS "XEmacsControl"

/*
 * Console
 */

DECLARE_CONSOLE_TYPE (mswindows);

struct mswindows_console
{
  int infd, outfd;
};

DECLARE_CONSOLE_TYPE (msprinter);

/*
 * Device
 */

#define MSW_FONTSIZE (LF_FACESIZE*4+12)

struct mswindows_device
{
  int logpixelsx, logpixelsy;
  int planes, cells;
  int horzres, vertres;		/* Size in pixels */
  int horzsize, vertsize;	/* Size in mm */
  int bitspixel;
  Lisp_Object fontlist;		/* List of strings, device fonts */
  HDC hcdc;			/* Compatible DC */
};

#define DEVICE_MSWINDOWS_DATA(d) DEVICE_TYPE_DATA (d, mswindows)
#define DEVICE_MSWINDOWS_LOGPIXELSX(d) 	(DEVICE_MSWINDOWS_DATA (d)->logpixelsx)
#define DEVICE_MSWINDOWS_LOGPIXELSY(d) 	(DEVICE_MSWINDOWS_DATA (d)->logpixelsy)
#define DEVICE_MSWINDOWS_PLANES(d) 	(DEVICE_MSWINDOWS_DATA (d)->planes)
#define DEVICE_MSWINDOWS_CELLS(d) 	(DEVICE_MSWINDOWS_DATA (d)->cells)
#define DEVICE_MSWINDOWS_HORZRES(d) 	(DEVICE_MSWINDOWS_DATA (d)->horzres)
#define DEVICE_MSWINDOWS_VERTRES(d) 	(DEVICE_MSWINDOWS_DATA (d)->vertres)
#define DEVICE_MSWINDOWS_HORZSIZE(d) 	(DEVICE_MSWINDOWS_DATA (d)->horzsize)
#define DEVICE_MSWINDOWS_VERTSIZE(d) 	(DEVICE_MSWINDOWS_DATA (d)->vertsize)
#define DEVICE_MSWINDOWS_BITSPIXEL(d) 	(DEVICE_MSWINDOWS_DATA (d)->bitspixel)
#define DEVICE_MSWINDOWS_FONTLIST(d) 	(DEVICE_MSWINDOWS_DATA (d)->fontlist)
#define DEVICE_MSWINDOWS_HCDC(d)	(DEVICE_MSWINDOWS_DATA (d)->hcdc)

struct msprinter_device
{
  HDC hdc, hcdc;		/* Printer and the comp. DCs */
  HANDLE hprinter;
  Lisp_Object fontlist;
  char* name;
  DEVMODE *devmode, *devmode_mirror;
  size_t devmode_size;
};

#define DEVICE_MSPRINTER_DATA(d) DEVICE_TYPE_DATA (d, msprinter)
#define DEVICE_MSPRINTER_HDC(d) 	(DEVICE_MSPRINTER_DATA (d)->hdc)
#define DEVICE_MSPRINTER_HCDC(d)	(DEVICE_MSPRINTER_DATA (d)->hcdc)
#define DEVICE_MSPRINTER_HPRINTER(d) 	(DEVICE_MSPRINTER_DATA (d)->hprinter)
#define DEVICE_MSPRINTER_FONTLIST(d) 	(DEVICE_MSPRINTER_DATA (d)->fontlist)
#define DEVICE_MSPRINTER_NAME(d) 	(DEVICE_MSPRINTER_DATA (d)->name)
#define DEVICE_MSPRINTER_DEVMODE(d) 	(DEVICE_MSPRINTER_DATA (d)->devmode)
#define DEVICE_MSPRINTER_DEVMODE_MIRROR(d) \
	(DEVICE_MSPRINTER_DATA (d)->devmode_mirror)
#define DEVICE_MSPRINTER_DEVMODE_SIZE(d) \
	(DEVICE_MSPRINTER_DATA (d)->devmode_size)

#define CONSOLE_TYPESYM_MSPRINTER_P(typesym) EQ (typesym, Qmsprinter)
#define DEVICE_MSPRINTER_P(dev) CONSOLE_TYPESYM_MSPRINTER_P (DEVICE_TYPE (dev))
#define CHECK_MSPRINTER_DEVICE(z) CHECK_DEVICE_TYPE (z, msprinter)
#define CONCHECK_MSPRINTER_DEVICE(z) CONCHECK_DEVICE_TYPE (z, msprinter)

/* Printer functions in device-msw.c */
DEVMODE* msprinter_get_devmode_copy (struct device *d);
void msprinter_apply_devmode (struct device *d, DEVMODE *devmode);

/* Printer functions in frame-msw.c */
void msprinter_start_page (struct frame *f);

/* Common checks */

#define DEVICE_MSGDI_P(dev) (DEVICE_MSWINDOWS_P(dev) || DEVICE_MSPRINTER_P(dev))
#define CHECK_MSGDI_DEVICE(d)				\
  do {							\
    CHECK_DEVICE (d);					\
    if (!(DEVICEP (d) && DEVICE_MSGDI_P(XDEVICE(d))))	\
      dead_wrong_type_argument				\
	(list3 (Qor, Qmswindows, Qmsprinter), d);	\
  } while (0)
#define CONCHECK_MSGDI_DEVICE(d)			\
  do {							\
    CHECK_DEVICE (d);					\
    if (!(DEVICEP (d) && DEVICE_MSGDI_P(XDEVICE(d))))	\
      wrong_type_argument				\
	(list3 (Qor, Qmswindows, Qmsprinter), d);	\
  } while (0)

/*
 * Frame
 */
typedef struct
{
  int left;
  int top;
  int width;
  int height;
} XEMACS_RECT_WH;

struct mswindows_frame
{
  /* win32 window handle */
  HWND hwnd;

  /* DC for this win32 window */
  HDC hdc;

  /* Time of last click event, for button 2 emul */
  DWORD last_click_time;

  /* Coordinates of last click event, screen-relative */
  POINTS last_click_point;
#ifdef HAVE_TOOLBARS
  /* Toolbar hash table. See toolbar-msw.c */
  Lisp_Object toolbar_hash_table;
  unsigned int toolbar_checksum[4];
#endif

  /* Menu hash table. See menubar-msw.c */
  Lisp_Object menu_hash_table;

  /* Menu checksum. See menubar-msw.c */
  unsigned int menu_checksum;

  /* Widget glyphs attached to this frame. See glyphs-msw.c */
  Lisp_Object widget_hash_table;

  /* Frame title hash value. See frame-msw.c */
  unsigned int title_checksum;

  /* Real character width and height of the frame.
     FRAME_{HEIGHT,WIDTH} do not work for pixel geometry! */
  int charheight, charwidth;

  /* Misc flags */
  int button2_need_lbutton : 1;
  int button2_need_rbutton : 1;
  int button2_is_down : 1;
  int ignore_next_lbutton_up : 1;
  int ignore_next_rbutton_up : 1;
  int sizing : 1;
  int paint_pending : 1; /* Whether a WM_PAINT magic event has been queued */

  /* Geometry, in characters, as specified by proplist during frame
     creation. Memebers are set to -1 for unspecified */
  XEMACS_RECT_WH* target_rect;
};

#define FRAME_MSWINDOWS_DATA(f) FRAME_TYPE_DATA (f, mswindows)

#define FRAME_MSWINDOWS_HANDLE(f)	   (FRAME_MSWINDOWS_DATA (f)->hwnd)
#define FRAME_MSWINDOWS_DC(f)		   (FRAME_MSWINDOWS_DATA (f)->hdc)
#define FRAME_MSWINDOWS_MENU_HASH_TABLE(f) (FRAME_MSWINDOWS_DATA (f)->menu_hash_table)
#define FRAME_MSWINDOWS_TOOLBAR_HASH_TABLE(f) \
 (FRAME_MSWINDOWS_DATA (f)->toolbar_hash_table)
#define FRAME_MSWINDOWS_WIDGET_HASH_TABLE(f) \
 (FRAME_MSWINDOWS_DATA (f)->widget_hash_table)
#define FRAME_MSWINDOWS_TOOLBAR_CHECKSUM(f,pos) \
 (FRAME_MSWINDOWS_DATA (f)->toolbar_checksum[pos])
#define FRAME_MSWINDOWS_MENU_CHECKSUM(f)  (FRAME_MSWINDOWS_DATA (f)->menu_checksum)
#define FRAME_MSWINDOWS_TITLE_CHECKSUM(f) (FRAME_MSWINDOWS_DATA (f)->title_checksum)
#define FRAME_MSWINDOWS_CHARWIDTH(f)	  (FRAME_MSWINDOWS_DATA (f)->charwidth)
#define FRAME_MSWINDOWS_CHARHEIGHT(f)	  (FRAME_MSWINDOWS_DATA (f)->charheight)
#define FRAME_MSWINDOWS_TARGET_RECT(f)	  (FRAME_MSWINDOWS_DATA (f)->target_rect)

/* Frame check and validation macros */
#define FRAME_MSWINDOWS_P(frm) CONSOLE_TYPESYM_MSWINDOWS_P (FRAME_TYPE (frm))
#define CHECK_MSWINDOWS_FRAME(z) CHECK_FRAME_TYPE (z, mswindows)
#define CONCHECK_MSWINDOWS_FRAME(z) CONCHECK_FRAME_TYPE (z, mswindows)

/* win32 window LONG indices */
#define XWL_FRAMEOBJ	0
#define XWL_COUNT	1	/* Number of LONGs that we use */
#define MSWINDOWS_WINDOW_EXTRA_BYTES	(XWL_COUNT*4)

/*
 * Printer frame, aka printer job
 */

struct msprinter_frame
{
  int left_margin, top_margin,		/* All in twips */
    right_margin, bottom_margin;
  int charheight, charwidth;		/* As per proplist or -1 if not gven */
  Lisp_Object orientation, duplex;	/* nil for printer's default */
  int job_started : 1;
  int page_started : 1;
};

#define FRAME_MSPRINTER_DATA(f) FRAME_TYPE_DATA (f, msprinter)
#define FRAME_MSPRINTER_LEFT_MARGIN(f)	 (FRAME_MSPRINTER_DATA (f)->left_margin)
#define FRAME_MSPRINTER_RIGHT_MARGIN(f)	 (FRAME_MSPRINTER_DATA (f)->top_margin)
#define FRAME_MSPRINTER_TOP_MARGIN(f)	 (FRAME_MSPRINTER_DATA (f)->right_margin)
#define FRAME_MSPRINTER_BOTTOM_MARGIN(f) (FRAME_MSPRINTER_DATA (f)->bottom_margin)
#define FRAME_MSPRINTER_JOB_STARTED(f)	 (FRAME_MSPRINTER_DATA (f)->job_started)
#define FRAME_MSPRINTER_PAGE_STARTED(f)	 (FRAME_MSPRINTER_DATA (f)->page_started)
#define FRAME_MSPRINTER_ORIENTATION(f)	 (FRAME_MSPRINTER_DATA (f)->orientation)
#define FRAME_MSPRINTER_DUPLEX(f)	 (FRAME_MSPRINTER_DATA (f)->duplex)
#define FRAME_MSPRINTER_CHARWIDTH(f)	 (FRAME_MSPRINTER_DATA (f)->charheight)
#define FRAME_MSPRINTER_CHARHEIGHT(f)	 (FRAME_MSPRINTER_DATA (f)->charwidth)

/*
 * Events
 */

/* win32 messages / magic event types */
#define EVENT_MSWINDOWS_MAGIC_TYPE(e)	\
	((e)->event.magic.underlying_mswindows_event)
#define XM_BUMPQUEUE	(WM_USER + 101)
#define XM_MAPFRAME	(WM_USER + 102)
#define XM_UNMAPFRAME	(WM_USER + 103)


/*
 * Random globals
 */

/* win32 "Windows" procedure */
LRESULT WINAPI mswindows_wnd_proc (HWND hwnd, UINT msg, WPARAM wParam,
				   LPARAM lParam);
LRESULT WINAPI mswindows_control_wnd_proc (HWND hwnd,
					   UINT msg, WPARAM wParam,
					   LPARAM lParam);

void mswindows_redraw_exposed_area (struct frame *f, int x, int y, 
				    int width, int height);
void mswindows_size_frame_internal (struct frame* f, XEMACS_RECT_WH* dest);
void mswindows_enqueue_magic_event (HWND hwnd, UINT msg);

/* win32 DDE management library */
#define MSWINDOWS_DDE_ITEM_OPEN "Open"
extern DWORD mswindows_dde_mlid;
extern HSZ mswindows_dde_service;
extern HSZ mswindows_dde_topic_system;
extern HSZ mswindows_dde_item_open;
HDDEDATA CALLBACK mswindows_dde_callback (UINT uType, UINT uFmt, HCONV hconv,
					  HSZ hszTopic, HSZ hszItem,
					  HDDEDATA hdata,
					  DWORD dwData1, DWORD dwData2);

void mswindows_enqueue_misc_user_event (Lisp_Object channel,
					Lisp_Object function,
					Lisp_Object object);
Lisp_Object mswindows_cancel_dispatch_event (Lisp_Event* event);
Lisp_Object mswindows_pump_outstanding_events (void);
Lisp_Object mswindows_protect_modal_loop (Lisp_Object (*bfun)
					  (Lisp_Object barg),
					  Lisp_Object barg);
void mswindows_unmodalize_signal_maybe (void);

COLORREF mswindows_string_to_color (const char *name);
USID emacs_mswindows_create_stream_pair (void* inhandle, void* outhandle,
					 Lisp_Object* instream,
					 Lisp_Object* outstream,
					 int flags);
USID emacs_mswindows_delete_stream_pair (Lisp_Object instream,
					 Lisp_Object outstream);

#ifdef HAVE_WIN32_PROCESSES
HANDLE get_nt_process_handle (Lisp_Process *p);
#endif

extern Lisp_Object Vmswindows_frame_being_created;
extern Lisp_Object mswindows_frame_being_created;

void msw_get_workspace_coords (RECT *rc);

HWND msw_get_console_hwnd (void);
void msw_hide_console (void);
void msw_show_console (void);
int msw_output_console_string (CONST Extbyte *str, Extcount len);

Lisp_Object mswindows_enumerate_fonts (HDC hdc);

int msw_char_is_accelerator (struct frame *f, Emchar ch);
Bytecount msw_translate_menu_or_dialog_item (Bufbyte *item, Bytecount len,
					     Bytecount maxlen, Emchar *accel,
					     Lisp_Object error_name);

#ifdef HAVE_TOOLBARS
Lisp_Object mswindows_get_toolbar_button_text (struct frame* f,
					       int command_id);
Lisp_Object mswindows_handle_toolbar_wm_command (struct frame* f,
						 HWND ctrl, WORD id);
#endif
Lisp_Object mswindows_handle_gui_wm_command (struct frame* f,
					     HWND ctrl, LPARAM id);

int msw_windows9x_p (void);

#endif /* INCLUDED_console_msw_h_ */
