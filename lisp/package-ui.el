;;; package-ui.el ---

;; Copyright (C) 1998 by Darryl Okahata

;; Author: Darryl Okahata <darrylo@sr.hp.com>
;; Keywords: internal

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
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Synched up with: Not in FSF

(require 'package-get)		;; which, in turn, requires 'package-admin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User-changeable variables:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar pui-up-to-date-package-face nil
  "The face to use for packages that are up-to-date.")

(defvar pui-selected-package-face (get-face 'bold)
  "The face to use for selected packages.
Set this to `nil' to use the `default' face.")

(defvar pui-outdated-package-face (get-face 'red)
  "The face to use for outdated packages.
Set this to `nil' to use the `default' face.")

(defvar pui-uninstalled-package-face (get-face 'italic)
  "The face to use for uninstalled packages.
Set this to `nil' to use the `default' face.")

(defvar pui-list-verbose t
  "If non-nil, display verbose info in the package list buffer.")

(defvar pui-info-buffer "*Packages*"
  "Buffer to use for displaying package information.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of user-changeable variables.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar pui-selected-packages nil
  "The list of user-selected packages to install.")

(defvar pui-display-keymap
  (let ((m (make-keymap)))
    (suppress-keymap m)
    (set-keymap-name m 'pui-display-keymap)
    (define-key m "q" 'pui-quit)
    (define-key m "g" 'pui-list-packages)
    (define-key m " " 'pui-display-info)
    (define-key m "?" 'pui-help)
    (define-key m "v" 'pui-toggle-verbosity-redisplay)
    (define-key m "d" 'pui-toggle-verbosity-redisplay)
    (define-key m [return] 'pui-toggle-package-key)
    (define-key m "x" 'pui-install-selected-packages)
    (define-key m "I" 'pui-install-selected-packages)
    (define-key m "n" 'next-line)
    (define-key m "+" 'next-line)
    (define-key m "p" 'previous-line)
    (define-key m "-" 'previous-line)
    m)
  "Keymap to use in the `pui-info-buffer' buffer")

(defvar pui-package-keymap
  (let ((m (make-sparse-keymap)))
    (set-keymap-name m 'pui-package-keymap)
    (define-key m 'button2 'pui-toggle-package-event)
    (define-key m 'button3 'pui-toggle-package-event)
    m)
  "Keymap to use over package names/descriptions.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of variables


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configuration routines

(defun pui-directory-exists (dir)
  "Check to see if DIR exists in `package-get-remote'."
  (let (found)
    (mapcar '(lambda (item)
	       (if (and (null (car item))
			(string-equal (file-name-as-directory (car (cdr item)))
				      (file-name-as-directory dir)))
		   (setq found t))
	       ) package-get-remote)
    found
    ))

(defun pui-package-dir-list (buffer)
  "In BUFFER, format the list of package binary paths."
  (let ( (count 1) paths sys dir)
    (set-buffer buffer)
    (buffer-disable-undo buffer)
    (erase-buffer buffer)
    (insert "Existing package binary paths:\n\n")
    (setq paths package-get-remote)
    (while paths
      (setq sys (car (car paths))
	    dir (car (cdr (car paths))))
      (insert (format "%2s. " count))
      (if (null sys)
	  (insert dir)
	(insert sys ":" dir))
      (insert "\n")
      (setq count (1+ count))
      (setq paths (cdr paths))
      )
    (insert "\nThese are the places that will be searched for package binaries.\n")
    (goto-char (point-min))
    ))

;;;###autoload
(defun pui-add-install-directory (dir)
  "Add a new package binary directory to the head of `package-get-remote'.
Note that no provision is made for saving any changes made by this function.
It exists mainly as a convenience for one-time package installations from
disk."
  (interactive (let ( (tmpbuf (get-buffer-create
			       "*Existing Package Binary Paths*"))
		      dir)
		 (save-window-excursion
		   (save-excursion
		     (unwind-protect
			 (progn
			   (pui-package-dir-list tmpbuf)
			   (display-buffer tmpbuf)
			   (setq dir (read-directory-name
				      "New package binary directory to add? "
				      nil nil t))
			   )
		       (kill-buffer tmpbuf)
		       )))
		 (list dir)
		 ))
  (progn
    (if (not (pui-directory-exists dir))
	(progn
	  (setq package-get-remote (cons (list nil dir) package-get-remote))
	  (message "Package directory \"%s\" added." dir)
	  )
      (message "Directory \"%s\" already exists in `package-get-remote'." dir))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package list/installer routines

(defun pui-quit ()
  (interactive)
  (kill-buffer nil))

(defun pui-help ()
  (interactive)
  (let ( (help-buffer (get-buffer-create "*Help*")) )
    (display-buffer help-buffer t)
    (save-window-excursion
      (set-buffer help-buffer)
      (buffer-disable-undo help-buffer)
      (erase-buffer help-buffer)
      (insert (pui-help-string))
      )
    ))

(defun pui-package-symbol-char (pkg-sym version)
  (progn
    (if (package-get-info-find-package packages-package-list pkg-sym)
	(if (package-get-installedp pkg-sym version)
	    (list " " pui-up-to-date-package-face)
	  (list "*" pui-outdated-package-face))
      (list "-" pui-uninstalled-package-face))
    ))

(defun pui-update-package-display (extent &optional pkg-sym version)
  "Update the package status for EXTENT.
If PKG-SYM or VERSION are not given, they are read from the extent.
These are used to determine whether or not the package is installed,
and whether or not it is up-to-date."
  (let (buffer-read-only disp sym-char)
    (if (not pkg-sym)
	(setq pkg-sym (extent-property extent 'pui-package)))
    (if (not version)
	(setq version (package-get-info-prop (extent-property extent 'pui-info)
					     'version)))
    (if (member pkg-sym pui-selected-packages)
	(progn
	  (if pui-selected-package-face
	      (set-extent-face extent (get-face pui-selected-package-face))
	    (set-extent-face extent (get-face 'default)))
	  (setq sym-char "+")
	  )
      (progn
	(setq disp (pui-package-symbol-char pkg-sym version))
	(setq sym-char (car disp))
	(if (cdr disp)
	    (set-extent-face extent (car (cdr disp)))
	  (set-extent-face extent (get-face 'default)))
	))
    (save-excursion
      (goto-char (extent-start-position extent))
      (delete-char 1)
      (insert sym-char)
      (set-buffer-modified-p nil)
      )
    ))

(defun pui-toggle-package (extent)
  (let (pkg-sym)
    (setq pkg-sym (extent-property extent 'pui-package))
    (if (member pkg-sym pui-selected-packages)
	(setq pui-selected-packages
	      (delete pkg-sym pui-selected-packages))
      (setq pui-selected-packages
	    (cons pkg-sym pui-selected-packages)))
    (pui-update-package-display extent pkg-sym)
    ))

(defun pui-toggle-package-key ()
  "Select/unselect package for installation, using the keyboard."
  (interactive)
  (let (extent)
    (if (setq extent (extent-at (point) (current-buffer) 'pui))
	(progn
	  (pui-toggle-package extent)
	  (forward-line 1)
	  )
      (error "No package under cursor!"))
    ))

(defun pui-toggle-package-event (event)
  "Select/unselect package for installation, using the mouse."
  (interactive "e")
  (let* ( (ep (event-point event))
          (buffer (window-buffer (event-window event)))
          (extent (extent-at ep buffer 'pui-package))
          )
    (pui-toggle-package extent)
    ))

(defun pui-toggle-verbosity-redisplay ()
  "Toggle verbose package info."
  (interactive)
  (progn
    (setq pui-list-verbose (not pui-list-verbose))
    (pui-list-packages)
    ))

(defun pui-install-selected-packages ()
  "Install selected packages."
  (interactive)
  (let ( (tmpbuf "*Packages-To-Install*") do-install)
    (if pui-selected-packages
	(progn
	  ;; Don't change window config when asking the user if he really
	  ;; wants to install the packages.  We do this to avoid messing up
	  ;; the window configuration if errors occur (we don't want to
	  ;; display random buffers in addition to the error buffer, if
	  ;; errors occur, which would normally be caused by display-buffer).
	  (save-window-excursion
	    (with-output-to-temp-buffer tmpbuf
	      (display-completion-list (sort
					(mapcar '(lambda (pkg)
						   (symbol-name pkg)
						   )
						pui-selected-packages)
					'string<)
				       :activate-callback nil
				       :help-string "Packages selected for installation:\n"
				       :completion-string t
				       ))
	    (setq tmpbuf (get-buffer-create tmpbuf))
	    (display-buffer tmpbuf)
	    (setq do-install (y-or-n-p "Install these packages? "))
	    (kill-buffer tmpbuf)
	    )
	  (if do-install
	      (progn
		(save-excursion
		  ;; Clear old temp buffer history
		  (set-buffer (get-buffer-create package-admin-temp-buffer))
		  (buffer-disable-undo package-admin-temp-buffer)
		  (erase-buffer package-admin-temp-buffer)
		  )
		(message "Installing selected packages ...") (sit-for 0)
		(if (catch 'done
		      (mapcar (lambda (pkg)
				(if (not (package-get-all pkg nil))
				    (throw 'done nil)))
			      pui-selected-packages)
		      t)
		    (progn
		      (pui-list-packages)
		      (message "Packages installed")
		      ))
		)
	      (clear-message)
	      )
	  )
      (error "No packages have been selected!"))
    ))

(defun pui-help-echo (extent &optional force-update)
  "Display additional package info in the modeline.
EXTENT determines the package to display (the package information is
attached to the extent as properties)."
  (let (pkg-sym info inst-ver auth-ver date maintainer)
    (if (or force-update (not (current-message))
	    (string-match ".*: .*: " (current-message))
	    )
	(progn
	  (setq pkg-sym (extent-property extent 'pui-package)
		info (extent-property extent 'pui-info)
		inst-ver (package-get-key pkg-sym :version)
		auth-ver (package-get-info-prop info 'author-version)
		date (package-get-info-prop info 'date)
		maintainer (package-get-info-prop info 'maintainer))
	  (if (not inst-ver)
	      (setq inst-ver ""))
	  (if pui-list-verbose
	      (format "Author version: %-8s %11s: %s"
		      auth-ver date maintainer)
	    (format "%-6s: %-8s %11s: %s"
		    inst-ver auth-ver date maintainer))
	  ))
    ))

(defun pui-display-info (&optional no-error)
  "Display additional package info in the modeline.
Designed to be called interactively (from a keypress)."
  (interactive)
  (let (extent)
    (save-excursion
      (beginning-of-line)
      (if (setq extent (extent-at (point) (current-buffer) 'pui))
	  (message (pui-help-echo extent t))
	(if no-error
	    (clear-message nil)
	  (error "No package under cursor!")))
      )))

(defun pui-help-string ()
  "Return the help string for the package-info buffer.
This is not a defconst because of the call to substitute-command-keys."
  (save-excursion
    (set-buffer (get-buffer pui-info-buffer))
    (substitute-command-keys
"Symbols in the leftmost column:

  +	The package is marked for installation.
  -     The package has not been installed.
  *     The currently installed package is old, and a newer version is
	available.

Useful keys:

  `\\[pui-toggle-package-key]' to select/unselect the current package for installation.
  `\\[pui-install-selected-packages]' to install selected packages.
  `\\[pui-display-info]' to display additional information about the package in the modeline.
  `\\[pui-list-packages]' to refresh the package list.
  `\\[pui-toggle-verbosity-redisplay]' to toggle between a verbose and non-verbose display.
  `\\[pui-quit]' to kill this buffer.
")
    ))

;;;###autoload
(defun pui-list-packages ()
  "List all packages and package information.
The package name, version, and description are displayed.  From the displayed
buffer, the user can see which packages are installed, which are not, and
which are out-of-date (a newer version is available).  The user can then
select packages for installation via the keyboard or mouse."
  (interactive)
  (let ( (outbuf (get-buffer-create pui-info-buffer))
	 (sep-string "===============================================================================\n")
	 start )
    (message "Creating package list ...") (sit-for 0)
    (set-buffer outbuf)
    (setq buffer-read-only nil)
    (buffer-disable-undo outbuf)
    (erase-buffer outbuf)
    (use-local-map pui-display-keymap)
    (if pui-list-verbose
	(insert "                 Latest Installed
  Package name   Vers.  Vers.   Description
")
      (insert "                 Latest
  Package name   Vers.  Description
"))
    (insert sep-string)
    (setq start (point))
    (mapcar '(lambda (pkg)
	       (let (pkg-sym info version desc
			     b e extent current-vers disp)
		 (setq pkg-sym (car pkg)
		       info (package-get-info-version (cdr pkg) nil))
		 (setq version (package-get-info-prop info 'version)
		       desc (package-get-info-prop info 'description))

		 (setq disp (pui-package-symbol-char pkg-sym
						     version))
		 (setq b (point))
		 (if pui-list-verbose
		     (progn
		       (setq current-vers (package-get-key pkg-sym :version))
		       (cond
			( (not current-vers)
			  (setq current-vers "-----") )
			( (stringp current-vers)
			  (setq current-vers
				(format "%.2f"
					(string-to-number current-vers))) )
			( (numberp current-vers)
			  (setq current-vers (format "%.2f" current-vers)) )
			)
		       (insert
			(format "%s %-15s %-5.2f  %-5s  %s\n"
				(car disp) pkg-sym 
				(if (stringp version)
				    (string-to-number version)
				  version)
				current-vers desc))
;;		       (insert
;;			(format "\t\t  %-12s  %s\n"
;;				(package-get-info-prop info 'author-version)
;;				(package-get-info-prop info 'date)
;;				))
		       )
		   (insert (format "%s %-15s %-5s %s\n"
				   (car disp)
				   pkg-sym version desc)))
		 (save-excursion
		   (setq e (progn
			     (forward-line -1)
			     (end-of-line)
			     (point)))
		   )
		 (setq extent (make-extent b e))
		 (if (cdr disp)
		     (set-extent-face extent (car (cdr disp)))
		   (set-extent-face extent (get-face 'default)))
		 (set-extent-property extent 'highlight t)
		 (set-extent-property extent 'pui t)
		 (set-extent-property extent 'pui-package pkg-sym)
		 (set-extent-property extent 'pui-info info)
		 (set-extent-property extent 'help-echo 'pui-help-echo)
		 (set-extent-property extent 'keymap pui-package-keymap)
		 )) (sort (copy-sequence package-get-base)
			  '(lambda (a b)
			     (string< (symbol-name (car a))
				      (symbol-name (car b)))
			       )))
    (insert sep-string)
    (insert (pui-help-string))
    (set-buffer-modified-p nil)
    (setq buffer-read-only t)
    (pop-to-buffer outbuf)
    (delete-other-windows)
    (goto-char start)
    (setq pui-selected-packages nil)	; Reset list
    (clear-message)
;    (message (substitute-command-keys "Press `\\[pui-help]' for help."))
    ))

(provide 'package-ui)

;;; package-ui.el ends here
