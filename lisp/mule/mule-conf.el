;;; mule-conf.el --- configure multilingual environment

;; Copyright (C) 1995,1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997, 1999, 2000, 2002, 2003, 2004, 2005, 2006, 2008,
;;   2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019,
;;   2020, 2021, 2022, 2023, 2024, 2025 MORIOKA Tomohiko

;; Keywords: mule, multilingual, character set, coding system

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(cond
 ((featurep 'utf-2000)
  (make-charset
   '=adobe-japan1-base
   "Adobe-Japan1 Character Collection for CID-Keyed Fonts"
   `(long-name "Adobe-Japan1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "AdobeJapan1-[0-6]$"
	       min-code	    #xE10000
	       max-code	,(+ #xE10000 23057)
	       code-offset  #xE10000
               ;; min-code	,(lsh #x6300 16)
               ;; max-code	,(+ (lsh #x6300 16) 23057)
               ;; code-offset	,(lsh #x6300 16)
	       ))
  (make-charset
   '=adobe-japan1-0
   "Adobe-Japan1-0 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-0"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-base
	       min-code 0
	       max-code 8283
	       registry "AdobeJapan1-[0-6]$"))
  (make-charset
   '=adobe-japan1-1
   "Adobe-Japan1-1 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-0
	       min-code 0
	       max-code 8358
	       registry "AdobeJapan1-[1-6]$"))
  (make-charset
   '=adobe-japan1-2
   "Adobe-Japan1-2 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-2"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-1
	       min-code 0
	       max-code 8719
	       registry "AdobeJapan1-[2-6]$"))
  (make-charset
   '=adobe-japan1-3
   "Adobe-Japan1-3 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-3"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-2
	       min-code 0
	       max-code 9353
	       registry "AdobeJapan1-[3-6]$"))
  (make-charset
   '=adobe-japan1-4
   "Adobe-Japan1-4 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-4"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-3
	       min-code 0
	       max-code 15443
	       registry "AdobeJapan1-[4-6]$"))
  (make-charset
   '=adobe-japan1-5
   "Adobe-Japan1-5 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-5"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-4
	       min-code 0
	       max-code 20316
	       registry "AdobeJapan1-[5-6]$"))
  (make-charset
   '=adobe-japan1-6
   "Adobe-Japan1-6 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-6"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-5
	       min-code 0
	       max-code 23057
	       registry "AdobeJapan1-6$"))
  (define-charset-alias '=adobe-japan1 '=adobe-japan1-6)

  (make-charset
   '==adobe-japan1-0
   "Adobe-Japan1-0 abstract glyph-forms."
   '(long-name "Adobe-Japan1-0 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-0
	       registry "AdobeJapan1-0$"))
  (make-charset
   '==adobe-japan1-1
   "Adobe-Japan1-1 abstract glyph-forms."
   '(long-name "Adobe-Japan1-1 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-0
	       registry "AdobeJapan1-1$"))
  (make-charset
   '==adobe-japan1-2
   "Adobe-Japan1-2 abstract glyph-forms."
   '(long-name "Adobe-Japan1-2 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-1
	       registry "AdobeJapan1-2$"))
  (make-charset
   '==adobe-japan1-3
   "Adobe-Japan1-3 abstract glyph-forms."
   '(long-name "Adobe-Japan1-3 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-2
	       registry "AdobeJapan1-3$"))
  (make-charset
   '==adobe-japan1-4
   "Adobe-Japan1-4 abstract glyph-forms."
   '(long-name "Adobe-Japan1-4 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-3
	       registry "AdobeJapan1-4$"))
  (make-charset
   '==adobe-japan1-5
   "Adobe-Japan1-5 abstract glyph-forms."
   '(long-name "Adobe-Japan1-5 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-4
	       registry "AdobeJapan1-5$"))
  (make-charset
   '==adobe-japan1-6
   "Adobe-Japan1-6 abstract glyph-forms."
   '(long-name "Adobe-Japan1-6 abstract glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-5
	       registry "AdobeJapan1-6$"))
  (define-charset-alias '==adobe-japan1 '==adobe-japan1-6)

  (define-charset-alias '=>>>adobe-japan1-0 '==adobe-japan1-0)
  (define-charset-alias '=>>>adobe-japan1-1 '==adobe-japan1-1)
  (define-charset-alias '=>>>adobe-japan1-2 '==adobe-japan1-2)
  (define-charset-alias '=>>>adobe-japan1-3 '==adobe-japan1-3)
  (define-charset-alias '=>>>adobe-japan1-4 '==adobe-japan1-4)
  (define-charset-alias '=>>>adobe-japan1-5 '==adobe-japan1-5)
  (define-charset-alias '=>>>adobe-japan1-6 '==adobe-japan1-6)
  (define-charset-alias '=>>>adobe-japan1 '=>>>adobe-japan1-6)

  (make-charset
   '===adobe-japan1-0
   "Adobe-Japan1-0 detailed glyph-images."
   '(long-name "Adobe-Japan1-0 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==adobe-japan1-0
	       registry "AdobeJapan1-0$"))
  (make-charset
   '===adobe-japan1-1
   "Adobe-Japan1-1 detailed glyph-images."
   '(long-name "Adobe-Japan1-1 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ===adobe-japan1-0
	       registry "AdobeJapan1-1$"))
  (make-charset
   '===adobe-japan1-2
   "Adobe-Japan1-2 detailed glyph-images."
   '(long-name "Adobe-Japan1-2 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ===adobe-japan1-1
	       registry "AdobeJapan1-2$"))
  (make-charset
   '===adobe-japan1-3
   "Adobe-Japan1-3 detailed glyph-images."
   '(long-name "Adobe-Japan1-3 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ===adobe-japan1-2
	       registry "AdobeJapan1-3$"))
  (make-charset
   '===adobe-japan1-4
   "Adobe-Japan1-4 detailed glyph-images."
   '(long-name "Adobe-Japan1-4 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ===adobe-japan1-3
	       registry "AdobeJapan1-4$"))
  (make-charset
   '===adobe-japan1-5
   "Adobe-Japan1-5 detailed glyph-images."
   '(long-name "Adobe-Japan1-5 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ===adobe-japan1-4
	       registry "AdobeJapan1-5$"))
  (make-charset
   '===adobe-japan1-6
   "Adobe-Japan1-6 detailed glyph-images."
   '(long-name "Adobe-Japan1-6 glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ===adobe-japan1-5
	       registry "AdobeJapan1-6$"))
  (define-charset-alias '===adobe-japan1 '===adobe-japan1-6)

  (make-charset
   '=>>adobe-japan1-0
   "Adobe-Japan1-0 abstract glyphs"
   '(long-name "Adobe-Japan1-0 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1
	       registry "AdobeJapan1-0$"))
  (make-charset
   '=>>adobe-japan1-1
   "Adobe-Japan1-1 abstract glyphs"
   '(long-name "Adobe-Japan1-1 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =>>adobe-japan1-0
	       registry "AdobeJapan1-1"))
  (make-charset
   '=>>adobe-japan1-2
   "Adobe-Japan1-2 abstract glyphs"
   '(long-name "Adobe-Japan1-2 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =>>adobe-japan1-1
	       registry "AdobeJapan1-2"))
  (make-charset
   '=>>adobe-japan1-3
   "Adobe-Japan1-3 abstract glyphs"
   '(long-name "Adobe-Japan1-3 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =>>adobe-japan1-2
	       registry "AdobeJapan1-3"))
  (make-charset
   '=>>adobe-japan1-4
   "Adobe-Japan1-4 abstract glyphs"
   '(long-name "Adobe-Japan1-4 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =>>adobe-japan1-3
	       registry "AdobeJapan1-4"))
  (make-charset
   '=>>adobe-japan1-5
   "Adobe-Japan1-5 abstract glyphs"
   '(long-name "Adobe-Japan1-5 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =>>adobe-japan1-4
	       registry "AdobeJapan1-5"))
  (make-charset
   '=>>adobe-japan1-6
   "Adobe-Japan1-6 abstract glyphs"
   '(long-name "Adobe-Japan1-6 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =>>adobe-japan1-5
	       registry "AdobeJapan1-6"))
  (define-charset-alias '=>>adobe-japan1 '=>>adobe-japan1-6)

  (make-charset
   '=+>adobe-japan1-0
   "Adobe-Japan1-0 unified abstract glyphs"
   '(long-name "Adobe-Japan1-0 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1
	       registry "AdobeJapan1-0$"))
  (make-charset
   '=+>adobe-japan1-1
   "Adobe-Japan1-1 unified abstract glyphs"
   '(long-name "Adobe-Japan1-1 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =+>adobe-japan1-0
	       registry "AdobeJapan1-1"))
  (make-charset
   '=+>adobe-japan1-2
   "Adobe-Japan1-2 unified abstract glyphs"
   '(long-name "Adobe-Japan1-2 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =+>adobe-japan1-1
	       registry "AdobeJapan1-2"))
  (make-charset
   '=+>adobe-japan1-3
   "Adobe-Japan1-3 unified abstract glyphs"
   '(long-name "Adobe-Japan1-3 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =+>adobe-japan1-2
	       registry "AdobeJapan1-3"))
  (make-charset
   '=+>adobe-japan1-4
   "Adobe-Japan1-4 unified abstract glyphs"
   '(long-name "Adobe-Japan1-4 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =+>adobe-japan1-3
	       registry "AdobeJapan1-4"))
  (make-charset
   '=+>adobe-japan1-5
   "Adobe-Japan1-5 unified abstract glyphs"
   '(long-name "Adobe-Japan1-5 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =+>adobe-japan1-4
	       registry "AdobeJapan1-5"))
  (make-charset
   '=+>adobe-japan1-6
   "Adobe-Japan1-6 unified abstract glyphs"
   '(long-name "Adobe-Japan1-6 unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =+>adobe-japan1-5
	       registry "AdobeJapan1-6"))
  (define-charset-alias '=+>adobe-japan1 '=+>adobe-japan1-6)

  (make-charset
   '=jis-x0208@1978
   "JIS X 0208:1978, unchanged part."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208
	      =>iso-ir 42
	      final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/-4pr
   "JIS X 0208:1978, 1st - 3rd impressions."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978
	      =>iso-ir 42
	      final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/1pr
   "JIS X 0208:1978, 1st impression."
   '(iso-ir 42
	    registry "jisx0208\\.1978"
	    dimension 2
	    chars 94
	    mother =jis-x0208@1978/-4pr
	    final ?@
	    graphic 0))
  (make-charset
   '=jis-x0208@1978/1pr/fixed
   "JIS X 0208:1978, correct glyph in the errata of 1st impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/1pr
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/-4X
   "JIS X 0208:1978, index before the 4th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978
	      =>iso-ir 42
              ;; final ?@
	      graphic 0
	      partial t))
  ;; (make-charset
  ;;  '=jis-x0208@1978/1er-pr
  ;;  "JIS X 0208:1978, fixed by errata [Nov 1978]."
  ;;  '(registry "jisx0208\\.1978"
  ;;             dimension 2
  ;;             chars 94
  ;;             mother =jis-x0208@1978
  ;;             =>iso-ir 42
  ;;             ;; final ?@
  ;;             graphic 0
  ;;             partial t))
  (make-charset
   '=jis-x0208@1978/2-pr
   "JIS X 0208:1978, 2nd impression or later."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
              ;; mother =jis-x0208@1978/1er-pr
	      mother =jis-x0208@1978
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/4er
   "JIS X 0208:1978, replaced by errata of 4th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/2-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/4-pr
   "JIS X 0208:1978, 4th impression or later."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/2-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/5pr
   "JIS X 0208:1978, 5th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/4-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (define-charset-alias '=jis-x0208@1978/i1 '=jis-x0208@1978/1pr)
  (define-charset-alias '=jis-x0208@1978/i-4 '=jis-x0208@1978/-4pr)
  (define-charset-alias '=jis-x0208@1978/i4- '=jis-x0208@1978/4-pr)
  )
 (t
  (make-charset
   '=jis-x0208@1978
   "JIS X0208:1978 Japanese Kanji (so called \"old JIS\")."
   '(iso-ir 42
	    registry "jisx0208\\.1978"
	    dimension 2
	    chars 94
	    mother =jis-x0208
	    final ?@
	    graphic 0))
  ))

(define-charset-alias '=jis-x0208-1978		'=jis-x0208@1978)
(define-charset-alias 'japanese-jisx0208-1978	'=jis-x0208@1978)
(define-charset-alias 'chinese-gb2312		'=gb2312)
(define-charset-alias '=jis-x0208-1983		'=jis-x0208@1983)
(define-charset-alias 'japanese-jisx0208	'=jis-x0208@1983)
(define-charset-alias 'korean-ksc5601		'=ks-x1001)
(define-charset-alias 'japanese-jisx0212	'=jis-x0212)
(define-charset-alias 'chinese-cns11643-1	'=cns11643-1)
(define-charset-alias 'chinese-cns11643-2	'=cns11643-2)
(define-charset-alias 'chinese-gb12345		'=gb12345)
(define-charset-alias 'chinese-big5		'=big5)

;; PinYin-ZhuYin
(make-charset 'sisheng "PinYin-ZhuYin"
	      '(registry "sisheng_cwnn\\|OMRON_UDC_ZH"
		dimension 1
		chars 94
		final ?0
		graphic 0
		))

;; Lao script.
;; ISO10646's 0x0E80..0x0EDF are mapped to 0x20..0x7F.
(make-charset 'lao "Lao script"
	      '(registry "MuleLao-1"
		dimension 1
		chars 94
		final ?1
		graphic 1))

;; IPA (International Phonetic Alphabet)
(make-charset 'ipa "International Phonetic Alphabet"
	      '(registry "MuleIPA"
		dimension 1
		chars 96
		final ?0
		graphic 1))

;; Ethiopic
(make-charset 'ethiopic "Ethiopic"
	      '(registry "Ethio"
		dimension 2
		chars 94
		final ?3
		graphic 0
		))

;; ISO-IR-165 (CCITT Extended GB)
;;    It is based on CCITT Recommendation T.101, includes GB 2312-80 +
;;    GB 8565-88 table A4 + 293 characters.
(if (featurep 'utf-2000)
    (progn
      (make-charset '=iso-ir165
		    "ISO-IR-165 (CCITT Extended GB; Chinese simplified)"
		    '(iso-ir 165
			     dimension 2
			     chars 94
			     mother =gb2312
			     final ?E
			     registry "isoir165"
			     graphic 0))
      (define-charset-alias 'chinese-isoir165 '=iso-ir165))
  (make-charset 'chinese-isoir165
		"ISO-IR-165 (CCITT Extended GB; Chinese simplified)"
		'(iso-ir 165
			 dimension 2
			 chars 94
			 final ?E
			 registry "isoir165"
			 graphic 0)))

;; CNS11643 Plane3 thru Plane7
;; These represent more and more obscure Chinese characters.
;; By the time you get to Plane 7, we're talking about characters
;; that appear once in some ancient manuscript and whose meaning
;; is unknown.

(flet
    ((make-chinese-cns11643-charset
      (name iso-ir plane final)
      (make-charset
       name (concat "CNS 11643 Plane " plane " (Chinese traditional)")
       `(iso-ir ,iso-ir
	 registry 
	 ,(concat "CNS11643[.-]\\(.*[.-]\\)?" plane "$")
	 dimension 2
	 chars 94
	 final ,final
	 graphic 0))
      ))
  (make-chinese-cns11643-charset '=cns11643-3 183 "3" ?I)
  (make-chinese-cns11643-charset '=cns11643-4 184 "4" ?J)
  (make-chinese-cns11643-charset '=cns11643-5 185 "5" ?K)
  (make-chinese-cns11643-charset '=cns11643-6 186 "6" ?L)
  (make-chinese-cns11643-charset '=cns11643-7 187 "7" ?M)
  (define-charset-alias 'chinese-cns11643-3	'=cns11643-3)
  (define-charset-alias 'chinese-cns11643-4	'=cns11643-4)
  (define-charset-alias 'chinese-cns11643-5	'=cns11643-5)
  (define-charset-alias 'chinese-cns11643-6	'=cns11643-6)
  (define-charset-alias 'chinese-cns11643-7	'=cns11643-7)
  )

;; JIS X 0213:2000
(cond
 ((featurep 'utf-2000)
  (make-charset
   '=jis-x0213-1
   "JIS X 0213 Plain 1 (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      =>iso-ir 228
	      final ?O
	      graphic 0
	      partial t))

  (make-charset
   '=jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1"
   '(iso-ir 228
	    registry "jisx0213\\(\\.2000\\)-1"
	    dimension 2
	    chars 94
	    mother =jis-x0213-1
	    final ?O
	    graphic 0))
  (make-charset
   '=jis-x0213-2
   "JIS X 0213 Plain 2"
   '(iso-ir 229
	    registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	    dimension 2
	    chars 94
	    final ?P
	    graphic 0))

  (make-charset
   '=jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1"
   '(iso-ir 233
	    registry "jisx0213\\.2004-1"
	    dimension 2
	    chars 94
	    mother =jis-x0213-1
	    final ?Q
	    graphic 0))

  (define-charset-alias 'japanese-jisx0213-1 '=jis-x0213-1@2000)
  (define-charset-alias 'japanese-jisx0213-2 '=jis-x0213-2)
  (define-charset-alias '=jis-x0213-1-2000 '=jis-x0213-1@2000)
  (define-charset-alias '=jis-x0213-2-2000 '=jis-x0213-2)
  )
 (t
  (make-charset
   'japanese-jisx0213-1
   "JIS X 0213:2000 Plain 1"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      final ?O
	      graphic 0))
  (make-charset
   'japanese-jisx0213-2
   "JIS X 0213:2000 Plain 2"
   '(registry "jisx0213\\(\\.2000\\)-2"
	      dimension 2
	      chars 94
	      final ?P
	      graphic 0))
  ))

