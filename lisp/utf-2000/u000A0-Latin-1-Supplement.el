(define-char
  '((name		. "NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (latin-iso8859-1		. #xA0)	;  
    (latin-iso8859-2		. #xA0)	; �����
    (latin-iso8859-3		. #xA0)	; �����
    (latin-iso8859-4		. #xA0)	; �����
    (greek-iso8859-7		. #xA0)	; Ͱ
    (hebrew-iso8859-8		. #xA0)	; ֐
    (cyrillic-iso8859-5		. #xA0)	; �����
    (latin-iso8859-9		. #xA0)	; �����
    (japanese-jisx0213-1	. #x2922)	;  
    (ucs			. #xA0)	;  
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA1)	; ¡
    (latin-iso8859-9		. #xA1)	; �����
    (japanese-jisx0213-1	. #x2923)	; ¡
    (ucs			. #xA1)	; ¡
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)	; ¡
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A1)
    (korean-ksc5601	. #x222E)	; �����
    (japanese-jisx0212	. #x2242)	; �����
    ))
(define-char
  '((name		. "CENT SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xA2)	; ¢
    (hebrew-iso8859-8	. #xA2)	; ֒
    (latin-iso8859-9	. #xA2)	; �����
    (ucs		. #xA2)	; ¢
    ))
(define-char
  '((name		. "POUND SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xA3)	; £
    (latin-iso8859-3	. #xA3)	; �����
    (greek-iso8859-7	. #xA3)	; ͳ
    (hebrew-iso8859-8	. #xA3)	; ֓
    (latin-iso8859-9	. #xA3)	; �����
    (ucs		. #xA3)	; £
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA4)	; ¤
    (latin-iso8859-2		. #xA4)	; �����
    (latin-iso8859-3		. #xA4)	; �����
    (latin-iso8859-4		. #xA4)	; �����
    (hebrew-iso8859-8		. #xA4)	; ֔
    (latin-iso8859-9		. #xA4)	; �����
    (japanese-jisx0213-1	. #x2924)	; ¤
    (ucs			. #xA4)	; ¤
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)	; ¤
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	. #x2168)	; �����
    (korean-ksc5601	. #x2234)	; �����
    (japanese-jisx0212	. #x2270)	; �����
    ))
(define-char
  '((name		. "YEN SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	. #x5C)	; �����
    (latin-iso8859-1	. #xA5)	; ¥
    (hebrew-iso8859-8	. #xA5)	; ֕
    (latin-iso8859-9	. #xA5)	; �����
    (ucs		. #xA5)	; ¥
    ))
(define-char
  '((name		. "BROKEN BAR")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA6)	; ¦
    (greek-iso8859-7		. #xA6)	; Ͷ
    (hebrew-iso8859-8		. #xA6)	; ֖
    (latin-iso8859-9		. #xA6)	; �����
    (japanese-jisx0213-1	. #x2925)	; ¦
    (ucs			. #xA6)	; ¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xA7)	; §
    (latin-iso8859-2	. #xA7)	; �����
    (latin-iso8859-3	. #xA7)	; �����
    (latin-iso8859-4	. #xA7)	; �����
    (greek-iso8859-7	. #xA7)	; ͷ
    (hebrew-iso8859-8	. #xA7)	; ֗
    (cyrillic-iso8859-5 . #xFD)	; �����
    (latin-iso8859-9	. #xA7)	; �����
    (ucs		. #xA7)	; §
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)	; §
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A7)
    (japanese-jisx0208-1978	. #x2178)	; �����
    (chinese-gb2312		. #x216C)	; �����
    (japanese-jisx0208		. #x2178)	; �����
    (korean-ksc5601		. #x2157)	; �����
    (chinese-cns11643-1		. #x2170)	; �����
    (japanese-jisx0208-1990	. #x2178)	; �����
    ))
(define-char
  '((name		. "DIAERESIS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (latin-iso8859-1	. #xA8)	; ¨
    (latin-iso8859-2	. #xA8)	; �����
    (latin-iso8859-3	. #xA8)	; �����
    (latin-iso8859-4	. #xA8)	; �����
    (greek-iso8859-7	. #xA8)	; ͸
    (hebrew-iso8859-8	. #xA8)	; ֘
    (latin-iso8859-9	. #xA8)	; �����
    (ucs		. #xA8)	; ¨
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)	; ¨
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A8)
    (japanese-jisx0208-1978	. #x212F)	; �����
    (chinese-gb2312		. #x2127)	; �����
    (japanese-jisx0208		. #x212F)	; �����
    (korean-ksc5601		. #x2127)	; �����
    (japanese-jisx0208-1990	. #x212F)	; �����
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA9)	; ©
    (greek-iso8859-7		. #xA9)	; ͹
    (hebrew-iso8859-8		. #xA9)	; ֙
    (latin-iso8859-9		. #xA9)	; �����
    (japanese-jisx0213-1	. #x2926)	; ©
    (ucs			. #xA9)	; ©
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)	; ©
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A9)
    (japanese-jisx0212	. #x226D)	; �����
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (latin-iso8859-1		. #xAA)	; ª
    (latin-iso8859-9		. #xAA)	; �����
    (japanese-jisx0213-1	. #x2927)	; ª
    (ucs			. #xAA)	; ª
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)	; ª
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00AA)
    (korean-ksc5601	. #x2823)	; �����
    (japanese-jisx0212	. #x226C)	; �����
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		. #xAB)	; «
    (greek-iso8859-7		. #xAB)	; ͻ
    (hebrew-iso8859-8		. #xAB)	; ֛
    (latin-iso8859-9		. #xAB)	; �����
    (japanese-jisx0213-1	. #x2928)	; «
    (ucs			. #xAB)	; «
    ))
(define-char
  '((name		. "NOT SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xAC)	; ¬
    (greek-iso8859-7	. #xAC)	; ͼ
    (hebrew-iso8859-8	. #xAC)	; ֜
    (latin-iso8859-9	. #xAC)	; �����
    (ucs		. #xAC)	; ¬
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xAD)	; ­
    (latin-iso8859-2		. #xAD)	; �����
    (latin-iso8859-3		. #xAD)	; �����
    (latin-iso8859-4		. #xAD)	; �����
    (greek-iso8859-7		. #xAD)	; ͽ
    (hebrew-iso8859-8		. #xAD)	; ֝
    (cyrillic-iso8859-5		. #xAD)	; �����
    (latin-iso8859-9		. #xAD)	; �����
    (japanese-jisx0213-1	. #x2929)	; ­
    (ucs			. #xAD)	; ­
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)	; ­
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AD)
    (korean-ksc5601	. #x2129)	; �����
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xAE)	; ®
    (hebrew-iso8859-8		. #xAE)	; ֞
    (latin-iso8859-9		. #xAE)	; �����
    (japanese-jisx0213-1	. #x292A)	; ®
    (ucs			. #xAE)	; ®
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)	; ®
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AE)
    (japanese-jisx0212	. #x226E)	; �����
    ))
(define-char
  '((name		. "MACRON")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (latin-iso8859-1		. #xAF)	; ¯
    (latin-iso8859-4		. #xAF)	; �����
    (latin-iso8859-9		. #xAF)	; �����
    (japanese-jisx0213-1	. #x292B)	; ¯
    (ucs			. #xAF)	; ¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xB0)	; °
    (latin-iso8859-2	. #xB0)	; �����
    (latin-iso8859-3	. #xB0)	; �����
    (latin-iso8859-4	. #xB0)	; �����
    (greek-iso8859-7	. #xB0)	; ΀
    (hebrew-iso8859-8	. #xB0)	; ֠
    (latin-iso8859-9	. #xB0)	; �����
    (ucs		. #xB0)	; °
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)	; °
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B0)
    (japanese-jisx0208-1978	. #x216B)	; �����
    (chinese-gb2312		. #x2163)	; �����
    (japanese-jisx0208		. #x216B)	; �����
    (korean-ksc5601		. #x2146)	; �����
    (chinese-cns11643-1		. #x2278)	; �����
    (japanese-jisx0208-1990	. #x216B)	; �����
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xB1)	; ±
    (greek-iso8859-7	. #xB1)	; ΁
    (hebrew-iso8859-8	. #xB1)	; ֡
    (latin-iso8859-9	. #xB1)	; �����
    (ucs		. #xB1)	; ±
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)	; ±
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B1)
    (japanese-jisx0208-1978	. #x215E)	; �����
    (chinese-gb2312		. #x2140)	; �����
    (japanese-jisx0208		. #x215E)	; �����
    (korean-ksc5601		. #x213E)	; �����
    (chinese-cns11643-1		. #x2234)	; �����
    (japanese-jisx0208-1990	. #x215E)	; �����
    ))
(define-char
  '((name		. "SUPERSCRIPT TWO")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->decomposition	super #x0032)
    (latin-iso8859-1		. #xB2)	; ²
    (latin-iso8859-3		. #xB2)	; �����
    (greek-iso8859-7		. #xB2)	; ΂
    (hebrew-iso8859-8		. #xB2)	; ֢
    (latin-iso8859-9		. #xB2)	; �����
    (japanese-jisx0213-1	. #x292C)	; ²
    (ucs			. #xB2)	; ²
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT TWO")
    (->ucs		. #x00B2)	; ²
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->decomposition	wide #x00B2)
    (korean-ksc5601	. #x2977)	; �����
    ))
(define-char
  '((name		. "SUPERSCRIPT THREE")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->decomposition	super #x0033)
    (latin-iso8859-1		. #xB3)	; ³
    (latin-iso8859-3		. #xB3)	; �����
    (greek-iso8859-7		. #xB3)	; ΃
    (hebrew-iso8859-8		. #xB3)	; ֣
    (latin-iso8859-9		. #xB3)	; �����
    (japanese-jisx0213-1	. #x292D)	; ³
    (ucs			. #xB3)	; ³
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT THREE")
    (->ucs		. #x00B3)	; ³
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->decomposition	wide #x00B3)
    (korean-ksc5601	. #x2978)	; �����
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (latin-iso8859-1	. #xB4)	; ´
    (latin-iso8859-2	. #xB4)	; �����
    (latin-iso8859-3	. #xB4)	; �����
    (latin-iso8859-4	. #xB4)	; �����
    (hebrew-iso8859-8	. #xB4)	; ֤
    (latin-iso8859-9	. #xB4)	; �����
    (ucs		. #xB4)	; ´
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)	; ´
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B4)
    (japanese-jisx0208-1978	. #x212D)	; �����
    (japanese-jisx0208		. #x212D)	; �����
    (korean-ksc5601		. #x2225)	; �����
    (japanese-jisx0208-1990	. #x212D)	; �����
    ))
(define-char
  '((name		. "MICRO SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BC)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (latin-iso8859-1	. #xB5)	; µ
    (latin-iso8859-3	. #xB5)	; �����
    (hebrew-iso8859-8	. #xB5)	; ֥
    (latin-iso8859-9	. #xB5)	; �����
    (ucs		. #xB5)	; µ
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xB6)	; ¶
    (hebrew-iso8859-8	. #xB6)	; ֦
    (latin-iso8859-9	. #xB6)	; �����
    (ucs		. #xB6)	; ¶
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)	; ¶
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B6)
    (japanese-jisx0208		. #x2279)	; �����
    (korean-ksc5601		. #x2252)	; �����
    (japanese-jisx0208-1990	. #x2279)	; �����
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xB7)	; ·
    (latin-iso8859-3		. #xB7)	; �����
    (greek-iso8859-7		. #xB7)	; ·
    (hebrew-iso8859-8		. #xB7)	; ֧
    (latin-iso8859-9		. #xB7)	; �����
    (japanese-jisx0213-1	. #x292E)	; ·
    (ucs			. #xB7)	; ·
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)	; ·
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B7)
    (korean-ksc5601	. #x2124)	; �����
    (chinese-cns11643-1 . #x2126)	; �����
    ))
(define-char
  '((name		. "CEDILLA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (latin-iso8859-1		. #xB8)	; ¸
    (latin-iso8859-2		. #xB8)	; �����
    (latin-iso8859-3		. #xB8)	; �����
    (latin-iso8859-4		. #xB8)	; �����
    (hebrew-iso8859-8		. #xB8)	; ֨
    (latin-iso8859-9		. #xB8)	; �����
    (japanese-jisx0213-1	. #x292F)	; ¸
    (ucs			. #xB8)	; ¸
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)	; ¸
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B8)
    (korean-ksc5601	. #x222C)	; �����
    (japanese-jisx0212	. #x2231)	; �����
    ))
(define-char
  '((name		. "SUPERSCRIPT ONE")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->decomposition	super #x0031)
    (latin-iso8859-1		. #xB9)	; ¹
    (hebrew-iso8859-8		. #xB9)	; ֩
    (latin-iso8859-9		. #xB9)	; �����
    (japanese-jisx0213-1	. #x2930)	; ¹
    (ucs			. #xB9)	; ¹
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT ONE")
    (->ucs		. #x00B9)	; ¹
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->decomposition	wide #x00B9)
    (korean-ksc5601	. #x2976)	; �����
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (latin-iso8859-1		. #xBA)	; º
    (latin-iso8859-9		. #xBA)	; �����
    (japanese-jisx0213-1	. #x2931)	; º
    (ucs			. #xBA)	; º
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)	; º
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00BA)
    (korean-ksc5601	. #x282C)	; �����
    (japanese-jisx0212	. #x226B)	; �����
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		. #xBB)	; »
    (greek-iso8859-7		. #xBB)	; ΋
    (hebrew-iso8859-8		. #xBB)	; ֫
    (latin-iso8859-9		. #xBB)	; �����
    (japanese-jisx0213-1	. #x2932)	; »
    (ucs			. #xBB)	; »
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (latin-iso8859-1		. #xBC)	; ¼
    (hebrew-iso8859-8		. #xBC)	; ֬
    (latin-iso8859-9		. #xBC)	; �����
    (japanese-jisx0213-1	. #x2933)	; ¼
    (ucs			. #xBC)	; ¼
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)	; ¼
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	wide #x00BC)
    (korean-ksc5601	. #x2879)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (latin-iso8859-1		. #xBD)	; ½
    (latin-iso8859-3		. #xBD)	; �����
    (greek-iso8859-7		. #xBD)	; ΍
    (hebrew-iso8859-8		. #xBD)	; ֭
    (latin-iso8859-9		. #xBD)	; �����
    (japanese-jisx0213-1	. #x2934)	; ½
    (ucs			. #xBD)	; ½
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)	; ½
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	wide #x00BD)
    (korean-ksc5601	. #x2876)	; �����
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (latin-iso8859-1		. #xBE)	; ¾
    (hebrew-iso8859-8		. #xBE)	; ֮
    (latin-iso8859-9		. #xBE)	; �����
    (japanese-jisx0213-1	. #x2935)	; ¾
    (ucs			. #xBE)	; ¾
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)	; ¾
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	wide #x00BE)
    (korean-ksc5601	. #x287A)	; �����
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xBF)	; ¿
    (latin-iso8859-9		. #xBF)	; �����
    (japanese-jisx0213-1	. #x2936)	; ¿
    (ucs			. #xBF)	; ¿
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)	; ¿
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BF)
    (korean-ksc5601	. #x222F)	; �����
    (japanese-jisx0212	. #x2244)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->lowercase	#x00E0)
    (latin-iso8859-1		. #xC0)	; À
    (latin-iso8859-3		. #xC0)	; �����
    (latin-iso8859-9		. #xC0)	; �����
    (latin-viscii-upper		. #xE0)	; À
    (latin-viscii		. #xC0)	; À
    (japanese-jisx0213-1	. #x2937)	; À
    (ucs			. #xC0)	; À
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")
    (->ucs		. #x00C0)	; À
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C0)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")))
    (japanese-jisx0212	. #x2A22)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->lowercase	#x00E1)
    (latin-iso8859-1		. #xC1)	; Á
    (latin-iso8859-2		. #xC1)	; �����
    (latin-iso8859-3		. #xC1)	; �����
    (latin-iso8859-4		. #xC1)	; �����
    (latin-iso8859-9		. #xC1)	; �����
    (latin-viscii-upper		. #xE1)	; Á
    (latin-viscii		. #xC1)	; Á
    (japanese-jisx0213-1	. #x2938)	; Á
    (ucs			. #xC1)	; Á
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")
    (->ucs		. #x00C1)	; Á
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C1)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")))
    (japanese-jisx0212	. #x2A21)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->lowercase	#x00E2)
    (latin-iso8859-1		. #xC2)	; Â
    (latin-iso8859-2		. #xC2)	; �����
    (latin-iso8859-3		. #xC2)	; �����
    (latin-iso8859-4		. #xC2)	; �����
    (latin-iso8859-9		. #xC2)	; �����
    (latin-viscii-upper		. #xE2)	; Â
    (latin-viscii		. #xC2)	; Â
    (japanese-jisx0213-1	. #x2939)	; Â
    (ucs			. #xC2)	; Â
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00C2)	; Â
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C2)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A24)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->lowercase	#x00E3)
    (latin-iso8859-1		. #xC3)	; Ã
    (latin-iso8859-4		. #xC3)	; �����
    (latin-iso8859-9		. #xC3)	; �����
    (latin-viscii-upper		. #xE3)	; Ã
    (latin-viscii		. #xC3)	; Ã
    (japanese-jisx0213-1	. #x293A)	; Ã
    (ucs			. #xC3)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")
    (->ucs		. #x00C3)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C3)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")))
    (japanese-jisx0212	. #x2A2A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->lowercase	#x00E4)
    (latin-iso8859-1		. #xC4)	; Ä
    (latin-iso8859-2		. #xC4)	; �����
    (latin-iso8859-3		. #xC4)	; �����
    (latin-iso8859-4		. #xC4)	; �����
    (latin-iso8859-9		. #xC4)	; �����
    (japanese-jisx0213-1	. #x293B)	; Ä
    (ucs			. #xC4)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")
    (->ucs		. #x00C4)	; Ä
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C4)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A23)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->lowercase	#x00E5)
    (latin-iso8859-1		. #xC5)	; Å
    (latin-iso8859-4		. #xC5)	; �����
    (latin-iso8859-9		. #xC5)	; �����
    (japanese-jisx0213-1	. #x293C)	; Å
    (ucs			. #xC5)	; Å
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")
    (->ucs		. #x00C5)	; Å
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C5)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	. #x2A29)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase	#x00E6)
    (latin-iso8859-1		. #xC6)	; Æ
    (latin-iso8859-4		. #xC6)	; �����
    (latin-iso8859-9		. #xC6)	; �����
    (japanese-jisx0213-1	. #x293D)	; Æ
    (ucs			. #xC6)	; Æ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)	; Æ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	. #x2821)	; �����
    (japanese-jisx0212	. #x2921)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->lowercase	#x00E7)
    (latin-iso8859-1		. #xC7)	; Ç
    (latin-iso8859-2		. #xC7)	; �����
    (latin-iso8859-3		. #xC7)	; �����
    (latin-iso8859-9		. #xC7)	; �����
    (japanese-jisx0213-1	. #x293E)	; Ç
    (ucs			. #xC7)	; Ç
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")
    (->ucs		. #x00C7)	; Ç
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C7)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	. #x2A2E)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->lowercase	#x00E8)
    (latin-iso8859-1		. #xC8)	; È
    (latin-iso8859-3		. #xC8)	; �����
    (latin-iso8859-9		. #xC8)	; �����
    (latin-viscii-upper		. #xE8)	; È
    (latin-viscii		. #xC8)	; È
    (japanese-jisx0213-1	. #x293F)	; È
    (ucs			. #xC8)	; È
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")
    (->ucs		. #x00C8)	; È
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C8)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")))
    (japanese-jisx0212	. #x2A32)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->lowercase	#x00E9)
    (latin-iso8859-1		. #xC9)	; É
    (latin-iso8859-2		. #xC9)	; �����
    (latin-iso8859-3		. #xC9)	; �����
    (latin-iso8859-4		. #xC9)	; �����
    (latin-iso8859-9		. #xC9)	; �����
    (latin-viscii-upper		. #xE9)	; É
    (latin-viscii		. #xC9)	; É
    (japanese-jisx0213-1	. #x2940)	; É
    (ucs			. #xC9)	; É
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")
    (->ucs		. #x00C9)	; É
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C9)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")))
    (japanese-jisx0212	. #x2A31)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->lowercase	#x00EA)
    (latin-iso8859-1		. #xCA)	; Ê
    (latin-iso8859-3		. #xCA)	; �����
    (latin-iso8859-9		. #xCA)	; �����
    (latin-viscii-upper		. #xEA)	; Ê
    (latin-viscii		. #xCA)	; Ê
    (japanese-jisx0213-1	. #x2941)	; Ê
    (ucs			. #xCA)	; Ê
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00CA)	; Ê
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CA)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A34)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->lowercase	#x00EB)
    (latin-iso8859-1		. #xCB)	; Ë
    (latin-iso8859-2		. #xCB)	; �����
    (latin-iso8859-3		. #xCB)	; �����
    (latin-iso8859-4		. #xCB)	; �����
    (latin-iso8859-9		. #xCB)	; �����
    (japanese-jisx0213-1	. #x2942)	; Ë
    (ucs			. #xCB)	; Ë
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")
    (->ucs		. #x00CB)	; Ë
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CB)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A33)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->lowercase	#x00EC)
    (latin-iso8859-1		. #xCC)	; Ì
    (latin-iso8859-3		. #xCC)	; �����
    (latin-iso8859-9		. #xCC)	; �����
    (latin-viscii-upper		. #xEC)	; Ì
    (latin-viscii		. #xCC)	; Ì
    (japanese-jisx0213-1	. #x2943)	; Ì
    (ucs			. #xCC)	; Ì
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")
    (->ucs		. #x00CC)	; Ì
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CC)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")))
    (japanese-jisx0212	. #x2A40)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->lowercase	#x00ED)
    (latin-iso8859-1		. #xCD)	; Í
    (latin-iso8859-2		. #xCD)	; �����
    (latin-iso8859-3		. #xCD)	; �����
    (latin-iso8859-4		. #xCD)	; �����
    (latin-iso8859-9		. #xCD)	; �����
    (latin-viscii-upper		. #xED)	; Í
    (latin-viscii		. #xCD)	; Í
    (japanese-jisx0213-1	. #x2944)	; Í
    (ucs			. #xCD)	; Í
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")
    (->ucs		. #x00CD)	; Í
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CD)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")))
    (japanese-jisx0212	. #x2A3F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->lowercase	#x00EE)
    (latin-iso8859-1		. #xCE)	; Î
    (latin-iso8859-2		. #xCE)	; �����
    (latin-iso8859-3		. #xCE)	; �����
    (latin-iso8859-4		. #xCE)	; �����
    (latin-iso8859-9		. #xCE)	; �����
    (japanese-jisx0213-1	. #x2945)	; Î
    (ucs			. #xCE)	; Î
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00CE)	; Î
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CE)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A42)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->lowercase	#x00EF)
    (latin-iso8859-1		. #xCF)	; Ï
    (latin-iso8859-3		. #xCF)	; �����
    (latin-iso8859-9		. #xCF)	; �����
    (japanese-jisx0213-1	. #x2946)	; Ï
    (ucs			. #xCF)	; Ï
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")
    (->ucs		. #x00CF)	; Ï
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CF)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A41)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00F0)
    (latin-iso8859-1		. #xD0)	; Ð
    (japanese-jisx0213-1	. #x2947)	; Ð
    (ucs			. #xD0)	; Ð
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER ETH")
    (->ucs		. #x00D0)	; Ð
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00D0)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER ETH")))
    (korean-ksc5601	. #x2822)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->lowercase	#x00F1)
    (latin-iso8859-1		. #xD1)	; Ñ
    (latin-iso8859-3		. #xD1)	; �����
    (latin-iso8859-9		. #xD1)	; �����
    (japanese-jisx0213-1	. #x2948)	; Ñ
    (ucs			. #xD1)	; Ñ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")
    (->ucs		. #x00D1)	; Ñ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D1)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")))
    (japanese-jisx0212	. #x2A50)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->lowercase	#x00F2)
    (latin-iso8859-1		. #xD2)	; Ò
    (latin-iso8859-3		. #xD2)	; �����
    (latin-iso8859-9		. #xD2)	; �����
    (latin-viscii-upper		. #xF2)	; Ò
    (latin-viscii		. #xD2)	; Ò
    (japanese-jisx0213-1	. #x2949)	; Ò
    (ucs			. #xD2)	; Ò
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH GRAVE")
    (->ucs		. #x00D2)	; Ò
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D2)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (japanese-jisx0212	. #x2A52)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->lowercase	#x00F3)
    (latin-iso8859-1		. #xD3)	; Ó
    (latin-iso8859-2		. #xD3)	; �����
    (latin-iso8859-3		. #xD3)	; �����
    (latin-iso8859-9		. #xD3)	; �����
    (latin-viscii-upper		. #xF3)	; Ó
    (latin-viscii		. #xD3)	; Ó
    (japanese-jisx0213-1	. #x294A)	; Ó
    (ucs			. #xD3)	; Ó
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")
    (->ucs		. #x00D3)	; Ó
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D3)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")))
    (japanese-jisx0212	. #x2A51)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->lowercase	#x00F4)
    (latin-iso8859-1		. #xD4)	; Ô
    (latin-iso8859-2		. #xD4)	; �����
    (latin-iso8859-3		. #xD4)	; �����
    (latin-iso8859-4		. #xD4)	; �����
    (latin-iso8859-9		. #xD4)	; �����
    (latin-viscii-upper		. #xF4)	; Ô
    (latin-viscii		. #xD4)	; Ô
    (japanese-jisx0213-1	. #x294B)	; Ô
    (ucs			. #xD4)	; Ô
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00D4)	; Ô
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D4)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A54)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->lowercase	#x00F5)
    (latin-iso8859-1		. #xD5)	; Õ
    (latin-iso8859-4		. #xD5)	; �����
    (latin-iso8859-9		. #xD5)	; �����
    (latin-viscii-upper		. #xF5)	; Õ
    (latin-viscii		. #xA0)	; Õ
    (japanese-jisx0213-1	. #x294C)	; Õ
    (ucs			. #xD5)	; Õ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")
    (->ucs		. #x00D5)	; Õ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D5)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	. #x2A58)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->lowercase	#x00F6)
    (latin-iso8859-1		. #xD6)	; Ö
    (latin-iso8859-2		. #xD6)	; �����
    (latin-iso8859-3		. #xD6)	; �����
    (latin-iso8859-4		. #xD6)	; �����
    (latin-iso8859-9		. #xD6)	; �����
    (japanese-jisx0213-1	. #x294D)	; Ö
    (ucs			. #xD6)	; Ö
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")
    (->ucs		. #x00D6)	; Ö
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D6)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A53)	; �����
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xD7)	; ×
    (latin-iso8859-2	. #xD7)	; �����
    (latin-iso8859-3	. #xD7)	; �����
    (latin-iso8859-4	. #xD7)	; �����
    (hebrew-iso8859-8	. #xAA)	; ֚
    (latin-iso8859-9	. #xD7)	; �����
    (ucs		. #xD7)	; ×
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)	; ×
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00D7)
    (japanese-jisx0208-1978	. #x215F)	; �����
    (chinese-gb2312		. #x2141)	; �����
    (japanese-jisx0208		. #x215F)	; �����
    (korean-ksc5601		. #x213F)	; �����
    (chinese-cns11643-1		. #x2232)	; �����
    (japanese-jisx0208-1990	. #x215F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1		. #xD8)	; Ø
    (latin-iso8859-4		. #xD8)	; �����
    (latin-iso8859-9		. #xD8)	; �����
    (japanese-jisx0213-1	. #x294E)	; Ø
    (ucs			. #xD8)	; Ø
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)	; Ø
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	. #x282A)	; �����
    (japanese-jisx0212	. #x292C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase	#x00F9)
    (latin-iso8859-1		. #xD9)	; Ù
    (latin-iso8859-3		. #xD9)	; �����
    (latin-iso8859-9		. #xD9)	; �����
    (latin-viscii-upper		. #xF9)	; Ù
    (latin-viscii		. #xD9)	; Ù
    (japanese-jisx0213-1	. #x294F)	; Ù
    (ucs			. #xD9)	; Ù
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")
    (->ucs		. #x00D9)	; Ù
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")))
    (japanese-jisx0212	. #x2A63)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->lowercase	#x00FA)
    (latin-iso8859-1		. #xDA)	; Ú
    (latin-iso8859-2		. #xDA)	; �����
    (latin-iso8859-3		. #xDA)	; �����
    (latin-iso8859-4		. #xDA)	; �����
    (latin-iso8859-9		. #xDA)	; �����
    (latin-viscii-upper		. #xFA)	; Ú
    (latin-viscii		. #xDA)	; Ú
    (japanese-jisx0213-1	. #x2950)	; Ú
    (ucs			. #xDA)	; Ú
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")
    (->ucs		. #x00DA)	; Ú
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DA)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")))
    (japanese-jisx0212	. #x2A62)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->lowercase	#x00FB)
    (latin-iso8859-1		. #xDB)	; Û
    (latin-iso8859-3		. #xDB)	; �����
    (latin-iso8859-4		. #xDB)	; �����
    (latin-iso8859-9		. #xDB)	; �����
    (japanese-jisx0213-1	. #x2951)	; Û
    (ucs			. #xDB)	; Û
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00DB)	; Û
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DB)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A65)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->lowercase	#x00FC)
    (latin-iso8859-1		. #xDC)	; Ü
    (latin-iso8859-2		. #xDC)	; �����
    (latin-iso8859-3		. #xDC)	; �����
    (latin-iso8859-4		. #xDC)	; �����
    (latin-iso8859-9		. #xDC)	; �����
    (japanese-jisx0213-1	. #x2952)	; Ü
    (ucs			. #xDC)	; Ü
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")
    (->ucs		. #x00DC)	; Ü
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DC)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A64)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->lowercase	#x00FD)
    (latin-iso8859-1		. #xDD)	; Ý
    (latin-iso8859-2		. #xDD)	; �����
    (latin-viscii-upper		. #xFD)	; Ý
    (latin-viscii		. #xDD)	; Ý
    (japanese-jisx0213-1	. #x2953)	; Ý
    (ucs			. #xDD)	; Ý
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH ACUTE")
    (->ucs		. #x00DD)	; Ý
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DD)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	. #x2A72)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00FE)
    (latin-iso8859-1		. #xDE)	; Þ
    (japanese-jisx0213-1	. #x2954)	; Þ
    (ucs			. #xDE)	; Þ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER THORN")
    (->ucs		. #x00DE)	; Þ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00DE)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER THORN")))
    (korean-ksc5601	. #x282D)	; �����
    (japanese-jisx0212	. #x2930)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1		. #xDF)	; ß
    (latin-iso8859-2		. #xDF)	; �����
    (latin-iso8859-3		. #xDF)	; �����
    (latin-iso8859-4		. #xDF)	; �����
    (latin-iso8859-9		. #xDF)	; �����
    (japanese-jisx0213-1	. #x2955)	; ß
    (ucs			. #xDF)	; ß
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)	; ß
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->decomposition	wide #x00DF)
    (korean-ksc5601	. #x292C)	; �����
    (japanese-jisx0212	. #x294E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0300)
    (->uppercase	#x00C0)
    (->titlecase	#x00C0)
    (latin-iso8859-1		. #xE0)	; à
    (latin-iso8859-3		. #xE0)	; �����
    (latin-iso8859-9		. #xE0)	; �����
    (latin-viscii-lower		. #xE0)	; à
    (latin-viscii		. #xE0)	; à
    (japanese-jisx0213-1	. #x2956)	; à
    (ucs			. #xE0)	; à
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")
    (->ucs		. #x00E0)	; à
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E0)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (chinese-gb2312	. #x2824)	; �����
    (japanese-jisx0212	. #x2B22)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0301)
    (->uppercase	#x00C1)
    (->titlecase	#x00C1)
    (latin-iso8859-1		. #xE1)	; á
    (latin-iso8859-2		. #xE1)	; �����
    (latin-iso8859-3		. #xE1)	; �����
    (latin-iso8859-4		. #xE1)	; �����
    (latin-iso8859-9		. #xE1)	; �����
    (latin-viscii-lower		. #xE1)	; á
    (latin-viscii		. #xE1)	; á
    (japanese-jisx0213-1	. #x2957)	; á
    (ucs			. #xE1)	; á
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")
    (->ucs		. #x00E1)	; á
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E1)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (chinese-gb2312	. #x2822)	; �����
    (japanese-jisx0212	. #x2B21)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0302)
    (->uppercase	#x00C2)
    (->titlecase	#x00C2)
    (latin-iso8859-1		. #xE2)	; â
    (latin-iso8859-2		. #xE2)	; �����
    (latin-iso8859-3		. #xE2)	; �����
    (latin-iso8859-4		. #xE2)	; �����
    (latin-iso8859-9		. #xE2)	; �����
    (latin-viscii-lower		. #xE2)	; â
    (latin-viscii		. #xE2)	; â
    (japanese-jisx0213-1	. #x2958)	; â
    (ucs			. #xE2)	; â
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00E2)	; â
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E2)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B24)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0303)
    (->uppercase	#x00C3)
    (->titlecase	#x00C3)
    (latin-iso8859-1		. #xE3)	; ã
    (latin-iso8859-4		. #xE3)	; �����
    (latin-iso8859-9		. #xE3)	; �����
    (latin-viscii-lower		. #xE3)	; ã
    (latin-viscii		. #xE3)	; ã
    (japanese-jisx0213-1	. #x2959)	; ã
    (ucs			. #xE3)	; ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")
    (->ucs		. #x00E3)	; ã
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E3)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (japanese-jisx0212	. #x2B2A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0308)
    (->uppercase	#x00C4)
    (->titlecase	#x00C4)
    (latin-iso8859-1		. #xE4)	; ä
    (latin-iso8859-2		. #xE4)	; �����
    (latin-iso8859-3		. #xE4)	; �����
    (latin-iso8859-4		. #xE4)	; �����
    (latin-iso8859-9		. #xE4)	; �����
    (japanese-jisx0213-1	. #x295A)	; ä
    (ucs			. #xE4)	; ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")
    (->ucs		. #x00E4)	; ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E4)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B23)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x030A)
    (->uppercase	#x00C5)
    (->titlecase	#x00C5)
    (latin-iso8859-1		. #xE5)	; å
    (latin-iso8859-4		. #xE5)	; �����
    (latin-iso8859-9		. #xE5)	; �����
    (japanese-jisx0213-1	. #x295B)	; å
    (ucs			. #xE5)	; å
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")
    (->ucs		. #x00E5)	; å
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E5)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	. #x2B29)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER AE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->uppercase	#x00C6)
    (->titlecase	#x00C6)
    (latin-iso8859-1		. #xE6)	; æ
    (latin-iso8859-4		. #xE6)	; �����
    (latin-iso8859-9		. #xE6)	; �����
    (ipa			. #xA4)	; �����
    (japanese-jisx0213-1	. #x295C)	; æ
    (ucs			. #xE6)	; æ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER AE")
    (->ucs		. #x00E6)	; æ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->decomposition	wide #x00E6)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (korean-ksc5601	. #x2921)	; �����
    (japanese-jisx0212	. #x2941)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0327)
    (->uppercase	#x00C7)
    (->titlecase	#x00C7)
    (latin-iso8859-1		. #xE7)	; ç
    (latin-iso8859-2		. #xE7)	; �����
    (latin-iso8859-3		. #xE7)	; �����
    (latin-iso8859-9		. #xE7)	; �����
    (ipa			. #xCE)	; �����
    (japanese-jisx0213-1	. #x295D)	; ç
    (ucs			. #xE7)	; ç
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")
    (->ucs		. #x00E7)	; ç
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E7)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	. #x2B2E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0300)
    (->uppercase	#x00C8)
    (->titlecase	#x00C8)
    (latin-iso8859-1		. #xE8)	; è
    (latin-iso8859-3		. #xE8)	; �����
    (latin-iso8859-9		. #xE8)	; �����
    (latin-viscii-lower		. #xE8)	; è
    (latin-viscii		. #xE8)	; è
    (japanese-jisx0213-1	. #x295E)	; è
    (ucs			. #xE8)	; è
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")
    (->ucs		. #x00E8)	; è
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E8)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (chinese-gb2312	. #x2828)	; �����
    (japanese-jisx0212	. #x2B32)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0301)
    (->uppercase	#x00C9)
    (->titlecase	#x00C9)
    (latin-iso8859-1		. #xE9)	; é
    (latin-iso8859-2		. #xE9)	; �����
    (latin-iso8859-3		. #xE9)	; �����
    (latin-iso8859-4		. #xE9)	; �����
    (latin-iso8859-9		. #xE9)	; �����
    (latin-viscii-lower		. #xE9)	; é
    (latin-viscii		. #xE9)	; é
    (japanese-jisx0213-1	. #x295F)	; é
    (ucs			. #xE9)	; é
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")
    (->ucs		. #x00E9)	; é
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E9)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (chinese-gb2312	. #x2826)	; �����
    (japanese-jisx0212	. #x2B31)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0302)
    (->uppercase	#x00CA)
    (->titlecase	#x00CA)
    (latin-iso8859-1		. #xEA)	; ê
    (latin-iso8859-3		. #xEA)	; �����
    (latin-iso8859-9		. #xEA)	; �����
    (latin-viscii-lower		. #xEA)	; ê
    (latin-viscii		. #xEA)	; ê
    (japanese-jisx0213-1	. #x2960)	; ê
    (ucs			. #xEA)	; ê
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00EA)	; ê
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EA)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (chinese-gb2312	. #x283A)	; �����
    (japanese-jisx0212	. #x2B34)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0308)
    (->uppercase	#x00CB)
    (->titlecase	#x00CB)
    (latin-iso8859-1		. #xEB)	; ë
    (latin-iso8859-2		. #xEB)	; �����
    (latin-iso8859-3		. #xEB)	; �����
    (latin-iso8859-4		. #xEB)	; �����
    (latin-iso8859-9		. #xEB)	; �����
    (japanese-jisx0213-1	. #x2961)	; ë
    (ucs			. #xEB)	; ë
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")
    (->ucs		. #x00EB)	; ë
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EB)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B33)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0300)
    (->uppercase	#x00CC)
    (->titlecase	#x00CC)
    (latin-iso8859-1		. #xEC)	; ì
    (latin-iso8859-3		. #xEC)	; �����
    (latin-iso8859-9		. #xEC)	; �����
    (latin-viscii-lower		. #xEC)	; ì
    (latin-viscii		. #xEC)	; ì
    (japanese-jisx0213-1	. #x2962)	; ì
    (ucs			. #xEC)	; ì
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")
    (->ucs		. #x00EC)	; ì
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EC)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (chinese-gb2312	. #x282C)	; �����
    (japanese-jisx0212	. #x2B40)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0301)
    (->uppercase	#x00CD)
    (->titlecase	#x00CD)
    (latin-iso8859-1		. #xED)	; í
    (latin-iso8859-2		. #xED)	; �����
    (latin-iso8859-3		. #xED)	; �����
    (latin-iso8859-4		. #xED)	; �����
    (latin-iso8859-9		. #xED)	; �����
    (latin-viscii-lower		. #xED)	; í
    (latin-viscii		. #xED)	; í
    (japanese-jisx0213-1	. #x2963)	; í
    (ucs			. #xED)	; í
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")
    (->ucs		. #x00ED)	; í
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00ED)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (chinese-gb2312	. #x282A)	; �����
    (japanese-jisx0212	. #x2B3F)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0302)
    (->uppercase	#x00CE)
    (->titlecase	#x00CE)
    (latin-iso8859-1		. #xEE)	; î
    (latin-iso8859-2		. #xEE)	; �����
    (latin-iso8859-3		. #xEE)	; �����
    (latin-iso8859-4		. #xEE)	; �����
    (latin-iso8859-9		. #xEE)	; �����
    (japanese-jisx0213-1	. #x2964)	; î
    (ucs			. #xEE)	; î
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00EE)	; î
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EE)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B42)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase	#x00CF)
    (->titlecase	#x00CF)
    (latin-iso8859-1		. #xEF)	; ï
    (latin-iso8859-3		. #xEF)	; �����
    (latin-iso8859-9		. #xEF)	; �����
    (japanese-jisx0213-1	. #x2965)	; ï
    (ucs			. #xEF)	; ï
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")
    (->ucs		. #x00EF)	; ï
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B41)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ETH")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase	#x00D0)
    (->titlecase	#x00D0)
    (latin-iso8859-1		. #xF0)	; ð
    (ipa			. #xC9)	; �����
    (japanese-jisx0213-1	. #x2966)	; ð
    (ucs			. #xF0)	; ð
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER ETH")
    (->ucs		. #x00F0)	; ð
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (korean-ksc5601	. #x2923)	; �����
    (japanese-jisx0212	. #x2943)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0303)
    (->uppercase	#x00D1)
    (->titlecase	#x00D1)
    (latin-iso8859-1		. #xF1)	; ñ
    (latin-iso8859-3		. #xF1)	; �����
    (latin-iso8859-9		. #xF1)	; �����
    (japanese-jisx0213-1	. #x2967)	; ñ
    (ucs			. #xF1)	; ñ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")
    (->ucs		. #x00F1)	; ñ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F1)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (japanese-jisx0212	. #x2B50)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0300)
    (->uppercase	#x00D2)
    (->titlecase	#x00D2)
    (latin-iso8859-1		. #xF2)	; ò
    (latin-iso8859-3		. #xF2)	; �����
    (latin-iso8859-9		. #xF2)	; �����
    (latin-viscii-lower		. #xF2)	; ò
    (latin-viscii		. #xF2)	; ò
    (japanese-jisx0213-1	. #x2968)	; ò
    (ucs			. #xF2)	; ò
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")
    (->ucs		. #x00F2)	; ò
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F2)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (chinese-gb2312	. #x2830)	; �����
    (japanese-jisx0212	. #x2B52)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0301)
    (->uppercase	#x00D3)
    (->titlecase	#x00D3)
    (latin-iso8859-1		. #xF3)	; ó
    (latin-iso8859-2		. #xF3)	; �����
    (latin-iso8859-3		. #xF3)	; �����
    (latin-iso8859-9		. #xF3)	; �����
    (latin-viscii-lower		. #xF3)	; ó
    (latin-viscii		. #xF3)	; ó
    (japanese-jisx0213-1	. #x2969)	; ó
    (ucs			. #xF3)	; ó
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")
    (->ucs		. #x00F3)	; ó
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F3)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (chinese-gb2312	. #x282E)	; �����
    (japanese-jisx0212	. #x2B51)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0302)
    (->uppercase	#x00D4)
    (->titlecase	#x00D4)
    (latin-iso8859-1		. #xF4)	; ô
    (latin-iso8859-2		. #xF4)	; �����
    (latin-iso8859-3		. #xF4)	; �����
    (latin-iso8859-4		. #xF4)	; �����
    (latin-iso8859-9		. #xF4)	; �����
    (latin-viscii-lower		. #xF4)	; ô
    (latin-viscii		. #xF4)	; ô
    (japanese-jisx0213-1	. #x296A)	; ô
    (ucs			. #xF4)	; ô
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00F4)	; ô
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F4)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B54)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0303)
    (->uppercase	#x00D5)
    (->titlecase	#x00D5)
    (latin-iso8859-1		. #xF5)	; õ
    (latin-iso8859-4		. #xF5)	; �����
    (latin-iso8859-9		. #xF5)	; �����
    (latin-viscii-lower		. #xF5)	; õ
    (latin-viscii		. #xF5)	; õ
    (japanese-jisx0213-1	. #x296B)	; õ
    (ucs			. #xF5)	; õ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH TILDE")
    (->ucs		. #x00F5)	; õ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F5)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	. #x2B58)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0308)
    (->uppercase	#x00D6)
    (->titlecase	#x00D6)
    (latin-iso8859-1		. #xF6)	; ö
    (latin-iso8859-2		. #xF6)	; �����
    (latin-iso8859-3		. #xF6)	; �����
    (latin-iso8859-4		. #xF6)	; �����
    (latin-iso8859-9		. #xF6)	; �����
    (japanese-jisx0213-1	. #x296C)	; ö
    (ucs			. #xF6)	; ö
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH DIAERESIS")
    (->ucs		. #x00F6)	; ö
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F6)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B53)	; �����
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xF7)	; ÷
    (latin-iso8859-2	. #xF7)	; �����
    (latin-iso8859-3	. #xF7)	; �����
    (latin-iso8859-4	. #xF7)	; �����
    (hebrew-iso8859-8	. #xBA)	; ֪
    (latin-iso8859-9	. #xF7)	; �����
    (ucs		. #xF7)	; ÷
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)	; ÷
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00F7)
    (japanese-jisx0208-1978	. #x2160)	; �����
    (chinese-gb2312		. #x2142)	; �����
    (japanese-jisx0208		. #x2160)	; �����
    (korean-ksc5601		. #x2140)	; �����
    (chinese-cns11643-1		. #x2233)	; �����
    (japanese-jisx0208-1990	. #x2160)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1		. #xF8)	; ø
    (latin-iso8859-4		. #xF8)	; �����
    (latin-iso8859-9		. #xF8)	; �����
    (ipa			. #xAF)	; �����
    (japanese-jisx0213-1	. #x296D)	; ø
    (ucs			. #xF8)	; ø
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")
    (->ucs		. #x00F8)	; ø
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F8)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (korean-ksc5601	. #x292A)	; �����
    (japanese-jisx0212	. #x294C)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0300)
    (->uppercase	#x00D9)
    (->titlecase	#x00D9)
    (latin-iso8859-1		. #xF9)	; ù
    (latin-iso8859-3		. #xF9)	; �����
    (latin-iso8859-9		. #xF9)	; �����
    (latin-viscii-lower		. #xF9)	; ù
    (latin-viscii		. #xF9)	; ù
    (japanese-jisx0213-1	. #x296E)	; ù
    (ucs			. #xF9)	; ù
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")
    (->ucs		. #x00F9)	; ù
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F9)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (chinese-gb2312	. #x2834)	; �����
    (japanese-jisx0212	. #x2B63)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0301)
    (->uppercase	#x00DA)
    (->titlecase	#x00DA)
    (latin-iso8859-1		. #xFA)	; ú
    (latin-iso8859-2		. #xFA)	; �����
    (latin-iso8859-3		. #xFA)	; �����
    (latin-iso8859-4		. #xFA)	; �����
    (latin-iso8859-9		. #xFA)	; �����
    (latin-viscii-lower		. #xFA)	; ú
    (latin-viscii		. #xFA)	; ú
    (japanese-jisx0213-1	. #x296F)	; ú
    (ucs			. #xFA)	; ú
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")
    (->ucs		. #x00FA)	; ú
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FA)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (chinese-gb2312	. #x2832)	; �����
    (japanese-jisx0212	. #x2B62)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0302)
    (->uppercase	#x00DB)
    (->titlecase	#x00DB)
    (latin-iso8859-1		. #xFB)	; û
    (latin-iso8859-3		. #xFB)	; �����
    (latin-iso8859-4		. #xFB)	; �����
    (latin-iso8859-9		. #xFB)	; �����
    (japanese-jisx0213-1	. #x2970)	; û
    (ucs			. #xFB)	; û
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00FB)	; û
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FB)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B65)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0308)
    (->uppercase	#x00DC)
    (->titlecase	#x00DC)
    (latin-iso8859-1		. #xFC)	; ü
    (latin-iso8859-2		. #xFC)	; �����
    (latin-iso8859-3		. #xFC)	; �����
    (latin-iso8859-4		. #xFC)	; �����
    (latin-iso8859-9		. #xFC)	; �����
    (japanese-jisx0213-1	. #x2971)	; ü
    (ucs			. #xFC)	; ü
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")
    (->ucs		. #x00FC)	; ü
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FC)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (chinese-gb2312	. #x2839)	; �����
    (japanese-jisx0212	. #x2B64)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0301)
    (->uppercase	#x00DD)
    (->titlecase	#x00DD)
    (latin-iso8859-1		. #xFD)	; ý
    (latin-iso8859-2		. #xFD)	; �����
    (latin-viscii-lower		. #xFD)	; ý
    (latin-viscii		. #xFD)	; ý
    (japanese-jisx0213-1	. #x2972)	; ý
    (ucs			. #xFD)	; ý
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")
    (->ucs		. #x00FD)	; ý
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FD)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	. #x2B72)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER THORN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase	#x00DE)
    (->titlecase	#x00DE)
    (latin-iso8859-1		. #xFE)	; þ
    (japanese-jisx0213-1	. #x2973)	; þ
    (ucs			. #xFE)	; þ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER THORN")
    (->ucs		. #x00FE)	; þ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00FE)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (korean-ksc5601	. #x292D)	; �����
    (japanese-jisx0212	. #x2950)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0308)
    (->uppercase	#x0178)
    (->titlecase	#x0178)
    (latin-iso8859-1		. #xFF)	; ÿ
    (latin-iso8859-9		. #xFF)	; �����
    (japanese-jisx0213-1	. #x2974)	; ÿ
    (ucs			. #xFF)	; ÿ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH DIAERESIS")
    (->ucs		. #x00FF)	; ÿ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FF)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B73)	; �����
    ))
