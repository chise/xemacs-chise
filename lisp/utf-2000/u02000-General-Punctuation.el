;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "EN QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2002)
    (=ucs		. #x2000)	;  
    ))
(define-char
  '((name		. "EM QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2003)
    (=ucs		. #x2001)	;  
    ))
(define-char
  '((name		. "EN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2002)	;  
    ))
(define-char
  '((name		. "EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2003)	;  
    (=cns11643-1	. #x256D)	; �����
    ))
(define-char
  '((name		. "THREE-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2004)	;  
    ))
(define-char
  '((name		. "FOUR-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2005)	;  
    ))
(define-char
  '((name		. "SIX-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2006)	;  
    ))
(define-char
  '((name		. "FIGURE SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (=ucs		. #x2007)	;  
    ))
(define-char
  '((name		. "PUNCTUATION SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2008)	;  
    ))
(define-char
  '((name		. "THIN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x2009)	;  
    ))
(define-char
  '((name		. "HAIR SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (=ucs		. #x200A)	;  
    ))
(define-char
  '((name		. "ZERO WIDTH SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200B)	; ​
    ))
(define-char
  '((name		. "ZERO WIDTH NON-JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200C)	; ‌
    ))
(define-char
  '((name		. "ZERO WIDTH JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200D)	; ‍
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x200E)	; ‎
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "R")
    (mirrored		. nil)
    (=ucs		. #x200F)	; ‏
    ))
(define-char
  '((name		. "HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2010)	; ‐
    (=jis-x0208		. #x213E)	; �����
    ))
(define-char
  '((name		. "NON-BREAKING HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	noBreak #x2010)
    (=ucs		. #x2011)	; ‑
    ))
(define-char
  '((name		. "FIGURE DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2012)	; ‒
    ))
