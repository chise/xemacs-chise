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

;; Dialog boxes are non-modal at the C level, but made modal at the
;; Lisp level via hacks in functions such as yes-or-no-p-dialog-box
;; below.  Perhaps there should be truly modal dialog boxes
;; implemented at the C level for safety.  All code using dialog boxes
;; should be careful to assume that the environment, for example the
;; current buffer, might be completely different after returning from
;; yes-or-no-p-dialog-box, but such code is difficult to write and test.

;;; Code:
(defun yes-or-no-p-dialog-box (prompt)
  "Ask user a yes-or-no question with a popup dialog box.
Return t if the answer is \"yes\".
Takes one argument, which is the string to display to ask the question."
  (save-selected-frame
    (popup-dialog-box
     (list prompt ["Yes" yes t] ["No" no t] nil ["Cancel" cancel t]))
    (let (event)
      (catch 'ynp-done
	(while t
	  (setq event (next-command-event event))
	  (when (misc-user-event-p event)
	    (message "%s" (event-object event))
	    (case (event-object event)
	      ((yes) (throw 'ynp-done t))
	      ((no)  (throw 'ynp-done nil))
	      ((cancel menu-no-selection-hook) (signal 'quit nil))))
	  (unless (button-release-event-p event) ; don't beep twice
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

(when (fboundp 'popup-dialog-box)
  (fset 'yes-or-no-p 'yes-or-no-p-maybe-dialog-box)
  (fset 'y-or-n-p 'y-or-n-p-maybe-dialog-box))

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
	  (get-dialog-box-response nil (list str (cons "%_OK" t)))
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

(defun make-dialog-box (&optional spec props parent)
  "Create a frame suitable for use as a general dialog box.
The frame is made a child of PARENT (defaults to the selected frame),
and has additional properties PROPS, as well as `dialog-frame-plist'.
SPEC is a string or glyph to be placed in the gutter. If INVISIBLE is
non-nil then the frame is initially unmapped.
Normally the created frame has no modelines, menubars, scrollbars,
minibuffer or toolbars and is entirely covered by its gutter."
  (or parent (setq parent (selected-frame)))
  (let* ((ftop (frame-property parent 'top))
	 (fleft (frame-property parent 'left))
	 (fwidth (frame-pixel-width parent))
	 (fheight (frame-pixel-height parent))
	 (fonth (font-height (face-font 'default)))
	 (fontw (font-width (face-font 'default)))
	 (props (append props dialog-frame-plist))
	 (dfheight (plist-get props 'height))
	 (dfwidth (plist-get props 'width))
	 (unmapped (plist-get props 'initially-unmapped))
	 (gutter-spec spec)
	 (name (or (plist-get props 'name) "XEmacs"))
	 (frame nil))
    (plist-remprop props 'initially-unmapped)
    ;; allow the user to just provide a glyph
    (when (glyphp spec)
      (setq gutter-spec (copy-sequence "\n"))
      (set-extent-begin-glyph (make-extent 0 1 gutter-spec) spec))
    ;; under FVWM at least, if I don't specify the initial position,
    ;; it ends up always at (0, 0).  xwininfo doesn't tell me
    ;; that there are any program-specified position hints, so
    ;; it must be an FVWM bug.  So just be smashing and position
    ;; in the center of the selected frame.
    (setq frame (make-frame
		 (append props
			 `(popup ,parent initially-unmapped t
				 menubar-visible-p nil
				 has-modeline-p nil
				 default-toolbar-visible-p nil
				 top-gutter-visible-p t
				 top-gutter-height ,(* dfheight fonth)
				 top-gutter ,gutter-spec
				 minibuffer none
				 name ,name
				 modeline-shadow-thickness 0
				 vertical-scrollbar-visible-p nil
				 horizontal-scrollbar-visible-p nil
				 unsplittable t
				 left ,(+ fleft (- (/ fwidth 2)
						   (/ (* dfwidth fontw)
						      2)))
				 top ,(+ ftop (- (/ fheight 2)
						 (/ (* dfheight fonth)
						    2)))))))
    (set-face-foreground 'modeline [default foreground] frame)
    (set-face-background 'modeline [default background] frame)
    (unless unmapped (make-frame-visible frame))
    frame))


;;; dialog.el ends here
