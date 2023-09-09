;;; mule-coding.el --- Coding-system functions for Mule.

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1995 Amdahl Corporation.
;; Copyright (C) 1995 Sun Microsystems.
;; Copyright (C) 1997, 1999, 2002, 2003, 2004, 2005, 2006, 2008, 2009,
;;   2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020,
;;   2021, 2022, 2023 MORIOKA Tomohiko

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
 (let ((conf
	'(charset-g0 ascii
          charset-g2 t ;; unspecified but can be used later.
	  seven t
	  short t
	  mnemonic "ISO7/SS"
	  eol-type nil)))
   (if (featurep 'utf-2000)
       (list* 'ccs-priority-list
	      '(ascii
		=jis-x0208@1983 =jis-x0208@1978
		latin-jisx0201)
	      conf)
     conf)))

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
  (setq decomposition-feature-list
	'(=decomposition
	  =decomposition@cid
	  =decomposition@hanyo-denshi))

  (setq coded-charset-entity-reference-alist
	'(((=mj			. isolated)	 "I-MJ" 6 d)
	  ((=adobe-japan1-6	. isolated)    "I-AJ1-" 5 d)
	  ( =mj					   "MJ" 6 d)
	  ( =adobe-japan1-6			 "AJ1-" 5 d)
	  (==mj					"g2-MJ" 6 d)
	  (===mj				 "R-MJ" 6 d)
	  (==adobe-japan1-6		      "g2-AJ1-" 5 d)
	  (===adobe-japan1-6		       "R-AJ1-" 5 d)
	  ((=adobe-japan1-base	. isolated)    "I-AJ1-" 5 d)
	  ( =adobe-japan1-base		       "I-AJ1-" 5 d)
	  ((=hanyo-denshi/ja	. isolated)  "I-HD-JA-" 4 X)
	  ((=hanyo-denshi/jb	. isolated)  "I-HD-JB-" 4 X)
	  ((=hanyo-denshi/jc	. isolated)  "I-HD-JC-" 4 X)
	  ((=hanyo-denshi/jd	. isolated)  "I-HD-JD-" 4 X)
	  ((=hanyo-denshi/ft	. isolated)  "I-HD-FT-" 4 X)
	  ((=hanyo-denshi/ia	. isolated)  "I-HD-IA-" 4 X)
	  ((=hanyo-denshi/ib	. isolated)  "I-HD-IB-" 4 X)
	  ((=hanyo-denshi/hg	. isolated)  "I-HD-HG-" 4 X)
	  ((=hanyo-denshi/ip	. isolated)  "I-HD-IP-" 4 X)
	  ((=hanyo-denshi/jt	. isolated)  "I-HD-JT-" 4 X)
	  ((=hanyo-denshi/ks	. isolated)  "I-HD-KS-" 6 d)
	  ((=hanyo-denshi/ks/mf	. isolated)   "I-KSMF-" 5 d)
	  ((=gt			. isolated)	"I-GT-" 5 d)
	  ((=jis-x0208@1990	. isolated)    "I-J90-" 4 X)
	  ((=jis-x0208@1983	. isolated)    "I-J83-" 4 X)
	  ((=jis-x0213-1@2000	. isolated)    "I-JX1-" 4 X)
	  ((=jis-x0213-2	. isolated)    "I-JX2-" 4 X)
	  ((=jis-x0213-1@2004	. isolated)    "I-JX3-" 4 X)
	  ((=jis-x0212		. isolated)    "I-JSP-" 4 X)
	  ((=jis-x0208@1978/1pr	. isolated)    "I-J78-" 4 X)
	  ((=jis-x0208		. isolated)    "I-J90-" 4 X)
	  ((chinese-cns11643-1	. isolated)	"I-C1-" 4 X)
	  ((chinese-cns11643-2	. isolated)	"I-C2-" 4 X)
	  ((chinese-cns11643-3	. isolated)	"I-C3-" 4 X)
	  ((chinese-cns11643-4	. isolated)	"I-C4-" 4 X)
	  ((chinese-cns11643-5	. isolated)	"I-C5-" 4 X)
	  ((chinese-cns11643-6	. isolated)	"I-C6-" 4 X)
	  ((chinese-cns11643-7	. isolated)	"I-C7-" 4 X)
	  ((chinese-gb2312	. isolated)	"I-G0-" 4 X)
	  ((=iso-ir165		. isolated)    "I-EGB-" 4 X)
	  ((korean-ksc5601	. isolated)	"I-K0-" 4 X)
	  ((=ruimoku-v6		. isolated)   "I-RUI6-" 4 X)
	  ( =ruimoku-v6				"RUI6-" 4 X)
	  ((=daikanwa@rev2	. isolated)	"I-M-"	5 d)
	  ((=gt-k		. isolated)    "I-GT-K" 5 d)
	  ((=daijiten		. isolated)   "I-DJT-"	5 d)
	  ((=cbeta		. isolated)	 "I-CB" 5 d)
	  ((=big5-cdp		. isolated)    "I-CDP-" 4 X)
	  ((=hanziku-1		. isolated)  "I-HZK01-" 4 X)
	  ((=hanziku-2		. isolated)  "I-HZK02-" 4 X)
	  ((=hanziku-3		. isolated)  "I-HZK03-" 4 X)
	  ((=hanziku-4		. isolated)  "I-HZK04-" 4 X)
	  ((=hanziku-5		. isolated)  "I-HZK05-" 4 X)
	  ((=hanziku-6		. isolated)  "I-HZK06-" 4 X)
	  ((=hanziku-7		. isolated)  "I-HZK07-" 4 X)
	  ((=hanziku-8		. isolated)  "I-HZK08-" 4 X)
	  ((=hanziku-9		. isolated)  "I-HZK09-" 4 X)
	  ((=hanziku-10		. isolated)  "I-HZK10-" 4 X)
	  ((=hanziku-11		. isolated)  "I-HZK11-" 4 X)
	  ((=hanziku-12		. isolated)  "I-HZK12-" 4 X)
	  ((latin-iso8859-1	. isolated) "I-LATIN1-" 2 X)
	  ((latin-iso8859-2	. isolated) "I-LATIN2-" 2 X)
	  ((latin-iso8859-3	. isolated) "I-LATIN3-" 2 X)
	  ((latin-iso8859-4	. isolated) "I-LATIN4-" 2 X)
	  ((cyrillic-iso8859-5	. isolated) "I-CYRILLIC-" 2 X)
	  ((greek-iso8859-7	. isolated)  "I-GREEK-" 2 X)
	  ((hebrew-iso8859-8	. isolated) "I-HEBREW-" 2 X)
	  ((latin-iso8859-9	. isolated) "I-LATIN5-" 2 X)
	  ((latin-jisx0201	. isolated) "I-LATINJ-" 2 X)
	  ((katakana-jisx0201	. isolated) "I-KATAKANA-" 2 X)
	  ((latin-tcvn5712	. isolated) "I-VSCII2-" 2 X)
	  ;; ((latin-viscii	. isolated) "I-VISCII-" 2 X)
	  ((latin-viscii-upper	. isolated) "I-MULE-VIET-U-" 2 X)
	  ((latin-viscii-lower	. isolated) "I-MULE-VIET-L-" 2 X)
	  ((thai-tis620		. isolated)   "I-THAI-" 2 X)
	  ((lao			. isolated) "I-MULE-LAO-" 2 X)
	  ((arabic-1-column	. isolated) "I-MULE-ARB1-" 2 X)
	  ((arabic-2-column	. isolated) "I-MULE-ARB2-" 2 X)
	  ((arabic-digit	. isolated) "I-MULE-ARBD-" 2 X)
	  ((ipa			. isolated) "I-MULE-IPA-" 2 X)
	  ((china3-jef		. isolated)    "I-JC3-" 4 X)
	  ( =hanyo-denshi/ja		       "HD-JA-" 4 X)
	  ( =hanyo-denshi/jb		       "HD-JB-" 4 X)
	  ( =hanyo-denshi/jc		       "HD-JC-" 4 X)
	  ( =hanyo-denshi/jd		       "HD-JD-" 4 X)
	  ( =hanyo-denshi/ft		       "HD-FT-" 4 X)
	  ( =hanyo-denshi/ia		       "HD-IA-" 4 X)
	  ( =hanyo-denshi/ib		       "HD-IB-" 4 X)
	  ( =hanyo-denshi/hg		       "HD-HG-" 4 X)
	  ( =hanyo-denshi/ip		       "HD-IP-" 4 X)
	  ( =hanyo-denshi/jt		       "HD-JT-" 4 X)
	  ( =hanyo-denshi/ks		       "HD-KS-" 6 d)
	  ( =hanyo-denshi/tk		       "HD-TK-" 8 d)
	  (=>hanyo-denshi/tk		     "A-HD-TK-" 8 d)
	  (==hanyo-denshi/ja		    "g2-HD-JA-" 4 X)
	  (==hanyo-denshi/jb		    "g2-HD-JB-" 4 X)
	  (==hanyo-denshi/jc		    "g2-HD-JC-" 4 X)
	  (==hanyo-denshi/jd		    "g2-HD-JD-" 4 X)
	  (==hanyo-denshi/ft		    "g2-HD-FT-" 4 X)
	  (==hanyo-denshi/ia		    "g2-HD-IA-" 4 X)
	  (==hanyo-denshi/ib		    "g2-HD-IB-" 4 X)
	  (==hanyo-denshi/hg		    "g2-HD-HG-" 4 X)
	  (==hanyo-denshi/ip		    "g2-HD-IP-" 4 X)
	  (==hanyo-denshi/jt		    "g2-HD-JT-" 4 X)
	  (==hanyo-denshi/ks		    "g2-HD-KS-" 6 d)
	  (==hanyo-denshi/tk		    "g2-HD-TK-" 8 d)
	  (===hanyo-denshi/jb		     "R-HD-JB-" 4 X)
	  (===hanyo-denshi/ft		     "R-HD-FT-" 4 X)
	  (===hanyo-denshi/ia		     "R-HD-IA-" 4 X)
	  (===hanyo-denshi/ib		     "R-HD-IB-" 4 X)
	  (===hanyo-denshi/hg		     "R-HD-HG-" 4 X)
	  (===hanyo-denshi/ip		     "R-HD-IP-" 4 X)
	  (===hanyo-denshi/jt		     "R-HD-JT-" 4 X)
	  (===hanyo-denshi/ks		     "R-HD-KS-" 6 d)
	  ( =gt					  "GT-" 5 d)
	  (==gt				       "g2-GT-" 5 d)
	  (===gt				"R-GT-" 5 d)
	  ( =jis-x0208@1990			 "J90-" 4 X)
	  ( =jis-x0213-1@2000			 "JX1-" 4 X)
	  ( =jis-x0213-2			 "JX2-" 4 X)
	  ( =jis-x0213-1@2004			 "JX3-" 4 X)
	  ( =jis-x0212				 "JSP-" 4 X)
	  (==jis-x0208@1990		      "g2-J90-" 4 X)
	  (===jis-x0208@1990		       "R-J90-" 4 X)
	  (===jis-x0208			        "R-J0-" 4 X)
	  (==jis-x0212			      "g2-JSP-" 4 X)
	  (==jis-x0213-1@2000		      "g2-JX1-" 4 X)
	  (==jis-x0213-2		      "g2-JX2-" 4 X)
	  (==jis-x0213-1@2004		      "g2-JX3-" 4 X)
	  (===jis-x0213-1		       "R-JX1-" 4 X)
	  (===jis-x0213-2		       "R-JX2-" 4 X)
	  (===jis-x0213-1@2004		       "R-JX3-" 4 X)
	  (===jis-x0212			       "R-JSP-" 4 X)
	  (===jis-x0213-1@2000		     "R-J00X1-" 4 X)
	  ( =cns11643-1				  "C1-" 4 X)
	  ( chinese-cns11643-2			  "C2-" 4 X)
	  ( chinese-cns11643-3			  "C3-" 4 X)
	  ( chinese-cns11643-4			  "C4-" 4 X)
	  ( chinese-cns11643-5			  "C5-" 4 X)
	  ( chinese-cns11643-6			  "C6-" 4 X)
	  ( chinese-cns11643-7			  "C7-" 4 X)
	  ( =gb2312				  "G0-" 4 X)
          ;; (==gb2312                         "g2-G0-" 4 X)
	  ( =big5-cdp				 "CDP-" 4 X)
	  (==big5-cdp			      "g2-CDP-" 4 X)
	  (===big5-cdp			       "R-CDP-" 4 X)
	  ((=big5-eten		. isolated)	 "I-B-" 4 X)
	  ( =zinbun-oracle			 "ZOB-" 4 d)
	  ( =daikanwa/ho			  "M-H" 4 d)
	  ( =daikanwa/+p			  "M-p" 5 d)
	  ( =daikanwa/+2p			 "M-2p" 5 d)
	  ( =daikanwa				  "M-"	5 d)
	  ( =daikanwa@rev2			"r2M-"	5 d)
	  ( =daikanwa@rev1			"r1M-"	5 d)
	  ( =daijiten				"DJT-"	5 d)
	  (==daikanwa/ho		      "g2-M-H"  4 d)
	  (==daikanwa/+p		      "g2-M-p"  5 d)
	  (==daikanwa/+2p		      "g2-M-2p" 5 d)
	  (==daikanwa			      "g2-M-"	5 d)
	  (==daijiten			      "g2-DJT-"	5 d)
	  (===daikanwa/ho			"R-M-H" 4 d)
	  (===daikanwa/+p			"R-M-p" 5 d)
	  (===daikanwa				"R-M-"	5 d)
	  (===daijiten			      "R-DJT-"	5 d)
	  ( =ks-x1001				  "K0-" 4 X)
	  (==ks-x1001			       "g2-K0-" 4 X)
	  (===ks-x1001				"R-K0-" 4 X)
	  ( =iso-ir165				 "EGB-" 4 X)
	  ( =jis-x0208@1983			 "J83-" 4 X)
	  ( =koseki			      "KOSEKI-" 6 d)
	  ( =gt-k				 "GT-K" 5 d)
	  ( =ucs-var-001		      "U-v001+" 4 X)
	  ( =ucs-var-002		      "U-v002+" 4 X)
	  ( =ucs-var-003		      "U-v003+" 4 X)
	  ( =ucs-var-004		      "U-v004+" 4 X)
	  ( =ucs-var-005		      "U-v005+" 4 X)
	  ( =ucs-var-006		      "U-v006+" 4 X)
	  ( =ucs-var-007		      "U-v007+" 4 X)
	  ( =ucs-var-008		      "U-v008+" 4 X)
	  ( =ucs-var-010		      "U-v010+" 4 X)
	  ( =ucs-itaiji-001		      "U-i001+" 4 X)
	  ( =ucs-itaiji-002		      "U-i002+" 4 X)
	  ( =ucs-itaiji-003		      "U-i003+" 4 X)
	  ( =ucs-itaiji-004		      "U-i004+" 4 X)
	  ( =ucs-itaiji-005		      "U-i005+" 4 X)
	  ( =ucs-itaiji-006		      "U-i006+" 4 X)
	  ( =ucs-itaiji-007		      "U-i007+" 4 X)
	  ( =ucs-itaiji-008		      "U-i008+" 4 X)
	  ( =ucs-itaiji-009		      "U-i009+" 4 X)
	  ( =ucs-itaiji-010		      "U-i010+" 4 X)
	  ( =ucs-itaiji-011		      "U-i011+" 4 X)
	  ( =ucs-itaiji-012		      "U-i012+" 4 X)
	  ( =ucs-itaiji-014		      "U-i014+" 4 X)
	  ( =ucs-itaiji-016		      "U-i016+" 4 X)
	  ( =ucs-itaiji-018		      "U-i018+" 4 X)
	  ( =ucs-itaiji-084		      "U-i084+" 4 X)
	  ( =big5-cdp-var-001		    "CDP-v001-" 4 X)
	  ( =big5-cdp-var-002		    "CDP-v002-" 4 X)
	  ( =big5-cdp-var-003		    "CDP-v003-" 4 X)
	  ( =big5-cdp-var-004		    "CDP-v004-" 4 X)
	  ( =big5-cdp-var-005		    "CDP-v005-" 4 X)
	  ( =big5-cdp-var-007		    "CDP-v007-" 4 X)
	  ( =big5-cdp-var-008		    "CDP-v008-" 4 X)
	  ( =big5-cdp-var-010		    "CDP-v010-" 4 X)
	  ( =big5-cdp-itaiji-001	    "CDP-i001-" 4 X)
	  ( =big5-cdp-itaiji-002	    "CDP-i002-" 4 X)
	  ( =big5-cdp-itaiji-003	    "CDP-i003-" 4 X)
	  ( =big5-cdp-itaiji-004	    "CDP-i004-" 4 X)
	  ( =big5-cdp-itaiji-005	    "CDP-i005-" 4 X)
	  ( =jis-x0208@1978/1pr			 "J78-" 4 X)
	  (==jis-x0208@1983		      "g2-J83-" 4 X)
	  (==koseki			   "g2-KOSEKI-" 6 d)
	  (==ucs-var-001		   "g2-U-v001+" 4 X)
	  (==ucs-var-002		   "g2-U-v002+" 4 X)
	  (==ucs-var-003		   "g2-U-v003+" 4 X)
	  (==ucs-itaiji-001		   "g2-U-i001+" 4 X)
	  (==ucs-itaiji-002		   "g2-U-i002+" 4 X)
	  (==ucs-itaiji-003		   "g2-U-i003+" 4 X)
	  (==ucs-itaiji-004		   "g2-U-i004+" 4 X)
	  (==ucs-itaiji-005		   "g2-U-i005+" 4 X)
	  (==ucs-itaiji-006		   "g2-U-i006+" 4 X)
	  (==big5-cdp-itaiji-001	 "g2-CDP-i001-" 4 X)
	  (==jis-x0208@1978/1pr		      "g2-J78-" 4 X)
	  (==gt-k			      "g2-GT-K" 5 d)
	  (===gt-k			       "R-GT-K" 5 d)
	  (===jis-x0208@1983		       "R-J83-" 4 X)
	  (===jis-x0208@1978		       "R-J78-" 4 X)
	  ( =cbeta				   "CB" 5 d)
	  (=>cbeta				 "A-CB" 5 d)
	  (==cbeta				"g2-CB" 5 d)
	  (===cbeta				 "R-CB" 5 d)
	  (===chise-hdic-tsj	     "R-CHISE-HDIC-TSJ" 4 X)
	  (  =chise-hdic-tsj	       "CHISE-HDIC-TSJ" 4 X)
	  (===chise-hdic-syp	     "R-CHISE-HDIC-SYP" 4 X)
	  (  =chise-hdic-syp	       "CHISE-HDIC-SYP" 4 X)
	  (===chise-hdic-ktb	     "R-CHISE-HDIC-KTB" 4 X)
	  (  =chise-hdic-ktb	       "CHISE-HDIC-KTB" 4 X)
	  (===chise-hdic-ktb-seal   "R-CHISE-HDIC-KTBS" 4 X)
	  (===hng-jou			      "HNG001-" 5 d)
	  (===hng-keg			      "HNG002-" 5 d)
	  (===hng-dng			      "HNG003-" 5 d)
	  (===hng-mam			      "HNG005-" 5 d)
	  (===hng-drt			      "HNG006-" 5 d)
	  (===hng-kgk			      "HNG007-" 5 d)
	  (===hng-myz			      "HNG008-" 5 d)
	  (===hng-kda			      "HNG009-" 5 d)
	  (===hng-khi			      "HNG010-" 5 d)
	  (===hng-khm			      "HNG011-" 5 d)
	  (===hng-fhs			      "HNG012-" 5 d)
	  (===hng-hok			      "HNG013-" 5 d)
	  (===hng-kyd			      "HNG014-" 5 d)
	  (===hng-sok			      "HNG015-" 5 d)
	  (===hng-yhk			      "HNG016-" 5 d)
	  (===hng-kak			      "HNG017-" 5 d)
	  (===hng-kar			      "HNG018-" 5 d)
	  (===hng-kae			      "HNG019-" 5 d)
	  (===hng-sys			      "HNG022-" 5 d)
	  (===hng-tsu			      "HNG024-" 5 d)
	  (===hng-tzj			      "HNG025-" 5 d)
	  (===hng-hos			      "HNG026-" 5 d)
	  (===hng-kkh			      "HNG027-" 5 d)
	  (===hng-nak			      "HNG028-" 5 d)
	  (===hng-jhk			      "HNG029-" 5 d)
	  (===hng-hod			      "HNG030-" 5 d)
	  (===hng-gok			      "HNG031-" 5 d)
	  (===hng-ink			      "HNG033-" 5 d)
	  (===hng-nto			      "HNG034-" 5 d)
	  (===hng-nkm			      "HNG036-" 5 d)
	  (===hng-k24			      "HNG037-" 5 d)
	  (===hng-ini			      "HNG038-" 5 d)
	  (===hng-nkk			      "HNG039-" 5 d)
	  (===hng-kcc			      "HNG041-" 5 d)
	  (===hng-kcj			      "HNG042-" 5 d)
	  (===hng-kbk			      "HNG043-" 5 d)
	  (===hng-sik			      "HNG044-" 5 d)
	  (===hng-skk			      "HNG046-" 5 d)
	  (===hng-kyu			      "HNG047-" 5 d)
	  (===hng-ksk			      "HNG048-" 5 d)
	  (===hng-wan			      "HNG049-" 5 d)
	  (===hng-okd			      "HNG050-" 5 d)
	  (===hng-wad			      "HNG054-" 5 d)
	  (===hng-kmi			      "HNG055-" 5 d)
	  (===hng-zkd			      "HNG056-" 5 d)
	  (===hng-doh			      "HNG057-" 5 d)
	  (===hng-jyu			      "HNG058-" 5 d)
	  (===hng-tzs			      "HNG060-" 5 d)
	  (===hng-sai			      "HNG061-" 5 d)
	  (===hng-kad			      "HNG062-" 5 d)
	  (===hng-kss			      "HNG064-" 5 d)
	  (===hng-kyo			      "HNG066-" 5 d)
	  (===hng-ykk			      "HNG068-" 5 d)
	  (===hng-saa			      "HNG070-" 5 d)
	  (===hng-sab			      "HNG071-" 5 d)
	  (===hng-wks			      "HNG072-" 5 d)
	  (===hng-wke			      "HNG073-" 5 d)
	  (===hng-smk			      "HNG074-" 5 d)
	  (===hng-sgs			      "HNG077-" 5 d)
	  (===hng-sts			      "HNG078-" 5 d)
	  (===hng-kkd			      "HNG079-" 5 d)
	  (=shuowen-jiguge		   "SW-JIGUGE-" 5 d)
	  (=>shuowen-jiguge		 "A-SW-JIGUGE-" 5 d)
	  (===shuowen-jiguge4		  "SW-JIGUGE4-" 5 d)
	  (===shuowen-jiguge5		  "SW-JIGUGE5-" 5 d)
	  (===shuowen-jiguge-A30	 "SW-JIGUGE30-" 5 d)
	  ( =hanziku-1			       "HZK01-" 4 X)
	  ( =hanziku-2			       "HZK02-" 4 X)
	  ( =hanziku-3			       "HZK03-" 4 X)
	  ( =hanziku-4			       "HZK04-" 4 X)
	  ( =hanziku-5			       "HZK05-" 4 X)
	  ( =hanziku-6			       "HZK06-" 4 X)
	  ( =hanziku-7			       "HZK07-" 4 X)
	  ( =hanziku-8			       "HZK08-" 4 X)
	  ( =hanziku-9			       "HZK09-" 4 X)
	  ( =hanziku-10			       "HZK10-" 4 X)
	  ( =hanziku-11			       "HZK11-" 4 X)
	  ( =hanziku-12			       "HZK12-" 4 X)
	  ((=hanziku-1		. isolated)   "I-HZK1-" 4 X)
	  ( =hanziku-1				"HZK1-" 4 X)
	  ((=hanziku-2		. isolated)   "I-HZK2-" 4 X)
	  ( =hanziku-2				"HZK2-" 4 X)
	  ( =hanyo-denshi/ks/mf			"KSMF-" 5 d)
	  ( =big5-cdp-var-3		    "CDP-var3-" 4 X)
	  ( =big5-cdp-var-5		    "CDP-var5-" 4 X)
	  ( latin-iso8859-1		      "LATIN1-" 2 X)
	  ( latin-iso8859-2		      "LATIN2-" 2 X)
	  ( latin-iso8859-3		      "LATIN3-" 2 X)
	  ( latin-iso8859-4		      "LATIN4-" 2 X)
	  ( cyrillic-iso8859-5		    "CYRILLIC-" 2 X)
	  ( greek-iso8859-7		       "GREEK-" 2 X)
	  ( hebrew-iso8859-8		      "HEBREW-" 2 X)
	  ( latin-iso8859-9		      "LATIN5-" 2 X)
	  ( latin-jisx0201		      "LATINJ-" 2 X)
	  ( katakana-jisx0201		    "KATAKANA-" 2 X)
	  ( latin-tcvn5712		      "VSCII2-" 2 X)
	  ( latin-viscii		      "VISCII-" 2 X)
	  ( latin-viscii-upper		 "MULE-VIET-U-" 2 X)
	  ( latin-viscii-lower		 "MULE-VIET-L-" 2 X)
	  ( thai-tis620				"THAI-" 2 X)
	  ( lao				    "MULE-LAO-" 2 X)
	  ( ethiopic			  "MULE-ETHIO-" 4 X)
	  ( arabic-1-column		   "MULE-ARB1-" 2 X)
	  ( arabic-2-column		   "MULE-ARB2-" 2 X)
	  ( arabic-digit		   "MULE-ARBD-" 2 X)
	  ( ipa				    "MULE-IPA-" 2 X)
          ;; (=>>>jis-x0208                    "g2-J0-" 4 X)
          ;; (=>>>jis-x0208                    "GI-J0-" 4 X)
          ;; (=>>>jis-x0213-1                 "g2-JX1-" 4 X)
          ;; (=>>>jis-x0213-1                 "GI-JX1-" 4 X)
          ;; (=>>>jis-x0213-1@2004            "GI-JX3-" 4 X)
	  (=>>mj				 "G-MJ" 6 d)
	  (=>>adobe-japan1		       "G-AJ1-" 5 d)
	  (=>>jis-x0208			        "G-J0-" 4 X)
	  (=>>jis-x0213-1@2000		       "G-JX1-" 4 X)
	  (=>>jis-x0213-2		       "G-JX2-" 4 X)
	  (=>>jis-x0213-1@2004		       "G-JX3-" 4 X)
	  (=>>hanyo-denshi/ft		     "G-HD-FT-" 4 X)
	  (=>>hanyo-denshi/ia		     "G-HD-IA-" 4 X)
	  (=>>hanyo-denshi/ib		     "G-HD-IB-" 4 X)
	  (=>>hanyo-denshi/jt		     "G-HD-JT-" 4 X)
	  (=>>hanyo-denshi/ks		     "G-HD-KS-" 4 X)
	  (=>>gt			        "G-GT-" 5 d)
	  (=>>jis-x0208@1978		       "G-J78-" 4 X)
	  (=>>cns11643-4		        "G-C4-" 4 X)
	  (=>>big5-cdp			       "G-CDP-" 4 X)
	  (=>>gt-k			       "G-GT-K" 5 d)
	  (=>>cbeta				 "G-CB" 5 d)
	  (=>>ruimoku-v6		      "G-RUI6-" 4 X)
	  (=+>jis-x0208				"o-J0-" 4 X)
	  (=+>jis-x0213-1		       "o-JX1-" 4 X)
	  (=+>jis-x0213-2		       "o-JX2-" 4 X)
	  (=+>jis-x0208@1978		       "o-J78-" 4 X)
	  (=+>adobe-japan1		       "o-AJ1-" 5 d)
	  (=+>gt				"o-GT-" 5 d)
	  (=+>big5-cdp			       "o-CDP-" 4 X)
	  (=+>hanyo-denshi/ft		     "o-HD-FT-" 4 X)
	  (=+>hanyo-denshi/jt		     "o-HD-JT-" 4 X)
	  ( =>jis-x0208@1997			 "J97-" 4 X)
	  ( =>jis-x0208@1997			"A-J0-" 4 X)
	  ( =>jis-x0213-1@2000		       "A-JX1-" 4 X)
	  ( =>jis-x0213-2		       "A-JX2-" 4 X)
	  ( =>jis-x0213-1@2004		       "A-JX3-" 4 X)
	  ( =>gt				"A-GT-" 5 d)
	  ( =>gt-k			       "A-GT-K" 5 d)
	  ( =>zinbun-oracle		       "A-ZOB-" 4 d)
	  (==>ucs@bucs				"BUCS+" 4 X)
	  (==>ucs@esu			      "A2-ESU+" 4 X)
	  (==>daijiten			      "A2-DJT-"	5 d)
	  ( =>ucs@iwds-1		     "A-IWDSU+" 4 X)
	  ( =>ucs@iwds-1/normalized	    "A-NIWDSU+" 4 X)
	  ( =>ucs@cognate		      "A-cgnU+" 4 X)
	  ( =>ucs@component		     "A-compU+" 4 X)
	  ( =>iwds-1			       "IWDS1-" 3 d)
	  ( =>mj				 "A-MJ" 6 d)
	  ( =>ucs@hanyo-denshi		       "A-HDU+" 4 X)
	  ( =>ucs@hanyo-denshi		    "A-HD-UCS+" 4 X)
	  ( =>ucs@iso				"A-IU+" 4 X)
	  ( =>ucs@unicode			"A-UU+" 4 X)
	  ( =>ucs@jis				"A-JU+" 4 X)
	  ( =>ucs@cns				"A-CU+" 4 X)
	  ( =>ucs@ks				"A-KU+" 4 X)
	  ( =>ucs@jis/2004		      "A-J04U+" 4 X)
	  ( =>ruimoku-v6		      "A-RUI6-" 4 X)
	  (=+>ucs@iso				"o-IU+" 4 X)
	  (=+>ucs@unicode			"o-UU+" 4 X)
	  (=+>ucs@jis				"o-JU+" 4 X)
	  (=+>ucs@jis/1990		      "o-J90U+" 4 X)
	  (=+>ucs@cns				"o-CU+" 4 X)
	  (=+>ucs@ks				"o-KU+" 4 X)
	  ( =ucs@iso				   "U-" 8 X)
	  ( =ucs@unicode			  "UU+" 4 X)
	  ( =ucs@unicode			  "UU-" 8 X)
	  ( =ucs@iso				   "U+" 4 X)
	  ( =ucs@gb				  "GU+" 4 X)
	  ( =ucs@gb				  "GU-" 8 X)
	  ( =ucs@jis				  "JU+" 4 X)
	  ( =ucs@jis				  "JU-" 8 X)
	  ( =ucs@cns				  "CU+" 4 X)
	  ( =ucs@cns				  "CU-" 8 X)
	  ( =ucs@ks				  "KU+" 4 X)
	  ( =ucs@ks				  "KU-" 8 X)
	  ( =ucs@JP				 "dJU+" 4 X)
	  ( =ucs@JP/hanazono		      "hanaJU+" 4 X)
	  (=>>ucs@iso			        "G-IU+" 4 X)
	  (=>>ucs@unicode		        "G-UU+" 4 X)
	  (=>>ucs@jis			        "G-JU+" 4 X)
	  (=>>ucs@ks			        "G-KU+" 4 X)
	  (=>>ucs@cns			        "G-CU+" 4 X)
	  (=>>ucs@jis/2004		      "G-J04U+" 4 X)
	  (=>>ucs@jis/2000		      "G-J00U+" 4 X)
	  (=>>ucs@jis/1990		      "G-J90U+" 4 X)
	  (=>>ucs@JP			       "G-dJU+" 4 X)
	  (==ucs@iso			       "g2-IU-" 8 X)
	  (==ucs@unicode		       "g2-UU+" 4 X)
	  (==ucs@gb			       "g2-GU+" 4 X)
	  (==ucs@cns			       "g2-CU+" 4 X)
	  (==ucs@ks			       "g2-KU+" 4 X)
	  (===ucs@iso				 "R-U-" 8 X)
	  (===ucs@unicode			"R-UU+" 4 X)
	  (===ucs@gb				"R-GU+" 4 X)
	  (===ucs@ks				"R-KU+" 4 X)
	  (==cns11643-1			       "g2-C1-" 4 X)
	  (==cns11643-2			       "g2-C2-" 4 X)
	  (==cns11643-3			       "g2-C3-" 4 X)
	  (==cns11643-4			       "g2-C4-" 4 X)
	  (==cns11643-5			       "g2-C5-" 4 X)
	  (==cns11643-6			       "g2-C6-" 4 X)
	  (==cns11643-7			       "g2-C7-" 4 X)
	  (===cns11643-1			"R-C1-" 4 X)
	  (===cns11643-2			"R-C2-" 4 X)
	  (===cns11643-3			"R-C3-" 4 X)
	  (===cns11643-4			"R-C4-" 4 X)
	  (===cns11643-5			"R-C5-" 4 X)
	  (===cns11643-6			"R-C6-" 4 X)
	  (===cns11643-7			"R-C7-" 4 X)
	  (==ucs@JP/hanazono		   "g2-hanaJU+" 4 X)
	  (==ruimoku-v6			     "g2-RUI6-" 4 X)
	  (===ruimoku-v6		      "R-RUI6-" 4 X)
	  ( china3-jef				 "JC3-" 4 X)
	  (==jef-china3			      "g2-JC3-" 4 X)
	  (===jef-china3		       "R-JC3-" 4 X)
	  ( =big5				   "B-" 4 X)
	  ( =big5				  "C0-" 4 X)
	  ( =big5-eten				  "BE-" 4 X)
	  (=>>daikanwa			        "G-M-"	5 d)
	  (=>>daikanwa/+p		        "G-M-p" 5 d)
	  (=>daikanwa				 "A-M-" 5 d)
	  (=>daikanwa/ho			"A-M-H" 4 d)
	  (=>cns11643-5				"A-C5-" 4 X)
	  (=>cns11643-7				"A-C7-" 4 X)
	  (=>big5-cdp			       "A-CDP-" 4 X)
	  (=+>ucs-var-003		    "o-U-v003+" 4 X)
	  (=>ucs-var-001		    "A-U-v001+" 4 X)
	  (=>ucs-itaiji-001		    "A-U-i001+" 4 X)
	  (=>ucs-itaiji-002		    "A-U-i002+" 4 X)
	  (=>ucs-itaiji-003		    "A-U-i003+" 4 X)
	  (=>ucs-itaiji-004		    "A-U-i004+" 4 X)
	  (=>ucs-itaiji-005		    "A-U-i005+" 4 X)
	  (=>ucs-itaiji-006		    "A-U-i006+" 4 X)
	  (=>ucs-itaiji-007		    "A-U-i007+" 4 X)
	  (=>ucs-itaiji-008		    "A-U-i008+" 4 X)
	  (=>ucs-itaiji-009		    "A-U-i009+" 4 X)
	  (=>ucs-itaiji-010		    "A-U-i010+" 4 X)
	  (=>ucs-itaiji-011		    "A-U-i011+" 4 X)
	  (=>ucs-itaiji-012		    "A-U-i012+" 4 X)
	  (=>ucs-itaiji-014		    "A-U-i014+" 4 X)
	  (=>ucs-itaiji-016		    "A-U-i016+" 4 X)
	  (=>big5-cdp-itaiji-001	  "A-CDP-i001-" 4 X)
	  (=>big5-cdp-itaiji-002	  "A-CDP-i002-" 4 X)
	  (=>big5-cdp-itaiji-003	  "A-CDP-i003-" 4 X)
	  (=>big5-cdp-itaiji-004	  "A-CDP-i004-" 4 X)
	  (=>big5-cdp-itaiji-005	  "A-CDP-i005-" 4 X)
	  (=>big5-cdp-itaiji-006	  "A-CDP-i006-" 4 X)
	  (=>big5-cdp-var-001		  "A-CDP-v001-" 4 X)
	  (=>ucs-itaiji-001@iwds-1	"A-IWDSU-i001+" 4 X)
	  (=>ucs-itaiji-002@iwds-1	"A-IWDSU-i002+" 4 X)
	  (=>ucs-itaiji-003@iwds-1	"A-IWDSU-i003+" 4 X)
	  (=>ucs-itaiji-006@iwds-1	"A-IWDSU-i006+" 4 X)
	  (=>big5-cdp@iwds-1		   "A-IWDSCDP-" 4 X)
	  (=>big5-cdp@component		   "A-compCDP-" 4 X)
	  (=>big5-cdp@cognate		    "A-cgnCDP-" 4 X)
	  ( =jis-x0208@1978/i1		       "J78i1-" 4 X)
	  ( =shinjigen@rev			"SJG2-" 4 d)
	  ( =shinjigen@1ed			"SJG1-" 4 d)
	  (==shinjigen@rev		     "g2-SJG2-" 4 d)
	  (==shinjigen@1ed		     "g2-SJG1-" 4 d)
	  (=>>>ucs@iso			       "g2-IU+" 4 X)
	  (=>>>ucs@iso			       "GI-IU+" 4 X)
	  (=>>>ucs@unicode		       "GI-UU+" 4 X)
	  (=>>>ucs@cns			       "GI-CU+" 4 X)
	  (=>>>ucs@jis			       "g2-JU+" 4 X)
	  (=>>>ucs@jis			       "GI-JU+" 4 X)
	  (=>>>ucs@jis/2004		     "g2-J04U+" 4 X)
	  (=>>>ucs@jis/2004		     "GI-J04U+" 4 X)
	  (=>>>ucs@jis/1990		     "g2-J90U+" 4 X)
	  (=>>>ucs@ks			       "GI-KU+" 4 X)
	  ))

  (make-coding-system
   'utf-8-ivs-mcs 'utf-8
   "Coding-system of UTF-8 with IVS."
   '(mnemonic "MTF8i" enable-decomposition t))

  (make-coding-system
   'utf-8-mcs-er 'utf-8
   "Coding-system of UTF-8 with entity-reference."
   '(mnemonic "MTF8r" use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-mcs-er 'utf-8
   "Coding-system of UTF-8 with IVS and entity-reference."
   '(mnemonic "MTF8ir" enable-decomposition t use-entity-reference t))

  (make-coding-system
   'utf-8-mcs-no-composition 'utf-8
   "Coding-system of UTF-8 without composition."
   '(mnemonic "MTF8-nc" disable-composition t))

  (make-coding-system
   'utf-8-gb 'utf-8
   "Coding-system of UTF-8 using GB mapping."
   '(mnemonic "UTF8G"
	      charset-g0 =ucs@gb
	      charset-g1 =>ucs@unicode
	      charset-g2 =>ucs
	      charset-g3 =ucs))

  (make-coding-system
   'utf-8-ivs-gb 'utf-8
   "Coding-system of UTF-8 using GB mapping with IVS."
   '(mnemonic "UTF8iG"
	      charset-g0 =ucs@gb
	      charset-g1 =>ucs@unicode
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t))

  (make-coding-system
   'utf-8-gb-er 'utf-8
   "Coding-system of UTF-8 using GB mapping with entity-reference."
   '(mnemonic "UTF8Gr"
	      charset-g0 =ucs@gb
	      charset-g1 =>ucs@unicode
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-gb-er 'utf-8
   "Coding-system of UTF-8 using GB mapping with IVS and entity-reference."
   '(mnemonic "UTF8iGr"
	      charset-g0 =ucs@gb
	      charset-g1 =>ucs@unicode
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t
	      use-entity-reference t))

  (make-coding-system
   'utf-8-cns 'utf-8
   "Coding-system of UTF-8 using CNS mapping."
   '(mnemonic "UTF8C"
	      charset-g0 =ucs@cns
	      charset-g1 =>ucs@cns
	      charset-g2 =>ucs
	      charset-g3 =ucs))

  (make-coding-system
   'utf-8-ivs-cns 'utf-8
   "Coding-system of UTF-8 using CNS mapping with IVS."
   '(mnemonic "UTF8iC"
	      charset-g0 =ucs@cns
	      charset-g1 =>ucs@cns
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t))

  (make-coding-system
   'utf-8-cns-er 'utf-8
   "Coding-system of UTF-8 using CNS mapping with entity-reference."
   '(mnemonic "UTF8Cr"
	      charset-g0 =ucs@cns
	      charset-g1 =>ucs@cns
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-cns-er 'utf-8
   "Coding-system of UTF-8 using CNS mapping with IVS and entity-reference."
   '(mnemonic "UTF8iCr"
	      charset-g0 =ucs@cns
	      charset-g1 =>ucs@cns
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t
	      use-entity-reference t))

  (make-coding-system
   'utf-8-big5 'utf-8
   "Coding-system of UTF-8 using Big5 mapping."
   '(mnemonic "UTF8B"
	      charset-g0 =ucs@big5
	      charset-g1 =>ucs@big5
	      charset-g2 =>ucs
	      charset-g3 =ucs))

  (make-coding-system
   'utf-8-ivs-big5 'utf-8
   "Coding-system of UTF-8 using Big5 mapping with IVS."
   '(mnemonic "UTF8iB"
	      charset-g0 =ucs@big5
	      charset-g1 =>ucs@big5
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t))

  (make-coding-system
   'utf-8-big5-er 'utf-8
   "Coding-system of UTF-8 using Big5 mapping with entity-reference."
   '(mnemonic "UTF8Br"
	      charset-g0 =ucs@big5
	      charset-g1 =>ucs@big5
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-big5-er 'utf-8
   "Coding-system of UTF-8 using Big5 mapping with IVS and entity-reference."
   '(mnemonic "UTF8iBr"
	      charset-g0 =ucs@big5
	      charset-g1 =>ucs@big5
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t
	      use-entity-reference t))

  (make-coding-system
   'utf-8-jis 'utf-8
   "Coding-system of UTF-8 using JIS2000 mapping."
   '(mnemonic "UTF8J00"
	      charset-g0 =ucs@jis/2000
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs))

  (make-coding-system
   'utf-8-ivs-jis 'utf-8
   "Coding-system of UTF-8 using JIS2000 mapping with IVS."
   '(mnemonic "UTF8iJ00"
	      charset-g0 =ucs@jis/2000
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t))

  (make-coding-system
   'utf-8-jis-er 'utf-8
   "Coding-system of UTF-8 using JIS2000 mapping with entity-reference."
   '(mnemonic "UTF8J00r"
	      charset-g0 =ucs@jis/2000
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-jis-er 'utf-8
   "Coding-system of UTF-8 using JIS2000 mapping with IVS and entity-reference."
   '(mnemonic "UTF8iJ00r"
	      charset-g0 =ucs@jis/2000
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t
	      use-entity-reference t))

  (make-coding-system
   'utf-8-jp 'utf-8
   "Coding-system of UTF-8 using =ucs@JP mapping."
   '(mnemonic "UTF8JP"
	      charset-g0 =ucs@JP
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs))

  (make-coding-system
   'utf-8-ivs-jp 'utf-8
   "Coding-system of UTF-8 using =ucs@JP mapping with IVS."
   '(mnemonic "UTF8iJP"
	      charset-g0 =ucs@JP
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t))

  (make-coding-system
   'utf-8-jp-er 'utf-8
   "Coding-system of UTF-8 using =ucs@JP mapping with entity-reference."
   '(mnemonic "UTF8JPr"
	      charset-g0 =ucs@JP
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-jp-er 'utf-8
   "Coding-system of UTF-8 using =ucs@JP mapping with IVS and entity-reference."
   '(mnemonic "UTF8iJPr"
	      charset-g0 =ucs@JP
	      charset-g1 =>ucs@jis
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ks 'utf-8
   "Coding-system of UTF-8 using KS mapping."
   '(mnemonic "UTF8K"
	      charset-g0 =ucs@ks
	      charset-g1 =>ucs@ks
	      charset-g2 =>ucs
	      charset-g3 =ucs))

  (make-coding-system
   'utf-8-ivs-ks 'utf-8
   "Coding-system of UTF-8 using KS mapping with IVS."
   '(mnemonic "UTF8iK"
	      charset-g0 =ucs@ks
	      charset-g1 =>ucs@ks
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t))

  (make-coding-system
   'utf-8-ks-er 'utf-8
   "Coding-system of UTF-8 using KS mapping with entity-reference."
   '(mnemonic "UTF8Kr"
	      charset-g0 =ucs@ks
	      charset-g1 =>ucs@ks
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ivs-ks-er 'utf-8
   "Coding-system of UTF-8 using KS mapping with IVS and entity-reference."
   '(mnemonic "UTF8iKr"
	      charset-g0 =ucs@ks
	      charset-g1 =>ucs@ks
	      charset-g2 =>ucs
	      charset-g3 =ucs
	      enable-decomposition t
	      use-entity-reference t))

  (define-coding-system-alias 'utf-8 'utf-8-mcs)
  (define-coding-system-alias 'utf-8-er 'utf-8-mcs-er)
  )

(make-coding-system
 'euc-jisx0213 'iso2022
 "Coding-system of Japanese EUC based on JIS X 0213."
 '(charset-g0 ascii
   charset-g1 japanese-jisx0213-1
   charset-g2 katakana-jisx0201
   charset-g3 japanese-jisx0213-2
   short t
   mnemonic "Ja/EUC0213"
   ))

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
