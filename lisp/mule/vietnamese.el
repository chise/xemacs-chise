;;; vietnamese.el --- Support for Vietnamese

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Keywords: multilingual, Vietnamese

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

;; For Vietnames, the character sets VISCII and VSCII are supported.

;;; Code:

(eval-and-compile

(defvar viet-viscii-decode-table
  [;; VISCII is a full 8-bit code.
   0 1 ?.2NF 3 4 ?NG ?Ng 7 8 9 10 11 12 13 14 15
   16 17 18 19 ?.2NV 21 22 23 24 ?N[ 26 27 28 29 ?N\ 31
   32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
   48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
   64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79
   80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95
   96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111
   112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 
   ?.2NU ?N! ?N" ?N# ?N$ ?N% ?N& ?N' ?N( ?N) ?N* ?N+ ?N, ?N- ?N. ?N/
   ?.2N0 ?N1 ?N2 ?N5 ?N~ ?N> ?N6 ?N7 ?N8 ?Nv ?Nw ?No ?N| ?N{ ?Nx ?NO
   ?.2Nu ?.1N! ?N" ?N# ?N$ ?N% ?N& ?N' ?N( ?N) ?N* ?N+ ?N, ?N- ?N. ?N/
   ?.1N0 ?N1 ?N2 ?.2N^ ?N= ?.1N5 ?N6 ?N7 ?N8 ?.2Nq ?NQ ?NW ?NX ?.1N= ?N> ?.2N_
   ?.2N` ?Na ?Nb ?Nc ?Nd ?Ne ?.1NF ?NG ?.2Nh ?Ni ?Nj ?Nk ?Nl ?Nm ?Nn ?.1NO
   ?.2Np ?.1NQ ?.2Nr ?Ns ?Nt ?.1NU ?NV ?NW ?NX ?.2Ny ?Nz ?.1N[ ?N\ ?.2N} ?.1N^ ?N_
   ?.1N` ?Na ?Nb ?Nc ?Nd ?Ne ?Nf ?Ng ?Nh ?Ni ?Nj ?Nk ?Nl ?Nm ?Nn ?No
   ?.1Np ?Nq ?Nr ?Ns ?Nt ?Nu ?Nv ?Nw ?Nx ?Ny ?Nz ?N{ ?N| ?N} ?N~ ?.2Nf ]
  "Vietnamese VISCII decoding table.")

(defvar viet-viscii-encode-table
  (let ((table-lower (make-vector 128 0))
	(table-upper (make-vector 128 0))
	(i 0)
	char-component)
    (while (< i 256)
      (setq char-component
	    (split-char-or-char-int (aref viet-viscii-decode-table i)))
      (cond ((eq (car char-component) 'vietnamese-viscii-lower)
	     (aset table-lower (nth 1 char-component) i))
	    ((eq (car char-component) 'vietnamese-viscii-upper)
	     (aset table-upper (nth 1 char-component) i)))
      (setq i (1+ i)))
    (cons table-lower table-upper))
  "Vietnamese VISCII encoding table.
Cons of tables for encoding lower-case chars and upper-case characters.
Both tables are indexed by the position code of Vietnamese characters.")

(defvar viet-vscii-decode-table
  [;; VSCII is a full 8-bit code.
   0 ?.2Nz ?Nx 3 ?NW ?NX ?Nf 7 8 9 10 11 12 13 14 15
   16 ?.2NQ ?N_ ?NO ?NV ?N[ ?N} ?N\ 24 25 26 27 28 29 30 31
   32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
   48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
   64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79
   80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95
   96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111
   112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 
   ?.2N` ?Nd ?Nc ?Na ?NU ?N# ?N' ?Nh ?Nk ?N( ?Ni ?N) ?N. ?Nl ?No ?Nn
   ?.2Nm ?N8 ?Nr ?Nv ?Nu ?Ns ?Nw ?N5 ?N6 ?N7 ?N^ ?N> ?N~ ?Ny ?N| ?N{
   160 ?.2Ne ?Nb ?Nj ?Nt ?N= ?N_ ?Np ?.1Ne ?Nb ?Nj ?Nt ?N> ?Ny ?Np ?.2N"
   192 193 194 195 196 ?.1N` ?Nd ?Nc ?Na ?NU ?.2NF ?.1N" ?NF ?NG ?N! ?.2NG
   ?.2N! ?N% ?N& ?Ng ?N% ?N+ ?.1N# ?N% ?N& ?Ng ?N$ ?N' ?Nh ?.2N, ?.1Nk ?N(
   ?.1Ni ?N) ?N+ ?N, ?N- ?N* ?N. ?Nl ?No ?.2N- ?N* ?N0 ?.1Nn ?Nm ?N8 ?Nr
   ?.2N1 ?.1Nv ?Nu ?Ns ?Nw ?N0 ?N1 ?N2 ?N/ ?N5 ?N6 ?N7 ?N^ ?N> ?N~ ?Ny
   ?.2N2 ?.1N| ?N{ ?Nz ?Nx ?NW ?NX ?Nf ?NQ ?Nq ?NO ?NV ?N[ ?N} ?N\ ?.2N/]
  "Vietnamese VSCII decoding table.")

(defvar viet-vscii-encode-table
  (let ((table-lower (make-vector 128 0))
	(table-upper (make-vector 128 0))
	(i 0)
	char-component)
    (while (< i 256)
      (setq char-component
	    (split-char-or-char-int (aref viet-vscii-decode-table i)))
      (cond ((eq (car char-component) 'vietnamese-viscii-lower)
	     (aset table-lower (nth 1 char-component) i))
	    ((eq (car char-component) 'vietnamese-viscii-upper)
	     (aset table-upper (nth 1 char-component) i)))
      (setq i (1+ i)))
    (cons table-lower table-upper))
  "Vietnamese VSCII encoding table.
Cons of tables for encoding lower-case chars and upper-case characters.
Both tables are indexed by the position code of Vietnamese characters.")

)

(define-ccl-program ccl-decode-viscii
  `(3
    ((read r0)
     (loop
      (write-read-repeat r0 ,viet-viscii-decode-table))
     ))
  "CCL program to decode VISCII 1.1")

;; Multibyte form of a Vietnamese character is as follows (3-byte):
;;   LEADING-CODE-PRIVATE-11 LEADING-CODE-EXTENDED-11 POSITION-CODE
;; where LEADING-CODE-EXTENDED-11 for Vietnamese is
;; `vietnamese-viscii-lower' or `vietnamese-viscii-upper'.

(define-ccl-program ccl-encode-viscii
  `(1
     ((read r0)
      (loop
       (if (r0 < 128)
	   ;; ASCII
	   (write-read-repeat r0)
	 ;; not ASCII
	 (if (r0 != ,leading-code-private-11)
	     ;; not Vietnamese
	     (write-read-repeat r0)
	   ((read-if (r0 == ,(charset-id 'vietnamese-viscii-lower))
	     (;; Vietnamese lower
	      (read r0)
	      (r0 -= 128)
	      (write-read-repeat r0 ,(car viet-viscii-encode-table)))
	     (if (r0 == ,(charset-id 'vietnamese-viscii-upper))
		 (;; Vietnamese upper
		  (read r0)
		  (r0 -= 128)
		  (write-read-repeat r0 ,(cdr viet-viscii-encode-table)))
	       ;; not Vietnamese
	       (write-read-repeat r0)))))))))
  "CCL program to encode VISCII 1.1")

(define-ccl-program ccl-encode-viscii-font
  `(0
    ;; In:  R0:vietnamese-viscii-lower/vietnamese-viscii-upper
    ;;      R1:position code
    ;; Out: R1:font code point
    (if (r0 == ,(charset-id 'vietnamese-viscii-lower))
	(r1 = r1 ,(car viet-viscii-encode-table))
      (r1 = r1 ,(cdr viet-viscii-encode-table)))
    )
  "CCL program to encode Vietnamese chars to VISCII 1.1 font")

(define-ccl-program ccl-decode-vscii
  `(3
    ((read r0)
     (loop
      (write-read-repeat r0 ,viet-vscii-decode-table))
     ))
  "CCL program to decode VSCII-1.")

(define-ccl-program ccl-encode-vscii
  `(1
    ((read r0)
     (loop
      (if (r0 < 128)
	  ;; ASCII
	  (write-read-repeat r0)
	;; not ASCII 
	(if (r0 != ,leading-code-private-11)
	    ;; not Vietnamese
	    (write-read-repeat r0)
	  (read-if (r0 == ,(charset-id 'vietnamese-viscii-lower))
		   (;; Vietnamese lower
		    (read r0)
		    (r0 -= 128)
		    (write-read-repeat r0 ,(car viet-vscii-encode-table)))
		   (if (r0 == ,(charset-id 'vietnamese-viscii-upper))
		       (;; Vietnamese upper
			(read r0)
			(r0 -= 128)
			(write-read-repeat r0 ,(cdr viet-viscii-encode-table)))
		     ;; not Vietnamese
		     (write-read-repeat r0))))))))
  "CCL program to encode VSCII-1.")

(define-ccl-program ccl-encode-vscii-font
  `(0
    ;; In:  R0:vietnamese-viscii-lower/vietnamese-viscii-upper
    ;;      R1:position code
    ;; Out: R1:font code point
    (if (r0 == ,(charset-id 'vietnamese-viscii-lower))
	(r1 = r1 ,(car viet-vscii-encode-table))
      (r1 = r1 ,(cdr viet-vscii-encode-table)))
    )
  "CCL program to encode Vietnamese chars to VSCII-1 font.")


(make-coding-system
 'viscii 'ccl
 "Coding-system used for VISCII 1.1."
 `(mnemonic "VISCII"
   decode ,ccl-decode-viscii
   encode ,ccl-encode-viscii))

;; (make-coding-system
;;  'vietnamese-viscii 4 ?V
;;  "8-bit encoding for Vietnamese VISCII 1.1 (MIME:VISCII)"
;;  (cons ccl-decode-viscii ccl-encode-viscii))

;; (define-coding-system-alias 'viscii 'vietnamese-viscii)

(make-coding-system
 'vscii 'ccl
 "Coding-system used for VSCII 1.1."
 `(mnemonic "VSCII"
   decode ,ccl-decode-vscii
   encode ,ccl-encode-vscii))

;; (make-coding-system
;;  'vietnamese-vscii 4 ?v
;;  "8-bit encoding for Vietnamese VSCII-1"
;;  (cons ccl-decode-vscii ccl-encode-vscii))

;; (define-coding-system-alias 'vscii 'vietnamese-vscii)

(make-coding-system
 'viqr 'no-conversion
 "Coding-system used for VIQR."
 '(mnemonic "VIQR"
   eol-type lf
   post-read-conversion viqr-post-read-conversion
   pre-write-conversion viqr-pre-write-conversion))

;; (make-coding-system
;;  'vietnamese-viqr 0 ?q
;;  "Vietnamese latin transcription (VIQR)"
;;  nil)
;; (put 'vietnamese-viqr 'post-read-conversion 'viqr-post-read-conversion)
;; (put 'vietnamese-viqr 'pre-write-conversion 'viqr-pre-write-conversion)

;; (define-coding-system-alias 'viqr 'vietnamese-viqr)

;; For VISCII users
(set-charset-ccl-program 'vietnamese-viscii-lower
			 ccl-encode-viscii-font)
(set-charset-ccl-program 'vietnamese-viscii-upper
			 ccl-encode-viscii-font)
;; For VSCII users
(set-charset-ccl-program 'vietnamese-viscii-lower ccl-encode-vscii-font)
(set-charset-ccl-program 'vietnamese-viscii-upper ccl-encode-vscii-font)

;; (setq font-ccl-encoder-alist
;;       (cons (cons "viscii" ccl-encode-viscii-font) font-ccl-encoder-alist))

;; (setq font-ccl-encoder-alist
;;       (cons (cons "vscii" ccl-encode-vscii-font) font-ccl-encoder-alist))

(set-language-info-alist
 "Vietnamese" '((setup-function . setup-vietnamese-environment)
		(charset . (vietnamese-viscii-lower
			    vietnamese-viscii-upper))
		(coding-system . (viscii vscii viqr))
		(sample-text . "Vietnamese (Ti.1N*ng ViN.t)	ChN`o bNUn")
		(documentation . "\
For Vietnamese, Emacs uses special charasets internally.
They can be decoded from and encoded to VISCC, VSCII, and VIQR.")
		))

;;; vietnamese.el ends here
