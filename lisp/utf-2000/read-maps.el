;;; read-maps.el --- Read mapping-tables.

;; Copyright (C) 2002,2003 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: mapping table, character, CCS, multiscript, multilingual

;; This file is part of XEmacs CHISE.

;; XEmacs CHISE is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs CHISE is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs CHISE; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

;;;###autoload
(defun mapping-table-read-file (filename)
  "Read mapping table." 
  (interactive "fMapping table : ")
  (with-temp-buffer
    (buffer-disable-undo)
    (insert-file-contents filename)
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
		     ucs-ccs '=ucs-jis-1990)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^JX1-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs '=jis-x0213-1-2000
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs '=ucs-jis-2000)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^JX2-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs '=jis-x0213-2-2000
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-jis)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^C1-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'chinese-cns11643-1
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-cns)
	       (goto-char (match-end 0))
	       )
	      ((looking-at "^C2-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs 'chinese-cns11643-2
		     code (string-to-int (match-string 1) 16)
		     ucs-pat "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)"
		     ucs-ccs 'ucs-cns)
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
	      ((looking-at "^JC3-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)")
	       (setq ccs '=jef-china3
		     code (string-to-int (match-string 1) 16)
		     ucs-pat nil
		     ucs-ccs nil)
	       (goto-char (match-end 0))
	       )
	      (t
	       (setq ccs nil
		     code nil
		     ucs-pat nil
		     ucs-ccs nil)
	       ))
	(setq ucs-code
	      (if (and ucs-pat
		       (looking-at ucs-pat))
		  (prog1
		      (string-to-int (match-string 1) 16)
		    (goto-char (match-end 0)))))
	(setq ucs
	      (if (looking-at
		   "[ \t]*U[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
		  (string-to-int (match-string 1) 16)))
	(when (setq chr (decode-char ccs code))
	  (unless (eq (encode-char chr ccs 'defined-only)
		      code)
	    (put-char-attribute chr ccs code))
	  (when (and ucs-code
		     (not (eq (or (encode-char chr ucs-ccs 'defined-only)
				  (get-char-attribute chr '=>ucs))
			      ucs-code)))
	    (put-char-attribute chr ucs-ccs ucs-code))
	  (when (and ucs
		     (not (eq (or (encode-char chr '=ucs 'defined-only)
				  (and (not (memq ucs-ccs '(ucs-jis
							    =ucs-jis-1990)))
				       (get-char-attribute chr '=>ucs)))
			      ucs)))
	    (if (or ucs-code (null ucs-ccs))
		(put-char-attribute chr '=>ucs ucs)
	      (unless (eq (encode-char chr ucs-ccs 'defined-only)
			  ucs)
		(put-char-attribute chr ucs-ccs ucs)))))
	(forward-line)))))


(provide 'read-maps)

;;; read-maps.el ends here
