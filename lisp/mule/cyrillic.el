;;; cyrillic.el --- Support for languages which use Cyrillic characters

;; Copyright (C) 1995,1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Keywords: multilingual, Cyrillic

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

;; The character set ISO8859-5 is supported.  KOI-8 and ALTERNATIVNYJ
;; are converted to ISO8859-5 internally.

;;; Code:

;; For syntax of Cyrillic
(modify-syntax-entry 'cyrillic-iso8859-5 "w")
(modify-syntax-entry ?.LN- ".")
(modify-syntax-entry ?.LNp ".")
(modify-syntax-entry ?.LN} ".")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CYRILLIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (define-prefix-command 'describe-cyrillic-environment-map)
;; (define-key-after describe-language-environment-map [Cyrillic]
;;   '("Cyrillic" . describe-cyrillic-environment-map)
;;   t)

;; (define-prefix-command 'setup-cyrillic-environment-map)
;; (define-key-after setup-language-environment-map [Cyrillic]
;;   '("Cyrillic" . setup-cyrillic-environment-map)
;;   t)


;; ISO-8859-5 staff

;; (make-coding-system
;;  'cyrillic-iso-8bit 2 ?5
;;  "ISO 2022 based 8-bit encoding for Cyrillic script (MIME:ISO-8859-5)"
;;  '((ascii t) (cyrillic-iso8859-5 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil))

;; (define-coding-system-alias 'iso-8859-5 'cyrillic-iso-8bit)

(make-coding-system
 'iso-8859-5 'iso2022
 "MIME ISO-8859-5"
 '(charset-g0 ascii
   charset-g1 cyrillic-iso8859-5
   charset-g2 t
   charset-g3 t
   mnemonic "ISO8/Cyr"
   ))

(set-language-info-alist
 "Cyrillic-ISO" '((setup-function . (setup-cyrillic-iso-environment
				     . setup-cyrillic-environment-map))
		  (charset . (cyrillic-iso8859-5))
		  (tutorial . "TUTORIAL.ru")
		  (coding-system . (iso-8859-5))
		  (sample-text . "Russian (.LN@NcNaNaNZNXNY)	N7NTN`NPNRNaNbNRNcNYNbNU!")
		  (documentation . ("Support for Cyrillic ISO-8859-5."
				    . describe-cyrillic-environment-map))))

;; KOI-8 staff

