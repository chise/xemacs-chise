;;; mule-conf.el --- configure multilingual environment

;; Copyright (C) 1995,1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997,1999,2000,2002,2003,2004 MORIOKA Tomohiko

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
(if (featurep 'utf-2000)
    (progn
      (make-charset
       '=jis-x0213-1-2000
       "JIS X 0213:2000 Plain 1"
       '(iso-ir 228
		registry "jisx0213\\(\\.2000\\)-1"
		dimension 2
		chars 94
		mother =jis-x0208@1990
		final ?O
		graphic 0))
      (make-charset
       '=jis-x0213-2-2000
       "JIS X 0213:2000 Plain 2"
       '(iso-ir 229
		registry "jisx0213\\(\\.2000\\)-2"
		dimension 2
		chars 94
		final ?P
		graphic 0))
      (define-charset-alias 'japanese-jisx0213-1 '=jis-x0213-1-2000)
      (define-charset-alias 'japanese-jisx0213-2 '=jis-x0213-2-2000)
      )
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
  )

(when (featurep 'utf-2000)
  (define-charset-alias 'ucs '=ucs)
  (define-charset-alias '=jis-x0208-1990 '=jis-x0208@1990)
  (define-charset-alias 'japanese-jisx0208-1990 '=jis-x0208@1990)
  (make-charset
   '=jis-x0208@1997
   "JIS X 0208 based on the unification rule of 1997 edition."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =jis-x0208
	      ;; final ?B
	      graphic 0))

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
  (define-charset-alias 'ideograph-gt '=gt)
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

  (make-charset '=daikanwa
		"Daikanwa dictionary (revised version 2)"
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
		`(long-name	"Daikanwa Rev."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-2"
		  mother	=daikanwa
                  ))
  (define-charset-alias 'ideograph-daikanwa-2 '=daikanwa@rev1)
  (define-charset-alias '=daikanwa-rev1 '=daikanwa@rev1)

  (make-charset '=daikanwa@rev2
		"Daikanwa dictionary (revised version 2)"
		`(long-name	"Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=daikanwa
		  min-code	1
                  max-code	49964
                  ;; min-code	#xE00000
                  ;; max-code	,(+ #xE00000 50100)
                  ;; code-offset	#xE00000
		  ))
  (define-charset-alias '=daikanwa-rev2 '=daikanwa@rev2)

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

  (make-charset '=ucs@iso
		"ISO/IEC 10646 for its representative glyphs"
		'(long-name	"UCS for ISO"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs))
  (make-charset '=ucs@unicode
		"Unicode for its representative glyphs"
		'(long-name	"UCS for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@iso))
  (make-charset '=ucs@gb
		"ISO/IEC 10646 for GB"
		'(long-name	"UCS for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-gb '=ucs@gb)
  (make-charset '=ucs@cns
		"ISO/IEC 10646 for CNS 11643"
		'(long-name	"UCS for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-cns '=ucs@cns)
  (make-charset '=ucs@jis
		"ISO/IEC 10646 for JIS X0208/0212/0213"
		'(long-name	"UCS for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
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
		  mother	=ucs@jis))
  (make-charset '=ucs@jis/1990
		"ISO/IEC 10646 for JIS X 0208/0212:1990"
		'(long-name	"UCS for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	ucs-jis))
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
		  mother	ucs-jis))
  (define-charset-alias '=ucs@jis-2000 '=ucs@jis/2000)
  (define-charset-alias '=ucs-jis-2000 '=ucs@jis/2000)
  (make-charset '=ucs@JP
		"UCS for common glyphs used in Japan"
		'(long-name	"UCS for Japan"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@jis/2000))
  (define-charset-alias '=ucs@jp '=ucs@JP)
  (make-charset '=ucs@ks
		"ISO/IEC 10646 for Korean Standards"
		'(long-name	"UCS for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-ks '=ucs@ks)
  (make-charset '=ucs@big5
		"ISO/IEC 10646 for Big5"
		'(long-name	"UCS for Big5"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-big5 '=ucs@big5)
  (make-charset '=ucs@big5/cns11643
		"ISO/IEC 10646 for Big5 based on www.cns11643.gov.tw"
		'(long-name	"UCS for Big5@CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@big5))
  (make-charset '=ucs@cns11643
		"ISO/IEC 10646 for CNS based on www.cns11643.gov.tw"
		'(long-name	"UCS for CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@cns))
  
  (make-charset
   '=ucs-radicals
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ucs-bmp
	       min-code #x2E00 max-code #x2FFF))
  (make-charset
   '=ucs-radicals@unicode
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =ucs@unicode
	       min-code #x2E00 max-code #x2FFF))
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
	       min-code #x2E00 max-code #xA4CF))
  (make-charset
   '=ucs-bmp-cjk@unicode
   "CJK Characters in BMP of Unicode"
   '(long-name "Unicode-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =ucs@unicode
	       min-code #x2E00 max-code #xA4CF))
  (make-charset
   '=ucs-sip-ext-b
   "CJK Ideographs Extension B"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs02\\)-2$"
	       mother ucs
	       min-code #x20000 max-code #x2A6D6
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
	       registry "\\(iso10646\\|ucs02\\)-2$"
	       mother =ucs@iso
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))
  )

;;; mule-conf.el ends here
