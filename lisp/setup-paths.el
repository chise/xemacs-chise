;;; setup-paths.el --- setup various XEmacs paths

;; Copyright (C) 1985-1986, 1990, 1992-1997 Free Software Foundation, Inc.
;; Copyright (c) 1993, 1994 Sun Microsystems, Inc.
;; Copyright (C) 1995 Board of Trustees, University of Illinois

;; Author: Mike Sperber <sperber@informatik.uni-tuebingen.de>
;; Maintainer: XEmacs Development Team
;; Keywords: internal, dumped

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

;; This file is dumped with XEmacs.

;; This file describes and constructs the various paths into the
;; XEmacs hierarchy from a global viewpoint.

;; It requires find-paths.el and packages.el.

;;; Code:

(defvar paths-load-path-depth 1
  "Depth of load-path searches in core Lisp paths.")

(defvar paths-default-info-directories
  (list (paths-construct-path '("usr" "local" "info")
			      (char-to-string directory-sep-char))
	(paths-construct-path '("usr" "info")
			      (char-to-string directory-sep-char)))
  "Directories appended to the end of the info path by default.")

(defun paths-find-site-lisp-directory (roots)
  "Find the site Lisp directory of the XEmacs hierarchy."
  (paths-find-site-directory roots "site-lisp"
			     nil
			     configure-site-directory))

(defun paths-find-lisp-directory (roots)
  "Find the main Lisp directory of the XEmacs hierarchy."
  (paths-find-version-directory roots "lisp"
				nil
				configure-lisp-directory))

(defun paths-construct-load-path
  (roots early-package-load-path late-package-load-path last-package-load-path
	 lisp-directory
	 &optional site-lisp-directory)
  "Construct the load path."
  (let* ((envvar-value (getenv "EMACSLOADPATH"))
	 (env-load-path
	  (and envvar-value
	       (paths-decode-directory-path envvar-value 'drop-empties)))
	 (site-lisp-load-path
	  (and site-lisp-directory
	       (paths-find-recursive-load-path (list site-lisp-directory)
					       paths-load-path-depth)))
	 (lisp-load-path
	  (and lisp-directory
	       (paths-find-recursive-load-path (list lisp-directory)
					       paths-load-path-depth))))
    (append env-load-path
	    early-package-load-path
	    site-lisp-load-path
	    late-package-load-path
	    lisp-load-path
	    last-package-load-path)))

(defun paths-construct-info-path (roots early-packages late-packages last-packages)
  "Construct the info path."
  (let ((info-path-envval (getenv "INFOPATH")))
    (paths-uniq-append
     (append
      (let ((info-directory
	     (paths-find-version-directory roots "info"
					   nil
					   configure-info-directory)))
	(and info-directory
	     (list info-directory)))
      (packages-find-package-info-path early-packages)
      (packages-find-package-info-path late-packages)
      (packages-find-package-info-path last-packages)
      (and info-path-envval
	   (paths-decode-directory-path info-path-envval 'drop-empties)))
     (and (null info-path-envval)
	  (paths-uniq-append
	   (paths-directories-which-exist configure-info-path)
	   (paths-directories-which-exist paths-default-info-directories))))))

(defun paths-find-doc-directory (roots)
  "Find the documentation directory."
  (paths-find-architecture-directory roots "lib-src"))

(defun paths-find-lock-directory (roots)
  "Find the lock directory."
  (paths-find-site-directory roots "lock" "EMACSLOCKDIR" configure-lock-directory))

(defun paths-find-superlock-file (lock-directory)
  "Find the superlock file."
  (cond
   ((null lock-directory)
    nil)
   ((and configure-superlock-file
	 (file-directory-p (file-name-directory configure-superlock-file)))
    configure-superlock-file)
   (t
    (expand-file-name "!!!SuperLock!!!" lock-directory))))

(defun paths-find-exec-directory (roots)
  "Find the binary directory."
  (paths-find-architecture-directory roots "lib-src" configure-exec-directory))

(defun paths-construct-exec-path (roots exec-directory
				  early-packages late-packages last-packages)
  "Find the binary path."
  (append
   (let ((path-envval (getenv "PATH")))
     (if path-envval
	 (paths-decode-directory-path path-envval 'drop-empties)))
   (packages-find-package-exec-path early-packages)
   (packages-find-package-exec-path late-packages)
   (packages-find-package-exec-path last-packages)
   (let ((emacspath-envval (getenv "EMACSPATH")))
     (and emacspath-envval
	  (split-path emacspath-envval)))
   (and exec-directory
	(list exec-directory))))

(defun paths-find-data-directory (roots)
  "Find the data directory."
  (paths-find-version-directory roots "etc" "EMACSDATA" configure-data-directory))

(defun paths-construct-data-directory-list (data-directory
					    early-packages late-packages last-packages)
  "Find the data path."
  (append
   (packages-find-package-data-path early-packages)
   (packages-find-package-data-path late-packages)
   (packages-find-package-data-path last-packages)
   (list data-directory)))

;;; setup-paths.el ends here
