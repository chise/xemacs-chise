;;; char-db-util.el --- Character Database utility

;; Copyright (C) 1998,1999,2000,2001,2002,2003,2004 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CHISE, Character Database, ISO/IEC 10646, Unicode, UCS-4, MULE.

;; This file is part of XEmacs CHISE.

;; XEmacs CHISE is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs CHISE is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs CHISE; see the file COPYING.  If not, write to
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
      (aset v i (decode-char '=ucs (+ #x2EFF i)))
      (setq i (1+ i)))
    v))

(defvar char-db-feature-domains
  '(ucs daikanwa cns gt jis jis/alt jis/a jis/b
	jis-x0213 misc unknown))

(defvar char-db-ignored-attributes nil)

(defun char-attribute-name< (ka kb)
  (cond
   ((find-charset ka)
    (cond
     ((find-charset kb)
      (if (<= (charset-id ka) 0)
	  (if (<= (charset-id kb) 0)
	      (cond
	       ((= (charset-dimension ka)
		   (charset-dimension kb))
		(> (charset-id ka)(charset-id kb)))
	       (t
		(> (charset-dimension ka)
		   (charset-dimension kb))
		))
	    t)
	(if (<= (charset-id kb) 0)
	    nil
	  (< (charset-id ka)(charset-id kb)))))
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
    =jis-x0208-1990
    =jis-x0213-1-2000
    =jis-x0213-2-2000
    korean-ksc5601
    chinese-isoir165
    katakana-jisx0201
    hebrew-iso8859-8
    chinese-gb12345
    latin-viscii
    ethiopic-ucs
    =big5-cdp
    =gt
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
    =big5
    =big5-eten
    =gt-k
    =jef-china3))

(defun char-db-make-char-spec (char)
  (let (ret char-spec)
    (cond ((characterp char)
	   (cond ((and (setq ret (encode-char char '=ucs 'defined-only))
		       (not (and (<= #xE000 ret)(<= ret #xF8FF))))
		  (setq char-spec (list (cons '=ucs ret)))
		  (cond ((setq ret (get-char-attribute char 'name))
			 (setq char-spec (cons (cons 'name ret) char-spec))
			 )
			((setq ret (get-char-attribute char 'name*))
			 (setq char-spec (cons (cons 'name* ret) char-spec))
			 ))
		  )
		 ((setq ret
			(catch 'tag
			  (let ((rest char-db-coded-charset-priority-list)
				ccs)
			    (while rest
			      (setq ccs (charset-name
					 (find-charset (car rest))))
			      (if (setq ret
					(encode-char char ccs
						     'defined-only))
				  (throw 'tag (cons ccs ret)))
			      (setq rest (cdr rest))))))
		  (setq char-spec (list ret))
		  (dolist (ccs (delq (car ret) (charset-list)))
		    (if (and (or (charset-iso-final-char ccs)
				 (memq ccs
				       '(ideograph-daikanwa
					 =daikanwa-rev2
					 ;; =gt-k
					 )))
			     (setq ret (encode-char char ccs 'defined-only)))
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
    
(defun char-db-insert-char-spec (char &optional readable column
				      required-features)
  (unless column
    (setq column (current-column)))
  (let (char-spec al cal key temp-char)
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
	    (if (encode-char char key 'defined-only)
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
    (dolist (feature required-features)
      (if (find-charset feature)
	  (if (encode-char char feature 'defined-only)
	      (setq cal (adjoin feature cal)))
	(setq al (adjoin feature al))))
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
		    (setq value (decode-char '=ucs value)))
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
		((and (memq ccs '(=gt-pj-1
				  =gt-pj-2
				  =gt-pj-3
				  =gt-pj-4
				  =gt-pj-5
				  =gt-pj-6
				  =gt-pj-7
				  =gt-pj-8
				  =gt-pj-9
				  =gt-pj-10
				  =gt-pj-11))
		      (setq ret (decode-char ccs code-point))
		      (setq ret (encode-char ret '=gt 'defined-only)))
		 (decode-builtin-char '=gt ret))
		(t
		 (decode-builtin-char ccs code-point))))
    (cond ((and (<= 0 (char-int ret))
		(<= (char-int ret) #x1F))
	   (decode-char '=ucs (+ #x2400 (char-int ret))))
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
	key al cal
	dest-ccss
	sources required-features)
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
    (dolist (name '(=>ucs =>ucs*))
      (when (and (memq name attributes)
		 (setq value (get-char-attribute char name)))
	(insert (format "(%-18s . #x%04X)\t; %c%s"
			name value (decode-char '=ucs value)
			line-breaking))
	(setq attributes (delq name attributes))))
    (dolist (name '(=>ucs@gb =>ucs@cns =>ucs@jis =>ucs@ks =>ucs@big5))
      (when (and (memq name attributes)
		 (setq value (get-char-attribute char name)))
	(insert (format "(%-18s . #x%04X)\t; %c%s"
			name value
			(decode-char (intern
				      (concat "="
					      (substring
					       (symbol-name name) 2)))
				     value)
			line-breaking))
	(setq attributes (delq name attributes))
	))
    ;; (dolist (name '(=>ucs-gb =>ucs-cns =>ucs-jis =>ucs-ks =>ucs-big5))
    ;;   (when (and (memq name attributes)
    ;;              (setq value (get-char-attribute char name)))
    ;;     (insert (format "(%-18s . #x%04X)\t; %c%s"
    ;;                     (intern
    ;;                      (concat "=>ucs@"
    ;;                              (substring (symbol-name name) 6)))
    ;;                     value
    ;;                     (decode-char (intern
    ;;                                   (concat "=ucs@"
    ;;                                           (substring
    ;;                                            (symbol-name name) 6)))
    ;;                                  value)
    ;;                     line-breaking))
    ;;     (setq attributes (delq name attributes))))
    ;; (when (and (memq '->ucs attributes)
    ;;            (setq value (get-char-attribute char '->ucs)))
    ;;   (insert (format (if char-db-convert-obsolete-format
    ;;                       "(=>ucs\t\t. #x%04X)\t; %c%s"
    ;;                     "(->ucs\t\t. #x%04X)\t; %c%s")
    ;;                   value (decode-char '=ucs value)
    ;;                   line-breaking))
    ;;   (setq attributes (delq '->ucs attributes))
    ;;   )
    (dolist (name '(=>daikanwa))
      (when (and (memq name attributes)
		 (setq value (get-char-attribute char name)))
	(insert
	 (if (integerp value)
	     (format "(%-18s . %05d)\t; %c%s"
		     name value (decode-char '=daikanwa value)
		     line-breaking)
	   (format "(%-18s %s)\t; %c%s"
		   name
		   (mapconcat #'prin1-to-string
			      value " ")
		   (char-representative-of-daikanwa char)
		   line-breaking)))
	(setq attributes (delq name attributes))))
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
    (let (key)
      (dolist (domain char-db-feature-domains)
	(setq key (intern (format "%s@%s" 'ideographic-radical domain)))
	(when (and (memq key attributes)
		   (setq value (get-char-attribute char key)))
	  (setq radical value)
	  (insert (format "(%s . %S)\t; %c%s"
			  key
			  radical
			  (aref ideographic-radicals radical)
			  line-breaking))
	  (setq attributes (delq key attributes))
	  )
	(setq key (intern (format "%s@%s" 'ideographic-strokes domain)))
	(when (and (memq key attributes)
		   (setq value (get-char-attribute char key)))
	  (setq strokes value)
	  (insert (format "(%s . %S)%s"
			  key
			  strokes
			  line-breaking))
	  (setq attributes (delq key attributes))
	  )
	(setq key (intern (format "%s@%s" 'total-strokes domain)))
	(when (and (memq key attributes)
		   (setq value (get-char-attribute char key)))
	  (insert (format "(%s       . %S)%s"
			  key
			  value
			  line-breaking))
	  (setq attributes (delq key attributes))
	  )
	(dolist (feature '(ideographic-radical
			   ideographic-strokes
			   total-strokes))
	  (setq key (intern (format "%s@%s*sources" feature domain)))
	  (when (and (memq key attributes)
		     (setq value (get-char-attribute char key)))
	    (insert (format "(%s%s" key line-breaking))
	    (dolist (cell value)
	      (insert (format " %s" cell)))
	    (insert ")")
	    (insert line-breaking)
	    (setq attributes (delq key attributes))
	    ))
	))
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
	    (setq cell (decode-char '=ucs cell)))
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
      (when (memq '->ucs-unified attributes)
	(setq attributes (delq '->ucs-unified attributes))
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
	  (cond ((string-match "^=>ucs@" (symbol-name name))
		 (insert (format "(%-18s . #x%04X)\t; %c%s"
				 name value (decode-char '=ucs value)
				 line-breaking))
		 )
		((eq name 'jisx0208-1978/4X)
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
		       (setq cell (decode-char '=ucs cell)))
		   (cond ((eq name '->unified)
			  (if separator
			      (insert lbs))
			  (let ((char-db-ignored-attributes
				 (cons '<-unified
				       char-db-ignored-attributes)))
			    (insert-char-attributes cell readable))
			  (setq separator lbs))
			 ((characterp cell)
			  (setq sources
				(get-char-attribute
				 char
				 (intern (format "%s*sources" name))))
			  (setq required-features nil)
			  (dolist (source sources)
			    (setq required-features
				  (cons
				   (if (find-charset
					(setq ret (intern
						   (format "=%s" source))))
				       ret
				     source)
				   required-features)))
			  (when (string-match "@JP" (symbol-name name))
			    (setq required-features
				  (union required-features
					 '(=jis-x0208
					   =jis-x0208-1990
					   =jis-x0213-1-2000
					   =jis-x0213-2-2000
					   =jis-x0212
					   =jis-x0208-1983
					   =jis-x0208-1978))))
			  (if separator
			      (insert lbs))
			  (if readable
			      (insert (format "%S" cell))
			    (char-db-insert-char-spec cell readable
						      nil
						      required-features))
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
                              ;; simplified-ideograph-of
			      ideographic-variants
                              ;; ideographic-different-form-of
			      ))
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
		     (setq ret (prin1-to-string cell))
		     (if separator
			 (if (< (+ (current-column)
				   (length ret)
				   (length separator))
				76)
			     (insert separator)
			   (insert lbs)))
		     (insert ret)
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
      (setq name (charset-name (car ccs-attributes)))
      (if (and (not (memq name dest-ccss))
	       (prog1
		   (setq value (get-char-attribute char name))
		 (setq dest-ccss (cons name dest-ccss))))
	  (insert
	   (format
	    (cond ((memq name '(=daikanwa
				=daikanwa-rev1 =daikanwa-rev2
				=gt =gt-k =cbeta))
		   (if has-long-ccs-name
		       "(%-26s . %05d)\t; %c%s"
		     "(%-18s . %05d)\t; %c%s"))
		  ((eq name 'mojikyo)
		   (if has-long-ccs-name
		       "(%-26s . %06d)\t; %c%s"
		     "(%-18s . %06d)\t; %c%s"))
		  ((>= (charset-dimension name) 2)
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
					   no-ucs-unified
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
	  (or (and no-ucs-unified (get-char-attribute variant '=ucs))
	      (insert-char-data variant printable)))
      (setq variants (cdr variants))
      )))

(defun insert-char-range-data (min max &optional script excluded-script)
  (let ((code min)
	char)
    (while (<= code max)
      (setq char (decode-char '=ucs code))
      (if (encode-char char '=ucs 'defined-only)
	  (insert-char-data-with-variant char nil 'no-ucs-unified
					 script excluded-script))
      (setq code (1+ code)))))

(defun write-char-range-data-to-file (min max file
					  &optional script excluded-script)
  (let ((coding-system-for-write 'utf-8-mcs))
    (with-temp-buffer
      (insert ";; -*- coding: utf-8-mcs -*-\n")
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
