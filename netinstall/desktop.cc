/*
 * Copyright (c) 2000, Red Hat, Inc.
 *
 *     This program is free software; you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation; either version 2 of the License, or
 *     (at your option) any later version.
 *
 *     A copy of the GNU General Public License can be found at
 *     http://www.gnu.org/
 *
 * Written by DJ Delorie <dj@cygnus.com>
 *
 */

/* The purpose of this file is to manage all the desktop setup, such
   as start menu, batch files, desktop icons, and shortcuts.  Note
   that unlike other do_* functions, this one is called directly from
   install.cc */


#include "win32.h"
#include <shlobj.h>

#include <io.h>
#include <stdio.h>
#include <stdlib.h>
#ifndef WIN32_NATIVE
#include <unistd.h>
#endif

#include "resource.h"
#include "ini.h"
#include "msg.h"
#include "state.h"
#include "concat.h"
#include "mkdir.h"
#include "dialog.h"
#include "version.h"
#include "reginfo.h"
#include "regedit.h"
#include "port.h"

extern "C" {
  void make_link_2 (char *exepath, char *args, char *icon, char *lname);
};

static OSVERSIONINFO verinfo;

/* Lines starting with '@' are conditionals - include 'N' for NT,
   '5' for Win95, '8' for Win98, '*' for all, like this:
	echo foo
	@N8
	echo NT or 98
	@*
   */

#define COMMAND9XARGS "/E:4096 /c"
#define COMMAND9XEXE  "\\command.com"

static char *iconname;
static char *batname;

static void
make_link (char *linkpath, char *title, char *target)
{
  char argbuf[_MAX_PATH];
  char *fname = concat (linkpath, "/", title, ".lnk", 0);

  if (_access (fname, 0) == 0)
    return; /* already exists */

  msg ("make_link %s, %s, %s\n", fname, title, target);

  mkdir_p (0, fname);

  char *exepath, *args;

  /* If we are running Win9x, build a command line. */
  if (verinfo.dwPlatformId == VER_PLATFORM_WIN32_NT)
    {
      exepath = target;
      args = "";
    }
  else
    {
      char windir[MAX_PATH];

      GetWindowsDirectory (windir, sizeof (windir));
      exepath = concat (windir, COMMAND9XEXE, 0);
      sprintf (argbuf, "%s %s", COMMAND9XARGS, target);
      args = argbuf;
    }

  msg ("make_link_2 (%s, %s, %s, %s)", exepath, args, iconname, fname);
  make_link_2 (exepath, args, iconname, fname);
}

static char* 
find_xemacs_exe_path ()
{
  if (xemacs_package->type == TY_CYGWIN)
    return backslash (concat (root_dir, "/bin/", XEMACS_CYGWIN_ARCH_NAME, 0));
  else
    return backslash (concat (root_dir, "\\XEmacs-",
			      xemacs_package->info[xemacs_package->trust].version, 
			      "\\", XEMACS_NATIVE_ARCH_NAME, 0));
}

static char* 
find_xemacs_exe_name ()
{
  /* Hack to support older versions. */
  if (strncmp (xemacs_package->info[xemacs_package->trust].version,
	       "21.1", 4) == 0)
    return strdup ("runemacs.exe");
  else if (xemacs_package->type == TY_CYGWIN)
    return backslash (concat ("xemacs-",
			      xemacs_package->info[xemacs_package->trust].version, 
			      ".exe", 0));
  else
    return strdup ("xemacs.exe");
}

static void
start_menu (char *title, char *target)
{
  char path[_MAX_PATH];
  LPITEMIDLIST id;
  int issystem = (root_scope == IDC_ROOT_SYSTEM) ? 1 : 0;
  SHGetSpecialFolderLocation (NULL, issystem ? CSIDL_COMMON_PROGRAMS : CSIDL_PROGRAMS, &id);
  SHGetPathFromIDList (id, path);
// following lines added because it appears Win95 does not use common programs
// unless it comes into play when multiple users for Win95 is enabled
  msg("Program directory for program link: %s",path);
  if ( strlen(path) == 0) {
     SHGetSpecialFolderLocation (NULL, CSIDL_PROGRAMS, &id);
     SHGetPathFromIDList (id, path);
     msg("Program directory for program link changed to: %s",path);
  }
// end of Win95 addition
  strcat (path, "/");
  strcat (path, XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME);
  make_link (path, title, target);
}