(eval-and-compile

(defvar cyrillic-koi8-r-decode-table
  [
   0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
   16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
   32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
   48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
   64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79
   80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95
   96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111
   112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
   ?$B(!(B ?$B("(B ?$B(#(B ?$B($(B ?$B(&(B ?$B(%(B ?$B('(B ?$B()(B ?$B(((B ?$B(*(B ?$B(+(B 32  ?$(G#'(B ?$(G#+(B ?$(G#/(B 32
   32  ?$(C"F(B 32  32  ?$B"#(B 32  ?$B"e(B ?$A!V(B ?$A!\(B ?$A!](B ?.AN   32  ?N0  ?N2  ?N7  ?Nw
   ?$(G#D(B 32  32  ?.LNq  32  32  32  32  32  32  32  32  32  32  32  ?$(G#E(B
   32  32  ?$(G#G(B ?.LN!  32  32  32  32  32  32  32  32  ?$(G#F(B 32  32  ?.AN)
   ?.LNn  ?NP  ?NQ  ?Nf  ?NT  ?NU  ?Nd  ?NS  ?Ne  ?NX  ?NY  ?NZ  ?N[  ?N\  ?N]  ?N^ 
   ?.LN_  ?No  ?N`  ?Na  ?Nb  ?Nc  ?NV  ?NR  ?Nl  ?Nk  ?NW  ?Nh  ?Nm  ?Ni  ?Ng  ?Nj 
   ?.LNN  ?N0  ?N1  ?NF  ?N4  ?N5  ?ND  ?N3  ?NE  ?N8  ?N9  ?N:  ?N;  ?N<  ?N=  ?N> 
   ?.LN?  ?NO  ?N@  ?NA  ?NB  ?NC  ?N6  ?N2  ?NL  ?NK  ?N7  ?NH  ?NM  ?NI  ?NG  ?NJ ]
  "Cyrillic KOI8-R decoding table.")

(defvar cyrillic-koi8-r-encode-table
  (let ((table (make-vector 256 32))
	(i 0))
    (while (< i 256)
      (let* ((ch (aref cyrillic-koi8-r-decode-table i))
	     (split (split-char-or-char-int ch)))
	(cond ((eq (car split) 'cyrillic-iso8859-5)
	       (aset table (logior (nth 1 split) 128) i)
	       )
	      ((eq ch 32))
	      ((eq (car split) 'ascii)
	       (aset table ch i)
	       )))
      (setq i (1+ i)))
    table)
  "Cyrillic KOI8-R encoding table.")

)

(define-ccl-program ccl-decode-koi8
  `(3
    ((read r0)
     (loop
      (write-read-repeat r0 ,cyrillic-koi8-r-decode-table))))
  "CCL program to decode KOI8.")

(define-ccl-program ccl-encode-koi8
  `(1
    ((read r0)
     (loop
      (if (r0 != ,(charset-id 'cyrillic-iso8859-5))
	  (write-read-repeat r0)
	((read r0)
	 (write-read-repeat r0 , cyrillic-koi8-r-encode-table))))))
  "CCL program to encode KOI8.")

;(make-coding-system
;  'cyrillic-koi8 4
;  ;; We used to use ?K.  It is true that ?K is more strictly correct,
;  ;; but it is also used for Korean.
;  ;; So people who use koi8 for languages other than Russian
;  ;; will have to forgive us.
;  ?R "KOI8 8-bit encoding for Cyrillic (MIME: KOI8-R)"
;  (cons ccl-decode-koi8 ccl-encode-koi8))

;(define-coding-system-alias 'koi8-r 'cyrillic-koi8)
;(define-coding-system-alias 'koi8 'cyrillic-koi8)

(make-coding-system
 'koi8-r 'ccl
 "Coding-system used for KOI8-R."
 `(decode ,ccl-decode-koi8
   encode ,ccl-encode-koi8
   mnemonic "KOI8"))

;(define-coding-system-alias 'koi8-r 'koi8)

;; (define-ccl-program ccl-encode-koi8-font
;;   '(0
;;     ((r1 -= 160)
;;      (r1 = r1
;;          [ 32 179  32  32  32  32  32  32  32  32  32  32  32  32  32  32
;;               225 226 247 231 228 229 246 250 233 234 235 236 237 238 239 240
;;               242 243 244 245 230 232 227 254 251 253 255 249 248 252 224 241
;;               193 194 215 199 196 197 214 218 201 202 203 204 205 206 207 208
;;               210 211 212 213 198 200 195 222 219 221 223 217 216 220 192 209
;;               32 163  32  32  32  32  32  32  32  32  32  32  32  32  32  32])
;;      ))
;;   "CCL program to encode Cyrillic chars to KOI font.")

;; (setq font-ccl-encoder-alist
;;       (cons (cons "koi8" ccl-encode-koi8-font) font-ccl-encoder-alist))

(set-language-info-alist
 "Cyrillic-KOI8" '((setup-function . (setup-cyrillic-koi8-environment
				      . setup-cyrillic-environment-map))
		   (charset . (cyrillic-iso8859-5))
		   (coding-system . (koi8-r))
		   (tutorial . "TUTORIAL.ru")
		   (sample-text . "Russian (.LN@NcNaNaNZNXNY)	N7NTN`NPNRNaNbNRNcNYNbNU!")
		   (documentation . ("Support for Cyrillic KOI-8."
				     . describe-cyrillic-environment-map))))

;;; ALTERNATIVNYJ staff

(define-ccl-program ccl-decode-alternativnyj
  '(3
    ((read r0)
     (loop
       (write-read-repeat
	r0
	[  0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
	       16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31
	       32  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47
	       48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
	       64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
	       80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
	       96  97  98  99 100 101 102 103 104 105 106 107 108 109 110 111
	       112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
	       ?.LN0  ?N1  ?N2  ?N3  ?N4  ?N5  ?N6  ?N7  ?N8  ?N9  ?N:  ?N;  ?N<  ?N=  ?N>  ?N?
	       ?.LN@  ?NA  ?NB  ?NC  ?ND  ?NE  ?NF  ?NG  ?NH  ?NI  ?NJ  ?NK  ?NL  ?NM  ?NN  ?NO
	       ?.LNP  ?NQ  ?NR  ?NS  ?NT  ?NU  ?NV  ?NW  ?NX  ?NY  ?NZ  ?N[  ?N\  ?N]  ?N^  ?N_
	       32  32  32  32  32  32  32  32  32  32  32  32  32  32  32  32
	       32  32  32  32  32  32  32  32  32  32  32  32  32  32  32  32
	       32  32  32  32  32  32  32  32  32  32  32  32  32  32  32  32
	       ?.LN`  ?Na  ?Nb  ?Nc  ?Nd  ?Ne  ?Nf  ?Ng  ?Nh  ?Ni  ?Nj  ?Nk  ?Nl  ?Nm  ?Nn  ?No
	       ?.LN!  ?Nq   32  32  32  32  32  32  32  32  32  32  32  32  32 ?Np]))))
  "CCL program to decode Alternativnyj.")

(define-ccl-program ccl-encode-alternativnyj
  `(1
    ((read r0)
     (loop
       (if (r0 != ,(charset-id 'cyrillic-iso8859-5))
	   (write-read-repeat r0)
	 ((read r0)
	  (r0 -= 160)
	  (write-read-repeat
	   r0
	   [ 32 240  32  32  32  32  32  32  32  32  32  32  32  32  32  32
		128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
		144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
		160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
		224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
		255 241  32  32  32  32  32  32  32  32  32  32  32  32  32  32])
	  )))))
  "CCL program to encode Alternativnyj.")

;; (make-coding-system
;;  'alternativnyj 4
;;  ?A "Coding-system used for Alternativnyj"
;;  (cons ccl-decode-alternativnyj ccl-encode-alternativnyj))

(make-coding-system
 'alternativnyj 'ccl
 "Coding-system used for Alternativnyj"
 `(decode ,ccl-decode-alternativnyj
   encode ,ccl-encode-alternativnyj
   mnemonic "Cy.Alt"))

;; (define-ccl-program ccl-encode-alternativnyj-font
;;   '(0
;;     ((r1 -= 160)
;;      (r1 = r1
;;       [ 32 240  32  32  32  32  32  32  32  32  32  32  32  32  32  32
;;        128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
;;        144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
;;        160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
;;        224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
;;        255 241  32  32  32  32  32  32  32  32  32  32  32  32  32  32])
;;      ))
;;   "CCL program to encode Cyrillic chars to Alternativnyj font.")

;; (setq font-ccl-encoder-alist
;;       (cons (cons "alternativnyj" ccl-encode-alternativnyj-font)
;;             font-ccl-encoder-alist))

(set-language-info-alist
 "Cyrillic-ALT" '((setup-function . (setup-cyrillic-alternativnyj-environment
				     . setup-cyrillic-environment-map))
		  (charset . (cyrillic-iso8859-5))
		  (coding-system . (alternativnyj))
		  (tutorial . "TUTORIAL.ru")
		  (sample-text . "Russian (.LN@NcNaNaNZNXNY)	N7NTN`NPNRNaNbNRNcNYNbNU!")
		  (documentation . ("Support for Cyrillic ALTERNATIVNYJ."
				    . describe-cyrillic-environment-map))))

;;; GENERAL

(defun setup-cyrillic-environment ()
  "Setup multilingual environment for Cyrillic users."
  (interactive)
  (setq primary-language "Cyrillic")

  (setq coding-category-iso-8-1 'iso-8859-5)

  (set-coding-priority
   '(coding-category-iso-7
     coding-category-iso-8-1))

  (setq-default buffer-file-coding-system 'iso-8859-5)
  (set-terminal-coding-system 'iso-8859-5)
  (set-keyboard-coding-system 'iso-8859-5)

  (setq default-input-method '("Cyrillic" . "quail-yawerty"))
  )

(defun describe-cyrillic-support ()
  "Describe how Emacs support Cyrillic."
  (interactive)
  (describe-language-support-internal "Cyrillic"))

(set-language-info-alist
 "Cyrillic" '((setup-function . setup-cyrillic-environment)
              (describe-function . describe-cyrillic-support)
              (charset . (cyrillic-iso8859-5))
	      (tutorial . "TUTORIAL.ru")
              (coding-system . (iso-8859-5 koi8-r alternativnyj))
              (sample-text . "Russian (.LN@NcNaNaNZNXNY) N7NTN`NPNRNaNbNRNcNYNbNU!")
              (documentation . nil)))

;;; cyrillic.el ends here
