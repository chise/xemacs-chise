;;; thai-xtis.el --- Thai support for pre-composed font (for XTIS).

;; Copyright (C) 1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.

;; Author: TAKAHASHI Naoto <ntakahas@etl.go.jp>
;;         MORIOKA Tomohiko <tomo@etl.go.jp>
;; Created: 1998-03-27 for Emacs-20.3 by TAKAHASHI Naoto
;;	    1999-03-29 imported and modified for XEmacs	by MORIOKA Tomohiko

;; Keywords: mule, multilingual, Thai, XTIS

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:

;; For Thai, the pre-composed character set proposed by
;; Virach Sornlertlamvanich <virach@links.nectec.or.th> is supported.

;;; Code:

(when (featurep 'xemacs)
  (make-charset 'thai-xtis "Precomposed Thai (XTIS by Virach)."
		'(registry "xtis-0$"
			   dimension 2
			   chars 94
			   final ??
			   graphic 0))

  (modify-syntax-entry 'thai-xtis "w")

  (define-category ?T "Precomposed Thai character.")
  (modify-category-entry 'thai-xtis ?T)
  )


(defvar leading-code-private-21 #x9F)

(defconst thai-xtis-leading-code
  (concat (char-to-string leading-code-private-21)
	  (char-to-string (charset-id 'thai-xtis))))

(define-ccl-program ccl-thai-xtis-consonant
  `(0
    (if (r1 == 0)
	((write ,thai-xtis-leading-code)
	 (write r0)
	 (r1 = r2))
      (if (r1 == r2)
	  ((write r1)
	   (write ,thai-xtis-leading-code)
	   (write r0))
	((write r1)
	 (write ,thai-xtis-leading-code)
	 (write r0)
	 (r1 = r2))))))

(define-ccl-program ccl-thai-xtis-vowel-d1
  `(0
    (if (r1 == 0)
	((write ,thai-xtis-leading-code)
	 (write r0 r2))
      (if (r1 == r2)
	  (r1 = ?\xb8)
	((write r1)
	 (write ,thai-xtis-leading-code)
	 (write r0 r2)
	 (r1 = 0))))))

(define-ccl-program ccl-thai-xtis-vowel
  `(0
    (if (r1 == 0)
	((write ,thai-xtis-leading-code)
	 (write r0 r2))
      (if (r1 == r2)
	  (r1 = ((r0 - 188) << 3))
	((write r1)
	 (write ,thai-xtis-leading-code)
	 (write r0 r2)
	 (r1 = 0))))))

(define-ccl-program ccl-thai-xtis-vowel-ee
  `(0
    (if (r1 == 0)
	((write ,thai-xtis-leading-code)
	 (write r0 r2))
      (if (r1 == r2)
	  (r1 = ?\xf8)
	((write r1)
	 (write ,thai-xtis-leading-code)
	 (write r0 r2)
	 (r1 = 0))))))

(define-ccl-program ccl-thai-xtis-tone
  `(0
    (if (r1 == 0)
	((write ,thai-xtis-leading-code)
	 (write r0 r2))
      (if (r1 == r2)
	  ((r0 -= 54)
	   (write r0)
	   (r1 = 0))
	((r1 += (r0 - ?\xe6))
	 (write r1)
	 (r1 = 0))))))

(define-ccl-program ccl-thai-xtis-symbol
  `(0
    (if (r1 == 0)
	((write ,thai-xtis-leading-code)
	 (write r0 r2))
      (if (r1 == r2)
	  ((write r2)
	   (write ,thai-xtis-leading-code)
	   (write r0 r2)
	   (r1 = 0))
	((write r1)
	 (write ,thai-xtis-leading-code)
	 (write r0 r2)
	 (r1 = 0))))))

(define-ccl-program ccl-decode-thai-xtis
  `(4
    ((read r0)
     (r1 = 0)
     (r2 = ?\xb0)
     (loop
      (if (r0 < 161)
	  (if (r1 == 0)
	      (write r0)
	    (if (r1 == r2)
		((write r2 r0)
		 (r1 = 0))
	      ((write r1 r0)
	       (r1 = 0))))
	(branch (r0 - 161)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-consonant)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-vowel-d1)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-vowel)
		(call ccl-thai-xtis-vowel)
		(call ccl-thai-xtis-vowel)
		(call ccl-thai-xtis-vowel)
		(call ccl-thai-xtis-vowel)
		(call ccl-thai-xtis-vowel)
		(call ccl-thai-xtis-vowel)
		nil
		nil
		nil
		nil
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-tone)
		(call ccl-thai-xtis-vowel-ee)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		(call ccl-thai-xtis-symbol)
		nil
		nil
		nil))
      (read r0)
      (repeat)))

    (if (r1 != 0)
	(write r1)
      nil)))

(define-ccl-program ccl-encode-thai-xtis
  `(1
    ((read r0)
     (loop
      (if (r0 == ,leading-code-private-21)
	  ((read r1)
	   (if (r1 == ,(charset-id 'thai-xtis))
	       ((read r0)
		(write r0)
		(read r0)
		(r1 = (r0 & 7))
		(r0 = ((r0 - ?\xb0) >> 3))
		(if (r0 != 0)
		    (write r0 [0 209 212 213 214 215 216 217 218 238]))
		(if (r1 != 0)
		    (write r1 [0 231 232 233 234 235 236 237]))
		(read r0)
		(repeat))
	     ((write r0 r1)
	      (read r0)
	      (repeat))))
	(write-read-repeat r0))))))

(if (featurep 'xemacs)
    (make-coding-system
     'tis-620 'ccl
     "external=tis620, internal=thai-xtis"
     `(mnemonic "TIS620"
       decode ,ccl-decode-thai-xtis
       encode ,ccl-encode-thai-xtis))
  (make-coding-system
   'tis-620 4 ?T "external=tis620, internal=thai-xtis"
   '(ccl-decode-thai-xtis . ccl-encode-thai-xtis)
   '((safe-charsets . t)))
  )


(set-language-info-alist
 "Thai-XTIS"
 '((setup-function . setup-thai-xtis-environment)
   (exit-function . exit-thai-xtis-environment)
   (charset thai-xtis)
   (coding-system tis-620 iso-2022-7bit)
   (coding-priority tis-620 iso-2022-7bit)
   (sample-text . "$(?!:(B")
   (documentation . t)))

;; thai-xtis.el ends here.
