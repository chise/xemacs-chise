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

/* The purpose of this file is to manage the dialog box that lets the
   user choose the source of the install - from the net, from the
   current directory, or to just download files. */

#include "win32.h"
#include <stdio.h>
#include "dialog.h"
#include "resource.h"
#include "state.h"
#include "msg.h"
#include "log.h"

static int rb[] = { IDC_SOURCE_DOWNLOAD, IDC_SOURCE_NETINST, IDC_SOURCE_CWD, 0 };

static void
check_if_enable_next (HWND h)
{
  EnableWindow (GetDlgItem (h, IDOK), source ? 1 : 0);
}

static void
load_dialog (HWND h)
{
  rbset (h, rb, source);
  check_if_enable_next (h);
}

static void
save_dialog (HWND h)
{
  source = rbget (h, rb);
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDC_SOURCE_DOWNLOAD:
    case IDC_SOURCE_NETINST:
    case IDC_SOURCE_CWD:
      save_dialog (h);
      check_if_enable_next (h);
      break;

    case IDOK:
      save_dialog (h);
      NEXT (IDD_LOCAL_DIR);
      break;

    case IDC_BACK:
      save_dialog (h);
      NEXT (0);
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
do_source (HINSTANCE h)
{
  int rv = 0;
  rv = DialogBox (h, MAKEINTRESOURCE (IDD_SOURCE), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);

  log (0, "source: %s",
       (source == IDC_SOURCE_DOWNLOAD) ? "download" :
       (source == IDC_SOURCE_NETINST) ? "network install" : "from cwd");
}

