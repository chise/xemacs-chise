(define-char
  '((name		. "EN QUAD")
    (ucs		. #x2000)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2002)
    ))
(define-char
  '((name		. "EM QUAD")
    (ucs		. #x2001)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	#x2003)
    ))
(define-char
  '((name		. "EN SPACE")
    (ucs		. #x2002)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "EM SPACE")
    (ucs		. #x2003)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    (chinese-cns11643-1 #x25 #x6D)	; $(G%m(B
    ))
(define-char
  '((name		. "THREE-PER-EM SPACE")
    (ucs		. #x2004)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "FOUR-PER-EM SPACE")
    (ucs		. #x2005)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "SIX-PER-EM SPACE")
    (ucs		. #x2006)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "FIGURE SPACE")
    (ucs		. #x2007)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    ))
(define-char
  '((name		. "PUNCTUATION SPACE")
    (ucs		. #x2008)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "THIN SPACE")
    (ucs		. #x2009)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "HAIR SPACE")
    (ucs		. #x200A)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	compat #x0020)
    ))
(define-char
  '((name		. "ZERO WIDTH SPACE")
    (ucs		. #x200B)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ZERO WIDTH NON-JOINER")
    (ucs		. #x200C)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ZERO WIDTH JOINER")
    (ucs		. #x200D)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT MARK")
    (ucs		. #x200E)
    (general-category	other format) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT MARK")
    (ucs		. #x200F)
    (general-category	other format) ; Normative Category
    (bidi-category	. "R")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "HYPHEN")
    (ucs		. #x2010)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x3E)	; $(@!>(B
    (japanese-jisx0208		#x21 #x3E)	; $(B!>(B
    ))
(define-char
  '((name		. "NON-BREAKING HYPHEN")
    (ucs		. #x2011)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	noBreak #x2010)
    ))
(define-char
  '((name		. "FIGURE DASH")
    (ucs		. #x2012)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "EN DASH")
    (ucs		. #x2013)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 #x21 #x39)	; $(G!9(B
    ))
(define-char
  '((name		. "EM DASH")
    (ucs		. #x2014)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x3D)	; $(@!=(B
    (japanese-jisx0208		#x21 #x3D)	; $(B!=(B
    (chinese-cns11643-1		#x21 #x37)	; $(G!7(B
    ))
(define-char
  '((name		. "HORIZONTAL BAR")
    (ucs		. #x2015)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x2A)	; $(A!*(B
    (korean-ksc5601	#x21 #x2A)	; $(C!*(B
    ))
(define-char
  '((name		. "HALFWIDTH HORIZONTAL BAR")
    (->ucs		. #x2015)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	narrow #x2015)
    (greek-iso8859-7	#xAF)	; -F¯-A
    ))
(define-char
  '((name		. "DOUBLE VERTICAL LINE")
    (ucs		. #x2016)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x42)	; $(@!B(B
    (chinese-gb2312		#x21 #x2C)	; $(A!,(B
    (japanese-jisx0208		#x21 #x42)	; $(B!B(B
    (chinese-cns11643-1		#x22 #x5D)	; $(G"](B
    ))
(define-char
  '((name		. "DOUBLE LOW LINE")
    (ucs		. #x2017)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0333)
    (hebrew-iso8859-8	#xDF)	; ›2]-Hß›0]-A
    ))
(define-char
  '((name		. "LEFT SINGLE QUOTATION MARK")
    (ucs		. #x2018)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x46)	; $(@!F(B
    (chinese-gb2312		#x21 #x2E)	; $(A!.(B
    (japanese-jisx0208		#x21 #x46)	; $(B!F(B
    (korean-ksc5601		#x21 #x2E)	; $(C!.(B
    (chinese-cns11643-1		#x21 #x64)	; $(G!d(B
    ))
(define-char
  '((name		. "RIGHT SINGLE QUOTATION MARK")
    (ucs		. #x2019)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x47)	; $(@!G(B
    (chinese-gb2312		#x21 #x2F)	; $(A!/(B
    (japanese-jisx0208		#x21 #x47)	; $(B!G(B
    (korean-ksc5601		#x21 #x2F)	; $(C!/(B
    (chinese-cns11643-1		#x21 #x65)	; $(G!e(B
    ))
(define-char
  '((name		. "SINGLE LOW-9 QUOTATION MARK")
    (ucs		. #x201A)
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SINGLE HIGH-REVERSED-9 QUOTATION MARK")
    (ucs		. #x201B)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LEFT DOUBLE QUOTATION MARK")
    (ucs		. #x201C)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x48)	; $(@!H(B
    (chinese-gb2312		#x21 #x30)	; $(A!0(B
    (japanese-jisx0208		#x21 #x48)	; $(B!H(B
    (korean-ksc5601		#x21 #x30)	; $(C!0(B
    (chinese-cns11643-1		#x21 #x66)	; $(G!f(B
    ))
(define-char
  '((name		. "RIGHT DOUBLE QUOTATION MARK")
    (ucs		. #x201D)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x49)	; $(@!I(B
    (chinese-gb2312		#x21 #x31)	; $(A!1(B
    (japanese-jisx0208		#x21 #x49)	; $(B!I(B
    (korean-ksc5601		#x21 #x31)	; $(C!1(B
    (chinese-cns11643-1		#x21 #x67)	; $(G!g(B
    ))
(define-char
  '((name		. "DOUBLE LOW-9 QUOTATION MARK")
    (ucs		. #x201E)
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DOUBLE HIGH-REVERSED-9 QUOTATION MARK")
    (ucs		. #x201F)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "DAGGER")
    (ucs		. #x2020)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208	#x22 #x77)	; $(B"w(B
    (korean-ksc5601	#x22 #x53)	; $(C"S(B
    ))
(define-char
  '((name		. "DOUBLE DAGGER")
    (ucs		. #x2021)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208	#x22 #x78)	; $(B"x(B
    (korean-ksc5601	#x22 #x54)	; $(C"T(B
    ))
(define-char
  '((name		. "BULLET")
    (ucs		. #x2022)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "TRIANGULAR BULLET")
    (ucs		. #x2023)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ONE DOT LEADER")
    (ucs		. #x2024)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E)
    ))
(define-char
  '((name		. "TWO DOT LEADER")
    (ucs		. #x2025)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E)
    (japanese-jisx0208-1978	#x21 #x45)	; $(@!E(B
    (japanese-jisx0208		#x21 #x45)	; $(B!E(B
    (korean-ksc5601		#x21 #x25)	; $(C!%(B
    (chinese-cns11643-1		#x21 #x2D)	; $(G!-(B
    ))
(define-char
  '((name		. "HORIZONTAL ELLIPSIS")
    (ucs		. #x2026)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x002E #x002E #x002E)
    (japanese-jisx0208-1978	#x21 #x44)	; $(@!D(B
    (chinese-gb2312		#x21 #x2D)	; $(A!-(B
    (japanese-jisx0208		#x21 #x44)	; $(B!D(B
    (korean-ksc5601		#x21 #x26)	; $(C!&(B
    (chinese-cns11643-1		#x21 #x2C)	; $(G!,(B
    ))
(define-char
  '((name		. "HYPHENATION POINT")
    (ucs		. #x2027)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 #x21 #x31)	; $(G!1(B
    ))
(define-char
  '((name		. "LINE SEPARATOR")
    (ucs		. #x2028)
    (general-category	separator line) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "PARAGRAPH SEPARATOR")
    (ucs		. #x2029)
    (general-category	separator paragraph) ; Normative Category
    (bidi-category	. "B")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT EMBEDDING")
    (ucs		. #x202A)
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRE")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT EMBEDDING")
    (ucs		. #x202B)
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLE")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "POP DIRECTIONAL FORMATTING")
    (ucs		. #x202C)
    (general-category	other format) ; Normative Category
    (bidi-category	. "PDF")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT OVERRIDE")
    (ucs		. #x202D)
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRO")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT OVERRIDE")
    (ucs		. #x202E)
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLO")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NARROW NO-BREAK SPACE")
    (ucs		. #x202F)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    ))
(define-char
  '((name		. "PER MILLE SIGN")
    (ucs		. #x2030)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (chinese-gb2312	#x21 #x6B)	; $(A!k(B
    (japanese-jisx0208	#x22 #x73)	; $(B"s(B
    (korean-ksc5601	#x22 #x36)	; $(C"6(B
    ))
(define-char
  '((name		. "PER TEN THOUSAND SIGN")
    (ucs		. #x2031)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "PRIME")
    (ucs		. #x2032)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x6C)	; $(@!l(B
    (chinese-gb2312		#x21 #x64)	; $(A!d(B
    (japanese-jisx0208		#x21 #x6C)	; $(B!l(B
    (korean-ksc5601		#x21 #x47)	; $(C!G(B
    (chinese-cns11643-1		#x21 #x6B)	; $(G!k(B
    ))
(define-char
  '((name		. "DOUBLE PRIME")
    (ucs		. #x2033)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032)
    (japanese-jisx0208-1978	#x21 #x6D)	; $(@!m(B
    (chinese-gb2312		#x21 #x65)	; $(A!e(B
    (japanese-jisx0208		#x21 #x6D)	; $(B!m(B
    (korean-ksc5601		#x21 #x48)	; $(C!H(B
    ))
(define-char
  '((name		. "TRIPLE PRIME")
    (ucs		. #x2034)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	compat #x2032 #x2032 #x2032)
    ))
(define-char
  '((name		. "REVERSED PRIME")
    (ucs		. #x2035)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 #x21 #x6A)	; $(G!j(B
    ))
(define-char
  '((name		. "REVERSED DOUBLE PRIME")
    (ucs		. #x2036)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035)
    ))
(define-char
  '((name		. "REVERSED TRIPLE PRIME")
    (ucs		. #x2037)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x2035 #x2035 #x2035)
    ))
(define-char
  '((name		. "CARET")
    (ucs		. #x2038)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "SINGLE LEFT-POINTING ANGLE QUOTATION MARK")
    (ucs		. #x2039)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "SINGLE RIGHT-POINTING ANGLE QUOTATION MARK")
    (ucs		. #x203A)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "REFERENCE MARK")
    (ucs		. #x203B)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x22 #x28)	; $(@"((B
    (chinese-gb2312		#x21 #x79)	; $(A!y(B
    (japanese-jisx0208		#x22 #x28)	; $(B"((B
    (korean-ksc5601		#x21 #x58)	; $(C!X(B
    (chinese-cns11643-1		#x21 #x6F)	; $(G!o(B
    ))
(define-char
  '((name		. "DOUBLE EXCLAMATION MARK")
    (ucs		. #x203C)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x0021)
    ))
(define-char
  '((name		. "INTERROBANG")
    (ucs		. #x203D)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "OVERLINE")
    (ucs		. #x203E)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0305)
    (latin-jisx0201	#x7E)	; (J~(B
    (hebrew-iso8859-8	#xAF)	; ›2]-H¯›0]-A
    (japanese-jisx0208	#x21 #x31)	; $(B!1(B
    ))
(define-char
  '((name		. "FULLWIDTH OVERLINE")
    (->ucs		. #x203E)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x203E)
    (japanese-jisx0208-1978	#x21 #x31)	; $(B!1(B
    (japanese-jisx0208		#x21 #x31)	; $(B!1(B
    (chinese-cns11643-1		#x22 #x23)	; $(G"#(B
    ))
(define-char
  '((name		. "UNDERTIE")
    (ucs		. #x203F)
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Enotikon")
    ))
(define-char
  '((name		. "CHARACTER TIE")
    (ucs		. #x2040)
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "CARET INSERTION POINT")
    (ucs		. #x2041)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ASTERISM")
    (ucs		. #x2042)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "HYPHEN BULLET")
    (ucs		. #x2043)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "FRACTION SLASH")
    (ucs		. #x2044)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (chinese-cns11643-1 #x22 #x5F)	; $(G"_(B
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET WITH QUILL")
    (ucs		. #x2045)
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET WITH QUILL")
    (ucs		. #x2046)
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    ))
(define-char
  '((name		. "QUESTION EXCLAMATION MARK")
    (ucs		. #x2048)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x003F #x0021)
    ))
(define-char
  '((name		. "EXCLAMATION QUESTION MARK")
    (ucs		. #x2049)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0021 #x003F)
    ))
(define-char
  '((name		. "TIRONIAN SIGN ET")
    (ucs		. #x204A)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "REVERSED PILCROW SIGN")
    (ucs		. #x204B)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "BLACK LEFTWARDS BULLET")
    (ucs		. #x204C)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "BLACK RIGHTWARDS BULLET")
    (ucs		. #x204D)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "INHIBIT SYMMETRIC SWAPPING")
    (ucs		. #x206A)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ACTIVATE SYMMETRIC SWAPPING")
    (ucs		. #x206B)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "INHIBIT ARABIC FORM SHAPING")
    (ucs		. #x206C)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "ACTIVATE ARABIC FORM SHAPING")
    (ucs		. #x206D)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NATIONAL DIGIT SHAPES")
    (ucs		. #x206E)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "NOMINAL DIGIT SHAPES")
    (ucs		. #x206F)
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    ))
