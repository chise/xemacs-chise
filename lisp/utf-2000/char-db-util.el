;;; char-db-util.el --- Character Database utility

;; Copyright (C) 1998,1999,2000 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: UTF-2000, ISO/IEC 10646, Unicode, UCS-4, MULE.

;; This file is part of UTF-2000.

;; UTF-2000 is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; UTF-2000 is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Code:

(require 'alist)

(defconst unidata-normative-category-alist
  '(("Lu" letter	uppercase)
    ("Ll" letter	lowercase)
    ("Lt" letter	titlecase)
    ("Mn" mark		non-spacing)
    ("Mc" mark		spacing-combining)
    ("Me" mark		enclosing)
    ("Nd" number	decimal-digit)
    ("Nl" number	letter)
    ("No" number	other)
    ("Zs" separator	space)
    ("Zl" separator	line)
    ("Zp" separator	paragraph)
    ("Cc" other		control)
    ("Cf" other		format)
    ("Cs" other		surrogate)
    ("Co" other		private-use)
    ("Cn" other		not-assigned)))

(defconst unidata-informative-category-alist
  '(("Lm" letter	modifier)
    ("Lo" letter	other)
    ("Pc" punctuation	connector)
    ("Pd" punctuation	dash)
    ("Ps" punctuation	open)
    ("Pe" punctuation	close)
    ("Pi" punctuation	initial-quote)
    ("Pf" punctuation	final-quote)
    ("Po" punctuation	other)
    ("Sm" symbol	math)
    ("Sc" symbol	currency)
    ("Sk" symbol	modifier)
    ("So" symbol	other)
    ))

