(define-char
  '((name		. "NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (latin-iso8859-1		. #xA0)	; Â 
    (latin-iso8859-2		. #xA0)	; øº’µ 
    (latin-iso8859-3		. #xA0)	; øº’·€
    (latin-iso8859-4		. #xA0)	; øº’¸ 
    (greek-iso8859-7		. #xA0)	; Í°
    (hebrew-iso8859-8		. #xA0)	; Ö
    (cyrillic-iso8859-5		. #xA0)	; øº“„ 
    (latin-iso8859-9		. #xA0)	; øº“†€
    (japanese-jisx0213-1	. #x2922)	; Â 
    (ucs			. #xA0)	; Â 
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA1)	; Â¡
    (latin-iso8859-9		. #xA1)	; øº“†
    (japanese-jisx0213-1	. #x2923)	; Â¡
    (ucs			. #xA1)	; Â¡
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)	; Â¡
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A1)
    (korean-ksc5601	. #x222E)	; ø»ˆ›·
    (japanese-jisx0212	. #x2242)	; ø»Š¦
    ))
(define-char
  '((name		. "CENT SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xA2)	; Â¢
    (hebrew-iso8859-8	. #xA2)	; Ö’
    (latin-iso8859-9	. #xA2)	; øº“†‚
    (ucs		. #xA2)	; Â¢
    ))
(define-char
  '((name		. "POUND SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xA3)	; Â£
    (latin-iso8859-3	. #xA3)	; øº’·ƒ
    (greek-iso8859-7	. #xA3)	; Í³
    (hebrew-iso8859-8	. #xA3)	; Ö“
    (latin-iso8859-9	. #xA3)	; øº“†ƒ
    (ucs		. #xA3)	; Â£
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA4)	; Â¤
    (latin-iso8859-2		. #xA4)	; øº’µ¤
    (latin-iso8859-3		. #xA4)	; øº’·„
    (latin-iso8859-4		. #xA4)	; øº’¸¤
    (hebrew-iso8859-8		. #xA4)	; Ö”
    (latin-iso8859-9		. #xA4)	; øº“†„
    (japanese-jisx0213-1	. #x2924)	; Â¤
    (ucs			. #xA4)	; Â¤
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)	; Â¤
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	. #x2168)	; ø»„‡‹
    (korean-ksc5601	. #x2234)	; ø»ˆ›½
    (japanese-jisx0212	. #x2270)	; ø»Š¦½
    ))
(define-char
  '((name		. "YEN SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	. #x5C)	; øº‘Œ‡
    (latin-iso8859-1	. #xA5)	; Â¥
    (hebrew-iso8859-8	. #xA5)	; Ö•
    (latin-iso8859-9	. #xA5)	; øº“†…
    (ucs		. #xA5)	; Â¥
    ))
(define-char
  '((name		. "BROKEN BAR")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA6)	; Â¦
    (greek-iso8859-7		. #xA6)	; Í¶
    (hebrew-iso8859-8		. #xA6)	; Ö–
    (latin-iso8859-9		. #xA6)	; øº“††
    (japanese-jisx0213-1	. #x2925)	; Â¦
    (ucs			. #xA6)	; Â¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xA7)	; Â§
    (latin-iso8859-2	. #xA7)	; øº’µ§
    (latin-iso8859-3	. #xA7)	; øº’·‡
    (latin-iso8859-4	. #xA7)	; øº’¸§
    (greek-iso8859-7	. #xA7)	; Í·
    (hebrew-iso8859-8	. #xA7)	; Ö—
    (cyrillic-iso8859-5 . #xFD)	; øº“…½
    (latin-iso8859-9	. #xA7)	; øº“†‡
    (ucs		. #xA7)	; Â§
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)	; Â§
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A7)
    (japanese-jisx0208-1978	. #x2178)	; ø»½—
    (chinese-gb2312		. #x216C)	; ø»„‡
    (japanese-jisx0208		. #x2178)	; ø»†‘Ÿ
    (korean-ksc5601		. #x2157)	; ø»ˆ›‚
    (chinese-cns11643-1		. #x2170)	; ø»‘ƒ«
    (japanese-jisx0208-1990	. #x2178)	; ø»½—
    ))
(define-char
  '((name		. "DIAERESIS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (latin-iso8859-1	. #xA8)	; Â¨
    (latin-iso8859-2	. #xA8)	; øº’µ¨
    (latin-iso8859-3	. #xA8)	; øº’·ˆ
    (latin-iso8859-4	. #xA8)	; øº’¸¨
    (greek-iso8859-7	. #xA8)	; Í¸
    (hebrew-iso8859-8	. #xA8)	; Ö˜
    (latin-iso8859-9	. #xA8)	; øº“†ˆ
    (ucs		. #xA8)	; Â¨
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)	; Â¨
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A8)
    (japanese-jisx0208-1978	. #x212F)	; ø»¼Ž
    (chinese-gb2312		. #x2127)	; ø»„†Š
    (japanese-jisx0208		. #x212F)	; ø»†–
    (korean-ksc5601		. #x2127)	; ø»ˆš’
    (japanese-jisx0208-1990	. #x212F)	; ø»¼Ž
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xA9)	; Â©
    (greek-iso8859-7		. #xA9)	; Í¹
    (hebrew-iso8859-8		. #xA9)	; Ö™
    (latin-iso8859-9		. #xA9)	; øº“†‰
    (japanese-jisx0213-1	. #x2926)	; Â©
    (ucs			. #xA9)	; Â©
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)	; Â©
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A9)
    (japanese-jisx0212	. #x226D)	; ø»Š¦º
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (latin-iso8859-1		. #xAA)	; Âª
    (latin-iso8859-9		. #xAA)	; øº“†Š
    (japanese-jisx0213-1	. #x2927)	; Âª
    (ucs			. #xAA)	; Âª
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)	; Âª
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00AA)
    (korean-ksc5601	. #x2823)	; ø»ˆ¤ 
    (japanese-jisx0212	. #x226C)	; ø»Š¦¹
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		. #xAB)	; Â«
    (greek-iso8859-7		. #xAB)	; Í»
    (hebrew-iso8859-8		. #xAB)	; Ö›
    (latin-iso8859-9		. #xAB)	; øº“†‹
    (japanese-jisx0213-1	. #x2928)	; Â«
    (ucs			. #xAB)	; Â«
    ))
(define-char
  '((name		. "NOT SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xAC)	; Â¬
    (greek-iso8859-7	. #xAC)	; Í¼
    (hebrew-iso8859-8	. #xAC)	; Öœ
    (latin-iso8859-9	. #xAC)	; øº“†Œ
    (ucs		. #xAC)	; Â¬
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xAD)	; Â­
    (latin-iso8859-2		. #xAD)	; øº’µ­
    (latin-iso8859-3		. #xAD)	; øº’·
    (latin-iso8859-4		. #xAD)	; øº’¸­
    (greek-iso8859-7		. #xAD)	; Í½
    (hebrew-iso8859-8		. #xAD)	; Ö
    (cyrillic-iso8859-5		. #xAD)	; øº“„­
    (latin-iso8859-9		. #xAD)	; øº“†
    (japanese-jisx0213-1	. #x2929)	; Â­
    (ucs			. #xAD)	; Â­
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)	; Â­
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AD)
    (korean-ksc5601	. #x2129)	; ø»ˆš”
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xAE)	; Â®
    (hebrew-iso8859-8		. #xAE)	; Öž
    (latin-iso8859-9		. #xAE)	; øº“†Ž
    (japanese-jisx0213-1	. #x292A)	; Â®
    (ucs			. #xAE)	; Â®
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)	; Â®
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AE)
    (japanese-jisx0212	. #x226E)	; ø»Š¦»
    ))
(define-char
  '((name		. "MACRON")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (latin-iso8859-1		. #xAF)	; Â¯
    (latin-iso8859-4		. #xAF)	; øº’¸¯
    (latin-iso8859-9		. #xAF)	; øº“†
    (japanese-jisx0213-1	. #x292B)	; Â¯
    (ucs			. #xAF)	; Â¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xB0)	; Â°
    (latin-iso8859-2	. #xB0)	; øº’µ°
    (latin-iso8859-3	. #xB0)	; øº’·
    (latin-iso8859-4	. #xB0)	; øº’¸°
    (greek-iso8859-7	. #xB0)	; Î€
    (hebrew-iso8859-8	. #xB0)	; Ö 
    (latin-iso8859-9	. #xB0)	; øº“†
    (ucs		. #xB0)	; Â°
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)	; Â°
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B0)
    (japanese-jisx0208-1978	. #x216B)	; ø»½Š
    (chinese-gb2312		. #x2163)	; ø»„‡†
    (japanese-jisx0208		. #x216B)	; ø»†‘’
    (korean-ksc5601		. #x2146)	; ø»ˆš±
    (chinese-cns11643-1		. #x2278)	; ø»‘…‘
    (japanese-jisx0208-1990	. #x216B)	; ø»½Š
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	. #xB1)	; Â±
    (greek-iso8859-7	. #xB1)	; Î
    (hebrew-iso8859-8	. #xB1)	; Ö¡
    (latin-iso8859-9	. #xB1)	; øº“†‘
    (ucs		. #xB1)	; Â±
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)	; Â±
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B1)
    (japanese-jisx0208-1978	. #x215E)	; ø»¼½
    (chinese-gb2312		. #x2140)	; ø»„†£
    (japanese-jisx0208		. #x215E)	; ø»†‘…
    (korean-ksc5601		. #x213E)	; ø»ˆš©
    (chinese-cns11643-1		. #x2234)	; ø»‘„
    (japanese-jisx0208-1990	. #x215E)	; ø»¼½
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
    (latin-iso8859-1		. #xB2)	; Â²
    (latin-iso8859-3		. #xB2)	; øº’·’
    (greek-iso8859-7		. #xB2)	; Î‚
    (hebrew-iso8859-8		. #xB2)	; Ö¢
    (latin-iso8859-9		. #xB2)	; øº“†’
    (japanese-jisx0213-1	. #x292C)	; Â²
    (ucs			. #xB2)	; Â²
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT TWO")
    (->ucs		. #x00B2)	; Â²
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->decomposition	wide #x00B2)
    (korean-ksc5601	. #x2977)	; ø»ˆ§’
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
    (latin-iso8859-1		. #xB3)	; Â³
    (latin-iso8859-3		. #xB3)	; øº’·“
    (greek-iso8859-7		. #xB3)	; Îƒ
    (hebrew-iso8859-8		. #xB3)	; Ö£
    (latin-iso8859-9		. #xB3)	; øº“†“
    (japanese-jisx0213-1	. #x292D)	; Â³
    (ucs			. #xB3)	; Â³
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT THREE")
    (->ucs		. #x00B3)	; Â³
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->decomposition	wide #x00B3)
    (korean-ksc5601	. #x2978)	; ø»ˆ§“
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (latin-iso8859-1	. #xB4)	; Â´
    (latin-iso8859-2	. #xB4)	; øº’µ´
    (latin-iso8859-3	. #xB4)	; øº’·”
    (latin-iso8859-4	. #xB4)	; øº’¸´
    (hebrew-iso8859-8	. #xB4)	; Ö¤
    (latin-iso8859-9	. #xB4)	; øº“†”
    (ucs		. #xB4)	; Â´
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)	; Â´
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B4)
    (japanese-jisx0208-1978	. #x212D)	; ø»¼Œ
    (japanese-jisx0208		. #x212D)	; ø»†”
    (korean-ksc5601		. #x2225)	; ø»ˆ›®
    (japanese-jisx0208-1990	. #x212D)	; ø»¼Œ
    ))
(define-char
  '((name		. "MICRO SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BC)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (latin-iso8859-1	. #xB5)	; Âµ
    (latin-iso8859-3	. #xB5)	; øº’·•
    (hebrew-iso8859-8	. #xB5)	; Ö¥
    (latin-iso8859-9	. #xB5)	; øº“†•
    (ucs		. #xB5)	; Âµ
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xB6)	; Â¶
    (hebrew-iso8859-8	. #xB6)	; Ö¦
    (latin-iso8859-9	. #xB6)	; øº“†–
    (ucs		. #xB6)	; Â¶
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)	; Â¶
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B6)
    (japanese-jisx0208		. #x2279)	; ø»†’¾
    (korean-ksc5601		. #x2252)	; ø»ˆœ›
    (japanese-jisx0208-1990	. #x2279)	; ø»†’¾
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xB7)	; Â·
    (latin-iso8859-3		. #xB7)	; øº’·—
    (greek-iso8859-7		. #xB7)	; Î‡
    (hebrew-iso8859-8		. #xB7)	; Ö§
    (latin-iso8859-9		. #xB7)	; øº“†—
    (japanese-jisx0213-1	. #x292E)	; Â·
    (ucs			. #xB7)	; Â·
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)	; Â·
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B7)
    (korean-ksc5601	. #x2124)	; ø»ˆš
    (chinese-cns11643-1 . #x2126)	; ø»‘‚¡
    ))
(define-char
  '((name		. "CEDILLA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (latin-iso8859-1		. #xB8)	; Â¸
    (latin-iso8859-2		. #xB8)	; øº’µ¸
    (latin-iso8859-3		. #xB8)	; øº’·˜
    (latin-iso8859-4		. #xB8)	; øº’¸¸
    (hebrew-iso8859-8		. #xB8)	; Ö¨
    (latin-iso8859-9		. #xB8)	; øº“†˜
    (japanese-jisx0213-1	. #x292F)	; Â¸
    (ucs			. #xB8)	; Â¸
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)	; Â¸
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B8)
    (korean-ksc5601	. #x222C)	; ø»ˆ›µ
    (japanese-jisx0212	. #x2231)	; ø»Š¥¾
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
    (latin-iso8859-1		. #xB9)	; Â¹
    (hebrew-iso8859-8		. #xB9)	; Ö©
    (latin-iso8859-9		. #xB9)	; øº“†™
    (japanese-jisx0213-1	. #x2930)	; Â¹
    (ucs			. #xB9)	; Â¹
    ))
(define-char
  '((name		. "FULLWIDTH SUPERSCRIPT ONE")
    (->ucs		. #x00B9)	; Â¹
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->decomposition	wide #x00B9)
    (korean-ksc5601	. #x2976)	; ø»ˆ§‘
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (latin-iso8859-1		. #xBA)	; Âº
    (latin-iso8859-9		. #xBA)	; øº“†š
    (japanese-jisx0213-1	. #x2931)	; Âº
    (ucs			. #xBA)	; Âº
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)	; Âº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00BA)
    (korean-ksc5601	. #x282C)	; ø»ˆ¤©
    (japanese-jisx0212	. #x226B)	; ø»Š¦¸
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1		. #xBB)	; Â»
    (greek-iso8859-7		. #xBB)	; Î‹
    (hebrew-iso8859-8		. #xBB)	; Ö«
    (latin-iso8859-9		. #xBB)	; øº“†›
    (japanese-jisx0213-1	. #x2932)	; Â»
    (ucs			. #xBB)	; Â»
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (latin-iso8859-1		. #xBC)	; Â¼
    (hebrew-iso8859-8		. #xBC)	; Ö¬
    (latin-iso8859-9		. #xBC)	; øº“†œ
    (japanese-jisx0213-1	. #x2933)	; Â¼
    (ucs			. #xBC)	; Â¼
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)	; Â¼
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	wide #x00BC)
    (korean-ksc5601	. #x2879)	; ø»ˆ¥¶
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (latin-iso8859-1		. #xBD)	; Â½
    (latin-iso8859-3		. #xBD)	; øº’·
    (greek-iso8859-7		. #xBD)	; Î
    (hebrew-iso8859-8		. #xBD)	; Ö­
    (latin-iso8859-9		. #xBD)	; øº“†
    (japanese-jisx0213-1	. #x2934)	; Â½
    (ucs			. #xBD)	; Â½
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)	; Â½
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	wide #x00BD)
    (korean-ksc5601	. #x2876)	; ø»ˆ¥³
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (latin-iso8859-1		. #xBE)	; Â¾
    (hebrew-iso8859-8		. #xBE)	; Ö®
    (latin-iso8859-9		. #xBE)	; øº“†ž
    (japanese-jisx0213-1	. #x2935)	; Â¾
    (ucs			. #xBE)	; Â¾
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)	; Â¾
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	wide #x00BE)
    (korean-ksc5601	. #x287A)	; ø»ˆ¥·
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1		. #xBF)	; Â¿
    (latin-iso8859-9		. #xBF)	; øº“†Ÿ
    (japanese-jisx0213-1	. #x2936)	; Â¿
    (ucs			. #xBF)	; Â¿
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)	; Â¿
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BF)
    (korean-ksc5601	. #x222F)	; ø»ˆ›¸
    (japanese-jisx0212	. #x2244)	; ø»Š¦‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->lowercase	#x00E0)
    (latin-iso8859-1		. #xC0)	; Ã€
    (latin-iso8859-3		. #xC0)	; øº’· 
    (latin-iso8859-9		. #xC0)	; øº“† 
    (latin-viscii-upper		. #xE0)	; Ã€
    (latin-viscii		. #xC0)	; Ã€
    (japanese-jisx0213-1	. #x2937)	; Ã€
    (ucs			. #xC0)	; Ã€
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")
    (->ucs		. #x00C0)	; Ã€
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C0)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")))
    (japanese-jisx0212	. #x2A22)	; ø»Š±Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->lowercase	#x00E1)
    (latin-iso8859-1		. #xC1)	; Ã
    (latin-iso8859-2		. #xC1)	; øº’¶
    (latin-iso8859-3		. #xC1)	; øº’·¡
    (latin-iso8859-4		. #xC1)	; øº’¹
    (latin-iso8859-9		. #xC1)	; øº“†¡
    (latin-viscii-upper		. #xE1)	; Ã
    (latin-viscii		. #xC1)	; Ã
    (japanese-jisx0213-1	. #x2938)	; Ã
    (ucs			. #xC1)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")
    (->ucs		. #x00C1)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C1)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")))
    (japanese-jisx0212	. #x2A21)	; ø»Š±ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->lowercase	#x00E2)
    (latin-iso8859-1		. #xC2)	; Ã‚
    (latin-iso8859-2		. #xC2)	; øº’¶‚
    (latin-iso8859-3		. #xC2)	; øº’·¢
    (latin-iso8859-4		. #xC2)	; øº’¹‚
    (latin-iso8859-9		. #xC2)	; øº“†¢
    (latin-viscii-upper		. #xE2)	; Ã‚
    (latin-viscii		. #xC2)	; Ã‚
    (japanese-jisx0213-1	. #x2939)	; Ã‚
    (ucs			. #xC2)	; Ã‚
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00C2)	; Ã‚
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C2)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A24)	; ø»Š±¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->lowercase	#x00E3)
    (latin-iso8859-1		. #xC3)	; Ãƒ
    (latin-iso8859-4		. #xC3)	; øº’¹ƒ
    (latin-iso8859-9		. #xC3)	; øº“†£
    (latin-viscii-upper		. #xE3)	; Ãƒ
    (latin-viscii		. #xC3)	; Ãƒ
    (japanese-jisx0213-1	. #x293A)	; Ãƒ
    (ucs			. #xC3)	; Ãƒ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")
    (->ucs		. #x00C3)	; Ãƒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C3)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")))
    (japanese-jisx0212	. #x2A2A)	; ø»Š±§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->lowercase	#x00E4)
    (latin-iso8859-1		. #xC4)	; Ã„
    (latin-iso8859-2		. #xC4)	; øº’¶„
    (latin-iso8859-3		. #xC4)	; øº’·¤
    (latin-iso8859-4		. #xC4)	; øº’¹„
    (latin-iso8859-9		. #xC4)	; øº“†¤
    (japanese-jisx0213-1	. #x293B)	; Ã„
    (ucs			. #xC4)	; Ã„
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")
    (->ucs		. #x00C4)	; Ã„
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C4)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A23)	; ø»Š± 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->lowercase	#x00E5)
    (latin-iso8859-1		. #xC5)	; Ã…
    (latin-iso8859-4		. #xC5)	; øº’¹…
    (latin-iso8859-9		. #xC5)	; øº“†¥
    (japanese-jisx0213-1	. #x293C)	; Ã…
    (ucs			. #xC5)	; Ã…
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")
    (->ucs		. #x00C5)	; Ã…
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C5)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	. #x2A29)	; ø»Š±¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase	#x00E6)
    (latin-iso8859-1		. #xC6)	; Ã†
    (latin-iso8859-4		. #xC6)	; øº’¹†
    (latin-iso8859-9		. #xC6)	; øº“†¦
    (japanese-jisx0213-1	. #x293D)	; Ã†
    (ucs			. #xC6)	; Ã†
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)	; Ã†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	. #x2821)	; ø»ˆ¤ž
    (japanese-jisx0212	. #x2921)	; ø»Š°€
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->lowercase	#x00E7)
    (latin-iso8859-1		. #xC7)	; Ã‡
    (latin-iso8859-2		. #xC7)	; øº’¶‡
    (latin-iso8859-3		. #xC7)	; øº’·§
    (latin-iso8859-9		. #xC7)	; øº“†§
    (japanese-jisx0213-1	. #x293E)	; Ã‡
    (ucs			. #xC7)	; Ã‡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")
    (->ucs		. #x00C7)	; Ã‡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C7)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	. #x2A2E)	; ø»Š±«
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->lowercase	#x00E8)
    (latin-iso8859-1		. #xC8)	; Ãˆ
    (latin-iso8859-3		. #xC8)	; øº’·¨
    (latin-iso8859-9		. #xC8)	; øº“†¨
    (latin-viscii-upper		. #xE8)	; Ãˆ
    (latin-viscii		. #xC8)	; Ãˆ
    (japanese-jisx0213-1	. #x293F)	; Ãˆ
    (ucs			. #xC8)	; Ãˆ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")
    (->ucs		. #x00C8)	; Ãˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C8)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")))
    (japanese-jisx0212	. #x2A32)	; ø»Š±¯
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->lowercase	#x00E9)
    (latin-iso8859-1		. #xC9)	; Ã‰
    (latin-iso8859-2		. #xC9)	; øº’¶‰
    (latin-iso8859-3		. #xC9)	; øº’·©
    (latin-iso8859-4		. #xC9)	; øº’¹‰
    (latin-iso8859-9		. #xC9)	; øº“†©
    (latin-viscii-upper		. #xE9)	; Ã‰
    (latin-viscii		. #xC9)	; Ã‰
    (japanese-jisx0213-1	. #x2940)	; Ã‰
    (ucs			. #xC9)	; Ã‰
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")
    (->ucs		. #x00C9)	; Ã‰
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00C9)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")))
    (japanese-jisx0212	. #x2A31)	; ø»Š±®
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->lowercase	#x00EA)
    (latin-iso8859-1		. #xCA)	; ÃŠ
    (latin-iso8859-3		. #xCA)	; øº’·ª
    (latin-iso8859-9		. #xCA)	; øº“†ª
    (latin-viscii-upper		. #xEA)	; ÃŠ
    (latin-viscii		. #xCA)	; ÃŠ
    (japanese-jisx0213-1	. #x2941)	; ÃŠ
    (ucs			. #xCA)	; ÃŠ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00CA)	; ÃŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CA)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A34)	; ø»Š±±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->lowercase	#x00EB)
    (latin-iso8859-1		. #xCB)	; Ã‹
    (latin-iso8859-2		. #xCB)	; øº’¶‹
    (latin-iso8859-3		. #xCB)	; øº’·«
    (latin-iso8859-4		. #xCB)	; øº’¹‹
    (latin-iso8859-9		. #xCB)	; øº“†«
    (japanese-jisx0213-1	. #x2942)	; Ã‹
    (ucs			. #xCB)	; Ã‹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")
    (->ucs		. #x00CB)	; Ã‹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CB)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A33)	; ø»Š±°
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->lowercase	#x00EC)
    (latin-iso8859-1		. #xCC)	; ÃŒ
    (latin-iso8859-3		. #xCC)	; øº’·¬
    (latin-iso8859-9		. #xCC)	; øº“†¬
    (latin-viscii-upper		. #xEC)	; ÃŒ
    (latin-viscii		. #xCC)	; ÃŒ
    (japanese-jisx0213-1	. #x2943)	; ÃŒ
    (ucs			. #xCC)	; ÃŒ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")
    (->ucs		. #x00CC)	; ÃŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CC)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")))
    (japanese-jisx0212	. #x2A40)	; ø»Š±½
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->lowercase	#x00ED)
    (latin-iso8859-1		. #xCD)	; Ã
    (latin-iso8859-2		. #xCD)	; øº’¶
    (latin-iso8859-3		. #xCD)	; øº’·­
    (latin-iso8859-4		. #xCD)	; øº’¹
    (latin-iso8859-9		. #xCD)	; øº“†­
    (latin-viscii-upper		. #xED)	; Ã
    (latin-viscii		. #xCD)	; Ã
    (japanese-jisx0213-1	. #x2944)	; Ã
    (ucs			. #xCD)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")
    (->ucs		. #x00CD)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CD)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")))
    (japanese-jisx0212	. #x2A3F)	; ø»Š±¼
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->lowercase	#x00EE)
    (latin-iso8859-1		. #xCE)	; ÃŽ
    (latin-iso8859-2		. #xCE)	; øº’¶Ž
    (latin-iso8859-3		. #xCE)	; øº’·®
    (latin-iso8859-4		. #xCE)	; øº’¹Ž
    (latin-iso8859-9		. #xCE)	; øº“†®
    (japanese-jisx0213-1	. #x2945)	; ÃŽ
    (ucs			. #xCE)	; ÃŽ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00CE)	; ÃŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CE)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A42)	; ø»Š±¿
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->lowercase	#x00EF)
    (latin-iso8859-1		. #xCF)	; Ã
    (latin-iso8859-3		. #xCF)	; øº’·¯
    (latin-iso8859-9		. #xCF)	; øº“†¯
    (japanese-jisx0213-1	. #x2946)	; Ã
    (ucs			. #xCF)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")
    (->ucs		. #x00CF)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00CF)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A41)	; ø»Š±¾
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00F0)
    (latin-iso8859-1		. #xD0)	; Ã
    (japanese-jisx0213-1	. #x2947)	; Ã
    (ucs			. #xD0)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER ETH")
    (->ucs		. #x00D0)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00D0)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER ETH")))
    (korean-ksc5601	. #x2822)	; ø»ˆ¤Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->lowercase	#x00F1)
    (latin-iso8859-1		. #xD1)	; Ã‘
    (latin-iso8859-3		. #xD1)	; øº’·±
    (latin-iso8859-9		. #xD1)	; øº“†±
    (japanese-jisx0213-1	. #x2948)	; Ã‘
    (ucs			. #xD1)	; Ã‘
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")
    (->ucs		. #x00D1)	; Ã‘
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D1)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")))
    (japanese-jisx0212	. #x2A50)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->lowercase	#x00F2)
    (latin-iso8859-1		. #xD2)	; Ã’
    (latin-iso8859-3		. #xD2)	; øº’·²
    (latin-iso8859-9		. #xD2)	; øº“†²
    (latin-viscii-upper		. #xF2)	; Ã’
    (latin-viscii		. #xD2)	; Ã’
    (japanese-jisx0213-1	. #x2949)	; Ã’
    (ucs			. #xD2)	; Ã’
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH GRAVE")
    (->ucs		. #x00D2)	; Ã’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D2)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (japanese-jisx0212	. #x2A52)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->lowercase	#x00F3)
    (latin-iso8859-1		. #xD3)	; Ã“
    (latin-iso8859-2		. #xD3)	; øº’¶“
    (latin-iso8859-3		. #xD3)	; øº’·³
    (latin-iso8859-9		. #xD3)	; øº“†³
    (latin-viscii-upper		. #xF3)	; Ã“
    (latin-viscii		. #xD3)	; Ã“
    (japanese-jisx0213-1	. #x294A)	; Ã“
    (ucs			. #xD3)	; Ã“
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")
    (->ucs		. #x00D3)	; Ã“
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D3)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")))
    (japanese-jisx0212	. #x2A51)	; ø»Š²Ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->lowercase	#x00F4)
    (latin-iso8859-1		. #xD4)	; Ã”
    (latin-iso8859-2		. #xD4)	; øº’¶”
    (latin-iso8859-3		. #xD4)	; øº’·´
    (latin-iso8859-4		. #xD4)	; øº’¹”
    (latin-iso8859-9		. #xD4)	; øº“†´
    (latin-viscii-upper		. #xF4)	; Ã”
    (latin-viscii		. #xD4)	; Ã”
    (japanese-jisx0213-1	. #x294B)	; Ã”
    (ucs			. #xD4)	; Ã”
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00D4)	; Ã”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D4)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A54)	; ø»Š²‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->lowercase	#x00F5)
    (latin-iso8859-1		. #xD5)	; Ã•
    (latin-iso8859-4		. #xD5)	; øº’¹•
    (latin-iso8859-9		. #xD5)	; øº“†µ
    (latin-viscii-upper		. #xF5)	; Ã•
    (latin-viscii		. #xA0)	; Ã•
    (japanese-jisx0213-1	. #x294C)	; Ã•
    (ucs			. #xD5)	; Ã•
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")
    (->ucs		. #x00D5)	; Ã•
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D5)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	. #x2A58)	; ø»Š²•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->lowercase	#x00F6)
    (latin-iso8859-1		. #xD6)	; Ã–
    (latin-iso8859-2		. #xD6)	; øº’¶–
    (latin-iso8859-3		. #xD6)	; øº’·¶
    (latin-iso8859-4		. #xD6)	; øº’¹–
    (latin-iso8859-9		. #xD6)	; øº“†¶
    (japanese-jisx0213-1	. #x294D)	; Ã–
    (ucs			. #xD6)	; Ã–
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")
    (->ucs		. #x00D6)	; Ã–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00D6)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A53)	; ø»Š²
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xD7)	; Ã—
    (latin-iso8859-2	. #xD7)	; øº’¶—
    (latin-iso8859-3	. #xD7)	; øº’··
    (latin-iso8859-4	. #xD7)	; øº’¹—
    (hebrew-iso8859-8	. #xAA)	; Öš
    (latin-iso8859-9	. #xD7)	; øº“†·
    (ucs		. #xD7)	; Ã—
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)	; Ã—
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00D7)
    (japanese-jisx0208-1978	. #x215F)	; ø»¼¾
    (chinese-gb2312		. #x2141)	; ø»„†¤
    (japanese-jisx0208		. #x215F)	; ø»†‘†
    (korean-ksc5601		. #x213F)	; ø»ˆšª
    (chinese-cns11643-1		. #x2232)	; ø»‘„‹
    (japanese-jisx0208-1990	. #x215F)	; ø»¼¾
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1		. #xD8)	; Ã˜
    (latin-iso8859-4		. #xD8)	; øº’¹˜
    (latin-iso8859-9		. #xD8)	; øº“†¸
    (japanese-jisx0213-1	. #x294E)	; Ã˜
    (ucs			. #xD8)	; Ã˜
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)	; Ã˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	. #x282A)	; ø»ˆ¤§
    (japanese-jisx0212	. #x292C)	; ø»Š°‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase	#x00F9)
    (latin-iso8859-1		. #xD9)	; Ã™
    (latin-iso8859-3		. #xD9)	; øº’·¹
    (latin-iso8859-9		. #xD9)	; øº“†¹
    (latin-viscii-upper		. #xF9)	; Ã™
    (latin-viscii		. #xD9)	; Ã™
    (japanese-jisx0213-1	. #x294F)	; Ã™
    (ucs			. #xD9)	; Ã™
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")
    (->ucs		. #x00D9)	; Ã™
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")))
    (japanese-jisx0212	. #x2A63)	; ø»Š² 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->lowercase	#x00FA)
    (latin-iso8859-1		. #xDA)	; Ãš
    (latin-iso8859-2		. #xDA)	; øº’¶š
    (latin-iso8859-3		. #xDA)	; øº’·º
    (latin-iso8859-4		. #xDA)	; øº’¹š
    (latin-iso8859-9		. #xDA)	; øº“†º
    (latin-viscii-upper		. #xFA)	; Ãš
    (latin-viscii		. #xDA)	; Ãš
    (japanese-jisx0213-1	. #x2950)	; Ãš
    (ucs			. #xDA)	; Ãš
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")
    (->ucs		. #x00DA)	; Ãš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DA)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")))
    (japanese-jisx0212	. #x2A62)	; ø»Š²Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->lowercase	#x00FB)
    (latin-iso8859-1		. #xDB)	; Ã›
    (latin-iso8859-3		. #xDB)	; øº’·»
    (latin-iso8859-4		. #xDB)	; øº’¹›
    (latin-iso8859-9		. #xDB)	; øº“†»
    (japanese-jisx0213-1	. #x2951)	; Ã›
    (ucs			. #xDB)	; Ã›
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00DB)	; Ã›
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DB)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A65)	; ø»Š²¢
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->lowercase	#x00FC)
    (latin-iso8859-1		. #xDC)	; Ãœ
    (latin-iso8859-2		. #xDC)	; øº’¶œ
    (latin-iso8859-3		. #xDC)	; øº’·¼
    (latin-iso8859-4		. #xDC)	; øº’¹œ
    (latin-iso8859-9		. #xDC)	; øº“†¼
    (japanese-jisx0213-1	. #x2952)	; Ãœ
    (ucs			. #xDC)	; Ãœ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")
    (->ucs		. #x00DC)	; Ãœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DC)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A64)	; ø»Š²¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->lowercase	#x00FD)
    (latin-iso8859-1		. #xDD)	; Ã
    (latin-iso8859-2		. #xDD)	; øº’¶
    (latin-viscii-upper		. #xFD)	; Ã
    (latin-viscii		. #xDD)	; Ã
    (japanese-jisx0213-1	. #x2953)	; Ã
    (ucs			. #xDD)	; Ã
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH ACUTE")
    (->ucs		. #x00DD)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00DD)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	. #x2A72)	; ø»Š²¯
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00FE)
    (latin-iso8859-1		. #xDE)	; Ãž
    (japanese-jisx0213-1	. #x2954)	; Ãž
    (ucs			. #xDE)	; Ãž
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER THORN")
    (->ucs		. #x00DE)	; Ãž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00DE)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER THORN")))
    (korean-ksc5601	. #x282D)	; ø»ˆ¤ª
    (japanese-jisx0212	. #x2930)	; ø»Š°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1		. #xDF)	; ÃŸ
    (latin-iso8859-2		. #xDF)	; øº’¶Ÿ
    (latin-iso8859-3		. #xDF)	; øº’·¿
    (latin-iso8859-4		. #xDF)	; øº’¹Ÿ
    (latin-iso8859-9		. #xDF)	; øº“†¿
    (japanese-jisx0213-1	. #x2955)	; ÃŸ
    (ucs			. #xDF)	; ÃŸ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)	; ÃŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->decomposition	wide #x00DF)
    (korean-ksc5601	. #x292C)	; ø»ˆ¦‡
    (japanese-jisx0212	. #x294E)	; ø»Š°­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0300)
    (->uppercase	#x00C0)
    (->titlecase	#x00C0)
    (latin-iso8859-1		. #xE0)	; Ã 
    (latin-iso8859-3		. #xE0)	; øº’¸€
    (latin-iso8859-9		. #xE0)	; øº“‡€
    (latin-viscii-lower		. #xE0)	; Ã 
    (latin-viscii		. #xE0)	; Ã 
    (japanese-jisx0213-1	. #x2956)	; Ã 
    (ucs			. #xE0)	; Ã 
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH GRAVE")
    (->ucs		. #x00E0)	; Ã 
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E0)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH GRAVE")))
    (chinese-gb2312	. #x2824)	; ø»„™
    (japanese-jisx0212	. #x2B22)	; ø»Š²½
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0301)
    (->uppercase	#x00C1)
    (->titlecase	#x00C1)
    (latin-iso8859-1		. #xE1)	; Ã¡
    (latin-iso8859-2		. #xE1)	; øº’¶¡
    (latin-iso8859-3		. #xE1)	; øº’¸
    (latin-iso8859-4		. #xE1)	; øº’¹¡
    (latin-iso8859-9		. #xE1)	; øº“‡
    (latin-viscii-lower		. #xE1)	; Ã¡
    (latin-viscii		. #xE1)	; Ã¡
    (japanese-jisx0213-1	. #x2957)	; Ã¡
    (ucs			. #xE1)	; Ã¡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH ACUTE")
    (->ucs		. #x00E1)	; Ã¡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E1)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH ACUTE")))
    (chinese-gb2312	. #x2822)	; ø»„—
    (japanese-jisx0212	. #x2B21)	; ø»Š²¼
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0302)
    (->uppercase	#x00C2)
    (->titlecase	#x00C2)
    (latin-iso8859-1		. #xE2)	; Ã¢
    (latin-iso8859-2		. #xE2)	; øº’¶¢
    (latin-iso8859-3		. #xE2)	; øº’¸‚
    (latin-iso8859-4		. #xE2)	; øº’¹¢
    (latin-iso8859-9		. #xE2)	; øº“‡‚
    (latin-viscii-lower		. #xE2)	; Ã¢
    (latin-viscii		. #xE2)	; Ã¢
    (japanese-jisx0213-1	. #x2958)	; Ã¢
    (ucs			. #xE2)	; Ã¢
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (->ucs		. #x00E2)	; Ã¢
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E2)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B24)	; ø»Š²¿
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0303)
    (->uppercase	#x00C3)
    (->titlecase	#x00C3)
    (latin-iso8859-1		. #xE3)	; Ã£
    (latin-iso8859-4		. #xE3)	; øº’¹£
    (latin-iso8859-9		. #xE3)	; øº“‡ƒ
    (latin-viscii-lower		. #xE3)	; Ã£
    (latin-viscii		. #xE3)	; Ã£
    (japanese-jisx0213-1	. #x2959)	; Ã£
    (ucs			. #xE3)	; Ã£
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH TILDE")
    (->ucs		. #x00E3)	; Ã£
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E3)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH TILDE")))
    (japanese-jisx0212	. #x2B2A)	; ø»Š³…
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0308)
    (->uppercase	#x00C4)
    (->titlecase	#x00C4)
    (latin-iso8859-1		. #xE4)	; Ã¤
    (latin-iso8859-2		. #xE4)	; øº’¶¤
    (latin-iso8859-3		. #xE4)	; øº’¸„
    (latin-iso8859-4		. #xE4)	; øº’¹¤
    (latin-iso8859-9		. #xE4)	; øº“‡„
    (japanese-jisx0213-1	. #x295A)	; Ã¤
    (ucs			. #xE4)	; Ã¤
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH DIAERESIS")
    (->ucs		. #x00E4)	; Ã¤
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E4)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B23)	; ø»Š²¾
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x030A)
    (->uppercase	#x00C5)
    (->titlecase	#x00C5)
    (latin-iso8859-1		. #xE5)	; Ã¥
    (latin-iso8859-4		. #xE5)	; øº’¹¥
    (latin-iso8859-9		. #xE5)	; øº“‡…
    (japanese-jisx0213-1	. #x295B)	; Ã¥
    (ucs			. #xE5)	; Ã¥
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH RING ABOVE")
    (->ucs		. #x00E5)	; Ã¥
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E5)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH RING ABOVE")))
    (japanese-jisx0212	. #x2B29)	; ø»Š³„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER AE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->uppercase	#x00C6)
    (->titlecase	#x00C6)
    (latin-iso8859-1		. #xE6)	; Ã¦
    (latin-iso8859-4		. #xE6)	; øº’¹¦
    (latin-iso8859-9		. #xE6)	; øº“‡†
    (ipa			. #xA4)	; øº’š¤
    (japanese-jisx0213-1	. #x295C)	; Ã¦
    (ucs			. #xE6)	; Ã¦
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER AE")
    (->ucs		. #x00E6)	; Ã¦
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->decomposition	wide #x00E6)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER AE")))
    (korean-ksc5601	. #x2921)	; ø»ˆ¥¼
    (japanese-jisx0212	. #x2941)	; ø»Š° 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0327)
    (->uppercase	#x00C7)
    (->titlecase	#x00C7)
    (latin-iso8859-1		. #xE7)	; Ã§
    (latin-iso8859-2		. #xE7)	; øº’¶§
    (latin-iso8859-3		. #xE7)	; øº’¸‡
    (latin-iso8859-9		. #xE7)	; øº“‡‡
    (ipa			. #xCE)	; øº’›Ž
    (japanese-jisx0213-1	. #x295D)	; Ã§
    (ucs			. #xE7)	; Ã§
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CEDILLA")
    (->ucs		. #x00E7)	; Ã§
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E7)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CEDILLA")))
    (japanese-jisx0212	. #x2B2E)	; ø»Š³‰
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0300)
    (->uppercase	#x00C8)
    (->titlecase	#x00C8)
    (latin-iso8859-1		. #xE8)	; Ã¨
    (latin-iso8859-3		. #xE8)	; øº’¸ˆ
    (latin-iso8859-9		. #xE8)	; øº“‡ˆ
    (latin-viscii-lower		. #xE8)	; Ã¨
    (latin-viscii		. #xE8)	; Ã¨
    (japanese-jisx0213-1	. #x295E)	; Ã¨
    (ucs			. #xE8)	; Ã¨
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH GRAVE")
    (->ucs		. #x00E8)	; Ã¨
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E8)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH GRAVE")))
    (chinese-gb2312	. #x2828)	; ø»„
    (japanese-jisx0212	. #x2B32)	; ø»Š³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0301)
    (->uppercase	#x00C9)
    (->titlecase	#x00C9)
    (latin-iso8859-1		. #xE9)	; Ã©
    (latin-iso8859-2		. #xE9)	; øº’¶©
    (latin-iso8859-3		. #xE9)	; øº’¸‰
    (latin-iso8859-4		. #xE9)	; øº’¹©
    (latin-iso8859-9		. #xE9)	; øº“‡‰
    (latin-viscii-lower		. #xE9)	; Ã©
    (latin-viscii		. #xE9)	; Ã©
    (japanese-jisx0213-1	. #x295F)	; Ã©
    (ucs			. #xE9)	; Ã©
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH ACUTE")
    (->ucs		. #x00E9)	; Ã©
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00E9)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH ACUTE")))
    (chinese-gb2312	. #x2826)	; ø»„›
    (japanese-jisx0212	. #x2B31)	; ø»Š³Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0302)
    (->uppercase	#x00CA)
    (->titlecase	#x00CA)
    (latin-iso8859-1		. #xEA)	; Ãª
    (latin-iso8859-3		. #xEA)	; øº’¸Š
    (latin-iso8859-9		. #xEA)	; øº“‡Š
    (latin-viscii-lower		. #xEA)	; Ãª
    (latin-viscii		. #xEA)	; Ãª
    (japanese-jisx0213-1	. #x2960)	; Ãª
    (ucs			. #xEA)	; Ãª
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (->ucs		. #x00EA)	; Ãª
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EA)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CIRCUMFLEX")))
    (chinese-gb2312	. #x283A)	; ø»„¯
    (japanese-jisx0212	. #x2B34)	; ø»Š³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0308)
    (->uppercase	#x00CB)
    (->titlecase	#x00CB)
    (latin-iso8859-1		. #xEB)	; Ã«
    (latin-iso8859-2		. #xEB)	; øº’¶«
    (latin-iso8859-3		. #xEB)	; øº’¸‹
    (latin-iso8859-4		. #xEB)	; øº’¹«
    (latin-iso8859-9		. #xEB)	; øº“‡‹
    (japanese-jisx0213-1	. #x2961)	; Ã«
    (ucs			. #xEB)	; Ã«
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DIAERESIS")
    (->ucs		. #x00EB)	; Ã«
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EB)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B33)	; ø»Š³Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0300)
    (->uppercase	#x00CC)
    (->titlecase	#x00CC)
    (latin-iso8859-1		. #xEC)	; Ã¬
    (latin-iso8859-3		. #xEC)	; øº’¸Œ
    (latin-iso8859-9		. #xEC)	; øº“‡Œ
    (latin-viscii-lower		. #xEC)	; Ã¬
    (latin-viscii		. #xEC)	; Ã¬
    (japanese-jisx0213-1	. #x2962)	; Ã¬
    (ucs			. #xEC)	; Ã¬
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH GRAVE")
    (->ucs		. #x00EC)	; Ã¬
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EC)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH GRAVE")))
    (chinese-gb2312	. #x282C)	; ø»„¡
    (japanese-jisx0212	. #x2B40)	; ø»Š³›
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0301)
    (->uppercase	#x00CD)
    (->titlecase	#x00CD)
    (latin-iso8859-1		. #xED)	; Ã­
    (latin-iso8859-2		. #xED)	; øº’¶­
    (latin-iso8859-3		. #xED)	; øº’¸
    (latin-iso8859-4		. #xED)	; øº’¹­
    (latin-iso8859-9		. #xED)	; øº“‡
    (latin-viscii-lower		. #xED)	; Ã­
    (latin-viscii		. #xED)	; Ã­
    (japanese-jisx0213-1	. #x2963)	; Ã­
    (ucs			. #xED)	; Ã­
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH ACUTE")
    (->ucs		. #x00ED)	; Ã­
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00ED)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH ACUTE")))
    (chinese-gb2312	. #x282A)	; ø»„Ÿ
    (japanese-jisx0212	. #x2B3F)	; ø»Š³š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0302)
    (->uppercase	#x00CE)
    (->titlecase	#x00CE)
    (latin-iso8859-1		. #xEE)	; Ã®
    (latin-iso8859-2		. #xEE)	; øº’¶®
    (latin-iso8859-3		. #xEE)	; øº’¸Ž
    (latin-iso8859-4		. #xEE)	; øº’¹®
    (latin-iso8859-9		. #xEE)	; øº“‡Ž
    (japanese-jisx0213-1	. #x2964)	; Ã®
    (ucs			. #xEE)	; Ã®
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (->ucs		. #x00EE)	; Ã®
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00EE)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B42)	; ø»Š³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase	#x00CF)
    (->titlecase	#x00CF)
    (latin-iso8859-1		. #xEF)	; Ã¯
    (latin-iso8859-3		. #xEF)	; øº’¸
    (latin-iso8859-9		. #xEF)	; øº“‡
    (japanese-jisx0213-1	. #x2965)	; Ã¯
    (ucs			. #xEF)	; Ã¯
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH DIAERESIS")
    (->ucs		. #x00EF)	; Ã¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B41)	; ø»Š³œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ETH")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase	#x00D0)
    (->titlecase	#x00D0)
    (latin-iso8859-1		. #xF0)	; Ã°
    (ipa			. #xC9)	; øº’›‰
    (japanese-jisx0213-1	. #x2966)	; Ã°
    (ucs			. #xF0)	; Ã°
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER ETH")
    (->ucs		. #x00F0)	; Ã°
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ETH")))
    (korean-ksc5601	. #x2923)	; ø»ˆ¥¾
    (japanese-jisx0212	. #x2943)	; ø»Š°¢
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0303)
    (->uppercase	#x00D1)
    (->titlecase	#x00D1)
    (latin-iso8859-1		. #xF1)	; Ã±
    (latin-iso8859-3		. #xF1)	; øº’¸‘
    (latin-iso8859-9		. #xF1)	; øº“‡‘
    (japanese-jisx0213-1	. #x2967)	; Ã±
    (ucs			. #xF1)	; Ã±
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH TILDE")
    (->ucs		. #x00F1)	; Ã±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F1)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH TILDE")))
    (japanese-jisx0212	. #x2B50)	; ø»Š³«
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0300)
    (->uppercase	#x00D2)
    (->titlecase	#x00D2)
    (latin-iso8859-1		. #xF2)	; Ã²
    (latin-iso8859-3		. #xF2)	; øº’¸’
    (latin-iso8859-9		. #xF2)	; øº“‡’
    (latin-viscii-lower		. #xF2)	; Ã²
    (latin-viscii		. #xF2)	; Ã²
    (japanese-jisx0213-1	. #x2968)	; Ã²
    (ucs			. #xF2)	; Ã²
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")
    (->ucs		. #x00F2)	; Ã²
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F2)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH GRAVE")))
    (chinese-gb2312	. #x2830)	; ø»„¥
    (japanese-jisx0212	. #x2B52)	; ø»Š³­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0301)
    (->uppercase	#x00D3)
    (->titlecase	#x00D3)
    (latin-iso8859-1		. #xF3)	; Ã³
    (latin-iso8859-2		. #xF3)	; øº’¶³
    (latin-iso8859-3		. #xF3)	; øº’¸“
    (latin-iso8859-9		. #xF3)	; øº“‡“
    (latin-viscii-lower		. #xF3)	; Ã³
    (latin-viscii		. #xF3)	; Ã³
    (japanese-jisx0213-1	. #x2969)	; Ã³
    (ucs			. #xF3)	; Ã³
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH ACUTE")
    (->ucs		. #x00F3)	; Ã³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F3)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH ACUTE")))
    (chinese-gb2312	. #x282E)	; ø»„£
    (japanese-jisx0212	. #x2B51)	; ø»Š³¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0302)
    (->uppercase	#x00D4)
    (->titlecase	#x00D4)
    (latin-iso8859-1		. #xF4)	; Ã´
    (latin-iso8859-2		. #xF4)	; øº’¶´
    (latin-iso8859-3		. #xF4)	; øº’¸”
    (latin-iso8859-4		. #xF4)	; øº’¹´
    (latin-iso8859-9		. #xF4)	; øº“‡”
    (latin-viscii-lower		. #xF4)	; Ã´
    (latin-viscii		. #xF4)	; Ã´
    (japanese-jisx0213-1	. #x296A)	; Ã´
    (ucs			. #xF4)	; Ã´
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (->ucs		. #x00F4)	; Ã´
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F4)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B54)	; ø»Š³¯
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0303)
    (->uppercase	#x00D5)
    (->titlecase	#x00D5)
    (latin-iso8859-1		. #xF5)	; Ãµ
    (latin-iso8859-4		. #xF5)	; øº’¹µ
    (latin-iso8859-9		. #xF5)	; øº“‡•
    (latin-viscii-lower		. #xF5)	; Ãµ
    (latin-viscii		. #xF5)	; Ãµ
    (japanese-jisx0213-1	. #x296B)	; Ãµ
    (ucs			. #xF5)	; Ãµ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH TILDE")
    (->ucs		. #x00F5)	; Ãµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F5)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH TILDE")))
    (japanese-jisx0212	. #x2B58)	; ø»Š³³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0308)
    (->uppercase	#x00D6)
    (->titlecase	#x00D6)
    (latin-iso8859-1		. #xF6)	; Ã¶
    (latin-iso8859-2		. #xF6)	; øº’¶¶
    (latin-iso8859-3		. #xF6)	; øº’¸–
    (latin-iso8859-4		. #xF6)	; øº’¹¶
    (latin-iso8859-9		. #xF6)	; øº“‡–
    (japanese-jisx0213-1	. #x296C)	; Ã¶
    (ucs			. #xF6)	; Ã¶
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH DIAERESIS")
    (->ucs		. #x00F6)	; Ã¶
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F6)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B53)	; ø»Š³®
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	. #xF7)	; Ã·
    (latin-iso8859-2	. #xF7)	; øº’¶·
    (latin-iso8859-3	. #xF7)	; øº’¸—
    (latin-iso8859-4	. #xF7)	; øº’¹·
    (hebrew-iso8859-8	. #xBA)	; Öª
    (latin-iso8859-9	. #xF7)	; øº“‡—
    (ucs		. #xF7)	; Ã·
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)	; Ã·
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00F7)
    (japanese-jisx0208-1978	. #x2160)	; ø»¼¿
    (chinese-gb2312		. #x2142)	; ø»„†¥
    (japanese-jisx0208		. #x2160)	; ø»†‘‡
    (korean-ksc5601		. #x2140)	; ø»ˆš«
    (chinese-cns11643-1		. #x2233)	; ø»‘„Œ
    (japanese-jisx0208-1990	. #x2160)	; ø»¼¿
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1		. #xF8)	; Ã¸
    (latin-iso8859-4		. #xF8)	; øº’¹¸
    (latin-iso8859-9		. #xF8)	; øº“‡˜
    (ipa			. #xAF)	; øº’š¯
    (japanese-jisx0213-1	. #x296D)	; Ã¸
    (ucs			. #xF8)	; Ã¸
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")
    (->ucs		. #x00F8)	; Ã¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F8)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")))
    (korean-ksc5601	. #x292A)	; ø»ˆ¦…
    (japanese-jisx0212	. #x294C)	; ø»Š°«
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0300)
    (->uppercase	#x00D9)
    (->titlecase	#x00D9)
    (latin-iso8859-1		. #xF9)	; Ã¹
    (latin-iso8859-3		. #xF9)	; øº’¸™
    (latin-iso8859-9		. #xF9)	; øº“‡™
    (latin-viscii-lower		. #xF9)	; Ã¹
    (latin-viscii		. #xF9)	; Ã¹
    (japanese-jisx0213-1	. #x296E)	; Ã¹
    (ucs			. #xF9)	; Ã¹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH GRAVE")
    (->ucs		. #x00F9)	; Ã¹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00F9)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH GRAVE")))
    (chinese-gb2312	. #x2834)	; ø»„©
    (japanese-jisx0212	. #x2B63)	; ø»Š³¾
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0301)
    (->uppercase	#x00DA)
    (->titlecase	#x00DA)
    (latin-iso8859-1		. #xFA)	; Ãº
    (latin-iso8859-2		. #xFA)	; øº’¶º
    (latin-iso8859-3		. #xFA)	; øº’¸š
    (latin-iso8859-4		. #xFA)	; øº’¹º
    (latin-iso8859-9		. #xFA)	; øº“‡š
    (latin-viscii-lower		. #xFA)	; Ãº
    (latin-viscii		. #xFA)	; Ãº
    (japanese-jisx0213-1	. #x296F)	; Ãº
    (ucs			. #xFA)	; Ãº
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH ACUTE")
    (->ucs		. #x00FA)	; Ãº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FA)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH ACUTE")))
    (chinese-gb2312	. #x2832)	; ø»„§
    (japanese-jisx0212	. #x2B62)	; ø»Š³½
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0302)
    (->uppercase	#x00DB)
    (->titlecase	#x00DB)
    (latin-iso8859-1		. #xFB)	; Ã»
    (latin-iso8859-3		. #xFB)	; øº’¸›
    (latin-iso8859-4		. #xFB)	; øº’¹»
    (latin-iso8859-9		. #xFB)	; øº“‡›
    (japanese-jisx0213-1	. #x2970)	; Ã»
    (ucs			. #xFB)	; Ã»
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (->ucs		. #x00FB)	; Ã»
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FB)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B65)	; ø»Š´€
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0308)
    (->uppercase	#x00DC)
    (->titlecase	#x00DC)
    (latin-iso8859-1		. #xFC)	; Ã¼
    (latin-iso8859-2		. #xFC)	; øº’¶¼
    (latin-iso8859-3		. #xFC)	; øº’¸œ
    (latin-iso8859-4		. #xFC)	; øº’¹¼
    (latin-iso8859-9		. #xFC)	; øº“‡œ
    (japanese-jisx0213-1	. #x2971)	; Ã¼
    (ucs			. #xFC)	; Ã¼
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH DIAERESIS")
    (->ucs		. #x00FC)	; Ã¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FC)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DIAERESIS")))
    (chinese-gb2312	. #x2839)	; ø»„®
    (japanese-jisx0212	. #x2B64)	; ø»Š³¿
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0301)
    (->uppercase	#x00DD)
    (->titlecase	#x00DD)
    (latin-iso8859-1		. #xFD)	; Ã½
    (latin-iso8859-2		. #xFD)	; øº’¶½
    (latin-viscii-lower		. #xFD)	; Ã½
    (latin-viscii		. #xFD)	; Ã½
    (japanese-jisx0213-1	. #x2972)	; Ã½
    (ucs			. #xFD)	; Ã½
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")
    (->ucs		. #x00FD)	; Ã½
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FD)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH ACUTE")))
    (japanese-jisx0212	. #x2B72)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN SMALL LETTER THORN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase	#x00DE)
    (->titlecase	#x00DE)
    (latin-iso8859-1		. #xFE)	; Ã¾
    (japanese-jisx0213-1	. #x2973)	; Ã¾
    (ucs			. #xFE)	; Ã¾
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER THORN")
    (->ucs		. #x00FE)	; Ã¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->decomposition	wide #x00FE)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER THORN")))
    (korean-ksc5601	. #x292D)	; ø»ˆ¦ˆ
    (japanese-jisx0212	. #x2950)	; ø»Š°¯
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0308)
    (->uppercase	#x0178)
    (->titlecase	#x0178)
    (latin-iso8859-1		. #xFF)	; Ã¿
    (latin-iso8859-9		. #xFF)	; øº“‡Ÿ
    (japanese-jisx0213-1	. #x2974)	; Ã¿
    (ucs			. #xFF)	; Ã¿
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH DIAERESIS")
    (->ucs		. #x00FF)	; Ã¿
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00FF)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")))
    (japanese-jisx0212	. #x2B73)	; ø»Š´Ž
    ))
