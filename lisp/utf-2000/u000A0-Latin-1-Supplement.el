(define-char
  '((name		. "NO-BREAK SPACE")
    (ucs		. #x00A0)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (->decomposition	noBreak #x0020)
    (mirrored		. nil)
    (latin-iso8859-1	#x20)	; .AN 
    (latin-iso8859-2	#x20)	; .AN 
    (latin-iso8859-3	#x20)	; .AN 
    (latin-iso8859-4	#x20)	; .AN 
    (greek-iso8859-7	#x20)	; .AN 
    (cyrillic-iso8859-5	#x20)	; .AN 
    (latin-iso8859-9	#x20)	; .AN 
    (hebrew-iso8859-8	#x20)	; .AN 
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x21)	; .AN!
    (latin-iso8859-9	#x21)	; .AN!
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A1)
    (mirrored		. nil)
    (korean-ksc5601	#x22 #x2E)	; $(D"B(B
    (japanese-jisx0212	#x22 #x42)	; $(D"B(B
    ))
(define-char
  '((name		. "CENT SIGN")
    (ucs		. #x00A2)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x22)	; .AN"
    (latin-iso8859-9	#x22)	; .AN"
    (hebrew-iso8859-8	#x22)	; .AN"
    ))
(define-char
  '((name		. "POUND SIGN")
    (ucs		. #x00A3)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x23)	; .AN#
    (latin-iso8859-3	#x23)	; .AN#
    (greek-iso8859-7	#x23)	; .AN#
    (latin-iso8859-9	#x23)	; .AN#
    (hebrew-iso8859-8	#x23)	; .AN#
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x24)	; .AN$
    (latin-iso8859-2	#x24)	; .AN$
    (latin-iso8859-3	#x24)	; .AN$
    (latin-iso8859-4	#x24)	; .AN$
    (latin-iso8859-9	#x24)	; .AN$
    (hebrew-iso8859-8	#x24)	; .AN$
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	#x21 #x68)	; $(D"p(B
    (korean-ksc5601	#x22 #x34)	; $(D"p(B
    (japanese-jisx0212	#x22 #x70)	; $(D"p(B
    ))
(define-char
  '((name		. "YEN SIGN")
    (ucs		. #x00A5)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	#x5C)	; .AN%
    (latin-iso8859-1	#x25)	; .AN%
    (latin-iso8859-9	#x25)	; .AN%
    (hebrew-iso8859-8	#x25)	; .AN%
    ))
(define-char
  '((name		. "BROKEN BAR")
    (ucs		. #x00A6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x26)	; .AN&
    (greek-iso8859-7	#x26)	; .AN&
    (latin-iso8859-9	#x26)	; .AN&
    (hebrew-iso8859-8	#x26)	; .AN&
    ))
(define-char
  '((name		. "SECTION SIGN")
    (ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x27)	; .AN'
    (latin-iso8859-2	#x27)	; .AN'
    (latin-iso8859-3	#x27)	; .AN'
    (latin-iso8859-4	#x27)	; .AN'
    (greek-iso8859-7	#x27)	; .AN'
    (cyrillic-iso8859-5	#x7D)	; .AN'
    (latin-iso8859-9	#x27)	; .AN'
    (hebrew-iso8859-8	#x27)	; .AN'
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A7)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x78)	; $B!x(B
    (chinese-gb2312		#x21 #x6C)	; $B!x(B
    (japanese-jisx0208		#x21 #x78)	; $B!x(B
    (korean-ksc5601		#x21 #x57)	; $B!x(B
    (chinese-cns11643-1		#x21 #x70)	; $B!x(B
    ))
(define-char
  '((name		. "DIAERESIS")
    (ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0308)
    (mirrored		. nil)
    (latin-iso8859-1	#x28)	; .AN(
    (latin-iso8859-2	#x28)	; .AN(
    (latin-iso8859-3	#x28)	; .AN(
    (latin-iso8859-4	#x28)	; .AN(
    (greek-iso8859-7	#x28)	; .AN(
    (latin-iso8859-9	#x28)	; .AN(
    (hebrew-iso8859-8	#x28)	; .AN(
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A8)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x2F)	; $B!/(B
    (chinese-gb2312		#x21 #x27)	; $B!/(B
    (japanese-jisx0208		#x21 #x2F)	; $B!/(B
    (korean-ksc5601		#x21 #x27)	; $B!/(B
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x29)	; .AN)
    (greek-iso8859-7	#x29)	; .AN)
    (latin-iso8859-9	#x29)	; .AN)
    (hebrew-iso8859-8	#x29)	; .AN)
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00A9)
    (mirrored		. nil)
    (japanese-jisx0212	#x22 #x6D)	; $(D"m(B
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	super #x0061)
    (mirrored		. nil)
    (latin-iso8859-1	#x2A)	; .AN*
    (latin-iso8859-9	#x2A)	; .AN*
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00AA)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x23)	; $(D"l(B
    (japanese-jisx0212	#x22 #x6C)	; $(D"l(B
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00AB)
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1	#x2B)	; .AN+
    (greek-iso8859-7	#x2B)	; .AN+
    (latin-iso8859-9	#x2B)	; .AN+
    (hebrew-iso8859-8	#x2B)	; .AN+
    ))
(define-char
  '((name		. "NOT SIGN")
    (ucs		. #x00AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2C)	; .AN,
    (greek-iso8859-7	#x2C)	; .AN,
    (latin-iso8859-9	#x2C)	; .AN,
    (hebrew-iso8859-8	#x2C)	; .AN,
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2D)	; .AN-
    (latin-iso8859-2	#x2D)	; .AN-
    (latin-iso8859-3	#x2D)	; .AN-
    (latin-iso8859-4	#x2D)	; .AN-
    (greek-iso8859-7	#x2D)	; .AN-
    (cyrillic-iso8859-5	#x2D)	; .AN-
    (latin-iso8859-9	#x2D)	; .AN-
    (hebrew-iso8859-8	#x2D)	; .AN-
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00AD)
    (mirrored		. nil)
    (korean-ksc5601	#x21 #x29)	; $(C!)(B
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2E)	; .AN.
    (latin-iso8859-9	#x2E)	; .AN.
    (hebrew-iso8859-8	#x2E)	; .AN.
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00AE)
    (mirrored		. nil)
    (japanese-jisx0212	#x22 #x6E)	; $(D"n(B
    ))
(define-char
  '((name		. "MACRON")
    (ucs		. #x00AF)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0304)
    (mirrored		. nil)
    (latin-iso8859-1	#x2F)	; .AN/
    (latin-iso8859-4	#x2F)	; .AN/
    (latin-iso8859-9	#x2F)	; .AN/
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x30)	; .AN0
    (latin-iso8859-2	#x30)	; .AN0
    (latin-iso8859-3	#x30)	; .AN0
    (latin-iso8859-4	#x30)	; .AN0
    (greek-iso8859-7	#x30)	; .AN0
    (latin-iso8859-9	#x30)	; .AN0
    (hebrew-iso8859-8	#x30)	; .AN0
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (->decomposition	wide #x00B0)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x6B)	; $B!k(B
    (chinese-gb2312		#x21 #x63)	; $B!k(B
    (japanese-jisx0208		#x21 #x6B)	; $B!k(B
    (korean-ksc5601		#x21 #x46)	; $B!k(B
    (chinese-cns11643-1		#x22 #x78)	; $B!k(B
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x31)	; .AN1
    (greek-iso8859-7	#x31)	; .AN1
    (latin-iso8859-9	#x31)	; .AN1
    (hebrew-iso8859-8	#x31)	; .AN1
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (->decomposition	wide #x00B1)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x5E)	; $B!^(B
    (chinese-gb2312		#x21 #x40)	; $B!^(B
    (japanese-jisx0208		#x21 #x5E)	; $B!^(B
    (korean-ksc5601		#x21 #x3E)	; $B!^(B
    (chinese-cns11643-1		#x22 #x34)	; $B!^(B
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
    (latin-iso8859-1	#x32)	; .AN2
    (latin-iso8859-3	#x32)	; .AN2
    (greek-iso8859-7	#x32)	; .AN2
    (latin-iso8859-9	#x32)	; .AN2
    (hebrew-iso8859-8	#x32)	; .AN2
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
    (korean-ksc5601	#x29 #x77)	; $(C)w(B
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
    (latin-iso8859-1	#x33)	; .AN3
    (latin-iso8859-3	#x33)	; .AN3
    (greek-iso8859-7	#x33)	; .AN3
    (latin-iso8859-9	#x33)	; .AN3
    (hebrew-iso8859-8	#x33)	; .AN3
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
    (korean-ksc5601	#x29 #x78)	; $(C)x(B
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0301)
    (mirrored		. nil)
    (latin-iso8859-1	#x34)	; .AN4
    (latin-iso8859-2	#x34)	; .AN4
    (latin-iso8859-3	#x34)	; .AN4
    (latin-iso8859-4	#x34)	; .AN4
    (latin-iso8859-9	#x34)	; .AN4
    (hebrew-iso8859-8	#x34)	; .AN4
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B4)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x2D)	; $B!-(B
    (japanese-jisx0208		#x21 #x2D)	; $B!-(B
    (korean-ksc5601		#x22 #x25)	; $B!-(B
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
    (latin-iso8859-1	#x35)	; .AN5
    (latin-iso8859-3	#x35)	; .AN5
    (latin-iso8859-9	#x35)	; .AN5
    (hebrew-iso8859-8	#x35)	; .AN5
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x36)	; .AN6
    (latin-iso8859-9	#x36)	; .AN6
    (hebrew-iso8859-8	#x36)	; .AN6
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B6)
    (mirrored		. nil)
    (japanese-jisx0208	#x22 #x79)	; $B"y(B
    (korean-ksc5601	#x22 #x52)	; $B"y(B
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x37)	; .AN7
    (latin-iso8859-3	#x37)	; .AN7
    (greek-iso8859-7	#x37)	; .AN7
    (latin-iso8859-9	#x37)	; .AN7
    (hebrew-iso8859-8	#x37)	; .AN7
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B7)
    (mirrored		. nil)
    (korean-ksc5601	#x21 #x24)	; $(C!$(B
    (chinese-cns11643-1	#x21 #x26)	; $(C!$(B
    ))
(define-char
  '((name		. "CEDILLA")
    (ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0327)
    (mirrored		. nil)
    (latin-iso8859-1	#x38)	; .AN8
    (latin-iso8859-2	#x38)	; .AN8
    (latin-iso8859-3	#x38)	; .AN8
    (latin-iso8859-4	#x38)	; .AN8
    (latin-iso8859-9	#x38)	; .AN8
    (hebrew-iso8859-8	#x38)	; .AN8
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00B8)
    (mirrored		. nil)
    (korean-ksc5601	#x22 #x2C)	; $(D"1(B
    (japanese-jisx0212	#x22 #x31)	; $(D"1(B
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
    (latin-iso8859-1	#x39)	; .AN9
    (latin-iso8859-9	#x39)	; .AN9
    (hebrew-iso8859-8	#x39)	; .AN9
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
    (korean-ksc5601	#x29 #x76)	; $(C)v(B
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	super #x006F)
    (mirrored		. nil)
    (latin-iso8859-1	#x3A)	; .AN:
    (latin-iso8859-9	#x3A)	; .AN:
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00BA)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x2C)	; $(D"k(B
    (japanese-jisx0212	#x22 #x6B)	; $(D"k(B
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (ucs		. #x00BB)
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (iso-10646-comment	. "*")
    (latin-iso8859-1	#x3B)	; .AN;
    (greek-iso8859-7	#x3B)	; .AN;
    (latin-iso8859-9	#x3B)	; .AN;
    (hebrew-iso8859-8	#x3B)	; .AN;
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (numeric-value	. 1/4)
    (mirrored		. nil)
    (latin-iso8859-1	#x3C)	; .AN<
    (latin-iso8859-9	#x3C)	; .AN<
    (hebrew-iso8859-8	#x3C)	; .AN<
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BC)
    (numeric-value	. 1/4)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x79)	; $(C(y(B
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (numeric-value	. 1/2)
    (mirrored		. nil)
    (latin-iso8859-1	#x3D)	; .AN=
    (latin-iso8859-3	#x3D)	; .AN=
    (greek-iso8859-7	#x3D)	; .AN=
    (latin-iso8859-9	#x3D)	; .AN=
    (hebrew-iso8859-8	#x3D)	; .AN=
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BD)
    (numeric-value	. 1/2)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x76)	; $(C(v(B
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (numeric-value	. 3/4)
    (mirrored		. nil)
    (latin-iso8859-1	#x3E)	; .AN>
    (latin-iso8859-9	#x3E)	; .AN>
    (hebrew-iso8859-8	#x3E)	; .AN>
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BE)
    (numeric-value	. 3/4)
    (mirrored		. nil)
    (korean-ksc5601	#x28 #x7A)	; $(C(z(B
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x3F)	; .AN?
    (latin-iso8859-9	#x3F)	; .AN?
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00BF)
    (mirrored		. nil)
    (korean-ksc5601	#x22 #x2F)	; $(D"D(B
    (japanese-jisx0212	#x22 #x44)	; $(D"D(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00E0)
    (latin-iso8859-1	#x40)	; .AN@
    (latin-iso8859-3	#x40)	; .AN@
    (latin-iso8859-9	#x40)	; .AN@
    (latin-viscii-upper	#x60)	; .AN@
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
    (japanese-jisx0212	#x2A #x22)	; $(D*"(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00E1)
    (latin-iso8859-1	#x41)	; .ANA
    (latin-iso8859-2	#x41)	; .ANA
    (latin-iso8859-3	#x41)	; .ANA
    (latin-iso8859-4	#x41)	; .ANA
    (latin-iso8859-9	#x41)	; .ANA
    (latin-viscii-upper	#x61)	; .ANA
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
    (japanese-jisx0212	#x2A #x21)	; $(D*!(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00E2)
    (latin-iso8859-1	#x42)	; .ANB
    (latin-iso8859-2	#x42)	; .ANB
    (latin-iso8859-3	#x42)	; .ANB
    (latin-iso8859-4	#x42)	; .ANB
    (latin-iso8859-9	#x42)	; .ANB
    (latin-viscii-upper	#x62)	; .ANB
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
    (japanese-jisx0212	#x2A #x24)	; $(D*$(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0303)
    (mirrored		. nil)
    (->lowercase	#x00E3)
    (latin-iso8859-1	#x43)	; .ANC
    (latin-iso8859-4	#x43)	; .ANC
    (latin-iso8859-9	#x43)	; .ANC
    (latin-viscii-upper	#x63)	; .ANC
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
    (japanese-jisx0212	#x2A #x2A)	; $(D**(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00E4)
    (latin-iso8859-1	#x44)	; .AND
    (latin-iso8859-2	#x44)	; .AND
    (latin-iso8859-3	#x44)	; .AND
    (latin-iso8859-4	#x44)	; .AND
    (latin-iso8859-9	#x44)	; .AND
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
    (japanese-jisx0212	#x2A #x23)	; $(D*#(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0041 #x030A)
    (mirrored		. nil)
    (->lowercase	#x00E5)
    (latin-iso8859-1	#x45)	; .ANE
    (latin-iso8859-4	#x45)	; .ANE
    (latin-iso8859-9	#x45)	; .ANE
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
    (japanese-jisx0212	#x2A #x29)	; $(D*)(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (->lowercase	#x00E6)
    (latin-iso8859-1	#x46)	; .ANF
    (latin-iso8859-4	#x46)	; .ANF
    (latin-iso8859-9	#x46)	; .ANF
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	#x28 #x21)	; $(D)!(B
    (japanese-jisx0212	#x29 #x21)	; $(D)!(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0043 #x0327)
    (mirrored		. nil)
    (->lowercase	#x00E7)
    (latin-iso8859-1	#x47)	; .ANG
    (latin-iso8859-2	#x47)	; .ANG
    (latin-iso8859-3	#x47)	; .ANG
    (latin-iso8859-9	#x47)	; .ANG
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
    (japanese-jisx0212	#x2A #x2E)	; $(D*.(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00E8)
    (latin-iso8859-1	#x48)	; .ANH
    (latin-iso8859-3	#x48)	; .ANH
    (latin-iso8859-9	#x48)	; .ANH
    (latin-viscii-upper	#x68)	; .ANH
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
    (japanese-jisx0212	#x2A #x32)	; $(D*2(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00E9)
    (latin-iso8859-1	#x49)	; .ANI
    (latin-iso8859-2	#x49)	; .ANI
    (latin-iso8859-3	#x49)	; .ANI
    (latin-iso8859-4	#x49)	; .ANI
    (latin-iso8859-9	#x49)	; .ANI
    (latin-viscii-upper	#x69)	; .ANI
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
    (japanese-jisx0212	#x2A #x31)	; $(D*1(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00EA)
    (latin-iso8859-1	#x4A)	; .ANJ
    (latin-iso8859-3	#x4A)	; .ANJ
    (latin-iso8859-9	#x4A)	; .ANJ
    (latin-viscii-upper	#x6A)	; .ANJ
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
    (japanese-jisx0212	#x2A #x34)	; $(D*4(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0045 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00EB)
    (latin-iso8859-1	#x4B)	; .ANK
    (latin-iso8859-2	#x4B)	; .ANK
    (latin-iso8859-3	#x4B)	; .ANK
    (latin-iso8859-4	#x4B)	; .ANK
    (latin-iso8859-9	#x4B)	; .ANK
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
    (japanese-jisx0212	#x2A #x33)	; $(D*3(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00EC)
    (latin-iso8859-1	#x4C)	; .ANL
    (latin-iso8859-3	#x4C)	; .ANL
    (latin-iso8859-9	#x4C)	; .ANL
    (latin-viscii-upper	#x6C)	; .ANL
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
    (japanese-jisx0212	#x2A #x40)	; $(D*@(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00ED)
    (latin-iso8859-1	#x4D)	; .ANM
    (latin-iso8859-2	#x4D)	; .ANM
    (latin-iso8859-3	#x4D)	; .ANM
    (latin-iso8859-4	#x4D)	; .ANM
    (latin-iso8859-9	#x4D)	; .ANM
    (latin-viscii-upper	#x6D)	; .ANM
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
    (japanese-jisx0212	#x2A #x3F)	; $(D*?(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00EE)
    (latin-iso8859-1	#x4E)	; .ANN
    (latin-iso8859-2	#x4E)	; .ANN
    (latin-iso8859-3	#x4E)	; .ANN
    (latin-iso8859-4	#x4E)	; .ANN
    (latin-iso8859-9	#x4E)	; .ANN
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
    (japanese-jisx0212	#x2A #x42)	; $(D*B(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0049 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00EF)
    (latin-iso8859-1	#x4F)	; .ANO
    (latin-iso8859-3	#x4F)	; .ANO
    (latin-iso8859-9	#x4F)	; .ANO
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
    (japanese-jisx0212	#x2A #x41)	; $(D*A(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (ucs		. #x00D0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00F0)
    (latin-iso8859-1	#x50)	; .ANP
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
    (korean-ksc5601	#x28 #x22)	; $(C("(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004E #x0303)
    (mirrored		. nil)
    (->lowercase	#x00F1)
    (latin-iso8859-1	#x51)	; .ANQ
    (latin-iso8859-3	#x51)	; .ANQ
    (latin-iso8859-9	#x51)	; .ANQ
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
    (japanese-jisx0212	#x2A #x50)	; $(D*P(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0300)
    (mirrored		. nil)
    (->lowercase	#x00F2)
    (latin-iso8859-1	#x52)	; .ANR
    (latin-iso8859-3	#x52)	; .ANR
    (latin-iso8859-9	#x52)	; .ANR
    (latin-viscii-upper	#x72)	; .ANR
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
    (japanese-jisx0212	#x2A #x52)	; $(D*R(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0301)
    (mirrored		. nil)
    (->lowercase	#x00F3)
    (latin-iso8859-1	#x53)	; .ANS
    (latin-iso8859-2	#x53)	; .ANS
    (latin-iso8859-3	#x53)	; .ANS
    (latin-iso8859-9	#x53)	; .ANS
    (latin-viscii-upper	#x73)	; .ANS
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
    (japanese-jisx0212	#x2A #x51)	; $(D*Q(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0302)
    (mirrored		. nil)
    (->lowercase	#x00F4)
    (latin-iso8859-1	#x54)	; .ANT
    (latin-iso8859-2	#x54)	; .ANT
    (latin-iso8859-3	#x54)	; .ANT
    (latin-iso8859-4	#x54)	; .ANT
    (latin-iso8859-9	#x54)	; .ANT
    (latin-viscii-upper	#x74)	; .ANT
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
    (japanese-jisx0212	#x2A #x54)	; $(D*T(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0303)
    (mirrored		. nil)
    (->lowercase	#x00F5)
    (latin-iso8859-1	#x55)	; .ANU
    (latin-iso8859-4	#x55)	; .ANU
    (latin-iso8859-9	#x55)	; .ANU
    (latin-viscii-upper	#x75)	; .ANU
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
    (japanese-jisx0212	#x2A #x58)	; $(D*X(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x004F #x0308)
    (mirrored		. nil)
    (->lowercase	#x00F6)
    (latin-iso8859-1	#x56)	; .ANV
    (latin-iso8859-2	#x56)	; .ANV
    (latin-iso8859-3	#x56)	; .ANV
    (latin-iso8859-4	#x56)	; .ANV
    (latin-iso8859-9	#x56)	; .ANV
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
    (japanese-jisx0212	#x2A #x53)	; $(D*S(B
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x57)	; .ANW
    (latin-iso8859-2	#x57)	; .ANW
    (latin-iso8859-3	#x57)	; .ANW
    (latin-iso8859-4	#x57)	; .ANW
    (latin-iso8859-9	#x57)	; .ANW
    (hebrew-iso8859-8	#x2A)	; .ANW
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00D7)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x5F)	; $B!_(B
    (chinese-gb2312		#x21 #x41)	; $B!_(B
    (japanese-jisx0208		#x21 #x5F)	; $B!_(B
    (korean-ksc5601		#x21 #x3F)	; $B!_(B
    (chinese-cns11643-1		#x22 #x32)	; $B!_(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1	#x58)	; .ANX
    (latin-iso8859-4	#x58)	; .ANX
    (latin-iso8859-9	#x58)	; .ANX
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	#x28 #x2A)	; $(D),(B
    (japanese-jisx0212	#x29 #x2C)	; $(D),(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0300)
    (mirrored		. nil)
    (->lowercase	#x00F9)
    (latin-iso8859-1	#x59)	; .ANY
    (latin-iso8859-3	#x59)	; .ANY
    (latin-iso8859-9	#x59)	; .ANY
    (latin-viscii-upper	#x79)	; .ANY
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
    (japanese-jisx0212	#x2A #x63)	; $(D*c(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00FA)
    (latin-iso8859-1	#x5A)	; .ANZ
    (latin-iso8859-2	#x5A)	; .ANZ
    (latin-iso8859-3	#x5A)	; .ANZ
    (latin-iso8859-4	#x5A)	; .ANZ
    (latin-iso8859-9	#x5A)	; .ANZ
    (latin-viscii-upper	#x7A)	; .ANZ
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
    (japanese-jisx0212	#x2A #x62)	; $(D*b(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0302)
    (mirrored		. nil)
    (->lowercase	#x00FB)
    (latin-iso8859-1	#x5B)	; .AN[
    (latin-iso8859-3	#x5B)	; .AN[
    (latin-iso8859-4	#x5B)	; .AN[
    (latin-iso8859-9	#x5B)	; .AN[
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
    (japanese-jisx0212	#x2A #x65)	; $(D*e(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0055 #x0308)
    (mirrored		. nil)
    (->lowercase	#x00FC)
    (latin-iso8859-1	#x5C)	; .AN\
    (latin-iso8859-2	#x5C)	; .AN\
    (latin-iso8859-3	#x5C)	; .AN\
    (latin-iso8859-4	#x5C)	; .AN\
    (latin-iso8859-9	#x5C)	; .AN\
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
    (japanese-jisx0212	#x2A #x64)	; $(D*d(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0059 #x0301)
    (mirrored		. nil)
    (->lowercase	#x00FD)
    (latin-iso8859-1	#x5D)	; .AN]
    (latin-iso8859-2	#x5D)	; .AN]
    (latin-viscii-upper	#x7D)	; .AN]
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
    (japanese-jisx0212	#x2A #x72)	; $(D*r(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (ucs		. #x00DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (->lowercase	#x00FE)
    (latin-iso8859-1	#x5E)	; .AN^
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
    (korean-ksc5601	#x28 #x2D)	; $(D)0(B
    (japanese-jisx0212	#x29 #x30)	; $(D)0(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (latin-iso8859-1	#x5F)	; .AN_
    (latin-iso8859-2	#x5F)	; .AN_
    (latin-iso8859-3	#x5F)	; .AN_
    (latin-iso8859-4	#x5F)	; .AN_
    (latin-iso8859-9	#x5F)	; .AN_
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x00DF)
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (korean-ksc5601	#x29 #x2C)	; $(D)N(B
    (japanese-jisx0212	#x29 #x4E)	; $(D)N(B
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
    (latin-iso8859-1	#x60)	; .AN`
    (latin-iso8859-3	#x60)	; .AN`
    (latin-iso8859-9	#x60)	; .AN`
    (latin-viscii-lower	#x60)	; .AN`
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
    (chinese-gb2312	#x28 #x24)	; $(D+"(B
    (japanese-jisx0212	#x2B #x22)	; $(D+"(B
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
    (latin-iso8859-1	#x61)	; .ANa
    (latin-iso8859-2	#x61)	; .ANa
    (latin-iso8859-3	#x61)	; .ANa
    (latin-iso8859-4	#x61)	; .ANa
    (latin-iso8859-9	#x61)	; .ANa
    (latin-viscii-lower	#x61)	; .ANa
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
    (chinese-gb2312	#x28 #x22)	; $(D+!(B
    (japanese-jisx0212	#x2B #x21)	; $(D+!(B
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
    (latin-iso8859-1	#x62)	; .ANb
    (latin-iso8859-2	#x62)	; .ANb
    (latin-iso8859-3	#x62)	; .ANb
    (latin-iso8859-4	#x62)	; .ANb
    (latin-iso8859-9	#x62)	; .ANb
    (latin-viscii-lower	#x62)	; .ANb
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
    (japanese-jisx0212	#x2B #x24)	; $(D+$(B
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
    (latin-iso8859-1	#x63)	; .ANc
    (latin-iso8859-4	#x63)	; .ANc
    (latin-iso8859-9	#x63)	; .ANc
    (latin-viscii-lower	#x63)	; .ANc
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
    (japanese-jisx0212	#x2B #x2A)	; $(D+*(B
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
    (latin-iso8859-1	#x64)	; .ANd
    (latin-iso8859-2	#x64)	; .ANd
    (latin-iso8859-3	#x64)	; .ANd
    (latin-iso8859-4	#x64)	; .ANd
    (latin-iso8859-9	#x64)	; .ANd
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
    (japanese-jisx0212	#x2B #x23)	; $(D+#(B
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
    (latin-iso8859-1	#x65)	; .ANe
    (latin-iso8859-4	#x65)	; .ANe
    (latin-iso8859-9	#x65)	; .ANe
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
    (japanese-jisx0212	#x2B #x29)	; $(D+)(B
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
    (latin-iso8859-1	#x66)	; .ANf
    (latin-iso8859-4	#x66)	; .ANf
    (latin-iso8859-9	#x66)	; .ANf
    (ipa		#x24)	; .ANf
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
    (korean-ksc5601	#x29 #x21)	; $(D)A(B
    (japanese-jisx0212	#x29 #x41)	; $(D)A(B
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
    (latin-iso8859-1	#x67)	; .ANg
    (latin-iso8859-2	#x67)	; .ANg
    (latin-iso8859-3	#x67)	; .ANg
    (latin-iso8859-9	#x67)	; .ANg
    (ipa		#x4E)	; .ANg
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
    (japanese-jisx0212	#x2B #x2E)	; $(D+.(B
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
    (latin-iso8859-1	#x68)	; .ANh
    (latin-iso8859-3	#x68)	; .ANh
    (latin-iso8859-9	#x68)	; .ANh
    (latin-viscii-lower	#x68)	; .ANh
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
    (chinese-gb2312	#x28 #x28)	; $(D+2(B
    (japanese-jisx0212	#x2B #x32)	; $(D+2(B
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
    (latin-iso8859-1	#x69)	; .ANi
    (latin-iso8859-2	#x69)	; .ANi
    (latin-iso8859-3	#x69)	; .ANi
    (latin-iso8859-4	#x69)	; .ANi
    (latin-iso8859-9	#x69)	; .ANi
    (latin-viscii-lower	#x69)	; .ANi
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
    (chinese-gb2312	#x28 #x26)	; $(D+1(B
    (japanese-jisx0212	#x2B #x31)	; $(D+1(B
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
    (latin-iso8859-1	#x6A)	; .ANj
    (latin-iso8859-3	#x6A)	; .ANj
    (latin-iso8859-9	#x6A)	; .ANj
    (latin-viscii-lower	#x6A)	; .ANj
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
    (chinese-gb2312	#x28 #x3A)	; $(D+4(B
    (japanese-jisx0212	#x2B #x34)	; $(D+4(B
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
    (latin-iso8859-1	#x6B)	; .ANk
    (latin-iso8859-2	#x6B)	; .ANk
    (latin-iso8859-3	#x6B)	; .ANk
    (latin-iso8859-4	#x6B)	; .ANk
    (latin-iso8859-9	#x6B)	; .ANk
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
    (japanese-jisx0212	#x2B #x33)	; $(D+3(B
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
    (latin-iso8859-1	#x6C)	; .ANl
    (latin-iso8859-3	#x6C)	; .ANl
    (latin-iso8859-9	#x6C)	; .ANl
    (latin-viscii-lower	#x6C)	; .ANl
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
    (chinese-gb2312	#x28 #x2C)	; $(D+@(B
    (japanese-jisx0212	#x2B #x40)	; $(D+@(B
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
    (latin-iso8859-1	#x6D)	; .ANm
    (latin-iso8859-2	#x6D)	; .ANm
    (latin-iso8859-3	#x6D)	; .ANm
    (latin-iso8859-4	#x6D)	; .ANm
    (latin-iso8859-9	#x6D)	; .ANm
    (latin-viscii-lower	#x6D)	; .ANm
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
    (chinese-gb2312	#x28 #x2A)	; $(D+?(B
    (japanese-jisx0212	#x2B #x3F)	; $(D+?(B
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
    (latin-iso8859-1	#x6E)	; .ANn
    (latin-iso8859-2	#x6E)	; .ANn
    (latin-iso8859-3	#x6E)	; .ANn
    (latin-iso8859-4	#x6E)	; .ANn
    (latin-iso8859-9	#x6E)	; .ANn
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
    (japanese-jisx0212	#x2B #x42)	; $(D+B(B
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
    (latin-iso8859-1	#x6F)	; .ANo
    (latin-iso8859-3	#x6F)	; .ANo
    (latin-iso8859-9	#x6F)	; .ANo
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
    (japanese-jisx0212	#x2B #x41)	; $(D+A(B
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
    (latin-iso8859-1	#x70)	; .ANp
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
    (korean-ksc5601	#x29 #x23)	; $(D)C(B
    (japanese-jisx0212	#x29 #x43)	; $(D)C(B
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
    (latin-iso8859-1	#x71)	; .ANq
    (latin-iso8859-3	#x71)	; .ANq
    (latin-iso8859-9	#x71)	; .ANq
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
    (japanese-jisx0212	#x2B #x50)	; $(D+P(B
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
    (latin-iso8859-1	#x72)	; .ANr
    (latin-iso8859-3	#x72)	; .ANr
    (latin-iso8859-9	#x72)	; .ANr
    (latin-viscii-lower	#x72)	; .ANr
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
    (chinese-gb2312	#x28 #x30)	; $(D+R(B
    (japanese-jisx0212	#x2B #x52)	; $(D+R(B
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
    (latin-iso8859-1	#x73)	; .ANs
    (latin-iso8859-2	#x73)	; .ANs
    (latin-iso8859-3	#x73)	; .ANs
    (latin-iso8859-9	#x73)	; .ANs
    (latin-viscii-lower	#x73)	; .ANs
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
    (chinese-gb2312	#x28 #x2E)	; $(D+Q(B
    (japanese-jisx0212	#x2B #x51)	; $(D+Q(B
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
    (latin-iso8859-1	#x74)	; .ANt
    (latin-iso8859-2	#x74)	; .ANt
    (latin-iso8859-3	#x74)	; .ANt
    (latin-iso8859-4	#x74)	; .ANt
    (latin-iso8859-9	#x74)	; .ANt
    (latin-viscii-lower	#x74)	; .ANt
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
    (japanese-jisx0212	#x2B #x54)	; $(D+T(B
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
    (latin-iso8859-1	#x75)	; .ANu
    (latin-iso8859-4	#x75)	; .ANu
    (latin-iso8859-9	#x75)	; .ANu
    (latin-viscii-lower	#x75)	; .ANu
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
    (japanese-jisx0212	#x2B #x58)	; $(D+X(B
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
    (latin-iso8859-1	#x76)	; .ANv
    (latin-iso8859-2	#x76)	; .ANv
    (latin-iso8859-3	#x76)	; .ANv
    (latin-iso8859-4	#x76)	; .ANv
    (latin-iso8859-9	#x76)	; .ANv
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
    (japanese-jisx0212	#x2B #x53)	; $(D+S(B
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x77)	; .ANw
    (latin-iso8859-2	#x77)	; .ANw
    (latin-iso8859-3	#x77)	; .ANw
    (latin-iso8859-4	#x77)	; .ANw
    (latin-iso8859-9	#x77)	; .ANw
    (hebrew-iso8859-8	#x3A)	; .ANw
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x00F7)
    (mirrored		. nil)
    (japanese-jisx0208-1978	#x21 #x60)	; $B!`(B
    (chinese-gb2312		#x21 #x42)	; $B!`(B
    (japanese-jisx0208		#x21 #x60)	; $B!`(B
    (korean-ksc5601		#x21 #x40)	; $B!`(B
    (chinese-cns11643-1		#x22 #x33)	; $B!`(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1	#x78)	; .ANx
    (latin-iso8859-4	#x78)	; .ANx
    (latin-iso8859-9	#x78)	; .ANx
    (ipa		#x2F)	; .ANx
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
    (korean-ksc5601	#x29 #x2A)	; $(D)L(B
    (japanese-jisx0212	#x29 #x4C)	; $(D)L(B
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
    (latin-iso8859-1	#x79)	; .ANy
    (latin-iso8859-3	#x79)	; .ANy
    (latin-iso8859-9	#x79)	; .ANy
    (latin-viscii-lower	#x79)	; .ANy
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
    (chinese-gb2312	#x28 #x34)	; $(D+c(B
    (japanese-jisx0212	#x2B #x63)	; $(D+c(B
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
    (latin-iso8859-1	#x7A)	; .ANz
    (latin-iso8859-2	#x7A)	; .ANz
    (latin-iso8859-3	#x7A)	; .ANz
    (latin-iso8859-4	#x7A)	; .ANz
    (latin-iso8859-9	#x7A)	; .ANz
    (latin-viscii-lower	#x7A)	; .ANz
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
    (chinese-gb2312	#x28 #x32)	; $(D+b(B
    (japanese-jisx0212	#x2B #x62)	; $(D+b(B
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
    (latin-iso8859-1	#x7B)	; .AN{
    (latin-iso8859-3	#x7B)	; .AN{
    (latin-iso8859-4	#x7B)	; .AN{
    (latin-iso8859-9	#x7B)	; .AN{
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
    (japanese-jisx0212	#x2B #x65)	; $(D+e(B
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
    (latin-iso8859-1	#x7C)	; .AN|
    (latin-iso8859-2	#x7C)	; .AN|
    (latin-iso8859-3	#x7C)	; .AN|
    (latin-iso8859-4	#x7C)	; .AN|
    (latin-iso8859-9	#x7C)	; .AN|
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
    (chinese-gb2312	#x28 #x39)	; $(D+d(B
    (japanese-jisx0212	#x2B #x64)	; $(D+d(B
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
    (latin-iso8859-1	#x7D)	; .AN}
    (latin-iso8859-2	#x7D)	; .AN}
    (latin-viscii-lower	#x7D)	; .AN}
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
    (japanese-jisx0212	#x2B #x72)	; $(D+r(B
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
    (latin-iso8859-1	#x7E)	; .AN~
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
    (korean-ksc5601	#x29 #x2D)	; $(D)P(B
    (japanese-jisx0212	#x29 #x50)	; $(D)P(B
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
    (latin-iso8859-1	#x7F)	; .AN
    (latin-iso8859-9	#x7F)	; .AN
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
    (japanese-jisx0212	#x2B #x73)	; $(D+s(B
    ))
