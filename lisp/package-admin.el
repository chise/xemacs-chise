;;; package-admin.el --- Installation and Maintenance of XEmacs packages

;; Copyright (C) 1997 by Free Software Foundation, Inc.

;; Author: SL Baur <steve@xemacs.org>
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

;;; Commentary:

;; First pass at lisp front end to package maintenance.

;;; Code:

(require 'config)

(defvar package-admin-xemacs (concat invocation-directory invocation-name)
  "Location of XEmacs binary to use.")

(defvar package-admin-temp-buffer "*Package Output*"
  "Temporary buffer where output of backend commands is saved.")

(defvar package-admin-install-function (if (eq system-type 'windows-nt)
					   'package-admin-install-function-mswindows
					 'package-admin-default-install-function)
  "The function to call to install a package.
Three args are passed: FILENAME PKG-DIR BUFFER
Install package FILENAME into directory PKG-DIR, with any messages output
to buffer BUFFER.")

(defvar package-admin-error-messages '(
				       "No space left on device"
				       "No such file or directory"
				       "Filename too long"
				       "Read-only file system"
				       "File too large"
				       "Too many open files"
				       "Not enough space"
				       "Permission denied"
				       "Input/output error"
				       "Out of memory"
				       "Unable to create directory"
				       "Directory checksum error"
				       "Cannot exclusively open file"
				       "corrupted file"
				       "incomplete .* tree"
				       "Bad table"
				       "corrupt input"
				       "invalid compressed data"
				       "too many leaves in Huffman tree"
				       "not a valid zip file"
				       "first entry not deflated or stored"
				       "encrypted file --"
				       "unexpected end of file"
				       )
  "Regular expressions of possible error messages.
After each package extraction, the `package-admin-temp-buffer' buffer is
scanned for these messages.  An error code is returned if one of these are
found.

This is awful, but it exists because error return codes aren't reliable
under MS Windows.")

(defvar package-admin-tar-filename-regexps
  '(
    ;; GNU tar:
    ;; drwxrwxr-x john/doe 123 1997-02-18 15:48 pathname
    "\\S-+\\s-+[-a-z0-9_/]+\\s-+[0-9]+\\s-+[-0-9]+\\s-+[0-9:]+\\s-+\\(\\S-.*\\)"
    ;; HP-UX & SunOS tar:
    ;; rwxrwxr-x 501/501    123 Feb 18 15:46 1997 pathname
    ;; Solaris tar (phooey!):
    ;; rwxrwxr-x501/501    123 Feb 18 15:46 1997 pathname
    ;; AIX tar:
    ;; -rw-r--r-- 147 1019   32919 Mar 26 12:00:09 1992 pathname
    "\\S-+\\s-*[-a-z0-9_]+[/ ][-a-z0-9_]+\\s-+[0-9]+\\s-+[a-z][a-z][a-z]\\s-+[0-9]+\\s-+[0-9:]+\\s-+[0-9]+\\s-+\\(\\S-.*\\)"

    ;; djtar:
    ;; drwx Aug 31 02:01:41 1998       123 pathname
    "\\S-+\\s-+[a-z][a-z][a-z]\\s-+[0-9]+\\s-+[0-9:]+\\s-+[0-9]+\\s-+[0-9]+\\s-+\\(\\S-.*\\)"

    )
  "List of regexps to use to search for tar filenames.
Note that \"\\(\" and \"\\)\" must be used to delimit the pathname (as
match #1).  Don't put \"^\" to match the beginning of the line; this
is already implicit, as `looking-at' is used.  Filenames can,
unfortunately, contain spaces, so be careful in constructing any
regexps.")

(defvar package-install-hook nil
  "*List of hook functions to be called when a new package is successfully
installed. The hook function is passed two arguments: the package name, and
the install directory.")

(defvar package-delete-hook nil
  "*List of hook functions to be called when a package is deleted. The
hook is called *before* the package is deleted. The hook function is passed
two arguments: the package name, and the install directory.")

;;;###autoload
(defun package-admin-add-single-file-package (file destdir &optional pkg-dir)
  "Install a single file Lisp package into XEmacs package hierarchy.
`file' should be the full path to the lisp file to install.
`destdir' should be a simple directory name.
The optional `pkg-dir' can be used to override the default package hierarchy
\(car \(last late-packages))."
  (interactive "fLisp File: \nsDestination: ")
  (when (null pkg-dir)
    (setq pkg-dir (car (last late-packages))))
  (let ((destination (concat pkg-dir "/lisp/" destdir))
	(buf (get-buffer-create package-admin-temp-buffer)))
    (call-process "add-little-package.sh"
		  nil
		  buf
		  t
		  ;; rest of command line follows
		  package-admin-xemacs file destination)))

(defun package-admin-install-function-mswindows (file pkg-dir buffer)
  "Install function for mswindows."
  (let ((default-directory (file-name-as-directory pkg-dir)))
    (unless (file-directory-p default-directory)
      (make-directory default-directory t))
    (call-process "minitar" nil buffer t file)))

(defun package-admin-default-install-function (filename pkg-dir buffer)
  "Default function to install a package.
Install package FILENAME into directory PKG-DIR, with any messages output
to BUFFER."
  (let* ((pkg-dir (file-name-as-directory pkg-dir))
	 (default-directory pkg-dir)
	 (filename (expand-file-name filename)))
    (unless (file-directory-p pkg-dir)
      (make-directory pkg-dir t))
    ;; Don't assume GNU tar.
    (if (shell-command (concat "gunzip -c " filename " | tar xvf -") buffer)
	0
      1)
    ))

;  (call-process "add-big-package.sh"
;		nil
;		buffer
;		t
;		;; rest of command line follows
;		package-admin-xemacs file pkg-dir))

(defun package-admin-get-install-dir (package pkg-dir &optional mule-related)
  "If PKG-DIR is non-nil return that,
else return the current location of the package if it is already installed
or return a location appropriate for the package otherwise."
  (if pkg-dir
      pkg-dir
    (let ((package-feature (intern-soft (concat
					 (symbol-name package) "-autoloads")))
	  autoload-dir)
      (when (and (not (eq package 'unknown))
	         (featurep package-feature)
		 (setq autoload-dir (feature-file package-feature))
		 (setq autoload-dir (file-name-directory autoload-dir))
		 (member autoload-dir (append early-package-load-path late-package-load-path)))
	;; Find the corresponding entry in late-package
	(setq pkg-dir
	      (car-safe (member-if (lambda (h)
			   (string-match (concat "^" (regexp-quote h))
					 autoload-dir))
			 (append (cdr early-packages) late-packages)))))
      (if pkg-dir
	  pkg-dir
	;; Ok we need to guess
	(if mule-related
	    (package-admin-get-install-dir 'mule-base nil nil)
	  (if (eq package 'xemacs-base)
	      (car (last late-packages))
	    (package-admin-get-install-dir 'xemacs-base nil nil)))))))



(defun package-admin-get-manifest-file (pkg-topdir package)
  "Return the name of the MANIFEST file for package PACKAGE.
Note that PACKAGE is a symbol, and not a string."
  (let (dir)
    (setq dir (expand-file-name "pkginfo" pkg-topdir))
    (expand-file-name (concat "MANIFEST." (symbol-name package)) dir)
    ))

(defun package-admin-check-manifest (pkg-outbuf pkg-topdir)
  "Check for a MANIFEST.<package> file in the package distribution.
If it doesn't exist, create and write one.
PKG-OUTBUF is the buffer that holds the output from `tar', and PKG-TOPDIR
is the top-level directory under which the package was installed."
  (let ( (manifest-buf " *pkg-manifest*")
	 old-case-fold-search regexp package-name pathname regexps)
    ;; Save and restore the case-fold-search status.
    ;; We do this in case we have to screw with it (as it the case of
    ;; case-insensitive filesystems such as MS Windows).
    (setq old-case-fold-search case-fold-search)
    (unwind-protect
	(save-excursion				;; Probably redundant.
	  (set-buffer (get-buffer pkg-outbuf))	;; Probably already the
						;; current buffer.
	  (goto-char (point-min))

	  ;; Make filenames case-insensitive, if necessary
	  (if (eq system-type 'windows-nt)
	      (setq case-fold-search t))

	  ;; We really should compute the regexp.
	  ;; However, directory-sep-char is currently broken, but we need
	  ;; functional code *NOW*.
	  (setq regexp "\\bpkginfo[\\/]MANIFEST\\...*")

	  ;; Look for the manifest.
	  (if (not (re-search-forward regexp nil t))
	      (progn
		;; We didn't find a manifest.  Make one.

		;; Yuk.  We weren't passed the package name, and so we have
		;; to dig for it.  Look for it as the subdirectory name below
		;; "lisp", "man", "info", or "etc".
		;; Here, we don't use a single regexp because we want to search
		;; the directories for a package name in a particular order.
		;; The problem is that packages could have directories like
		;; "etc/sounds/" or "etc/photos/" and we don't want to get
		;; these confused with the actual package name (although, in
		;; the case of "etc/sounds/", it's probably correct).
		(if (catch 'done
		      (let ( (dirs '("lisp" "info" "man" "etc")) rexp)
			(while dirs
			  (setq rexp (concat "\\b" (car dirs)
					     "[\\/]\\([^\\/]+\\)[\//]"))
			  (if (re-search-forward rexp nil t)
			      (throw 'done t))
			  (setq dirs (cdr dirs))
			  )))
		    (progn
		      (setq package-name (buffer-substring (match-beginning 1)
							   (match-end 1)))

		      ;; Get and erase the manifest buffer
		      (setq manifest-buf (get-buffer-create manifest-buf))
		      (buffer-disable-undo manifest-buf)
		      (erase-buffer manifest-buf)

		      ;; Now, scan through the output buffer, looking for
		      ;; file and directory names.
		      (goto-char (point-min))
		      ;; for each line ...
		      (while (< (point) (point-max))
			(beginning-of-line)
			(setq pathname nil)

			;; scan through the regexps, looking for a pathname
			(if (catch 'found-path
			      (setq regexps package-admin-tar-filename-regexps)
			      (while regexps
				(if (looking-at (car regexps))
				    (progn
				      (setq pathname
					    (buffer-substring
					     (match-beginning 1)
					     (match-end 1)))
				      (throw 'found-path t)
				      ))
				(setq regexps (cdr regexps))
				)
			      )
			    (progn
			      ;; found a pathname -- add it to the manifest
			      ;; buffer
			      (save-excursion
				(set-buffer manifest-buf)
				(goto-char (point-max))
				(insert pathname "\n")
				)
			      ))
			(forward-line 1)
			)

		      ;; Processed all lines.
		      ;; Now, create the file, pkginfo/MANIFEST.<pkgname>

		      ;; We use `expand-file-name' instead of `concat',
		      ;; for portability.
		      (setq pathname (expand-file-name "pkginfo"
						       pkg-topdir))
		      ;; Create pkginfo, if necessary
		      (if (not (file-directory-p pathname))
			  (make-directory pathname))
		      (setq pathname (expand-file-name
				      (concat "MANIFEST." package-name)
				      pathname))
		      (save-excursion
			(set-buffer manifest-buf)
			;; Put the files in sorted order
			(sort-lines nil (point-min) (point-max))
			;; Write the file.
			;; Note that using `write-region' *BYPASSES* any check
			;; to see if XEmacs is currently editing/visiting the
			;; file.
			(write-region (point-min) (point-max) pathname)
			)
		      (kill-buffer manifest-buf)
		      )
		  (progn
		    ;; We can't determine the package name from an extracted
		    ;; file in the tar output buffer.
		    ))
		))
	  )
      ;; Restore old case-fold-search status
      (setq case-fold-search old-case-fold-search))
    ))

;;;###autoload
(defun package-admin-add-binary-package (file &optional pkg-dir)
  "Install a pre-bytecompiled XEmacs package into package hierarchy."
  (interactive "fPackage tarball: ")
  (let ((buf (get-buffer-create package-admin-temp-buffer))
	(status 1)
	start err-list
	)
    (setq pkg-dir (package-admin-get-install-dir 'unknown pkg-dir))
    ;; Ensure that the current directory doesn't change
    (save-excursion
      (set-buffer buf)
      ;; This is not really needed
      (setq default-directory (file-name-as-directory pkg-dir))
      (setq case-fold-search t)
      (buffer-disable-undo)
      (goto-char (setq start (point-max)))
      (if (= 0 (setq status (funcall package-admin-install-function
				     file pkg-dir buf)))
	  (progn
	    ;; First, check for errors.
	    ;; We can't necessarily rely upon process error codes.
	    (catch 'done
	      (goto-char start)
	      (setq err-list package-admin-error-messages)
	      (while err-list
		(if (re-search-forward (car err-list) nil t)
		    (progn
		      (setq status 1)
		      (throw 'done nil)
		      ))
		(setq err-list (cdr err-list))
		)
	      )
	    ;; Make sure that the MANIFEST file exists
	    (package-admin-check-manifest buf pkg-dir)
	    ))
      )
    status
    ))

(defun package-admin-rmtree (directory)
  "Delete a directory and all of its contents, recursively.
This is a feeble attempt at making a portable rmdir."
  (setq directory (file-name-as-directory directory))
  (let ((files (directory-files directory nil nil nil t))
        (dirs (directory-files directory nil nil nil 'dirs)))
    (while dirs
      (if (not (member (car dirs) '("." "..")))
          (let ((dir (expand-file-name (car dirs) directory)))
            (condition-case err
                (if (file-symlink-p dir) ;; just in case, handle symlinks
                    (delete-file dir)
                  (package-admin-rmtree dir))
              (file-error
               (message "%s: %s: \"%s\"" (nth 1 err) (nth 2 err) (nth 3 err)))))
        (setq dirs (cdr dirs))))
    (while files
      (condition-case err
          (delete-file (expand-file-name (car files) directory))
        (file-error
         (message "%s: %s: \"%s\"" (nth 1 err) (nth 2 err) (nth 3 err))))
      (setq files (cdr files)))
    (condition-case err
        (delete-directory directory)
      (file-error
       (message "%s: %s: \"%s\"" (nth 1 err) (nth 2 err) (nth 3 err))))))

(defun package-admin-get-lispdir  (pkg-topdir package)
  (let (package-lispdir)
    (if (and (setq package-lispdir (expand-file-name "lisp" pkg-topdir))
	     (setq package-lispdir (expand-file-name (symbol-name package)
						     package-lispdir))
	     (file-accessible-directory-p package-lispdir))
	package-lispdir)
    ))

(defun package-admin-delete-binary-package (package pkg-topdir)
  "Delete a binary installation of PACKAGE below directory PKG-TOPDIR.
PACKAGE is a symbol, not a string."
  (let ( (tmpbuf " *pkg-manifest*") manifest-file package-lispdir dirs file)
    (setq pkg-topdir (package-admin-get-install-dir package pkg-topdir))
    (setq manifest-file (package-admin-get-manifest-file pkg-topdir package))
    (run-hook-with-args 'package-delete-hook package pkg-topdir)
    (if (file-exists-p manifest-file)
	(progn
	  ;; The manifest file exists!  Use it to delete the old distribution.
	  (message "Removing old files for package \"%s\" ..." package)
	  (sit-for 0)
	  (setq tmpbuf (get-buffer-create tmpbuf))
	  (with-current-buffer tmpbuf
	    (buffer-disable-undo)
	    (erase-buffer)
	    (insert-file-contents manifest-file)
	    (goto-char (point-min))

	    ;; For each entry in the MANIFEST ...
	    (while (< (point) (point-max))
	      (beginning-of-line)
	      (setq file (expand-file-name (buffer-substring
					    (point)
					    (point-at-eol))
					   pkg-topdir))
	      (if (file-directory-p file)
		  ;; Keep a record of each directory
		  (setq dirs (cons file dirs))
		  ;; Delete each file.
		  ;; Make sure that the file is writable.
		  ;; (This is important under MS Windows.)
		  ;; I do not know why it important under MS Windows but
		  ;;    1. It bombs out when the file does not exist. This can be condition-cased
		  ;;    2. If I removed the write permissions, I do not want XEmacs to just ignore them.
		  ;;       If it wants to, XEmacs may ask, but that is about all
		  ;; (set-file-modes file 438) ;; 438 -> #o666
		  ;; Note, user might have removed the file!
		(condition-case ()
		    (delete-file file)
		  (error nil)))		;; We may want to turn the error into a Warning?
	      (forward-line 1))

	    ;; Delete empty directories.
	    (if dirs
		(let ( (orig-default-directory default-directory)
		       ;; directory files file
		       )
		  ;; Make sure we preserve the existing `default-directory'.
		  ;; JV, why does this change the default directory? Does it indeed?
		  (unwind-protect
		      (progn
			;; Warning: destructive sort!
			(setq dirs (nreverse (sort dirs 'string<)))
;			;; For each directory ...
;			(while dirs
;			  (setq directory (file-name-as-directory (car dirs)))
;			  (setq files (directory-files directory))
;			  ;; Delete the directory if it's empty.
;			  (if (catch 'done
;				(while files
;				  (setq file (car files))
;				  (if (and (not (string= file "."))
;					   (not (string= file "..")))
;				      (throw 'done nil))
;				  (setq files (cdr files))
;				  )
;				t)
;			      (
;			      (delete-directory directory))
;			  (setq dirs (cdr dirs))
;			  )
			;; JV, On all OS's that I know of delete-directory fails on
			;; on non-empty dirs anyway
			(mapc
			   (lambda (dir)
			     (condition-case ()
				 (delete-directory dir)))
			   dirs))
		    (setq default-directory orig-default-directory)
		    )))
	    )
	  (kill-buffer tmpbuf)
	  ;; Delete the MANIFEST file
	  ;; (set-file-modes manifest-file 438) ;; 438 -> #o666
	  ;; Note. Packages can have MANIFEST in MANIFEST.
	  (condition-case ()
	      (delete-file manifest-file)
	    (error nil)) ;; Do warning?
	  (message "Removing old files for package \"%s\" ... done" package))
	;; The manifest file doesn't exist.  Fallback to just deleting the
	;; package-specific lisp directory, if it exists.
	;;
	;; Delete old lisp directory, if any
	;; Gads, this is ugly.  However, we're not supposed to use `concat'
	;; in the name of portability.
	(when (setq package-lispdir (package-admin-get-lispdir pkg-topdir
							     package))
	      (message "Removing old lisp directory \"%s\" ..."
		       package-lispdir)
	      (sit-for 0)
	      (package-admin-rmtree package-lispdir)
	      (message "Removing old lisp directory \"%s\" ... done"
		       package-lispdir)
	      ))
    ;; Delete the package from the database of installed packages.
    (package-delete-name package)))

(provide 'package-admin)

;;; package-admin.el ends here
