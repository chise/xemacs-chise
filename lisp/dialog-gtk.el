;;; dialog-gtk.el --- Dialog-box support for XEmacs w/GTK primitives

;; Copyright (C) 2000 Free Software Foundation, Inc.

;; Maintainer: William M. Perry <wmperry@gnu.org>
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

(require 'cl)
(require 'gtk-password-dialog)
(require 'gtk-file-dialog)

(defun popup-builtin-open-dialog (keys)
  ;; Allowed keywords are:
  ;;
  ;;  :initial-filename fname
  ;;  :initial-directory dir
  ;;  :filter-list (filter-desc filter ...)
  ;;  :directory t/nil
  ;;  :title string
  ;;  :allow-multi-select t/nil
  ;;  :create-prompt-on-nonexistent t/nil
  ;;  :overwrite-prompt t/nil
  ;;  :file-must-exist t/nil
  ;;  :no-network-button t/nil
  ;;  :no-read-only-return t/nil
  (let ((initial-filename (plist-get keys :initial-filename))
	(clicked-ok nil)
	(filename nil)
	(widget nil))
    (setq widget (gtk-file-dialog-new
 		  :directory (plist-get keys :directory)
		  :callback `(lambda (f)
			       (setq clicked-ok t
				     filename f))
		  :initial-directory (or (plist-get keys :initial-directory nil)
					 (if initial-filename
					     (file-name-directory initial-filename)
					   default-directory))
		  :filter-list (plist-to-alist
				(plist-get keys :filter-list nil))
		  :file-must-exist (plist-get keys :file-must-exist nil)))

    (gtk-signal-connect widget 'destroy (lambda (obj data) (gtk-main-quit)))

    (gtk-window-set-transient-for widget (frame-property nil 'shell-widget))
    (gtk-widget-show-all widget)
    (gtk-main)
    (if (not clicked-ok)
	(signal 'quit nil))))

(defalias 'popup-builtin-save-as-dialog 'popup-builtin-open-dialog)

(defun popup-builtin-color-dialog (keys)
  ;; Allowed keys:
  ;;   :initial-color COLOR
  (let ((initial-color (or (plist-get keys :initial-color) "white"))
	(title (or (plist-get keys :title "Select color...")))
	(dialog nil)
	(clicked-ok nil)
	(color nil))
    (setq dialog (gtk-color-selection-dialog-new title))
    (gtk-signal-connect
     (gtk-color-selection-dialog-ok-button dialog) 'clicked
     (lambda (button colorsel)
       (gtk-widget-hide-all dialog)
       (setq color (gtk-color-selection-get-color colorsel)
	     clicked-ok t)
       (gtk-main-quit))
     (gtk-color-selection-dialog-colorsel dialog))

    (gtk-signal-connect
     (gtk-color-selection-dialog-cancel-button dialog) 'clicked
     (lambda (&rest ignored)
       (gtk-main-quit)))

    (put dialog 'modal t)
    (put dialog 'type 'dialog)
    (gtk-window-set-transient-for dialog (frame-property nil 'shell-widget))

    (unwind-protect
	(progn
	  (gtk-widget-show-now dialog)
	  (gtk-main))
      '(gtk-widget-destroy dialog))
    (if (not clicked-ok)
	(signal 'quit nil))
    ;; Need to convert from (R G B A) to #rrggbb
    (format "#%02x%02x%02x"
	    (* 256 (nth 0 color))
	    (* 256 (nth 1 color))
	    (* 256 (nth 2 color)))))

(defun popup-builtin-password-dialog (keys)
  ;; Format is (default callback :keyword value)
  ;; Allowed keywords are:
  ;;
  ;;  :title string
  :;  :prompt string
  ;;  :default string
  ;;  :verify boolean
  ;;  :verify-prompt string
  (let* ((default (plist-get keys :default))
	 (dialog nil)
	 (clicked-ok nil)
	 (passwd nil)
	 (info nil)
	 (generic-cb (lambda (x)
		       (setq clicked-ok t
			     passwd x))))

    ;; Convert the descriptor to keywords and create the dialog
    (setq info (copy-list keys)
	  info (plist-put info :callback generic-cb)
	  info (plist-put info :default default)
	  dialog (apply 'gtk-password-dialog-new info))

    ;; Clicking any button or closing the box exits the main loop.
    (gtk-signal-connect (gtk-password-dialog-ok-button dialog)
			'clicked
			(lambda (&rest ignored)
			  (gtk-main-quit)))

    (gtk-signal-connect (gtk-password-dialog-cancel-button dialog)
			'clicked
			(lambda (&rest ignored)
			  (gtk-main-quit)))

    (gtk-signal-connect dialog
			'delete-event
			(lambda (&rest ignored)
			  (gtk-main-quit)))

    (gtk-widget-grab-focus (gtk-password-dialog-entry-widget dialog))

    ;; Make us modal...
    (put dialog 'modal t)
    (gtk-window-set-transient-for dialog (frame-property nil 'shell-widget))

    ;; Realize the damn thing & wait for some action...
    (gtk-widget-show-all dialog)
    (gtk-main)

    (if (not clicked-ok)
	(signal 'quit nil))

    (gtk-widget-destroy dialog)
    passwd))

(defun popup-builtin-question-dialog (keys)
  ;; Allowed keywords:
  ;;   :question STRING
  ;;   :buttons  BUTTONDESC
  (let ((title (or (plist-get keys :title) "Question"))
	(buttons-descr (plist-get keys :buttons))
	(question (or (plist-get keys :question) "Question goes here..."))
	(dialog nil)			; GtkDialog
	(buttons nil)			; List of GtkButton objects
	(activep t)
	(flushrightp nil)
	(errp t))
    (if (not buttons-descr)
	(error 'syntax-error
	       "Dialog descriptor must supply at least one button"))

    ;; Do the basics - create the dialog, set the window title, and
    ;; add the label asking the question.
    (unwind-protect
	(progn
	  (setq dialog (gtk-dialog-new))
	  (gtk-window-set-title dialog title)
	  (gtk-container-set-border-width dialog 3)
	  (gtk-box-set-spacing (gtk-dialog-vbox dialog) 5)
	  (gtk-container-add (gtk-dialog-vbox dialog) (gtk-label-new question))

	  ;; Create the buttons.
	  (mapc (lambda (button)
		  ;; Handle flushright buttons
		  (if (null button)
		      (setq flushrightp t)

		    ;; More sanity checking first of all.
		    (if (not (vectorp button))
			(error "Button descriptor is not a vector: %S" button))

		    (if (< (length button) 3)
			(error "Button descriptor is too small: %S" button))

		    (push (gtk-button-new-with-label (aref button 0)) buttons)

		    ;; Need to detect what flavor of descriptor it is.
		    (if (not (keywordp (aref button 2)))
			;; Simple style... just [ name callback activep ]
			;; We ignore the 'suffix' entry, because that is what
			;; the X code does.
			(setq activep (aref button 2))
		      (let ((ctr 2)
			    (len (length button)))
			(if (logand len 1)
			    (error
			     "Button descriptor has an odd number of keywords and values: %S"
			     button))
			(while (< ctr len)
			  (if (eq (aref button ctr) :active)
			      (setq activep (aref button (1+ ctr))
				    ctr len))
			  (setq ctr (+ ctr 2)))))
		    (gtk-widget-set-sensitive (car buttons) (eval activep))
		    
		    ;; Apply the callback
		    (gtk-signal-connect
		     (car buttons) 'clicked
		     (lambda (button data)
		       (push (make-event 'misc-user
					 (list 'object (car data)
					       'function
					       (if (symbolp (car data))
						   'call-interactively
						 'eval)))
			     unread-command-events)
		       (gtk-main-quit)
		       t)
		     (cons (aref button 1) dialog))

		    (gtk-widget-show (car buttons))
		    (funcall (if flushrightp 'gtk-box-pack-end 'gtk-box-pack-start)
			     (gtk-dialog-action-area dialog) (car buttons)
			     nil t 2)))
		buttons-descr)

	  ;; Make sure they can't close it with the window manager
	  (gtk-signal-connect dialog 'delete-event (lambda (&rest ignored) t))
	  (gtk-window-set-transient-for dialog (frame-property nil 'shell-widget))
	  (put dialog 'type 'dialog)
	  (put dialog 'modal t)
	  (gtk-widget-show-all dialog)
	  (gtk-main)
	  (gtk-widget-destroy dialog)
	  (setq errp nil))
      (if (not errp)
	  ;; Nothing, we successfully showed the dialog
	  nil
	;; We need to destroy all the widgets, just in case.
	(mapc 'gtk-widget-destroy buttons)
	(gtk-widget-destroy dialog)))))

(defun gtk-make-dialog-box-internal (type keys)
  (case type
    (file
     (popup-builtin-open-dialog keys))
    (password
     (popup-builtin-password-dialog keys))
    (question
     (popup-builtin-question-dialog keys))
    (color
     (popup-builtin-color-dialog keys))
    (find
     )
    (font
     )
    (replace
     )
    (mswindows-message
     ;; This should really be renamed!
     )
    (print
     )
    (page-setup
     )
    (print-setup
     )
    (default
      (error "Unknown type of dialog: %S" type))))

(provide 'dialog-gtk)
