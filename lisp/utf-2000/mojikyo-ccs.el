;;; mojikyo-ccs.el.el --- Definition of Mojikyo related coded-charsets

;; Copyright (C) 2001,2002 MORIOKA Tomohiko.

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

(make-charset 'mojikyo
	      "Mojikyo"
	      `(long-name "Mojikyo"
			  chars 256
			  dimension 3
			  columns 2
			  graphic 2
			  direction l2r
			  min-code ,(lsh #x6000 16)
			  max-code ,(1- (+ (lsh #x6000 16)
					   (* 94 60 22)))
			  code-offset ,(lsh #x6000 16)))

(make-charset 'mojikyo-2022-1
	      "Mojikyo-2022-1"
	      `(long-name "Mojikyo for ISO 2022 based CES, Part 1"
			  chars 94
			  dimension 3
			  columns 2
			  graphic 0
			  direction l2r
			  mother mojikyo
			  min-code 0
			  max-code ,(1- (* 94 94 60))
			  code-offset 1
			  conversion 94x94x60))

(let ((i 1)
      name)
  (while (<= i 21)
    (make-charset (setq name (intern (format "mojikyo-pj-%d" i)))
		  (format "Mojikyo PJ %d" i)
		  `(long-name ,(format "Mojikyo Psedo JIS Part %d" i)
			      chars 94
			      dimension 2
			      columns 2
			      graphic 0
			      registry ,(format "MojikyoPJ-%d" i)
			      direction l2r
			      mother mojikyo
			      min-code ,(1+ (* 94 60 (1- i)))
			      max-code ,(* 94 60 i)
			      code-offset ,(1+ (* 94 60 (1- i)))
			      conversion 94x60))
    (setq i (1+ i))))

;;; mojikyo-ccs.el.el ends here
