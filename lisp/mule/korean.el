;;; korean.el --- Support for Korean

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Keywords: multilingual, Korean

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

;; For Korean, the character set KSC5601 is supported.

;;; Code:

;; Syntax of Korean characters.
(loop for row from 33 to  34 do
      (modify-syntax-entry `[korean-ksc5601 ,row] "."))
(loop for row from 35 to  37 do
      (modify-syntax-entry `[korean-ksc5601 ,row] "w"))
(loop for row from 38 to  41 do
      (modify-syntax-entry `[korean-ksc5601 ,row] "."))
(loop for row from 42 to 126 do
      (modify-syntax-entry `[korean-ksc5601 ,row] "w"))

;; Setting for coding-system and quail were moved to
;; language/korean.el.

(make-coding-system
 'iso-2022-int-1 'iso2022
 "ISO-2022-INT-1"
 '(charset-g0 ascii
   charset-g1 korean-ksc5601
   short t
   seven t
   lock-shift t
   mnemonic "INT-1"))

;; EGG specific setup
(define-egg-environment 'korean
  "Korean settings for egg"
  (lambda ()
    (when (not (featurep 'egg-kor))
      (load "its-hangul")
      (setq its:*standard-modes*
	    (cons (its:get-mode-map "hangul") its:*standard-modes*))
      (provide 'egg-kor))
    (setq wnn-server-type 'kserver)
    (setq egg-default-startup-file "eggrc-wnn")
    (setq-default its:*current-map* (its:get-mode-map "hangul"))))

;; (make-coding-system
;;  'euc-kr 2 ?K
;;  "Coding-system of Korean EUC (Extended Unix Code)."
;;  '((ascii t) korean-ksc5601 nil nil
;;    nil ascii-eol ascii-cntl))

(make-coding-system
 'euc-kr 'iso2022
 "Coding-system of Korean EUC (Extended Unix Code)."
 '(charset-g0 ascii
   charset-g1 korean-ksc5601
   mnemonic "ko/EUC"
   eol-type nil))

;;(define-coding-system-alias 'euc-kr 'euc-korea)

(copy-coding-system 'euc-kr 'korean-euc)

;; (make-coding-system
;;  'iso-2022-kr 2 ?k
;;  "MIME ISO-2022-KR"
;;  '(ascii (nil korean-ksc5601) nil nil
;;          nil ascii-eol ascii-cntl seven locking-shift nil nil nil nil nil
;;          designation-bol))

(make-coding-system
 'iso-2022-kr 'iso2022
 "Coding-System used for communication with mail in Korea."
 '(charset-g0 ascii
   charset-g1 korean-ksc5601
   force-g1-on-output t
   seven t
   lock-shift t
   mnemonic "Ko/7bit"
   eol-type lf))

(defun setup-korean-environment ()
  "Setup multilingual environment (MULE) for Korean."
  (interactive)
  (setup-english-environment)
  ;; (setq coding-category-iso-8-2 'euc-kr)
  (set-coding-category-system 'iso-8-2 'euc-kr)

  ;; (set-coding-priority
  ;;  '(coding-category-iso-7
  ;;    coding-category-iso-8-2
  ;;    coding-category-iso-8-1))
  (set-coding-priority-list
   '(iso-8-2
     iso-7
     iso-8-1
     iso-8-designate
     iso-lock-shift
     no-conversion
     shift-jis
     big5))

  (set-default-coding-systems 'euc-kr)

  ;; (when (eq 'x (device-type (selected-device)))
  ;;   (x-use-halfwidth-roman-font 'korean-ksc5601 "ksc5636"))

  ;; EGG specific setup 97.02.05 jhod
  (when (featurep 'egg)
    (when (not (featurep 'egg-kor))
      (provide 'egg-kor)
      (load "its-hangul")
      (setq its:*standard-modes*
	    (cons (its:get-mode-map "hangul") its:*standard-modes*)))
    (setq-default its:*current-map* (its:get-mode-map "hangul")))

  (setq default-input-method "korean-hangul"))

(set-language-info-alist
 "Korean" '((setup-function . setup-korean-environment)
	    (tutorial . "TUTORIAL.ko")
	    (charset . (korean-ksc5601))
	    (coding-system . (iso-2022-kr euc-kr))
	    (sample-text . "Hangul (한글)	안녕하세요, 안녕하십니까")
	    (documentation . t)))

;;; korean.el ends here
