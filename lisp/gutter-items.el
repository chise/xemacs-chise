;;; gutter-items.el --- Gutter content for XEmacs.

;; Copyright (C) 1999 Free Software Foundation, Inc.
;; Copyright (C) 1999 Andy Piper.

;; Maintainer: XEmacs Development Team
;; Keywords: frames, extensions, internal, dumped

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
;; along with Xmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;; Some of this is taken from the buffer-menu stuff in menubar-items.el
;; and the custom specs in toolbar.el.

(defgroup gutter nil
  "Input from the gutters."
  :group 'environment)

(defvar gutter-buffers-tab nil
  "A tab widget in the gutter for displaying buffers.
Do not set this. Use `glyph-image-instance' and
`set-image-instance-property' to change the properties of the tab.")

(defcustom gutter-visible-p 
  (specifier-instance default-gutter-visible-p)
  "Whether the default gutter is globally visible. This option can be
customized through the options menu."
  :group 'display
  :type 'boolean
  :set #'(lambda (var val)
	   (set-specifier default-gutter-visible-p val)
	   (setq gutter-visible-p val)
	   (when gutter-buffers-tab (update-tab-in-gutter))))

(defcustom default-gutter-position
  (default-gutter-position)
  "The location of the default gutter. It can be 'top, 'bottom, 'left or
'right. This option can be customized through the options menu."
  :group 'display
  :type '(choice (const :tag "top" 'top)
		 (const :tag "bottom" 'bottom)
		 (const :tag "left" 'left)
		 (const :tag "right" 'right))
  :set #'(lambda (var val)
	   (set-default-gutter-position val)
	   (setq default-gutter-position val)
	   (when gutter-buffers-tab (update-tab-in-gutter))))

;;; The Buffers tab

(defgroup buffers-tab nil
  "Customization of `Buffers' tab."
  :group 'gutter)

(defvar gutter-buffers-tab-orientation 'top
  "Where the buffers tab currently is. Do not set this.")

(defvar gutter-buffers-tab-extent nil)

(defcustom buffers-tab-max-size 6
  "*Maximum number of entries which may appear on the \"Buffers\" tab.
If this is 10, then only the ten most-recently-selected buffers will be
shown.  If this is nil, then all buffers will be shown.  Setting this to
a large number or nil will slow down tab responsiveness."
  :type '(choice (const :tag "Show all" nil)
		 (integer 6))
  :group 'buffers-tab)

(defcustom buffers-tab-switch-to-buffer-function 'buffers-tab-switch-to-buffer
  "*The function to call to select a buffer from the buffers tab.
`switch-to-buffer' is a good choice, as is `pop-to-buffer'."
  :type '(radio (function-item switch-to-buffer)
		(function-item pop-to-buffer)
		(function :tag "Other"))
  :group 'buffers-tab)

(defcustom buffers-tab-omit-function 'buffers-menu-omit-invisible-buffers
  "*If non-nil, a function specifying the buffers to omit from the buffers tab.
This is passed a buffer and should return non-nil if the buffer should be
omitted.  The default value `buffers-tab-omit-invisible-buffers' omits
buffers that are normally considered \"invisible\" (those whose name
begins with a space)."
  :type '(choice (const :tag "None" nil)
		 function)
  :group 'buffers-tab)

(defcustom buffers-tab-selection-function 'select-buffers-tab-buffers-by-mode
  "*If non-nil, a function specifying the buffers to select from the
buffers tab.  This is passed two buffers and should return non-nil if
the second buffer should be selected.  The default value
`select-buffers-tab-buffers-by-mode' groups buffers by major mode and
by `buffers-tab-grouping-regexp'."

  :type '(choice (const :tag "None" nil)
		 function)
  :group 'buffers-tab)

(make-face 'buffers-tab "Face for displaying the buffers tab.")
(set-face-parent 'buffers-tab 'default)

(defcustom buffers-tab-face 'buffers-tab
  "*Face to use for displaying the buffers tab."
  :type 'face
  :group 'buffers-tab)

(defcustom buffers-tab-grouping-regexp 
  '("^\\(gnus-\\|message-mode\\|mime/viewer-mode\\)"
    "^\\(emacs-lisp-\\|lisp-\\)")
  "*If non-nil, a list of regular expressions for buffer grouping.
Each regular expression is applied to the current major-mode symbol
name and mode-name, if it matches then any other buffers that match
the same regular expression be added to the current group."
  :type '(choice (const :tag "None" nil)
		 sexp)
  :group 'buffers-tab)

(defcustom buffers-tab-format-buffer-line-function 'format-buffers-tab-line
  "*The function to call to return a string to represent a buffer in the
buffers tab.  The function is passed a buffer and should return a
string.  The default value `format-buffers-tab-line' just returns the
name of the buffer, optionally truncated to
`buffers-tab-max-buffer-line-length'.  Also check out
`slow-format-buffers-menu-line' which returns a whole bunch of info
about a buffer."
  :type 'function
  :group 'buffers-tab)

(defvar buffers-tab-default-buffer-line-length
  (make-specifier-and-init 'generic '((global ((default) . 25))) t)
  "*Maximum length of text which may appear in a \"Buffers\" tab.
This is a specifier, use set-specifier to modify it.")

(defcustom buffers-tab-max-buffer-line-length 
  (specifier-instance buffers-tab-default-buffer-line-length)
  "*Maximum length of text which may appear in a \"Buffers\" tab.
Buffer names over this length will be truncated with elipses.
If this is 0, then the full buffer name will be shown."
  :type '(choice (const :tag "Show all" 0)
		 (integer 25))
  :group 'buffers-tab
  :set #'(lambda (var val)
	   (set-specifier buffers-tab-default-buffer-line-length val)
	   (setq buffers-tab-max-buffer-line-length val)))

(defun buffers-tab-switch-to-buffer (buffer)
  "For use as a value for `buffers-tab-switch-to-buffer-function'."
  (unless (eq (window-buffer) buffer)
    (if (> (length (windows-of-buffer buffer)) 0)
	(select-window (car (windows-of-buffer buffer)))
      (switch-to-buffer buffer t))))

(defun select-buffers-tab-buffers-by-mode (buf1 buf2)
  "For use as a value of `buffers-tab-selection-function'.
This selects buffers by major mode `buffers-tab-grouping-regexp'."
  (let ((mode1 (symbol-name (symbol-value-in-buffer 'major-mode buf1)))
	(mode2 (symbol-name (symbol-value-in-buffer 'major-mode buf2)))
	(modenm1 (symbol-value-in-buffer 'mode-name buf1))
	(modenm2 (symbol-value-in-buffer 'mode-name buf2)))
    (cond ((or (eq mode1 mode2)
	       (eq modenm1 modenm2)
	       (and (string-match "^[^-]+-" mode1)
		    (string-match
		     (concat "^" (regexp-quote 
				  (substring mode1 0 (match-end 0))))
		     mode2))
	       (and buffers-tab-grouping-regexp
		    (find-if #'(lambda (x)
				 (or
				  (and (string-match x mode1)
				       (string-match x mode2))
				  (and (string-match x modenm1)
				       (string-match x modenm2))))
			     buffers-tab-grouping-regexp)))
	   t)
	  (t nil))))

(defun format-buffers-tab-line (buffer)
  "For use as a value of `buffers-tab-format-buffer-line-function'.
This just returns the buffer's name, optionally truncated."
  (let ((len (specifier-instance buffers-tab-default-buffer-line-length)))
    (if (and (> len 0)
	     (> (length (buffer-name buffer)) len))
	(if (string-match ".*<.>$" (buffer-name buffer))
	    (concat (substring (buffer-name buffer) 
			       0 (- len 6)) "..."
			       (substring (buffer-name buffer) -3))
	  (concat (substring (buffer-name buffer)
			     0 (- len 3)) "..."))
      (buffer-name buffer))))

(defsubst build-buffers-tab-internal (buffers)
  (let (line)
    (mapcar
     #'(lambda (buffer)
	 (setq line (funcall buffers-tab-format-buffer-line-function
			     buffer))
	 (vector line (list buffers-tab-switch-to-buffer-function
			    (buffer-name buffer))))
     buffers)))

(defun buffers-tab-items (&optional in-deletion frame)
  "This is the tab filter for the top-level buffers \"Buffers\" tab.
It dynamically creates a list of buffers to use as the contents of the tab.
Only the most-recently-used few buffers will be listed on the tab, for
efficiency reasons.  You can control how many buffers will be shown by
setting `buffers-tab-max-size'.  You can control the text of the tab
items by redefining the function `format-buffers-menu-line'."
  (save-match-data
    (let* ((buffers (delete-if buffers-tab-omit-function (buffer-list frame)))
	   (first-buf (car buffers)))
      ;; if we're in deletion ignore the current buffer
      (when in-deletion 
	(setq buffers (delq (current-buffer) buffers))
	(setq first-buf (car buffers)))
      ;; group buffers by mode
      (when buffers-tab-selection-function
	(delete-if-not #'(lambda (buf)
			   (funcall buffers-tab-selection-function
				    first-buf buf)) buffers))
      (and (integerp buffers-tab-max-size)
	   (> buffers-tab-max-size 1)
	   (> (length buffers) buffers-tab-max-size)
	   ;; shorten list of buffers
	   (setcdr (nthcdr buffers-tab-max-size buffers) nil))
      (setq buffers (build-buffers-tab-internal buffers))
      buffers)))

(defun add-tab-to-gutter ()
  "Put a tab control in the gutter area to hold the most recent buffers."
  (setq gutter-buffers-tab-orientation (default-gutter-position))
  (let ((gutter-string ""))
    (unless gutter-buffers-tab-extent
      (setq gutter-buffers-tab-extent (make-extent 0 0 gutter-string)))
    (set-extent-begin-glyph 
     gutter-buffers-tab-extent
     (setq gutter-buffers-tab 
	   (make-glyph 
	    (vector 'tab-control :descriptor "Buffers" :face buffers-tab-face
		    :orientation gutter-buffers-tab-orientation
		    :properties (list :items (buffers-tab-items))))))
    ;; This looks better than a 3d border
    (mapcar '(lambda (x)
	       (when (valid-image-instantiator-format-p 'tab-control x)
		 (set-specifier default-gutter-border-width 0 'global x)
		 (set-specifier top-gutter nil 'global x)
		 (set-specifier bottom-gutter nil 'global x)
		 (set-specifier left-gutter nil 'global x)
		 (set-specifier right-gutter nil 'global x)
		 (set-specifier left-gutter-width 0 'global x)
		 (set-specifier right-gutter-width 0 'global x)
		 (cond ((eq gutter-buffers-tab-orientation 'top)
			(set-specifier top-gutter gutter-string 'global x))
		       ((eq gutter-buffers-tab-orientation 'bottom)
			(set-specifier bottom-gutter gutter-string 'global x))
		       ((eq gutter-buffers-tab-orientation 'left)
			(set-specifier left-gutter gutter-string 'global x)
			(set-specifier left-gutter-width
				       (glyph-width gutter-buffers-tab)
				       'global x))
		       ((eq gutter-buffers-tab-orientation 'right)
			(set-specifier right-gutter gutter-string 'global x)
			(set-specifier right-gutter-width
				       (glyph-width gutter-buffers-tab)
				       'global x))
		       )))
	    (console-type-list))))

(defun update-tab-in-gutter (&optional frame-or-buffer)
  "Update the tab control in the gutter area."
  (let ((locale (if (framep frame-or-buffer) frame-or-buffer)))
    (when (specifier-instance default-gutter-visible-p locale)
      (unless (and gutter-buffers-tab 
		   (eq (default-gutter-position)
		       gutter-buffers-tab-orientation))
	(add-tab-to-gutter))
      (when (valid-image-instantiator-format-p 'tab-control locale)
	(let ((inst (glyph-image-instance 
		     gutter-buffers-tab
		     (when (framep frame-or-buffer)
		       (last-nonminibuf-window frame-or-buffer)))))
	  (set-image-instance-property inst :items 
				       (buffers-tab-items 
					nil locale)))))))

(defun remove-buffer-from-gutter-tab ()
  "Remove the current buffer from the tab control in the gutter area."
  (when (and (valid-image-instantiator-format-p 'tab-control)
	     (specifier-instance default-gutter-visible-p))
    (let ((inst (glyph-image-instance gutter-buffers-tab))
	  (buffers (buffers-tab-items t)))
      (unless buffers
	(setq buffers (build-buffers-tab-internal 
		       (list 
			(get-buffer-create "*scratch*")))))
      (set-image-instance-property inst :items buffers))))

(add-hook 'kill-buffer-hook 'remove-buffer-from-gutter-tab)
(add-hook 'create-frame-hook 'update-tab-in-gutter)
(add-hook 'record-buffer-hook 'update-tab-in-gutter)

;;
;; progress display
;; ripped off from message display
;;
(defvar progress-stack nil
  "An alist of label/string pairs representing active progress gauges.
The first element in the list is currently displayed in the gutter area.
Do not modify this directly--use the `progress' or
`display-progress'/`clear-progress' functions.")

(defvar progress-glyph-height 32
  "Height of the gutter area for progress messages.")

(defvar progress-stop-callback 'progress-quit-function
  "Function to call to stop the progress operation.")

(defun progress-quit-function ()
  "Default function to call for the stop button in a progress gauge.
This just removes the progress gauge and calls quit."
  (interactive)
  (clear-progress)
  (keyboard-quit))

;; private variables
(defvar progress-gauge-glyph
  (make-glyph
   (vector 'progress-gauge
	   :pixel-height (- progress-glyph-height 8)
	   :pixel-width 50
	   :descriptor "Progress")))

(defvar progress-text-glyph
  (make-glyph [string :data ""]))

(defvar progress-layout-glyph
  (make-glyph
   (vector 
    'layout :orientation 'vertical :justify 'left
    :items (list 
	    progress-text-glyph
	    (make-glyph
	     (vector 
	      'layout :pixel-height progress-glyph-height 
	      :orientation 'horizontal
	      :items (list 
		      progress-gauge-glyph
		      (vector 
		       'button :pixel-height (- progress-glyph-height 8)
		       :descriptor " Stop "
		       :callback '(funcall progress-stop-callback)))))))))

(defvar progress-abort-glyph
  (make-glyph
   (vector 'layout :orientation 'vertical :justify 'left
	   :items (list progress-text-glyph
			(make-glyph 
			 (vector 'layout 
				 :pixel-height progress-glyph-height
				 :orientation 'horizontal))))))

(defvar progress-extent-text "")
(defvar progress-extent nil)

(defun progress-displayed-p (&optional return-string frame)
  "Return a non-nil value if a progress gauge is presently displayed in the
gutter area.  If optional argument RETURN-STRING is non-nil,
return a string containing the message, otherwise just return t."
  (let ((buffer (get-buffer-create " *Gutter Area*")))
    (and (< (point-min buffer) (point-max buffer))
	 (if return-string
	     (buffer-substring nil nil buffer)
	   t))))

;;; Returns the string which remains in the echo area, or nil if none.
;;; If label is nil, the whole message stack is cleared.
(defun clear-progress (&optional label frame no-restore)
  "Remove any progress gauge with the given LABEL from the progress gauge-stack,
erasing it from the gutter area if it's currently displayed there.
If a message remains at the head of the progress-stack and NO-RESTORE
is nil, it will be displayed.  The string which remains in the gutter
area will be returned, or nil if the progress-stack is now empty.
If LABEL is nil, the entire progress-stack is cleared.

Unless you need the return value or you need to specify a label,
you should just use (progress nil)."
  (or frame (setq frame (selected-frame)))
  (remove-progress label frame)
  (let ((inhibit-read-only t)
	(zmacs-region-stays zmacs-region-stays)) ; preserve from change
    (erase-buffer " *Echo Area*")
    (erase-buffer (get-buffer-create " *Gutter Area*")))
  (if no-restore
      nil			; just preparing to put another msg up
    (if progress-stack
	(let ((oldmsg (cdr (car progress-stack))))
	  (raw-append-progress oldmsg frame)
	  oldmsg)
      ;; nothing to display so get rid of the gauge
      (set-specifier bottom-gutter-border-width 0 frame)
      (set-specifier bottom-gutter-visible-p nil frame))))

(defun remove-progress (&optional label frame)
  ;; If label is nil, we want to remove all matching progress gauges.
  (while (and progress-stack
	      (or (null label)	; null label means clear whole stack
		  (eq label (car (car progress-stack)))))
    (setq progress-stack (cdr progress-stack)))
  (let ((s  progress-stack))
    (while (cdr s)
      (let ((msg (car (cdr s))))
	(if (eq label (car msg))
	    (progn
	      (setcdr s (cdr (cdr s))))
	  (setq s (cdr s)))))))

(defun append-progress (label message &optional value frame)
  (or frame (setq frame (selected-frame)))
  ;; Add a new entry to the message-stack, or modify an existing one
  (let* ((top (car progress-stack))
	 (tmsg (cdr top)))
    (if (eq label (car top))
	(progn
	  (setcdr top message)
	  (if (eq tmsg message)
	      (set-image-instance-property 
	       (glyph-image-instance progress-gauge-glyph)
	       :percent value)
	    (raw-append-progress message value frame))
	  (redisplay-gutter-area)
	  (when (input-pending-p)
	    (dispatch-event (next-command-event))))
      (push (cons label message) progress-stack)
      (raw-append-progress message value frame))
    (when (eq value 100) 
      (sit-for 0.5 nil)
      (clear-progress label))))

(defun abort-progress (label message &optional frame)
  (or frame (setq frame (selected-frame)))
  ;; Add a new entry to the message-stack, or modify an existing one
  (let* ((top (car progress-stack))
	 (inhibit-read-only t)
	 (zmacs-region-stays zmacs-region-stays))
    (if (eq label (car top))
	(setcdr top message)
      (push (cons label message) progress-stack))
    (unless (equal message "")
      (insert-string message (get-buffer-create " *Gutter Area*"))
      ;; Do what the device is able to cope with.
      (if (not (valid-image-instantiator-format-p 'progress-gauge frame))
	  (progn
	    (insert-string message " *Echo Area*")
	    (if (not executing-kbd-macro)
		(redisplay-echo-area)))
	;; do some funky display here.
	(unless progress-extent
	  (setq progress-extent (make-extent 0 0 progress-extent-text)))
	(let ((bglyph (extent-begin-glyph progress-extent)))
	  (set-extent-begin-glyph progress-extent progress-abort-glyph)
	  ;; fixup the gutter specifiers
	  (set-specifier bottom-gutter progress-extent-text frame)
	  (set-specifier bottom-gutter-border-width 2 frame)
	  (set-image-instance-property 
	   (glyph-image-instance progress-text-glyph) :data message)
	  (set-specifier bottom-gutter-height 'autodetect frame)
	  (set-specifier bottom-gutter-visible-p t frame)
	  ;; we have to do this so redisplay is up-to-date and so
	  ;; redisplay-gutter-area performs optimally.
	  (redisplay-gutter-area)
	  (sit-for 0.5 nil)
	  (clear-progress label)
	  (set-extent-begin-glyph progress-extent bglyph)
	  )))))

(defun raw-append-progress (message &optional value frame)
  (unless (equal message "")
    (let ((inhibit-read-only t)
	  (zmacs-region-stays zmacs-region-stays)
	  (val (or value 0))) ; preserve from change
      (insert-string message (get-buffer-create " *Gutter Area*"))
      ;; Do what the device is able to cope with.
      (if (not (valid-image-instantiator-format-p 'progress-gauge frame))
	  (progn
	    (insert-string 
	     (concat message (if (eq val 100) "done.")
		     (make-string (/ val 5) ?.))
	     " *Echo Area*")
	    (if (not executing-kbd-macro)
		(redisplay-echo-area)))
	;; do some funky display here.
	(unless progress-extent
	  (setq progress-extent (make-extent 0 0 progress-extent-text))
	  (set-extent-begin-glyph progress-extent progress-layout-glyph))
	;; fixup the gutter specifiers
	(set-specifier bottom-gutter progress-extent-text frame)
	(set-specifier bottom-gutter-border-width 2 frame)
	(set-image-instance-property 
	 (glyph-image-instance progress-gauge-glyph) :percent val)
	(set-image-instance-property 
	 (glyph-image-instance progress-text-glyph) :data message)
	(if (and (eq (specifier-instance bottom-gutter-height frame)
		     'autodetect)
		 (specifier-instance bottom-gutter-visible-p frame))
	    (progn
	      ;; if the gauge is already visible then just draw the gutter
	      ;; checking for user events
	      (redisplay-gutter-area)
	      (when (input-pending-p)
		(dispatch-event (next-command-event))))
	  ;; otherwise make the gutter visible and redraw the frame
	  (set-specifier bottom-gutter-height 'autodetect frame)
	  (set-specifier bottom-gutter-visible-p t frame)
	  ;; we have to do this so redisplay is up-to-date and so
	  ;; redisplay-gutter-area performs optimally.
	  (redisplay-frame)
	  )))))

(defun display-progress (label message &optional value frame)
  "Display a progress gauge and message in the bottom gutter area.
 First argument LABEL is an identifier for this message.  MESSAGE is
the string to display.  Use `clear-progress' to remove a labelled
message."
  (clear-progress label frame t)
  (if (eq value 'abort)
      (abort-progress label message frame)
    (append-progress label message value frame)))

(defun current-progress (&optional frame)
  "Return the current progress gauge in the gutter area, or nil.
The FRAME argument is currently unused."
  (cdr (car progress-stack)))

;;; may eventually be frame-dependent
(defun current-progress-label (&optional frame)
  (car (car progress-stack)))

(defun progress (fmt &optional value &rest args)
  "Print a progress gauge and message in the bottom gutter area of the frame.
The arguments are the same as to `format'.

If the only argument is nil, clear any existing progress gauge."
  (if (and (null fmt) (null args))
      (prog1 nil
	(clear-progress nil))
    (let ((str (apply 'format fmt args)))
      (display-progress 'progress str value)
      str)))

(defun lprogress (label fmt &optional value &rest args)
  "Print a progress gauge and message in the bottom gutter area of the frame.
First argument LABEL is an identifier for this progress gauge.  The rest of the
arguments are the same as to `format'."
  (if (and (null fmt) (null args))
      (prog1 nil
	(clear-progress label nil))
    (let ((str (apply 'format fmt args)))
      (display-progress label str value)
      str)))

(provide 'gutter-items)
;;; gutter-items.el ends here.
