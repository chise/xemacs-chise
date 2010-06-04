;;; ideograph-subr.el --- basic lisp subroutines about Ideographs -*- coding: utf-8-er; -*-

;; Copyright (C) 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
;;   2007, 2008, 2009, 2010 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CHISE, Character Database, ISO/IEC 10646, UCS, Unicode, MULE.

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

;;; @ radical code
;;;

(defconst ideographic-radicals
  (let ((v (make-vector 215 nil))
	(i 1))
    (while (< i 215)
      (aset v i (decode-char '=ucs (+ #x2EFF i)))
      (setq i (1+ i)))
    v))

;;;###autoload
(defun ideographic-radical (number)
  "Return character corresponding with Kangxi-radical number."
  (aref ideographic-radicals number))


;;; @ char feature
;;;

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
   char ignore-sisters))


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


;;;###autoload
(defun char-ideographic-strokes-from-domains (char domains &optional radical)
  (if radical
      (get-char-feature-from-domains char 'ideographic-strokes domains
				     'ideographic-radical radical)
    (get-char-feature-from-domains char 'ideographic-strokes domains)))



;;; @ end
;;;

(provide 'ideograph-subr)

;;; ideograph-subr.el ends here
