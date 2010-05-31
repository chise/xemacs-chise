;;; chise-subr.el --- basic lisp subroutines for XEmacs CHISE

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

;;;###autoload
(defun char-attribute-name< (ka kb)
  (cond
   ((eq '->denotational kb)
    t)
   ((eq '->subsumptive kb)
    (not (eq '->denotational ka)))
   ((eq '->denotational ka)
    nil)
   ((eq '->subsumptive ka)
    nil)
   ((and (symbolp ka)
	 (string-match "^->" (symbol-name ka)))
    (cond ((and (symbolp kb)
		(string-match "^->" (symbol-name kb)))
	   (string< (symbol-name ka)
		    (symbol-name kb))
	   ))
    )
   ((and (symbolp kb)
	 (string-match "^->" (symbol-name kb)))
    t)
   ((and (symbolp ka)
	 (string-match "^<-" (symbol-name ka)))
    (cond ((symbolp kb)
	   (cond ((string-match "^<-" (symbol-name kb))
		  (string< (symbol-name ka)
			   (symbol-name kb))
		  )
                 ;; ((string-match "^->" (symbol-name kb))
                 ;;  t)
		 )))
    )
   ((and (symbolp kb)
	 (string-match "^<-" (symbol-name kb)))
    t
    ;; (not (string-match "^->" (symbol-name ka)))
    )
   ((find-charset ka)
    (if (find-charset kb)
	(let (a-ir b-ir)
	  (if (setq a-ir (charset-property ka 'iso-ir))
	      (if (setq b-ir (charset-property kb 'iso-ir))
		  (cond
		   ((= a-ir b-ir)
		    (< (charset-id ka)(charset-id kb))
		    )
		   ((= a-ir 177)
		    t)
		   ((= b-ir 177)
		    nil)
		   ((< a-ir
		       b-ir)
		    ))
		t)
	    (if (charset-property kb 'iso-ir)
		nil
	      (< (charset-id ka)(charset-id kb)))))
      nil)
    )
   ((find-charset kb))
   ((symbolp ka)
    (cond ((symbolp kb)
	   (string< (symbol-name ka)
		    (symbol-name kb)))
	  (t)))
   ((symbolp kb)
    nil)))


;;; @ end
;;;

(provide 'chise-subr)

;;; chise-subr.el ends here
