;;; ideograph-util.el --- Ideographic Character Database utility

;; Copyright (C) 1999,2000,2001,2002 MORIOKA Tomohiko.

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

(require 'char-db-util)

(defvar ideograph-radical-chars-vector
  (make-vector 215 nil))

(defun char-ideographic-radical (char &optional radical)
  (let (ret)
    (or (catch 'tag
	  (dolist (cell (get-char-attribute char 'ideographic-))
	    (if (and (setq ret (plist-get cell :radical))
		     (or (eq ret radical)
			 (null radical)))
		(throw 'tag ret))))
	(get-char-attribute char 'ideographic-radical)
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

(defun char-ideographic-strokes (char &optional radical)
  (let (ret)
    (or (catch 'tag
	  (dolist (cell (get-char-attribute char 'ideographic-))
	    (if (and (setq ret (plist-get cell :radical))
		     (or (eq ret radical)
			 (null radical)))
		(throw 'tag (plist-get cell :strokes)))))
	(get-char-attribute char 'daikanwa-strokes)
	(get-char-attribute char 'ideographic-strokes)
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
(defun update-ideograph-radical-table ()
  (interactive)
  (let (ret radical script)
    (map-char-attribute
     (lambda (char radical)
       (when (and radical
		  (or (null (setq script (get-char-attribute char 'script)))
		      (memq 'Ideograph script)))
	 (unless (memq char
		       (setq ret
			     (aref ideograph-radical-chars-vector radical)))
	   (char-ideographic-strokes char)
	   (aset ideograph-radical-chars-vector radical
		 (cons char ret))))
       nil)
     'ideographic-radical)
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

(defun char-representative-of-daikanwa (char)
  (if (get-char-attribute char 'ideograph-daikanwa)
      char
    (let ((m (get-char-attribute char 'morohashi-daikanwa))
	  m-m m-s pat)
      (or (when m
	    (setq m-m (pop m))
	    (setq m-s (pop m))
	    (if (= m-s 0)
		(decode-char 'ideograph-daikanwa m-m)
	      (when m
		(setq pat (list m-m m-s))
		(map-char-attribute (lambda (c v)
				      (if (equal pat v)
					  c))
				    'morohashi-daikanwa))))
	  char))))

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

(defvar ideographic-radical nil)

(defun char-daikanwa-strokes (char &optional radical)
  (unless radical
    (setq radical ideographic-radical))
  (let ((drc (char-representative-of-daikanwa char)))
    (char-ideographic-strokes
     (if (= (char-ideographic-radical drc radical)
	    (char-ideographic-radical char radical))
	 drc
       char)
     radical)))

;;;###autoload
(defun char-daikanwa (char)
  (or (get-char-attribute char 'ideograph-daikanwa)
      (get-char-attribute char 'morohashi-daikanwa)))

;;;###autoload
(defun char-ucs (char)
  (or (get-char-attribute char 'ucs)
      (get-char-attribute char '=>ucs)
      (get-char-attribute char '->ucs)))

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
	    (push name ccss)
	  (push name attributes))))
    (setq attributes (sort attributes #'char-attribute-name<)
	  ccss (sort ccss #'char-attribute-name<))
    (aset ideograph-radical-chars-vector radical chars)
    (dolist (char chars)
      (when (some (lambda (ccs)
		    (let ((code (encode-char char ccs)))
		      (and code
			   ;;(not (memq ccs char-db-ignored-attributes))
			   ;;(or (not (memq ccs '(ucs))
			   (and (<= 0 code)(<= code #x10FFFF)))))
		  ccss)
	(insert-char-data char nil attributes ccss)))))

(defun write-ideograph-radical-char-data (radical file)
  (if (file-directory-p file)
      (let ((name (get-char-attribute (int-char (+ #x2EFF radical)) 'name)))
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
    (insert-ideograph-radical-char-data radical)
    (char-db-update-comment)
    (let ((coding-system-for-write 'utf-8))
      (write-region (point-min)(point-max) file)
      )))

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

(provide 'ideograph-util)

;;; ideograph-util.el ends here
