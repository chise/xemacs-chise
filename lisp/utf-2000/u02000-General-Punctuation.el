(define-char
  '((name		. "EN QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2002)
    (ucs		. #x2000)	;  
    ))
(define-char
  '((name		. "EM QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2003)
    (ucs		. #x2001)	;  
    ))
(define-char
  '((name		. "EN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x2002)	;  
    ))
(define-char
  '((name		. "EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (chinese-cns11643-1 . #x256D)	; �����
    (ucs		. #x2003)	;  
    ))
(define-char
  '((name		. "THREE-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x2004)	;  
    ))
(define-char
  '((name		. "FOUR-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x2005)	;  
    ))
(define-char
  '((name		. "SIX-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x2006)	;  
    ))
(define-char
  '((name		. "FIGURE SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (ucs		. #x2007)	;  
    ))
(define-char
  '((name		. "PUNCTUATION SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x2008)	;  
    ))
(define-char
  '((name		. "THIN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x2009)	;  
    ))
(define-char
  '((name		. "HAIR SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (ucs		. #x200A)	;  
    ))
(define-char
  '((name		. "ZERO WIDTH SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x200B)	; ​
    ))
(define-char
  '((name		. "ZERO WIDTH NON-JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x200C)	; ‌
    ))
(define-char
  '((name		. "ZERO WIDTH JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x200D)	; ‍
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x200E)	; ‎
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "R")
    (mirrored		. nil)
    (ucs		. #x200F)	; ‏
    ))
