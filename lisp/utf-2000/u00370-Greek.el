(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (ucs		. #x0374)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	#x02B9)
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    ))
(define-char
  '((name		. "GREEK LOWER NUMERAL SIGN")
    (ucs		. #x0375)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Aristeri keraia")
    ))
(define-char
  '((name		. "GREEK YPOGEGRAMMENI")
    (ucs		. #x037A)
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "L")
    (->decomposition	compat #x0020 #x0345)
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (ucs		. #x037E)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	#x003B)
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    ))
(define-char
  '((name		. "GREEK TONOS")
    (ucs		. #x0384)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	compat #x0020 #x0301)
    (mirrored		. nil)
    (greek-iso8859-7	#x34)	; -F´-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK TONOS")
    (->ucs		. #x0384)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x0384)
    (mirrored		. nil)
    (japanese-jisx0212	#x22 #x38)	; $(D"8(B
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (ucs		. #x0385)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	#x00A8 #x0301)
    (mirrored		. nil)
    (greek-iso8859-7	#x35)	; -Fµ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK DIALYTIKA TONOS")
    (->ucs		. #x0385)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	wide #x0385)
    (mirrored		. nil)
    (japanese-jisx0212	#x22 #x39)	; $(D"9(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (ucs		. #x0386)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0391 #x0301)
    (mirrored		. nil)
    (->lowercase	#x03AC)
    (greek-iso8859-7	#x36)	; -F¶-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (->ucs		. #x0386)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0386)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	#x26 #x61)	; $(D&a(B
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (ucs		. #x0387)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (->decomposition	#x00B7)
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (ucs		. #x0388)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0395 #x0301)
    (mirrored		. nil)
    (->lowercase	#x03AD)
    (greek-iso8859-7	#x38)	; -F¸-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (->ucs		. #x0388)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0388)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x62)	; $(D&b(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (ucs		. #x0389)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0397 #x0301)
    (mirrored		. nil)
    (->lowercase	#x03AE)
    (greek-iso8859-7	#x39)	; -F¹-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")
    (->ucs		. #x0389)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0389)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	#x26 #x63)	; $(D&c(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (ucs		. #x038A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0399 #x0301)
    (mirrored		. nil)
    (->lowercase	#x03AF)
    (greek-iso8859-7	#x3A)	; -Fº-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")
    (->ucs		. #x038A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x038A)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	#x26 #x64)	; $(D&d(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (ucs		. #x038C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x039F #x0301)
    (mirrored		. nil)
    (->lowercase	#x03CC)
    (greek-iso8859-7	#x3C)	; -F¼-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (->ucs		. #x038C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x038C)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	#x26 #x67)	; $(D&g(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (ucs		. #x038E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03A5 #x0301)
    (mirrored		. nil)
    (->lowercase	#x03CD)
    (greek-iso8859-7	#x3E)	; -F¾-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (->ucs		. #x038E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x038E)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x69)	; $(D&i(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (ucs		. #x038F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03A9 #x0301)
    (mirrored		. nil)
    (->lowercase	#x03CE)
    (greek-iso8859-7	#x3F)	; -F¿-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (->ucs		. #x038F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x038F)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	#x26 #x6C)	; $(D&l(B
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (ucs  . #x0390)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03CA #x0301)
    (mirrored		. nil)
    (greek-iso8859-7	#x40)	; -FÀ-A
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (->ucs  . #x0390)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0390)
    (mirrored		. nil)
    (japanese-jisx0212	#x26 #x76)	; $(D&v(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (ucs		. #x0391)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B1)
    (greek-iso8859-7	#x41)	; -FÁ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA")
    (->ucs		. #x0391)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0391)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA")))
    (japanese-jisx0208-1978	#x26 #x21)	; $B&!(B
    (chinese-gb2312		#x26 #x21)	; $A&!(B
    (japanese-jisx0208		#x26 #x21)	; $B&!(B
    (korean-ksc5601		#x25 #x41)	; $(C%A(B
    (chinese-cns11643-1		#x24 #x75)	; $(G$u(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (ucs		. #x0392)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B2)
    (greek-iso8859-7	#x42)	; -FÂ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER BETA")
    (->ucs		. #x0392)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0392)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER BETA")))
    (japanese-jisx0208-1978	#x26 #x22)	; $B&"(B
    (chinese-gb2312		#x26 #x22)	; $A&"(B
    (japanese-jisx0208		#x26 #x22)	; $B&"(B
    (korean-ksc5601		#x25 #x42)	; $(C%B(B
    (chinese-cns11643-1		#x24 #x76)	; $(G$v(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (ucs		. #x0393)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B3)
    (greek-iso8859-7	#x43)	; -FÃ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER GAMMA")
    (->ucs		. #x0393)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0393)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER GAMMA")))
    (japanese-jisx0208-1978	#x26 #x23)	; $B&#(B
    (chinese-gb2312		#x26 #x23)	; $A&#(B
    (japanese-jisx0208		#x26 #x23)	; $B&#(B
    (korean-ksc5601		#x25 #x43)	; $(C%C(B
    (chinese-cns11643-1		#x24 #x77)	; $(G$w(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (ucs		. #x0394)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B4)
    (greek-iso8859-7	#x44)	; -FÄ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER DELTA")
    (->ucs		. #x0394)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0394)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER DELTA")))
    (japanese-jisx0208-1978	#x26 #x24)	; $B&$(B
    (chinese-gb2312		#x26 #x24)	; $A&$(B
    (japanese-jisx0208		#x26 #x24)	; $B&$(B
    (korean-ksc5601		#x25 #x44)	; $(C%D(B
    (chinese-cns11643-1		#x24 #x78)	; $(G$x(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (ucs		. #x0395)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B5)
    (greek-iso8859-7	#x45)	; -FÅ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON")
    (->ucs		. #x0395)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0395)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON")))
    (japanese-jisx0208-1978	#x26 #x25)	; $B&%(B
    (chinese-gb2312		#x26 #x25)	; $A&%(B
    (japanese-jisx0208		#x26 #x25)	; $B&%(B
    (korean-ksc5601		#x25 #x45)	; $(C%E(B
    (chinese-cns11643-1		#x24 #x79)	; $(G$y(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (ucs		. #x0396)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B6)
    (greek-iso8859-7	#x46)	; -FÆ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ZETA")
    (->ucs		. #x0396)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0396)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER ZETA")))
    (japanese-jisx0208-1978	#x26 #x26)	; $B&&(B
    (chinese-gb2312		#x26 #x26)	; $A&&(B
    (japanese-jisx0208		#x26 #x26)	; $B&&(B
    (korean-ksc5601		#x25 #x46)	; $(C%F(B
    (chinese-cns11643-1		#x24 #x7A)	; $(G$z(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (ucs		. #x0397)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B7)
    (greek-iso8859-7	#x47)	; -FÇ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA")
    (->ucs		. #x0397)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0397)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER ETA")))
    (japanese-jisx0208-1978	#x26 #x27)	; $B&'(B
    (chinese-gb2312		#x26 #x27)	; $A&'(B
    (japanese-jisx0208		#x26 #x27)	; $B&'(B
    (korean-ksc5601		#x25 #x47)	; $(C%G(B
    (chinese-cns11643-1		#x24 #x7B)	; $(G${(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (ucs		. #x0398)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B8)
    (greek-iso8859-7	#x48)	; -FÈ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER THETA")
    (->ucs		. #x0398)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0398)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER THETA")))
    (japanese-jisx0208-1978	#x26 #x28)	; $B&((B
    (chinese-gb2312		#x26 #x28)	; $A&((B
    (japanese-jisx0208		#x26 #x28)	; $B&((B
    (korean-ksc5601		#x25 #x48)	; $(C%H(B
    (chinese-cns11643-1		#x24 #x7C)	; $(G$|(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (ucs		. #x0399)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B9)
    (greek-iso8859-7	#x49)	; -FÉ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA")
    (->ucs		. #x0399)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x0399)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER IOTA")))
    (japanese-jisx0208-1978	#x26 #x29)	; $B&)(B
    (chinese-gb2312		#x26 #x29)	; $A&)(B
    (japanese-jisx0208		#x26 #x29)	; $B&)(B
    (korean-ksc5601		#x25 #x49)	; $(C%I(B
    (chinese-cns11643-1		#x24 #x7D)	; $(G$}(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (ucs		. #x039A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BA)
    (greek-iso8859-7	#x4A)	; -FÊ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER KAPPA")
    (->ucs		. #x039A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x039A)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER KAPPA")))
    (japanese-jisx0208-1978	#x26 #x2A)	; $B&*(B
    (chinese-gb2312		#x26 #x2A)	; $A&*(B
    (japanese-jisx0208		#x26 #x2A)	; $B&*(B
    (korean-ksc5601		#x25 #x4A)	; $(C%J(B
    (chinese-cns11643-1		#x24 #x7E)	; $(G$~(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (ucs		. #x039B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BB)
    (greek-iso8859-7	#x4B)	; -FË-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER LAMDA")
    (->ucs		. #x039B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x039B)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER LAMDA")))
    (japanese-jisx0208-1978	#x26 #x2B)	; $B&+(B
    (chinese-gb2312		#x26 #x2B)	; $A&+(B
    (japanese-jisx0208		#x26 #x2B)	; $B&+(B
    (korean-ksc5601		#x25 #x4B)	; $(C%K(B
    (chinese-cns11643-1		#x25 #x21)	; $(G%!(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (ucs		. #x039C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BC)
    (greek-iso8859-7	#x4C)	; -FÌ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER MU")
    (->ucs		. #x039C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x039C)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER MU")))
    (japanese-jisx0208-1978	#x26 #x2C)	; $B&,(B
    (chinese-gb2312		#x26 #x2C)	; $A&,(B
    (japanese-jisx0208		#x26 #x2C)	; $B&,(B
    (korean-ksc5601		#x25 #x4C)	; $(C%L(B
    (chinese-cns11643-1		#x25 #x22)	; $(G%"(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (ucs		. #x039D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BD)
    (greek-iso8859-7	#x4D)	; -FÍ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER NU")
    (->ucs		. #x039D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x039D)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER NU")))
    (japanese-jisx0208-1978	#x26 #x2D)	; $B&-(B
    (chinese-gb2312		#x26 #x2D)	; $A&-(B
    (japanese-jisx0208		#x26 #x2D)	; $B&-(B
    (korean-ksc5601		#x25 #x4D)	; $(C%M(B
    (chinese-cns11643-1		#x25 #x23)	; $(G%#(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (ucs		. #x039E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BE)
    (greek-iso8859-7	#x4E)	; -FÎ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER XI")
    (->ucs		. #x039E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x039E)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER XI")))
    (japanese-jisx0208-1978	#x26 #x2E)	; $B&.(B
    (chinese-gb2312		#x26 #x2E)	; $A&.(B
    (japanese-jisx0208		#x26 #x2E)	; $B&.(B
    (korean-ksc5601		#x25 #x4E)	; $(C%N(B
    (chinese-cns11643-1		#x25 #x24)	; $(G%$(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (ucs		. #x039F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BF)
    (greek-iso8859-7	#x4F)	; -FÏ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON")
    (->ucs		. #x039F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x039F)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON")))
    (japanese-jisx0208-1978	#x26 #x2F)	; $B&/(B
    (chinese-gb2312		#x26 #x2F)	; $A&/(B
    (japanese-jisx0208		#x26 #x2F)	; $B&/(B
    (korean-ksc5601		#x25 #x4F)	; $(C%O(B
    (chinese-cns11643-1		#x25 #x25)	; $(G%%(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (ucs		. #x03A0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C0)
    (greek-iso8859-7	#x50)	; -FÐ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PI")
    (->ucs		. #x03A0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A0)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER PI")))
    (japanese-jisx0208-1978	#x26 #x30)	; $B&0(B
    (chinese-gb2312		#x26 #x30)	; $A&0(B
    (japanese-jisx0208		#x26 #x30)	; $B&0(B
    (korean-ksc5601		#x25 #x50)	; $(C%P(B
    (chinese-cns11643-1		#x25 #x26)	; $(G%&(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (ucs		. #x03A1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C1)
    (greek-iso8859-7	#x51)	; -FÑ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER RHO")
    (->ucs		. #x03A1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A1)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER RHO")))
    (japanese-jisx0208-1978	#x26 #x31)	; $B&1(B
    (chinese-gb2312		#x26 #x31)	; $A&1(B
    (japanese-jisx0208		#x26 #x31)	; $B&1(B
    (korean-ksc5601		#x25 #x51)	; $(C%Q(B
    (chinese-cns11643-1		#x25 #x27)	; $(G%'(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (ucs		. #x03A3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C3)
    (greek-iso8859-7	#x53)	; -FÓ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER SIGMA")
    (->ucs		. #x03A3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A3)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER SIGMA")))
    (japanese-jisx0208-1978	#x26 #x32)	; $B&2(B
    (chinese-gb2312		#x26 #x32)	; $A&2(B
    (japanese-jisx0208		#x26 #x32)	; $B&2(B
    (korean-ksc5601		#x25 #x52)	; $(C%R(B
    (chinese-cns11643-1		#x25 #x28)	; $(G%((B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (ucs		. #x03A4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C4)
    (greek-iso8859-7	#x54)	; -FÔ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER TAU")
    (->ucs		. #x03A4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A4)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER TAU")))
    (japanese-jisx0208-1978	#x26 #x33)	; $B&3(B
    (chinese-gb2312		#x26 #x33)	; $A&3(B
    (japanese-jisx0208		#x26 #x33)	; $B&3(B
    (korean-ksc5601		#x25 #x53)	; $(C%S(B
    (chinese-cns11643-1		#x25 #x29)	; $(G%)(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (ucs		. #x03A5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C5)
    (greek-iso8859-7	#x55)	; -FÕ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON")
    (->ucs		. #x03A5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A5)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON")))
    (japanese-jisx0208-1978	#x26 #x34)	; $B&4(B
    (chinese-gb2312		#x26 #x34)	; $A&4(B
    (japanese-jisx0208		#x26 #x34)	; $B&4(B
    (korean-ksc5601		#x25 #x54)	; $(C%T(B
    (chinese-cns11643-1		#x25 #x2A)	; $(G%*(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (ucs		. #x03A6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C6)
    (greek-iso8859-7	#x56)	; -FÖ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PHI")
    (->ucs		. #x03A6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A6)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER PHI")))
    (japanese-jisx0208-1978	#x26 #x35)	; $B&5(B
    (chinese-gb2312		#x26 #x35)	; $A&5(B
    (japanese-jisx0208		#x26 #x35)	; $B&5(B
    (korean-ksc5601		#x25 #x55)	; $(C%U(B
    (chinese-cns11643-1		#x25 #x2B)	; $(G%+(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (ucs		. #x03A7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C7)
    (greek-iso8859-7	#x57)	; -F×-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER CHI")
    (->ucs		. #x03A7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A7)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER CHI")))
    (japanese-jisx0208-1978	#x26 #x36)	; $B&6(B
    (chinese-gb2312		#x26 #x36)	; $A&6(B
    (japanese-jisx0208		#x26 #x36)	; $B&6(B
    (korean-ksc5601		#x25 #x56)	; $(C%V(B
    (chinese-cns11643-1		#x25 #x2C)	; $(G%,(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (ucs		. #x03A8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C8)
    (greek-iso8859-7	#x58)	; -FØ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PSI")
    (->ucs		. #x03A8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A8)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER PSI")))
    (japanese-jisx0208-1978	#x26 #x37)	; $B&7(B
    (chinese-gb2312		#x26 #x37)	; $A&7(B
    (japanese-jisx0208		#x26 #x37)	; $B&7(B
    (korean-ksc5601		#x25 #x57)	; $(C%W(B
    (chinese-cns11643-1		#x25 #x2D)	; $(G%-(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (ucs		. #x03A9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C9)
    (greek-iso8859-7	#x59)	; -FÙ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA")
    (->ucs		. #x03A9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03A9)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA")))
    (japanese-jisx0208-1978	#x26 #x38)	; $B&8(B
    (chinese-gb2312		#x26 #x38)	; $A&8(B
    (japanese-jisx0208		#x26 #x38)	; $B&8(B
    (korean-ksc5601		#x25 #x58)	; $(C%X(B
    (chinese-cns11643-1		#x25 #x2E)	; $(G%.(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (ucs		. #x03AA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x0399 #x0308)
    (mirrored		. nil)
    (->lowercase	#x03CA)
    (greek-iso8859-7	#x5A)	; -FÚ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03AA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03AA)
    (mirrored		. nil)
    (->lowercase
     ((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x65)	; $(D&e(B
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (ucs		. #x03AB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03A5 #x0308)
    (mirrored		. nil)
    (->lowercase	#x03CB)
    (greek-iso8859-7	#x5B)	; -FÛ-A
    ))
(define-char
  '((name	. "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03AB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03AB)
    (mirrored		. nil)
    (->lowercase
     ((name	. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x6A)	; $(D&j(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (ucs		. #x03AC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03B1 #x0301)
    (mirrored		. nil)
    (->uppercase	#x0386)
    (->titlecase	#x0386)
    (greek-iso8859-7	#x5C)	; -FÜ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")
    (->ucs		. #x03AC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03AC)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	#x26 #x71)	; $(D&q(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (ucs		. #x03AD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03B5 #x0301)
    (mirrored		. nil)
    (->uppercase	#x0388)
    (->titlecase	#x0388)
    (greek-iso8859-7	#x5D)	; -FÝ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")
    (->ucs		. #x03AD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03AD)
    (mirrored		. nil)
    (->uppercase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (->titlecase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x72)	; $(D&r(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (ucs		. #x03AE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03B7 #x0301)
    (mirrored		. nil)
    (->uppercase	#x0389)
    (->titlecase	#x0389)
    (greek-iso8859-7	#x5E)	; -FÞ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")
    (->ucs		. #x03AE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03AE)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	#x26 #x73)	; $(D&s(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (ucs		. #x03AF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03B9 #x0301)
    (mirrored		. nil)
    (->uppercase	#x038A)
    (->titlecase	#x038A)
    (greek-iso8859-7	#x5F)	; -Fß-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")
    (->ucs		. #x03AF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03AF)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	#x26 #x74)	; $(D&t(B
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (ucs  . #x03B0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03CB #x0301)
    (mirrored		. nil)
    (greek-iso8859-7	#x60)	; -Fà-A
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (->ucs  . #x03B0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B0)
    (mirrored		. nil)
    (japanese-jisx0212	#x26 #x7B)	; $(D&{(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (ucs		. #x03B1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0391)
    (->titlecase	#x0391)
    (greek-iso8859-7	#x61)	; -Fá-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA")
    (->ucs		. #x03B1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B1)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (japanese-jisx0208-1978	#x26 #x41)	; $B&A(B
    (chinese-gb2312		#x26 #x41)	; $A&A(B
    (japanese-jisx0208		#x26 #x41)	; $B&A(B
    (korean-ksc5601		#x25 #x61)	; $(C%a(B
    (chinese-cns11643-1		#x25 #x2F)	; $(G%/(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (ucs		. #x03B2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (greek-iso8859-7	#x62)	; -Fâ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER BETA")
    (ucs		. #x03B2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B2)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (japanese-jisx0208-1978	#x26 #x42)	; $@&B(B
    (chinese-gb2312		#x26 #x42)	; $A&B(B
    (japanese-jisx0208		#x26 #x42)	; $B&B(B
    (korean-ksc5601		#x25 #x62)	; $(C%b(B
    (chinese-cns11643-1		#x25 #x30)	; $(G%0(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (ucs		. #x03B3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0393)
    (->titlecase	#x0393)
    (greek-iso8859-7	#x63)	; -Fã-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER GAMMA")
    (->ucs		. #x03B3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B3)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (japanese-jisx0208-1978	#x26 #x43)	; $B&C(B
    (chinese-gb2312		#x26 #x43)	; $A&C(B
    (japanese-jisx0208		#x26 #x43)	; $B&C(B
    (korean-ksc5601		#x25 #x63)	; $(C%c(B
    (chinese-cns11643-1		#x25 #x31)	; $(G%1(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (ucs		. #x03B4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0394)
    (->titlecase	#x0394)
    (greek-iso8859-7	#x64)	; -Fä-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER DELTA")
    (->ucs		. #x03B4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B4)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (japanese-jisx0208-1978	#x26 #x44)	; $B&D(B
    (chinese-gb2312		#x26 #x44)	; $A&D(B
    (japanese-jisx0208		#x26 #x44)	; $B&D(B
    (korean-ksc5601		#x25 #x64)	; $(C%d(B
    (chinese-cns11643-1		#x25 #x32)	; $(G%2(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (ucs		. #x03B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0395)
    (->titlecase	#x0395)
    (greek-iso8859-7	#x65)	; -Få-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON")
    (->ucs		. #x03B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B5)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (japanese-jisx0208-1978	#x26 #x45)	; $B&E(B
    (chinese-gb2312		#x26 #x45)	; $A&E(B
    (japanese-jisx0208		#x26 #x45)	; $B&E(B
    (korean-ksc5601		#x25 #x65)	; $(C%e(B
    (chinese-cns11643-1		#x25 #x33)	; $(G%3(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (ucs		. #x03B6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0396)
    (->titlecase	#x0396)
    (greek-iso8859-7	#x66)	; -Fæ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ZETA")
    (->ucs		. #x03B6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B6)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (japanese-jisx0208-1978	#x26 #x46)	; $B&F(B
    (chinese-gb2312		#x26 #x46)	; $A&F(B
    (japanese-jisx0208		#x26 #x46)	; $B&F(B
    (korean-ksc5601		#x25 #x66)	; $(C%f(B
    (chinese-cns11643-1		#x25 #x34)	; $(G%4(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (ucs		. #x03B7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0397)
    (->titlecase	#x0397)
    (greek-iso8859-7	#x67)	; -Fç-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA")
    (->ucs		. #x03B7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B7)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (japanese-jisx0208-1978	#x26 #x47)	; $B&G(B
    (chinese-gb2312		#x26 #x47)	; $A&G(B
    (japanese-jisx0208		#x26 #x47)	; $B&G(B
    (korean-ksc5601		#x25 #x67)	; $(C%g(B
    (chinese-cns11643-1		#x25 #x35)	; $(G%5(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (ucs		. #x03B8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (greek-iso8859-7	#x68)	; -Fè-A
    (ipa		#x48)	; -0È-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER THETA")
    (->ucs		. #x03B8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B8)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (japanese-jisx0208-1978	#x26 #x48)	; $B&H(B
    (chinese-gb2312		#x26 #x48)	; $A&H(B
    (japanese-jisx0208		#x26 #x48)	; $B&H(B
    (korean-ksc5601		#x25 #x68)	; $(C%h(B
    (chinese-cns11643-1		#x25 #x36)	; $(G%6(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (ucs		. #x03B9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0399)
    (->titlecase	#x0399)
    (greek-iso8859-7	#x69)	; -Fé-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA")
    (->ucs		. #x03B9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03B9)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (japanese-jisx0208-1978	#x26 #x49)	; $B&I(B
    (chinese-gb2312		#x26 #x49)	; $A&I(B
    (japanese-jisx0208		#x26 #x49)	; $B&I(B
    (korean-ksc5601		#x25 #x69)	; $(C%i(B
    (chinese-cns11643-1		#x25 #x37)	; $(G%7(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (ucs		. #x03BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (greek-iso8859-7	#x6A)	; -Fê-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER KAPPA")
    (->ucs		. #x03BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03BA)
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (japanese-jisx0208-1978	#x26 #x4A)	; $B&J(B
    (chinese-gb2312		#x26 #x4A)	; $A&J(B
    (japanese-jisx0208		#x26 #x4A)	; $B&J(B
    (korean-ksc5601		#x25 #x6A)	; $(C%j(B
    (chinese-cns11643-1		#x25 #x38)	; $(G%8(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (ucs		. #x03BB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039B)
    (->titlecase	#x039B)
    (greek-iso8859-7	#x6B)	; -Fë-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER LAMDA")
    (->ucs		. #x03BB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03BB)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (japanese-jisx0208-1978	#x26 #x4B)	; $B&K(B
    (chinese-gb2312		#x26 #x4B)	; $A&K(B
    (japanese-jisx0208		#x26 #x4B)	; $B&K(B
    (korean-ksc5601		#x25 #x6B)	; $(C%k(B
    (chinese-cns11643-1		#x25 #x39)	; $(G%9(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (ucs		. #x03BC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (greek-iso8859-7	#x6C)	; -Fì-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER MU")
    (->ucs		. #x03BC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03BC)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (japanese-jisx0208-1978	#x26 #x4C)	; $B&L(B
    (chinese-gb2312		#x26 #x4C)	; $A&L(B
    (japanese-jisx0208		#x26 #x4C)	; $B&L(B
    (korean-ksc5601		#x25 #x6C)	; $(C%l(B
    (chinese-cns11643-1		#x25 #x3A)	; $(G%:(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (ucs		. #x03BD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039D)
    (->titlecase	#x039D)
    (greek-iso8859-7	#x6D)	; -Fí-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER NU")
    (->ucs		. #x03BD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03BD)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (japanese-jisx0208-1978	#x26 #x4D)	; $B&M(B
    (chinese-gb2312		#x26 #x4D)	; $A&M(B
    (japanese-jisx0208		#x26 #x4D)	; $B&M(B
    (korean-ksc5601		#x25 #x6D)	; $(C%m(B
    (chinese-cns11643-1		#x25 #x3B)	; $(G%;(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (ucs		. #x03BE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039E)
    (->titlecase	#x039E)
    (greek-iso8859-7	#x6E)	; -Fî-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER XI")
    (->ucs		. #x03BE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03BE)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (japanese-jisx0208-1978	#x26 #x4E)	; $B&N(B
    (chinese-gb2312		#x26 #x4E)	; $A&N(B
    (japanese-jisx0208		#x26 #x4E)	; $B&N(B
    (korean-ksc5601		#x25 #x6E)	; $(C%n(B
    (chinese-cns11643-1		#x25 #x3C)	; $(G%<(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (ucs		. #x03BF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039F)
    (->titlecase	#x039F)
    (greek-iso8859-7	#x6F)	; -Fï-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON")
    (->ucs		. #x03BF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03BF)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (japanese-jisx0208-1978	#x26 #x4F)	; $B&O(B
    (chinese-gb2312		#x26 #x4F)	; $A&O(B
    (japanese-jisx0208		#x26 #x4F)	; $B&O(B
    (korean-ksc5601		#x25 #x6F)	; $(C%o(B
    (chinese-cns11643-1		#x25 #x3D)	; $(G%=(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (ucs		. #x03C0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (greek-iso8859-7	#x70)	; -Fð-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PI")
    (->ucs		. #x03C0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C0)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (japanese-jisx0208-1978	#x26 #x50)	; $B&P(B
    (chinese-gb2312		#x26 #x50)	; $A&P(B
    (japanese-jisx0208		#x26 #x50)	; $B&P(B
    (korean-ksc5601		#x25 #x70)	; $(C%p(B
    (chinese-cns11643-1		#x25 #x3E)	; $(G%>(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (ucs		. #x03C1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (greek-iso8859-7	#x71)	; -Fñ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER RHO")
    (->ucs		. #x03C1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C1)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (japanese-jisx0208-1978	#x26 #x51)	; $B&Q(B
    (chinese-gb2312		#x26 #x51)	; $A&Q(B
    (japanese-jisx0208		#x26 #x51)	; $B&Q(B
    (korean-ksc5601		#x25 #x71)	; $(C%q(B
    (chinese-cns11643-1		#x25 #x3F)	; $(G%?(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (ucs		. #x03C2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7	#x72)	; -Fò-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER FINAL SIGMA")
    (->ucs		. #x03C2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C2)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (japanese-jisx0212	#x26 #x78)	; $(D&x(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (ucs		. #x03C3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7	#x73)	; -Fó-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER SIGMA")
    (->ucs		. #x03C3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C3)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (japanese-jisx0208-1978	#x26 #x52)	; $B&R(B
    (chinese-gb2312		#x26 #x52)	; $A&R(B
    (japanese-jisx0208		#x26 #x52)	; $B&R(B
    (korean-ksc5601		#x25 #x72)	; $(C%r(B
    (chinese-cns11643-1		#x25 #x40)	; $(G%@(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (ucs		. #x03C4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A4)
    (->titlecase	#x03A4)
    (greek-iso8859-7	#x74)	; -Fô-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER TAU")
    (->ucs		. #x03C4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C4)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (japanese-jisx0208-1978	#x26 #x53)	; $B&S(B
    (chinese-gb2312		#x26 #x53)	; $A&S(B
    (japanese-jisx0208		#x26 #x53)	; $B&S(B
    (korean-ksc5601		#x25 #x73)	; $(C%s(B
    (chinese-cns11643-1		#x25 #x41)	; $(G%A(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (ucs		. #x03C5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A5)
    (->titlecase	#x03A5)
    (greek-iso8859-7	#x75)	; -Fõ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON")
    (->ucs		. #x03C5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C5)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (japanese-jisx0208-1978	#x26 #x54)	; $B&T(B
    (chinese-gb2312		#x26 #x54)	; $A&T(B
    (japanese-jisx0208		#x26 #x54)	; $B&T(B
    (korean-ksc5601		#x25 #x74)	; $(C%t(B
    (chinese-cns11643-1		#x25 #x42)	; $(G%B(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (ucs		. #x03C6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (greek-iso8859-7	#x76)	; -Fö-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PHI")
    (->ucs		. #x03C6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C6)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (japanese-jisx0208-1978	#x26 #x55)	; $B&U(B
    (chinese-gb2312		#x26 #x55)	; $A&U(B
    (japanese-jisx0208		#x26 #x55)	; $B&U(B
    (korean-ksc5601		#x25 #x75)	; $(C%u(B
    (chinese-cns11643-1		#x25 #x43)	; $(G%C(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (ucs		. #x03C7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A7)
    (->titlecase	#x03A7)
    (greek-iso8859-7	#x77)	; -F÷-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER CHI")
    (->ucs		. #x03C7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C7)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (japanese-jisx0208-1978	#x26 #x56)	; $B&V(B
    (chinese-gb2312		#x26 #x56)	; $A&V(B
    (japanese-jisx0208		#x26 #x56)	; $B&V(B
    (korean-ksc5601		#x25 #x76)	; $(C%v(B
    (chinese-cns11643-1		#x25 #x44)	; $(G%D(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (ucs		. #x03C8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A8)
    (->titlecase	#x03A8)
    (greek-iso8859-7	#x78)	; -Fø-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PSI")
    (->ucs		. #x03C8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C8)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (japanese-jisx0208-1978	#x26 #x57)	; $B&W(B
    (chinese-gb2312		#x26 #x57)	; $A&W(B
    (japanese-jisx0208		#x26 #x57)	; $B&W(B
    (korean-ksc5601		#x25 #x77)	; $(C%w(B
    (chinese-cns11643-1		#x25 #x45)	; $(G%E(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (ucs		. #x03C9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A9)
    (->titlecase	#x03A9)
    (greek-iso8859-7	#x79)	; -Fù-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA")
    (->ucs		. #x03C9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03C9)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (japanese-jisx0208-1978	#x26 #x58)	; $B&X(B
    (chinese-gb2312		#x26 #x58)	; $A&X(B
    (japanese-jisx0208		#x26 #x58)	; $B&X(B
    (korean-ksc5601		#x25 #x78)	; $(C%x(B
    (chinese-cns11643-1		#x25 #x46)	; $(G%F(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (ucs		. #x03CA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03B9 #x0308)
    (mirrored		. nil)
    (->uppercase	#x03AA)
    (->titlecase	#x03AA)
    (greek-iso8859-7	#x7A)	; -Fú-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03CA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03CA)
    (mirrored		. nil)
    (->uppercase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (->titlecase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x75)	; $(D&u(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (ucs		. #x03CB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03C5 #x0308)
    (mirrored		. nil)
    (->uppercase	#x03AB)
    (->titlecase	#x03AB)
    (greek-iso8859-7	#x7B)	; -Fû-A
    ))
(define-char
  '((name	. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03CB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03CB)
    (mirrored		. nil)
    (->uppercase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (->titlecase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x7A)	; $(D&z(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (ucs		. #x03CC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03BF #x0301)
    (mirrored		. nil)
    (->uppercase	#x038C)
    (->titlecase	#x038C)
    (greek-iso8859-7	#x7C)	; -Fü-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")
    (->ucs		. #x03CC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03CC)
    (mirrored		. nil)
    (->uppercase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (->titlecase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	#x26 #x77)	; $(D&w(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (ucs		. #x03CD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03C5 #x0301)
    (mirrored		. nil)
    (->uppercase	#x038E)
    (->titlecase	#x038E)
    (greek-iso8859-7	#x7D)	; -Fý-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")
    (->ucs		. #x03CD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03CD)
    (mirrored		. nil)
    (->uppercase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (->titlecase
     ((name	. "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x79)	; $(D&y(B
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (ucs		. #x03CE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03C9 #x0301)
    (mirrored		. nil)
    (->uppercase	#x038F)
    (->titlecase	#x038F)
    (greek-iso8859-7	#x7E)	; -Fþ-A
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")
    (->ucs		. #x03CE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	wide #x03CE)
    (mirrored		. nil)
    (->uppercase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (->titlecase
     ((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	#x26 #x7C)	; $(D&|(B
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (ucs		. #x03D0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03B2)
    (mirrored		. nil)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (ucs		. #x03D1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03B8)
    (mirrored		. nil)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (ucs		. #x03D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03A5)
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (ucs		. #x03D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03D2 #x0301)
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (ucs		. #x03D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	#x03D2 #x0308)
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (ucs		. #x03D5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03C6)
    (mirrored		. nil)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (ucs		. #x03D6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03C0)
    (mirrored		. nil)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    ))
(define-char
  '((name		. "GREEK KAI SYMBOL")
    (ucs		. #x03D7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    ))
(define-char
  '((name		. "GREEK LETTER STIGMA")
    (ucs		. #x03DA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DB)
    ))
(define-char
  '((name		. "GREEK SMALL LETTER STIGMA")
    (ucs		. #x03DB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DA)
    (->titlecase	#x03DA)
    ))
(define-char
  '((name		. "GREEK LETTER DIGAMMA")
    (ucs		. #x03DC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DD)
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DIGAMMA")
    (ucs		. #x03DD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DC)
    (->titlecase	#x03DC)
    ))
(define-char
  '((name		. "GREEK LETTER KOPPA")
    (ucs		. #x03DE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DF)
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KOPPA")
    (ucs		. #x03DF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DE)
    (->titlecase	#x03DE)
    ))
(define-char
  '((name		. "GREEK LETTER SAMPI")
    (ucs		. #x03E0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E1)
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SAMPI")
    (ucs		. #x03E1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E0)
    (->titlecase	#x03E0)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHEI")
    (ucs		. #x03E2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E3)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHEI")
    (ucs		. #x03E3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E2)
    (->titlecase	#x03E2)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER FEI")
    (ucs		. #x03E4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E5)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER FEI")
    (ucs		. #x03E5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E4)
    (->titlecase	#x03E4)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER KHEI")
    (ucs		. #x03E6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E7)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER KHEI")
    (ucs		. #x03E7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E6)
    (->titlecase	#x03E6)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER HORI")
    (ucs		. #x03E8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E9)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER HORI")
    (ucs		. #x03E9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E8)
    (->titlecase	#x03E8)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER GANGIA")
    (ucs		. #x03EA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03EB)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER GANGIA")
    (ucs		. #x03EB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EA)
    (->titlecase	#x03EA)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHIMA")
    (ucs		. #x03EC)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03ED)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHIMA")
    (ucs		. #x03ED)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EC)
    (->titlecase	#x03EC)
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER DEI")
    (ucs		. #x03EE)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03EF)
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER DEI")
    (ucs		. #x03EF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EE)
    (->titlecase	#x03EE)
    ))
(define-char
  '((name		. "GREEK KAPPA SYMBOL")
    (ucs		. #x03F0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03BA)
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (ucs		. #x03F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03C1)
    (mirrored		. nil)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (ucs		. #x03F2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (->decomposition	compat #x03C2)
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    ))
(define-char
  '((name		. "GREEK LETTER YOT")
    (ucs		. #x03F3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    ))
