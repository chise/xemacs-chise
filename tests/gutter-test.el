(setq str "Hello There\nHello Again")
(set-extent-begin-glyph 
 (make-extent 0 0 str)
 (make-glyph [xpm :file "../etc/xemacs-icon.xpm"]))

(set-extent-begin-glyph
 (make-extent 3 3 str)
 (make-glyph 
  [button :width 5 :height 1
	  :face modeline-mousable
	  :descriptor "ok" :selected t]))

(set-specifier default-gutter-height 'autodetect)
(set-specifier default-gutter-width 40)
(set-specifier default-gutter-border-width 2)
(set-specifier default-gutter str)
(set-default-gutter-position 'bottom)