(define-char
  '((name		. "HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x213E)	; �����
    (japanese-jisx0208		. #x213E)	; �����
    (japanese-jisx0208-1990	. #x213E)	; �����
    (ucs			. #x2010)	; ‐
    ))
(define-char
  '((name		. "NON-BREAKING HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	noBreak #x2010)
    (ucs		. #x2011)	; ‑
    ))
(define-char
  '((name		. "FIGURE DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2012)	; ‒
    ))
(define-char
  '((name		. "EN DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1		. #x2139)	; �����
    (japanese-jisx0213-1	. #x237C)	; �����
    (chinese-big5		. #xA156)	; �����
    (ucs			. #x2013)	; –
    ))
(define-char
  '((name		. "EM DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x213D)	; �����
    (japanese-jisx0208		. #x213D)	; �����
    (chinese-cns11643-1		. #x2137)	; �����
    (japanese-jisx0208-1990	. #x213D)	; �����
    (chinese-big5		. #xA158)	; �����
    (ucs			. #x2014)	; —
    ))
(define-char
  '((name		. "HORIZONTAL BAR")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	. #x212A)	; �����
    (korean-ksc5601	. #x212A)	; �����
    (ucs		. #x2015)	; ―
    ))
(define-char
  '((name		. "HALFWIDTH HORIZONTAL BAR")
    (->ucs		. #x2015)	; ―
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	narrow #x2015)
    (greek-iso8859-7	. #xAF)	; �����
    ))
(define-char
  '((name		. "DOUBLE VERTICAL LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2142)	; �����
    (chinese-gb2312		. #x212C)	; �����
    (japanese-jisx0208		. #x2142)	; �����
    (chinese-cns11643-1		. #x225D)	; �����
    (japanese-jisx0208-1990	. #x2142)	; �����
    (ucs			. #x2016)	; ‖
    ))
(define-char
  '((name		. "DOUBLE LOW LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0333)
    (hebrew-iso8859-8	. #xDF)	; �����
    (ucs		. #x2017)	; ‗
    ))
(define-char
  '((name		. "LEFT SINGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2146)	; �����
    (chinese-gb2312		. #x212E)	; �����
    (japanese-jisx0208		. #x2146)	; �����
    (korean-ksc5601		. #x212E)	; �����
    (chinese-cns11643-1		. #x2164)	; �����
    (japanese-jisx0208-1990	. #x2146)	; �����
    (chinese-big5		. #xA1A5)	; �����
    (ucs			. #x2018)	; ‘
    ))
(define-char
  '((name		. "RIGHT SINGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2147)	; �����
    (chinese-gb2312		. #x212F)	; �����
    (japanese-jisx0208		. #x2147)	; �����
    (korean-ksc5601		. #x212F)	; �����
    (chinese-cns11643-1		. #x2165)	; �����
    (japanese-jisx0208-1990	. #x2147)	; �����
    (chinese-big5		. #xA1A6)	; �����
    (ucs			. #x2019)	; ’
    ))
(define-char
  '((name		. "SINGLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x201A)	; ‚
    ))
(define-char
  '((name		. "SINGLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x201B)	; ‛
    ))
(define-char
  '((name		. "LEFT DOUBLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2148)	; �����
    (chinese-gb2312		. #x2130)	; �����
    (japanese-jisx0208		. #x2148)	; �����
    (korean-ksc5601		. #x2130)	; �����
    (chinese-cns11643-1		. #x2166)	; �����
    (japanese-jisx0208-1990	. #x2148)	; �����
    (chinese-big5		. #xA1A7)	; �����
    (ucs			. #x201C)	; “
    ))
(define-char
  '((name		. "RIGHT DOUBLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2149)	; �����
    (chinese-gb2312		. #x2131)	; �����
    (japanese-jisx0208		. #x2149)	; �����
    (korean-ksc5601		. #x2131)	; �����
    (chinese-cns11643-1		. #x2167)	; �����
    (japanese-jisx0208-1990	. #x2149)	; �����
    (chinese-big5		. #xA1A8)	; �����
    (ucs			. #x201D)	; ”
    ))
(define-char
  '((name		. "DOUBLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x201E)	; „
    ))
(define-char
  '((name		. "DOUBLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x201F)	; ‟
    ))
(define-char
  '((name		. "DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208		. #x2277)	; �����
    (korean-ksc5601		. #x2253)	; �����
    (japanese-jisx0208-1990	. #x2277)	; �����
    (ucs			. #x2020)	; †
    ))
(define-char
  '((name		. "DOUBLE DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208		. #x2278)	; �����
    (korean-ksc5601		. #x2254)	; �����
    (japanese-jisx0208-1990	. #x2278)	; �����
    (ucs			. #x2021)	; ‡
    ))
(define-char
  '((name		. "BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0213-1	. #x2340)	; �����
    (ucs			. #x2022)	; •
    ))
(define-char
  '((name		. "TRIANGULAR BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2023)	; ‣
    ))
(define-char
  '((name		. "ONE DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E)
    (chinese-big5	. #xA3BB)	; �����
    (ucs		. #x2024)	; ․
    ))
(define-char
  '((name		. "TWO DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E)
    (japanese-jisx0208-1978	. #x2145)	; �����
    (japanese-jisx0208		. #x2145)	; �����
    (korean-ksc5601		. #x2125)	; �����
    (chinese-cns11643-1		. #x212D)	; �����
    (japanese-jisx0208-1990	. #x2145)	; �����
    (chinese-big5		. #xA14C)	; �����
    (ucs			. #x2025)	; ‥
    ))
(define-char
  '((name		. "HORIZONTAL ELLIPSIS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E #x002E)
    (japanese-jisx0208-1978	. #x2144)	; �����
    (chinese-gb2312		. #x212D)	; �����
    (japanese-jisx0208		. #x2144)	; �����
    (korean-ksc5601		. #x2126)	; �����
    (chinese-cns11643-1		. #x212C)	; �����
    (japanese-jisx0208-1990	. #x2144)	; �����
    (chinese-big5		. #xA14B)	; �����
    (ucs			. #x2026)	; …
    ))
(define-char
  '((name		. "HYPHENATION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 . #x2131)	; �����
    (chinese-big5	. #xA145)	; �����
    (ucs		. #x2027)	; ‧
    ))
(define-char
  '((name		. "LINE SEPARATOR")
    (general-category	separator line) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (ucs		. #x2028)	;  
    ))
(define-char
  '((name		. "PARAGRAPH SEPARATOR")
    (general-category	separator paragraph) ; Normative Category
    (bidi-category	. "B")
    (mirrored		. nil)
    (ucs		. #x2029)	;  
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRE")
    (mirrored		. nil)
    (ucs		. #x202A)	; ‪
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLE")
    (mirrored		. nil)
    (ucs		. #x202B)	; ‫
    ))
(define-char
  '((name		. "POP DIRECTIONAL FORMATTING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "PDF")
    (mirrored		. nil)
    (ucs		. #x202C)	; ‬
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRO")
    (mirrored		. nil)
    (ucs		. #x202D)	; ‭
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLO")
    (mirrored		. nil)
    (ucs		. #x202E)	; ‮
    ))
(define-char
  '((name		. "NARROW NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (ucs		. #x202F)	;  
    ))
(define-char
  '((name		. "PER MILLE SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (chinese-gb2312		. #x216B)	; �����
    (japanese-jisx0208		. #x2273)	; �����
    (korean-ksc5601		. #x2236)	; �����
    (japanese-jisx0208-1990	. #x2273)	; �����
    (ucs			. #x2030)	; ‰
    ))
(define-char
  '((name		. "PER TEN THOUSAND SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (ucs		. #x2031)	; ‱
    ))
(define-char
  '((name		. "PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x216C)	; �����
    (chinese-gb2312		. #x2164)	; �����
    (japanese-jisx0208		. #x216C)	; �����
    (korean-ksc5601		. #x2147)	; �����
    (chinese-cns11643-1		. #x216B)	; �����
    (japanese-jisx0208-1990	. #x216C)	; �����
    (chinese-big5		. #xA1AC)	; �����
    (ucs			. #x2032)	; ′
    ))
(define-char
  '((name		. "DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032)
    (japanese-jisx0208-1978	. #x216D)	; �����
    (chinese-gb2312		. #x2165)	; �����
    (japanese-jisx0208		. #x216D)	; �����
    (korean-ksc5601		. #x2148)	; �����
    (japanese-jisx0208-1990	. #x216D)	; �����
    (ucs			. #x2033)	; ″
    ))
(define-char
  '((name		. "TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032 #x2032)
    (ucs		. #x2034)	; ‴
    ))
(define-char
  '((name		. "REVERSED PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 . #x216A)	; �����
    (chinese-big5	. #xA1AB)	; �����
    (ucs		. #x2035)	; ‵
    ))
(define-char
  '((name		. "REVERSED DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035)
    (ucs		. #x2036)	; ‶
    ))
(define-char
  '((name		. "REVERSED TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035 #x2035)
    (ucs		. #x2037)	; ‷
    ))
(define-char
  '((name		. "CARET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2038)	; ‸
    ))
(define-char
  '((name		. "SINGLE LEFT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2039)	; ‹
    ))
(define-char
  '((name		. "SINGLE RIGHT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x203A)	; ›
    ))
(define-char
  '((name		. "REFERENCE MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	. #x2228)	; �����
    (chinese-gb2312		. #x2179)	; �����
    (japanese-jisx0208		. #x2228)	; �����
    (korean-ksc5601		. #x2158)	; �����
    (chinese-cns11643-1		. #x216F)	; �����
    (japanese-jisx0208-1990	. #x2228)	; �����
    (chinese-big5		. #xA1B0)	; �����
    (ucs			. #x203B)	; ※
    ))
(define-char
  '((name		. "DOUBLE EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x0021)
    (japanese-jisx0213-1	. #x286B)	; �����
    (ucs			. #x203C)	; ‼
    ))
(define-char
  '((name		. "INTERROBANG")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x203D)	; ‽
    ))
(define-char
  '((name		. "OVERLINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0305)
    (latin-jisx0201	. #x7E)	; �����
    (hebrew-iso8859-8	. #xAF)	; �����
    (ucs		. #x203E)	; ‾
    ))
(define-char
  '((name		. "FULLWIDTH OVERLINE")
    (->ucs		. #x203E)	; ‾
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x203E)
    (japanese-jisx0208-1978	. #x2131)	; �����
    (chinese-gb2312		. #x237E)	; �����
    (japanese-jisx0208		. #x2131)	; �����
    (korean-ksc5601		. #x237E)	; �����
    (chinese-cns11643-1		. #x2223)	; �����
    (japanese-jisx0208-1990	. #x2131)	; �����
    (chinese-big5		. #xA1C2)	; �����
    ))
(define-char
  '((name		. "UNDERTIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Enotikon")
    (ucs		. #x203F)	; ‿
    ))
(define-char
  '((name		. "CHARACTER TIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2040)	; ⁀
    ))
(define-char
  '((name		. "CARET INSERTION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2041)	; ⁁
    ))
(define-char
  '((name		. "ASTERISM")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0213-1	. #x2C7E)	; �����
    (ucs			. #x2042)	; ⁂
    ))
(define-char
  '((name		. "HYPHEN BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x2043)	; ⁃
    ))
(define-char
  '((name		. "FRACTION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 . #x225F)	; �����
    (ucs		. #x2044)	; ⁄
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2045)	; ⁅
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (ucs		. #x2046)	; ⁆
    ))
(define-char
  '((name		. "QUESTION EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x003F #x0021)
    (japanese-jisx0213-1	. #x286D)	; �����
    (ucs			. #x2048)	; ⁈
    ))
(define-char
  '((name		. "EXCLAMATION QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x003F)
    (japanese-jisx0213-1	. #x286E)	; �����
    (ucs			. #x2049)	; ⁉
    ))
(define-char
  '((name		. "TIRONIAN SIGN ET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x204A)	; ⁊
    ))
(define-char
  '((name		. "REVERSED PILCROW SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x204B)	; ⁋
    ))
(define-char
  '((name		. "BLACK LEFTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x204C)	; ⁌
    ))
(define-char
  '((name		. "BLACK RIGHTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (ucs		. #x204D)	; ⁍
    ))
(define-char
  '((name		. "INHIBIT SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x206A)	; ⁪
    ))
(define-char
  '((name		. "ACTIVATE SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x206B)	; ⁫
    ))
(define-char
  '((name		. "INHIBIT ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x206C)	; ⁬
    ))
(define-char
  '((name		. "ACTIVATE ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x206D)	; ⁭
    ))
(define-char
  '((name		. "NATIONAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x206E)	; ⁮
    ))
(define-char
  '((name		. "NOMINAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ucs		. #x206F)	; ⁯
    ))
