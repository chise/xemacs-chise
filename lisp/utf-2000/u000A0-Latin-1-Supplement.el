(define-char
  '((name		. "NO-BREAK SPACE")
    (ucs		. #x00A0)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (latin-iso8859-1	#x20)	;  
    (latin-iso8859-2	#x20)	; -B -A
    (latin-iso8859-3	#x20)	; -C -A
    (latin-iso8859-4	#x20)	; -D -A
    (greek-iso8859-7	#x20)	; -F -A
    (hebrew-iso8859-8	#x20)	; ›2]-H ›0]-A
    (cyrillic-iso8859-5 #x20)	; -L -A
    (latin-iso8859-9	#x20)	; -M -A
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x21)	; ¡
    (latin-iso8859-9	#x21)	; -M¡-A
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A1)
    (korean-ksc5601	#x22 #x2E)	; $(D"B(B
    (japanese-jisx0212	#x22 #x42)	; $(D"B(B
    ))
(define-char
  '((name		. "CENT SIGN")
    (ucs		. #x00A2)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x22)	; ¢
    (hebrew-iso8859-8	#x22)	; ›2]-H¢›0]-A
    (latin-iso8859-9	#x22)	; -M¢-A
    ))
(define-char
  '((name		. "POUND SIGN")
    (ucs		. #x00A3)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x23)	; £
    (latin-iso8859-3	#x23)	; -C£-A
    (greek-iso8859-7	#x23)	; -F£-A
    (hebrew-iso8859-8	#x23)	; ›2]-H£›0]-A
    (latin-iso8859-9	#x23)	; -M£-A
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x24)	; ¤
    (latin-iso8859-2	#x24)	; -B¤-A
    (latin-iso8859-3	#x24)	; -C¤-A
    (latin-iso8859-4	#x24)	; -D¤-A
    (hebrew-iso8859-8	#x24)	; ›2]-H¤›0]-A
    (latin-iso8859-9	#x24)	; -M¤-A
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	#x21 #x68)	; $(D"p(B
    (korean-ksc5601	#x22 #x34)	; $(C"4(B
    (japanese-jisx0212	#x22 #x70)	; $(D"p(B
    ))
(define-char
  '((name		. "YEN SIGN")
    (ucs		. #x00A5)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	#x5C)	; (J\(B
    (latin-iso8859-1	#x25)	; ¥
    (hebrew-iso8859-8	#x25)	; ›2]-H¥›0]-A
    (latin-iso8859-9	#x25)	; -M¥-A
    ))
(define-char
  '((name		. "BROKEN BAR")
    (ucs		. #x00A6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x26)	; ¦
    (greek-iso8859-7	#x26)	; -F¦-A
    (hebrew-iso8859-8	#x26)	; ›2]-H¦›0]-A
    (latin-iso8859-9	#x26)	; -M¦-A
    ))
(define-char
  '((name		. "SECTION SIGN")
    (ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x27)	; §
    (latin-iso8859-2	#x27)	; -B§-A
    (latin-iso8859-3	#x27)	; -C§-A
    (latin-iso8859-4	#x27)	; -D§-A
    (greek-iso8859-7	#x27)	; -F§-A
    (hebrew-iso8859-8	#x27)	; ›2]-H§›0]-A
    (cyrillic-iso8859-5 #x7D)	; -Lý-A
    (latin-iso8859-9	#x27)	; -M§-A
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A7)
    (japanese-jisx0208-1978	#x21 #x78)	; $(B!x(B
    (chinese-gb2312		#x21 #x6C)	; $(A!l(B
    (japanese-jisx0208		#x21 #x78)	; $(B!x(B
    (korean-ksc5601		#x21 #x57)	; $(C!W(B
    (chinese-cns11643-1		#x21 #x70)	; $(G!p(B
    ))
(define-char
  '((name		. "DIAERESIS")
    (ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (latin-iso8859-1	#x28)	; ¨
    (latin-iso8859-2	#x28)	; -B¨-A
    (latin-iso8859-3	#x28)	; -C¨-A
    (latin-iso8859-4	#x28)	; -D¨-A
    (greek-iso8859-7	#x28)	; -F¨-A
    (hebrew-iso8859-8	#x28)	; ›2]-H¨›0]-A
    (latin-iso8859-9	#x28)	; -M¨-A
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A8)
    (japanese-jisx0208-1978	#x21 #x2F)	; $(B!/(B
    (chinese-gb2312		#x21 #x27)	; $(A!'(B
    (japanese-jisx0208		#x21 #x2F)	; $(B!/(B
    (korean-ksc5601		#x21 #x27)	; $(C!'(B
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x29)	; ©
    (greek-iso8859-7	#x29)	; -F©-A
    (hebrew-iso8859-8	#x29)	; ›2]-H©›0]-A
    (latin-iso8859-9	#x29)	; -M©-A
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A9)
    (japanese-jisx0212	#x22 #x6D)	; $(D"m(B
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (latin-iso8859-1	#x2A)	; ª
    (latin-iso8859-9	#x2A)	; -Mª-A
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00AA)
    (korean-ksc5601	#x28 #x23)	; $(D"l(B
    (japanese-jisx0212	#x22 #x6C)	; $(D"l(B
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00AB)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1	#x2B)	; «
    (greek-iso8859-7	#x2B)	; -F«-A
    (hebrew-iso8859-8	#x2B)	; ›2]-H«›0]-A
    (latin-iso8859-9	#x2B)	; -M«-A
    ))
(define-char
  '((name		. "NOT SIGN")
    (ucs		. #x00AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2C)	; ¬
    (greek-iso8859-7	#x2C)	; -F¬-A
    (hebrew-iso8859-8	#x2C)	; ›2]-H¬›0]-A
    (latin-iso8859-9	#x2C)	; -M¬-A
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2D)	; ­
    (latin-iso8859-2	#x2D)	; -B­-A
    (latin-iso8859-3	#x2D)	; -C­-A
    (latin-iso8859-4	#x2D)	; -D­-A
    (greek-iso8859-7	#x2D)	; -F­-A
    (hebrew-iso8859-8	#x2D)	; ›2]-H­›0]-A
    (cyrillic-iso8859-5 #x2D)	; -L­-A
    (latin-iso8859-9	#x2D)	; -M­-A
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AD)
    (korean-ksc5601	#x21 #x29)	; $(C!)(B
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2E)	; ®
    (hebrew-iso8859-8	#x2E)	; ›2]-H®›0]-A
    (latin-iso8859-9	#x2E)	; -M®-A
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AE)
    (japanese-jisx0212	#x22 #x6E)	; $(D"n(B
    ))
(define-char
  '((name		. "MACRON")
    (ucs		. #x00AF)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (latin-iso8859-1	#x2F)	; ¯
    (latin-iso8859-4	#x2F)	; -D¯-A
    (latin-iso8859-9	#x2F)	; -M¯-A
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x30)	; °
    (latin-iso8859-2	#x30)	; -B°-A
    (latin-iso8859-3	#x30)	; -C°-A
    (latin-iso8859-4	#x30)	; -D°-A
    (greek-iso8859-7	#x30)	; -F°-A
    (hebrew-iso8859-8	#x30)	; ›2]-H°›0]-A
    (latin-iso8859-9	#x30)	; -M°-A
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B0)
    (japanese-jisx0208-1978	#x21 #x6B)	; $(B!k(B
    (chinese-gb2312		#x21 #x63)	; $(A!c(B
    (japanese-jisx0208		#x21 #x6B)	; $(B!k(B
    (korean-ksc5601		#x21 #x46)	; $(C!F(B
    (chinese-cns11643-1		#x22 #x78)	; $(G"x(B
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x31)	; ±
    (greek-iso8859-7	#x31)	; -F±-A
    (hebrew-iso8859-8	#x31)	; ›2]-H±›0]-A
    (latin-iso8859-9	#x31)	; -M±-A
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B1)
    (japanese-jisx0208-1978	#x21 #x5E)	; $(B!^(B
    (chinese-gb2312		#x21 #x40)	; $(A!@(B
    (japanese-jisx0208		#x21 #x5E)	; $(B!^(B
    (korean-ksc5601		#x21 #x3E)	; $(C!>(B
    (chinese-cns11643-1		#x22 #x34)	; $(G"4(B
    ))
(define-char
  '((name		. "SUPERSCRIPT TWO")
    (ucs		. #x00B2)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->decomposition	super #x0032)
    (latin-iso8859-1	#x32)	; ²
    (latin-iso8859-3	#x32)	; -C²-A
    (greek-iso8859-7	#x32)	; -F²-A
    (hebrew-iso8859-8	#x32)	; ›2]-H²›0]-A
    (latin-iso8859-9	#x32)	; -M²-A
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT TWO")
    (->ucs		. #x00B2)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->decomposition	wide #x00B2)
    (korean-ksc5601	#x29 #x77)	; $(C)w(B
    ))
(define-char
  '((name		. "SUPERSCRIPT THREE")
    (ucs		. #x00B3)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->decomposition	super #x0033)
    (latin-iso8859-1	#x33)	; ³
    (latin-iso8859-3	#x33)	; -C³-A
    (greek-iso8859-7	#x33)	; -F³-A
    (hebrew-iso8859-8	#x33)	; ›2]-H³›0]-A
    (latin-iso8859-9	#x33)	; -M³-A
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT THREE")
    (->ucs		. #x00B3)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->decomposition	wide #x00B3)
    (korean-ksc5601	#x29 #x78)	; $(C)x(B
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (latin-iso8859-1	#x34)	; ´
    (latin-iso8859-2	#x34)	; -B´-A
    (latin-iso8859-3	#x34)	; -C´-A
    (latin-iso8859-4	#x34)	; -D´-A
    (hebrew-iso8859-8	#x34)	; ›2]-H´›0]-A
    (latin-iso8859-9	#x34)	; -M´-A
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B4)
    (japanese-jisx0208-1978	#x21 #x2D)	; $(B!-(B
    (japanese-jisx0208		#x21 #x2D)	; $(B!-(B
    (korean-ksc5601		#x22 #x25)	; $(C"%(B
    ))
(define-char
  '((name		. "MICRO SIGN")
    (ucs		. #x00B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BC)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (latin-iso8859-1	#x35)	; µ
    (latin-iso8859-3	#x35)	; -Cµ-A
    (hebrew-iso8859-8	#x35)	; ›2]-Hµ›0]-A
    (latin-iso8859-9	#x35)	; -Mµ-A
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x36)	; ¶
    (hebrew-iso8859-8	#x36)	; ›2]-H¶›0]-A
    (latin-iso8859-9	#x36)	; -M¶-A
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B6)
    (japanese-jisx0208	#x22 #x79)	; $(B"y(B
    (korean-ksc5601	#x22 #x52)	; $(C"R(B
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x37)	; ·
    (latin-iso8859-3	#x37)	; -C·-A
    (greek-iso8859-7	#x37)	; -F·-A
    (hebrew-iso8859-8	#x37)	; ›2]-H·›0]-A
    (latin-iso8859-9	#x37)	; -M·-A
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B7)
    (korean-ksc5601	#x21 #x24)	; $(C!$(B
    (chinese-cns11643-1 #x21 #x26)	; $(G!&(B
    ))
(define-char
  '((name		. "CEDILLA")
    (ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (latin-iso8859-1	#x38)	; ¸
    (latin-iso8859-2	#x38)	; -B¸-A
    (latin-iso8859-3	#x38)	; -C¸-A
    (latin-iso8859-4	#x38)	; -D¸-A
    (hebrew-iso8859-8	#x38)	; ›2]-H¸›0]-A
    (latin-iso8859-9	#x38)	; -M¸-A
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B8)
    (korean-ksc5601	#x22 #x2C)	; $(D"1(B
    (japanese-jisx0212	#x22 #x31)	; $(D"1(B
    ))
(define-char
  '((name		. "SUPERSCRIPT ONE")
    (ucs		. #x00B9)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->decomposition	super #x0031)
    (latin-iso8859-1	#x39)	; ¹
    (hebrew-iso8859-8	#x39)	; ›2]-H¹›0]-A
    (latin-iso8859-9	#x39)	; -M¹-A
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT ONE")
    (->ucs		. #x00B9)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->decomposition	wide #x00B9)
    (korean-ksc5601	#x29 #x76)	; $(C)v(B
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (latin-iso8859-1	#x3A)	; º
    (latin-iso8859-9	#x3A)	; -Mº-A
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00BA)
    (korean-ksc5601	#x28 #x2C)	; $(D"k(B
    (japanese-jisx0212	#x22 #x6B)	; $(D"k(B
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00BB)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1	#x3B)	; »
    (greek-iso8859-7	#x3B)	; -F»-A
    (hebrew-iso8859-8	#x3B)	; ›2]-H»›0]-A
    (latin-iso8859-9	#x3B)	; -M»-A
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (latin-iso8859-1	#x3C)	; ¼
    (hebrew-iso8859-8	#x3C)	; ›2]-H¼›0]-A
    (latin-iso8859-9	#x3C)	; -M¼-A
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	wide #x00BC)
    (korean-ksc5601	#x28 #x79)	; $(C(y(B
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (latin-iso8859-1	#x3D)	; ½
    (latin-iso8859-3	#x3D)	; -C½-A
    (greek-iso8859-7	#x3D)	; -F½-A
    (hebrew-iso8859-8	#x3D)	; ›2]-H½›0]-A
    (latin-iso8859-9	#x3D)	; -M½-A
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	wide #x00BD)
    (korean-ksc5601	#x28 #x76)	; $(C(v(B
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (latin-iso8859-1	#x3E)	; ¾
    (hebrew-iso8859-8	#x3E)	; ›2]-H¾›0]-A
    (latin-iso8859-9	#x3E)	; -M¾-A
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BE)
    (numeric-value	. 3/4)
    (korean-ksc5601	#x28 #x7A)	; $(C(z(B
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x3F)	; ¿
    (latin-iso8859-9	#x3F)	; -M¿-A
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BF)
    (korean-ksc5601	#x22 #x2F)	; $(D"D(B
    (japanese-jisx0212	#x22 #x44)	; $(D"D(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->lowercase	#x00E0)
    (latin-iso8859-1	#x40)	; À
    (latin-iso8859-3	#x40)	; -CÀ-A
    (latin-iso8859-9	#x40)	; -MÀ-A
    (latin-viscii-upper #x60)	; À
    (latin-viscii	#xC0)	; À
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")
    (->ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C0)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")))
    (japanese-jisx0212	#x2A #x22)	; $(D*"(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->lowercase	#x00E1)
    (latin-iso8859-1	#x41)	; Á
    (latin-iso8859-2	#x41)	; -BÁ-A
    (latin-iso8859-3	#x41)	; -CÁ-A
    (latin-iso8859-4	#x41)	; -DÁ-A
    (latin-iso8859-9	#x41)	; -MÁ-A
    (latin-viscii-upper #x61)	; Á
    (latin-viscii	#xC1)	; Á
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")
    (->ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C1)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")))
    (japanese-jisx0212	#x2A #x21)	; $(D*!(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->lowercase	#x00E2)
    (latin-iso8859-1	#x42)	; Â
    (latin-iso8859-2	#x42)	; -BÂ-A
    (latin-iso8859-3	#x42)	; -CÂ-A
    (latin-iso8859-4	#x42)	; -DÂ-A
    (latin-iso8859-9	#x42)	; -MÂ-A
    (latin-viscii-upper #x62)	; Â
    (latin-viscii	#xC2)	; Â
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C2)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x24)	; $(D*$(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->lowercase	#x00E3)
    (latin-iso8859-1	#x43)	; Ã
    (latin-iso8859-4	#x43)	; -DÃ-A
    (latin-iso8859-9	#x43)	; -MÃ-A
    (latin-viscii-upper #x63)	; Ã
    (latin-viscii	#xC3)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")
    (->ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C3)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")))
    (japanese-jisx0212	#x2A #x2A)	; $(D**(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->lowercase	#x00E4)
    (latin-iso8859-1	#x44)	; Ä
    (latin-iso8859-2	#x44)	; -BÄ-A
    (latin-iso8859-3	#x44)	; -CÄ-A
    (latin-iso8859-4	#x44)	; -DÄ-A
    (latin-iso8859-9	#x44)	; -MÄ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")
    (->ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C4)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x23)	; $(D*#(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->lowercase	#x00E5)
    (latin-iso8859-1	#x45)	; Å
    (latin-iso8859-4	#x45)	; -DÅ-A
    (latin-iso8859-9	#x45)	; -MÅ-A
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")
    (->ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C5)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	#x2A #x29)	; $(D*)(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase	#x00E6)
    (latin-iso8859-1	#x46)	; Æ
    (latin-iso8859-4	#x46)	; -DÆ-A
    (latin-iso8859-9	#x46)	; -MÆ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	#x28 #x21)	; $(D)!(B
    (japanese-jisx0212	#x29 #x21)	; $(D)!(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->lowercase	#x00E7)
    (latin-iso8859-1	#x47)	; Ç
    (latin-iso8859-2	#x47)	; -BÇ-A
    (latin-iso8859-3	#x47)	; -CÇ-A
    (latin-iso8859-9	#x47)	; -MÇ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")
    (->ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C7)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x2E)	; $(D*.(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->lowercase	#x00E8)
    (latin-iso8859-1	#x48)	; È
    (latin-iso8859-3	#x48)	; -CÈ-A
    (latin-iso8859-9	#x48)	; -MÈ-A
    (latin-viscii-upper #x68)	; È
    (latin-viscii	#xC8)	; È
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")
    (->ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C8)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")))
    (japanese-jisx0212	#x2A #x32)	; $(D*2(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->lowercase	#x00E9)
    (latin-iso8859-1	#x49)	; É
    (latin-iso8859-2	#x49)	; -BÉ-A
    (latin-iso8859-3	#x49)	; -CÉ-A
    (latin-iso8859-4	#x49)	; -DÉ-A
    (latin-iso8859-9	#x49)	; -MÉ-A
    (latin-viscii-upper #x69)	; É
    (latin-viscii	#xC9)	; É
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")
    (->ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C9)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")))
    (japanese-jisx0212	#x2A #x31)	; $(D*1(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->lowercase	#x00EA)
    (latin-iso8859-1	#x4A)	; Ê
    (latin-iso8859-3	#x4A)	; -CÊ-A
    (latin-iso8859-9	#x4A)	; -MÊ-A
    (latin-viscii-upper #x6A)	; Ê
    (latin-viscii	#xCA)	; Ê
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CA)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x34)	; $(D*4(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->lowercase	#x00EB)
    (latin-iso8859-1	#x4B)	; Ë
    (latin-iso8859-2	#x4B)	; -BË-A
    (latin-iso8859-3	#x4B)	; -CË-A
    (latin-iso8859-4	#x4B)	; -DË-A
    (latin-iso8859-9	#x4B)	; -MË-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")
    (->ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CB)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x33)	; $(D*3(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->lowercase	#x00EC)
    (latin-iso8859-1	#x4C)	; Ì
    (latin-iso8859-3	#x4C)	; -CÌ-A
    (latin-iso8859-9	#x4C)	; -MÌ-A
    (latin-viscii-upper #x6C)	; Ì
    (latin-viscii	#xCC)	; Ì
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")
    (->ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CC)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")))
    (japanese-jisx0212	#x2A #x40)	; $(D*@(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->lowercase	#x00ED)
    (latin-iso8859-1	#x4D)	; Í
    (latin-iso8859-2	#x4D)	; -BÍ-A
    (latin-iso8859-3	#x4D)	; -CÍ-A
    (latin-iso8859-4	#x4D)	; -DÍ-A
    (latin-iso8859-9	#x4D)	; -MÍ-A
    (latin-viscii-upper #x6D)	; Í
    (latin-viscii	#xCD)	; Í
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")
    (->ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CD)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")))
    (japanese-jisx0212	#x2A #x3F)	; $(D*?(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->lowercase	#x00EE)
    (latin-iso8859-1	#x4E)	; Î
    (latin-iso8859-2	#x4E)	; -BÎ-A
    (latin-iso8859-3	#x4E)	; -CÎ-A
    (latin-iso8859-4	#x4E)	; -DÎ-A
    (latin-iso8859-9	#x4E)	; -MÎ-A
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CE)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x42)	; $(D*B(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->lowercase	#x00EF)
    (latin-iso8859-1	#x4F)	; Ï
    (latin-iso8859-3	#x4F)	; -CÏ-A
    (latin-iso8859-9	#x4F)	; -MÏ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")
    (->ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CF)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x41)	; $(D*A(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (ucs		. #x00D0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00F0)
    (latin-iso8859-1	#x50)	; Ð
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER ETH")
    (->ucs		. #x00D0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00D0)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER ETH")))
    (korean-ksc5601	#x28 #x22)	; $(C("(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->lowercase	#x00F1)
    (latin-iso8859-1	#x51)	; Ñ
    (latin-iso8859-3	#x51)	; -CÑ-A
    (latin-iso8859-9	#x51)	; -MÑ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")
    (->ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D1)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")))
    (japanese-jisx0212	#x2A #x50)	; $(D*P(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->lowercase	#x00F2)
    (latin-iso8859-1	#x52)	; Ò
    (latin-iso8859-3	#x52)	; -CÒ-A
    (latin-iso8859-9	#x52)	; -MÒ-A
    (latin-viscii-upper #x72)	; Ò
    (latin-viscii	#xD2)	; Ò
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH GRAVE")
    (->ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D2)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (japanese-jisx0212	#x2A #x52)	; $(D*R(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->lowercase	#x00F3)
    (latin-iso8859-1	#x53)	; Ó
    (latin-iso8859-2	#x53)	; -BÓ-A
    (latin-iso8859-3	#x53)	; -CÓ-A
    (latin-iso8859-9	#x53)	; -MÓ-A
    (latin-viscii-upper #x73)	; Ó
    (latin-viscii	#xD3)	; Ó
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")
    (->ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D3)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")))
    (japanese-jisx0212	#x2A #x51)	; $(D*Q(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->lowercase	#x00F4)
    (latin-iso8859-1	#x54)	; Ô
    (latin-iso8859-2	#x54)	; -BÔ-A
    (latin-iso8859-3	#x54)	; -CÔ-A
    (latin-iso8859-4	#x54)	; -DÔ-A
    (latin-iso8859-9	#x54)	; -MÔ-A
    (latin-viscii-upper #x74)	; Ô
    (latin-viscii	#xD4)	; Ô
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D4)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x54)	; $(D*T(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->lowercase	#x00F5)
    (latin-iso8859-1	#x55)	; Õ
    (latin-iso8859-4	#x55)	; -DÕ-A
    (latin-iso8859-9	#x55)	; -MÕ-A
    (latin-viscii-upper #x75)	; Õ
    (latin-viscii	#xA0)	; Õ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")
    (->ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D5)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	#x2A #x58)	; $(D*X(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->lowercase	#x00F6)
    (latin-iso8859-1	#x56)	; Ö
    (latin-iso8859-2	#x56)	; -BÖ-A
    (latin-iso8859-3	#x56)	; -CÖ-A
    (latin-iso8859-4	#x56)	; -DÖ-A
    (latin-iso8859-9	#x56)	; -MÖ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")
    (->ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D6)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x53)	; $(D*S(B
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x57)	; ×
    (latin-iso8859-2	#x57)	; -B×-A
    (latin-iso8859-3	#x57)	; -C×-A
    (latin-iso8859-4	#x57)	; -D×-A
    (hebrew-iso8859-8	#x2A)	; ›2]-Hª›0]-A
    (latin-iso8859-9	#x57)	; -M×-A
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00D7)
    (japanese-jisx0208-1978	#x21 #x5F)	; $(B!_(B
    (chinese-gb2312		#x21 #x41)	; $(A!A(B
    (japanese-jisx0208		#x21 #x5F)	; $(B!_(B
    (korean-ksc5601		#x21 #x3F)	; $(C!?(B
    (chinese-cns11643-1		#x22 #x32)	; $(G"2(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1	#x58)	; Ø
    (latin-iso8859-4	#x58)	; -DØ-A
    (latin-iso8859-9	#x58)	; -MØ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	#x28 #x2A)	; $(D),(B
    (japanese-jisx0212	#x29 #x2C)	; $(D),(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase	#x00F9)
    (latin-iso8859-1	#x59)	; Ù
    (latin-iso8859-3	#x59)	; -CÙ-A
    (latin-iso8859-9	#x59)	; -MÙ-A
    (latin-viscii-upper #x79)	; Ù
    (latin-viscii	#xD9)	; Ù
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")
    (->ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")))
    (japanese-jisx0212	#x2A #x63)	; $(D*c(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->lowercase	#x00FA)
    (latin-iso8859-1	#x5A)	; Ú
    (latin-iso8859-2	#x5A)	; -BÚ-A
    (latin-iso8859-3	#x5A)	; -CÚ-A
    (latin-iso8859-4	#x5A)	; -DÚ-A
    (latin-iso8859-9	#x5A)	; -MÚ-A
    (latin-viscii-upper #x7A)	; Ú
    (latin-viscii	#xDA)	; Ú
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")
    (->ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DA)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")))
    (japanese-jisx0212	#x2A #x62)	; $(D*b(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->lowercase	#x00FB)
    (latin-iso8859-1	#x5B)	; Û
    (latin-iso8859-3	#x5B)	; -CÛ-A
    (latin-iso8859-4	#x5B)	; -DÛ-A
    (latin-iso8859-9	#x5B)	; -MÛ-A
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DB)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x65)	; $(D*e(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->lowercase	#x00FC)
    (latin-iso8859-1	#x5C)	; Ü
    (latin-iso8859-2	#x5C)	; -BÜ-A
    (latin-iso8859-3	#x5C)	; -CÜ-A
    (latin-iso8859-4	#x5C)	; -DÜ-A
    (latin-iso8859-9	#x5C)	; -MÜ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")
    (->ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DC)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x64)	; $(D*d(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->lowercase	#x00FD)
    (latin-iso8859-1	#x5D)	; Ý
    (latin-iso8859-2	#x5D)	; -BÝ-A
    (latin-viscii-upper #x7D)	; Ý
    (latin-viscii	#xDD)	; Ý
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH ACUTE")
    (->ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DD)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	#x2A #x72)	; $(D*r(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (ucs		. #x00DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00FE)
    (latin-iso8859-1	#x5E)	; Þ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER THORN")
    (->ucs		. #x00DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00DE)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER THORN")))
    (korean-ksc5601	#x28 #x2D)	; $(D)0(B
    (japanese-jisx0212	#x29 #x30)	; $(D)0(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1	#x5F)	; ß
    (latin-iso8859-2	#x5F)	; -Bß-A
    (latin-iso8859-3	#x5F)	; -Cß-A
    (latin-iso8859-4	#x5F)	; -Dß-A
    (latin-iso8859-9	#x5F)	; -Mß-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->decomposition	wide #x00DF)
    (korean-ksc5601	#x29 #x2C)	; $(D)N(B
    (japanese-jisx0212	#x29 #x4E)	; $(D)N(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (ucs		. #x00E0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0300)
    (->uppercase	#x00C0)
    (->titlecase	#x00C0)
    (latin-iso8859-1	#x60)	; à
    (latin-iso8859-3	#x60)	; -Cà-A
    (latin-iso8859-9	#x60)	; -Mà-A
    (latin-viscii-lower #x60)	; à
    (latin-viscii	#xE0)	; à
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")
    (->ucs		. #x00E0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E0)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (chinese-gb2312	#x28 #x24)	; $(D+"(B
    (japanese-jisx0212	#x2B #x22)	; $(D+"(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (ucs		. #x00E1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0301)
    (->uppercase	#x00C1)
    (->titlecase	#x00C1)
    (latin-iso8859-1	#x61)	; á
    (latin-iso8859-2	#x61)	; -Bá-A
    (latin-iso8859-3	#x61)	; -Cá-A
    (latin-iso8859-4	#x61)	; -Dá-A
    (latin-iso8859-9	#x61)	; -Má-A
    (latin-viscii-lower #x61)	; á
    (latin-viscii	#xE1)	; á
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")
    (->ucs		. #x00E1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E1)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (chinese-gb2312	#x28 #x22)	; $(D+!(B
    (japanese-jisx0212	#x2B #x21)	; $(D+!(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00E2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0302)
    (->uppercase	#x00C2)
    (->titlecase	#x00C2)
    (latin-iso8859-1	#x62)	; â
    (latin-iso8859-2	#x62)	; -Bâ-A
    (latin-iso8859-3	#x62)	; -Câ-A
    (latin-iso8859-4	#x62)	; -Dâ-A
    (latin-iso8859-9	#x62)	; -Mâ-A
    (latin-viscii-lower #x62)	; â
    (latin-viscii	#xE2)	; â
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00E2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E2)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x24)	; $(D+$(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (ucs		. #x00E3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0303)
    (->uppercase	#x00C3)
    (->titlecase	#x00C3)
    (latin-iso8859-1	#x63)	; ã
    (latin-iso8859-4	#x63)	; -Dã-A
    (latin-iso8859-9	#x63)	; -Mã-A
    (latin-viscii-lower #x63)	; ã
    (latin-viscii	#xE3)	; ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")
    (->ucs		. #x00E3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E3)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (japanese-jisx0212	#x2B #x2A)	; $(D+*(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (ucs		. #x00E4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0308)
    (->uppercase	#x00C4)
    (->titlecase	#x00C4)
    (latin-iso8859-1	#x64)	; ä
    (latin-iso8859-2	#x64)	; -Bä-A
    (latin-iso8859-3	#x64)	; -Cä-A
    (latin-iso8859-4	#x64)	; -Dä-A
    (latin-iso8859-9	#x64)	; -Mä-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")
    (->ucs		. #x00E4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E4)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x23)	; $(D+#(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (ucs		. #x00E5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x030A)
    (->uppercase	#x00C5)
    (->titlecase	#x00C5)
    (latin-iso8859-1	#x65)	; å
    (latin-iso8859-4	#x65)	; -Då-A
    (latin-iso8859-9	#x65)	; -Må-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")
    (->ucs		. #x00E5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E5)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	#x2B #x29)	; $(D+)(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER AE")
    (ucs		. #x00E6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->uppercase	#x00C6)
    (->titlecase	#x00C6)
    (latin-iso8859-1	#x66)	; æ
    (latin-iso8859-4	#x66)	; -Dæ-A
    (latin-iso8859-9	#x66)	; -Mæ-A
    (ipa		#x24)	; -0¤-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER AE")
    (->ucs		. #x00E6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->decomposition	wide #x00E6)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (korean-ksc5601	#x29 #x21)	; $(D)A(B
    (japanese-jisx0212	#x29 #x41)	; $(D)A(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (ucs		. #x00E7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0327)
    (->uppercase	#x00C7)
    (->titlecase	#x00C7)
    (latin-iso8859-1	#x67)	; ç
    (latin-iso8859-2	#x67)	; -Bç-A
    (latin-iso8859-3	#x67)	; -Cç-A
    (latin-iso8859-9	#x67)	; -Mç-A
    (ipa		#x4E)	; -0Î-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")
    (->ucs		. #x00E7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E7)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x2E)	; $(D+.(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (ucs		. #x00E8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0300)
    (->uppercase	#x00C8)
    (->titlecase	#x00C8)
    (latin-iso8859-1	#x68)	; è
    (latin-iso8859-3	#x68)	; -Cè-A
    (latin-iso8859-9	#x68)	; -Mè-A
    (latin-viscii-lower #x68)	; è
    (latin-viscii	#xE8)	; è
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")
    (->ucs		. #x00E8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E8)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (chinese-gb2312	#x28 #x28)	; $(D+2(B
    (japanese-jisx0212	#x2B #x32)	; $(D+2(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (ucs		. #x00E9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0301)
    (->uppercase	#x00C9)
    (->titlecase	#x00C9)
    (latin-iso8859-1	#x69)	; é
    (latin-iso8859-2	#x69)	; -Bé-A
    (latin-iso8859-3	#x69)	; -Cé-A
    (latin-iso8859-4	#x69)	; -Dé-A
    (latin-iso8859-9	#x69)	; -Mé-A
    (latin-viscii-lower #x69)	; é
    (latin-viscii	#xE9)	; é
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")
    (->ucs		. #x00E9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E9)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (chinese-gb2312	#x28 #x26)	; $(D+1(B
    (japanese-jisx0212	#x2B #x31)	; $(D+1(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00EA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0302)
    (->uppercase	#x00CA)
    (->titlecase	#x00CA)
    (latin-iso8859-1	#x6A)	; ê
    (latin-iso8859-3	#x6A)	; -Cê-A
    (latin-iso8859-9	#x6A)	; -Mê-A
    (latin-viscii-lower #x6A)	; ê
    (latin-viscii	#xEA)	; ê
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00EA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EA)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (chinese-gb2312	#x28 #x3A)	; $(D+4(B
    (japanese-jisx0212	#x2B #x34)	; $(D+4(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (ucs		. #x00EB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0308)
    (->uppercase	#x00CB)
    (->titlecase	#x00CB)
    (latin-iso8859-1	#x6B)	; ë
    (latin-iso8859-2	#x6B)	; -Bë-A
    (latin-iso8859-3	#x6B)	; -Cë-A
    (latin-iso8859-4	#x6B)	; -Dë-A
    (latin-iso8859-9	#x6B)	; -Më-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")
    (->ucs		. #x00EB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EB)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x33)	; $(D+3(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (ucs		. #x00EC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0300)
    (->uppercase	#x00CC)
    (->titlecase	#x00CC)
    (latin-iso8859-1	#x6C)	; ì
    (latin-iso8859-3	#x6C)	; -Cì-A
    (latin-iso8859-9	#x6C)	; -Mì-A
    (latin-viscii-lower #x6C)	; ì
    (latin-viscii	#xEC)	; ì
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")
    (->ucs		. #x00EC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EC)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (chinese-gb2312	#x28 #x2C)	; $(D+@(B
    (japanese-jisx0212	#x2B #x40)	; $(D+@(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (ucs		. #x00ED)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0301)
    (->uppercase	#x00CD)
    (->titlecase	#x00CD)
    (latin-iso8859-1	#x6D)	; í
    (latin-iso8859-2	#x6D)	; -Bí-A
    (latin-iso8859-3	#x6D)	; -Cí-A
    (latin-iso8859-4	#x6D)	; -Dí-A
    (latin-iso8859-9	#x6D)	; -Mí-A
    (latin-viscii-lower #x6D)	; í
    (latin-viscii	#xED)	; í
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")
    (->ucs		. #x00ED)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00ED)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (chinese-gb2312	#x28 #x2A)	; $(D+?(B
    (japanese-jisx0212	#x2B #x3F)	; $(D+?(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00EE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0302)
    (->uppercase	#x00CE)
    (->titlecase	#x00CE)
    (latin-iso8859-1	#x6E)	; î
    (latin-iso8859-2	#x6E)	; -Bî-A
    (latin-iso8859-3	#x6E)	; -Cî-A
    (latin-iso8859-4	#x6E)	; -Dî-A
    (latin-iso8859-9	#x6E)	; -Mî-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00EE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EE)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x42)	; $(D+B(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (ucs		. #x00EF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase	#x00CF)
    (->titlecase	#x00CF)
    (latin-iso8859-1	#x6F)	; ï
    (latin-iso8859-3	#x6F)	; -Cï-A
    (latin-iso8859-9	#x6F)	; -Mï-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")
    (->ucs		. #x00EF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x41)	; $(D+A(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ETH")
    (ucs		. #x00F0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase	#x00D0)
    (->titlecase	#x00D0)
    (latin-iso8859-1	#x70)	; ð
    (ipa		#x49)	; -0É-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER ETH")
    (->ucs		. #x00F0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (korean-ksc5601	#x29 #x23)	; $(D)C(B
    (japanese-jisx0212	#x29 #x43)	; $(D)C(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (ucs		. #x00F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0303)
    (->uppercase	#x00D1)
    (->titlecase	#x00D1)
    (latin-iso8859-1	#x71)	; ñ
    (latin-iso8859-3	#x71)	; -Cñ-A
    (latin-iso8859-9	#x71)	; -Mñ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")
    (->ucs		. #x00F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F1)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (japanese-jisx0212	#x2B #x50)	; $(D+P(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (ucs		. #x00F2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0300)
    (->uppercase	#x00D2)
    (->titlecase	#x00D2)
    (latin-iso8859-1	#x72)	; ò
    (latin-iso8859-3	#x72)	; -Cò-A
    (latin-iso8859-9	#x72)	; -Mò-A
    (latin-viscii-lower #x72)	; ò
    (latin-viscii	#xF2)	; ò
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")
    (->ucs		. #x00F2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F2)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (chinese-gb2312	#x28 #x30)	; $(D+R(B
    (japanese-jisx0212	#x2B #x52)	; $(D+R(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (ucs		. #x00F3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0301)
    (->uppercase	#x00D3)
    (->titlecase	#x00D3)
    (latin-iso8859-1	#x73)	; ó
    (latin-iso8859-2	#x73)	; -Bó-A
    (latin-iso8859-3	#x73)	; -Có-A
    (latin-iso8859-9	#x73)	; -Mó-A
    (latin-viscii-lower #x73)	; ó
    (latin-viscii	#xF3)	; ó
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")
    (->ucs		. #x00F3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F3)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (chinese-gb2312	#x28 #x2E)	; $(D+Q(B
    (japanese-jisx0212	#x2B #x51)	; $(D+Q(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00F4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0302)
    (->uppercase	#x00D4)
    (->titlecase	#x00D4)
    (latin-iso8859-1	#x74)	; ô
    (latin-iso8859-2	#x74)	; -Bô-A
    (latin-iso8859-3	#x74)	; -Cô-A
    (latin-iso8859-4	#x74)	; -Dô-A
    (latin-iso8859-9	#x74)	; -Mô-A
    (latin-viscii-lower #x74)	; ô
    (latin-viscii	#xF4)	; ô
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00F4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F4)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x54)	; $(D+T(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (ucs		. #x00F5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0303)
    (->uppercase	#x00D5)
    (->titlecase	#x00D5)
    (latin-iso8859-1	#x75)	; õ
    (latin-iso8859-4	#x75)	; -Dõ-A
    (latin-iso8859-9	#x75)	; -Mõ-A
    (latin-viscii-lower #x75)	; õ
    (latin-viscii	#xF5)	; õ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH TILDE")
    (->ucs		. #x00F5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F5)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	#x2B #x58)	; $(D+X(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (ucs		. #x00F6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0308)
    (->uppercase	#x00D6)
    (->titlecase	#x00D6)
    (latin-iso8859-1	#x76)	; ö
    (latin-iso8859-2	#x76)	; -Bö-A
    (latin-iso8859-3	#x76)	; -Cö-A
    (latin-iso8859-4	#x76)	; -Dö-A
    (latin-iso8859-9	#x76)	; -Mö-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH DIAERESIS")
    (->ucs		. #x00F6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F6)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x53)	; $(D+S(B
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x77)	; ÷
    (latin-iso8859-2	#x77)	; -B÷-A
    (latin-iso8859-3	#x77)	; -C÷-A
    (latin-iso8859-4	#x77)	; -D÷-A
    (hebrew-iso8859-8	#x3A)	; ›2]-Hº›0]-A
    (latin-iso8859-9	#x77)	; -M÷-A
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00F7)
    (japanese-jisx0208-1978	#x21 #x60)	; $(B!`(B
    (chinese-gb2312		#x21 #x42)	; $(A!B(B
    (japanese-jisx0208		#x21 #x60)	; $(B!`(B
    (korean-ksc5601		#x21 #x40)	; $(C!@(B
    (chinese-cns11643-1		#x22 #x33)	; $(G"3(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1	#x78)	; ø
    (latin-iso8859-4	#x78)	; -Dø-A
    (latin-iso8859-9	#x78)	; -Mø-A
    (ipa		#x2F)	; -0¯-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")
    (->ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F8)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (korean-ksc5601	#x29 #x2A)	; $(D)L(B
    (japanese-jisx0212	#x29 #x4C)	; $(D)L(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (ucs		. #x00F9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0300)
    (->uppercase	#x00D9)
    (->titlecase	#x00D9)
    (latin-iso8859-1	#x79)	; ù
    (latin-iso8859-3	#x79)	; -Cù-A
    (latin-iso8859-9	#x79)	; -Mù-A
    (latin-viscii-lower #x79)	; ù
    (latin-viscii	#xF9)	; ù
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")
    (->ucs		. #x00F9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F9)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (chinese-gb2312	#x28 #x34)	; $(D+c(B
    (japanese-jisx0212	#x2B #x63)	; $(D+c(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (ucs		. #x00FA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0301)
    (->uppercase	#x00DA)
    (->titlecase	#x00DA)
    (latin-iso8859-1	#x7A)	; ú
    (latin-iso8859-2	#x7A)	; -Bú-A
    (latin-iso8859-3	#x7A)	; -Cú-A
    (latin-iso8859-4	#x7A)	; -Dú-A
    (latin-iso8859-9	#x7A)	; -Mú-A
    (latin-viscii-lower #x7A)	; ú
    (latin-viscii	#xFA)	; ú
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")
    (->ucs		. #x00FA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FA)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (chinese-gb2312	#x28 #x32)	; $(D+b(B
    (japanese-jisx0212	#x2B #x62)	; $(D+b(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00FB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0302)
    (->uppercase	#x00DB)
    (->titlecase	#x00DB)
    (latin-iso8859-1	#x7B)	; û
    (latin-iso8859-3	#x7B)	; -Cû-A
    (latin-iso8859-4	#x7B)	; -Dû-A
    (latin-iso8859-9	#x7B)	; -Mû-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00FB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FB)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x65)	; $(D+e(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (ucs		. #x00FC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0308)
    (->uppercase	#x00DC)
    (->titlecase	#x00DC)
    (latin-iso8859-1	#x7C)	; ü
    (latin-iso8859-2	#x7C)	; -Bü-A
    (latin-iso8859-3	#x7C)	; -Cü-A
    (latin-iso8859-4	#x7C)	; -Dü-A
    (latin-iso8859-9	#x7C)	; -Mü-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")
    (->ucs		. #x00FC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FC)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (chinese-gb2312	#x28 #x39)	; $(D+d(B
    (japanese-jisx0212	#x2B #x64)	; $(D+d(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (ucs		. #x00FD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0301)
    (->uppercase	#x00DD)
    (->titlecase	#x00DD)
    (latin-iso8859-1	#x7D)	; ý
    (latin-iso8859-2	#x7D)	; -Bý-A
    (latin-viscii-lower #x7D)	; ý
    (latin-viscii	#xFD)	; ý
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")
    (->ucs		. #x00FD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FD)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	#x2B #x72)	; $(D+r(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER THORN")
    (ucs		. #x00FE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase	#x00DE)
    (->titlecase	#x00DE)
    (latin-iso8859-1	#x7E)	; þ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER THORN")
    (->ucs		. #x00FE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00FE)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (korean-ksc5601	#x29 #x2D)	; $(D)P(B
    (japanese-jisx0212	#x29 #x50)	; $(D)P(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (ucs		. #x00FF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0308)
    (->uppercase	#x0178)
    (->titlecase	#x0178)
    (latin-iso8859-1	#x7F)	; ÿ
    (latin-iso8859-9	#x7F)	; -Mÿ-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH DIAERESIS")
    (->ucs		. #x00FF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FF)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x73)	; $(D+s(B
    ))
