(define-char
  '((name		. "NO-BREAK SPACE")
    (ucs		. #x00A0)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (->decomposition	noBreak #x0020)
    (mirrored		. nil)
    (latin-iso8859-1	#x20)	;  
    (latin-iso8859-2	#x20)	;  
    (latin-iso8859-3	#x20)	;  
    (latin-iso8859-4	#x20)	;  
    (greek-iso8859-7	#x20)	;  
    (cyrillic-iso8859-5	#x20)	;  
    (latin-iso8859-9	#x20)	;  
    (hebrew-iso8859-8	#x20)	;  
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x21)	; ¡
    (latin-iso8859-9	#x21)	; ¡
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A1)
    (mirrored		. nil)
    (korean-ksc5601	#x22 #x2E)	; ¡
    (japanese-jisx0212	#x22 #x42)	; ¡
    ))
(define-char
  '((name		. "CENT SIGN")
    (ucs		. #x00A2)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x22)	; ¢
    (latin-iso8859-9	#x22)	; ¢
    (hebrew-iso8859-8	#x22)	; ¢
    ))
(define-char
  '((name		. "POUND SIGN")
    (ucs		. #x00A3)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x23)	; £
    (latin-iso8859-3	#x23)	; £
    (greek-iso8859-7	#x23)	; £
    (latin-iso8859-9	#x23)	; £
    (hebrew-iso8859-8	#x23)	; £
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x24)	; ¤
    (latin-iso8859-2	#x24)	; ¤
    (latin-iso8859-3	#x24)	; ¤
    (latin-iso8859-4	#x24)	; ¤
    (latin-iso8859-9	#x24)	; ¤
    (hebrew-iso8859-8	#x24)	; ¤
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	#x21 #x68)	; ¤
    (korean-ksc5601	#x22 #x34)	; ¤
    (japanese-jisx0212	#x22 #x70)	; ¤
    ))
(define-char
  '((name		. "YEN SIGN")
    (ucs		. #x00A5)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	#x5C)	; ¥
    (latin-iso8859-1	#x25)	; ¥
    (latin-iso8859-9	#x25)	; ¥
    (hebrew-iso8859-8	#x25)	; ¥
    ))
(define-char
  '((name		. "BROKEN BAR")
    (ucs		. #x00A6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x26)	; ¦
    (greek-iso8859-7	#x26)	; ¦
    (latin-iso8859-9	#x26)	; ¦
    (hebrew-iso8859-8	#x26)	; ¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x27)	; §
    (latin-iso8859-2	#x27)	; §
    (latin-iso8859-3	#x27)	; §
    (latin-iso8859-4	#x27)	; §
    (greek-iso8859-7	#x27)	; §
    (cyrillic-iso8859-5	#x7D)	; §
    (latin-iso8859-9	#x27)	; §
    (hebrew-iso8859-8	#x27)	; §
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A7)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x78)	; §
    (chinese-gb2312		#x21 #x6C)	; §
    (japanese-jisx0208		#x21 #x78)	; §
    (korean-ksc5601		#x21 #x57)	; §
    (chinese-cns11643-1		#x21 #x70)	; §
    ))
(define-char
  '((name		. "DIAERESIS")
    (ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0308)
    (mirrored		. nil)
    (latin-iso8859-1	#x28)	; ¨
    (latin-iso8859-2	#x28)	; ¨
    (latin-iso8859-3	#x28)	; ¨
    (latin-iso8859-4	#x28)	; ¨
    (greek-iso8859-7	#x28)	; ¨
    (latin-iso8859-9	#x28)	; ¨
    (hebrew-iso8859-8	#x28)	; ¨
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A8)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x2F)	; ¨
    (chinese-gb2312		#x21 #x27)	; ¨
    (japanese-jisx0208		#x21 #x2F)	; ¨
    (korean-ksc5601		#x21 #x27)	; ¨
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x29)	; ©
    (greek-iso8859-7	#x29)	; ©
    (latin-iso8859-9	#x29)	; ©
    (hebrew-iso8859-8	#x29)	; ©
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A9)
    (mirrored		. nil)
    (japanese-jisx0212	#x22 #x6D)	; ©
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	super #x0061)
    (mirrored		. nil)
    (latin-iso8859-1	#x2A)	; ª
    (latin-iso8859-9	#x2A)	; ª
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00AA)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x23)	; ª
    (japanese-jisx0212	#x22 #x6C)	; ª
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00AB)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1	#x2B)	; «
    (greek-iso8859-7	#x2B)	; «
    (latin-iso8859-9	#x2B)	; «
    (hebrew-iso8859-8	#x2B)	; «
    ))
(define-char
  '((name		. "NOT SIGN")
    (ucs		. #x00AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2C)	; ¬
    (greek-iso8859-7	#x2C)	; ¬
    (latin-iso8859-9	#x2C)	; ¬
    (hebrew-iso8859-8	#x2C)	; ¬
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2D)	; ­
    (latin-iso8859-2	#x2D)	; ­
    (latin-iso8859-3	#x2D)	; ­
    (latin-iso8859-4	#x2D)	; ­
    (greek-iso8859-7	#x2D)	; ­
    (cyrillic-iso8859-5	#x2D)	; ­
    (latin-iso8859-9	#x2D)	; ­
    (hebrew-iso8859-8	#x2D)	; ­
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00AD)
    (mirrored		. nil)
    (korean-ksc5601	#x21 #x29)	; ­
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2E)	; ®
    (latin-iso8859-9	#x2E)	; ®
    (hebrew-iso8859-8	#x2E)	; ®
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00AE)
    (mirrored		. nil)
    (japanese-jisx0212	#x22 #x6E)	; ®
    ))
(define-char
  '((name		. "MACRON")
    (ucs		. #x00AF)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0304)
    (mirrored		. nil)
    (latin-iso8859-1	#x2F)	; ¯
    (latin-iso8859-4	#x2F)	; ¯
    (latin-iso8859-9	#x2F)	; ¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x30)	; °
    (latin-iso8859-2	#x30)	; °
    (latin-iso8859-3	#x30)	; °
    (latin-iso8859-4	#x30)	; °
    (greek-iso8859-7	#x30)	; °
    (latin-iso8859-9	#x30)	; °
    (hebrew-iso8859-8	#x30)	; °
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (->decomposition	wide #x00B0)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x6B)	; °
    (chinese-gb2312		#x21 #x63)	; °
    (japanese-jisx0208		#x21 #x6B)	; °
    (korean-ksc5601		#x21 #x46)	; °
    (chinese-cns11643-1		#x22 #x78)	; °
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x31)	; ±
    (greek-iso8859-7	#x31)	; ±
    (latin-iso8859-9	#x31)	; ±
    (hebrew-iso8859-8	#x31)	; ±
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (->decomposition	wide #x00B1)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x5E)	; ±
    (chinese-gb2312		#x21 #x40)	; ±
    (japanese-jisx0208		#x21 #x5E)	; ±
    (korean-ksc5601		#x21 #x3E)	; ±
    (chinese-cns11643-1		#x22 #x34)	; ±
    ))
(define-char
  '((name		. "SUPERSCRIPT TWO")
    (ucs		. #x00B2)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (->decomposition	super #x0032)
    (decimal-digit-value . 2)
    (digit-value	. 2)
    (numeric-value	. 2)
    (mirrored		. nil)
    (latin-iso8859-1	#x32)	; ²
    (latin-iso8859-3	#x32)	; ²
    (greek-iso8859-7	#x32)	; ²
    (latin-iso8859-9	#x32)	; ²
    (hebrew-iso8859-8	#x32)	; ²
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT TWO")
    (->ucs		. #x00B2)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (->decomposition	wide #x00B2)
    (decimal-digit-value . 2)
    (digit-value	. 2)
    (numeric-value	. 2)
    (mirrored		. nil)
    (korean-ksc5601	#x29 #x77)	; ²
    ))
(define-char
  '((name		. "SUPERSCRIPT THREE")
    (ucs		. #x00B3)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (->decomposition	super #x0033)
    (decimal-digit-value . 3)
    (digit-value	. 3)
    (numeric-value	. 3)
    (mirrored		. nil)
    (latin-iso8859-1	#x33)	; ³
    (latin-iso8859-3	#x33)	; ³
    (greek-iso8859-7	#x33)	; ³
    (latin-iso8859-9	#x33)	; ³
    (hebrew-iso8859-8	#x33)	; ³
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT THREE")
    (->ucs		. #x00B3)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (->decomposition	wide #x00B3)
    (decimal-digit-value . 3)
    (digit-value	. 3)
    (numeric-value	. 3)
    (mirrored		. nil)
    (korean-ksc5601	#x29 #x78)	; ³
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0301)
    (mirrored		. nil)
    (latin-iso8859-1	#x34)	; ´
    (latin-iso8859-2	#x34)	; ´
    (latin-iso8859-3	#x34)	; ´
    (latin-iso8859-4	#x34)	; ´
    (latin-iso8859-9	#x34)	; ´
    (hebrew-iso8859-8	#x34)	; ´
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B4)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x2D)	; ´
    (japanese-jisx0208		#x21 #x2D)	; ´
    (korean-ksc5601		#x22 #x25)	; ´
    ))
(define-char
  '((name		. "MICRO SIGN")
    (ucs		. #x00B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03BC)
    (mirrored		. nil)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (latin-iso8859-1	#x35)	; µ
    (latin-iso8859-3	#x35)	; µ
    (latin-iso8859-9	#x35)	; µ
    (hebrew-iso8859-8	#x35)	; µ
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x36)	; ¶
    (latin-iso8859-9	#x36)	; ¶
    (hebrew-iso8859-8	#x36)	; ¶
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B6)
    (mirrored		. nil)
    (japanese-jisx0208	#x22 #x79)	; ¶
    (korean-ksc5601	#x22 #x52)	; ¶
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x37)	; ·
    (latin-iso8859-3	#x37)	; ·
    (greek-iso8859-7	#x37)	; ·
    (latin-iso8859-9	#x37)	; ·
    (hebrew-iso8859-8	#x37)	; ·
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B7)
    (mirrored		. nil)
    (korean-ksc5601	#x21 #x24)	; ·
    (chinese-cns11643-1	#x21 #x26)	; ·
    ))
(define-char
  '((name		. "CEDILLA")
    (ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0327)
    (mirrored		. nil)
    (latin-iso8859-1	#x38)	; ¸
    (latin-iso8859-2	#x38)	; ¸
    (latin-iso8859-3	#x38)	; ¸
    (latin-iso8859-4	#x38)	; ¸
    (latin-iso8859-9	#x38)	; ¸
    (hebrew-iso8859-8	#x38)	; ¸
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B8)
    (mirrored		. nil)
    (korean-ksc5601	#x22 #x2C)	; ¸
    (japanese-jisx0212	#x22 #x31)	; ¸
    ))
(define-char
  '((name		. "SUPERSCRIPT ONE")
    (ucs		. #x00B9)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (->decomposition	super #x0031)
    (decimal-digit-value . 1)
    (digit-value	. 1)
    (numeric-value	. 1)
    (mirrored		. nil)
    (latin-iso8859-1	#x39)	; ¹
    (latin-iso8859-9	#x39)	; ¹
    (hebrew-iso8859-8	#x39)	; ¹
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT ONE")
    (->ucs		. #x00B9)
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (->decomposition	wide #x00B9)
    (decimal-digit-value . 1)
    (digit-value	. 1)
    (numeric-value	. 1)
    (mirrored		. nil)
    (korean-ksc5601	#x29 #x76)	; ¹
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	super #x006F)
    (mirrored		. nil)
    (latin-iso8859-1	#x3A)	; º
    (latin-iso8859-9	#x3A)	; º
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00BA)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x2C)	; º
    (japanese-jisx0212	#x22 #x6B)	; º
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00BB)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1	#x3B)	; »
    (greek-iso8859-7	#x3B)	; »
    (latin-iso8859-9	#x3B)	; »
    (hebrew-iso8859-8	#x3B)	; »
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (numeric-value	. 1/4)
    (mirrored		. nil)
    (latin-iso8859-1	#x3C)	; ¼
    (latin-iso8859-9	#x3C)	; ¼
    (hebrew-iso8859-8	#x3C)	; ¼
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BC)
    (numeric-value	. 1/4)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x79)	; ¼
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (numeric-value	. 1/2)
    (mirrored		. nil)
    (latin-iso8859-1	#x3D)	; ½
    (latin-iso8859-3	#x3D)	; ½
    (greek-iso8859-7	#x3D)	; ½
    (latin-iso8859-9	#x3D)	; ½
    (hebrew-iso8859-8	#x3D)	; ½
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BD)
    (numeric-value	. 1/2)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x76)	; ½
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (numeric-value	. 3/4)
    (mirrored		. nil)
    (latin-iso8859-1	#x3E)	; ¾
    (latin-iso8859-9	#x3E)	; ¾
    (hebrew-iso8859-8	#x3E)	; ¾
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BE)
    (numeric-value	. 3/4)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x7A)	; ¾
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x3F)	; ¿
    (latin-iso8859-9	#x3F)	; ¿
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BF)
    (mirrored		. nil)
    (korean-ksc5601	#x22 #x2F)	; ¿
    (japanese-jisx0212	#x22 #x44)	; ¿
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00E0)
    (latin-iso8859-1	#x40)	; À
    (latin-iso8859-3	#x40)	; À
    (latin-iso8859-9	#x40)	; À
    (latin-viscii-upper	#x60)	; À
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")
    (->ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C0)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")))
    (japanese-jisx0212	#x2A #x22)	; À
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00E1)
    (latin-iso8859-1	#x41)	; Á
    (latin-iso8859-2	#x41)	; Á
    (latin-iso8859-3	#x41)	; Á
    (latin-iso8859-4	#x41)	; Á
    (latin-iso8859-9	#x41)	; Á
    (latin-viscii-upper	#x61)	; Á
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")
    (->ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C1)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")))
    (japanese-jisx0212	#x2A #x21)	; Á
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00E2)
    (latin-iso8859-1	#x42)	; Â
    (latin-iso8859-2	#x42)	; Â
    (latin-iso8859-3	#x42)	; Â
    (latin-iso8859-4	#x42)	; Â
    (latin-iso8859-9	#x42)	; Â
    (latin-viscii-upper	#x62)	; Â
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C2)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x24)	; Â
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0303)
    (mirrored		. nil)
    (->lowercase	#x00E3)
    (latin-iso8859-1	#x43)	; Ã
    (latin-iso8859-4	#x43)	; Ã
    (latin-iso8859-9	#x43)	; Ã
    (latin-viscii-upper	#x63)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")
    (->ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C3)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")))
    (japanese-jisx0212	#x2A #x2A)	; Ã
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00E4)
    (latin-iso8859-1	#x44)	; Ä
    (latin-iso8859-2	#x44)	; Ä
    (latin-iso8859-3	#x44)	; Ä
    (latin-iso8859-4	#x44)	; Ä
    (latin-iso8859-9	#x44)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")
    (->ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C4)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x23)	; Ä
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x030A)
    (mirrored		. nil)
    (->lowercase	#x00E5)
    (latin-iso8859-1	#x45)	; Å
    (latin-iso8859-4	#x45)	; Å
    (latin-iso8859-9	#x45)	; Å
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")
    (->ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C5)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	#x2A #x29)	; Å
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
    (latin-iso8859-4	#x46)	; Æ
    (latin-iso8859-9	#x46)	; Æ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	#x28 #x21)	; Æ
    (japanese-jisx0212	#x29 #x21)	; Æ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0043 #x0327)
    (mirrored		. nil)
    (->lowercase	#x00E7)
    (latin-iso8859-1	#x47)	; Ç
    (latin-iso8859-2	#x47)	; Ç
    (latin-iso8859-3	#x47)	; Ç
    (latin-iso8859-9	#x47)	; Ç
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")
    (->ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C7)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x2E)	; Ç
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00E8)
    (latin-iso8859-1	#x48)	; È
    (latin-iso8859-3	#x48)	; È
    (latin-iso8859-9	#x48)	; È
    (latin-viscii-upper	#x68)	; È
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")
    (->ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C8)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")))
    (japanese-jisx0212	#x2A #x32)	; È
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00E9)
    (latin-iso8859-1	#x49)	; É
    (latin-iso8859-2	#x49)	; É
    (latin-iso8859-3	#x49)	; É
    (latin-iso8859-4	#x49)	; É
    (latin-iso8859-9	#x49)	; É
    (latin-viscii-upper	#x69)	; É
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")
    (->ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00C9)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")))
    (japanese-jisx0212	#x2A #x31)	; É
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00EA)
    (latin-iso8859-1	#x4A)	; Ê
    (latin-iso8859-3	#x4A)	; Ê
    (latin-iso8859-9	#x4A)	; Ê
    (latin-viscii-upper	#x6A)	; Ê
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00CA)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x34)	; Ê
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00EB)
    (latin-iso8859-1	#x4B)	; Ë
    (latin-iso8859-2	#x4B)	; Ë
    (latin-iso8859-3	#x4B)	; Ë
    (latin-iso8859-4	#x4B)	; Ë
    (latin-iso8859-9	#x4B)	; Ë
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")
    (->ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00CB)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x33)	; Ë
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00EC)
    (latin-iso8859-1	#x4C)	; Ì
    (latin-iso8859-3	#x4C)	; Ì
    (latin-iso8859-9	#x4C)	; Ì
    (latin-viscii-upper	#x6C)	; Ì
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")
    (->ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00CC)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")))
    (japanese-jisx0212	#x2A #x40)	; Ì
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00ED)
    (latin-iso8859-1	#x4D)	; Í
    (latin-iso8859-2	#x4D)	; Í
    (latin-iso8859-3	#x4D)	; Í
    (latin-iso8859-4	#x4D)	; Í
    (latin-iso8859-9	#x4D)	; Í
    (latin-viscii-upper	#x6D)	; Í
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")
    (->ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00CD)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")))
    (japanese-jisx0212	#x2A #x3F)	; Í
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00EE)
    (latin-iso8859-1	#x4E)	; Î
    (latin-iso8859-2	#x4E)	; Î
    (latin-iso8859-3	#x4E)	; Î
    (latin-iso8859-4	#x4E)	; Î
    (latin-iso8859-9	#x4E)	; Î
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00CE)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x42)	; Î
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00EF)
    (latin-iso8859-1	#x4F)	; Ï
    (latin-iso8859-3	#x4F)	; Ï
    (latin-iso8859-9	#x4F)	; Ï
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")
    (->ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00CF)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x41)	; Ï
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
     ((name		. "FULLWIDTH LATIN SMALL LETTER ETH")))
    (korean-ksc5601	#x28 #x22)	; Ð
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004E #x0303)
    (mirrored		. nil)
    (->lowercase	#x00F1)
    (latin-iso8859-1	#x51)	; Ñ
    (latin-iso8859-3	#x51)	; Ñ
    (latin-iso8859-9	#x51)	; Ñ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")
    (->ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00D1)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")))
    (japanese-jisx0212	#x2A #x50)	; Ñ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0300)
    (mirrored		. nil)
    (->lowercase	#x00F2)
    (latin-iso8859-1	#x52)	; Ò
    (latin-iso8859-3	#x52)	; Ò
    (latin-iso8859-9	#x52)	; Ò
    (latin-viscii-upper	#x72)	; Ò
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH GRAVE")
    (->ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00D2)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (japanese-jisx0212	#x2A #x52)	; Ò
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0301)
    (mirrored		. nil)
    (->lowercase	#x00F3)
    (latin-iso8859-1	#x53)	; Ó
    (latin-iso8859-2	#x53)	; Ó
    (latin-iso8859-3	#x53)	; Ó
    (latin-iso8859-9	#x53)	; Ó
    (latin-viscii-upper	#x73)	; Ó
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")
    (->ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00D3)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")))
    (japanese-jisx0212	#x2A #x51)	; Ó
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0302)
    (mirrored		. nil)
    (->lowercase	#x00F4)
    (latin-iso8859-1	#x54)	; Ô
    (latin-iso8859-2	#x54)	; Ô
    (latin-iso8859-3	#x54)	; Ô
    (latin-iso8859-4	#x54)	; Ô
    (latin-iso8859-9	#x54)	; Ô
    (latin-viscii-upper	#x74)	; Ô
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00D4)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x54)	; Ô
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0303)
    (mirrored		. nil)
    (->lowercase	#x00F5)
    (latin-iso8859-1	#x55)	; Õ
    (latin-iso8859-4	#x55)	; Õ
    (latin-iso8859-9	#x55)	; Õ
    (latin-viscii-upper	#x75)	; Õ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")
    (->ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00D5)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	#x2A #x58)	; Õ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0308)
    (mirrored		. nil)
    (->lowercase	#x00F6)
    (latin-iso8859-1	#x56)	; Ö
    (latin-iso8859-2	#x56)	; Ö
    (latin-iso8859-3	#x56)	; Ö
    (latin-iso8859-4	#x56)	; Ö
    (latin-iso8859-9	#x56)	; Ö
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")
    (->ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00D6)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x53)	; Ö
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x57)	; ×
    (latin-iso8859-2	#x57)	; ×
    (latin-iso8859-3	#x57)	; ×
    (latin-iso8859-4	#x57)	; ×
    (latin-iso8859-9	#x57)	; ×
    (hebrew-iso8859-8	#x2A)	; ×
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00D7)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x5F)	; ×
    (chinese-gb2312		#x21 #x41)	; ×
    (japanese-jisx0208		#x21 #x5F)	; ×
    (korean-ksc5601		#x21 #x3F)	; ×
    (chinese-cns11643-1		#x22 #x32)	; ×
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1	#x58)	; Ø
    (latin-iso8859-4	#x58)	; Ø
    (latin-iso8859-9	#x58)	; Ø
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	#x28 #x2A)	; Ø
    (japanese-jisx0212	#x29 #x2C)	; Ø
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00F9)
    (latin-iso8859-1	#x59)	; Ù
    (latin-iso8859-3	#x59)	; Ù
    (latin-iso8859-9	#x59)	; Ù
    (latin-viscii-upper	#x79)	; Ù
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")
    (->ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0300)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")))
    (japanese-jisx0212	#x2A #x63)	; Ù
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00FA)
    (latin-iso8859-1	#x5A)	; Ú
    (latin-iso8859-2	#x5A)	; Ú
    (latin-iso8859-3	#x5A)	; Ú
    (latin-iso8859-4	#x5A)	; Ú
    (latin-iso8859-9	#x5A)	; Ú
    (latin-viscii-upper	#x7A)	; Ú
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")
    (->ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00DA)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")))
    (japanese-jisx0212	#x2A #x62)	; Ú
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00FB)
    (latin-iso8859-1	#x5B)	; Û
    (latin-iso8859-3	#x5B)	; Û
    (latin-iso8859-4	#x5B)	; Û
    (latin-iso8859-9	#x5B)	; Û
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00DB)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x65)	; Û
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00FC)
    (latin-iso8859-1	#x5C)	; Ü
    (latin-iso8859-2	#x5C)	; Ü
    (latin-iso8859-3	#x5C)	; Ü
    (latin-iso8859-4	#x5C)	; Ü
    (latin-iso8859-9	#x5C)	; Ü
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")
    (->ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00DC)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x64)	; Ü
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0059 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00FD)
    (latin-iso8859-1	#x5D)	; Ý
    (latin-iso8859-2	#x5D)	; Ý
    (latin-viscii-upper	#x7D)	; Ý
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH ACUTE")
    (->ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00DD)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	#x2A #x72)	; Ý
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
    (->decomposition	wide #x00DE)
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER THORN")))
    (korean-ksc5601	#x28 #x2D)	; Þ
    (japanese-jisx0212	#x29 #x30)	; Þ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1	#x5F)	; ß
    (latin-iso8859-2	#x5F)	; ß
    (latin-iso8859-3	#x5F)	; ß
    (latin-iso8859-4	#x5F)	; ß
    (latin-iso8859-9	#x5F)	; ß
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00DF)
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (korean-ksc5601	#x29 #x2C)	; ß
    (japanese-jisx0212	#x29 #x4E)	; ß
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (ucs		. #x00E0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0061 #x0300)
    (mirrored		. nil)
    (->uppercase	#x00C0)
    (->titlecase	#x00C0)
    (latin-iso8859-1	#x60)	; à
    (latin-iso8859-3	#x60)	; à
    (latin-iso8859-9	#x60)	; à
    (latin-viscii-lower	#x60)	; à
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")
    (->ucs		. #x00E0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E0)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (chinese-gb2312	#x28 #x24)	; à
    (japanese-jisx0212	#x2B #x22)	; à
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (ucs		. #x00E1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0061 #x0301)
    (mirrored		. nil)
    (->uppercase	#x00C1)
    (->titlecase	#x00C1)
    (latin-iso8859-1	#x61)	; á
    (latin-iso8859-2	#x61)	; á
    (latin-iso8859-3	#x61)	; á
    (latin-iso8859-4	#x61)	; á
    (latin-iso8859-9	#x61)	; á
    (latin-viscii-lower	#x61)	; á
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")
    (->ucs		. #x00E1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E1)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (chinese-gb2312	#x28 #x22)	; á
    (japanese-jisx0212	#x2B #x21)	; á
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00E2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0061 #x0302)
    (mirrored		. nil)
    (->uppercase	#x00C2)
    (->titlecase	#x00C2)
    (latin-iso8859-1	#x62)	; â
    (latin-iso8859-2	#x62)	; â
    (latin-iso8859-3	#x62)	; â
    (latin-iso8859-4	#x62)	; â
    (latin-iso8859-9	#x62)	; â
    (latin-viscii-lower	#x62)	; â
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00E2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E2)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x24)	; â
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (ucs		. #x00E3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0061 #x0303)
    (mirrored		. nil)
    (->uppercase	#x00C3)
    (->titlecase	#x00C3)
    (latin-iso8859-1	#x63)	; ã
    (latin-iso8859-4	#x63)	; ã
    (latin-iso8859-9	#x63)	; ã
    (latin-viscii-lower	#x63)	; ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")
    (->ucs		. #x00E3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E3)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (japanese-jisx0212	#x2B #x2A)	; ã
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (ucs		. #x00E4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0061 #x0308)
    (mirrored		. nil)
    (->uppercase	#x00C4)
    (->titlecase	#x00C4)
    (latin-iso8859-1	#x64)	; ä
    (latin-iso8859-2	#x64)	; ä
    (latin-iso8859-3	#x64)	; ä
    (latin-iso8859-4	#x64)	; ä
    (latin-iso8859-9	#x64)	; ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")
    (->ucs		. #x00E4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E4)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x23)	; ä
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (ucs		. #x00E5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0061 #x030A)
    (mirrored		. nil)
    (->uppercase	#x00C5)
    (->titlecase	#x00C5)
    (latin-iso8859-1	#x65)	; å
    (latin-iso8859-4	#x65)	; å
    (latin-iso8859-9	#x65)	; å
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")
    (->ucs		. #x00E5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E5)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	#x2B #x29)	; å
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
    (latin-iso8859-4	#x66)	; æ
    (latin-iso8859-9	#x66)	; æ
    (ipa		#x24)	; æ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER AE")
    (->ucs		. #x00E6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E6)
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (korean-ksc5601	#x29 #x21)	; æ
    (japanese-jisx0212	#x29 #x41)	; æ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (ucs		. #x00E7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0063 #x0327)
    (mirrored		. nil)
    (->uppercase	#x00C7)
    (->titlecase	#x00C7)
    (latin-iso8859-1	#x67)	; ç
    (latin-iso8859-2	#x67)	; ç
    (latin-iso8859-3	#x67)	; ç
    (latin-iso8859-9	#x67)	; ç
    (ipa		#x4E)	; ç
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")
    (->ucs		. #x00E7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E7)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x2E)	; ç
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (ucs		. #x00E8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0065 #x0300)
    (mirrored		. nil)
    (->uppercase	#x00C8)
    (->titlecase	#x00C8)
    (latin-iso8859-1	#x68)	; è
    (latin-iso8859-3	#x68)	; è
    (latin-iso8859-9	#x68)	; è
    (latin-viscii-lower	#x68)	; è
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")
    (->ucs		. #x00E8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E8)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (chinese-gb2312	#x28 #x28)	; è
    (japanese-jisx0212	#x2B #x32)	; è
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (ucs		. #x00E9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0065 #x0301)
    (mirrored		. nil)
    (->uppercase	#x00C9)
    (->titlecase	#x00C9)
    (latin-iso8859-1	#x69)	; é
    (latin-iso8859-2	#x69)	; é
    (latin-iso8859-3	#x69)	; é
    (latin-iso8859-4	#x69)	; é
    (latin-iso8859-9	#x69)	; é
    (latin-viscii-lower	#x69)	; é
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")
    (->ucs		. #x00E9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00E9)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (chinese-gb2312	#x28 #x26)	; é
    (japanese-jisx0212	#x2B #x31)	; é
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00EA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0065 #x0302)
    (mirrored		. nil)
    (->uppercase	#x00CA)
    (->titlecase	#x00CA)
    (latin-iso8859-1	#x6A)	; ê
    (latin-iso8859-3	#x6A)	; ê
    (latin-iso8859-9	#x6A)	; ê
    (latin-viscii-lower	#x6A)	; ê
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00EA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00EA)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (chinese-gb2312	#x28 #x3A)	; ê
    (japanese-jisx0212	#x2B #x34)	; ê
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (ucs		. #x00EB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0065 #x0308)
    (mirrored		. nil)
    (->uppercase	#x00CB)
    (->titlecase	#x00CB)
    (latin-iso8859-1	#x6B)	; ë
    (latin-iso8859-2	#x6B)	; ë
    (latin-iso8859-3	#x6B)	; ë
    (latin-iso8859-4	#x6B)	; ë
    (latin-iso8859-9	#x6B)	; ë
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")
    (->ucs		. #x00EB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00EB)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x33)	; ë
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (ucs		. #x00EC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0069 #x0300)
    (mirrored		. nil)
    (->uppercase	#x00CC)
    (->titlecase	#x00CC)
    (latin-iso8859-1	#x6C)	; ì
    (latin-iso8859-3	#x6C)	; ì
    (latin-iso8859-9	#x6C)	; ì
    (latin-viscii-lower	#x6C)	; ì
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")
    (->ucs		. #x00EC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00EC)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (chinese-gb2312	#x28 #x2C)	; ì
    (japanese-jisx0212	#x2B #x40)	; ì
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (ucs		. #x00ED)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0069 #x0301)
    (mirrored		. nil)
    (->uppercase	#x00CD)
    (->titlecase	#x00CD)
    (latin-iso8859-1	#x6D)	; í
    (latin-iso8859-2	#x6D)	; í
    (latin-iso8859-3	#x6D)	; í
    (latin-iso8859-4	#x6D)	; í
    (latin-iso8859-9	#x6D)	; í
    (latin-viscii-lower	#x6D)	; í
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")
    (->ucs		. #x00ED)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00ED)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (chinese-gb2312	#x28 #x2A)	; í
    (japanese-jisx0212	#x2B #x3F)	; í
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00EE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0069 #x0302)
    (mirrored		. nil)
    (->uppercase	#x00CE)
    (->titlecase	#x00CE)
    (latin-iso8859-1	#x6E)	; î
    (latin-iso8859-2	#x6E)	; î
    (latin-iso8859-3	#x6E)	; î
    (latin-iso8859-4	#x6E)	; î
    (latin-iso8859-9	#x6E)	; î
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00EE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00EE)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x42)	; î
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (ucs		. #x00EF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0069 #x0308)
    (mirrored		. nil)
    (->uppercase	#x00CF)
    (->titlecase	#x00CF)
    (latin-iso8859-1	#x6F)	; ï
    (latin-iso8859-3	#x6F)	; ï
    (latin-iso8859-9	#x6F)	; ï
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")
    (->ucs		. #x00EF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0069 #x0308)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x41)	; ï
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
    (ipa		#x49)
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER ETH")
    (->ucs		. #x00F0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (korean-ksc5601	#x29 #x23)	; ð
    (japanese-jisx0212	#x29 #x43)	; ð
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (ucs		. #x00F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x006E #x0303)
    (mirrored		. nil)
    (->uppercase	#x00D1)
    (->titlecase	#x00D1)
    (latin-iso8859-1	#x71)	; ñ
    (latin-iso8859-3	#x71)	; ñ
    (latin-iso8859-9	#x71)	; ñ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")
    (->ucs		. #x00F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F1)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (japanese-jisx0212	#x2B #x50)	; ñ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (ucs		. #x00F2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x006F #x0300)
    (mirrored		. nil)
    (->uppercase	#x00D2)
    (->titlecase	#x00D2)
    (latin-iso8859-1	#x72)	; ò
    (latin-iso8859-3	#x72)	; ò
    (latin-iso8859-9	#x72)	; ò
    (latin-viscii-lower	#x72)	; ò
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")
    (->ucs		. #x00F2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F2)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (chinese-gb2312	#x28 #x30)	; ò
    (japanese-jisx0212	#x2B #x52)	; ò
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (ucs		. #x00F3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x006F #x0301)
    (mirrored		. nil)
    (->uppercase	#x00D3)
    (->titlecase	#x00D3)
    (latin-iso8859-1	#x73)	; ó
    (latin-iso8859-2	#x73)	; ó
    (latin-iso8859-3	#x73)	; ó
    (latin-iso8859-9	#x73)	; ó
    (latin-viscii-lower	#x73)	; ó
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")
    (->ucs		. #x00F3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F3)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (chinese-gb2312	#x28 #x2E)	; ó
    (japanese-jisx0212	#x2B #x51)	; ó
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00F4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x006F #x0302)
    (mirrored		. nil)
    (->uppercase	#x00D4)
    (->titlecase	#x00D4)
    (latin-iso8859-1	#x74)	; ô
    (latin-iso8859-2	#x74)	; ô
    (latin-iso8859-3	#x74)	; ô
    (latin-iso8859-4	#x74)	; ô
    (latin-iso8859-9	#x74)	; ô
    (latin-viscii-lower	#x74)	; ô
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00F4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F4)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x54)	; ô
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (ucs		. #x00F5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x006F #x0303)
    (mirrored		. nil)
    (->uppercase	#x00D5)
    (->titlecase	#x00D5)
    (latin-iso8859-1	#x75)	; õ
    (latin-iso8859-4	#x75)	; õ
    (latin-iso8859-9	#x75)	; õ
    (latin-viscii-lower	#x75)	; õ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH TILDE")
    (->ucs		. #x00F5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F5)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	#x2B #x58)	; õ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (ucs		. #x00F6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x006F #x0308)
    (mirrored		. nil)
    (->uppercase	#x00D6)
    (->titlecase	#x00D6)
    (latin-iso8859-1	#x76)	; ö
    (latin-iso8859-2	#x76)	; ö
    (latin-iso8859-3	#x76)	; ö
    (latin-iso8859-4	#x76)	; ö
    (latin-iso8859-9	#x76)	; ö
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH DIAERESIS")
    (->ucs		. #x00F6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F6)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x53)	; ö
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x77)	; ÷
    (latin-iso8859-2	#x77)	; ÷
    (latin-iso8859-3	#x77)	; ÷
    (latin-iso8859-4	#x77)	; ÷
    (latin-iso8859-9	#x77)	; ÷
    (hebrew-iso8859-8	#x3A)	; ÷
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00F7)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x60)	; ÷
    (chinese-gb2312		#x21 #x42)	; ÷
    (japanese-jisx0208		#x21 #x60)	; ÷
    (korean-ksc5601		#x21 #x40)	; ÷
    (chinese-cns11643-1		#x22 #x33)	; ÷
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
    (latin-iso8859-4	#x78)	; ø
    (latin-iso8859-9	#x78)	; ø
    (ipa		#x2F)	; ø
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")
    (->ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F8)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (korean-ksc5601	#x29 #x2A)	; ø
    (japanese-jisx0212	#x29 #x4C)	; ø
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (ucs		. #x00F9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0075 #x0300)
    (mirrored		. nil)
    (->uppercase	#x00D9)
    (->titlecase	#x00D9)
    (latin-iso8859-1	#x79)	; ù
    (latin-iso8859-3	#x79)	; ù
    (latin-iso8859-9	#x79)	; ù
    (latin-viscii-lower	#x79)	; ù
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")
    (->ucs		. #x00F9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00F9)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (chinese-gb2312	#x28 #x34)	; ù
    (japanese-jisx0212	#x2B #x63)	; ù
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (ucs		. #x00FA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0075 #x0301)
    (mirrored		. nil)
    (->uppercase	#x00DA)
    (->titlecase	#x00DA)
    (latin-iso8859-1	#x7A)	; ú
    (latin-iso8859-2	#x7A)	; ú
    (latin-iso8859-3	#x7A)	; ú
    (latin-iso8859-4	#x7A)	; ú
    (latin-iso8859-9	#x7A)	; ú
    (latin-viscii-lower	#x7A)	; ú
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")
    (->ucs		. #x00FA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00FA)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (chinese-gb2312	#x28 #x32)	; ú
    (japanese-jisx0212	#x2B #x62)	; ú
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00FB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0075 #x0302)
    (mirrored		. nil)
    (->uppercase	#x00DB)
    (->titlecase	#x00DB)
    (latin-iso8859-1	#x7B)	; û
    (latin-iso8859-3	#x7B)	; û
    (latin-iso8859-4	#x7B)	; û
    (latin-iso8859-9	#x7B)	; û
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00FB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00FB)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x65)	; û
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (ucs		. #x00FC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0075 #x0308)
    (mirrored		. nil)
    (->uppercase	#x00DC)
    (->titlecase	#x00DC)
    (latin-iso8859-1	#x7C)	; ü
    (latin-iso8859-2	#x7C)	; ü
    (latin-iso8859-3	#x7C)	; ü
    (latin-iso8859-4	#x7C)	; ü
    (latin-iso8859-9	#x7C)	; ü
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")
    (->ucs		. #x00FC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00FC)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (chinese-gb2312	#x28 #x39)	; ü
    (japanese-jisx0212	#x2B #x64)	; ü
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (ucs		. #x00FD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0079 #x0301)
    (mirrored		. nil)
    (->uppercase	#x00DD)
    (->titlecase	#x00DD)
    (latin-iso8859-1	#x7D)	; ý
    (latin-iso8859-2	#x7D)	; ý
    (latin-viscii-lower	#x7D)	; ý
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")
    (->ucs		. #x00FD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00FD)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	#x2B #x72)	; ý
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
    (->decomposition	wide #x00FE)
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (korean-ksc5601	#x29 #x2D)	; þ
    (japanese-jisx0212	#x29 #x50)	; þ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (ucs		. #x00FF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0079 #x0308)
    (mirrored		. nil)
    (->uppercase	#x0178)
    (->titlecase	#x0178)
    (latin-iso8859-1	#x7F)	; ÿ
    (latin-iso8859-9	#x7F)	; ÿ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH DIAERESIS")
    (->ucs		. #x00FF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00FF)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (->titlecase
     ((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (japanese-jisx0212	#x2B #x73)	; ÿ
    ))
