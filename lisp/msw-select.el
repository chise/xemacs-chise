;;; msw-select.el --- Lisp interface to mswindows selections.

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

;; This file is dumped with XEmacs (when mswindows support is compiled in).
;; #### Only copes with copying/pasting text

;;; Code:

(defun mswindows-paste-clipboard ()
  "Insert the current contents of the mswindows clipboard at point,
replacing the active selection if there is one."
  (interactive "*")
  (setq last-command nil)
  (setq this-command 'yank) ; so that yank-pop works.
  (let ((clip (mswindows-get-clipboard)) (s (mark-marker)) (e (point-marker)))
    (or clip (error "there is no text on the clipboard"))
    (if s
	(if mouse-track-rectangle-p
	    (delete-rectangle s e)
	  (delete-region s e)))
    (push-mark)
    (if mouse-track-rectangle-p
	(insert-rectangle clip)
      (insert clip))))

(defun mswindows-own-clipboard (string)
  "Paste the given string to the mswindows clipboard."
  (mswindows-set-clipboard string))

(defvar mswindows-selection-owned-p nil
  "Whether we have a selection or not. 
MS-Windows has no concept of ownership; don't use this.")

(defun mswindows-own-selection (data &optional type)
  "Make an MS-Windows selection of type TYPE and value DATA.
The argument TYPE is ignored, and DATA specifies the contents.  
DATA may be a string,
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
  (or (valid-simple-selection-p data)
      (and (vectorp data)
	   (let ((valid t)
		 (i (1- (length data))))
	     (while (>= i 0)
	       (or (valid-simple-selection-p (aref data i))
		   (setq valid nil))
	       (setq i (1- i)))
	     valid))
      (signal 'error (list "invalid selection" data)))
  (if data
      (progn
;	(mswindows-set-clipboard data)
	(setq mswindows-selection-owned-p data))
    (setq mswindows-selection-owned-p nil))
  (setq primary-selection-extent
	(select-make-extent-for-selection
	 data primary-selection-extent))
  (setq zmacs-region-stays t)
  data)

(defun mswindows-disown-selection (&optional secondary-p)
  "Assuming we own the selection, disown it.  With an argument, discard the
secondary selection instead of the primary selection."
  (setq mswindows-selection-owned-p nil)
  (mswindows-delete-selection))

(defun mswindows-selection-owner-p (&optional selection)
  "Return t if current emacs process owns the given Selection.
The arg is ignored."
  (not (eq mswindows-selection-owned-p nil)))

