;;; hebrew.el --- Support for Hebrew

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.

;; Keywords: multilingual, Hebrew

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; For Hebrew, the character sets ISO8859-8 is supported.

;;; Code:

;; Syntax of Hebrew characters
(loop for c from 96 to 122
      do (modify-syntax-entry (make-char 'hebrew-iso8859-8 c) "w"))
(modify-syntax-entry (make-char 'hebrew-iso8859-8 32) "w") ; no-break space


;; (make-coding-system
;;  'hebrew-iso-8bit 2 ?8
;;  "ISO 2022 based 8-bit encoding for Hebrew (MIME:ISO-8859-8)"
;;  '((ascii t) (hebrew-iso8859-8 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil nil t))

;; (define-coding-system-alias 'iso-8859-8 'hebrew-iso-8bit)

(make-coding-system
 'iso-8859-8 'iso2022
 "MIME ISO-8859-8"
 '(charset-g0 ascii
   charset-g1 hebrew-iso8859-8
   charset-g2 t
   charset-g3 t
   no-iso6429 t
   mnemonic "MIME/Hbrw"
))

(make-coding-system
 'ctext-hebrew 'iso2022
 "Coding-system of Hebrew."
 '(charset-g0 ascii
   charset-g1 hebrew-iso8859-8
   charset-g2 t
   charset-g3 t
   mnemonic "CText/Hbrw"
   ))

(defun setup-hebrew-environment ()
  "Setup multilingual environment (MULE) for Hebrew.
But, please note that right-to-left writing is not yet supported."
  (interactive)
  (setup-8-bit-environment "Hebrew" 'hebrew-iso8859-8 'iso-8859-8
			   "hebrew")
  (set-coding-category-system 'iso-8-designate 'iso-8859-8)
  (set-coding-priority-list
   '(iso-8-designate
     iso-8-1
     iso-7
     iso-8-2
     iso-lock-shift
     no-conversion
     shift-jis
     big5))
  )

(set-language-info-alist
 "Hebrew" '((setup-function . setup-hebrew-environment)
	    (describe-function . describe-hebrew-support)
	    (charset . (hebrew-iso8859-8))
	    (coding-system . (iso-8859-8))
	    (sample-text . "Hebrew	,Hylem(B")
	    (documentation . "Right-to-left writing is not yet supported.")
	    ))

;;; hebrew.el ends here
