;;; ideograph-util.el --- Ideographic Character Database utility

;; Copyright (C) 1999 MORIOKA Tomohiko.

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

(require 'char-db-util)

(defvar ideograph-radical-chars-vector
  (make-vector 215 nil))

(defun char-ideograph-radical (char)
  (or (get-char-attribute char 'ideographic-radical)
      (let ((radical
	     (or (get-char-attribute char 'daikanwa-radical)
		 (get-char-attribute char 'kangxi-radical)
		 (get-char-attribute char 'japanese-radical)
		 (get-char-attribute char 'korean-radical))))
	(when radical
	  (put-char-attribute char 'ideographic-radical radical)
	  radical))))

(defun char-ideograph-strokes (char)
  (or (get-char-attribute char 'ideographic-strokes)
      (let ((strokes
	     (or (get-char-attribute char 'daikanwa-strokes)
		 (get-char-attribute char 'kangxi-strokes)
		 (get-char-attribute char 'japanese-strokes)
		 (get-char-attribute char 'korean-strokes))))
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
	ret)
    (while (<= i #x9FFF)
      (setq char (int-char i))
      (when (setq radical (char-ideograph-radical char))
	(or (get-char-attribute char 'ucs)
	    (put-char-attribute char 'ucs i))
	(if (not (memq char
		       (setq ret
			     (aref ideograph-radical-chars-vector radical))))
	    (aset ideograph-radical-chars-vector radical
		  (cons char ret))))
      (setq i (1+ i)))
    (setq i #x100000)
    (while (<= i #x10FFFF)
      (setq char (int-char i))
      (when (setq radical (char-ideograph-radical char))
	(if (not (memq char
		       (setq ret
			     (aref ideograph-radical-chars-vector radical))))
	    (aset ideograph-radical-chars-vector radical
		  (cons char ret))))
      (setq i (1+ i)))
    (setq i 0)
    (while (< i 256)
      (setq j 0)
      (while (< j 256)
	(setq char (make-char 'ideograph-daikanwa i j))
	(if (and (setq radical (char-ideograph-radical char))
		 (not
		  (memq char
			(setq ret
			      (aref ideograph-radical-chars-vector radical)))))
	    (aset ideograph-radical-chars-vector radical
		  (cons char ret)))
	(setq j (1+ j)))
      (setq i (1+ i)))
    (while charsets
      (setq i 33)
      (while (< i 127)
	(setq j 33)
	(while (< j 127)
	  (setq char (make-char (car charsets) i j))
	  (if (and (setq radical (char-ideograph-radical char))
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

(defun ideograph-char< (a b)
  (let (ra rb)
    (cond
     ((setq ra (or (get-char-attribute a 'morohashi-daikanwa)
		   (get-char-attribute a 'non-morohashi)))
      (cond
       ((setq rb (or (get-char-attribute b 'morohashi-daikanwa)
		     (get-char-attribute b 'non-morohashi)))
	(cond
	 ((= (car ra)(car rb))
	  (cond ((eq (car (cdr ra))(car (cdr rb)))
		 (cond ((< (length ra)(length rb)))
		       ((= (length ra)(length rb))
			(cond ((integerp (nth 2 ra))
			       (cond ((integerp (nth 2 rb))
				      (< (nth 2 ra)(nth 2 rb)))
				     (t nil)))
			      (t
			       (cond ((setq ra (get-char-attribute a 'ucs))
				      (cond
				       ((setq rb (get-char-attribute b 'ucs))
					(< ra rb))
				       (t))))))))
		 )
		((null (car (cdr ra))))
		((null (car (cdr rb)))
		 nil)
		(t (< (car (cdr ra))(car (cdr rb))))))
	 (t (< (car ra)(car rb)))))
       ((setq ra (get-char-attribute a 'ucs))
	(cond
	 ((setq rb (get-char-attribute b 'ucs))
	  (< ra rb))))
       (t
	(cond
	 ((setq ra (char-ideograph-strokes a))
	  (cond ((setq rb (char-ideograph-strokes b))
		 (cond ((= ra rb)
			(not (char-ideograph-strokes b)))
		       ((< ra rb))))))
	 )))))))

(defun insert-ideograph-radical-char-data (radical)
  (let ((chars
	 (sort (copy-list (aref ideograph-radical-chars-vector radical))
	       (function ideograph-char<))))
    (while chars
      (insert-char-data (car chars))
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
