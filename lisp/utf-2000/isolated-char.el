;;; isolated-char.el --- Set up isolated-characters.

;; Copyright (C) 2001 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: UTF-2000, UCS-4, character, CCS, multiscript, multilingual

;; This file is part of XEmacs UTF-2000.

;; XEmacs UTF-2000 is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs UTF-2000 is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs UTF-2000; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(let ((buf (find-file-noselect "../etc/GT-RS.txt")))
  (with-current-buffer buf
    (goto-char (point-min))
    (let (gt-code radical strokes plane code)
      (while (re-search-forward "\\([0-9]+\\),\\([0-9]+\\),\\([0-9]+\\),GT\\([0-9]+\\),....,\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" nil t)
	(setq gt-code (string-to-int (match-string 1))
	      plane (string-to-int (match-string 4))
	      code (string-to-int (match-string 5) 16))
	(put-char-attribute (decode-builtin-char 'ideograph-gt gt-code)
			    (intern (format "ideograph-gt-pj-%d" plane))
			    code)
	)))
  (kill-buffer buf))

;;; mime-view.el ends here
