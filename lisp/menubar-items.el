;;; menubar-items.el --- Menubar and popup-menu content for XEmacs.

;; Copyright (C) 1991-1995, 1997-1998 Free Software Foundation, Inc.
;; Copyright (C) 1995 Tinker Systems and INS Engineering Corp.
;; Copyright (C) 1995 Sun Microsystems.
;; Copyright (C) 1995, 1996 Ben Wing.
;; Copyright (C) 1997 MORIOKA Tomohiko

;; Maintainer: XEmacs Development Team
;; Keywords: frames, extensions, internal, dumped

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
;; along with Xmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This file is dumped with XEmacs (when window system and menubar support is
;; compiled in).

;;; Code:

;;; Warning-free compile
(eval-when-compile
  (defvar language-environment-list)
  (defvar bookmark-alist)
  (defvar language-info-alist)
  (defvar current-language-environment)
  (defvar tutorial-supported-languages))

(defconst default-menubar
  (purecopy-menubar
   ;; note backquote.
   `(
     ("File"
      ["Open..." find-file]
      ["Open in Other Window..." find-file-other-window]
      ["Open in New Frame..." find-file-other-frame]
      ["Insert File..." insert-file]
      ["View File..." view-file]
      "------"
      ["Save" save-buffer
       :active (buffer-modified-p)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      ["Save As..." write-file]
      ["Save Some Buffers" save-some-buffers]
      "-----"
      ["Print Buffer" lpr-buffer
       :active (fboundp 'lpr-buffer)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      ["Pretty-Print Buffer" ps-print-buffer-with-faces
       :active (fboundp 'ps-print-buffer-with-faces)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      "-----"
      ["New Frame" make-frame]
      ["Frame on Other Display..." make-frame-on-display]
      ["Delete Frame" delete-frame
       :active (not (eq (next-frame (selected-frame) 'nomini 'window-system)
			(selected-frame)))]
      "-----"
      ["Split Window" split-window-vertically]
      ["Un-Split (Keep This)" delete-other-windows
       :active (not (one-window-p t))]
      ["Un-Split (Keep Others)" delete-window
       :active (not (one-window-p t))]
      "-----"
      ["Revert Buffer" revert-buffer
       :active (or buffer-file-name revert-buffer-function)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      ["Delete Buffer" kill-this-buffer
       :active t
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      "-----"
      ["Exit XEmacs" save-buffers-kill-emacs]
      )

     ("Edit"
      ["Undo" advertised-undo
       :active (and (not (eq buffer-undo-list t))
		    (or buffer-undo-list pending-undo-list))
       :suffix (if (or (eq last-command 'undo)
		       (eq last-command 'advertised-undo))
		       "More" "")]
      ["Redo" redo
       :included (fboundp 'redo)
       :active (not (or (eq buffer-undo-list t)
			 (eq last-buffer-undo-list nil)
			 (not (or (eq last-buffer-undo-list buffer-undo-list)
				  (and (null (car-safe buffer-undo-list))
				       (eq last-buffer-undo-list
					   (cdr-safe buffer-undo-list)))))
			 (or (eq buffer-undo-list pending-undo-list)
			     (eq (cdr buffer-undo-list) pending-undo-list))))
       :suffix (if (eq last-command 'redo) "More" "")]
      ["Cut" kill-primary-selection
       :active (selection-owner-p)]
      ["Copy" copy-primary-selection
       :active (selection-owner-p)]
      ["Paste" yank-clipboard-selection
       :active (selection-exists-p 'CLIPBOARD)]
      ["Clear" delete-primary-selection
       :active (selection-owner-p)]
      "----"
      ["Search..." isearch-forward]
      ["Search Backward..." isearch-backward]
      ["Replace..." query-replace]
      "----"
      ["Search (Regexp)..." isearch-forward-regexp]
      ["Search Backward (Regexp)..." isearch-backward-regexp]
      ["Replace (Regexp)..." query-replace-regexp]
      "----"
      ["Goto Line..." goto-line]
      ["What Line" what-line]
      ("Bookmarks"
       :filter bookmark-menu-filter)
      "----"
      ["Start Macro Recording" start-kbd-macro
       :active (not defining-kbd-macro)]
      ["End Macro Recording" end-kbd-macro
       :active defining-kbd-macro]
      ["Execute Last Macro" call-last-kbd-macro
       :active last-kbd-macro]
      "----"
      ["Show Message Log" show-message-log]
      )

     ,@(if (featurep 'mule)
	   '(("Mule"
	      ("Describe language support")
	      ("Set language environment")
	      "--"
	      ["Toggle input method" toggle-input-method]
	      ["Select input method" select-input-method]
	      ["Describe input method" describe-input-method]
	      "--"
	      ["Describe current coding systems"
	       describe-current-coding-system]
	      ["Set coding system of buffer file"
	       set-buffer-file-coding-system]
	      ;; not implemented yet
	      ["Set coding system of terminal"
	       set-terminal-coding-system :active nil]
	      ;; not implemented yet
	      ["Set coding system of keyboard"
	       set-keyboard-coding-system :active nil]
	      ;; not implemented yet
	      ["Set coding system of process"
	       set-current-process-coding-system :active nil]
	      "--"
	      ["Show character table" view-charset-by-menu]
	      ;; not implemented yet
	      ["Show diagnosis for MULE" mule-diag :active nil]
	      ["Show many languages" view-hello-file])))

     ("Apps"
      ["Read Mail (VM)..." vm
       :active (fboundp 'vm)]
      ["Read Mail (MH)..." (mh-rmail t)
       :active (fboundp 'mh-rmail)]
      ["Send mail..." compose-mail
       :active (fboundp 'compose-mail)]
      ["Usenet News" gnus
       :active (fboundp 'gnus)]
      ["Browse the Web" w3
       :active (fboundp 'w3)]
      ["Gopher" gopher
       :active (fboundp 'gopher)]
      "----"
      ["Spell-Check Buffer" ispell-buffer
       :active (fboundp 'ispell-buffer)]
      ["Toggle VI emulation" toggle-viper-mode
       :active (fboundp 'toggle-viper-mode)]
      "----"
      ("Calendar"
       ["3-Month Calendar" calendar
	:active (fboundp 'calendar)]
       ["Diary" diary
	:active (fboundp 'diary)]
       ["Holidays" holidays
	:active (fboundp 'holidays)]
       ;; we're all pagans at heart ...
       ["Phases of the Moon" phases-of-moon
	:active (fboundp 'phases-of-moon)]
       ["Sunrise/Sunset" sunrise-sunset
	:active (fboundp 'sunrise-sunset)])

      ("Games"
       ["Mine Game" xmine
	:active (fboundp 'xmine)]
       ["Tetris" tetris
	:active (fboundp 'tetris)]
       ["Sokoban" sokoban
	:active (fboundp 'sokoban)]
       ["Quote from Zippy" yow
	:active (fboundp 'yow)]
       ["Psychoanalyst" doctor
	:active (fboundp 'doctor)]
       ["Psychoanalyze Zippy!" psychoanalyze-pinhead
	:active (fboundp 'psychoanalyze-pinhead)]
       ["Random Flames" flame
	:active (fboundp 'flame)]
       ["Dunnet (Adventure)" dunnet
	:active (fboundp 'dunnet)]
       ["Towers of Hanoi" hanoi
	:active (fboundp 'hanoi)]
       ["Game of Life" life
	:active (fboundp 'life)]
       ["Multiplication Puzzle" mpuz
	:active (fboundp 'mpuz)]))

     ("Options"
      ("Customize"
       ("Emacs" :filter (lambda (&rest junk)
			  (cdr (custom-menu-create 'emacs))))
       ["Group..." customize-group]
       ["Variable..." customize-variable]
       ["Face..." customize-face]
       ["Saved..." customize-saved]
       ["Set..." customize-customized]
       ["Apropos..." customize-apropos]
       ["Browse..." customize-browse])
      
      ("Manage Packages"
       ("Add Download Site"
        :filter (lambda (&rest junk)
                  (package-get-download-menu)))
       ["Update Package Index" package-get-update-base]
       ["List & Install" pui-list-packages]
       ("Using Custom"
	("Select" :filter (lambda (&rest junk)
			  (cdr (custom-menu-create 'packages))))
	["Update" package-get-custom])
       ["Help" (Info-goto-node "(xemacs)Packages")])

      "---"
      
      ("Editing Options"
       ["Overstrike"
	(progn
	  (setq overwrite-mode (if overwrite-mode nil 'overwrite-mode-textual))
	  (customize-set-variable 'overwrite-mode overwrite-mode))
	:style toggle :selected overwrite-mode]
       ["Case Sensitive Search" 
	(customize-set-variable 'case-fold-search 
				(setq case-fold-search (not case-fold-search)))
	:style toggle :selected (not case-fold-search)]
       ["Case Matching Replace" 
	(customize-set-variable 'case-replace (not case-replace))
	:style toggle :selected case-replace]
       ["Auto Delete Selection"
	(customize-set-variable 'pending-delete-mode (not pending-delete-mode))
	:style toggle
	:selected (and (boundp 'pending-delete-mode) pending-delete-mode)
	:active (boundp 'pending-delete-mode)]
       ["Active Regions" 
	(customize-set-variable 'zmacs-regions (not zmacs-regions))
	:style toggle :selected zmacs-regions]
       ["Mouse Paste At Text Cursor" 
	(customize-set-variable 'mouse-yank-at-point (not mouse-yank-at-point))
	:style toggle :selected mouse-yank-at-point]
       ("Newline at end of file..."
	["Don't require"
	 (customize-set-variable 'require-final-newline nil)
	 :style radio :selected (not require-final-newline)]
	["Require"
	 (customize-set-variable 'require-final-newline t)
	 :style radio :selected (eq require-final-newline t)]
	["Ask"
	 (customize-set-variable 'require-final-newline 'ask)
	 :style radio :selected (and require-final-newline
				     (not (eq require-final-newline t)))])
       ["Add Newline When Moving Past End" 
	(customize-set-variable 'next-line-add-newlines 
				(not next-line-add-newlines))
	:style toggle :selected next-line-add-newlines]
       )
      ("General Options"
       ["Teach Extended Commands" 
	(customize-set-variable 'teach-extended-commands-p
				(not teach-extended-commands-p))
	:style toggle :selected teach-extended-commands-p]
       ["Debug On Error"
	(customize-set-variable 'debug-on-error (not debug-on-error))
	:style toggle :selected debug-on-error]
       ["Debug On Quit" 
	(customize-set-variable 'debug-on-quit (not debug-on-quit))
	:style toggle :selected debug-on-quit]
       )
      ("Printing Options"
       ["Command-Line Switches for `lpr'/`lp'..."
	;; better to directly open a customization buffer, since the value
	;; must be a list of strings, which is somewhat complex to prompt for.
	(customize-variable 'lpr-switches)
	(boundp 'lpr-switches)]
       ("Pretty-Print Paper Size"
	["Letter"
	 (customize-set-variable 'ps-paper-type 'letter)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'letter))
	 :active (boundp 'ps-paper-type)]
	["Letter-small"
	 (customize-set-variable 'ps-paper-type 'letter-small)
	 :style radio
	 :selected (and (boundp 'ps-paper-type)
			(eq ps-paper-type 'letter-small))
	 :active (boundp 'ps-paper-type)]
	["Legal"
	 (customize-set-variable 'ps-paper-type 'legal)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'legal))
	 :active (boundp 'ps-paper-type)]
	["Statement"
	 (customize-set-variable 'ps-paper-type 'statement)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'statement))
	 :active (boundp 'ps-paper-type)]
	["Executive" 
	 (customize-set-variable 'ps-paper-type 'executive)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'executive))
	 :active (boundp 'ps-paper-type)]
	["Tabloid"
	 (customize-set-variable 'ps-paper-type 'tabloid)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'tabloid))
	 :active (boundp 'ps-paper-type)]
	["Ledger" 
	 (customize-set-variable 'ps-paper-type 'ledger)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'ledger))
	 :active (boundp 'ps-paper-type)]
	["A3"
	 (customize-set-variable 'ps-paper-type 'a3)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'a3))
	 :active (boundp 'ps-paper-type)]
	["A4" 
	 (customize-set-variable 'ps-paper-type 'a4)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'a4))
	 :active (boundp 'ps-paper-type)]
	["A4small" 
	 (customize-set-variable 'ps-paper-type 'a4small)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'a4small))
	 :active (boundp 'ps-paper-type)]
	["B4" 
	 (customize-set-variable 'ps-paper-type 'b4)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'b4))
	 :active (boundp 'ps-paper-type)]
	["B5" 
	 (customize-set-variable 'ps-paper-type 'b5)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'b5))
	 :active (boundp 'ps-paper-type)]
	)
       ["Color Printing"
	(cond (ps-print-color-p
	       (customize-set-variable 'ps-print-color-p nil)
	       ;; I'm wondering whether all this muck is usefull.
	       (and (boundp 'original-face-background)
		    original-face-background
		    (set-face-background 'default original-face-background)))
	      (t
	       (customize-set-variable 'ps-print-color-p t)
	       (setq original-face-background 
		     (face-background-instance 'default))
	       (set-face-background 'default "white")))
	:style toggle 
	:selected (and (boundp 'ps-print-color-p) ps-print-color-p)
	:active (boundp 'ps-print-color-p)])
      ("\"Other Window\" Location"
       ["Always in Same Frame"
	(customize-set-variable 
	 'get-frame-for-buffer-default-instance-limit nil)
	:style radio
	:selected (null get-frame-for-buffer-default-instance-limit)]
       ["Other Frame (2 Frames Max)"
	(customize-set-variable 'get-frame-for-buffer-default-instance-limit 2)
	:style radio
	:selected (eq 2 get-frame-for-buffer-default-instance-limit)]
       ["Other Frame (3 Frames Max)"
	(customize-set-variable 'get-frame-for-buffer-default-instance-limit 3)
	:style radio
	:selected (eq 3 get-frame-for-buffer-default-instance-limit)]
       ["Other Frame (4 Frames Max)"
	(customize-set-variable 'get-frame-for-buffer-default-instance-limit 4)
	:style radio
	:selected (eq 4 get-frame-for-buffer-default-instance-limit)]
       ["Other Frame (5 Frames Max)"
	(customize-set-variable 'get-frame-for-buffer-default-instance-limit 5)
	:style radio
	:selected (eq 5 get-frame-for-buffer-default-instance-limit)]
       ["Always Create New Frame"
	(customize-set-variable 'get-frame-for-buffer-default-instance-limit 0)
	:style radio
	:selected (eq 0 get-frame-for-buffer-default-instance-limit)]
       "-----"
       ["Temp Buffers Always in Same Frame"
	(customize-set-variable 'temp-buffer-show-function 
				'show-temp-buffer-in-current-frame)
	:style radio
	:selected (eq temp-buffer-show-function
		      'show-temp-buffer-in-current-frame)]
       ["Temp Buffers Like Other Buffers"
	(customize-set-variable 'temp-buffer-show-function nil)
	:style radio
	:selected (null temp-buffer-show-function)]
       "-----"
       ["Make current frame gnuserv target"
	(customize-set-variable 'gnuserv-frame (if (eq gnuserv-frame t) nil t))
	:style toggle
	:selected (and (boundp 'gnuserv-frame) (eq gnuserv-frame t))
	:active (boundp 'gnuserv-frame)]
       )
      "-----"
      ("Syntax Highlighting"
       ["In This Buffer" 
	(progn ;; becomes buffer local
	  (font-lock-mode)
	  (customize-set-variable 'font-lock-mode font-lock-mode))
	:style toggle 
	:selected (and (boundp 'font-lock-mode) font-lock-mode)
	:active (boundp 'font-lock-mode)]
       ["Automatic"
	(customize-set-variable 'font-lock-auto-fontify
				(not font-lock-auto-fontify))
	:style toggle
	:selected (and (boundp 'font-lock-auto-fontify) font-lock-auto-fontify)
	:active (fboundp 'font-lock-mode)]
       "-----"
       ["Fonts" 
	(progn
	  (require 'font-lock)
	  (font-lock-use-default-fonts)
	  (customize-set-variable 'font-lock-use-fonts t)
	  (customize-set-variable 'font-lock-use-colors nil)
	  (font-lock-mode 1))
	:style radio
	:selected (and (boundp 'font-lock-use-fonts) font-lock-use-fonts)
	:active (fboundp 'font-lock-mode)]
       ["Colors"
	(progn
	  (require 'font-lock)
	  (font-lock-use-default-colors)
	  (customize-set-variable 'font-lock-use-colors t)
	  (customize-set-variable 'font-lock-use-fonts nil)
	  (font-lock-mode 1))
	:style radio
	:selected (and (boundp 'font-lock-use-colors) font-lock-use-colors)
	:active (boundp 'font-lock-mode)]
       "-----"
       ["Least"
	(progn
	  (require 'font-lock)
	  (if (or (and (not (integerp font-lock-maximum-decoration))
		       (not (eq t font-lock-maximum-decoration)))
		  (and (integerp font-lock-maximum-decoration)
		       (<= font-lock-maximum-decoration 0)))
	      nil
	    (customize-set-variable 'font-lock-maximum-decoration nil)
	    (font-lock-recompute-variables)))
	:style radio
	:active (fboundp 'font-lock-mode)
	:selected (and (boundp 'font-lock-maximium-decoration)
		       (or (and (not (integerp font-lock-maximum-decoration))
				(not (eq t font-lock-maximum-decoration)))
			   (and (integerp font-lock-maximum-decoration)
				(<= font-lock-maximum-decoration 0))))]
       ["More" 
	(progn
	  (require 'font-lock)
	  (if (and (integerp font-lock-maximum-decoration)
		   (= 1 font-lock-maximum-decoration))
	      nil
	    (customize-set-variable 'font-lock-maximum-decoration 1)
	    (font-lock-recompute-variables)))
	:style radio
	:active (fboundp 'font-lock-mode)
	:selected (and (boundp 'font-lock-maximium-decoration)
		       (integerp font-lock-maximum-decoration)
		       (= 1 font-lock-maximum-decoration))]
       ["Even More" 
	(progn
	  (require 'font-lock)
	  (if (and (integerp font-lock-maximum-decoration)
		   (= 2 font-lock-maximum-decoration))
	      nil
	    (customize-set-variable 'font-lock-maximum-decoration 2)
	    (font-lock-recompute-variables)))
	:style radio
	:active (fboundp 'font-lock-mode)
	:selected (and (boundp 'font-lock-maximum-decoration)
		       (integerp font-lock-maximum-decoration)
		       (= 2 font-lock-maximum-decoration))]
       ["Most"
	(progn
	  (require 'font-lock)
	  (if (or (eq font-lock-maximum-decoration t)
		  (and (integerp font-lock-maximum-decoration)
		       (>= font-lock-maximum-decoration 3)))
	      nil
	    (customize-set-variable 'font-lock-maximum-decoration t)
	    (font-lock-recompute-variables)))
	:style radio
	:active (fboundp 'font-lock-mode)
	:selected (and (boundp 'font-lock-maximum-decoration)
		       (or (eq font-lock-maximum-decoration t)
			   (and (integerp font-lock-maximum-decoration)
				(>= font-lock-maximum-decoration 3))))]
       "-----"
       ["Lazy"
	(progn ;; becomes buffer local
	  (lazy-shot-mode)
	  (customize-set-variable 'lazy-shot-mode lazy-shot-mode)
	  ;; this shouldn't be necessary so there has to
	  ;; be a redisplay bug lurking somewhere (or
	  ;; possibly another event handler bug)
	  (redraw-modeline))
	:active (and (boundp 'font-lock-mode) (boundp 'lazy-shot-mode) 
		     font-lock-mode)
	:style toggle
	:selected (and (boundp 'lazy-shot-mode) lazy-shot-mode)]
       ["Caching"
	(progn ;; becomes buffer local
	  (fast-lock-mode)
	  (customize-set-variable 'fast-lock-mode fast-lock-mode)
	  ;; this shouldn't be necessary so there has to
	  ;; be a redisplay bug lurking somewhere (or
	  ;; possibly another event handler bug)
	  (redraw-modeline))
	:active (and (boundp 'font-lock-mode) (boundp 'fast-lock-mode)
		     font-lock-mode)
	:style toggle
	:selected (and (boundp 'fast-lock-mode) fast-lock-mode)]
       )
      ("Paren Highlighting"
       ["None"
	(customize-set-variable 'paren-mode nil)
	:style radio 
	:selected (and (boundp 'paren-mode) (not paren-mode))
	:active (boundp 'paren-mode)]
       ["Blinking Paren"
	(customize-set-variable 'paren-mode 'blink-paren)
	:style radio
	:selected (and (boundp 'paren-mode) (eq paren-mode 'blink-paren))
	:active (boundp 'paren-mode)]
       ["Steady Paren"
	(customize-set-variable 'paren-mode 'paren)
	:style radio 
	:selected (and (boundp 'paren-mode) (eq paren-mode 'paren))
	:active (boundp 'paren-mode)]
       ["Expression"
	(customize-set-variable 'paren-mode 'sexp)
	:style radio 
	:selected (and (boundp 'paren-mode) (eq paren-mode 'sexp))
	:active (boundp 'paren-mode)]
;;	 ["Nested Shading"	     
;;	  (customize-set-variable 'paren-mode 'nested)
;;	  :style radio		     
;;	  :selected (and (boundp 'paren-mode) (eq paren-mode 'nested))
;;	  :active (boundp 'paren-mode)]
       )
      "-----"
      ("Frame Appearance"
       ["Frame-Local Font Menu" 
	(customize-set-variable 'font-menu-this-frame-only-p
				(not font-menu-this-frame-only-p))
	:style toggle 
	:selected (and (boundp 'font-menu-this-frame-only-p)
		       font-menu-this-frame-only-p)]
       ,@(if (featurep 'scrollbar)
	     '(["Scrollbars"
		(customize-set-variable 'scrollbars-visible-p
					(not scrollbars-visible-p))
		:style toggle 
		:selected scrollbars-visible-p]))
       ;; I don't think this is of any interest. - dverna apr. 98
       ;; #### I beg to differ!  Many FSFmacs converts hate the 3D
       ;; modeline, and it was perfectly fine to be able to turn them
       ;; off through the Options menu.  I would have uncommented this
       ;; source, but the code for saving options would not save the
       ;; modeline 3D-ness.  Grrr.  --hniksic
;;	 ["3D Modeline"			   
;;	  (progn				   
;;	    (if (zerop (specifier-instance modeline-shadow-thickness))
;;		(set-specifier modeline-shadow-thickness 2)
;;	      (set-specifier modeline-shadow-thickness 0))
;;	    (redraw-modeline t))		   
;;	  :style toggle			   
;;	  :selected (let ((thickness	   
;;			   (specifier-instance modeline-shadow-thickness)))
;;		      (and (integerp thickness)
;;			   (> thickness 0)))]
       ["Truncate Lines"
	(progn ;; becomes buffer-local
	  (setq truncate-lines (not truncate-lines))
	  (customize-set-variable 'truncate-lines truncate-lines))
	:style toggle
	:selected truncate-lines]
       ["Blinking Cursor"
	(customize-set-variable 'blink-cursor-mode (not blink-cursor-mode))
	:style toggle
	:selected (and (boundp 'blink-cursor-mode) blink-cursor-mode)
	:active (boundp 'blink-cursor-mode)]
       "-----"
       ["Block cursor" 
	(progn
	  (customize-set-variable 'bar-cursor nil)
	  (force-cursor-redisplay))
	:style radio
	:selected (null bar-cursor)]
       ["Bar cursor (1 pixel)" 
	(progn
	  (customize-set-variable 'bar-cursor t)
	  (force-cursor-redisplay))
	:style radio
	:selected (eq bar-cursor t)]
	["Bar cursor (2 pixels)" 
	 (progn
	   (customize-set-variable 'bar-cursor 2)
	   (force-cursor-redisplay))
	 :style radio 
	 :selected (and bar-cursor (not (eq bar-cursor t)))]
	"------"
	["Line Numbers"
	 (progn
	   (customize-set-variable 'line-number-mode (not line-number-mode))
	   (redraw-modeline))
	 :style toggle :selected line-number-mode]
	["Column Numbers"
	 (progn
	   (customize-set-variable 'column-number-mode
				   (not column-number-mode))
	   (redraw-modeline))
	 :style toggle :selected column-number-mode]
       )
      ("Menubar Appearance"
       ["Buffers Menu Length..."
	(customize-set-variable
	 'buffers-menu-max-size
	 ;; would it be better to open a customization buffer ?
	 (let ((val 
		(read-number
		 "Enter number of buffers to display (or 0 for unlimited): ")))
	   (if (eq val 0) nil val)))]
       ["Multi-Operation Buffers Sub-Menus"
	(customize-set-variable 'complex-buffers-menu-p
				(not complex-buffers-menu-p))
	:style toggle
	:selected complex-buffers-menu-p]
       ("Buffers Menu Sorting"
	["Most Recently Used"
	 (progn
	   (customize-set-variable 'buffers-menu-sort-function nil)
	   (customize-set-variable 'buffers-menu-grouping-function nil))
	 :style radio
	 :selected (null buffers-menu-sort-function)]
	["Alphabetically"
	 (progn
	   (customize-set-variable 'buffers-menu-sort-function
				   'sort-buffers-menu-alphabetically)
	   (customize-set-variable 'buffers-menu-grouping-function nil))
	 :style radio
	 :selected (eq 'sort-buffers-menu-alphabetically
		       buffers-menu-sort-function)]
	["By Major Mode, Then Alphabetically"
	 (progn
	   (customize-set-variable 
	    'buffers-menu-sort-function
	    'sort-buffers-menu-by-mode-then-alphabetically)
	   (customize-set-variable 
	    'buffers-menu-grouping-function
	    'group-buffers-menu-by-mode-then-alphabetically))
	 :style radio
	 :selected (eq 'sort-buffers-menu-by-mode-then-alphabetically
		       buffers-menu-sort-function)])
       ["Submenus for Buffer Groups"
	(customize-set-variable 'buffers-menu-submenus-for-groups-p
				(not buffers-menu-submenus-for-groups-p))
	:style toggle
	:selected buffers-menu-submenus-for-groups-p]
       "---"
       ["Ignore Scaled Fonts"
	(customize-set-variable 'font-menu-ignore-scaled-fonts
				(not font-menu-ignore-scaled-fonts))
	:style toggle 
	:selected (and (boundp 'font-menu-ignore-scaled-fonts)
		       font-menu-ignore-scaled-fonts)]
       )
      ,@(if (featurep 'toolbar)
	    '(("Toolbar Appearance"
	       ["Visible" 
		(customize-set-variable 'toolbar-visible-p
					(not toolbar-visible-p))
		:style toggle
		:selected toolbar-visible-p]
	       ["Captioned" 
		(customize-set-variable 'toolbar-captioned-p
					(not toolbar-captioned-p))
		:style toggle
		:selected toolbar-captioned-p]
	       ("Default Location"
		["Top"
		 (customize-set-variable 'default-toolbar-position 'top)
		 :style radio 
		 :selected (eq default-toolbar-position 'top)]
		["Bottom" 
		 (customize-set-variable 'default-toolbar-position 'bottom)
		 :style radio
		 :selected (eq default-toolbar-position 'bottom)]
		["Left"
		 (customize-set-variable 'default-toolbar-position 'left)
		 :style radio
		 :selected (eq default-toolbar-position 'left)]
		["Right"
		 (customize-set-variable 'default-toolbar-position 'right)
		 :style radio
		 :selected (eq default-toolbar-position 'right)]
		)
	       )))
      ("Mouse"
       ["Avoid Text..."
	(customize-set-variable 'mouse-avoidance-mode 
				(if mouse-avoidance-mode nil 'banish))
	:style toggle
	:selected (and (boundp 'mouse-avoidance-mode) mouse-avoidance-mode)
	:active (and (boundp 'mouse-avoidance-mode)
		     (device-on-window-system-p))]
       ["strokes-mode"
	(customize-set-variable 'strokes-mode (not strokes-mode))
	:style toggle
	:selected (and (boundp 'strokes-mode) strokes-mode)
	:active (and (boundp 'strokes-mode)
		     (device-on-window-system-p))]
       )
      ("Open URLs With"
       ["Emacs-W3" 
	(customize-set-variable 'browse-url-browser-function 'browse-url-w3)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-w3))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-w3)
		     (fboundp 'w3-fetch))]
       ["Netscape" 
	(customize-set-variable 'browse-url-browser-function 
				'browse-url-netscape)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-netscape))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-netscape))]
       ["Mosaic" 
	(customize-set-variable 'browse-url-browser-function
				'browse-url-mosaic)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-mosaic))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-mosaic))]
       ["Mosaic (CCI)" 
	(customize-set-variable 'browse-url-browser-function 'browse-url-cci)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-cci))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-cci))]
       ["IXI Mosaic" 
	(customize-set-variable 'browse-url-browser-function 
				'browse-url-iximosaic)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-iximosaic))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-iximosaic))]
       ["Lynx (xterm)" 
	(customize-set-variable 'browse-url-browser-function
				'browse-url-lynx-xterm)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-lynx-xterm))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-lynx-xterm))]
       ["Lynx (xemacs)"
	(customize-set-variable 'browse-url-browser-function
				'browse-url-lynx-emacs)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-lynx-emacs))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-lynx-emacs))]
       ["Grail" 
	(customize-set-variable 'browse-url-browser-function
				'browse-url-grail)
	:style radio
	:selected (and (boundp 'browse-url-browser-function)
		       (eq browse-url-browser-function 'browse-url-grail))
	:active (and (boundp 'browse-url-browser-function)
		     (fboundp 'browse-url-grail))]
       )
      "-----"
      ["Edit Faces..." (customize-face nil)]
      ("Font"   :filter font-menu-family-constructor)
      ("Size"	:filter font-menu-size-constructor)
;      ("Weight"	:filter font-menu-weight-constructor)
      "-----"
      ["Save Options" customize-save-customized]
      )

     ("Buffers"
      :filter buffers-menu-filter
      ["Read Only" (toggle-read-only)
       :style toggle :selected buffer-read-only]
      ["List All Buffers" list-buffers]
      "--"
      )

     ("Tools"
      ["Grep..." grep
       :active (fboundp 'grep)]
      ["Compile..." compile
       :active (fboundp 'compile)]
      ["Shell" shell
       :active (fboundp 'shell)]
      ["Shell Command..." shell-command
       :active (fboundp 'shell-command)]
      ["Shell Command on Region..." shell-command-on-region
       :active (and (fboundp 'shell-command-on-region) (region-exists-p))]
      ["Debug (GDB)..." gdb
       :active (fboundp 'gdb)]
      ["Debug (DBX)..." dbx
       :active (fboundp 'dbx)]
      "-----"
      ("Tags"
       ["Find Tag..." find-tag]
       ["Find Other Window..." find-tag-other-window]
       ["Next Tag..." (find-tag nil)]
       ["Next Other Window..." (find-tag-other-window nil)]
       ["Next File" next-file]
       "-----"
       ["Tags Search..." tags-search]
       ["Tags Replace..." tags-query-replace]
       ["Continue Search/Replace" tags-loop-continue]
       "-----"
       ["Pop stack" pop-tag-mark]
       ["Apropos..." tags-apropos]
       "-----"
       ["Set Tags Table File..." visit-tags-table]
       ))

     nil				; the partition: menus after this are flushright

     ("Help"
      ["About XEmacs..." about-xemacs]
      ("Basics"
       ["Installation" describe-installation
	:active (boundp 'Installation-string)]
       ;; Tutorials.
       ,(if (featurep 'mule)
	    ;; Mule tutorials.
	    (let ((lang language-info-alist)
		  submenu tut)
	      (while lang
		(and (setq tut (assq 'tutorial (car lang)))
		     (not (string= (caar lang) "ASCII"))
		     (setq
		      submenu
		      (cons
		       `[,(caar lang) (help-with-tutorial nil ,(cdr tut))]
		       submenu)))
		(setq lang (cdr lang)))
	      (append `("Tutorials"
			:filter tutorials-menu-filter
			["Default" help-with-tutorial t
			 ,(concat "(" current-language-environment ")")])
		      submenu))
	  ;; Non mule tutorials.
	  (let ((lang tutorial-supported-languages)
		submenu)
	    (while lang
	      (setq submenu
		    (cons
		     `[,(caar lang)
		       (help-with-tutorial ,(format "TUTORIAL.%s"
						    (cadr (car lang))))]
		     submenu))
	      (setq lang (cdr lang)))
	    (append '("Tutorials"
		      ["English" help-with-tutorial])
		    submenu)))
       ["News" view-emacs-news]
       ["Packages" finder-by-keyword]
       ["Splash" xemacs-splash-buffer])
      "-----"
      ("XEmacs FAQ"
       ["FAQ (local)" xemacs-local-faq]
       ["FAQ via WWW" xemacs-www-faq	(boundp 'browse-url-browser-function)]
       ["Home Page" xemacs-www-page		(boundp 'browse-url-browser-function)])
      ("Samples"
       ["Sample .emacs" (find-file (locate-data-file "sample.emacs")) (locate-data-file "sample.emacs")]
       ["Sample .Xdefaults" (find-file (locate-data-file "sample.Xdefaults")) (locate-data-file "sample.Xdefaults")]
       ["Sample enriched" (find-file (locate-data-file "enriched.doc")) (locate-data-file "enriched.doc")])
      "-----"
      ("Lookup in Info"
       ["Key Binding..." Info-goto-emacs-key-command-node]
       ["Command..." Info-goto-emacs-command-node]
       ["Function..." Info-elisp-ref]
       ["Topic..." Info-query])
      ("Manuals"
       ["Info" info]
       ["Unix Manual..." manual-entry])
      ("Commands & Keys"
       ["Mode" describe-mode]
       ["Apropos..." hyper-apropos]
       ["Apropos Docs..." apropos-documentation]
       "-----"
       ["Key..." describe-key]
       ["Bindings" describe-bindings]
       ["Mouse Bindings" describe-pointer]
       ["Recent Keys" view-lossage]
       "-----"
       ["Function..." describe-function]
       ["Variable..." describe-variable]
       ["Locate Command..." where-is])
      "-----"
      ["Recent Messages" view-lossage]
      ("Misc"
       ["No Warranty" describe-no-warranty]
       ["XEmacs License" describe-copying]
       ["The Latest Version" describe-distribution])
      ["Send Bug Report..." report-emacs-bug]))))


(defun maybe-add-init-button ()
  "Don't call this.
Adds `Load .emacs' button to menubar when starting up with -q."
  ;; by Stig@hackvan.com
  (cond
   (init-file-user nil)
   ((file-exists-p (expand-file-name ".emacs" "~"))
    (add-menu-button nil
		     ["Load .emacs"
		      (progn (delete-menu-item '("Load .emacs"))
			     (load-user-init-file (user-login-name)))
		      ]
		     "Help"))
   (t nil)))

(add-hook 'before-init-hook 'maybe-add-init-button)


;;; The File menu

(defvar put-buffer-names-in-file-menu t)


;;; The Bookmarks menu

(defun bookmark-menu-filter (&rest ignore)
  (let ((definedp (and (boundp 'bookmark-alist)
		       bookmark-alist
		       t)))
    `(,(if definedp
	   '("Jump to Bookmark"
	     :filter (lambda (&rest junk)
		       (mapcar #'(lambda (bmk)
				   `[,bmk (bookmark-jump ',bmk)])
			       (bookmark-all-names))))
	 ["Jump to Bookmark" nil nil])
      ["Set bookmark" bookmark-set
       :active (fboundp 'bookmark-set)]
      "---"
      ["Insert contents" bookmark-menu-insert
       :active (fboundp 'bookmark-menu-insert)]
      ["Insert location" bookmark-menu-locate
       :active (fboundp 'bookmark-menu-locate)]
      "---"
      ["Rename bookmark" bookmark-menu-rename
       :active (fboundp 'bookmark-menu-rename)]
      ,(if definedp
	   '("Delete Bookmark"
	     :filter (lambda (&rest junk)
		       (mapcar #'(lambda (bmk)
				   `[,bmk (bookmark-delete ',bmk)])
			       (bookmark-all-names))))
	 ["Delete Bookmark" nil nil])
      ["Edit Bookmark List" bookmark-bmenu-list	,definedp]
      "---"
      ["Save bookmarks"        bookmark-save		,definedp]
      ["Save bookmarks as..."  bookmark-write		,definedp]
      ["Load a bookmark file" bookmark-load
       :active (fboundp 'bookmark-load)])))

;;; The Buffers menu

(defgroup buffers-menu nil
  "Customization of `Buffers' menu."
  :group 'menu)

(defcustom buffers-menu-max-size 25
  "*Maximum number of entries which may appear on the \"Buffers\" menu.
If this is 10, then only the ten most-recently-selected buffers will be
shown.  If this is nil, then all buffers will be shown.  Setting this to
a large number or nil will slow down menu responsiveness."
  :type '(choice (const :tag "Show all" nil)
		 (integer 10))
  :group 'buffers-menu)

(defcustom complex-buffers-menu-p nil
  "*If non-nil, the buffers menu will contain several commands.
Commands will be presented as submenus of each buffer line.  If this
is false, then there will be only one command: select that buffer."
  :type 'boolean
  :group 'buffers-menu)

(defcustom buffers-menu-submenus-for-groups-p nil
  "*If non-nil, the buffers menu will contain one submenu per group of buffers.
The grouping function is specified in `buffers-menu-grouping-function'.
If this is an integer, do not build submenus if the number of buffers
is not larger than this value."
  :type '(choice (const :tag "No Subgroups" nil)
		 (integer :tag "Max. submenus" 10)
		 (sexp :format "%t\n" :tag "Allow Subgroups" :value t))
  :group 'buffers-menu)

(defcustom buffers-menu-switch-to-buffer-function 'switch-to-buffer
  "*The function to call to select a buffer from the buffers menu.
`switch-to-buffer' is a good choice, as is `pop-to-buffer'."
  :type '(radio (function-item switch-to-buffer)
		(function-item pop-to-buffer)
		(function :tag "Other"))
  :group 'buffers-menu)

(defcustom buffers-menu-omit-function 'buffers-menu-omit-invisible-buffers
  "*If non-nil, a function specifying the buffers to omit from the buffers menu.
This is passed a buffer and should return non-nil if the buffer should be
omitted.  The default value `buffers-menu-omit-invisible-buffers' omits
buffers that are normally considered \"invisible\" (those whose name
begins with a space)."
  :type '(choice (const :tag "None" nil)
		 function)
  :group 'buffers-menu)

(defcustom buffers-menu-format-buffer-line-function 'format-buffers-menu-line
  "*The function to call to return a string to represent a buffer in the
buffers menu.  The function is passed a buffer and should return a string.
The default value `format-buffers-menu-line' just returns the name of
the buffer.  Also check out `slow-format-buffers-menu-line' which
returns a whole bunch of info about a buffer."
  :type 'function
  :group 'buffers-menu)

(defcustom buffers-menu-sort-function
  'sort-buffers-menu-by-mode-then-alphabetically
  "*If non-nil, a function to sort the list of buffers in the buffers menu.
It will be passed two arguments (two buffers to compare) and should return
T if the first is \"less\" than the second.  One possible value is
`sort-buffers-menu-alphabetically'; another is
`sort-buffers-menu-by-mode-then-alphabetically'."
  :type '(choice (const :tag "None" nil)
		 function)
  :group 'buffers-menu)

(defcustom buffers-menu-grouping-function
  'group-buffers-menu-by-mode-then-alphabetically
  "*If non-nil, a function to group buffers in the buffers menu together.
It will be passed two arguments, successive members of the sorted buffers
list after being passed through `buffers-menu-sort-function'.  It should
return non-nil if the second buffer begins a new group.  The return value
should be the name of the old group, which may be used in hierarchical
buffers menus.  The last invocation of the function contains nil as the
second argument, so that the name of the last group can be determined.

The sensible values of this function are dependent on the value specified
for `buffers-menu-sort-function'."
  :type '(choice (const :tag "None" nil)
		 function)
  :group 'buffers-menu)

(defun buffers-menu-omit-invisible-buffers (buf)
  "For use as a value of `buffers-menu-omit-function'.
Omits normally invisible buffers (those whose name begins with a space)."
  (not (null (string-match "\\` " (buffer-name buf)))))

(defun sort-buffers-menu-alphabetically (buf1 buf2)
  "For use as a value of `buffers-menu-sort-function'.
Sorts the buffers in alphabetical order by name, but puts buffers beginning
with a star at the end of the list."
  (let* ((nam1 (buffer-name buf1))
	 (nam2 (buffer-name buf2))
	 (star1p (not (null (string-match "\\`*" nam1))))
	 (star2p (not (null (string-match "\\`*" nam2)))))
    (if (not (eq star1p star2p))
	(not star1p)
      (string-lessp nam1 nam2))))

(defun sort-buffers-menu-by-mode-then-alphabetically (buf1 buf2)
  "For use as a value of `buffers-menu-sort-function'.
Sorts first by major mode and then alphabetically by name, but puts buffers
beginning with a star at the end of the list."
  (let* ((nam1 (buffer-name buf1))
	 (nam2 (buffer-name buf2))
	 (star1p (not (null (string-match "\\`*" nam1))))
	 (star2p (not (null (string-match "\\`*" nam2))))
	 (mode1 (symbol-value-in-buffer 'major-mode buf1))
	 (mode2 (symbol-value-in-buffer 'major-mode buf2)))
    (cond ((not (eq star1p star2p)) (not star1p))
	  ((and star1p star2p (string-lessp nam1 nam2)))
	  ((string-lessp mode1 mode2) t)
	  ((string-lessp mode2 mode1) nil)
	  (t (string-lessp nam1 nam2)))))

;; this version is too slow on some machines.
(defun slow-format-buffers-menu-line (buffer)
  "For use as a value of `buffers-menu-format-buffer-line-function'.
This returns a string containing a bunch of info about the buffer."
  (format "%s%s %-19s %6s %-15s %s"
	  (if (buffer-modified-p buffer) "*" " ")
	  (if (symbol-value-in-buffer 'buffer-read-only buffer) "%" " ")
	  (buffer-name buffer)
	  (buffer-size buffer)
	  (symbol-value-in-buffer 'mode-name buffer)
	  (or (buffer-file-name buffer) "")))

(defun format-buffers-menu-line (buffer)
  "For use as a value of `buffers-menu-format-buffer-line-function'.
This just returns the buffer's name."
  (buffer-name buffer))

(defun group-buffers-menu-by-mode-then-alphabetically (buf1 buf2)
  "For use as a value of `buffers-menu-grouping-function'.
This groups buffers by major mode.  It only really makes sense if
`buffers-menu-sorting-function' is
`sort-buffers-menu-by-mode-then-alphabetically'."
  (cond ((string-match "\\`*" (buffer-name buf1))
	 (and (null buf2) "*Misc*"))
	((or (null buf2)
	     (string-match "\\`*" (buffer-name buf2))
	     (not (eq (symbol-value-in-buffer 'major-mode buf1)
		      (symbol-value-in-buffer 'major-mode buf2))))
	 (symbol-value-in-buffer 'mode-name buf1))
	(t nil)))

(defun buffer-menu-save-buffer (buffer)
  (save-excursion
    (set-buffer buffer)
    (save-buffer)))

(defun buffer-menu-write-file (buffer)
  (save-excursion
    (set-buffer buffer)
    (write-file (read-file-name
		 (format "Write %s to file: "
			 (buffer-name (current-buffer)))))))

(defsubst build-buffers-menu-internal (buffers)
  (let (name line)
    (mapcar
     #'(lambda (buffer)
	 (if (eq buffer t)
	     "---"
	   (setq line (funcall buffers-menu-format-buffer-line-function
			       buffer))
	   (if complex-buffers-menu-p
	       (delq nil
		     (list line
			   (vector "Switch to Buffer"
				   (list buffers-menu-switch-to-buffer-function
					 (setq name (buffer-name buffer)))
				   t)
			   (if (eq buffers-menu-switch-to-buffer-function
				   'switch-to-buffer)
			       (vector "Switch to Buffer, Other Frame"
				       (list 'switch-to-buffer-other-frame
					     (setq name (buffer-name buffer)))
				       t)
			     nil)
			   (if (and (buffer-modified-p buffer)
				    (buffer-file-name buffer))
			       (vector "Save Buffer"
				       (list 'buffer-menu-save-buffer name) t)
			     ["Save Buffer" nil nil]
			     )
			   (vector "Save As..."
				   (list 'buffer-menu-write-file name) t)
			   (vector "Delete Buffer" (list 'kill-buffer name)
				   t)))
	     ;; ### We don't want buffer names to be translated,
	     ;; ### so we put the buffer name in the suffix.
	     ;; ### Also, avoid losing with non-ASCII buffer names.
	     ;; ### We still lose, however, if complex-buffers-menu-p. --mrb
	     (vector ""
		     (list buffers-menu-switch-to-buffer-function
			   (buffer-name buffer))
		     t line))))
     buffers)))

(defun buffers-menu-filter (menu)
  "This is the menu filter for the top-level buffers \"Buffers\" menu.
It dynamically creates a list of buffers to use as the contents of the menu.
Only the most-recently-used few buffers will be listed on the menu, for
efficiency reasons.  You can control how many buffers will be shown by
setting `buffers-menu-max-size'.  You can control the text of the menu
items by redefining the function `format-buffers-menu-line'."
  (let ((buffers (delete-if buffers-menu-omit-function (buffer-list))))
    (and (integerp buffers-menu-max-size)
	 (> buffers-menu-max-size 1)
	 (> (length buffers) buffers-menu-max-size)
	 ;; shorten list of buffers (not with submenus!)
	 (not (and buffers-menu-grouping-function
		   buffers-menu-submenus-for-groups-p))
	 (setcdr (nthcdr buffers-menu-max-size buffers) nil))
    (if buffers-menu-sort-function
	(setq buffers (sort buffers buffers-menu-sort-function)))
    (if (and buffers-menu-grouping-function
	     buffers-menu-submenus-for-groups-p
	     (or (not (integerp buffers-menu-submenus-for-groups-p))
		 (> (length buffers) buffers-menu-submenus-for-groups-p)))
	(let (groups groupnames current-group)
	  (mapl
	   #'(lambda (sublist)
	       (let ((groupname (funcall buffers-menu-grouping-function
					 (car sublist) (cadr sublist))))
		 (setq current-group (cons (car sublist) current-group))
		 (if groupname
		     (progn
		       (setq groups (cons (nreverse current-group)
					  groups))
		       (setq groupnames (cons groupname groupnames))
		       (setq current-group nil)))))
	   buffers)
	  (setq buffers
		(mapcar*
		 #'(lambda (groupname group)
		     (cons groupname (build-buffers-menu-internal group)))
		 (nreverse groupnames)
		 (nreverse groups))))
      (if buffers-menu-grouping-function
	  (progn
	    (setq buffers
		  (mapcon
		   #'(lambda (sublist)
		       (cond ((funcall buffers-menu-grouping-function
				       (car sublist) (cadr sublist))
			      (list (car sublist) t))
			     (t (list (car sublist)))))
		   buffers))
	    ;; remove a trailing separator.
	    (and (>= (length buffers) 2)
		 (let ((lastcdr (nthcdr (- (length buffers) 2) buffers)))
		   (if (eq t (cadr lastcdr))
		       (setcdr lastcdr nil))))))
      (setq buffers (build-buffers-menu-internal buffers)))
    (append menu buffers)
    ))

(defun language-environment-menu-filter (menu)
  "This is the menu filter for the \"Language Environment\" submenu."
  (mapcar (lambda (env-sym)
	    `[ ,(capitalize (symbol-name env-sym))
	       (set-language-environment ',env-sym)])
	  language-environment-list))


;;; The Options menu

;; We'll keep those variables here for a while, in order to provide a
;; function for porting the old options file that a user may own to Custom.

(defvar options-save-faces nil
  "*Non-nil value means save-options will save information about faces.
A nil value means save-options will not save face information.
Set this non-nil only if you use M-x edit-faces to change face
settings.  If you use M-x customize-face or the \"Browse Faces...\"
menu entry, you will see a button in the Customize Face buffer that you
can use to permanently save your face changes.

M-x edit-faces is deprecated.  Support for it and this variable will
be discontinued in a future release.")

(defvar save-options-init-file nil
  "File into which to save forms to load the options file (nil for .emacs).
Normally this is nil, which means save into your .emacs file (the value
of `user-init-file'.")

(defvar save-options-file ".xemacs-options"
  "File to save options into.
This file is loaded from your .emacs file.
If this is a relative filename, it is put into the same directory as your
.emacs file.")



;;; The Help menu

(if (featurep 'mule)
    (defun tutorials-menu-filter (menu-items)
      ;; If there's a tutorial for the current language environment, make it
      ;; appear first as the default one. Otherwise, use the english one.
      (let* ((menu menu-items)
	     (item (pop menu-items)))
	(aset
	 item 3
	 (concat "("
		 (if (assoc
		      'tutorial
		      (assoc current-language-environment language-info-alist))
		     current-language-environment
		   "English")
		 ")"))
	menu)))


(set-menubar default-menubar)


;;; Popup menus.

(defconst default-popup-menu
  '("XEmacs Commands"
    ["Undo" advertised-undo
     :active (and (not (eq buffer-undo-list t))
		  (or buffer-undo-list pending-undo-list))
     :suffix (if (or (eq last-command 'undo)
		     (eq last-command 'advertised-undo))
		 "More" "")]
    ["Cut" kill-primary-selection
     :active (selection-owner-p)]
    ["Copy" copy-primary-selection
     :active (selection-owner-p)]
    ["Paste" yank-clipboard-selection
     :active (selection-exists-p 'CLIPBOARD)]
    ["Clear" delete-primary-selection
     :active (selection-owner-p)]
    "-----"
    ["Select Block" mark-paragraph]
    ["Split Window" split-window-vertically]
    ["Unsplit Window" delete-other-windows]
    ))

(defvar global-popup-menu nil
  "The global popup menu.  This is present in all modes.
See the function `popup-menu' for a description of menu syntax.")

(defvar mode-popup-menu nil
  "The mode-specific popup menu.  Automatically buffer local.
This is appended to the default items in `global-popup-menu'.
See the function `popup-menu' for a description of menu syntax.")
(make-variable-buffer-local 'mode-popup-menu)

;; In an effort to avoid massive menu clutter, this mostly worthless menu is
;; superceded by any local popup menu...
(setq-default mode-popup-menu default-popup-menu)

(defvar activate-popup-menu-hook nil
  "Function or functions run before a mode-specific popup menu is made visible.
These functions are called with no arguments, and should interrogate and
modify the value of `global-popup-menu' or `mode-popup-menu' as desired.
Note: this hook is only run if you use `popup-mode-menu' for activating the
global and mode-specific commands; if you have your own binding for button3,
this hook won't be run.")

(defun popup-mode-menu ()
  "Pop up a menu of global and mode-specific commands.
The menu is computed by combining `global-popup-menu' and `mode-popup-menu'."
  (interactive "@_")
  (run-hooks 'activate-popup-menu-hook)
  (popup-menu
   (cond ((and global-popup-menu mode-popup-menu)
	  ;; Merge global-popup-menu and mode-popup-menu
	  (check-menu-syntax mode-popup-menu)
	  (let* ((title (car mode-popup-menu))
		 (items (cdr mode-popup-menu))
		 mode-filters)
	    ;; Strip keywords from local menu for attaching them at the top
	    (while (and items
			(keywordp (car items)))
	      ;; Push both keyword and its argument.
	      (push (pop items) mode-filters)
	      (push (pop items) mode-filters))
	    (setq mode-filters (nreverse mode-filters))
	    ;; If mode-filters contains a keyword already present in
	    ;; `global-popup-menu', you will probably lose.
	    (append (list (car global-popup-menu))
		    mode-filters
		    (cdr global-popup-menu)
		    '("---" "---")
		    (if popup-menu-titles (list title))
		    (if popup-menu-titles '("---" "---"))
		    items)))
	 (t
	  (or mode-popup-menu
	      global-popup-menu
	      (error "No menu defined in this buffer"))))))

(defun popup-buffer-menu (event)
  "Pop up a copy of the Buffers menu (from the menubar) where the mouse is clicked."
  (interactive "e")
  (let ((window (and (event-over-text-area-p event) (event-window event)))
	(bmenu nil))
    (or window
	(error "Pointer must be in a normal window"))
    (select-window window)
    (if current-menubar
	(setq bmenu (assoc "Buffers" current-menubar)))
    (if (null bmenu)
	(setq bmenu (assoc "Buffers" default-menubar)))
    (if (null bmenu)
	(error "Can't find the Buffers menu"))
    (popup-menu bmenu)))

(defun popup-menubar-menu (event)
  "Pop up a copy of menu that also appears in the menubar"
  ;; by Stig@hackvan.com
  (interactive "e")
  (let ((window (and (event-over-text-area-p event) (event-window event)))
	popup-menubar)
    (or window
	(error "Pointer must be in a normal window"))
    (select-window window)
    (and current-menubar (run-hooks 'activate-menubar-hook))
    ;; ##### Instead of having to copy this just to safely get rid of
    ;; any nil what we should really do is fix up the internal menubar
    ;; code to just ignore nil if generating a popup menu
    (setq popup-menubar (delete nil (copy-sequence (or current-menubar
						       default-menubar))))
    (popup-menu (cons "Menubar Menu" popup-menubar))
    ))

(global-set-key 'button3 'popup-mode-menu)
;; shift button3 and shift button2 are reserved for Hyperbole
(global-set-key '(meta control button3) 'popup-buffer-menu)
;; The following command is way too dangerous with Custom.
;; (global-set-key '(meta shift button3) 'popup-menubar-menu)

;; Here's a test of the cool new menu features (from Stig).

;;(setq mode-popup-menu
;;      '("Test Popup Menu"
;;        :filter cdr
;;        ["this item won't appear because of the menu filter" ding t]
;;        "--:singleLine"
;;        "singleLine"
;;        "--:doubleLine"
;;        "doubleLine"
;;        "--:singleDashedLine"
;;        "singleDashedLine"
;;        "--:doubleDashedLine"
;;        "doubleDashedLine"
;;        "--:noLine"
;;        "noLine"
;;        "--:shadowEtchedIn"
;;        "shadowEtchedIn"
;;        "--:shadowEtchedOut"
;;        "shadowEtchedOut"
;;        "--:shadowDoubleEtchedIn"
;;        "shadowDoubleEtchedIn"
;;        "--:shadowDoubleEtchedOut"
;;        "shadowDoubleEtchedOut"
;;        "--:shadowEtchedInDash"
;;        "shadowEtchedInDash"
;;        "--:shadowEtchedOutDash"
;;        "shadowEtchedOutDash"
;;        "--:shadowDoubleEtchedInDash"
;;        "shadowDoubleEtchedInDash"
;;        "--:shadowDoubleEtchedOutDash"
;;        "shadowDoubleEtchedOutDash"
;;        ))

(defun xemacs-splash-buffer ()
  "Redisplay XEmacs splash screen in a buffer."
  (interactive)
  (let ((buffer (get-buffer-create "*Splash*")))
    (set-buffer buffer)
    (erase-buffer buffer)
    (startup-splash-frame)
    (pop-to-buffer buffer)
    (delete-other-windows)))


;;; backwards compatibility
(provide 'x-menubar)
(provide 'menubar-items)

;;; x-menubar.el ends here.
