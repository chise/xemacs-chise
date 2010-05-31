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

;;; @ radical
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


;;; @ end
;;;

(provide 'ideograph-subr)

;;; ideograph-subr.el ends here
