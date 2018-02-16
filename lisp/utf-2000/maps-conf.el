(require 'read-maps)

(dolist (file '("J90-to-UCS.txt" "JSP-to-UCS.txt"
		"JX1-to-UCS.txt" "JX2-to-UCS.txt"
		"K0-to-UCS.txt"
		"G0-to-UCS.txt"
		"C1-to-UCS.txt" "C2-to-UCS.txt"
		"C3-to-UCS.txt" "C4-to-UCS.txt"
		"C5-to-UCS.txt" "C6-to-UCS.txt"
		"C7-to-UCS.txt"
		"B-to-UCS.txt" "JC3-to-UCS.txt"))
  (mapping-table-read-file (expand-file-name file "../etc/char-data/")))

(ucs-compat-read-file "../etc/char-data/UCS-compat.txt")

(jp-jouyou-read-file "../etc/char-data/jp-jouyou.txt")

(let ((ucs #xE000)
      big5 chr)
  (while (<= ucs #xF848)
    (setq chr (decode-char 'ucs ucs))
    (when (setq big5 (get-char-attribute chr '=big5-pua))
      (when (setq chr (decode-char '=big5-cdp big5))
	(unless (get-char-attribute chr '=big5-cdp)
	  (put-char-attribute chr '=big5-cdp big5))))
    (setq ucs (1+ ucs))))


(defconst gt-pj-1-and-jis-x0208-1990-different-code-points
      '(#x5C37 #x5C52 #x3521 #x5D62 #x5F4A
	#x5F5B #x6062 #x4849 #x6173 #x306B
	#x6328 #x6352 #x6362 #x6471 #x6524
	#x6530 #x6549 #x6628 #x4356 #x665C
	#x665D #x6661 #x6660 #x6663 #x4F38
	#x666B #x4C2E #x6724 #x3D58 #x682B
	#x427B #x4978 #x694A #x303A #x6A44
	#x6B43 #x6B78 #x6C2E #x6C57 #x6D36
	#x6D3A #x3D34 #x4A56 #x3063 #x3D3F
	#x6E60 #x6F52 #x6F5C #x3458 #x4262
	#x4E59 #x6F58 #x7051 #x7056 #x375B
	#x7123 #x712A #x3142 #x3B41 #x7149
	#x7165 #x7227 #x7233 #x733B #x4E6F
	#x7366 #x7367 #x7368 #x736C #x5423
	#x342A #x3476 #x5877 #x592D #x5A61
	#x3522 #x334C #x657D #x657E #x6621
	#x335C #x6D7D #x507C #x417C #x5371
	#x3766 #x3E7D #x555D #x5739 #x5831
	#x3F78 #x5973 #x5A33 #x5970 #x5A49
	#x3F22 #x6026 #x4D32 #x612E #x4D63
	#x4E57 #x316A #x4A43 #x723C #x6A64
	#x6B36 #x6E43 #x3D36 #x6E44 #x3C60
	#x6E45 #x6E46 #x6E48 #x6E4B #x6E4A
	#x6E4F #x6E52 #x6E51 #x4830 #x6E54
	#x6E55 #x395A #x724D #x737D #x3973
	#x5379 #x5879 #x3D5D #x3C21 #x4C60
	#x5267 #x722F #x3C39 #x3848 #x5578
	#x4742 #x6950 #x697C #x6A24 #x5350
	#x3326 #x5575 #x5A4B #x3647 #x343F
	#x4337 #x492D #x3F6C #x6E4D #x4F3F
	#x353D #x4324 #x475B #x6E47 #x4371
	#x3F5D #x6E49 #x4D6F #x3C72 #x3D37
	#x6E4C #x3B44 #x734E #x5567 #x545A
	#x3071 #x332A #x516A #x476D #x3675
	#x5734 #x552D #x565A #x564B #x5B79
	#x5C74 #x5C27 #x5B5E #x3564 #x3823
	#x6131 #x4A4D #x632E #x635E #x3729
	#x3951 #x6967 #x704B #x3C38 #x6B26
	#x4749 #x4428 #x3A47 #x6E4E #x4269
	#x4043 #x6E56 #x6132 #x5C54 #x3557
	#x5827 #x4C68 #x505B #x514A #x5D27
	#x5563 #x5D7A #x4575 #x5F7C #x3B38
	#x3237 #x3B51 #x596E #x5B5B #x6640
	#x6D75 #x4D2C #x737B #x7379 #x5E7A
	#x3E7A #x3865 #x557B #x436B #x413B
	#x562D #x4C28 #x562F #x5631 #x5632
	#x5633 #x5635 #x463D #x362E #x3265
	#x563B #x4A76 #x5638 #x5637 #x3A6A
	#x5642 #x563D #x5647 #x5641 #x5644
	#x5648 #x564A #x3A37 #x564F #x4568
	#x5653 #x5652 #x5654 #x5655 #x5659
	#x565C #x3474 #x562E #x5630 #x5639
	#x3D54 #x5645 #x564E #x5651 #x564C
	#x3460 #x565B #x5628 #x5726 #x5759
	#x583E #x5833 #x5843 #x584E #x5860
	#x585D #x4463 #x4C31 #x5351 #x6243
	#x587A #x5921 #x4879 #x4530 #x4863
	#x5932 #x3E35 #x4D5E #x5A2D #x4471
	#x5939 #x3348 #x3969 #x594D #x3044
	#x594B #x3027 #x3F36 #x405C #x5964
	#x5962 #x5953 #x5977 #x3B35 #x4531
	#x5A26 #x5A2B #x5A2F #x5A36 #x5A37
	#x5A3B #x5A2C #x5A2A #x5A40 #x5A3F
	#x5A41 #x327E #x384E #x5A43 #x5A47
	#x5A45 #x4754 #x343A #x3B36 #x4658
	#x3749 #x3F74 #x4528 #x4030 #x5A4C
	#x507B #x507E #x5353 #x5A44 #x6E2B
	#x5B30 #x4C40 #x376E #x6067 #x4E28
	#x6425))

(map-char-attribute
 (lambda (c v)
   (unless (memq v gt-pj-1-and-jis-x0208-1990-different-code-points)
     (put-char-attribute (decode-char '=jis-x0208@1990 v)
			 '=gt-pj-1 v))
   nil)
 '=gt-pj-1)

(let ((i 1)
      chr)
  (while (<= i 67547)
    (when (setq chr (decode-char '=gt i))
      (put-char-attribute chr '=gt i))
    (setq i (1+ i))))

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

;; (let (gt ret)
;;   (dolist (ccs '(=gt-pj-1
;;                  =gt-pj-2
;;                  =gt-pj-3
;;                  =gt-pj-4
;;                  =gt-pj-5
;;                  =gt-pj-6
;;                  =gt-pj-7
;;                  =gt-pj-8
;;                  =gt-pj-9
;;                  =gt-pj-10
;;                  =gt-pj-11))
;;     (map-char-attribute
;;      (lambda (c v)
;;        (when (setq gt (encode-char c '=gt))
;;          (put-char-attribute c '=gt gt)
;;          (put-char-attribute (decode-char ccs v) '=gt gt))
;;        nil)
;;      ccs)))

;; (let (ret)
;;   (dolist (feature
;;            (let (dest)
;;              (dolist (feature (char-attribute-list))
;;                (when (string-match "\\*sources\\($\\|@[^\\*]+$\\)"
;;                                    (symbol-name feature))
;;                  (setq dest (cons feature dest))))
;;              dest))
;;     (map-char-attribute
;;      (lambda (c v)
;;        (when (setq ret (memq 'shinjigen-1 v))
;;          (setcar ret 'shinjigen@1ed))
;;        (when (setq ret (memq 'shinjigen-2 v))
;;          (setcar ret 'shinjigen@rev))
;;        nil)
;;      feature)))

;; (map-char-attribute
;;  (lambda (c v)
;;    (when (eq (encode-char c '=shinjigen@rev) v)
;;      (put-char-attribute c '=shinjigen v)
;;      (remove-char-attribute c '=shinjigen@1ed)
;;      (remove-char-attribute c '=shinjigen@rev)
;;      )
;;    nil)
;;  '=shinjigen@1ed)

;; (let (ret)
;;   (dolist (feature
;;            (let (dest)
;;              (dolist (feature (char-attribute-list))
;;                (when (string-match "\\*sources\\($\\|@[^\\*]+$\\)"
;;                                    (symbol-name feature))
;;                  (setq dest (cons feature dest))))
;;              dest))
;;     (map-char-attribute
;;      (lambda (c v)
;;        (cond ((setq ret (memq 'shinjigen@1ed v))
;;               (when (memq 'shinjigen@rev ret)
;;                 (setcar ret 'shinjigen)
;;                 (delq 'shinjigen@rev ret)
;;                 ))
;;              ((setq ret (memq 'shinjigen@rev v))
;;               (when (memq 'shinjigen@1ed ret)
;;                 (setcar ret 'shinjigen)
;;                 (delq 'shinjigen@1ed ret)
;;                 )))
;;        nil)
;;      feature)))

(dolist (ccs '(=jis-x0208 =jis-x0208@1990))
  (map-char-attribute
   (lambda (c v)
     (unless (eq (encode-char c '=jis-x0213-1@2000) v)
       (put-char-attribute c '=jis-x0213-1 v))
     nil)
   ccs))

(with-temp-buffer
  (buffer-disable-undo)
  (insert-file-contents "../etc/char-data/JX3-JX1-rep-diff.txt")
  (goto-char (point-min))
  (let (ku ten char code ucs rep-char)
    (while (re-search-forward "^1-\\([0-9]+\\)-\\([0-9]+\\)[ \t]+" nil t)
      (setq ku (string-to-number (match-string 1))
	    ten (string-to-number (match-string 2)))
      (setq char (make-char '=jis-x0213-1@2000 (+ ku 32)(+ ten 32)))
      (setq code (encode-char char '=jis-x0213-1@2000))
      (setq ucs (encode-char char '=ucs@jis/2000))
      (setq rep-char (decode-char '==jis-x0213-1@2000 code))
      (cond
       ((or (eq char rep-char)
	    (null rep-char))
	(put-char-attribute char '=jis-x0213-1@2000 code)
	(remove-char-attribute char '=jis-x0213-1)
	(remove-char-attribute char '=jis-x0213-1@2004)
	(remove-char-attribute char '=ucs@jis)
	(remove-char-attribute char '=ucs@jis/2004)
	(when (setq char (decode-char '=jis-x0213-1@2004 code))
	  (unless (eq (encode-char char '=ucs@jis/2004) ucs)
	    (put-char-attribute char '=ucs@jis/2004 ucs)))
	)
       (rep-char
	(unless (and (= ku 47)(= ten 64))
	  (put-char-attribute rep-char '==jis-x0213-1@2000 code)
	  (remove-char-attribute rep-char '==jis-x0213-1)
	  (remove-char-attribute rep-char '==jis-x0213-1@2004)
	  (setq ucs (or (encode-char rep-char '==ucs@jis/2000)
			ucs))
	  (remove-char-attribute rep-char '==ucs@jis)
	  (remove-char-attribute rep-char '==ucs@jis/2004))
	(when (setq rep-char (decode-char '==jis-x0213-1@2004 code))
	  (unless (eq (encode-char rep-char '==ucs@jis/2004) ucs)
	    (put-char-attribute rep-char '==ucs@jis/2004 ucs)))
	))
      (unless (eq code #x332A)
	(when (setq char (decode-char '=>jis-x0208@1997 code 'defined-only))
	  (unless (eq (encode-char char '=>>jis-x0208) code)
	    (unless (eq (encode-char char '=+>jis-x0208) code)
	      (put-char-attribute char '=>jis-x0208 code)
	      (remove-char-attribute char '=>jis-x0208@1997)))))
      )))

(map-char-attribute
 (lambda (c v)
   (unless (eq (encode-char c '=>jis-x0213-1) v)
     (put-char-attribute c '=>jis-x0213-1 v))
   nil)
 '=>jis-x0208)

(let (dg-chr)
  (map-char-attribute
   (lambda (c v)
     (when (setq dg-chr (decode-char '===jis-x0212 v))
       (unless (eq c dg-chr)
	 (put-char-attribute dg-chr '===hanyo-denshi/jb v)))
     nil)
   '==hanyo-denshi/jb)
  (map-char-attribute
   (lambda (c v)
     (when (setq dg-chr (decode-char '===jis-x0213-1@2000 v))
       (unless (eq c dg-chr)
	 (put-char-attribute dg-chr '===hanyo-denshi/jc v)))
     nil)
   '==hanyo-denshi/jc)
  (map-char-attribute
   (lambda (c v)
     (when (setq dg-chr (decode-char '===jis-x0213-2 v))
       (unless (eq c dg-chr)
	 (put-char-attribute dg-chr '===hanyo-denshi/jd v)))
     nil)
   '==hanyo-denshi/jd)
  )

(let (j-chr)
  (map-char-attribute
   (lambda (c v)
     (if (and (setq j-chr (decode-char '=ucs@JP v))
	      (not (eq j-chr c))
	      (null (encode-char c '=ucs)))
	 (put-char-attribute c '=ucs@JP/hanazono nil))
     nil)
   '=ucs@unicode)
  (map-char-attribute
   (lambda (c v)
     (if (and (setq j-chr (decode-char '==ucs@JP v))
	      (not (eq j-chr c)))
	 (put-char-attribute c '==ucs@JP/hanazono nil))
     nil)
   '==ucs@unicode)
  )

(defun glyph-form-feature-to-glyph-image-char-spec (dg-fn
						    code-point
						    &optional
						    rep-gi-fn dg-char)
  (unless rep-gi-fn
    (setq rep-gi-fn (intern (format "=%s" dg-fn))))
  (unless dg-char
    (setq dg-char (decode-char dg-fn code-point)))
  (let (code)
    (when (find-charset rep-gi-fn)
      (cons (cons rep-gi-fn code-point)
	    (cond
	     ((eq dg-fn '==gt)
	      (if (setq code (encode-char dg-char '==gt-k))
		  (list (cons '===gt-k code)))
	      )
	     ((eq dg-fn '==hanyo-denshi/jc)
	      (cond ((encode-char dg-char '==jis-x0213-1)
		     (list (cons '===jis-x0213-1 code-point))
		     )
		    ((encode-char dg-char '==jis-x0213-1@2000)
		     (list (cons '===jis-x0213-1@2000 code-point))
		     ))
	      )
	     ((eq dg-fn '==hanyo-denshi/jd)
	      (list (cons '===jis-x0213-2 code-point))
	      )
	     ((eq dg-fn '==jis-x0208)
	      (cond ((encode-char dg-char '==jis-x0213-1)
		     (list (cons '===jis-x0213-1 code-point))
		     )
		    ((encode-char dg-char '==jis-x0213-1@2000)
		     (list (cons '===jis-x0213-1@2000 code-point))
		     ))
	      )
	     ((eq dg-fn '==ks-x1001)
	      (if (setq code (encode-char dg-char '==ucs@ks))
		  (list (cons '===ucs@ks code)))
	      ))))))

(let (dest rep-gi-fn rep-gi spec target-dg-fns)
  (dolist (fn (char-attribute-list))
    (when (and (find-charset fn)
	       (string-match "^==[^*=>]+$" (symbol-name fn)))
      (setq dest (cons fn dest))))
  (setq dest (sort dest
		   (lambda (a b)
		     (cond ((eq a '==daikanwa)
			    t)
			   ((eq a '==daikanwa/+p)
			    t)
			   ((eq a '==daikanwa/ho)
			    t)
			   ((eq a '==jis-x0208)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho))
				   nil)
				  (t)))
			   ((eq a '==jis-x0208@1978)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208))
				   nil)
				  (t)))
			   ((eq a '==jis-x0208@1983)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208
					     ==jis-x0208@1978))
				   nil)
				  (t)))
			   ((eq a '==jis-x0208@1990)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208
					     ==jis-x0208@1978
					     ==jis-x0208@1983))
				   nil)
				  (t)))
			   ((eq a '==jis-x0212)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208
					     ==jis-x0208@1978
					     ==jis-x0208@1983 ==jis-x0208@1990))
				   nil)
				  (t)))
			   ((eq a '==jis-x0213-1)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208
					     ==jis-x0208@1978
					     ==jis-x0208@1983 ==jis-x0208@1990
					     ==jis-x0212))
				   nil)
				  (t)))
			   ((eq a '==jis-x0213-2)
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208
					     ==jis-x0208@1978
					     ==jis-x0208@1983 ==jis-x0208@1990
					     ==jis-x0212 ==jis-x0213-1))
				   nil)
				  (t)))
			   (t
			    (cond ((memq b '(==daikanwa
					     ==daikanwa/+p ==daikanwa/ho
					     ==jis-x0208
					     ==jis-x0208@1978
					     ==jis-x0208@1983 ==jis-x0208@1990
					     ==jis-x0212
					     ==jis-x0213-1 ==jis-x0213-2))
				   nil)
				  (t
				   (string< (symbol-name a)(symbol-name b)))))))))
  (dolist (dg-fn dest)
    (setq rep-gi-fn (intern (format "=%s" dg-fn)))
    (when (find-charset rep-gi-fn)
      (map-char-attribute
       (lambda (c v)
	 (setq rep-gi (decode-char rep-gi-fn v))
	 (unless (or (and (eq dg-fn '==jis-x0208)
			  (eq (get-char-attribute
			       (decode-char '===jis-x0208@1990 v)
			       '===jis-x0208@1990)
			      v))
		     (and (eq dg-fn '==jis-x0213-1)
			  (eq (get-char-attribute
			       (decode-char '===jis-x0213-1@2000 v)
			       '===jis-x0213-1@2000)
			     v))
		     (and rep-gi
			  (not (eq c rep-gi))))
	   (if (get-char-attribute c '->subsumptive)
	       (if (setq rep-gi
			 (define-char
                           (glyph-form-feature-to-glyph-image-char-spec
			    dg-fn v rep-gi-fn c)
			   ;; (list (cons rep-gi-fn v))
			   ))
		   (put-char-attribute rep-gi '<-subsumptive (list c)))
	     (setq spec (char-attribute-alist c))
	     (setq target-dg-fns nil)
	     (dolist (fp spec)
	       (unless (memq (car fp)
			     '(==ks-x1001
			       ==hanyo-denshi/jb
			       ==hanyo-denshi/jc ==hanyo-denshi/jd
			       ==gt-k))
		 (when (find-charset (intern (format "=%s" (car fp))))
		   (setq target-dg-fns (cons (car fp) target-dg-fns)))))
	     (when (cdr target-dg-fns)
	       (setq rep-gi
		     (define-char
		       (glyph-form-feature-to-glyph-image-char-spec
			dg-fn v rep-gi-fn c)))
	       (if rep-gi
		   (put-char-attribute rep-gi '<-subsumptive (list c))))))
	 nil)
       dg-fn))))

(let (chr ucs)
  (map-char-attribute
   (lambda (c v)
     (when (and (setq chr (decode-char '=ks-x1001 v))
		(setq ucs (encode-char chr '=ucs@ks)))
       (put-char-attribute c '===ucs@ks ucs))
     nil)
   '===ks-x1001))
