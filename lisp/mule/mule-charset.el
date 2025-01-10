;;; mule-charset.el --- Charset functions for Mule.

;; Copyright (C) 1992 Free Software Foundation, Inc.
;; Copyright (C) 1995 Amdahl Corporation.
;; Copyright (C) 1996 Sun Microsystems.
;; Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2007, 2008,
;;   2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019,
;;   2020, 2021, 2022, 2023, 2024, 2025 MORIOKA Tomohiko

;; Author: Unknown
;; Keywords: i18n, mule, internal

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

;;; Synched up with: Not synched.  API at source level synched with FSF 20.3.9.

;;; Commentary:

;; These functions are not compatible at the bytecode level with Emacs/Mule,
;; and they never will be.  -sb [1999-05-26]

;;; Code:

;;;; Classifying text according to charsets

(defun charsets-in-region (start end &optional buffer)
  "Return a list of the charsets in the region between START and END.
BUFFER defaults to the current buffer if omitted."
  (let (list)
    (save-excursion
      (if buffer
	  (set-buffer buffer))
      (save-restriction
	(narrow-to-region start end)
	(goto-char (point-min))
	(while (not (eobp))
	  (let* (prev-charset
		 (ch (char-after (point)))
		 (charset (char-charset ch)))
	    (if (not (eq prev-charset charset))
		(progn
		  (setq prev-charset charset)
		  (or (memq charset list)
		      (setq list (cons charset list))))))
	  (forward-char))))
    list))

(defun charsets-in-string (string)
  "Return a list of the charsets in STRING."
  (let ((i 0)
 	(len (length string))
 	prev-charset charset list)
    (while (< i len)
      (setq charset (char-charset (aref string i)))
      (if (not (eq prev-charset charset))
 	  (progn
 	    (setq prev-charset charset)
 	    (or (memq charset list)
 		(setq list (cons charset list)))))
      (setq i (1+ i)))
    list))


;;;; Charset accessors

(defun charset-iso-graphic-plane (charset)
  "Return the `graphic' property of CHARSET.
See `make-charset'."
  (charset-property charset 'graphic))

(defun charset-iso-final-char (charset)
  "Return the final byte of the ISO 2022 escape sequence designating CHARSET."
  (charset-property charset 'final))

(defun charset-chars (charset)
  "Return the number of characters per dimension of CHARSET."
  (charset-property charset 'chars))

(defun charset-width (charset)
  "Return the number of display columns per character of CHARSET.
This only applies to TTY mode (under X, the actual display width can
be automatically determined)."
  (charset-property charset 'columns))

;; #### FSFmacs returns 0
(defun charset-direction (charset)
  "Return the display direction (0 for `l2r' or 1 for `r2l') of CHARSET.
Only left-to-right is currently implemented."
  (if (eq (charset-property charset 'direction) 'l2r)
      0
    1))

