;;; mule-conf.el --- configure multilingual environment

;; Copyright (C) 1995,1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997,1999 MORIOKA Tomohiko

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
(make-charset
 'chinese-isoir165
 "ISO-IR-165 (CCITT Extended GB; Chinese simplified)"
 `(registry "isoir165"
   dimension 2
   chars 94
   final ?E
   graphic 0))

;; CNS11643 Plane3 thru Plane7
;; These represent more and more obscure Chinese characters.
;; By the time you get to Plane 7, we're talking about characters
;; that appear once in some ancient manuscript and whose meaning
;; is unknown.

(flet
    ((make-chinese-cns11643-charset
      (name plane final)
      (make-charset
       name (concat "CNS 11643 Plane " plane " (Chinese traditional)")
       `(registry 
	 ,(concat "CNS11643[.-]\\(.*[.-]\\)?" plane "$")
	 dimension 2
	 chars 94
	 final ,final
	 graphic 0))
      ))
  (make-chinese-cns11643-charset 'chinese-cns11643-3 "3" ?I)
  (make-chinese-cns11643-charset 'chinese-cns11643-4 "4" ?J)
  (make-chinese-cns11643-charset 'chinese-cns11643-5 "5" ?K)
  (make-chinese-cns11643-charset 'chinese-cns11643-6 "6" ?L)
  (make-chinese-cns11643-charset 'chinese-cns11643-7 "7" ?M)
  )

;; JIS X 0213:2000
(make-charset
 'japanese-jisx0213-1
 "JIS X 0213:2000 Plain 1"
 '(registry "jisx0213-1"
   dimension 2
   chars 94
   final ?O
   graphic 0))

(make-charset
 'japanese-jisx0213-2
 "JIS X 0213:2000 Plain 2"
 '(registry "jisx0213-2"
   dimension 2
   chars 94
   final ?P
   graphic 0))

;;; mule-conf.el ends here
