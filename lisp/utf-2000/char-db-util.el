;;; char-db-util.el --- Character Database utility

;; Copyright (C) 1998,1999,2000,2001,2002,2003 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: UTF-2000, ISO/IEC 10646, Unicode, UCS-4, MULE.

;; This file is part of XEmacs UTF-2000.

;; XEmacs UTF-2000 is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs UTF-2000 is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs UTF-2000; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

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
      (aset v i (decode-char 'ucs (+ #x2EFF i)))
      (setq i (1+ i)))
    ;; (unless (charset-iso-final-char (car (split-char (aref v 34))))
    ;;   (aset v 34 (make-char 'chinese-gb2312 #x62 #x3A)))
    v))

(defvar char-db-ignored-attributes nil)

(defun char-attribute-name< (ka kb)
  (cond
   ((find-charset ka)
    (cond
     ((find-charset kb)
      (cond
       ((= (charset-dimension ka)
	   (charset-dimension kb))
	(cond ((= (charset-chars ka)(charset-chars kb))
	       (if (charset-iso-final-char ka)
		   (cond
		    ((>= (charset-iso-final-char ka) ?@)
		     (if (and (charset-iso-final-char kb)
			      (>= (charset-iso-final-char kb) ?@))
			 (< (charset-iso-final-char ka)
			    (charset-iso-final-char kb))
		       t))
		    (t
		     (if (charset-iso-final-char kb)
			 (if (>= (charset-iso-final-char kb) ?@)
			     nil
			   (< (charset-iso-final-char ka)
			      (charset-iso-final-char kb)))
		       t)))
		 (if (charset-iso-final-char kb)
		     nil
		   (< (charset-id ka)(charset-id kb)))))
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

(defvar char-db-coded-charset-priority-list
  '(ascii
    control-1
    latin-iso8859-1
    latin-iso8859-2
    latin-iso8859-3
    latin-iso8859-4
    latin-iso8859-9
    latin-jisx0201
    cyrillic-iso8859-5
    greek-iso8859-7
    thai-tis620
    =jis-x0208
    japanese-jisx0208
    japanese-jisx0212
    japanese-jisx0208-1978
    chinese-gb2312
    chinese-cns11643-1
    chinese-cns11643-2
    chinese-cns11643-3
    chinese-cns11643-4
    chinese-cns11643-5
    chinese-cns11643-6
    chinese-cns11643-7
    =jis-x0213-1-2000
    =jis-x0213-2-2000
    korean-ksc5601
    chinese-isoir165
    katakana-jisx0201
    hebrew-iso8859-8
    japanese-jisx0208-1990
    chinese-gb12345
    latin-viscii
    ethiopic-ucs
    =gt
    =big5-cdp
    =gt-k
    ideograph-daikanwa-2
    ideograph-daikanwa
    =cbeta
    ideograph-hanziku-1
    ideograph-hanziku-2
    ideograph-hanziku-3
    ideograph-hanziku-4
    ideograph-hanziku-5
    ideograph-hanziku-6
    ideograph-hanziku-7
    ideograph-hanziku-8
    ideograph-hanziku-9
    ideograph-hanziku-10
    ideograph-hanziku-11
    ideograph-hanziku-12
    =cbeta
    =jef-china3
    =big5-eten
    =big5))

(defun char-db-make-char-spec (char)
  (let (ret char-spec)
    (cond ((characterp char)
	   (cond ((and (setq ret (get-char-attribute char 'ucs))
		       (not (and (<= #xE000 ret)(<= ret #xF8FF))))
		  (setq char-spec (list (cons 'ucs ret)))
		  (cond ((setq ret (get-char-attribute char 'name))
			 (setq char-spec (cons (cons 'name ret) char-spec))
			 )
			((setq ret (get-char-attribute char 'name*))
			 (setq char-spec (cons (cons 'name* ret) char-spec))
			 ))
		  )
		 ((setq ret
			(catch 'tag
			  (let ((rest char-db-coded-charset-priority-list))
			    (while rest
			      (if (setq ret
					(get-char-attribute char (car rest)))
				  (throw 'tag (cons (car rest) ret)))
			      (setq rest (cdr rest))))))
		  (setq char-spec (list ret))
		  (dolist (ccs (delq (car ret) (charset-list)))
		    (if (and (or (charset-iso-final-char ccs)
				 (memq ccs
				       '(ideograph-daikanwa
					 ;; =gt-k
					 )))
			     (setq ret (get-char-attribute char ccs)))
			(setq char-spec (cons (cons ccs ret) char-spec))))
		  (if (null char-spec)
		      (setq char-spec (split-char char)))
		  (cond ((setq ret (get-char-attribute char 'name))
			 (setq char-spec (cons (cons 'name ret) char-spec))
			 )
			((setq ret (get-char-attribute char 'name*))
			 (setq char-spec (cons (cons 'name* ret) char-spec))
			 ))
		  ))
	   char-spec)
	  ((consp char)
	   char))))
    
(defun char-db-insert-char-spec (char &optional readable column)
  (unless column
    (setq column (current-column)))
  (let (char-spec ret al cal key temp-char)
    (setq char-spec (char-db-make-char-spec char))
    (unless (or (characterp char) ; char
		(condition-case nil
		    (setq char (find-char char-spec))
		  (error nil)))
      ;; define temporary character
      ;;   Current implementation is dirty.
      (setq temp-char (define-char (cons '(ideograph-daikanwa . 0)
					 char-spec)))
      (remove-char-attribute temp-char 'ideograph-daikanwa)
      (setq char temp-char))
    (setq al nil
	  cal nil)
    (while char-spec
      (setq key (car (car char-spec)))
      (unless (memq key char-db-ignored-attributes)
	(if (find-charset key)
	    (if (get-char-attribute char key)
		(setq cal (cons key cal)))
	  (setq al (cons key al))))
      (setq char-spec (cdr char-spec)))
    (unless cal
      (setq char-spec (char-db-make-char-spec char))
      (while char-spec
	(setq key (car (car char-spec)))
	(unless (memq key char-db-ignored-attributes)
	  (if (find-charset key)
	      (setq cal (cons key cal))
	    (setq al (cons key al))))
	(setq char-spec (cdr char-spec)))
      )
    (unless (or cal
		(memq 'ideographic-structure al))
      (push 'ideographic-structure al))
    (insert-char-attributes char
			    readable
			    (or al 'none) cal)
    (when temp-char
      ;; undefine temporary character
      ;;   Current implementation is dirty.
      (setq char-spec (char-attribute-alist temp-char))
      (while char-spec
	(remove-char-attribute temp-char (car (car char-spec)))
	(setq char-spec (cdr char-spec))))))

(defun char-db-insert-alist (alist &optional readable column)
  (unless column
    (setq column (current-column)))
  (let ((line-breaking
	 (concat "\n" (make-string (1+ column) ?\ )))
	name value
	ret al cal key
	lbs cell rest separator)
    (insert "(")
    (while alist
      (setq name (car (car alist))
	    value (cdr (car alist)))
      (cond ((eq name 'char)
	     (insert "(char . ")
	     (if (setq ret (condition-case nil
			       (find-char value)
			     (error nil)))
		 (progn
		   (setq al nil
			 cal nil)
		   (while value
		     (setq key (car (car value)))
		     (if (find-charset key)
			 (setq cal (cons key cal))
		       (setq al (cons key al)))
		     (setq value (cdr value)))
		   (insert-char-attributes ret
					   readable
					   (or al 'none) cal))
	       (insert (prin1-to-string value)))
	     (insert ")")
	     (insert line-breaking))
	    ((consp value)
	     (insert (format "(%-18s " name))
	     (setq lbs (concat "\n" (make-string (current-column) ?\ )))
	     (while (consp value)
	       (setq cell (car value))
	       (if (and (consp cell)
			(consp (car cell))
			(setq ret (condition-case nil
				      (find-char cell)
				    (error nil)))
			)
		   (progn
		     (setq rest cell
			   al nil
			   cal nil)
		     (while rest
		       (setq key (car (car rest)))
		       (if (find-charset key)
			   (setq cal (cons key cal))
			 (setq al (cons key al)))
		       (setq rest (cdr rest)))
		     (if separator
			 (insert lbs))
		     (insert-char-attributes ret
					     readable
					     al cal)
		     (setq separator lbs))
		 (if separator
		     (insert separator))
		 (insert (prin1-to-string cell))
		 (setq separator " "))
	       (setq value (cdr value)))
	     (insert ")")
	     (insert line-breaking))
	    (t
	     (insert (format "(%-18s . %S)%s"
			     name value
			     line-breaking))))
      (setq alist (cdr alist))))
  (insert ")"))

(defun char-db-insert-char-reference (plist &optional readable column)
  (unless column
    (setq column (current-column)))
  (let ((line-breaking
	 (concat "\n" (make-string (1+ column) ?\ )))
	(separator "")
	name value)
    (insert "(")
    (while plist
      (setq name (pop plist))
      (setq value (pop plist))
      (cond ((eq name :char)
	     (insert separator)
	     (insert ":char\t")
	     (cond ((numberp value)
		    (setq value (decode-char 'ucs value)))
                   ;; ((consp value)
                   ;;  (setq value (or (find-char value)
                   ;;                  value)))
		   )
	     (char-db-insert-char-spec value readable)
             (insert line-breaking)
	     (setq separator ""))
	    ((eq name :radical)
	     (insert (format "%s%s\t%d ; %c%s"
			     separator
			     name value
			     (aref ideographic-radicals value)
			     line-breaking))
	     (setq separator ""))
            (t
	     (insert (format "%s%s\t%S" separator name value))
	     (setq separator line-breaking)))
      ))
  (insert ")"))

(defun char-db-decode-isolated-char (ccs code-point)
  (let (ret)
    (setq ret
	  (cond ((eq ccs 'arabic-iso8859-6)
		 (decode-char ccs code-point))
		((and (memq ccs '(ideograph-gt-pj-1
				  ideograph-gt-pj-2
				  ideograph-gt-pj-3
				  ideograph-gt-pj-4
				  ideograph-gt-pj-5
				  ideograph-gt-pj-6
				  ideograph-gt-pj-7
				  ideograph-gt-pj-8
				  ideograph-gt-pj-9
				  ideograph-gt-pj-10
				  ideograph-gt-pj-11))
		      (setq ret (decode-char ccs code-point))
		      (setq ret (get-char-attribute ret '=gt)))
		 (decode-builtin-char '=gt ret))
		(t
		 (decode-builtin-char ccs code-point))))
    (cond ((and (<= 0 (char-int ret))
		(<= (char-int ret) #x1F))
	   (decode-char 'ucs (+ #x2400 (char-int ret))))
	  ((= (char-int ret) #x7F)
	   ?\u2421)
	  (t ret))))

(defvar char-db-convert-obsolete-format t)

(defun insert-char-attributes (char &optional readable
				    attributes ccs-attributes
				    column)
  (let (atr-d ccs-d)
    (setq attributes
	  (sort (if attributes
		    (if (consp attributes)
			(progn
			  (dolist (name attributes)
			    (unless (memq name char-db-ignored-attributes)
			      (push name atr-d)))
			  atr-d))
		  (dolist (name (char-attribute-list))
		    (unless (memq name char-db-ignored-attributes)
		      (if (find-charset name)
			  (push name ccs-d)
			(push name atr-d))))
		  atr-d)
		#'char-attribute-name<))
    (setq ccs-attributes
	  (sort (if ccs-attributes
		    (progn
		      (setq ccs-d nil)
		      (dolist (name ccs-attributes)
			(unless (memq name char-db-ignored-attributes)
			  (push name ccs-d)))
		      ccs-d)
		  (or ccs-d
		      (progn
			(dolist (name (charset-list))
			  (unless (memq name char-db-ignored-attributes)
			    (push name ccs-d)))
			ccs-d)))
		#'char-attribute-name<)))
  (unless column
    (setq column (current-column)))
  (let (name value has-long-ccs-name rest
	radical strokes
	(line-breaking
	 (concat "\n" (make-string (1+ column) ?\ )))
	lbs cell separator ret
	key al cal)
    (insert "(")
    (when (and (memq 'name attributes)
	       (setq value (get-char-attribute char 'name)))
      (insert (format
	       (if (> (+ (current-column) (length value)) 48)
		   "(name . %S)%s"
		 "(name               . %S)%s")
	       value line-breaking))
      (setq attributes (delq 'name attributes))
      )
    (when (and (memq 'name* attributes)
	       (setq value (get-char-attribute char 'name*)))
      (insert (format
	       (if (> (+ (current-column) (length value)) 48)
		   "(name* . %S)%s"
		 "(name*              . %S)%s")
	       value line-breaking))
      (setq attributes (delq 'name* attributes))
      )
    (when (and (memq 'script attributes)
	       (setq value (get-char-attribute char 'script)))
      (insert (format "(script\t\t%s)%s"
		      (mapconcat (function prin1-to-string)
				 value " ")
		      line-breaking))
      (setq attributes (delq 'script attributes))
      )
    (when (and (memq '=>ucs attributes)
	       (setq value (get-char-attribute char '=>ucs)))
      (insert (format "(=>ucs\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs value)
		      line-breaking))
      (setq attributes (delq '=>ucs attributes))
      )
    (when (and (memq '=>ucs* attributes)
	       (setq value (get-char-attribute char '=>ucs*)))
      (insert (format "(=>ucs*\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs value)
		      line-breaking))
      (setq attributes (delq '=>ucs* attributes))
      )
    (when (and (memq '=>ucs-gb attributes)
	       (setq value (get-char-attribute char '=>ucs-gb)))
      (insert (format "(=>ucs-gb\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs value)
		      line-breaking))
      (setq attributes (delq '=>ucs-gb attributes))
      )
    (when (and (memq '=>ucs-cns attributes)
	       (setq value (get-char-attribute char '=>ucs-cns)))
      (insert (format "(=>ucs-cns\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs-cns value)
		      line-breaking))
      (setq attributes (delq '=>ucs-cns attributes))
      )
    (when (and (memq '=>ucs-big5 attributes)
	       (setq value (get-char-attribute char '=>ucs-big5)))
      (insert (format "(=>ucs-big5\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs-big5 value)
		      line-breaking))
      (setq attributes (delq '=>ucs-big5 attributes))
      )
    (when (and (memq '=>ucs-jis attributes)
	       (setq value (get-char-attribute char '=>ucs-jis)))
      (insert (format "(=>ucs-jis\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs-jis value)
		      line-breaking))
      (setq attributes (delq '=>ucs-jis attributes))
      )
    (when (and (memq '=>ucs-ks attributes)
	       (setq value (get-char-attribute char '=>ucs-ks)))
      (insert (format "(=>ucs-ks\t\t. #x%04X)\t; %c%s"
		      value (decode-char 'ucs-ks value)
		      line-breaking))
      (setq attributes (delq '=>ucs-ks attributes))
      )
    (when (and (memq '->ucs attributes)
	       (setq value (get-char-attribute char '->ucs)))
      (insert (format (if char-db-convert-obsolete-format
			  "(=>ucs\t\t. #x%04X)\t; %c%s"
			"(->ucs\t\t. #x%04X)\t; %c%s")
		      value (decode-char 'ucs value)
		      line-breaking))
      (setq attributes (delq '->ucs attributes))
      )
    (when (and (memq 'general-category attributes)
	       (setq value (get-char-attribute char 'general-category)))
      (insert (format
	       "(general-category\t%s) ; %s%s"
	       (mapconcat (lambda (cell)
			    (format "%S" cell))
			  value " ")
	       (cond ((rassoc value unidata-normative-category-alist)
		      "Normative Category")
		     ((rassoc value unidata-informative-category-alist)
		      "Informative Category")
		     (t
		      "Unknown Category"))
	       line-breaking))
      (setq attributes (delq 'general-category attributes))
      )
    (when (and (memq 'bidi-category attributes)
	       (setq value (get-char-attribute char 'bidi-category)))
      (insert (format "(bidi-category\t. %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'bidi-category attributes))
      )
    (unless (or (not (memq 'mirrored attributes))
		(eq (setq value (get-char-attribute char 'mirrored 'empty))
		    'empty))
      (insert (format "(mirrored\t\t. %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'mirrored attributes))
      )
    (cond
     ((and (memq 'decimal-digit-value attributes)
	   (setq value (get-char-attribute char 'decimal-digit-value)))
      (insert (format "(decimal-digit-value . %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'decimal-digit-value attributes))
      (when (and (memq 'digit-value attributes)
		 (setq value (get-char-attribute char 'digit-value)))
	(insert (format "(digit-value\t . %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'digit-value attributes))
	)
      (when (and (memq 'numeric-value attributes)
		 (setq value (get-char-attribute char 'numeric-value)))
	(insert (format "(numeric-value\t . %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'numeric-value attributes))
	)
      )
     (t
      (when (and (memq 'digit-value attributes)
		 (setq value (get-char-attribute char 'digit-value)))
	(insert (format "(digit-value\t. %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'digit-value attributes))
	)
      (when (and (memq 'numeric-value attributes)
		 (setq value (get-char-attribute char 'numeric-value)))
	(insert (format "(numeric-value\t. %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'numeric-value attributes))
	)))
    (when (and (memq 'iso-10646-comment attributes)
	       (setq value (get-char-attribute char 'iso-10646-comment)))
      (insert (format "(iso-10646-comment\t. %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'iso-10646-comment attributes))
      )
    (when (and (memq 'morohashi-daikanwa attributes)
	       (setq value (get-char-attribute char 'morohashi-daikanwa)))
      (insert (format "(morohashi-daikanwa\t%s)%s"
		      (mapconcat (function prin1-to-string) value " ")
		      line-breaking))
      (setq attributes (delq 'morohashi-daikanwa attributes))
      )
    (setq radical nil
	  strokes nil)
    (when (and (memq 'ideographic-radical attributes)
	       (setq value (get-char-attribute char 'ideographic-radical)))
      (setq radical value)
      (insert (format "(ideographic-radical . %S)\t; %c%s"
		      radical
		      (aref ideographic-radicals radical)
		      line-breaking))
      (setq attributes (delq 'ideographic-radical attributes))
      )
    (when (and (memq 'ideographic-strokes attributes)
	       (setq value (get-char-attribute char 'ideographic-strokes)))
      (setq strokes value)
      (insert (format "(ideographic-strokes . %S)%s"
		      strokes
		      line-breaking))
      (setq attributes (delq 'ideographic-strokes attributes))
      )
    (when (and (memq 'kangxi-radical attributes)
	       (setq value (get-char-attribute char 'kangxi-radical)))
      (unless (eq value radical)
	(insert (format "(kangxi-radical\t . %S)\t; %c%s"
			value
			(aref ideographic-radicals value)
			line-breaking))
	(or radical
	    (setq radical value)))
      (setq attributes (delq 'kangxi-radical attributes))
      )
    (when (and (memq 'kangxi-strokes attributes)
	       (setq value (get-char-attribute char 'kangxi-strokes)))
      (unless (eq value strokes)
	(insert (format "(kangxi-strokes\t . %S)%s"
			value
			line-breaking))
	(or strokes
	    (setq strokes value)))
      (setq attributes (delq 'kangxi-strokes attributes))
      )
    (when (and (memq 'japanese-radical attributes)
	       (setq value (get-char-attribute char 'japanese-radical)))
      (unless (eq value radical)
	(insert (format "(japanese-radical\t . %S)\t; %c%s"
			value
			(aref ideographic-radicals value)
			line-breaking))
	(or radical
	    (setq radical value)))
      (setq attributes (delq 'japanese-radical attributes))
      )
    (when (and (memq 'japanese-strokes attributes)
	       (setq value (get-char-attribute char 'japanese-strokes)))
      (unless (eq value strokes)
	(insert (format "(japanese-strokes\t . %S)%s"
			value
			line-breaking))
	(or strokes
	    (setq strokes value)))
      (setq attributes (delq 'japanese-strokes attributes))
      )
    (when (and (memq 'cns-radical attributes)
	       (setq value (get-char-attribute char 'cns-radical)))
      (insert (format "(cns-radical\t . %S)\t; %c%s"
		      value
		      (aref ideographic-radicals value)
		      line-breaking))
      (setq attributes (delq 'cns-radical attributes))
      )
    (when (and (memq 'cns-strokes attributes)
	       (setq value (get-char-attribute char 'cns-strokes)))
      (unless (eq value strokes)
	(insert (format "(cns-strokes\t . %S)%s"
			value
			line-breaking))
	(or strokes
	    (setq strokes value)))
      (setq attributes (delq 'cns-strokes attributes))
      )
    (when (and (memq 'shinjigen-1-radical attributes)
	       (setq value (get-char-attribute char 'shinjigen-1-radical)))
      (unless (eq value radical)
	(insert (format "(shinjigen-1-radical . %S)\t; %c%s"
			value
			(aref ideographic-radicals value)
			line-breaking))
	(or radical
	    (setq radical value)))
      (setq attributes (delq 'shinjigen-1-radical attributes))
      )
    (when (and (memq 'ideographic- attributes)
	       (setq value (get-char-attribute char 'ideographic-)))
      (insert "(ideographic-       ")
      (setq lbs (concat "\n" (make-string (current-column) ?\ ))
	    separator nil)
      (while (consp value)
	(setq cell (car value))
	(if (integerp cell)
	    (setq cell (decode-char 'ucs cell)))
	(cond ((characterp cell)
	       (if separator
		   (insert lbs))
	       (if readable
		   (insert (format "%S" cell))
		 (char-db-insert-char-spec cell readable))
	       (setq separator lbs))
	      ((consp cell)
	       (if separator
		   (insert lbs))
	       (if (consp (car cell))
		   (char-db-insert-char-spec cell readable)
		 (char-db-insert-char-reference cell readable))
	       (setq separator lbs))
	      (t
	       (if separator
		   (insert separator))
	       (insert (prin1-to-string cell))
	       (setq separator " ")))
	(setq value (cdr value)))
      (insert ")")
      (insert line-breaking)
      (setq attributes (delq 'ideographic- attributes)))
    (when (and (memq 'total-strokes attributes)
	       (setq value (get-char-attribute char 'total-strokes)))
      (insert (format "(total-strokes       . %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'total-strokes attributes))
      )
    (when (and (memq '->ideograph attributes)
	       (setq value (get-char-attribute char '->ideograph)))
      (insert (format "(->ideograph\t%s)%s"
		      (mapconcat (lambda (code)
				   (cond ((symbolp code)
					  (symbol-name code))
					 ((integerp code)
					  (format "#x%04X" code))
					 (t
					  (format "%s %S"
						  line-breaking code))))
				 value " ")
		      line-breaking))
      (setq attributes (delq '->ideograph attributes))
      )
    (when (and (memq '->decomposition attributes)
	       (setq value (get-char-attribute char '->decomposition)))
      (insert (format "(->decomposition\t%s)%s"
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
					  (format "%s%S" line-breaking code))))
				 value " ")
		      line-breaking))
      (setq attributes (delq '->decomposition attributes))
      )
    (if (equal (get-char-attribute char '->titlecase)
	       (get-char-attribute char '->uppercase))
	(setq attributes (delq '->titlecase attributes)))
    (when (and (memq '->mojikyo attributes)
	       (setq value (get-char-attribute char '->mojikyo)))
      (insert (format "(->mojikyo\t\t. %06d)\t; %c%s"
		      value (decode-char 'mojikyo value)
		      line-breaking))
      (setq attributes (delq '->mojikyo attributes))
      )
    (when (and (memq 'hanyu-dazidian-vol attributes)
	       (setq value (get-char-attribute char 'hanyu-dazidian-vol)))
      (insert (format "(hanyu-dazidian-vol  . %d)%s"
		      value line-breaking))
      (setq attributes (delq 'hanyu-dazidian-vol attributes))
      )
    (when (and (memq 'hanyu-dazidian-page attributes)
	       (setq value (get-char-attribute char 'hanyu-dazidian-page)))
      (insert (format "(hanyu-dazidian-page . %d)%s"
		      value line-breaking))
      (setq attributes (delq 'hanyu-dazidian-page attributes))
      )
    (when (and (memq 'hanyu-dazidian-char attributes)
	       (setq value (get-char-attribute char 'hanyu-dazidian-char)))
      (insert (format "(hanyu-dazidian-char . %d)%s"
		      value line-breaking))
      (setq attributes (delq 'hanyu-dazidian-char attributes))
      )
    (unless readable
      (when (memq '->ucs-variants attributes)
	(setq attributes (delq '->ucs-variants attributes))
	)
      (when (memq 'composition attributes)
	(setq attributes (delq 'composition attributes))
	))
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
	  (cond ((eq name 'jisx0208-1978/4X)
		 (insert (format "(%-18s . #x%04X)%s"
				 name value
				 line-breaking)))
		((or (eq name 'ideographic-structure)
		     (eq name 'ideographic-)
		     (string-match "^\\(->\\|<-\\)" (symbol-name name)))
		 (insert (format "(%-18s%s " name line-breaking))
		 (setq lbs (concat "\n" (make-string (current-column) ?\ ))
		       separator nil)
		 (while (consp value)
		   (setq cell (car value))
                   (if (integerp cell)
		       (setq cell (decode-char 'ucs cell)))
		   (cond ((characterp cell)
			  (if separator
			      (insert lbs))
			  (if readable
			      (insert (format "%S" cell))
			    (char-db-insert-char-spec cell readable))
			  (setq separator lbs))
			 ((consp cell)
			  (if separator
			      (insert lbs))
			  (if (consp (car cell))
			      (char-db-insert-char-spec cell readable)
			    (char-db-insert-char-reference cell readable))
			  (setq separator lbs))
			 (t
			  (if separator
			      (insert separator))
			  (insert (prin1-to-string cell))
			  (setq separator " ")))
		   (setq value (cdr value)))
		 (insert ")")
		 (insert line-breaking))
		((memq name '(ideograph=
			      original-ideograph-of
			      ancient-ideograph-of
			      vulgar-ideograph-of
			      wrong-ideograph-of
			      simplified-ideograph-of
			      ideographic-variants
			      ideographic-different-form-of))
		 (insert (format "(%-18s%s " name line-breaking))
		 (setq lbs (concat "\n" (make-string (current-column) ?\ ))
		       separator nil)
		 (while (consp value)
		   (setq cell (car value))
		   (if (and (consp cell)
			    (consp (car cell)))
		       (progn
			 (if separator
			     (insert lbs))
			 (char-db-insert-alist cell readable)
			 (setq separator lbs))
		     (if separator
			 (insert separator))
		     (insert (prin1-to-string cell))
		     (setq separator " "))
		   (setq value (cdr value)))
		 (insert ")")
		 (insert line-breaking))
                ;; ((string-match "^->" (symbol-name name))
                ;;  (insert
                ;;   (format "(%-18s %s)%s"
                ;;           name
                ;;           (mapconcat (lambda (code)
                ;;                        (cond ((symbolp code)
                ;;                               (symbol-name code))
                ;;                              ((integerp code)
                ;;                               (format "#x%04X" code))
                ;;                              (t
                ;;                               (format "%s%S"
                ;;                                       line-breaking code))))
                ;;                      value " ")
                ;;           line-breaking)))
		((consp value)
		 (insert (format "(%-18s " name))
		 (setq lbs (concat "\n" (make-string (current-column) ?\ ))
		       separator nil)
		 (while (consp value)
		   (setq cell (car value))
		   (if (and (consp cell)
			    (consp (car cell))
			    (setq ret (condition-case nil
					  (find-char cell)
					(error nil))))
		       (progn
			 (setq rest cell
			       al nil
			       cal nil)
			 (while rest
			   (setq key (car (car rest)))
			   (if (find-charset key)
			       (setq cal (cons key cal))
			     (setq al (cons key al)))
			   (setq rest (cdr rest)))
			 (if separator
			     (insert lbs))
			 (insert-char-attributes ret
						 readable
						 al cal)
			 (setq separator lbs))
		     (if separator
			 (insert separator))
		     (insert (prin1-to-string cell))
		     (setq separator " "))
		   (setq value (cdr value)))
		 (insert ")")
		 (insert line-breaking))
		(t
		 (insert (format "(%-18s . %S)%s"
				 name value
				 line-breaking)))
		))
      (setq attributes (cdr attributes)))
    (while ccs-attributes
      (setq name (car ccs-attributes))
      (if (and (eq name (charset-name name))
	       (setq value (get-char-attribute char name)))
	  (insert
	   (format
	    (cond ((memq name '(ideograph-daikanwa-2
				ideograph-daikanwa
				=gt =gt-k =cbeta))
		   (if has-long-ccs-name
		       "(%-26s . %05d)\t; %c%s"
		     "(%-18s . %05d)\t; %c%s"))
		  ((eq name 'mojikyo)
		   (if has-long-ccs-name
		       "(%-26s . %06d)\t; %c%s"
		     "(%-18s . %06d)\t; %c%s"))
		  ((>= (charset-dimension name) 2) ; (eq name 'ucs)
		   (if has-long-ccs-name
		       "(%-26s . #x%04X)\t; %c%s"
		     "(%-18s . #x%04X)\t; %c%s"))
		  (t
		   (if has-long-ccs-name
		       "(%-26s . #x%02X)\t; %c%s"
		     "(%-18s . #x%02X)\t; %c%s")))
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
            (char-db-decode-isolated-char name value)
	    line-breaking)))
      (setq ccs-attributes (cdr ccs-attributes)))
    (insert ")")))

(defun insert-char-data (char &optional readable
			      attributes ccs-attributes)
  (save-restriction
    (narrow-to-region (point)(point))
    (insert "(define-char
  '")
    (insert-char-attributes char readable
			    attributes ccs-attributes)
    (insert ")\n")
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match ""))
    ;; from tabify.
    (goto-char (point-min))
    (while (re-search-forward "[ \t][ \t][ \t]*" nil t)
      (let ((column (current-column))
	    (indent-tabs-mode t))
	(delete-region (match-beginning 0) (point))
	(indent-to column)))
    (goto-char (point-max))
    ;; (tabify (point-min)(point-max))
    ))

(defun insert-char-data-with-variant (char &optional printable
					   no-ucs-variant
					   script excluded-script)
  (insert-char-data char printable)
  (let ((variants (or (char-variants char)
		      (let ((ucs (get-char-attribute char '->ucs)))
			(if ucs
			    (delete char (char-variants (int-char ucs)))))))
	variant vs)
    (setq variants (sort variants #'<))
    (while variants
      (setq variant (car variants))
      (if (and (or (null script)
		   (null (setq vs (get-char-attribute variant 'script)))
		   (memq script vs))
	       (or (null excluded-script)
		   (null (setq vs (get-char-attribute variant 'script)))
		   (not (memq excluded-script vs))))
	  (or (and no-ucs-variant (get-char-attribute variant 'ucs))
	      (insert-char-data variant printable)))
      (setq variants (cdr variants))
      )))

(defun insert-char-range-data (min max &optional script excluded-script)
  (let ((code min)
	char)
    (while (<= code max)
      (setq char (decode-char 'ucs code))
      (if (get-char-attribute char 'ucs)
	  (insert-char-data-with-variant char nil 'no-ucs-variant
					 script excluded-script))
      (setq code (1+ code))
      )))

(defun write-char-range-data-to-file (min max file
					  &optional script excluded-script)
  (let ((coding-system-for-write 'utf-8))
    (with-temp-buffer
      (insert-char-range-data min max script excluded-script)
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
	  (insert-char-data-with-variant char 'printable)
	  (unless (char-attribute-alist char)
	    (insert (format ";; = %c\n"
			    (let* ((rest (split-char char))
				   (ccs (pop rest))
				   (code (pop rest)))
			      (while rest
				(setq code (logior (lsh code 8)
						   (pop rest))))
			      (decode-char ccs code)))))
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
