;;; x-select.el --- Lisp interface to X Selections.

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

;;; Synched up with: FSF 19.30 (select.el).

;;; Commentary:

;; This file is dumped with XEmacs (when X support is compiled in).

;; The selection code requires us to use certain symbols whose names are
;; all upper-case; this may seem tasteless, but it makes there be a 1:1
;; correspondence between these symbols and X Atoms (which are upcased).

;;; Code:

(defvar x-selected-text-type
  (if (featurep 'mule) '(COMPOUND_TEXT STRING) 'STRING)
  "The type atom used to obtain selections from the X server.
Can be either a valid X selection data type, or a list of such types.
COMPOUND_TEXT and STRING are the most commonly used data types.
If a list is provided, the types are tried in sequence until
there is a successful conversion.")

(defun x-get-selection (&optional type data-type)
  "Return the value of an X Windows selection.
The argument TYPE (default `PRIMARY') says which selection,
and the argument DATA-TYPE (default `STRING', or `COMPOUND_TEXT' under Mule)
says how to convert the data."
  (or type (setq type 'PRIMARY))
  (or data-type (setq data-type x-selected-text-type))
  (let ((text
	 (if (consp data-type)
	     (condition-case err
		 (x-get-selection-internal type (car data-type))
	       (selection-conversion-error
		(if (cdr data-type)
		    (x-get-selection type (cdr data-type))
		  (signal (car err) (cdr err)))))
	   (x-get-selection-internal type data-type))))
    (when (and (consp text) (symbolp (car text)))
      (setq text (cdr text)))
    (when (not (stringp text))
      (error "Selection is not a string: %S" text))
    text))

(defun x-get-secondary-selection ()
  "Return text selected from some X window."
  (x-get-selection 'SECONDARY))

(defun x-get-clipboard ()
  "Return text pasted to the clipboard."
  (x-get-selection 'CLIPBOARD))

;; FSFmacs calls this `x-set-selection', and reverses the
;; arguments (duh ...).  This order is more logical.
(defun x-own-selection (data &optional type)
  "Make an X Windows selection of type TYPE and value DATA.
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
  ;FSFmacs huh??  It says:
  ;; "This is for temporary compatibility with pre-release Emacs 19."
  ;(if (stringp type)
  ;    (setq type (intern type)))
  (or (x-valid-simple-selection-p data)
      (and (vectorp data)
	   (let ((valid t)
		 (i (1- (length data))))
	     (while (>= i 0)
	       (or (x-valid-simple-selection-p (aref data i))
		   (setq valid nil))
	       (setq i (1- i)))
	     valid))
      (signal 'error (list "invalid selection" data)))
  (or type (setq type 'PRIMARY))
  (if data
      (x-own-selection-internal type data)
    (x-disown-selection-internal type))
  (cond ((eq type 'PRIMARY)
	 (setq primary-selection-extent
	       (select-make-extent-for-selection
		data primary-selection-extent)))
	((eq type 'SECONDARY)
	 (setq secondary-selection-extent
	       (select-make-extent-for-selection
		data secondary-selection-extent))))
  (setq zmacs-region-stays t)
  data)

(defun x-valid-simple-selection-p (data)
  (valid-simple-selection-p data))

(defun x-own-secondary-selection (selection &optional type)
  "Make a secondary X Selection of the given argument.  The argument may be a
string or a cons of two markers (in which case the selection is considered to
be the text between those markers)."
  (interactive (if (not current-prefix-arg)
		   (list (read-string "Store text for pasting: "))
		 (list (cons ;; these need not be ordered.
			(copy-marker (point-marker))
			(copy-marker (mark-marker))))))
  (x-own-selection selection 'SECONDARY))


(defun x-own-clipboard (string)
  "Paste the given string to the X Clipboard."
  (x-own-selection string 'CLIPBOARD))


(defun x-disown-selection (&optional secondary-p)
  "Assuming we own the selection, disown it.  With an argument, discard the
secondary selection instead of the primary selection."
  (x-disown-selection-internal (if secondary-p 'SECONDARY 'PRIMARY)))

(defun x-dehilight-selection (selection)
  "for use as a value of `x-lost-selection-hooks'."
  (cond ((eq selection 'PRIMARY)
	 (if primary-selection-extent
	     (let ((inhibit-quit t))
	       (if (consp primary-selection-extent)
		   (mapcar 'delete-extent primary-selection-extent)
		 (delete-extent primary-selection-extent))
	       (setq primary-selection-extent nil)))
	 (if zmacs-regions (zmacs-deactivate-region)))
	((eq selection 'SECONDARY)
	 (if secondary-selection-extent
	     (let ((inhibit-quit t))
	       (if (consp secondary-selection-extent)
		   (mapcar 'delete-extent secondary-selection-extent)
		 (delete-extent secondary-selection-extent))
	       (setq secondary-selection-extent nil)))))
  nil)

(setq x-lost-selection-hooks 'x-dehilight-selection)

(defun x-notice-selection-requests (selection type successful)
  "for possible use as the value of x-sent-selection-hooks."
  (if (not successful)
      (message "Selection request failed to convert %s to %s"
	       selection type)
    (message "Sent selection %s as %s" selection type)))

(defun x-notice-selection-failures (selection type successful)
  "for possible use as the value of x-sent-selection-hooks."
  (or successful
      (message "Selection request failed to convert %s to %s"
	       selection type)))

;(setq x-sent-selection-hooks 'x-notice-selection-requests)
;(setq x-sent-selection-hooks 'x-notice-selection-failures)


;;; Selections in killed buffers
;;; this function is called by kill-buffer as if it were on the
;;; kill-buffer-hook (though it isn't really).

(defun xselect-kill-buffer-hook ()
  ;; Probably the right thing is to write a C function to return a list
  ;; of the selections which emacs owns, since it could conceivably own
  ;; a user-defined selection type that we've never heard of.
  (xselect-kill-buffer-hook-1 'PRIMARY)
  (xselect-kill-buffer-hook-1 'SECONDARY)
  (xselect-kill-buffer-hook-1 'CLIPBOARD))

(defun xselect-kill-buffer-hook-1 (selection)
  (let (value)
    (if (and (x-selection-owner-p selection)
	     (setq value (x-get-selection-internal selection '_EMACS_INTERNAL))
	     ;; The _EMACS_INTERNAL selection type has a converter registered
	     ;; for it that does no translation.  This only works if emacs is
	     ;; requesting the selection from itself.  We could have done this
	     ;; by writing a C function to return the raw selection data, and
	     ;; that might be the right way to do this, but this was easy.
	     (or (and (consp value)
		      (markerp (car value))
		      (eq (current-buffer) (marker-buffer (car value))))
		 (and (extent-live-p value)
		      (eq (current-buffer) (extent-object value)))
                 (and (extentp value) (not (extent-live-p value)))))
	(x-disown-selection-internal selection))))


;;; Cut Buffer support

;;; FSF name x-get-cut-buffer
(defun x-get-cutbuffer (&optional which-one)
  "Return the value of one of the 8 X server cut buffers.
Optional arg WHICH-ONE should be a number from 0 to 7, defaulting to 0.
Cut buffers are considered obsolete; you should use selections instead.
This function does nothing if support for cut buffers was not compiled
into Emacs."
  (and (fboundp 'x-get-cutbuffer-internal)
       (x-get-cutbuffer-internal
	(if which-one
	    (aref [CUT_BUFFER0 CUT_BUFFER1 CUT_BUFFER2 CUT_BUFFER3
			       CUT_BUFFER4 CUT_BUFFER5 CUT_BUFFER6 CUT_BUFFER7]
		  which-one)
	  'CUT_BUFFER0))))

;;; FSF name x-set-cut-buffer
(defun x-store-cutbuffer (string &optional push)
  "Store STRING into the X server's primary cut buffer.
If PUSH is non-nil, also rotate the cut buffers:
this means the previous value of the primary cut buffer moves the second
cut buffer, and the second to the third, and so on (there are 8 buffers.)
Cut buffers are considered obsolete; you should use selections instead.
This function does nothing if support for cut buffers was not compiled
into Emacs."
  (and (fboundp 'x-store-cutbuffer-internal)
       (progn
	 ;; Check the data type of STRING.
	 (substring string 0 0)
	 (if push
	     (x-rotate-cutbuffers-internal 1))
	 (x-store-cutbuffer-internal 'CUT_BUFFER0 string))))


;;; Random utility functions

(defun x-yank-clipboard-selection ()
  "Insert the current Clipboard selection at point."
  (interactive "*")
  (setq last-command nil)
  (setq this-command 'yank) ; so that yank-pop works.
  (let ((clip (x-get-clipboard)))
    (or clip (error "there is no clipboard selection"))
    (push-mark)
    (insert clip)))

;;; Functions to convert the selection into various other selection types.
;;; Every selection type that emacs handles is implemented this way, except
;;; for TIMESTAMP, which is a special case.

(defun xselect-convert-to-text (selection type value)
  (cond ((stringp value)
	 value)
	((extentp value)
	 (save-excursion
	   (set-buffer (extent-object value))
	   (save-restriction
	     (widen)
	     (buffer-substring (extent-start-position value)
			       (extent-end-position value)))))
	((and (consp value)
	      (markerp (car value))
	      (markerp (cdr value)))
	 (or (eq (marker-buffer (car value)) (marker-buffer (cdr value)))
	     (signal 'error
		     (list "markers must be in the same buffer"
			   (car value) (cdr value))))
	 (save-excursion
	   (set-buffer (or (marker-buffer (car value))
			   (error "selection is in a killed buffer")))
	   (save-restriction
	     (widen)
	     (buffer-substring (car value) (cdr value)))))
	(t nil)))

(defun xselect-convert-to-string (selection type value)
  (let ((outval (xselect-convert-to-text selection type value)))
    ;; force the string to be not in Compound Text format.
    (if (stringp outval)
	(cons 'STRING outval)
      outval)))

(defun xselect-convert-to-compound-text (selection type value)
  ;; converts to compound text automatically
  (xselect-convert-to-text selection type value))

(defun xselect-convert-to-length (selection type value)
  (let ((value
	 (cond ((stringp value)
		(length value))
	       ((extentp value)
		(extent-length value))
	       ((and (consp value)
		     (markerp (car value))
		     (markerp (cdr value)))
		(or (eq (marker-buffer (car value))
			(marker-buffer (cdr value)))
		    (signal 'error
			    (list "markers must be in the same buffer"
				  (car value) (cdr value))))
		(abs (- (car value) (cdr value)))))))
    (if value ; force it to be in 32-bit format.
	(cons (ash value -16) (logand value 65535))
      nil)))

(defun xselect-convert-to-targets (selection type value)
  ;; return a vector of atoms, but remove duplicates first.
  (let* ((all (cons 'TIMESTAMP (mapcar 'car selection-converter-alist)))
	 (rest all))
    (while rest
      (cond ((memq (car rest) (cdr rest))
	     (setcdr rest (delq (car rest) (cdr rest))))
	    ((eq (car (cdr rest)) '_EMACS_INTERNAL)  ; shh, it's a secret
	     (setcdr rest (cdr (cdr rest))))
	    (t
	     (setq rest (cdr rest)))))
    (apply 'vector all)))

(defun xselect-convert-to-delete (selection type value)
  (x-disown-selection-internal selection)
  ;; A return value of nil means that we do not know how to do this conversion,
  ;; and replies with an "error".  A return value of NULL means that we have
  ;; done the conversion (and any side-effects) but have no value to return.
  'NULL)

(defun xselect-convert-to-filename (selection type value)
  (cond ((extentp value)
	 (buffer-file-name (or (extent-object value)
			       (error "selection is in a killed buffer"))))
	((and (consp value)
	      (markerp (car value))
	      (markerp (cdr value)))
	 (buffer-file-name (or (marker-buffer (car value))
			       (error "selection is in a killed buffer"))))
	(t nil)))

(defun xselect-convert-to-charpos (selection type value)
  (let (a b tmp)
    (cond ((cond ((extentp value)
		  (setq a (extent-start-position value)
			b (extent-end-position value)))
		 ((and (consp value)
		       (markerp (car value))
		       (markerp (cdr value)))
		  (setq a (car value)
			b (cdr value))))
	   (setq a (1- a) b (1- b)) ; zero-based
	   (if (< b a) (setq tmp a a b b tmp))
	   (cons 'SPAN
		 (vector (cons (ash a -16) (logand a 65535))
			 (cons (ash b -16) (logand b 65535))))))))

(defun xselect-convert-to-lineno (selection type value)
  (let (a b buf tmp)
    (cond ((cond ((extentp value)
		  (setq buf (extent-object value)
			a (extent-start-position value)
			b (extent-end-position value)))
		 ((and (consp value)
		       (markerp (car value))
		       (markerp (cdr value)))
		  (setq a (marker-position (car value))
			b (marker-position (cdr value))
			buf (marker-buffer (car value)))))
	   (save-excursion
	     (set-buffer buf)
	     (save-restriction
	       (widen)
	       (goto-char a)
	       (beginning-of-line)
	       (setq a (1+ (count-lines 1 (point))))
	       (goto-char b)
	       (beginning-of-line)
	       (setq b (1+ (count-lines 1 (point))))))
	   (if (< b a) (setq tmp a a b b tmp))
	   (cons 'SPAN
		 (vector (cons (ash a -16) (logand a 65535))
			 (cons (ash b -16) (logand b 65535))))))))

(defun xselect-convert-to-colno (selection type value)
  (let (a b buf tmp)
    (cond ((cond ((extentp value)
		  (setq buf (extent-object value)
			a (extent-start-position value)
			b (extent-end-position value)))
		 ((and (consp value)
		       (markerp (car value))
		       (markerp (cdr value)))
		  (setq a (car value)
			b (cdr value)
			buf (marker-buffer a))))
	   (save-excursion
	     (set-buffer buf)
	     (goto-char a)
	     (setq a (current-column))
	     (goto-char b)
	     (setq b (current-column)))
	   (if (< b a) (setq tmp a a b b tmp))
	   (cons 'SPAN
		 (vector (cons (ash a -16) (logand a 65535))
			 (cons (ash b -16) (logand b 65535))))))))

(defun xselect-convert-to-sourceloc (selection type value)
  (let (a b buf file-name tmp)
    (cond ((cond ((extentp value)
		  (setq buf (or (extent-object value)
				(error "selection is in a killed buffer"))
			a (extent-start-position value)
			b (extent-end-position value)
			file-name (buffer-file-name buf)))
		 ((and (consp value)
		       (markerp (car value))
		       (markerp (cdr value)))
		  (setq a (marker-position (car value))
			b (marker-position (cdr value))
			buf (or (marker-buffer (car value))
				(error "selection is in a killed buffer"))
			file-name (buffer-file-name buf))))
	   (save-excursion
	     (set-buffer buf)
	     (save-restriction
	       (widen)
	       (goto-char a)
	       (beginning-of-line)
	       (setq a (1+ (count-lines 1 (point))))
	       (goto-char b)
	       (beginning-of-line)
	       (setq b (1+ (count-lines 1 (point))))))
	   (if (< b a) (setq tmp a a b b tmp))
	   (format "%s:%d" file-name a)))))

(defun xselect-convert-to-os (selection type size)
  (symbol-name system-type))

(defun xselect-convert-to-host (selection type size)
  (system-name))

(defun xselect-convert-to-user (selection type size)
  (user-full-name))

(defun xselect-convert-to-class (selection type size)
  x-emacs-application-class)

;; We do not try to determine the name Emacs was invoked with,
;; because it is not clean for a program's behavior to depend on that.
(defun xselect-convert-to-name (selection type size)
  ;invocation-name
  "xemacs")

(defun xselect-convert-to-integer (selection type value)
  (and (integerp value)
       (cons (ash value -16) (logand value 65535))))

(defun xselect-convert-to-atom (selection type value)
  (and (symbolp value) value))

(defun xselect-convert-to-identity (selection type value) ; used internally
  (vector value))

(setq selection-converter-alist
      '((TEXT . xselect-convert-to-text)
	(STRING . xselect-convert-to-string)
	(COMPOUND_TEXT . xselect-convert-to-compound-text)
	(TARGETS . xselect-convert-to-targets)
	(LENGTH . xselect-convert-to-length)
	(DELETE . xselect-convert-to-delete)
	(FILE_NAME . xselect-convert-to-filename)
	(CHARACTER_POSITION . xselect-convert-to-charpos)
	(SOURCE_LOC . xselect-convert-to-sourceloc)
	(LINE_NUMBER . xselect-convert-to-lineno)
	(COLUMN_NUMBER . xselect-convert-to-colno)
	(OWNER_OS . xselect-convert-to-os)
	(HOST_NAME . xselect-convert-to-host)
	(USER . xselect-convert-to-user)
	(CLASS . xselect-convert-to-class)
	(NAME . xselect-convert-to-name)
	(ATOM . xselect-convert-to-atom)
	(INTEGER . xselect-convert-to-integer)
	(_EMACS_INTERNAL . xselect-convert-to-identity)
	))

;FSFmacs (provide 'select)

;;; x-select.el ends here.
