;;; dialog.el --- Dialog-box support for XEmacs

;; Copyright (C) 1991-4, 1997 Free Software Foundation, Inc.

;; Maintainer: XEmacs Development Team
;; Keywords: extensions, internal, dumped

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the 
;; Free Software Foundation, 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Not in FSF.

;;; Commentary:

;; This file is dumped with XEmacs (when dialog boxes are compiled in).

;;; Code:
(defun yes-or-no-p-dialog-box (prompt)
  "Ask user a \"y or n\" question with a popup dialog box.
Returns t if answer is \"yes\".
Takes one argument, which is the string to display to ask the question."
  (let ((echo-keystrokes 0)
	event)	 
    (popup-dialog-box
     ;; "Non-violent language please!" says Robin.
     (cons prompt '(["Yes" yes t] ["No" no t] nil ["Cancel" abort t])))
;     (cons prompt '(["Yes" yes t] ["No" no t] nil ["Abort" abort t])))
    (catch 'ynp-done
      (while t
	(setq event (next-command-event event))
	(cond ((and (misc-user-event-p event) (eq (event-object event) 'yes))
	       (throw 'ynp-done t))
	      ((and (misc-user-event-p event) (eq (event-object event) 'no))
	       (throw 'ynp-done nil))
	      ((and (misc-user-event-p event)
		    (or (eq (event-object event) 'abort)
			(eq (event-object event) 'menu-no-selection-hook)))
	       (signal 'quit nil))
	      ((button-release-event-p event) ;; don't beep twice
	       nil)
	      (t
	       (beep)
	       (message "please answer the dialog box")))))))

(defun yes-or-no-p-maybe-dialog-box (prompt)
  "Ask user a yes-or-no question.  Return t if answer is yes.
The question is asked with a dialog box or the minibuffer, as appropriate.
Takes one argument, which is the string to display to ask the question.
It should end in a space; `yes-or-no-p' adds `(yes or no) ' to it.
The user must confirm the answer with RET,
and can edit it until it as been confirmed."
  (if (should-use-dialog-box-p)
      (yes-or-no-p-dialog-box prompt)
    (yes-or-no-p-minibuf prompt)))

(defun y-or-n-p-maybe-dialog-box (prompt)
  "Ask user a \"y or n\" question.  Return t if answer is \"y\".
Takes one argument, which is the string to display to ask the question.
The question is asked with a dialog box or the minibuffer, as appropriate.
It should end in a space; `y-or-n-p' adds `(y or n) ' to it.
No confirmation of the answer is requested; a single character is enough.
Also accepts Space to mean yes, or Delete to mean no."
  (if (should-use-dialog-box-p)
      (yes-or-no-p-dialog-box prompt)
    (y-or-n-p-minibuf prompt)))

(if (fboundp 'popup-dialog-box)
    (progn
      (fset 'yes-or-no-p 'yes-or-no-p-maybe-dialog-box)
      (fset 'y-or-n-p 'y-or-n-p-maybe-dialog-box)))

;; this is call-compatible with the horribly-named FSF Emacs function
;; `x-popup-dialog'.  I refuse to use that name.
(defun get-dialog-box-response (position contents)
  ;; by Stig@hackvan.com
  ;; modified by pez@atlantic2.sbi.com
  "Pop up a dialog box and return user's selection.
POSITION specifies which frame to use.
This is normally an event or a window or frame.
If POSITION is t or nil, it means to use the frame the mouse is on.
The dialog box appears in the middle of the specified frame.

CONTENTS specifies the alternatives to display in the dialog box.
It is a list of the form (TITLE ITEM1 ITEM2...).
Each ITEM is a cons cell (STRING . VALUE).
The return value is VALUE from the chosen item.

An ITEM may also be just a string--that makes a nonselectable item.
An ITEM may also be nil--that means to put all preceding items
on the left of the dialog box and all following items on the right."
  (cond
   ((eventp position)
    (select-frame (event-frame position)))
   ((framep position)
    (select-frame position))
   ((windowp position)
    (select-window position)))
  (let ((dbox (cons (car contents)
		    (mapcar #'(lambda (x)
				(cond
				 ((null x)
				  nil)
				 ((stringp x)
				  `[,x 'ignore nil]) ;this will never get
						     ;selected
				 (t
				  `[,(car x) (throw 'result ',(cdr x)) t])))
			    (cdr contents))
		    )))
    (catch 'result
      (popup-dialog-box dbox)
      (dispatch-event (next-command-event)))))

(defun message-box (fmt &rest args)
  "Display a message, in a dialog box if possible.
If the selected device has no dialog-box support, use the echo area.
The arguments are the same as to `format'.

If the only argument is nil, clear any existing message; let the
minibuffer contents show."
  (if (and (null fmt) (null args))
      (progn
	(clear-message nil)
	nil)
    (let ((str (apply 'format fmt args)))
      (if (device-on-window-system-p)
	  (get-dialog-box-response nil (list str (cons "OK" t)))
	(display-message 'message str))
      str)))

(defun message-or-box (fmt &rest args)
  "Display a message in a dialog box or in the echo area.\n\
If this command was invoked with the mouse, use a dialog box.\n\
Otherwise, use the echo area.
The arguments are the same as to `format'.

If the only argument is nil, clear any existing message; let the
minibuffer contents show."
  (if (should-use-dialog-box-p)
      (apply 'message-box fmt args)
    (apply 'message fmt args)))

;;; dialog.el ends here
