;; test-emacs.el --- Run Emacs Lisp test suites.

;;; Copyright (C) 1998 Free Software Foundation, Inc.

;; Author: Martin Buchholz
;; Keywords: testing

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
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Not in FSF

(defvar test-emacs-verbose
  (and (not noninteractive) (> (device-baud-rate) search-slow-speed))
  "*Non-nil means print messages describing progress of emacs-tester.")

(defvar test-emacs-current-file nil)

(defvar emacs-lisp-file-regexp (purecopy "\\.el$")
  "*Regexp which matches Emacs Lisp source files.")

(defun test-emacs-test-file (filename)
  "Test a file of Lisp code named FILENAME.
The output file's name is made by appending `c' to the end of FILENAME."
  ;;  (interactive "fTest file: ")
  (interactive
   (let ((file buffer-file-name)
	 (file-name nil)
	 (file-dir nil))
     (and file
	  (eq (cdr (assq 'major-mode (buffer-local-variables)))
	      'emacs-lisp-mode)
	  (setq file-name (file-name-nondirectory file)
		file-dir (file-name-directory file)))
     (list (read-file-name "Test file: " file-dir nil nil file-name))))
  ;; Expand now so we get the current buffer's defaults
  (setq filename (expand-file-name filename))

  ;; If we're testing a file that's in a buffer and is modified, offer
  ;; to save it first.
  (or noninteractive
      (let ((b (get-file-buffer (expand-file-name filename))))
	(if (and b (buffer-modified-p b)
		 (y-or-n-p (format "save buffer %s first? " (buffer-name b))))
	    (save-excursion (set-buffer b) (save-buffer)))))

  (if (or noninteractive test-emacs-verbose)
      (message "Testing %s..." filename))
  (let ((test-emacs-current-file filename)
	input-buffer)
    (save-excursion
      (setq input-buffer (get-buffer-create " *Test Input*"))
      (set-buffer input-buffer)
      (erase-buffer)
      (insert-file-contents filename)
      ;; Run hooks including the uncompression hook.
      ;; If they change the file name, then change it for the output also.
      (let ((buffer-file-name filename)
	    (default-major-mode 'emacs-lisp-mode)
	    (enable-local-eval nil))
        (normal-mode)
        (setq filename buffer-file-name)))
    (test-emacs-from-buffer input-buffer filename)
    (kill-buffer input-buffer)
    ))

(defun test-emacs-read-from-buffer (buffer)
  "Read forms from BUFFER, and turn it into a lambda test form."
  (let ((body nil))
    (goto-char (point-min) buffer)
    (condition-case nil
	(while t
	  (setq body (cons (read inbuffer) body)))
      (error nil))
    `(lambda ()
       (defvar passes)
       (defvar assertion-failures)
       (defvar other-failures)
       ,@(nreverse body))))

(defun test-emacs-from-buffer (inbuffer filename)
  "Run tests in buffer INBUFFER, visiting FILENAME."
  (let ((passes 0)
	(assertion-failures 0)
	(other-failures 0))
    (with-output-to-temp-buffer "*Test-Log*"
      (defmacro Assert (assertion)
	`(condition-case error
	     (progn
	       (assert ,assertion)
	       (princ (format "PASS: %S" (quote ,assertion)))
	       (terpri)
	       (incf passes))
	   (cl-assertion-failed
	    (princ (format "Assertion failed: %S" (quote ,assertion)))
	    (terpri)
	    (incf assertion-failures))
	   (t (princ "Error during test execution:\n\t")
	      (display-error error nil)
	      (terpri)
	      (incf other-failures)
	      )))

      (princ "Testing Interpreted Lisp\n\n")
      (funcall (test-emacs-read-from-buffer inbuffer))
      (princ "\nTesting Compiled Lisp\n\n")
      (funcall (byte-compile (test-emacs-read-from-buffer inbuffer)))
      (princ (format
	      "\nSUMMARY: %d passes, %d assertion failures, %d other failures\n"
	      passes
	      assertion-failures
	      other-failures))
      (let* ((total (+ passes assertion-failures other-failures))
	     (basename (file-name-nondirectory filename))
	     (summary-msg
	      (if (> total 0)
		  (format "%s: %d of %d (%d%%) tests successful."
			  basename passes total (/ (* 100 passes) total))
		(format "%s: No tests run" basename))))
	(message "%s" summary-msg))
      (fmakunbound 'Assert))))

(defvar test-emacs-results-point-max nil)
(defmacro displaying-emacs-test-results (&rest body)
  `(let ((test-emacs-results-point-max test-emacs-results-point-max))
     ;; Log the file name.
     (test-emacs-log-file)
     ;; Record how much is logged now.
     ;; We will display the log buffer if anything more is logged
     ;; before the end of BODY.
     (or test-emacs-results-point-max
	 (save-excursion
	   (set-buffer (get-buffer-create "*Test-Log*"))
	   (setq test-emacs-results-point-max (point-max))))
     (unwind-protect
	 (condition-case error-info
	     (progn ,@body)
	   (error
	    (test-emacs-report-error error-info)))
       (save-excursion
	 ;; If there were compilation warnings, display them.
	 (set-buffer "*Test-Log*")
	 (if (= test-emacs-results-point-max (point-max))
	     nil
	   (if temp-buffer-show-function
	       (let ((show-buffer (get-buffer-create "*Test-Log-Show*")))
		 (save-excursion
		   (set-buffer show-buffer)
		   (setq buffer-read-only nil)
		   (erase-buffer))
		 (copy-to-buffer show-buffer
				 (save-excursion
				   (goto-char test-emacs-results-point-max)
				   (forward-line -1)
				   (point))
				 (point-max))
		 (funcall temp-buffer-show-function show-buffer))
              (select-window
               (prog1 (selected-window)
                 (select-window (display-buffer (current-buffer)))
                 (goto-char test-emacs-results-point-max)
                 (recenter 1)))))))))

(defun batch-test-emacs-1 (file)
  (condition-case err
      (progn (test-emacs-test-file file) t)
    (error
     (princ ">>Error occurred processing ")
     (princ file)
     (princ ": ")
     (display-error err nil)
     (terpri)
     nil)))

(defun batch-test-emacs ()
  "Run `test-emacs' on the files remaining on the command line.
Use this from the command line, with `-batch';
it won't work in an interactive Emacs.
Each file is processed even if an error occurred previously.
For example, invoke \"xemacs -batch -f batch-test-emacs tests/*.el\""
  ;; command-line-args-left is what is left of the command line (from
  ;; startup.el)
  (defvar command-line-args-left)	;Avoid 'free variable' warning
  (if (not noninteractive)
      (error "`batch-test-emacs' is to be used only with -batch"))
  (let ((error nil)
	(debug-issue-ebola-notices 0))
    (loop for file in command-line-args-left
      do
      (if (file-directory-p (expand-file-name file))
	  (let ((files (directory-files file))
		source)
	    (while files
	      (if (and (string-match emacs-lisp-file-regexp (car files))
		       (not (auto-save-file-name-p (car files)))
		       (setq source (expand-file-name
				     (car files)
				     file))
		       (if (null (batch-test-emacs-1 source))
			   (setq error t)))
		  (setq files (cdr files)))))
	(if (null (batch-test-emacs-1 file))
	    (setq error t))))
    (message "Done")
    (kill-emacs (if error 1 0))))
