;;; ideograph-util.el --- Ideographic Character Database utility

;; Copyright (C) 1999,2000,2001 MORIOKA Tomohiko.

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
  (let ((i #x3400)
	j
	char radical
	(charsets '(japanese-jisx0208-1978
		    japanese-jisx0208
		    japanese-jisx0208-1990
		    japanese-jisx0212
		    japanese-jisx0213-1
		    japanese-jisx0213-2
		    chinese-cns11643-1
		    chinese-cns11643-2
		    chinese-cns11643-3
		    chinese-cns11643-4
		    chinese-cns11643-5
		    chinese-cns11643-6
		    chinese-cns11643-7
		    korean-ksc5601
		    chinese-gb2312
		    chinese-isoir165
		    chinese-big5-1
		    chinese-big5-2))
	ret script)
    (while (<= i #x9FFF)
      (setq char (decode-char 'ucs i))
      (when (and (or (null (setq script (get-char-attribute char 'script)))
		     (memq 'Ideograph script))
		 (setq radical (char-ideographic-radical char)))
	(or (get-char-attribute char 'ucs)
	    (put-char-attribute char 'ucs i))
	(char-ideographic-strokes char)
	(if (not (memq char
		       (setq ret
			     (aref ideograph-radical-chars-vector radical))))
	    (aset ideograph-radical-chars-vector radical
		  (cons char ret))))
      (setq i (1+ i)))
    (setq i #x100000)
    (while (<= i #x10FFFF)
      (setq char (decode-char 'ucs i))
      (when (and (or (null (setq script (get-char-attribute char 'script)))
		     (memq 'Ideograph script))
		 (setq radical (char-ideographic-radical char)))
	(if (not (memq char
		       (setq ret
			     (aref ideograph-radical-chars-vector radical))))
	    (aset ideograph-radical-chars-vector radical
		  (cons char ret))))
      (setq i (1+ i)))
    (setq i 1)
    (while (<= i 66773)
      (setq char (decode-char 'ideograph-gt i))
      (if (and (setq radical (char-ideographic-radical char))
	       (not
		(memq char
		      (setq ret
			    (aref ideograph-radical-chars-vector radical)))))
	  (aset ideograph-radical-chars-vector radical
		(cons char ret)))
      (setq i (1+ i)))
    (setq i 0)
    (while (< i 50101)
      (setq char (decode-char 'ideograph-daikanwa i))
      (if (and (setq radical (char-ideographic-radical char))
	       (not
		(memq char
		      (setq ret
			    (aref ideograph-radical-chars-vector radical)))))
	  (aset ideograph-radical-chars-vector radical
		(cons char ret)))
      (setq i (1+ i)))
    (setq i 0)
    (while (< i (* 94 60 22))
      (setq char (decode-char 'mojikyo i))
      (if (and (setq radical (char-ideographic-radical char))
	       (not
		(memq char
		      (setq ret
			    (aref ideograph-radical-chars-vector radical)))))
	  (aset ideograph-radical-chars-vector radical
		(cons char ret)))
      (setq i (1+ i)))
    (while charsets
      (setq i 33)
      (while (< i 127)
	(setq j 33)
	(while (< j 127)
	  (setq char (make-char (car charsets) i j))
	  (if (and (or (null (setq script (get-char-attribute char 'script)))
		       (memq 'Ideograph script))
		   (setq radical (char-ideographic-radical char))
		   (not (memq char
			      (setq ret
				    (aref ideograph-radical-chars-vector
					  radical)))))
	      (aset ideograph-radical-chars-vector radical
		    (cons char ret)))
	  (setq j (1+ j)))
	(setq i (1+ i)))
      (setq charsets (cdr charsets)))
    ))

(defun int-list< (a b)
  (if (numberp (car a))
      (if (numberp (car b))
	  (if (= (car a) (car b))
	      (int-list< (cdr a)(cdr b))
	    (< (car a) (car b)))
	nil)
    (numberp (car b))))

(defun morohashi-daikanwa< (a b)
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

(defun ideograph-char< (a b)
  (let ((a-m-m (get-char-attribute a 'ideograph-daikanwa))
	(b-m-m (get-char-attribute b 'ideograph-daikanwa))
	a-m-r b-m-r
	a-s b-s
	a-u b-u m ret)
    (if a-m-m
	(setq a-s (char-ideographic-strokes a))
      (setq a-m-r (get-char-attribute a 'morohashi-daikanwa))
      (if a-m-r
	  (progn
	    (setq a-m-m (car a-m-r)
		  a-m-r (cdr a-m-r))
	    (if (= (car a-m-r) 0)
		(progn
		  (setq ret (decode-char 'ideograph-daikanwa a-m-m))
		  (if (= (get-char-attribute ret 'ideographic-radical)
			 (get-char-attribute a 'ideographic-radical))
		      (setq a-s (char-ideographic-strokes ret))
		    (setq a-s (char-ideographic-strokes a))))
	      (if (setq m (get-char-attribute a '->mojikyo))
		  (setq a-s (char-ideographic-strokes
			     (decode-char 'mojikyo m)))
		(setq a-s (char-ideographic-strokes a)))))
	(setq a-s (char-ideographic-strokes a))))
    (if b-m-m
	(setq b-s (char-ideographic-strokes b))
      (setq b-m-r (get-char-attribute b 'morohashi-daikanwa))
      (if b-m-r
	  (progn
	    (setq b-m-m (car b-m-r)
		  b-m-r (cdr b-m-r))
	    (if (= (car b-m-r) 0)
		(progn
		  (setq ret (decode-char 'ideograph-daikanwa b-m-m))
		  (if (= (get-char-attribute ret 'ideographic-radical)
			 (get-char-attribute b 'ideographic-radical))
		      (setq b-s (char-ideographic-strokes ret))
		    (setq b-s (char-ideographic-strokes b))))
	      (if (setq m (get-char-attribute b '->mojikyo))
		  (setq b-s (char-ideographic-strokes
			     (decode-char 'mojikyo m)))
		(setq b-s (char-ideographic-strokes b)))))
	(setq b-s (char-ideographic-strokes b))))
    (if a-s
	(if b-s
	    (if (= a-s b-s)
		(if a-m-m
		    (if b-m-m
			(morohashi-daikanwa< (cons a-m-m a-m-r)
					     (cons b-m-m b-m-r))
		      t)
		  (if b-m-m
		      nil
		    (setq a-u (get-char-attribute a 'ucs)
			  b-u (get-char-attribute b 'ucs))
		    (if a-u
			(if b-u
			    (< a-u b-u)
			  (setq b-u (get-char-attribute b '->ucs))
			  (if b-u
			      (<= a-u b-u)
			    t))
		      (setq a-u (get-char-attribute a '->ucs))
		      (if a-u
			  (if b-u
			      (< a-u b-u)
			    (setq b-u (get-char-attribute b '->ucs))
			    (if b-u
				(< a-u b-u)
			      t))
			(if (or b-u (get-char-attribute b '->ucs))
			    nil
			  (< (char-int a)(char-int b)))))))
	      (< a-s b-s))
	  t))))

;; (defun ideograph-char< (a b)
;;   (let (ra rb mma mmb msa msb)
;;     (cond
;;      ((progn
;;         (if (setq ra (or (get-char-attribute a 'non-morohashi)
;;                          (get-char-attribute a 'morohashi-daikanwa)))
;;             (setq msa (cdr ra)
;;                   mma (car ra))
;;           (setq mma (get-char-attribute a 'ideograph-daikanwa))))
;;       (cond
;;        ((progn
;;           (if (setq rb (or (get-char-attribute b 'non-morohashi)
;;                            (get-char-attribute b 'morohashi-daikanwa)))
;;               (setq msb (cdr rb)
;;                     mmb (car rb))
;;             (setq mmb (get-char-attribute b 'ideograph-daikanwa))))
;;         (cond
;;          ((= mma mmb)
;;           (cond ((eq (car msa)(car msb))
;;                  (cond ((< (length msa)(length msb)))
;;                        ((= (length msa)(length msb))
;;                         (cond ((integerp (nth 1 msa))
;;                                (cond ((integerp (nth 1 msb))
;;                                       (< (nth 1 msa)(nth 1 msb)))
;;                                      (t nil)))
;;                               (t
;;                                (cond ((setq ra (get-char-attribute a 'ucs))
;;                                       (cond
;;                                        ((setq rb (get-char-attribute b 'ucs))
;;                                         (< ra rb))
;;                                        (t))))))))
;;                  )
;;                 ((null (car msa)))
;;                 ((null (car msb))
;;                  nil)
;;                 (t (< (car msa)(car msb)))))
;;          (t (< mma mmb))))
;;        (t)))
;;      ((or (get-char-attribute b 'non-morohashi)
;;           (get-char-attribute b 'morohashi-daikanwa)
;;           (get-char-attribute b 'ideograph-daikanwa))
;;       nil)
;;      ((setq ra (get-char-attribute a 'ucs))
;;       (cond
;;        ((setq rb (get-char-attribute b 'ucs))
;;         (< ra rb))))
;;      (t
;;       (cond
;;        ((setq ra (char-ideographic-strokes a))
;;         (cond ((setq rb (char-ideographic-strokes b))
;;                (cond ((= ra rb)
;;                       (not (char-ideographic-strokes b)))
;;                      ((< ra rb))))))
;;        )))))

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

(provide 'ideograph-util)

;;; ideograph-util.el ends here
