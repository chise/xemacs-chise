;; dump-paths.el --- set up XEmacs paths for dumping

;; Copyright (C) 1985, 1986, 1992, 1994, 1997 Free Software Foundation, Inc.

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
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Synched up with: Not in FSF

;;; Commentary:

;; This sets up the various paths for continuing loading files for
;; dumping.

(let ((debug-paths (or debug-paths
		      (and (getenv "EMACSDEBUGPATHS")
			   t)))
      (roots (paths-find-emacs-roots invocation-directory
				     invocation-name)))

  (if debug-paths
      (princ (format "XEmacs thinks the roots of its hierarchy are:\n%S\n"
		     roots)))

  (let ((stuff (packages-find-packages roots)))
    (setq late-packages (car (cdr stuff))))

  (setq late-package-load-path (packages-find-package-load-path late-packages))

  (if debug-paths
      (progn
	(princ (format "configure-package-path:\n%S\n" configure-package-path)
	       'external-debugging-output)
	(princ (format "late-packages and late-package-load-path:\n%S\n%S\n"
		       late-packages late-package-load-path)
	       'external-debugging-output)))

  (setq lisp-directory (paths-find-lisp-directory roots))
  (if debug-paths
      (princ (format "lisp-directory:\n%S\n" lisp-directory)
	     'external-debugging-output))
  (setq site-directory (and (null inhibit-site-lisp)
			    (paths-find-site-lisp-directory roots)))
  (if (and debug-paths (null inhibit-site-lisp))
      (princ (format "site-directory:\n%S\n" site-directory)
	     'external-debugging-output))

  (setq load-path (paths-construct-load-path roots
					     '()
					     late-package-load-path
					     '()
					     lisp-directory
					     site-directory)))

;;; dump-paths.el ends here
