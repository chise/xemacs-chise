;;; winnt.el --- Lisp routines for MS Windows.

;; Copyright (C) 1994 Free Software Foundation, Inc.

;; Maintainer: XEmacs Development Team
;; Keywords: mouse, dumped

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

;;; Synched up with: Not synched with FSF.  Almost completely divergent.

;;; Commentary:

;; This file is dumped with XEmacs for MS Windows (without cygwin).

;; Based on NT Emacs version by Geoff Voelker (voelker@cs.washington.edu)
;; Ported to XEmacs by Marc Paquette <marcpa@cam.org>
;; Largely modified by Kirill M. Katsnelson <kkm@kis.ru>

;;; Code:

;; The cmd.exe shell uses the "/c" switch instead of the "-c" switch
;; for executing its command line argument (from simple.el).
;; #### Oh if we had an alist of shells and their command switches.
(setq shell-command-switch "/c")

;; For appending suffixes to directories and files in shell
;; completions.  This screws up cygwin users so we leave it out for
;; now. Uncomment this if you only ever want to use cmd.

;(defun nt-shell-mode-hook ()
;  (setq comint-completion-addsuffix '("\\" . " ")
;	comint-process-echoes t))
;(add-hook 'shell-mode-hook 'nt-shell-mode-hook)

;; Use ";" instead of ":" as a path separator (from files.el).
(setq path-separator ";")

;; Set the null device (for compile.el).
;; #### There should be such a global thingy as null-device - kkm
(setq grep-null-device "NUL")

;; Set the grep regexp to match entries with drive letters.
(setq grep-regexp-alist
  '(("^\\(\\([a-zA-Z]:\\)?[^:( \t\n]+\\)[:( \t]+\\([0-9]+\\)[:) \t]" 1 3)))

;;----------------------------------------------------------------------
;; Autosave hack
;;--------------------

;; Avoid creating auto-save file names containing invalid characters
;; (primarily "*", eg. for the *mail* buffer).
;; Avoid "doc lost for function" warning
(defun original-make-auto-save-file-name (&optional junk)
  "You do not want to call this."
  )
(fset 'original-make-auto-save-file-name
      (symbol-function 'make-auto-save-file-name))

(defun make-auto-save-file-name ()
  "Return file name to use for auto-saves of current buffer.
Does not consider `auto-save-visited-file-name' as that variable is checked
before calling this function.  You can redefine this for customization.
See also `auto-save-file-name-p'."
  (let ((name (original-make-auto-save-file-name))
	(start 0))
    ;; destructively replace occurrences of * or ? with $
    (while (string-match "[?*]" name start)
      (aset name (match-beginning 0) ?$)
      (setq start (1+ (match-end 0))))
    name))

;;; winnt.el ends here