(when (featurep 'utf-2000)
  (define-charset-alias 'ucs '=ucs)
  (define-charset-alias '=jis-x0208-1990 '=jis-x0208@1990)
  (define-charset-alias 'japanese-jisx0208-1990 '=jis-x0208@1990)

  (make-charset
   '==jis-x0208
   "JIS X 0208 abstract glyph-forms (unchanged part)."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '==jis-x0208@1978
   "JIS X 0208:1978 abstract glyph-forms."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0))
  (make-charset
   '==jis-x0208@1978/-4pr
   "JIS X 0208:1978, 1st - 3rd impressions."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '==jis-x0208@1978/1pr
   "JIS X 0208:1978, 1st impression."
   '(registry "jisx0208\\.1978"
	      =>iso-ir 42
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978/-4pr
	      ;; final ?@
	      graphic 0))
  (make-charset
   '==jis-x0208@1978/1pr/fixed
   "JIS X 0208:1978, correct glyph in the errata of 1st impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978/1pr
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '==jis-x0208@1978/-4X
   "JIS X 0208:1978, index before the 4th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978
	      =>iso-ir 42
              ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '==jis-x0208@1978/2-pr
   "JIS X 0208:1978, 2nd impression or later."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
              ;; mother =jis-x0208@1978/1er-pr
	      mother ==jis-x0208@1978
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '==jis-x0208@1978/4er
   "JIS X 0208:1978, replaced by errata of 4th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978/2-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '==jis-x0208@1978/4-pr
   "JIS X 0208:1978, 4th impression or later."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978/2-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '==jis-x0208@1978/5pr
   "JIS X 0208:1978, 5th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978/4-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '==jis-x0208@1983
   "JIS X 0208:1983 abstract glyph-forms."
   '(registry "jisx0208\\.1983"
	      dimension 2
	      chars 94
	      mother ==jis-x0208
	      =>iso-ir 87
	      graphic 0))
  (make-charset
   '==jis-x0208@1990
   "JIS X 0208:1990 abstract glyph-forms."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother ==jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))

  (make-charset
   '==jis-x0213-1
   "JIS X 0213 Plain 1 abstract glyph-forms (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =jis-x0213-1
	      =>iso-ir 228
	      ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '==jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 abstract glyph-forms"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother ==jis-x0213-1
	      =>iso-ir 228
	      ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '==jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 abstract glyph-forms"
   '(mother ==jis-x0213-1
	    =>iso-ir 233
	    registry "jisx0213\\.2004-1"
	    dimension 2
	    chars 94
	    graphic 0))

  (make-charset
   '==jis-x0213-2
   "JIS X 0213 Plain 2 abstract glyph-forms"
   '(mother =jis-x0213-2
	    =>iso-ir 229
	    registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	    dimension 2
	    chars 94
	    graphic 0))

  (make-charset
   '==jis-x0212
   "JIS X 0212 representative glyph-images."
   '(registry "jisx0212"
	      dimension 2
	      chars 94
	      mother =jis-x0212
	      =>iso-ir 159
	      ;; final ?D
	      graphic 0))

  (make-charset
   '==gb2312
   "GB 2312 representative glyph-images."
   '(registry "gb2312"
	      dimension 2
	      chars 94
	      mother =gb2312
	      =>iso-ir 58
	      ;; final ?A
	      graphic 0))
  (make-charset
   '==iso-ir165
   "ISO-IR-165 (CCITT Extended GB; Chinese simplified)"
   '(registry "isoir165"
	      =>iso-ir 165
	      dimension 2
	      chars 94
	      mother =iso-ir165
	      ;; final ?E
	      graphic 0))
  (make-charset
   '==gb12345
   "GB 12345 representative glyph-images."
   '(registry "gb12345"
	      dimension 2
	      chars 94
	      mother =gb12345
	      graphic 0))

  (make-charset
   '==ks-x1001
   "KS X 1001 representative glyph-images."
   '(registry "ksc5601"
	      dimension 2
	      chars 94
	      mother =ks-x1001
	      =>iso-ir 149
	      ;; final ?C
	      graphic 0))

  (define-charset-alias '=>>>jis-x0208      '==jis-x0208)
  (define-charset-alias '=>>>jis-x0208@1978 '==jis-x0208@1978)
  (define-charset-alias '=>>>jis-x0208@1983 '==jis-x0208@1983)
  (define-charset-alias '=>>>jis-x0208@1990 '==jis-x0208@1990)

  (define-charset-alias '=>>>jis-x0213-1      '==jis-x0213-1)
  (define-charset-alias '=>>>jis-x0213-1@2000 '==jis-x0213-1@2000)
  (define-charset-alias '=>>>jis-x0213-1@2004 '==jis-x0213-1@2004)
  (define-charset-alias '=>>>jis-x0213-2      '==jis-x0213-2)

  (make-charset
   '===jis-x0208
   "JIS X 0208 detailed representative glyph-images (unchanged part)."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother ==jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '===jis-x0208@1978
   "JIS X 0208:1978 detailed representative glyph-images."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1978
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0))
  (make-charset
   '===jis-x0208@1983
   "JIS X 0208:1983 detailed representative glyph-images."
   '(registry "jisx0208\\.1983"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1983
	      =>iso-ir 87
	      graphic 0))
  (make-charset
   '===jis-x0208@1990
   "JIS X 0208:1990 detailed representative glyph-images."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother ==jis-x0208@1990
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))

  (make-charset
   '===jis-x0213-1
   "JIS X 0213 Plain 1 detailed representative glyph-images (unchanged part)."
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother ==jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (make-charset
   '===jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 detailed representative glyph-images."
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother ==jis-x0213-1@2000
	      =>iso-ir 228
	      ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '===jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 detailed representative glyph-images."
   '(mother ==jis-x0213-1@2004
	    =>iso-ir 233
	    registry "jisx0213\\.2004-1"
	    dimension 2
	    chars 94
	    graphic 0))
  (make-charset
   '===jis-x0213-2
   "JIS X 0213 Plain 2 detailed representative glyph-images."
   '(mother ==jis-x0213-2
	    =>iso-ir 229
	    registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	    dimension 2
	    chars 94
	    graphic 0))

  (make-charset
   '===jis-x0212
   "JIS X 0212 representative glyph-images."
   '(registry "jisx0212"
	      dimension 2
	      chars 94
	      mother ==jis-x0212
	      =>iso-ir 159
	      ;; final ?D
	      graphic 0))

  (make-charset
   '===ks-x1001
   "KS X 1001 representative glyph-images."
   '(registry "ksc5601"
	      dimension 2
	      chars 94
	      mother ==ks-x1001
	      =>iso-ir 149
	      ;; final ?C
	      graphic 0))

  (make-charset
   '=>>jis-x0208
   "JIS X 0208 abstract glyphs (unchanged part)."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '=>>jis-x0208@1978
   "JIS X 0208:1978 abstract glyphs."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0))
  (make-charset
   '=>>jis-x0208@1983
   "JIS X 0208:1983 abstract glyphs."
   '(registry "jisx0208\\.1983"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 87
	      graphic 0))
  (make-charset
   '=>>jis-x0208@1990
   "JIS X 0208:1990 abstract glyphs."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 168
	      graphic 0))

  (make-charset
   '=>>jis-x0213-1
   "JIS X 0213 Plain 1 abstract glyphs (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (make-charset
   '=>>jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 abstract glyphs"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '=>>jis-x0213-2
   "JIS X 0213 Plain 2 abstract glyphs"
   '(registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	      dimension 2
	      chars 94
	      mother =jis-x0213-2
	      =>iso-ir 229
              ;; final ?P
	      graphic 0))
  (make-charset
   '=>>jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 abstract glyphs"
   '(registry "jisx0213\\.2004-1"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-1
	      =>iso-ir 233
              ;; final ?Q
	      graphic 0
              ;; partial t
	      ))

  (make-charset
   '=+>jis-x0208
   "JIS X 0208 based on usual unification."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (define-charset-alias '=>jis-x0208@usual '=+>jis-x0208)
  (make-charset
   '=+>jis-x0208@1978
   "JIS X 0208:1978 unified abstract glyphs."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =+>jis-x0208
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0))
  (make-charset
   '=+>jis-x0208@1983
   "JIS X 0208:1983 unified abstract glyphs."
   '(registry "jisx0208\\.1983"
	      dimension 2
	      chars 94
	      mother =+>jis-x0208
	      =>iso-ir 87
	      graphic 0))
  (make-charset
   '=+>jis-x0208@1990
   "JIS X 0208:1990 unified abstract glyphs."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =+>jis-x0208
	      =>iso-ir 168
	      graphic 0))
  (make-charset
   '=+>jis-x0213-1
   "JIS X 0213 Plain 1 unified abstract glyphs (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (make-charset
   '=+>jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 unified abstract glyphs"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother =+>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '=+>jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 unified abstract glyphs"
   '(registry "jisx0213\\.2004-1"
	      dimension 2
	      chars 94
	      mother =+>jis-x0213-1
	      =>iso-ir 233
              ;; final ?Q
	      graphic 0
              ;; partial t
	      ))

  (make-charset
   '=>jis-x0208
   "JIS X 0208 based on the unchanged unification rules."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =+>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (define-charset-alias '<=>jis-x0208 '=>jis-x0208)
  (make-charset
   '=>jis-x0208@1997
   "JIS X 0208 based on the unification rule of 1997 edition."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (define-charset-alias '<=>jis-x0208@1997 '=>jis-x0208@1997)
  (define-charset-alias '  =jis-x0208@1997 '=>jis-x0208@1997)

  (make-charset
   '=>jis-x0213-1
   "JIS X 0213 Plain 1 abstract characters (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =+>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (define-charset-alias '<=>jis-x0213-1 '=>jis-x0213-1)
  (make-charset
   '=>jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 abstract characters"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother =>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (define-charset-alias '<=>jis-x0213-1@2000 '=>jis-x0213-1@2000)
  (make-charset
   '=>jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 abstract characters"
   '(registry "jisx0213\\.2004-1"
	      dimension 2
	      chars 94
	      mother =>jis-x0213-1
	      =>iso-ir 233
              ;; final ?Q
	      graphic 0
              ;; partial t
	      ))
  (define-charset-alias '<=>jis-x0213-1@2004 '=>jis-x0213-1@2004)
  (make-charset
   '=+>jis-x0213-2
   "JIS X 0213 Plain 2 based on usual unification."
   '(registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-2
	      =>iso-ir 229
              ;; final ?P
	      graphic 0))
  (define-charset-alias '=>jis-x0213-2@usual '=+>jis-x0213-2)
  (make-charset
   '=>jis-x0213-2
   "JIS X 0213 Plain 2 abstract characters"
   '(registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	      dimension 2
	      chars 94
	      mother =+>jis-x0213-2
	      =>iso-ir 229
              ;; final ?P
	      graphic 0))

  (make-charset
   '=cns11643-3@2008
   "CNS 11643:2008 Plane 3 representative glyph-images."
   '(registry "CNS11643\\.2008-3$"
	      dimension 2
	      chars 94
	      mother =cns11643-3
	      =>iso-ir 183
	      graphic 0))
  (make-charset
   '==cns11643-1
   "CNS 11643 Plane 1 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?1$"
	      dimension 2
	      chars 94
	      mother =cns11643-1
	      =>iso-ir 171
	      graphic 0))
  (make-charset
   '==cns11643-2
   "CNS 11643 Plane 2 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?2$"
	      dimension 2
	      chars 94
	      mother =cns11643-2
	      =>iso-ir 172
	      graphic 0))
  (make-charset
   '==cns11643-3
   "CNS 11643 Plane 3 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?3$"
	      dimension 2
	      chars 94
	      mother =cns11643-3
	      =>iso-ir 183
	      graphic 0))
  (make-charset
   '==cns11643-4
   "CNS 11643 Plane 4 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?4$"
	      dimension 2
	      chars 94
	      mother =cns11643-4
	      =>iso-ir 184
	      graphic 0))
  (make-charset
   '==cns11643-5
   "CNS 11643 Plane 5 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?5$"
	      dimension 2
	      chars 94
	      mother =cns11643-5
	      =>iso-ir 185
	      graphic 0))
  (make-charset
   '==cns11643-6
   "CNS 11643 Plane 6 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?6$"
	      dimension 2
	      chars 94
	      mother =cns11643-6
	      =>iso-ir 186
	      graphic 0))
  (make-charset
   '==cns11643-7
   "CNS 11643 Plane 7 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?7$"
	      dimension 2
	      chars 94
	      mother =cns11643-7
	      =>iso-ir 187
	      graphic 0))

  (make-charset
   '===cns11643-1
   "CNS 11643 Plane 1 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?1$"
	      dimension 2
	      chars 94
	      mother ==cns11643-1
	      =>iso-ir 171
	      graphic 0))
  (make-charset
   '===cns11643-2
   "CNS 11643 Plane 2 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?2$"
	      dimension 2
	      chars 94
	      mother ==cns11643-2
	      =>iso-ir 172
	      graphic 0))
  (make-charset
   '===cns11643-3
   "CNS 11643 Plane 3 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?3$"
	      dimension 2
	      chars 94
	      mother ==cns11643-3
	      =>iso-ir 183
	      graphic 0))
  (make-charset
   '===cns11643-4
   "CNS 11643 Plane 4 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?4$"
	      dimension 2
	      chars 94
	      mother ==cns11643-4
	      =>iso-ir 184
	      graphic 0))
  (make-charset
   '===cns11643-5
   "CNS 11643 Plane 5 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?5$"
	      dimension 2
	      chars 94
	      mother ==cns11643-5
	      =>iso-ir 185
	      graphic 0))
  (make-charset
   '===cns11643-6
   "CNS 11643 Plane 6 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?6$"
	      dimension 2
	      chars 94
	      mother ==cns11643-6
	      =>iso-ir 186
	      graphic 0))
  (make-charset
   '===cns11643-7
   "CNS 11643 Plane 7 representative glyph-images."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?7$"
	      dimension 2
	      chars 94
	      mother ==cns11643-7
	      =>iso-ir 187
	      graphic 0))

  (make-charset
   '=>>cns11643-1
   "CNS 11643 Plane 1 detailed glyphs."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?1$"
	      dimension 2
	      chars 94
	      mother =cns11643-1
	      =>iso-ir 171
	      graphic 0))
  (make-charset
   '=>>cns11643-2
   "CNS 11643 Plane 2 detailed glyphs."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?2$"
	      dimension 2
	      chars 94
	      mother =cns11643-2
	      =>iso-ir 172
	      graphic 0))
  (make-charset
   '=>>cns11643-3
   "CNS 11643 Plane 3 detailed glyphs."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?3$"
	      dimension 2
	      chars 94
	      mother =cns11643-3
	      =>iso-ir 183
	      graphic 0))
  (make-charset
   '=>>cns11643-4
   "CNS 11643 Plane 4 detailed glyphs."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?4$"
	      dimension 2
	      chars 94
	      mother =cns11643-4
	      =>iso-ir 184
	      graphic 0))
  (make-charset
   '=>>cns11643-6
   "CNS 11643 Plane 6 detailed glyphs."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?6$"
	      dimension 2
	      chars 94
	      mother =cns11643-6
	      =>iso-ir 186
	      graphic 0))

  (make-charset
   '=>cns11643-1
   "CNS 11643 Plane 1 abstract characters."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?1$"
	      dimension 2
	      chars 94
	      mother =cns11643-1
	      =>iso-ir 171
	      graphic 0))
  (make-charset
   '=>cns11643-2
   "CNS 11643 Plane 2 abstract characters."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?2$"
	      dimension 2
	      chars 94
	      mother =cns11643-2
	      =>iso-ir 172
	      graphic 0))
  (make-charset
   '=>cns11643-4
   "CNS 11643 Plane 4 abstract characters."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?4$"
	      dimension 2
	      chars 94
	      mother =cns11643-4
	      =>iso-ir 184
	      graphic 0))
  (make-charset
   '=>cns11643-5
   "CNS 11643 Plane 5 abstract characters."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?5$"
	      dimension 2
	      chars 94
	      mother =cns11643-5
	      =>iso-ir 185
	      graphic 0))
  (make-charset
   '=>cns11643-6
   "CNS 11643 Plane 6 abstract characters."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?6$"
	      dimension 2
	      chars 94
	      mother =cns11643-6
	      =>iso-ir 186
	      graphic 0))
  (make-charset
   '=>cns11643-7
   "CNS 11643 Plane 7 abstract characters."
   '(registry "CNS11643[.-]\\(.*[.-]\\)?7$"
	      dimension 2
	      chars 94
	      mother =cns11643-7
	      =>iso-ir 187
	      graphic 0))

  (make-charset '=big5-eten
		"Big5 ETEN"
		'(long-name	"Big5-ETEN"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  min-code	#x8140
		  max-code	#xFEFE
		  registry	"Big5\\.ETEN"))
  (define-charset-alias 'chinese-big5-eten '=big5-eten)
  (make-charset 'chinese-big5-eten-a
		"Big5 ETEN (#xF9D6 .. #xF9FE)"
		'(long-name	"Big5-ETEN-a"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  min-code	#xF9D6
		  max-code	#xF9FE
		  registry	"Big5\\.ETEN"))
  (make-charset 'chinese-big5-eten-b
		"Big5 ETEN (#xC6A1 .. #xC8FE)"
		'(long-name	"Big5-ETEN-b"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  min-code	#xC6A1
		  max-code	#xC8FE
		  registry	"Big5\\.ETEN"))

  (make-charset '=big5-cdp
		"Big5 with CDP extension"
		'(long-name	"Big5-CDP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	chinese-big5
		  min-code	#x8140
		  max-code	#x8DFE))
  (define-charset-alias 'chinese-big5-cdp '=big5-cdp)

  (make-charset '==big5-cdp
		"Abstract glyph-images of Big5-CDP"
		'(long-name	"Big5-CDP glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=big5-cdp))
  (make-charset '===big5-cdp
		"Representative glyph-images of Big5-CDP"
		'(long-name	"Big5-CDP glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	==big5-cdp))

  (make-charset '=>>big5-cdp
		"Abstract glyphs of Big5-CDP"
		'(long-name	"Big5-CDP glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=big5-cdp))

  (make-charset '=+>big5-cdp
		"Big5-CDP unified glyphs"
		'(long-name	"Big5-CDP unified glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=big5-cdp))

  (make-charset '=>big5-cdp
		"Big5-CDP abstract characters"
		'(long-name	"Big5-CDP abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=big5-cdp))

  (make-charset '=>big5-cdp@iwds-1
		"Big5-CDP abstract characters based on IWDS-1"
		'(long-name	"Big5-CDP IWDS-1 abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=>big5-cdp))

  (make-charset '=>big5-cdp@component
		"Big5-CDP abstract components"
		'(long-name	"Big5-CDP abstract components"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=>big5-cdp))

  (make-charset '=>big5-cdp@cognate
		"Big5-CDP abstract components based on cognate"
		'(long-name	"Big5-CDP abstract cognate components"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=>big5-cdp))

  (make-charset
   '=mj
   "Moji-Jouhou-Kiban characters"
   `(long-name "Moji-Jouhou-Kiban"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
               ;; registry "mj-0$"
	       min-code     #xE30000
	       max-code ,(+ #xE30000 68053)
	       code-offset  #xE30000
	       ;; min-code	      ,(lsh #x6404 16)
               ;; max-code	   ,(+ (lsh #x6404 16) 68053)
               ;; code-offset    ,(lsh #x6404 16)
	       ))
  (make-charset
   '=mj-0
   "Moji-Jouhou-Kiban plane 0"
   '(long-name "Moji-Jouhou-Kiban-0"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-0$"
	       mother =mj
	       min-code	0
	       max-code	#xFFFF))
  (make-charset
   '=mj-1
   "Moji-Jouhou-Kiban plane 1"
   '(long-name "Moji-Jouhou-Kiban-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-1$"
	       mother =mj
	       min-code	#x10000
	       code-offset #x10000))
  (make-charset
   '=>mj
   "Moji-Jouhou-Kiban abstract characters"
   `(long-name "Moji-Jouhou-Kiban"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =mj
	       ))
  (make-charset
   '=>mj-0
   "Moji-Jouhou-Kiban plane 0"
   '(long-name "Moji-Jouhou-Kiban-0"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-0$"
	       mother =>mj
	       min-code	0
	       max-code	#xFFFF))

  (make-charset
   '=hanyo-denshi/ja
   "JA (JIS X0208) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JA"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JA-0$"
	       min-code	,(lsh #x6400 16)
	       max-code	,(+ (lsh #x6400 16) (1- (* 94 94)))
	       code-offset ,(lsh #x6400 16)))
  (make-charset
   '=hanyo-denshi/jb
   "JB (JIS X0212) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JB"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JB-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 2)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94))))
  (make-charset
   '=hanyo-denshi/jc
   "JC (JIS X0213:2000 Plane 1) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JC"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JC-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 2))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 3)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 2))))
  (make-charset
   '=hanyo-denshi/jd
   "JD (JIS X0213:2000 Plane 1) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JD"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JD-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 3))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 4)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 3))))
  (make-charset
   '=hanyo-denshi/ft
   "FT (FDPC additional) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/FT"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 4))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 5)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 4))))
  (make-charset
   '=hanyo-denshi/ia
   "IA part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/IA"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IA-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 5))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 6)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 5))))
  (make-charset
   '=hanyo-denshi/ib
   "IB part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/IB"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IB-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 6))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 7)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 6))))
  (make-charset
   '=hanyo-denshi/hg
   "HG (HyouGai Kanji) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/HG"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.HG-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 7))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 8)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 7))))
  (make-charset
   '=hanyo-denshi/ip
   "IP (for IPA) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/IP"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IP-0$"
	       min-code	   ,(+ (lsh #x6402 16) #x4E00)
	       max-code	   ,(+ (lsh #x6402 16) #x9FFF)
	       code-offset ,(+ (lsh #x6402 16))))
  (make-charset
   '=hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JT"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       min-code	   ,(+ (lsh #x6402 16) #xAC00)
	       max-code	   ,(+ (lsh #x6402 16) #xD7AF)
	       code-offset ,(+ (lsh #x6402 16))))
  (make-charset
   '=hanyo-denshi/ks
   "KS (KoSeki) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/KS"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r))
  (make-charset
   '=hanyo-denshi/tk
   "TK (TouKi) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/TK"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r))

  (make-charset
   '=>hanyo-denshi/tk
   "TK (TouKi) part of Han'you-Denshi abstract characters"
   `(long-name "Han'you-Denshi/TK"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/tk))

  (make-charset
   '==mj
   "Moji-Jouhou-Kiban detailed glyph-images."
   '(long-name "MJ glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =mj))
  (make-charset
   '==mj-0
   "MJ detailed glyph-images plane 0"
   '(long-name "MJ glyph-images-0"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-0$"
	       mother ==mj
	       min-code	0
	       max-code	#xFFFF))
  (make-charset
   '==mj-1
   "MJ detailed glyph-images plane 1"
   '(long-name "MJ glyph-images-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-1$"
	       mother ==mj
	       min-code	#x10000
	       code-offset #x10000))

  (make-charset
   '==hanyo-denshi/ja
   "Han'you-Denshi/JA abstract glyph-forms."
   '(long-name "Han'you-Denshi/JA glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JA-0$"
	       mother =hanyo-denshi/ja))
  (make-charset
   '==hanyo-denshi/jb
   "Han'you-Denshi/JB abstract glyph-forms."
   '(long-name "Han'you-Denshi/JB glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JB-0$"
	       mother =hanyo-denshi/jb))
  (make-charset
   '==hanyo-denshi/jc
   "Han'you-Denshi/JC abstract glyph-forms."
   '(long-name "Han'you-Denshi/JC glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JC-0$"
	       mother =hanyo-denshi/jc))
  (make-charset
   '==hanyo-denshi/jd
   "Han'you-Denshi/JD abstract glyph-forms."
   '(long-name "Han'you-Denshi/JD glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JD-0$"
	       mother =hanyo-denshi/jd))
  (make-charset
   '==hanyo-denshi/ft
   "Han'you-Denshi/FT abstract glyph-forms."
   '(long-name "Han'you-Denshi/FT glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       mother =hanyo-denshi/ft))
  (make-charset
   '==hanyo-denshi/ia
   "Han'you-Denshi/IA abstract glyph-forms."
   '(long-name "Han'you-Denshi/IA glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IA-0$"
	       mother =hanyo-denshi/ia))
  (make-charset
   '==hanyo-denshi/ib
   "Han'you-Denshi/IB abstract glyph-forms."
   '(long-name "Han'you-Denshi/IB glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IB-0$"
	       mother =hanyo-denshi/ib))
  (make-charset
   '==hanyo-denshi/hg
   "Han'you-Denshi/HG abstract glyph-forms."
   '(long-name "Han'you-Denshi/HG glyph-forms"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.HG-0$"
	       mother =hanyo-denshi/hg))
  (make-charset
   '==hanyo-denshi/ip
   "Han'you-Denshi/IP abstract glyph-forms."
   '(long-name "Han'you-Denshi/IP glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IP-0$"
	       mother =hanyo-denshi/ip))
  (make-charset
   '==hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) abstract glyph-forms."
   '(long-name "Han'you-Denshi/JT glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       mother =hanyo-denshi/jt))
  (make-charset
   '==hanyo-denshi/ks
   "KoSeki-touitsu-moji abstract glyph-forms."
   '(long-name "Han'you-Denshi/KS glyph-forms"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/ks))
  (make-charset
   '==hanyo-denshi/tk
   "TK (TouKi) part of Han'you-Denshi abstract glyph-forms."
   `(long-name "Han'you-Denshi/TK glyph-forms"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/tk))

  (make-charset
   '=koseki
   "Abstract glyph-forms of KoSeki-touitsu-moji."
   '(long-name "KoSeki-touitsu-moji glyph-forms"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/ks))
  (make-charset
   '==koseki
   "Representative glyph-images of KoSeki-touitsu-moji."
   '(long-name "KoSeki-touitsu-moji glyph-images"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =koseki))

  (define-charset-alias '=>>>hanyo-denshi/ja '==hanyo-denshi/ja)
  (define-charset-alias '=>>>hanyo-denshi/jb '==hanyo-denshi/jb)
  (define-charset-alias '=>>>hanyo-denshi/jc '==hanyo-denshi/jc)
  (define-charset-alias '=>>>hanyo-denshi/jd '==hanyo-denshi/jd)
  (define-charset-alias '=>>>hanyo-denshi/ft '==hanyo-denshi/ft)
  (define-charset-alias '=>>>hanyo-denshi/ib '==hanyo-denshi/ib)
  (define-charset-alias '=>>>hanyo-denshi/hg '==hanyo-denshi/hg)
  (define-charset-alias '=>>>hanyo-denshi/jt '==hanyo-denshi/jt)
  (define-charset-alias '=>>>hanyo-denshi/ks '==hanyo-denshi/ks)

  ;; (make-charset
  ;;  '===hanyo-denshi/ja
  ;;  "Han'you-Denshi/JA detailed glyph-images."
  ;;  '(long-name "Han'you-Denshi/JA glyph-images"
  ;;              chars 94
  ;;              dimension 2
  ;;              columns 2
  ;;              graphic 2
  ;;              direction l2r
  ;;              registry "HanyoDenshi\\.JA-0$"
  ;;              mother ==hanyo-denshi/ja))
  (make-charset
   '===hanyo-denshi/jb
   "Han'you-Denshi/JB detailed glyph-images."
   '(long-name "Han'you-Denshi/JB glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JB-0$"
	       mother ==hanyo-denshi/jb))
  (make-charset
   '===hanyo-denshi/jc
   "Han'you-Denshi/JC representative glyph-images."
   '(long-name "Han'you-Denshi/JC glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JC-0$"
	       mother ==hanyo-denshi/jc))
  (make-charset
   '===hanyo-denshi/jd
   "Han'you-Denshi/JD representative glyph-images."
   '(long-name "Han'you-Denshi/JD glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JD-0$"
	       mother ==hanyo-denshi/jd))
  (make-charset
   '===hanyo-denshi/ft
   "Han'you-Denshi/FT detailed glyph-images."
   '(long-name "Han'you-Denshi/FT glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       mother ==hanyo-denshi/ft))
  (make-charset
   '===hanyo-denshi/ia
   "Han'you-Denshi/IA detailed glyph-images."
   '(long-name "Han'you-Denshi/IA glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IA-0$"
	       mother ==hanyo-denshi/ia))
  (make-charset
   '===hanyo-denshi/ib
   "Han'you-Denshi/IB detailed glyph-images."
   '(long-name "Han'you-Denshi/IB glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IB-0$"
	       mother ==hanyo-denshi/ib))
  (make-charset
   '===hanyo-denshi/hg
   "Han'you-Denshi/HG detailed glyph-images."
   '(long-name "Han'you-Denshi/HG glyph-images"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.HG-0$"
	       mother ==hanyo-denshi/hg))
  (make-charset
   '===hanyo-denshi/ip
   "Han'you-Denshi/IP representative glyph-images."
   '(long-name "Han'you-Denshi/IP glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IP-0$"
	       mother ==hanyo-denshi/ip))
  (make-charset
   '===hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) detailed glyph-images."
   '(long-name "Han'you-Denshi/JT glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       mother ==hanyo-denshi/jt))
  (make-charset
   '===hanyo-denshi/ks
   "KoSeki-touitsu-moji detailed glyph-images."
   '(long-name "Han'you-Denshi/KS glyph-images"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==hanyo-denshi/ks))

  (make-charset
   '=hanyo-denshi/ks/mf
   "font encoding for KS (KoSeki) characters"
   `(long-name "Han'you-Denshi/KS font encoding"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.KSMF-0$"
	       min-code	      ,(lsh #x6403 16)
	       max-code	   ,(+ (lsh #x6403 16) #xFFFF)
	       code-offset    ,(lsh #x6403 16)))
  (make-charset
   '=hanyo-denshi/tk/mf-01
   "font encoding for TK (TouKi) characters"
   `(long-name "Han'you-Denshi/TK font encoding"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.TKMF-1$"))
  (make-charset
   '=>hanyo-denshi/tk/mf-01
   "font encoding for TK (TouKi) abstract characters"
   `(long-name "Han'you-Denshi/TK font encoding"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/tk/mf-01
	       registry "HanyoDenshi\\.TKMF-1$"))
  (make-charset
   '==hanyo-denshi/tk/mf-01
   "font encoding for TK (TouKi) glyphs"
   `(long-name "Han'you-Denshi/TK font encoding"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/tk/mf-01
	       registry "HanyoDenshi\\.TKMF-1$"))

  (make-charset
   '===mj
   "Moji-Jouhou-Kiban detailed glyph-images."
   '(long-name "MJ glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother ==mj))
  (make-charset
   '===mj-0
   "MJ detailed glyph-images plane 0"
   '(long-name "MJ glyph-images-0"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-0$"
	       mother ===mj
	       min-code	0
	       max-code	#xFFFF))
  (make-charset
   '===mj-1
   "MJ detailed glyph-images plane 1"
   '(long-name "MJ glyph-images-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "mj-1$"
	       mother ===mj
	       min-code	#x10000
	       code-offset #x10000))

  (make-charset
   '=+>hanyo-denshi/ft
   "Han'you-Denshi/FT abstract glyphs"
   '(long-name "Han'you-Denshi/FT glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       mother =hanyo-denshi/ft))
  (make-charset
   '=+>hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) unified abstract glyphs."
   '(long-name "Han'you-Denshi/JT unified glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       mother =hanyo-denshi/jt))

  (make-charset
   '=>>mj
   "Moji-Jouhou-Kiban abstract glyphs."
   '(long-name "MJ glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =mj))

  (make-charset
   '=>>hanyo-denshi/ja
   "Han'you-Denshi/JA abstract glyphs"
   '(long-name "Han'you-Denshi/JA glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JA-0$"
	       mother =hanyo-denshi/ja))
  (make-charset
   '=>>hanyo-denshi/jb
   "Han'you-Denshi/JB abstract glyphs"
   '(long-name "Han'you-Denshi/JB glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JB-0$"
	       mother =hanyo-denshi/jb))
  (make-charset
   '=>>hanyo-denshi/jc
   "Han'you-Denshi/JC abstract glyphs"
   '(long-name "Han'you-Denshi/JC glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JC-0$"
	       mother =hanyo-denshi/jc))
  (make-charset
   '=>>hanyo-denshi/jd
   "Han'you-Denshi/JD abstract glyphs"
   '(long-name "Han'you-Denshi/JD glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JD-0$"
	       mother =hanyo-denshi/jd))
  (make-charset
   '=>>hanyo-denshi/ft
   "Han'you-Denshi/FT abstract glyphs"
   '(long-name "Han'you-Denshi/FT glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       mother =hanyo-denshi/ft))
  (make-charset
   '=>>hanyo-denshi/ia
   "Han'you-Denshi/IA abstract glyphs"
   '(long-name "Han'you-Denshi/IA glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IA-0$"
	       mother =hanyo-denshi/ia))
  (make-charset
   '=>>hanyo-denshi/ib
   "Han'you-Denshi/IB abstract glyphs"
   '(long-name "Han'you-Denshi/IB abstract glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IB-0$"
	       mother =hanyo-denshi/ib))
  (make-charset
   '=>>hanyo-denshi/hg
   "Han'you-Denshi/HG abstract glyphs"
   '(long-name "Han'you-Denshi/HG abstract glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.HG-0$"
	       mother =hanyo-denshi/hg))
  (make-charset
   '=>>hanyo-denshi/ip
   "Han'you-Denshi/IP abstract glyphs"
   '(long-name "Han'you-Denshi/IP abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IP-0$"
	       mother =hanyo-denshi/ip))
  (make-charset
   '=>>hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) abstract glyphs"
   '(long-name "Han'you-Denshi/JT glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       mother =hanyo-denshi/jt))
  (make-charset
   '=>>hanyo-denshi/ks
   "Han'you-Denshi/KS abstract glyphs"
   '(long-name "Han'you-Denshi/KS glyphs"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/ks))

  (make-charset '=gt
		"GT 2000"
		`(long-name	"GT"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	""
		  min-code	,(lsh #x6100 16)
		  max-code	,(+ (lsh #x6100 16) 67547)
		  code-offset	,(lsh #x6100 16)))
  (make-charset '==gt
		"GT 2000 abstract glyph-forms."
		'(long-name     "GT abstract glyph-forms"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  mother        =gt))
  (make-charset '===gt
		"GT 2000 detailed glyph-images."
		'(long-name	"GT glyph-images"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==gt
                  ;; min-code	1
                  ;; max-code	67392
		  ))
  (define-charset-alias 'ideograph-gt '=gt)
  (define-charset-alias '=>>>gt '==gt)
  (make-charset '=>>gt
		"GT 2000 abstract glyphs"
		'(long-name	"GT abstract glyphs"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=gt))
  (define-charset-alias '<=>gt '=>>gt)
  (define-charset-alias '<==>gt '=>>gt)
  (make-charset '=+>gt
		"GT 2000 unified abstract glyphs"
		'(long-name	"Unified abstract GT glyphs"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>>gt))
  (make-charset '=>gt
		"GT 2000 abstract characters"
		'(long-name	"abstract GT characters"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=+>gt))
  (make-charset '=gt-k
		"Ideographic components of GT"
		`(long-name	"GT components"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	""
		  min-code	,(lsh #x6110 16)
		  max-code	,(+ (lsh #x6110 16) 17090)
		  code-offset	,(lsh #x6110 16)))
  (define-charset-alias 'ideograph-gt-k '=gt-k)
  (make-charset '==gt-k
		"Abstract glyph-images of GT-K"
		'(long-name	"GT-K glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=gt-k))
  (make-charset '===gt-k
		"Representative glyph-images of GT-K"
		'(long-name	"GT-K glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==gt-k))
  (make-charset '=>>gt-k
		"abstract glyphs of GT-K"
		'(long-name	"GT-K abstract glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=gt-k))
  (make-charset '=>gt-k
		"GT-K abstract characters"
		'(long-name	"GT-K abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>>gt-k))
  (let ((i 1))
    (while (<= i 11)
      (make-charset
       (intern (format "=gt-pj-%d" i))
       (format "GT 2000 (pseudo JIS encoding) part %d" i)
       `(long-name ,(format "GT PJ %d" i)
		   chars 94
		   dimension 2
		   columns 2
		   graphic 0
		   direction l2r
		   registry ,(format "\\(GTpj-%d\\|jisx0208\\.GT-%d\\)$" i i)))
      (define-charset-alias
	(intern (format "ideograph-gt-pj-%d" i))
	(intern (format "=gt-pj-%d" i)))
      (setq i (1+ i))))
  (make-charset
   '=gt-pj-k1
   "Ideographic parts of GT (pseudo JIS encoding) part 1"
   '(long-name "GT K1"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 0
	       direction l2r
	       registry "\\(GTKpj-1\\|jisx0208\\.GTK-1\\)$"))
  (define-charset-alias 'ideograph-gt-pj-k1 '=gt-pj-k1)
  (make-charset
   '==gt-pj-k1
   "Ideographic parts of GT (pseudo JIS encoding) part 1"
   '(long-name "GT K1"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 0
	       direction l2r
	       registry "\\(GTKpj-1\\|jisx0208\\.GTK-1\\)$"))
  (make-charset
   '=gt-pj-k2
   "Ideographic parts of GT (pseudo JIS encoding) part 2"
   '(long-name "GT K2"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 0
	       direction l2r
	       registry "\\(GTKpj-2\\|jisx0208\\.GTK-2\\)$"))
  (define-charset-alias 'ideograph-gt-pj-k2 '=gt-pj-k2)
  (make-charset
   '==gt-pj-k2
   "Ideographic parts of GT (pseudo JIS encoding) part 2"
   '(long-name "GT K2"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 0
	       direction l2r
	       registry "\\(GTKpj-2\\|jisx0208\\.GTK-2\\)$"))

  (make-charset '=daikanwa
		"Daikanwa dictionary (unchanged part)"
		`(long-name	"Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  min-code	#xE00000
		  max-code	,(+ #xE00000 50100)
		  code-offset	#xE00000))
  (define-charset-alias 'ideograph-daikanwa '=daikanwa)

  (make-charset '=daikanwa@rev1
		"Daikanwa dictionary (revised version)"
		'(long-name	"Daikanwa Rev."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-2"
		  mother	=daikanwa))
  (define-charset-alias 'ideograph-daikanwa-2 '=daikanwa@rev1)
  (define-charset-alias '=daikanwa-rev1 '=daikanwa@rev1)

  (make-charset '=daikanwa@rev2
		"Daikanwa dictionary (revised version 2)"
		'(long-name	"Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=daikanwa
		  min-code	1
                  max-code	49964))
  (define-charset-alias '=daikanwa-rev2 '=daikanwa@rev2)

  (make-charset '=daikanwa/+p
		"Daikanwa dictionary (ddddd')"
		'(long-name	"Daikanwa ddddd'"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))
  (make-charset '=daikanwa/+2p
		"Daikanwa dictionary (ddddd'')"
		'(long-name	"Daikanwa ddddd''"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))
  (make-charset '=daikanwa/ho
		"Daikanwa dictionary (Hokan)"
		'(long-name	"Daikanwa-ho"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))

  (make-charset '==daikanwa
		"Daikanwa glyph-images."
		'(long-name	"Daikanwa glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=daikanwa))
  (make-charset '==daikanwa/+p
		"Daikanwa detailed glyph-images (ddddd')"
		'(long-name	"Daikanwa detailed glyphs-images (ddddd')"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daikanwa/+p))
  (make-charset '==daikanwa/+2p
		"Daikanwa detailed glyph-images (ddddd'')"
		'(long-name	"Daikanwa glyph-images ddddd''"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daikanwa/+2p))
  (make-charset '==daikanwa/ho
		"Daikanwa detailed glyph-images (Hokan)"
		'(long-name	"Daikanwa-ho detailed glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daikanwa/ho))

  (make-charset '===daikanwa
		"Daikanwa detailed glyph-images."
		'(long-name	"Daikanwa detailed glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	==daikanwa))
  (make-charset '===daikanwa/+p
		"Daikanwa detailed glyph-images (ddddd')"
		'(long-name	"Daikanwa detailed glyphs-images (ddddd')"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==daikanwa/+p))
  (make-charset '===daikanwa/ho
		"Daikanwa detailed glyph-images (Hokan)"
		'(long-name	"Daikanwa-ho detailed glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==daikanwa/ho))

  (make-charset '=>>daikanwa
		"Daikanwa abstract glyphs"
		'(long-name	"Daikanwa glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=daikanwa))
  (make-charset '=>>daikanwa/+p
		"Daikanwa abstract glyphs (ddddd')"
		'(long-name	"Daikanwa glyphs (ddddd')"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daikanwa/+p))
  (make-charset '=>>daikanwa/+2p
		"Daikanwa abstract glyphs (ddddd'')"
		'(long-name	"Daikanwa glyphs (ddddd'')"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daikanwa/+2p))
  (make-charset '=>>daikanwa/ho
		"Daikanwa abstract glyphs (Hokan)"
		'(long-name	"Daikanwa-ho glyph"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daikanwa/ho))

  (make-charset '=>daikanwa
		"Daikanwa abstract characters"
		'(long-name	"abstract Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=>>daikanwa))
  (make-charset '=>daikanwa/ho
		"Daikanwa abstract characters (Hokan)"
		'(long-name	"abstract Daikanwa-ho"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>>daikanwa/ho))

  (make-charset '=daijiten
		"Daijiten dictionary glyphs"
		`(long-name	"Daijiten glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daijiten-*"
		  min-code	#xE50000
		  max-code	,(+ #xE50000 14924)
		  code-offset	#xE50000))
  (make-charset '==daijiten
		"Daijiten dictionary glyph-forms"
		`(long-name	"Daijiten glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daijiten
		  registry	"Daijiten-*"))
  (make-charset '===daijiten
		"Daijiten dictionary glyph-images"
		`(long-name	"Daijiten glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==daijiten
		  registry	"Daijiten-*"))
  (make-charset '==>daijiten
		"Jishu of Daijiten dictionary"
		`(long-name	"Daijiten jishu"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=daijiten
		  registry	"Daijiten-*"))
  
  (make-charset '===chise-kangxi@kokusho-200014683
		"Kangxi dictionary in NIJL (BID: 200014683)"
		`(long-name	"Kangxi glyph-images KBID:200014683"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Kangxi-1"))

  (make-charset '=shinjigen
		"Kadokawa ShinJigen dictionary (common parts)"
		`(long-name	"Shinjigen common parts"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-*"))

  (make-charset '=shinjigen@1ed
		"Kadokawa ShinJigen dictionary (the first edition)"
		`(long-name	"Shinjigen-1"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-1"))
  (define-charset-alias 'shinjigen-1 '=shinjigen@1ed)

  (make-charset '=shinjigen@1ed/24pr
		"Kadokawa ShinJigen dictionary (the 24th impression)"
		`(long-name	"Shinjigen-1 24pr"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen@1ed))

  (make-charset '=shinjigen@rev
		"Kadokawa ShinJigen dictionary (the revised edition)"
		`(long-name	"Shinjigen-2"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-2"))
  (define-charset-alias 'shinjigen-2 '=shinjigen@rev)
  (make-charset '=shinjigen/+p@rev
		"ShinJigen (the second edition) number with '"
		`(long-name	"Shinjigen-2 with '"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))
  (define-charset-alias 'shinjigen-2-p '=shinjigen/+p@rev)

  (make-charset '==shinjigen
		"Detailed glyph-images of ShinJigen (common parts)"
		'(long-name	"Shinjigen common parts"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-*"))
  (make-charset '==shinjigen@1ed
		"Detailed glyph-images of ShinJigen (the first edition)"
		'(long-name	"Detailed glyph-images of Shinjigen-1"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-1"))
  (make-charset '==shinjigen@rev
		"Detailed glyph-images of ShinJigen (the revised edition)"
		'(long-name	"Detailed glyph-images of Shinjigen-2"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-2"))
  (make-charset
   '==shinjigen/+p@rev
   "Detailed glyph-images of ShinJigen (the second edition) number with '"
   '(long-name	"Detailed glyph-images of Shinjigen-2 with '"
		mother	=shinjigen/+p@rev
		chars		256
		dimension	2
		columns	2
		graphic	2
		direction	l2r))

  (make-charset '=big5-pua
		"Big5 with private used area"
		'(long-name	"Big5-PUA"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  registry	"Big5\\.ETEN"))
  (define-charset-alias 'chinese-big5-pua '=big5-pua)

  (let* ((i 1)
	 (hzk-min (+ (lsh #x6200 16) 65536))
	 (hzk-max (+ hzk-min 65535)))
    (while (<= i 12)
      (make-charset
       (intern (format "=hanziku-%d" i))
       (format "HANZIKU (pseudo BIG5 encoding) part %d" i)
       `(long-name ,(format "HANZIKU-%d" i)
		   chars 256
		   dimension 2
		   columns 2
		   graphic 2
		   direction l2r
		   registry ,(format "hanziku-%d$" i i)
		   min-code ,hzk-min
		   max-code ,hzk-max
		   code-offset ,hzk-min))
      (define-charset-alias
	(intern (format "ideograph-hanziku-%d" i))
	(intern (format "=hanziku-%d" i)))
      (setq hzk-min (1+ hzk-max)
	    hzk-max (+ hzk-min 65535))
      (setq i (1+ i))))

  (make-charset '===hng-jou "HNG:誠實論卷八（P.2179）"
		'(long-name "HNG/P2179"
		  chars		256
		  dimension	2
		  registry	"hng-1$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-keg "HNG:華嚴經卷十六（S.2067）"
		'(long-name "HNG/S2067"
		  chars		256
		  dimension	2
		  registry	"hng-2$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-dng "HNG:大般涅槃經卷十一（S.81）"
		'(long-name "HNG/S81"
		  chars		256
		  dimension	2
		  registry	"hng-3$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-mam "HNG:摩訶摩耶經卷上（P.2160）"
		'(long-name "HNG/P2160"
		  chars		256
		  dimension	2
		  registry	"hng-5$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-drt "HNG:大樓炭經卷三（P.2413）"
		'(long-name "HNG/P2413"
		  chars		256
		  dimension	2
		  registry	"hng-6$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kgk "HNG:賢劫經卷二（正倉院本）"
		'(long-name "HNG/賢劫經二"
		  chars		256
		  dimension	2
		  registry	"hng-7$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-myz "HNG:妙法蓮華經卷五（P.2334）"
		'(long-name "HNG/P2334"
		  chars		256
		  dimension	2
		  registry	"hng-8$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kda "HNG:大品經卷二十八（京都国立博物館本）"
		'(long-name "HNG/京博大品"
		  chars		256
		  dimension	2
		  registry	"hng-9$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-khi "HNG:妙法蓮華經卷五（今西本）"
		'(long-name "HNG/宮廷今西"
		  chars		256
		  dimension	2
		  registry	"hng-10$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-khm "HNG:妙法蓮華經卷三（守屋本）"
		'(long-name "HNG/宮廷守屋"
		  chars		256
		  dimension	2
		  registry	"hng-11$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-fhs "HNG:P2195妙法蓮華經卷六"
		'(long-name "HNG/P2195"
		  chars		256
		  dimension	2
		  registry	"hng-12$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-hok "HNG:妙法蓮華經卷八（S.2577）"
		'(long-name "HNG/S2577"
		  chars		256
		  dimension	2
		  registry	"hng-13$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kyd "HNG:漢書楊雄傳（上野本）"
		'(long-name "HNG/漢書楊雄"
		  chars		256
		  dimension	2
		  registry	"hng-14$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sok "HNG:花嚴經卷八（守屋本）"
		'(long-name "HNG/花嚴守屋"
		  chars		256
		  dimension	2
		  registry	"hng-15$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-yhk "HNG:瑜伽法鏡經（S.2423）"
		'(long-name "HNG/S2423"
		  chars		256
		  dimension	2
		  registry	"hng-16$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kak "HNG:開成石經孝經"
		'(long-name "HNG/開成孝經"
		  chars		256
		  dimension	2
		  registry	"hng-17$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kar "HNG:開成石經論語"
		'(long-name "HNG/開成論語"
		  chars		256
		  dimension	2
		  registry	"hng-18$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kae "HNG:開成石經周易"
		'(long-name "HNG/開成周易"
		  chars		256
		  dimension	2
		  registry	"hng-19$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sys "HNG:瑜伽師地論卷三十（S.5309）"
		'(long-name "HNG/S5309"
		  chars		256
		  dimension	2
		  registry	"hng-22$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-tsu "HNG:通典卷一"
		'(long-name "HNG/通典卷一"
		  chars		256
		  dimension	2
		  registry	"hng-24$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-tzj "HNG:阿毘達磨毘婆沙論卷百七（東禪寺版）"
		'(long-name "HNG/東禪毘婆"
		  chars		256
		  dimension	2
		  registry	"hng-25$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-hos "HNG:齊民要術卷五（高山寺本）"
		'(long-name "HNG/斉民要術"
		  chars		256
		  dimension	2
		  registry	"hng-26$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kkh "HNG:金剛般若經（京都国立博物館本）"
		'(long-name "HNG/京博金般"
		  chars		256
		  dimension	2
		  registry	"hng-27$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-nak "HNG:華嚴孔目（高山寺本）"
		'(long-name "HNG/華厳孔目"
		  chars		256
		  dimension	2
		  registry	"hng-28$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-jhk "HNG:神足變化經（開元寺版）"
		'(long-name "HNG/開元神足"
		  chars		256
		  dimension	2
		  registry	"hng-29$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-hod "HNG:法藏和尚傳（高山寺本）"
		'(long-name "HNG/法藏和尚"
		  chars		256
		  dimension	2
		  registry	"hng-30$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-gok "HNG:後漢書光武帝紀"
		'(long-name "HNG/光武帝紀"
		  chars		256
		  dimension	2
		  registry	"hng-31$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-ink "HNG:日本書紀 卷二十四（岩崎本）"
		'(long-name "HNG/岩崎紀24"
		  chars		256
		  dimension	2
		  registry	"hng-33$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-nto "HNG:日本書紀 卷二十四（圖書寮本）"
		'(long-name "HNG/圖書紀24"
		  chars		256
		  dimension	2
		  registry	"hng-34$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-nkm "HNG:日本書紀 卷二十四（兼右本）"
		'(long-name "HNG/兼右紀24"
		  chars		256
		  dimension	2
		  registry	"hng-36$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-k24 "HNG:日本書紀 卷二十四（寛文九年版）"
		'(long-name "HNG/寛九紀24"
		  chars		256
		  dimension	2
		  registry	"hng-37$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-ini "HNG:日本書紀卷二(鴨脚本)"
		'(long-name "HNG/鴨脚紀2"
		  chars		256
		  dimension	2
		  registry	"hng-38$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-nkk "HNG:日本書紀 卷二（兼方本）"
		'(long-name "HNG/兼方紀2"
		  chars		256
		  dimension	2
		  registry	"hng-39$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kcc "HNG:日本書紀 卷二（慶長勅版）"
		'(long-name "HNG/勅版紀2"
		  chars		256
		  dimension	2
		  registry	"hng-41$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kcj "HNG:日本書紀 卷二（慶長十五年版）"
		'(long-name "HNG/慶長紀2"
		  chars		256
		  dimension	2
		  registry	"hng-42$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kbk "HNG:日本書紀 卷二（寛文九年版）"
		'(long-name "HNG/寛九紀2"
		  chars		256
		  dimension	2
		  registry	"hng-43$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sik "HNG:花嚴經卷八（新羅本寫本）"
		'(long-name "HNG/花嚴新羅"
		  chars		256
		  dimension	2
		  registry	"hng-44$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-skk "HNG:華嚴經卷二十（晉本高麗古版）"
		'(long-name "HNG/古麗華20"
		  chars		256
		  dimension	2
		  registry	"hng-46$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kyu "HNG:初麗瑜5"
		'(long-name "HNG/瑜伽師地論卷五（高麗初彫本）"
		  chars		256
		  dimension	2
		  registry	"hng-47$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-ksk "HNG:華嚴經卷六（高麗再彫本）"
		'(long-name "HNG/再麗華6"
		  chars		256
		  dimension	2
		  registry	"hng-48$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-wan "HNG:華嚴經卷三十八（趙氏藏本）"
		'(long-name "HNG/和寧華38"
		  chars		256
		  dimension	2
		  registry	"hng-49$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-okd "HNG:金剛場陀羅尼經（小川本）"
		'(long-name "HNG/金剛小川"
		  chars		256
		  dimension	2
		  registry	"hng-50$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-wad "HNG:大般若經卷二百五十（和銅經）"
		'(long-name "HNG/和銅250"
		  chars		256
		  dimension	2
		  registry	"hng-54$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kmi "HNG:弥勒上生經（高山寺本）"
		'(long-name "HNG/弥勒上生"
		  chars		256
		  dimension	2
		  registry	"hng-55$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-zkd "HNG:續高僧傳（五月一日經）（天平寫經）"
		'(long-name "HNG/五一續高"
		  chars		256
		  dimension	2
		  registry	"hng-56$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-doh "HNG:金剛大教王經卷一（高山寺本）"
		'(long-name "HNG/金剛大教"
		  chars		256
		  dimension	2
		  registry	"hng-57$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-jyu "HNG:成唯識論卷十（寛治二年刊本）"
		'(long-name "HNG/成唯識10"
		  chars		256
		  dimension	2
		  registry	"hng-58$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-tzs "HNG:佛説大教王經卷一（東禪寺版日本寫本）"
		'(long-name "HNG/佛説大教"
		  chars		256
		  dimension	2
		  registry	"hng-60$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sai "HNG:最上秘密那拏天經(東禪寺版日本寫本)"
		'(long-name "HNG/最上秘密"
		  chars		256
		  dimension	2
		  registry	"hng-61$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kad "HNG:大般若經卷八十(春日版)"
		'(long-name "HNG/春日般若"
		  chars		256
		  dimension	2
		  registry	"hng-62$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kss "HNG:華嚴信種義（明惠自筆）"
		'(long-name "HNG/華嚴信種"
		  chars		256
		  dimension	2
		  registry	"hng-64$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kyo "HNG:教行信証卷四（親鸞自筆）"
		'(long-name "HNG/教行信証"
		  chars		256
		  dimension	2
		  registry	"hng-66$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-ykk "HNG:守屋本藥師功徳經"
		'(long-name "HNG/藥師功徳"
		  chars		256
		  dimension	2
		  registry	"hng-68$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-saa "HNG:阿毘達磨大毘婆沙論卷百七十(正倉院本)"
		'(long-name "HNG/正毘170"
		  chars		256
		  dimension	2
		  registry	"hng-70$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sab "HNG:阿毘達磨大毘婆沙論卷百七十八(正倉院本)"
		'(long-name "HNG/正毘178"
		  chars		256
		  dimension	2
		  registry	"hng-71$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-wks "HNG:花嚴經卷六十七(守屋本)"
		'(long-name "HNG/和寧華67"
		  chars		256
		  dimension	2
		  registry	"hng-72$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-wke "HNG:花嚴經卷六十八(守屋本)"
		'(long-name "HNG/和寧華68"
		  chars		256
		  dimension	2
		  registry	"hng-73$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-smk "HNG:西夏版妙法蓮華經卷一"
		'(long-name "HNG/西夏法華"
		  chars		256
		  dimension	2
		  registry	"hng-74$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sgs "HNG:四分律卷第十六(正倉院五月一日經)"
		'(long-name "HNG/正四分16"
		  chars		256
		  dimension	2
		  registry	"hng-77$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-sts "HNG:四分律卷第二十(正倉院唐經)"
		'(long-name "HNG/正四分20"
		  chars		256
		  dimension	2
		  registry	"hng-78$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '===hng-kkd "HNG:金剛大教王經卷第二(高山寺本)"
		'(long-name "HNG/院政大教"
		  chars		256
		  dimension	2
		  registry	"hng-79$"
		  graphic	2
		  columns	2
		  direction	l2r))

  (make-charset '===chise-hdic-tsj "HDIC-TSJ (新撰字鏡 天治本)"
		'(long-name "CHISE-HDIC/TSJ"
		  chars		256
		  dimension	2
		  registry	"chisetsj-0$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '=chise-hdic-tsj "HDIC-TSJ (新撰字鏡 天治本) abstract glyph"
		'(long-name "CHISE-HDIC/TSJ"
		  chars		256
		  dimension	2
		  registry	"chisetsj-0$"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	===chise-hdic-tsj))

  (make-charset '===chise-hdic-syp "HDIC-SYP (宋本玉篇)"
		'(long-name "CHISE-HDIC/SYP"
		  chars		256
		  dimension	2
		  registry	"chisesyp-0$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '=chise-hdic-syp "HDIC-SYP (宋本玉篇) abstract glyph"
		'(long-name "CHISE-HDIC/SYP"
		  chars		256
		  dimension	2
		  registry	"chisesyp-0$"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	===chise-hdic-syp))

  (make-charset '===chise-hdic-ktb "HDIC-KTB (篆隸萬象名義 高山寺本)"
		'(long-name "CHISE-HDIC/KTB"
		  chars		256
		  dimension	2
		  registry	"chisektb-0$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '=chise-hdic-ktb "HDIC-KTB (篆隸萬象名義 高山寺本) abstract glyph"
		'(long-name "CHISE-HDIC/KTB"
		  chars		256
		  dimension	2
		  registry	"chisektb-0$"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	===chise-hdic-ktb))
  (make-charset '===chise-hdic-ktb-seal "Seal-script of HDIC-KTB (篆隸萬象名義 高山寺本)"
		'(long-name "CHISE-HDIC/KTB-Seal"
		  chars		256
		  dimension	2
		  registry	"chisektbs-0$"
		  graphic	2
		  columns	2
		  direction	l2r))
  
  (make-charset '=cbeta "CBETA private characters"
		'(long-name	"CBETA PUA"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  min-code	#xE20000
		  max-code	#xE2FFFF
		  code-offset	#xE20000
		  columns	2
		  direction	l2r))
  (define-charset-alias 'ideograph-cbeta '=cbeta)
  (make-charset '==cbeta "CBETA private characters"
		'(long-name	"CBETA PUA glyph-images"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	=cbeta))
  (make-charset '===cbeta "CBETA private characters"
		'(long-name	"CBETA PUA glyph-images"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	==cbeta))
  (make-charset '=>>cbeta "CBETA abstract glyphs"
		'(long-name	"CBETA glyphs"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	=cbeta))
  (make-charset '=>cbeta "CBETA abstract characters"
		'(long-name	"CBETA characters"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	=cbeta))

  (make-charset '=zinbun-oracle
		"Oracle Bones Script"
		`(long-name	"Oracle Bones Script in Zinbun, Kyoto Univ."
		  chars		256
		  dimension	2
		  registry	"zob1968-0"
		  graphic	2
		  min-code	#xE70000
		  max-code	,(+ #xE70000 8192)
		  code-offset	#xE70000
		  columns	2
		  direction	l2r))

  (make-charset '=>zinbun-oracle
		"Abstract Oracle Bones"
		'(long-name	"Abstract characters of Zinbun Oracle Bones."
		  chars		256
		  dimension	2
		  mother	=zinbun-oracle
		  registry	"zob1968-0"
		  graphic	2
		  columns	2
		  direction	l2r))

  (make-charset '=jef-china3
		"JEF + CHINA3 private characters"
		'(long-name	"JEF + CHINA3"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"china3jef-0"
		  min-code	#xE80000
		  max-code	#xE8FFFF
		  code-offset	#xE80000))
  (define-charset-alias 'china3-jef '=jef-china3)
  (make-charset '==jef-china3
		"JEF + CHINA3 abstract glyph-images."
		'(long-name	"JEF + CHINA3"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"china3jef-0"
		  mother	=jef-china3))
  (make-charset '===jef-china3
		"JEF + CHINA3 glyph-images."
		'(long-name	"JEF-CHINA3 glyph-images"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"china3jef-0"
		  mother	==jef-china3))

  (make-charset '=ruimoku-v6
		"private characters used in RUIMOKU Version.6"
		`(long-name	"RUI6"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
                  ;; mother	ucs
		  min-code	#xE90000 ; #xE000
		  max-code	#xE908FF ; #xE8FF
		  code-offset	,(- #xE90000 #xE000)))
  (make-charset '==ruimoku-v6
		"RUIMOKU Version.6 glyph-images."
		'(long-name	"RUI6 glyph-images."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
		  mother	=ruimoku-v6))
  (make-charset '===ruimoku-v6
		"RUIMOKU Version.6 representative glyph-images."
		'(long-name	"RUI6 rep-glyph-images."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
		  mother	==ruimoku-v6))
  (make-charset '=>>ruimoku-v6
		"RUIMOKU Version.6 detailed-glyphs."
		'(long-name	"RUI6 characters."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
		  mother	=ruimoku-v6))
  (make-charset '=>ruimoku-v6
		"RUIMOKU Version.6 abstract characters."
		'(long-name	"RUI6 characters."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
		  mother	=ruimoku-v6))

  (make-charset '=shuowen-jiguge "汲古閣本説文解字"
		'(long-name "汲古閣本説文解字（抽象字体）"
		  chars		256
		  dimension	2
		  registry	"ShuowenJiguge-5$"
		  graphic	2
		  columns	2
		  direction	l2r))
  (make-charset '=>shuowen-jiguge "汲古閣本説文解字抽象文字"
		'(long-name "汲古閣本説文解字（抽象文字）"
		  chars		256
		  dimension	2
		  registry	"ShuowenJiguge-5$"
		  mother	=shuowen-jiguge
		  graphic	2
		  columns	2
		  direction	l2r))

  (make-charset '===shuowen-jiguge4 "淮南書局4次様本説文解字"
		'(long-name "京大人文研所蔵説文解字淮南書局4次様本"
		  chars		256
		  dimension	2
		  registry	"ShuowenJiguge-4$"
		  graphic	2
		  columns	2
		  direction	l2r))

  (make-charset '===shuowen-jiguge5 "汲古閣通行本説文解字"
		'(long-name "京大人文研所蔵汲古閣通行本説文解字"
		  chars		256
		  dimension	2
		  registry	"ShuowenJiguge-5$"
		  graphic	2
		  columns	2
		  direction	l2r))

  (make-charset '===shuowen-jiguge-A30 "汲古閣刊第四次修改本"
		'(long-name "京大人文研所蔵汲古閣刊第四次修改本"
		  chars		256
		  dimension	2
		  registry	"ShuowenJiguge-30$"
		  graphic	2
		  columns	2
		  direction	l2r))

  ;; (make-charset
  ;;  '=zihai
  ;;  "ZhongHua-ZiHai glyph-images"
  ;;  '(long-name "ZhongHua-ZiHai (pppp-nn)"
  ;;              chars 256
  ;;              dimension 3
  ;;              columns 2
  ;;              graphic 2
  ;;              direction l2r))

  ;; (make-charset
  ;;  '=zihai-17xx
  ;;  "ZhongHua-ZiHai (pp.1700〜1781) glyph-images"
  ;;  '(long-name "ZhongHua-ZiHai pp.17xx"
  ;;              chars 256
  ;;              dimension 2
  ;;              columns 2
  ;;              graphic 2
  ;;              direction l2r
  ;;              registry "zihai\\.cp-17$"))

  (make-charset '=big5-cdp-itaiji-001
		"Big5-CDP-itaiji-001 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-001"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-1$"
		  mother        =big5-cdp))
  (make-charset '=>big5-cdp-itaiji-001
		"Big5-CDP-itaiji-001 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-001"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-1$"
		  mother        =big5-cdp-itaiji-001))
  (make-charset '==big5-cdp-itaiji-001
		"Big5-CDP-itaiji-001 abstract glyph-image of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-001"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-1$"
		  mother        =big5-cdp-itaiji-001))

  (make-charset '=big5-cdp-itaiji-002
		"Big5-CDP-itaiji-002 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-002"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-2$"
		  mother        =big5-cdp))
  (make-charset '=>big5-cdp-itaiji-002
		"Big5-CDP-itaiji-002 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-002"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-2$"
		  mother        =big5-cdp-itaiji-002))

  (make-charset '=big5-cdp-itaiji-003
		"Big5-CDP-itaiji-003 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-003"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-3$"
		  mother        =big5-cdp))
  (make-charset '=>big5-cdp-itaiji-003
		"Big5-CDP-itaiji-003 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-003"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-3$"
		  mother        =big5-cdp-itaiji-003))

  (make-charset '=big5-cdp-itaiji-004
		"Big5-CDP-itaiji-004 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-004"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-4$"
		  mother        =big5-cdp))
  (make-charset '=>big5-cdp-itaiji-004
		"Big5-CDP-itaiji-004 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-004"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-4$"
		  mother        =big5-cdp-itaiji-004))

  (make-charset '=big5-cdp-itaiji-005
		"Big5-CDP-itaiji-005 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-005"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-5$"
		  mother        =big5-cdp))
  (make-charset '=>big5-cdp-itaiji-005
		"Big5-CDP-itaiji-005 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-005"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-5$"
		  mother        =big5-cdp-itaiji-005))

  (make-charset '=big5-cdp-itaiji-006
		"Big5-CDP-itaiji-006 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-006"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-6$"
		  mother        =big5-cdp))
  (make-charset '=>big5-cdp-itaiji-006
		"Big5-CDP-itaiji-006 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-itaiji-006"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.itaiji-6$"
		  mother        =big5-cdp-itaiji-006))

  (make-charset '=big5-cdp-var-001
		"Big5-CDP-var-001 glyphs of GlyphWiki"
		'(long-name     "Big5-CDP-var-001"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-1$"
		  mother        =big5-cdp))

  (make-charset '=>big5-cdp-var-001
		"Big5-CDP-var-001 abstract characters of GlyphWiki"
		'(long-name     "Big5-CDP-var-001"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-1$"
		  mother        =big5-cdp-var-001))

  (make-charset '=big5-cdp-var-002
		"Big5-CDP-var-002 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-002"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-2$"
		  mother        =big5-cdp))

  (make-charset '=big5-cdp-var-003
		"Big5-CDP-var-003 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-003"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-3$"
		  mother        =big5-cdp))
  (define-charset-alias '=big5-cdp-var-3 '=big5-cdp-var-003)

  (make-charset '=big5-cdp-var-004
		"Big5-CDP-var-004 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-004"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-4$"
		  mother        =big5-cdp))

  (make-charset '=big5-cdp-var-005
		"Big5-CDP-var-005 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-005"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-5$"
		  mother        =big5-cdp))
  (define-charset-alias '=big5-cdp-var-5 '=big5-cdp-var-005)

  (make-charset '=big5-cdp-var-007
		"Big5-CDP-var-007 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-007"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-7$"
		  mother        =big5-cdp))

  (make-charset '=big5-cdp-var-008
		"Big5-CDP-var-008 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-008"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-8$"
		  mother        =big5-cdp))

  (make-charset '=big5-cdp-var-010
		"Big5-CDP-var-010 glyph-images of GlyphWiki"
		'(long-name     "Big5-CDP-var-010"
		  chars         256
		  dimension     2
		  columns       2
		  graphic       2
		  direction     l2r
		  registry      "cdp\\.var-10$"
		  mother        =big5-cdp))

  (make-charset '==>ucs@bucs
		"Basic Subset of Coded Character Sets (BUCS)"
		'(long-name	"BUCS abstract characters"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))
  (make-charset '==>ucs@esu
		"Extended Subset of Coded Character Sets (ESU)"
		'(long-name	"BUCS abstract characters"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==>ucs@bucs))

  (make-charset '=>iwds-1
		"The IRG Working Document Series 1: List of UCV of Ideograhs."
		'(long-name	"IWDS 1: List of UCV"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))

  (make-charset '=>ucs@iwds-1
		"UCS abstract characters based on IWDS-1."
		'(long-name	"UCS based on IWDS-1"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs@iwds-1/normalized
		"UCS abstract characters based on IWDS-1."
		'(long-name	"UCS based on IWDS-1"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@iwds-1))

  (make-charset '=>ucs@cognate
		"UCS abstract characters based on cognate."
		'(long-name	"UCS based on cognate"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))

  (make-charset '=>ucs@component
		"UCS encoding for abstract components of IWDS-1."
		'(long-name	"UCS for IWDS-1 abstract components"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))

  ;; (make-charset '=>ucs@hanyo-denshi
  ;;               "UCS abstract characters based on Han'you-Denshi collection."
  ;;               '(long-name     "UCS base characters of Han'you-Denshi"
  ;;                 chars         256
  ;;                 dimension     3
  ;;                 columns       2
  ;;                 graphic       2
  ;;                 direction     l2r
  ;;                 =>iso-ir      177
  ;;                 mother        =ucs))

  (make-charset '=>ucs@iso
		"Abstract characters of ISO/IEC 10646 representatives"
		'(long-name	"UCS characters for ISO"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs@unicode
		"Abstract characters of Unicode representatives"
		'(long-name	"UCS characters for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@iso))
  (make-charset '=>ucs@jis
		"UCS representative characters for JIS X0208/0212/0213"
		'(long-name	"UCS characters for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@unicode))
  (make-charset '=>ucs@jis/2000
		"ISO/IEC 10646 for JIS X 0213:2000"
		'(long-name	"UCS for JIS:2000"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@jis))
  (make-charset '=>ucs@jis/2004
		"ISO/IEC 10646 for JIS X 0213:2004"
		'(long-name	"UCS for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@jis))
  (make-charset '=>ucs@ks
		"UCS representative characters for Korean Standards"
		'(long-name	"UCS characters for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@unicode))
  (make-charset '=>ucs@cns
		"UCS representatives characters for CNS 11643 sources"
		'(long-name	"UCS characters for CNS 11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@unicode))

  (make-charset '=+>ucs@iso
		"UCS based on ISO/IEC 10646 representative glyphs"
		'(long-name	"Unified abstract glyphs of UCS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@iso))
  (make-charset '=+>ucs@unicode
		"Unicode representative unified abstract glyphs"
		'(long-name	"UCS unified abstract glyphs for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=+>ucs@iso))
  (make-charset '=+>ucs@jis
		"UCS based on Japanese usual unification"
		'(long-name	"UCS unified abstract glyphs for JP"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=+>ucs@unicode))
  (define-charset-alias '=>ucs@JP '=+>ucs@jis)
  (make-charset '=+>ucs@jis/1990
		"UCS representative characters for JIS X0208/0212:1990"
		'(long-name	"UCS characters for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=+>ucs@jis))
  (define-charset-alias '=>ucs@jis/1990 '=+>ucs@jis/1990)
  (make-charset '=+>ucs@jis/2004
		"UCS representative characters for JIS X 0213:2004"
		'(long-name	"UCS characters for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=+>ucs@jis))
  (make-charset '=+>ucs@ks
		"UCS representative unified abstract glyphs for Korean Standards"
		'(long-name	"UCS unified abstract glyphs for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=+>ucs@unicode))
  (make-charset '=+>ucs@cns
		"UCS representatives unified abstract glyphs for CNS 11643 sources"
		'(long-name	"UCS unified abstract glyphs for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=+>ucs@unicode))

  (make-charset '=ucs@iso
		"ISO/IEC 10646 for its representative glyphs"
		'(long-name	"UCS for ISO"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
                  mother	=+>ucs@iso
		  ))
  (make-charset '=ucs@unicode
		"Unicode for its representative glyphs"
		'(long-name	"UCS for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@iso))
  (make-charset '=ucs@gb
		"ISO/IEC 10646 for GB"
		'(long-name	"UCS for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-gb '=ucs@gb)
  (make-charset '=ucs@gb/fw
		"ISO/IEC 10646 for GB with fullwidth"
		'(long-name	"UCS for GB-fullwidth"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@gb))
  (make-charset '=ucs-bmp@gb
		"ISO/IEC 10646 BMP for GB"
		'(long-name	"BMP for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@gb
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '=ucs@cns
		"ISO/IEC 10646 for CNS 11643"
		'(long-name	"UCS for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (make-charset '=ucs@cns/2008
		"ISO/IEC 10646 for CNS 11643:2008"
		'(long-name	"UCS for CNS@2008"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@cns))
  (make-charset
   '=ucs-sip@cns
   "CNS glyphs of UCS SIP"
   '(long-name "CNS SIP glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00\\.t-2$"
	       mother =ucs@cns
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (define-charset-alias 'ucs-cns '=ucs@cns)
  (make-charset '=ucs@cns/fw
		"ISO/IEC 10646 for CNS 11643 with fullwidth"
		'(long-name	"UCS for CNS-fullwidth"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@cns))
  (make-charset '=ucs-bmp@cns
		"ISO/IEC 10646 BMP for CNS"
		'(long-name	"BMP for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@cns
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '=ucs@jis
		"ISO/IEC 10646 for JIS X0208/0212/0213"
		'(long-name	"UCS for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-jis '=ucs@jis)
  (make-charset '=ucs@jis/fw
		"ISO/IEC 10646 for JIS X0208/0212/0213 with fullwidth"
		'(long-name	"UCS for JIS-fullwidth"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (make-charset '=ucs-bmp@jis
		"ISO/IEC 10646 BMP for JIS"
		'(long-name	"BMP for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@jis
		  min-code	#x0000
		  max-code	#xFFFF))
  ;; (make-charset '=ucs@jis/1983
  ;;               "ISO/IEC 10646 for JIS X 0208:1983"
  ;;               '(long-name     "UCS for JIS:1983"
  ;;                 chars         256
  ;;                 dimension     3
  ;;                 columns       2
  ;;                 graphic       2
  ;;                 direction     l2r
  ;;                 =>iso-ir      177
  ;;                 mother        =ucs@jis))
  (make-charset '=ucs@jis/1990
		"ISO/IEC 10646 for JIS X 0208/0212:1990"
		'(long-name	"UCS for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (define-charset-alias '=ucs@jis-1990 '=ucs@jis/1990)
  (define-charset-alias '=ucs-jis-1990 '=ucs@jis/1990)
  (make-charset '=ucs@jis/2000
		"ISO/IEC 10646 for JIS X 0213:2000"
		'(long-name	"UCS for JIS:2000"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (define-charset-alias '=ucs@jis-2000 '=ucs@jis/2000)
  (define-charset-alias '=ucs-jis-2000 '=ucs@jis/2000)
  (make-charset '=ucs@jis/2004
		"ISO/IEC 10646 for JIS X 0213:2004"
		'(long-name	"UCS for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (make-charset '=ucs@JP
		"UCS for common glyphs used in Japan"
		'(long-name	"UCS for Japan"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis/2004))
  (define-charset-alias '=ucs@jp '=ucs@JP)
  (make-charset '=ucs@JP/hanazono
		"Japanese glyph-images of Hanazono Mincho"
		'(long-name	"UCS for Hana-Min"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@JP))
  (make-charset '=ucs@ks
		"ISO/IEC 10646 for Korean Standards"
		'(long-name	"UCS for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-ks '=ucs@ks)
  (make-charset '=ucs@ks/2012
		"Mapping for Korean Standards in ISO/IEC 10646:2012"
		'(long-name	"UCS:2012 for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@ks))
  (make-charset '=ucs-bmp@ks
		"ISO/IEC 10646 BMP for KS"
		'(long-name	"BMP for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@ks
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '=ucs@cns11643
		"ISO/IEC 10646 for CNS based on www.cns11643.gov.tw"
		'(long-name	"UCS for CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@cns))
  (make-charset '=ucs@big5
		"ISO/IEC 10646 for Big5"
		'(long-name	"UCS for Big5"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  ;; mother	=>ucs@iwds-1
		  mother	=ucs@cns
		  ;; mother	=>>ucs@cns
		  ))
  (define-charset-alias 'ucs-big5 '=ucs@big5)
  (make-charset '=ucs@big5/cns11643
		"ISO/IEC 10646 for Big5 based on www.cns11643.gov.tw"
		'(long-name	"UCS for Big5@CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@big5))

  (make-charset '=>>ucs@iso
		"Representative abstract-glyphs of ISO/IEC 10646"
		'(long-name	"UCS abstract glyphs for UCS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@iso))
  (make-charset '=>>ucs@unicode
		"Representative abstract-glyphs of Unicode"
		'(long-name	"Unicode abstract glyphs"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@iso))
  (make-charset '=>>ucs@jis
		"UCS Representative abstract-glyphs for JIS X0208/0212/0213"
		'(long-name	"UCS abstract glyphs for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@unicode))
  (make-charset '=>>ucs@jis/1990
		"UCS Representative glyphs for JIS X 0208/0212:1990"
		'(long-name	"UCS glyphs for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis))
  (make-charset '=>>ucs@jis/2000
		"UCS Representative glyphs for JIS X 0213:2000"
		'(long-name	"UCS glyphs for JIS:2000"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis))
  (make-charset '=>>ucs@jis/2004
		"UCS Representative glyphs for JIS X 0213:2004"
		'(long-name	"UCS glyphs for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis))
  (make-charset '=>>ucs@JP
		"UCS abstract-glyphs based on Japanese style glyphs"
		'(long-name	"UCS glyphs for JP"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis/2004))
  (make-charset '=>>ucs@ks
		"UCS Representative glyphs for Korean Standards"
		'(long-name	"UCS glyphs for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@unicode))
  (make-charset '=>>ucs@cns
		"UCS Representative glyphs for CNS 11643 sources"
		'(long-name	"UCS glyphs for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@unicode))

  (make-charset '==ucs@iso
		"Representative glyph-forms of ISO/IEC 10646."
		'(long-name     "UCS glyph-forms for UCS"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        =>>ucs@iso))
  (define-charset-alias '=>>>ucs@iso '==ucs@iso)
  (make-charset '==ucs@unicode
		"Representative glyph-forms of Unicode."
		'(long-name     "UCS glyph-forms for Unicode"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@iso))
  (define-charset-alias '=>>>ucs@unicode '==ucs@unicode)
  (make-charset '==ucs@gb
		"ISO/IEC 10646 for GB"
		'(long-name	"UCS for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@unicode))
  (make-charset '==ucs-bmp@gb
		"ISO/IEC 10646 BMP for GB"
		'(long-name	"BMP for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs@gb
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '==ucs@cns
		"UCS Representative glyph-forms for CNS 11643 sources."
		'(long-name     "UCS glyph-forms for CNS"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@unicode))
  (define-charset-alias '=>>>ucs@cns '==ucs@cns)
  (make-charset '==ucs-bmp@cns
		"ISO/IEC 10646 BMP for CNS"
		'(long-name	"BMP for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs@cns
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '==ucs@jis
		"UCS Representative glyph-forms for JIS X0208/0212/0213."
		'(long-name     "UCS glyph-forms for JIS"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@unicode))
  (define-charset-alias '=>>>ucs@jis '==ucs@jis)
  (make-charset '==ucs@jis/1990
		"UCS Representative glyph-forms for JIS X 0208/0212:1990."
		'(long-name     "UCS glyph-forms for JIS:1990"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@jis))
  (define-charset-alias '=>>>ucs@jis/1990 '==ucs@jis/1990)
  (make-charset '==ucs@jis/2000
		"UCS Representative glyph-forms for JIS X 0213:2000."
		'(long-name     "UCS glyph-forms for JIS:2000"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@jis))
  (define-charset-alias '=>>>ucs@jis/2000 '==ucs@jis/2000)
  (make-charset '==ucs@jis/2004
		"UCS Representative glyph-forms for JIS X 0213:2004."
		'(long-name     "UCS glyph-forms for JIS:2004"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@jis))
  (define-charset-alias '=>>>ucs@jis/2004 '==ucs@jis/2004)
  (make-charset '==ucs@JP
		"UCS for common glyph-forms used in Japan."
		'(long-name	"UCS for Japan"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@jis/2004))
  (make-charset '==ucs@JP/hanazono
		"Japanese glyph-forms of Hanazono Mincho."
		'(long-name	"UCS for Hana-Min"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@JP))
  (make-charset '==ucs@ks
		"UCS Representative glyph-forms for Korean Standards."
		'(long-name     "UCS glyph-forms for KS"
		  chars         256
		  dimension     3
		  columns       2
		  graphic       2
		  direction     l2r
		  =>iso-ir      177
		  mother        ==ucs@unicode))
  (define-charset-alias '=>>>ucs@ks '==ucs@ks)
  (make-charset '==ucs-bmp@ks
		"ISO/IEC 10646 BMP for KS."
		'(long-name	"BMP for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs@ks
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '==ucs@cns11643
		"ISO/IEC 10646 for CNS based on www.cns11643.gov.tw."
		'(long-name	"UCS for CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@cns))

  (make-charset '===ucs@iso
		"ISO/IEC 10646-2 representative glyph-images."
		'(long-name	"ISO rep-images for UCS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@iso))
  (make-charset '===ucs@unicode
		"Unicode for its representative glyph-images."
		'(long-name	"UCS for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@unicode))
  (make-charset '===ucs@gb
		"UCS representative glyph-images of GB."
		'(long-name	"UCS rep-images for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	===ucs@unicode))
  (make-charset '===ucs@ks
		"UCS representative glyph-images of Korean Standards."
		'(long-name	"UCS rep-images for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	==ucs@ks))

  (make-charset '=ucs-var-001
		"uXXXX-var-001 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-001
		"uXXXX-var-001 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-001
		  min-code #x2E00
		  max-code #x9FEA
		  registry "ucs\\.var001-0"))
  (make-charset '=ucs-sip-var-001
		"uXXXX-var-001 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-001
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var001-2"))
  (make-charset '=ucs-tip-var-001
		"uXXXX-var-001 glyph-images in TIP"
		'(long-name	"UCS-TIP-var-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-001
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.var001-3"))
  (make-charset '=>ucs-var-001
		"Abstract characters corresponding with uXXXX-var-001 of GlyphWiki"
		'(long-name	"UCS-var-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-var-001
		"uXXXX-var-001's abstract characters in BMP"
		'(long-name	"UCS-BMP-var-001 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-var-001
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var001-0"))
  (make-charset '=>ucs-sip-var-001
		"uXXXX-var-001's abstract characters in SIP"
		'(long-name	"UCS-SIP-var-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-var-001
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var001-2"))
  (make-charset '==ucs-var-001
		"Abstract glyph-forms corresponding with uXXXX-var-001 of GlyphWiki"
		'(long-name	"UCS-var-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-001))
  (make-charset '==ucs-bmp-var-001
		"uXXXX-var-001's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-var-001 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-var-001
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var001-0"))
  (make-charset '==ucs-sip-var-001
		"uXXXX-var-001's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-var-001 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-var-001
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var001-2"))

  (make-charset '=ucs-var-002
		"uXXXX-var-002 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-002"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-002
		"uXXXX-var-002 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-002
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var002-0"))
  (make-charset '=ucs-sip-var-002
		"uXXXX-var-002 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-002
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var002-2"))
  (make-charset '=ucs-tip-var-002
		"uXXXX-var-002 glyph-images in TIP"
		'(long-name	"UCS-TIP-var-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-002
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.var002-3"))
  (make-charset '==ucs-var-002
		"Abstract glyph-forms corresponding with uXXXX-var-002 of GlyphWiki"
		'(long-name	"UCS-var-002"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-002))
  (make-charset '==ucs-bmp-var-002
		"uXXXX-var-002's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-var-002 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-var-002
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var002-0"))
  (make-charset '==ucs-sip-var-002
		"uXXXX-var-002's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-var-002 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-var-002
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var002-2"))

  (make-charset '=ucs-var-003
		"uXXXX-var-003 glyphs of GlyphWiki"
		'(long-name	"UCS-var-003"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-003
		"uXXXX-var-003 glyphs in BMP"
		'(long-name	"UCS-BMP-var-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-003
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var003-0"))
  (make-charset '=ucs-sip-var-003
		"uXXXX-var-003 glyphs in SIP"
		'(long-name	"UCS-SIP-var-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-003
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var003-2"))
  (make-charset '=ucs-tip-var-003
		"uXXXX-var-003 glyphs in TIP"
		'(long-name	"UCS-TIP-var-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-003
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.var003-3"))
  (make-charset '=+>ucs-var-003
		"uXXXX-var-003's unified glyphs of GlyphWiki"
		'(long-name	"UCS-var-003 unified glyphs"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-003))
  (make-charset '=+>ucs-bmp-var-003
		"uXXXX-var-003's unified glyphs in BMP"
		'(long-name	"UCS-BMP-var-003 unified glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=+>ucs-var-003
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var003-0"))
  (make-charset '=+>ucs-tip-var-003
		"uXXXX-var-003 unified glyphs in TIP"
		'(long-name	"UCS-TIP-var-003 unified glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=+>ucs-var-003
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.var003-3"))
  (make-charset '==ucs-var-003
		"Abstract glyph-forms corresponding with uXXXX-var-003 of GlyphWiki"
		'(long-name	"UCS-var-003"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-003))
  (make-charset '==ucs-bmp-var-003
		"uXXXX-var-003's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-var-003 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-var-003
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var003-0"))
  (make-charset '==ucs-sip-var-003
		"uXXXX-var-003's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-var-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-var-003
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var003-2"))

  (make-charset '=ucs-var-004
		"uXXXX-var-004 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-004
		"uXXXX-var-004 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-004
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var004-0"))
  (make-charset '=ucs-sip-var-004
		"uXXXX-var-004 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-004
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var004-2"))
  (make-charset '=ucs-tip-var-004
		"uXXXX-var-004 glyph-images in TIP"
		'(long-name	"UCS-TIP-var-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-004
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.var004-3"))

  (make-charset '=ucs-var-005
		"uXXXX-var-005 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-005"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-005
		"uXXXX-var-005 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-005"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-005
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var005-0"))
  (make-charset '=ucs-sip-var-005
		"uXXXX-var-005 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-005"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-005
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var005-2"))

  (make-charset '=ucs-var-006
		"uXXXX-var-006 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-006"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-006
		"uXXXX-var-006 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-006"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-006
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var006-0"))
  (make-charset '=ucs-sip-var-006
		"uXXXX-var-006 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-006"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-006
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var006-2"))

  (make-charset '=ucs-var-007
		"uXXXX-var-007 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-007"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-007
		"uXXXX-var-007 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-007"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-007
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var007-0"))
  (make-charset '=ucs-tip-var-007
		"uXXXX-var-007 glyph-images in TIP"
		'(long-name	"UCS-TIP-var-007"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-007
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.var007-3"))
  (make-charset '==ucs-var-007
		"Abstract glyph-forms corresponding with uXXXX-var-007 of GlyphWiki"
		'(long-name	"UCS-var-007"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-007))
  (make-charset '==ucs-bmp-var-007
		"uXXXX-var-007's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-var-007 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-var-007
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var007-0"))

  (make-charset '=ucs-var-008
		"uXXXX-var-008 glyph-images of GlyphWiki"
		'(long-name	"UCS-var-008"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-008
		"uXXXX-var-008 glyph-images in BMP"
		'(long-name	"UCS-BMP-var-008"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-008
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var008-0"))
  (make-charset '=ucs-sip-var-008
		"uXXXX-var-008 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-008"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-008
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var008-2"))

  (make-charset '=ucs-var-010
		"uXXXX-var-010 glyph-forms of GlyphWiki"
		'(long-name	"UCS-var-010"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-var-010
		"uXXXX-var-010 glyph-forms in BMP"
		'(long-name	"UCS-BMP-var-010"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-var-010
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.var010-0"))
  (make-charset '=ucs-sip-var-010
		"uXXXX-var-010 glyph-images in SIP"
		'(long-name	"UCS-SIP-var-010"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-var-010
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.var010-2"))

  (make-charset '=ucs-itaiji-001
		"uXXXX-itaiji-001 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-itaiji-001-additional-idc
		"uXXXX-itaiji-001 glyph-images for additional IDC"
		'(long-name	"UCS-BMP-itaiji-001 additional IDC"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-001
		  min-code #x2FF1
		  max-code #x2FFB
		  registry "ucs\\.itaiji001-0"))
  (make-charset '=ucs-bmp-itaiji-001
		"uXXXX-itaiji-001 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-001
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji001-0"))
  (make-charset '=ucs-sip-itaiji-001
		"uXXXX-itaiji-001 glyph-images in SIP"
		'(long-name	"UCS-SIP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-001
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji001-2"))
  (make-charset '=ucs-tip-itaiji-001
		"uXXXX-itaiji-001 glyph-images in TIP"
		'(long-name	"UCS-TIP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-001
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.itaiji001-3"))
  (make-charset '=>ucs-itaiji-001
		"Abstract characters corresponding with uXXXX-itaiji-001 of GlyphWiki"
		'(long-name	"UCS-itaiji-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-001
		"uXXXX-itaiji-001's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-001 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-001
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji001-0"))
  (make-charset '=>ucs-sip-itaiji-001
		"uXXXX-itaiji-001 characters in SIP"
		'(long-name	"UCS-SIP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-001
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji001-2"))
  (make-charset '=>ucs-tip-itaiji-001
		"uXXXX-itaiji-001 characters in TIP"
		'(long-name	"UCS-TIP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-001
		  min-code #x30000 max-code #x3FFFF
		  registry "ucs00\\.itaiji001-3"))
  (make-charset '==ucs-itaiji-001
		"Abstract glyph-forms corresponding with uXXXX-itaiji-001 of GlyphWiki"
		'(long-name	"UCS-itaiji-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-001))
  (make-charset '==ucs-bmp-itaiji-001
		"uXXXX-itaiji-001's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-itaiji-001
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji001-0"))
  (make-charset '==ucs-sip-itaiji-001
		"uXXXX-itaiji-001's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-itaiji-001"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-itaiji-001
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji001-2"))
  (make-charset '=>ucs-itaiji-001@iwds-1
		"uXXXX-itaiji-001's abstract characters based on IWDS-1"
		'(long-name	"IWDS-1 abstract characters of UCS-itaiji-001"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-001))
  (make-charset '=>ucs-bmp-itaiji-001@iwds-1
		"IWDS-1 abstract characters of UCS-itaiji-001 in BMP"
		'(long-name	"=>ucs-itaiji-001@iwds-1 in BMP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-001@iwds-1
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji001-0"))
  (make-charset '=>ucs-sip-itaiji-001@iwds-1
		"IWDS-1 abstract characters of UCS-itaiji-001 in SIP"
		'(long-name	"=>ucs-itaiji-001@iwds-1 in SIP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-001@iwds-1
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji001-2"))

  (make-charset '=ucs-itaiji-002
		"uXXXX-itaiji-002 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-002"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-002
		"uXXXX-itaiji-002 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-002
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji002-0"))
  (make-charset '=ucs-sip-itaiji-002
		"uXXXX-itaiji-002 glyph-images in SIP"
		'(long-name	"UCS-SIP-itaiji-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-002
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji002-2"))
  (make-charset '=>ucs-itaiji-002
		"Abstract characters corresponding with uXXXX-itaiji-002 of GlyphWiki"
		'(long-name	"UCS-itaiji-002"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-002))
  (make-charset '=>ucs-bmp-itaiji-002
		"uXXXX-itaiji-002's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-002 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-002
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji002-0"))
  (make-charset '=>ucs-sip-itaiji-002
		"uXXXX-itaiji-002 characters in SIP"
		'(long-name	"UCS-SIP-itaiji-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-002
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji002-2"))
  (make-charset '==ucs-itaiji-002
		"Abstract glyph-forms corresponding with uXXXX-itaiji-002 of GlyphWiki"
		'(long-name	"UCS-itaiji-002"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-002))
  (make-charset '==ucs-bmp-itaiji-002
		"uXXXX-itaiji-002's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-itaiji-002 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-itaiji-002
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji002-0"))
  (make-charset '==ucs-sip-itaiji-002
		"uXXXX-itaiji-002's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-itaiji-002"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-itaiji-002
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji002-2"))
  (make-charset '=>ucs-itaiji-002@iwds-1
		"uXXXX-itaiji-002's abstract characters based on IWDS-1"
		'(long-name	"IWDS-1 abstract characters of UCS-itaiji-002"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-002))
  (make-charset '=>ucs-bmp-itaiji-002@iwds-1
		"IWDS-1 abstract characters of UCS-itaiji-002 in BMP"
		'(long-name	"=>ucs-itaiji-002@iwds-1 in BMP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-002@iwds-1
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji002-0"))
  (make-charset '=>ucs-sip-itaiji-002@iwds-1
		"IWDS-1 abstract characters of uXXXX-itaiji-002 in SIP"
		'(long-name	"=>ucs-itaiji-002@iwds-1 in SIP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-002@iwds-1
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji002-2"))

  (make-charset '=ucs-itaiji-003
		"uXXXX-itaiji-003 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-003"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-003
		"uXXXX-itaiji-003 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-003
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji003-0"))
  (make-charset '=ucs-sip-itaiji-003
		"uXXXX-itaiji-003 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-003
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji003-2"))
  (make-charset '=>ucs-itaiji-003
		"Abstract characters corresponding with uXXXX-itaiji-003 of GlyphWiki"
		'(long-name	"UCS-itaiji-003"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-003))
  (make-charset '=>ucs-bmp-itaiji-003
		"uXXXX-itaiji-003's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-003 abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-003
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji003-0"))
  (make-charset '=>ucs-sip-itaiji-003
		"uXXXX-itaiji-003's abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-003 abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-003
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji003-2"))
  (make-charset '==ucs-itaiji-003
		"Abstract glyph-forms corresponding with uXXXX-itaiji-003 of GlyphWiki"
		'(long-name	"UCS-itaiji-003"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-003))
  (make-charset '==ucs-bmp-itaiji-003
		"uXXXX-itaiji-003's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-itaiji-003 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-itaiji-003
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji003-0"))
  (make-charset '==ucs-sip-itaiji-003
		"uXXXX-itaiji-003's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-itaiji-003"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-itaiji-003
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji003-2"))
  (make-charset '=>ucs-itaiji-003@iwds-1
		"uXXXX-itaiji-003's abstract characters based on IWDS-1"
		'(long-name	"IWDS-1 abstract characters of UCS-itaiji-003"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-003))
  (make-charset '=>ucs-bmp-itaiji-003@iwds-1
		"IWDS-1 abstract characters of UCS-itaiji-003 in BMP"
		'(long-name	"=>ucs-itaiji-003@iwds-1 in BMP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-003@iwds-1
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji003-0"))
  (make-charset '=>ucs-sip-itaiji-003@iwds-1
		"IWDS-1 abstract characters of UCS-itaiji-003 in SIP"
		'(long-name	"=>ucs-itaiji-003@iwds-1 in SIP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-003@iwds-1
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji003-2"))

  (make-charset '=ucs-itaiji-004
		"uXXXX-itaiji-004 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-004
		"uXXXX-itaiji-004 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-004
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji004-0"))
  (make-charset '=ucs-sip-itaiji-004
		"uXXXX-itaiji-004 glyph-images in SIP"
		'(long-name	"UCS-SIP-itaiji-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-004
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji004-2"))
  (make-charset '=>ucs-itaiji-004
		"Abstract characters corresponding with uXXXX-itaiji-004 of GlyphWiki"
		'(long-name	"UCS-itaiji-004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-004))
  (make-charset '=>ucs-bmp-itaiji-004
		"uXXXX-itaiji-004's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-004 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-004
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji004-0"))
  (make-charset '=>ucs-sip-itaiji-004
		"uXXXX-itaiji-004 glyph-images in SIP"
		'(long-name	"UCS-SIP-itaiji-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-004
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji004-2"))
  (make-charset '==ucs-itaiji-004
		"Abstract glyph-forms corresponding with uXXXX-itaiji-004 of GlyphWiki"
		'(long-name	"UCS-itaiji-004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-004))
  (make-charset '==ucs-sip-itaiji-004
		"uXXXX-itaiji-004's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-itaiji-004"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-itaiji-004
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji004-2"))

  (make-charset '=ucs-itaiji-005
		"uXXXX-itaiji-005 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-005"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-005
		"uXXXX-itaiji-005 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-005"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-005
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji005-0"))
  (make-charset '=ucs-sip-itaiji-005
		"uXXXX-itaiji-005 glyph-images in SIP"
		'(long-name	"UCS-SIP-itaiji-005"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-005
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji005-2"))
  (make-charset '=>ucs-itaiji-005
		"Abstract characters corresponding with uXXXX-itaiji-005 of GlyphWiki"
		'(long-name	"UCS-itaiji-005"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-005
		"uXXXX-itaiji-005's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-005 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-005
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji005-0"))
  (make-charset '=>ucs-sip-itaiji-005
		"uXXXX-itaiji-005's abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-005 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-005
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji005-2"))
  (make-charset '==ucs-itaiji-005
		"Abstract glyph-forms corresponding with uXXXX-itaiji-005 of GlyphWiki"
		'(long-name	"UCS-itaiji-005"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-005))
  (make-charset '==ucs-bmp-itaiji-005
		"uXXXX-itaiji-005's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-itaiji-005 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-itaiji-005
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji005-0"))
  (make-charset '==ucs-sip-itaiji-005
		"uXXXX-itaiji-005's abstract glyph-forms in SIP"
		'(long-name	"UCS-SIP-itaiji-005"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	==ucs-itaiji-005
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji005-2"))

  (make-charset '=ucs-itaiji-006
		"uXXXX-itaiji-006 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-006"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-006
		"uXXXX-itaiji-006 glyphs in BMP"
		'(long-name	"UCS-BMP-itaiji-006"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-006
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji006-0"))
  (make-charset '=ucs-sip-itaiji-006
		"uXXXX-itaiji-006 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-006"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-006
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji006-2"))
  (make-charset '==ucs-itaiji-006
		"Abstract glyph-forms corresponding with uXXXX-itaiji-006 of GlyphWiki"
		'(long-name	"UCS-itaiji-006"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-006))
  (make-charset '==ucs-bmp-itaiji-006
		"uXXXX-itaiji-006's abstract glyph-forms in BMP"
		'(long-name	"UCS-BMP-itaiji-006 glyph-forms"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	==ucs-itaiji-006
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji006-0"))
  (make-charset '=>ucs-itaiji-006
		"Abstract characters corresponding with uXXXX-itaiji-006 of GlyphWiki"
		'(long-name	"UCS-itaiji-006"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-006))
  (make-charset '=>ucs-bmp-itaiji-006
		"uXXXX-itaiji-006's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-006 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-006
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji006-0"))
  (make-charset '=>ucs-sip-itaiji-006
		"uXXXX-itaiji-006's abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-006 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-006
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji006-2"))
  (make-charset '=>ucs-itaiji-006@iwds-1
		"uXXXX-itaiji-006's abstract characters based on IWDS-1"
		'(long-name	"IWDS-1 abstract characters of UCS-itaiji-006"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-006))
  (make-charset '=>ucs-bmp-itaiji-006@iwds-1
		"IWDS-1 abstract characters of UCS-itaiji-006 in BMP"
		'(long-name	"=>ucs-itaiji-006@iwds-1 in BMP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-006@iwds-1
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji006-0"))

  (make-charset '=ucs-itaiji-007
		"uXXXX-itaiji-007 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-007"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-007
		"uXXXX-itaiji-007 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-007"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-007
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji007-0"))
  (make-charset '=ucs-sip-itaiji-007
		"uXXXX-itaiji-007 glyph-images in SIP"
		'(long-name	"UCS-SIP-itaiji-007"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-007
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji007-2"))
  (make-charset '=>ucs-itaiji-007
		"Abstract characters corresponding with uXXXX-itaiji-007 of GlyphWiki"
		'(long-name	"UCS-itaiji-007"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-007
		"uXXXX-itaiji-007's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-007 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-007
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji007-0"))
  (make-charset '=>ucs-sip-itaiji-007
		"uXXXX-itaiji-007 characters in SIP"
		'(long-name	"UCS-SIP-itaiji-007"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-007
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji007-2"))

  (make-charset '=ucs-itaiji-008
		"uXXXX-itaiji-008 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-008"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-008
		"uXXXX-itaiji-008 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-008"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-008
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji008-0"))
  (make-charset '=ucs-sip-itaiji-008
		"uXXXX-itaiji-008 abstract glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-008"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-008
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji008-2"))
  (make-charset '=>ucs-itaiji-008
		"Abstract characters corresponding with uXXXX-itaiji-008 of GlyphWiki"
		'(long-name	"UCS-itaiji-008 characters"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-008
		"uXXXX-itaiji-008's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-008 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-008
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji008-0"))
  (make-charset '=>ucs-sip-itaiji-008
		"uXXXX-itaiji-008's abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-008 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-008
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji008-2"))

  (make-charset '=ucs-itaiji-009
		"uXXXX-itaiji-009 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-009"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-009
		"uXXXX-itaiji-009 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-009"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-009
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji009-0"))
  (make-charset '=ucs-sip-itaiji-009
		"uXXXX-itaiji-009 abstract glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-009"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-009
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji009-2"))
  (make-charset '=>ucs-itaiji-009
		"Abstract characters corresponding with uXXXX-itaiji-009 of GlyphWiki"
		'(long-name	"UCS-itaiji-009"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-009
		"uXXXX-itaiji-009's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-009 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-009
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji009-0"))
  (make-charset '=>ucs-sip-itaiji-009
		"uXXXX-itaiji-009 abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-009"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-009
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji009-2"))

  (make-charset '=ucs-itaiji-010
		"uXXXX-itaiji-010 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-010"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-010
		"uXXXX-itaiji-010 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-010"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-010
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji010-0"))
  (make-charset '=ucs-sip-itaiji-010
		"uXXXX-itaiji-010 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-010"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-010
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji010-2"))
  (make-charset '=>ucs-itaiji-010
		"Abstract characters corresponding with uXXXX-itaiji-010 of GlyphWiki"
		'(long-name	"UCS-itaiji-010"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-010
		"uXXXX-itaiji-010's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-010 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-010
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji010-0"))
  (make-charset '=>ucs-sip-itaiji-010
		"uXXXX-itaiji-010 abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-010"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-010
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji010-2"))

  (make-charset '=ucs-itaiji-011
		"uXXXX-itaiji-011 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-011"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-011
		"uXXXX-itaiji-011 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-011"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-011
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji011-0"))
  (make-charset '=ucs-sip-itaiji-011
		"uXXXX-itaiji-011 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-011"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-011
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji011-2"))
  (make-charset '=>ucs-itaiji-011
		"Abstract characters corresponding with uXXXX-itaiji-011 of GlyphWiki"
		'(long-name	"UCS-itaiji-011"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-011
		"uXXXX-itaiji-011's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-011 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-011
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji011-0"))

  (make-charset '=ucs-itaiji-012
		"uXXXX-itaiji-012 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-012"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-012
		"uXXXX-itaiji-012 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-012"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-012
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji012-0"))
  (make-charset '=ucs-sip-itaiji-012
		"uXXXX-itaiji-012 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-012"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-012
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji012-2"))
  (make-charset '=>ucs-itaiji-012
		"Abstract characters corresponding with uXXXX-itaiji-012 of GlyphWiki"
		'(long-name	"UCS-itaiji-012"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-012
		"uXXXX-itaiji-012's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-012 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-012
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji012-0"))1
  (make-charset '=>ucs-sip-itaiji-012
		"uXXXX-itaiji-012's abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-012 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-012
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji012-2"))

  (make-charset '=ucs-itaiji-013
		"uXXXX-itaiji-013 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-013"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-013
		"uXXXX-itaiji-013 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-013"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-013
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji013-0"))
  (make-charset '=ucs-sip-itaiji-013
		"uXXXX-itaiji-013 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-013"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-013
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji013-2"))

  (make-charset '=ucs-itaiji-014
		"uXXXX-itaiji-014 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-014"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-014
		"uXXXX-itaiji-014 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-014"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-014
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji014-0"))
  (make-charset '=ucs-sip-itaiji-014
		"uXXXX-itaiji-014 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-014"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-014
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji014-2"))
  (make-charset '=>ucs-itaiji-014
		"Abstract characters corresponding with uXXXX-itaiji-014 of GlyphWiki"
		'(long-name	"UCS-itaiji-014"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-014
		"uXXXX-itaiji-014's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-014 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-014
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji014-0"))

  (make-charset '=ucs-itaiji-015
		"uXXXX-itaiji-015 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-015"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-sip-itaiji-015
		"uXXXX-itaiji-015 glyphs in SIP"
		'(long-name	"UCS-SIP-itaiji-015"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs-itaiji-015
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji015-2"))
  (make-charset '=>ucs-itaiji-015
		"Abstract characters corresponding with uXXXX-itaiji-015 of GlyphWiki"
		'(long-name	"UCS-itaiji-015"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-sip-itaiji-015
		"uXXXX-itaiji-015's abstract characters in SIP"
		'(long-name	"UCS-SIP-itaiji-015 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>ucs-itaiji-015
		  min-code #x20000 max-code #x2FFFF
		  registry "ucs00\\.itaiji015-2"))

  (make-charset '=ucs-itaiji-016
		"uXXXX-itaiji-016 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-016"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-016
		"uXXXX-itaiji-016 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-016"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-016
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji016-0"))
  (make-charset '=>ucs-itaiji-016
		"Abstract characters corresponding with uXXXX-itaiji-016 of GlyphWiki"
		'(long-name	"UCS-itaiji-016"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs-bmp-itaiji-016
		"uXXXX-itaiji-016's abstract characters in BMP"
		'(long-name	"UCS-BMP-itaiji-016 characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=>ucs-itaiji-016
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji016-0"))

  (make-charset '=ucs-itaiji-017
		"uXXXX-itaiji-017 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-017"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-017
		"uXXXX-itaiji-017 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-017"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-017
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji017-0"))

  (make-charset '=ucs-itaiji-018
		"uXXXX-itaiji-018 glyphs of GlyphWiki"
		'(long-name	"UCS-itaiji-018"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-018
		"uXXXX-itaiji-018 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-018"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-018
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji018-0"))

  (make-charset '=ucs-itaiji-084
		"uXXXX-itaiji-084 glyph-images of GlyphWiki"
		'(long-name	"UCS-itaiji-084"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs))
  (make-charset '=ucs-bmp-itaiji-084
		"uXXXX-itaiji-084 glyph-images in BMP"
		'(long-name	"UCS-BMP-itaiji-084"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
                  ;; =>iso-ir	177
		  mother	=ucs-itaiji-084
		  min-code #x2E00
		  max-code #x9FCC
		  registry "ucs\\.itaiji084-0"))

  (make-charset
   '=ucs-radicals
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zhRadicals-.*-ucs-0"
	       mother ucs-bmp
	       min-code #x2E00 max-code #x2FFB))
  (make-charset
   '=ucs-radicals@unicode
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zhRadicals-.*-ucs-0"
	       mother =ucs@unicode
	       min-code #x2E00 max-code #x2FFB))
  (make-charset
   '==ucs-radicals@unicode
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zhRadicals-.*-ucs-0"
	       mother ==ucs@unicode
	       min-code #x2E00 max-code #x2FFF))
  (make-charset
   '=ucs-hangul
   "Hangul Syllables of UCS"
   '(long-name "UCS-Hangul-Syllables"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-Hangul-.*-ucs-0"
	       mother =ucs
	       min-code #xAC00 max-code #xD7AF))
  (make-charset
   '=ucs-bmp-cjk
   "CJK Characters in BMP of UCS"
   '(long-name "UCS-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ucs-bmp
	       min-code #x2E00
	       max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-bmp-cjk@gb
   "CJK Characters in BMP with GB representative glyph-images."
   '(long-name "CJK in BMP@GB"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =ucs@gb
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '==ucs-bmp-cjk@gb
   "CJK Characters in BMP with GB representative glyph-images."
   '(long-name "CJK in BMP@GB"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ==ucs@gb
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '===ucs-bmp-cjk@gb
   "CJK Characters in BMP with GB representative glyph-images."
   '(long-name "CJK in BMP@GB"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ===ucs@gb
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-bmp-cjk@cns/2008
   "CJK Characters in BMP with CNS representative glyph-images."
   '(long-name "CJK in BMP@CNS"
	       chars 256
	       dimension 2
               columns 2
	       graphic 2
	       direction l2r
	       registry "-zh_TW-.*-ucs-0"
	       mother =ucs@cns/2008
	       min-code #x2E00
	       max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-bmp-cjk@JP
   "CJK Characters in BMP with JIS representative glyphs"
   '(long-name "CJK in BMP@JP"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =ucs@JP
	       min-code #x2E00
               max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-bmp-cjk@JP/hanazono
   "CJK Characters in BMP with Hanazono font"
   '(long-name "CJK in BMP@JP/Hanazono"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =ucs@JP/hanazono
	       min-code #x2E00
               max-code #x9FFC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '==ucs-bmp-cjk@JP/hanazono
   "CJK Characters in BMP with Hanazono font"
   '(long-name "CJK in BMP@JP/Hanazono"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother ==ucs@JP/hanazono
	       min-code #x2E00
               max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=>>ucs-bmp-cjk@unicode
   "Unicode representative detailed-glyphs of CJK Unified Ideographs in BMP"
   '(long-name "Unicode-BMP-CJK detailed-glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =>>ucs@unicode
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=+>ucs-bmp-cjk@unicode
   "Unicode representative characters of CJK Unified Ideographs in BMP"
   '(long-name "Unicode-BMP-CJK unified abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =+>ucs@unicode
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=>ucs-bmp-cjk@unicode
   "Unicode representative characters of CJK Unified Ideographs in BMP"
   '(long-name "Unicode-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =>ucs@unicode
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=>ucs-bmp-cjk@cognate
   "CJK Characters in BMP for abstract characters based on cognate."
   '(long-name "CJK in BMP@cognate"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =>ucs@cognate
	       min-code #x2E00
               max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=>ucs-bmp-cjk@component
   "CJK Characters in BMP for IWDS-1 abstract components."
   '(long-name "CJK in BMP@component"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =>ucs@component
	       min-code #x2E00
               max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=>ucs-bmp-cjk@iwds-1
   "CJK Characters in BMP for IWDS-1 abstract characters."
   '(long-name "CJK in BMP@iwds-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =>ucs@iwds-1
	       min-code #x2E00
               max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=>ucs-bmp-cjk@iwds-1/normalized
   "CJK Characters in BMP for IWDS-1 abstract characters."
   '(long-name "CJK in BMP@iwds-1/normalized"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =>ucs@iwds-1/normalized
	       min-code #x2E00
               max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '==>ucs-bmp-cjk@bucs
   "CJK Characters in BMP of BUCS"
   '(long-name "BUCS-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ==>ucs@bucs
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #x9FCC
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-bmp-cjk-compat
   "CJK Compatibility Ideographs in BMP of UCS"
   '(long-name "CJK Compatibility Ideographs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother ucs-bmp
	       min-code #xF900
	       max-code #xFAFF
	       ))
  (make-charset
   '=ucs-bmp-cjk-compat@unicode
   "CJK Compatibility Ideographs of Unicode representatives"
   '(long-name "CJK Compatibility Ideographs of Unicode"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =ucs@unicode
	       min-code #xF900
	       max-code #xFAFF
	       ))
  (make-charset
   '==ucs-bmp-cjk-compat@gb
   "CJK Compatibility Ideographs of Unicode representatives"
   '(long-name "CJK Compatibility Ideographs of Unicode"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ==ucs@gb
	       min-code #xF900
	       max-code #xFAFF
	       ))
  (make-charset
   '==ucs-bmp-cjk-compat@JP
   "CJK Compatibility Ideographs for common glyph-forms used in Japan."
   '(long-name "CJK Compatibility Ideographs for Japan"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother ==ucs@JP
	       min-code #xF900
	       max-code #xFAFF
	       ))
  (make-charset
   '===ucs-bmp-cjk-compat@unicode
   "CJK Compatibility Ideographs of Unicode representatives"
   '(long-name "CJK Compatibility Ideographs of Unicode"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother ===ucs@unicode
	       min-code #xF900
	       max-code #xFAFF
	       ))
  (make-charset
   '=+>ucs-bmp-cjk-compat@jis
   "CJK Compatibility Ideographs of JIS representatives unified glyphs"
   '(long-name "JIS unified glyphs for CJK Compat chars"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ja-.*-ucs-0"
	       mother =+>ucs@jis
	       min-code #xF900
	       max-code #xFAFF
	       ))
  (make-charset
   '=ucs-sip-ext-b
   "CJK Ideographs Extension B"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs00\\)-2$"
	       mother ucs
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))
  (make-charset
   '=ucs-sip@iso
   "UCS glyphs of UCS SIP"
   '(long-name "UCS SIP"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother =ucs@iso
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=ucs-sip-ext-b@iso
   "CJK Ideographs Extension B (ISO/IEC 10646-2)"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs00\\)-2$"
	       mother =ucs@iso
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))
  (make-charset
   '=ucs-sip@JP/hanazono
   "Hanazono glyphs of UCS SIP"
   '(long-name "Hanazono SIP glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother =ucs@JP/hanazono
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=ucs-sip@gb
   "UCS G-source glyphs of UCS SIP"
   '(long-name "u2XXXX-g glyphs of UCS"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-ucs00\\.g-2$"
	       mother =ucs@gb
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=ucs-tip
   "Tertiary Ideographic Plane of UCS"
   '(long-name "UCS TUP"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs00\\)-3$"
	       mother ucs
	       min-code #x30000 max-code #x323AF
	       code-offset #x30000))
  (make-charset
   '=ucs-tip@JP/hanazono
   "Hanazono glyphs of UCS TIP"
   '(long-name "Hanazono TIP glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-3$"
	       mother =ucs@JP/hanazono
	       min-code #x30000 max-code #x323AF
	       code-offset #x30000))
  (make-charset
   '=>ucs-sip@iwds-1
   "CJK Characters in SIP based on IWDS-1."
   '(long-name "CJK in SIP@IWDS-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother =>ucs@iwds-1
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=>ucs-sip@iwds-1/normalized
   "CJK Characters in SIP based on normalized IWDS-1."
   '(long-name "CJK in SIP@IWDS-1/normalized"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother =>ucs@iwds-1/normalized
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=>ucs-tip@iwds-1
   "CJK Characters in TIP based on IWDS-1."
   '(long-name "CJK in TIP@IWDS-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-3$"
	       mother =>ucs@iwds-1
	       min-code #x30000 max-code #x323AF
	       code-offset #x30000))
  (make-charset
   '=>ucs-sip@cognate
   "CJK Characters in SIP for abstract characters based on cognate."
   '(long-name "CJK in SIP@cognate"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother =>ucs@cognate
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=>ucs-tip@cognate
   "CJK Characters in TIP for abstract characters based on cognate."
   '(long-name "CJK in TIP@cognate"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-3$"
	       mother =>ucs@cognate
	       min-code #x30000 max-code #x3FFFF
	       code-offset #x30000))
  (make-charset
   '=>ucs-sip@component
   "CJK Characters in SIP for IWDS-1 abstract components."
   '(long-name "CJK in SIP@component"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother =>ucs@component
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '=>ucs-tip@component
   "CJK Characters in TIP for IWDS-1 abstract components."
   '(long-name "CJK in TIP@component"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-3$"
	       mother =>ucs@component
	       min-code #x30000 max-code #x323AF
	       code-offset #x30000))
  (make-charset
   '==>ucs-sip@esu
   "UCS glyphs in UCS SIP of ESU"
   '(long-name "ESU SIP"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother ==>ucs@esu
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '==ucs-sip@JP/hanazono
   "Hanazono glyphs-forms of UCS SIP"
   '(long-name "Hanazono SIP glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-2$"
	       mother ==ucs@JP/hanazono
	       min-code #x20000 max-code #x2FFFF
	       code-offset #x20000))
  (make-charset
   '==ucs-sip@iso
   "ISO representative abstract-glyph-images of ISO/IEC 10646 Plane 2"
   '(long-name "SIP abstract glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(ucs00\\)-2$"
	       mother ==ucs@iso
	       code-offset #x20000))
  (make-charset
   '==ucs-sip-ext-b@iso
   "CJK Ideographs Extension B (ISO/IEC 10646-2)"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs00\\)-2$"
	       mother ==ucs@iso
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))
  (make-charset
   '==ucs-tip@JP/hanazono
   "Hanazono glyphs-forms of UCS TIP"
   '(long-name "Hanazono TIP glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "ucs00-3$"
	       mother ==ucs@JP/hanazono
	       min-code #x30000 max-code #x323AF
	       code-offset #x30000))
  (make-charset
   '===ucs-sip@iso
   "ISO representative glyph-images of ISO/IEC 10646 Plane 2"
   '(long-name "SIP rep-glyph-images"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(ucs00\\)-2$"
	       mother ===ucs@iso
	       code-offset #x20000))
  (make-charset
   '===ucs-sip-ext-b@iso
   "CJK Ideographs Extension B (ISO/IEC 10646-2)"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs00\\)-2$"
	       mother ===ucs@iso
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))
  )

;;; mule-conf.el ends here
