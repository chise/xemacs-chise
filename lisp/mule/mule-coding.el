;;; mule-coding.el --- Coding-system functions for Mule.

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1995 Amdahl Corporation.
;; Copyright (C) 1995 Sun Microsystems.
;; Copyright (C) 1997,1999,2002 MORIOKA Tomohiko

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
;; along with XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; split off of mule.el and mostly moved to coding.el

;;; Code:

(defun coding-system-force-on-output (coding-system register)
  "Return the 'force-on-output property of CODING-SYSTEM for the specified REGISTER."
  (check-type register integer)
  (coding-system-property
   coding-system
   (case register
     (0 'force-g0-on-output)
     (1 'force-g1-on-output)
     (2 'force-g2-on-output)
     (3 'force-g3-on-output)
     (t (signal 'args-out-of-range (list register 0 3))))))

(defun coding-system-short (coding-system)
  "Return the 'short property of CODING-SYSTEM."
  (coding-system-property coding-system 'short))

(defun coding-system-no-ascii-eol (coding-system)
  "Return the 'no-ascii-eol property of CODING-SYSTEM."
  (coding-system-property coding-system 'no-ascii-eol))

(defun coding-system-no-ascii-cntl (coding-system)
  "Return the 'no-ascii-cntl property of CODING-SYSTEM."
  (coding-system-property coding-system 'no-ascii-cntl))

(defun coding-system-seven (coding-system)
  "Return the 'seven property of CODING-SYSTEM."
  (coding-system-property coding-system 'seven))

(defun coding-system-lock-shift (coding-system)
  "Return the 'lock-shift property of CODING-SYSTEM."
  (coding-system-property coding-system 'lock-shift))

;;(defun coding-system-use-japanese-jisx0201-roman (coding-system)
;;  "Return the 'use-japanese-jisx0201-roman property of CODING-SYSTEM."
;;  (coding-system-property coding-system 'use-japanese-jisx0201-roman))

;;(defun coding-system-use-japanese-jisx0208-1978 (coding-system)
;;  "Return the 'use-japanese-jisx0208-1978 property of CODING-SYSTEM."
;;  (coding-system-property coding-system 'use-japanese-jisx0208-2978))

(defun coding-system-no-iso6429 (coding-system)
  "Return the 'no-iso6429 property of CODING-SYSTEM."
  (coding-system-property coding-system 'no-iso6429))

(defun coding-system-ccl-encode (coding-system)
  "Return the CCL 'encode property of CODING-SYSTEM."
  (coding-system-property coding-system 'encode))

(defun coding-system-ccl-decode (coding-system)
  "Return the CCL 'decode property of CODING-SYSTEM."
  (coding-system-property coding-system 'decode))


;;;; Definitions of predefined coding systems

(make-coding-system
 'ctext 'iso2022
 "Coding-system used in X as Compound Text Encoding."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   eol-type nil
   mnemonic "CText"))

;;; iso-8859-1 and ctext are aliases.

;; (copy-coding-system 'ctext 'iso-8859-1)
(make-coding-system
 'iso-8859-1 'no-conversion
 "Coding-system used in X as Compound Text Encoding."
 '(eol-type nil mnemonic "Noconv"))

(make-coding-system
 'iso-2022-8bit-ss2 'iso2022
 "ISO-2022 coding system using SS2 for 96-charset in 8-bit code."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   charset-g2 t ;; unspecified but can be used later.
   short t
   mnemonic "ISO8/SS"
   ))

(make-coding-system
 'iso-2022-7bit-ss2 'iso2022
 "ISO-2022 coding system using SS2 for 96-charset in 7-bit code."
 '(charset-g0 ascii
   charset-g2 t ;; unspecified but can be used later.
   seven t
   short t
   mnemonic "ISO7/SS"
   eol-type nil))

;; (copy-coding-system 'iso-2022-7bit-ss2 'iso-2022-jp-2)
(make-coding-system
 'iso-2022-jp-2 'iso2022
 "ISO-2022 coding system using SS2 for 96-charset in 7-bit code."
 '(charset-g0 ascii
   charset-g2 t ;; unspecified but can be used later.
   seven t
   short t
   mnemonic "ISO7/SS"
   eol-type nil))

(make-coding-system
 'iso-2022-7bit 'iso2022
 "ISO 2022 based 7-bit encoding using only G0"
 '(charset-g0 ascii
   seven t
   short t
   mnemonic "ISO7"))

;; compatibility for old XEmacsen
(copy-coding-system 'iso-2022-7bit 'iso-2022-7)

(make-coding-system
 'iso-2022-8 'iso2022
 "ISO-2022 eight-bit coding system.  No single-shift or locking-shift."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   short t
   mnemonic "ISO8"
   ))

(make-coding-system
 'escape-quoted 'iso2022
 "ISO-2022 eight-bit coding system with escape quoting; used for .ELC files."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   eol-type lf
   escape-quoted t
   mnemonic "ESC/Quot"
   ))

(make-coding-system
 'iso-2022-lock 'iso2022
 "ISO-2022 coding system using Locking-Shift for 96-charset."
 '(charset-g0 ascii
   charset-g1 t ;; unspecified but can be used later.
   seven t
   lock-shift t
   mnemonic "ISO7/Lock"
   ))

(when (featurep 'utf-2000)
  (setq coded-charset-entity-reference-alist
	'(((chinese-big5-cdp . isolated)       "I-CDP-" 4 X)
	  ( chinese-big5-cdp		         "CDP-" 4 X)
	  ((ideograph-daikanwa . isolated)       "I-M-" 5 d)
	  ( ideograph-daikanwa                     "M-" 5 d)
	  ((ideograph-cbeta . isolated)          "I-CB" 5 d)
	  ( ideograph-cbeta   		           "CB" 5 d)
	  ((ideograph-gt . isolated)            "I-GT-" 5 d)
	  ( ideograph-gt   		          "GT-" 5 d)
	  ((japanese-jisx0208-1990 . isolated) "I-J90-" 4 X)
	  ( japanese-jisx0208-1990  	         "J90-" 4 X)
	  ((japanese-jisx0208 . isolated)      "I-J83-" 4 X)
	  ( japanese-jisx0208   		 "J83-" 4 X)
	  ((chinese-cns11643-1 . isolated)      "I-C1-" 4 X)
	  ( chinese-cns11643-1                    "C1-" 4 X)
	  ((chinese-cns11643-2 . isolated)      "I-C2-" 4 X)
	  ( chinese-cns11643-2                    "C2-" 4 X)
	  ((chinese-cns11643-3 . isolated)      "I-C3-" 4 X)
	  ( chinese-cns11643-3                    "C3-" 4 X)
	  ((chinese-cns11643-4 . isolated)      "I-C4-" 4 X)
	  ( chinese-cns11643-4                    "C4-" 4 X)
	  ((chinese-cns11643-5 . isolated)      "I-C5-" 4 X)
	  ( chinese-cns11643-5                    "C5-" 4 X)
	  ((chinese-cns11643-6 . isolated)      "I-C6-" 4 X)
	  ( chinese-cns11643-6                    "C6-" 4 X)
	  ((chinese-cns11643-7 . isolated)      "I-C7-" 4 X)
	  ( chinese-cns11643-7                    "C7-" 4 X)
	  ))

  (make-coding-system
   'utf-8-mcs-er 'utf-8
   "Coding-system of UTF-8 with entity-reference."
   '(mnemonic "MTF8r" use-entity-reference t))

  (make-coding-system
   'utf-8-gb 'utf-8
   "Coding-system of UTF-8 using GB mapping."
   '(mnemonic "UTF8G"
	      charset-g0 ucs
	      charset-g1 =>ucs))

  (make-coding-system
   'utf-8-gb-er 'utf-8
   "Coding-system of UTF-8 using GB mapping with entity-reference."
   '(mnemonic "UTF8Gr"
	      charset-g0 ucs
	      charset-g1 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-cns 'utf-8
   "Coding-system of UTF-8 using CNS mapping."
   '(mnemonic "UTF8C"
	      charset-g0 ucs-cns
	      charset-g1 =>ucs-cns
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-cns-er 'utf-8
   "Coding-system of UTF-8 using CNS mapping with entity-reference."
   '(mnemonic "UTF8Cr"
	      charset-g0 ucs-cns
	      charset-g1 =>ucs-cns
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-big5 'utf-8
   "Coding-system of UTF-8 using Big5 mapping."
   '(mnemonic "UTF8B"
	      charset-g0 ucs-big5
	      charset-g1 =>ucs-big5
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-big5-er 'utf-8
   "Coding-system of UTF-8 using Big5 mapping with entity-reference."
   '(mnemonic "UTF8Br"
	      charset-g0 ucs-big5
	      charset-g1 =>ucs-big5
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-jis 'utf-8
   "Coding-system of UTF-8 using JIS mapping."
   '(mnemonic "UTF8J"
	      charset-g0 ucs-jis
	      charset-g1 =>ucs-jis
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-jis-er 'utf-8
   "Coding-system of UTF-8 using JIS mapping with entity-reference."
   '(mnemonic "UTF8Jr"
	      charset-g0 ucs-jis
	      charset-g1 =>ucs-jis
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ks 'utf-8
   "Coding-system of UTF-8 using KS mapping."
   '(mnemonic "UTF8K"
	      charset-g0 ucs-ks
	      charset-g1 =>ucs-ks
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-ks-er 'utf-8
   "Coding-system of UTF-8 using KS mapping with entity-reference."
   '(mnemonic "UTF8Kr"
	      charset-g0 ucs-ks
	      charset-g1 =>ucs-ks
	      charset-g2 =>ucs
	      use-entity-reference t))

  (define-coding-system-alias 'utf-8 'utf-8-mcs)
  (define-coding-system-alias 'utf-8-er 'utf-8-mcs-er)
  )

;; initialize the coding categories to something semi-reasonable
;; so that the remaining Lisp files can contain extended characters.
;; (They will be in ISO-7 format)
;; #### This list needs to be synched with the ones in mule-cmds.el.

(if (featurep 'utf-2000)
    (set-coding-priority-list '(iso-7
				no-conversion
				utf-8
				iso-8-1
				iso-8-2
				iso-8-designate
				iso-lock-shift
				shift-jis
				big5
				ucs-4))
  (set-coding-priority-list '(iso-7
			      no-conversion
			      ;; utf-8
			      iso-8-1
			      iso-8-2
			      iso-8-designate
			      iso-lock-shift
			      shift-jis
			      big5
			      ;; ucs-4
			      )))

(set-coding-category-system 'iso-7 'iso-2022-7)
(set-coding-category-system 'iso-8-designate 'ctext)
(set-coding-category-system 'iso-8-1 'ctext)
(set-coding-category-system 'iso-lock-shift 'iso-2022-lock)
(set-coding-category-system 'no-conversion 'no-conversion)

(setq-default buffer-file-coding-system 'iso-2022-8)

;;; mule-coding.el ends here
