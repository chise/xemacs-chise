;;; userlock.el --- handle file access contention between multiple users

;; Copyright (C) 1985, 1986, 1993 Free Software Foundation, inc.

;; Maintainer: FSF
;; Keywords: internal

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

;;; Synched up with: FSF 19.34.

;;; Commentary:

;; This file is autoloaded to handle certain conditions
;; detected by the file-locking code within XEmacs.
;; The two entry points are `ask-user-about-lock' and
;; `ask-user-about-supersession-threat'.

;;; Code:

(define-error 'file-locked "File is locked" 'file-error) ; XEmacs

(defun ask-user-about-lock-minibuf (fn opponent)
  (save-window-excursion
    (let (answer)
      (while (null answer)
	(message "%s is locking %s: action (s, q, p, ?)? " opponent fn)
	(let ((tem (let ((inhibit-quit t)
			 (cursor-in-echo-area t))
		     (prog1 (downcase (read-char))
		            (setq quit-flag nil)))))
	  (if (= tem help-char)
	      (ask-user-about-lock-help)
	    (setq answer (assoc tem '((?s . t)
				      (?q . yield)
				      (?\C-g . yield)
				      (?p . nil)
				      (?? . help))))
	    (cond ((null answer)
		   (beep)
		   (message "Please type q, s, or p; or ? for help")
		   (sit-for 3))
		  ((eq (cdr answer) 'help)
		   (ask-user-about-lock-help)
		   (setq answer nil))
		  ((eq (cdr answer) 'yield)
		   (signal 'file-locked (list "File is locked" fn opponent)))))))
      (cdr answer))))

(defun ask-user-about-lock-help ()
  (with-output-to-temp-buffer "*Help*"
    (princ "It has been detected that you want to modify a file that someone else has
already started modifying in EMACS.

You can <s>teal the file; The other user becomes the
  intruder if (s)he ever unmodifies the file and then changes it again.
You can <p>roceed; you edit at your own (and the other user's) risk.
You can <q>uit; don't modify this file.")
    (save-excursion
      (set-buffer standard-output)
      (help-mode))))

(define-error 'file-supersession "File changed on disk" 'file-error) ; XEmacs

(defun ask-user-about-supersession-threat-minibuf (fn)
  (save-window-excursion
    (let (answer)
      (while (null answer)
	(message "%s changed on disk; really edit the buffer? (y, n, r or C-h) "
                 (file-name-nondirectory fn))
	(let ((tem (downcase (let ((cursor-in-echo-area t))
			       (read-char)))))
	  (setq answer
		(if (= tem help-char)
		    'help
		  (cdr (assoc tem '((?n . yield)
				    (?\C-g . yield)
				    (?y . proceed)
				    (?r . revert)
				    (?? . help))))))
	  (cond ((null answer)
		 (beep)
		 (message "Please type y, n or r; or ? for help")
		 (sit-for 3))
		((eq answer 'help)
		 (ask-user-about-supersession-help)
		 (setq answer nil))
		((eq answer 'revert)
		 (revert-buffer nil (not (buffer-modified-p)))
		 ; ask confirmation iff buffer modified
		 (signal 'file-supersession
			 (list "File reverted" fn)))
		((eq answer 'yield)
		 (signal 'file-supersession
			 (list "File changed on disk" fn))))))
      (message
        "File on disk now will become a backup file if you save these changes.")
      (setq buffer-backed-up nil))))

(defun ask-user-about-supersession-help ()
  (with-output-to-temp-buffer "*Help*"
    (princ "You want to modify a buffer whose disk file has changed
since you last read it in or saved it with this buffer.

If you say `y' to go ahead and modify this buffer,
you risk ruining the work of whoever rewrote the file.
If you say `r' to revert, the contents of the buffer are refreshed
from the file on disk.
If you say `n', the change you started to make will be aborted.

Usually, you should type `n' and then `M-x revert-buffer',
to get the latest version of the file, then make the change again.")
    (save-excursion
      (set-buffer standard-output)
      (help-mode))))

;;; dialog-box versions [XEmacs]

(defun ask-user-about-lock-dbox (fn opponent)
  (let ((echo-keystrokes 0)
	(dbox
	 (cons
	  (format "%s is locking %s\n
	It has been detected that you want to modify a file that
	someone else has already started modifying in XEmacs."
		  opponent fn)
	  '(["Steal Lock\n\nThe other user will\nbecome the intruder" steal t]
	    ["Proceed\n\nEdit file at your own\n\(and the other user's) risk"
	     proceed t]
	    nil
	    ["Abort\n\nDon't modify the buffer\n" yield t]))))
    (popup-dialog-box dbox)
    (catch 'aual-done
      (while t
	(let ((event (next-command-event)))
	  (cond ((and (misc-user-event-p event) (eq (event-object event) 'proceed))
		 (throw 'aual-done nil))
		((and (misc-user-event-p event) (eq (event-object event) 'steal))
		 (throw 'aual-done t))
		((and (misc-user-event-p event) (eq (event-object event) 'yield))
		 (signal 'file-locked (list "File is locked" fn opponent)))
		((button-release-event-p event) ;; don't beep twice
		 nil)
		(t
		 (beep)
		 (message "please answer the dialog box"))))))))

(defun ask-user-about-supersession-threat-dbox (fn)
  (let ((echo-keystrokes 0)
	(dbox
	 (cons
	  (format "File %s has changed on disk
since its buffer was last read in or saved.

Do you really want to edit the buffer? " fn)
	  '(["Yes\n\nEdit the buffer anyway,\nignoring the disk file"
	     proceed t]
	    ["No\n\nDon't modify the buffer\n" yield t]
	    nil
	    ["No\n\nDon't modify the buffer\nbut revert it" revert t]
	    ))))
    (popup-dialog-box dbox)
    (catch 'auast-done
      (while t
	(let ((event (next-command-event)))
	  (cond ((and (misc-user-event-p event) (eq (event-object event) 'proceed))
		 (throw 'auast-done nil))
		((and (misc-user-event-p event) (eq (event-object event) 'yield))
		 (signal 'file-supersession (list fn)))
		((and (misc-user-event-p event) (eq (event-object event) 'revert))
		 (or (equal fn (buffer-file-name))
		     (error
		      "ask-user-about-supersession-threat called bogusly"))
		 (revert-buffer nil t)
		 (signal 'file-supersession
			 (list fn "(reverted)")))
		((button-release-event-p event) ;; don't beep twice
		 nil)
		(t
		 (beep)
		 (message "please answer the dialog box"))))))))


;;; top-level

;;;###autoload
(defun ask-user-about-lock (fn opponent)
  "Ask user what to do when he wants to edit FILE but it is locked by USER.
This function has a choice of three things to do:
  do (signal 'file-locked (list FILE USER))
    to refrain from editing the file
  return t (grab the lock on the file)
  return nil (edit the file even though it is locked).
You can rewrite it to use any criterion you like to choose which one to do."
  (discard-input)
  (if (and (fboundp 'popup-dialog-box)
	   (or (button-press-event-p last-command-event)
	       (button-release-event-p last-command-event)
	       (misc-user-event-p last-command-event)))
      (ask-user-about-lock-dbox fn opponent)
    (ask-user-about-lock-minibuf fn opponent)))

;;;###autoload
(defun ask-user-about-supersession-threat (fn)
  "Ask a user who is about to modify an obsolete buffer what to do.
This function has two choices: it can return, in which case the modification
of the buffer will proceed, or it can (signal 'file-supersession (file)),
in which case the proposed buffer modification will not be made.

You can rewrite this to use any criterion you like to choose which one to do.
The buffer in question is current when this function is called."
  (discard-input)
  (if (and (fboundp 'popup-dialog-box)
	   (or (button-press-event-p last-command-event)
	       (button-release-event-p last-command-event)
	       (misc-user-event-p last-command-event)))
      (ask-user-about-supersession-threat-dbox fn)
    (ask-user-about-supersession-threat-minibuf fn)))

;;; userlock.el ends here
