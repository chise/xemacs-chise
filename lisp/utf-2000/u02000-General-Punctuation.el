;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "EN QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2002)
    (=ucs		. #x2000)	; â€€
    ))
(define-char
  '((name		. "EM QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2003)
    (=ucs		. #x2001)	; â€
    ))
(define-char
  '((name		. "EN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2002)	; â€‚
    ))
(define-char
  '((name		. "EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2003)	; â€ƒ
    (=cns11643-1	. #x256D)	; ø»‘‰ 
    ))
(define-char
  '((name		. "THREE-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2004)	; â€„
    ))
(define-char
  '((name		. "FOUR-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2005)	; â€…
    ))
(define-char
  '((name		. "SIX-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2006)	; â€†
    ))
(define-char
  '((name		. "FIGURE SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (=ucs		. #x2007)	; â€‡
    ))
(define-char
  '((name		. "PUNCTUATION SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2008)	; â€ˆ
    ))
(define-char
  '((name		. "THIN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2009)	; â€‰
    ))
(define-char
  '((name		. "HAIR SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x200A)	; â€Š
    ))
(define-char
  '((name		. "ZERO WIDTH SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200B)	; â€‹
    ))
(define-char
  '((name		. "ZERO WIDTH NON-JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200C)	; â€Œ
    ))
(define-char
  '((name		. "ZERO WIDTH JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200D)	; â€
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x200E)	; â€Ž
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "R")
    (mirrored		. nil)
    (=ucs		. #x200F)	; â€
    ))
(define-char
  '((name		. "HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2010)	; â€
    (=jis-x0208		. #x213E)	; ø½‰¶™
    ))
(define-char
  '((name		. "NON-BREAKING HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	noBreak #x2010)
    (=ucs		. #x2011)	; â€‘
    ))
(define-char
  '((name		. "FIGURE DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2012)	; â€’
    ))
