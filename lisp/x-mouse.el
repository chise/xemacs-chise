;;; x-mouse.el --- Mouse support for X window system.

;; Copyright (C) 1985, 1992-4, 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995, 1996 Ben Wing.

;; Maintainer: XEmacs Development Team
;; Keywords: mouse, dumped

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

;;; Synched up with: Not synched.

;;; Commentary:

;; This file is dumped with XEmacs (when X support is compiled in).

;;; Code:

;;(define-key global-map 'button2 'x-set-point-and-insert-selection)
;; This is reserved for use by Hyperbole.
;;(define-key global-map '(shift button2) 'x-mouse-kill)
(define-key global-map '(control button2) 'x-set-point-and-move-selection)

(defun x-mouse-kill (event)
  "Kill the text between the point and mouse and copy it to the clipboard and
to the cut buffer"
  (interactive "@e")
  (let ((old-point (point)))
    (mouse-set-point event)
    (let ((s (buffer-substring old-point (point))))
      (x-own-clipboard s)
      (x-store-cutbuffer s))
    (kill-region old-point (point))))

(defun x-yank-function ()
  "Insert the current X selection or, if there is none, insert the X cutbuffer.
A mark is pushed, so that the inserted text lies between point and mark."
  (push-mark)
  (if (region-active-p)
      (if (consp zmacs-region-extent)
	  ;; pirated code from insert-rectangle in rect.el
	  ;; perhaps that code should be modified to handle a list of extents
	  ;; as the rectangle to be inserted?
	  (let ((lines zmacs-region-extent)
		(insertcolumn (current-column))
		(first t))
	    (push-mark)
	    (while lines
	      (or first
		  (progn
		    (forward-line 1)
		    (or (bolp) (insert ?\n))
		    (move-to-column insertcolumn t)))
	      (setq first nil)
	      (insert (extent-string (car lines)))
	      (setq lines (cdr lines))))
	(insert (extent-string zmacs-region-extent)))
    (x-insert-selection t)))

(defun x-insert-selection (&optional check-cutbuffer-p move-point-event)
  "Insert the current selection into buffer at point."
  (interactive "P")
  (let ((text (if check-cutbuffer-p
		  (or (condition-case () (x-get-selection) (error ()))
		      (x-get-cutbuffer)
		      (error "No selection or cut buffer available"))
		(x-get-selection))))
    (cond (move-point-event
	   (mouse-set-point move-point-event)
	   (push-mark (point)))
	  ((interactive-p)
	   (push-mark (point))))
    (insert text)
    ))

(make-obsolete 'x-set-point-and-insert-selection 'mouse-yank)
(defun x-set-point-and-insert-selection (event)
  "Set point where clicked and insert the primary selection or the cut buffer."
  (interactive "e")
  (let ((mouse-yank-at-point nil))
    (mouse-yank event)))

(defun x-set-point-and-move-selection (event)
  "Set point where clicked and move the selected text to that location."
  (interactive "e")
  ;; Don't try to move the selection if x-kill-primary-selection if going
  ;; to fail; just let the appropriate error message get issued. (We need
  ;; to insert the selection and set point first, or the selection may
  ;; get inserted at the wrong place.)
  (and (x-selection-owner-p)
       primary-selection-extent
       (x-insert-selection t event))
  (kill-primary-selection))

(defun mouse-track-and-copy-to-cutbuffer (event)
  "Make a selection like `mouse-track', but also copy it to the cutbuffer."
  (interactive "e")
  (mouse-track event)
  (cond
   ((null primary-selection-extent)
    nil)
   ((consp primary-selection-extent)
    (save-excursion
      (set-buffer (extent-object (car primary-selection-extent)))
      (x-store-cutbuffer
       (mapconcat
	'identity
	(extract-rectangle
	 (extent-start-position (car primary-selection-extent))
	 (extent-end-position (car (reverse primary-selection-extent))))
	"\n"))))
   (t
    (save-excursion
      (set-buffer (extent-object primary-selection-extent))
      (x-store-cutbuffer
       (buffer-substring (extent-start-position primary-selection-extent)
			 (extent-end-position primary-selection-extent)))))))


(defvar x-pointers-initialized nil)

(defun x-init-pointer-shape (device)
  "Initialize the mouse-pointers of DEVICE from the X resource database."
  (if x-pointers-initialized  ; only do it when the first device is created
      nil
    (set-glyph-image text-pointer-glyph
	  (or (x-get-resource "textPointer" "Cursor" 'string device)
	      "xterm"))
    (set-glyph-image selection-pointer-glyph
	  (or (x-get-resource "selectionPointer" "Cursor" 'string device)
	      "top_left_arrow"))
    (set-glyph-image nontext-pointer-glyph
	  (or (x-get-resource "spacePointer" "Cursor" 'string device)
	      "xterm")) ; was "crosshair"
    (set-glyph-image modeline-pointer-glyph
	  (or (x-get-resource "modeLinePointer" "Cursor" 'string device)
;;	      "fleur"))
	      "sb_v_double_arrow"))
    (set-glyph-image gc-pointer-glyph
	  (or (x-get-resource "gcPointer" "Cursor" 'string device)
	      "watch"))
    (when (featurep 'scrollbar)
      (set-glyph-image
       scrollbar-pointer-glyph
       (or (x-get-resource "scrollbarPointer" "Cursor" 'string device)
	   "top_left_arrow")))
    (set-glyph-image busy-pointer-glyph
	  (or (x-get-resource "busyPointer" "Cursor" 'string device)
	      "watch"))
    (set-glyph-image toolbar-pointer-glyph
	  (or (x-get-resource "toolBarPointer" "Cursor" 'string device)
	      "left_ptr"))
    (set-glyph-image divider-pointer-glyph
	  (or (x-get-resource "dividerPointer" "Cursor" 'string device)
	      "sb_h_double_arrow"))
    (let ((fg
	   (x-get-resource "pointerColor" "Foreground" 'string device)))
      (and fg
	   (set-face-foreground 'pointer fg)))
    (let ((bg
	   (x-get-resource "pointerBackground" "Background" 'string device)))
      (and bg
	   (set-face-background 'pointer bg)))
    (setq x-pointers-initialized t))
  nil)

;;; x-mouse.el ends here