(define-char
  '((name		. "EN DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2013)	; –
    (=cns11643-1	. #x2139)	; �����
    (=jis-x0213-1-2000	. #x237C)	; �����
    (=big5		. #xA156)	; ������
    ))
(define-char
  '((name		. "EM DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2014)	; —
    (=jis-x0208		. #x213D)	; �����
    (=cns11643-1	. #x2137)	; �����
    (=big5		. #xA158)	; ������
    ))
(define-char
  '((name		. "HORIZONTAL BAR")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2015)	; ―
    (=gb2312		. #x212A)	; �����
    (=ks-x1001		. #x212A)	; �����
    ))
(define-char
  '((name		. "HALFWIDTH HORIZONTAL BAR")
    (=>ucs		. #x2015)	; ―
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
    (=ucs		. #x2016)	; ‖
    (=gb2312		. #x212C)	; �����
    (=jis-x0208		. #x2142)	; �����
    (=cns11643-1	. #x225D)	; �����
    ))
(define-char
  '((name		. "DOUBLE LOW LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0333)
    (=ucs		. #x2017)	; ‗
    (hebrew-iso8859-8	. #xDF)	; �����
    ))
(define-char
  '((name		. "LEFT SINGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2018)	; ‘
    (=gb2312		. #x212E)	; �����
    (=jis-x0208		. #x2146)	; �����
    (=ks-x1001		. #x212E)	; �����
    (=cns11643-1	. #x2164)	; �����
    (=big5		. #xA1A5)	; ������
    ))
(define-char
  '((name		. "RIGHT SINGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2019)	; ’
    (=gb2312		. #x212F)	; �����
    (=jis-x0208		. #x2147)	; �����
    (=ks-x1001		. #x212F)	; �����
    (=cns11643-1	. #x2165)	; �����
    (=big5		. #xA1A6)	; ������
    ))
(define-char
  '((name		. "SINGLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201A)	; ‚
    ))
(define-char
  '((name		. "SINGLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201B)	; ‛
    ))
(define-char
  '((name		. "LEFT DOUBLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201C)	; “
    (=gb2312		. #x2130)	; �����
    (=jis-x0208		. #x2148)	; �����
    (=ks-x1001		. #x2130)	; �����
    (=cns11643-1	. #x2166)	; �����
    (=big5		. #xA1A7)	; ������
    ))
(define-char
  '((name		. "RIGHT DOUBLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201D)	; ”
    (=gb2312		. #x2131)	; �����
    (=jis-x0208		. #x2149)	; �����
    (=ks-x1001		. #x2131)	; �����
    (=cns11643-1	. #x2167)	; �����
    (=big5		. #xA1A8)	; ������
    ))
(define-char
  '((name		. "DOUBLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201E)	; „
    ))
(define-char
  '((name		. "DOUBLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201F)	; ‟
    ))
(define-char
  '((name		. "DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2020)	; †
    (=jis-x0208-1983	. #x2277)	; �����
    (=ks-x1001		. #x2253)	; �����
    (=jis-x0208-1990	. #x2277)	; �����
    ))
(define-char
  '((name		. "DOUBLE DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2021)	; ‡
    (=jis-x0208-1983	. #x2278)	; �����
    (=ks-x1001		. #x2254)	; �����
    (=jis-x0208-1990	. #x2278)	; �����
    ))
(define-char
  '((name		. "BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2022)	; •
    (=jis-x0213-1-2000	. #x2340)	; �����
    ))
(define-char
  '((name		. "TRIANGULAR BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2023)	; ‣
    ))
(define-char
  '((name		. "ONE DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E)
    (=ucs		. #x2024)	; ․
    ))
(define-char
  '((name		. "TWO DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E)
    (=ucs		. #x2025)	; ‥
    (=jis-x0208		. #x2145)	; �����
    (=ks-x1001		. #x2125)	; �����
    (=cns11643-1	. #x212D)	; �����
    (=big5		. #xA14C)	; ������
    ))
(define-char
  '((name		. "HORIZONTAL ELLIPSIS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E #x002E)
    (=ucs		. #x2026)	; …
    (=gb2312		. #x212D)	; �����
    (=jis-x0208		. #x2144)	; �����
    (=ks-x1001		. #x2126)	; �����
    (=cns11643-1	. #x212C)	; �����
    (=big5		. #xA14B)	; ������
    ))
(define-char
  '((name		. "HYPHENATION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2027)	; ‧
    (=cns11643-1	. #x2131)	; �����
    (=big5		. #xA145)	; ������
    ))
(define-char
  '((name		. "LINE SEPARATOR")
    (general-category	separator line) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2028)	;  
    ))
(define-char
  '((name		. "PARAGRAPH SEPARATOR")
    (general-category	separator paragraph) ; Normative Category
    (bidi-category	. "B")
    (mirrored		. nil)
    (=ucs		. #x2029)	;  
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRE")
    (mirrored		. nil)
    (=ucs		. #x202A)	; ‪
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLE")
    (mirrored		. nil)
    (=ucs		. #x202B)	; ‫
    ))
(define-char
  '((name		. "POP DIRECTIONAL FORMATTING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "PDF")
    (mirrored		. nil)
    (=ucs		. #x202C)	; ‬
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRO")
    (mirrored		. nil)
    (=ucs		. #x202D)	; ‭
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLO")
    (mirrored		. nil)
    (=ucs		. #x202E)	; ‮
    ))
(define-char
  '((name		. "NARROW NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (=ucs		. #x202F)	;  
    ))
(define-char
  '((name		. "PER MILLE SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2030)	; ‰
    (=gb2312		. #x216B)	; �����
    (=jis-x0208-1983	. #x2273)	; �����
    (=ks-x1001		. #x2236)	; �����
    (=jis-x0208-1990	. #x2273)	; �����
    ))
(define-char
  '((name		. "PER TEN THOUSAND SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2031)	; ‱
    ))
(define-char
  '((name		. "PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2032)	; ′
    (=gb2312		. #x2164)	; �����
    (=jis-x0208		. #x216C)	; �����
    (=ks-x1001		. #x2147)	; �����
    (=cns11643-1	. #x216B)	; �����
    (=big5		. #xA1AC)	; ������
    ))
(define-char
  '((name		. "DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032)
    (=ucs		. #x2033)	; ″
    (=gb2312		. #x2165)	; �����
    (=jis-x0208		. #x216D)	; �����
    (=ks-x1001		. #x2148)	; �����
    ))
(define-char
  '((name		. "TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032 #x2032)
    (=ucs		. #x2034)	; ‴
    ))
(define-char
  '((name		. "REVERSED PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2035)	; ‵
    (=cns11643-1	. #x216A)	; �����
    (=big5		. #xA1AB)	; ������
    ))
(define-char
  '((name		. "REVERSED DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035)
    (=ucs		. #x2036)	; ‶
    ))
(define-char
  '((name		. "REVERSED TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035 #x2035)
    (=ucs		. #x2037)	; ‷
    ))
(define-char
  '((name		. "CARET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2038)	; ‸
    ))
(define-char
  '((name		. "SINGLE LEFT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2039)	; ‹
    ))
(define-char
  '((name		. "SINGLE RIGHT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x203A)	; ›
    ))
(define-char
  '((name		. "REFERENCE MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x203B)	; ※
    (=gb2312		. #x2179)	; �����
    (=jis-x0208		. #x2228)	; �����
    (=ks-x1001		. #x2158)	; �����
    (=cns11643-1	. #x216F)	; �����
    (=big5		. #xA1B0)	; ������
    ))
(define-char
  '((name		. "DOUBLE EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x0021)
    (=ucs		. #x203C)	; ‼
    (=jis-x0213-1-2000	. #x286B)	; �����
    ))
(define-char
  '((name		. "INTERROBANG")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x203D)	; ‽
    ))
(define-char
  '((name		. "OVERLINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0305)
    (->fullwidth
     ((name		  . "FULLWIDTH OVERLINE")
      (=gb2312		  . #x237E)	; �����
      (=jis-x0208	  . #x2131)	; �����
      (=ks-x1001	  . #x237E)	; �����
      (=cns11643-1	  . #x2223)	; �����
      ))
    (=ucs		. #x203E)	; ‾
    (hebrew-iso8859-8	. #xAF)	; �����
    (latin-jisx0201	. #x7E)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH OVERLINE")
    (=>ucs		. #x203E)	; ‾
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x203E)
    (<-fullwidth
     ((name		  . "OVERLINE")
      (=ucs		  . #x203E)	; ‾
      ))
    (=gb2312		. #x237E)	; �����
    (=jis-x0208		. #x2131)	; �����
    (=ks-x1001		. #x237E)	; �����
    (=cns11643-1	. #x2223)	; �����
    (=big5		. #xA1C2)	; ������
    (=ucs@jis		. #x203E)	; �����
    ))
(define-char
  '((name		. "heavy overline")
    (=>ucs		. #x203E)	; ‾
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=cns11643-1	. #x2224)	; �����
    (=big5		. #xA1C3)	; ������
    (=ucs@big5		. #xFFE3)	; �����
    ))
(define-char
  '((name		. "UNDERTIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Enotikon")
    (=ucs		. #x203F)	; ‿
    ))
(define-char
  '((name		. "CHARACTER TIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2040)	; ⁀
    ))
(define-char
  '((name		. "CARET INSERTION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2041)	; ⁁
    ))
(define-char
  '((name		. "ASTERISM")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2042)	; ⁂
    (=jis-x0213-1-2000	. #x2C7E)	; �����
    ))
(define-char
  '((name		. "HYPHEN BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2043)	; ⁃
    ))
(define-char
  '((name		. "FRACTION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2044)	; ⁄
    (=cns11643-1	. #x225F)	; �����
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2045)	; ⁅
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2046)	; ⁆
    ))
(define-char
  '((name		. "DOUBLE QUESTION MARK")
    (=ucs		. #x2047)	; ⁇
    (=jis-x0213-1-2000	. #x286C)	; �����
    ))
(define-char
  '((name		. "QUESTION EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x003F #x0021)
    (=ucs		. #x2048)	; ⁈
    (=jis-x0213-1-2000	. #x286D)	; �����
    ))
(define-char
  '((name		. "EXCLAMATION QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x003F)
    (=ucs		. #x2049)	; ⁉
    (=jis-x0213-1-2000	. #x286E)	; �����
    ))
(define-char
  '((name		. "TIRONIAN SIGN ET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204A)	; ⁊
    ))
(define-char
  '((name		. "REVERSED PILCROW SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204B)	; ⁋
    ))
(define-char
  '((name		. "BLACK LEFTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204C)	; ⁌
    ))
(define-char
  '((name		. "BLACK RIGHTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204D)	; ⁍
    ))
(define-char
  '((name		. "TWO ASTERISKS ALIGNED VERTICALLY")
    (=ucs		. #x2051)	; ⁑
    (=jis-x0213-1-2000	. #x2C7D)	; �����
    ))
(define-char
  '((name		. "INHIBIT SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206A)	; ⁪
    ))
(define-char
  '((name		. "ACTIVATE SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206B)	; ⁫
    ))
(define-char
  '((name		. "INHIBIT ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206C)	; ⁬
    ))
(define-char
  '((name		. "ACTIVATE ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206D)	; ⁭
    ))
(define-char
  '((name		. "NATIONAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206E)	; ⁮
    ))
(define-char
  '((name		. "NOMINAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206F)	; ⁯
    ))