(define-char
  '((name		. "EN DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2013)	; â€“
    (=cns11643-1	. #x2139)	; ø»‘‚´
    (=jis-x0213-1-2000	. #x237C)	; ø»¢—“
    (=big5		. #xA156)	; ý¢€Š…–
    ))
(define-char
  '((name		. "EM DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2014)	; â€”
    (=jis-x0208		. #x213D)	; ø½‰¶˜
    (=cns11643-1	. #x2137)	; ø»‘‚²
    (=big5		. #xA158)	; ý¢€Š…˜
    ))
(define-char
  '((name		. "HORIZONTAL BAR")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2015)	; â€•
    (=gb2312		. #x212A)	; ø»„†
    (=ks-x1001		. #x212A)	; ø»ˆš•
    ))
(define-char
  '((name		. "HALFWIDTH HORIZONTAL BAR")
    (=>ucs		. #x2015)	; â€•
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	narrow #x2015)
    (greek-iso8859-7	. #xAF)	; øº’»¯
    ))
(define-char
  '((name		. "DOUBLE VERTICAL LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2016)	; â€–
    (=gb2312		. #x212C)	; ø»„†
    (=jis-x0208		. #x2142)	; ø½‰¶
    (=cns11643-1	. #x225D)	; ø»‘„¶
    ))
(define-char
  '((name		. "DOUBLE LOW LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0333)
    (=ucs		. #x2017)	; â€—
    (hebrew-iso8859-8	. #xDF)	; øº’¿Ÿ
    ))
(define-char
  '((name		. "LEFT SINGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2018)	; â€˜
    (=gb2312		. #x212E)	; ø»„†‘
    (=jis-x0208		. #x2146)	; ø½‰¶¡
    (=ks-x1001		. #x212E)	; ø»ˆš™
    (=cns11643-1	. #x2164)	; ø»‘ƒŸ
    (=big5		. #xA1A5)	; ý¢€Š†¥
    ))
(define-char
  '((name		. "RIGHT SINGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2019)	; â€™
    (=gb2312		. #x212F)	; ø»„†’
    (=jis-x0208		. #x2147)	; ø½‰¶¢
    (=ks-x1001		. #x212F)	; ø»ˆšš
    (=cns11643-1	. #x2165)	; ø»‘ƒ 
    (=big5		. #xA1A6)	; ý¢€Š†¦
    ))
(define-char
  '((name		. "SINGLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201A)	; â€š
    ))
(define-char
  '((name		. "SINGLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201B)	; â€›
    ))
(define-char
  '((name		. "LEFT DOUBLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201C)	; â€œ
    (=gb2312		. #x2130)	; ø»„†“
    (=jis-x0208		. #x2148)	; ø½‰¶£
    (=ks-x1001		. #x2130)	; ø»ˆš›
    (=cns11643-1	. #x2166)	; ø»‘ƒ¡
    (=big5		. #xA1A7)	; ý¢€Š†§
    ))
(define-char
  '((name		. "RIGHT DOUBLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201D)	; â€
    (=gb2312		. #x2131)	; ø»„†”
    (=jis-x0208		. #x2149)	; ø½‰¶¤
    (=ks-x1001		. #x2131)	; ø»ˆšœ
    (=cns11643-1	. #x2167)	; ø»‘ƒ¢
    (=big5		. #xA1A8)	; ý¢€Š†¨
    ))
(define-char
  '((name		. "DOUBLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201E)	; â€ž
    ))
(define-char
  '((name		. "DOUBLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201F)	; â€Ÿ
    ))
(define-char
  '((name		. "DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2020)	; â€ 
    (=jis-x0208-1983	. #x2277)	; ø»†’¼
    (=ks-x1001		. #x2253)	; ø»ˆœœ
    (=jis-x0208-1990	. #x2277)	; ø½‰¸°
    ))
(define-char
  '((name		. "DOUBLE DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2021)	; â€¡
    (=jis-x0208-1983	. #x2278)	; ø»†’½
    (=ks-x1001		. #x2254)	; ø»ˆœ
    (=jis-x0208-1990	. #x2278)	; ø½‰¸±
    ))
(define-char
  '((name		. "BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2022)	; â€¢
    (=jis-x0213-1-2000	. #x2340)	; ø»¢–—
    ))
(define-char
  '((name		. "TRIANGULAR BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2023)	; â€£
    ))
(define-char
  '((name		. "ONE DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E)
    (=ucs		. #x2024)	; â€¤
    ))
(define-char
  '((name		. "TWO DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E)
    (=ucs		. #x2025)	; â€¥
    (=jis-x0208		. #x2145)	; ø½‰¶ 
    (=ks-x1001		. #x2125)	; ø»ˆš
    (=cns11643-1	. #x212D)	; ø»‘‚¨
    (=big5		. #xA14C)	; ý¢€Š…Œ
    ))
(define-char
  '((name		. "HORIZONTAL ELLIPSIS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E #x002E)
    (=ucs		. #x2026)	; â€¦
    (=gb2312		. #x212D)	; ø»„†
    (=jis-x0208		. #x2144)	; ø½‰¶Ÿ
    (=ks-x1001		. #x2126)	; ø»ˆš‘
    (=cns11643-1	. #x212C)	; ø»‘‚§
    (=big5		. #xA14B)	; ý¢€Š…‹
    ))
(define-char
  '((name		. "HYPHENATION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2027)	; â€§
    (=cns11643-1	. #x2131)	; ø»‘‚¬
    (=big5		. #xA145)	; ý¢€Š……
    ))
(define-char
  '((name		. "LINE SEPARATOR")
    (general-category	separator line) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2028)	; â€¨
    ))
(define-char
  '((name		. "PARAGRAPH SEPARATOR")
    (general-category	separator paragraph) ; Normative Category
    (bidi-category	. "B")
    (mirrored		. nil)
    (=ucs		. #x2029)	; â€©
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRE")
    (mirrored		. nil)
    (=ucs		. #x202A)	; â€ª
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLE")
    (mirrored		. nil)
    (=ucs		. #x202B)	; â€«
    ))
(define-char
  '((name		. "POP DIRECTIONAL FORMATTING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "PDF")
    (mirrored		. nil)
    (=ucs		. #x202C)	; â€¬
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRO")
    (mirrored		. nil)
    (=ucs		. #x202D)	; â€­
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLO")
    (mirrored		. nil)
    (=ucs		. #x202E)	; â€®
    ))
(define-char
  '((name		. "NARROW NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (=ucs		. #x202F)	; â€¯
    ))
(define-char
  '((name		. "PER MILLE SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2030)	; â€°
    (=gb2312		. #x216B)	; ø»„‡Ž
    (=jis-x0208-1983	. #x2273)	; ø»†’¸
    (=ks-x1001		. #x2236)	; ø»ˆ›¿
    (=jis-x0208-1990	. #x2273)	; ø½‰¸¬
    ))
(define-char
  '((name		. "PER TEN THOUSAND SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2031)	; â€±
    ))
(define-char
  '((name		. "PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2032)	; â€²
    (=gb2312		. #x2164)	; ø»„‡‡
    (=jis-x0208		. #x216C)	; ø½‰·‡
    (=ks-x1001		. #x2147)	; ø»ˆš²
    (=cns11643-1	. #x216B)	; ø»‘ƒ¦
    (=big5		. #xA1AC)	; ý¢€Š†¬
    ))
(define-char
  '((name		. "DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032)
    (=ucs		. #x2033)	; â€³
    (=gb2312		. #x2165)	; ø»„‡ˆ
    (=jis-x0208		. #x216D)	; ø½‰·ˆ
    (=ks-x1001		. #x2148)	; ø»ˆš³
    ))
(define-char
  '((name		. "TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032 #x2032)
    (=ucs		. #x2034)	; â€´
    ))
(define-char
  '((name		. "REVERSED PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2035)	; â€µ
    (=cns11643-1	. #x216A)	; ø»‘ƒ¥
    (=big5		. #xA1AB)	; ý¢€Š†«
    ))
(define-char
  '((name		. "REVERSED DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035)
    (=ucs		. #x2036)	; â€¶
    ))
(define-char
  '((name		. "REVERSED TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035 #x2035)
    (=ucs		. #x2037)	; â€·
    ))
(define-char
  '((name		. "CARET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2038)	; â€¸
    ))
(define-char
  '((name		. "SINGLE LEFT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2039)	; â€¹
    ))
(define-char
  '((name		. "SINGLE RIGHT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x203A)	; â€º
    ))
(define-char
  '((name		. "REFERENCE MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x203B)	; â€»
    (=gb2312		. #x2179)	; ø»„‡œ
    (=jis-x0208		. #x2228)	; ø½‰·¡
    (=ks-x1001		. #x2158)	; ø»ˆ›ƒ
    (=cns11643-1	. #x216F)	; ø»‘ƒª
    (=big5		. #xA1B0)	; ý¢€Š†°
    ))
(define-char
  '((name		. "DOUBLE EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x0021)
    (=ucs		. #x203C)	; â€¼
    (=jis-x0213-1-2000	. #x286B)	; ø»¢ž˜
    ))
(define-char
  '((name		. "INTERROBANG")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x203D)	; â€½
    ))
(define-char
  '((name		. "OVERLINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0305)
    (->fullwidth
     ((name		  . "FULLWIDTH OVERLINE")
      (=gb2312		  . #x237E)	; ø»„Š
      (=jis-x0208	  . #x2131)	; ø½‰¶Œ
      (=ks-x1001	  . #x237E)	; ø»ˆž¥
      (=cns11643-1	  . #x2223)	; ø»‘ƒ¼
      ))
    (=ucs		. #x203E)	; â€¾
    (hebrew-iso8859-8	. #xAF)	; øº’¾¯
    (latin-jisx0201	. #x7E)	; øº‘Œ©
    ))
(define-char
  '((name		. "FULLWIDTH OVERLINE")
    (=>ucs		. #x203E)	; â€¾
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x203E)
    (<-fullwidth
     ((name		  . "OVERLINE")
      (=ucs		  . #x203E)	; â€¾
      ))
    (=gb2312		. #x237E)	; ø»„Š
    (=jis-x0208		. #x2131)	; ø½‰¶Œ
    (=ks-x1001		. #x237E)	; ø»ˆž¥
    (=cns11643-1	. #x2223)	; ø»‘ƒ¼
    (=big5		. #xA1C2)	; ý¢€Š‡‚
    (=ucs@jis		. #x203E)	; ø»„Š
    ))
(define-char
  '((name		. "heavy overline")
    (=>ucs		. #x203E)	; â€¾
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=cns11643-1	. #x2224)	; ø»‘ƒ½
    (=big5		. #xA1C3)	; ý¢€Š‡ƒ
    (=ucs@big5		. #xFFE3)	; ø»‘ƒ½
    ))
(define-char
  '((name		. "UNDERTIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Enotikon")
    (=ucs		. #x203F)	; â€¿
    ))
(define-char
  '((name		. "CHARACTER TIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2040)	; â€
    ))
(define-char
  '((name		. "CARET INSERTION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2041)	; â
    ))
(define-char
  '((name		. "ASTERISM")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2042)	; â‚
    (=jis-x0213-1-2000	. #x2C7E)	; ø»¢¤£
    ))
(define-char
  '((name		. "HYPHEN BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2043)	; âƒ
    ))
(define-char
  '((name		. "FRACTION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2044)	; â„
    (=cns11643-1	. #x225F)	; ø»‘„¸
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2045)	; â…
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2046)	; â†
    ))
(define-char
  '((name		. "DOUBLE QUESTION MARK")
    (=ucs		. #x2047)	; â‡
    (=jis-x0213-1-2000	. #x286C)	; ø»¢ž™
    ))
(define-char
  '((name		. "QUESTION EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x003F #x0021)
    (=ucs		. #x2048)	; âˆ
    (=jis-x0213-1-2000	. #x286D)	; ø»¢žš
    ))
(define-char
  '((name		. "EXCLAMATION QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x003F)
    (=ucs		. #x2049)	; â‰
    (=jis-x0213-1-2000	. #x286E)	; ø»¢ž›
    ))
(define-char
  '((name		. "TIRONIAN SIGN ET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204A)	; âŠ
    ))
(define-char
  '((name		. "REVERSED PILCROW SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204B)	; â‹
    ))
(define-char
  '((name		. "BLACK LEFTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204C)	; âŒ
    ))
(define-char
  '((name		. "BLACK RIGHTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204D)	; â
    ))
(define-char
  '((name		. "TWO ASTERISKS ALIGNED VERTICALLY")
    (=ucs		. #x2051)	; â‘
    (=jis-x0213-1-2000	. #x2C7D)	; ø»¢¤¢
    ))
(define-char
  '((name		. "INHIBIT SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206A)	; âª
    ))
(define-char
  '((name		. "ACTIVATE SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206B)	; â«
    ))
(define-char
  '((name		. "INHIBIT ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206C)	; â¬
    ))
(define-char
  '((name		. "ACTIVATE ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206D)	; â­
    ))
(define-char
  '((name		. "NATIONAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206E)	; â®
    ))
(define-char
  '((name		. "NOMINAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206F)	; â¯
    ))