;; Not in Emacs/Mule
(defun charset-registry (charset)
  "Return the registry of CHARSET.
This is a regular expression matching the registry field of fonts
that can display the characters in CHARSET."
  (charset-property charset 'registry))

(defun charset-ccl-program (charset)
  "Return the CCL program of CHARSET.
See `make-charset'."
  (charset-property charset 'ccl-program))

(defun charset-bytes (charset)
  "Useless in XEmacs, returns 1."
   1)

(define-obsolete-function-alias 'charset-columns 'charset-width) ;; 19990409
(define-obsolete-function-alias 'charset-final 'charset-iso-final-char) ;; 19990409
(define-obsolete-function-alias 'charset-graphic 'charset-iso-graphic-plane) ;; 19990409
(define-obsolete-function-alias 'charset-doc-string 'charset-description) ;; 19990409

;;;; Define setf methods for all settable Charset properties

(defsetf charset-registry    set-charset-registry)
(defsetf charset-ccl-program set-charset-ccl-program)

;;; FSF compatibility functions
(defun charset-after (&optional pos)
  "Return charset of a character in current buffer at position POS.
If POS is nil, it defauls to the current point.
If POS is out of range, the value is nil."
  (when (null pos)
    (setq pos (point)))
  (check-argument-type 'integerp pos)
  (unless (or (< pos (point-min))
	      (> pos (point-max)))
    (char-charset (char-after pos))))

;; Yuck!
;; We're not going to support this.
;(defun charset-info (charset)
;  "Return a vector of information of CHARSET.
;The elements of the vector are:
;        CHARSET-ID, BYTES, DIMENSION, CHARS, WIDTH, DIRECTION,
;        LEADING-CODE-BASE, LEADING-CODE-EXT,
;        ISO-FINAL-CHAR, ISO-GRAPHIC-PLANE,
;        REVERSE-CHARSET, SHORT-NAME, LONG-NAME, DESCRIPTION,
;        PLIST,
;where
;CHARSET-ID (integer) is the identification number of the charset.
;BYTES (integer) is the length of multi-byte form of a character in
;  the charset: one of 1, 2, 3, and 4.
;DIMENSION (integer) is the number of bytes to represent a character of
;the charset: 1 or 2.
;CHARS (integer) is the number of characters in a dimension: 94 or 96.
;WIDTH (integer) is the number of columns a character in the charset
;  occupies on the screen: one of 0, 1, and 2.
;DIRECTION (integer) is the rendering direction of characters in the
;  charset when rendering.  If 0, render from left to right, else
;  render from right to left.
;LEADING-CODE-BASE (integer) is the base leading-code for the
;  charset.
;LEADING-CODE-EXT (integer) is the extended leading-code for the
;  charset.  All charsets of less than 0xA0 has the value 0.
;ISO-FINAL-CHAR (character) is the final character of the
;  corresponding ISO 2022 charset.
;ISO-GRAPHIC-PLANE (integer) is the graphic plane to be invoked
;  while encoding to variants of ISO 2022 coding system, one of the
;  following: 0/graphic-plane-left(GL), 1/graphic-plane-right(GR).
;REVERSE-CHARSET (integer) is the charset which differs only in
;  LEFT-TO-RIGHT value from the charset.  If there's no such a
;  charset, the value is -1.
;SHORT-NAME (string) is the short name to refer to the charset.
;LONG-NAME (string) is the long name to refer to the charset
;DESCRIPTION (string) is the description string of the charset.
;PLIST (property list) may contain any type of information a user
;  want to put and get by functions `put-charset-property' and
;  `get-charset-property' respectively."
;  (vector
;   (charset-id charset)
;   1
;   (charset-dimension charset)
;   (charset-chars charset)
;   (charset-width charset)
;   (charset-direction charset)
;   nil ;; (charset-leading-code-base (charset))
;   nil ;; (charset-leading-code-ext (charset))
;   (charset-iso-final-char charset)
;   (charset-iso-graphic-plane charset)
;   -1
;   (charset-short-name charset)
;   (charset-long-name charset)
;   (charset-description charset)
;   (charset-plist charset)))

;(make-compatible 'charset-info "Don't use this if you can help it.")

(defun define-charset (charset-id charset property-vector)
  "Define CHARSET-ID as the identification number of CHARSET with INFO-VECTOR.
If CHARSET-ID is nil, it is decided automatically, which means CHARSET is
 treated as a private charset.
INFO-VECTOR is a vector of the format:
   [DIMENSION CHARS WIDTH DIRECTION ISO-FINAL-CHAR ISO-GRAPHIC-PLANE
    SHORT-NAME LONG-NAME DESCRIPTION]
The meanings of each elements is as follows:
DIMENSION (integer) is the number of bytes to represent a character: 1 or 2.
CHARS (integer) is the number of characters in a dimension: 94 or 96.
WIDTH (integer) is the number of columns a character in the charset
occupies on the screen: one of 0, 1, and 2.

DIRECTION (integer) is the rendering direction of characters in the
charset when rendering.  If 0, render from left to right, else
render from right to left.

ISO-FINAL-CHAR (character) is the final character of the
corresponding ISO 2022 charset.

ISO-GRAPHIC-PLANE (integer) is the graphic plane to be invoked
while encoding to variants of ISO 2022 coding system, one of the
following: 0/graphic-plane-left(GL), 1/graphic-plane-right(GR).


SHORT-NAME (string) is the short name to refer to the charset.

LONG-NAME (string) is the long name to refer to the charset.

DESCRIPTION (string) is the description string of the charset."
  (make-charset charset (aref property-vector 8)
		(list
		 'short-name (aref property-vector 6)
		 'long-name (aref property-vector 7)
		 'dimension (aref property-vector 0)
		 'columns (aref property-vector 2)
		 'chars (aref property-vector 1)
		 'final (aref property-vector 4)
		 'graphic (aref property-vector 5)
		 'direction (aref property-vector 3))))

(make-compatible 'define-charset "")

;;; Charset property

(defalias 'get-charset-property 'get)
(defalias 'put-charset-property 'put)
(defalias 'charset-plist 'object-plist)
(defalias 'set-charset-plist 'setplist)

;; Setup auto-fill-chars for charsets that should invoke auto-filling.
;; SPACE and NEWLIE are already set.
;; (let ((l '(katakana-jisx0201
;;            japanese-jisx0208 japanese-jisx0212
;;            chinese-gb2312 chinese-big5-1 chinese-big5-2)))
;;   (while l
;;     (put-char-table (car l) t auto-fill-chars)
;;     (setq l (cdr l))))


;;; @ Coded character set
;;;

(when (featurep 'utf-2000)
  (setq default-coded-charset-priority-list
	'(ascii
	  control-1
	  latin-iso8859-1
	  latin-iso8859-2
	  latin-iso8859-3
	  latin-iso8859-4
	  latin-iso8859-9
	  latin-jisx0201
	  cyrillic-iso8859-5
	  greek-iso8859-7
	  thai-tis620
	  =jis-x0208
	  =ucs-radicals
	  =ucs-radicals@unicode
	  =ucs-itaiji-001-additional-idc
	  ;; =ucs-bmp-cjk@JP
	  =mj-0
	  =mj-1
	  =ucs-bmp-cjk@JP/hanazono
	  =ucs-bmp-cjk@gb
	  =jis-x0208@1983
	  chinese-gb2312
	  =jis-x0208-1990
	  japanese-jisx0208-1978
	  =jis-x0212
	  chinese-cns11643-1
	  chinese-cns11643-2
	  chinese-cns11643-3
          chinese-cns11643-4
	  chinese-cns11643-5
	  chinese-cns11643-6
	  chinese-cns11643-7
	  =ucs-bmp-cjk@cns/2008
	  =adobe-japan1-0
	  =adobe-japan1-1
	  =adobe-japan1-2
	  =adobe-japan1-3
	  =adobe-japan1-4
	  =adobe-japan1-5
	  =adobe-japan1-6
	  =big5-cdp
	  =hanyo-denshi/ja
	  =hanyo-denshi/jb
	  =hanyo-denshi/jc
	  =hanyo-denshi/jd
	  =hanyo-denshi/ft
	  =hanyo-denshi/ia
	  =hanyo-denshi/ib
	  =hanyo-denshi/hg
	  =hanyo-denshi/ip
	  =hanyo-denshi/jt
	  =hanyo-denshi/ks/mf
	  =hanyo-denshi/tk/mf-01
	  =gt-pj-2
	  =gt-pj-3
	  =gt-pj-4
	  =gt-pj-5
	  =gt-pj-6
	  =gt-pj-7
	  =gt-pj-8
	  =gt-pj-9
	  =gt-pj-10
	  =gt-pj-11
	  =gt-pj-k1
	  =gt-pj-k2
	  chinese-big5-eten-a
	  chinese-big5-eten-b
	  chinese-big5
	  =jis-x0213-1-2000
	  =jis-x0213-2-2000
	  ;; chinese-gb12345
	  =gt-pj-1
	  =ucs-bmp-cjk
	  =ucs-sip-ext-b
	  =ucs-tip
	  =ucs-sip-ext-b@iso
	  =ucs-sip@JP/hanazono
	  =ucs-tip@JP/hanazono
	  =ucs-sip@gb
	  chinese-big5-1
	  chinese-big5-2
          ;; =zihai-17xx
	  =ucs-bmp-var-001
	  =ucs-sip-var-001
	  =ucs-tip-var-001
	  =ucs-bmp-var-002
	  =ucs-sip-var-002
	  =ucs-tip-var-002
	  =ucs-bmp-var-003
	  =ucs-sip-var-003
	  =ucs-tip-var-003
	  =ucs-bmp-var-004
	  =ucs-sip-var-004
	  =ucs-tip-var-004
	  =ucs-bmp-var-005
	  =ucs-sip-var-005
	  =ucs-bmp-var-006
	  =ucs-sip-var-006
	  =ucs-bmp-var-007
	  =ucs-tip-var-007
	  =ucs-bmp-var-008
	  =ucs-sip-var-008
	  =ucs-bmp-var-010
	  =ucs-sip-var-010
	  =ucs-bmp-itaiji-001
	  =ucs-sip-itaiji-001
	  =ucs-tip-itaiji-001
	  =ucs-bmp-itaiji-002
	  =ucs-sip-itaiji-002
	  =ucs-bmp-itaiji-003
	  =ucs-sip-itaiji-003
	  =ucs-bmp-itaiji-004
	  =ucs-sip-itaiji-004
	  =ucs-bmp-itaiji-005
	  =ucs-sip-itaiji-005
	  =ucs-bmp-itaiji-006
	  =ucs-sip-itaiji-006
	  =ucs-bmp-itaiji-007
	  =ucs-sip-itaiji-007
	  =ucs-bmp-itaiji-008
	  =ucs-sip-itaiji-008
	  =ucs-bmp-itaiji-009
	  =ucs-sip-itaiji-009
	  =ucs-bmp-itaiji-010
	  =ucs-sip-itaiji-010
	  =ucs-bmp-itaiji-011
	  =ucs-sip-itaiji-011
	  =ucs-bmp-itaiji-012
	  =ucs-sip-itaiji-012
	  =ucs-bmp-itaiji-013
	  =ucs-sip-itaiji-013
	  =ucs-bmp-itaiji-014
	  =ucs-sip-itaiji-014
	  =ucs-sip-itaiji-015
	  =ucs-bmp-itaiji-016
	  =ucs-bmp-itaiji-018
	  =ucs-bmp-itaiji-084
	  =big5-cdp-itaiji-001
	  =big5-cdp-itaiji-002
	  =big5-cdp-itaiji-003
	  =big5-cdp-itaiji-004
	  =big5-cdp-itaiji-005
	  =big5-cdp-itaiji-006
	  =big5-cdp-var-001
	  =big5-cdp-var-002
	  =big5-cdp-var-003
	  =big5-cdp-var-004
	  =big5-cdp-var-005
	  =big5-cdp-var-007
	  =big5-cdp-var-008
	  =big5-cdp-var-010
	  =ucs-bmp-cjk-compat
          =ucs-bmp-cjk-compat@unicode
          =ruimoku-v6
	  =zinbun-oracle
	  =hanziku-1
	  =hanziku-2
	  =hanziku-3
	  =hanziku-4
	  =hanziku-5
	  =hanziku-6
	  =hanziku-7
	  =hanziku-8
	  =hanziku-9
	  =hanziku-10
	  =hanziku-11
	  =hanziku-12
	  =ucs-sip@iso
	  =daikanwa@rev2
	  ideograph-daikanwa
	  korean-ksc5601
	  katakana-jisx0201
	  hebrew-iso8859-8
	  latin-viscii
	  latin-viscii-lower
	  latin-viscii-upper
	  ipa
	  lao
	  ethiopic-ucs
	  ethiopic
	  arabic-digit
	  arabic-1-column
	  arabic-2-column
	  arabic-iso8859-6
	  =daijiten
	  =cbeta
	  =jef-china3
	  chinese-isoir165
	  =ucs-sip@cns
	  ===chise-hdic-tsj
	  =chise-hdic-tsj
	  ===chise-hdic-syp
	  =chise-hdic-syp
	  ===chise-hdic-ktb
	  ===chise-hdic-ktb-seal
	  =chise-hdic-ktb
	  ==jis-x0208@1990
	  ==ucs-radicals@unicode
	  ==mj-0
	  ==mj-1
	  ==ucs-bmp-cjk@JP/hanazono
	  ==ucs-sip-ext-b@iso
	  ==ucs-sip@JP/hanazono
	  ==ucs-tip@JP/hanazono
	  ==ucs-bmp-itaiji-001
	  ==ucs-sip-itaiji-001
	  ==ucs-bmp-itaiji-002
	  ==ucs-sip-itaiji-002
	  ==ucs-bmp-itaiji-003
	  ==ucs-sip-itaiji-003
	  ==ucs-sip-itaiji-004
	  ==ucs-bmp-itaiji-005
	  ==ucs-sip-itaiji-005
	  ==ucs-bmp-itaiji-006
	  ==ucs-bmp-var-001
	  ==ucs-sip-var-001
	  ==ucs-bmp-var-002
	  ==ucs-sip-var-002
	  ==ucs-bmp-var-003
	  ==ucs-sip-var-003
	  ==ucs-bmp-var-007
	  ==hanyo-denshi/ja
	  ==hanyo-denshi/jb
	  ==hanyo-denshi/jc
	  ==hanyo-denshi/jd
	  ==hanyo-denshi/ft
	  ==hanyo-denshi/ia
	  ==hanyo-denshi/ib
	  ==hanyo-denshi/hg
	  ==hanyo-denshi/ip
	  ==hanyo-denshi/jt
	  ==adobe-japan1-6
	  ==big5-cdp
	  ==big5-cdp-itaiji-001
	  ==cns11643-1
	  ==cns11643-2
	  ==ucs-bmp-cjk@gb
          ==cns11643-3
	  ==cns11643-4
	  ==cns11643-5
	  ==cns11643-6
	  ==cns11643-7
	  ==ucs-sip@iso
	  ==jis-x0208@1983
	  ==jis-x0208@1978
	  ==jis-x0213-1@2000
	  ==jis-x0213-2
	  ==jis-x0212
	  ==ks-x1001
	  ==ruimoku-v6
	  ==gt-pj-k1
	  ==gt-pj-k2
	  ==hanyo-denshi/tk/mf-01
	  ==daikanwa
	  ==daijiten
	  ==cbeta
	  ==jef-china3
	  ==ucs-bmp-cjk-compat@JP
          ==ucs-bmp-cjk-compat@gb
          ===mj-0
	  ===mj-1
          ===jis-x0208
	  ===jis-x0208@1990
	  ===big5-cdp
	  ===ucs-bmp-cjk@gb
          ===adobe-japan1-6
	  ===cns11643-1
	  ===cns11643-2
	  ===cns11643-3
	  ===cns11643-4
	  ===cns11643-5
	  ===cns11643-6
	  ===cns11643-7
	  ;; ===hanyo-denshi/ja
	  ===hanyo-denshi/jb
	  ===hanyo-denshi/jc
	  ===hanyo-denshi/jd
	  ===hanyo-denshi/ft
	  ===hanyo-denshi/ia
	  ===hanyo-denshi/ib
	  ===hanyo-denshi/hg
	  ===hanyo-denshi/ip
	  ===hanyo-denshi/jt
	  ===jis-x0213-1
	  ===jis-x0213-1@2004
	  ===jis-x0213-2
	  ===jis-x0208@1983
	  ===jis-x0208@1978
	  ===jis-x0212
	  ===ks-x1001
	  ===daikanwa
	  ===ucs-sip-ext-b@iso
	  ===ucs-sip@iso
	  ===ruimoku-v6
	  ===daijiten
	  ===hng-jou ; 01
	  ===hng-keg ; 02
	  ===hng-dng ; 03
	  ===hng-mam ; 05
	  ===hng-drt ; 06
	  ===hng-kgk ; 07
	  ===hng-myz ; 08
	  ===hng-kda ; 09
	  ===hng-khi ; 10
	  ===hng-khm ; 11
	  ===hng-fhs ; 12
	  ===hng-hok ; 13
	  ===hng-kyd ; 14
	  ===hng-sok ; 15
	  ===hng-yhk ; 16
	  ===hng-kak ; 17
	  ===hng-kar ; 18
	  ===hng-kae ; 19
	  ===hng-sys ; 22
	  ===hng-tsu ; 24
	  ===hng-tzj ; 25
	  ===hng-hos ; 26
	  ===hng-kkh ; 27
	  ===hng-nak ; 28
	  ===hng-jhk ; 29
	  ===hng-hod ; 30
	  ===hng-gok ; 31
	  ===hng-ink ; 33
	  ===hng-nto ; 34
	  ===hng-nkm ; 36
	  ===hng-k24 ; 37
	  ===hng-ini ; 38
	  ===hng-nkk ; 39
	  ===hng-kcc ; 41
	  ===hng-kcj ; 42
	  ===hng-kbk ; 43
	  ===hng-sik ; 44
	  ===hng-skk ; 46
	  ===hng-kyu ; 47
	  ===hng-ksk ; 48
	  ===hng-wan ; 49
	  ===hng-okd ; 50
	  ===hng-wad ; 54
	  ===hng-kmi ; 55
	  ===hng-zkd ; 56
	  ===hng-doh ; 57
	  ===hng-jyu ; 58
	  ===hng-tzs ; 60
	  ===hng-sai ; 61
	  ===hng-kad ; 62
	  ===hng-kss ; 64
	  ===hng-kyo ; 66
	  ===hng-ykk ; 68
	  ===hng-saa ; 70
	  ===hng-sab ; 71
	  ===hng-wks ; 72
	  ===hng-wke ; 73
	  ===hng-smk ; 74
	  ===hng-sgs ; 77
	  ===hng-sts ; 78
	  ===hng-kkd ; 79
	  =shuowen-jiguge
	  =>shuowen-jiguge
	  ===shuowen-jiguge4
	  ===shuowen-jiguge5
	  ===shuowen-jiguge-A30
	  ===chise-kangxi@kokusho-200014683
	  ===cbeta
	  ===jef-china3
	  ===ucs-bmp-cjk-compat@unicode
	  ;; ucs-sip
	  =>>big5-cdp
	  =>>jis-x0208
	  =>>jis-x0208@1990
	  =>>jis-x0213-1
	  =>>jis-x0213-1@2004
	  =>>jis-x0213-2
	  =>>ruimoku-v6
	  =>jis-x0208
	  =>jis-x0213-1
	  =>jis-x0213-2
	  =>mj-0
	  =>hanyo-denshi/tk/mf-01
	  =>big5-cdp
	  =>ruimoku-v6
	  =>big5-cdp@iwds-1
	  =>big5-cdp@component
	  =>big5-cdp@cognate
	  =>big5-cdp-itaiji-001
	  =>big5-cdp-itaiji-002
	  =>big5-cdp-itaiji-003
	  =>big5-cdp-itaiji-004
	  =>big5-cdp-itaiji-005
	  =>big5-cdp-itaiji-006
	  =>big5-cdp-var-001
	  =>ucs-bmp-itaiji-001
	  =>ucs-sip-itaiji-001
	  =>ucs-tip-itaiji-001
	  =>ucs-bmp-itaiji-002
	  =>ucs-sip-itaiji-002
	  =>ucs-bmp-itaiji-003
	  =>ucs-sip-itaiji-003
	  =>ucs-bmp-itaiji-004
	  =>ucs-sip-itaiji-004
	  =>ucs-bmp-itaiji-005
	  =>ucs-sip-itaiji-005
	  =>ucs-bmp-itaiji-006
	  =>ucs-sip-itaiji-006
	  =>ucs-bmp-itaiji-007
	  =>ucs-sip-itaiji-007
	  =>ucs-bmp-itaiji-008
	  =>ucs-sip-itaiji-008
	  =>ucs-bmp-itaiji-009
	  =>ucs-sip-itaiji-009
	  =>ucs-bmp-itaiji-010
	  =>ucs-sip-itaiji-010
	  =>ucs-bmp-itaiji-011
	  =>ucs-bmp-itaiji-012
	  =>ucs-sip-itaiji-012
	  =>ucs-bmp-itaiji-014
	  =>ucs-sip-itaiji-015
	  =>ucs-bmp-itaiji-016
	  =>ucs-bmp-itaiji-001@iwds-1
	  =>ucs-sip-itaiji-001@iwds-1
	  =>ucs-bmp-itaiji-002@iwds-1
	  =>ucs-sip-itaiji-002@iwds-1
	  =>ucs-bmp-itaiji-003@iwds-1
	  =>ucs-sip-itaiji-003@iwds-1
	  =>ucs-bmp-itaiji-006@iwds-1
	  =>ucs-bmp-var-001
	  =>ucs-sip-var-001
	  =>daikanwa
	  ucs-bmp
	  ==>ucs-bmp-cjk@bucs
	  ==>ucs-sip@esu
	  =>ucs-bmp-cjk@unicode
          =>ucs-bmp-cjk@cognate
          =>ucs-bmp-cjk@component
          =>ucs-sip@cognate
          =>ucs-tip@cognate
          =>ucs-sip@component
          =>ucs-tip@component
          =>ucs-bmp-cjk@iwds-1
          =>ucs-bmp-cjk@iwds-1/normalized
          =>ucs-sip@iwds-1
          =>ucs-sip@iwds-1/normalized
          =>ucs-tip@iwds-1
          =+>ucs-bmp-cjk@unicode
          =+>ucs-bmp-cjk-compat@jis
	  =+>jis-x0213-2
	  =+>jis-x0213-1@2004
	  =>>ucs-bmp-cjk@unicode
	  =adobe-japan1-base
	  =>jis-x0208@1997
	  =>>hanyo-denshi/ft
	  =>>hanyo-denshi/ia
	  =>>hanyo-denshi/ib
	  =>>hanyo-denshi/jt
	  =>>adobe-japan1-6
	  =>>cns11643-1
	  =>>cns11643-2
	  =>>cns11643-3
	  =>>cns11643-4
	  =>>cns11643-6
	  =>>cbeta
	  =>>gt
	  =>cns11643-1
	  =>cns11643-5
	  =>cns11643-7
	  ==>daijiten
	  =>cbeta
	  =>zinbun-oracle
	  =+>adobe-japan1-6
	  =+>ucs-bmp-var-003
	  =+>ucs-tip-var-003
	  =+>jis-x0208@1978
	  =+>big5-cdp
	  =+>hanyo-denshi/jt
	  )))

;;; mule-charset.el ends here
