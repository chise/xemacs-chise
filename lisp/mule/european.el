;;; european.el --- Support for European languages

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Keywords: multilingual, European

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

;; For Europeans, five character sets ISO8859-1,2,3,4,9 are supported.

;;; Code:

;; For syntax of Latin-1 characters.
(loop for c from 64 to 127              ; from ',A@(B' to ',A(B'
      do (modify-syntax-entry (make-char 'latin-iso8859-1 c) "w"))

(modify-syntax-entry (make-char 'latin-iso8859-1 32) "w") ; no-break space
(modify-syntax-entry ?,AW(B "_")
(modify-syntax-entry ?,Aw(B "_")

;; For syntax of Latin-2
(loop for c in '(?,B!(B ?,B#(B ?,B%(B ?,B&(B ?,B)(B ?,B*(B ?,B+(B ?,B,(B ?,B.(B ?,B/(B ?,B1(B ?,B3(B ?,B5(B ?,B6(B ?,B9(B ?,B:(B ?,B;(B ?,B<(B)
      do (modify-syntax-entry c "w"))

(loop for c from 62 to 126
      do (modify-syntax-entry (make-char 'latin-iso8859-2 c) "w"))

(modify-syntax-entry (make-char 'latin-iso8859-2 32) "w") ; no-break space
(modify-syntax-entry ?,BW(B ".")
(modify-syntax-entry ?,Bw(B ".")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EUROPEANS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (define-prefix-command 'describe-european-environment-map)
;; (define-key-after describe-language-environment-map [European]
;;   '("European" . describe-european-environment-map)
;;   t)

;; (define-prefix-command 'setup-european-environment-map)
;; (define-key-after setup-language-environment-map [European]
;;   '("European" . setup-european-environment-map)
;;   t)

;; Setup for LANGAUGE which uses one-byte 8-bit CHARSET, one-byte
;; 8-bit CODING-SYSTEM, and INPUT-METHOD.
(defun setup-8-bit-environment (language charset coding-system input-method)
  (setup-english-environment)
  (set-default-coding-systems coding-system)
  ;; (setq coding-category-iso-8-1 coding-system
  ;;       coding-category-iso-8-2 coding-system)
  (set-coding-category-system 'iso-8-1 coding-system)
  (set-coding-category-system 'iso-8-2 coding-system)

  ;; (if charset
  ;;     (let ((nonascii-offset (- (make-char charset) 128)))
  ;;       ;; Set up for insertion of characters in this character set
  ;;       ;; when codes 0200 - 0377 are typed in.
  ;;       (setq nonascii-insert-offset nonascii-offset)))

  (if input-method
      (setq default-input-method input-method))

  ;; If this is a Latin-N character set, set up syntax for it in
  ;; single-byte mode.  We can't use require because the file
  ;; must be eval'd each time in case we change from one Latin-N to another.
  ;; (if (string-match "^Latin-\\([1-9]\\)$" language)
  ;;     (load (downcase language) nil t))
  )

;; Latin-1 (ISO-8859-1)

;; (make-coding-system
;;  'iso-latin-1 2 ?1
;;  "ISO 2022 based 8-bit encoding (MIME:ISO-8859-1, Compound Text Encoding)"
;;  '((ascii t) (latin-iso8859-1 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil nil nil nil nil nil t))

;; (define-coding-system-alias 'iso-8859-1 'iso-latin-1)
;; (define-coding-system-alias 'latin-1 'iso-latin-1)
;; (define-coding-system-alias 'ctext 'iso-latin-1)

(defun setup-latin1-environment ()
  "Set up multilingual environment (MULE) for European Latin-1 users."
  (interactive)
  (setup-8-bit-environment "Latin-1" 'latin-iso8859-1 'iso-8859-1
			   "latin-1-prefix"))

(set-language-info-alist
 "Latin-1" '((setup-function . (setup-latin1-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-1))
	     (coding-system . (iso-8859-1))
	     (sample-text
	      . "Hello, Hej, Tere, Hei, Bonjour, Gr,A|_(B Gott, Ciao, ,A!(BHola!")
	     (documentation . ("\
These languages are supported with the Latin-1 (ISO-8859-1) character set:
 Danish, Dutch, English, Faeroese, Finnish, French, German, Icelandic,
 Irish, Italian, Norwegian, Portuguese, Spanish, and Swedish.
" . describe-european-environment-map))
	     ))

(set-language-info-alist
 "German" '((setup-function . (setup-latin1-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-1))
	     (coding-system . (iso-8859-1))
	     (tutorial . "TUTORIAL.de")
	     (sample-text
	      . "Hello, Hej, Tere, Hei, Bonjour, Gr,A|_(B Gott, Ciao, ,A!(BHola!")
	     (documentation . ("\
These languages are supported with the Latin-1 (ISO-8859-1) character set:
 Danish, Dutch, English, Faeroese, Finnish, French, German, Icelandic,
 Irish, Italian, Norwegian, Portuguese, Spanish, and Swedish.
" . describe-european-environment-map))
	     ))

(set-language-info-alist
 "French" '((setup-function . (setup-latin1-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-1))
	     (coding-system . (iso-8859-1))
	     (tutorial . "TUTORIAL.fr")
	     (sample-text
	      . "Hello, Hej, Tere, Hei, Bonjour, Gr,A|_(B Gott, Ciao, ,A!(BHola!")
	     (documentation . ("\
These languages are supported with the Latin-1 (ISO-8859-1) character set:
 Danish, Dutch, English, Faeroese, Finnish, French, German, Icelandic,
 Irish, Italian, Norwegian, Portuguese, Spanish, and Swedish.
" . describe-european-environment-map))
	     ))

(set-language-info-alist
 "Norwegian" '((setup-function . (setup-latin1-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-1))
	     (coding-system . (iso-8859-1))
	     (tutorial . "TUTORIAL.no")
	     (sample-text
	      . "Hello, Hej, Tere, Hei, Bonjour, Gr,A|_(B Gott, Ciao, ,A!(BHola!")
	     (documentation . ("\
These languages are supported with the Latin-1 (ISO-8859-1) character set:
 Danish, Dutch, English, Faeroese, Finnish, French, German, Icelandic,
 Irish, Italian, Norwegian, Portuguese, Spanish, and Swedish.
" . describe-european-environment-map))
	     ))

;; Latin-2 (ISO-8859-2)

;; (make-coding-system
;;  'iso-latin-2 2 ?2
;;  "ISO 2022 based 8-bit encoding (MIME:ISO-8859-2)"
;;  '((ascii t) (latin-iso8859-2 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil))

;; (define-coding-system-alias 'iso-8859-2 'iso-latin-2)
;; (define-coding-system-alias 'latin-2 'iso-latin-2)

(make-coding-system
 'iso-8859-2 'iso2022 "MIME ISO-8859-2"
 '(charset-g0 ascii
   charset-g1 latin-iso8859-2
   charset-g2 t
   charset-g3 t
   mnemonic "MIME/Ltn-2"
   ))

(defun setup-latin2-environment ()
  "Set up multilingual environment (MULE) for European Latin-2 users."
  (interactive)
  (setup-8-bit-environment "Latin-2" 'latin-iso8859-2 'iso-8859-2
			   "latin-2-prefix"))

(set-language-info-alist
 "Latin-2" '((setup-function . (setup-latin2-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-2))
	     (coding-system . (iso-8859-2))
	     (documentation . ("\
These languages are supported with the Latin-2 (ISO-8859-2) character set:
 Albanian, Czech, English, German, Hungarian, Polish, Romanian,
 Serbian, Croatian, Slovak, Slovene, and Swedish.
" . describe-european-environment-map))
	     ))

(set-language-info-alist
 "Croatian" '((setup-function . (setup-latin2-environment
				. setup-european-environment-map))
	      (charset . (ascii latin-iso8859-2))
	      (tutorial . "TUTORIAL.hr")
	      (coding-system . (iso-8859-2))
	      (documentation . ("\
These languages are supported with the Latin-2 (ISO-8859-2) character set:
 Albanian, Czech, English, German, Hungarian, Polish, Romanian,
 Serbian, Croatian, Slovak, Slovene, and Swedish.
" . describe-european-environment-map))
	      ))

(set-language-info-alist
 "Polish" '((setup-function . (setup-latin2-environment
				. setup-european-environment-map))
	      (charset . (ascii latin-iso8859-2))
	      (tutorial . "TUTORIAL.pl")
	      (coding-system . (iso-8859-2))
	      (documentation . ("\
These languages are supported with the Latin-2 (ISO-8859-2) character set:
 Albanian, Czech, English, German, Hungarian, Polish, Romanian,
 Serbian, Croatian, Slovak, Slovene, and Swedish.
" . describe-european-environment-map))
	      ))

(set-language-info-alist
 "Romanian" '((setup-function . (setup-latin2-environment
				 . setup-european-environment-map))
	      (charset . (ascii latin-iso8859-2))
	      (tutorial . "TUTORIAL.ro")
	      (coding-system . (iso-8859-2))
	      (documentation . ("\
These languages are supported with the Latin-2 (ISO-8859-2) character set:
 Albanian, Czech, English, German, Hungarian, Polish, Romanian,
 Serbian, Croatian, Slovak, Slovene, and Swedish.
" . describe-european-environment-map))
	      ))

;; Latin-3 (ISO-8859-3)

;; (make-coding-system
;;  'iso-latin-3 2 ?3
;;  "ISO 2022 based 8-bit encoding (MIME:ISO-8859-3)"
;;  '((ascii t) (latin-iso8859-3 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil))

;; (define-coding-system-alias 'iso-8859-3 'iso-latin-3)
;; (define-coding-system-alias 'latin-3 'iso-latin-3)

(make-coding-system
 'iso-8859-3 'iso2022 "MIME ISO-8859-3"
 '(charset-g0 ascii
   charset-g1 latin-iso8859-3
   charset-g2 t
   charset-g3 t
   mnemonic "MIME/Ltn-3"
   ))

(defun setup-latin3-environment ()
  "Set up multilingual environment (MULE) for European Latin-3 users."
  (interactive)
  (setup-8-bit-environment "Latin-3" 'latin-iso8859-3 'iso-8859-3
			   "latin-3-prefix"))

(set-language-info-alist
 "Latin-3" '((setup-function . (setup-latin3-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-3))
	     (coding-system . (iso-8859-3))
	     (documentation . ("\
These languages are supported with the Latin-3 (ISO-8859-3) character set:
 Afrikaans, Catalan, Dutch, English, Esperanto, French, Galician,
 German, Italian, Maltese, Spanish, and Turkish.
" . describe-european-environment-map))
	     ))

;; Latin-4 (ISO-8859-4)

;; (make-coding-system
;;  'iso-latin-4 2 ?4
;;  "ISO 2022 based 8-bit encoding (MIME:ISO-8859-4)"
;;  '((ascii t) (latin-iso8859-4 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil))

;; (define-coding-system-alias 'iso-8859-4 'iso-latin-4)
;; (define-coding-system-alias 'latin-4 'iso-latin-4)

(make-coding-system
 'iso-8859-4 'iso2022 "MIME ISO-8859-4"
 '(charset-g0 ascii
   charset-g1 latin-iso8859-4
   charset-g2 t
   charset-g3 t
   mnemonic "MIME/Ltn-4"
   ))

(defun setup-latin4-environment ()
  "Set up multilingual environment (MULE) for European Latin-4 users."
  (interactive)
  (setup-8-bit-environment "Latin-4" 'latin-iso8859-4 'iso-8859-4
			   "latin-4-prefix"))

(set-language-info-alist
 "Latin-4" '((setup-function . (setup-latin4-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-4))
	     (coding-system . (iso-8859-4))
	     (documentation . ("\
These languages are supported with the Latin-4 (ISO-8859-4) character set:
 Danish, English, Estonian, Finnish, German, Greenlandic, Lappish,
 Latvian, Lithuanian, and Norwegian.
" . describe-european-environment-map))
	     ))

;; Latin-5 (ISO-8859-9)

;; (make-coding-system
;;  'iso-latin-5 2 ?9
;;  "ISO 2022 based 8-bit encoding (MIME:ISO-8859-9)"
;;  '((ascii t) (latin-iso8859-9 t) nil nil
;;    nil ascii-eol ascii-cntl nil nil nil nil))

;; (define-coding-system-alias 'iso-8859-9 'iso-latin-5)
;; (define-coding-system-alias 'latin-5 'iso-latin-5)

(make-coding-system
 'iso-8859-9 'iso2022 "MIME ISO-8859-9"
 '(charset-g0 ascii
   charset-g1 latin-iso8859-9
   charset-g2 t
   charset-g3 t
   mnemonic "MIME/Ltn-5"
   ))

(defun setup-latin5-environment ()
  "Set up multilingual environment (MULE) for European Latin-5 users."
  (interactive)
  (setup-8-bit-environment "Latin-5" 'latin-iso8859-9 'iso-8859-5
			   "latin-5-prefix"))

(set-language-info-alist
 "Latin-5" '((setup-function . (setup-latin5-environment
				. setup-european-environment-map))
	     (charset . (ascii latin-iso8859-9))
	     (coding-system . (iso-8859-5))
	     (documentation . ("\
These languages are supported with the Latin-5 (ISO-8859-9) character set.
" . describe-european-environment-map))
	     ))

;; (defun setup-european-environment ()
;;   "Setup multilingual environment (MULE) for European languages users.
;; It actually reset MULE to the default status, and
;; set quail-latin-1 as the default input method to be selected.
;; See also the documentation of setup-english-environment."
;;   (setup-english-environment)
;;   (setq default-input-method '("European" . "quail-latin-1")))

;; (defun describe-european-support ()
;;   "Describe how Emacs support European languages."
;;   (interactive)
;;   (describe-language-support-internal "European"))

;; (set-language-info-alist
;;  "European" '((setup-function . setup-european-environment)
;;               (describe-function . describe-european-support)
;;               (charset . (ascii latin-iso8859-1 latin-iso8859-2
;;                           latin-iso8859-3 latin-iso8859-4 latin-iso8859-9))
;;               (coding-system . (iso-8859-1 iso-8859-2 iso-8859-3
;;                                 iso-8859-4 iso-8859-9))
;;               (sample-text
;;                . "Hello, Hej, Tere, Hei, Bonjour, Gr,A|_(B Gott, Ciao, ,A!(BHola!")
;;               (documentation . "\
;; Almost all of European languages are supported by the character sets and
;; coding systems listed below.
;; To input them, LEIM (Libraries for Emacs Input Methods) should have been
;; installed.")
;;               ))

;;; european.el ends here
