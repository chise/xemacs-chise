;;; english.el --- English support

;; Copyright (C) 1997 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Keywords: multibyte character, character set, syntax, category

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

;; We need nothing special to support English on Emacs.  Selecting
;; English as a language environment is one of the ways to reset
;; various multilingual environment to the original settting.

;; modified for XEmacs by MORIOKA Tomohiko

;;; Code

(defun setup-english-environment ()
  "Reset multilingual environment of Emacs to the default status.
The default status is as follows.

  The default value of enable-multibyte-characters is t.

  The default value of buffer-file-coding-system is nil.
  The coding system for terminal output is nil.
  The coding system for keyboard input is nil.

  The order of priorities of coding categories and the coding system
  bound to each category are as follows
	coding category			coding system
	--------------------------------------------------
	coding-category-iso-7		iso-2022-7bit
	coding-category-iso-8-1		iso-8859-1
	coding-category-iso-8-2		iso-8859-1
	coding-category-iso-7-else	iso-2022-7bit-lock
	coding-category-iso-8-else	iso-2022-8bit-ss2
	coding-category-emacs-mule 	no-conversion
	coding-category-sjis		japanese-shift-jis
	coding-category-big5		chinese-big5
	coding-category-binarry		no-conversion
"
  (interactive)
  ;; (setq-default enable-multibyte-characters t)

  ;; (setq coding-category-iso-7           'iso-2022-7bit
  ;;       coding-category-iso-8-1         'iso-8859-1
  ;;       coding-category-iso-8-2         'iso-8859-1
  ;;       coding-category-iso-7-else      'iso-2022-7bit-lock
  ;;       coding-category-iso-8-else      'iso-2022-8bit-ss2
  ;;       coding-category-emacs-mule      'no-conversion
  ;;       coding-category-sjis            'japanese-shift-jis
  ;;       coding-category-big5            'chinese-big5
  ;;       coding-category-binary          'binary)
  (set-coding-category-system 'iso-7		'iso-2022-7bit)
  (set-coding-category-system 'iso-8-1		'iso-8859-1)
  (set-coding-category-system 'iso-8-2		'iso-8859-1)
  (set-coding-category-system 'iso-lock-shift	'iso-2022-lock)
  (set-coding-category-system 'iso-8-designate	'ctext)
  (set-coding-category-system 'no-conversion	'no-conversion)
  (set-coding-category-system 'shift-jis	'shift_jis)
  (set-coding-category-system 'big5		'big5)
  
  ;; (set-coding-priority
  ;;  '(coding-category-iso-7
  ;;    coding-category-iso-8-2
  ;;    coding-category-iso-8-1
  ;;    coding-category-iso-7-else
  ;;    coding-category-iso-8-else
  ;;    coding-category-emacs-mule 
  ;;    coding-category-raw-text
  ;;    coding-category-sjis
  ;;    coding-category-big5
  ;;    coding-category-binary))
  (set-coding-priority-list
   '(iso-7
     iso-8-2
     iso-8-1
     iso-8-designate
     iso-lock-shift
     no-conversion
     shift-jis
     big5))
  
  (set-default-coding-systems nil)
  ;; Don't alter the terminal and keyboard coding systems here.
  ;; The terminal still supports the same coding system
  ;; that it supported a minute ago.
;;;  (set-terminal-coding-system-internal nil)
;;;  (set-keyboard-coding-system-internal nil)

  ;;(setq nonascii-insert-offset 0)
  )

(set-language-info-alist
 "English" '((setup-function . setup-english-environment)
	     (tutorial . "TUTORIAL")
	     (charset . (ascii))
	     (sample-text . "Hello!, Hi!, How are you?")
	     (documentation . "\
Nothing special is needed to handle English.")
	     ))

;; Make "ASCII" an alias of "English" language environment.
(set-language-info-alist
 "ASCII" (cdr (assoc "English" language-info-alist)))

;;; english.el ends here
