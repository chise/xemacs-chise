;;; ideograph-util.el --- Ideographic Character Database utility

;; Copyright (C) 1999,2000,2001 MORIOKA Tomohiko.

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

(defun char-ideographic-radical (char)
  (or (get-char-attribute char 'ideographic-radical)
      (let ((radical
	     (or (get-char-attribute char 'daikanwa-radical)
		 (get-char-attribute char 'kangxi-radical)
		 (get-char-attribute char 'japanese-radical)
		 (get-char-attribute char 'korean-radical))))
	(when radical
	  (put-char-attribute char 'ideographic-radical radical)
	  radical))))

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

(defun char-ideographic-strokes (char)
  (or (get-char-attribute char 'daikanwa-strokes)
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
	  strokes))))

;;;###autoload
(defun update-ideograph-radical-table ()
  (interactive)
  (let (ret script)
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
     'ideographic-radical)))

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

(defun ideograph-char< (a b)
  (let (a-m b-m a-s b-s a-u b-u ret)
    (setq ret (char-representative-of-daikanwa a))
    (setq a-s (char-ideographic-strokes
	       (if (= (get-char-attribute ret 'ideographic-radical)
		      (get-char-attribute a 'ideographic-radical))
		   ret
		 a)))
    (setq ret (char-representative-of-daikanwa b))
    (setq b-s (char-ideographic-strokes
	       (if (= (get-char-attribute ret 'ideographic-radical)
		      (get-char-attribute b 'ideographic-radical))
		   ret
		 b)))
    (if a-s
	(if b-s
	    (if (= a-s b-s)
		(if (setq a-m (or (get-char-attribute a 'ideograph-daikanwa)
				  (get-char-attribute a 'morohashi-daikanwa)))
		    (if (setq b-m
			      (or (get-char-attribute b 'ideograph-daikanwa)
				  (get-char-attribute b 'morohashi-daikanwa)))
			(morohashi-daikanwa< a-m b-m)
		      t)
		  (if (setq b-m
			    (or (get-char-attribute b 'ideograph-daikanwa)
				(get-char-attribute b 'morohashi-daikanwa)))
		      nil
		    (setq a-u (get-char-attribute a 'ucs)
			  b-u (get-char-attribute b 'ucs))
		    (if a-u
			(if b-u
			    (< a-u b-u)
			  (setq b-u (or (get-char-attribute b '=>ucs)
					(get-char-attribute b '->ucs)))
			  (if b-u
			      (<= a-u b-u)
			    t))
		      (setq a-u (or (get-char-attribute a '=>ucs)
				    (get-char-attribute a '->ucs)))
		      (if a-u
			  (if b-u
			      (< a-u b-u)
			    (setq b-u (or (get-char-attribute b '=>ucs)
					  (get-char-attribute b '->ucs)))
			    (if b-u
				(< a-u b-u)
			      t))
			(if (or b-u (or (get-char-attribute b '=>ucs)
					(get-char-attribute b '->ucs)))
			    nil
			  (< (char-int a)(char-int b)))))))
	      (< a-s b-s))
	  t))))

(defun insert-ideograph-radical-char-data (radical)
  (let ((chars
	 (sort (copy-list (aref ideograph-radical-chars-vector radical))
	       (function ideograph-char<)))
	(attributes (sort (char-attribute-list) #'char-attribute-name<))
	(ccs (sort (charset-list) #'char-attribute-name<)))
    (aset ideograph-radical-chars-vector radical chars)
    (while chars
      (insert-char-data (car chars) nil attributes ccs)
      (setq chars (cdr chars)))))

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

;;;###autoload
(defun ideographic-structure-find-char (structure)
  (let (rest)
    (map-char-attribute (lambda (char value)
			  (setq rest structure)
			  (catch 'tag
			    (while (and rest value)
			      (unless (char-ref= (car rest)(car value))
				(throw 'tag nil))
			      (setq rest (cdr rest)
				    value (cdr value)))
			    (unless (or rest value)
			      char)))
			'ideographic-structure)))

(provide 'ideograph-util)

;;; ideograph-util.el ends here
