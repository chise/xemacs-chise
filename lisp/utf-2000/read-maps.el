;;; read-maps.el --- Read mapping-tables.

;; Copyright (C) 2002 MORIOKA Tomohiko

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

(with-temp-buffer
  (buffer-disable-undo)
  (dolist (file '("J90-to-UCS.txt" "JSP-to-UCS.txt"
		  "JX1-to-UCS.txt" "JX2-to-UCS.txt"
		  ;; "C3-to-UCS.txt" ; "C4-to-UCS.txt"
		  "B-to-UCS.txt"))
    (insert-file-contents (expand-file-name file "../etc/char-data/"))
    (goto-char (point-min))
    (let (line ccs code ucs ucs-pat ucs-ccs ucs-code chr)
      (while (not (eobp))
	(cond ((looking-at "^J90-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'japanese-jisx0208-1990
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-jis)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^JSP-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'japanese-jisx0212
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-jis)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^JX1-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'japanese-jisx0213-1
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-jis)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^JX2-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'japanese-jisx0213-2
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-jis)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^C3-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'chinese-cns11643-3
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-cns)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^C4-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'chinese-cns11643-4
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-cns)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^B-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'chinese-big5
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tBU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-big5)
	       (goto-char (match-end 0))
	       )
	      (t
	       (setq ccs nil
		     code nil
		     ucs-pat nil
		     ucs-ccs nil)
	       ))
	(setq ucs-code
	      (if (looking-at ucs-pat)
		  (prog1
		      (string-to-int (match-string 1) 16)
		    (goto-char (match-end 0)))))
	(setq ucs
	      (if (looking-at
		   "[ \t]*U[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
		  (string-to-int (match-string 1) 16)))
	(when (setq chr (decode-char ccs code))
	  (unless (eq (get-char-attribute chr ccs) code)
	    (put-char-attribute chr ccs code))
	  (when (and ucs-code
		     (not (eq (or (get-char-attribute chr ucs-ccs)
				  (get-char-attribute chr 'ucs)
				  (get-char-attribute chr '=>ucs)
				  (get-char-attribute chr '->ucs))
			      ucs-code)))
	    (put-char-attribute chr ucs-ccs ucs-code))
	  (when (and ucs
		     (not (eq (or (get-char-attribute chr 'ucs)
				  (get-char-attribute chr '=>ucs)
				  (get-char-attribute chr '->ucs))
			      ucs)))
	    (put-char-attribute chr (if ucs-code
					'=>ucs
				      ucs-ccs) ucs)))
	(forward-line)))
    (erase-buffer)))

;;; read-maps.el ends here
