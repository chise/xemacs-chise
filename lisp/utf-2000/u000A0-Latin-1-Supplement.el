(define-char
  '((name		. "NO-BREAK SPACE")
    (ucs		. #x00A0)
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->decomposition	noBreak #x0020)
    (latin-iso8859-1	#x20)	; �
    (latin-iso8859-2	#x20)	; -B�-A
    (latin-iso8859-3	#x20)	; -C�-A
    (latin-iso8859-4	#x20)	; -D�-A
    (greek-iso8859-7	#x20)	; -F�-A
    (hebrew-iso8859-8	#x20)	; �2]-H��0]-A
    (cyrillic-iso8859-5 #x20)	; -L�-A
    (latin-iso8859-9	#x20)	; -M�-A
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x21)	; �
    (latin-iso8859-9	#x21)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED EXCLAMATION MARK")
    (->ucs		. #x00A1)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A1)
    (korean-ksc5601	#x22 #x2E)	; $(D"B(B
    (japanese-jisx0212	#x22 #x42)	; $(D"B(B
    ))
(define-char
  '((name		. "CENT SIGN")
    (ucs		. #x00A2)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x22)	; �
    (hebrew-iso8859-8	#x22)	; �2]-H��0]-A
    (latin-iso8859-9	#x22)	; -M�-A
    ))
(define-char
  '((name		. "POUND SIGN")
    (ucs		. #x00A3)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x23)	; �
    (latin-iso8859-3	#x23)	; -C�-A
    (greek-iso8859-7	#x23)	; -F�-A
    (hebrew-iso8859-8	#x23)	; �2]-H��0]-A
    (latin-iso8859-9	#x23)	; -M�-A
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x24)	; �
    (latin-iso8859-2	#x24)	; -B�-A
    (latin-iso8859-3	#x24)	; -C�-A
    (latin-iso8859-4	#x24)	; -D�-A
    (hebrew-iso8859-8	#x24)	; �2]-H��0]-A
    (latin-iso8859-9	#x24)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH CURRENCY SIGN")
    (->ucs		. #x00A4)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00A4)
    (chinese-gb2312	#x21 #x68)	; $(D"p(B
    (korean-ksc5601	#x22 #x34)	; $(C"4(B
    (japanese-jisx0212	#x22 #x70)	; $(D"p(B
    ))
(define-char
  '((name		. "YEN SIGN")
    (ucs		. #x00A5)
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-jisx0201	#x5C)	; (J\(B
    (latin-iso8859-1	#x25)	; �
    (hebrew-iso8859-8	#x25)	; �2]-H��0]-A
    (latin-iso8859-9	#x25)	; -M�-A
    ))
(define-char
  '((name		. "BROKEN BAR")
    (ucs		. #x00A6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x26)	; �
    (greek-iso8859-7	#x26)	; -F�-A
    (hebrew-iso8859-8	#x26)	; �2]-H��0]-A
    (latin-iso8859-9	#x26)	; -M�-A
    ))
(define-char
  '((name		. "SECTION SIGN")
    (ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x27)	; �
    (latin-iso8859-2	#x27)	; -B�-A
    (latin-iso8859-3	#x27)	; -C�-A
    (latin-iso8859-4	#x27)	; -D�-A
    (greek-iso8859-7	#x27)	; -F�-A
    (hebrew-iso8859-8	#x27)	; �2]-H��0]-A
    (cyrillic-iso8859-5 #x7D)	; -L�-A
    (latin-iso8859-9	#x27)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH SECTION SIGN")
    (->ucs		. #x00A7)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A7)
    (japanese-jisx0208-1978	#x21 #x78)	; $(B!x(B
    (chinese-gb2312		#x21 #x6C)	; $(A!l(B
    (japanese-jisx0208		#x21 #x78)	; $(B!x(B
    (korean-ksc5601		#x21 #x57)	; $(C!W(B
    (chinese-cns11643-1		#x21 #x70)	; $(G!p(B
    ))
(define-char
  '((name		. "DIAERESIS")
    (ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0308)
    (latin-iso8859-1	#x28)	; �
    (latin-iso8859-2	#x28)	; -B�-A
    (latin-iso8859-3	#x28)	; -C�-A
    (latin-iso8859-4	#x28)	; -D�-A
    (greek-iso8859-7	#x28)	; -F�-A
    (hebrew-iso8859-8	#x28)	; �2]-H��0]-A
    (latin-iso8859-9	#x28)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH DIAERESIS")
    (->ucs		. #x00A8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A8)
    (japanese-jisx0208-1978	#x21 #x2F)	; $(B!/(B
    (chinese-gb2312		#x21 #x27)	; $(A!'(B
    (japanese-jisx0208		#x21 #x2F)	; $(B!/(B
    (korean-ksc5601		#x21 #x27)	; $(C!'(B
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x29)	; �
    (greek-iso8859-7	#x29)	; -F�-A
    (hebrew-iso8859-8	#x29)	; �2]-H��0]-A
    (latin-iso8859-9	#x29)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH COPYRIGHT SIGN")
    (->ucs		. #x00A9)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00A9)
    (japanese-jisx0212	#x22 #x6D)	; $(D"m(B
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x0061)
    (latin-iso8859-1	#x2A)	; �
    (latin-iso8859-9	#x2A)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH FEMININE ORDINAL INDICATOR")
    (->ucs		. #x00AA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00AA)
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
    (latin-iso8859-1	#x2B)	; �
    (greek-iso8859-7	#x2B)	; -F�-A
    (hebrew-iso8859-8	#x2B)	; �2]-H��0]-A
    (latin-iso8859-9	#x2B)	; -M�-A
    ))
(define-char
  '((name		. "NOT SIGN")
    (ucs		. #x00AC)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2C)	; �
    (greek-iso8859-7	#x2C)	; -F�-A
    (hebrew-iso8859-8	#x2C)	; �2]-H��0]-A
    (latin-iso8859-9	#x2C)	; -M�-A
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2D)	; �
    (latin-iso8859-2	#x2D)	; -B�-A
    (latin-iso8859-3	#x2D)	; -C�-A
    (latin-iso8859-4	#x2D)	; -D�-A
    (greek-iso8859-7	#x2D)	; -F�-A
    (hebrew-iso8859-8	#x2D)	; �2]-H��0]-A
    (cyrillic-iso8859-5 #x2D)	; -L�-A
    (latin-iso8859-9	#x2D)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH SOFT HYPHEN")
    (->ucs		. #x00AD)
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AD)
    (korean-ksc5601	#x21 #x29)	; $(C!)(B
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x2E)	; �
    (hebrew-iso8859-8	#x2E)	; �2]-H��0]-A
    (latin-iso8859-9	#x2E)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH REGISTERED SIGN")
    (->ucs		. #x00AE)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00AE)
    (japanese-jisx0212	#x22 #x6E)	; $(D"n(B
    ))
(define-char
  '((name		. "MACRON")
    (ucs		. #x00AF)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0304)
    (latin-iso8859-1	#x2F)	; �
    (latin-iso8859-4	#x2F)	; -D�-A
    (latin-iso8859-9	#x2F)	; -M�-A
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x30)	; �
    (latin-iso8859-2	#x30)	; -B�-A
    (latin-iso8859-3	#x30)	; -C�-A
    (latin-iso8859-4	#x30)	; -D�-A
    (greek-iso8859-7	#x30)	; -F�-A
    (hebrew-iso8859-8	#x30)	; �2]-H��0]-A
    (latin-iso8859-9	#x30)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH DEGREE SIGN")
    (->ucs		. #x00B0)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B0)
    (japanese-jisx0208-1978	#x21 #x6B)	; $(B!k(B
    (chinese-gb2312		#x21 #x63)	; $(A!c(B
    (japanese-jisx0208		#x21 #x6B)	; $(B!k(B
    (korean-ksc5601		#x21 #x46)	; $(C!F(B
    (chinese-cns11643-1		#x22 #x78)	; $(G"x(B
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (latin-iso8859-1	#x31)	; �
    (greek-iso8859-7	#x31)	; -F�-A
    (hebrew-iso8859-8	#x31)	; �2]-H��0]-A
    (latin-iso8859-9	#x31)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH PLUS-MINUS SIGN")
    (->ucs		. #x00B1)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->decomposition	wide #x00B1)
    (japanese-jisx0208-1978	#x21 #x5E)	; $(B!^(B
    (chinese-gb2312		#x21 #x40)	; $(A!@(B
    (japanese-jisx0208		#x21 #x5E)	; $(B!^(B
    (korean-ksc5601		#x21 #x3E)	; $(C!>(B
    (chinese-cns11643-1		#x22 #x34)	; $(G"4(B
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
    (latin-iso8859-1	#x32)	; �
    (latin-iso8859-3	#x32)	; -C�-A
    (greek-iso8859-7	#x32)	; -F�-A
    (hebrew-iso8859-8	#x32)	; �2]-H��0]-A
    (latin-iso8859-9	#x32)	; -M�-A
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
    (korean-ksc5601	#x29 #x77)	; $(C)w(B
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
    (latin-iso8859-1	#x33)	; �
    (latin-iso8859-3	#x33)	; -C�-A
    (greek-iso8859-7	#x33)	; -F�-A
    (hebrew-iso8859-8	#x33)	; �2]-H��0]-A
    (latin-iso8859-9	#x33)	; -M�-A
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
    (korean-ksc5601	#x29 #x78)	; $(C)x(B
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (latin-iso8859-1	#x34)	; �
    (latin-iso8859-2	#x34)	; -B�-A
    (latin-iso8859-3	#x34)	; -C�-A
    (latin-iso8859-4	#x34)	; -D�-A
    (hebrew-iso8859-8	#x34)	; �2]-H��0]-A
    (latin-iso8859-9	#x34)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH ACUTE ACCENT")
    (->ucs		. #x00B4)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B4)
    (japanese-jisx0208-1978	#x21 #x2D)	; $(B!-(B
    (japanese-jisx0208		#x21 #x2D)	; $(B!-(B
    (korean-ksc5601		#x22 #x25)	; $(C"%(B
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
    (latin-iso8859-1	#x35)	; �
    (latin-iso8859-3	#x35)	; -C�-A
    (hebrew-iso8859-8	#x35)	; �2]-H��0]-A
    (latin-iso8859-9	#x35)	; -M�-A
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x36)	; �
    (hebrew-iso8859-8	#x36)	; �2]-H��0]-A
    (latin-iso8859-9	#x36)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH PILCROW SIGN")
    (->ucs		. #x00B6)
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B6)
    (japanese-jisx0208	#x22 #x79)	; $(B"y(B
    (korean-ksc5601	#x22 #x52)	; $(C"R(B
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x37)	; �
    (latin-iso8859-3	#x37)	; -C�-A
    (greek-iso8859-7	#x37)	; -F�-A
    (hebrew-iso8859-8	#x37)	; �2]-H��0]-A
    (latin-iso8859-9	#x37)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH MIDDLE DOT")
    (->ucs		. #x00B7)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B7)
    (korean-ksc5601	#x21 #x24)	; $(C!$(B
    (chinese-cns11643-1 #x21 #x26)	; $(G!&(B
    ))
(define-char
  '((name		. "CEDILLA")
    (ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0327)
    (latin-iso8859-1	#x38)	; �
    (latin-iso8859-2	#x38)	; -B�-A
    (latin-iso8859-3	#x38)	; -C�-A
    (latin-iso8859-4	#x38)	; -D�-A
    (hebrew-iso8859-8	#x38)	; �2]-H��0]-A
    (latin-iso8859-9	#x38)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH CEDILLA")
    (->ucs		. #x00B8)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00B8)
    (korean-ksc5601	#x22 #x2C)	; $(D"1(B
    (japanese-jisx0212	#x22 #x31)	; $(D"1(B
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
    (latin-iso8859-1	#x39)	; �
    (hebrew-iso8859-8	#x39)	; �2]-H��0]-A
    (latin-iso8859-9	#x39)	; -M�-A
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
    (korean-ksc5601	#x29 #x76)	; $(C)v(B
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	super #x006F)
    (latin-iso8859-1	#x3A)	; �
    (latin-iso8859-9	#x3A)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH MASCULINE ORDINAL INDICATOR")
    (->ucs		. #x00BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x00BA)
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
    (latin-iso8859-1	#x3B)	; �
    (greek-iso8859-7	#x3B)	; -F�-A
    (hebrew-iso8859-8	#x3B)	; �2]-H��0]-A
    (latin-iso8859-9	#x3B)	; -M�-A
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	fraction #x0031 #x2044 #x0034)
    (latin-iso8859-1	#x3C)	; �
    (hebrew-iso8859-8	#x3C)	; �2]-H��0]-A
    (latin-iso8859-9	#x3C)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE QUARTER")
    (->ucs		. #x00BC)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (->decomposition	wide #x00BC)
    (korean-ksc5601	#x28 #x79)	; $(C(y(B
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	fraction #x0031 #x2044 #x0032)
    (latin-iso8859-1	#x3D)	; �
    (latin-iso8859-3	#x3D)	; -C�-A
    (greek-iso8859-7	#x3D)	; -F�-A
    (hebrew-iso8859-8	#x3D)	; �2]-H��0]-A
    (latin-iso8859-9	#x3D)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION ONE HALF")
    (->ucs		. #x00BD)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (->decomposition	wide #x00BD)
    (korean-ksc5601	#x28 #x76)	; $(C(v(B
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (->decomposition	fraction #x0033 #x2044 #x0034)
    (latin-iso8859-1	#x3E)	; �
    (hebrew-iso8859-8	#x3E)	; �2]-H��0]-A
    (latin-iso8859-9	#x3E)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH VULGAR FRACTION THREE QUARTERS")
    (->ucs		. #x00BE)
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BE)
    (numeric-value	. 3/4)
    (korean-ksc5601	#x28 #x7A)	; $(C(z(B
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x3F)	; �
    (latin-iso8859-9	#x3F)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH INVERTED QUESTION MARK")
    (->ucs		. #x00BF)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00BF)
    (korean-ksc5601	#x22 #x2F)	; $(D"D(B
    (japanese-jisx0212	#x22 #x44)	; $(D"D(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (ucs		. #x00C0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0300)
    (->lowercase	#x00E0)
    (latin-iso8859-1	#x40)	; �
    (latin-iso8859-3	#x40)	; -C�-A
    (latin-iso8859-9	#x40)	; -M�-A
    (latin-viscii-upper #x60)	; �
    (latin-viscii	#xC0)	; �
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
    (japanese-jisx0212	#x2A #x22)	; $(D*"(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (ucs		. #x00C1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0301)
    (->lowercase	#x00E1)
    (latin-iso8859-1	#x41)	; �
    (latin-iso8859-2	#x41)	; -B�-A
    (latin-iso8859-3	#x41)	; -C�-A
    (latin-iso8859-4	#x41)	; -D�-A
    (latin-iso8859-9	#x41)	; -M�-A
    (latin-viscii-upper #x61)	; �
    (latin-viscii	#xC1)	; �
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
    (japanese-jisx0212	#x2A #x21)	; $(D*!(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (ucs		. #x00C2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0302)
    (->lowercase	#x00E2)
    (latin-iso8859-1	#x42)	; �
    (latin-iso8859-2	#x42)	; -B�-A
    (latin-iso8859-3	#x42)	; -C�-A
    (latin-iso8859-4	#x42)	; -D�-A
    (latin-iso8859-9	#x42)	; -M�-A
    (latin-viscii-upper #x62)	; �
    (latin-viscii	#xC2)	; �
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
    (japanese-jisx0212	#x2A #x24)	; $(D*$(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (ucs		. #x00C3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0303)
    (->lowercase	#x00E3)
    (latin-iso8859-1	#x43)	; �
    (latin-iso8859-4	#x43)	; -D�-A
    (latin-iso8859-9	#x43)	; -M�-A
    (latin-viscii-upper #x63)	; �
    (latin-viscii	#xC3)	; �
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
    (japanese-jisx0212	#x2A #x2A)	; $(D**(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (ucs		. #x00C4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0308)
    (->lowercase	#x00E4)
    (latin-iso8859-1	#x44)	; �
    (latin-iso8859-2	#x44)	; -B�-A
    (latin-iso8859-3	#x44)	; -C�-A
    (latin-iso8859-4	#x44)	; -D�-A
    (latin-iso8859-9	#x44)	; -M�-A
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
    (japanese-jisx0212	#x2A #x23)	; $(D*#(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (ucs		. #x00C5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x030A)
    (->lowercase	#x00E5)
    (latin-iso8859-1	#x45)	; �
    (latin-iso8859-4	#x45)	; -D�-A
    (latin-iso8859-9	#x45)	; -M�-A
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
    (latin-iso8859-1	#x46)	; �
    (latin-iso8859-4	#x46)	; -D�-A
    (latin-iso8859-9	#x46)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER AE")
    (->ucs		. #x00C6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER AE")))
    (korean-ksc5601	#x28 #x21)	; $(D)!(B
    (japanese-jisx0212	#x29 #x21)	; $(D)!(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (ucs		. #x00C7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0327)
    (->lowercase	#x00E7)
    (latin-iso8859-1	#x47)	; �
    (latin-iso8859-2	#x47)	; -B�-A
    (latin-iso8859-3	#x47)	; -C�-A
    (latin-iso8859-9	#x47)	; -M�-A
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
    (japanese-jisx0212	#x2A #x2E)	; $(D*.(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (ucs		. #x00C8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0300)
    (->lowercase	#x00E8)
    (latin-iso8859-1	#x48)	; �
    (latin-iso8859-3	#x48)	; -C�-A
    (latin-iso8859-9	#x48)	; -M�-A
    (latin-viscii-upper #x68)	; �
    (latin-viscii	#xC8)	; �
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
    (japanese-jisx0212	#x2A #x32)	; $(D*2(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (ucs		. #x00C9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0301)
    (->lowercase	#x00E9)
    (latin-iso8859-1	#x49)	; �
    (latin-iso8859-2	#x49)	; -B�-A
    (latin-iso8859-3	#x49)	; -C�-A
    (latin-iso8859-4	#x49)	; -D�-A
    (latin-iso8859-9	#x49)	; -M�-A
    (latin-viscii-upper #x69)	; �
    (latin-viscii	#xC9)	; �
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
    (japanese-jisx0212	#x2A #x31)	; $(D*1(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (ucs		. #x00CA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0302)
    (->lowercase	#x00EA)
    (latin-iso8859-1	#x4A)	; �
    (latin-iso8859-3	#x4A)	; -C�-A
    (latin-iso8859-9	#x4A)	; -M�-A
    (latin-viscii-upper #x6A)	; �
    (latin-viscii	#xCA)	; �
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
    (japanese-jisx0212	#x2A #x34)	; $(D*4(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (ucs		. #x00CB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0308)
    (->lowercase	#x00EB)
    (latin-iso8859-1	#x4B)	; �
    (latin-iso8859-2	#x4B)	; -B�-A
    (latin-iso8859-3	#x4B)	; -C�-A
    (latin-iso8859-4	#x4B)	; -D�-A
    (latin-iso8859-9	#x4B)	; -M�-A
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
    (japanese-jisx0212	#x2A #x33)	; $(D*3(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (ucs		. #x00CC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0300)
    (->lowercase	#x00EC)
    (latin-iso8859-1	#x4C)	; �
    (latin-iso8859-3	#x4C)	; -C�-A
    (latin-iso8859-9	#x4C)	; -M�-A
    (latin-viscii-upper #x6C)	; �
    (latin-viscii	#xCC)	; �
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
    (japanese-jisx0212	#x2A #x40)	; $(D*@(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (ucs		. #x00CD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0301)
    (->lowercase	#x00ED)
    (latin-iso8859-1	#x4D)	; �
    (latin-iso8859-2	#x4D)	; -B�-A
    (latin-iso8859-3	#x4D)	; -C�-A
    (latin-iso8859-4	#x4D)	; -D�-A
    (latin-iso8859-9	#x4D)	; -M�-A
    (latin-viscii-upper #x6D)	; �
    (latin-viscii	#xCD)	; �
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
    (japanese-jisx0212	#x2A #x3F)	; $(D*?(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (ucs		. #x00CE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0302)
    (->lowercase	#x00EE)
    (latin-iso8859-1	#x4E)	; �
    (latin-iso8859-2	#x4E)	; -B�-A
    (latin-iso8859-3	#x4E)	; -C�-A
    (latin-iso8859-4	#x4E)	; -D�-A
    (latin-iso8859-9	#x4E)	; -M�-A
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
    (japanese-jisx0212	#x2A #x42)	; $(D*B(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (ucs		. #x00CF)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0308)
    (->lowercase	#x00EF)
    (latin-iso8859-1	#x4F)	; �
    (latin-iso8859-3	#x4F)	; -C�-A
    (latin-iso8859-9	#x4F)	; -M�-A
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
    (latin-iso8859-1	#x50)	; �
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
    (korean-ksc5601	#x28 #x22)	; $(C("(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (ucs		. #x00D1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0303)
    (->lowercase	#x00F1)
    (latin-iso8859-1	#x51)	; �
    (latin-iso8859-3	#x51)	; -C�-A
    (latin-iso8859-9	#x51)	; -M�-A
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
    (japanese-jisx0212	#x2A #x50)	; $(D*P(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (ucs		. #x00D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0300)
    (->lowercase	#x00F2)
    (latin-iso8859-1	#x52)	; �
    (latin-iso8859-3	#x52)	; -C�-A
    (latin-iso8859-9	#x52)	; -M�-A
    (latin-viscii-upper #x72)	; �
    (latin-viscii	#xD2)	; �
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
    (japanese-jisx0212	#x2A #x52)	; $(D*R(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (ucs		. #x00D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0301)
    (->lowercase	#x00F3)
    (latin-iso8859-1	#x53)	; �
    (latin-iso8859-2	#x53)	; -B�-A
    (latin-iso8859-3	#x53)	; -C�-A
    (latin-iso8859-9	#x53)	; -M�-A
    (latin-viscii-upper #x73)	; �
    (latin-viscii	#xD3)	; �
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
    (japanese-jisx0212	#x2A #x51)	; $(D*Q(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (ucs		. #x00D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0302)
    (->lowercase	#x00F4)
    (latin-iso8859-1	#x54)	; �
    (latin-iso8859-2	#x54)	; -B�-A
    (latin-iso8859-3	#x54)	; -C�-A
    (latin-iso8859-4	#x54)	; -D�-A
    (latin-iso8859-9	#x54)	; -M�-A
    (latin-viscii-upper #x74)	; �
    (latin-viscii	#xD4)	; �
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
    (japanese-jisx0212	#x2A #x54)	; $(D*T(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (ucs		. #x00D5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0303)
    (->lowercase	#x00F5)
    (latin-iso8859-1	#x55)	; �
    (latin-iso8859-4	#x55)	; -D�-A
    (latin-iso8859-9	#x55)	; -M�-A
    (latin-viscii-upper #x75)	; �
    (latin-viscii	#xA0)	; �
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
    (japanese-jisx0212	#x2A #x58)	; $(D*X(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (ucs		. #x00D6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0308)
    (->lowercase	#x00F6)
    (latin-iso8859-1	#x56)	; �
    (latin-iso8859-2	#x56)	; -B�-A
    (latin-iso8859-3	#x56)	; -C�-A
    (latin-iso8859-4	#x56)	; -D�-A
    (latin-iso8859-9	#x56)	; -M�-A
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
    (japanese-jisx0212	#x2A #x53)	; $(D*S(B
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x57)	; �
    (latin-iso8859-2	#x57)	; -B�-A
    (latin-iso8859-3	#x57)	; -C�-A
    (latin-iso8859-4	#x57)	; -D�-A
    (hebrew-iso8859-8	#x2A)	; �2]-H��0]-A
    (latin-iso8859-9	#x57)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH MULTIPLICATION SIGN")
    (->ucs		. #x00D7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00D7)
    (japanese-jisx0208-1978	#x21 #x5F)	; $(B!_(B
    (chinese-gb2312		#x21 #x41)	; $(A!A(B
    (japanese-jisx0208		#x21 #x5F)	; $(B!_(B
    (korean-ksc5601		#x21 #x3F)	; $(C!?(B
    (chinese-cns11643-1		#x22 #x32)	; $(G"2(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x00F8)
    (latin-iso8859-1	#x58)	; �
    (latin-iso8859-4	#x58)	; -D�-A
    (latin-iso8859-9	#x58)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH STROKE")
    (->ucs		. #x00D8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH STROKE")))
    (korean-ksc5601	#x28 #x2A)	; $(D),(B
    (japanese-jisx0212	#x29 #x2C)	; $(D),(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (ucs		. #x00D9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0300)
    (->lowercase	#x00F9)
    (latin-iso8859-1	#x59)	; �
    (latin-iso8859-3	#x59)	; -C�-A
    (latin-iso8859-9	#x59)	; -M�-A
    (latin-viscii-upper #x79)	; �
    (latin-viscii	#xD9)	; �
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
    (japanese-jisx0212	#x2A #x63)	; $(D*c(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (ucs		. #x00DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0301)
    (->lowercase	#x00FA)
    (latin-iso8859-1	#x5A)	; �
    (latin-iso8859-2	#x5A)	; -B�-A
    (latin-iso8859-3	#x5A)	; -C�-A
    (latin-iso8859-4	#x5A)	; -D�-A
    (latin-iso8859-9	#x5A)	; -M�-A
    (latin-viscii-upper #x7A)	; �
    (latin-viscii	#xDA)	; �
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
    (japanese-jisx0212	#x2A #x62)	; $(D*b(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (ucs		. #x00DB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0302)
    (->lowercase	#x00FB)
    (latin-iso8859-1	#x5B)	; �
    (latin-iso8859-3	#x5B)	; -C�-A
    (latin-iso8859-4	#x5B)	; -D�-A
    (latin-iso8859-9	#x5B)	; -M�-A
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
    (japanese-jisx0212	#x2A #x65)	; $(D*e(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (ucs		. #x00DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0308)
    (->lowercase	#x00FC)
    (latin-iso8859-1	#x5C)	; �
    (latin-iso8859-2	#x5C)	; -B�-A
    (latin-iso8859-3	#x5C)	; -C�-A
    (latin-iso8859-4	#x5C)	; -D�-A
    (latin-iso8859-9	#x5C)	; -M�-A
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
    (japanese-jisx0212	#x2A #x64)	; $(D*d(B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (ucs		. #x00DD)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0301)
    (->lowercase	#x00FD)
    (latin-iso8859-1	#x5D)	; �
    (latin-iso8859-2	#x5D)	; -B�-A
    (latin-viscii-upper #x7D)	; �
    (latin-viscii	#xDD)	; �
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
    (latin-iso8859-1	#x5E)	; �
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
    (latin-iso8859-1	#x5F)	; �
    (latin-iso8859-2	#x5F)	; -B�-A
    (latin-iso8859-3	#x5F)	; -C�-A
    (latin-iso8859-4	#x5F)	; -D�-A
    (latin-iso8859-9	#x5F)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER SHARP S")
    (->ucs		. #x00DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (->decomposition	wide #x00DF)
    (korean-ksc5601	#x29 #x2C)	; $(D)N(B
    (japanese-jisx0212	#x29 #x4E)	; $(D)N(B
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
    (latin-iso8859-1	#x60)	; �
    (latin-iso8859-3	#x60)	; -C�-A
    (latin-iso8859-9	#x60)	; -M�-A
    (latin-viscii-lower #x60)	; �
    (latin-viscii	#xE0)	; �
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
    (chinese-gb2312	#x28 #x24)	; $(D+"(B
    (japanese-jisx0212	#x2B #x22)	; $(D+"(B
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
    (latin-iso8859-1	#x61)	; �
    (latin-iso8859-2	#x61)	; -B�-A
    (latin-iso8859-3	#x61)	; -C�-A
    (latin-iso8859-4	#x61)	; -D�-A
    (latin-iso8859-9	#x61)	; -M�-A
    (latin-viscii-lower #x61)	; �
    (latin-viscii	#xE1)	; �
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
    (chinese-gb2312	#x28 #x22)	; $(D+!(B
    (japanese-jisx0212	#x2B #x21)	; $(D+!(B
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
    (latin-iso8859-1	#x62)	; �
    (latin-iso8859-2	#x62)	; -B�-A
    (latin-iso8859-3	#x62)	; -C�-A
    (latin-iso8859-4	#x62)	; -D�-A
    (latin-iso8859-9	#x62)	; -M�-A
    (latin-viscii-lower #x62)	; �
    (latin-viscii	#xE2)	; �
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
    (japanese-jisx0212	#x2B #x24)	; $(D+$(B
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
    (latin-iso8859-1	#x63)	; �
    (latin-iso8859-4	#x63)	; -D�-A
    (latin-iso8859-9	#x63)	; -M�-A
    (latin-viscii-lower #x63)	; �
    (latin-viscii	#xE3)	; �
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
    (japanese-jisx0212	#x2B #x2A)	; $(D+*(B
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
    (latin-iso8859-1	#x64)	; �
    (latin-iso8859-2	#x64)	; -B�-A
    (latin-iso8859-3	#x64)	; -C�-A
    (latin-iso8859-4	#x64)	; -D�-A
    (latin-iso8859-9	#x64)	; -M�-A
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
    (japanese-jisx0212	#x2B #x23)	; $(D+#(B
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
    (latin-iso8859-1	#x65)	; �
    (latin-iso8859-4	#x65)	; -D�-A
    (latin-iso8859-9	#x65)	; -M�-A
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
    (latin-iso8859-1	#x66)	; �
    (latin-iso8859-4	#x66)	; -D�-A
    (latin-iso8859-9	#x66)	; -M�-A
    (ipa		#x24)	; -0�-A
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
    (korean-ksc5601	#x29 #x21)	; $(D)A(B
    (japanese-jisx0212	#x29 #x41)	; $(D)A(B
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
    (latin-iso8859-1	#x67)	; �
    (latin-iso8859-2	#x67)	; -B�-A
    (latin-iso8859-3	#x67)	; -C�-A
    (latin-iso8859-9	#x67)	; -M�-A
    (ipa		#x4E)	; -0�-A
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
    (japanese-jisx0212	#x2B #x2E)	; $(D+.(B
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
    (latin-iso8859-1	#x68)	; �
    (latin-iso8859-3	#x68)	; -C�-A
    (latin-iso8859-9	#x68)	; -M�-A
    (latin-viscii-lower #x68)	; �
    (latin-viscii	#xE8)	; �
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
    (chinese-gb2312	#x28 #x28)	; $(D+2(B
    (japanese-jisx0212	#x2B #x32)	; $(D+2(B
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
    (latin-iso8859-1	#x69)	; �
    (latin-iso8859-2	#x69)	; -B�-A
    (latin-iso8859-3	#x69)	; -C�-A
    (latin-iso8859-4	#x69)	; -D�-A
    (latin-iso8859-9	#x69)	; -M�-A
    (latin-viscii-lower #x69)	; �
    (latin-viscii	#xE9)	; �
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
    (chinese-gb2312	#x28 #x26)	; $(D+1(B
    (japanese-jisx0212	#x2B #x31)	; $(D+1(B
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
    (latin-iso8859-1	#x6A)	; �
    (latin-iso8859-3	#x6A)	; -C�-A
    (latin-iso8859-9	#x6A)	; -M�-A
    (latin-viscii-lower #x6A)	; �
    (latin-viscii	#xEA)	; �
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
    (chinese-gb2312	#x28 #x3A)	; $(D+4(B
    (japanese-jisx0212	#x2B #x34)	; $(D+4(B
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
    (latin-iso8859-1	#x6B)	; �
    (latin-iso8859-2	#x6B)	; -B�-A
    (latin-iso8859-3	#x6B)	; -C�-A
    (latin-iso8859-4	#x6B)	; -D�-A
    (latin-iso8859-9	#x6B)	; -M�-A
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
    (japanese-jisx0212	#x2B #x33)	; $(D+3(B
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
    (latin-iso8859-1	#x6C)	; �
    (latin-iso8859-3	#x6C)	; -C�-A
    (latin-iso8859-9	#x6C)	; -M�-A
    (latin-viscii-lower #x6C)	; �
    (latin-viscii	#xEC)	; �
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
    (chinese-gb2312	#x28 #x2C)	; $(D+@(B
    (japanese-jisx0212	#x2B #x40)	; $(D+@(B
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
    (latin-iso8859-1	#x6D)	; �
    (latin-iso8859-2	#x6D)	; -B�-A
    (latin-iso8859-3	#x6D)	; -C�-A
    (latin-iso8859-4	#x6D)	; -D�-A
    (latin-iso8859-9	#x6D)	; -M�-A
    (latin-viscii-lower #x6D)	; �
    (latin-viscii	#xED)	; �
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
    (chinese-gb2312	#x28 #x2A)	; $(D+?(B
    (japanese-jisx0212	#x2B #x3F)	; $(D+?(B
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
    (latin-iso8859-1	#x6E)	; �
    (latin-iso8859-2	#x6E)	; -B�-A
    (latin-iso8859-3	#x6E)	; -C�-A
    (latin-iso8859-4	#x6E)	; -D�-A
    (latin-iso8859-9	#x6E)	; -M�-A
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
    (japanese-jisx0212	#x2B #x42)	; $(D+B(B
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
    (latin-iso8859-1	#x6F)	; �
    (latin-iso8859-3	#x6F)	; -C�-A
    (latin-iso8859-9	#x6F)	; -M�-A
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
    (latin-iso8859-1	#x70)	; �
    (ipa		#x49)	; -0�-A
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
    (korean-ksc5601	#x29 #x23)	; $(D)C(B
    (japanese-jisx0212	#x29 #x43)	; $(D)C(B
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
    (latin-iso8859-1	#x71)	; �
    (latin-iso8859-3	#x71)	; -C�-A
    (latin-iso8859-9	#x71)	; -M�-A
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
    (japanese-jisx0212	#x2B #x50)	; $(D+P(B
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
    (latin-iso8859-1	#x72)	; �
    (latin-iso8859-3	#x72)	; -C�-A
    (latin-iso8859-9	#x72)	; -M�-A
    (latin-viscii-lower #x72)	; �
    (latin-viscii	#xF2)	; �
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
    (chinese-gb2312	#x28 #x30)	; $(D+R(B
    (japanese-jisx0212	#x2B #x52)	; $(D+R(B
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
    (latin-iso8859-1	#x73)	; �
    (latin-iso8859-2	#x73)	; -B�-A
    (latin-iso8859-3	#x73)	; -C�-A
    (latin-iso8859-9	#x73)	; -M�-A
    (latin-viscii-lower #x73)	; �
    (latin-viscii	#xF3)	; �
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
    (chinese-gb2312	#x28 #x2E)	; $(D+Q(B
    (japanese-jisx0212	#x2B #x51)	; $(D+Q(B
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
    (latin-iso8859-1	#x74)	; �
    (latin-iso8859-2	#x74)	; -B�-A
    (latin-iso8859-3	#x74)	; -C�-A
    (latin-iso8859-4	#x74)	; -D�-A
    (latin-iso8859-9	#x74)	; -M�-A
    (latin-viscii-lower #x74)	; �
    (latin-viscii	#xF4)	; �
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
    (japanese-jisx0212	#x2B #x54)	; $(D+T(B
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
    (latin-iso8859-1	#x75)	; �
    (latin-iso8859-4	#x75)	; -D�-A
    (latin-iso8859-9	#x75)	; -M�-A
    (latin-viscii-lower #x75)	; �
    (latin-viscii	#xF5)	; �
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
    (japanese-jisx0212	#x2B #x58)	; $(D+X(B
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
    (latin-iso8859-1	#x76)	; �
    (latin-iso8859-2	#x76)	; -B�-A
    (latin-iso8859-3	#x76)	; -C�-A
    (latin-iso8859-4	#x76)	; -D�-A
    (latin-iso8859-9	#x76)	; -M�-A
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
    (japanese-jisx0212	#x2B #x53)	; $(D+S(B
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (latin-iso8859-1	#x77)	; �
    (latin-iso8859-2	#x77)	; -B�-A
    (latin-iso8859-3	#x77)	; -C�-A
    (latin-iso8859-4	#x77)	; -D�-A
    (hebrew-iso8859-8	#x3A)	; �2]-H��0]-A
    (latin-iso8859-9	#x77)	; -M�-A
    ))
(define-char
  '((name		. "FULLWIDTH DIVISION SIGN")
    (->ucs		. #x00F7)
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x00F7)
    (japanese-jisx0208-1978	#x21 #x60)	; $(B!`(B
    (chinese-gb2312		#x21 #x42)	; $(A!B(B
    (japanese-jisx0208		#x21 #x60)	; $(B!`(B
    (korean-ksc5601		#x21 #x40)	; $(C!@(B
    (chinese-cns11643-1		#x22 #x33)	; $(G"3(B
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (ucs		. #x00F8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x00D8)
    (->titlecase	#x00D8)
    (latin-iso8859-1	#x78)	; �
    (latin-iso8859-4	#x78)	; -D�-A
    (latin-iso8859-9	#x78)	; -M�-A
    (ipa		#x2F)	; -0�-A
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
    (korean-ksc5601	#x29 #x2A)	; $(D)L(B
    (japanese-jisx0212	#x29 #x4C)	; $(D)L(B
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
    (latin-iso8859-1	#x79)	; �
    (latin-iso8859-3	#x79)	; -C�-A
    (latin-iso8859-9	#x79)	; -M�-A
    (latin-viscii-lower #x79)	; �
    (latin-viscii	#xF9)	; �
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
    (chinese-gb2312	#x28 #x34)	; $(D+c(B
    (japanese-jisx0212	#x2B #x63)	; $(D+c(B
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
    (latin-iso8859-1	#x7A)	; �
    (latin-iso8859-2	#x7A)	; -B�-A
    (latin-iso8859-3	#x7A)	; -C�-A
    (latin-iso8859-4	#x7A)	; -D�-A
    (latin-iso8859-9	#x7A)	; -M�-A
    (latin-viscii-lower #x7A)	; �
    (latin-viscii	#xFA)	; �
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
    (chinese-gb2312	#x28 #x32)	; $(D+b(B
    (japanese-jisx0212	#x2B #x62)	; $(D+b(B
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
    (latin-iso8859-1	#x7B)	; �
    (latin-iso8859-3	#x7B)	; -C�-A
    (latin-iso8859-4	#x7B)	; -D�-A
    (latin-iso8859-9	#x7B)	; -M�-A
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
    (japanese-jisx0212	#x2B #x65)	; $(D+e(B
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
    (latin-iso8859-1	#x7C)	; �
    (latin-iso8859-2	#x7C)	; -B�-A
    (latin-iso8859-3	#x7C)	; -C�-A
    (latin-iso8859-4	#x7C)	; -D�-A
    (latin-iso8859-9	#x7C)	; -M�-A
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
    (chinese-gb2312	#x28 #x39)	; $(D+d(B
    (japanese-jisx0212	#x2B #x64)	; $(D+d(B
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
    (latin-iso8859-1	#x7D)	; �
    (latin-iso8859-2	#x7D)	; -B�-A
    (latin-viscii-lower #x7D)	; �
    (latin-viscii	#xFD)	; �
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
    (latin-iso8859-1	#x7E)	; �
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
    (korean-ksc5601	#x29 #x2D)	; $(D)P(B
    (japanese-jisx0212	#x29 #x50)	; $(D)P(B
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
    (latin-iso8859-1	#x7F)	; �
    (latin-iso8859-9	#x7F)	; -M�-A
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
    (japanese-jisx0212	#x2B #x73)	; $(D+s(B
    ))
