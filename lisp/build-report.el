;;; build-report.el --- Automatically formatted build reports for XEmacs

;; Copyright (C) 1997 Adrian Aichner

;; Author: Adrian Aichner <adrian@xemacs.org>
;; Date: Sun., Apr. 20, 1997, 1998, 1999.
;; Version: 1.35
;; Keywords: internal

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
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

;;; Synched up with: Not synched.

;;; Commentary:

;; The Idea:
;; Let XEmacs report interesting aspects of how it was built.

;; The Concept:
;; User creates an XEmacs Build Report by just calling
;; M-x build-report
;; which will initialize a mail buffer with relevant information
;; derived from the XEmacs build process. Point is left at the
;; beginning of the report for user to input some personal notes and
;; send the report.

;; The Status:
;; This is the first `Proof of Concept'.

;; The Author:
;; Adrian Aichner, Teradyne GmbH Munich, Sun., Apr. 20, 1997.

;;; Code:

(require 'config)
(provide 'build-report)

;; Due to recommendation by developers on xemacs-beta@xemacs.org,
;; release versions are to be checked out using `co -u -kv ...'.
(defconst build-report-version
  "1.35"
  "Version number of build-report.")

(defgroup build-report nil
  "Package automating the process of sending XEmacs Build Reports."
  :group 'build)

(defcustom build-report-destination
  "xemacs-build-reports@xemacs.org"
  "The mail address XEmacs Build Reports should go to."
  :type 'string
  :group 'build-report)

(defcustom build-report-keep-regexp
  (list
   "make\\["
   "error"
   "warn"
   "pure.*\\(space\\|size\\)"
   "hides\\b"
   "strange"
   "shadowings"
   "^Compilation"
   "not\\s-+found")
  "Regexp of make process output lines to keep in the report."
  :type '(repeat regexp)
  :group 'build-report)

(defcustom build-report-delete-regexp
  (list
   "confl.*with.*auto-inlining"
   (concat (regexp-quote (gethash 'blddir (config-value-hash-table))) "/lisp/[^ \t\n]+ hides "))
  "Regexp of make process output lines to delete from the report."
  :type '(repeat regexp)
  :group 'build-report)

(defcustom build-report-make-output-file
  (concat (gethash 'blddir (config-value-hash-table)) "/beta.err")
  "Filename where stdout and stderr of XEmacs make process have been stored.
mk.err will not be created automatically. You'll have to run make with
output redirection. I use an alias
alias mk 'make \!* >>&\! \!$.err &'
for that, so that I get beta.err went I run `mk beta'."
  :type 'file
  :group 'build-report)

(defcustom build-report-installation-file
  (concat (gethash 'blddir (config-value-hash-table)) "/Installation")
  "Installation file produced by XEmacs configure process."
  :type 'file
  :group 'build-report)

(defcustom build-report-installation-insert-all nil
  "Tell build-report to insert the whole Installation file
instead of just the last report."
  :type 'boolean
  :group 'build-report)

(defcustom build-report-subject
  (concat "[%s] " emacs-version " on " system-configuration)
  "XEmacs Build Report Subject Line. %s-sequences will be substituted
with user input through `build-report' according to
`build-report-prompts' using `format'."
  :type 'string
  :group 'build-report)

(defcustom build-report-prompts
  '(("Status?: "  "Success" "Failure"))
  "XEmacs Build Report Prompt(s). This is a list of prompt-string
lists used by `build-report' in conjunction with
`build-report-subject'. Each list consists of a prompt string
followed by any number of strings which can be chosen via the history
mechanism."
  :group 'build-report)

(defcustom build-report-file-encoding
  "7bit"
  "XEmacs Build Report File Encoding to be used when MIME support is
available."
  :group 'build-report)

;; Symbol Name mappings from TM to SEMI serving as Compatibility
;; Bandaid
(when (featurep 'mime-setup)
  ;; No (defvaralias ...) so far. Thanks to "Didier Verna"
  ;; <verna@inf.enst.fr> for reporting my incorrect defvaraliasing of
  ;; `mime-editor/insert-tag'.
  ;; Thanks to Jens-Ulrik Holger Petersen
  ;; <petersen@kurims.kyoto-u.ac.jp> for suggesting the conditional
  ;; aliasing of SEMI functions.
  (unless (fboundp 'mime-edit-content-beginning)
    (defalias 'mime-edit-content-beginning 'mime-editor/content-beginning))
  (unless (fboundp 'mime-edit-insert-tag)
    (defalias 'mime-edit-insert-tag 'mime-editor/insert-tag))
  (unless (fboundp 'mime-edit-insert-binary-file)
    (defalias 'mime-edit-insert-binary-file
      'mime-editor/insert-binary-file)))

(defun build-report (&rest args)
  "Initializes a fresh mail composition buffer using `compose-mail'
with the contents of XEmacs Installation file and excerpts from XEmacs
make output and errors and leaves point at the beginning of the mail text.
 See also
`compose-mail', `mail-user-agent',
`build-report-destination',
`build-report-keep-regexp',
`build-report-delete-regexp',
`build-report-make-output-file' and
`build-report-installation-file'."
  (interactive
   (let (prompt
	 hist
	 arg
	 (prompts build-report-prompts))
     (progn
       (while prompts
	 (defvar hist)
	 (setq prompt (caar prompts))
	 (setq hist (cdar prompts))
	 (setq prompts (cdr prompts))
	 (setq arg (cons (read-string prompt "" 'hist) arg)))
       arg)))
  (save-excursion
    (compose-mail
     build-report-destination
     (apply 'format build-report-subject args)
     nil
     nil
     nil
     nil
     nil)
    (let ((report-begin (point)))
      (insert (build-report-insert-make-output report-begin))
      (insert (build-report-insert-installation-file
	       report-begin
	       build-report-installation-insert-all))
      (insert (build-report-insert-header report-begin))
      (goto-char report-begin))))

(defun build-report-insert-header (where)
  "Inserts the build-report-header at the point specified by `where'."
  (goto-char where)
  (with-temp-buffer
    (insert "\n> XEmacs Build Report as generated\n> by"
	    " build-report-version "
	    build-report-version " follows:\n\n")
    (buffer-string)))

(defun build-report-insert-make-output (where)
  "Inserts the output of the XEmacs Beta make run.
The make process output must have been saved in
`build-report-make-output-file' during the XEmacs Beta building."
  (goto-char where)
  (with-temp-buffer
    (if (file-exists-p build-report-make-output-file)
	(progn
	  (if (featurep 'mime-setup)
	      (progn
		(mime-edit-insert-tag
		 "text"
		 "plain" 
		 (concat
		  "\nContent-Disposition: attachment;"
		  " filename=\""
		  (file-name-nondirectory
		   build-report-make-output-file)
		  "\""))
		(mime-edit-insert-binary-file
		 build-report-make-output-file
		 build-report-file-encoding))
	    (insert-file-contents build-report-make-output-file))
	  (goto-char (point-min))
	  (delete-non-matching-lines (build-report-keep))
	  (goto-char (point-min))
	  (delete-matching-lines (build-report-delete))
	  (goto-char (point-min))
	  (insert "> Contents of " 
		  build-report-make-output-file
		  "\n> keeping lines matching\n> \""
		  (build-report-keep)
		  "\"\n> and then deleting lines matching\n> \""
		  (build-report-delete)
		  "\"\n\n"))
      (insert "> " build-report-make-output-file
	      " does not exist!\n\n"))
    (buffer-string)))
      
(defun build-report-insert-installation-file (where all)
  "Inserts the contents of the `build-report-installation-file'
created by the XEmacs Beta configure process."
  (goto-char where)
  (with-temp-buffer
    (if (file-exists-p build-report-installation-file)
	(let (file-begin last-configure)
	  (insert "> Contents of "
		  build-report-installation-file
		  ":\n")
	  (insert
	   (format
	    "> (Output from %s of ./configure)\n\n"
	    (if all "all runs" "most recent run")))
	  (if (featurep 'mime-setup)
	      (progn
		(mime-edit-insert-tag
		 "text"
		 "plain" 
		 (concat
		  "\nContent-Disposition: attachment;"
		  " filename=\""
		  (file-name-nondirectory
		   build-report-installation-file)
		  "\""))
		(mime-edit-insert-binary-file
		 build-report-installation-file
		 build-report-file-encoding)
		(setq file-begin (mime-edit-content-beginning)))
	    (setq file-begin (point))
	    (insert-file-contents
	     build-report-installation-file))
	  (unless all
	    (setq last-configure
		  (search-backward-regexp
		   "^\\(uname.*\\|osversion\\):\\s-+" file-begin t))
	    (if (and file-begin last-configure)
		(delete-region file-begin last-configure))))
      (insert "> " build-report-installation-file
	      " does not exist!\n\n"))
    (buffer-string)))

(defun build-report-keep ()
  "build-report-internal function of no general value."
  (mapconcat #'identity
	     (cons "^--\\[\\[\\|\\]\\]$" build-report-keep-regexp) "\\|"))

(defun build-report-delete ()
  "build-report-internal function of no general value."
  (mapconcat #'identity
	     build-report-delete-regexp "\\|"))

;;; build-report.el ends here
