;;; select.el --- Lisp interface to windows selections.

;; Copyright (C) 1998 Andy Piper.
;; Copyright (C) 1990, 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995 Sun Microsystems.

;; Maintainer: XEmacs Development Team
;; Keywords: extensions, dumped

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
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Not in FSF

;;; Commentary:

;; This file is dumped with XEmacs 

;;; Code:

(defun copy-primary-selection ()
  "Copy the selection to the Clipboard and the kill ring."
  (interactive)
  (and (console-on-window-system-p)
       (cut-copy-clear-internal 'copy)))
(define-obsolete-function-alias
  'x-copy-primary-selection
  'copy-primary-selection)

(defun kill-primary-selection ()
  "Copy the selection to the Clipboard and the kill ring, then delete it."
  (interactive "*")
  (and (console-on-window-system-p)
       (cut-copy-clear-internal 'cut)))
(define-obsolete-function-alias
  'x-kill-primary-selection
  'kill-primary-selection)

(defun delete-primary-selection ()
  "Delete the selection without copying it to the Clipboard or the kill ring."
  (interactive "*")
  (and (console-on-window-system-p)
       (cut-copy-clear-internal 'clear)))
(define-obsolete-function-alias
  'x-delete-primary-selection
  'delete-primary-selection)

(defun yank-clipboard-selection ()
  "Insert the current Clipboard selection at point."
  (interactive "*")
  (case (device-type (selected-device))
    (x (x-yank-clipboard-selection))
    (mswindows (mswindows-paste-clipboard))
    (otherwise nil)))

(defun selection-owner-p (&optional selection)
  "Return t if current emacs process owns the given Selection.
The arg should be the name of the selection in question, typically one
of the symbols PRIMARY, SECONDARY, or CLIPBOARD.  (For convenience,
the symbol nil is the same as PRIMARY, and t is the same as
SECONDARY.)"
  (interactive)
  (case (device-type (selected-device))
    (x (x-selection-owner-p selection))
    (mswindows (mswindows-selection-owner-p selection))
    (otherwise nil)))

(defun selection-exists-p (&optional selection)
  "Whether there is an owner for the given Selection.  
The arg should be the name of the selection in question, typically one
of the symbols PRIMARY, SECONDARY, or CLIPBOARD.  (For convenience,
the symbol nil is the same as PRIMARY, and t is the same as
SECONDARY."
  (interactive)
  (case (device-type (selected-device))
    (x (x-selection-exists-p selection))
    (mswindows (mswindows-selection-exists-p))
    (otherwise nil)))

(defun own-selection (data &optional type)
  "Make an Windows selection of type TYPE and value DATA.
The argument TYPE (default `PRIMARY') says which selection,
and DATA specifies the contents.  DATA may be a string,
a symbol, an integer (or a cons of two integers or list of two integers).

The selection may also be a cons of two markers pointing to the same buffer,
or an overlay.  In these cases, the selection is considered to be the text
between the markers *at whatever time the selection is examined*.
Thus, editing done in the buffer after you specify the selection
can alter the effective value of the selection.

The data may also be a vector of valid non-vector selection values.

Interactively, the text of the region is used as the selection value."
  (interactive (if (not current-prefix-arg)
		   (list (read-string "Store text for pasting: "))
		 (list (substring (region-beginning) (region-end)))))
  (case (device-type (selected-device))
    (x (x-own-selection data type))
    (mswindows (mswindows-own-selection data type))
    (otherwise nil)))

(defun own-clipboard (string)
  "Paste the given string to the Clipboard."
  (case (device-type (selected-device))
    (x (x-own-clipboard string))
    (mswindows (mswindows-own-clipboard string))
    (otherwise nil)))

(defun disown-selection (&optional secondary-p)
  "Assuming we own the selection, disown it.  With an argument, discard the
secondary selection instead of the primary selection."
  (case (device-type (selected-device))
    (x (x-disown-selection secondary-p))
    (mswindows (mswindows-disown-selection secondary-p))
    (otherwise nil)))


;; from x-init.el
;; selections and active regions

;; If and only if zmacs-regions is true:

;; When a mark is pushed and the region goes into the "active" state, we
;; assert it as the Primary selection.  This causes it to be hilighted.
;; When the region goes into the "inactive" state, we disown the Primary
;; selection, causing the region to be dehilighted.

;; Note that it is possible for the region to be in the "active" state
;; and not be hilighted, if it is in the active state and then some other
;; application asserts the selection.  This is probably not a big deal.

(defun activate-region-as-selection ()
  (if (marker-buffer (mark-marker t))
      (own-selection (cons (point-marker t) (mark-marker t)))))

; moved from x-select.el
(defvar primary-selection-extent nil
  "The extent of the primary selection; don't use this.")

(defvar secondary-selection-extent nil
  "The extent of the secondary selection; don't use this.")

(defun select-make-extent-for-selection (selection previous-extent)
  ;; Given a selection, this makes an extent in the buffer which holds that
  ;; selection, for highlighting purposes.  If the selection isn't associated
  ;; with a buffer, this does nothing.
  (let ((buffer nil)
	(valid (and (extentp previous-extent)
		    (extent-object previous-extent)
		    (buffer-live-p (extent-object previous-extent))))
	start end)
    (cond ((stringp selection)
	   ;; if we're selecting a string, lose the previous extent used
	   ;; to highlight the selection.
	   (setq valid nil))
	  ((consp selection)
	   (setq start (min (car selection) (cdr selection))
		 end (max (car selection) (cdr selection))
		 valid (and valid
			    (eq (marker-buffer (car selection))
				(extent-object previous-extent)))
		 buffer (marker-buffer (car selection))))
	  ((extentp selection)
	   (setq start (extent-start-position selection)
		 end (extent-end-position selection)
		 valid (and valid
			    (eq (extent-object selection)
				(extent-object previous-extent)))
		 buffer (extent-object selection)))
	  (t
	   (signal 'error (list "invalid selection" selection))))

    (if valid
	nil
      (condition-case ()
	  (if (listp previous-extent)
	      (mapcar 'delete-extent previous-extent)
	    (delete-extent previous-extent))
	(error nil)))

    (if (not buffer)
	;; string case
	nil
      ;; normal case
      (if valid
	  (set-extent-endpoints previous-extent start end)
	(setq previous-extent (make-extent start end buffer))

	;; Make the extent be closed on the right, which means that if
	;; characters are inserted exactly at the end of the extent, the
	;; extent will grow to cover them.  This is important for shell
	;; buffers - suppose one makes a selection, and one end is at
	;; point-max.  If the shell produces output, that marker will remain
	;; at point-max (its position will increase).  So it's important that
	;; the extent exhibit the same behavior, lest the region covered by
	;; the extent (the visual indication), and the region between point
	;; and mark (the actual selection value) become different!
	(set-extent-property previous-extent 'end-open nil)

	(cond
	 (mouse-track-rectangle-p
	  (setq previous-extent (list previous-extent))
	  (default-mouse-track-next-move-rect start end previous-extent)
	  ))
	previous-extent))))
(define-obsolete-function-alias
  'x-select-make-extent-for-selection
  'select-make-extent-for-selection)

;; moved from x-select.el
(defun valid-simple-selection-p (data)
  (or (stringp data)
      ;FSFmacs huh?? (symbolp data)
      (integerp data)
      (and (consp data)
	   (integerp (car data))
	   (or (integerp (cdr data))
	       (and (consp (cdr data))
		    (integerp (car (cdr data))))))
      (extentp data)
      (and (consp data)
	   (markerp (car data))
	   (markerp (cdr data))
	   (marker-buffer (car data))
	   (marker-buffer (cdr data))
	   (eq (marker-buffer (car data))
	       (marker-buffer (cdr data)))
	   (buffer-live-p (marker-buffer (car data)))
	   (buffer-live-p (marker-buffer (cdr data))))))
(define-obsolete-function-alias
  'x-valid-simple-selection-p
  'valid-simple-selection-p)

(defun cut-copy-clear-internal (mode)
  (or (memq mode '(cut copy clear)) (error "unkown mode %S" mode))
  (or (selection-owner-p)
      (error "emacs does not own the primary selection"))
  (setq last-command nil)
  (or primary-selection-extent
      (error "the primary selection is not an extent?"))
  (save-excursion
    (let (rect-p b s e)
      (cond
       ((consp primary-selection-extent)
	(setq rect-p t
	      b (extent-object (car primary-selection-extent))
	      s (extent-start-position (car primary-selection-extent))
	      e (extent-end-position (car (reverse primary-selection-extent)))))
       (t
	(setq rect-p nil
	      b (extent-object primary-selection-extent)
	      s (extent-start-position primary-selection-extent)
	      e (extent-end-position primary-selection-extent))))
      (set-buffer b)
      (cond ((memq mode '(cut copy))
	     (if rect-p
		 (progn
		   ;; why is killed-rectangle free?  Is it used somewhere?
		   ;; should it be defvarred?
		   (setq killed-rectangle (extract-rectangle s e))
		   (kill-new (mapconcat #'identity killed-rectangle "\n")))
	       (copy-region-as-kill s e))
	     ;; Maybe killing doesn't own clipboard.  Make sure it happens.
	     ;; This memq is kind of grody, because they might have done it
	     ;; some other way, but owning the clipboard twice in that case
	     ;; wouldn't actually hurt anything.
	     (or (and (consp kill-hooks) (memq 'own-clipboard kill-hooks))
		 (own-clipboard (car kill-ring)))))
      (cond ((memq mode '(cut clear))
	     (if rect-p
		 (delete-rectangle s e)
	       (delete-region s e))))
      (disown-selection nil)
      )))
(define-obsolete-function-alias
  'x-cut-copy-clear-internal
  'cut-copy-clear-internal)

;;; select.el ends here
