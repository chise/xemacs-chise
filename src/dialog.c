/* Implements elisp-programmable dialog boxes -- generic.
   Copyright (C) 1993, 1994 Free Software Foundation, Inc.
   Copyright (C) 1995 Tinker Systems and INS Engineering Corp.

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

#include <config.h>
#include "lisp.h"
#include "frame.h"
#include "device.h"

DEFUN ("popup-dialog-box", Fpopup_dialog_box, 1, 1, 0, /*
Pop up a dialog box.
A dialog box description is a list.

The first element of a dialog box must be a string, which is the title or
question.

The rest of the elements are descriptions of the dialog box's buttons.
Each of these is a vector, the syntax of which is essentially the same as
that of popup menu items.  They may have any of the following forms:

 [ "name" callback <active-p> ]
 [ "name" callback <active-p> "suffix" ]
 [ "name" callback :<keyword> <value>  :<keyword> <value> ... ]

The name is the string to display on the button; it is filtered through the
resource database, so it is possible for resources to override what string
is actually displayed.

Accelerators can be indicated in the string by putting the sequence
"%_" before the character corresponding to the key that will invoke
the button.  Uppercase and lowercase accelerators are equivalent.  The
sequence "%%" is also special, and is translated into a single %.

If the `callback' of a button is a symbol, then it must name a command.
It will be invoked with `call-interactively'.  If it is a list, then it is
evaluated with `eval'.

One (and only one) of the buttons may be `nil'.  This marker means that all
following buttons should be flushright instead of flushleft.

Though the keyword/value syntax is supported for dialog boxes just as in
popup menus, the only keyword which is both meaningful and fully implemented
for dialog box buttons is `:active'.  */
     (dbox_desc))
{
  struct frame *f = selected_frame ();
  struct device *d = XDEVICE (f->device);

  if (!HAS_DEVMETH_P (d, popup_dialog_box))
    signal_simple_error ("Device does not support dialogs", f->device);

  if (SYMBOLP (dbox_desc))
    dbox_desc = Fsymbol_value (dbox_desc);
  CHECK_CONS (dbox_desc);
  CHECK_STRING (XCAR (dbox_desc));
  if (!CONSP (XCDR (dbox_desc)))
    signal_simple_error ("Dialog descriptor must supply at least one button",
			 dbox_desc);

  DEVMETH (d, popup_dialog_box, (f, dbox_desc));

  return Qnil;
}

void
syms_of_dialog (void)
{
  DEFSUBR (Fpopup_dialog_box);
}

void
vars_of_dialog (void)
{
  Fprovide (intern ("dialog"));
}
