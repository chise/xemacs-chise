;;; ideograph-util.el --- Ideographic Character Database utility

;; Copyright (C) 1999,2000,2001,2002,2003,2004 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CHISE, Chaon model, ISO/IEC 10646, Unicode, UCS-4, MULE.

;; This file is part of XEmacs CHISE.

;; XEmacs CHISE is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs CHISE is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs CHISE; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(require 'char-db-util)

;;;###autoload
(defun expand-char-feature-name (feature domain)
  (if domain
      (intern (format "%s@%s" feature domain))
    feature))

(defun map-char-family (function char &optional ignore-sisters)
  (let ((rest (list char))
	ret checked)
    (catch 'tag
      (while rest
	(unless (memq (car rest) checked)
	  (if (setq ret (funcall function (car rest)))
	      (throw 'tag ret))
	  (setq checked (cons (car rest) checked)
		rest (append rest
			     (get-char-attribute (car rest) '->subsumptive)
			     (get-char-attribute (car rest) '->denotational)
			     (get-char-attribute (car rest) '->identical)))
	  (unless ignore-sisters
	    (setq rest (append rest
			       (get-char-attribute (car rest) '<-subsumptive)
			       (get-char-attribute (car rest) '<-denotational)))))
	(setq rest (cdr rest))))))

(defun get-char-feature-from-domains (char feature domains
					   &optional tester arg
					   ignore-sisters)
  (map-char-family
   (lambda (ch)
     (let (ret)
       (catch 'tag
	 (dolist (domain domains)
	   (if (and (or (null tester)
			(equal (or (char-feature
				    ch (expand-char-feature-name
					tester domain))
				   (char-feature ch tester))
			       arg))
		    (setq ret (or (char-feature
				   ch (expand-char-feature-name
				       feature domain))
				  (char-feature ch feature))))
	       (throw 'tag ret))))))
   char ignore-sisters)
  ;; (let ((rest (list char))
  ;;       ret checked)
  ;;   (catch 'tag
  ;;     (while rest
  ;;       (setq char (car rest))
  ;;       (unless (memq char checked)
  ;;         (dolist (domain domains)
  ;;           (if (and (setq ret (char-feature
  ;;                               char
  ;;                               (expand-char-feature-name
  ;;                                feature domain)))
  ;;                    (or (null tester)
  ;;                        (equal (or (char-feature
  ;;                                    char
  ;;                                    (expand-char-feature-name
  ;;                                     tester domain))
  ;;                                   (char-feature char tester))
  ;;                               arg)))
  ;;               (throw 'tag ret)))
  ;;         (setq rest (append rest
  ;;                            (get-char-attribute char '->subsumptive)
  ;;                            (get-char-attribute char '->denotational)
  ;;                            (get-char-attribute char '<-subsumptive)
  ;;                            (get-char-attribute char '<-denotational))
  ;;               checked (cons char checked)))
  ;;       (setq rest (cdr rest)))))
  )


(defvar ideograph-radical-chars-vector
  (make-vector 215 nil))

(defun char-ideographic-radical (char &optional radical ignore-sisters)
  (let (ret)
    (or (if radical
	    (get-char-feature-from-domains
	     char 'ideographic-radical (cons nil char-db-feature-domains)
	     'ideographic-radical radical ignore-sisters)
	  (get-char-feature-from-domains
	   char 'ideographic-radical (cons nil char-db-feature-domains)
	   ignore-sisters))
        ;; (catch 'tag
        ;;   (dolist (domain char-db-feature-domains)
        ;;     (if (and (setq ret (char-feature
        ;;                         char
        ;;                         (intern
        ;;                          (format "%s@%s"
        ;;                                  'ideographic-radical domain))))
        ;;              (or (eq ret radical)
        ;;                  (null radical)))
        ;;         (throw 'tag ret))))
	(catch 'tag
	  (dolist (cell (get-char-attribute char 'ideographic-))
	    (if (and (setq ret (plist-get cell :radical))
		     (or (eq ret radical)
			 (null radical)))
		(throw 'tag ret))))
	(get-char-feature-from-domains
	 char 'ideographic-radical (cons nil char-db-feature-domains))
        ;; (char-feature char 'ideographic-radical)
	(progn
	  (setq ret
		(or (get-char-attribute char 'daikanwa-radical)
		    (get-char-attribute char 'kangxi-radical)
		    (get-char-attribute char 'japanese-radical)
		    (get-char-attribute char 'korean-radical)))
	  (when ret
	    (put-char-attribute char 'ideographic-radical ret)
	    ret)))))

(defvar ideograph-radical-strokes-vector
  ;;0  1  2  3  4  5  6  7  8  9
  [nil 1  1  1  1  1  1  2  2  2
    2  2  2  2  2  2  2  2  2  2
    2  2  2  2  2  2  2  2  2  2
    3  3  3  3  3  3  3  3  3  3
    3  3  3  3  3  3  3  3  3  3
    3  3  3  3  3  3  3  3  3  3
    3  4  4  4  3  4  4  4  4  4
    4  4  4  4  4  4  4  4  4  4
    4  4  4  4  4  3  4  4  4  4
    4  4  4  4  3  5  4  5  5  5
    ;; 100
    5  5  5  5  5  5  5  5  5  5
    5  5  5  5  5  5  5  5  6  6
    6  6  6  6  6  6  6  6  6  6
    4  6  6  6  6  6  6  6  6  6
    4  6  6  6  6  6  6  7  7  7
    7  7  7  7  7  7  7  7  7  7
    7  7  4  3  7  7  7  8  7  8
    3  8  8  8  8  8  9  9  9  9
    9  9  9  9  8  9  9 10 10 10
   10 10 10 10 10 11 11 11 11 11
   ;; 200
   11 12 12 12 12 13 13 13 13 14
   14 15 16 16 17])

;;;###autoload
(defun char-ideographic-strokes-from-domains (char domains &optional radical)
  (if radical
      (get-char-feature-from-domains char 'ideographic-strokes domains
				     'ideographic-radical radical)
    (get-char-feature-from-domains char 'ideographic-strokes domains))
  ;; (let ((rest (list char))
  ;;       ret checked)
  ;;   (catch 'tag
  ;;     (while rest
  ;;       (setq char (car rest))
  ;;       (unless (memq char checked)
  ;;         (dolist (domain domains)
  ;;           (if (and (setq ret (or (char-feature
  ;;                                   char
  ;;                                   (expand-char-feature-name
  ;;                                    'ideographic-radical domain))
  ;;                                  (char-feature
  ;;                                   char 'ideographic-radical)))
  ;;                    (or (eq ret radical)
  ;;                        (null radical))
  ;;                    (setq ret (or (char-feature
  ;;                                   char
  ;;                                   (expand-char-feature-name
  ;;                                    'ideographic-strokes domain))
  ;;                                  (char-feature
  ;;                                   char 'ideographic-strokes))))
  ;;               (throw 'tag ret)))
  ;;         (setq rest (append rest
  ;;                            (get-char-attribute char '->subsumptive)
  ;;                            (get-char-attribute char '->denotational))
  ;;               checked (cons char checked)))
  ;;       (setq rest (cdr rest)))))
  )

;;;###autoload
(defun char-ideographic-strokes (char &optional radical preferred-domains)
  (let (ret)
    (or (catch 'tag
	  (dolist (cell (get-char-attribute char 'ideographic-))
	    (if (and (setq ret (plist-get cell :radical))
		     (or (eq ret radical)
			 (null radical)))
		(throw 'tag (plist-get cell :strokes)))))
	(char-ideographic-strokes-from-domains
	 char (append preferred-domains
		      (cons nil
			    char-db-feature-domains))
	 radical)
	(get-char-attribute char 'daikanwa-strokes)
	(let ((strokes
	       (or (get-char-attribute char 'kangxi-strokes)
		   (get-char-attribute char 'japanese-strokes)
		   (get-char-attribute char 'korean-strokes)
		   (let ((r (char-ideographic-radical char))
			 (ts (get-char-attribute char 'total-strokes)))
		     (if (and r ts)
			 (- ts (aref ideograph-radical-strokes-vector r))))
		   )))
	  (when strokes
	    (put-char-attribute char 'ideographic-strokes strokes)
	    strokes)))))

;;;###autoload
(defun char-total-strokes-from-domains (char domains)
  (let (ret)
    (catch 'tag
      (dolist (domain domains)
	(if (setq ret (get-char-attribute
		       char
		       (intern
			(format "%s@%s"
				'total-strokes domain))))
	    (throw 'tag ret))))))

;;;###autoload
(defun char-total-strokes (char &optional preferred-domains)
  (or (char-total-strokes-from-domains char preferred-domains)
      (get-char-attribute char 'total-strokes)
      (char-total-strokes-from-domains char char-db-feature-domains)))

;;;###autoload
(defun update-ideograph-radical-table ()
  (interactive)
  (let (ret rret radical script dest)
    (dolist (feature
	     (cons 'ideographic-radical
		   (progn
		     (dolist (feature (char-attribute-list))
		       (if (string-match "^ideographic-radical@[^@*]+$"
					 (symbol-name feature))
			   (setq dest (cons feature dest))))
		     dest)
                   ;; (mapcar
                   ;;  (lambda (domain)
                   ;;    (intern (format "%s@%s" 'ideographic-radical domain)))
                   ;;  char-db-feature-domains)
		   ))
      (map-char-attribute
       (lambda (chr radical)
	 (dolist (char (append
			(if (setq ret
				  (get-char-attribute chr '<-subsumptive))
			    (progn
			      (setq dest nil)
			      (dolist (pc ret)
				(unless (eq (get-char-attribute
					     pc 'ideographic-radical)
					    radical)
				  (if (setq rret
					    (get-char-attribute
					     pc '<-subsumptive))
				      (setq ret (append ret rret))
				    (setq dest (cons pc dest)))))
			      dest)
			  (list chr))
			(let ((rest (append
				     (get-char-attribute chr '<-identical)
				     (get-char-attribute chr '->denotational)))
			      pc)
			  (setq dest nil)
			  (while rest
			    (setq pc (car rest))
			    (if (memq pc dest)
				(setq rest (cdr rest))
			      (setq dest (cons pc dest))
			      (setq rest
				    (append (cdr rest)
					    (get-char-attribute
					     pc '<-identical)
					    (get-char-attribute
					     pc '->denotational)))))
			  dest)))
	   (when (and radical
		      (or (eq radical
			      (or (get-char-attribute
				   char 'ideographic-radical)
				  (char-ideographic-radical char radical)))
			  (null (char-ideographic-radical char)))
		      (or (null (setq script
				      (get-char-attribute char 'script)))
			  (memq 'Ideograph script)))
	     (unless (memq char
			   (setq ret
				 (aref ideograph-radical-chars-vector
				       radical)))
	       (char-ideographic-strokes char)
	       (aset ideograph-radical-chars-vector radical
		     (cons char ret)))))
	 nil)
       feature))
    (map-char-attribute
     (lambda (char data)
       (dolist (cell data)
	 (setq radical (plist-get cell :radical))
	 (when (and radical
		    (or (null (setq script (get-char-attribute char 'script)))
			(memq 'Ideograph script)))
	   (unless (memq char
			 (setq ret
			       (aref ideograph-radical-chars-vector radical)))
	     (char-ideographic-strokes char)
	     (aset ideograph-radical-chars-vector radical
		   (cons char ret))))))
     'ideographic-)))

(defun int-list< (a b)
  (if (numberp (car a))
      (if (numberp (car b))
	  (if (= (car a) (car b))
	      (int-list< (cdr a)(cdr b))
	    (< (car a) (car b)))
	nil)
    (numberp (car b))))

(defun morohashi-daikanwa< (a b)
  (if (integerp a)
      (setq a (list a)))
  (if (integerp b)
      (setq b (list b)))
  (cond ((eq (car a) 'ho)
	 (if (eq (car b) 'ho)
	     (int-list< (cdr a)(cdr b))
	   nil))
	((numberp (car a))
	 (if (eq (car b) 'ho)
	     t
	   (int-list< a b)))
	(t
	 (if (eq (car b) 'ho)
	     t
	   (int-list< a b)))))

;; (defun nil=-int< (a b)
;;   (cond ((null a) nil)
;;         ((null b) nil)
;;         (t (< a b))))

;; (defun nil>-int< (a b)
;;   (cond ((null a) nil)
;;         ((null b) t)
;;         (t (< a b))))

(defvar ideographic-radical nil)

;;;###autoload
(defun char-representative-of-daikanwa (char &optional radical
					     ignore-default checked)
  (unless radical
    (setq radical ideographic-radical))
  (if (or (null radical)
          (eq (or (get-char-attribute char 'ideographic-radical)
                  (char-ideographic-radical char radical t))
              radical))
      (let ((ret (or (encode-char char 'ideograph-daikanwa 'defined-only)
                     (encode-char char '=daikanwa-rev2 'defined-only))))
	(or (and ret char)
	    (if (setq ret (get-char-attribute char 'morohashi-daikanwa))
		(let ((m-m (car ret))
		      (m-s (nth 1 ret))
		      pat)
		  (if (= m-s 0)
		      (or (decode-char '=daikanwa-rev2 m-m 'defined-only)
			  (decode-char 'ideograph-daikanwa m-m))
		    (setq pat (list m-m m-s))
		    (map-char-attribute (lambda (c v)
					  (if (equal pat v)
					      c))
					'morohashi-daikanwa))))
            (and (setq ret (get-char-attribute char '=>daikanwa))
		 (if (numberp ret)
		     (or (decode-char '=daikanwa-rev2 ret 'defined-only)
			 (decode-char 'ideograph-daikanwa ret))
		   (map-char-attribute (lambda (c v)
					 (if (equal ret v)
					     char))
				       'morohashi-daikanwa)))
	    (unless (memq char checked)
	      (catch 'tag
		(let ((rest
		       (append (get-char-attribute char '->subsumptive)
			       (get-char-attribute char '->denotational)))
		      (i 0)
		      sc)
		  (setq checked (cons char checked))
		  (while rest
		    (setq sc (car rest))
		    (if (setq ret (char-representative-of-daikanwa
				   sc radical t checked))
			(throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest)
			  i (1+ i)))
		  (setq rest (get-char-attribute char '->identical))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-representative-of-daikanwa
				     sc radical t checked))
		      (throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest)))
		  (setq rest
			(append (get-char-attribute char '<-subsumptive)
				(get-char-attribute char '<-denotational)))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-representative-of-daikanwa
				     sc radical t checked))
		      (throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest))))))
	    (unless ignore-default
	      char)))))
;; (defun char-representative-of-daikanwa (char &optional radical
;;                                              ignore-default dont-inherit)
;;   (unless radical
;;     (setq radical ideographic-radical))
;;   (if (or (encode-char char 'ideograph-daikanwa 'defined-only)
;;           (encode-char char '=daikanwa-rev2 'defined-only))
;;       char
;;     (let ((m (char-feature char '=>daikanwa))
;;           m-m m-s pat
;;           scs sc ret
;;           )
;;       (or (and (integerp m)
;;                (or (decode-char '=daikanwa-rev2 m 'defined-only)
;;                    (decode-char 'ideograph-daikanwa m)))
;;           (when (or m
;;                     (setq m (get-char-attribute char 'morohashi-daikanwa)))
;;             (setq m-m (car m))
;;             (setq m-s (nth 1 m))
;;             (if (= m-s 0)
;;                 (or (decode-char '=daikanwa-rev2 m-m 'defined-only)
;;                     (decode-char 'ideograph-daikanwa m-m))
;;               (when m
;;                 (setq pat (list m-m m-s))
;;                 (map-char-attribute (lambda (c v)
;;                                       (if (equal pat v)
;;                                           c))
;;                                     'morohashi-daikanwa))))
;;           (unless dont-inherit
;;             ;; (map-char-family
;;             ;;  (lambda (sc)
;;             ;;    (let ((ret (char-representative-of-daikanwa sc nil t t)))
;;             ;;      (if (and ret
;;             ;;               (or (null radical)
;;             ;;                   (eq (char-ideographic-radical ret radical)
;;             ;;                       radical)))
;;             ;;          ret)))
;;             ;;  char)
;;             (when (setq scs (append
;;                              (get-char-attribute char '->subsumptive)
;;                              (get-char-attribute char '->denotational)))
;;               (while (and scs
;;                           (setq sc (car scs))
;;                           (not
;;                            (and
;;                             (setq ret
;;                                   (char-representative-of-daikanwa sc nil t t))
;;                             (or (null radical)
;;                                 (eq (char-ideographic-radical ret radical)
;;                                     radical)
;;                                 (setq ret nil)))))
;;                 (setq scs (cdr scs)))
;;               ret)
;;             )
;;           (unless ignore-default
;;             char)))))

(defun char-attributes-poly< (c1 c2 accessors testers defaulters)
  (catch 'tag
    (let (a1 a2 accessor tester dm)
      (while (and accessors testers)
	(setq accessor (car accessors)
	      tester (car testers)
	      dm (car defaulters))
	(when (and accessor tester)
	  (setq a1 (funcall accessor c1)
		a2 (funcall accessor c2))
	  (cond ((null a1)
		 (if a2
		     (cond ((eq dm '<)
			    (throw 'tag t))
			   ((eq dm '>)
			    (throw 'tag nil)))))
		((null a2)
		 (cond ((eq dm '<)
			(throw 'tag nil))
		       ((eq dm '>)
			(throw 'tag t))))
		(t
		 (cond ((funcall tester a1 a2)
			(throw 'tag t))
		       ((funcall tester a2 a1)
			(throw 'tag nil))))))
	(setq accessors (cdr accessors)
	      testers (cdr testers)
	      defaulters (cdr defaulters))))))

(defun char-daikanwa-strokes (char &optional radical)
  (unless radical
    (setq radical ideographic-radical))
  (let ((drc (char-representative-of-daikanwa char radical))
	(r (char-ideographic-radical char radical)))
    (if (or (null r)
	    (= (char-ideographic-radical drc radical) r))
	(setq char drc)))
  (char-ideographic-strokes char radical '(daikanwa)))

;;;###autoload
(defun char-daikanwa (char &optional radical checked)
  (unless radical
    (setq radical ideographic-radical))
  (if (or (null radical)
          (eq (or (get-char-attribute char 'ideographic-radical)
                  (char-ideographic-radical char radical t))
              radical))
      (let ((ret (or (encode-char char 'ideograph-daikanwa 'defined-only)
                     (encode-char char '=daikanwa-rev2 'defined-only)
                     (get-char-attribute char 'morohashi-daikanwa))))
        (or ret
	    (and (setq ret (get-char-attribute char '=>daikanwa))
		 (if (numberp ret)
		     (list ret 0)
		   (append ret '(0))))
	    (unless (memq char checked)
	      (catch 'tag
		(let ((rest
		       (append (get-char-attribute char '->subsumptive)
			       (get-char-attribute char '->denotational)))
		      (i 0)
		      sc)
		  (setq checked (cons char checked))
		  (while rest
		    (setq sc (car rest))
		    (if (setq ret (char-daikanwa sc radical checked))
			(throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest)
			  i (1+ i)))
		  (setq rest (get-char-attribute char '->identical))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-daikanwa sc radical checked))
		      (throw 'tag
			     (if (numberp ret)
				 (list ret 0)
			       (append ret (list i)))))
		    (setq checked (cons sc checked)
			  rest (cdr rest)))
		  (setq rest
			(append (get-char-attribute char '<-subsumptive)
				(get-char-attribute char '<-denotational)))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-daikanwa sc radical checked))
		      (throw 'tag
			     (if (numberp ret)
				 (list ret 0 i)
			       (append ret (list i)))))
		    (setq checked (cons sc checked)
			  rest (cdr rest))))))))))

;;;###autoload
(defun char-ucs (char)
  (or (encode-char char '=ucs 'defined-only)
      (char-feature char '=>ucs)))

(defun char-id (char)
  (logand (char-int char) #x3FFFFFFF))

(defun ideograph-char< (a b &optional radical)
  (let ((ideographic-radical (or radical
				 ideographic-radical)))
    (char-attributes-poly<
     a b
     '(char-daikanwa-strokes char-daikanwa char-ucs char-id)
     '(< morohashi-daikanwa< < <)
     '(> > > >))))

(defun insert-ideograph-radical-char-data (radical)
  (let ((chars
	 (sort (copy-list (aref ideograph-radical-chars-vector radical))
	       (lambda (a b)
		 (ideograph-char< a b radical))))
	attributes ccss)
    (dolist (name (char-attribute-list))
      (unless (memq name char-db-ignored-attributes)
	(if (find-charset name)
	    (push name ccss))
	(push name attributes)
	))
    (setq attributes (sort attributes #'char-attribute-name<)
	  ;; ccss (sort ccss #'char-attribute-name<)
	  )
    (aset ideograph-radical-chars-vector radical chars)
    (dolist (char chars)
      (when (or (not (some (lambda (atr)
			     (get-char-attribute char atr))
			   char-db-ignored-attributes))
		(some (lambda (ccs)
			(encode-char char ccs 'defined-only))
		      ccss))
	(insert-char-data char nil attributes ;ccss
			  )))))

(defun write-ideograph-radical-char-data (radical file)
  (if (file-directory-p file)
      (let ((name (char-feature (decode-char 'ucs (+ #x2EFF radical))
				'name)))
	(if (string-match "KANGXI RADICAL " name)
	    (setq name (capitalize (substring name (match-end 0)))))
	(setq name (mapconcat (lambda (char)
				(if (eq char ? )
				    "-"
				  (char-to-string char))) name ""))
	(setq file
	      (expand-file-name
	       (format "Ideograph-R%03d-%s.el" radical name)
	       file))))
  (with-temp-buffer
    (insert (format ";; -*- coding: %s -*-\n"
		    char-db-file-coding-system))
    (insert-ideograph-radical-char-data radical)
    (let ((coding-system-for-write char-db-file-coding-system))
      (write-region (point-min)(point-max) file))))

(defun ideographic-structure= (char1 char2)
  (if (char-ref-p char1)
      (setq char1 (plist-get char1 :char)))
  (if (char-ref-p char2)
      (setq char2 (plist-get char2 :char)))
  (let ((s1 (if (characterp char1)
		(get-char-attribute char1 'ideographic-structure)
	      (cdr (assq 'ideographic-structure char1))))
	(s2 (if (characterp char2)
		(get-char-attribute char2 'ideographic-structure)
	      (cdr (assq 'ideographic-structure char2))))
	e1 e2)
    (if (or (null s1)(null s2))
	(char-spec= char1 char2)
      (catch 'tag
	(while (and s1 s2)
	  (setq e1 (car s1)
		e2 (car s2))
	  (unless (ideographic-structure= e1 e2)
	    (throw 'tag nil))
	  (setq s1 (cdr s1)
		s2 (cdr s2)))
	(and (null s1)(null s2))))))

;;;###autoload
(defun ideographic-structure-find-char (structure)
  (let (rest)
    (map-char-attribute (lambda (char value)
			  (setq rest structure)
			  (catch 'tag
			    (while (and rest value)
			      (unless (ideographic-structure=
				       (car rest)(car value))
				(throw 'tag nil))
			      (setq rest (cdr rest)
				    value (cdr value)))
			    (unless (or rest value)
			      char)))
			'ideographic-structure)))

;;;###autoload
(defun chise-string< (string1 string2 accessors)
  (let ((len1 (length string1))
	(len2 (length string2))
	len
	(i 0)
	c1 c2
	rest func
	v1 v2)
    (setq len (min len1 len2))
    (catch 'tag
      (while (< i len)
	(setq c1 (aref string1 i)
	      c2 (aref string2 i))
	(setq rest accessors)
	(while (and rest
		    (setq func (car rest))
		    (setq v1 (funcall func c1)
			  v2 (funcall func c2))
		    (eq v1 v2))
	  (setq rest (cdr rest)))
	(if v1
	    (if v2
		(cond ((< v1 v2)
		       (throw 'tag t))
		      ((> v1 v2)
		       (throw 'tag nil)))
	      (throw 'tag nil))
	  (if v2
	      (throw 'tag t)))
	(setq i (1+ i)))
      (< len1 len2))))


(provide 'ideograph-util)

;;; ideograph-util.el ends here