static void
desktop_icon (char *title, char *target)
{
  char path[_MAX_PATH];
  LPITEMIDLIST id;
  int issystem = (root_scope == IDC_ROOT_SYSTEM) ? 1 : 0;
  //SHGetSpecialFolderLocation (NULL, issystem ? CSIDL_DESKTOP : CSIDL_COMMON_DESKTOPDIRECTORY, &id);
  SHGetSpecialFolderLocation (NULL, issystem ? CSIDL_COMMON_DESKTOPDIRECTORY : CSIDL_DESKTOPDIRECTORY, &id);
  SHGetPathFromIDList (id, path);
// following lines added because it appears Win95 does not use common programs
// unless it comes into play when multiple users for Win95 is enabled
  msg("Desktop directory for desktop link: %s",path);
  if ( strlen(path) == 0) {
     SHGetSpecialFolderLocation (NULL, CSIDL_DESKTOPDIRECTORY, &id);
     SHGetPathFromIDList (id, path);
     msg("Desktop directory for deskop link changed to: %s",path);
  }
// end of Win95 addition
  make_link (path, title, target);
}

static int
uexists (char *path)
{
  char *f = concat (root_dir, path, 0);
  int a = _access (f, 0);
  free (f);
  if (a == 0)
    return 1;
  return 0;
}

static void
make_passwd_group ()
{
  if (verinfo.dwPlatformId != VER_PLATFORM_WIN32_NT)
    {
      int i;

      LOOP_PACKAGES
	{
	  if (!strcmp (package[i].name, "cygwin"))
	    {
	      /* mkpasswd and mkgroup are not working on 9x/ME up to 1.1.5-4 */
	      char *border_version = canonicalize_version ("1.1.5-4");
	      char *inst_version = canonicalize_version (pi.version);

	      if (strcmp (inst_version, border_version) <= 0)
		return;

	      break;
	    }
	}
    }

  if (uexists ("/etc/passwd") && uexists ("/etc/group"))
    return;

  char *fname = concat (root_dir, "/etc/postinstall/passwd-grp.bat", 0);
  mkdir_p (0, fname);

  FILE *p = fopen (fname, "wb");
  if (!p)
    return;

  if (!uexists ("/etc/passwd"))
    fprintf (p, "bin\\mkpasswd -l > etc\\passwd\n");
  if (!uexists ("/etc/group"))
    fprintf (p, "bin\\mkgroup -l > etc\\group\n");

  fclose (p);
}

static void
save_icon ()
{
  iconname = backslash (concat (root_dir, XEMACS_RESOURCE_DIR, 
				"xemacs.ico", 0));

  HRSRC rsrc = FindResource (NULL, "XEMACS.ICON", "FILE");
  if (rsrc == NULL)
    {
      fatal ("FindResource failed");
    }
  HGLOBAL res = LoadResource (NULL, rsrc);
  char *data = (char *) LockResource (res);
  int len = SizeofResource (NULL, rsrc);

  FILE *f = fopen (iconname, "wb");
  if (f)
    {
      fwrite (data, 1, len, f);
      fclose (f);
    }
}

static void
do_desktop_setup()
{
  save_icon ();

  if (root_menu && batname) {
    start_menu ("XEmacs", batname);
  }

  if (root_desktop && batname) {
    desktop_icon ("XEmacs", batname);
  }

  // set regkeys for the application
  if (xemacs_package != 0)
    {
      int issystem = (root_scope == IDC_ROOT_SYSTEM ? 1 : 0);
      if (xemacs_package->type == TY_NATIVE)
	{
#define FROB(exe)	  set_app_path ((exe), \
			find_xemacs_exe_path (), \
			issystem)
	  FROB (find_xemacs_exe_name ());
	  FROB ("runemacs.exe");
	  FROB ("xemacs.exe");
#undef FROB
	}
      else if (xemacs_package->type == TY_CYGWIN)
	{
	  int junk;
	  char* root = find_cygwin_root (&junk);
#define FROB(exe)	set_app_path ((exe), \
			concat (find_xemacs_exe_path (), ";", \
				root, "\\bin;", \
				root, "\\usr\\bin", 0), \
			issystem)
	  FROB (find_xemacs_exe_name ());
	  FROB ("runemacs.exe");
	  FROB ("xemacs.exe");
#undef FROB
	}
    }
}

static int da[] = { IDC_ROOT_DESKTOP, 0 };
static int ma[] = { IDC_ROOT_MENU, 0 };

static void
check_if_enable_next (HWND h)
{
  EnableWindow (GetDlgItem (h, IDOK), 1);
}

