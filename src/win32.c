/* Utility routines for XEmacs on Windows 9x, NT and Cygwin.
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
along with XEmacs; see the file COPYING.  If not, write to the Free
Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
02111-1307, USA. */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "syswindows.h"

typedef BOOL (WINAPI *pfSwitchToThread_t) (VOID);
pfSwitchToThread_t xSwitchToThread;

typedef HKL (WINAPI *pfGetKeyboardLayout_t) (DWORD);
pfGetKeyboardLayout_t xGetKeyboardLayout;
typedef BOOL (WINAPI *pfSetMenuDefaultItem_t) (HMENU, UINT, UINT);
pfSetMenuDefaultItem_t xSetMenuDefaultItem;
typedef BOOL (WINAPI *pfInsertMenuItemA_t) 
     (HMENU, UINT, BOOL, LPCMENUITEMINFOA);
pfInsertMenuItemA_t xInsertMenuItemA;
typedef BOOL (WINAPI *pfInsertMenuItemW_t) 
     (HMENU, UINT, BOOL, LPCMENUITEMINFOW);
pfInsertMenuItemW_t xInsertMenuItemW;
typedef HANDLE (WINAPI *pfLoadImageA_t) 
     (HINSTANCE, LPCSTR, UINT, int, int, UINT);
pfLoadImageA_t xLoadImageA;
typedef HANDLE (WINAPI *pfLoadImageW_t)
     (HINSTANCE, LPCWSTR, UINT, int, int, UINT);
pfLoadImageW_t xLoadImageW;
typedef ATOM (WINAPI *pfRegisterClassExA_t) (CONST WNDCLASSEXA *);
pfRegisterClassExA_t xRegisterClassExA;
typedef ATOM (WINAPI *pfRegisterClassExW_t) (CONST WNDCLASSEXW *);
pfRegisterClassExW_t xRegisterClassExW;

typedef int (WINAPI *pfEnumFontFamiliesExA_t) 
     (HDC, LPLOGFONTA, FONTENUMPROCA, LPARAM, DWORD);
pfEnumFontFamiliesExA_t xEnumFontFamiliesExA;
typedef int (WINAPI *pfEnumFontFamiliesExW_t) 
     (HDC, LPLOGFONTW, FONTENUMPROCW, LPARAM, DWORD);
pfEnumFontFamiliesExW_t xEnumFontFamiliesExW;

typedef DWORD (WINAPI *pfSHGetFileInfoA_t) 
     (LPCSTR, DWORD, SHFILEINFOA FAR *, UINT, UINT);
pfSHGetFileInfoA_t xSHGetFileInfoA;
typedef DWORD (WINAPI *pfSHGetFileInfoW_t) 
     (LPCWSTR, DWORD, SHFILEINFOW FAR *, UINT, UINT);
pfSHGetFileInfoW_t xSHGetFileInfoW;

Lisp_Object
tstr_to_local_file_format (Extbyte *pathout)
{
  Bufbyte *ttlff;
  Lisp_Object in;

  EXTERNAL_TO_C_STRING (pathout, ttlff, Qmswindows_tstr);
  WIN32_TO_LOCAL_FILE_FORMAT (ttlff, in);

  return in;
}

static void
init_potentially_nonexistent_functions (void)
{
  HMODULE h_kernel = GetModuleHandle ("kernel32");
  HMODULE h_user = GetModuleHandle ("user32");
  HMODULE h_gdi = GetModuleHandle ("gdi32");
  HMODULE h_shell = GetModuleHandle ("shell32");

  if (h_kernel)
    {
      xSwitchToThread =
	(pfSwitchToThread_t) GetProcAddress (h_kernel, "SwitchToThread");
    }

  if (h_user)
    {
      xGetKeyboardLayout =
	(pfGetKeyboardLayout_t) GetProcAddress (h_user, "GetKeyboardLayout");
      xSetMenuDefaultItem =
	(pfSetMenuDefaultItem_t) GetProcAddress (h_user, "SetMenuDefaultItem");
      xInsertMenuItemA =
	(pfInsertMenuItemA_t) GetProcAddress (h_user, "InsertMenuItemA");
      xInsertMenuItemW =
	(pfInsertMenuItemW_t) GetProcAddress (h_user, "InsertMenuItemW");
      xLoadImageA =
	(pfLoadImageA_t) GetProcAddress (h_user, "LoadImageA");
      xLoadImageW =
	(pfLoadImageW_t) GetProcAddress (h_user, "LoadImageW");
      xRegisterClassExA =
	(pfRegisterClassExA_t) GetProcAddress (h_user, "RegisterClassExA");
      xRegisterClassExW =
	(pfRegisterClassExW_t) GetProcAddress (h_user, "RegisterClassExW");
    }

  if (h_gdi)
    {
      xEnumFontFamiliesExA =
	(pfEnumFontFamiliesExA_t) GetProcAddress (h_gdi, "EnumFontFamiliesExA");
      xEnumFontFamiliesExW =
	(pfEnumFontFamiliesExW_t) GetProcAddress (h_gdi, "EnumFontFamiliesExW");
    }

  if (h_shell)
    {
      xSHGetFileInfoA =
	(pfSHGetFileInfoA_t) GetProcAddress (h_shell, "SHGetFileInfoA");
      xSHGetFileInfoW =
	(pfSHGetFileInfoW_t) GetProcAddress (h_shell, "SHGetFileInfoW");
    }
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
#ifdef CYGWIN
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
#ifdef CYGWIN
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
syms_of_win32 (void)
{
  DEFSUBR (Fmswindows_shell_execute);
}

void
init_win32 (void)
{
  init_potentially_nonexistent_functions ();
}
