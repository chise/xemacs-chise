;;; menubar-items.el --- Menubar and popup-menu content for XEmacs.

;; Copyright (C) 1991-1995, 1997-1998 Free Software Foundation, Inc.
;; Copyright (C) 1995 Tinker Systems and INS Engineering Corp.
;; Copyright (C) 1995 Sun Microsystems.
;; Copyright (C) 1995, 1996, 2000 Ben Wing.
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

(defun menu-truncate-list (list n)
  (if (<= (length list) n)
      list
    (butlast list (- (length list) n))))

(defun submenu-generate-accelerator-spec (list &optional omit-chars-list)
  "Add auto-generated accelerator specifications to a submenu.
This can be used to add accelerators to the return value of a menu filter
function.  It correctly ignores unselectable items.  It will destructively
modify the list passed to it.  If an item already has an auto-generated
accelerator spec, this will be removed before the new one is added, making
this function idempotent.

If OMIT-CHARS-LIST is given, it should be a list of lowercase characters,
which will not be used as accelerators."
  (let ((n 0))
    (dolist (item list list)
      (cond
       ((vectorp item)
	(setq n (1+ n))
	(aset item 0
	      (concat
	       (menu-item-generate-accelerator-spec n omit-chars-list)
	       (menu-item-strip-accelerator-spec (aref item 0)))))
       ((consp item)
	(setq n (1+ n))
	(setcar item
		(concat
		 (menu-item-generate-accelerator-spec n omit-chars-list)
		 (menu-item-strip-accelerator-spec (car item)))))))))

(defun menu-item-strip-accelerator-spec (item)
  "Strip an auto-generated accelerator spec off of ITEM.
ITEM should be a string.  This removes specs added by
`menu-item-generate-accelerator-spec' and `submenu-generate-accelerator-spec'."
  (if (string-match "%_. " item)
      (substring item 4)
    item))

(defun menu-item-generate-accelerator-spec (n &optional omit-chars-list)
  "Return an accelerator specification for use with auto-generated menus.
This should be concat'd onto the beginning of each menu line.  The spec
allows the Nth line to be selected by the number N.  '0' is used for the
10th line, and 'a' through 'z' are used for the following 26 lines.

If OMIT-CHARS-LIST is given, it should be a list of lowercase characters,
which will not be used as accelerators."
  (cond ((< n 10) (concat "%_" (int-to-string n) " "))
	((= n 10) "%_0 ")
	((<= n 36)
	 (setq n (- n 10))
	 (let ((m 0))
	   (while (> n 0)
	     (setq m (1+ m))
	     (while (memq (int-to-char (+ m (- (char-to-int ?a) 1)))
			  omit-chars-list)
	       (setq m (1+ m)))
	     (setq n (1- n)))
	   (if (<= m 26)
	       (concat
		"%_"
		(char-to-string (int-to-char (+ m (- (char-to-int ?a) 1))))
		" ")
	     "")))
	(t "")))

