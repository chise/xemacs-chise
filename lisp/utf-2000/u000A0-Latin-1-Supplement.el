(define-char
  '((name		. "NO-BREAK SPACE")
    (ucs		. #x00A0)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (latin-iso8859-1		#xA0)	; Â 
    (latin-iso8859-2		#xA0)	; øº’µ 
    (latin-iso8859-3		#xA0)	; øº’·€
    (latin-iso8859-4		#xA0)	; øº’¸ 
    (greek-iso8859-7		#xA0)	; Í°
    (hebrew-iso8859-8		#xA0)	; Ö
    (cyrillic-iso8859-5		#xA0)	; Ð€
    (latin-iso8859-9		#xA0)	; øº“†€
    (japanese-jisx0213-1	#x29 #x22)	; Â 
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xA1)	; Â¡
    (latin-iso8859-9		#xA1)	; øº“†
    (japanese-jisx0213-1	#x29 #x23)	; Â¡
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A1)
    (korean-ksc5601	#x22 #x2E)	; ø»ˆ›·
    (japanese-jisx0212	#x22 #x42)	; ø»Š¦
    ))
(define-char
  '((name		. "CENT SIGN")
    (ucs		. #x00A2)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xA2)	; Â¢
    (hebrew-iso8859-8	#xA2)	; Ö’
    (latin-iso8859-9	#xA2)	; øº“†‚
    ))
(define-char
  '((name		. "POUND SIGN")
    (ucs		. #x00A3)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xA3)	; Â£
    (latin-iso8859-3	#xA3)	; øº’·ƒ
    (greek-iso8859-7	#xA3)	; Í³
    (hebrew-iso8859-8	#xA3)	; Ö“
    (latin-iso8859-9	#xA3)	; øº“†ƒ
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1		#xA4)	; Â¤
    (latin-iso8859-2		#xA4)	; øº’µ¤
    (latin-iso8859-3		#xA4)	; øº’·„
    (latin-iso8859-4		#xA4)	; øº’¸¤
    (hebrew-iso8859-8		#xA4)	; Ö”
    (latin-iso8859-9		#xA4)	; øº“†„
    (japanese-jisx0213-1	#x29 #x24)	; Â¤
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	#x21 #x68)	; ø»„‡‹
    (korean-ksc5601	#x22 #x34)	; ø»ˆ›½
    (japanese-jisx0212	#x22 #x70)	; ø»Š¦½
    ))
(define-char
  '((name		. "YEN SIGN")
    (ucs		. #x00A5)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	#x5C)	; øº‘Œ‡
    (latin-iso8859-1	#xA5)	; Â¥
    (hebrew-iso8859-8	#xA5)	; Ö•
    (latin-iso8859-9	#xA5)	; øº“†…
    ))
(define-char
  '((name		. "BROKEN BAR")
    (ucs		. #x00A6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xA6)	; Â¦
    (greek-iso8859-7		#xA6)	; Í¶
    (hebrew-iso8859-8		#xA6)	; Ö–
    (latin-iso8859-9		#xA6)	; øº“††
    (japanese-jisx0213-1	#x29 #x25)	; Â¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xA7)	; Â§
    (latin-iso8859-2	#xA7)	; øº’µ§
    (latin-iso8859-3	#xA7)	; øº’·‡
    (latin-iso8859-4	#xA7)	; øº’¸§
    (greek-iso8859-7	#xA7)	; Í·
    (hebrew-iso8859-8	#xA7)	; Ö—
    (cyrillic-iso8859-5 #xFD)	; Ñ
    (latin-iso8859-9	#xA7)	; øº“†‡
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A7)
    (japanese-jisx0208-1978	#x21 #x78)	; ø»½—
    (chinese-gb2312		#x21 #x6C)	; ø»„‡
    (japanese-jisx0208		#x21 #x78)	; ø»†‘Ÿ
    (korean-ksc5601		#x21 #x57)	; ø»ˆ›‚
    (chinese-cns11643-1		#x21 #x70)	; ø»‘ƒ«
    ))
(define-char
  '((name		. "DIAERESIS")
    (ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (latin-iso8859-1	#xA8)	; Â¨
    (latin-iso8859-2	#xA8)	; øº’µ¨
    (latin-iso8859-3	#xA8)	; øº’·ˆ
    (latin-iso8859-4	#xA8)	; øº’¸¨
    (greek-iso8859-7	#xA8)	; Í¸
    (hebrew-iso8859-8	#xA8)	; Ö˜
    (latin-iso8859-9	#xA8)	; øº“†ˆ
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A8)
    (japanese-jisx0208-1978	#x21 #x2F)	; ø»¼Ž
    (chinese-gb2312		#x21 #x27)	; ø»„†Š
    (japanese-jisx0208		#x21 #x2F)	; ø»†–
    (korean-ksc5601		#x21 #x27)	; ø»ˆš’
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xA9)	; Â©
    (greek-iso8859-7		#xA9)	; Í¹
    (hebrew-iso8859-8		#xA9)	; Ö™
    (latin-iso8859-9		#xA9)	; øº“†‰
    (japanese-jisx0213-1	#x29 #x26)	; Â©
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A9)
    (japanese-jisx0212	#x22 #x6D)	; ø»Š¦º
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (latin-iso8859-1		#xAA)	; Âª
    (latin-iso8859-9		#xAA)	; øº“†Š
    (japanese-jisx0213-1	#x29 #x27)	; Âª
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00AA)
    (korean-ksc5601	#x28 #x23)	; ø»ˆ¤ 
    (japanese-jisx0212	#x22 #x6C)	; ø»Š¦¹
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00AB)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		#xAB)	; Â«
    (greek-iso8859-7		#xAB)	; Í»
    (hebrew-iso8859-8		#xAB)	; Ö›
    (latin-iso8859-9		#xAB)	; øº“†‹
    (japanese-jisx0213-1	#x29 #x28)	; Â«
    ))
(define-char
  '((name		. "NOT SIGN")
    (ucs		. #x00AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xAC)	; Â¬
    (greek-iso8859-7	#xAC)	; Í¼
    (hebrew-iso8859-8	#xAC)	; Öœ
    (latin-iso8859-9	#xAC)	; øº“†Œ
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xAD)	; Â­
    (latin-iso8859-2		#xAD)	; øº’µ­
    (latin-iso8859-3		#xAD)	; øº’·
    (latin-iso8859-4		#xAD)	; øº’¸­
    (greek-iso8859-7		#xAD)	; Í½
    (hebrew-iso8859-8		#xAD)	; Ö
    (cyrillic-iso8859-5		#xAD)	; Ð
    (latin-iso8859-9		#xAD)	; øº“†
    (japanese-jisx0213-1	#x29 #x29)	; Â­
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AD)
    (korean-ksc5601	#x21 #x29)	; ø»ˆš”
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xAE)	; Â®
    (hebrew-iso8859-8		#xAE)	; Öž
    (latin-iso8859-9		#xAE)	; øº“†Ž
    (japanese-jisx0213-1	#x29 #x2A)	; Â®
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AE)
    (japanese-jisx0212	#x22 #x6E)	; ø»Š¦»
    ))
(define-char
  '((name		. "MACRON")
    (ucs		. #x00AF)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (latin-iso8859-1		#xAF)	; Â¯
    (latin-iso8859-4		#xAF)	; øº’¸¯
    (latin-iso8859-9		#xAF)	; øº“†
    (japanese-jisx0213-1	#x29 #x2B)	; Â¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xB0)	; Â°
    (latin-iso8859-2	#xB0)	; øº’µ°
    (latin-iso8859-3	#xB0)	; øº’·
    (latin-iso8859-4	#xB0)	; øº’¸°
    (greek-iso8859-7	#xB0)	; Î€
    (hebrew-iso8859-8	#xB0)	; Ö 
    (latin-iso8859-9	#xB0)	; øº“†
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B0)
    (japanese-jisx0208-1978	#x21 #x6B)	; ø»½Š
    (chinese-gb2312		#x21 #x63)	; ø»„‡†
    (japanese-jisx0208		#x21 #x6B)	; ø»†‘’
    (korean-ksc5601		#x21 #x46)	; ø»ˆš±
    (chinese-cns11643-1		#x22 #x78)	; ø»‘…‘
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#xB1)	; Â±
    (greek-iso8859-7	#xB1)	; Î
    (hebrew-iso8859-8	#xB1)	; Ö¡
    (latin-iso8859-9	#xB1)	; øº“†‘
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B1)
    (japanese-jisx0208-1978	#x21 #x5E)	; ø»¼½
    (chinese-gb2312		#x21 #x40)	; ø»„†£
    (japanese-jisx0208		#x21 #x5E)	; ø»†‘…
    (korean-ksc5601		#x21 #x3E)	; ø»ˆš©
    (chinese-cns11643-1		#x22 #x34)	; ø»‘„
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
    (latin-iso8859-1		#xB2)	; Â²
    (latin-iso8859-3		#xB2)	; øº’·’
    (greek-iso8859-7		#xB2)	; Î‚
    (hebrew-iso8859-8		#xB2)	; Ö¢
    (latin-iso8859-9		#xB2)	; øº“†’
    (japanese-jisx0213-1	#x29 #x2C)	; Â²
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
    (korean-ksc5601	#x29 #x77)	; ø»ˆ§’
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
    (latin-iso8859-1		#xB3)	; Â³
    (latin-iso8859-3		#xB3)	; øº’·“
    (greek-iso8859-7		#xB3)	; Îƒ
    (hebrew-iso8859-8		#xB3)	; Ö£
    (latin-iso8859-9		#xB3)	; øº“†“
    (japanese-jisx0213-1	#x29 #x2D)	; Â³
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
    (korean-ksc5601	#x29 #x78)	; ø»ˆ§“
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (latin-iso8859-1	#xB4)	; Â´
    (latin-iso8859-2	#xB4)	; øº’µ´
    (latin-iso8859-3	#xB4)	; øº’·”
    (latin-iso8859-4	#xB4)	; øº’¸´
    (hebrew-iso8859-8	#xB4)	; Ö¤
    (latin-iso8859-9	#xB4)	; øº“†”
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B4)
    (japanese-jisx0208-1978	#x21 #x2D)	; ø»¼Œ
    (japanese-jisx0208		#x21 #x2D)	; ø»†”
    (korean-ksc5601		#x22 #x25)	; ø»ˆ›®
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
    (latin-iso8859-1	#xB5)	; Âµ
    (latin-iso8859-3	#xB5)	; øº’·•
    (hebrew-iso8859-8	#xB5)	; Ö¥
    (latin-iso8859-9	#xB5)	; øº“†•
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xB6)	; Â¶
    (hebrew-iso8859-8	#xB6)	; Ö¦
    (latin-iso8859-9	#xB6)	; øº“†–
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B6)
    (japanese-jisx0208	#x22 #x79)	; ø»†’¾
    (korean-ksc5601	#x22 #x52)	; ø»ˆœ›
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xB7)	; Â·
    (latin-iso8859-3		#xB7)	; øº’·—
    (greek-iso8859-7		#xB7)	; Î‡
    (hebrew-iso8859-8		#xB7)	; Ö§
    (latin-iso8859-9		#xB7)	; øº“†—
    (japanese-jisx0213-1	#x29 #x2E)	; Â·
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B7)
    (korean-ksc5601	#x21 #x24)	; ø»ˆš
    (chinese-cns11643-1 #x21 #x26)	; ø»‘‚¡
    ))
(define-char
  '((name		. "CEDILLA")
    (ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (latin-iso8859-1		#xB8)	; Â¸
    (latin-iso8859-2		#xB8)	; øº’µ¸
    (latin-iso8859-3		#xB8)	; øº’·˜
    (latin-iso8859-4		#xB8)	; øº’¸¸
    (hebrew-iso8859-8		#xB8)	; Ö¨
    (latin-iso8859-9		#xB8)	; øº“†˜
    (japanese-jisx0213-1	#x29 #x2F)	; Â¸
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B8)
    (korean-ksc5601	#x22 #x2C)	; ø»ˆ›µ
    (japanese-jisx0212	#x22 #x31)	; ø»Š¥¾
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
    (latin-iso8859-1		#xB9)	; Â¹
    (hebrew-iso8859-8		#xB9)	; Ö©
    (latin-iso8859-9		#xB9)	; øº“†™
    (japanese-jisx0213-1	#x29 #x30)	; Â¹
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
    (korean-ksc5601	#x29 #x76)	; ø»ˆ§‘
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (latin-iso8859-1		#xBA)	; Âº
    (latin-iso8859-9		#xBA)	; øº“†š
    (japanese-jisx0213-1	#x29 #x31)	; Âº
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00BA)
    (korean-ksc5601	#x28 #x2C)	; ø»ˆ¤©
    (japanese-jisx0212	#x22 #x6B)	; ø»Š¦¸
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00BB)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		#xBB)	; Â»
    (greek-iso8859-7		#xBB)	; Î‹
    (hebrew-iso8859-8		#xBB)	; Ö«
    (latin-iso8859-9		#xBB)	; øº“†›
    (japanese-jisx0213-1	#x29 #x32)	; Â»
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (latin-iso8859-1		#xBC)	; Â¼
    (hebrew-iso8859-8		#xBC)	; Ö¬
    (latin-iso8859-9		#xBC)	; øº“†œ
    (japanese-jisx0213-1	#x29 #x33)	; Â¼
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	wide #x00BC)
    (korean-ksc5601	#x28 #x79)	; ø»ˆ¥¶
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (latin-iso8859-1		#xBD)	; Â½
    (latin-iso8859-3		#xBD)	; øº’·
    (greek-iso8859-7		#xBD)	; Î
    (hebrew-iso8859-8		#xBD)	; Ö­
    (latin-iso8859-9		#xBD)	; øº“†
    (japanese-jisx0213-1	#x29 #x34)	; Â½
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	wide #x00BD)
    (korean-ksc5601	#x28 #x76)	; ø»ˆ¥³
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (latin-iso8859-1		#xBE)	; Â¾
    (hebrew-iso8859-8		#xBE)	; Ö®
    (latin-iso8859-9		#xBE)	; øº“†ž
    (japanese-jisx0213-1	#x29 #x35)	; Â¾
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	wide #x00BE)
    (korean-ksc5601	#x28 #x7A)	; ø»ˆ¥·
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		#xBF)	; Â¿
    (latin-iso8859-9		#xBF)	; øº“†Ÿ
    (japanese-jisx0213-1	#x29 #x36)	; Â¿
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BF)
    (korean-ksc5601	#x22 #x2F)	; ø»ˆ›¸
    (japanese-jisx0212	#x22 #x44)	; ø»Š¦‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->lowercase	#x00E0)
    (latin-iso8859-1		#xC0)	; Ã€
    (latin-iso8859-3		#xC0)	; øº’· 
    (latin-iso8859-9		#xC0)	; øº“† 
    (latin-viscii-upper		#xE0)	; Ã€
    (latin-viscii		#xC0)	; Ã€
    (japanese-jisx0213-1	#x29 #x37)	; Ã€
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
    (japanese-jisx0212	#x2A #x22)	; ø»Š±Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->lowercase	#x00E1)
    (latin-iso8859-1		#xC1)	; Ã
    (latin-iso8859-2		#xC1)	; øº’¶
    (latin-iso8859-3		#xC1)	; øº’·¡
    (latin-iso8859-4		#xC1)	; øº’¹
    (latin-iso8859-9		#xC1)	; øº“†¡
    (latin-viscii-upper		#xE1)	; Ã
    (latin-viscii		#xC1)	; Ã
    (japanese-jisx0213-1	#x29 #x38)	; Ã
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
    (japanese-jisx0212	#x2A #x21)	; ø»Š±ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->lowercase	#x00E2)
    (latin-iso8859-1		#xC2)	; Ã‚
    (latin-iso8859-2		#xC2)	; øº’¶‚
    (latin-iso8859-3		#xC2)	; øº’·¢
    (latin-iso8859-4		#xC2)	; øº’¹‚
    (latin-iso8859-9		#xC2)	; øº“†¢
    (latin-viscii-upper		#xE2)	; Ã‚
    (latin-viscii		#xC2)	; Ã‚
    (japanese-jisx0213-1	#x29 #x39)	; Ã‚
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
    (japanese-jisx0212	#x2A #x24)	; ø»Š±¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->lowercase	#x00E3)
    (latin-iso8859-1		#xC3)	; Ãƒ
    (latin-iso8859-4		#xC3)	; øº’¹ƒ
    (latin-iso8859-9		#xC3)	; øº“†£
    (latin-viscii-upper		#xE3)	; Ãƒ
    (latin-viscii		#xC3)	; Ãƒ
    (japanese-jisx0213-1	#x29 #x3A)	; Ãƒ
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
    (japanese-jisx0212	#x2A #x2A)	; ø»Š±§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->lowercase	#x00E4)
    (latin-iso8859-1		#xC4)	; Ã„
    (latin-iso8859-2		#xC4)	; øº’¶„
    (latin-iso8859-3		#xC4)	; øº’·¤
    (latin-iso8859-4		#xC4)	; øº’¹„
    (latin-iso8859-9		#xC4)	; øº“†¤
    (japanese-jisx0213-1	#x29 #x3B)	; Ã„
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
    (japanese-jisx0212	#x2A #x23)	; ø»Š± 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->lowercase	#x00E5)
    (latin-iso8859-1		#xC5)	; Ã…
    (latin-iso8859-4		#xC5)	; øº’¹…
    (latin-iso8859-9		#xC5)	; øº“†¥
    (japanese-jisx0213-1	#x29 #x3C)	; Ã…
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
    (japanese-jisx0212	#x2A #x29)	; ø»Š±¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase	#x00E6)
    (latin-iso8859-1		#xC6)	; Ã†
    (latin-iso8859-4		#xC6)	; øº’¹†
    (latin-iso8859-9		#xC6)	; øº“†¦
    (japanese-jisx0213-1	#x29 #x3D)	; Ã†
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	#x28 #x21)	; ø»ˆ¤ž
    (japanese-jisx0212	#x29 #x21)	; ø»Š°€
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->lowercase	#x00E7)
    (latin-iso8859-1		#xC7)	; Ã‡
    (latin-iso8859-2		#xC7)	; øº’¶‡
    (latin-iso8859-3		#xC7)	; øº’·§
    (latin-iso8859-9		#xC7)	; øº“†§
    (japanese-jisx0213-1	#x29 #x3E)	; Ã‡
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
    (japanese-jisx0212	#x2A #x2E)	; ø»Š±«
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->lowercase	#x00E8)
    (latin-iso8859-1		#xC8)	; Ãˆ
    (latin-iso8859-3		#xC8)	; øº’·¨
    (latin-iso8859-9		#xC8)	; øº“†¨
    (latin-viscii-upper		#xE8)	; Ãˆ
    (latin-viscii		#xC8)	; Ãˆ
    (japanese-jisx0213-1	#x29 #x3F)	; Ãˆ
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
    (japanese-jisx0212	#x2A #x32)	; ø»Š±¯
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->lowercase	#x00E9)
    (latin-iso8859-1		#xC9)	; Ã‰
    (latin-iso8859-2		#xC9)	; øº’¶‰
    (latin-iso8859-3		#xC9)	; øº’·©
    (latin-iso8859-4		#xC9)	; øº’¹‰
    (latin-iso8859-9		#xC9)	; øº“†©
    (latin-viscii-upper		#xE9)	; Ã‰
    (latin-viscii		#xC9)	; Ã‰
    (japanese-jisx0213-1	#x29 #x40)	; Ã‰
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
    (japanese-jisx0212	#x2A #x31)	; ø»Š±®
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->lowercase	#x00EA)
    (latin-iso8859-1		#xCA)	; ÃŠ
    (latin-iso8859-3		#xCA)	; øº’·ª
    (latin-iso8859-9		#xCA)	; øº“†ª
    (latin-viscii-upper		#xEA)	; ÃŠ
    (latin-viscii		#xCA)	; ÃŠ
    (japanese-jisx0213-1	#x29 #x41)	; ÃŠ
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
    (japanese-jisx0212	#x2A #x34)	; ø»Š±±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->lowercase	#x00EB)
    (latin-iso8859-1		#xCB)	; Ã‹
    (latin-iso8859-2		#xCB)	; øº’¶‹
    (latin-iso8859-3		#xCB)	; øº’·«
    (latin-iso8859-4		#xCB)	; øº’¹‹
    (latin-iso8859-9		#xCB)	; øº“†«
    (japanese-jisx0213-1	#x29 #x42)	; Ã‹
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
    (japanese-jisx0212	#x2A #x33)	; ø»Š±°
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->lowercase	#x00EC)
    (latin-iso8859-1		#xCC)	; ÃŒ
    (latin-iso8859-3		#xCC)	; øº’·¬
    (latin-iso8859-9		#xCC)	; øº“†¬
    (latin-viscii-upper		#xEC)	; ÃŒ
    (latin-viscii		#xCC)	; ÃŒ
    (japanese-jisx0213-1	#x29 #x43)	; ÃŒ
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
    (japanese-jisx0212	#x2A #x40)	; ø»Š±½
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->lowercase	#x00ED)
    (latin-iso8859-1		#xCD)	; Ã
    (latin-iso8859-2		#xCD)	; øº’¶
    (latin-iso8859-3		#xCD)	; øº’·­
    (latin-iso8859-4		#xCD)	; øº’¹
    (latin-iso8859-9		#xCD)	; øº“†­
    (latin-viscii-upper		#xED)	; Ã
    (latin-viscii		#xCD)	; Ã
    (japanese-jisx0213-1	#x29 #x44)	; Ã
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
    (japanese-jisx0212	#x2A #x3F)	; ø»Š±¼
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->lowercase	#x00EE)
    (latin-iso8859-1		#xCE)	; ÃŽ
    (latin-iso8859-2		#xCE)	; øº’¶Ž
    (latin-iso8859-3		#xCE)	; øº’·®
    (latin-iso8859-4		#xCE)	; øº’¹Ž
    (latin-iso8859-9		#xCE)	; øº“†®
    (japanese-jisx0213-1	#x29 #x45)	; ÃŽ
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
    (japanese-jisx0212	#x2A #x42)	; ø»Š±¿
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->lowercase	#x00EF)
    (latin-iso8859-1		#xCF)	; Ã
    (latin-iso8859-3		#xCF)	; øº’·¯
    (latin-iso8859-9		#xCF)	; øº“†¯
    (japanese-jisx0213-1	#x29 #x46)	; Ã
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
    (japanese-jisx0212	#x2A #x41)	; ø»Š±¾
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (ucs		. #x00D0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00F0)
    (latin-iso8859-1		#xD0)	; Ã
    (japanese-jisx0213-1	#x29 #x47)	; Ã
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
    (korean-ksc5601	#x28 #x22)	; ø»ˆ¤Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->lowercase	#x00F1)
    (latin-iso8859-1		#xD1)	; Ã‘
    (latin-iso8859-3		#xD1)	; øº’·±
    (latin-iso8859-9		#xD1)	; øº“†±
    (japanese-jisx0213-1	#x29 #x48)	; Ã‘
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
    (japanese-jisx0212	#x2A #x50)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->lowercase	#x00F2)
    (latin-iso8859-1		#xD2)	; Ã’
    (latin-iso8859-3		#xD2)	; øº’·²
    (latin-iso8859-9		#xD2)	; øº“†²
    (latin-viscii-upper		#xF2)	; Ã’
    (latin-viscii		#xD2)	; Ã’
    (japanese-jisx0213-1	#x29 #x49)	; Ã’
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
    (japanese-jisx0212	#x2A #x52)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->lowercase	#x00F3)
    (latin-iso8859-1		#xD3)	; Ã“
    (latin-iso8859-2		#xD3)	; øº’¶“
    (latin-iso8859-3		#xD3)	; øº’·³
    (latin-iso8859-9		#xD3)	; øº“†³
    (latin-viscii-upper		#xF3)	; Ã“
    (latin-viscii		#xD3)	; Ã“
    (japanese-jisx0213-1	#x29 #x4A)	; Ã“
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
    (japanese-jisx0212	#x2A #x51)	; ø»Š²Ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->lowercase	#x00F4)
    (latin-iso8859-1		#xD4)	; Ã”
    (latin-iso8859-2		#xD4)	; øº’¶”
    (latin-iso8859-3		#xD4)	; øº’·´
    (latin-iso8859-4		#xD4)	; øº’¹”
    (latin-iso8859-9		#xD4)	; øº“†´
    (latin-viscii-upper		#xF4)	; Ã”
    (latin-viscii		#xD4)	; Ã”
    (japanese-jisx0213-1	#x29 #x4B)	; Ã”
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
    (japanese-jisx0212	#x2A #x54)	; ø»Š²‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->lowercase	#x00F5)
    (latin-iso8859-1		#xD5)	; Ã•
    (latin-iso8859-4		#xD5)	; øº’¹•
    (latin-iso8859-9		#xD5)	; øº“†µ
    (latin-viscii-upper		#xF5)	; Ã•
    (latin-viscii		#xA0)	; Ã•
    (japanese-jisx0213-1	#x29 #x4C)	; Ã•
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
    (japanese-jisx0212	#x2A #x58)	; ø»Š²•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->lowercase	#x00F6)
    (latin-iso8859-1		#xD6)	; Ã–
    (latin-iso8859-2		#xD6)	; øº’¶–
    (latin-iso8859-3		#xD6)	; øº’·¶
    (latin-iso8859-4		#xD6)	; øº’¹–
    (latin-iso8859-9		#xD6)	; øº“†¶
    (japanese-jisx0213-1	#x29 #x4D)	; Ã–
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
    (japanese-jisx0212	#x2A #x53)	; ø»Š²
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xD7)	; Ã—
    (latin-iso8859-2	#xD7)	; øº’¶—
    (latin-iso8859-3	#xD7)	; øº’··
    (latin-iso8859-4	#xD7)	; øº’¹—
    (hebrew-iso8859-8	#xAA)	; Öš
    (latin-iso8859-9	#xD7)	; øº“†·
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00D7)
    (japanese-jisx0208-1978	#x21 #x5F)	; ø»¼¾
    (chinese-gb2312		#x21 #x41)	; ø»„†¤
    (japanese-jisx0208		#x21 #x5F)	; ø»†‘†
    (korean-ksc5601		#x21 #x3F)	; ø»ˆšª
    (chinese-cns11643-1		#x22 #x32)	; ø»‘„‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1		#xD8)	; Ã˜
    (latin-iso8859-4		#xD8)	; øº’¹˜
    (latin-iso8859-9		#xD8)	; øº“†¸
    (japanese-jisx0213-1	#x29 #x4E)	; Ã˜
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	#x28 #x2A)	; ø»ˆ¤§
    (japanese-jisx0212	#x29 #x2C)	; ø»Š°‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase	#x00F9)
    (latin-iso8859-1		#xD9)	; Ã™
    (latin-iso8859-3		#xD9)	; øº’·¹
    (latin-iso8859-9		#xD9)	; øº“†¹
    (latin-viscii-upper		#xF9)	; Ã™
    (latin-viscii		#xD9)	; Ã™
    (japanese-jisx0213-1	#x29 #x4F)	; Ã™
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
    (japanese-jisx0212	#x2A #x63)	; ø»Š² 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->lowercase	#x00FA)
    (latin-iso8859-1		#xDA)	; Ãš
    (latin-iso8859-2		#xDA)	; øº’¶š
    (latin-iso8859-3		#xDA)	; øº’·º
    (latin-iso8859-4		#xDA)	; øº’¹š
    (latin-iso8859-9		#xDA)	; øº“†º
    (latin-viscii-upper		#xFA)	; Ãš
    (latin-viscii		#xDA)	; Ãš
    (japanese-jisx0213-1	#x29 #x50)	; Ãš
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
    (japanese-jisx0212	#x2A #x62)	; ø»Š²Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->lowercase	#x00FB)
    (latin-iso8859-1		#xDB)	; Ã›
    (latin-iso8859-3		#xDB)	; øº’·»
    (latin-iso8859-4		#xDB)	; øº’¹›
    (latin-iso8859-9		#xDB)	; øº“†»
    (japanese-jisx0213-1	#x29 #x51)	; Ã›
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
    (japanese-jisx0212	#x2A #x65)	; ø»Š²¢
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->lowercase	#x00FC)
    (latin-iso8859-1		#xDC)	; Ãœ
    (latin-iso8859-2		#xDC)	; øº’¶œ
    (latin-iso8859-3		#xDC)	; øº’·¼
    (latin-iso8859-4		#xDC)	; øº’¹œ
    (latin-iso8859-9		#xDC)	; øº“†¼
    (japanese-jisx0213-1	#x29 #x52)	; Ãœ
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
    (japanese-jisx0212	#x2A #x64)	; ø»Š²¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->lowercase	#x00FD)
    (latin-iso8859-1		#xDD)	; Ã
    (latin-iso8859-2		#xDD)	; øº’¶
    (latin-viscii-upper		#xFD)	; Ã
    (latin-viscii		#xDD)	; Ã
    (japanese-jisx0213-1	#x29 #x53)	; Ã
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
    (japanese-jisx0212	#x2A #x72)	; ø»Š²¯
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (ucs		. #x00DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00FE)
    (latin-iso8859-1		#xDE)	; Ãž
    (japanese-jisx0213-1	#x29 #x54)	; Ãž
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
    (korean-ksc5601	#x28 #x2D)	; ø»ˆ¤ª
    (japanese-jisx0212	#x29 #x30)	; ø»Š°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1		#xDF)	; ÃŸ
    (latin-iso8859-2		#xDF)	; øº’¶Ÿ
    (latin-iso8859-3		#xDF)	; øº’·¿
    (latin-iso8859-4		#xDF)	; øº’¹Ÿ
    (latin-iso8859-9		#xDF)	; øº“†¿
    (japanese-jisx0213-1	#x29 #x55)	; ÃŸ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->decomposition	wide #x00DF)
    (korean-ksc5601	#x29 #x2C)	; ø»ˆ¦‡
    (japanese-jisx0212	#x29 #x4E)	; ø»Š°­
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
    (latin-iso8859-1		#xE0)	; Ã 
    (latin-iso8859-3		#xE0)	; øº’¸€
    (latin-iso8859-9		#xE0)	; øº“‡€
    (latin-viscii-lower		#xE0)	; Ã 
    (latin-viscii		#xE0)	; Ã 
    (japanese-jisx0213-1	#x29 #x56)	; Ã 
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
    (chinese-gb2312	#x28 #x24)	; ø»„™
    (japanese-jisx0212	#x2B #x22)	; ø»Š²½
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
    (latin-iso8859-1		#xE1)	; Ã¡
    (latin-iso8859-2		#xE1)	; øº’¶¡
    (latin-iso8859-3		#xE1)	; øº’¸
    (latin-iso8859-4		#xE1)	; øº’¹¡
    (latin-iso8859-9		#xE1)	; øº“‡
    (latin-viscii-lower		#xE1)	; Ã¡
    (latin-viscii		#xE1)	; Ã¡
    (japanese-jisx0213-1	#x29 #x57)	; Ã¡
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
    (chinese-gb2312	#x28 #x22)	; ø»„—
    (japanese-jisx0212	#x2B #x21)	; ø»Š²¼
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
    (latin-iso8859-1		#xE2)	; Ã¢
    (latin-iso8859-2		#xE2)	; øº’¶¢
    (latin-iso8859-3		#xE2)	; øº’¸‚
    (latin-iso8859-4		#xE2)	; øº’¹¢
    (latin-iso8859-9		#xE2)	; øº“‡‚
    (latin-viscii-lower		#xE2)	; Ã¢
    (latin-viscii		#xE2)	; Ã¢
    (japanese-jisx0213-1	#x29 #x58)	; Ã¢
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
    (japanese-jisx0212	#x2B #x24)	; ø»Š²¿
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
    (latin-iso8859-1		#xE3)	; Ã£
    (latin-iso8859-4		#xE3)	; øº’¹£
    (latin-iso8859-9		#xE3)	; øº“‡ƒ
    (latin-viscii-lower		#xE3)	; Ã£
    (latin-viscii		#xE3)	; Ã£
    (japanese-jisx0213-1	#x29 #x59)	; Ã£
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
    (japanese-jisx0212	#x2B #x2A)	; ø»Š³…
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
    (latin-iso8859-1		#xE4)	; Ã¤
    (latin-iso8859-2		#xE4)	; øº’¶¤
    (latin-iso8859-3		#xE4)	; øº’¸„
    (latin-iso8859-4		#xE4)	; øº’¹¤
    (latin-iso8859-9		#xE4)	; øº“‡„
    (japanese-jisx0213-1	#x29 #x5A)	; Ã¤
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
    (japanese-jisx0212	#x2B #x23)	; ø»Š²¾
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
    (latin-iso8859-1		#xE5)	; Ã¥
    (latin-iso8859-4		#xE5)	; øº’¹¥
    (latin-iso8859-9		#xE5)	; øº“‡…
    (japanese-jisx0213-1	#x29 #x5B)	; Ã¥
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
    (japanese-jisx0212	#x2B #x29)	; ø»Š³„
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
    (latin-iso8859-1		#xE6)	; Ã¦
    (latin-iso8859-4		#xE6)	; øº’¹¦
    (latin-iso8859-9		#xE6)	; øº“‡†
    (ipa			#xA4)	; øº’š¤
    (japanese-jisx0213-1	#x29 #x5C)	; Ã¦
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
    (korean-ksc5601	#x29 #x21)	; ø»ˆ¥¼
    (japanese-jisx0212	#x29 #x41)	; ø»Š° 
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
    (latin-iso8859-1		#xE7)	; Ã§
    (latin-iso8859-2		#xE7)	; øº’¶§
    (latin-iso8859-3		#xE7)	; øº’¸‡
    (latin-iso8859-9		#xE7)	; øº“‡‡
    (ipa			#xCE)	; øº’›Ž
    (japanese-jisx0213-1	#x29 #x5D)	; Ã§
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
    (japanese-jisx0212	#x2B #x2E)	; ø»Š³‰
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
    (latin-iso8859-1		#xE8)	; Ã¨
    (latin-iso8859-3		#xE8)	; øº’¸ˆ
    (latin-iso8859-9		#xE8)	; øº“‡ˆ
    (latin-viscii-lower		#xE8)	; Ã¨
    (latin-viscii		#xE8)	; Ã¨
    (japanese-jisx0213-1	#x29 #x5E)	; Ã¨
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
    (chinese-gb2312	#x28 #x28)	; ø»„
    (japanese-jisx0212	#x2B #x32)	; ø»Š³
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
    (latin-iso8859-1		#xE9)	; Ã©
    (latin-iso8859-2		#xE9)	; øº’¶©
    (latin-iso8859-3		#xE9)	; øº’¸‰
    (latin-iso8859-4		#xE9)	; øº’¹©
    (latin-iso8859-9		#xE9)	; øº“‡‰
    (latin-viscii-lower		#xE9)	; Ã©
    (latin-viscii		#xE9)	; Ã©
    (japanese-jisx0213-1	#x29 #x5F)	; Ã©
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
    (chinese-gb2312	#x28 #x26)	; ø»„›
    (japanese-jisx0212	#x2B #x31)	; ø»Š³Œ
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
    (latin-iso8859-1		#xEA)	; Ãª
    (latin-iso8859-3		#xEA)	; øº’¸Š
    (latin-iso8859-9		#xEA)	; øº“‡Š
    (latin-viscii-lower		#xEA)	; Ãª
    (latin-viscii		#xEA)	; Ãª
    (japanese-jisx0213-1	#x29 #x60)	; Ãª
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
    (chinese-gb2312	#x28 #x3A)	; ø»„¯
    (japanese-jisx0212	#x2B #x34)	; ø»Š³
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
    (latin-iso8859-1		#xEB)	; Ã«
    (latin-iso8859-2		#xEB)	; øº’¶«
    (latin-iso8859-3		#xEB)	; øº’¸‹
    (latin-iso8859-4		#xEB)	; øº’¹«
    (latin-iso8859-9		#xEB)	; øº“‡‹
    (japanese-jisx0213-1	#x29 #x61)	; Ã«
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
    (japanese-jisx0212	#x2B #x33)	; ø»Š³Ž
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
    (latin-iso8859-1		#xEC)	; Ã¬
    (latin-iso8859-3		#xEC)	; øº’¸Œ
    (latin-iso8859-9		#xEC)	; øº“‡Œ
    (latin-viscii-lower		#xEC)	; Ã¬
    (latin-viscii		#xEC)	; Ã¬
    (japanese-jisx0213-1	#x29 #x62)	; Ã¬
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
    (chinese-gb2312	#x28 #x2C)	; ø»„¡
    (japanese-jisx0212	#x2B #x40)	; ø»Š³›
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
    (latin-iso8859-1		#xED)	; Ã­
    (latin-iso8859-2		#xED)	; øº’¶­
    (latin-iso8859-3		#xED)	; øº’¸
    (latin-iso8859-4		#xED)	; øº’¹­
    (latin-iso8859-9		#xED)	; øº“‡
    (latin-viscii-lower		#xED)	; Ã­
    (latin-viscii		#xED)	; Ã­
    (japanese-jisx0213-1	#x29 #x63)	; Ã­
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
    (chinese-gb2312	#x28 #x2A)	; ø»„Ÿ
    (japanese-jisx0212	#x2B #x3F)	; ø»Š³š
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
    (latin-iso8859-1		#xEE)	; Ã®
    (latin-iso8859-2		#xEE)	; øº’¶®
    (latin-iso8859-3		#xEE)	; øº’¸Ž
    (latin-iso8859-4		#xEE)	; øº’¹®
    (latin-iso8859-9		#xEE)	; øº“‡Ž
    (japanese-jisx0213-1	#x29 #x64)	; Ã®
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
    (japanese-jisx0212	#x2B #x42)	; ø»Š³
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
    (latin-iso8859-1		#xEF)	; Ã¯
    (latin-iso8859-3		#xEF)	; øº’¸
    (latin-iso8859-9		#xEF)	; øº“‡
    (japanese-jisx0213-1	#x29 #x65)	; Ã¯
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
    (japanese-jisx0212	#x2B #x41)	; ø»Š³œ
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
    (latin-iso8859-1		#xF0)	; Ã°
    (ipa			#xC9)	; øº’›‰
    (japanese-jisx0213-1	#x29 #x66)	; Ã°
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
    (korean-ksc5601	#x29 #x23)	; ø»ˆ¥¾
    (japanese-jisx0212	#x29 #x43)	; ø»Š°¢
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
    (latin-iso8859-1		#xF1)	; Ã±
    (latin-iso8859-3		#xF1)	; øº’¸‘
    (latin-iso8859-9		#xF1)	; øº“‡‘
    (japanese-jisx0213-1	#x29 #x67)	; Ã±
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
    (japanese-jisx0212	#x2B #x50)	; ø»Š³«
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
    (latin-iso8859-1		#xF2)	; Ã²
    (latin-iso8859-3		#xF2)	; øº’¸’
    (latin-iso8859-9		#xF2)	; øº“‡’
    (latin-viscii-lower		#xF2)	; Ã²
    (latin-viscii		#xF2)	; Ã²
    (japanese-jisx0213-1	#x29 #x68)	; Ã²
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
    (chinese-gb2312	#x28 #x30)	; ø»„¥
    (japanese-jisx0212	#x2B #x52)	; ø»Š³­
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
    (latin-iso8859-1		#xF3)	; Ã³
    (latin-iso8859-2		#xF3)	; øº’¶³
    (latin-iso8859-3		#xF3)	; øº’¸“
    (latin-iso8859-9		#xF3)	; øº“‡“
    (latin-viscii-lower		#xF3)	; Ã³
    (latin-viscii		#xF3)	; Ã³
    (japanese-jisx0213-1	#x29 #x69)	; Ã³
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
    (chinese-gb2312	#x28 #x2E)	; ø»„£
    (japanese-jisx0212	#x2B #x51)	; ø»Š³¬
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
    (latin-iso8859-1		#xF4)	; Ã´
    (latin-iso8859-2		#xF4)	; øº’¶´
    (latin-iso8859-3		#xF4)	; øº’¸”
    (latin-iso8859-4		#xF4)	; øº’¹´
    (latin-iso8859-9		#xF4)	; øº“‡”
    (latin-viscii-lower		#xF4)	; Ã´
    (latin-viscii		#xF4)	; Ã´
    (japanese-jisx0213-1	#x29 #x6A)	; Ã´
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
    (japanese-jisx0212	#x2B #x54)	; ø»Š³¯
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
    (latin-iso8859-1		#xF5)	; Ãµ
    (latin-iso8859-4		#xF5)	; øº’¹µ
    (latin-iso8859-9		#xF5)	; øº“‡•
    (latin-viscii-lower		#xF5)	; Ãµ
    (latin-viscii		#xF5)	; Ãµ
    (japanese-jisx0213-1	#x29 #x6B)	; Ãµ
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
    (japanese-jisx0212	#x2B #x58)	; ø»Š³³
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
    (latin-iso8859-1		#xF6)	; Ã¶
    (latin-iso8859-2		#xF6)	; øº’¶¶
    (latin-iso8859-3		#xF6)	; øº’¸–
    (latin-iso8859-4		#xF6)	; øº’¹¶
    (latin-iso8859-9		#xF6)	; øº“‡–
    (japanese-jisx0213-1	#x29 #x6C)	; Ã¶
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
    (japanese-jisx0212	#x2B #x53)	; ø»Š³®
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#xF7)	; Ã·
    (latin-iso8859-2	#xF7)	; øº’¶·
    (latin-iso8859-3	#xF7)	; øº’¸—
    (latin-iso8859-4	#xF7)	; øº’¹·
    (hebrew-iso8859-8	#xBA)	; Öª
    (latin-iso8859-9	#xF7)	; øº“‡—
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00F7)
    (japanese-jisx0208-1978	#x21 #x60)	; ø»¼¿
    (chinese-gb2312		#x21 #x42)	; ø»„†¥
    (japanese-jisx0208		#x21 #x60)	; ø»†‘‡
    (korean-ksc5601		#x21 #x40)	; ø»ˆš«
    (chinese-cns11643-1		#x22 #x33)	; ø»‘„Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1		#xF8)	; Ã¸
    (latin-iso8859-4		#xF8)	; øº’¹¸
    (latin-iso8859-9		#xF8)	; øº“‡˜
    (ipa			#xAF)	; øº’š¯
    (japanese-jisx0213-1	#x29 #x6D)	; Ã¸
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
    (korean-ksc5601	#x29 #x2A)	; ø»ˆ¦…
    (japanese-jisx0212	#x29 #x4C)	; ø»Š°«
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
    (latin-iso8859-1		#xF9)	; Ã¹
    (latin-iso8859-3		#xF9)	; øº’¸™
    (latin-iso8859-9		#xF9)	; øº“‡™
    (latin-viscii-lower		#xF9)	; Ã¹
    (latin-viscii		#xF9)	; Ã¹
    (japanese-jisx0213-1	#x29 #x6E)	; Ã¹
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
    (chinese-gb2312	#x28 #x34)	; ø»„©
    (japanese-jisx0212	#x2B #x63)	; ø»Š³¾
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
    (latin-iso8859-1		#xFA)	; Ãº
    (latin-iso8859-2		#xFA)	; øº’¶º
    (latin-iso8859-3		#xFA)	; øº’¸š
    (latin-iso8859-4		#xFA)	; øº’¹º
    (latin-iso8859-9		#xFA)	; øº“‡š
    (latin-viscii-lower		#xFA)	; Ãº
    (latin-viscii		#xFA)	; Ãº
    (japanese-jisx0213-1	#x29 #x6F)	; Ãº
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
    (chinese-gb2312	#x28 #x32)	; ø»„§
    (japanese-jisx0212	#x2B #x62)	; ø»Š³½
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
    (latin-iso8859-1		#xFB)	; Ã»
    (latin-iso8859-3		#xFB)	; øº’¸›
    (latin-iso8859-4		#xFB)	; øº’¹»
    (latin-iso8859-9		#xFB)	; øº“‡›
    (japanese-jisx0213-1	#x29 #x70)	; Ã»
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
    (japanese-jisx0212	#x2B #x65)	; ø»Š´€
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
    (latin-iso8859-1		#xFC)	; Ã¼
    (latin-iso8859-2		#xFC)	; øº’¶¼
    (latin-iso8859-3		#xFC)	; øº’¸œ
    (latin-iso8859-4		#xFC)	; øº’¹¼
    (latin-iso8859-9		#xFC)	; øº“‡œ
    (japanese-jisx0213-1	#x29 #x71)	; Ã¼
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
    (chinese-gb2312	#x28 #x39)	; ø»„®
    (japanese-jisx0212	#x2B #x64)	; ø»Š³¿
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
    (latin-iso8859-1		#xFD)	; Ã½
    (latin-iso8859-2		#xFD)	; øº’¶½
    (latin-viscii-lower		#xFD)	; Ã½
    (latin-viscii		#xFD)	; Ã½
    (japanese-jisx0213-1	#x29 #x72)	; Ã½
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
    (japanese-jisx0212	#x2B #x72)	; ø»Š´
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
    (latin-iso8859-1		#xFE)	; Ã¾
    (japanese-jisx0213-1	#x29 #x73)	; Ã¾
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
    (korean-ksc5601	#x29 #x2D)	; ø»ˆ¦ˆ
    (japanese-jisx0212	#x29 #x50)	; ø»Š°¯
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
    (latin-iso8859-1		#xFF)	; Ã¿
    (latin-iso8859-9		#xFF)	; øº“‡Ÿ
    (japanese-jisx0213-1	#x29 #x74)	; Ã¿
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
    (japanese-jisx0212	#x2B #x73)	; ø»Š´Ž
    ))
