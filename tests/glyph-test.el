(set-extent-begin-glyph 
 (make-extent (point) (point))
 (setq icon (make-glyph [xpm :file "../etc/xemacs-icon.xpm"])))

(defun foo ()
  (interactive) 
  (setq ok-select (not ok-select)))

;; button in a group
(setq ok-select nil)
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (make-glyph [button :descriptor ["ok     " (setq ok-select t)
				  :style radio :selected ok-select]]))
;; button in a group
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (make-glyph [button :descriptor ["ok" (setq ok-select nil) :style radio 
				  :selected (not ok-select)]]))
;; normal pushbutton
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (setq pbutton (make-glyph 
		[button :width 10 :height 2 
			:face modeline-mousable
			:descriptor "ok" :callback foo 
			:selected t])))
;; progress gauge
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (setq pgauge (make-glyph 
	       [progress :width 10 :height 2 
			 :descriptor "ok"])))
;; progress the progress ...
(let ((x 0))
  (while (<= x 100)
    (set-image-instance-property (glyph-image-instance pgauge) :percent x)
    (setq x (+ x 5))
    (sit-for 0.1)))

;; progress gauge in the modeline
(setq global-mode-string 
      (cons (make-extent nil nil)
	    (setq pg (make-glyph 
		      [progress :width 5 :pixel-height 16
				:descriptor "ok"]))))
;; progress the progress ...
(let ((x 0))
  (while (<= x 100)
    (set-image-instance-property (glyph-image-instance pg) :percent x)
    (setq x (+ x 5))
    (sit-for 0.1)))

(set-extent-begin-glyph 
 (make-extent (point) (point))
 (make-glyph 
  [button :face modeline-mousable
	  :descriptor "ok" :callback foo
	  :image (make-glyph 
		  [xpm :file "../etc/xemacs-icon.xpm"])]))

;; normal pushbutton
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (make-glyph [button :descriptor ["A Big Button" foo ]]))
;; edit box
(set-extent-begin-glyph 
 (make-extent (point) (point)) 
 (setq hedit (make-glyph [edit :pixel-width 50 :pixel-height 30
			       :face bold-italic
			       :descriptor ["Hello"]])))
;; combo box
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (setq hcombo (make-glyph 
	       [combo :width 10 :height 3 :descriptor ["Hello"] 
		      :properties (:items ("One" "Two" "Three"))])))

;; line
(set-extent-begin-glyph 
 (make-extent (point) (point))
 (make-glyph [label :pixel-width 150 :descriptor "Hello"]))

;; scrollbar
;(set-extent-begin-glyph 
; (make-extent (point) (point))
; (make-glyph [scrollbar :width 50 :height 20 :descriptor ["Hello"]]))

;; generic subwindow
(setq sw (make-glyph [subwindow :pixel-width 50 :pixel-height 50]))
(set-extent-begin-glyph (make-extent (point) (point)) sw)

