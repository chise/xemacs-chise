;;; package-admin.el --- Installation and Maintenance of XEmacs packages

;; Copyright (C) 1997 by Free Software Foundation, Inc.

;; Author: SL Baur <steve@altair.xemacs.org>
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

;;;###autoload
(defun package-admin-add-binary-package (file &optional pkg-dir)
  "Install a pre-bytecompiled XEmacs package into package hierarchy."
  (interactive "fPackage tarball: ")
  (when (null pkg-dir)
    (when (or (not (listp late-packages))
	      (not late-packages))
      (error "No package path"))
    (setq pkg-dir (car (last late-packages))))

  (let ((buf (get-buffer-create package-admin-temp-buffer)))
    (call-process "add-big-package.sh"
		  nil
		  buf
		  t
		  ;; rest of command line follows
		  package-admin-xemacs file pkg-dir)))

(provide 'package-admin)

;;; package-admin.el ends here
