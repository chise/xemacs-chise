(define-char
  '((name		. "NO-BREAK SPACE")
    (ucs		. #x00A0)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (latin-iso8859-1		#xA0)	;  
    (latin-iso8859-2		#xA0)	; �����
    (latin-iso8859-3		#xA0)	; �����
    (latin-iso8859-4		#xA0)	; �����
    (greek-iso8859-7		#xA0)	; Ͱ
    (hebrew-iso8859-8		#xA0)	; ֐
    (cyrillic-iso8859-5		#xA0)	; Ѐ
    (latin-iso8859-9		#xA0)	; �����
    (japanese-jisx0213-1	#x29 #x22)	;  
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xA1)	; ¡
    (latin-iso8859-9		#xA1)	; �����
    (japanese-jisx0213-1	#x29 #x23)	; ¡
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A1)
    (korean-ksc5601	#x22 #x2E)	; �����
    (japanese-jisx0212	#x22 #x42)	; �����
    ))
(define-char
  '((name		. "CENT SIGN")
    (ucs		. #x00A2)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xA2)	; ¢
    (hebrew-iso8859-8	#xA2)	; ֒
    (latin-iso8859-9	#xA2)	; �����
    ))
(define-char
  '((name		. "POUND SIGN")
    (ucs		. #x00A3)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xA3)	; £
    (latin-iso8859-3	#xA3)	; �����
    (greek-iso8859-7	#xA3)	; ͳ
    (hebrew-iso8859-8	#xA3)	; ֓
    (latin-iso8859-9	#xA3)	; �����
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1		#xA4)	; ¤
    (latin-iso8859-2		#xA4)	; �����
    (latin-iso8859-3		#xA4)	; �����
    (latin-iso8859-4		#xA4)	; �����
    (hebrew-iso8859-8		#xA4)	; ֔
    (latin-iso8859-9		#xA4)	; �����
    (japanese-jisx0213-1	#x29 #x24)	; ¤
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	#x21 #x68)	; �����
    (korean-ksc5601	#x22 #x34)	; �����
    (japanese-jisx0212	#x22 #x70)	; �����
    ))
(define-char
  '((name		. "YEN SIGN")
    (ucs		. #x00A5)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	#x5C)	; �����
    (latin-iso8859-1	#xA5)	; ¥
    (hebrew-iso8859-8	#xA5)	; ֕
    (latin-iso8859-9	#xA5)	; �����
    ))
(define-char
  '((name		. "BROKEN BAR")
    (ucs		. #x00A6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xA6)	; ¦
    (greek-iso8859-7		#xA6)	; Ͷ
    (hebrew-iso8859-8		#xA6)	; ֖
    (latin-iso8859-9		#xA6)	; �����
    (japanese-jisx0213-1	#x29 #x25)	; ¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xA7)	; §
    (latin-iso8859-2	#xA7)	; �����
    (latin-iso8859-3	#xA7)	; �����
    (latin-iso8859-4	#xA7)	; �����
    (greek-iso8859-7	#xA7)	; ͷ
    (hebrew-iso8859-8	#xA7)	; ֗
    (cyrillic-iso8859-5 #xFD)	; ѝ
    (latin-iso8859-9	#xA7)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A7)
    (japanese-jisx0208-1978	#x21 #x78)	; �����
    (chinese-gb2312		#x21 #x6C)	; �����
    (japanese-jisx0208		#x21 #x78)	; �����
    (korean-ksc5601		#x21 #x57)	; �����
    (chinese-cns11643-1		#x21 #x70)	; �����
    ))
(define-char
  '((name		. "DIAERESIS")
    (ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (latin-iso8859-1	#xA8)	; ¨
    (latin-iso8859-2	#xA8)	; �����
    (latin-iso8859-3	#xA8)	; �����
    (latin-iso8859-4	#xA8)	; �����
    (greek-iso8859-7	#xA8)	; ͸
    (hebrew-iso8859-8	#xA8)	; ֘
    (latin-iso8859-9	#xA8)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A8)
    (japanese-jisx0208-1978	#x21 #x2F)	; �����
    (chinese-gb2312		#x21 #x27)	; �����
    (japanese-jisx0208		#x21 #x2F)	; �����
    (korean-ksc5601		#x21 #x27)	; �����
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xA9)	; ©
    (greek-iso8859-7		#xA9)	; ͹
    (hebrew-iso8859-8		#xA9)	; ֙
    (latin-iso8859-9		#xA9)	; �����
    (japanese-jisx0213-1	#x29 #x26)	; ©
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A9)
    (japanese-jisx0212	#x22 #x6D)	; �����
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (latin-iso8859-1		#xAA)	; ª
    (latin-iso8859-9		#xAA)	; �����
    (japanese-jisx0213-1	#x29 #x27)	; ª
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00AA)
    (korean-ksc5601	#x28 #x23)	; �����
    (japanese-jisx0212	#x22 #x6C)	; �����
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00AB)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		#xAB)	; «
    (greek-iso8859-7		#xAB)	; ͻ
    (hebrew-iso8859-8		#xAB)	; ֛
    (latin-iso8859-9		#xAB)	; �����
    (japanese-jisx0213-1	#x29 #x28)	; «
    ))
(define-char
  '((name		. "NOT SIGN")
    (ucs		. #x00AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xAC)	; ¬
    (greek-iso8859-7	#xAC)	; ͼ
    (hebrew-iso8859-8	#xAC)	; ֜
    (latin-iso8859-9	#xAC)	; �����
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xAD)	; ­
    (latin-iso8859-2		#xAD)	; �����
    (latin-iso8859-3		#xAD)	; �����
    (latin-iso8859-4		#xAD)	; �����
    (greek-iso8859-7		#xAD)	; ͽ
    (hebrew-iso8859-8		#xAD)	; ֝
    (cyrillic-iso8859-5		#xAD)	; Ѝ
    (latin-iso8859-9		#xAD)	; �����
    (japanese-jisx0213-1	#x29 #x29)	; ­
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AD)
    (korean-ksc5601	#x21 #x29)	; �����
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xAE)	; ®
    (hebrew-iso8859-8		#xAE)	; ֞
    (latin-iso8859-9		#xAE)	; �����
    (japanese-jisx0213-1	#x29 #x2A)	; ®
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AE)
    (japanese-jisx0212	#x22 #x6E)	; �����
    ))
(define-char
  '((name		. "MACRON")
    (ucs		. #x00AF)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (latin-iso8859-1		#xAF)	; ¯
    (latin-iso8859-4		#xAF)	; �����
    (latin-iso8859-9		#xAF)	; �����
    (japanese-jisx0213-1	#x29 #x2B)	; ¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xB0)	; °
    (latin-iso8859-2	#xB0)	; �����
    (latin-iso8859-3	#xB0)	; �����
    (latin-iso8859-4	#xB0)	; �����
    (greek-iso8859-7	#xB0)	; ΀
    (hebrew-iso8859-8	#xB0)	; ֠
    (latin-iso8859-9	#xB0)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B0)
    (japanese-jisx0208-1978	#x21 #x6B)	; �����
    (chinese-gb2312		#x21 #x63)	; �����
    (japanese-jisx0208		#x21 #x6B)	; �����
    (korean-ksc5601		#x21 #x46)	; �����
    (chinese-cns11643-1		#x22 #x78)	; �����
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xB1)	; ±
    (greek-iso8859-7	#xB1)	; ΁
    (hebrew-iso8859-8	#xB1)	; ֡
    (latin-iso8859-9	#xB1)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B1)
    (japanese-jisx0208-1978	#x21 #x5E)	; �����
    (chinese-gb2312		#x21 #x40)	; �����
    (japanese-jisx0208		#x21 #x5E)	; �����
    (korean-ksc5601		#x21 #x3E)	; �����
    (chinese-cns11643-1		#x22 #x34)	; �����
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
    (latin-iso8859-1		#xB2)	; ²
    (latin-iso8859-3		#xB2)	; �����
    (greek-iso8859-7		#xB2)	; ΂
    (hebrew-iso8859-8		#xB2)	; ֢
    (latin-iso8859-9		#xB2)	; �����
    (japanese-jisx0213-1	#x29 #x2C)	; ²
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
    (korean-ksc5601	#x29 #x77)	; �����
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
    (latin-iso8859-1		#xB3)	; ³
    (latin-iso8859-3		#xB3)	; �����
    (greek-iso8859-7		#xB3)	; ΃
    (hebrew-iso8859-8		#xB3)	; ֣
    (latin-iso8859-9		#xB3)	; �����
    (japanese-jisx0213-1	#x29 #x2D)	; ³
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
    (korean-ksc5601	#x29 #x78)	; �����
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (latin-iso8859-1	#xB4)	; ´
    (latin-iso8859-2	#xB4)	; �����
    (latin-iso8859-3	#xB4)	; �����
    (latin-iso8859-4	#xB4)	; �����
    (hebrew-iso8859-8	#xB4)	; ֤
    (latin-iso8859-9	#xB4)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B4)
    (japanese-jisx0208-1978	#x21 #x2D)	; �����
    (japanese-jisx0208		#x21 #x2D)	; �����
    (korean-ksc5601		#x22 #x25)	; �����
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
    (latin-iso8859-1	#xB5)	; µ
    (latin-iso8859-3	#xB5)	; �����
    (hebrew-iso8859-8	#xB5)	; ֥
    (latin-iso8859-9	#xB5)	; �����
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xB6)	; ¶
    (hebrew-iso8859-8	#xB6)	; ֦
    (latin-iso8859-9	#xB6)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B6)
    (japanese-jisx0208	#x22 #x79)	; �����
    (korean-ksc5601	#x22 #x52)	; �����
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xB7)	; ·
    (latin-iso8859-3		#xB7)	; �����
    (greek-iso8859-7		#xB7)	; ·
    (hebrew-iso8859-8		#xB7)	; ֧
    (latin-iso8859-9		#xB7)	; �����
    (japanese-jisx0213-1	#x29 #x2E)	; ·
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B7)
    (korean-ksc5601	#x21 #x24)	; �����
    (chinese-cns11643-1 #x21 #x26)	; �����
    ))
(define-char
  '((name		. "CEDILLA")
    (ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (latin-iso8859-1		#xB8)	; ¸
    (latin-iso8859-2		#xB8)	; �����
    (latin-iso8859-3		#xB8)	; �����
    (latin-iso8859-4		#xB8)	; �����
    (hebrew-iso8859-8		#xB8)	; ֨
    (latin-iso8859-9		#xB8)	; �����
    (japanese-jisx0213-1	#x29 #x2F)	; ¸
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B8)
    (korean-ksc5601	#x22 #x2C)	; �����
    (japanese-jisx0212	#x22 #x31)	; �����
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
    (latin-iso8859-1		#xB9)	; ¹
    (hebrew-iso8859-8		#xB9)	; ֩
    (latin-iso8859-9		#xB9)	; �����
    (japanese-jisx0213-1	#x29 #x30)	; ¹
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
    (korean-ksc5601	#x29 #x76)	; �����
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (latin-iso8859-1		#xBA)	; º
    (latin-iso8859-9		#xBA)	; �����
    (japanese-jisx0213-1	#x29 #x31)	; º
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00BA)
    (korean-ksc5601	#x28 #x2C)	; �����
    (japanese-jisx0212	#x22 #x6B)	; �����
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00BB)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		#xBB)	; »
    (greek-iso8859-7		#xBB)	; ΋
    (hebrew-iso8859-8		#xBB)	; ֫
    (latin-iso8859-9		#xBB)	; �����
    (japanese-jisx0213-1	#x29 #x32)	; »
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (latin-iso8859-1		#xBC)	; ¼
    (hebrew-iso8859-8		#xBC)	; ֬
    (latin-iso8859-9		#xBC)	; �����
    (japanese-jisx0213-1	#x29 #x33)	; ¼
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	wide #x00BC)
    (korean-ksc5601	#x28 #x79)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (latin-iso8859-1		#xBD)	; ½
    (latin-iso8859-3		#xBD)	; �����
    (greek-iso8859-7		#xBD)	; ΍
    (hebrew-iso8859-8		#xBD)	; ֭
    (latin-iso8859-9		#xBD)	; �����
    (japanese-jisx0213-1	#x29 #x34)	; ½
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	wide #x00BD)
    (korean-ksc5601	#x28 #x76)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (latin-iso8859-1		#xBE)	; ¾
    (hebrew-iso8859-8		#xBE)	; ֮
    (latin-iso8859-9		#xBE)	; �����
    (japanese-jisx0213-1	#x29 #x35)	; ¾
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	wide #x00BE)
    (korean-ksc5601	#x28 #x7A)	; �����
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xBF)	; ¿
    (latin-iso8859-9		#xBF)	; �����
    (japanese-jisx0213-1	#x29 #x36)	; ¿
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BF)
    (korean-ksc5601	#x22 #x2F)	; �����
    (japanese-jisx0212	#x22 #x44)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->lowercase	#x00E0)
    (latin-iso8859-1		#xC0)	; À
    (latin-iso8859-3		#xC0)	; �����
    (latin-iso8859-9		#xC0)	; �����
    (latin-viscii-upper		#xE0)	; À
    (latin-viscii		#xC0)	; À
    (japanese-jisx0213-1	#x29 #x37)	; À
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
    (japanese-jisx0212	#x2A #x22)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->lowercase	#x00E1)
    (latin-iso8859-1		#xC1)	; Á
    (latin-iso8859-2		#xC1)	; �����
    (latin-iso8859-3		#xC1)	; �����
    (latin-iso8859-4		#xC1)	; �����
    (latin-iso8859-9		#xC1)	; �����
    (latin-viscii-upper		#xE1)	; Á
    (latin-viscii		#xC1)	; Á
    (japanese-jisx0213-1	#x29 #x38)	; Á
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
    (japanese-jisx0212	#x2A #x21)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->lowercase	#x00E2)
    (latin-iso8859-1		#xC2)	; Â
    (latin-iso8859-2		#xC2)	; �����
    (latin-iso8859-3		#xC2)	; �����
    (latin-iso8859-4		#xC2)	; �����
    (latin-iso8859-9		#xC2)	; �����
    (latin-viscii-upper		#xE2)	; Â
    (latin-viscii		#xC2)	; Â
    (japanese-jisx0213-1	#x29 #x39)	; Â
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
    (japanese-jisx0212	#x2A #x24)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->lowercase	#x00E3)
    (latin-iso8859-1		#xC3)	; Ã
    (latin-iso8859-4		#xC3)	; �����
    (latin-iso8859-9		#xC3)	; �����
    (latin-viscii-upper		#xE3)	; Ã
    (latin-viscii		#xC3)	; Ã
    (japanese-jisx0213-1	#x29 #x3A)	; Ã
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
    (japanese-jisx0212	#x2A #x2A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->lowercase	#x00E4)
    (latin-iso8859-1		#xC4)	; Ä
    (latin-iso8859-2		#xC4)	; �����
    (latin-iso8859-3		#xC4)	; �����
    (latin-iso8859-4		#xC4)	; �����
    (latin-iso8859-9		#xC4)	; �����
    (japanese-jisx0213-1	#x29 #x3B)	; Ä
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
    (japanese-jisx0212	#x2A #x23)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->lowercase	#x00E5)
    (latin-iso8859-1		#xC5)	; Å
    (latin-iso8859-4		#xC5)	; �����
    (latin-iso8859-9		#xC5)	; �����
    (japanese-jisx0213-1	#x29 #x3C)	; Å
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
    (japanese-jisx0212	#x2A #x29)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase	#x00E6)
    (latin-iso8859-1		#xC6)	; Æ
    (latin-iso8859-4		#xC6)	; �����
    (latin-iso8859-9		#xC6)	; �����
    (japanese-jisx0213-1	#x29 #x3D)	; Æ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	#x28 #x21)	; �����
    (japanese-jisx0212	#x29 #x21)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->lowercase	#x00E7)
    (latin-iso8859-1		#xC7)	; Ç
    (latin-iso8859-2		#xC7)	; �����
    (latin-iso8859-3		#xC7)	; �����
    (latin-iso8859-9		#xC7)	; �����
    (japanese-jisx0213-1	#x29 #x3E)	; Ç
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
    (japanese-jisx0212	#x2A #x2E)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->lowercase	#x00E8)
    (latin-iso8859-1		#xC8)	; È
    (latin-iso8859-3		#xC8)	; �����
    (latin-iso8859-9		#xC8)	; �����
    (latin-viscii-upper		#xE8)	; È
    (latin-viscii		#xC8)	; È
    (japanese-jisx0213-1	#x29 #x3F)	; È
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
    (japanese-jisx0212	#x2A #x32)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->lowercase	#x00E9)
    (latin-iso8859-1		#xC9)	; É
    (latin-iso8859-2		#xC9)	; �����
    (latin-iso8859-3		#xC9)	; �����
    (latin-iso8859-4		#xC9)	; �����
    (latin-iso8859-9		#xC9)	; �����
    (latin-viscii-upper		#xE9)	; É
    (latin-viscii		#xC9)	; É
    (japanese-jisx0213-1	#x29 #x40)	; É
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
    (japanese-jisx0212	#x2A #x31)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->lowercase	#x00EA)
    (latin-iso8859-1		#xCA)	; Ê
    (latin-iso8859-3		#xCA)	; �����
    (latin-iso8859-9		#xCA)	; �����
    (latin-viscii-upper		#xEA)	; Ê
    (latin-viscii		#xCA)	; Ê
    (japanese-jisx0213-1	#x29 #x41)	; Ê
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
    (japanese-jisx0212	#x2A #x34)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->lowercase	#x00EB)
    (latin-iso8859-1		#xCB)	; Ë
    (latin-iso8859-2		#xCB)	; �����
    (latin-iso8859-3		#xCB)	; �����
    (latin-iso8859-4		#xCB)	; �����
    (latin-iso8859-9		#xCB)	; �����
    (japanese-jisx0213-1	#x29 #x42)	; Ë
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
    (japanese-jisx0212	#x2A #x33)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->lowercase	#x00EC)
    (latin-iso8859-1		#xCC)	; Ì
    (latin-iso8859-3		#xCC)	; �����
    (latin-iso8859-9		#xCC)	; �����
    (latin-viscii-upper		#xEC)	; Ì
    (latin-viscii		#xCC)	; Ì
    (japanese-jisx0213-1	#x29 #x43)	; Ì
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
    (japanese-jisx0212	#x2A #x40)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->lowercase	#x00ED)
    (latin-iso8859-1		#xCD)	; Í
    (latin-iso8859-2		#xCD)	; �����
    (latin-iso8859-3		#xCD)	; �����
    (latin-iso8859-4		#xCD)	; �����
    (latin-iso8859-9		#xCD)	; �����
    (latin-viscii-upper		#xED)	; Í
    (latin-viscii		#xCD)	; Í
    (japanese-jisx0213-1	#x29 #x44)	; Í
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
    (japanese-jisx0212	#x2A #x3F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->lowercase	#x00EE)
    (latin-iso8859-1		#xCE)	; Î
    (latin-iso8859-2		#xCE)	; �����
    (latin-iso8859-3		#xCE)	; �����
    (latin-iso8859-4		#xCE)	; �����
    (latin-iso8859-9		#xCE)	; �����
    (japanese-jisx0213-1	#x29 #x45)	; Î
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
    (japanese-jisx0212	#x2A #x42)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->lowercase	#x00EF)
    (latin-iso8859-1		#xCF)	; Ï
    (latin-iso8859-3		#xCF)	; �����
    (latin-iso8859-9		#xCF)	; �����
    (japanese-jisx0213-1	#x29 #x46)	; Ï
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
    (japanese-jisx0212	#x2A #x41)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (ucs		. #x00D0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00F0)
    (latin-iso8859-1		#xD0)	; Ð
    (japanese-jisx0213-1	#x29 #x47)	; Ð
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
    (korean-ksc5601	#x28 #x22)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->lowercase	#x00F1)
    (latin-iso8859-1		#xD1)	; Ñ
    (latin-iso8859-3		#xD1)	; �����
    (latin-iso8859-9		#xD1)	; �����
    (japanese-jisx0213-1	#x29 #x48)	; Ñ
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
    (japanese-jisx0212	#x2A #x50)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->lowercase	#x00F2)
    (latin-iso8859-1		#xD2)	; Ò
    (latin-iso8859-3		#xD2)	; �����
    (latin-iso8859-9		#xD2)	; �����
    (latin-viscii-upper		#xF2)	; Ò
    (latin-viscii		#xD2)	; Ò
    (japanese-jisx0213-1	#x29 #x49)	; Ò
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
    (japanese-jisx0212	#x2A #x52)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->lowercase	#x00F3)
    (latin-iso8859-1		#xD3)	; Ó
    (latin-iso8859-2		#xD3)	; �����
    (latin-iso8859-3		#xD3)	; �����
    (latin-iso8859-9		#xD3)	; �����
    (latin-viscii-upper		#xF3)	; Ó
    (latin-viscii		#xD3)	; Ó
    (japanese-jisx0213-1	#x29 #x4A)	; Ó
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
    (japanese-jisx0212	#x2A #x51)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->lowercase	#x00F4)
    (latin-iso8859-1		#xD4)	; Ô
    (latin-iso8859-2		#xD4)	; �����
    (latin-iso8859-3		#xD4)	; �����
    (latin-iso8859-4		#xD4)	; �����
    (latin-iso8859-9		#xD4)	; �����
    (latin-viscii-upper		#xF4)	; Ô
    (latin-viscii		#xD4)	; Ô
    (japanese-jisx0213-1	#x29 #x4B)	; Ô
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
    (japanese-jisx0212	#x2A #x54)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->lowercase	#x00F5)
    (latin-iso8859-1		#xD5)	; Õ
    (latin-iso8859-4		#xD5)	; �����
    (latin-iso8859-9		#xD5)	; �����
    (latin-viscii-upper		#xF5)	; Õ
    (latin-viscii		#xA0)	; Õ
    (japanese-jisx0213-1	#x29 #x4C)	; Õ
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
    (japanese-jisx0212	#x2A #x58)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->lowercase	#x00F6)
    (latin-iso8859-1		#xD6)	; Ö
    (latin-iso8859-2		#xD6)	; �����
    (latin-iso8859-3		#xD6)	; �����
    (latin-iso8859-4		#xD6)	; �����
    (latin-iso8859-9		#xD6)	; �����
    (japanese-jisx0213-1	#x29 #x4D)	; Ö
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
    (japanese-jisx0212	#x2A #x53)	; �����
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xD7)	; ×
    (latin-iso8859-2	#xD7)	; �����
    (latin-iso8859-3	#xD7)	; �����
    (latin-iso8859-4	#xD7)	; �����
    (hebrew-iso8859-8	#xAA)	; ֚
    (latin-iso8859-9	#xD7)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00D7)
    (japanese-jisx0208-1978	#x21 #x5F)	; �����
    (chinese-gb2312		#x21 #x41)	; �����
    (japanese-jisx0208		#x21 #x5F)	; �����
    (korean-ksc5601		#x21 #x3F)	; �����
    (chinese-cns11643-1		#x22 #x32)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1		#xD8)	; Ø
    (latin-iso8859-4		#xD8)	; �����
    (latin-iso8859-9		#xD8)	; �����
    (japanese-jisx0213-1	#x29 #x4E)	; Ø
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	#x28 #x2A)	; �����
    (japanese-jisx0212	#x29 #x2C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase	#x00F9)
    (latin-iso8859-1		#xD9)	; Ù
    (latin-iso8859-3		#xD9)	; �����
    (latin-iso8859-9		#xD9)	; �����
    (latin-viscii-upper		#xF9)	; Ù
    (latin-viscii		#xD9)	; Ù
    (japanese-jisx0213-1	#x29 #x4F)	; Ù
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
    (japanese-jisx0212	#x2A #x63)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->lowercase	#x00FA)
    (latin-iso8859-1		#xDA)	; Ú
    (latin-iso8859-2		#xDA)	; �����
    (latin-iso8859-3		#xDA)	; �����
    (latin-iso8859-4		#xDA)	; �����
    (latin-iso8859-9		#xDA)	; �����
    (latin-viscii-upper		#xFA)	; Ú
    (latin-viscii		#xDA)	; Ú
    (japanese-jisx0213-1	#x29 #x50)	; Ú
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
    (japanese-jisx0212	#x2A #x62)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->lowercase	#x00FB)
    (latin-iso8859-1		#xDB)	; Û
    (latin-iso8859-3		#xDB)	; �����
    (latin-iso8859-4		#xDB)	; �����
    (latin-iso8859-9		#xDB)	; �����
    (japanese-jisx0213-1	#x29 #x51)	; Û
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
    (japanese-jisx0212	#x2A #x65)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->lowercase	#x00FC)
    (latin-iso8859-1		#xDC)	; Ü
    (latin-iso8859-2		#xDC)	; �����
    (latin-iso8859-3		#xDC)	; �����
    (latin-iso8859-4		#xDC)	; �����
    (latin-iso8859-9		#xDC)	; �����
    (japanese-jisx0213-1	#x29 #x52)	; Ü
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
    (japanese-jisx0212	#x2A #x64)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->lowercase	#x00FD)
    (latin-iso8859-1		#xDD)	; Ý
    (latin-iso8859-2		#xDD)	; �����
    (latin-viscii-upper		#xFD)	; Ý
    (latin-viscii		#xDD)	; Ý
    (japanese-jisx0213-1	#x29 #x53)	; Ý
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
    (japanese-jisx0212	#x2A #x72)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (ucs		. #x00DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00FE)
    (latin-iso8859-1		#xDE)	; Þ
    (japanese-jisx0213-1	#x29 #x54)	; Þ
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
    (korean-ksc5601	#x28 #x2D)	; �����
    (japanese-jisx0212	#x29 #x30)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1		#xDF)	; ß
    (latin-iso8859-2		#xDF)	; �����
    (latin-iso8859-3		#xDF)	; �����
    (latin-iso8859-4		#xDF)	; �����
    (latin-iso8859-9		#xDF)	; �����
    (japanese-jisx0213-1	#x29 #x55)	; ß
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->decomposition	wide #x00DF)
    (korean-ksc5601	#x29 #x2C)	; �����
    (japanese-jisx0212	#x29 #x4E)	; �����
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
    (latin-iso8859-1		#xE0)	; à
    (latin-iso8859-3		#xE0)	; �����
    (latin-iso8859-9		#xE0)	; �����
    (latin-viscii-lower		#xE0)	; à
    (latin-viscii		#xE0)	; à
    (japanese-jisx0213-1	#x29 #x56)	; à
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
    (chinese-gb2312	#x28 #x24)	; �����
    (japanese-jisx0212	#x2B #x22)	; �����
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
    (latin-iso8859-1		#xE1)	; á
    (latin-iso8859-2		#xE1)	; �����
    (latin-iso8859-3		#xE1)	; �����
    (latin-iso8859-4		#xE1)	; �����
    (latin-iso8859-9		#xE1)	; �����
    (latin-viscii-lower		#xE1)	; á
    (latin-viscii		#xE1)	; á
    (japanese-jisx0213-1	#x29 #x57)	; á
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
    (chinese-gb2312	#x28 #x22)	; �����
    (japanese-jisx0212	#x2B #x21)	; �����
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
    (latin-iso8859-1		#xE2)	; â
    (latin-iso8859-2		#xE2)	; �����
    (latin-iso8859-3		#xE2)	; �����
    (latin-iso8859-4		#xE2)	; �����
    (latin-iso8859-9		#xE2)	; �����
    (latin-viscii-lower		#xE2)	; â
    (latin-viscii		#xE2)	; â
    (japanese-jisx0213-1	#x29 #x58)	; â
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
    (japanese-jisx0212	#x2B #x24)	; �����
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
    (latin-iso8859-1		#xE3)	; ã
    (latin-iso8859-4		#xE3)	; �����
    (latin-iso8859-9		#xE3)	; �����
    (latin-viscii-lower		#xE3)	; ã
    (latin-viscii		#xE3)	; ã
    (japanese-jisx0213-1	#x29 #x59)	; ã
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
    (japanese-jisx0212	#x2B #x2A)	; �����
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
    (latin-iso8859-1		#xE4)	; ä
    (latin-iso8859-2		#xE4)	; �����
    (latin-iso8859-3		#xE4)	; �����
    (latin-iso8859-4		#xE4)	; �����
    (latin-iso8859-9		#xE4)	; �����
    (japanese-jisx0213-1	#x29 #x5A)	; ä
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
    (japanese-jisx0212	#x2B #x23)	; �����
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
    (latin-iso8859-1		#xE5)	; å
    (latin-iso8859-4		#xE5)	; �����
    (latin-iso8859-9		#xE5)	; �����
    (japanese-jisx0213-1	#x29 #x5B)	; å
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
    (japanese-jisx0212	#x2B #x29)	; �����
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
    (latin-iso8859-1		#xE6)	; æ
    (latin-iso8859-4		#xE6)	; �����
    (latin-iso8859-9		#xE6)	; �����
    (ipa			#xA4)	; �����
    (japanese-jisx0213-1	#x29 #x5C)	; æ
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
    (korean-ksc5601	#x29 #x21)	; �����
    (japanese-jisx0212	#x29 #x41)	; �����
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
    (latin-iso8859-1		#xE7)	; ç
    (latin-iso8859-2		#xE7)	; �����
    (latin-iso8859-3		#xE7)	; �����
    (latin-iso8859-9		#xE7)	; �����
    (ipa			#xCE)	; �����
    (japanese-jisx0213-1	#x29 #x5D)	; ç
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
    (japanese-jisx0212	#x2B #x2E)	; �����
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
    (latin-iso8859-1		#xE8)	; è
    (latin-iso8859-3		#xE8)	; �����
    (latin-iso8859-9		#xE8)	; �����
    (latin-viscii-lower		#xE8)	; è
    (latin-viscii		#xE8)	; è
    (japanese-jisx0213-1	#x29 #x5E)	; è
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
    (chinese-gb2312	#x28 #x28)	; �����
    (japanese-jisx0212	#x2B #x32)	; �����
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
    (latin-iso8859-1		#xE9)	; é
    (latin-iso8859-2		#xE9)	; �����
    (latin-iso8859-3		#xE9)	; �����
    (latin-iso8859-4		#xE9)	; �����
    (latin-iso8859-9		#xE9)	; �����
    (latin-viscii-lower		#xE9)	; é
    (latin-viscii		#xE9)	; é
    (japanese-jisx0213-1	#x29 #x5F)	; é
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
    (chinese-gb2312	#x28 #x26)	; �����
    (japanese-jisx0212	#x2B #x31)	; �����
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
    (latin-iso8859-1		#xEA)	; ê
    (latin-iso8859-3		#xEA)	; �����
    (latin-iso8859-9		#xEA)	; �����
    (latin-viscii-lower		#xEA)	; ê
    (latin-viscii		#xEA)	; ê
    (japanese-jisx0213-1	#x29 #x60)	; ê
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
    (chinese-gb2312	#x28 #x3A)	; �����
    (japanese-jisx0212	#x2B #x34)	; �����
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
    (latin-iso8859-1		#xEB)	; ë
    (latin-iso8859-2		#xEB)	; �����
    (latin-iso8859-3		#xEB)	; �����
    (latin-iso8859-4		#xEB)	; �����
    (latin-iso8859-9		#xEB)	; �����
    (japanese-jisx0213-1	#x29 #x61)	; ë
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
    (japanese-jisx0212	#x2B #x33)	; �����
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
    (latin-iso8859-1		#xEC)	; ì
    (latin-iso8859-3		#xEC)	; �����
    (latin-iso8859-9		#xEC)	; �����
    (latin-viscii-lower		#xEC)	; ì
    (latin-viscii		#xEC)	; ì
    (japanese-jisx0213-1	#x29 #x62)	; ì
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
    (chinese-gb2312	#x28 #x2C)	; �����
    (japanese-jisx0212	#x2B #x40)	; �����
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
    (latin-iso8859-1		#xED)	; í
    (latin-iso8859-2		#xED)	; �����
    (latin-iso8859-3		#xED)	; �����
    (latin-iso8859-4		#xED)	; �����
    (latin-iso8859-9		#xED)	; �����
    (latin-viscii-lower		#xED)	; í
    (latin-viscii		#xED)	; í
    (japanese-jisx0213-1	#x29 #x63)	; í
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
    (chinese-gb2312	#x28 #x2A)	; �����
    (japanese-jisx0212	#x2B #x3F)	; �����
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
    (latin-iso8859-1		#xEE)	; î
    (latin-iso8859-2		#xEE)	; �����
    (latin-iso8859-3		#xEE)	; �����
    (latin-iso8859-4		#xEE)	; �����
    (latin-iso8859-9		#xEE)	; �����
    (japanese-jisx0213-1	#x29 #x64)	; î
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
    (japanese-jisx0212	#x2B #x42)	; �����
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
    (latin-iso8859-1		#xEF)	; ï
    (latin-iso8859-3		#xEF)	; �����
    (latin-iso8859-9		#xEF)	; �����
    (japanese-jisx0213-1	#x29 #x65)	; ï
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
    (japanese-jisx0212	#x2B #x41)	; �����
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
    (latin-iso8859-1		#xF0)	; ð
    (ipa			#xC9)	; �����
    (japanese-jisx0213-1	#x29 #x66)	; ð
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
    (korean-ksc5601	#x29 #x23)	; �����
    (japanese-jisx0212	#x29 #x43)	; �����
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
    (latin-iso8859-1		#xF1)	; ñ
    (latin-iso8859-3		#xF1)	; �����
    (latin-iso8859-9		#xF1)	; �����
    (japanese-jisx0213-1	#x29 #x67)	; ñ
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
    (japanese-jisx0212	#x2B #x50)	; �����
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
    (latin-iso8859-1		#xF2)	; ò
    (latin-iso8859-3		#xF2)	; �����
    (latin-iso8859-9		#xF2)	; �����
    (latin-viscii-lower		#xF2)	; ò
    (latin-viscii		#xF2)	; ò
    (japanese-jisx0213-1	#x29 #x68)	; ò
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
    (chinese-gb2312	#x28 #x30)	; �����
    (japanese-jisx0212	#x2B #x52)	; �����
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
    (latin-iso8859-1		#xF3)	; ó
    (latin-iso8859-2		#xF3)	; �����
    (latin-iso8859-3		#xF3)	; �����
    (latin-iso8859-9		#xF3)	; �����
    (latin-viscii-lower		#xF3)	; ó
    (latin-viscii		#xF3)	; ó
    (japanese-jisx0213-1	#x29 #x69)	; ó
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
    (chinese-gb2312	#x28 #x2E)	; �����
    (japanese-jisx0212	#x2B #x51)	; �����
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
    (latin-iso8859-1		#xF4)	; ô
    (latin-iso8859-2		#xF4)	; �����
    (latin-iso8859-3		#xF4)	; �����
    (latin-iso8859-4		#xF4)	; �����
    (latin-iso8859-9		#xF4)	; �����
    (latin-viscii-lower		#xF4)	; ô
    (latin-viscii		#xF4)	; ô
    (japanese-jisx0213-1	#x29 #x6A)	; ô
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
    (japanese-jisx0212	#x2B #x54)	; �����
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
    (latin-iso8859-1		#xF5)	; õ
    (latin-iso8859-4		#xF5)	; �����
    (latin-iso8859-9		#xF5)	; �����
    (latin-viscii-lower		#xF5)	; õ
    (latin-viscii		#xF5)	; õ
    (japanese-jisx0213-1	#x29 #x6B)	; õ
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
    (japanese-jisx0212	#x2B #x58)	; �����
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
    (latin-iso8859-1		#xF6)	; ö
    (latin-iso8859-2		#xF6)	; �����
    (latin-iso8859-3		#xF6)	; �����
    (latin-iso8859-4		#xF6)	; �����
    (latin-iso8859-9		#xF6)	; �����
    (japanese-jisx0213-1	#x29 #x6C)	; ö
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
    (japanese-jisx0212	#x2B #x53)	; �����
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xF7)	; ÷
    (latin-iso8859-2	#xF7)	; �����
    (latin-iso8859-3	#xF7)	; �����
    (latin-iso8859-4	#xF7)	; �����
    (hebrew-iso8859-8	#xBA)	; ֪
    (latin-iso8859-9	#xF7)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00F7)
    (japanese-jisx0208-1978	#x21 #x60)	; �����
    (chinese-gb2312		#x21 #x42)	; �����
    (japanese-jisx0208		#x21 #x60)	; �����
    (korean-ksc5601		#x21 #x40)	; �����
    (chinese-cns11643-1		#x22 #x33)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1		#xF8)	; ø
    (latin-iso8859-4		#xF8)	; �����
    (latin-iso8859-9		#xF8)	; �����
    (ipa			#xAF)	; �����
    (japanese-jisx0213-1	#x29 #x6D)	; ø
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
    (korean-ksc5601	#x29 #x2A)	; �����
    (japanese-jisx0212	#x29 #x4C)	; �����
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
    (latin-iso8859-1		#xF9)	; ù
    (latin-iso8859-3		#xF9)	; �����
    (latin-iso8859-9		#xF9)	; �����
    (latin-viscii-lower		#xF9)	; ù
    (latin-viscii		#xF9)	; ù
    (japanese-jisx0213-1	#x29 #x6E)	; ù
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
    (chinese-gb2312	#x28 #x34)	; �����
    (japanese-jisx0212	#x2B #x63)	; �����
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
    (latin-iso8859-1		#xFA)	; ú
    (latin-iso8859-2		#xFA)	; �����
    (latin-iso8859-3		#xFA)	; �����
    (latin-iso8859-4		#xFA)	; �����
    (latin-iso8859-9		#xFA)	; �����
    (latin-viscii-lower		#xFA)	; ú
    (latin-viscii		#xFA)	; ú
    (japanese-jisx0213-1	#x29 #x6F)	; ú
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
    (chinese-gb2312	#x28 #x32)	; �����
    (japanese-jisx0212	#x2B #x62)	; �����
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
    (latin-iso8859-1		#xFB)	; û
    (latin-iso8859-3		#xFB)	; �����
    (latin-iso8859-4		#xFB)	; �����
    (latin-iso8859-9		#xFB)	; �����
    (japanese-jisx0213-1	#x29 #x70)	; û
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
    (japanese-jisx0212	#x2B #x65)	; �����
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
    (latin-iso8859-1		#xFC)	; ü
    (latin-iso8859-2		#xFC)	; �����
    (latin-iso8859-3		#xFC)	; �����
    (latin-iso8859-4		#xFC)	; �����
    (latin-iso8859-9		#xFC)	; �����
    (japanese-jisx0213-1	#x29 #x71)	; ü
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
    (chinese-gb2312	#x28 #x39)	; �����
    (japanese-jisx0212	#x2B #x64)	; �����
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
    (latin-iso8859-1		#xFD)	; ý
    (latin-iso8859-2		#xFD)	; �����
    (latin-viscii-lower		#xFD)	; ý
    (latin-viscii		#xFD)	; ý
    (japanese-jisx0213-1	#x29 #x72)	; ý
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
    (japanese-jisx0212	#x2B #x72)	; �����
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
    (latin-iso8859-1		#xFE)	; þ
    (japanese-jisx0213-1	#x29 #x73)	; þ
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
    (korean-ksc5601	#x29 #x2D)	; �����
    (japanese-jisx0212	#x29 #x50)	; �����
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
    (latin-iso8859-1		#xFF)	; ÿ
    (latin-iso8859-9		#xFF)	; �����
    (japanese-jisx0213-1	#x29 #x74)	; ÿ
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
    (japanese-jisx0212	#x2B #x73)	; �����
    ))
