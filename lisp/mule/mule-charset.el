;;; mule-charset.el --- Charset functions for Mule.
;; Copyright (C) 1992 Free Software Foundation, Inc.
;; Copyright (C) 1995 Amdahl Corporation.
;; Copyright (C) 1996 Sun Microsystems.

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


;;;; Composite character support

(defun compose-region (start end &optional buffer)
  "Compose characters in the current region into one composite character.
From a Lisp program, pass two arguments, START to END.
The composite character replaces the composed characters.
BUFFER defaults to the current buffer if omitted."
  (interactive "r")
  (let ((ch (make-composite-char (buffer-substring start end buffer))))
    (delete-region start end buffer)
    (insert-char ch nil nil buffer)))

(defun decompose-region (start end &optional buffer)
  "Decompose any composite characters in the current region.
From a Lisp program, pass two arguments, START to END.
This converts each composite character into one or more characters,
the individual characters out of which the composite character was formed.
Non-composite characters are left as-is.  BUFFER defaults to the current
buffer if omitted."
  (interactive "r")
  (save-excursion
    (set-buffer buffer)
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (let ((compcharset (get-charset 'composite)))
	(while (< (point) (point-max))
	  (let ((ch (char-after (point))))
	    (if (eq compcharset (char-charset ch))
		(progn
		  (delete-char 1)
		  (insert (composite-char-string ch))))))))))


;;;; Classifying text according to charsets

(defun charsets-in-region (start end &optional buffer)
  "Return a list of the charsets in the region between START and END.
BUFFER defaults to the current buffer if omitted."
  (let (list)
    (save-excursion
      (if buffer
	  (set-buffer buffer))
      (save-restriction
	(narrow-to-region start end)
	(goto-char (point-min))
	(while (not (eobp))
	  (let* (prev-charset
		 (ch (char-after (point)))
		 (charset (char-charset ch)))
	    (if (not (eq prev-charset charset))
		(progn
		  (setq prev-charset charset)
		  (or (memq charset list)
		      (setq list (cons charset list))))))
	  (forward-char))))
    list))

(defun charsets-in-string (string)
  "Return a list of the charsets in STRING."
  (let ((i 0)
 	(len (length string))
 	prev-charset charset list)
    (while (< i len)
      (setq charset (char-charset (aref string i)))
      (if (not (eq prev-charset charset))
 	  (progn
 	    (setq prev-charset charset)
 	    (or (memq charset list)
 		(setq list (cons charset list)))))
      (setq i (1+ i)))
    list))


;;;; Charset accessors

(defun charset-graphic (charset)
  "Return the `graphic' property of CHARSET.
See `make-charset'."
  (charset-property charset 'graphic))

(defun charset-final (charset)
  "Return the final byte of the ISO 2022 escape sequence designating CHARSET."
  (charset-property charset 'final))

(defun charset-chars (charset)
  "Return the number of characters per dimension of CHARSET."
  (charset-property charset 'chars))

(defun charset-columns (charset)
  "Return the number of display columns per character of CHARSET.
This only applies to TTY mode (under X, the actual display width can
be automatically determined)."
  (charset-property charset 'columns))

(defun charset-direction (charset)
  "Return the display direction (`l2r' or `r2l') of CHARSET."
  (charset-property charset 'direction))

(defun charset-registry (charset)
  "Return the registry of CHARSET.
This is a regular expression matching the registry field of fonts
that can display the characters in CHARSET."
  (charset-property charset 'registry))

(defun charset-ccl-program (charset)
  "Return the CCL program of CHARSET.
See `make-charset'."
  (charset-property charset 'ccl-program))

(defun charset-leading-byte (charset)
  "Return the leading byte of CHARSET.
See `make-charset'."
  (charset-property charset 'leading-byte))

;;;; Define setf methods for all settable Charset properties

(defsetf charset-registry    set-charset-registry)
(defsetf charset-ccl-program set-charset-ccl-program)
