(make-charset 'mojikyo
	      "Mojikyo"
	      `(long-name "Mojikyo"
			  chars 256
			  dimension 3
			  columns 2
			  graphic 2
			  direction l2r
			  min-code ,(lsh #x6000 16)
			  max-code ,(1- (+ (lsh #x6000 16)
					   (* 94 60 22)))
			  code-offset ,(lsh #x6000 16)))

(make-charset 'mojikyo-2022-1
	      "Mojikyo-2022-1"
	      `(long-name "Mojikyo for ISO 2022 based CES, Part 1"
			  chars 94
			  dimension 3
			  columns 2
			  graphic 0
			  direction l2r
			  mother mojikyo
			  min-code 0
			  max-code ,(1- (* 94 94 60))
			  code-offset 1
			  conversion 94x94x60))

(let ((i 1)
      name)
  (while (<= i 21)
    (make-charset (setq name (intern (format "mojikyo-pj-%d" i)))
		  (format "Mojikyo PJ %d" i)
		  `(long-name ,(format "Mojikyo Psedo JIS Part %d" i)
			      chars 94
			      dimension 2
			      columns 2
			      graphic 0
			      registry ,(format "MojikyoPJ-%d" i)
			      direction l2r
			      mother mojikyo
			      min-code ,(1+ (* 94 60 (1- i)))
			      max-code ,(* 94 60 i)
			      code-offset ,(1+ (* 94 60 (1- i)))
			      conversion 94x60))
    (unless (memq name default-coded-charset-priority-list)
      (setq default-coded-charset-priority-list
	    (append default-coded-charset-priority-list
		    (list name))))
    (setq i (1+ i))))
