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
  (Assert (string-match "ä" "ä"))
  (Assert (string-match "ä" "Ä"))
  (Assert (string-match "Ä" "Ä"))
  (Assert (string-match "Ä" "ä"))
  ;; case-sensitive
  (setq case-fold-search nil)
  (Assert (string-match "ä" "ä"))
  (Assert (not (string-match "ä" "Ä")))
  (Assert (string-match "Ä" "Ä"))
  (Assert (not (string-match "Ä" "ä"))))

;; looking-at
(with-temp-buffer
  (insert "äÄ")
  ;; case-insensitive
  (goto-char (point-min))
  (Assert (looking-at "ä"))
  (Assert (looking-at "Ä"))
  (forward-char)
  (Assert (looking-at "ä"))
  (Assert (looking-at "Ä"))
  ;; case-sensitive
  (setq case-fold-search nil)
  (goto-char (point-min))
  (Assert (looking-at "ä"))
  (Assert (not (looking-at "Ä")))
  (forward-char)
  (Assert (not (looking-at "ä")))
  (Assert (looking-at "Ä")))

;; re-search-forward and re-search-backward
(with-temp-buffer
  (insert "äÄ")
  ;; case insensitive
  ;; forward
  (goto-char (point-min))
  ;; Avoid trivial regexp.
  (Assert (eq 2 (re-search-forward "ä\\|a" nil t)))
  (goto-char (point-min))
  (Assert (eq 2 (re-search-forward "Ä\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (eq 3 (re-search-forward "ä\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (eq 3 (re-search-forward "Ä\\|a" nil t)))
  ;; backward
  (goto-char (point-max))
  (Assert (eq 2 (re-search-backward "ä\\|a" nil t)))
  (goto-char (point-max))
  (Assert (eq 2 (re-search-backward "Ä\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (eq 1 (re-search-backward "ä\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (eq 1 (re-search-backward "Ä\\|a" nil t)))
  ;; case sensitive
  (setq case-fold-search nil)
  ;; forward
  (goto-char (point-min))
  (Assert (eq 2 (re-search-forward "ä\\|a" nil t)))
  (goto-char (point-min))
  (Assert (eq 3 (re-search-forward "Ä\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (not (re-search-forward "ä\\|a" nil t)))
  (goto-char (1+ (point-min)))
  (Assert (eq 3 (re-search-forward "Ä\\|a" nil t)))
  ;; backward
  (goto-char (point-max))
  (Assert (eq 1 (re-search-backward "ä\\|a" nil t)))
  (goto-char (point-max))
  (Assert (eq 2 (re-search-backward "Ä\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (eq 1 (re-search-backward "ä\\|a" nil t)))
  (goto-char (1- (point-max)))
  (Assert (not (re-search-backward "Ä\\|a" nil t))))

;; duplicate
(with-temp-buffer
  ;; case insensitive
  (Assert (string-match "^\\(ä\\)\\1$" "ää"))
  (Assert (string-match "^\\(ä\\)\\1$" "äÄ"))
  (Assert (string-match "^\\(ä\\)\\1$" "ÄÄ"))
  (Assert (string-match "^\\(ä\\)\\1$" "Ää"))
  (Assert (string-match "^\\(Ä\\)\\1$" "ää"))
  (Assert (string-match "^\\(Ä\\)\\1$" "äÄ"))
  (Assert (string-match "^\\(Ä\\)\\1$" "ÄÄ"))
  (Assert (string-match "^\\(Ä\\)\\1$" "Ää"))
  ;; case sensitive
  (setq case-fold-search nil)
  (Assert (string-match "^\\(ä\\)\\1$" "ää"))
  (Assert (not (string-match "^\\(ä\\)\\1$" "äÄ")))
  (Assert (not (string-match "^\\(ä\\)\\1$" "ÄÄ")))
  (Assert (not (string-match "^\\(ä\\)\\1$" "Ää")))
  (Assert (not (string-match "^\\(Ä\\)\\1$" "ää")))
  (Assert (not (string-match "^\\(Ä\\)\\1$" "äÄ")))
  (Assert (string-match "^\\(Ä\\)\\1$" "ÄÄ"))
  (Assert (not (string-match "^\\(Ä\\)\\1$" "Ää"))))

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

;; Test replace-match
(with-temp-buffer
  (insert "This is a test buffer.")
  (goto-char (point-min))
  (search-forward "this is a test ")
  (looking-at "Unmatchable text")
  (replace-match "")
  (Assert (looking-at "^buffer.$")))

;; Test that trivial regexps reset unused registers
;; Thanks to Martin Sternholm for the report.
;; xemacs-beta <5blm6h2ki5.fsf@lister.roxen.com>
(with-temp-buffer
  (insert "ab")
  (goto-char (point-min))
  (re-search-forward "\\(a\\)")
  ;; test the whole-match data, too -- one try scotched that, too!
  (Assert (string= (match-string 0) "a"))
  (Assert (string= (match-string 1) "a"))
  (re-search-forward "b")
  (Assert (string= (match-string 0) "b"))
  (Assert (not (match-string 1))))

;; Test word boundaries
(Assert (= (string-match " \\<a" " a") 0))
(Assert (= (string-match "a\\> " "a ") 0))
(Assert (= (string-match " \\ba" " a") 0))
(Assert (= (string-match "a\\b " "a ") 0))
(Assert (= (string-match "\\ba" " a") 1))
(Assert (= (string-match "a\\b" "a ") 0))
;; should work at target boundaries
(Assert (= (string-match "\\<a" "a") 0))
(Assert (= (string-match "a\\>" "a") 0))
(Assert (= (string-match "\\ba" "a") 0))
(Assert (= (string-match "a\\b" "a") 0))
;; but not if the "word" would be on the null side of the boundary!
(Assert (not (string-match "\\<" "")))
(Assert (not (string-match "\\>" "")))
(Assert (not (string-match " \\<" " ")))
(Assert (not (string-match "\\> " " ")))
(Assert (not (string-match "a\\<" "a")))
(Assert (not (string-match "\\>a" "a")))
;; Expect these to fail :-(
;; Added Known-Bug 2002-09-09
(Assert (not (string-match "\\b" "")))
(Assert (not (string-match " \\b" " ")))
(Assert (not (string-match "\\b " " ")))

;; Added 2002-12-27
(if (featurep 'mule)
    ;; note: (int-to-char 65) => ?A
    (let ((ch0 (make-char 'japanese-jisx0208 52 65))
	  (ch1 (make-char 'japanese-jisx0208 51 65)))
      (Assert (not (string-match "A" (string ch0))))
      (Assert (not (string-match "[A]" (string ch0))))
      (Assert (eq (string-match "[^A]" (string ch0)) 0))
      (Assert (not (string-match "@A" (string ?@ ch0))))
      (Assert (not (string-match "@[A]" (string ?@ ch0))))
      (Assert (eq (string-match "@[^A]" (string ?@ ch0)) 0))
      (Assert (not (string-match "@?A" (string ?@ ch0))))
      (Assert (not (string-match "A" (string ch1))))
      (Assert (not (string-match "[A]" (string ch1))))
      (Assert (eq (string-match "[^A]" (string ch1)) 0))
      (Assert (not (string-match "@A" (string ?@ ch1))))
      (Assert (not (string-match "@[A]" (string ?@ ch1))))
      (Assert (eq (string-match "@[^A]" (string ?@ ch1)) 0))
      (Assert (not (string-match "@?A" (string ?@ ch1))))))
