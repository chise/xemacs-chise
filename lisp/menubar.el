;;; menubar.el --- Menubar support for XEmacs

;; Copyright (C) 1991-4, 1997-1998 Free Software Foundation, Inc.
;; Copyright (C) 1995 Tinker Systems and INS Engineering Corp.
;; Copyright (C) 1995, 1996 Ben Wing.

;; Maintainer: XEmacs Development Team
;; Keywords: internal, extensions, dumped

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

;;; Synched up with: Not in FSF. (Completely divergent from FSF menu-bar.el)

;;; Commentary:

;; This file is dumped with XEmacs (when menubar support is compiled in).

;; Some stuff in FSF menu-bar.el is in x-menubar.el

;;; Code:

(defgroup menu nil
  "Input from the menus."
  :group 'environment)

(defvar default-menubar nil)

;; this function is considered "part of the lexicon" by many,
;; so we'll leave it here.
(defun kill-this-buffer ()	; for the menubar
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun set-menubar-dirty-flag ()
  "Tell XEmacs that the menubar has to be updated.
NOTE: XEmacs now recognizes when you set a different value for
`current-menubar'.  You *only* need to call this function if you
destructively modify a part of the menubar and don't set `current-menubar'.
Note that all the functions that modify a menu call this automatically."
  (setq-default current-menubar (default-value 'current-menubar)))

;; #### shouldn't this perhaps be `copy-tree'?
(defun set-menubar (menubar)
  "Set the default menubar to be MENUBAR.
See `current-menubar' for a description of the syntax of a menubar."
  (check-menu-syntax menubar t)
  (setq-default current-menubar (copy-sequence menubar)))

(defun set-buffer-menubar (menubar)
  "Set the buffer-local menubar to be MENUBAR.
See `current-menubar' for a description of the syntax of a menubar."
  (check-menu-syntax menubar t)
  (make-local-variable 'current-menubar)
  (setq current-menubar (copy-sequence menubar)))

(defun check-menu-syntax (menu &optional menubar-p)
  ;; The C code does syntax checking on the value of `current-menubar',
  ;; but it's better to do it early, before things have gotten messed up.
  (if menubar-p
      nil
    (or (stringp (car menu))
	(signal 'error
		(list "menu name (first element) must be a string" menu)))
    ;;(or (cdr menu) (signal 'error (list "menu is empty" menu)))
    (setq menu (cdr menu)))
  (let (menuitem item)
    (while (keywordp (setq item (car menu)))
      (or (memq item '(:config :included :filter :accelerator))
	  (signal 'error
		  (list "menu keyword must be :config, :included, :accelerator or :filter"
			item)))
      (if (or (not (cdr menu))
	      (vectorp (nth 1 menu))
	      (keywordp (nth 1 menu)))
	  (signal 'error (list "strange keyword value" item (nth 1 menu))))
      (setq menu (nthcdr 2 menu)))
    (while menu
      (setq menuitem (car menu))
      (cond
       ((stringp menuitem)
	(and (string-match "^\\(-+\\|=+\\):\\(.*\\)" menuitem)
	     (setq item (match-string 2 menuitem))
	     (or (member item '(;; Motif-compatible 
				"singleLine"
				"doubleLine"
				"singleDashedLine"
				"doubleDashedLine"
				"noLine"
				"shadowEtchedIn"
				"shadowEtchedOut"
				"shadowEtchedInDash"
				"shadowEtchedOutDash"
				;; non-Motif (Lucid menubar widget only)
				"shadowDoubleEtchedIn"
				"shadowDoubleEtchedOut"
				"shadowDoubleEtchedInDash"
				"shadowDoubleEtchedOutDash"
				))
		 (signal 'error (list "bogus separator style in menu item" item)))
	     ))
       ((null menuitem)
	(or menubar-p
	    (signal 'error (list "nil is only permitted in the top level of menubars"))))
       ((consp menuitem)
	(check-menu-syntax menuitem))
       ((vectorp menuitem)
	(let ((L (length menuitem))
	      plistp)
	  (and (< L 2)
	       (signal 'error
		       (list "button descriptors must be at least 2 long"
			     menuitem)))
	  (setq plistp (or (>= L 5)
			   (and (> L 2) (keywordp (aref menuitem 2)))))
	  (or (stringp (aref menuitem 0))
	      (signal 'error
		      (list
		       "first element of a button must be a string (the label)"
		       menuitem)))
	  (or plistp
	      (< L 4)
	      (null (aref menuitem 3))
	      (stringp (aref menuitem 3))
	      (signal 'error
		      (list
		       "fourth element of a button must be a string (the label suffix)"
		       menuitem)))
	  (if plistp
	      (let ((i 2)
		    selp
		    style
		    item)
		(while (< i L)
		  (setq item (aref menuitem i))
		  (cond ((not (memq item '(:active :suffix :keys :style
						   :full :included :selected
						   :accelerator)))
			 (signal 'error
				 (list (if (keywordp item)
					   "unknown menu item keyword"
					 "not a keyword")
				       item menuitem)))
			((eq item :style)
			 (setq style (aref menuitem (1+ i)))
			 (or (memq style '(nil toggle radio button text))
			     (signal 'error (list "unknown style" style
						  menuitem))))
			((eq item :selected) (setq selp t))
			)
		  (setq i (+ i (if (eq item :full) 1 2))))
		(if (and selp (not (memq style '(toggle button radio))))
		    (signal 'error
			    (list
			     ":selected only makes sense with :style toggle, radio, or button"
			     menuitem)))
		)))
	)
       ;; (t (signal 'error (list "unrecognised menu descriptor" menuitem))))
       (t (message "unrecognised menu descriptor %s" (prin1-to-string menuitem))))
      (setq menu (cdr menu)))))


;;; menu manipulation functions

(defun find-menu-item (menubar item-path-list &optional parent)
  "Search MENUBAR for item given by ITEM-PATH-LIST starting from PARENT.
Returns (ITEM . PARENT), where PARENT is the immediate parent of
 the item found.
If the item does not exist, the car of the returned value is nil.
If some menu in the ITEM-PATH-LIST does not exist, an error is signalled."
  (check-argument-type 'listp item-path-list)
  (unless parent
    (setq item-path-list (mapcar 'normalize-menu-item-name item-path-list)))
  (if (not (consp menubar))
      nil
    (let ((rest menubar)
	  result)
      (when (stringp (car rest))
	(setq rest (cdr rest)))
      (while (keywordp (car rest))
	(setq rest (cddr rest)))
      (while rest
	(if (and (car rest)
		 (equal (car item-path-list)
			(normalize-menu-item-name
			 (cond ((vectorp (car rest))
				(aref (car rest) 0))
			       ((stringp (car rest))
				(car rest))
			       (t
				(caar rest))))))
	    (setq result (car rest)
		  rest nil)
	  (setq rest (cdr rest))))
      (if (cdr item-path-list)
	  (cond ((consp result)
		 (find-menu-item (cdr result) (cdr item-path-list) result))
		(result
		 (signal 'error (list (gettext "not a submenu") result)))
		(t
		 (signal 'error (list (gettext "no such submenu")
				      (car item-path-list)))))
	(cons result parent)))))

(defun add-menu-item-1 (leaf-p menu-path new-item before in-menu)
  ;; This code looks like it could be cleaned up some more
  ;; Do we really need 6 calls to find-menu-item?
  (when before (setq before (normalize-menu-item-name before)))
  (let* ((item-name
	  (cond ((vectorp new-item) (aref new-item 0))
		((consp   new-item) (car  new-item))
		(t nil)))
	 (menubar (or in-menu current-menubar))
	 (menu (condition-case ()
		   (car (find-menu-item menubar menu-path))
		 (error nil)))
	 (item-found (cond
		      ((null item-name)
		       nil)
		      ((not (listp menu))
		       (signal 'error (list (gettext "not a submenu")
					    menu-path)))
		      (menu
		       (find-menu-item (cdr menu) (list item-name)))
		      (t
		       (find-menu-item menubar (list item-name)))
		      )))
    (unless menubar
      (error "`current-menubar' is nil: can't add menus to it."))
    (unless menu
      (let ((rest menu-path)
	    (so-far menubar))
	(while rest
;;;	  (setq menu (car (find-menu-item (cdr so-far) (list (car rest)))))
	  (setq menu
		(if (eq so-far menubar)
		    (car (find-menu-item so-far (list (car rest))))
		  (car (find-menu-item (cdr so-far) (list (car rest))))))
	  (unless menu
	    (let ((rest2 so-far))
	      (while (and (cdr rest2) (car (cdr rest2)))
		(setq rest2 (cdr rest2)))
	      (setcdr rest2
		      (nconc (list (setq menu (list (car rest))))
			     (cdr rest2)))))
	  (setq so-far menu)
	  (setq rest (cdr rest)))))
    (if (and item-found (car item-found))
	;; hack the item in place.
	(if menu
	    ;; Isn't it very bad form to use nsubstitute for side effects?
	    (nsubstitute new-item (car item-found) menu)
	  (setq current-menubar (nsubstitute new-item
					     (car item-found)
					     current-menubar)))
      ;; OK, we have to add the whole thing...
      ;; if BEFORE is specified, try to add it there.
      (unless menu (setq menu current-menubar))
      (when before
	(setq before (car (find-menu-item menu (list before)))))
      (let ((rest menu)
	    (added-before nil))
	(while rest
	  (if (eq before (car (cdr rest)))
	      (progn
		(setcdr rest (cons new-item (cdr rest)))
		(setq rest nil added-before t))
	    (setq rest (cdr rest))))
	(when (not added-before)
	  ;; adding before the first item on the menubar itself is harder
	  (if (and (eq menu menubar) (eq before (car menu)))
	      (setq menu (cons new-item menu)
		    current-menubar menu)
	    ;; otherwise, add the item to the end.
	    (nconc menu (list new-item))))))
    (set-menubar-dirty-flag)
    new-item))

(defun add-menu-button (menu-path menu-leaf &optional before in-menu)
  "Add a menu item to some menu, creating the menu first if necessary.
If the named item exists already, it is changed.
MENU-PATH identifies the menu under which the new menu item should be inserted.
 It is a list of strings; for example, (\"File\") names the top-level \"File\"
 menu.  (\"File\" \"Foo\") names a hypothetical submenu of \"File\".
MENU-LEAF is a menubar leaf node.  See the documentation of `current-menubar'.
BEFORE, if provided, is the name of a menu item before which this item should
 be added, if this item is not on the menu already.  If the item is already
 present, it will not be moved.
If IN-MENU is present use that instead of `current-menubar' as the menu to
change.
"
  ;; Note easymenu.el uses the fact that menu-leaf can be a submenu.
  (add-menu-item-1 t menu-path menu-leaf before in-menu))

;; I actually liked the old name better, but the interface has changed too
;; drastically to keep it. --Stig 
(defun add-submenu (menu-path submenu &optional before in-menu)
  "Add a menu to the menubar or one of its submenus.
If the named menu exists already, it is changed.
MENU-PATH identifies the menu under which the new menu should be inserted.
 It is a list of strings; for example, (\"File\") names the top-level \"File\"
 menu.  (\"File\" \"Foo\") names a hypothetical submenu of \"File\".
 If MENU-PATH is nil, then the menu will be added to the menubar itself.
SUBMENU is the new menu to add.
 See the documentation of `current-menubar' for the syntax.
BEFORE, if provided, is the name of a menu before which this menu should
 be added, if this menu is not on its parent already.  If the menu is already
 present, it will not be moved."
  (check-menu-syntax submenu nil)
  (add-menu-item-1 nil menu-path submenu before in-menu))

(defun purecopy-menubar (x)
  ;; this calls purecopy on the strings, and the contents of the vectors,
  ;; but not on the vectors themselves, or the conses - those must be
  ;; writable.
  (cond ((vectorp x)
	 (let ((i (length x)))
	   (while (> i 0)
	     (aset x (1- i) (purecopy (aref x (1- i))))
	     (setq i (1- i))))
	 x)
	((consp x)
	 (let ((rest x))
	   (while rest
	     (setcar rest (purecopy-menubar (car rest)))
	     (setq rest (cdr rest))))
	 x)
	(t
	 (purecopy x))))

(defun delete-menu-item (path &optional from-menu)
  "Remove the named menu item from the menu hierarchy.
PATH is a list of strings which identify the position of the menu item in 
the menu hierarchy.  The documentation of `add-submenu' describes menu-paths."
  (let* ((pair (condition-case nil (find-menu-item (or from-menu
						       current-menubar) path)
		 (error nil)))
	 (item (car pair))
	 (parent (or (cdr pair) current-menubar)))
    (if (not item)
	nil
      ;; the menubar is the only special case, because other menus begin
      ;; with their name.
      (if (eq parent current-menubar)
	  (setq current-menubar (delq item parent))
	(delq item parent))
      (set-menubar-dirty-flag)
      item)))

(defun relabel-menu-item (path new-name)
  "Change the string of the specified menu item.
PATH is a list of strings which identify the position of the menu item in 
the menu hierarchy.  (\"File\" \"Save\") means the menu item called \"Save\"
under the toplevel \"File\" menu.  (\"Menu\" \"Foo\" \"Item\") means the 
menu item called \"Item\" under the \"Foo\" submenu of \"Menu\".
NEW-NAME is the string that the menu item will be printed as from now on."
  (or (stringp new-name)
      (setq new-name (signal 'wrong-type-argument (list 'stringp new-name))))
  (let* ((menubar current-menubar)
         (pair (find-menu-item menubar path))
         (item (car pair))
         (menu (cdr pair)))
    (or item
        (signal 'error (list (if menu (gettext "No such menu item")
                               (gettext "No such menu"))
                             path)))
    (if (and (consp item)
             (stringp (car item)))
        (setcar item new-name)
      (aset item 0 new-name))
    (set-menubar-dirty-flag)
    item))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; these are all bad style.  Why in the world would we put evaluable forms
;; into the menubar if we didn't want people to use 'em?
;; x-font-menu.el is the only known offender right now and that ought to be
;; rehashed a bit.
;; 

(defun enable-menu-item-1 (path toggle-p on-p)
  (let (menu item)
    (if (and (vectorp path) (> (length path) 2)) ; limited syntax checking...
        (setq item path)
      (let* ((menubar current-menubar)
             (pair (find-menu-item menubar path)))
        (setq item (car pair)
              menu (cdr pair))
        (or item
            (signal 'error (list (if menu
                                     "No such menu item"
                                   "No such menu")
                                 path)))
        (if (consp item)
            (error "%S is a menu, not a menu item" path))))
    (if (or (> (length item) 4)
            (and (symbolp (aref item 2))
                 (= ?: (aref (symbol-name (aref item 2)) 0))))
        ;; plist-like syntax
        (let ((i 2)
              (keyword (if toggle-p :selected :active))
              (ok nil))
          (while (< i (length item))
            (cond ((eq (aref item i) keyword)
                   (aset item (1+ i) on-p)
                   (setq ok t)))
            (setq i (+ i 2)))
          (cond (ok nil)
                (toggle-p
                 (signal 'error (list "not a toggle menu item" item)))
                (t
                 ;; Need to copy the item to extend it, sigh...
                 (let ((cons (memq item menu))
                       (new-item (vconcat item (list keyword on-p))))
                   (if cons
                       (setcar cons (setq item new-item))
                     (if menu
                         (error "couldn't find %S on its parent?" item)
                       (error "no %S slot to set: %S" keyword item)))))))
      ;; positional syntax
      (if toggle-p
          (signal 'error (list "not a toggle menu item" item))
        (aset item 2 on-p)))
    (set-menubar-dirty-flag)
    item))

(defun enable-menu-item (path)
  "Make the named menu item be selectable.
PATH is a list of strings which identify the position of the menu item in 
the menu hierarchy.  (\"File\" \"Save\") means the menu item called \"Save\"
under the toplevel \"File\" menu.  (\"Menu\" \"Foo\" \"Item\") means the 
menu item called \"Item\" under the \"Foo\" submenu of \"Menu\"."
  (enable-menu-item-1 path nil t))

(defun disable-menu-item (path)
  "Make the named menu item be unselectable.
PATH is a list of strings which identify the position of the menu item in 
the menu hierarchy.  (\"File\" \"Save\") means the menu item called \"Save\"
under the toplevel \"File\" menu.  (\"Menu\" \"Foo\" \"Item\") means the 
menu item called \"Item\" under the \"Foo\" submenu of \"Menu\"."
  (enable-menu-item-1 path nil nil))

(defun select-toggle-menu-item (path)
  "Make the named toggle- or radio-style menu item be in the `selected' state.
PATH is a list of strings which identify the position of the menu item in 
the menu hierarchy.  (\"File\" \"Save\") means the menu item called \"Save\"
under the toplevel \"File\" menu.  (\"Menu\" \"Foo\" \"Item\") means the 
menu item called \"Item\" under the \"Foo\" submenu of \"Menu\"."
  (enable-menu-item-1 path t t))

(defun deselect-toggle-menu-item (path)
 "Make the named toggle- or radio-style menu item be in the `unselected' state.
PATH is a list of strings which identify the position of the menu item in 
the menu hierarchy.  (\"File\" \"Save\") means the menu item called \"Save\"
under the toplevel \"File\" menu.  (\"Menu\" \"Foo\" \"Item\") means the 
menu item called \"Item\" under the \"Foo\" submenu of \"Menu\"."
  (enable-menu-item-1 path t nil))


(defun get-popup-menu-response (menu-desc &optional event)
  "Pop up the given menu and wait for a response.
This blocks until the response is received, and returns the misc-user
event that encapsulates the response.  To execute it, you can do
  (funcall (event-function response) (event-object response))
If no response was received, nil is returned.

MENU-DESC and EVENT are as in the call to `popup-menu'."
  ;; partially stolen from w3
  (let ((echo-keystrokes 0)
	new-event)
    (popup-menu menu-desc event)
    (catch 'popup-done
      (while t
	(setq new-event (next-command-event new-event))
	(cond ((misc-user-event-p new-event)
	       (throw 'popup-done new-event))
	      ((not (popup-up-p))
	       (setq unread-command-events (cons new-event
						 unread-command-events))
	       (throw 'popup-done nil))
	      ((button-release-event-p new-event);; don't beep twice
	       nil)
	      ((event-matches-key-specifier-p (quit-char))
	       (signal 'quit nil))
	      (t
	       (beep)
	       (message "please make a choice from the menu.")))))))

(defun popup-menu-and-execute-in-window (menu-desc event)
  "Pop up the given menu and execute its response in EVENT's window.
This blocks until the response is received, temporarily selects
EVENT's window, and executes the command specified in the response.
EVENT can also be a window.  See `popup-menu' for the semantics of
MENU-DESC."
  (let ((response
	 (get-popup-menu-response menu-desc
				  (and (eventp event) event))))
    (and (misc-user-event-p response)
	 (save-selected-window
	   (select-window (if (windowp event) event
			    (event-window event)))
	   (funcall (event-function response)
		    (event-object response))))))

;; provide default bindings for menu accelerator map
(and (boundp 'menu-accelerator-map)
     (keymapp menu-accelerator-map)
     (progn
       (define-key menu-accelerator-map "\e" 'menu-escape)
       (define-key menu-accelerator-map [left] 'menu-left)
       (define-key menu-accelerator-map [right] 'menu-right)
       (define-key menu-accelerator-map [up] 'menu-up)
       (define-key menu-accelerator-map [down] 'menu-down)
       (define-key menu-accelerator-map [return] 'menu-select)
       (define-key menu-accelerator-map [kp_down] 'menu-down)
       (define-key menu-accelerator-map [kp_up] 'menu-down)
       (define-key menu-accelerator-map [kp_left] 'menu-left)
       (define-key menu-accelerator-map [kp_right] 'menu-right)
       (define-key menu-accelerator-map [kp_enter] 'menu-select)
       (define-key menu-accelerator-map "\C-g" 'menu-quit)))


(provide 'menubar)

;;; menubar.el ends here
