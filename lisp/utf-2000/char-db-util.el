;;; char-db-util.el --- Character Database utility

;; Copyright (C) 1998, 1999 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
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

(defun insert-char-data (char)
  (let ((data (char-attribute-alist char))
	cell ret name has-long-ccs-name rest)
    (when data
      (save-restriction
	(narrow-to-region (point)(point))
	(insert "(define-char
  '(")
	(when (setq cell (assq 'name data))
	  (setq cell (cdr cell))
	  (insert (format
		   (if (> (length cell) 47)
		       "(name . %S)
    "
		     "(name\t\t. %S)
    ")
		   cell))
	  (setq data (del-alist 'name data))
	  )
	(when (setq cell (assq 'name data))
	  (setq cell (cdr cell))
	  (insert (format
		   (if (> (length cell) 47)
		       "(name . %S)
    "
		     "(name\t\t. %S)
    ")
		   cell))
	  (setq data (del-alist 'name data))
	  )
	(when (setq cell (assq 'ucs data))
	  (setq cell (cdr cell))
	  (insert (format "(ucs\t\t. #x%04X)
    "
			  cell))
	  (setq data (del-alist 'ucs data))
	  )
	(when (setq cell (assq '->ucs data))
	  (setq cell (cdr cell))
	  (insert (format "(->ucs\t\t. #x%04X)
    "
			  cell))
	  (setq data (del-alist '->ucs data))
	  )
	(when (setq cell (assq 'general-category data))
	  (setq ret (cdr cell))
	  (insert (format
		   "(general-category\t%s) ; %s
    "
		   (mapconcat (lambda (cell)
				(format "%S" cell))
			      ret " ")
		   (cond ((rassoc (cdr cell)
				  unidata-normative-category-alist)
			  "Normative Category")
			 ((rassoc (cdr cell)
				  unidata-informative-category-alist)
			  "Informative Category")
			 (t
			  "Unknown Category"))))
	  (setq data (del-alist 'general-category data))
	  )
	(when (setq cell (assq 'bidi-category data))
	  (setq cell (cdr cell))
	  (insert (format "(bidi-category\t. %S)
    "
			  cell))
	  (setq data (del-alist 'bidi-category data))
	  )
	(when (setq cell (assq 'mirrored data))
	  (setq cell (cdr cell))
	  (insert (format "(mirrored\t\t. %S)
    "
			  cell))
	  (setq data (del-alist 'mirrored data))
	  )
	(when (setq cell (assq 'decimal-digit-value data))
	  (setq cell (cdr cell))
	  (insert (format "(decimal-digit-value . %S)
    "
			  cell))
	  (setq data (del-alist 'decimal-digit-value data))
	  (when (setq cell (assq 'digit-value data))
	    (setq cell (cdr cell))
	    (insert (format "(digit-value\t . %S)
    "
			    cell))
	    (setq data (del-alist 'digit-value data))
	    )
	  (when (setq cell (assq 'numeric-value data))
	    (setq cell (cdr cell))
	    (insert (format "(numeric-value\t . %S)
    "
			    cell))
	    (setq data (del-alist 'numeric-value data))
	    )
	  )
	(setq data (sort data
			 (lambda (a b)
			   (let ((ka (car a))
				 (kb (car b)))
			     (cond ((find-charset ka)
				    (cond ((find-charset kb)
					   (cond ((= (charset-dimension ka)
						     (charset-dimension kb))
						  (< (charset-final ka)
						     (charset-final kb)))
						 (t
						  (< (charset-dimension ka)
						     (charset-dimension kb))
						  )))
					  (t)))
				   ((find-charset kb)
				    t)
				   ((symbolp ka)
				    (cond ((symbolp kb)
					   (string< (symbol-name ka)
						    (symbol-name kb)))
					  (t)))
				   ((symbolp kb)
				    nil))))))
	(setq rest data)
	(while (and rest
		    (progn
		      (setq cell (car rest))
		      (if (setq ret (find-charset (car cell)))
			  (if (>= (length (symbol-name (charset-name ret))) 19)
			      (progn
				(setq has-long-ccs-name t)
				nil)
			    t)
			t)))
	  (setq rest (cdr rest)))
	(while data
	  (setq cell (car data))
	  (cond ((setq ret (find-charset (car cell)))
		 (insert (format (if has-long-ccs-name
				     "(%-26s %s)
    "
				   "(%-18s %s)
    "
				   )
				 (charset-name ret)
				 (mapconcat (lambda (b)
					      (format "#x%02X" b)
					      )
					    (cdr cell) " "))))
		((string-match "^->" (symbol-name (car cell)))
		 (insert
		  (format "(%-18s %s)
    "
			  (car cell)
			  (mapconcat (lambda (code)
				       (cond ((symbolp code)
					      (symbol-name code))
					     ((integerp code)
					      (format "#x%04X" code))
					     (t
					      (format "\n     %S" code))))
				     (cdr cell) " "))))
		((consp (cdr cell))
		 (insert (format "%S
    "
				 cell)))
		(t
		 (insert (format "(%-18s . %S)
    "
				 (car cell)(cdr cell)))
		 ))
	  (setq data (cdr data)))
	(insert "))\n")
	(goto-char (point-min))
	(while (re-search-forward "[ \t]+$" nil t)
	  (replace-match ""))
	(goto-char (point-max))
	(tabify (point-min)(point-max))
	))))

(defun insert-char-range-data (min max)
  (let ((code min))
    (while (<= code max)
      (insert-char-data (int-char code))
      (setq code (1+ code))
      )))

(defun write-char-range-data-to-file (min max file)
  (with-temp-buffer
    (insert-char-range-data min max)
    (write-region (point-min)(point-max) file)))

(defun char-db-update-comment ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let (cdef table)
      (while (re-search-forward "^[ \t]*\\(([^.()]+)\\)" nil t)
	(goto-char (match-beginning 1))
	(setq cdef (read (current-buffer)))
	(when (find-charset (car cdef))
	  (goto-char (match-end 0))
	  (if (setq table (charset-mapping-table (car cdef)))
	      (set-charset-mapping-table (car cdef) nil))
	  (delete-region (point) (point-at-eol))
	  (insert (format "\t; %c" (apply #'make-char cdef)))
	  (if table
	      (set-charset-mapping-table (car cdef) table))
	  )))))

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
	  (insert-char-data char)
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
