;;; dialog-items.el --- Dialog-box content for XEmacs

;; Copyright (C) 2000 Andy Piper.
;; Copyright (C) 2000 Ben Wing.

;; Maintainer: XEmacs Development Team
;; Keywords: content, gui, internal, dumped

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

;;; Synched up with: Not in FSF.

;;; Commentary:

;;
;; Simple search dialog
;;
(defvar search-dialog-direction t)
(defvar search-dialog-regexp nil)
(defvar search-dialog nil)

(defun search-dialog-callback (parent image-instance event)
  (save-selected-frame
    (select-frame parent)
    (let ((domain (frame-selected-window  (event-channel event))))
      (funcall (if search-dialog-direction
		   (if search-dialog-regexp
		       're-search-forward
		     'search-forward)
		 (if search-dialog-regexp
		     're-search-backward
		   'search-backward))
	       (glyph-image-property
		(car (glyph-image-property 
		      (nth 1 (glyph-image-property
			    search-dialog :items domain))
		      :items domain)) :text domain))
      (isearch-highlight (match-beginning 0) (match-end 0)))))

(defun make-search-dialog ()
  "Popup a search dialog box."
  (interactive)
  (let ((parent (selected-frame)))
    (make-dialog-box 
     'general
     :parent parent
     :title "Search"
     :spec
     (setq search-dialog
	   (make-glyph
	    `[layout 
	      :orientation horizontal :justify left
	      ;; neither the following height/width nor the identical one
	      ;; below should be necessary! (see below)
	      :height 11 :width 40
	      :border [string :data "Search"]
	      :items 
	      ([layout :orientation vertical :justify left
		       :items 
		       ([string :data "Search for:"]
			[button :descriptor "Match Case"
				:style toggle
				:selected (not case-fold-search)
				:callback (setq case-fold-search
						(not case-fold-search))]
			[button :descriptor "Regular Expression"
				:style toggle
				:selected search-dialog-regexp
				:callback (setq search-dialog-regexp
						(not search-dialog-regexp))]
			[button :descriptor "Forwards"
				:style radio
				:selected search-dialog-direction
				:callback (setq search-dialog-direction t)]
			[button :descriptor "Backwards"
				:style radio
				:selected (not search-dialog-direction)
				:callback (setq search-dialog-direction nil)]
			)]
	       [layout :orientation vertical :justify left
		       :items 
		       ([edit-field :width 15 :descriptor "" :active t
				    :face default :initial-focus t]
			[button :width 10 :descriptor "Find Next"
				:callback-ex
				(lambda (image-instance event)
				  (search-dialog-callback ,parent
							  image-instance
							  event))]
			[button :width 10 :descriptor "Cancel"
				:callback-ex
				(lambda (image-instance event)
				  (isearch-dehighlight)
				  (delete-frame 
				   (event-channel event)))])])]))
     ;; neither this height/width nor the identical one above should
     ;; be necessary! (in fact, if you omit the one above, the layout
     ;; sizes itself correctly; but the frame as a whole doesn't use
     ;; the layout's size, as it should.)
     :properties '(height 11 width 40))))
