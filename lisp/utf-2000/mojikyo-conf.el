;;; mojikyo-conf.el --- Setting for Mojikyo related coded-charsets

;; Copyright (C) 2001,2002 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: UTF-2000, ISO/IEC 10646, Unicode, UCS-4, MULE.

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

(let ((i 1)
      name)
  (while (<= i 21)
    (setq name (intern (format "mojikyo-pj-%d" i)))
    (unless (memq name default-coded-charset-priority-list)
      (setq default-coded-charset-priority-list
	    (append default-coded-charset-priority-list
		    (list name))))
    (setq i (1+ i))))

(unless (memq 'mojikyo-2022-1 default-coded-charset-priority-list)
  (setq default-coded-charset-priority-list
	(append default-coded-charset-priority-list
		'(mojikyo-2022-1))))


(provide 'mojikyo-conf)

;;; mojikyo-conf.el ends here
