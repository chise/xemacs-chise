(let ((ucs #xE000)
      big5 chr
      ret)
  (while (<= ucs #xF848)
    (setq chr (decode-char 'ucs ucs))
    (when (setq big5 (get-char-attribute chr 'chinese-big5))
      (when (setq chr (decode-char 'chinese-big5-cdp big5))
	(unless (get-char-attribute chr 'chinese-big5-cdp)
	  (put-char-attribute chr 'chinese-big5-cdp big5))))
    (setq ucs (1+ ucs))))

(map-char-attribute
 (lambda (ch v)
   (if (and ch
            (get-char-attribute ch 'chinese-big5))
       (remove-char-attribute ch 'chinese-big5))
   nil)
 'chinese-big5-cdp)
