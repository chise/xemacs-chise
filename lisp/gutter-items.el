;;; gutter-items.el --- Gutter content for XEmacs.

;; Copyright (C) 1999 Free Software Foundation, Inc.
;; Copyright (C) 1999, 2000 Andy Piper.

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

;;; The Buffers tab

(defgroup buffers-tab nil
  "Customization of `Buffers' tab."
  :group 'gutter)

(defvar gutter-buffers-tab nil
  "A tab widget in the gutter for displaying buffers.
Do not set this. Use `set-glyph-image' to change the properties of the tab.")

(defcustom gutter-buffers-tab-visible-p
  (gutter-element-visible-p default-gutter-visible-p 'buffers-tab)
  "Whether the buffers tab is globally visible. 
This option should be set through the options menu."
  :group 'buffers-tab
  :type 'boolean
  :set #'(lambda (var val)
	   (set-gutter-element-visible-p default-gutter-visible-p 
					 'buffers-tab val)
	   (setq gutter-buffers-tab-visible-p val)))

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

(defcustom buffers-tab-sort-function nil
  "*If non-nil, a function specifying the buffers to select from the
buffers tab.  This is passed the buffer list and returns the list in the
order desired for the tab widget.  The default value `nil' leaves the
list in `buffer-list' order (usual most-recently-selected-first)."

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
    ;; this used to add the norecord flag to both calls below.
    ;; this is bogus because it is a pervasive assumption in XEmacs
    ;; that the current buffer is at the front of the buffers list.
    ;; for example, select an item and then do M-C-l
    ;; (switch-to-other-buffer).  Things get way confused.
    ;;
    ;; Andy, if you want to maintain the current look, you must
    ;; *uncouple* the gutter order and buffers order.
    (if (> (length (windows-of-buffer buffer)) 0)
	(select-window (car (windows-of-buffer buffer)))
      (switch-to-buffer buffer))))

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
  (let ((selected t))
    (mapcar
     #'(lambda (buffer)
	 (prog1
	     (vector 
	      (funcall buffers-tab-format-buffer-line-function
		       buffer)
	      (list buffers-tab-switch-to-buffer-function
		    (buffer-name buffer))
	      :selected selected)
	   (when selected (setq selected nil))))
     buffers)))

;;; #### SJT I'd really like this function to have just two hooks: (1) the
;;; buffer filter list and (2) a sort function list.  Both should be lists
;;; of functions.  Each filter takes two arguments:  a buffer and a model
;;; buffer.  (The model buffer argument allows selecting according to the
;;; mode or directory of that buffer.)  The filter returns t if the buffer
;;; should be listed and nil otherwise.  Effectively the filter amounts to
;;; the conjuction of the filter list.  (Optionally the filter could take a
;;; frame instead of a buffer or generalize to a locale as in a specifier?)
;;; The filtering is done this way to preserve the ordering imposed by
;;; `buffer-list'.  In addition, the in-deletion argument will be used the
;;; same way as in the current design.
;;; The list is checked for length and pruned according to least-recently-
;;; selected.  (Optionally there could be some kind of sort function here,
;;; too.)
;;; Finally the list is sorted to gutter display order, and the tab data
;;; structure is created and returned.
;;; #### Docstring isn't very well expressed.
(defun buffers-tab-items (&optional in-deletion frame force-selection)
  "This is the tab filter for the top-level buffers \"Buffers\" tab.
It dynamically creates a list of buffers to use as the contents of the tab.
Only the most-recently-used few buffers will be listed on the tab, for
efficiency reasons.  You can control how many buffers will be shown by
setting `buffers-tab-max-size'.  You can control the text of the tab
items by redefining the function `format-buffers-menu-line'."
  (save-match-data
    (let* ((buffers (delete-if buffers-tab-omit-function (buffer-list frame)))
	   (first-buf (car buffers)))
      ;; maybe force the selected window
      (when (and force-selection
		 (not in-deletion)
		 (not (eq first-buf (window-buffer (selected-window frame)))))
	(setq buffers (cons (window-buffer (selected-window frame))
			    (delq first-buf buffers))))
      ;; if we're in deletion ignore the current buffer
      (when in-deletion 
	(setq buffers (delq (current-buffer) buffers))
	(setq first-buf (car buffers)))
      ;; select buffers in group (default is by mode)
      (when buffers-tab-selection-function
	(delete-if-not #'(lambda (buf)
			   (funcall buffers-tab-selection-function
				    first-buf buf)) buffers))
      ;; maybe shorten list of buffers
      (and (integerp buffers-tab-max-size)
	   (> buffers-tab-max-size 1)
	   (> (length buffers) buffers-tab-max-size)
	   (setcdr (nthcdr buffers-tab-max-size buffers) nil))
      ;; sort buffers in group (default is most-recently-selected)
      (when buffers-tab-sort-function
	(setq buffers (funcall buffers-tab-sort-function buffers)))
      ;; convert list of buffers to list of structures used by tab widget
      (setq buffers (build-buffers-tab-internal buffers))
      buffers)))

(defun add-tab-to-gutter ()
  "Put a tab control in the gutter area to hold the most recent buffers."
  (setq gutter-buffers-tab-orientation (default-gutter-position))
  (let ((gutter-string (copy-sequence "\n")))
    (unless gutter-buffers-tab-extent
      (setq gutter-buffers-tab-extent (make-extent 0 1 gutter-string)))
    (set-extent-begin-glyph 
     gutter-buffers-tab-extent
     (setq gutter-buffers-tab 
	   (make-glyph)))

    ;; Nuke all existing tabs
    (remove-gutter-element top-gutter 'buffers-tab)
    (remove-gutter-element bottom-gutter 'buffers-tab)
    (remove-gutter-element left-gutter 'buffers-tab)
    (remove-gutter-element right-gutter 'buffers-tab)
    ;; Put tabs into all devices that will be able to display them
    (mapcar
     #'(lambda (x)
	 (when (valid-image-instantiator-format-p 'tab-control x)
	   (cond ((eq gutter-buffers-tab-orientation 'top)
		  ;; This looks better than a 3d border
		  (set-specifier top-gutter-border-width 0 'global x)
		  (set-gutter-element top-gutter 'buffers-tab 
				      gutter-string 'global x))
		 ((eq gutter-buffers-tab-orientation 'bottom)
		  (set-specifier bottom-gutter-border-width 0 'global x)
		  (set-gutter-element bottom-gutter 'buffers-tab
				      gutter-string 'global x))
		 ((eq gutter-buffers-tab-orientation 'left)
		  (set-specifier left-gutter-border-width 0 'global x)
		  (set-gutter-element left-gutter 'buffers-tab
				      gutter-string 'global x)
		  (set-specifier left-gutter-width
				 (glyph-width gutter-buffers-tab)
				 'global x))
		 ((eq gutter-buffers-tab-orientation 'right)
		  (set-specifier right-gutter-border-width 0 'global x)
		  (set-gutter-element right-gutter 'buffers-tab
				      gutter-string 'global x)
		  (set-specifier right-gutter-width
				 (glyph-width gutter-buffers-tab)
				 'global x))
		 )))
     (console-type-list))))

(defun update-tab-in-gutter (frame &optional force-selection)
  "Update the tab control in the gutter area."
    ;; dedicated frames don't get tabs
  (unless (window-dedicated-p (frame-selected-window frame))
    (when (specifier-instance default-gutter-visible-p frame)
      (unless (and gutter-buffers-tab
		   (eq (default-gutter-position)
		       gutter-buffers-tab-orientation))
	(add-tab-to-gutter))
      (when (valid-image-instantiator-format-p 'tab-control frame)
	(set-glyph-image
	 gutter-buffers-tab
	 (vector 'tab-control :descriptor "Buffers" :face buffers-tab-face
		 :orientation gutter-buffers-tab-orientation
		 (if (or (eq gutter-buffers-tab-orientation 'top)
			 (eq gutter-buffers-tab-orientation 'bottom))
		     :pixel-width :pixel-height)
		 (if (or (eq gutter-buffers-tab-orientation 'top)
			 (eq gutter-buffers-tab-orientation 'bottom))
		     '(gutter-pixel-width) '(gutter-pixel-height))
		 :properties
		 (list :items
		       (buffers-tab-items nil frame force-selection)))
	 frame)))))

;; A myriad of different update hooks all doing slightly different things
(add-hook 'create-frame-hook 
	  #'(lambda (frame)
	      (when gutter-buffers-tab (update-tab-in-gutter frame t))))
(add-hook 'buffer-list-changed-hook 'update-tab-in-gutter)
(add-hook 'default-gutter-position-changed-hook
	  #'(lambda ()
	      (when gutter-buffers-tab
		(mapc #'update-tab-in-gutter (frame-list)))))
(add-hook 'gutter-element-visibility-changed-hook
	  #'(lambda (prop visible-p)
	      (when (and (eq prop 'buffers-tab) visible-p)
		(mapc #'update-tab-in-gutter (frame-list)))))
;;
;; progress display
;; ripped off from message display
;;
(defcustom progress-display-use-echo-area nil
  "*Whether progress gauge display should display in the echo area.
If NIL then progress gauges will be displayed with whatever native widgets
are available on the current console. If non-NIL then progress display will be
textual and displayed in the echo area."
  :type 'boolean
  :group 'gutter)

(defvar progress-glyph-height 24
  "Height of the progress gauge glyph.")

(defvar progress-display-popup-period 0.5
  "The time that the progress gauge should remain up after completion")

;; private variables
(defvar progress-text-glyph
  (make-glyph [string :data ""]))

(defvar progress-layout-glyph nil)
(defvar progress-gauge-glyph
  (make-glyph
   `[progress-gauge
     :pixel-height (eval progress-glyph-height)
     :pixel-width 250
     :descriptor "Progress"]))

(defun set-progress-display-style (style)
  "Control the appearance of the progress gauge.
If STYLE is 'large, the default, then the progress-display text is
displayed above the gauge itself. If STYLE is 'small then the gauge
and text are arranged side-by-side."  
  (cond
   ((eq style 'small)
    (setq progress-glyph-height 16)
    (setq progress-layout-glyph
	  (make-glyph
	   `[layout
	     :orientation horizontal
	     :margin-width 4
	     :items (,progress-gauge-glyph
		     [button
		      :pixel-height (eval progress-glyph-height)
		      ;; 'quit is special and acts "asynchronously".
		      :descriptor "Stop" :callback 'quit]
		     ,progress-text-glyph)])))
   (t 
    (setq progress-glyph-height 24)
    (setq progress-layout-glyph
	  (make-glyph
	   `[layout 
	     :orientation vertical :justify left
	     :margin-width 4
	     :items (,progress-text-glyph
		     [layout 
		      :orientation horizontal
		      :items (,progress-gauge-glyph
			      [button 
			       :pixel-height (eval progress-glyph-height)
			       :descriptor " Stop "
			       ;; 'quit is special and acts "asynchronously".
			       :callback 'quit])])])))))

(defcustom progress-display-style 'large
  "*Control the appearance of the progress gauge.
If 'large, the default, then the progress-display text is displayed
above the gauge itself. If 'small then the gauge and text are arranged
side-by-side."
  :group 'gutter
  :type '(choice (const :tag "large" large)
		 (const :tag "small" small))
  :set #'(lambda (var val)
	   (set-progress-display-style val)))

(defvar progress-stack nil
  "An alist of label/string pairs representing active progress gauges.
The first element in the list is currently displayed in the gutter area.
Do not modify this directly--use the `progress-display' or
`display-progress-display'/`clear-progress-display' functions.")

(defvar progress-abort-glyph
  (make-glyph
   `[layout :orientation vertical :justify left
	    :items (,progress-text-glyph
		    [layout
		     :margin-width 4
		     :pixel-height progress-glyph-height
		     :orientation horizontal])]))

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
(defun clear-progress-display (&optional label frame no-restore)
  "Remove any progress gauge with LABEL from the progress gauge-stack,
erasing it from the gutter area if it's currently displayed there.
If a message remains at the head of the progress-stack and NO-RESTORE
is nil, it will be displayed.  The string which remains in the gutter
area will be returned, or nil if the progress-stack is now empty.
If LABEL is nil, the entire progress-stack is cleared.

Unless you need the return value or you need to specify a label,
you should just use (progress nil)."
  (if (or (not (valid-image-instantiator-format-p 'progress-gauge frame))
	  progress-display-use-echo-area)
      (clear-message label frame nil no-restore)
    (or frame (setq frame (selected-frame)))
    (remove-progress-display label frame)
    (let ((inhibit-read-only t)
	  (zmacs-region-stays zmacs-region-stays)) ; preserve from change
      (erase-buffer (get-buffer-create " *Gutter Area*")))
    (if no-restore
	nil			; just preparing to put another msg up
      (if progress-stack
	  (let ((oldmsg (cdr (car progress-stack))))
	    (raw-append-progress-display oldmsg nil frame)
	    oldmsg)
	;; nothing to display so get rid of the gauge
	(set-specifier bottom-gutter-border-width 0 frame)
	(set-gutter-element-visible-p bottom-gutter-visible-p 
				      'progress nil frame)))))

(defun progress-display-clear-when-idle (&optional label)
  (add-one-shot-hook 'pre-idle-hook
		     `(lambda ()
			(clear-progress-display ',label))))

(defun remove-progress-display (&optional label frame)
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

(defun progress-display-dispatch-non-command-events ()
  ;; don't allow errors to hose things
  (condition-case t 
      ;; (sit-for 0) is too agressive and cause more display than we
      ;; want.
      (dispatch-non-command-events)
    nil))

(defun append-progress-display (label message &optional value frame)
  (or frame (setq frame (selected-frame)))
  ;; Add a new entry to the message-stack, or modify an existing one
  (let* ((top (car progress-stack))
	 (tmsg (cdr top)))
    (if (eq label (car top))
	(progn
	  (setcdr top message)
	  (if (equal tmsg message)
	      ;; #### use of set-image-instance-property is wrong.
	      ;; use set-glyph-image instead.
	      (set-image-instance-property 
	       (glyph-image-instance progress-gauge-glyph
				     (frame-selected-window frame))
	       :value value)
	    (raw-append-progress-display message value frame))
	  (redisplay-gutter-area))
      (push (cons label message) progress-stack)
      (raw-append-progress-display message value frame))
    (progress-display-dispatch-non-command-events)
    ;; either get command events or sit waiting for them
    (when (eq value 100)
;      (sit-for progress-display-popup-period nil)
      (clear-progress-display label))))

(defun abort-progress-display (label message &optional frame)
  (if (or (not (valid-image-instantiator-format-p 'progress-gauge frame))
	  progress-display-use-echo-area)
      (display-message label (concat message "aborted.") frame)
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
	(let* ((gutter-string (copy-sequence "\n"))
	       (ext (make-extent 0 1 gutter-string)))
	  ;; do some funky display here.
	  (set-extent-begin-glyph ext progress-abort-glyph)
	  ;; fixup the gutter specifiers
	  (set-gutter-element bottom-gutter 'progress gutter-string frame)
	  (set-specifier bottom-gutter-border-width 2 frame)
	  ;; #### use of set-image-instance-property is wrong.
	  ;; use set-glyph-image instead.
	  (set-image-instance-property 
	   (glyph-image-instance progress-text-glyph
				 (frame-selected-window frame)) :data message)
	  (set-specifier bottom-gutter-height 'autodetect frame)
	  (set-gutter-element-visible-p bottom-gutter-visible-p 
					'progress t frame)
	  ;; we have to do this so redisplay is up-to-date and so
	  ;; redisplay-gutter-area performs optimally.
	  (redisplay-gutter-area)
	  (sit-for progress-display-popup-period nil)
	  (clear-progress-display label frame)
	  (set-extent-begin-glyph ext progress-layout-glyph)
	  (set-gutter-element bottom-gutter 'progress gutter-string frame)
	  )))))

(defun raw-append-progress-display (message &optional value frame)
  (unless (equal message "")
    (let* ((inhibit-read-only t)
	  (zmacs-region-stays zmacs-region-stays)
	  (val (or value 0))
	  (gutter-string (copy-sequence "\n"))
	  (ext (make-extent 0 1 gutter-string)))
      (insert-string message (get-buffer-create " *Gutter Area*"))
      ;; do some funky display here.
      (set-extent-begin-glyph ext progress-layout-glyph)
      ;; fixup the gutter specifiers
      (set-gutter-element bottom-gutter 'progress gutter-string frame)
      (set-specifier bottom-gutter-border-width 2 frame)
      ;; #### use of set-image-instance-property is wrong.
      ;; use set-glyph-image instead.
      (set-image-instance-property 
       (glyph-image-instance progress-gauge-glyph 
			     (frame-selected-window frame))
       :value val)
      (set-image-instance-property 
       (glyph-image-instance progress-text-glyph (frame-selected-window frame))
       :data message)
      (if (and (eq (specifier-instance bottom-gutter-height frame)
		   'autodetect)
	       (gutter-element-visible-p bottom-gutter-visible-p
					 'progress frame))
	  ;; if the gauge is already visible then just draw the gutter
	  ;; checking for user events
	  (progn
	    (redisplay-gutter-area)
	    (progress-display-dispatch-non-command-events))
	;; otherwise make the gutter visible and redraw the frame
	(set-specifier bottom-gutter-height 'autodetect frame)
	(set-gutter-element-visible-p bottom-gutter-visible-p
				      'progress t frame)
	;; we have to do this so redisplay is up-to-date and so
	;; redisplay-gutter-area performs optimally. This may also
	;; make sure the frame geometry looks ok.
	(progress-display-dispatch-non-command-events)
	(redisplay-frame frame)
	))))

(defun display-progress-display (label message &optional value frame)
  "Display a progress gauge and message in the bottom gutter area.
 First argument LABEL is an identifier for this message.  MESSAGE is
the string to display.  Use `clear-progress-display' to remove a labelled
message."
  (cond ((eq value 'abort)
	 (abort-progress-display label message frame))
	((or (not (valid-image-instantiator-format-p 'progress-gauge frame))
	     progress-display-use-echo-area)
	 (display-message label 
	   (concat message (if (eq value 100) "done."
			     (make-string (/ value 5) ?.)))
	   frame))
	(t
	 (append-progress-display label message value frame))))

(defun current-progress-display (&optional frame)
  "Return the current progress gauge in the gutter area, or nil.
The FRAME argument is currently unused."
  (cdr (car progress-stack)))

;;; may eventually be frame-dependent
(defun current-progress-display-label (&optional frame)
  (car (car progress-stack)))

(defun progress-display (fmt &optional value &rest args)
  "Print a progress gauge and message in the bottom gutter area of the frame.
The arguments are the same as to `format'.

If the only argument is nil, clear any existing progress gauge."
  (save-excursion
    (if (and (null fmt) (null args))
	(prog1 nil
	  (clear-progress-display nil))
      (let ((str (apply 'format fmt args)))
	(display-progress-display 'progress str value)
	str))))

(defun lprogress-display (label fmt &optional value &rest args)
  "Print a progress gauge and message in the bottom gutter area of the frame.
First argument LABEL is an identifier for this progress gauge.  The rest of the
arguments are the same as to `format'."
  ;; #### sometimes the buffer gets changed temporarily. I don't know
  ;; why this is, so protect against it.
  (save-excursion
    (if (and (null fmt) (null args))
	(prog1 nil
	  (clear-progress-display label nil))
      (let ((str (apply 'format fmt args)))
	(display-progress-display label str value)
	str))))

;;
;; Simple search dialog
;;
(defvar search-dialog-direction t)
(defvar search-dialog-text 
  (make-glyph 
   [edit-field :width 15 :descriptor "" :active t :face default]))

(defun search-dialog-callback (parent image-instance event)
  (save-selected-frame
    (select-frame parent)
    (funcall (if search-dialog-direction
		 'search-forward 'search-backward)
	     (image-instance-property
	      (glyph-image-instance search-dialog-text 
				    (frame-selected-window 
				     (event-channel event))) :text))
    (isearch-highlight (match-beginning 0) (match-end 0))))
  
(defun make-search-dialog ()
  "Popup a search dialog box."
  (interactive)
  (let* ((parent (selected-frame)))
    (set-buffer-dedicated-frame 
     (get-buffer-create "Dialog")
     (make-dialog-box 
      (make-glyph
       `[layout 
	 :orientation horizontal :justify left
	 :height 10 :width 40
	 :border [string :data "Search"]
	 :items 
	 ([layout :orientation vertical :justify left
		  :items 
		  ([string :data "Search for:"]
		   [button :descriptor "Match case"
			   :style toggle
			   :selected (not case-fold-search)
			   :callback (setq case-fold-search
					   (not case-fold-search))]
		   [button :descriptor "Forwards"
			   :style radio
			   :selected search-dialog-direction
			   :callback (setq search-dialog-direction t)]
		   [button :descriptor "Backwards"
			   :style radio
			   :selected (not search-dialog-direction)
			   :callback (setq search-dialog-direction nil)]
		   )]
	  [layout :orientation vertical :justify left
		  :items 
		  (search-dialog-text
		   [button :width 10 :descriptor "Find Next"
			   :callback-ex
			   (lambda (image-instance event)
			     (search-dialog-callback ,parent
						     image-instance event))]
		   [button :width 10 :descriptor "Cancel"
			   :callback-ex
			   (lambda (image-instance event)
			     (isearch-dehighlight)
			     (delete-frame 
			      (event-channel event)))])])])
      '(height 10 width 40)))))

(provide 'gutter-items)
;;; gutter-items.el ends here.
