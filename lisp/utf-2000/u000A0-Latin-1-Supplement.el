(define-char
  '((name		. "NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (->fullwidth
     ((name		  . "fullwidth no-break space")
      (japanese-jisx0213-1	  . #x2922)	; ø»¢ž­
      ))
    (latin-iso8859-1	. #xA0)	; øº’´€
    (latin-iso8859-2	. #xA0)	; øº’µ 
    (latin-iso8859-3	. #xA0)	; øº’·€
    (latin-iso8859-4	. #xA0)	; øº’¸ 
    (greek-iso8859-7	. #xA0)	; øº’» 
    (hebrew-iso8859-8	. #xA0)	; øº’¾ 
    (cyrillic-iso8859-5 . #xA0)	; øº“„ 
    (latin-iso8859-9	. #xA0)	; øº“†€
    (latin-tcvn5712	. #xA0)	; øº“™ 
    (ucs		. #x00A0)	; Â 
    ))
(define-char
  '((name		. "fullwidth no-break space")
    (=>ucs		. #x00A0)	; Â 
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "NO-BREAK SPACE")
      (ucs		  . #x00A0)	; Â 
      ))
    (japanese-jisx0213-1	. #x2922)	; ø»¢ž­
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth inverted exclamation mark")
      (korean-ksc5601		  . #x222E)	; ø»ˆ›·
      (japanese-jisx0212	  . #x2242)	; ø»Š¦
      (japanese-jisx0213-1	  . #x2923)	; ø»¢ž®
      ))
    (latin-iso8859-1	. #xA1)	; øº’´
    (latin-iso8859-9	. #xA1)	; øº“†
    (ucs		. #x00A1)	; Â¡
    ))
(define-char
  '((name		. "fullwidth inverted exclamation mark")
    (=>ucs		. #x00A1)	; Â¡
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "INVERTED EXCLAMATION MARK")
      (ucs		  . #x00A1)	; Â¡
      ))
    (korean-ksc5601		. #x222E)	; ø»ˆ›·
    (japanese-jisx0212		. #x2242)	; ø»Š¦
    (japanese-jisx0213-1	. #x2923)	; ø»¢ž®
    ))
(define-char
  '((name		. "CENT SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CENT SIGN")
      (ucs		  . #xFFE0)	; ï¿ 
      ))
    (latin-iso8859-1	. #xA2)	; øº’´‚
    (hebrew-iso8859-8	. #xA2)	; øº’¾¢
    (latin-iso8859-9	. #xA2)	; øº“†‚
    (ucs		. #x00A2)	; Â¢
    ))
(define-char
  '((name		. "POUND SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH POUND SIGN")
      (ucs		  . #xFFE1)	; ï¿¡
      ))
    (latin-iso8859-1	. #xA3)	; øº’´ƒ
    (latin-iso8859-3	. #xA3)	; øº’·ƒ
    (greek-iso8859-7	. #xA3)	; øº’»£
    (hebrew-iso8859-8	. #xA3)	; øº’¾£
    (latin-iso8859-9	. #xA3)	; øº“†ƒ
    (ucs		. #x00A3)	; Â£
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth currency sign")
      (chinese-gb2312		  . #x2168)	; ø»„‡‹
      (korean-ksc5601		  . #x2234)	; ø»ˆ›½
      (japanese-jisx0212	  . #x2270)	; ø»Š¦½
      (japanese-jisx0213-1	  . #x2924)	; ø»¢ž¯
      ))
    (latin-iso8859-1	. #xA4)	; øº’´„
    (latin-iso8859-2	. #xA4)	; øº’µ¤
    (latin-iso8859-3	. #xA4)	; øº’·„
    (latin-iso8859-4	. #xA4)	; øº’¸¤
    (hebrew-iso8859-8	. #xA4)	; øº’¾¤
    (latin-iso8859-9	. #xA4)	; øº“†„
    (ucs		. #x00A4)	; Â¤
    ))
(define-char
  '((name		. "fullwidth currency sign")
    (=>ucs		. #x00A4)	; Â¤
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "CURRENCY SIGN")
      (ucs		  . #x00A4)	; Â¤
      ))
    (chinese-gb2312		. #x2168)	; ø»„‡‹
    (korean-ksc5601		. #x2234)	; ø»ˆ›½
    (japanese-jisx0212		. #x2270)	; ø»Š¦½
    (japanese-jisx0213-1	. #x2924)	; ø»¢ž¯
    ))
(define-char
  '((name		. "YEN SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH YEN SIGN")
      (ucs		  . #xFFE5)	; ï¿¥
      ))
    (latin-jisx0201	. #x5C)	; øº‘Œ‡
    (latin-iso8859-1	. #xA5)	; øº’´…
    (hebrew-iso8859-8	. #xA5)	; øº’¾¥
    (latin-iso8859-9	. #xA5)	; øº“†…
    (ucs		. #x00A5)	; Â¥
    ))
(define-char
  '((name		. "BROKEN BAR")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH BROKEN BAR")
      (ucs		  . #xFFE4)	; ï¿¤
      ))
    (latin-iso8859-1	. #xA6)	; øº’´†
    (greek-iso8859-7	. #xA6)	; øº’»¦
    (hebrew-iso8859-8	. #xA6)	; øº’¾¦
    (latin-iso8859-9	. #xA6)	; øº“††
    (ucs		. #x00A6)	; Â¦
    ))
(define-char
  '((name		. "SECTION SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth section sign")
      (japanese-jisx0208-1978	  . #x2178)	; ø»½—
      (chinese-gb2312		  . #x216C)	; ø»„‡
      (japanese-jisx0208	  . #x2178)	; ø»†‘Ÿ
      (korean-ksc5601		  . #x2157)	; ø»ˆ›‚
      (chinese-cns11643-1	  . #x2170)	; ø»‘ƒ«
      ))
    (latin-iso8859-1	. #xA7)	; øº’´‡
    (latin-iso8859-2	. #xA7)	; øº’µ§
    (latin-iso8859-3	. #xA7)	; øº’·‡
    (latin-iso8859-4	. #xA7)	; øº’¸§
    (greek-iso8859-7	. #xA7)	; øº’»§
    (hebrew-iso8859-8	. #xA7)	; øº’¾§
    (cyrillic-iso8859-5 . #xFD)	; øº“…½
    (latin-iso8859-9	. #xA7)	; øº“†‡
    (ucs		. #x00A7)	; Â§
    ))
(define-char
  '((name		. "fullwidth section sign")
    (=>ucs		. #x00A7)	; Â§
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "SECTION SIGN")
      (ucs		  . #x00A7)	; Â§
      ))
    (japanese-jisx0208-1978	. #x2178)	; ø»½—
    (chinese-gb2312		. #x216C)	; ø»„‡
    (japanese-jisx0208		. #x2178)	; ø»†‘Ÿ
    (korean-ksc5601		. #x2157)	; ø»ˆ›‚
    (chinese-cns11643-1		. #x2170)	; ø»‘ƒ«
    (japanese-jisx0208-1990	. #x2178)	; ø½‰·“
    (chinese-big5		. #xA1B1)	; ý¢€Š†±
    ))
(define-char
  '((name		. "DIAERESIS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (->fullwidth
     ((name		  . "fullwidth diaeresis")
      (japanese-jisx0208-1978	  . #x212F)	; ø»¼Ž
      (chinese-gb2312		  . #x2127)	; ø»„†Š
      (japanese-jisx0208	  . #x212F)	; ø»†–
      (korean-ksc5601		  . #x2127)	; ø»ˆš’
      ))
    (latin-iso8859-1	. #xA8)	; øº’´ˆ
    (latin-iso8859-2	. #xA8)	; øº’µ¨
    (latin-iso8859-3	. #xA8)	; øº’·ˆ
    (latin-iso8859-4	. #xA8)	; øº’¸¨
    (greek-iso8859-7	. #xA8)	; øº’»¨
    (hebrew-iso8859-8	. #xA8)	; øº’¾¨
    (latin-iso8859-9	. #xA8)	; øº“†ˆ
    (ucs		. #x00A8)	; Â¨
    ))
(define-char
  '((name		. "fullwidth diaeresis")
    (=>ucs		. #x00A8)	; Â¨
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "DIAERESIS")
      (ucs		  . #x00A8)	; Â¨
      ))
    (japanese-jisx0208-1978	. #x212F)	; ø»¼Ž
    (chinese-gb2312		. #x2127)	; ø»„†Š
    (japanese-jisx0208		. #x212F)	; ø»†–
    (korean-ksc5601		. #x2127)	; ø»ˆš’
    (japanese-jisx0208-1990	. #x212F)	; ø½‰¶Š
    (chinese-big5-eten		. #xC6D8)	; ý¢€Œ›˜
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth copyright sign")
      (japanese-jisx0212	  . #x226D)	; ø»Š¦º
      (japanese-jisx0213-1	  . #x2926)	; ø»¢ž±
      ))
    (latin-iso8859-1	. #xA9)	; øº’´‰
    (greek-iso8859-7	. #xA9)	; øº’»©
    (hebrew-iso8859-8	. #xA9)	; øº’¾©
    (latin-iso8859-9	. #xA9)	; øº“†‰
    (ucs		. #x00A9)	; Â©
    ))
(define-char
  '((name		. "fullwidth copyright sign")
    (=>ucs		. #x00A9)	; Â©
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "COPYRIGHT SIGN")
      (ucs		  . #x00A9)	; Â©
      ))
    (japanese-jisx0212		. #x226D)	; ø»Š¦º
    (japanese-jisx0213-1	. #x2926)	; ø»¢ž±
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (->fullwidth
     ((name		  . "fullwidth feminine ordinal indicator")
      (korean-ksc5601		  . #x2823)	; ø»ˆ¤ 
      (japanese-jisx0212	  . #x226C)	; ø»Š¦¹
      (japanese-jisx0213-1	  . #x2927)	; ø»¢ž²
      ))
    (latin-iso8859-1	. #xAA)	; øº’´Š
    (latin-iso8859-9	. #xAA)	; øº“†Š
    (ucs		. #x00AA)	; Âª
    ))
(define-char
  '((name		. "fullwidth feminine ordinal indicator")
    (=>ucs		. #x00AA)	; Âª
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "FEMININE ORDINAL INDICATOR")
      (ucs		  . #x00AA)	; Âª
      ))
    (korean-ksc5601		. #x2823)	; ø»ˆ¤ 
    (japanese-jisx0212		. #x226C)	; ø»Š¦¹
    (japanese-jisx0213-1	. #x2927)	; ø»¢ž²
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name . "fullwidth left-pointing double angle quotation mark")
      (japanese-jisx0213-1	  . #x2928)	; ø»¢ž³
      ))
    (arabic-1-column	. #x2A)	; øº©£
    (latin-iso8859-1	. #xAB)	; øº’´‹
    (greek-iso8859-7	. #xAB)	; øº’»«
    (hebrew-iso8859-8	. #xAB)	; øº’¾«
    (latin-iso8859-9	. #xAB)	; øº“†‹
    (ucs		. #x00AB)	; Â«
    ))
(define-char
  '((name . "fullwidth left-pointing double angle quotation mark")
    (=>ucs		. #x00AB)	; Â«
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (<-fullwidth
     ((name		  . "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (ucs		  . #x00AB)	; Â«
      ))
    (japanese-jisx0213-1	. #x2928)	; ø»¢ž³
    ))
(define-char
  '((name		. "NOT SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH NOT SIGN")
      (ucs		  . #xFFE2)	; ï¿¢
      ))
    (latin-iso8859-1	. #xAC)	; øº’´Œ
    (greek-iso8859-7	. #xAC)	; øº’»¬
    (hebrew-iso8859-8	. #xAC)	; øº’¾¬
    (latin-iso8859-9	. #xAC)	; øº“†Œ
    (ucs		. #x00AC)	; Â¬
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth soft hyphen")
      (korean-ksc5601		  . #x2129)	; ø»ˆš”
      (japanese-jisx0213-1	  . #x2929)	; ø»¢ž´
      ))
    (latin-iso8859-1	. #xAD)	; øº’´
    (latin-iso8859-2	. #xAD)	; øº’µ­
    (latin-iso8859-3	. #xAD)	; øº’·
    (latin-iso8859-4	. #xAD)	; øº’¸­
    (greek-iso8859-7	. #xAD)	; øº’»­
    (hebrew-iso8859-8	. #xAD)	; øº’¾­
    (cyrillic-iso8859-5 . #xAD)	; øº“„­
    (latin-iso8859-9	. #xAD)	; øº“†
    (ucs		. #x00AD)	; Â­
    ))
(define-char
  '((name		. "fullwidth soft hyphen")
    (=>ucs		. #x00AD)	; Â­
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "SOFT HYPHEN")
      (ucs		  . #x00AD)	; Â­
      ))
    (korean-ksc5601		. #x2129)	; ø»ˆš”
    (japanese-jisx0213-1	. #x2929)	; ø»¢ž´
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth registered sign")
      (japanese-jisx0212	  . #x226E)	; ø»Š¦»
      (japanese-jisx0213-1	  . #x292A)	; ø»¢žµ
      ))
    (latin-iso8859-1	. #xAE)	; øº’´Ž
    (hebrew-iso8859-8	. #xAE)	; øº’¾®
    (latin-iso8859-9	. #xAE)	; øº“†Ž
    (ucs		. #x00AE)	; Â®
    ))
(define-char
  '((name		. "fullwidth registered sign")
    (=>ucs		. #x00AE)	; Â®
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "REGISTERED SIGN")
      (ucs		  . #x00AE)	; Â®
      ))
    (japanese-jisx0212		. #x226E)	; ø»Š¦»
    (japanese-jisx0213-1	. #x292A)	; ø»¢žµ
    ))
(define-char
  '((name		. "MACRON")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (->fullwidth
     ((name		  . "FULLWIDTH MACRON")
      (ucs		  . #xFFE3)	; ï¿£
      ))
    (latin-iso8859-1	. #xAF)	; øº’´
    (latin-iso8859-4	. #xAF)	; øº’¸¯
    (latin-iso8859-9	. #xAF)	; øº“†
    (ucs		. #x00AF)	; Â¯
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth degree sign")
      (japanese-jisx0208-1978	  . #x216B)	; ø»½Š
      (chinese-gb2312		  . #x2163)	; ø»„‡†
      (japanese-jisx0208	  . #x216B)	; ø»†‘’
      (korean-ksc5601		  . #x2146)	; ø»ˆš±
      (chinese-cns11643-1	  . #x2278)	; ø»‘…‘
      ))
    (latin-iso8859-1	. #xB0)	; øº’´
    (latin-iso8859-2	. #xB0)	; øº’µ°
    (latin-iso8859-3	. #xB0)	; øº’·
    (latin-iso8859-4	. #xB0)	; øº’¸°
    (greek-iso8859-7	. #xB0)	; øº’»°
    (hebrew-iso8859-8	. #xB0)	; øº’¾°
    (latin-iso8859-9	. #xB0)	; øº“†
    (ucs		. #x00B0)	; Â°
    ))
(define-char
  '((name		. "fullwidth degree sign")
    (=>ucs		. #x00B0)	; Â°
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "DEGREE SIGN")
      (ucs		  . #x00B0)	; Â°
      ))
    (japanese-jisx0208-1978	. #x216B)	; ø»½Š
    (chinese-gb2312		. #x2163)	; ø»„‡†
    (japanese-jisx0208		. #x216B)	; ø»†‘’
    (korean-ksc5601		. #x2146)	; ø»ˆš±
    (chinese-cns11643-1		. #x2278)	; ø»‘…‘
    (japanese-jisx0208-1990	. #x216B)	; ø½‰·†
    (chinese-big5		. #xA258)	; ý¢€Š‰˜
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth plus-minus sign")
      (japanese-jisx0208-1978	  . #x215E)	; ø»¼½
      (chinese-gb2312		  . #x2140)	; ø»„†£
      (japanese-jisx0208	  . #x215E)	; ø»†‘…
      (korean-ksc5601		  . #x213E)	; ø»ˆš©
      (chinese-cns11643-1	  . #x2234)	; ø»‘„
      ))
    (latin-iso8859-1	. #xB1)	; øº’´‘
    (greek-iso8859-7	. #xB1)	; øº’»±
    (hebrew-iso8859-8	. #xB1)	; øº’¾±
    (latin-iso8859-9	. #xB1)	; øº“†‘
    (ucs		. #x00B1)	; Â±
    ))
(define-char
  '((name		. "fullwidth plus-minus sign")
    (=>ucs		. #x00B1)	; Â±
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "PLUS-MINUS SIGN")
      (ucs		  . #x00B1)	; Â±
      ))
    (japanese-jisx0208-1978	. #x215E)	; ø»¼½
    (chinese-gb2312		. #x2140)	; ø»„†£
    (japanese-jisx0208		. #x215E)	; ø»†‘…
    (korean-ksc5601		. #x213E)	; ø»ˆš©
    (chinese-cns11643-1		. #x2234)	; ø»‘„
    (japanese-jisx0208-1990	. #x215E)	; ø½‰¶¹
    (chinese-big5		. #xA1D3)	; ý¢€Š‡“
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
    (->fullwidth
     ((name		  . "fullwidth superscript two")
      (korean-ksc5601		  . #x2977)	; ø»ˆ§’
      (japanese-jisx0213-1	  . #x292C)	; ø»¢ž·
      ))
    (latin-iso8859-1	. #xB2)	; øº’´’
    (latin-iso8859-3	. #xB2)	; øº’·’
    (greek-iso8859-7	. #xB2)	; øº’»²
    (hebrew-iso8859-8	. #xB2)	; øº’¾²
    (latin-iso8859-9	. #xB2)	; øº“†’
    (ucs		. #x00B2)	; Â²
    ))
(define-char
  '((name		. "fullwidth superscript two")
    (=>ucs		. #x00B2)	; Â²
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (<-fullwidth
     ((name		  . "SUPERSCRIPT TWO")
      (ucs		  . #x00B2)	; Â²
      ))
    (korean-ksc5601		. #x2977)	; ø»ˆ§’
    (japanese-jisx0213-1	. #x292C)	; ø»¢ž·
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
    (->fullwidth
     ((name		  . "fullwidth superscript three")
      (korean-ksc5601		  . #x2978)	; ø»ˆ§“
      (japanese-jisx0213-1	  . #x292D)	; ø»¢ž¸
      ))
    (latin-iso8859-1	. #xB3)	; øº’´“
    (latin-iso8859-3	. #xB3)	; øº’·“
    (greek-iso8859-7	. #xB3)	; øº’»³
    (hebrew-iso8859-8	. #xB3)	; øº’¾³
    (latin-iso8859-9	. #xB3)	; øº“†“
    (ucs		. #x00B3)	; Â³
    ))
(define-char
  '((name		. "fullwidth superscript three")
    (=>ucs		. #x00B3)	; Â³
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (<-fullwidth
     ((name		  . "SUPERSCRIPT THREE")
      (ucs		  . #x00B3)	; Â³
      ))
    (korean-ksc5601		. #x2978)	; ø»ˆ§“
    (japanese-jisx0213-1	. #x292D)	; ø»¢ž¸
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (->fullwidth
     ((name		  . "fullwidth acute accent")
      (japanese-jisx0208-1978	  . #x212D)	; ø»¼Œ
      (japanese-jisx0208	  . #x212D)	; ø»†”
      (korean-ksc5601		  . #x2225)	; ø»ˆ›®
      ))
    (latin-iso8859-1	. #xB4)	; øº’´”
    (latin-iso8859-2	. #xB4)	; øº’µ´
    (latin-iso8859-3	. #xB4)	; øº’·”
    (latin-iso8859-4	. #xB4)	; øº’¸´
    (hebrew-iso8859-8	. #xB4)	; øº’¾´
    (latin-iso8859-9	. #xB4)	; øº“†”
    (ucs		. #x00B4)	; Â´
    ))
(define-char
  '((name		. "fullwidth acute accent")
    (=>ucs		. #x00B4)	; Â´
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "ACUTE ACCENT")
      (ucs		  . #x00B4)	; Â´
      ))
    (japanese-jisx0208-1978	. #x212D)	; ø»¼Œ
    (japanese-jisx0208		. #x212D)	; ø»†”
    (korean-ksc5601		. #x2225)	; ø»ˆ›®
    (japanese-jisx0208-1990	. #x212D)	; ø½‰¶ˆ
    ))
(define-char
  '((name		. "MICRO SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BC)
    (latin-iso8859-1	. #xB5)	; øº’´•
    (latin-iso8859-3	. #xB5)	; øº’·•
    (hebrew-iso8859-8	. #xB5)	; øº’¾µ
    (latin-iso8859-9	. #xB5)	; øº“†•
    (ucs		. #x00B5)	; Âµ
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth pilcrow sign")
      (japanese-jisx0208  . #x2279)	; ø»†’¾
      (korean-ksc5601	  . #x2252)	; ø»ˆœ›
      ))
    (latin-iso8859-1	. #xB6)	; øº’´–
    (hebrew-iso8859-8	. #xB6)	; øº’¾¶
    (latin-iso8859-9	. #xB6)	; øº“†–
    (ucs		. #x00B6)	; Â¶
    ))
(define-char
  '((name		. "fullwidth pilcrow sign")
    (=>ucs		. #x00B6)	; Â¶
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "PILCROW SIGN")
      (ucs		  . #x00B6)	; Â¶
      ))
    (japanese-jisx0208		. #x2279)	; ø»†’¾
    (korean-ksc5601		. #x2252)	; ø»ˆœ›
    (japanese-jisx0208-1990	. #x2279)	; ø½‰¸²
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth middle dot")
      (korean-ksc5601		  . #x2124)	; ø»ˆš
      (chinese-cns11643-1	  . #x2126)	; ø»‘‚¡
      (japanese-jisx0213-1	  . #x292E)	; ø»¢ž¹
      ))
    (latin-iso8859-1	. #xB7)	; øº’´—
    (latin-iso8859-3	. #xB7)	; øº’·—
    (greek-iso8859-7	. #xB7)	; øº’»·
    (hebrew-iso8859-8	. #xB7)	; øº’¾·
    (latin-iso8859-9	. #xB7)	; øº“†—
    (ucs		. #x00B7)	; Â·
    ))
(define-char
  '((name		. "fullwidth middle dot")
    (=>ucs		. #x00B7)	; Â·
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "MIDDLE DOT")
      (ucs		  . #x00B7)	; Â·
      ))
    (korean-ksc5601		. #x2124)	; ø»ˆš
    (chinese-cns11643-1		. #x2126)	; ø»‘‚¡
    (japanese-jisx0213-1	. #x292E)	; ø»¢ž¹
    (chinese-big5		. #xA150)	; ý¢€Š…
    ))
(define-char
  '((name		. "CEDILLA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (->fullwidth
     ((name		  . "fullwidth cedilla")
      (korean-ksc5601		  . #x222C)	; ø»ˆ›µ
      (japanese-jisx0212	  . #x2231)	; ø»Š¥¾
      (japanese-jisx0213-1	  . #x292F)	; ø»¢žº
      ))
    (latin-iso8859-1	. #xB8)	; øº’´˜
    (latin-iso8859-2	. #xB8)	; øº’µ¸
    (latin-iso8859-3	. #xB8)	; øº’·˜
    (latin-iso8859-4	. #xB8)	; øº’¸¸
    (hebrew-iso8859-8	. #xB8)	; øº’¾¸
    (latin-iso8859-9	. #xB8)	; øº“†˜
    (ucs		. #x00B8)	; Â¸
    ))
(define-char
  '((name		. "fullwidth cedilla")
    (=>ucs		. #x00B8)	; Â¸
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "CEDILLA")
      (ucs		  . #x00B8)	; Â¸
      ))
    (korean-ksc5601		. #x222C)	; ø»ˆ›µ
    (japanese-jisx0212		. #x2231)	; ø»Š¥¾
    (japanese-jisx0213-1	. #x292F)	; ø»¢žº
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
    (->fullwidth
     ((name		  . "fullwidth superscript one")
      (korean-ksc5601		  . #x2976)	; ø»ˆ§‘
      (japanese-jisx0213-1	  . #x2930)	; ø»¢ž»
      ))
    (latin-iso8859-1	. #xB9)	; øº’´™
    (hebrew-iso8859-8	. #xB9)	; øº’¾¹
    (latin-iso8859-9	. #xB9)	; øº“†™
    (ucs		. #x00B9)	; Â¹
    ))
(define-char
  '((name		. "fullwidth superscript one")
    (=>ucs		. #x00B9)	; Â¹
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (<-fullwidth
     ((name		  . "SUPERSCRIPT ONE")
      (ucs		  . #x00B9)	; Â¹
      ))
    (korean-ksc5601		. #x2976)	; ø»ˆ§‘
    (japanese-jisx0213-1	. #x2930)	; ø»¢ž»
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (->fullwidth
     ((name		  . "fullwidth masculine ordinal indicator")
      (korean-ksc5601		  . #x282C)	; ø»ˆ¤©
      (japanese-jisx0212	  . #x226B)	; ø»Š¦¸
      (japanese-jisx0213-1	  . #x2931)	; ø»¢ž¼
      ))
    (latin-iso8859-1	. #xBA)	; øº’´š
    (latin-iso8859-9	. #xBA)	; øº“†š
    (ucs		. #x00BA)	; Âº
    ))
(define-char
  '((name		. "fullwidth masculine ordinal indicator")
    (=>ucs		. #x00BA)	; Âº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "MASCULINE ORDINAL INDICATOR")
      (ucs		  . #x00BA)	; Âº
      ))
    (korean-ksc5601		. #x282C)	; ø»ˆ¤©
    (japanese-jisx0212		. #x226B)	; ø»Š¦¸
    (japanese-jisx0213-1	. #x2931)	; ø»¢ž¼
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name . "fullwidth right-pointing double angle quotation mark")
      (japanese-jisx0213-1	  . #x2932)	; ø»¢ž½
      ))
    (arabic-1-column	. #x2B)	; øº©¤
    (latin-iso8859-1	. #xBB)	; øº’´›
    (greek-iso8859-7	. #xBB)	; øº’»»
    (hebrew-iso8859-8	. #xBB)	; øº’¾»
    (latin-iso8859-9	. #xBB)	; øº“†›
    (ucs		. #x00BB)	; Â»
    ))
(define-char
  '((name . "fullwidth right-pointing double angle quotation mark")
    (=>ucs		. #x00BB)	; Â»
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (<-fullwidth
     ((name		  . "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (ucs		  . #x00BB)	; Â»
      ))
    (japanese-jisx0213-1	. #x2932)	; ø»¢ž½
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (->fullwidth
     ((name		  . "fullwidth vulgar fraction one quarter")
      (korean-ksc5601		  . #x2879)	; ø»ˆ¥¶
      (japanese-jisx0213-1	  . #x2933)	; ø»¢ž¾
      ))
    (latin-iso8859-1	. #xBC)	; øº’´œ
    (hebrew-iso8859-8	. #xBC)	; øº’¾¼
    (latin-iso8859-9	. #xBC)	; øº“†œ
    (ucs		. #x00BC)	; Â¼
    ))
(define-char
  '((name		. "fullwidth vulgar fraction one quarter")
    (=>ucs		. #x00BC)	; Â¼
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (<-fullwidth
     ((name		  . "VULGAR FRACTION ONE QUARTER")
      (ucs		  . #x00BC)	; Â¼
      ))
    (korean-ksc5601		. #x2879)	; ø»ˆ¥¶
    (japanese-jisx0213-1	. #x2933)	; ø»¢ž¾
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (->fullwidth
     ((name		  . "fullwidth vulgar fraction one half")
      (korean-ksc5601		  . #x2876)	; ø»ˆ¥³
      (japanese-jisx0213-1	  . #x2934)	; ø»¢ž¿
      ))
    (latin-iso8859-1	. #xBD)	; øº’´
    (latin-iso8859-3	. #xBD)	; øº’·
    (greek-iso8859-7	. #xBD)	; øº’»½
    (hebrew-iso8859-8	. #xBD)	; øº’¾½
    (latin-iso8859-9	. #xBD)	; øº“†
    (ucs		. #x00BD)	; Â½
    ))
(define-char
  '((name		. "fullwidth vulgar fraction one half")
    (=>ucs		. #x00BD)	; Â½
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (<-fullwidth
     ((name		  . "VULGAR FRACTION ONE HALF")
      (ucs		  . #x00BD)	; Â½
      ))
    (korean-ksc5601		. #x2876)	; ø»ˆ¥³
    (japanese-jisx0213-1	. #x2934)	; ø»¢ž¿
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (->fullwidth
     ((name		  . "fullwidth vulgar fraction three quarters")
      (korean-ksc5601		  . #x287A)	; ø»ˆ¥·
      (japanese-jisx0213-1	  . #x2935)	; ø»¢Ÿ€
      ))
    (latin-iso8859-1	. #xBE)	; øº’´ž
    (hebrew-iso8859-8	. #xBE)	; øº’¾¾
    (latin-iso8859-9	. #xBE)	; øº“†ž
    (ucs		. #x00BE)	; Â¾
    ))
(define-char
  '((name		. "fullwidth vulgar fraction three quarters")
    (=>ucs		. #x00BE)	; Â¾
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (<-fullwidth
     ((name		  . "VULGAR FRACTION THREE QUARTERS")
      (ucs		  . #x00BE)	; Â¾
      ))
    (korean-ksc5601		. #x287A)	; ø»ˆ¥·
    (japanese-jisx0213-1	. #x2935)	; ø»¢Ÿ€
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth inverted question mark")
      (korean-ksc5601		  . #x222F)	; ø»ˆ›¸
      (japanese-jisx0212	  . #x2244)	; ø»Š¦‘
      (japanese-jisx0213-1	  . #x2936)	; ø»¢Ÿ
      ))
    (latin-iso8859-1	. #xBF)	; øº’´Ÿ
    (latin-iso8859-9	. #xBF)	; øº“†Ÿ
    (ucs		. #x00BF)	; Â¿
    ))
(define-char
  '((name		. "fullwidth inverted question mark")
    (=>ucs		. #x00BF)	; Â¿
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "INVERTED QUESTION MARK")
      (ucs		  . #x00BF)	; Â¿
      ))
    (korean-ksc5601		. #x222F)	; ø»ˆ›¸
    (japanese-jisx0212		. #x2244)	; ø»Š¦‘
    (japanese-jisx0213-1	. #x2936)	; ø»¢Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with grave")
      (japanese-jisx0212	  . #x2A22)	; ø»Š±Ÿ
      (japanese-jisx0213-1	  . #x2937)	; ø»¢Ÿ‚
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (ucs		  . #x00E0)	; Ã 
      ))
    (latin-iso8859-1	. #xC0)	; øº’´ 
    (latin-iso8859-3	. #xC0)	; øº’· 
    (latin-iso8859-9	. #xC0)	; øº“† 
    (latin-viscii-upper . #xE0)	; øº’ž 
    (latin-viscii	. #xC0)	; øº’ž 
    (ucs		. #x00C0)	; Ã€
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with grave")
    (=>ucs		. #x00C0)	; Ã€
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (ucs		  . #x00C0)	; Ã€
      ))
    (japanese-jisx0212		. #x2A22)	; ø»Š±Ÿ
    (japanese-jisx0213-1	. #x2937)	; ø»¢Ÿ‚
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with acute")
      (japanese-jisx0212	  . #x2A21)	; ø»Š±ž
      (japanese-jisx0213-1	  . #x2938)	; ø»¢Ÿƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (ucs		  . #x00E1)	; Ã¡
      ))
    (latin-iso8859-1	. #xC1)	; øº’´¡
    (latin-iso8859-2	. #xC1)	; øº’¶
    (latin-iso8859-3	. #xC1)	; øº’·¡
    (latin-iso8859-4	. #xC1)	; øº’¹
    (latin-iso8859-9	. #xC1)	; øº“†¡
    (latin-viscii-upper . #xE1)	; øº’ž¡
    (latin-viscii	. #xC1)	; øº’ž¡
    (ucs		. #x00C1)	; Ã
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with acute")
    (=>ucs		. #x00C1)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (ucs		  . #x00C1)	; Ã
      ))
    (japanese-jisx0212		. #x2A21)	; ø»Š±ž
    (japanese-jisx0213-1	. #x2938)	; ø»¢Ÿƒ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with circumflex")
      (japanese-jisx0212	  . #x2A24)	; ø»Š±¡
      (japanese-jisx0213-1	  . #x2939)	; ø»¢Ÿ„
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00E2)	; Ã¢
      ))
    (latin-iso8859-1	. #xC2)	; øº’´¢
    (latin-iso8859-2	. #xC2)	; øº’¶‚
    (latin-iso8859-3	. #xC2)	; øº’·¢
    (latin-iso8859-4	. #xC2)	; øº’¹‚
    (latin-iso8859-9	. #xC2)	; øº“†¢
    (latin-tcvn5712	. #xA2)	; øº“™¢
    (latin-viscii-upper . #xE2)	; øº’ž¢
    (latin-viscii	. #xC2)	; øº’ž¢
    (ucs		. #x00C2)	; Ã‚
    ))
(define-char
  '((name . "fullwidth latin capital letter a with circumflex")
    (=>ucs		. #x00C2)	; Ã‚
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter a with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00C2)	; Ã‚
      ))
    (japanese-jisx0212		. #x2A24)	; ø»Š±¡
    (japanese-jisx0213-1	. #x2939)	; ø»¢Ÿ„
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with tilde")
      (japanese-jisx0212	  . #x2A2A)	; ø»Š±§
      (japanese-jisx0213-1	  . #x293A)	; ø»¢Ÿ…
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (ucs		  . #x00E3)	; Ã£
      ))
    (latin-iso8859-1	. #xC3)	; øº’´£
    (latin-iso8859-4	. #xC3)	; øº’¹ƒ
    (latin-iso8859-9	. #xC3)	; øº“†£
    (latin-viscii-upper . #xE3)	; øº’ž£
    (latin-viscii	. #xC3)	; øº’ž£
    (ucs		. #x00C3)	; Ãƒ
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with tilde")
    (=>ucs		. #x00C3)	; Ãƒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (ucs		  . #x00C3)	; Ãƒ
      ))
    (japanese-jisx0212		. #x2A2A)	; ø»Š±§
    (japanese-jisx0213-1	. #x293A)	; ø»¢Ÿ…
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with diaeresis")
      (japanese-jisx0212	  . #x2A23)	; ø»Š± 
      (japanese-jisx0213-1	  . #x293B)	; ø»¢Ÿ†
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (ucs		  . #x00E4)	; Ã¤
      ))
    (latin-iso8859-1	. #xC4)	; øº’´¤
    (latin-iso8859-2	. #xC4)	; øº’¶„
    (latin-iso8859-3	. #xC4)	; øº’·¤
    (latin-iso8859-4	. #xC4)	; øº’¹„
    (latin-iso8859-9	. #xC4)	; øº“†¤
    (ucs		. #x00C4)	; Ã„
    ))
(define-char
  '((name . "fullwidth latin capital letter a with diaeresis")
    (=>ucs		. #x00C4)	; Ã„
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter a with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (ucs		  . #x00C4)	; Ã„
      ))
    (japanese-jisx0212		. #x2A23)	; ø»Š± 
    (japanese-jisx0213-1	. #x293B)	; ø»¢Ÿ†
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with ring above")
      (japanese-jisx0212	  . #x2A29)	; ø»Š±¦
      (japanese-jisx0213-1	  . #x293C)	; ø»¢Ÿ‡
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (ucs		  . #x00E5)	; Ã¥
      ))
    (latin-iso8859-1	. #xC5)	; øº’´¥
    (latin-iso8859-4	. #xC5)	; øº’¹…
    (latin-iso8859-9	. #xC5)	; øº“†¥
    (ucs		. #x00C5)	; Ã…
    ))
(define-char
  '((name . "fullwidth latin capital letter a with ring above")
    (=>ucs		. #x00C5)	; Ã…
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter a with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (ucs		  . #x00C5)	; Ã…
      ))
    (japanese-jisx0212		. #x2A29)	; ø»Š±¦
    (japanese-jisx0213-1	. #x293C)	; ø»¢Ÿ‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase
     ((name		  . "LATIN SMALL LETTER AE")
      (ucs		  . #x00E6)	; Ã¦
      ))
    (latin-iso8859-1	. #xC6)	; øº’´¦
    (latin-iso8859-4	. #xC6)	; øº’¹†
    (latin-iso8859-9	. #xC6)	; øº“†¦
    (ucs		. #x00C6)	; Ã†
    ))
(define-char
  '((name		. "fullwidth latin capital letter ae")
    (=>ucs		. #x00C6)	; Ã†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter ae")
      ))
    (korean-ksc5601		. #x2821)	; ø»ˆ¤ž
    (japanese-jisx0212		. #x2921)	; ø»Š°€
    (japanese-jisx0213-1	. #x293D)	; ø»¢Ÿˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with cedilla")
      (japanese-jisx0212	  . #x2A2E)	; ø»Š±«
      (japanese-jisx0213-1	  . #x293E)	; ø»¢Ÿ‰
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (ucs		  . #x00E7)	; Ã§
      ))
    (latin-iso8859-1	. #xC7)	; øº’´§
    (latin-iso8859-2	. #xC7)	; øº’¶‡
    (latin-iso8859-3	. #xC7)	; øº’·§
    (latin-iso8859-9	. #xC7)	; øº“†§
    (ucs		. #x00C7)	; Ã‡
    ))
(define-char
  '((name . "fullwidth latin capital letter c with cedilla")
    (=>ucs		. #x00C7)	; Ã‡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter c with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (ucs		  . #x00C7)	; Ã‡
      ))
    (japanese-jisx0212		. #x2A2E)	; ø»Š±«
    (japanese-jisx0213-1	. #x293E)	; ø»¢Ÿ‰
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with grave")
      (japanese-jisx0212	  . #x2A32)	; ø»Š±¯
      (japanese-jisx0213-1	  . #x293F)	; ø»¢ŸŠ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (ucs		  . #x00E8)	; Ã¨
      ))
    (latin-iso8859-1	. #xC8)	; øº’´¨
    (latin-iso8859-3	. #xC8)	; øº’·¨
    (latin-iso8859-9	. #xC8)	; øº“†¨
    (latin-viscii-upper . #xE8)	; øº’ž¨
    (latin-viscii	. #xC8)	; øº’ž¨
    (ucs		. #x00C8)	; Ãˆ
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with grave")
    (=>ucs		. #x00C8)	; Ãˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (ucs		  . #x00C8)	; Ãˆ
      ))
    (japanese-jisx0212		. #x2A32)	; ø»Š±¯
    (japanese-jisx0213-1	. #x293F)	; ø»¢ŸŠ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with acute")
      (japanese-jisx0212	  . #x2A31)	; ø»Š±®
      (japanese-jisx0213-1	  . #x2940)	; ø»¢Ÿ‹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (ucs		  . #x00E9)	; Ã©
      ))
    (latin-iso8859-1	. #xC9)	; øº’´©
    (latin-iso8859-2	. #xC9)	; øº’¶‰
    (latin-iso8859-3	. #xC9)	; øº’·©
    (latin-iso8859-4	. #xC9)	; øº’¹‰
    (latin-iso8859-9	. #xC9)	; øº“†©
    (latin-viscii-upper . #xE9)	; øº’ž©
    (latin-viscii	. #xC9)	; øº’ž©
    (ucs		. #x00C9)	; Ã‰
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with acute")
    (=>ucs		. #x00C9)	; Ã‰
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (ucs		  . #x00C9)	; Ã‰
      ))
    (japanese-jisx0212		. #x2A31)	; ø»Š±®
    (japanese-jisx0213-1	. #x2940)	; ø»¢Ÿ‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with circumflex")
      (japanese-jisx0212	  . #x2A34)	; ø»Š±±
      (japanese-jisx0213-1	  . #x2941)	; ø»¢ŸŒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00EA)	; Ãª
      ))
    (latin-iso8859-1	. #xCA)	; øº’´ª
    (latin-iso8859-3	. #xCA)	; øº’·ª
    (latin-iso8859-9	. #xCA)	; øº“†ª
    (latin-tcvn5712	. #xA3)	; øº“™£
    (latin-viscii-upper . #xEA)	; øº’žª
    (latin-viscii	. #xCA)	; øº’žª
    (ucs		. #x00CA)	; ÃŠ
    ))
(define-char
  '((name . "fullwidth latin capital letter e with circumflex")
    (=>ucs		. #x00CA)	; ÃŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter e with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00CA)	; ÃŠ
      ))
    (japanese-jisx0212		. #x2A34)	; ø»Š±±
    (japanese-jisx0213-1	. #x2941)	; ø»¢ŸŒ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with diaeresis")
      (japanese-jisx0212	  . #x2A33)	; ø»Š±°
      (japanese-jisx0213-1	  . #x2942)	; ø»¢Ÿ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (ucs		  . #x00EB)	; Ã«
      ))
    (latin-iso8859-1	. #xCB)	; øº’´«
    (latin-iso8859-2	. #xCB)	; øº’¶‹
    (latin-iso8859-3	. #xCB)	; øº’·«
    (latin-iso8859-4	. #xCB)	; øº’¹‹
    (latin-iso8859-9	. #xCB)	; øº“†«
    (ucs		. #x00CB)	; Ã‹
    ))
(define-char
  '((name . "fullwidth latin capital letter e with diaeresis")
    (=>ucs		. #x00CB)	; Ã‹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter e with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (ucs		  . #x00CB)	; Ã‹
      ))
    (japanese-jisx0212		. #x2A33)	; ø»Š±°
    (japanese-jisx0213-1	. #x2942)	; ø»¢Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with grave")
      (japanese-jisx0212	  . #x2A40)	; ø»Š±½
      (japanese-jisx0213-1	  . #x2943)	; ø»¢ŸŽ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (ucs		  . #x00EC)	; Ã¬
      ))
    (latin-iso8859-1	. #xCC)	; øº’´¬
    (latin-iso8859-3	. #xCC)	; øº’·¬
    (latin-iso8859-9	. #xCC)	; øº“†¬
    (latin-viscii-upper . #xEC)	; øº’ž¬
    (latin-viscii	. #xCC)	; øº’ž¬
    (ucs		. #x00CC)	; ÃŒ
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with grave")
    (=>ucs		. #x00CC)	; ÃŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (ucs		  . #x00CC)	; ÃŒ
      ))
    (japanese-jisx0212		. #x2A40)	; ø»Š±½
    (japanese-jisx0213-1	. #x2943)	; ø»¢ŸŽ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with acute")
      (japanese-jisx0212	  . #x2A3F)	; ø»Š±¼
      (japanese-jisx0213-1	  . #x2944)	; ø»¢Ÿ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (ucs		  . #x00ED)	; Ã­
      ))
    (latin-iso8859-1	. #xCD)	; øº’´­
    (latin-iso8859-2	. #xCD)	; øº’¶
    (latin-iso8859-3	. #xCD)	; øº’·­
    (latin-iso8859-4	. #xCD)	; øº’¹
    (latin-iso8859-9	. #xCD)	; øº“†­
    (latin-viscii-upper . #xED)	; øº’ž­
    (latin-viscii	. #xCD)	; øº’ž­
    (ucs		. #x00CD)	; Ã
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with acute")
    (=>ucs		. #x00CD)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (ucs		  . #x00CD)	; Ã
      ))
    (japanese-jisx0212		. #x2A3F)	; ø»Š±¼
    (japanese-jisx0213-1	. #x2944)	; ø»¢Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with circumflex")
      (japanese-jisx0212	  . #x2A42)	; ø»Š±¿
      (japanese-jisx0213-1	  . #x2945)	; ø»¢Ÿ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00EE)	; Ã®
      ))
    (latin-iso8859-1	. #xCE)	; øº’´®
    (latin-iso8859-2	. #xCE)	; øº’¶Ž
    (latin-iso8859-3	. #xCE)	; øº’·®
    (latin-iso8859-4	. #xCE)	; øº’¹Ž
    (latin-iso8859-9	. #xCE)	; øº“†®
    (ucs		. #x00CE)	; ÃŽ
    ))
(define-char
  '((name . "fullwidth latin capital letter i with circumflex")
    (=>ucs		. #x00CE)	; ÃŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter i with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00CE)	; ÃŽ
      ))
    (japanese-jisx0212		. #x2A42)	; ø»Š±¿
    (japanese-jisx0213-1	. #x2945)	; ø»¢Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with diaeresis")
      (japanese-jisx0212	  . #x2A41)	; ø»Š±¾
      (japanese-jisx0213-1	  . #x2946)	; ø»¢Ÿ‘
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH DIAERESIS")
      (ucs		  . #x00EF)	; Ã¯
      ))
    (latin-iso8859-1	. #xCF)	; øº’´¯
    (latin-iso8859-3	. #xCF)	; øº’·¯
    (latin-iso8859-9	. #xCF)	; øº“†¯
    (ucs		. #x00CF)	; Ã
    ))
(define-char
  '((name . "fullwidth latin capital letter i with diaeresis")
    (=>ucs		. #x00CF)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter i with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (ucs		  . #x00CF)	; Ã
      ))
    (japanese-jisx0212		. #x2A41)	; ø»Š±¾
    (japanese-jisx0213-1	. #x2946)	; ø»¢Ÿ‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter eth")
      (korean-ksc5601		  . #x2822)	; ø»ˆ¤Ÿ
      (japanese-jisx0213-1	  . #x2947)	; ø»¢Ÿ’
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ETH")
      (ucs		  . #x00F0)	; Ã°
      ))
    (latin-iso8859-1	. #xD0)	; øº’´°
    (ucs		. #x00D0)	; Ã
    ))
(define-char
  '((name		. "fullwidth latin capital letter eth")
    (=>ucs		. #x00D0)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase
     ((name		  . "fullwidth latin small letter eth")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (ucs		  . #x00D0)	; Ã
      ))
    (korean-ksc5601		. #x2822)	; ø»ˆ¤Ÿ
    (japanese-jisx0213-1	. #x2947)	; ø»¢Ÿ’
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with tilde")
      (japanese-jisx0212	  . #x2A50)	; ø»Š²
      (japanese-jisx0213-1	  . #x2948)	; ø»¢Ÿ“
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (ucs		  . #x00F1)	; Ã±
      ))
    (latin-iso8859-1	. #xD1)	; øº’´±
    (latin-iso8859-3	. #xD1)	; øº’·±
    (latin-iso8859-9	. #xD1)	; øº“†±
    (ucs		. #x00D1)	; Ã‘
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with tilde")
    (=>ucs		. #x00D1)	; Ã‘
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter n with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (ucs		  . #x00D1)	; Ã‘
      ))
    (japanese-jisx0212		. #x2A50)	; ø»Š²
    (japanese-jisx0213-1	. #x2948)	; ø»¢Ÿ“
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with grave")
      (japanese-jisx0212	  . #x2A52)	; ø»Š²
      (japanese-jisx0213-1	  . #x2949)	; ø»¢Ÿ”
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (ucs		  . #x00F2)	; Ã²
      ))
    (latin-iso8859-1	. #xD2)	; øº’´²
    (latin-iso8859-3	. #xD2)	; øº’·²
    (latin-iso8859-9	. #xD2)	; øº“†²
    (latin-viscii-upper . #xF2)	; øº’ž²
    (latin-viscii	. #xD2)	; øº’ž²
    (ucs		. #x00D2)	; Ã’
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with grave")
    (=>ucs		. #x00D2)	; Ã’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (ucs		  . #x00D2)	; Ã’
      ))
    (japanese-jisx0212		. #x2A52)	; ø»Š²
    (japanese-jisx0213-1	. #x2949)	; ø»¢Ÿ”
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with acute")
      (japanese-jisx0212	  . #x2A51)	; ø»Š²Ž
      (japanese-jisx0213-1	  . #x294A)	; ø»¢Ÿ•
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (ucs		  . #x00F3)	; Ã³
      ))
    (latin-iso8859-1	. #xD3)	; øº’´³
    (latin-iso8859-2	. #xD3)	; øº’¶“
    (latin-iso8859-3	. #xD3)	; øº’·³
    (latin-iso8859-9	. #xD3)	; øº“†³
    (latin-viscii-upper . #xF3)	; øº’ž³
    (latin-viscii	. #xD3)	; øº’ž³
    (ucs		. #x00D3)	; Ã“
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with acute")
    (=>ucs		. #x00D3)	; Ã“
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (ucs		  . #x00D3)	; Ã“
      ))
    (japanese-jisx0212		. #x2A51)	; ø»Š²Ž
    (japanese-jisx0213-1	. #x294A)	; ø»¢Ÿ•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with circumflex")
      (japanese-jisx0212	  . #x2A54)	; ø»Š²‘
      (japanese-jisx0213-1	  . #x294B)	; ø»¢Ÿ–
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00F4)	; Ã´
      ))
    (latin-iso8859-1	. #xD4)	; øº’´´
    (latin-iso8859-2	. #xD4)	; øº’¶”
    (latin-iso8859-3	. #xD4)	; øº’·´
    (latin-iso8859-4	. #xD4)	; øº’¹”
    (latin-iso8859-9	. #xD4)	; øº“†´
    (latin-tcvn5712	. #xA4)	; øº“™¤
    (latin-viscii-upper . #xF4)	; øº’ž´
    (latin-viscii	. #xD4)	; øº’ž´
    (ucs		. #x00D4)	; Ã”
    ))
(define-char
  '((name . "fullwidth latin capital letter o with circumflex")
    (=>ucs		. #x00D4)	; Ã”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter o with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00D4)	; Ã”
      ))
    (japanese-jisx0212		. #x2A54)	; ø»Š²‘
    (japanese-jisx0213-1	. #x294B)	; ø»¢Ÿ–
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with tilde")
      (japanese-jisx0212	  . #x2A58)	; ø»Š²•
      (japanese-jisx0213-1	  . #x294C)	; ø»¢Ÿ—
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (ucs		  . #x00F5)	; Ãµ
      ))
    (latin-iso8859-1	. #xD5)	; øº’´µ
    (latin-iso8859-4	. #xD5)	; øº’¹•
    (latin-iso8859-9	. #xD5)	; øº“†µ
    (latin-viscii-upper . #xF5)	; øº’žµ
    (latin-viscii	. #xA0)	; øº’žµ
    (ucs		. #x00D5)	; Ã•
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with tilde")
    (=>ucs		. #x00D5)	; Ã•
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin capital letter o with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (ucs		  . #x00D5)	; Ã•
      ))
    (japanese-jisx0212		. #x2A58)	; ø»Š²•
    (japanese-jisx0213-1	. #x294C)	; ø»¢Ÿ—
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with diaeresis")
      (japanese-jisx0212	  . #x2A53)	; ø»Š²
      (japanese-jisx0213-1	  . #x294D)	; ø»¢Ÿ˜
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (ucs		  . #x00F6)	; Ã¶
      ))
    (latin-iso8859-1	. #xD6)	; øº’´¶
    (latin-iso8859-2	. #xD6)	; øº’¶–
    (latin-iso8859-3	. #xD6)	; øº’·¶
    (latin-iso8859-4	. #xD6)	; øº’¹–
    (latin-iso8859-9	. #xD6)	; øº“†¶
    (ucs		. #x00D6)	; Ã–
    ))
(define-char
  '((name . "fullwidth latin capital letter o with diaeresis")
    (=>ucs		. #x00D6)	; Ã–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin capital letter o with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (ucs		  . #x00D6)	; Ã–
      ))
    (japanese-jisx0212		. #x2A53)	; ø»Š²
    (japanese-jisx0213-1	. #x294D)	; ø»¢Ÿ˜
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth multiplication sign")
      (japanese-jisx0208-1978	  . #x215F)	; ø»¼¾
      (chinese-gb2312		  . #x2141)	; ø»„†¤
      (japanese-jisx0208	  . #x215F)	; ø»†‘†
      (korean-ksc5601		  . #x213F)	; ø»ˆšª
      (chinese-cns11643-1	  . #x2232)	; ø»‘„‹
      ))
    (latin-iso8859-1	. #xD7)	; øº’´·
    (latin-iso8859-2	. #xD7)	; øº’¶—
    (latin-iso8859-3	. #xD7)	; øº’··
    (latin-iso8859-4	. #xD7)	; øº’¹—
    (hebrew-iso8859-8	. #xAA)	; øº’¾ª
    (latin-iso8859-9	. #xD7)	; øº“†·
    (ucs		. #x00D7)	; Ã—
    ))
(define-char
  '((name		. "fullwidth multiplication sign")
    (=>ucs		. #x00D7)	; Ã—
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "MULTIPLICATION SIGN")
      (ucs		  . #x00D7)	; Ã—
      ))
    (japanese-jisx0208-1978	. #x215F)	; ø»¼¾
    (chinese-gb2312		. #x2141)	; ø»„†¤
    (japanese-jisx0208		. #x215F)	; ø»†‘†
    (korean-ksc5601		. #x213F)	; ø»ˆšª
    (chinese-cns11643-1		. #x2232)	; ø»‘„‹
    (japanese-jisx0208-1990	. #x215F)	; ø½‰¶º
    (chinese-big5		. #xA1D1)	; ý¢€Š‡‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (ucs		  . #x00F8)	; Ã¸
      ))
    (latin-iso8859-1	. #xD8)	; øº’´¸
    (latin-iso8859-4	. #xD8)	; øº’¹˜
    (latin-iso8859-9	. #xD8)	; øº“†¸
    (ucs		. #x00D8)	; Ã˜
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with stroke")
    (=>ucs		. #x00D8)	; Ã˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with stroke")
      ))
    (korean-ksc5601		. #x282A)	; ø»ˆ¤§
    (japanese-jisx0212		. #x292C)	; ø»Š°‹
    (japanese-jisx0213-1	. #x294E)	; ø»¢Ÿ™
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (ucs		  . #x00F9)	; Ã¹
      ))
    (latin-iso8859-1	. #xD9)	; øº’´¹
    (latin-iso8859-3	. #xD9)	; øº’·¹
    (latin-iso8859-9	. #xD9)	; øº“†¹
    (latin-viscii-upper . #xF9)	; øº’ž¹
    (latin-viscii	. #xD9)	; øº’ž¹
    (ucs		. #x00D9)	; Ã™
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with grave")
    (=>ucs		. #x00D9)	; Ã™
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with grave")
      ))
    (japanese-jisx0212		. #x2A63)	; ø»Š² 
    (japanese-jisx0213-1	. #x294F)	; ø»¢Ÿš
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with acute")
      (japanese-jisx0212	  . #x2A62)	; ø»Š²Ÿ
      (japanese-jisx0213-1	  . #x2950)	; ø»¢Ÿ›
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (ucs		  . #x00FA)	; Ãº
      ))
    (latin-iso8859-1	. #xDA)	; øº’´º
    (latin-iso8859-2	. #xDA)	; øº’¶š
    (latin-iso8859-3	. #xDA)	; øº’·º
    (latin-iso8859-4	. #xDA)	; øº’¹š
    (latin-iso8859-9	. #xDA)	; øº“†º
    (latin-viscii-upper . #xFA)	; øº’žº
    (latin-viscii	. #xDA)	; øº’žº
    (ucs		. #x00DA)	; Ãš
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with acute")
    (=>ucs		. #x00DA)	; Ãš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (ucs		  . #x00DA)	; Ãš
      ))
    (japanese-jisx0212		. #x2A62)	; ø»Š²Ÿ
    (japanese-jisx0213-1	. #x2950)	; ø»¢Ÿ›
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with circumflex")
      (japanese-jisx0212	  . #x2A65)	; ø»Š²¢
      (japanese-jisx0213-1	  . #x2951)	; ø»¢Ÿœ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00FB)	; Ã»
      ))
    (latin-iso8859-1	. #xDB)	; øº’´»
    (latin-iso8859-3	. #xDB)	; øº’·»
    (latin-iso8859-4	. #xDB)	; øº’¹›
    (latin-iso8859-9	. #xDB)	; øº“†»
    (ucs		. #x00DB)	; Ã›
    ))
(define-char
  '((name . "fullwidth latin capital letter u with circumflex")
    (=>ucs		. #x00DB)	; Ã›
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter u with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00DB)	; Ã›
      ))
    (japanese-jisx0212		. #x2A65)	; ø»Š²¢
    (japanese-jisx0213-1	. #x2951)	; ø»¢Ÿœ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with diaeresis")
      (japanese-jisx0212	  . #x2A64)	; ø»Š²¡
      (japanese-jisx0213-1	  . #x2952)	; ø»¢Ÿ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (ucs		  . #x00FC)	; Ã¼
      ))
    (latin-iso8859-1	. #xDC)	; øº’´¼
    (latin-iso8859-2	. #xDC)	; øº’¶œ
    (latin-iso8859-3	. #xDC)	; øº’·¼
    (latin-iso8859-4	. #xDC)	; øº’¹œ
    (latin-iso8859-9	. #xDC)	; øº“†¼
    (ucs		. #x00DC)	; Ãœ
    ))
(define-char
  '((name . "fullwidth latin capital letter u with diaeresis")
    (=>ucs		. #x00DC)	; Ãœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "fullwidth latin small letter u with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (ucs		  . #x00DC)	; Ãœ
      ))
    (japanese-jisx0212		. #x2A64)	; ø»Š²¡
    (japanese-jisx0213-1	. #x2952)	; ø»¢Ÿ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with acute")
      (japanese-jisx0212	  . #x2A72)	; ø»Š²¯
      (japanese-jisx0213-1	  . #x2953)	; ø»¢Ÿž
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (ucs		  . #x00FD)	; Ã½
      ))
    (latin-iso8859-1	. #xDD)	; øº’´½
    (latin-iso8859-2	. #xDD)	; øº’¶
    (latin-viscii-upper . #xFD)	; øº’ž½
    (latin-viscii	. #xDD)	; øº’ž½
    (ucs		. #x00DD)	; Ã
    ))
(define-char
  '((name		. "fullwidth latin capital letter y with acute")
    (=>ucs		. #x00DD)	; Ã
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "fullwidth latin small letter y with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (ucs		  . #x00DD)	; Ã
      ))
    (japanese-jisx0212		. #x2A72)	; ø»Š²¯
    (japanese-jisx0213-1	. #x2953)	; ø»¢Ÿž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter thorn")
      (korean-ksc5601		  . #x282D)	; ø»ˆ¤ª
      (japanese-jisx0212	  . #x2930)	; ø»Š°
      (japanese-jisx0213-1	  . #x2954)	; ø»¢ŸŸ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER THORN")
      (ucs		  . #x00FE)	; Ã¾
      ))
    (latin-iso8859-1	. #xDE)	; øº’´¾
    (ucs		. #x00DE)	; Ãž
    ))
(define-char
  '((name		. "fullwidth latin capital letter thorn")
    (=>ucs		. #x00DE)	; Ãž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase
     ((name		  . "fullwidth latin small letter thorn")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (ucs		  . #x00DE)	; Ãž
      ))
    (korean-ksc5601		. #x282D)	; ø»ˆ¤ª
    (japanese-jisx0212		. #x2930)	; ø»Š°
    (japanese-jisx0213-1	. #x2954)	; ø»¢ŸŸ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->fullwidth
     ((name		  . "fullwidth latin small letter sharp s")
      (korean-ksc5601		  . #x292C)	; ø»ˆ¦‡
      (japanese-jisx0212	  . #x294E)	; ø»Š°­
      (japanese-jisx0213-1	  . #x2955)	; ø»¢Ÿ 
      ))
    (latin-iso8859-1	. #xDF)	; øº’´¿
    (latin-iso8859-2	. #xDF)	; øº’¶Ÿ
    (latin-iso8859-3	. #xDF)	; øº’·¿
    (latin-iso8859-4	. #xDF)	; øº’¹Ÿ
    (latin-iso8859-9	. #xDF)	; øº“†¿
    (ucs		. #x00DF)	; ÃŸ
    ))
(define-char
  '((name		. "fullwidth latin small letter sharp s")
    (=>ucs		. #x00DF)	; ÃŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER SHARP S")
      (ucs		  . #x00DF)	; ÃŸ
      ))
    (korean-ksc5601		. #x292C)	; ø»ˆ¦‡
    (japanese-jisx0212		. #x294E)	; ø»Š°­
    (japanese-jisx0213-1	. #x2955)	; ø»¢Ÿ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with grave")
      (chinese-gb2312		  . #x2824)	; ø»„™
      (japanese-jisx0212	  . #x2B22)	; ø»Š²½
      (japanese-jisx0213-1	  . #x2956)	; ø»¢Ÿ¡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (ucs		  . #x00C0)	; Ã€
      ))
    (latin-iso8859-1	. #xE0)	; øº’µ€
    (latin-iso8859-3	. #xE0)	; øº’¸€
    (latin-iso8859-9	. #xE0)	; øº“‡€
    (latin-tcvn5712	. #xB5)	; øº“™µ
    (latin-viscii-lower . #xE0)	; øº’€
    (latin-viscii	. #xE0)	; øº’€
    (ucs		. #x00E0)	; Ã 
    ))
(define-char
  '((name		. "fullwidth latin small letter a with grave")
    (=>ucs		. #x00E0)	; Ã 
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (ucs		  . #x00E0)	; Ã 
      ))
    (chinese-gb2312		. #x2824)	; ø»„™
    (japanese-jisx0212		. #x2B22)	; ø»Š²½
    (japanese-jisx0213-1	. #x2956)	; ø»¢Ÿ¡
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with acute")
      (chinese-gb2312		  . #x2822)	; ø»„—
      (japanese-jisx0212	  . #x2B21)	; ø»Š²¼
      (japanese-jisx0213-1	  . #x2957)	; ø»¢Ÿ¢
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (ucs		  . #x00C1)	; Ã
      ))
    (latin-iso8859-1	. #xE1)	; øº’µ
    (latin-iso8859-2	. #xE1)	; øº’¶¡
    (latin-iso8859-3	. #xE1)	; øº’¸
    (latin-iso8859-4	. #xE1)	; øº’¹¡
    (latin-iso8859-9	. #xE1)	; øº“‡
    (latin-tcvn5712	. #xB8)	; øº“™¸
    (latin-viscii-lower . #xE1)	; øº’
    (latin-viscii	. #xE1)	; øº’
    (ucs		. #x00E1)	; Ã¡
    ))
(define-char
  '((name		. "fullwidth latin small letter a with acute")
    (=>ucs		. #x00E1)	; Ã¡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (ucs		  . #x00E1)	; Ã¡
      ))
    (chinese-gb2312		. #x2822)	; ø»„—
    (japanese-jisx0212		. #x2B21)	; ø»Š²¼
    (japanese-jisx0213-1	. #x2957)	; ø»¢Ÿ¢
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter a with circumflex")
      (japanese-jisx0212	  . #x2B24)	; ø»Š²¿
      (japanese-jisx0213-1	  . #x2958)	; ø»¢Ÿ£
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00C2)	; Ã‚
      ))
    (latin-iso8859-1	. #xE2)	; øº’µ‚
    (latin-iso8859-2	. #xE2)	; øº’¶¢
    (latin-iso8859-3	. #xE2)	; øº’¸‚
    (latin-iso8859-4	. #xE2)	; øº’¹¢
    (latin-iso8859-9	. #xE2)	; øº“‡‚
    (latin-tcvn5712	. #xA9)	; øº“™©
    (latin-viscii-lower . #xE2)	; øº’‚
    (latin-viscii	. #xE2)	; øº’‚
    (ucs		. #x00E2)	; Ã¢
    ))
(define-char
  '((name . "fullwidth latin small letter a with circumflex")
    (=>ucs		. #x00E2)	; Ã¢
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (ucs		  . #x00E2)	; Ã¢
      ))
    (japanese-jisx0212		. #x2B24)	; ø»Š²¿
    (japanese-jisx0213-1	. #x2958)	; ø»¢Ÿ£
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with tilde")
      (japanese-jisx0212	  . #x2B2A)	; ø»Š³…
      (japanese-jisx0213-1	  . #x2959)	; ø»¢Ÿ¤
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (ucs		  . #x00C3)	; Ãƒ
      ))
    (latin-iso8859-1	. #xE3)	; øº’µƒ
    (latin-iso8859-4	. #xE3)	; øº’¹£
    (latin-iso8859-9	. #xE3)	; øº“‡ƒ
    (latin-tcvn5712	. #xB7)	; øº“™·
    (latin-viscii-lower . #xE3)	; øº’ƒ
    (latin-viscii	. #xE3)	; øº’ƒ
    (ucs		. #x00E3)	; Ã£
    ))
(define-char
  '((name		. "fullwidth latin small letter a with tilde")
    (=>ucs		. #x00E3)	; Ã£
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (ucs		  . #x00E3)	; Ã£
      ))
    (japanese-jisx0212		. #x2B2A)	; ø»Š³…
    (japanese-jisx0213-1	. #x2959)	; ø»¢Ÿ¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter a with diaeresis")
      (japanese-jisx0212	  . #x2B23)	; ø»Š²¾
      (japanese-jisx0213-1	  . #x295A)	; ø»¢Ÿ¥
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (ucs		  . #x00C4)	; Ã„
      ))
    (latin-iso8859-1	. #xE4)	; øº’µ„
    (latin-iso8859-2	. #xE4)	; øº’¶¤
    (latin-iso8859-3	. #xE4)	; øº’¸„
    (latin-iso8859-4	. #xE4)	; øº’¹¤
    (latin-iso8859-9	. #xE4)	; øº“‡„
    (ucs		. #x00E4)	; Ã¤
    ))
(define-char
  '((name . "fullwidth latin small letter a with diaeresis")
    (=>ucs		. #x00E4)	; Ã¤
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (ucs		  . #x00E4)	; Ã¤
      ))
    (japanese-jisx0212		. #x2B23)	; ø»Š²¾
    (japanese-jisx0213-1	. #x295A)	; ø»¢Ÿ¥
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x030A)
    (->fullwidth
     ((name . "fullwidth latin small letter a with ring above")
      (japanese-jisx0212	  . #x2B29)	; ø»Š³„
      (japanese-jisx0213-1	  . #x295B)	; ø»¢Ÿ¦
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (ucs		  . #x00C5)	; Ã…
      ))
    (latin-iso8859-1	. #xE5)	; øº’µ…
    (latin-iso8859-4	. #xE5)	; øº’¹¥
    (latin-iso8859-9	. #xE5)	; øº“‡…
    (ucs		. #x00E5)	; Ã¥
    ))
(define-char
  '((name . "fullwidth latin small letter a with ring above")
    (=>ucs		. #x00E5)	; Ã¥
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter a with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (ucs		  . #x00E5)	; Ã¥
      ))
    (japanese-jisx0212		. #x2B29)	; ø»Š³„
    (japanese-jisx0213-1	. #x295B)	; ø»¢Ÿ¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER AE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->fullwidth
     ((name		  . "fullwidth latin small letter ae")
      (korean-ksc5601		  . #x2921)	; ø»ˆ¥¼
      (japanese-jisx0212	  . #x2941)	; ø»Š° 
      (japanese-jisx0213-1	  . #x295C)	; ø»¢Ÿ§
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER AE")
      (ucs		  . #x00C6)	; Ã†
      ))
    (latin-iso8859-1	. #xE6)	; øº’µ†
    (latin-iso8859-4	. #xE6)	; øº’¹¦
    (latin-iso8859-9	. #xE6)	; øº“‡†
    (ipa		. #xA4)	; øº’š¤
    (ucs		. #x00E6)	; Ã¦
    ))
(define-char
  '((name		. "fullwidth latin small letter ae")
    (=>ucs		. #x00E6)	; Ã¦
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->uppercase
     ((name		  . "fullwidth latin capital letter ae")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER AE")
      (ucs		  . #x00E6)	; Ã¦
      ))
    (korean-ksc5601		. #x2921)	; ø»ˆ¥¼
    (japanese-jisx0212		. #x2941)	; ø»Š° 
    (japanese-jisx0213-1	. #x295C)	; ø»¢Ÿ§
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter c with cedilla")
      (japanese-jisx0212	  . #x2B2E)	; ø»Š³‰
      (japanese-jisx0213-1	  . #x295D)	; ø»¢Ÿ¨
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (ucs		  . #x00C7)	; Ã‡
      ))
    (latin-iso8859-1	. #xE7)	; øº’µ‡
    (latin-iso8859-2	. #xE7)	; øº’¶§
    (latin-iso8859-3	. #xE7)	; øº’¸‡
    (latin-iso8859-9	. #xE7)	; øº“‡‡
    (ipa		. #xCE)	; øº’›Ž
    (ucs		. #x00E7)	; Ã§
    ))
(define-char
  '((name		. "fullwidth latin small letter c with cedilla")
    (=>ucs		. #x00E7)	; Ã§
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter c with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (ucs		  . #x00E7)	; Ã§
      ))
    (japanese-jisx0212		. #x2B2E)	; ø»Š³‰
    (japanese-jisx0213-1	. #x295D)	; ø»¢Ÿ¨
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with grave")
      (chinese-gb2312		  . #x2828)	; ø»„
      (japanese-jisx0212	  . #x2B32)	; ø»Š³
      (japanese-jisx0213-1	  . #x295E)	; ø»¢Ÿ©
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (ucs		  . #x00C8)	; Ãˆ
      ))
    (latin-iso8859-1	. #xE8)	; øº’µˆ
    (latin-iso8859-3	. #xE8)	; øº’¸ˆ
    (latin-iso8859-9	. #xE8)	; øº“‡ˆ
    (latin-tcvn5712	. #xCC)	; øº“šŒ
    (latin-viscii-lower . #xE8)	; øº’ˆ
    (latin-viscii	. #xE8)	; øº’ˆ
    (ucs		. #x00E8)	; Ã¨
    ))
(define-char
  '((name		. "fullwidth latin small letter e with grave")
    (=>ucs		. #x00E8)	; Ã¨
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (ucs		  . #x00E8)	; Ã¨
      ))
    (chinese-gb2312		. #x2828)	; ø»„
    (japanese-jisx0212		. #x2B32)	; ø»Š³
    (japanese-jisx0213-1	. #x295E)	; ø»¢Ÿ©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with acute")
      (chinese-gb2312		  . #x2826)	; ø»„›
      (japanese-jisx0212	  . #x2B31)	; ø»Š³Œ
      (japanese-jisx0213-1	  . #x295F)	; ø»¢Ÿª
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (ucs		  . #x00C9)	; Ã‰
      ))
    (latin-iso8859-1	. #xE9)	; øº’µ‰
    (latin-iso8859-2	. #xE9)	; øº’¶©
    (latin-iso8859-3	. #xE9)	; øº’¸‰
    (latin-iso8859-4	. #xE9)	; øº’¹©
    (latin-iso8859-9	. #xE9)	; øº“‡‰
    (latin-tcvn5712	. #xD0)	; øº“š
    (latin-viscii-lower . #xE9)	; øº’‰
    (latin-viscii	. #xE9)	; øº’‰
    (ucs		. #x00E9)	; Ã©
    ))
(define-char
  '((name		. "fullwidth latin small letter e with acute")
    (=>ucs		. #x00E9)	; Ã©
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (ucs		  . #x00E9)	; Ã©
      ))
    (chinese-gb2312		. #x2826)	; ø»„›
    (japanese-jisx0212		. #x2B31)	; ø»Š³Œ
    (japanese-jisx0213-1	. #x295F)	; ø»¢Ÿª
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter e with circumflex")
      (chinese-gb2312		  . #x283A)	; ø»„¯
      (japanese-jisx0212	  . #x2B34)	; ø»Š³
      (japanese-jisx0213-1	  . #x2960)	; ø»¢Ÿ«
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00CA)	; ÃŠ
      ))
    (latin-iso8859-1	. #xEA)	; øº’µŠ
    (latin-iso8859-3	. #xEA)	; øº’¸Š
    (latin-iso8859-9	. #xEA)	; øº“‡Š
    (latin-tcvn5712	. #xAA)	; øº“™ª
    (latin-viscii-lower . #xEA)	; øº’Š
    (latin-viscii	. #xEA)	; øº’Š
    (ucs		. #x00EA)	; Ãª
    ))
(define-char
  '((name . "fullwidth latin small letter e with circumflex")
    (=>ucs		. #x00EA)	; Ãª
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (ucs		  . #x00EA)	; Ãª
      ))
    (chinese-gb2312		. #x283A)	; ø»„¯
    (japanese-jisx0212		. #x2B34)	; ø»Š³
    (japanese-jisx0213-1	. #x2960)	; ø»¢Ÿ«
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter e with diaeresis")
      (japanese-jisx0212	  . #x2B33)	; ø»Š³Ž
      (japanese-jisx0213-1	  . #x2961)	; ø»¢Ÿ¬
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (ucs		  . #x00CB)	; Ã‹
      ))
    (latin-iso8859-1	. #xEB)	; øº’µ‹
    (latin-iso8859-2	. #xEB)	; øº’¶«
    (latin-iso8859-3	. #xEB)	; øº’¸‹
    (latin-iso8859-4	. #xEB)	; øº’¹«
    (latin-iso8859-9	. #xEB)	; øº“‡‹
    (ucs		. #x00EB)	; Ã«
    ))
(define-char
  '((name . "fullwidth latin small letter e with diaeresis")
    (=>ucs		. #x00EB)	; Ã«
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter e with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (ucs		  . #x00EB)	; Ã«
      ))
    (japanese-jisx0212		. #x2B33)	; ø»Š³Ž
    (japanese-jisx0213-1	. #x2961)	; ø»¢Ÿ¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with grave")
      (chinese-gb2312		  . #x282C)	; ø»„¡
      (japanese-jisx0212	  . #x2B40)	; ø»Š³›
      (japanese-jisx0213-1	  . #x2962)	; ø»¢Ÿ­
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (ucs		  . #x00CC)	; ÃŒ
      ))
    (latin-iso8859-1	. #xEC)	; øº’µŒ
    (latin-iso8859-3	. #xEC)	; øº’¸Œ
    (latin-iso8859-9	. #xEC)	; øº“‡Œ
    (latin-tcvn5712	. #xD7)	; øº“š—
    (latin-viscii-lower . #xEC)	; øº’Œ
    (latin-viscii	. #xEC)	; øº’Œ
    (ucs		. #x00EC)	; Ã¬
    ))
(define-char
  '((name		. "fullwidth latin small letter i with grave")
    (=>ucs		. #x00EC)	; Ã¬
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter i with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (ucs		  . #x00EC)	; Ã¬
      ))
    (chinese-gb2312		. #x282C)	; ø»„¡
    (japanese-jisx0212		. #x2B40)	; ø»Š³›
    (japanese-jisx0213-1	. #x2962)	; ø»¢Ÿ­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with acute")
      (chinese-gb2312		  . #x282A)	; ø»„Ÿ
      (japanese-jisx0212	  . #x2B3F)	; ø»Š³š
      (japanese-jisx0213-1	  . #x2963)	; ø»¢Ÿ®
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (ucs		  . #x00CD)	; Ã
      ))
    (latin-iso8859-1	. #xED)	; øº’µ
    (latin-iso8859-2	. #xED)	; øº’¶­
    (latin-iso8859-3	. #xED)	; øº’¸
    (latin-iso8859-4	. #xED)	; øº’¹­
    (latin-iso8859-9	. #xED)	; øº“‡
    (latin-tcvn5712	. #xDD)	; øº“š
    (latin-viscii-lower . #xED)	; øº’
    (latin-viscii	. #xED)	; øº’
    (ucs		. #x00ED)	; Ã­
    ))
(define-char
  '((name		. "fullwidth latin small letter i with acute")
    (=>ucs		. #x00ED)	; Ã­
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter i with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (ucs		  . #x00ED)	; Ã­
      ))
    (chinese-gb2312		. #x282A)	; ø»„Ÿ
    (japanese-jisx0212		. #x2B3F)	; ø»Š³š
    (japanese-jisx0213-1	. #x2963)	; ø»¢Ÿ®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter i with circumflex")
      (japanese-jisx0212	  . #x2B42)	; ø»Š³
      (japanese-jisx0213-1	  . #x2964)	; ø»¢Ÿ¯
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00CE)	; ÃŽ
      ))
    (latin-iso8859-1	. #xEE)	; øº’µŽ
    (latin-iso8859-2	. #xEE)	; øº’¶®
    (latin-iso8859-3	. #xEE)	; øº’¸Ž
    (latin-iso8859-4	. #xEE)	; øº’¹®
    (latin-iso8859-9	. #xEE)	; øº“‡Ž
    (ucs		. #x00EE)	; Ã®
    ))
(define-char
  '((name . "fullwidth latin small letter i with circumflex")
    (=>ucs		. #x00EE)	; Ã®
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter i with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (ucs		  . #x00EE)	; Ã®
      ))
    (japanese-jisx0212		. #x2B42)	; ø»Š³
    (japanese-jisx0213-1	. #x2964)	; ø»¢Ÿ¯
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (ucs		  . #x00CF)	; Ã
      ))
    (latin-iso8859-1	. #xEF)	; øº’µ
    (latin-iso8859-3	. #xEF)	; øº’¸
    (latin-iso8859-9	. #xEF)	; øº“‡
    (ucs		. #x00EF)	; Ã¯
    ))
(define-char
  '((name . "fullwidth latin small letter i with diaeresis")
    (=>ucs		. #x00EF)	; Ã¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0308)
    (->uppercase
     ((name . "fullwidth latin capital letter i with diaeresis")
      ))
    (japanese-jisx0212		. #x2B41)	; ø»Š³œ
    (japanese-jisx0213-1	. #x2965)	; ø»¢Ÿ°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ETH")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (ucs		  . #x00D0)	; Ã
      ))
    (latin-iso8859-1	. #xF0)	; øº’µ
    (ipa		. #xC9)	; øº’›‰
    (ucs		. #x00F0)	; Ã°
    ))
(define-char
  '((name		. "fullwidth latin small letter eth")
    (=>ucs		. #x00F0)	; Ã°
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		  . "fullwidth latin capital letter eth")
      ))
    (korean-ksc5601		. #x2923)	; ø»ˆ¥¾
    (japanese-jisx0212		. #x2943)	; ø»Š°¢
    (japanese-jisx0213-1	. #x2966)	; ø»¢Ÿ±
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with tilde")
      (japanese-jisx0212	  . #x2B50)	; ø»Š³«
      (japanese-jisx0213-1	  . #x2967)	; ø»¢Ÿ²
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (ucs		  . #x00D1)	; Ã‘
      ))
    (latin-iso8859-1	. #xF1)	; øº’µ‘
    (latin-iso8859-3	. #xF1)	; øº’¸‘
    (latin-iso8859-9	. #xF1)	; øº“‡‘
    (ucs		. #x00F1)	; Ã±
    ))
(define-char
  '((name		. "fullwidth latin small letter n with tilde")
    (=>ucs		. #x00F1)	; Ã±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter n with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (ucs		  . #x00F1)	; Ã±
      ))
    (japanese-jisx0212		. #x2B50)	; ø»Š³«
    (japanese-jisx0213-1	. #x2967)	; ø»¢Ÿ²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with grave")
      (chinese-gb2312		  . #x2830)	; ø»„¥
      (japanese-jisx0212	  . #x2B52)	; ø»Š³­
      (japanese-jisx0213-1	  . #x2968)	; ø»¢Ÿ³
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (ucs		  . #x00D2)	; Ã’
      ))
    (latin-iso8859-1	. #xF2)	; øº’µ’
    (latin-iso8859-3	. #xF2)	; øº’¸’
    (latin-iso8859-9	. #xF2)	; øº“‡’
    (latin-tcvn5712	. #xDF)	; øº“šŸ
    (latin-viscii-lower . #xF2)	; øº’’
    (latin-viscii	. #xF2)	; øº’’
    (ucs		. #x00F2)	; Ã²
    ))
(define-char
  '((name		. "fullwidth latin small letter o with grave")
    (=>ucs		. #x00F2)	; Ã²
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin small letter o with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (ucs		  . #x00F2)	; Ã²
      ))
    (chinese-gb2312		. #x2830)	; ø»„¥
    (japanese-jisx0212		. #x2B52)	; ø»Š³­
    (japanese-jisx0213-1	. #x2968)	; ø»¢Ÿ³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with acute")
      (chinese-gb2312		  . #x282E)	; ø»„£
      (japanese-jisx0212	  . #x2B51)	; ø»Š³¬
      (japanese-jisx0213-1	  . #x2969)	; ø»¢Ÿ´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (ucs		  . #x00D3)	; Ã“
      ))
    (latin-iso8859-1	. #xF3)	; øº’µ“
    (latin-iso8859-2	. #xF3)	; øº’¶³
    (latin-iso8859-3	. #xF3)	; øº’¸“
    (latin-iso8859-9	. #xF3)	; øº“‡“
    (latin-tcvn5712	. #xE3)	; øº“š£
    (latin-viscii-lower . #xF3)	; øº’“
    (latin-viscii	. #xF3)	; øº’“
    (ucs		. #x00F3)	; Ã³
    ))
(define-char
  '((name		. "fullwidth latin small letter o with acute")
    (=>ucs		. #x00F3)	; Ã³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (ucs		  . #x00F3)	; Ã³
      ))
    (chinese-gb2312		. #x282E)	; ø»„£
    (japanese-jisx0212		. #x2B51)	; ø»Š³¬
    (japanese-jisx0213-1	. #x2969)	; ø»¢Ÿ´
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter o with circumflex")
      (japanese-jisx0212	  . #x2B54)	; ø»Š³¯
      (japanese-jisx0213-1	  . #x296A)	; ø»¢Ÿµ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00D4)	; Ã”
      ))
    (latin-iso8859-1	. #xF4)	; øº’µ”
    (latin-iso8859-2	. #xF4)	; øº’¶´
    (latin-iso8859-3	. #xF4)	; øº’¸”
    (latin-iso8859-4	. #xF4)	; øº’¹´
    (latin-iso8859-9	. #xF4)	; øº“‡”
    (latin-tcvn5712	. #xAB)	; øº“™«
    (latin-viscii-lower . #xF4)	; øº’”
    (latin-viscii	. #xF4)	; øº’”
    (ucs		. #x00F4)	; Ã´
    ))
(define-char
  '((name . "fullwidth latin small letter o with circumflex")
    (=>ucs		. #x00F4)	; Ã´
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (ucs		  . #x00F4)	; Ã´
      ))
    (japanese-jisx0212		. #x2B54)	; ø»Š³¯
    (japanese-jisx0213-1	. #x296A)	; ø»¢Ÿµ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with tilde")
      (japanese-jisx0212	  . #x2B58)	; ø»Š³³
      (japanese-jisx0213-1	  . #x296B)	; ø»¢Ÿ¶
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (ucs		  . #x00D5)	; Ã•
      ))
    (latin-iso8859-1	. #xF5)	; øº’µ•
    (latin-iso8859-4	. #xF5)	; øº’¹µ
    (latin-iso8859-9	. #xF5)	; øº“‡•
    (latin-tcvn5712	. #xE2)	; øº“š¢
    (latin-viscii-lower . #xF5)	; øº’•
    (latin-viscii	. #xF5)	; øº’•
    (ucs		. #x00F5)	; Ãµ
    ))
(define-char
  '((name		. "fullwidth latin small letter o with tilde")
    (=>ucs		. #x00F5)	; Ãµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (ucs		  . #x00F5)	; Ãµ
      ))
    (japanese-jisx0212		. #x2B58)	; ø»Š³³
    (japanese-jisx0213-1	. #x296B)	; ø»¢Ÿ¶
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter o with diaeresis")
      (japanese-jisx0212	  . #x2B53)	; ø»Š³®
      (japanese-jisx0213-1	  . #x296C)	; ø»¢Ÿ·
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (ucs		  . #x00D6)	; Ã–
      ))
    (latin-iso8859-1	. #xF6)	; øº’µ–
    (latin-iso8859-2	. #xF6)	; øº’¶¶
    (latin-iso8859-3	. #xF6)	; øº’¸–
    (latin-iso8859-4	. #xF6)	; øº’¹¶
    (latin-iso8859-9	. #xF6)	; øº“‡–
    (ucs		. #x00F6)	; Ã¶
    ))
(define-char
  '((name . "fullwidth latin small letter o with diaeresis")
    (=>ucs		. #x00F6)	; Ã¶
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (ucs		  . #x00F6)	; Ã¶
      ))
    (japanese-jisx0212		. #x2B53)	; ø»Š³®
    (japanese-jisx0213-1	. #x296C)	; ø»¢Ÿ·
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth division sign")
      (japanese-jisx0208-1978	  . #x2160)	; ø»¼¿
      (chinese-gb2312		  . #x2142)	; ø»„†¥
      (japanese-jisx0208	  . #x2160)	; ø»†‘‡
      (korean-ksc5601		  . #x2140)	; ø»ˆš«
      (chinese-cns11643-1	  . #x2233)	; ø»‘„Œ
      ))
    (latin-iso8859-1	. #xF7)	; øº’µ—
    (latin-iso8859-2	. #xF7)	; øº’¶·
    (latin-iso8859-3	. #xF7)	; øº’¸—
    (latin-iso8859-4	. #xF7)	; øº’¹·
    (hebrew-iso8859-8	. #xBA)	; øº’¾º
    (latin-iso8859-9	. #xF7)	; øº“‡—
    (ucs		. #x00F7)	; Ã·
    ))
(define-char
  '((name		. "fullwidth division sign")
    (=>ucs		. #x00F7)	; Ã·
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (<-fullwidth
     ((name		  . "DIVISION SIGN")
      (ucs		  . #x00F7)	; Ã·
      ))
    (japanese-jisx0208-1978	. #x2160)	; ø»¼¿
    (chinese-gb2312		. #x2142)	; ø»„†¥
    (japanese-jisx0208		. #x2160)	; ø»†‘‡
    (korean-ksc5601		. #x2140)	; ø»ˆš«
    (chinese-cns11643-1		. #x2233)	; ø»‘„Œ
    (japanese-jisx0208-1990	. #x2160)	; ø½‰¶»
    (chinese-big5		. #xA1D2)	; ý¢€Š‡’
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with stroke")
      (korean-ksc5601		  . #x292A)	; ø»ˆ¦…
      (japanese-jisx0212	  . #x294C)	; ø»Š°«
      (japanese-jisx0213-1	  . #x296D)	; ø»¢Ÿ¸
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH STROKE")
      (ucs		  . #x00D8)	; Ã˜
      ))
    (latin-iso8859-1	. #xF8)	; øº’µ˜
    (latin-iso8859-4	. #xF8)	; øº’¹¸
    (latin-iso8859-9	. #xF8)	; øº“‡˜
    (ipa		. #xAF)	; øº’š¯
    (ucs		. #x00F8)	; Ã¸
    ))
(define-char
  '((name		. "fullwidth latin small letter o with stroke")
    (=>ucs		. #x00F8)	; Ã¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter o with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (ucs		  . #x00F8)	; Ã¸
      ))
    (korean-ksc5601		. #x292A)	; ø»ˆ¦…
    (japanese-jisx0212		. #x294C)	; ø»Š°«
    (japanese-jisx0213-1	. #x296D)	; ø»¢Ÿ¸
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0300)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with grave")
      (chinese-gb2312		  . #x2834)	; ø»„©
      (japanese-jisx0212	  . #x2B63)	; ø»Š³¾
      (japanese-jisx0213-1	  . #x296E)	; ø»¢Ÿ¹
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH GRAVE")
      (ucs		  . #x00D9)	; Ã™
      ))
    (latin-iso8859-1	. #xF9)	; øº’µ™
    (latin-iso8859-3	. #xF9)	; øº’¸™
    (latin-iso8859-9	. #xF9)	; øº“‡™
    (latin-tcvn5712	. #xEF)	; øº“š¯
    (latin-viscii-lower . #xF9)	; øº’™
    (latin-viscii	. #xF9)	; øº’™
    (ucs		. #x00F9)	; Ã¹
    ))
(define-char
  '((name		. "fullwidth latin small letter u with grave")
    (=>ucs		. #x00F9)	; Ã¹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with grave")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (ucs		  . #x00F9)	; Ã¹
      ))
    (chinese-gb2312		. #x2834)	; ø»„©
    (japanese-jisx0212		. #x2B63)	; ø»Š³¾
    (japanese-jisx0213-1	. #x296E)	; ø»¢Ÿ¹
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with acute")
      (chinese-gb2312		  . #x2832)	; ø»„§
      (japanese-jisx0212	  . #x2B62)	; ø»Š³½
      (japanese-jisx0213-1	  . #x296F)	; ø»¢Ÿº
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (ucs		  . #x00DA)	; Ãš
      ))
    (latin-iso8859-1	. #xFA)	; øº’µš
    (latin-iso8859-2	. #xFA)	; øº’¶º
    (latin-iso8859-3	. #xFA)	; øº’¸š
    (latin-iso8859-4	. #xFA)	; øº’¹º
    (latin-iso8859-9	. #xFA)	; øº“‡š
    (latin-tcvn5712	. #xF3)	; øº“š³
    (latin-viscii-lower . #xFA)	; øº’š
    (latin-viscii	. #xFA)	; øº’š
    (ucs		. #x00FA)	; Ãº
    ))
(define-char
  '((name		. "fullwidth latin small letter u with acute")
    (=>ucs		. #x00FA)	; Ãº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (ucs		  . #x00FA)	; Ãº
      ))
    (chinese-gb2312		. #x2832)	; ø»„§
    (japanese-jisx0212		. #x2B62)	; ø»Š³½
    (japanese-jisx0213-1	. #x296F)	; ø»¢Ÿº
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter u with circumflex")
      (japanese-jisx0212	  . #x2B65)	; ø»Š´€
      (japanese-jisx0213-1	  . #x2970)	; ø»¢Ÿ»
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00DB)	; Ã›
      ))
    (latin-iso8859-1	. #xFB)	; øº’µ›
    (latin-iso8859-3	. #xFB)	; øº’¸›
    (latin-iso8859-4	. #xFB)	; øº’¹»
    (latin-iso8859-9	. #xFB)	; øº“‡›
    (ucs		. #x00FB)	; Ã»
    ))
(define-char
  '((name . "fullwidth latin small letter u with circumflex")
    (=>ucs		. #x00FB)	; Ã»
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (ucs		  . #x00FB)	; Ã»
      ))
    (japanese-jisx0212		. #x2B65)	; ø»Š´€
    (japanese-jisx0213-1	. #x2970)	; ø»¢Ÿ»
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter u with diaeresis")
      (chinese-gb2312		  . #x2839)	; ø»„®
      (japanese-jisx0212	  . #x2B64)	; ø»Š³¿
      (japanese-jisx0213-1	  . #x2971)	; ø»¢Ÿ¼
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (ucs		  . #x00DC)	; Ãœ
      ))
    (latin-iso8859-1	. #xFC)	; øº’µœ
    (latin-iso8859-2	. #xFC)	; øº’¶¼
    (latin-iso8859-3	. #xFC)	; øº’¸œ
    (latin-iso8859-4	. #xFC)	; øº’¹¼
    (latin-iso8859-9	. #xFC)	; øº“‡œ
    (ucs		. #x00FC)	; Ã¼
    ))
(define-char
  '((name . "fullwidth latin small letter u with diaeresis")
    (=>ucs		. #x00FC)	; Ã¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter u with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (ucs		  . #x00FC)	; Ã¼
      ))
    (chinese-gb2312		. #x2839)	; ø»„®
    (japanese-jisx0212		. #x2B64)	; ø»Š³¿
    (japanese-jisx0213-1	. #x2971)	; ø»¢Ÿ¼
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter y with acute")
      (japanese-jisx0212	  . #x2B72)	; ø»Š´
      (japanese-jisx0213-1	  . #x2972)	; ø»¢Ÿ½
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (ucs		  . #x00DD)	; Ã
      ))
    (latin-iso8859-1	. #xFD)	; øº’µ
    (latin-iso8859-2	. #xFD)	; øº’¶½
    (latin-tcvn5712	. #xFD)	; øº“š½
    (latin-viscii-lower . #xFD)	; øº’
    (latin-viscii	. #xFD)	; øº’
    (ucs		. #x00FD)	; Ã½
    ))
(define-char
  '((name		. "fullwidth latin small letter y with acute")
    (=>ucs		. #x00FD)	; Ã½
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin small letter y with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (ucs		  . #x00FD)	; Ã½
      ))
    (japanese-jisx0212		. #x2B72)	; ø»Š´
    (japanese-jisx0213-1	. #x2972)	; ø»¢Ÿ½
    ))
(define-char
  '((name		. "LATIN SMALL LETTER THORN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->fullwidth
     ((name		  . "fullwidth latin small letter thorn")
      (korean-ksc5601		  . #x292D)	; ø»ˆ¦ˆ
      (japanese-jisx0212	  . #x2950)	; ø»Š°¯
      (japanese-jisx0213-1	  . #x2973)	; ø»¢Ÿ¾
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (ucs		  . #x00DE)	; Ãž
      ))
    (latin-iso8859-1	. #xFE)	; øº’µž
    (ucs		. #x00FE)	; Ã¾
    ))
(define-char
  '((name		. "fullwidth latin small letter thorn")
    (=>ucs		. #x00FE)	; Ã¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->uppercase
     ((name		  . "fullwidth latin capital letter thorn")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER THORN")
      (ucs		  . #x00FE)	; Ã¾
      ))
    (korean-ksc5601		. #x292D)	; ø»ˆ¦ˆ
    (japanese-jisx0212		. #x2950)	; ø»Š°¯
    (japanese-jisx0213-1	. #x2973)	; ø»¢Ÿ¾
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0308)
    (->fullwidth
     ((name . "fullwidth latin small letter y with diaeresis")
      (japanese-jisx0212	  . #x2B73)	; ø»Š´Ž
      (japanese-jisx0213-1	  . #x2974)	; ø»¢Ÿ¿
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (ucs		  . #x0178)	; Å¸
      ))
    (latin-iso8859-1	. #xFF)	; øº’µŸ
    (latin-iso8859-9	. #xFF)	; øº“‡Ÿ
    (ucs		. #x00FF)	; Ã¿
    ))
(define-char
  '((name . "fullwidth latin small letter y with diaeresis")
    (=>ucs		. #x00FF)	; Ã¿
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter y with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (ucs		  . #x00FF)	; Ã¿
      ))
    (japanese-jisx0212		. #x2B73)	; ø»Š´Ž
    (japanese-jisx0213-1	. #x2974)	; ø»¢Ÿ¿
    ))