static void
load_dialog (HWND h)
{
  rbset (h, da, root_desktop);
  rbset (h, ma, root_menu);
  check_if_enable_next (h);
}

static int check_desktop (char *title, char *target)
{
  char path[_MAX_PATH];
  LPITEMIDLIST id;
  int issystem = (root_scope == IDC_ROOT_SYSTEM) ? 1 : 0;
  SHGetSpecialFolderLocation (NULL, issystem ? CSIDL_COMMON_DESKTOPDIRECTORY : CSIDL_DESKTOPDIRECTORY, &id);
  SHGetPathFromIDList (id, path);
  // following lines added because it appears Win95 does not use common programs
  // unless it comes into play when multiple users for Win95 is enabled
  msg ("Desktop directory for desktop link: %s",path);
  if (strlen (path) == 0) {
     SHGetSpecialFolderLocation (NULL, CSIDL_DESKTOPDIRECTORY, &id);
     SHGetPathFromIDList (id, path);
     msg ("Desktop directory for deskop link changed to: %s",path);
  }
  // end of Win95 addition
  char *fname = concat (path, "/", title, ".lnk", 0);

  if (_access (fname, 0) == 0)
    return 0; /* already exists */
  
  fname = concat (path, "/", title, ".pif", 0); /* check for a pif as well */
  
  if (_access (fname, 0) == 0)
    return 0; /* already exists */

  return IDC_ROOT_DESKTOP;
}

static int check_startmenu (char *title, char *target)
{
  char path[_MAX_PATH];
  LPITEMIDLIST id;
  int issystem = (root_scope == IDC_ROOT_SYSTEM) ? 1 : 0;
  SHGetSpecialFolderLocation (NULL, issystem ? CSIDL_COMMON_PROGRAMS : CSIDL_PROGRAMS, &id);
  SHGetPathFromIDList (id, path);
  // following lines added because it appears Win95 does not use common programs
  // unless it comes into play when multiple users for Win95 is enabled
  msg ("Program directory for program link: %s",path);
  if (strlen (path) == 0) {
     SHGetSpecialFolderLocation (NULL, CSIDL_PROGRAMS, &id);
     SHGetPathFromIDList (id, path);
     msg ("Program directory for program link changed to: %s",path);
  }
  // end of Win95 addition
  strcat (path, "/");
  strcat (path, XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME);
  char *fname = concat (path, "/", title, ".lnk", 0);

  if (_access (fname, 0) == 0)
    return 0; /* already exists */
  
  fname = concat (path, "/", title, ".pif", 0); /* check for a pif as well */
  
  if (_access (fname, 0) == 0)
    return 0; /* already exists */
  
  return IDC_ROOT_MENU;
}

static void
save_dialog (HWND h)
{
  root_desktop= rbget (h, da);
  root_menu = rbget (h, ma);
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDC_ROOT_DESKTOP:
    case IDC_ROOT_MENU:
      save_dialog (h);
      check_if_enable_next (h);
      break;

    case IDOK:
      save_dialog (h);
      do_desktop_setup();
      NEXT (IDD_S_POSTINSTALL);
      break;

    case IDC_BACK:
      save_dialog (h);
      NEXT (IDD_CHOOSE);
      break;

    case IDCANCEL:
      NEXT (0);
      break;
    }
  return FALSE;
}

static BOOL CALLBACK
dialog_proc (HWND h, UINT message, WPARAM wParam, LPARAM lParam)
{
  switch (message)
    {
    case WM_INITDIALOG:
      load_dialog (h);
      return FALSE;
    case WM_COMMAND:
      return HANDLE_WM_COMMAND (h, wParam, lParam, dialog_cmd);
    }
  return FALSE;
}

void
do_desktop (HINSTANCE h)
{
  CoInitialize (NULL);

  verinfo.dwOSVersionInfoSize = sizeof (verinfo);
  GetVersionEx (&verinfo);
  batname = 0;

  if (xemacs_package != 0 && xemacs_package->type != TY_GENERIC)
    {
      batname = concat (find_xemacs_exe_path (), "\\",
			find_xemacs_exe_name (), 
			0);
      root_desktop = check_desktop ("XEmacs", batname);
      root_menu = check_startmenu ("XEmacs", batname);
    }
  else
    {
      root_desktop = 0;
      root_menu = 0;
    }
  
  int rv = 0;

  rv = DialogBox (h, MAKEINTRESOURCE (IDD_DESKTOP), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);
}