(defconst ideographic-radicals
  (let ((v (make-vector 215 nil))
	(i 1))
    (while (< i 215)
      (aset v i (int-char (+ #x2EFF i)))
      (setq i (1+ i)))
    (if (< (charset-iso-final-char (car (split-char (aref v 34)))) ?0)
	(aset v 34 (make-char 'chinese-gb2312 #x62 #x3A)))
    v))

(defun char-attribute-name< (ka kb)
  (cond
   ((find-charset ka)
    (cond
     ((find-charset kb)
      (cond
       ((= (charset-dimension ka)
	   (charset-dimension kb))
	(cond ((= (charset-chars ka)(charset-chars kb))
	       (cond
		((>= (charset-iso-final-char ka) ?@)
		 (if (>= (charset-iso-final-char kb) ?@)
		     (< (charset-iso-final-char ka)
			(charset-iso-final-char kb))
		   t))
		((>= (charset-iso-final-char ka) ?0)
		 (cond
		  ((>= (charset-iso-final-char kb) ?@)
		   nil)
		  ((>= (charset-iso-final-char kb) ?0)
		   (< (charset-iso-final-char ka)
		      (charset-iso-final-char kb)))
		  (t)))))
	      ((<= (charset-chars ka)(charset-chars kb)))))
       (t
	(< (charset-dimension ka)
	   (charset-dimension kb))
	)))
     ((symbolp kb)
      nil)
     (t
      t)))
   ((find-charset kb)
    t)
   ((symbolp ka)
    (cond ((symbolp kb)
	   (string< (symbol-name ka)
		    (symbol-name kb)))
	  (t)))
   ((symbolp kb)
    nil)))

(defun insert-char-data (char &optional readable
			      attributes ccs-attributes)
  (or attributes
      (setq attributes (sort (char-attribute-list) #'char-attribute-name<)))
  (or ccs-attributes
      (setq ccs-attributes (sort (charset-list) #'char-attribute-name<)))
  (let (name value has-long-ccs-name rest
	radical strokes)
    (save-restriction
      (narrow-to-region (point)(point))
      (insert "(define-char
  '(")
      (when (setq value (get-char-attribute char 'name))
	(insert (format
		 (if (> (length value) 47)
		     "(name . %S)
    "
		   "(name\t\t. %S)
    ")
		 value))
	(setq attributes (delq 'name attributes))
	)
      (when (setq value (get-char-attribute char 'script))
	(insert (format "(script\t\t%s)
    "
			(mapconcat (function prin1-to-string)
				   value " ")))
	(setq attributes (delq 'script attributes))
	)
      (when (setq value (get-char-attribute char '->ucs))
	(insert (format "(->ucs\t\t. #x%04X)\t; %c
    "
			value (decode-char 'ucs value)))
	(setq attributes (delq '->ucs attributes))
	)
      (when (setq value (get-char-attribute char 'general-category))
	(insert (format
		 "(general-category\t%s) ; %s
    "
		 (mapconcat (lambda (cell)
			      (format "%S" cell))
			    value " ")
		 (cond ((rassoc value unidata-normative-category-alist)
			"Normative Category")
		       ((rassoc value unidata-informative-category-alist)
			"Informative Category")
		       (t
			"Unknown Category"))))
	(setq attributes (delq 'general-category attributes))
	)
      (when (setq value (get-char-attribute char 'bidi-category))
	(insert (format "(bidi-category\t. %S)
    "
			value))
	(setq attributes (delq 'bidi-category attributes))
	)
      (when (setq value (get-char-attribute char 'mirrored))
	(insert (format "(mirrored\t\t. %S)
    "
			value))
	(setq attributes (delq 'mirrored attributes))
	)
      (cond
       ((setq value (get-char-attribute char 'decimal-digit-value))
	(insert (format "(decimal-digit-value . %S)
    "
			value))
	(setq attributes (delq 'decimal-digit-value attributes))
	(when (setq value (get-char-attribute char 'digit-value))
	  (insert (format "(digit-value\t . %S)
    "
			  value))
	  (setq attributes (delq 'digit-value attributes))
	  )
	(when (setq value (get-char-attribute char 'numeric-value))
	  (insert (format "(numeric-value\t . %S)
    "
			  value))
	  (setq attributes (delq 'numeric-value attributes))
	  )
	)
       (t
	(when (setq value (get-char-attribute char 'digit-value))
	  (insert (format "(digit-value\t. %S)
    "
			  value))
	  (setq attributes (delq 'digit-value attributes))
	  )
	(when (setq value (get-char-attribute char 'numeric-value))
	  (insert (format "(numeric-value\t. %S)
    "
			  value))
	  (setq attributes (delq 'numeric-value attributes))
	  )))
      (when (setq value (get-char-attribute char 'iso-10646-comment))
	(insert (format "(iso-10646-comment\t. %S)
    "
			value))
	(setq attributes (delq 'iso-10646-comment attributes))
	)
      (when (setq value (get-char-attribute char 'morohashi-daikanwa))
	(insert (format "(morohashi-daikanwa\t%s)
    "
			(mapconcat (function prin1-to-string) value " ")))
	(setq attributes (delq 'morohashi-daikanwa attributes))
	)
      (setq radical nil
	    strokes nil)
      (when (setq value (get-char-attribute char 'ideographic-radical))
	(setq radical value)
	(insert (format "(ideographic-radical . %S)\t; %c
    "
			radical
			(aref ideographic-radicals radical)))
	(setq attributes (delq 'ideographic-radical attributes))
	)
      (when (setq value (get-char-attribute char 'ideographic-strokes))
	(setq strokes value)
	(insert (format "(ideographic-strokes . %S)
    "
			strokes))
	(setq attributes (delq 'ideographic-strokes attributes))
	)
      (when (setq value (get-char-attribute char 'kangxi-radical))
	(unless (eq value radical)
	  (insert (format "(kangxi-radical\t . %S)\t; %c
    "
			  value
			  (aref ideographic-radicals value)))
	  (or radical
	      (setq radical value)))
	(setq attributes (delq 'kangxi-radical attributes))
	)
      (when (setq value (get-char-attribute char 'kangxi-strokes))
	(unless (eq value strokes)
	  (insert (format "(kangxi-strokes\t . %S)
    "
			  value))
	  (or strokes
	      (setq strokes value)))
	(setq attributes (delq 'kangxi-strokes attributes))
	)
      (when (setq value (get-char-attribute char 'japanese-radical))
	(unless (eq value radical)
	  (insert (format "(japanese-radical\t . %S)\t; %c
    "
			  value
			  (aref ideographic-radicals value)))
	  (or radical
	      (setq radical value)))
	(setq attributes (delq 'japanese-radical attributes))
	)
      (when (setq value (get-char-attribute char 'japanese-strokes))
	(unless (eq value strokes)
	  (insert (format "(japanese-strokes\t . %S)
    "
			  value))
	  (or strokes
	      (setq strokes value)))
	(setq attributes (delq 'japanese-strokes attributes))
	)
      (when (setq value (get-char-attribute char 'cns-radical))
	(insert (format "(cns-radical\t . %S)\t; %c
    "
			value
			(aref ideographic-radicals value)))
	(setq attributes (delq 'cns-radical attributes))
	)
      (when (setq value (get-char-attribute char 'cns-strokes))
	(unless (eq value strokes)
	  (insert (format "(cns-strokes\t . %S)
    "
			  value))
	  (or strokes
	      (setq strokes value)))
	(setq attributes (delq 'cns-strokes attributes))
	)
      (when (setq value (get-char-attribute char 'total-strokes))
	(insert (format "(total-strokes\t . %S)
    "
			value))
	(setq attributes (delq 'total-strokes attributes))
	)
      (when (setq value (get-char-attribute char '->ideograph))
	(insert (format "(->ideograph\t%s)
    "
			(mapconcat (lambda (code)
				     (cond ((symbolp code)
					    (symbol-name code))
					   ((integerp code)
					    (format "#x%04X" code))
					   (t
					    (format "\n     %S" code))))
				   value " ")))
	(setq attributes (delq '->ideograph attributes))
	)
      (when (setq value (get-char-attribute char '->decomposition))
	(insert (format "(->decomposition\t%s)
    "
			(mapconcat (lambda (code)
				     (cond ((symbolp code)
					    (symbol-name code))
					   ((characterp code)
					    (if readable
						(format "%S" code)
					      (format "#x%04X"
						      (char-int code))
					      ))
					   ((integerp code)
					    (format "#x%04X" code))
					   (t
					    (format "\n     %S" code))))
				   value " ")))
	(setq attributes (delq '->decomposition attributes))
	)
      (when (setq value (get-char-attribute char '->uppercase))
	(insert (format "(->uppercase\t%s)
    "
			(mapconcat (lambda (code)
				     (cond ((symbolp code)
					    (symbol-name code))
					   ((integerp code)
					    (format "#x%04X" code))
					   (t
					    (format "\n     %S" code))))
				   value " ")))
	(setq attributes (delq '->uppercase attributes))
	)
      (when (setq value (get-char-attribute char '->lowercase))
	(insert (format "(->lowercase\t%s)
    "
			(mapconcat (lambda (code)
				     (cond ((symbolp code)
					    (symbol-name code))
					   ((integerp code)
					    (format "#x%04X" code))
					   (t
					    (format "\n     %S" code))))
				   value " ")))
	(setq attributes (delq '->lowercase attributes))
	)
      (when (setq value (get-char-attribute char '->titlecase))
	(insert (format "(->titlecase\t%s)
    "
			(mapconcat (lambda (code)
				     (cond ((symbolp code)
					    (symbol-name code))
					   ((integerp code)
					    (format "#x%04X" code))
					   (t
					    (format "\n     %S" code))))
				   value " ")))
	(setq attributes (delq '->titlecase attributes))
	)
      (setq rest ccs-attributes)
      (while (and rest
		    (progn
		      (setq value (get-char-attribute char (car rest)))
		      (if value
			  (if (>= (length (symbol-name (car rest))) 19)
			      (progn
				(setq has-long-ccs-name t)
				nil)
			    t)
			t)))
	  (setq rest (cdr rest)))
      (while attributes
	(setq name (car attributes))
	(if (setq value (get-char-attribute char name))
	    (cond ((string-match "^->" (symbol-name name))
		   (insert
		    (format "(%-18s %s)
    "
			    name
			    (mapconcat (lambda (code)
					 (cond ((symbolp code)
						(symbol-name code))
					       ((integerp code)
						(format "#x%04X" code))
					       (t
						(format "\n     %S" code))))
				       value " "))))
		  ((consp value)
		   (insert (format "(%-18s %s)
    "
				   name
				   (mapconcat (function prin1-to-string)
					      value " "))))
		  ((eq name 'jisx0208-1978/4X)
		   (insert (format "(%-18s . #x%04X)
    "
				   name value)))
		  (t
		   (insert (format "(%-18s . %S)
    "
				   name value)))
		  ))
	(setq attributes (cdr attributes)))
      (while ccs-attributes
	(setq name (car ccs-attributes))
	(if (setq value (get-char-attribute char name))
	    (insert
	     (format
	      (if has-long-ccs-name
		  (if (memq name '(ideograph-daikanwa mojikyo))
		      "(%-26s . %05d)\t; %c
    "
		    "(%-26s . #x%X)\t; %c
    "
		    )
		(if (memq name '(ideograph-daikanwa mojikyo))
		    "(%-18s . %05d)\t; %c
    "
		  "(%-18s . #x%X)\t; %c
    "
		  ))
	      name
	      (if (= (charset-iso-graphic-plane name) 1)
		  (logior value
			  (cond ((= (charset-dimension name) 1)
				 #x80)
				((= (charset-dimension name) 2)
				 #x8080)
				((= (charset-dimension name) 3)
				 #x808080)
				(t 0)))
		value)
	      (decode-builtin-char name value))))
	(setq ccs-attributes (cdr ccs-attributes)))
      (insert "))\n")
      (goto-char (point-min))
      (while (re-search-forward "[ \t]+$" nil t)
	(replace-match ""))
      (goto-char (point-max))
      (tabify (point-min)(point-max))
      )))

;;;###autoload
(defun char-db-update-comment ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let (cdef table char)
      (while (re-search-forward "^[ \t]*\\(([^.()]+)\\)" nil t)
	(goto-char (match-beginning 1))
	(setq cdef (read (current-buffer)))
	(when (find-charset (car cdef))
	  (goto-char (match-end 0))
	  (setq char
		(if (and
		     (not (eq (car cdef) 'ideograph-daikanwa))
		     (or (memq (car cdef) '(ascii latin-viscii-upper
						  latin-viscii-lower
						  arabic-iso8859-6
						  japanese-jisx0213-1
						  japanese-jisx0213-2))
			 (= (char-int (charset-iso-final-char (car cdef)))
			    0)))
		    (apply (function make-char) cdef)
		  (if (setq table (charset-mapping-table (car cdef)))
		      (set-charset-mapping-table (car cdef) nil))
		  (prog1
		      (apply (function make-char) cdef)
		    (if table
			(set-charset-mapping-table (car cdef) table)))))
	  (when (not (or (< (char-int char) 32)
			 (and (<= 128 (char-int char))
			      (< (char-int char) 160))))
	    (delete-region (point) (point-at-eol))
	    (insert (format "\t; %c" char)))
	  )))))

(defun insert-char-data-with-variant (char &optional script printable)
  (insert-char-data char printable)
  (let ((variants (or (char-variants char)
		      (let ((ucs (get-char-attribute char '->ucs)))
			(if ucs
			    (delete char (char-variants (int-char ucs)))))))
	variant vs)
    (while variants
      (setq variant (car variants))
      (if (or (null script)
	      (null (setq vs (get-char-attribute variant 'script)))
	      (memq script vs))
	  (insert-char-data variant printable))
      (setq variants (cdr variants))
      )))

(defun insert-char-range-data (min max &optional script)
  (let ((code min)
	char)
    (while (<= code max)
      (setq char (int-char code))
      (insert-char-data-with-variant char script)
      (setq code (1+ code))
      )))

(defun write-char-range-data-to-file (min max file &optional script)
  (let ((coding-system-for-write 'utf-8))
    (with-temp-buffer
      (insert-char-range-data min max script)
      (write-region (point-min)(point-max) file))))

(defvar what-character-original-window-configuration)

;;;###autoload
(defun what-char-definition (char)
  (interactive (list (char-after)))
  (let ((buf (get-buffer-create "*Character Description*"))
	(the-buf (current-buffer))
	(win-conf (current-window-configuration)))
    (pop-to-buffer buf)
    (make-local-variable 'what-character-original-window-configuration)
    (setq what-character-original-window-configuration win-conf)
    (setq buffer-read-only nil)
    (erase-buffer)
    (condition-case err
	(progn
	  (insert-char-data-with-variant char nil 'printable)
          ;; (char-db-update-comment)
	  (set-buffer-modified-p nil)
	  (view-mode the-buf (lambda (buf)
			       (set-window-configuration
				what-character-original-window-configuration)
			       ))
	  (goto-char (point-min)))
      (error (progn
	       (set-window-configuration
		what-character-original-window-configuration)
	       (signal (car err) (cdr err)))))))

(provide 'char-db-util)

;;; char-db-util.el ends here
