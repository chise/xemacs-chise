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

(defvar selected-text-type
  (if (featurep 'mule) '(COMPOUND_TEXT STRING) 'STRING)
  "The type atom used to obtain selections from the X server.
Can be either a valid X selection data type, or a list of such types.
COMPOUND_TEXT and STRING are the most commonly used data types.
If a list is provided, the types are tried in sequence until
there is a successful conversion.")

(defvar selection-is-clipboard-p nil 
  "Controls the selection's relationship to the clipboard.
When non-nil, any operation that sets the primary selection will also
set the clipboard.")

(defun copy-primary-selection ()
  "Copy the selection to the Clipboard and the kill ring."
  (interactive)
  (and (console-on-window-system-p)
       (cut-copy-clear-internal 'copy)))

(defun kill-primary-selection ()
  "Copy the selection to the Clipboard and the kill ring, then delete it."
  (interactive "*")
  (and (console-on-window-system-p)
       (cut-copy-clear-internal 'cut)))

(defun delete-primary-selection ()
  "Delete the selection without copying it to the Clipboard or the kill ring."
  (interactive "*")
  (and (console-on-window-system-p)
       (cut-copy-clear-internal 'clear)))

(defun yank-clipboard-selection ()
  "Insert the current Clipboard selection at point."
  (interactive "*")
  (case (device-type (selected-device))
    (x (x-yank-clipboard-selection))
    (mswindows (mswindows-paste-clipboard))
    (otherwise nil)))

(define-device-method get-cutbuffer
  "Return the value of one of the cut buffers.
This will do nothing under anything other than X.")

(defun get-selection (&optional type data-type)
  "Return the value of a Windows selection.
The argument TYPE (default `PRIMARY') says which selection,
and the argument DATA-TYPE (default `STRING', or `COMPOUND_TEXT' under Mule)
says how to convert the data. If there is no selection an error is signalled."
  (let ((text (get-selection-no-error type data-type)))
    (when (not (stringp text))
      (error "Selection is not a string: %S" text))
    text))

(defun get-selection-no-error (&optional type data-type)
  "Return the value of a Windows selection.
The argument TYPE (default `PRIMARY') says which selection,
and the argument DATA-TYPE (default `STRING', or `COMPOUND_TEXT' under Mule)
says how to convert the data. Returns NIL if there is no selection"
  (or type (setq type 'PRIMARY))
  (or data-type (setq data-type selected-text-type))
  (let ((text
	 (if (consp data-type)
	     (condition-case err
		 (get-selection-internal type (car data-type))
	       (selection-conversion-error
		(if (cdr data-type)
		    (get-selection type (cdr data-type))
		  (signal (car err) (cdr err)))))
	   (get-selection-internal type data-type))))
    (when (and (consp text) (symbolp (car text)))
      (setq text (cdr text)))
    text))

;; FSFmacs calls this `x-set-selection', and reverses the
;; arguments (duh ...).  This order is more logical.
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
  ;FSFmacs huh??  It says:
  ;; "This is for temporary compatibility with pre-release Emacs 19."
  ;(if (stringp type)
  ;    (setq type (intern type)))
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
  (or type (setq type 'PRIMARY))
  (if (null data)
      (disown-selection-internal type)
    (own-selection-internal type data)
    (when (and (eq type 'PRIMARY)
	       selection-is-clipboard-p)
      (own-selection-internal 'CLIPBOARD data)))
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

(defun dehilight-selection (selection)
  "for use as a value of `lost-selection-hooks'."
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

(setq lost-selection-hooks 'dehilight-selection)

(defun own-clipboard (string)
  "Paste the given string to the X Clipboard."
  (own-selection string 'CLIPBOARD))

(defun disown-selection (&optional secondary-p)
  "Assuming we own the selection, disown it.  With an argument, discard the
secondary selection instead of the primary selection."
  (disown-selection-internal (if secondary-p 'SECONDARY 'PRIMARY)))

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

(defun cut-copy-clear-internal (mode)
  (or (memq mode '(cut copy clear)) (error "unkown mode %S" mode))
  (or (selection-owner-p)
      (error "XEmacs does not own the primary selection"))
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

;;; Functions to convert the selection into various other selection
;;; types.  Every selection type that emacs handles is implemented
;;; this way, except for TIMESTAMP, which is a special case. These are
;;; all moved from x-select.el

(defun select-convert-to-text (selection type value)
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

(defun select-convert-to-string (selection type value)
  (let ((outval (select-convert-to-text selection type value)))
    ;; force the string to be not in Compound Text format.
    (if (stringp outval)
	(cons 'STRING outval)
      outval)))

(defun select-convert-to-compound-text (selection type value)
  ;; converts to compound text automatically
  (select-convert-to-text selection type value))

(defun select-convert-to-length (selection type value)
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

(defun select-convert-to-targets (selection type value)
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

(defun select-convert-to-delete (selection type value)
  (disown-selection-internal selection)
  ;; A return value of nil means that we do not know how to do this conversion,
  ;; and replies with an "error".  A return value of NULL means that we have
  ;; done the conversion (and any side-effects) but have no value to return.
  'NULL)

(defun select-convert-to-filename (selection type value)
  (cond ((extentp value)
	 (buffer-file-name (or (extent-object value)
			       (error "selection is in a killed buffer"))))
	((and (consp value)
	      (markerp (car value))
	      (markerp (cdr value)))
	 (buffer-file-name (or (marker-buffer (car value))
			       (error "selection is in a killed buffer"))))
	(t nil)))

(defun select-convert-to-charpos (selection type value)
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

(defun select-convert-to-lineno (selection type value)
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

(defun select-convert-to-colno (selection type value)
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

(defun select-convert-to-sourceloc (selection type value)
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

(defun select-convert-to-os (selection type size)
  (symbol-name system-type))

(defun select-convert-to-host (selection type size)
  (system-name))

(defun select-convert-to-user (selection type size)
  (user-full-name))

(defun select-convert-to-class (selection type size)
  x-emacs-application-class)

;; We do not try to determine the name Emacs was invoked with,
;; because it is not clean for a program's behavior to depend on that.
(defun select-convert-to-name (selection type size)
  ;invocation-name
  "xemacs")

(defun select-convert-to-integer (selection type value)
  (and (integerp value)
       (cons (ash value -16) (logand value 65535))))

(defun select-convert-to-atom (selection type value)
  (and (symbolp value) value))

(defun select-convert-to-identity (selection type value) ; used internally
  (vector value))

(setq selection-converter-alist
      '((TEXT . select-convert-to-text)
	(STRING . select-convert-to-string)
	(COMPOUND_TEXT . select-convert-to-compound-text)
	(TARGETS . select-convert-to-targets)
	(LENGTH . select-convert-to-length)
	(DELETE . select-convert-to-delete)
	(FILE_NAME . select-convert-to-filename)
	(CHARACTER_POSITION . select-convert-to-charpos)
	(SOURCE_LOC . select-convert-to-sourceloc)
	(LINE_NUMBER . select-convert-to-lineno)
	(COLUMN_NUMBER . select-convert-to-colno)
	(OWNER_OS . select-convert-to-os)
	(HOST_NAME . select-convert-to-host)
	(USER . select-convert-to-user)
	(CLASS . select-convert-to-class)
	(NAME . select-convert-to-name)
	(ATOM . select-convert-to-atom)
	(INTEGER . select-convert-to-integer)
	(_EMACS_INTERNAL . select-convert-to-identity)
	))

;;; select.el ends here
