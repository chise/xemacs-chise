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

(defcustom gutter-visible-p 
  (specifier-instance default-gutter-visible-p)
  "Whether the default gutter is globally visible. This option can be
customized through the options menu."
  :group 'display
  :type 'boolean
  :set #'(lambda (var val)
	   (set-specifier default-gutter-visible-p val)
	   (setq gutter-visible-p val)))

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
	   (setq default-gutter-position val)))

;;; The Buffers tab

(defgroup buffers-tab nil
  "Customization of `Buffers' tab."
  :group 'gutter)

(defvar gutter-buffers-tab nil
  "A tab widget in the gutter for displaying buffers.
Do not set this. Use `glyph-image-instance' and
`set-image-instance-property' to change the properties of the tab.")

(defcustom buffers-tab-max-size 6
  "*Maximum number of entries which may appear on the \"Buffers\" tab.
If this is 10, then only the ten most-recently-selected buffers will be
shown.  If this is nil, then all buffers will be shown.  Setting this to
a large number or nil will slow down tab responsiveness."
  :type '(choice (const :tag "Show all" nil)
		 (integer 10))
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

(defcustom buffers-tab-format-buffer-line-function 'format-buffers-menu-line
  "*The function to call to return a string to represent a buffer in the
buffers tab.  The function is passed a buffer and should return a string.
The default value `format-buffers-menu-line' just returns the name of
the buffer.  Also check out `slow-format-buffers-menu-line' which
returns a whole bunch of info about a buffer."
  :type 'function
  :group 'buffers-tab)

(defun buffers-tab-switch-to-buffer (buffer)
  "For use as a value for `buffers-tab-switch-to-buffer-function'."
  (switch-to-buffer buffer t))

(defsubst build-buffers-tab-internal (buffers)
  (let (line)
    (mapcar
     #'(lambda (buffer)
	 (setq line (funcall buffers-tab-format-buffer-line-function
			     buffer))
	 (vector line (list buffers-tab-switch-to-buffer-function
			    (buffer-name buffer))))
     buffers)))

(defun buffers-tab-items ()
  "This is the tab filter for the top-level buffers \"Buffers\" tab.
It dynamically creates a list of buffers to use as the contents of the tab.
Only the most-recently-used few buffers will be listed on the tab, for
efficiency reasons.  You can control how many buffers will be shown by
setting `buffers-tab-max-size'.  You can control the text of the tab
items by redefining the function `format-buffers-menu-line'."
  (let ((buffers (delete-if buffers-tab-omit-function (buffer-list))))
    (and (integerp buffers-tab-max-size)
	 (> buffers-tab-max-size 1)
	 (> (length buffers) buffers-tab-max-size)
	 ;; shorten list of buffers
	 (setcdr (nthcdr buffers-tab-max-size buffers) nil))
    (setq buffers (build-buffers-tab-internal buffers))
    buffers))

(defun add-tab-to-gutter ()
  "Put a tab control in the gutter area to hold the most recent buffers."
  (let ((gutter-string ""))
    (set-extent-begin-glyph 
     (make-extent 0 0 gutter-string)
     (setq gutter-buffers-tab 
	   (make-glyph 
	    (vector 'tab-control :descriptor "Buffers"
		    :properties (list :items (buffers-tab-items))))))
    ;; This looks better than a 3d border
    (set-specifier default-gutter-border-width 0 'global 'mswindows)
    (set-specifier default-gutter gutter-string 'global 'mswindows)))

(defun update-tab-in-gutter (&optional notused)
  "Update the tab control in the gutter area."
  (when (valid-image-instantiator-format-p 'tab-control)
    (set-image-instance-property (glyph-image-instance gutter-buffers-tab)
				 :items
				 (buffers-tab-items))
    (resize-subwindow (glyph-image-instance gutter-buffers-tab)
		      (gutter-pixel-width) nil)))

(add-tab-to-gutter)
(add-hook 'switch-to-buffer-hooks 'update-tab-in-gutter)
(add-hook 'create-frame-hook 'update-tab-in-gutter)

(provide 'gutter-items)
;;; gutter-items.el ends here.