(defconst default-menubar
  (purecopy-menubar
   ;; note backquote.
   `(
     ("%_File"
      ["%_Open..." find-file]
      ["Open in Other %_Window..." find-file-other-window]
      ["Open in New %_Frame..." find-file-other-frame]
      ["%_Hex Edit File..." hexl-find-file
       :active (fboundp 'hexl-find-file)]
      ["%_Insert File..." insert-file]
      ["%_View File..." view-file]
      "------"
      ["%_Save" save-buffer
       :active (buffer-modified-p)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      ["Save %_As..." write-file]
      ["Save So%_me Buffers" save-some-buffers]
      "-----"
      ["%_Print Buffer" lpr-buffer
       :active (fboundp 'lpr-buffer)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      ["Prett%_y-Print Buffer" ps-print-buffer-with-faces
       :active (fboundp 'ps-print-buffer-with-faces)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      "-----"
      ["%_Revert Buffer" revert-buffer
       :active (or buffer-file-name revert-buffer-function)
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      ["Re%_cover File..." recover-file]
      ["Recover S%_ession..." recover-session]
      "-----"
      ["E%_xit XEmacs" save-buffers-kill-emacs]
      )

     ("%_Edit"
      ["%_Undo" advertised-undo
       :active (and (not (eq buffer-undo-list t))
		    (or buffer-undo-list pending-undo-list))
       :suffix (if (or (eq last-command 'undo)
		       (eq last-command 'advertised-undo))
		   "More" "")]
      ["%_Redo" redo
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
      "----"
      ["Cu%_t" kill-primary-selection
       :active (selection-owner-p)]
      ["%_Copy" copy-primary-selection
       :active (selection-owner-p)]
      ["%_Paste" yank-clipboard-selection
       :active (selection-exists-p 'CLIPBOARD)]
      ["%_Delete" delete-primary-selection
       :active (selection-owner-p)]
      "----"
      ["Select %_All" mark-whole-buffer]
      ["Select %_Page" mark-page]
      "----"
      ["%_1 Search..." isearch-forward]
      ["%_2 Search Backward..." isearch-backward]
      ["%_3 Replace..." query-replace]
      "----"
      ["%_4 Search (Regexp)..." isearch-forward-regexp]
      ["%_5 Search Backward (Regexp)..." isearch-backward-regexp]
      ["%_6 Replace (Regexp)..." query-replace-regexp]

      ,@(when (featurep 'mule)
	 '("----"
	   ("%_Multilingual (\"Mule\")"
	    ("%_Describe Language Support")
	    ("%_Set Language Environment")
	    "--"
	    ["T%_oggle Input Method" toggle-input-method]
	    ["Select %_Input Method" set-input-method]
	    ["D%_escribe Input Method" describe-input-method]
	    "--"
	    ["Describe Current %_Coding Systems"
	     describe-current-coding-system]
	    ["Set Coding System of %_Buffer File..."
	     set-buffer-file-coding-system]
	    ;; not implemented yet
	    ["Set Coding System of %_Terminal..."
	     set-terminal-coding-system :active nil]
	    ;; not implemented yet
	    ["Set Coding System of %_Keyboard..."
	     set-keyboard-coding-system :active nil]
	    ["Set Coding System of %_Process..."
	     set-buffer-process-coding-system
	     :active (get-buffer-process (current-buffer))]
	    "--"
	    ["Show Cha%_racter Table" view-charset-by-menu]
	    ;; not implemented yet
	    ["Show Dia%_gnosis for MULE" mule-diag :active nil]
	    ["Show \"%_hello\" in Many Languages" view-hello-file]))
	 )
      )

     ("%_View"
      ["%_New Frame" make-frame]
      ["Frame on Other Displa%_y..." make-frame-on-display]
      ["%_Delete Frame" delete-frame
       :active (not (eq (next-frame (selected-frame) 'nomini 'window-system)
			(selected-frame)))]
      "-----"
      ["%_Split Window" split-window-vertically]
      ["S%_plit Window (Side by Side)" split-window-horizontally]
      ["%_Un-Split (Keep This)" delete-other-windows
       :active (not (one-window-p t))]
      ["Un-Split (Keep %_Others)" delete-window
       :active (not (one-window-p t))]
      "----"
      ("N%_arrow"
       ["%_Narrow to Region" narrow-to-region :active (region-exists-p)]
       ["Narrow to %_Page" narrow-to-page]
       ["Narrow to %_Defun" narrow-to-defun]
      "----"
       ["%_Widen" widen :active (or (/= (point-min) 1)
				    (/= (point-max) (1+ (buffer-size))))]
       )
      "----"
      ["Show Message %_Log" show-message-log]
      "----"
      ["%_Goto Line..." goto-line]
      ["%_What Line" what-line]
      ("%_Bookmarks"
       :filter bookmark-menu-filter)
      "----"
      ["%_Jump to Previous Mark" (set-mark-command t)
       :active (mark t)]
      )

     ("C%_mds"
      ["Repeat %_Last Complex Command..." repeat-complex-command]
      ["E%_valuate Lisp Expression..." eval-expression]
      ["Execute %_Named Command..." execute-extended-command]
      "----"
      ["Start %_Macro Recording" start-kbd-macro
       :included (not defining-kbd-macro)]
      ["End %_Macro Recording" end-kbd-macro
       :included defining-kbd-macro]
      ["E%_xecute Last Macro" call-last-kbd-macro
       :active last-kbd-macro]
      ("%_Other Macro"
       ["%_Append to Last Macro" (start-kbd-macro t)
	:active (and (not defining-kbd-macro) last-kbd-macro)]
       ["%_Query User During Macro" kbd-macro-query
	:active defining-kbd-macro]
       ["Enter %_Recursive Edit During Macro" (kbd-macro-query t)
	:active defining-kbd-macro]
       "---"
       ["E%_xecute Last Macro on Region Lines"
	:active (and last-kbd-macro (region-exists-p))]
       "---"
       ["%_Name Last Macro..." name-last-kbd-macro
	:active last-kbd-macro]
       ["Assign Last Macro to %_Key..." assign-last-kbd-macro-to-key
	:active (and last-kbd-macro
		     (fboundp 'assign-last-kbd-macro-to-key))]
       "---"
       ["%_Edit Macro..." edit-kbd-macro]
       ["Edit %_Last Macro" edit-last-kbd-macro
	:active last-kbd-macro]
       "---"
       ["%_Insert Named Macro into Buffer..." insert-kbd-macro]
       ["Read Macro from Re%_gion" read-kbd-macro
	:active (region-exists-p)]
       )
      "----"
      ("%_Abbrev"
       ["D%_ynamic Abbrev Expand" dabbrev-expand]
       ["Dynamic Abbrev %_Complete" dabbrev-completion]
       ["Dynamic Abbrev Complete in %_All Buffers" (dabbrev-completion 16)]
       "----"
       "----"
       ["%_Define Global Abbrev for " add-global-abbrev
	:suffix	(abbrev-string-to-be-defined nil)
	:active abbrev-mode]
       ["Define %_Mode-Specific Abbrev for " add-mode-abbrev
	:suffix	(abbrev-string-to-be-defined nil)
	:active abbrev-mode]
       ["Define Global Ex%_pansion for " inverse-add-global-abbrev
	:suffix	(inverse-abbrev-string-to-be-defined 1)
	:active abbrev-mode]
       ["Define Mode-Specific Expa%_nsion for " inverse-add-mode-abbrev
	:suffix	(inverse-abbrev-string-to-be-defined 1)
	:active abbrev-mode]
       "---"
       ["E%_xpand Abbrev" expand-abbrev]
       ["Expand Abbrevs in Re%_gion" expand-region-abbrevs
	:active (region-exists-p)]
       ["%_Unexpand Last Abbrev" unexpand-abbrev
	:active (and (stringp last-abbrev-text)
		     (> last-abbrev-location 0))]
       "---"
       ["%_Kill All Abbrevs" kill-all-abbrevs]
       ["%_Insert All Abbrevs into Buffer" insert-abbrevs]
       ["%_List Abbrevs" list-abbrevs]
       "---"
       ["%_Edit Abbrevs" edit-abbrevs]
       ["%_Redefine Abbrevs from Buffer" edit-abbrevs-redefine
	:active (eq major-mode 'edit-abbrevs-mode)]
       "---"
       ["%_Save Abbrevs As..." write-abbrev-file]
       ["L%_oad Abbrevs..." read-abbrev-file]
       )
      ("%_Register"
       ["%_Copy to Register..." copy-to-register :active (region-exists-p)]
       ["%_Paste Register..." insert-register]
       "---"
       ["%_Save Point to Register" point-to-register]
       ["%_Jump to Register"  register-to-point]
       )
      ("R%_ectangles"
       ["%_Kill Rectangle" kill-rectangle]
       ["%_Yank Rectangle" yank-rectangle]
       ["Rectangle %_to Register" copy-rectangle-to-register]
       ["Rectangle %_from Register" insert-register]
       ["%_Clear Rectangle" clear-rectangle]
       ["%_Open Rectangle" open-rectangle]
       ["%_Prefix Rectangle..." string-rectangle]
       ["Rectangle %_Mousing"
	(customize-set-variable
	 mouse-track-rectangle-p (not mouse-track-rectangle-p))
	:style toggle :selected mouse-track-rectangle-p]
       )
      ("%_Sort"
       ["%_Lines" sort-lines :active (region-exists-p)]
       ["%_Paragraphs" sort-paragraphs :active (region-exists-p)]
       ["P%_ages" sort-pages :active (region-exists-p)]
       ["%_Columns" sort-columns :active (region-exists-p)]
       ["%_Regexp..." sort-regexp-fields :active (region-exists-p)]
       )
      ("%_Center"
       ["%_Line" center-line]
       ["%_Paragraph" center-paragraph]
       ["%_Region" center-region :active (region-exists-p)]
       )
      ("%_Indent"
       ["%_As Previous Line" indent-relative]
       ["%_To Column..." indent-to-column]
       "---"
       ["%_Region" indent-region :active (region-exists-p)]
       ["%_Balanced Expression" indent-sexp]
       ["%_C Expression" indent-c-exp]
       )
      ("S%_pell-Check"
       ["%_Buffer" ispell-buffer
	:active (fboundp 'ispell-buffer)]
       "---"
       ["%_Word" ispell-word]
       ["%_Complete Word" ispell-complete-word]
       ["%_Region" ispell-region]
       )
      )

     ("%_Tools"
      ("%_Internet"
       ["Read Mail %_1 (VM)..." vm
	:active (fboundp 'vm)]
       ["Read Mail %_2 (MH)..." (mh-rmail t)
	:active (fboundp 'mh-rmail)]
       ["Send %_Mail..." compose-mail
	:active (fboundp 'compose-mail)]
       ["Usenet %_News" gnus
	:active (fboundp 'gnus)]
       ["Browse the %_Web" w3
	:active (fboundp 'w3)])
      "---"
      ("%_Grep"
       :filter
       (lambda (menu)
	 (if (or (not (boundp 'grep-history)) (null grep-history))
	     menu
	   (let ((items
		  (submenu-generate-accelerator-spec
		   (mapcar #'(lambda (string)
			       (vector string
				       (list 'grep string)))
			   (menu-truncate-list grep-history 10)))))
	     (append menu '("---") items))))
       ["%_Grep..." grep :active (fboundp 'grep)]
       ["%_Repeat Grep" recompile :active (fboundp 'recompile)]
       ["%_Kill Grep" kill-compilation
	:active (and (fboundp 'kill-compilation)
		     (fboundp 'compilation-find-buffer)
		     (let ((buffer (condition-case nil
				       (compilation-find-buffer)
				     (error nil))))
		       (and buffer (get-buffer-process buffer))))]
       "---"
       ["Grep %_All Files in Current Directory..."
	(progn
	  (require 'compile)
	  (let ((grep-command
		 (cons (concat grep-command " *") (length grep-command))))
	    (call-interactively 'grep)))
	:active (fboundp 'grep)]
       ["Grep %_C Files in Current Directory..."
	(progn
	  (require 'compile)
	  (let ((grep-command
		 (cons (concat grep-command " *.[ch]") (length grep-command))))
	    (call-interactively 'grep)))
	:active (fboundp 'grep)]
       ["Grep %_E-Lisp Files in Current Directory..."
	(progn
	  (require 'compile)
	  (let ((grep-command
		 (cons (concat grep-command " *.el") (length grep-command))))
	    (call-interactively 'grep)))
	:active (fboundp 'grep)]
       "---"
       ["%_Next Match" next-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       ["%_Previous Match" previous-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       ["%_First Match" first-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       ["G%_oto Match" compile-goto-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       "---"
       ["%_Set Grep Command..."
	(progn
	  (require 'compile)
	  (customize-set-variable
	   'grep-command
	   (read-shell-command "Default Grep Command: " grep-command)))
	:active (fboundp 'grep)
	]
       )
      ("%_Compile"
       :filter
       (lambda (menu)
	 (if (or (not (boundp 'compile-history)) (null compile-history))
	     menu
	   (let ((items
		  (submenu-generate-accelerator-spec
		   (mapcar #'(lambda (string)
			       (vector string
				       (list 'compile string)))
			   (menu-truncate-list compile-history 10)))))
	     (append menu '("---") items))))
       ["%_Compile..." compile :active (fboundp 'compile)]
       ["%_Repeat Compilation" recompile :active (fboundp 'recompile)]
       ["%_Kill Compilation" kill-compilation
	:active (and (fboundp 'kill-compilation)
		     (fboundp 'compilation-find-buffer)
		     (let ((buffer (condition-case nil
				       (compilation-find-buffer)
				     (error nil))))
		       (and buffer (get-buffer-process buffer))))]
       "---"
       ["%_Next Error" next-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       ["%_Previous Error" previous-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       ["%_First Error" first-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       ["G%_oto Error" compile-goto-error
	:active (and (fboundp 'compilation-errors-exist-p)
		     (compilation-errors-exist-p))]
       )
      ("%_Debug"
       ["%_GDB..." gdb
	:active (fboundp 'gdb)]
       ["%_DBX..." dbx
	:active (fboundp 'dbx)])
      ("%_Shell"
       ["%_Shell" shell
	:active (fboundp 'shell)]
       ["S%_hell Command..." shell-command
	:active (fboundp 'shell-command)]
       ["Shell Command on %_Region..." shell-command-on-region
       :active (and (fboundp 'shell-command-on-region) (region-exists-p))])

      ("%_Tags"
       ["%_Find Tag..." find-tag]
       ["Find %_Other Window..." find-tag-other-window]
       ["%_Next Tag..." (find-tag nil)]
       ["N%_ext Other Window..." (find-tag-other-window nil)]
       ["Next %_File" next-file]
       "-----"
       ["Tags %_Search..." tags-search]
       ["Tags %_Replace..." tags-query-replace]
       ["%_Continue Search/Replace" tags-loop-continue]
       "-----"
       ["%_Pop stack" pop-tag-mark]
       ["%_Apropos..." tags-apropos]
       "-----"
       ["%_Set Tags Table File..." visit-tags-table]
       )

      "----"

      ("Ca%_lendar"
       ["%_3-Month Calendar" calendar
	:active (fboundp 'calendar)]
       ["%_Diary" diary
	:active (fboundp 'diary)]
       ["%_Holidays" holidays
	:active (fboundp 'holidays)]
       ;; we're all pagans at heart ...
       ["%_Phases of the Moon" phases-of-moon
	:active (fboundp 'phases-of-moon)]
       ["%_Sunrise/Sunset" sunrise-sunset
	:active (fboundp 'sunrise-sunset)])

      ("Ga%_mes"
       ["%_Mine Game" xmine
	:active (fboundp 'xmine)]
       ["%_Tetris" tetris
	:active (fboundp 'tetris)]
       ["%_Sokoban" sokoban
	:active (fboundp 'sokoban)]
       ["Quote from %_Zippy" yow
	:active (fboundp 'yow)]
       ["%_Psychoanalyst" doctor
	:active (fboundp 'doctor)]
       ["Ps%_ychoanalyze Zippy!" psychoanalyze-pinhead
	:active (fboundp 'psychoanalyze-pinhead)]
       ["%_Random Flames" flame
	:active (fboundp 'flame)]
       ["%_Dunnet (Adventure)" dunnet
	:active (fboundp 'dunnet)]
       ["Towers of %_Hanoi" hanoi
	:active (fboundp 'hanoi)]
       ["Game of %_Life" life
	:active (fboundp 'life)]
       ["M%_ultiplication Puzzle" mpuz
	:active (fboundp 'mpuz)])

      "----"
      )

     ("%_Options"
      ("%_Advanced (Customize)"
       ("%_Emacs" :filter (lambda (&rest junk)
			    (cdr (custom-menu-create 'emacs))))
       ["%_Group..." customize-group]
       ["%_Variable..." customize-variable]
       ["%_Face..." customize-face]
       ["%_Saved..." customize-saved]
       ["Se%_t..." customize-customized]
       ["%_Apropos..." customize-apropos]
       ["%_Browse..." customize-browse])
      ("Manage %_Packages"
       ("%_Add Download Site"
        :filter (lambda (&rest junk)
                  (submenu-generate-accelerator-spec
		   (package-get-download-menu))))
       ["%_Update Package Index" package-get-update-base]
       ["%_List and Install" pui-list-packages]
       ["U%_pdate Installed Packages" package-get-update-all]
       ;; hack-o-matic, we can't force a load of package-base here
       ;; since it triggers dialog box interactions which we can't
       ;; deal with while using a menu
       ("Using %_Custom" 
	:filter (lambda (&rest junk)
		  (if package-get-base
		      (submenu-generate-accelerator-spec
		       (cdr (custom-menu-create 'packages)))
		    '(["Please load Package Index"
		       (lamda (&rest junk) ()) nil]))))
       
       ["%_Help" (Info-goto-node "(xemacs)Packages")])
      "---"
      ("%_Keyboard and Mouse"
       ["%_Abbrev Mode"
	(customize-set-variable 'abbrev-mode
				(not (default-value 'abbrev-mode)))
	:style toggle
	:selected (default-value 'abbrev-mode)]
       ["%_Delete Key Deletes Selection"
	(customize-set-variable 'pending-delete-mode (not pending-delete-mode))
	:style toggle
	:selected (and (boundp 'pending-delete-mode) pending-delete-mode)
	:active (boundp 'pending-delete-mode)]
       ["%_Yank/Kill Interact With Clipboard"
	(if (eq interprogram-cut-function 'own-clipboard)
	    (progn
	      (customize-set-variable 'interprogram-cut-function nil)
	      (customize-set-variable 'interprogram-paste-function nil))
	  (customize-set-variable 'interprogram-cut-function 'own-clipboard)
	  (customize-set-variable 'interprogram-paste-function 'get-clipboard))
	:style toggle
	:selected (eq interprogram-cut-function 'own-clipboard)]
       ["%_Overstrike"
	(progn
	  (setq overwrite-mode (if overwrite-mode nil 'overwrite-mode-textual))
	  (customize-set-variable 'overwrite-mode overwrite-mode))
	:style toggle :selected overwrite-mode]
       ("`%_kill-line' Behavior..."
	["Kill %_Whole Line"
	 (customize-set-variable 'kill-whole-line 'always)
	 :style radio :selected (eq kill-whole-line 'always)]
	["Kill to %_End of Line"
	 (customize-set-variable 'kill-whole-line nil)
	 :style radio :selected (eq kill-whole-line nil)]
	["Kill Whole Line at %_Beg, Otherwise to End"
	 (customize-set-variable 'kill-whole-line t)
	 :style radio :selected (eq kill-whole-line t)])
       ["Size for %_Block-Movement Commands..."
	(customize-set-variable 'block-movement-size
				(read-number "Block Movement Size: "
					      t block-movement-size))]
       ["%_VI Emulation"
	(progn
	  (toggle-viper-mode)
	  (customize-set-variable 'viper-mode viper-mode))
	:style toggle :selected (and (boundp 'viper-mode) viper-mode)
	:active (fboundp 'toggle-viper-mode)]
       ["Active Re%_gions"
	(customize-set-variable 'zmacs-regions (not zmacs-regions))
	:style toggle :selected zmacs-regions]
       "----"
       ["%_Set Key..." global-set-key]
       ["%_Unset Key..." global-unset-key]
       "---"
       ["%_Case Sensitive Search"
	(customize-set-variable 'case-fold-search
				(setq case-fold-search (not case-fold-search)))
	:style toggle :selected (not case-fold-search)]
       ["Case Matching %_Replace"
	(customize-set-variable 'case-replace (not case-replace))
	:style toggle :selected case-replace]
       "---"
       ("%_Newline at End of File..."
	["%_Don't Require"
	 (customize-set-variable 'require-final-newline nil)
	 :style radio :selected (not require-final-newline)]
	["%_Require"
	 (customize-set-variable 'require-final-newline t)
	 :style radio :selected (eq require-final-newline t)]
	["%_Ask"
	 (customize-set-variable 'require-final-newline 'ask)
	 :style radio :selected (and require-final-newline
				     (not (eq require-final-newline t)))])
       ["Add Newline When Moving Past %_End"
	(customize-set-variable 'next-line-add-newlines
				(not next-line-add-newlines))
	:style toggle :selected next-line-add-newlines]
       "---"
       ["%_Mouse Paste at Text Cursor"
	(customize-set-variable 'mouse-yank-at-point (not mouse-yank-at-point))
	:style toggle :selected mouse-yank-at-point]
       ["A%_void Text..."
	(customize-set-variable 'mouse-avoidance-mode
				(if mouse-avoidance-mode nil 'banish))
	:style toggle
	:selected (and (boundp 'mouse-avoidance-mode) mouse-avoidance-mode)
	:active (and (boundp 'mouse-avoidance-mode)
		     (device-on-window-system-p))]
       ["%_Strokes Mode"
	(customize-set-variable 'strokes-mode (not strokes-mode))
	:style toggle
	:selected (and (boundp 'strokes-mode) strokes-mode)
	:active (and (boundp 'strokes-mode)
		     (device-on-window-system-p))]
       )
      ("%_General"
       ["This Buffer %_Read Only" (toggle-read-only)
	:style toggle :selected buffer-read-only]
       ["%_Teach Extended Commands"
	(customize-set-variable 'teach-extended-commands-p
				(not teach-extended-commands-p))
	:style toggle :selected teach-extended-commands-p]
       ["Debug on %_Error"
	(customize-set-variable 'debug-on-error (not debug-on-error))
	:style toggle :selected debug-on-error]
       ["Debug on %_Quit"
	(customize-set-variable 'debug-on-quit (not debug-on-quit))
	:style toggle :selected debug-on-quit]
       ["Debug on %_Signal"
	(customize-set-variable 'debug-on-signal (not debug-on-signal))
	:style toggle :selected debug-on-signal]
       )
      
      ("%_Printing"
       ["Command-Line %_Switches for `lpr'/`lp'..."
	;; better to directly open a customization buffer, since the value
	;; must be a list of strings, which is somewhat complex to prompt for.
	(customize-variable 'lpr-switches)
	(boundp 'lpr-switches)]
       ("%_Pretty-Print Paper Size"
	["%_Letter"
	 (customize-set-variable 'ps-paper-type 'letter)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'letter))
	 :active (boundp 'ps-paper-type)]
	["Lette%_r-Small"
	 (customize-set-variable 'ps-paper-type 'letter-small)
	 :style radio
	 :selected (and (boundp 'ps-paper-type)
			(eq ps-paper-type 'letter-small))
	 :active (boundp 'ps-paper-type)]
	["Le%_gal"
	 (customize-set-variable 'ps-paper-type 'legal)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'legal))
	 :active (boundp 'ps-paper-type)]
	["%_Statement"
	 (customize-set-variable 'ps-paper-type 'statement)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'statement))
	 :active (boundp 'ps-paper-type)]
	["%_Executive"
	 (customize-set-variable 'ps-paper-type 'executive)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'executive))
	 :active (boundp 'ps-paper-type)]
	["%_Tabloid"
	 (customize-set-variable 'ps-paper-type 'tabloid)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'tabloid))
	 :active (boundp 'ps-paper-type)]
	["Le%_dger"
	 (customize-set-variable 'ps-paper-type 'ledger)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'ledger))
	 :active (boundp 'ps-paper-type)]
	["A%_3"
	 (customize-set-variable 'ps-paper-type 'a3)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'a3))
	 :active (boundp 'ps-paper-type)]
	["%_A4"
	 (customize-set-variable 'ps-paper-type 'a4)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'a4))
	 :active (boundp 'ps-paper-type)]
	["A4s%_mall"
	 (customize-set-variable 'ps-paper-type 'a4small)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'a4small))
	 :active (boundp 'ps-paper-type)]
	["B%_4"
	 (customize-set-variable 'ps-paper-type 'b4)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'b4))
	 :active (boundp 'ps-paper-type)]
	["%_B5"
	 (customize-set-variable 'ps-paper-type 'b5)
	 :style radio
	 :selected (and (boundp 'ps-paper-type) (eq ps-paper-type 'b5))
	 :active (boundp 'ps-paper-type)]
	)
       ["%_Color Printing"
	(cond (ps-print-color-p
	       (customize-set-variable 'ps-print-color-p nil)
	       ;; I'm wondering whether all this muck is useful.
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
      ("%_Internet"
       ("%_Compose Mail With"
	["Default Emacs Mailer"
	 (customize-set-variable 'mail-user-agent 'sendmail-user-agent)
	 :style radio
	 :selected (eq mail-user-agent 'sendmail-user-agent)]
	["MH"
	 (customize-set-variable 'mail-user-agent 'mh-e-user-agent)
	 :style radio
	 :selected (eq mail-user-agent 'mh-e-user-agent)
	 :active (get 'mh-e-user-agent 'composefunc)]
	["GNUS"
	 (customize-set-variable 'mail-user-agent 'message-user-agent)
	 :style radio
	 :selected (eq mail-user-agent 'message-user-agent)
	 :active (get 'message-user-agent 'composefunc)]
	)
       ["Set My %_Email Address..."
	(customize-set-variable
	 'user-mail-address
	 (read-string "Set email address: " user-mail-address))]
       ["Set %_Machine Email Name..."
	(customize-set-variable
	 'mail-host-address
	 (read-string "Set machine email name: " mail-host-address))]
       "---"
       ("%_Open URLs With"
	["%_Emacs-W3"
	 (customize-set-variable 'browse-url-browser-function 'browse-url-w3)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-w3))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-w3)
		      (fboundp 'w3-fetch))]
	["%_Netscape"
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-netscape)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-netscape))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-netscape))]
	["%_Mosaic"
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-mosaic)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-mosaic))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-mosaic))]
	["Mosaic (%_CCI)"
	 (customize-set-variable 'browse-url-browser-function 'browse-url-cci)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-cci))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-cci))]
	["%_IXI Mosaic"
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-iximosaic)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-iximosaic))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-iximosaic))]
	["%_Lynx (xterm)"
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-lynx-xterm)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-lynx-xterm))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-lynx-xterm))]
	["L%_ynx (xemacs)"
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-lynx-emacs)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-lynx-emacs))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-lynx-emacs))]
	["%_Grail"
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-grail)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-grail))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-grail))]
	["%_Kfm" 
	 (customize-set-variable 'browse-url-browser-function
				 'browse-url-kfm)
	 :style radio
	 :selected (and (boundp 'browse-url-browser-function)
			(eq browse-url-browser-function 'browse-url-kfm))
	 :active (and (boundp 'browse-url-browser-function)
		      (fboundp 'browse-url-kfm))]
	))


      "-----"
      ("Display"
       ,@(if (featurep 'scrollbar)
	     '(["%_Scrollbars"
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
       ;;	 ["%_3D Modeline"
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
       ["%_Truncate Lines"
	(progn;; becomes buffer-local
	  (setq truncate-lines (not truncate-lines))
	  (customize-set-variable 'truncate-lines truncate-lines))
	:style toggle
	:selected truncate-lines]
       ["%_Blinking Cursor"
	(customize-set-variable 'blink-cursor-mode (not blink-cursor-mode))
	:style toggle
	:selected (and (boundp 'blink-cursor-mode) blink-cursor-mode)
	:active (boundp 'blink-cursor-mode)]
       "-----"
       ["Bl%_ock Cursor"
	(progn
	  (customize-set-variable 'bar-cursor nil)
	  (force-cursor-redisplay))
	:style radio
	:selected (null bar-cursor)]
       ["Bar Cursor (%_1 Pixel)"
	(progn
	  (customize-set-variable 'bar-cursor t)
	  (force-cursor-redisplay))
	:style radio
	:selected (eq bar-cursor t)]
       ["Bar Cursor (%_2 Pixels)"
	(progn
	  (customize-set-variable 'bar-cursor 2)
	  (force-cursor-redisplay))
	:style radio
	:selected (and bar-cursor (not (eq bar-cursor t)))]
       "------"
       ["%_Line Numbers"
	(progn
	  (customize-set-variable 'line-number-mode (not line-number-mode))
	  (redraw-modeline))
	:style toggle :selected line-number-mode]
       ["%_Column Numbers"
	(progn
	  (customize-set-variable 'column-number-mode
				  (not column-number-mode))
	  (redraw-modeline))
	:style toggle :selected column-number-mode]
       
       ("\"Other %_Window\" Location"
	["%_Always in Same Frame"
	 (customize-set-variable
	  'get-frame-for-buffer-default-instance-limit nil)
	 :style radio
	 :selected (null get-frame-for-buffer-default-instance-limit)]
	["Other Frame (%_2 Frames Max)"
	 (customize-set-variable 'get-frame-for-buffer-default-instance-limit 2)
	 :style radio
	 :selected (eq 2 get-frame-for-buffer-default-instance-limit)]
	["Other Frame (%_3 Frames Max)"
	 (customize-set-variable 'get-frame-for-buffer-default-instance-limit 3)
	 :style radio
	 :selected (eq 3 get-frame-for-buffer-default-instance-limit)]
	["Other Frame (%_4 Frames Max)"
	 (customize-set-variable 'get-frame-for-buffer-default-instance-limit 4)
	 :style radio
	 :selected (eq 4 get-frame-for-buffer-default-instance-limit)]
	["Other Frame (%_5 Frames Max)"
	 (customize-set-variable 'get-frame-for-buffer-default-instance-limit 5)
	 :style radio
	 :selected (eq 5 get-frame-for-buffer-default-instance-limit)]
	["Always Create %_New Frame"
	 (customize-set-variable 'get-frame-for-buffer-default-instance-limit 0)
	 :style radio
	 :selected (eq 0 get-frame-for-buffer-default-instance-limit)]
	"-----"
	["%_Temp Buffers Always in Same Frame"
	 (customize-set-variable 'temp-buffer-show-function
				 'show-temp-buffer-in-current-frame)
	 :style radio
	 :selected (eq temp-buffer-show-function
		       'show-temp-buffer-in-current-frame)]
	["Temp Buffers %_Like Other Buffers"
	 (customize-set-variable 'temp-buffer-show-function nil)
	 :style radio
	 :selected (null temp-buffer-show-function)]
	"-----"
	["%_Make Current Frame Gnuserv Target"
	 (customize-set-variable 'gnuserv-frame (if (eq gnuserv-frame t) nil t))
	 :style toggle
	 :selected (and (boundp 'gnuserv-frame) (eq gnuserv-frame t))
	 :active (boundp 'gnuserv-frame)]
	)
       )      
      ("%_Menubars"
       ["%_Frame-Local Font Menu"
	(customize-set-variable 'font-menu-this-frame-only-p
				(not font-menu-this-frame-only-p))
	:style toggle
	:selected (and (boundp 'font-menu-this-frame-only-p)
		       font-menu-this-frame-only-p)]
       ["%_Alt/Meta Selects Menu Items"
	(if (eq menu-accelerator-enabled 'menu-force)
	    (customize-set-variable 'menu-accelerator-enabled nil)
	  (customize-set-variable 'menu-accelerator-enabled 'menu-force))
	:style toggle
	:selected (eq menu-accelerator-enabled 'menu-force)]
       "----"
       ["Buffers Menu %_Length..."
	(customize-set-variable
	 'buffers-menu-max-size
	 ;; would it be better to open a customization buffer ?
	 (let ((val
		(read-number
		 "Enter number of buffers to display (or 0 for unlimited): ")))
	   (if (eq val 0) nil val)))]
       ["%_Multi-Operation Buffers Sub-Menus"
	(customize-set-variable 'complex-buffers-menu-p
				(not complex-buffers-menu-p))
	:style toggle
	:selected complex-buffers-menu-p]
       ["S%_ubmenus for Buffer Groups"
	(customize-set-variable 'buffers-menu-submenus-for-groups-p
				(not buffers-menu-submenus-for-groups-p))
	:style toggle
	:selected buffers-menu-submenus-for-groups-p]
       ["%_Verbose Buffer Menu Entries"
	(if (eq buffers-menu-format-buffer-line-function
		'slow-format-buffers-menu-line)
	    (customize-set-variable 'buffers-menu-format-buffer-line-function
				    'format-buffers-menu-line)
	  (customize-set-variable 'buffers-menu-format-buffer-line-function
				  'slow-format-buffers-menu-line))
	:style toggle
	:selected (eq buffers-menu-format-buffer-line-function
		      'slow-format-buffers-menu-line)]
       ("Buffers Menu %_Sorting"
	["%_Most Recently Used"
	 (progn
	   (customize-set-variable 'buffers-menu-sort-function nil)
	   (customize-set-variable 'buffers-menu-grouping-function nil))
	 :style radio
	 :selected (null buffers-menu-sort-function)]
	["%_Alphabetically"
	 (progn
	   (customize-set-variable 'buffers-menu-sort-function
				   'sort-buffers-menu-alphabetically)
	   (customize-set-variable 'buffers-menu-grouping-function nil))
	 :style radio
	 :selected (eq 'sort-buffers-menu-alphabetically
		       buffers-menu-sort-function)]
	["%_By Major Mode, Then Alphabetically"
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
       "---"
       ["%_Ignore Scaled Fonts"
	(customize-set-variable 'font-menu-ignore-scaled-fonts
				(not font-menu-ignore-scaled-fonts))
	:style toggle
	:selected (and (boundp 'font-menu-ignore-scaled-fonts)
		       font-menu-ignore-scaled-fonts)]
       )
      ,@(if (featurep 'toolbar)
	    '(("%_Toolbars"
	       ["%_Visible"
		(customize-set-variable 'toolbar-visible-p
					(not toolbar-visible-p))
		:style toggle
		:selected toolbar-visible-p]
	       ["%_Captioned"
		(customize-set-variable 'toolbar-captioned-p
					(not toolbar-captioned-p))
		:style toggle
		:selected toolbar-captioned-p]
	       ("%_Default Location"
		["%_Top"
		 (customize-set-variable 'default-toolbar-position 'top)
		 :style radio
		 :selected (eq default-toolbar-position 'top)]
		["%_Bottom"
		 (customize-set-variable 'default-toolbar-position 'bottom)
		 :style radio
		 :selected (eq default-toolbar-position 'bottom)]
		["%_Left"
		 (customize-set-variable 'default-toolbar-position 'left)
		 :style radio
		 :selected (eq default-toolbar-position 'left)]
		["%_Right"
		 (customize-set-variable 'default-toolbar-position 'right)
		 :style radio
		 :selected (eq default-toolbar-position 'right)]
		)
	       )))
      ,@(if (featurep 'gutter)
	    '(("G%_utters"
	       ["Buffers Tab %_Visible"
		(customize-set-variable 'gutter-buffers-tab-visible-p
					(not gutter-buffers-tab-visible-p))
		:style toggle
		:selected gutter-buffers-tab-visible-p]
	       ("%_Default Location"
		["%_Top"
		 (customize-set-variable 'default-gutter-position 'top)
		 :style radio
		 :selected (eq default-gutter-position 'top)]
		["%_Bottom"
		 (customize-set-variable 'default-gutter-position 'bottom)
		 :style radio
		 :selected (eq default-gutter-position 'bottom)]
		["%_Left"
		 (customize-set-variable 'default-gutter-position 'left)
		 :style radio
		 :selected (eq default-gutter-position 'left)]
		["%_Right"
		 (customize-set-variable 'default-gutter-position 'right)
		 :style radio
		 :selected (eq default-gutter-position 'right)]
		)
	       )))
      "-----"
      ("S%_yntax Highlighting"
       ["%_In This Buffer"
	(progn;; becomes buffer local
	  (font-lock-mode)
	  (customize-set-variable 'font-lock-mode font-lock-mode))
	:style toggle
	:selected (and (boundp 'font-lock-mode) font-lock-mode)
	:active (boundp 'font-lock-mode)]
       ["%_Automatic"
	(customize-set-variable 'font-lock-auto-fontify
				(not font-lock-auto-fontify))
	:style toggle
	:selected (and (boundp 'font-lock-auto-fontify) font-lock-auto-fontify)
	:active (fboundp 'font-lock-mode)]
       "-----"
       ["%_Fonts"
	(progn
	  (require 'font-lock)
	  (font-lock-use-default-fonts)
	  (customize-set-variable 'font-lock-use-fonts t)
	  (customize-set-variable 'font-lock-use-colors nil)
	  (font-lock-mode 1))
	:style radio
	:selected (and (boundp 'font-lock-use-fonts) font-lock-use-fonts)
	:active (fboundp 'font-lock-mode)]
       ["%_Colors"
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
       ["%_Least"
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
       ["M%_ore"
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
       ["%_Even More"
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
       ["%_Most"
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
       ["La%_zy"
	(progn;; becomes buffer local
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
       ["Cac%_hing"
	(progn;; becomes buffer local
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
      ("Pa%_ren Highlighting"
       ["%_None"
	(customize-set-variable 'paren-mode nil)
	:style radio
	:selected (and (boundp 'paren-mode) (not paren-mode))
	:active (boundp 'paren-mode)]
       ["%_Blinking Paren"
	(customize-set-variable 'paren-mode 'blink-paren)
	:style radio
	:selected (and (boundp 'paren-mode) (eq paren-mode 'blink-paren))
	:active (boundp 'paren-mode)]
       ["%_Steady Paren"
	(customize-set-variable 'paren-mode 'paren)
	:style radio
	:selected (and (boundp 'paren-mode) (eq paren-mode 'paren))
	:active (boundp 'paren-mode)]
       ["%_Expression"
	(customize-set-variable 'paren-mode 'sexp)
	:style radio
	:selected (and (boundp 'paren-mode) (eq paren-mode 'sexp))
	:active (boundp 'paren-mode)]
       ;;	 ["Nes%_ted Shading"
       ;;	  (customize-set-variable 'paren-mode 'nested)
       ;;	  :style radio
       ;;	  :selected (and (boundp 'paren-mode) (eq paren-mode 'nested))
       ;;	  :active (boundp 'paren-mode)]
       )
      "-----"
      ["Edit Fa%_ces..." (customize-face nil)]
      ("Fo%_nt" :filter font-menu-family-constructor)
      ("Si%_ze"	:filter font-menu-size-constructor)
      ;;      ("Weig%_ht" :filter font-menu-weight-constructor)
      "-----"
      ["%_Edit Init (.emacs) File"
       ;; #### there should be something that holds the name that the init
       ;; file should be created as, when it's not present.
       (progn (find-file (or user-init-file "~/.emacs"))
	      (emacs-lisp-mode))]
      ["%_Save Options to .emacs File" customize-save-customized]
      )

     ("%_Buffers"
      :filter buffers-menu-filter
      ["Go To %_Previous Buffer" switch-to-other-buffer]
      ["Go To %_Buffer..." switch-to-buffer]
      "----"
      ["%_List All Buffers" list-buffers]
      ["%_Delete Buffer" kill-this-buffer
       :suffix (if put-buffer-names-in-file-menu (buffer-name) "")]
      "----"
      )

     nil	; the partition: menus after this are flushright

     ("%_Help"
      ["%_About XEmacs..." about-xemacs]
      ("%_Basics"
       ["%_Installation" describe-installation
	:active (boundp 'Installation-string)]
       ;; Tutorials.
       ,(if (featurep 'mule)
	    ;; Mule tutorials.
	    (let ((lang language-info-alist) (n 0)
		  submenu tut)
	      (while lang
	      (setq n (1+ n))
		(and (setq tut (assq 'tutorial (car lang)))
		     (not (string= (caar lang) "ASCII"))
		     (setq
		      submenu
		      (cons
		       `[,(concat (menu-item-generate-accelerator-spec n)
				  (caar lang))
			 (help-with-tutorial nil ,(cdr tut))]
		       submenu)))
		(setq lang (cdr lang)))
	      (append `("%_Tutorials"
			:filter tutorials-menu-filter
			["%_Default" help-with-tutorial t
			 ,(concat "(" current-language-environment ")")])
		      submenu))
	  ;; Non mule tutorials.
	  (let ((lang tutorial-supported-languages)
		(n 0)
		submenu)
	    (while lang
	      (setq n (1+ n))
	      (setq submenu
		    (cons
		     `[,(concat (menu-item-generate-accelerator-spec n)
				(caar lang))
		       (help-with-tutorial ,(format "TUTORIAL.%s"
						    (cadr (car lang))))]
		     submenu))
	      (setq lang (cdr lang)))
	    (append '("%_Tutorials"
		      ["%_English" help-with-tutorial])
		    submenu)))
       ["%_News" view-emacs-news]
       ["%_Packages" finder-by-keyword]
       ["%_Splash" xemacs-splash-buffer])
      "-----"
      ("XEmacs %_FAQ"
       ["%_FAQ (local)" xemacs-local-faq]
       ["FAQ via %_WWW" xemacs-www-faq	(boundp 'browse-url-browser-function)]
       ["%_Home Page" xemacs-www-page		(boundp 'browse-url-browser-function)])
      ("%_Samples"
       ["Sample .%_emacs" (find-file (locate-data-file "sample.emacs")) (locate-data-file "sample.emacs")]
       ["Sample .%_Xdefaults" (find-file (locate-data-file "sample.Xdefaults")) (locate-data-file "sample.Xdefaults")]
       ["Sample e%_nriched" (find-file (locate-data-file "enriched.doc")) (locate-data-file "enriched.doc")])
      "-----"
      ("Lookup in %_Info"
       ["%_Key Binding..." Info-goto-emacs-key-command-node]
       ["%_Command..." Info-goto-emacs-command-node]
       ["%_Function..." Info-elisp-ref]
       ["%_Topic..." Info-query])
      ("%_Manuals"
       ["%_Info" info]
       ["%_Unix Manual..." manual-entry])
      ("%_Commands & Keys"
       ["%_Mode" describe-mode]
       ["%_Apropos..." hyper-apropos]
       ["Apropos %_Docs..." apropos-documentation]
       "-----"
       ["%_Key..." describe-key]
       ["%_Bindings" describe-bindings]
       ["%_Mouse Bindings" describe-pointer]
       ["%_Recent Keys" view-lossage]
       "-----"
       ["%_Function..." describe-function]
       ["%_Variable..." describe-variable]
       ["%_Locate Command..." where-is])
      "-----"
      ["%_Recent Messages" view-lossage]
      ("%_Misc"
       ["%_No Warranty" describe-no-warranty]
       ["XEmacs %_License" describe-copying]
       ["The Latest %_Version" describe-distribution])
      ["%_Send Bug Report..." report-emacs-bug
       :active (fboundp 'report-emacs-bug)]))))


(defun maybe-add-init-button ()
  "Don't call this.
Adds `Load .emacs' button to menubar when starting up with -q."
  (when (and (not load-user-init-file-p)
	     (file-exists-p (expand-file-name ".emacs" "~")))
    (add-menu-button
     nil
     ["%_Load .emacs"
      (progn
	(mapc #'(lambda (buf)
		 (with-current-buffer buf
		   (delete-menu-item '("Load .emacs"))))
	      (buffer-list))
	(load-user-init-file))
      ]
     "Help")))

(add-hook 'before-init-hook 'maybe-add-init-button)


;;; The File menu

(defvar put-buffer-names-in-file-menu t)


;;; The Bookmarks menu

(defun bookmark-menu-filter (&rest ignore)
  (let ((definedp (and (boundp 'bookmark-alist)
		       bookmark-alist
		       t)))
    `(,(if definedp
	   '("%_Jump to Bookmark"
	     :filter (lambda (&rest junk)
		       (mapcar #'(lambda (bmk)
				   `[,bmk (bookmark-jump ',bmk)])
			       (bookmark-all-names))))
	 ["%_Jump to Bookmark" nil nil])
      ["Set %_Bookmark" bookmark-set
       :active (fboundp 'bookmark-set)]
      "---"
      ["Insert %_Contents" bookmark-menu-insert
       :active (fboundp 'bookmark-menu-insert)]
      ["Insert L%_ocation" bookmark-menu-locate
       :active (fboundp 'bookmark-menu-locate)]
      "---"
      ["%_Rename Bookmark" bookmark-menu-rename
       :active (fboundp 'bookmark-menu-rename)]
      ,(if definedp
	   '("%_Delete Bookmark"
	     :filter (lambda (&rest junk)
		       (mapcar #'(lambda (bmk)
				   `[,bmk (bookmark-delete ',bmk)])
			       (bookmark-all-names))))
	 ["%_Delete Bookmark" nil nil])
      ["%_Edit Bookmark List" bookmark-bmenu-list	,definedp]
      "---"
      ["%_Save Bookmarks"        bookmark-save		,definedp]
      ["Save Bookmarks %_As..."  bookmark-write		,definedp]
      ["%_Load a Bookmark File" bookmark-load
       :active (fboundp 'bookmark-load)])))

;;; The Buffers menu

(defgroup buffers-menu nil
  "Customization of `Buffers' menu."
  :group 'menu)

(defvar buffers-menu-omit-chars-list '(?b ?p ?l))

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
  "*The function to call to return a string to represent a buffer in
the buffers menu.  The function is passed a buffer and a number
(starting with 1) indicating which buffer line in the menu is being
processed and should return a string containing an accelerator
spec. (Check out `menu-item-generate-accelerator-spec' as a convenient
way of generating the accelerator specs.) The default value
`format-buffers-menu-line' just returns the name of the buffer and
uses the number as the accelerator.  Also check out
`slow-format-buffers-menu-line' which returns a whole bunch of info
about a buffer.

Note: Gross Compatibility Hack: Older versions of this function prototype
only expected one argument, not two.  We deal gracefully with such
functions by simply calling them with one argument and leaving out the
line number.  However, this may go away at any time, so make sure to
update all of your functions of this type."
  :type 'function
  :group 'buffers-menu)

(defcustom buffers-menu-sort-function
  'sort-buffers-menu-by-mode-then-alphabetically
  "*If non-nil, a function to sort the list of buffers in the buffers menu.
It will be passed two arguments (two buffers to compare) and should return
t if the first is \"less\" than the second.  One possible value is
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

(defun sort-buffers-menu-alphabetically (buf1 buf2)
  "For use as a value of `buffers-menu-sort-function'.
Sorts the buffers in alphabetical order by name, but puts buffers beginning
with a star at the end of the list."
  (let* ((nam1 (buffer-name buf1))
	 (nam2 (buffer-name buf2))
	 (inv1p (not (null (string-match "\\` " nam1))))
	 (inv2p (not (null (string-match "\\` " nam2))))
	 (star1p (not (null (string-match "\\`*" nam1))))
	 (star2p (not (null (string-match "\\`*" nam2)))))
    (cond ((not (eq inv1p inv2p))
	   (not inv1p))
	  ((not (eq star1p star2p))
	   (not star1p))
	  (t
	   (string-lessp nam1 nam2)))))

(defun sort-buffers-menu-by-mode-then-alphabetically (buf1 buf2)
  "For use as a value of `buffers-menu-sort-function'.
Sorts first by major mode and then alphabetically by name, but puts buffers
beginning with a star at the end of the list."
  (let* ((nam1 (buffer-name buf1))
	 (nam2 (buffer-name buf2))
	 (inv1p (not (null (string-match "\\` " nam1))))
	 (inv2p (not (null (string-match "\\` " nam2))))
	 (star1p (not (null (string-match "\\`*" nam1))))
	 (star2p (not (null (string-match "\\`*" nam2))))
	 (mode1 (symbol-value-in-buffer 'major-mode buf1))
	 (mode2 (symbol-value-in-buffer 'major-mode buf2)))
    (cond ((not (eq inv1p inv2p))
	   (not inv1p))
	  ((not (eq star1p star2p))
	   (not star1p))
	  ((and star1p star2p (string-lessp nam1 nam2)))
	  ((string-lessp mode1 mode2)
	   t)
	  ((string-lessp mode2 mode1)
	   nil)
	  (t
	   (string-lessp nam1 nam2)))))

;; this version is too slow on some machines.
;; (vintage 1990, that is)
(defun slow-format-buffers-menu-line (buffer n)
  "For use as a value of `buffers-menu-format-buffer-line-function'.
This returns a string containing a bunch of info about the buffer."
  (concat (menu-item-generate-accelerator-spec n buffers-menu-omit-chars-list)
	  (format "%s%s %-19s %6s %-15s %s"
		  (if (buffer-modified-p buffer) "*" " ")
		  (if (symbol-value-in-buffer 'buffer-read-only buffer)
		      "%" " ")
		  (buffer-name buffer)
		  (buffer-size buffer)
		  (symbol-value-in-buffer 'mode-name buffer)
		  (or (buffer-file-name buffer) ""))))

(defun format-buffers-menu-line (buffer n)
  "For use as a value of `buffers-menu-format-buffer-line-function'.
This just returns the buffer's name."
  (concat (menu-item-generate-accelerator-spec n buffers-menu-omit-chars-list)
	  (buffer-name buffer)))

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
  (let (name line (n 0))
    (mapcar
     #'(lambda (buffer)
	 (if (eq buffer t)
	     "---"
	   (setq n (1+ n))
	   (setq line
		 ; #### a truly Kyle-friendly hack.
		 (let ((fn buffers-menu-format-buffer-line-function))
		   (if (= (function-max-args fn) 1)
		       (funcall fn buffer)
		     (funcall fn buffer n))))
	   (if complex-buffers-menu-p
	       (delq nil
		     (list line
			   (vector "S%_witch to Buffer"
				   (list buffers-menu-switch-to-buffer-function
					 (setq name (buffer-name buffer)))
				   t)
			   (if (eq buffers-menu-switch-to-buffer-function
				   'switch-to-buffer)
			       (vector "Switch to Buffer, Other %_Frame"
				       (list 'switch-to-buffer-other-frame
					     (setq name (buffer-name buffer)))
				       t)
			     nil)
			   (if (and (buffer-modified-p buffer)
				    (buffer-file-name buffer))
			       (vector "%_Save Buffer"
				       (list 'buffer-menu-save-buffer name) t)
			     ["%_Save Buffer" nil nil]
			     )
			   (vector "Save %_As..."
				   (list 'buffer-menu-write-file name) t)
			   (vector "%_Delete Buffer" (list 'kill-buffer name)
				   t)))
	     ;; #### We don't want buffer names to be translated,
	     ;; #### so we put the buffer name in the suffix.
	     ;; #### Also, avoid losing with non-ASCII buffer names.
	     ;; #### We still lose, however, if complex-buffers-menu-p. --mrb
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
  (let ((n 0))
    (mapcar (lambda (env-sym)
	      (setq n (1+ n))
	      `[ ,(concat (menu-item-generate-accelerator-spec n)
			  (capitalize (symbol-name env-sym)))
		 (set-language-environment ',env-sym)])
	    language-environment-list)))


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
    ["%_Undo" advertised-undo
     :active (and (not (eq buffer-undo-list t))
		  (or buffer-undo-list pending-undo-list))
     :suffix (if (or (eq last-command 'undo)
		     (eq last-command 'advertised-undo))
		 "More" "")]
    ["Cu%_t" kill-primary-selection
     :active (selection-owner-p)]
    ["%_Copy" copy-primary-selection
     :active (selection-owner-p)]
    ["%_Paste" yank-clipboard-selection
     :active (selection-exists-p 'CLIPBOARD)]
    ["%_Delete" delete-primary-selection
     :active (selection-owner-p)]
    "-----"
    ["Select %_Block" mark-paragraph]
    ["Sp%_lit Window" split-window-vertically]
    ["U%_nsplit Window" delete-other-windows]
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
;; superseded by any local popup menu...
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
	(setq bmenu (assoc "%_Buffers" current-menubar)))
    (if (null bmenu)
	(setq bmenu (assoc "%_Buffers" default-menubar)))
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
    ;; #### Instead of having to copy this just to safely get rid of
    ;; any nil what we should really do is fix up the internal menubar
    ;; code to just ignore nil if generating a popup menu
    (setq popup-menubar (delete nil (copy-sequence (or current-menubar
						       default-menubar))))
    (popup-menu (cons "%_Menubar Menu" popup-menubar))
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
  (let ((buffer (get-buffer-create "*Splash*"))
	tmout)
    (set-buffer buffer)
    (setq buffer-read-only t)
    (erase-buffer buffer)
    (setq tmout (display-splash-frame))
    (when tmout
      (make-local-hook 'kill-buffer-hook)
      (add-hook 'kill-buffer-hook
		`(lambda ()
		   (disable-timeout ,tmout))
		nil t))
    (pop-to-buffer buffer)
    (delete-other-windows)))


;;; backwards compatibility
(provide 'x-menubar)
(provide 'menubar-items)

;;; menubar-items.el ends here.
