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

/* Manipulate the registry for XEmacs. */

#include "win32.h"

#include <stdio.h>
#if defined(CYGWIN) || defined(MINGW)
#include <cygwin/version.h>
#include <sys/mount.h>
#endif

#include "reginfo.h"
#include "regedit.h"
#include "msg.h"
#include "resource.h"
#include "dialog.h"

static char *
find_cygwin_mount (HKEY rkey, int *istext)
{
  char buf[1000];
  char *retval = 0;
  HKEY key;
  DWORD retvallen = 0;
  DWORD flags = 0;
  DWORD type;

#if defined(CYGWIN) || defined(MINGW)
  sprintf (buf, "Software\\%s\\%s\\%s\\/",
	   CYGWIN_INFO_CYGNUS_REGISTRY_NAME,
	   CYGWIN_INFO_CYGWIN_REGISTRY_NAME,
	   CYGWIN_INFO_CYGWIN_MOUNT_REGISTRY_NAME);

  if (RegOpenKeyEx (rkey, buf, 0, KEY_READ, &key) != ERROR_SUCCESS)
    return 0;

  if (RegQueryValueEx (key, "native", 0, &type, 0, &retvallen)
      == ERROR_SUCCESS)
    {
      retval = new char[retvallen+1];
      if (RegQueryValueEx (key, "native", 0, &type, (BYTE *)retval, &retvallen)
	  != ERROR_SUCCESS)
	{
	  delete retval;
	  retval = 0;
	}
    }

  retvallen = sizeof (flags);
  RegQueryValueEx (key, "flags", 0, &type, (BYTE *)&flags, &retvallen);

  RegCloseKey (key);

  if (retval)
    *istext = (flags & MOUNT_BINARY) ? 0 : 1;
  return retval;
#else
  return 0;
#endif
}

static char *
find_xemacs_root (HKEY rkey, int* isnative)
{
  char buf[1000];
  char *retval = 0;
  HKEY key;
  DWORD retvallen = 0;
  DWORD type;
  DWORD itype;

  sprintf (buf, "Software\\%s\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME,
	   XEMACS_INFO_XEMACS_REGISTRY_NAME);

  if (RegOpenKeyEx (rkey, buf, 0, KEY_READ, &key) != ERROR_SUCCESS)
    return 0;

  if (RegQueryValueEx (key, XEMACS_INFO_XEMACS_ROOT_KEY,
		       0, &type, 0, &retvallen) == ERROR_SUCCESS)
    {
      retval = new char[retvallen+1];
      if (RegQueryValueEx (key, XEMACS_INFO_XEMACS_ROOT_KEY,
			   0, &type, (BYTE *)retval, &retvallen) 
	  != ERROR_SUCCESS)
	{
	  delete retval;
	  retval = 0;
	}
    }

  retvallen = sizeof (itype);
  RegQueryValueEx (key, XEMACS_INFO_XEMACS_ROOT_TYPE, 
		   0, &type, (BYTE *)&itype, &retvallen);

  if (itype == 1)
    *isnative = 1;
  else
    *isnative = 0;

  RegCloseKey (key);

  return retval;
}

char *
find_root_location (int *issystem, int *isnative)
{
  char *rv;
  if ((rv = find_xemacs_root (HKEY_CURRENT_USER, isnative)))
    {
      *issystem = 0;
      return rv;
    }
  else if ((rv = find_xemacs_root (HKEY_LOCAL_MACHINE, isnative)))
    {
      *issystem = 1;
      return rv;
    }
  return 0;
}

char *
find_cygwin_root (int *issystem)
{
  char *rv;
  int istext;
  if ((rv = find_cygwin_mount (HKEY_CURRENT_USER, &istext)))
    {
      *issystem = 0;
      return rv;
    }
  else if ((rv = find_cygwin_mount (HKEY_LOCAL_MACHINE, &istext)))
    {
      *issystem = 1;
      return rv;
    }
  return 0;
}

void
create_xemacs_root (char *path, int issystem, int isnative)
{
  char buf[1000];
  HKEY key;
  DWORD disposition;
  DWORD itype = isnative ? 1 : 0;

  remove_xemacs_root ();

  sprintf (buf, "Software\\%s\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME,
	   XEMACS_INFO_XEMACS_REGISTRY_NAME);

  HKEY kr = issystem ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER;
  if (RegCreateKeyEx (kr, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("create_xemacs_root");

  RegSetValueEx (key, XEMACS_INFO_XEMACS_ROOT_KEY, 
		 0, REG_SZ, (BYTE *)path, strlen (path)+1);
  RegSetValueEx (key, XEMACS_INFO_XEMACS_ROOT_TYPE, 
		 0, REG_DWORD, (BYTE *)&itype, sizeof (itype));
  // write out the package path
  sprintf (buf, "~\\.xemacs;%s\\site-packages;%s\\xemacs-packages",
	   path, path);
  RegSetValueEx (key, XEMACS_INFO_XEMACS_PACKAGE_KEY, 
		 0, REG_SZ, (BYTE *)buf, strlen (buf)+1);
}

void
set_app_path (char *exe, char* path, int issystem)
{
  char buf[1000];
  HKEY key;
  DWORD disposition;

  sprintf (buf, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\%s",
	   exe);

  HKEY kr = issystem ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER;
  RegDeleteKey (kr, buf);
  
  if (RegCreateKeyEx (kr, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("set_app_path");

  RegSetValueEx (key, "Path", 
		 0, REG_SZ, (BYTE *)path, strlen (path)+1);
}

static void
remove1 (HKEY rkey)
{
  char buf[1000];

  sprintf (buf, "Software\\%s\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME,
	   XEMACS_INFO_XEMACS_REGISTRY_NAME);

  RegDeleteKey (rkey, buf);
}

void
remove_xemacs_root ()
{
  remove1 (HKEY_LOCAL_MACHINE);
  remove1 (HKEY_CURRENT_USER);
}

