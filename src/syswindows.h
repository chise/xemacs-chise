/* Copyright (C) 2000 Free Software Foundation, Inc.
   Copyright (C) 2000 Ben Wing.

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

   Created May 2000 by Andy Piper.
   Windows-Mule stuff added by Ben Wing.
*/

#ifndef INCLUDED_syswindows_h_
#define INCLUDED_syswindows_h_

/* Note that there are currently FOUR different general
   Windows-related include files in src!

   Uses are approximately:

   syswindows.h: Mostly a wrapper around <windows.h>, including missing
   defines as necessary.  Also includes stuff needed on both Cygwin and
   native Windows, regardless of window system chosen.

   console-msw.h: Used on both Cygwin and native Windows, but only when
   native window system (as opposed to X) chosen.

   nt.h: [will be renamed to win32.h] Used only on native Windows, and
   regardless of window system chosen -- but used on both purely native
   Windows (s/windowsnt.h) and MinGW (s/mingw32.h).

   ntheap.h: Used only on native Windows and only when standard dumping
   mechanism (unexnt.c) used.

   All of the last three files include the first.
*/

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif

#include <windows.h>

#if (defined (CYGWIN) || defined(MINGW)) && \
	CYGWIN_VERSION_DLL_MAJOR < 21
extern BOOL WINAPI DdeFreeStringHandle(DWORD,HSZ);
extern BOOL WINAPI PlaySound(LPCSTR,HMODULE,DWORD);
#define stricmp strcasecmp
#define FONTENUMPROC FONTENUMEXPROC
#define ntmTm ntmentm
#elif defined (WIN32_LEAN_AND_MEAN)
#include <winspool.h>
#include <mmsystem.h>
#include <shellapi.h>
#include <ddeml.h>
#endif

/* mmsystem.h defines. */
#ifndef SND_ASYNC
#define SND_ASYNC		1
#endif
#ifndef SND_NODEFAULT
#define SND_NODEFAULT		2
#endif
#ifndef SND_MEMORY
#define SND_MEMORY		4
#endif
#ifndef SND_FILENAME
#define SND_FILENAME		0x2000L
#endif

/* winspool.h defines. */
#ifndef PHYSICALWIDTH
#define PHYSICALWIDTH 110
#endif
#ifndef PHYSICALHEIGHT
#define PHYSICALHEIGHT 111
#endif
#ifndef PHYSICALOFFSETX
#define PHYSICALOFFSETX 112
#endif
#ifndef PHYSICALOFFSETY
#define PHYSICALOFFSETY 113
#endif

/* windows.h defines. */
#if defined (CYGWIN) && (CYGWIN_VERSION_DLL_MAJOR < 20)
typedef NMHDR *LPNMHDR;
#endif

#ifndef SPI_GETWHEELSCROLLLINES
#define SPI_GETWHEELSCROLLLINES 104
#endif
#ifndef WHEEL_PAGESCROLL
#define WHEEL_PAGESCROLL (UINT_MAX)
#endif
#ifndef WHEEL_DELTA
#define WHEEL_DELTA 120
#endif
#ifndef WM_MOUSEWHEEL
#define WM_MOUSEWHEEL 0x20A
#endif
#ifndef VK_APPS
#define VK_APPS			0x5D
#endif
#ifndef SIF_TRACKPOS
#define SIF_TRACKPOS		0x0010
#endif
#ifndef FW_BLACK
#define FW_BLACK	FW_HEAVY
#endif
#ifndef FW_ULTRABOLD
#define FW_ULTRABOLD	FW_EXTRABOLD
#endif
#ifndef FW_DEMIBOLD
#define FW_DEMIBOLD	FW_SEMIBOLD
#endif
#ifndef FW_ULTRALIGHT
#define FW_ULTRALIGHT	FW_EXTRALIGHT
#endif
#ifndef APPCMD_FILTERINITS
#define APPCMD_FILTERINITS	0x20L
#endif
#ifndef CBF_FAIL_SELFCONNECTIONS
#define CBF_FAIL_SELFCONNECTIONS 0x1000
#endif
#ifndef CBF_SKIP_ALLNOTIFICATIONS
#define CBF_SKIP_ALLNOTIFICATIONS	0x3C0000
#endif
#ifndef CBF_FAIL_ADVISES
#define CBF_FAIL_ADVISES	0x4000
#endif
#ifndef CBF_FAIL_POKES
#define CBF_FAIL_POKES		0x10000
#endif
#ifndef CBF_FAIL_REQUESTS
#define CBF_FAIL_REQUESTS	0x20000
#endif
#ifndef SZDDESYS_TOPIC
#define SZDDESYS_TOPIC		"System"
#endif
#ifndef JOHAB_CHARSET
#define JOHAB_CHARSET 		130
#endif
#ifndef MAC_CHARSET
#define MAC_CHARSET 		77
#endif

/***************************************************************/

/* Definitions for Mule under MS Windows */

/* extern int mswindows_windows9x_p; */
/* #define EIUNICODE_P (!mswindows_windows9x_p) */
#define EIUNICODE_P 0

#define EITCHAR_SIZE (EIUNICODE_P ? sizeof (WCHAR) : sizeof (CHAR))
#define EITEXT(arg) (EIUNICODE_P ? L##arg : (arg))
#define EICOPY_TCHAR(ptr, ch) \
  (EIUNICODE_P ? (* (LPWSTR) (ptr) = L##ch) : (* (LPSTR) (ptr) = (ch)))

#endif /* INCLUDED_syswindows_h_ */
