;;; japanese.el --- Japanese support

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Keywords: multilingual, Japanese

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

;; For Japanese, character sets JISX0201, JISX0208, JISX0212 are
;; supported.

;;; Code:

;;; Syntax of Japanese characters.
(modify-syntax-entry 'katakana-jisx0201 "w")
(modify-syntax-entry 'japanese-jisx0212 "w")

(modify-syntax-entry 'japanese-jisx0208 "w")
(loop for row in '(33 34 40)
      do (modify-syntax-entry `[japanese-jisx0208 ,row] "_"))
(loop for char in '(?$B!<(B ?$B!+(B ?$B!,(B ?$B!3(B ?$B!4(B ?$B!5(B ?$B!6(B ?$B!7(B ?$B!8(B ?$B!9(B ?$B!:(B ?$B!;(B)
      do (modify-syntax-entry char "w"))
(modify-syntax-entry ?\$B!J(B "($B!K(B")
(modify-syntax-entry ?\$B!N(B "($B!O(B")
(modify-syntax-entry ?\$B!P(B "($B!Q(B")
(modify-syntax-entry ?\$B!V(B "($B!W(B")
(modify-syntax-entry ?\$B!X(B "($B!Y(B")
(modify-syntax-entry ?\$B!K(B ")$B!J(B")
(modify-syntax-entry ?\$B!O(B ")$B!N(B")
(modify-syntax-entry ?\$B!Q(B ")$B!P(B")
(modify-syntax-entry ?\$B!W(B ")$B!V(B")
(modify-syntax-entry ?\$B!Y(B ")$B!X(B")

;;; Character categories S, A, H, K, G, Y, and C
(define-category ?S "Japanese 2-byte symbol character.")
(modify-category-entry [japanese-jisx0208 33] ?S)
(modify-category-entry [japanese-jisx0208 34] ?S)
(modify-category-entry [japanese-jisx0208 40] ?S)
(define-category ?A "Japanese 2-byte Alphanumeric character.")
(modify-category-entry [japanese-jisx0208 35] ?A)
(define-category ?H "Japanese 2-byte Hiragana character.")
(modify-category-entry [japanese-jisx0208 36] ?H)
(define-category ?K "Japanese 2-byte Katakana character.")
(modify-category-entry [japanese-jisx0208 37] ?K)
(define-category ?G "Japanese 2-byte Greek character.")
(modify-category-entry [japanese-jisx0208 38] ?G)
(define-category ?Y "Japanese 2-byte Cyrillic character.")
(modify-category-entry [japanese-jisx0208 39] ?Y)
(define-category ?C "Japanese 2-byte Kanji characters.")
(loop for row from 48 to 126
      do (modify-category-entry `[japanese-jisx0208 ,row] ?C))
(loop for char in '(?$B!<(B ?$B!+(B ?$B!,(B)
      do (modify-category-entry char ?K)
         (modify-category-entry char ?H))
(loop for char in '(?$B!3(B ?$B!4(B ?$B!5(B ?$B!6(B ?$B!7(B ?$B!8(B ?$B!9(B ?$B!:(B ?$B!;(B)
      do (modify-category-entry char ?C))
(modify-category-entry 'japanese-jisx0212 ?C)

(defvar japanese-word-regexp
  "\\cA+\\cH*\\|\\cK+\\cH*\\|\\cC+\\cH*\\|\\cH+\\|\\ck+\\|\\sw+"
  "Regular expression used to match a Japanese word.")

(set-word-regexp japanese-word-regexp)
(setq forward-word-regexp  "\\w\\>")
(setq backward-word-regexp "\\<\\w")

;;; Paragraph setting
(setq sentence-end
      (concat
       "\\("
       "\\("
       "[.?!][]\"')}]*"
       "\\|"
       "[$B!%!)!*(B][$B!O!I!G!K!Q!M!S!U!W!Y(B]*"
       "\\)"
       "\\($\\|\t\\|  \\)"
       "\\|"
       "$B!#(B"
       "\\)"
       "[ \t\n]*"))
(setq paragraph-start    "^[ $B!!(B\t\n\f]")
(setq paragraph-separate "^[ $B!!(B\t\f]*$")

;; EGG specific setup
(define-egg-environment 'japanese
  "Japanese settings for egg."
  (lambda ()
    (when (not (featurep 'egg-jpn))
      (load "its-hira")
      (load "its-kata")
      (load "its-hankaku")
      (load "its-zenkaku")
      (setq its:*standard-modes*
	    (append
	     (list (its:get-mode-map "roma-kana")
		   (its:get-mode-map "roma-kata")
		   (its:get-mode-map "downcase")
		   (its:get-mode-map "upcase")
		   (its:get-mode-map "zenkaku-downcase")
		   (its:get-mode-map "zenkaku-upcase"))
	     its:*standard-modes*))
      (provide 'egg-jpn))
    (setq wnn-server-type 'jserver)
    ;; Can't do this here any more.  Must do it when selecting egg-wnn
    ;; or egg-sj3
    ;; (setq egg-default-startup-file "eggrc-wnn")
    (setq-default its:*current-map* (its:get-mode-map "roma-kana"))))

;; stuff for providing gramatic processing of Japanese text
;; something like this should probably be created for all environments...

(defvar aletter (concat "\\(" ascii-char "\\|" kanji-char "\\)"))
(defvar kanji-space-insertable (concat 
	   "$B!"(B" aletter                   "\\|"
	   "$B!#(B" aletter                   "\\|"
	   aletter "$B!J(B"                   "\\|"
	   "$B!K(B" aletter                   "\\|"
	   ascii-alphanumeric  kanji-kanji-char "\\|"
	   kanji-kanji-char    ascii-alphanumeric ))

(defvar space-insertable (concat " " aletter "\\|" kanji-space-insertable)
  "Regexp for finding points that can have spaces inserted into them for justification")

;; (make-coding-system
;;  'iso-2022-jp 2 ?J
;;  "ISO 2022 based 7bit encoding for Japanese (MIME:ISO-2022-JP)"
;;  '((ascii japanese-jisx0208-1978 japanese-jisx0208
;;           latin-jisx0201 japanese-jisx0212 katakana-jisx0201 t) nil nil nil
;;    short ascii-eol ascii-cntl seven))

;; (define-coding-system-alias 'junet 'iso-2022-jp)

(make-coding-system
 'iso-2022-jp 'iso2022
 "Coding-system used for communication with mail and news in Japan."
 '(charset-g0 ascii
   short t
   seven t
   input-charset-conversion ((latin-jisx0201 ascii)
			     (japanese-jisx0208-1978 japanese-jisx0208))
   mnemonic "MULE/7bit"
   ))

(copy-coding-system 'iso-2022-jp 'junet)

;; (make-coding-system
;;  'shift_jis 1 ?S
;;  "Coding-system of Shift-JIS used in Japan." t)

(make-coding-system
 'shift_jis 'shift-jis
 "Coding-system of Shift-JIS used in Japan."
 '(mnemonic "Ja/SJIS"))

;;(define-coding-system-alias 'shift_jis 'sjis)

(copy-coding-system 'shift_jis 'sjis)

;; (make-coding-system
;;  'iso-2022-jp-1978-irv 2 ?J
;;  "Coding-system used for old jis terminal."
;;  '((ascii t) nil nil nil
;;    short ascii-eol ascii-cntl seven nil nil use-roman use-oldjis))

(make-coding-system
 'iso-2022-jp-1978-irv 'iso2022
 "Coding-system used for old JIS terminal."
 '(charset-g0 ascii
   short t
   seven t
   output-charset-conversion ((ascii latin-jisx0201)
			      (japanese-jisx0208 japanese-jisx0208-1978))
   mnemonic "Ja-78/7bit"
   ))

;;(define-coding-system-alias 'iso-2022-jp-1978-irv 'old-jis)

(copy-coding-system 'iso-2022-jp-1978-irv 'old-jis)

;; (make-coding-system
;;  'euc-japan-1990 2 ?E
;;  "Coding-system of Japanese EUC (Extended Unix Code)."
;;  '(ascii japanese-jisx0208 katakana-jisx0201 japanese-jisx0212
;;          short ascii-eol ascii-cntl nil nil single-shift))

(make-coding-system
 'euc-jp 'iso2022
 "Coding-system of Japanese EUC (Extended Unix Code)."
 '(charset-g0 ascii
   charset-g1 japanese-jisx0208
   charset-g2 katakana-jisx0201
   charset-g3 japanese-jisx0212
   short t
   mnemonic "Ja/EUC"
   ))

;;(define-coding-system-alias 'euc-japan-1990 'euc-japan)

(copy-coding-system 'euc-jp 'euc-japan) ; only for w3
(copy-coding-system 'euc-jp 'japanese-euc)

(set-language-info-alist
 "Japanese" '((setup-function . setup-japanese-environment)
	      (tutorial . "TUTORIAL.ja")
	      (charset . (japanese-jisx0208 japanese-jisx0208-1978
			  japanese-jisx0212 latin-jisx0201
			  katakana-jisx0201))
	      (coding-system . (iso-2022-jp euc-jp
				shift_jis iso-2022-jp-1978-irv))
	      (sample-text . "Japanese ($BF|K\8l(B)		$B$3$s$K$A$O(B, (I:]FAJ(B")
	      (documentation . t)))

;;; japanese.el ends here
