;;; cleantree.el --- Remove out of date .elcs in lisp directories

;; Copyright (C) 1997 by Free Software Foundation, Inc.

;; Author: Steven L Baur <steve@altair.xemacs.org>
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

;; This code is derived from Gnus based on a suggestion by
;;  David Moore <dmoore@ucsd.edu>

;;; Code:

(defun remove-old-elc-1 (dir &optional seen)
  (setq dir (file-name-as-directory dir))
  ;; Only scan this sub-tree if we haven't been here yet.
  (unless (member (file-truename dir) seen)
    (push (file-truename dir) seen)
    ;; We descend recursively
    (let ((dirs (directory-files dir t nil t))
          dir)
      (while (setq dir (pop dirs))
        (when (and (not (member (file-name-nondirectory dir) '("." "..")))
                   (file-directory-p dir))
          (remove-old-elc-1 dir seen))))
    ;; Do this directory.
    (let ((files (directory-files dir t ".el$"))
	  file file-c)
      (while (setq file (car files))
	(setq files (cdr files))
	(setq file-c (concat file "c"))
	(when (and (file-exists-p file-c)
		   (file-newer-than-file-p file file-c))
	  (message file-c)
	  (delete-file file-c))))))

;;;###autoload
(defun batch-remove-old-elc ()
  (defvar command-line-args-left)
  (unless noninteractive
    (error "`batch-remove-old-elc' is to be used only with -batch"))
  (let ((dir (car command-line-args-left)))
    (message "Cleaning out of date .elcs in directory `%s'..." dir)
    (remove-old-elc-1 dir)
    (message "Cleaning out of date .elcs in directory `%s'...done" dir))
  (setq command-line-args-left nil))

;;; cleantree.el ends here
