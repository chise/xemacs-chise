(require 'read-maps)

(dolist (file '("J90-to-UCS.txt" "JSP-to-UCS.txt"
		"JX1-to-UCS.txt" "JX2-to-UCS.txt"
		"C3-to-UCS.txt" "C4-to-UCS.txt"
		"B-to-UCS.txt" "JC3-to-UCS.txt"))
  (mapping-table-read-file (expand-file-name file "../etc/char-data/")))


(let ((ucs #xE000)
      big5 chr
      ret)
  (while (<= ucs #xF848)
    (setq chr (decode-char 'ucs ucs))
    (when (setq big5 (get-char-attribute chr '=big5-pua))
      (when (setq chr (decode-char '=big5-cdp big5))
	(unless (get-char-attribute chr '=big5-cdp)
	  (put-char-attribute chr '=big5-cdp big5))))
    (setq ucs (1+ ucs))))


(map-char-attribute
 (lambda (c v)
   (unless (memq v '(#x5C37 #x5C52 #x3521 #x5D62 #x5F4A
		     #x5F5B #x6062 #x4849 #x6173 #x306B
		     #x6328 #x6352 #x6362))
     (put-char-attribute (decode-char 'japanese-jisx0208-1990 v)
			 '=gt-pj-1 v))
   nil)
 '=gt-pj-1)

(let ((default-coded-charset-priority-list
	'(=gt-pj-1
	  =gt-pj-2
	  =gt-pj-3
	  =gt-pj-4
	  =gt-pj-5
	  =gt-pj-6
	  =gt-pj-7
	  =gt-pj-8
	  =gt-pj-9
	  =gt-pj-10
	  =gt-pj-11
	  =gt-pj-k1
	  =gt-pj-k2))
      (i 1)
      chr ret)
  (while (<= i 12000)
    (when (and (setq ret (decode-char '=gt-k i))
	       (setq ret (split-char ret))
	       (memq (car ret) default-coded-charset-priority-list))
      (when (setq chr (apply (function make-char) ret))
	(put-char-attribute chr '=gt-k i)))
    (setq i (1+ i))))

(let (gt)
  (dolist (ccs '(=gt-pj-1
		 =gt-pj-2
		 =gt-pj-3
		 =gt-pj-4
		 =gt-pj-5
		 =gt-pj-6
		 =gt-pj-7
		 =gt-pj-8
		 =gt-pj-9
		 =gt-pj-10
		 =gt-pj-11))
    (map-char-attribute
     (lambda (c v)
       (when (setq gt (encode-char c '=gt))
	 (put-char-attribute c '=gt gt)
	 (put-char-attribute (decode-char ccs v) '=gt gt))
       nil)
     ccs)))
