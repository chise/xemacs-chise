;;; -*- coding: iso-8859-1 -*-

;; Copyright (C) 2000 Free Software Foundation, Inc.

;; Author: Yoshiki Hayashi  <yoshiki@xemacs.org>
;; Maintainer: Yoshiki Hayashi  <yoshiki@xemacs.org>
;; Created: 2000
;; Keywords: tests

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

;;; Synched up with: Not in FSF.

;;; Commentary:

;; Test regular expression.

(Check-Error-Message error "Trailing backslash"
		     (string-match "\\" "a"))
(Check-Error-Message error "Invalid preceding regular expression"
		     (string-match "a++" "a"))
(Check-Error-Message error "Invalid preceding regular expression"
		     (string-match "a**" "a"))
(Check-Error-Message error "Invalid preceding regular expression"
		     (string-match "a???" "a"))
(Check-Error-Message error "Unmatched \\[ or \\[^"
		     (string-match "[" "a"))
(Check-Error-Message error "Unmatched \\[ or \\[^"
		     (string-match "[abc" "a"))
(Check-Error-Message error "Unmatched ) or \\\\)"
		     (string-match "\\)" "a"))
(Check-Error-Message error "Invalid regular expression"
		     (string-match "\\(?.\\)" "a"))
(Check-Error-Message error "Unmatched \\\\{"
		     (string-match "a\\{" "a"))
(Check-Error-Message error "Invalid content of \\\\{\\\\}"
		     (string-match "a\\{a\\}" "a"))

;; exactn

;; string-match
(with-temp-buffer
  ;; case-insensitive
  (Assert (string-match "�" "�"))
  (Assert (string-match "�" "�"))
  (Assert (string-match "�" "�"))
  (Assert (string-match "�" "�"))
  ;; case-sensitive
  (setq case-fold-search nil)
  (Assert (string-match "�" "�"))
  (Assert (not (string-match "�" "�")))
  (Assert (string-match "�" "�"))
  (Assert (not (string-match "�" "�"))))

;; looking-at
(with-temp-buffer
  (insert "��")
  ;; case-insensitive
  (goto-char (point-min))
  (Assert (looking-at "�"))
  (Assert (looking-at "�"))
  (forward-char)
  (Assert (looking-at "�"))
  (Assert (looking-at "�"))
  ;; case-sensitive
  (setq case-fold-search nil)
  (goto-char (point-min))
  (Assert (looking-at "�"))
  (Assert (not (looking-at "�")))
  (forward-char)
  (Assert (not (looking-at "�")))
  (Assert (looking-at "�")))

;; re-search-forward and re-search-backward
(with-temp-buffer
  (insert "��")
  ;; case insensitive
  ;; forward
  (goto-char (point-min))
  ;; Avoid trivial regexp.
  (Assert (eq 2 (re-search-forward "�\\|a" nil t)))
  (goto-char (point-min))
  (Assert (eq 2 (re-search-forward "�\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (eq 3 (re-search-forward "�\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (eq 3 (re-search-forward "�\\|a" nil t)))
  ;; backward
  (goto-char (point-max))
  (Assert (eq 2 (re-search-backward "�\\|a" nil t)))
  (goto-char (point-max))
  (Assert (eq 2 (re-search-backward "�\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (eq 1 (re-search-backward "�\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (eq 1 (re-search-backward "�\\|a" nil t)))
  ;; case sensitive
  (setq case-fold-search nil)
  ;; forward
  (goto-char (point-min))
  (Assert (eq 2 (re-search-forward "�\\|a" nil t)))
  (goto-char (point-min))
  (Assert (eq 3 (re-search-forward "�\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (not (re-search-forward "�\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (eq 3 (re-search-forward "�\\|a" nil t)))
  ;; backward
  (goto-char (point-max))
  (Assert (eq 1 (re-search-backward "�\\|a" nil t)))
  (goto-char (point-max))
  (Assert (eq 2 (re-search-backward "�\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (eq 1 (re-search-backward "�\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (not (re-search-backward "�\\|a" nil t))))

;; duplicate
(with-temp-buffer
  ;; case insensitive
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  ;; case sensitive
  (setq case-fold-search nil)
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (not (string-match "^\\(�\\)\\1$" "��")))
  (Assert (not (string-match "^\\(�\\)\\1$" "��")))
  (Assert (not (string-match "^\\(�\\)\\1$" "��")))
  (Assert (not (string-match "^\\(�\\)\\1$" "��")))
  (Assert (not (string-match "^\\(�\\)\\1$" "��")))
  (Assert (string-match "^\\(�\\)\\1$" "��"))
  (Assert (not (string-match "^\\(�\\)\\1$" "��"))))

;; charset, charset_not
;; Not called because it takes too much time.
(defun test-regexp-charset-paranoid ()
  (let ((i 0)
	(max (expt 2 (if (featurep 'mule) 19 8)))
	(range "[a-z]")
	(range-not "[^a-z]")
	char string)
    (while (< i max)
      (when (setq char (int-to-char i))
	(setq string (char-to-string char))
	(if (or (and (<= 65 i)
		     (<= i 90))
		(and (<= 97 i)
		     (<= i 122)))
	    (progn
	      (Assert (string-match range string))
	      (Assert (not (string-match range-not string))))
	  (Assert (not (string-match range string)))
	  (Assert (string-match range-not string))))
      (setq i (1+ i)))))

;; (test-regexp-charset-paranoid)

;; charset_mule, charset_mule_not
;; Not called because it takes too much time.
(defun test-regex-charset-mule-paranoid ()
  (if (featurep 'mule)
      (let ((i 0)
	    (max (expt 2 19))
	    (range (format "[%c-%c]"
			   (make-char 'japanese-jisx0208 36 34)
			   (make-char 'japanese-jisx0208 36 42)))
	    (range-not (format "[^%c-%c]"
			       (make-char 'japanese-jisx0208 36 34)
			       (make-char 'japanese-jisx0208 36 42)))
	    (min-int (char-to-int (make-char 'japanese-jisx0208 36 34)))
	    (max-int (char-to-int (make-char 'japanese-jisx0208 36 42)))
	    char string)
	(while (< i max)
	  (when (setq char (int-to-char i))
	    (setq string (char-to-string char))
	    (if (and (<= min-int i)
		     (<= i max-int))
		(progn
		  (Assert (string-match range string))
		  (Assert (not (string-match range-not string))))
	      (Assert (not (string-match range string)))
	      (Assert (string-match range-not string))))
	  (setq i (1+ i))))))

;; (test-regex-charset-mule-paranoid)
