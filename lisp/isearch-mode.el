;;; isearch-mode.el --- Incremental search minor mode.

;; Copyright (C) 1992, 1993, 1997 Free Software Foundation, Inc.

;; Author: Daniel LaLiberte <liberte@cs.uiuc.edu>
;; Maintainer: XEmacs Development Team
;; Keywords: extensions, dumped

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
;; along with XEmacs; see the file COPYING.  If not, write to the 
;; Free Software Foundation, 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Synched up with: Not synched with FSF.

;;; Commentary:

;; LCD Archive Entry:
;; isearch-mode|Daniel LaLiberte|liberte@cs.uiuc.edu
;; |A minor mode replacement for isearch.el.

;;====================================================================
;; Instructions

;; Searching with isearch-mode.el should work just like isearch.el,
;; except it is done in a temporary minor mode that terminates when
;; you finish searching.

;; Semi-modal searching is supported, using a recursive edit. If
;; isearching is started non-interactively by calling one of the
;; isearch commands (e.g. (isearch-forward), but not like gnus does
;; it: (call-interactively 'isearch-forward)), isearch-mode does not
;; return until the search is completed.  You should still be able
;; switch buffers, so be careful not to get things confused.

;; The key bindings active within isearch-mode are defined below in
;; `isearch-mode-map' which is given bindings close to the default
;; characters of isearch.el for version 19.  With `isearch-mode',
;; however, you can bind multi-character keys and it should be easier
;; to add new commands.  One bug though: keys with meta-prefix cannot
;; be longer than two chars.  Also see minibuffer-local-isearch-map
;; for bindings active during `isearch-edit-string'.

;; The search ring and completion commands automatically put you in
;; the minibuffer to edit the string.  This gives you a chance to
;; modify the search string before executing the search.  There are
;; three commands to terminate the editing: C-s and C-r exit the
;; minibuffer and search forward and reverse respectively, while C-m
;; exits and does a nonincremental search.

;; Exiting immediately from isearch uses isearch-edit-string instead
;; of nonincremental-search, if search-nonincremental-instead is non-nil.
;; The name of this option should probably be changed if we decide to
;; keep the behavior.  One difference is that isearch-edit-string does
;; not support word search yet; perhaps isearch-mode should support it
;; even for incremental searches, but how?

;;====================================================================
;;; Change History:

;; Header: /import/kaplan/kaplan/liberte/Isearch/RCS/isearch-mode.el,v 1.3 92/06/29 13:10:08 liberte Exp Locker: liberte 
;; Log:	isearch-mode.el,v 
;;
;; 20-aug-92  Hacked by jwz for Lucid Emacs 19.3.
;;
;; Revision 1.3  92/06/29  13:10:08  liberte
;; Moved modal isearch-mode handling into isearch-mode.
;; Got rid of buffer-local isearch variables.
;; isearch-edit-string used by ring adjustments, completion, and
;; nonincremental searching.  C-s and C-r are additional exit commands.
;; Renamed all regex to regexp.
;; Got rid of found-start and found-point globals.
;; Generalized handling of upper-case chars.
 
;; Revision 1.2  92/05/27  11:33:57  liberte
;; Emacs version 19 has a search ring, which is supported here.
;; Other fixes found in the version 19 isearch are included here.
;;
;; Also see variables search-caps-disable-folding,
;; search-nonincremental-instead, search-whitespace-regexp, and
;; commands isearch-toggle-regexp, isearch-edit-string.
;;
;; semi-modal isearching is supported.

;; Changes for 1.1
;; 3/18/92 Fixed invalid-regexp.
;; 3/18/92 Fixed yanking in regexps.

;;; Code:

(defgroup isearch nil
  "Incremental search"
  :prefix "search-"
  :group 'matching)


(defun isearch-char-to-string (c)
  (if (eventp c) 
      (make-string 1 (event-to-character c nil nil t))
    (make-string 1 c)))

;(defun isearch-text-char-description (c)
;  (isearch-char-to-string c))

(define-function 'isearch-text-char-description 'text-char-description)


;;;=========================================================================
;;; User-accessible variables

(defvar search-last-string ""
  "Last string search for by a search command.
This does not include direct calls to the primitive search functions,
and does not include searches that are aborted.")

(defvar search-last-regexp ""
  "Last string searched for by a regexp search command.
This does not include direct calls to the primitive search functions,
and does not include searches that are aborted.")

(defconst search-exit-option t
  "Non-nil means random control characters terminate incremental search.")

(defcustom search-slow-window-lines 1
  "*Number of lines in slow search display windows.
These are the short windows used during incremental search on slow terminals.
Negative means put the slow search window at the top (normally it's at bottom)
and the value is minus the number of lines."
  :type 'integer
  :group 'isearch)

(defcustom search-slow-speed 1200
  "*Highest terminal speed at which to use \"slow\" style incremental search.
This is the style where a one-line window is created to show the line
that the search has reached."
  :type 'integer
  :group 'isearch)

(defcustom search-nonincremental-instead t
  "*If non-nil, do a nonincremental search instead if exiting immediately."
  :type 'boolean
  :group 'isearch)
  
(defcustom search-whitespace-regexp "\\(\\s \\|[\n\r]\\)+"
  "*If non-nil, regular expression to match a sequence of whitespace chars."
  :type 'regexp
  :group 'isearch)

;;;==================================================================
;;; Search ring.

(defvar search-ring nil
  "List of search string sequences.")
(defvar regexp-search-ring nil
  "List of regular expression search string sequences.")

(defcustom search-ring-max 16
  "*Maximum length of search ring before oldest elements are thrown away."
  :type 'integer
  :group 'isearch)
(defcustom regexp-search-ring-max 16
  "*Maximum length of regexp search ring before oldest elements are thrown away."
  :type 'integer
  :group 'isearch)

(defvar search-ring-yank-pointer nil
  "The tail of the search ring whose car is the last thing searched for.")
(defvar regexp-search-ring-yank-pointer nil
  "The tail of the regular expression search ring whose car is the last
thing searched for.")

;;;====================================================
;;; Define isearch-mode keymap.

(defvar isearch-mode-map 
  (let ((map (make-keymap)))
    (set-keymap-name map 'isearch-mode-map)

    ;; Bind all printing characters to `isearch-printing-char'.
    ;; This isn't normally necessary, but if a printing character were 
    ;; bound to something other than self-insert-command in global-map, 
    ;; then it would terminate the search and be executed without this.
    (let ((i 32)
	  (str (make-string 1 0)))
      (while (< i 127)
	(aset str 0 i)
	(define-key map str 'isearch-printing-char)
	(setq i (1+ i))))
    (define-key map "\t" 'isearch-printing-char)

    ;; Several non-printing chars change the searching behavior.
    ;;
    (define-key map "\C-s" 'isearch-repeat-forward)
    (define-key map "\M-\C-s" 'isearch-repeat-forward)
    (define-key map "\C-r" 'isearch-repeat-backward)
    (define-key map "\C-g" 'isearch-abort)

    (define-key map "\C-q" 'isearch-quote-char)

    (define-key map "\C-m" 'isearch-exit)
    (define-key map "\C-j" 'isearch-printing-char)
    (define-key map "\t" 'isearch-printing-char)

    (define-key map "\C-w" 'isearch-yank-word)
    (define-key map "\C-y" 'isearch-yank-line)
    (define-key map "\M-y" 'isearch-yank-kill)

    ;; Define keys for regexp chars * ? |
    (define-key map "*" 'isearch-*-char)
    (define-key map "?" 'isearch-*-char)
    (define-key map "|" 'isearch-|-char)

    ;; Some bindings you may want to put in your isearch-mode-hook.
    ;; Suggest some alternates...
    ;; (define-key map "\C-t" 'isearch-toggle-regexp)
    ;; (define-key map "\C-^" 'isearch-edit-string)

    ;; delete and backspace delete backward, f1 is help, and C-h can be either
    (define-key map 'delete 'isearch-delete-char)
    (define-key map 'backspace 'isearch-delete-char)
    (define-key map '(control h) 'isearch-help-or-delete-char)
    (define-key map 'f1 'isearch-mode-help)
    (define-key map 'help 'isearch-mode-help)

    (define-key map "\M-n" 'isearch-ring-advance)
    (define-key map "\M-p" 'isearch-ring-retreat)
    (define-key map "\M- " 'isearch-whitespace-chars)
    (define-key map "\M-\t" 'isearch-complete)

    (define-key map 'button2 'isearch-yank-x-selection)

    map)
  "Keymap for isearch-mode.")

(defvar minibuffer-local-isearch-map 
  (let ((map (make-sparse-keymap)))
    ;; #### - this should also be minor-mode-ified
    (set-keymap-parents map (list minibuffer-local-map))
    (set-keymap-name map 'minibuffer-local-isearch-map)

    ;;#### This should just arrange to use the usual Emacs minibuffer histories
    (define-key map "\r" 'isearch-nonincremental-exit-minibuffer)
    (define-key map "\M-n" 'isearch-ring-advance-edit)
    (define-key map "\M-p" 'isearch-ring-retreat-edit)
    (define-key map "\M-\t" 'isearch-complete-edit)
    (define-key map "\C-s" 'isearch-forward-exit-minibuffer)
    (define-key map "\C-r" 'isearch-reverse-exit-minibuffer)
    map)
  "Keymap for editing isearch strings in the minibuffer.")

;;;========================================================
;; Internal variables declared globally for byte-compiler.
;; These are all bound locally while editing the search string.

(defvar isearch-forward nil)	; Searching in the forward direction.
(defvar isearch-regexp nil)	; Searching for a regexp.
(defvar isearch-word nil)	; Searching for words.

(defvar isearch-cmds nil)   ; Stack of search status sets.
(defvar isearch-string "")  ; The current search string.
(defvar isearch-message "") ; text-char-description version of isearch-string

(defvar isearch-success t)		; Searching is currently successful.
(defvar isearch-invalid-regexp nil)	; Regexp not well formed.
(defvar isearch-other-end nil)	; Start (end) of match if forward (backward).
(defvar isearch-wrapped nil)	; Searching restarted from the top (bottom).
(defvar isearch-barrier 0)
(defvar isearch-just-started nil)
(defvar isearch-buffer nil)	; the buffer we've frobbed the keymap of

(defvar isearch-case-fold-search nil)

(defvar isearch-adjusted nil)
(defvar isearch-slow-terminal-mode nil)
;;; If t, using a small window.
(defvar isearch-small-window nil)
(defvar isearch-opoint 0)
;;; The window configuration active at the beginning of the search.
(defvar isearch-window-configuration nil)
(defvar isearch-selected-frame nil)

;; Flag to indicate a yank occurred, so don't move the cursor.
(defvar isearch-yank-flag nil)

;;; A function to be called after each input character is processed.
;;; (It is not called after characters that exit the search.)
;;; It is only set from an optional argument to `isearch-mode'.
(defvar isearch-op-fun nil)

;;;  Is isearch-mode in a recursive edit for modal searching.
(defvar isearch-recursive-edit nil)

;;; Should isearch be terminated after doing one search?
(defvar isearch-nonincremental nil)

;; New value of isearch-forward after isearch-edit-string.
(defvar isearch-new-forward nil)


(defvar isearch-mode-hook nil
  "Function(s) to call after starting up an incremental search.")

(defvar isearch-mode-end-hook nil
  "Function(s) to call after terminating an incremental search.")

;;;==============================================================
;; Minor-mode-alist changes - kind of redundant with the
;; echo area, but if isearching in multiple windows, it can be useful.

(add-minor-mode 'isearch-mode 'isearch-mode)

(defvar isearch-mode nil)
(make-variable-buffer-local 'isearch-mode)

;;;===============================================================
;;; Entry points to isearch-mode.
;;; These four functions should replace those in loaddefs.el
;;; An alternative is to fset isearch-forward etc to isearch-mode,
;;; and look at the last command to set the options accordingly.

(defun isearch-forward (&optional regexp-p)
  "Do incremental search forward.
With a prefix argument, do an incremental regular expression search instead.
\\<isearch-mode-map>
As you type characters, they add to the search string and are found.
The following non-printing keys are bound in `isearch-mode-map'.  

Type \\[isearch-delete-char] to cancel characters from end of search string.
Type \\[isearch-exit] to exit, leaving point at location found.
Type LFD (C-j) to match end of line.
Type \\[isearch-repeat-forward] to search again forward,\
 \\[isearch-repeat-backward] to search again backward.
Type \\[isearch-yank-word] to yank word from buffer onto end of search\
 string and search for it.
Type \\[isearch-yank-line] to yank rest of line onto end of search string\
 and search for it.
Type \\[isearch-quote-char] to quote control character to search for it.
Type \\[isearch-whitespace-chars] to match all whitespace chars in regexp.
\\[isearch-abort] while searching or when search has failed cancels input\
 back to what has
 been found successfully.
\\[isearch-abort] when search is successful aborts and moves point to\
 starting point.

Also supported is a search ring of the previous 16 search strings.
Type \\[isearch-ring-advance] to search for the next item in the search ring.
Type \\[isearch-ring-retreat] to search for the previous item in the search\
 ring.
Type \\[isearch-complete] to complete the search string using the search ring.

The above keys are bound in the isearch-mode-map.  To change the keys which
 are special to isearch-mode, simply change the bindings in that map.

Other control and meta characters terminate the search
 and are then executed normally (depending on `search-exit-option').

If this function is called non-interactively, it does not return to
the calling function until the search is done.

The bindings, more precisely:
\\{isearch-mode-map}"

;; Non-standard bindings
;; Type \\[isearch-toggle-regexp] to toggle regular expression with normal searching.
;; Type \\[isearch-edit-string] to edit the search string in the minibuffer.
;;  Terminate editing and return to incremental searching with CR.

  (interactive "_P")
  (isearch-mode t (not (null regexp-p)) nil (not (interactive-p))))

(defun isearch-forward-regexp ()
  "\
Do incremental search forward for regular expression.
Like ordinary incremental search except that your input
is treated as a regexp.  See \\[isearch-forward] for more info."
  (interactive "_")
  (isearch-mode t t nil (not (interactive-p))))

(defun isearch-backward (&optional regexp-p)
  "\
Do incremental search backward.
With a prefix argument, do an incremental regular expression search instead.
See \\[isearch-forward] for more information."
  (interactive "_P")
  (isearch-mode nil (not (null regexp-p)) nil (not (interactive-p))))

(defun isearch-backward-regexp ()
  "\
Do incremental search backward for regular expression.
Like ordinary incremental search except that your input
is treated as a regexp.  See \\[isearch-forward] for more info."
  (interactive "_")
  (isearch-mode nil t nil (not (interactive-p))))

;; This function is way wrong, because you can't scroll the help
;; screen; as soon as you press a key, it's gone.  I don't know of a
;; good way to fix it, though.  -hniksic
(defun isearch-mode-help ()
  (interactive "_")
  (let ((w (selected-window)))
    (describe-function 'isearch-forward)
    (select-window w))
  (isearch-update))


;;;==================================================================
;; isearch-mode only sets up incremental search for the minor mode.
;; All the work is done by the isearch-mode commands.

(defun isearch-mode (forward &optional regexp op-fun recursive-edit word-p)
  "Start isearch minor mode.  Called by isearch-forward, etc."

  (if executing-kbd-macro (setq recursive-edit nil))

  (let ((inhibit-quit t)) ; don't leave things in an inconsistent state...

    ;; Initialize global vars.
    (setq isearch-buffer (current-buffer)
	  isearch-forward forward
	  isearch-regexp regexp
	  isearch-word word-p
	  isearch-op-fun op-fun
	  isearch-case-fold-search case-fold-search
	  isearch-string ""
	  isearch-message ""
	  isearch-cmds nil
	  isearch-success t
	  isearch-wrapped nil
	  isearch-barrier (point)
	  isearch-adjusted nil
	  isearch-yank-flag nil
	  isearch-invalid-regexp nil
	  isearch-slow-terminal-mode (and (<= (device-baud-rate)
					      search-slow-speed)
					  (> (window-height)
					     (* 4 search-slow-window-lines)))
	  isearch-other-end nil
	  isearch-small-window nil
	  isearch-just-started t

	  isearch-opoint (point)
	  isearch-window-configuration (current-window-configuration)

	  ;; #### Should we remember the old value of
	  ;; overriding-local-map?
 	  overriding-local-map (progn
 				 (set-keymap-parents isearch-mode-map
 				  (nconc (current-minor-mode-maps)
					 (and (current-local-map)
					      (list (current-local-map)))))
 				 isearch-mode-map)
	  isearch-selected-frame (selected-frame)

	  isearch-mode (gettext " Isearch")
	  )

    ;; XEmacs change: without clearing the match data, sometimes old values
    ;; of isearch-other-end get used.  Don't ask me why...
    (store-match-data nil)

    (add-hook 'pre-command-hook 'isearch-pre-command-hook)
    (set-buffer-modified-p (buffer-modified-p)) ; update modeline
    (isearch-push-state)

    ) ; inhibit-quit is t before here

  (isearch-update)
  (run-hooks 'isearch-mode-hook)

  ;; isearch-mode can be made modal (in the sense of not returning to 
  ;; the calling function until searching is completed) by entering 
  ;; a recursive-edit and exiting it when done isearching.
  (if recursive-edit
      (let ((isearch-recursive-edit t))
	(recursive-edit)))
  )


;;;====================================================
;; Some high level utilities.  Others below.

(defun isearch-update ()
  ;; Called after each command to update the display.  
  (if (null unread-command-event)
      (progn
	(if (not (input-pending-p))
	    (isearch-message))
	(if (and isearch-slow-terminal-mode
		 (not (or isearch-small-window 
			  (pos-visible-in-window-p))))
	    (let ((found-point (point)))
	      (setq isearch-small-window t)
	      (move-to-window-line 0)
	      (let ((window-min-height 1))
		(split-window nil (if (< search-slow-window-lines 0)
				      (1+ (- search-slow-window-lines))
				    (- (window-height)
				       (1+ search-slow-window-lines)))))
	      (if (< search-slow-window-lines 0)
		  (progn (vertical-motion (- 1 search-slow-window-lines))
			 (set-window-start (next-window) (point))
			 (set-window-hscroll (next-window)
					     (window-hscroll))
			 (set-window-hscroll (selected-window) 0))
		(other-window 1))
	      (goto-char found-point)))
	(if isearch-other-end
	    (if (< isearch-other-end (point))
		(isearch-highlight isearch-other-end (point))
	      (isearch-highlight (point) isearch-other-end))
	  (if (extentp isearch-extent)
	      (isearch-dehighlight nil)))
	))
  (setq ;; quit-flag nil  not for isearch-mode
   isearch-adjusted nil
   isearch-yank-flag nil)
  )


(defun isearch-done ()
  ;; Called by all commands that terminate isearch-mode.
  (let ((inhibit-quit t)) ; danger danger!
    (if (and isearch-buffer (buffer-live-p isearch-buffer))
	(save-excursion
	  ;; Some loser process filter might have switched the
	  ;; window's buffer, so be sure to set these variables back
	  ;; in the buffer we frobbed them in.  But only if the buffer
	  ;; is still alive.
	  (set-buffer isearch-buffer)
	  ;; #### Should we restore the old value of
	  ;; overriding-local-map?
	  (setq overriding-local-map nil)
	  ;; Use remove-hook instead of just setting it to our saved value
	  ;; in case some process filter has created a buffer and modified
	  ;; the pre-command-hook in that buffer...  yeah, this is obscure,
	  ;; and yeah, I was getting screwed by it. -jwz
	  (remove-hook 'pre-command-hook 'isearch-pre-command-hook)
	  (set-keymap-parents isearch-mode-map nil)
	  (setq isearch-mode nil)
	  (set-buffer-modified-p (buffer-modified-p));; update modeline
	  (isearch-dehighlight t)))

    ;; it's not critical that this be inside inhibit-quit, but leaving
    ;; things in small-window-mode would be bad.
    (let ((found-start (window-start (selected-window)))
	  (found-point (point)))
      (cond ((eq (selected-frame) isearch-selected-frame)
	     (set-window-configuration isearch-window-configuration)

	     (if isearch-small-window
		 (goto-char found-point)
	       ;; Exiting the save-window-excursion clobbers
	       ;; window-start; restore it.
	       (set-window-start (selected-window) found-start t))))
      ;; If there was movement, mark the starting position.
      ;; Maybe should test difference between and set mark iff > threshold.
      (if (and (buffer-live-p isearch-buffer)
	       (/= (point isearch-buffer) isearch-opoint))
	  (progn
	    (push-mark isearch-opoint t nil isearch-buffer)
	    (or executing-kbd-macro (> (minibuffer-depth) 0)
		(display-message 'command "Mark saved where search started"))))
	)
    (setq isearch-buffer nil)
    ) ; inhibit-quit is t before here

  (if (> (length isearch-string) 0)
      ;; Update the ring data.
      (if isearch-regexp 
	  (if (not (setq regexp-search-ring-yank-pointer
			 (member isearch-string regexp-search-ring)))
	      (progn
		(setq regexp-search-ring
		      (cons isearch-string regexp-search-ring)
		      regexp-search-ring-yank-pointer regexp-search-ring)
		(if (> (length regexp-search-ring) regexp-search-ring-max)
		    (setcdr (nthcdr (1- regexp-search-ring-max) regexp-search-ring)
			    nil))))
	(if (not (setq search-ring-yank-pointer
		       ;; really need equal test instead of eq.
		       (member isearch-string search-ring)))
	    (progn
	      (setq search-ring (cons isearch-string search-ring)
		    search-ring-yank-pointer search-ring)
	      (if (> (length search-ring) search-ring-max)
		  (setcdr (nthcdr (1- search-ring-max) search-ring) nil))))))

  (run-hooks 'isearch-mode-end-hook)
  (if isearch-recursive-edit (exit-recursive-edit)))


;;;====================================================
;; Commands active while inside of the isearch minor mode.

(defun isearch-exit ()
  "Exit search normally.
However, if this is the first command after starting incremental
search and `search-nonincremental-instead' is non-nil, do an
incremental search via `isearch-edit-string'."
  (interactive)
  (if (and search-nonincremental-instead 
	   (= 0 (length isearch-string)))
      (let ((isearch-nonincremental t))
	(isearch-edit-string))
    (isearch-done)))


(defun isearch-edit-string ()
  "Edit the search string in the minibuffer.
The following additional command keys are active while editing.
\\<minibuffer-local-isearch-map>
\\[exit-minibuffer] to exit editing and resume incremental searching.
\\[isearch-forward-exit-minibuffer] to resume isearching forward.
\\[isearch-backward-exit-minibuffer] to resume isearching backward.
\\[isearch-ring-advance-edit] to replace the search string with the next\
 item in the search ring.
\\[isearch-ring-retreat-edit] to replace the search string with the next\
 item in the search ring.
\\[isearch-complete-edit] to complete the search string from the search ring."

  ;; Editing doesn't back up the search point.  Should it?
  (interactive)

  (condition-case nil
      (let ((minibuffer-local-map minibuffer-local-isearch-map)
	    isearch-nonincremental	; should search nonincrementally?
	    isearch-new-string
	    isearch-new-message
	    (isearch-new-forward isearch-forward)

	    ;; Locally bind all isearch global variables to protect them
	    ;; from recursive isearching.
	    (isearch-string isearch-string)
	    (isearch-message isearch-message)
	    (isearch-forward isearch-forward) ; set by commands below.

	    (isearch-forward isearch-forward)
	    (isearch-regexp isearch-regexp)
	    (isearch-word isearch-word)
	    (isearch-op-fun isearch-op-fun)
	    (isearch-cmds isearch-cmds)
	    (isearch-success isearch-success)
	    (isearch-wrapped isearch-wrapped)
	    (isearch-barrier isearch-barrier)
	    (isearch-adjusted isearch-adjusted)
	    (isearch-yank-flag isearch-yank-flag)
	    (isearch-invalid-regexp isearch-invalid-regexp)
	    (isearch-other-end isearch-other-end)
	    (isearch-opoint isearch-opoint)
	    (isearch-slow-terminal-mode isearch-slow-terminal-mode)
	    (isearch-small-window isearch-small-window)
	    (isearch-recursive-edit isearch-recursive-edit)
	    (isearch-window-configuration (current-window-configuration))
	    (isearch-selected-frame (selected-frame))
	    )
	;; Actually terminate isearching until editing is done.
	;; This is so that the user can do anything without failure, 
	;; like switch buffers and start another isearch, and return.
;;	(condition-case nil
	    (isearch-done)
          ;;#### What does this mean?  There is no such condition!
;;	  (exit nil))			; was recursive editing

	(unwind-protect
	    (let ((prompt (isearch-message-prefix nil t))
                  event)
	      ;; If the first character the user types when we prompt them
	      ;; for a string is the yank-word character, then go into
	      ;; word-search mode.  Otherwise unread that character and
	      ;; read a string the normal way.
	      (let ((cursor-in-echo-area t))
		(display-message 'prompt prompt)
		(setq event (next-command-event))
		(if (eq 'isearch-yank-word
			(lookup-key isearch-mode-map (vector event)))
		    (setq isearch-word t)
		  (setq unread-command-event event)))
	      (setq isearch-new-string
;;                    (if (fboundp 'gmhist-old-read-from-minibuffer)
;;                        ;; Eschew gmhist crockery
;;			(gmhist-old-read-from-minibuffer prompt isearch-string)
		      (read-string
		       prompt isearch-string
		       't            ;does its own history (but shouldn't)
;;                     (if isearch-regexp
;;                         ;; The search-rings aren't exactly minibuffer
;;                         ;;  histories, but they are close enough
;;                         (cons 'regexp-search-ring
;;                               (- (length regexp-search-ring-yank-pointer)
;;                                  (length regexp-search-ring)))
;;                         (cons 'search-ring
;;                               (- (length search-ring-yank-pointer)
;;                                  (length search-ring))))
		       )
;;		      )
		    isearch-new-message (mapconcat
					 'isearch-text-char-description
					 isearch-new-string ""))
	      )
	  ;; Always resume isearching by restarting it.
	  (isearch-mode isearch-forward 
			isearch-regexp 
			isearch-op-fun 
			isearch-recursive-edit
			isearch-word)
	  )

	;; Copy new values in outer locals to isearch globals
	(setq isearch-string isearch-new-string
	      isearch-message isearch-new-message
	      isearch-forward isearch-new-forward)

	;; Empty isearch-string means use default.
	(if (= 0 (length isearch-string))
	    (setq isearch-string (if isearch-regexp search-last-regexp
				   search-last-string))
	  ;; Set last search string now so it is set even if we fail.
	  (if search-last-regexp
	      (setq search-last-regexp isearch-string)
	    (setq search-last-string isearch-string)))

	;; Reinvoke the pending search.
	(isearch-push-state)
	(isearch-search)
	(isearch-update)
	(if isearch-nonincremental (isearch-done)))

    (quit  ; handle abort-recursive-edit
     (isearch-abort)  ;; outside of let to restore outside global values
     )))

(defun isearch-nonincremental-exit-minibuffer ()
  (interactive)
  (setq isearch-nonincremental t)
  (exit-minibuffer))

(defun isearch-forward-exit-minibuffer ()
  (interactive)
  (setq isearch-new-forward t)
  (exit-minibuffer))

(defun isearch-reverse-exit-minibuffer ()
  (interactive)
  (setq isearch-new-forward nil)
  (exit-minibuffer))


(defun isearch-abort ()
  "Quit incremental search mode if searching is successful, signalling quit.
Otherwise, revert to previous successful search and continue searching.
Use `isearch-exit' to quit without signalling."
  (interactive)
;;  (ding)  signal instead below, if quiting
  (discard-input)
  (if isearch-success
      ;; If search is successful, move back to starting point
      ;; and really do quit.
      (progn (goto-char isearch-opoint)
	     (isearch-done)   ; exit isearch
	     (signal 'quit '(isearch)))  ; and pass on quit signal
    ;; If search is failing, rub out until it is once more successful.
    (while (not isearch-success) (isearch-pop-state))
    (isearch-update)))


(defun isearch-repeat (direction)
  ;; Utility for isearch-repeat-forward and -backward.
  (if (eq isearch-forward (eq direction 'forward))
      ;; C-s in forward or C-r in reverse.
      (if (equal isearch-string "")
	  ;; If search string is empty, use last one.
	  (setq isearch-string
		(or (if isearch-regexp
			(if regexp-search-ring-yank-pointer
			    (car regexp-search-ring-yank-pointer)
			  (car regexp-search-ring))
		      (if search-ring-yank-pointer
			  (car search-ring-yank-pointer)
			(car search-ring)))
		    "")
		isearch-message
		(mapconcat 'isearch-text-char-description
			   isearch-string ""))
	;; If already have what to search for, repeat it.
	(or isearch-success
	    (progn 

	      (goto-char (if isearch-forward (point-min) (point-max)))
	      (setq isearch-wrapped t))))
    ;; C-s in reverse or C-r in forward, change direction.
    (setq isearch-forward (not isearch-forward)))

  (setq isearch-barrier (point)) ; For subsequent \| if regexp.
  (if (equal isearch-string "")
      (setq isearch-success t)
    (if (and (equal (match-end 0) (match-beginning 0))
	     isearch-success
	     (not isearch-just-started))
	;; If repeating a search that found
	;; an empty string, ensure we advance.
	(if (if isearch-forward (eobp) (bobp))
	    ;; nowhere to advance to, so fail (and wrap next time)
	    (progn
	      (setq isearch-success nil)
	      (and executing-kbd-macro
		   (not defining-kbd-macro)
		   (isearch-done))
	      (ding nil 'isearch-failed))
	  (forward-char (if isearch-forward 1 -1))
	  (isearch-search))
      (isearch-search)))
  (isearch-push-state)
  (isearch-update))

(defun isearch-repeat-forward ()
  "Repeat incremental search forwards."
  (interactive)
  (isearch-repeat 'forward))

(defun isearch-repeat-backward ()
  "Repeat incremental search backwards."
  (interactive)
  (isearch-repeat 'backward))

(defun isearch-toggle-regexp ()
  "Toggle regexp searching on or off."
  ;; The status stack is left unchanged.
  (interactive)
  (setq isearch-regexp (not isearch-regexp))
  (if isearch-regexp (setq isearch-word nil))
  (isearch-update))

(defun isearch-toggle-case-fold ()
  "Toggle case folding in searching on or off."
  (interactive)
  (setq isearch-case-fold-search
	(if isearch-case-fold-search nil 'yes))
  (message "%s%s [case %ssensitive]"
	   (isearch-message-prefix)
	   isearch-message
	   (if isearch-case-fold-search "in" ""))
  (setq isearch-adjusted t)
  (sit-for 1)
  (isearch-update))

(defun isearch-delete-char ()
  "Discard last input item and move point back.  
If no previous match was done, just beep."
  (interactive)
  (if (null (cdr isearch-cmds))
      (ding nil 'isearch-quit)
    (isearch-pop-state))
  (isearch-update))

(defun isearch-help-or-delete-char ()
  "Show Isearch help or delete backward in the search string.
Deletes when `delete-key-deletes-forward' is t and C-h is used for deleting
backwards."
  (interactive)
  (if (and delete-key-deletes-forward
           (case (device-type)
             ('tty (eq tty-erase-char ?\C-h))
             ('x (not (x-keysym-on-keyboard-sans-modifiers-p 'backspace)))))
      (isearch-delete-char)
    (isearch-mode-help)))

(defun isearch-yank (chunk)
  ;; Helper for isearch-yank-* functions.  CHUNK can be a string or a
  ;; function.
  (let ((word (if (stringp chunk)
		  chunk
		(save-excursion
		  (and (not isearch-forward) isearch-other-end
		       (goto-char isearch-other-end))
		  (buffer-substring
		   (point)
		   (save-excursion
		     (funcall chunk)
		     (point)))))))
    ;; if configured so that typing upper-case characters turns off case
    ;; folding, then downcase the string so that yanking an upper-case
    ;; word doesn't mess with case-foldedness.
    (if (and search-caps-disable-folding isearch-case-fold-search)
	(setq word (downcase word)))
    (if isearch-regexp (setq word (regexp-quote word)))
    (setq isearch-string (concat isearch-string word)
	  isearch-message
	  (concat isearch-message
		  (mapconcat 'isearch-text-char-description
			     word ""))
	  ;; Don't move cursor in reverse search.
	  isearch-yank-flag t))
  (isearch-search-and-update))


(defun isearch-yank-word ()
  "Pull next word from buffer into search string."
  (interactive)
  (isearch-yank (function (lambda () (forward-word 1)))))

(defun isearch-yank-line ()
  "Pull rest of line from buffer into search string."
  (interactive)
  (isearch-yank 'end-of-line))

(defun isearch-yank-kill ()
  "Pull rest of line from kill ring into search string."
  (interactive)
  (isearch-yank (current-kill 0)))

(defun isearch-yank-sexp ()
  "Pull next expression from buffer into search string."
  (interactive)
  (isearch-yank 'forward-sexp))

(defun isearch-yank-x-selection ()
  "Pull the current X selection into the search string."
  (interactive)
  (isearch-yank (x-get-selection)))

(defun isearch-yank-x-clipboard ()
  "Pull the current X clipboard selection into the search string."
  (interactive)
  (isearch-yank (x-get-clipboard)))

(defun isearch-fix-case ()
  (if (and isearch-case-fold-search search-caps-disable-folding)
      (setq isearch-case-fold-search 
	    (no-upper-case-p isearch-string isearch-regexp)))
  (setq isearch-mode (if case-fold-search
                         (if isearch-case-fold-search
                             " Isearch"  ;As God Intended Mode
			   " ISeARch") ;Warn about evil case via StuDLYcAps.
		       "Isearch"
;		         (if isearch-case-fold-search
;                            " isearch"    ;Presumably case-sensitive losers
;                                          ;will notice this 1-char difference.
;                            " Isearch")   ;Weenie mode.
			 )))

(defun isearch-search-and-update ()
  ;; Do the search and update the display.
  (if (and (not isearch-success)
	   ;; unsuccessful regexp search may become
	   ;;  successful by addition of characters which
	   ;;  make isearch-string valid
	   (not isearch-regexp))
      nil
    ;; In reverse search, adding stuff at
    ;; the end may cause zero or many more chars to be
    ;; matched, in the string following point.
    ;; Allow all those possibilities without moving point as
    ;; long as the match does not extend past search origin.
    (if (and (not isearch-forward) (not isearch-adjusted)
	     (condition-case ()
		 (progn
		   (isearch-fix-case)
		   (let ((case-fold-search isearch-case-fold-search))
		     (looking-at (if isearch-regexp isearch-string
				   (regexp-quote isearch-string)))))
	       (error nil))
	     (or isearch-yank-flag
		 (<= (match-end 0) 
		     (min isearch-opoint isearch-barrier))))
	(setq isearch-success t 
	      isearch-invalid-regexp nil
	      isearch-other-end (match-end 0))
      ;; Not regexp, not reverse, or no match at point.
      (if (and isearch-other-end (not isearch-adjusted))
	  (goto-char (if isearch-forward isearch-other-end
		       (min isearch-opoint 
			    isearch-barrier 
			    (1+ isearch-other-end)))))
      (isearch-search)
      ))
  (isearch-push-state)
  (if isearch-op-fun (funcall isearch-op-fun))
  (isearch-update))


;; *, ?, and | chars can make a regexp more liberal.
;; They can make a regexp match sooner
;; or make it succeed instead of failing.
;; So go back to place last successful search started
;; or to the last ^S/^R (barrier), whichever is nearer.

(defun isearch-*-char ()
  "Handle * and ? specially in regexps."
  (interactive)
  (if isearch-regexp 

      (progn
	(setq isearch-adjusted t)
	(let ((cs (nth (if isearch-forward
			   5		; isearch-other-end
			 2)		; saved (point)
		       (car (cdr isearch-cmds)))))
	  ;; (car isearch-cmds) is after last search;
	  ;; (car (cdr isearch-cmds)) is from before it.
	  (setq cs (or cs isearch-barrier))
	  (goto-char
	   (if isearch-forward
	       (max cs isearch-barrier)
	     (min cs isearch-barrier))))))
  (isearch-process-search-char last-command-event))
  


(defun isearch-|-char ()
  "If in regexp search, jump to the barrier."
  (interactive)
  (if isearch-regexp
      (progn
	(setq isearch-adjusted t)
	(goto-char isearch-barrier)))
  (isearch-process-search-char last-command-event))

(defun isearch-quote-char ()
  "Quote special characters for incremental search."
  (interactive)
  (isearch-process-search-char (read-quoted-char (isearch-message t))))


(defun isearch-return-char ()
  "Convert return into newline for incremental search.
Obsolete."
  (interactive)
  (isearch-process-search-char ?\n))


(defun isearch-printing-char ()
  "Any other printing character => add it to the search string and search."
  (interactive)
  (isearch-process-search-char last-command-event))


(defun isearch-whitespace-chars ()
  "Match all whitespace chars, if in regexp mode."
  (interactive)
  (if (and isearch-regexp search-whitespace-regexp)
      (isearch-process-search-string search-whitespace-regexp " ")
    (beep)
    (isearch-process-search-char ?\ )
;    (if isearch-word
;	nil
;      (setq isearch-word t)
;      (goto-char isearch-other-end)
;      (isearch-process-search-char ?\ ))
    ))

(defun isearch-process-search-char (char)
  ;; Append the char to the search string, update the message and re-search.
  (isearch-process-search-string (isearch-char-to-string char) 
				 (isearch-text-char-description char)))

(defun isearch-process-search-string (string message)
  (setq isearch-string (concat isearch-string string)
	isearch-message (concat isearch-message message))
  (isearch-search-and-update))


;;===========================================================
;; Search Ring

(defcustom search-ring-update nil
  "*Non-nil if advancing or retreating in the search ring should cause search.
Default nil means edit the string from the search ring first."
  :type 'boolean
  :group 'isearch)
  
(defun isearch-ring-adjust1 (advance)
  ;; Helper for isearch-ring-adjust
  (let* ((ring (if isearch-regexp regexp-search-ring search-ring))
	 (length (length ring))
	 (yank-pointer-name (if isearch-regexp
				'regexp-search-ring-yank-pointer
			      'search-ring-yank-pointer))
	 (yank-pointer (eval yank-pointer-name)))
    (if (zerop length)
	()
      (set yank-pointer-name
	   (setq yank-pointer
		 (nthcdr (% (+ (- length (length yank-pointer))
			       (if advance (1- length) 1))
			    length) ring)))
      (setq isearch-string (car yank-pointer)
	    isearch-message (mapconcat 'isearch-text-char-description
				       isearch-string "")))))

(defun isearch-ring-adjust (advance)
  ;; Helper for isearch-ring-advance and isearch-ring-retreat
  (if (cdr isearch-cmds)  ;; is there more than one thing on stack?
      (isearch-pop-state))
  (isearch-ring-adjust1 advance)
  (isearch-push-state)
  (if search-ring-update
      (progn
	(isearch-search)
	(isearch-update))
    (isearch-edit-string)
    ))

(defun isearch-ring-advance ()
  "Advance to the next search string in the ring."
  ;; This could be more general to handle a prefix arg, but who would use it.
  (interactive)
  (isearch-ring-adjust 'advance))

(defun isearch-ring-retreat ()
  "Retreat to the previous search string in the ring."
  (interactive)
  (isearch-ring-adjust nil))

(defun isearch-ring-adjust-edit (advance)
  "Use the next or previous search string in the ring while in minibuffer."
  (isearch-ring-adjust1 advance)
  (erase-buffer)
  (insert isearch-string))

(defun isearch-ring-advance-edit ()
  (interactive)
  (isearch-ring-adjust-edit 'advance))

(defun isearch-ring-retreat-edit ()
  "Retreat to the previous search string in the ring while in the minibuffer."
  (interactive)
  (isearch-ring-adjust-edit nil))


(defun isearch-complete1 ()
  ;; Helper for isearch-complete and isearch-complete-edit
  ;; Return t if completion OK, 
  (let* ((ring (if isearch-regexp regexp-search-ring search-ring))
         (alist (mapcar (function (lambda (string) (list string))) ring))
         (completion-ignore-case case-fold-search)
         (completion (try-completion isearch-string alist))
	 )
    (cond
     ((eq completion t)
      ;; isearch-string stays the same
      t)
     ((or completion ; not nil, must be a string
	  (= 0 (length isearch-string))) ; shouldn't have to say this
      (if (equal completion isearch-string)  ;; no extension?
	  (if completion-auto-help
	      (with-output-to-temp-buffer "*Isearch completions*"
		(display-completion-list 
		 (all-completions isearch-string alist))))
	(setq isearch-string completion))
      t)
     (t
      (temp-minibuffer-message "No completion")
      nil))))

(defun isearch-complete ()
  "Complete the search string from the strings on the search ring.
The completed string is then editable in the minibuffer.
If there is no completion possible, say so and continue searching."
  (interactive)
  (if (isearch-complete1)
      (isearch-edit-string)
    ;; else
    (sit-for 1)
    (isearch-update)))

(defun isearch-complete-edit ()
  "Same as `isearch-complete' except in the minibuffer."
  (interactive)
  (setq isearch-string (buffer-string))
  (if (isearch-complete1)
      (progn
	(erase-buffer)
	(insert isearch-string))))


;;;==============================================================
;; The search status stack (and isearch window-local variables, not used).

(defun isearch-top-state ()
;;  (fetch-window-local-variables)
  (let ((cmd (car isearch-cmds)))
    (setq isearch-string (car cmd)
	  isearch-message (car (cdr cmd))
	  isearch-success (nth 3 cmd)
	  isearch-forward (nth 4 cmd)
	  isearch-other-end (nth 5 cmd)
	  isearch-invalid-regexp (nth 6 cmd)
	  isearch-wrapped (nth 7 cmd)
	  isearch-barrier (nth 8 cmd))
    (goto-char (car (cdr (cdr cmd))))))

(defun isearch-pop-state ()
;;  (fetch-window-local-variables)
  (setq isearch-cmds (cdr isearch-cmds))
  (isearch-top-state)
  )

(defun isearch-push-state ()
  (setq isearch-cmds 
	(cons (list isearch-string isearch-message (point)
		    isearch-success isearch-forward isearch-other-end 
		    isearch-invalid-regexp isearch-wrapped isearch-barrier)
	      isearch-cmds)))


;;;==================================================================
;; Message string

(defun isearch-message (&optional c-q-hack ellipsis)
  ;; Generate and print the message string.
  (let ((cursor-in-echo-area ellipsis)
	(m (concat
	    (isearch-message-prefix c-q-hack)
	    isearch-message
	    (isearch-message-suffix c-q-hack)
	    )))
    (if c-q-hack m (display-message 'progress (format "%s" m)))))

(defun isearch-message-prefix (&optional c-q-hack nonincremental)
  ;; If about to search, and previous search regexp was invalid,
  ;; check that it still is.  If it is valid now,
  ;; let the message we display while searching say that it is valid.
  (and isearch-invalid-regexp
       (condition-case ()
	   (progn (re-search-forward isearch-string (point) t)
		  (setq isearch-invalid-regexp nil))
	 (error nil)))
  ;; #### - Yo!  Emacs assembles strings all over the place, they can't all
  ;; be internationalized in the manner proposed below...  Add an explicit
  ;; call to `gettext' and have the string snarfer pluck the english
  ;; strings out of the comment below.  XEmacs is on a purespace diet! -Stig
  (let ((m (concat (if isearch-success nil "failing ")
  		   (if isearch-wrapped "wrapped ")
  		   (if isearch-word "word ")
  		   (if isearch-regexp "regexp ")
  		   (if nonincremental "search" "I-search")
  		   (if isearch-forward nil " backward")
		   ": "
  		   )))
    (aset m 0 (upcase (aref m 0)))
    (gettext m)))

(defun isearch-message-suffix (&optional c-q-hack)
  (concat (if c-q-hack "^Q" "")
	  (if isearch-invalid-regexp
	      (concat " [" isearch-invalid-regexp "]")
	    "")))

;;;;; #### - yuck...this is soooo lame.  Is this really worth 4k of purespace???
;;;
;;;(let ((i (logior (if isearch-success 32 0)
;;;                (if isearch-wrapped 16 0)
;;;                (if isearch-word     8 0)
;;;                (if isearch-regexp   4 0)
;;;                (if nonincremental   2 0)
;;;                (if isearch-forward  1 0))))
;;;  (cond
;;;   ((= i 63) (gettext "Wrapped word regexp search: "))              ; 111111
;;;   ((= i 62) (gettext "Wrapped word regexp search backward: "))     ; 111110
;;;   ((= i 61) (gettext "Wrapped word regexp I-search: "))            ; 111101
;;;   ((= i 60) (gettext "Wrapped word regexp I-search backward: "))   ; 111100
;;;   ((= i 59) (gettext "Wrapped word search: "))                     ; 111011
;;;   ((= i 58) (gettext "Wrapped word search backward: "))            ; 111010
;;;   ((= i 57) (gettext "Wrapped word I-search: "))                   ; 111001
;;;   ((= i 56) (gettext "Wrapped word I-search backward: "))          ; 111000
;;;   ((= i 55) (gettext "Wrapped regexp search: "))                   ; 110111
;;;   ((= i 54) (gettext "Wrapped regexp search backward: "))          ; 110110
;;;   ((= i 53) (gettext "Wrapped regexp I-search: "))                 ; 110101
;;;   ((= i 52) (gettext "Wrapped regexp I-search backward: "))        ; 110100
;;;   ((= i 51) (gettext "Wrapped search: "))                          ; 110011
;;;   ((= i 50) (gettext "Wrapped search backward: "))                 ; 110010
;;;   ((= i 49) (gettext "Wrapped I-search: "))                        ; 110001
;;;   ((= i 48) (gettext "Wrapped I-search backward: "))	       ; 110000
;;;   ((= i 47) (gettext "Word regexp search: "))                      ; 101111
;;;   ((= i 46) (gettext "Word regexp search backward: "))             ; 101110
;;;   ((= i 45) (gettext "Word regexp I-search: "))                    ; 101101
;;;   ((= i 44) (gettext "Word regexp I-search backward: "))           ; 101100
;;;   ((= i 43) (gettext "Word search: "))                             ; 101011
;;;   ((= i 42) (gettext "Word search backward: "))                    ; 101010
;;;   ((= i 41) (gettext "Word I-search: "))                           ; 101001
;;;   ((= i 40) (gettext "Word I-search backward: "))                  ; 101000
;;;   ((= i 39) (gettext "Regexp search: "))                           ; 100111
;;;   ((= i 38) (gettext "Regexp search backward: "))                  ; 100110
;;;   ((= i 37) (gettext "Regexp I-search: "))                         ; 100101
;;;   ((= i 36) (gettext "Regexp I-search backward: "))                ; 100100
;;;   ((= i 35) (gettext "Search: "))                                  ; 100011
;;;   ((= i 34) (gettext "Search backward: "))                         ; 100010
;;;   ((= i 33) (gettext "I-search: "))                                ; 100001
;;;   ((= i 32) (gettext "I-search backward: "))		       ; 100000
;;;   ((= i 31) (gettext "Failing wrapped word regexp search: "))      ; 011111
;;;   ((= i 30) (gettext "Failing wrapped word regexp search backward: ")) ; 011110
;;;   ((= i 29) (gettext "Failing wrapped word regexp I-search: "))    ; 011101
;;;   ((= i 28) (gettext "Failing wrapped word regexp I-search backward: ")) ; 011100
;;;   ((= i 27) (gettext "Failing wrapped word search: "))             ; 011011
;;;   ((= i 26) (gettext "Failing wrapped word search backward: "))    ; 011010
;;;   ((= i 25) (gettext "Failing wrapped word I-search: "))           ; 011001
;;;   ((= i 24) (gettext "Failing wrapped word I-search backward: "))  ; 011000
;;;   ((= i 23) (gettext "Failing wrapped regexp search: "))           ; 010111
;;;   ((= i 22) (gettext "Failing wrapped regexp search backward: "))  ; 010110
;;;   ((= i 21) (gettext "Failing wrapped regexp I-search: "))         ; 010101
;;;   ((= i 20) (gettext "Failing wrapped regexp I-search backward: ")) ; 010100
;;;   ((= i 19) (gettext "Failing wrapped search: "))                  ; 010011
;;;   ((= i 18) (gettext "Failing wrapped search backward: "))         ; 010010
;;;   ((= i 17) (gettext "Failing wrapped I-search: "))                ; 010001
;;;   ((= i 16) (gettext "Failing wrapped I-search backward: "))       ; 010000
;;;   ((= i 15) (gettext "Failing word regexp search: "))              ; 001111
;;;   ((= i 14) (gettext "Failing word regexp search backward: "))     ; 001110
;;;   ((= i 13) (gettext "Failing word regexp I-search: "))            ; 001101
;;;   ((= i 12) (gettext "Failing word regexp I-search backward: "))   ; 001100
;;;   ((= i 11) (gettext "Failing word search: "))                     ; 001011
;;;   ((= i 10) (gettext "Failing word search backward: "))            ; 001010
;;;   ((= i  9) (gettext "Failing word I-search: "))                   ; 001001
;;;   ((= i  8) (gettext "Failing word I-search backward: "))          ; 001000
;;;   ((= i  7) (gettext "Failing regexp search: "))                   ; 000111
;;;   ((= i  6) (gettext "Failing regexp search backward: "))          ; 000110
;;;   ((= i  5) (gettext "Failing regexp I-search: "))                 ; 000101
;;;   ((= i  4) (gettext "Failing regexp I-search backward: "))        ; 000100
;;;   ((= i  3) (gettext "Failing search: "))                          ; 000011
;;;   ((= i  2) (gettext "Failing search backward: "))                 ; 000010
;;;   ((= i  1) (gettext "Failing I-search: "))                        ; 000001
;;;   ((= i  0) (gettext "Failing I-search backward: "))	       ; 000000
;;;   (t (error "Something's rotten")))))


;;;========================================================
;;; Exiting

(put 'isearch-printing-char			'isearch-command t)
(put 'isearch-return-char			'isearch-command t)
(put 'isearch-repeat-forward			'isearch-command t)
(put 'isearch-repeat-backward			'isearch-command t)
(put 'isearch-delete-char			'isearch-command t)
(put 'isearch-help-or-delete-char		'isearch-command t)
(put 'isearch-abort				'isearch-command t)
(put 'isearch-quote-char			'isearch-command t)
(put 'isearch-exit				'isearch-command t)
(put 'isearch-printing-char			'isearch-command t)
(put 'isearch-printing-char			'isearch-command t)
(put 'isearch-yank-word				'isearch-command t)
(put 'isearch-yank-line				'isearch-command t)
(put 'isearch-yank-kill				'isearch-command t)
(put 'isearch-yank-sexp				'isearch-command t)
(put 'isearch-*-char				'isearch-command t)
(put 'isearch-*-char				'isearch-command t)
(put 'isearch-|-char				'isearch-command t)
(put 'isearch-toggle-regexp			'isearch-command t)
(put 'isearch-toggle-case-fold			'isearch-command t)
(put 'isearch-edit-string			'isearch-command t)
(put 'isearch-mode-help				'isearch-command t)
(put 'isearch-ring-advance			'isearch-command t)
(put 'isearch-ring-retreat			'isearch-command t)
(put 'isearch-ring-advance-edit			'isearch-command t)
(put 'isearch-ring-retreat-edit			'isearch-command t)
(put 'isearch-whitespace-chars			'isearch-command t)
(put 'isearch-complete				'isearch-command t)
(put 'isearch-complete-edit			'isearch-command t)
(put 'isearch-edit-string			'isearch-command t)
(put 'isearch-toggle-regexp			'isearch-command t)
(put 'isearch-forward-exit-minibuffer		'isearch-command t)
(put 'isearch-reverse-exit-minibuffer		'isearch-command t)
(put 'isearch-nonincremental-exit-minibuffer	'isearch-command t)
(put 'isearch-yank-x-selection			'isearch-command t)
(put 'isearch-yank-x-clipboard			'isearch-command t)

;; scrolling the scrollbar should not terminate isearch.

;; vertical scrollbar:
(put 'scrollbar-line-up				'isearch-command t)
(put 'scrollbar-line-down			'isearch-command t)
(put 'scrollbar-page-up				'isearch-command t)
(put 'scrollbar-page-down			'isearch-command t)
(put 'scrollbar-to-top				'isearch-command t)
(put 'scrollbar-to-bottom			'isearch-command t)
(put 'scrollbar-vertical-drag			'isearch-command t)

;; horizontal scrollbar:
(put 'scrollbar-char-left			'isearch-command t)
(put 'scrollbar-char-right			'isearch-command t)
(put 'scrollbar-page-left			'isearch-command t)
(put 'scrollbar-page-right			'isearch-command t)
(put 'scrollbar-to-left				'isearch-command t)
(put 'scrollbar-to-right			'isearch-command t)
(put 'scrollbar-horizontal-drag			'isearch-command t)

(defun isearch-pre-command-hook ()
  ;;
  ;; For use as the value of `pre-command-hook' when isearch-mode is active.
  ;; If the command about to be executed is not one of the isearch commands,
  ;; then isearch-mode is turned off before that command is executed.
  ;;
  ;; If the command about to be executed is self-insert-command, or is a
  ;; keyboard macro of a single key sequence which is bound to self-insert-
  ;; command, then we add those chars to the search ring instead of inserting
  ;; them in the buffer.  In this way, the set of self-searching characters
  ;; need not be exhaustively enumerated, but is derived from other maps.
  ;;
  (cond ((not (eq (current-buffer) isearch-buffer))
	 ;; If the buffer (likely meaning "frame") has changed, bail.
	 ;; This can also happen if a proc filter has popped up another
	 ;; buffer, which is arguably a bad thing for it to have done,
	 ;; but the way in which isearch would have hosed you in that
	 ;; case is unarguably even worse. -jwz
	 (isearch-done))
	(t
	 (isearch-maybe-frob-keyboard-macros)
	 (if (and this-command
		  (symbolp this-command)
		  (get this-command 'isearch-command))
	     nil ; then continue.
	   (isearch-done)))))

(defun isearch-maybe-frob-keyboard-macros ()
  ;;
  ;; If the command about to be executed is `self-insert-command' then change
  ;; the command to `isearch-printing-char' instead, meaning add the last-
  ;; typed character to the search string.
  ;;
  ;; If `this-command' is a string or a vector (that is, a keyboard macro)
  ;; and it contains only one command, which is bound to self-insert-command,
  ;; then do the same thing as for self-inserting commands: arrange for that
  ;; character to be added to the search string.  If we didn't do this, then
  ;; typing a compose sequence (a la x-compose.el) would terminate the search
  ;; and insert the character, instead of searching for that character.
  ;;
  ;; We should continue doing this, since it's pretty much the behavior one
  ;; would expect, but it will stop being so necessary once key-translation-
  ;; map exists and is used by x-compose.el and things like it, since the
  ;; translation will have been done before we see the keys.
  ;;
  (cond ((eq this-command 'self-insert-command)
	 (setq this-command 'isearch-printing-char))
	((and (or (stringp this-command) (vectorp this-command))
	      (eq (key-binding this-command) 'self-insert-command))
	 (setq last-command-event (character-to-event (aref this-command 0))
	       last-command-char (and (stringp this-command)
				      (aref this-command 0))
	       this-command 'isearch-printing-char))
	))


;;;========================================================
;;; Highlighting

(defcustom isearch-highlight t
  "*Whether isearch and query-replace should highlight the text which 
currently matches the search-string.")

(defvar isearch-extent nil)

;; this face is initialized by x-faces.el since isearch is preloaded.
;; this face is now created in initialize-faces
;;(make-face 'isearch)

(defun isearch-make-extent (begin end)
  (let ((x (make-extent begin end (current-buffer))))
    ;; make the isearch extent always take prescedence over any mouse-
    ;; highlighted extents we may be passing through, since isearch, being
    ;; modal, is more interesting (there's nothing they could do with a
    ;; mouse-highlighted extent while in the midst of a search anyway).
    (set-extent-priority x (1+ mouse-highlight-priority))
    (set-extent-face x 'isearch)
    (setq isearch-extent x)))

(defun isearch-highlight (begin end)
  (if (null isearch-highlight)
      nil
    ;; make sure isearch-extent is in the current buffer
    (or (extentp isearch-extent)
	(isearch-make-extent begin end))
    (set-extent-endpoints isearch-extent begin end (current-buffer))))

(defun isearch-dehighlight (totally)
  (if (and isearch-highlight isearch-extent)
      (if totally
	  (let ((inhibit-quit t))
	    (if (extentp isearch-extent)
		(delete-extent isearch-extent))
	    (setq isearch-extent nil))
	(if (extentp isearch-extent)
	    (detach-extent isearch-extent)
	  (setq isearch-extent nil)))))


;;;========================================================
;;; Searching

(defun isearch-search ()
  ;; Do the search with the current search string.
  (isearch-message nil t)
  (isearch-fix-case)
  (condition-case lossage
      (let ((inhibit-quit nil)
	    (case-fold-search isearch-case-fold-search))
	(if isearch-regexp (setq isearch-invalid-regexp nil))
	(setq isearch-success
	      (funcall
	       (cond (isearch-word
		      (if isearch-forward
			  'word-search-forward 'word-search-backward))
		     (isearch-regexp
		      (if isearch-forward
			  're-search-forward 're-search-backward))
		     (t
		      (if isearch-forward 'search-forward 'search-backward)))
	       isearch-string nil t))
	(setq isearch-just-started nil)
	(if isearch-success
	    (setq isearch-other-end
		  (if isearch-forward (match-beginning 0) (match-end 0)))))

    (quit (setq unread-command-event (character-to-event (quit-char)))
	  (setq isearch-success nil))

    (invalid-regexp 
     (setq isearch-invalid-regexp (car (cdr lossage)))
     (if (string-match
	  "\\`Premature \\|\\`Unmatched \\|\\`Invalid "
	  isearch-invalid-regexp)
	 (setq isearch-invalid-regexp (gettext "incomplete input")))))

  (if isearch-success
      nil

    ;; If we're being run inside a keyboard macro, then the call to
    ;; ding will signal an error (to terminate the macro).  We must
    ;; turn off isearch-mode first, so that we aren't still in isearch
    ;; mode after the macro exits.  Note that isearch-recursive-edit
    ;; must not be true if a keyboard macro is executing.
    (if (and executing-kbd-macro (not defining-kbd-macro))
	(progn
	  (isearch-done)
	  (ding nil 'isearch-failed)))

    ;; Ding if failed this time after succeeding last time.
    (and (nth 3 (car isearch-cmds))
	 (ding nil 'isearch-failed))
    (goto-char (nth 2 (car isearch-cmds)))))

;;;=================================================
;; This is called from incremental-search
;; if the first input character is the exit character.

;; We store the search string in `isearch-string'
;; which has been bound already by `isearch-search'
;; so that, when we exit, it is copied into `search-last-string'.

;(defun nonincremental-search (forward regexp)
;  ;; This may be broken.  Anyway, it is replaced by the isearch-edit-string.
;  ;; Missing features: word search option, command history.
;  (setq isearch-forward forward
;	isearch-regexp regexp)
;  (let (char function
;	inhibit-quit
;	(cursor-in-echo-area t))
;    ;; Prompt assuming not word search,
;    (setq isearch-message 
;	  (if isearch-regexp 
;	      (if isearch-forward "Regexp search: "
;		"Regexp search backward: ")
;	    (if isearch-forward "Search: " "Search backward: ")))
;    (message "%s" isearch-message)
;    ;; Read 1 char and switch to word search if it is ^W.
;    (setq char (read-char))
;    (if (eq char search-yank-word-char)
;	(setq isearch-message (if isearch-forward "Word search: " 
;				"Word search backward: "))
;      ;; Otherwise let that 1 char be part of the search string.
;      (setq unread-command-event (character-to-event char))
;      )
;    (setq function
;	  (if (eq char search-yank-word-char)
;	      (if isearch-forward 'word-search-forward 'word-search-backward)
;	    (if isearch-regexp
;		(if isearch-forward 're-search-forward 're-search-backward)
;	      (if isearch-forward 'search-forward 'search-backward))))
;    ;; Read the search string with corrected prompt.
;    (setq isearch-string (read-string isearch-message isearch-string))
;    ;; Empty means use default.
;    (if (= 0 (length isearch-string))
;	(setq isearch-string search-last-string)
;      ;; Set last search string now so it is set even if we fail.
;      (setq search-last-string isearch-string))
;    ;; Since we used the minibuffer, we should be available for redo.
;    (setq command-history 
;	  (cons (list function isearch-string) command-history))
;    ;; Go ahead and search.
;    (if search-caps-disable-folding
;	(setq isearch-case-fold-search 
;	      (no-upper-case-p isearch-string isearch-regexp)))
;    (let ((case-fold-search isearch-case-fold-search))
;      (funcall function isearch-string))))

(defun isearch-no-upper-case-p (string)
  "Return t if there are no upper case chars in string.
But upper case chars preceded by \\ do not count since they
have special meaning in a regexp."
  ;; this incorrectly returns t for "\\\\A"
  (let ((case-fold-search nil))
    (not (string-match "\\(^\\|[^\\]\\)[A-Z]" string))))
(make-obsolete 'isearch-no-upper-case-p 'no-upper-case-p)

;; Used by etags.el and info.el
(defmacro with-caps-disable-folding (string &rest body) "\
Eval BODY with `case-fold-search' let to nil if STRING contains
uppercase letters and `search-caps-disable-folding' is t."
  `(let ((case-fold-search
          (if (and case-fold-search search-caps-disable-folding)
              (isearch-no-upper-case-p ,string)
            case-fold-search)))
     ,@body))
(make-obsolete 'with-caps-disable-folding 'with-search-caps-disable-folding)
(put 'with-caps-disable-folding 'lisp-indent-function 1)
(put 'with-caps-disable-folding 'edebug-form-spec '(form body))

;;; isearch-mode.el ends here
