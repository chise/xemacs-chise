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

#ifndef _XEMACS_CONSOLE_MSW_H_
#define _XEMACS_CONSOLE_MSW_H_

#include "console.h"
#ifdef CONST			/* I suspect this is safe */
#undef CONST
#endif
#include <windows.h>
#include <ddeml.h>	/* DDE management library */
#ifndef __CYGWIN32__
#include <shellapi.h>	/* FileManager/Explorer drag and drop */
#include <commctrl.h>
#endif

#ifdef HAVE_XPM
#include <X11/xpm.h>
#endif

/*
 * XXX FIXME: The following X modifier defs in events-mod.h clash with win32
 * hotkey defs in winuser.h. For the moment lose the win32 versions.
 * Maybe we should rename all of MOD_* to something that doesn't clash.
 */
#ifdef MOD_CONTROL
#  undef MOD_CONTROL
#endif  
#ifdef MOD_ALT
#  undef MOD_ALT
#endif  
#ifdef MOD_SHIFT
#  undef MOD_SHIFT
#endif  


/* The name of the main window class */
#define XEMACS_CLASS "XEmacs"


/*
 * Console
 */

DECLARE_CONSOLE_TYPE (mswindows);

struct mswindows_console
{
  int infd, outfd;
};


/*
 * Device
 */

#define MSW_FONTSIZE (LF_FACESIZE*4+12)

struct mswindows_font_enum
{
  char fontname[MSW_FONTSIZE];
  struct mswindows_font_enum *next;
};

struct mswindows_device
{
  int logpixelsx, logpixelsy;
  int planes, cells;
  int horzres, vertres;		/* Size in pixels */
  int horzsize, vertsize;	/* Size in mm */
  int bitspixel;
  struct mswindows_font_enum *fontlist;
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

  /* compatible DC for bitmap operations */
  HDC cdc;

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

  /* Geometry, in characters, as specified by proplist during frame
     creation. Memebers are set to -1 for unspecified */
  XEMACS_RECT_WH* target_rect;
};

#define FRAME_MSWINDOWS_DATA(f) FRAME_TYPE_DATA (f, mswindows)

#define FRAME_MSWINDOWS_HANDLE(f)	   (FRAME_MSWINDOWS_DATA (f)->hwnd)
#define FRAME_MSWINDOWS_DC(f)		   (FRAME_MSWINDOWS_DATA (f)->hdc)
#define FRAME_MSWINDOWS_CDC(f)		   (FRAME_MSWINDOWS_DATA (f)->cdc)
#define FRAME_MSWINDOWS_MENU_HASH_TABLE(f) (FRAME_MSWINDOWS_DATA (f)->menu_hash_table)
#define FRAME_MSWINDOWS_TOOLBAR_HASH_TABLE(f) \
 (FRAME_MSWINDOWS_DATA (f)->toolbar_hash_table)
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

void mswindows_redraw_exposed_area (struct frame *f, int x, int y, 
				    int width, int height);
void mswindows_size_frame_internal (struct frame* f, XEMACS_RECT_WH* dest);
void mswindows_enqueue_magic_event (HWND hwnd, UINT message);

/* win32 DDE management library */
#define MSWINDOWS_DDE_ITEM_OPEN "Open"
extern DWORD mswindows_dde_mlid;
extern HSZ mswindows_dde_service;
extern HSZ mswindows_dde_topic_system;
extern HSZ mswindows_dde_item_open;
HDDEDATA CALLBACK mswindows_dde_callback (UINT uType, UINT uFmt, HCONV hconv,
					  HSZ hszTopic, HSZ hszItem, HDDEDATA hdata,
					  DWORD dwData1, DWORD dwData2);

void mswindows_enqueue_misc_user_event (Lisp_Object channel,
					Lisp_Object function,
					Lisp_Object object);
Lisp_Object mswindows_cancel_dispatch_event (struct Lisp_Event* event);
Lisp_Object mswindows_pump_outstanding_events (void);
Lisp_Object mswindows_protect_modal_loop (Lisp_Object (*bfun) (Lisp_Object barg),
					  Lisp_Object barg);
void mswindows_unmodalize_signal_maybe (void);

#ifdef HAVE_WIN32_PROCESSES
HANDLE get_nt_process_handle (struct Lisp_Process *p);
#endif

extern Lisp_Object Vmswindows_frame_being_created;
extern Lisp_Object mswindows_frame_being_created;

void mswindows_enumerate_fonts (struct device *d);

#endif /* _XEMACS_CONSOLE_MSW_H_ */
