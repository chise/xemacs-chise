(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (ucs		. #x0374)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    (->decomposition	#x02B9)
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
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0345)
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (ucs		. #x037E)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    (->decomposition	#x003B)
    ))
(define-char
  '((name		. "GREEK TONOS")
    (ucs		. #x0384)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (greek-iso8859-7	#xB4)	; ΄
    ))
(define-char
  '((name		. "FULLWIDTH GREEK TONOS")
    (->ucs		. #x0384)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0384)
    (japanese-jisx0212	#x22 #x38)	; �����
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (ucs		. #x0385)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (greek-iso8859-7	#xB5)	; ΅
    ))
(define-char
  '((name		. "FULLWIDTH GREEK DIALYTIKA TONOS")
    (->ucs		. #x0385)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0385)
    (japanese-jisx0212	#x22 #x39)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (ucs		. #x0386)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->lowercase	#x03AC)
    (greek-iso8859-7	#xB6)	; Ά
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (->ucs		. #x0386)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0386)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	#x26 #x61)	; �����
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (ucs		. #x0387)
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00B7)
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (ucs		. #x0388)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0395 #x0301)
    (->lowercase	#x03AD)
    (greek-iso8859-7	#xB8)	; Έ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (->ucs		. #x0388)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0388)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x62)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (ucs		. #x0389)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->lowercase	#x03AE)
    (greek-iso8859-7	#xB9)	; Ή
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")
    (->ucs		. #x0389)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0389)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	#x26 #x63)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (ucs		. #x038A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->lowercase	#x03AF)
    (greek-iso8859-7	#xBA)	; Ί
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")
    (->ucs		. #x038A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038A)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	#x26 #x64)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (ucs		. #x038C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->lowercase	#x03CC)
    (greek-iso8859-7	#xBC)	; Ό
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (->ucs		. #x038C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038C)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	#x26 #x67)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (ucs		. #x038E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->lowercase	#x03CD)
    (greek-iso8859-7	#xBE)	; Ύ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (->ucs		. #x038E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038E)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x69)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (ucs		. #x038F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->lowercase	#x03CE)
    (greek-iso8859-7	#xBF)	; Ώ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (->ucs		. #x038F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038F)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	#x26 #x6C)	; �����
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (ucs		. #x0390)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (greek-iso8859-7	#xC0)	; ΐ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (->ucs		. #x0390)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0390)
    (japanese-jisx0212	#x26 #x76)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (ucs		. #x0391)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B1)
    (greek-iso8859-7	#xC1)	; Α
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA")
    (->ucs		. #x0391)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0391)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ALPHA")))
    (japanese-jisx0208-1978	#x26 #x21)	; �����
    (chinese-gb2312		#x26 #x21)	; �����
    (japanese-jisx0208		#x26 #x21)	; �����
    (korean-ksc5601		#x25 #x41)	; �����
    (chinese-cns11643-1		#x24 #x75)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (ucs		. #x0392)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B2)
    (greek-iso8859-7	#xC2)	; Β
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER BETA")
    (->ucs		. #x0392)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0392)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER BETA")))
    (japanese-jisx0208-1978	#x26 #x22)	; �����
    (chinese-gb2312		#x26 #x22)	; �����
    (japanese-jisx0208		#x26 #x22)	; �����
    (korean-ksc5601		#x25 #x42)	; �����
    (chinese-cns11643-1		#x24 #x76)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (ucs		. #x0393)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B3)
    (greek-iso8859-7	#xC3)	; Γ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER GAMMA")
    (->ucs		. #x0393)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0393)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER GAMMA")))
    (japanese-jisx0208-1978	#x26 #x23)	; �����
    (chinese-gb2312		#x26 #x23)	; �����
    (japanese-jisx0208		#x26 #x23)	; �����
    (korean-ksc5601		#x25 #x43)	; �����
    (chinese-cns11643-1		#x24 #x77)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (ucs		. #x0394)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B4)
    (greek-iso8859-7	#xC4)	; Δ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER DELTA")
    (->ucs		. #x0394)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0394)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER DELTA")))
    (japanese-jisx0208-1978	#x26 #x24)	; �����
    (chinese-gb2312		#x26 #x24)	; �����
    (japanese-jisx0208		#x26 #x24)	; �����
    (korean-ksc5601		#x25 #x44)	; �����
    (chinese-cns11643-1		#x24 #x78)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (ucs		. #x0395)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B5)
    (greek-iso8859-7	#xC5)	; Ε
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON")
    (->ucs		. #x0395)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0395)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER EPSILON")))
    (japanese-jisx0208-1978	#x26 #x25)	; �����
    (chinese-gb2312		#x26 #x25)	; �����
    (japanese-jisx0208		#x26 #x25)	; �����
    (korean-ksc5601		#x25 #x45)	; �����
    (chinese-cns11643-1		#x24 #x79)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (ucs		. #x0396)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B6)
    (greek-iso8859-7	#xC6)	; Ζ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ZETA")
    (->ucs		. #x0396)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0396)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ZETA")))
    (japanese-jisx0208-1978	#x26 #x26)	; �����
    (chinese-gb2312		#x26 #x26)	; �����
    (japanese-jisx0208		#x26 #x26)	; �����
    (korean-ksc5601		#x25 #x46)	; �����
    (chinese-cns11643-1		#x24 #x7A)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (ucs		. #x0397)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B7)
    (greek-iso8859-7	#xC7)	; Η
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA")
    (->ucs		. #x0397)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0397)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ETA")))
    (japanese-jisx0208-1978	#x26 #x27)	; �����
    (chinese-gb2312		#x26 #x27)	; �����
    (japanese-jisx0208		#x26 #x27)	; �����
    (korean-ksc5601		#x25 #x47)	; �����
    (chinese-cns11643-1		#x24 #x7B)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (ucs		. #x0398)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B8)
    (greek-iso8859-7	#xC8)	; Θ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER THETA")
    (->ucs		. #x0398)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0398)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER THETA")))
    (japanese-jisx0208-1978	#x26 #x28)	; �����
    (chinese-gb2312		#x26 #x28)	; �����
    (japanese-jisx0208		#x26 #x28)	; �����
    (korean-ksc5601		#x25 #x48)	; �����
    (chinese-cns11643-1		#x24 #x7C)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (ucs		. #x0399)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B9)
    (greek-iso8859-7	#xC9)	; Ι
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA")
    (->ucs		. #x0399)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0399)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA")))
    (japanese-jisx0208-1978	#x26 #x29)	; �����
    (chinese-gb2312		#x26 #x29)	; �����
    (japanese-jisx0208		#x26 #x29)	; �����
    (korean-ksc5601		#x25 #x49)	; �����
    (chinese-cns11643-1		#x24 #x7D)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (ucs		. #x039A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BA)
    (greek-iso8859-7	#xCA)	; Κ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER KAPPA")
    (->ucs		. #x039A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039A)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER KAPPA")))
    (japanese-jisx0208-1978	#x26 #x2A)	; �����
    (chinese-gb2312		#x26 #x2A)	; �����
    (japanese-jisx0208		#x26 #x2A)	; �����
    (korean-ksc5601		#x25 #x4A)	; �����
    (chinese-cns11643-1		#x24 #x7E)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (ucs		. #x039B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BB)
    (greek-iso8859-7	#xCB)	; Λ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER LAMDA")
    (->ucs		. #x039B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039B)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER LAMDA")))
    (japanese-jisx0208-1978	#x26 #x2B)	; �����
    (chinese-gb2312		#x26 #x2B)	; �����
    (japanese-jisx0208		#x26 #x2B)	; �����
    (korean-ksc5601		#x25 #x4B)	; �����
    (chinese-cns11643-1		#x25 #x21)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (ucs		. #x039C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BC)
    (greek-iso8859-7	#xCC)	; Μ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER MU")
    (->ucs		. #x039C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039C)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER MU")))
    (japanese-jisx0208-1978	#x26 #x2C)	; �����
    (chinese-gb2312		#x26 #x2C)	; �����
    (japanese-jisx0208		#x26 #x2C)	; �����
    (korean-ksc5601		#x25 #x4C)	; �����
    (chinese-cns11643-1		#x25 #x22)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (ucs		. #x039D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BD)
    (greek-iso8859-7	#xCD)	; Ν
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER NU")
    (->ucs		. #x039D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039D)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER NU")))
    (japanese-jisx0208-1978	#x26 #x2D)	; �����
    (chinese-gb2312		#x26 #x2D)	; �����
    (japanese-jisx0208		#x26 #x2D)	; �����
    (korean-ksc5601		#x25 #x4D)	; �����
    (chinese-cns11643-1		#x25 #x23)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (ucs		. #x039E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BE)
    (greek-iso8859-7	#xCE)	; Ξ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER XI")
    (->ucs		. #x039E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039E)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER XI")))
    (japanese-jisx0208-1978	#x26 #x2E)	; �����
    (chinese-gb2312		#x26 #x2E)	; �����
    (japanese-jisx0208		#x26 #x2E)	; �����
    (korean-ksc5601		#x25 #x4E)	; �����
    (chinese-cns11643-1		#x25 #x24)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (ucs		. #x039F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BF)
    (greek-iso8859-7	#xCF)	; Ο
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON")
    (->ucs		. #x039F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039F)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMICRON")))
    (japanese-jisx0208-1978	#x26 #x2F)	; �����
    (chinese-gb2312		#x26 #x2F)	; �����
    (japanese-jisx0208		#x26 #x2F)	; �����
    (korean-ksc5601		#x25 #x4F)	; �����
    (chinese-cns11643-1		#x25 #x25)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (ucs		. #x03A0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C0)
    (greek-iso8859-7	#xD0)	; Π
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PI")
    (->ucs		. #x03A0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A0)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PI")))
    (japanese-jisx0208-1978	#x26 #x30)	; �����
    (chinese-gb2312		#x26 #x30)	; �����
    (japanese-jisx0208		#x26 #x30)	; �����
    (korean-ksc5601		#x25 #x50)	; �����
    (chinese-cns11643-1		#x25 #x26)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (ucs		. #x03A1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C1)
    (greek-iso8859-7	#xD1)	; Ρ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER RHO")
    (->ucs		. #x03A1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A1)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER RHO")))
    (japanese-jisx0208-1978	#x26 #x31)	; �����
    (chinese-gb2312		#x26 #x31)	; �����
    (japanese-jisx0208		#x26 #x31)	; �����
    (korean-ksc5601		#x25 #x51)	; �����
    (chinese-cns11643-1		#x25 #x27)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (ucs		. #x03A3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C3)
    (greek-iso8859-7	#xD3)	; Σ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER SIGMA")
    (->ucs		. #x03A3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A3)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER SIGMA")))
    (japanese-jisx0208-1978	#x26 #x32)	; �����
    (chinese-gb2312		#x26 #x32)	; �����
    (japanese-jisx0208		#x26 #x32)	; �����
    (korean-ksc5601		#x25 #x52)	; �����
    (chinese-cns11643-1		#x25 #x28)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (ucs		. #x03A4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C4)
    (greek-iso8859-7	#xD4)	; Τ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER TAU")
    (->ucs		. #x03A4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A4)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER TAU")))
    (japanese-jisx0208-1978	#x26 #x33)	; �����
    (chinese-gb2312		#x26 #x33)	; �����
    (japanese-jisx0208		#x26 #x33)	; �����
    (korean-ksc5601		#x25 #x53)	; �����
    (chinese-cns11643-1		#x25 #x29)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (ucs		. #x03A5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C5)
    (greek-iso8859-7	#xD5)	; Υ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON")
    (->ucs		. #x03A5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A5)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON")))
    (japanese-jisx0208-1978	#x26 #x34)	; �����
    (chinese-gb2312		#x26 #x34)	; �����
    (japanese-jisx0208		#x26 #x34)	; �����
    (korean-ksc5601		#x25 #x54)	; �����
    (chinese-cns11643-1		#x25 #x2A)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (ucs		. #x03A6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C6)
    (greek-iso8859-7	#xD6)	; Φ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PHI")
    (->ucs		. #x03A6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A6)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PHI")))
    (japanese-jisx0208-1978	#x26 #x35)	; �����
    (chinese-gb2312		#x26 #x35)	; �����
    (japanese-jisx0208		#x26 #x35)	; �����
    (korean-ksc5601		#x25 #x55)	; �����
    (chinese-cns11643-1		#x25 #x2B)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (ucs		. #x03A7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C7)
    (greek-iso8859-7	#xD7)	; Χ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER CHI")
    (->ucs		. #x03A7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A7)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER CHI")))
    (japanese-jisx0208-1978	#x26 #x36)	; �����
    (chinese-gb2312		#x26 #x36)	; �����
    (japanese-jisx0208		#x26 #x36)	; �����
    (korean-ksc5601		#x25 #x56)	; �����
    (chinese-cns11643-1		#x25 #x2C)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (ucs		. #x03A8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C8)
    (greek-iso8859-7	#xD8)	; Ψ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PSI")
    (->ucs		. #x03A8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A8)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PSI")))
    (japanese-jisx0208-1978	#x26 #x37)	; �����
    (chinese-gb2312		#x26 #x37)	; �����
    (japanese-jisx0208		#x26 #x37)	; �����
    (korean-ksc5601		#x25 #x57)	; �����
    (chinese-cns11643-1		#x25 #x2D)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (ucs		. #x03A9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C9)
    (greek-iso8859-7	#xD9)	; Ω
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA")
    (->ucs		. #x03A9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A9)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMEGA")))
    (japanese-jisx0208-1978	#x26 #x38)	; �����
    (chinese-gb2312		#x26 #x38)	; �����
    (japanese-jisx0208		#x26 #x38)	; �����
    (korean-ksc5601		#x25 #x58)	; �����
    (chinese-cns11643-1		#x25 #x2E)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (ucs		. #x03AA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->lowercase	#x03CA)
    (greek-iso8859-7	#xDA)	; Ϊ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03AA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AA)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x65)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (ucs		. #x03AB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->lowercase	#x03CB)
    (greek-iso8859-7	#xDB)	; Ϋ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03AB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AB)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x6A)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (ucs		. #x03AC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->uppercase	#x0386)
    (->titlecase	#x0386)
    (greek-iso8859-7	#xDC)	; ά
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")
    (->ucs		. #x03AC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	#x26 #x71)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (ucs		. #x03AD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->uppercase	#x0388)
    (->titlecase	#x0388)
    (greek-iso8859-7	#xDD)	; έ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")
    (->ucs		. #x03AD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x72)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (ucs		. #x03AE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->uppercase	#x0389)
    (->titlecase	#x0389)
    (greek-iso8859-7	#xDE)	; ή
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")
    (->ucs		. #x03AE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	#x26 #x73)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (ucs		. #x03AF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->uppercase	#x038A)
    (->titlecase	#x038A)
    (greek-iso8859-7	#xDF)	; ί
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")
    (->ucs		. #x03AF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AF)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	#x26 #x74)	; �����
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (ucs		. #x03B0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (greek-iso8859-7	#xE0)	; ΰ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (->ucs		. #x03B0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B0)
    (japanese-jisx0212	#x26 #x7B)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (ucs		. #x03B1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0391)
    (->titlecase	#x0391)
    (greek-iso8859-7	#xE1)	; α
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA")
    (->ucs		. #x03B1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B1)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (japanese-jisx0208-1978	#x26 #x41)	; �����
    (chinese-gb2312		#x26 #x41)	; �����
    (japanese-jisx0208		#x26 #x41)	; �����
    (korean-ksc5601		#x25 #x61)	; �����
    (chinese-cns11643-1		#x25 #x2F)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (ucs		. #x03B2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (greek-iso8859-7	#xE2)	; β
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER BETA")
    (->ucs		. #x03B2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B2)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (japanese-jisx0208-1978	#x26 #x42)	; �����
    (chinese-gb2312		#x26 #x42)	; �����
    (japanese-jisx0208		#x26 #x42)	; �����
    (korean-ksc5601		#x25 #x62)	; �����
    (chinese-cns11643-1		#x25 #x30)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (ucs		. #x03B3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0393)
    (->titlecase	#x0393)
    (greek-iso8859-7	#xE3)	; γ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER GAMMA")
    (->ucs		. #x03B3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B3)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (japanese-jisx0208-1978	#x26 #x43)	; �����
    (chinese-gb2312		#x26 #x43)	; �����
    (japanese-jisx0208		#x26 #x43)	; �����
    (korean-ksc5601		#x25 #x63)	; �����
    (chinese-cns11643-1		#x25 #x31)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (ucs		. #x03B4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0394)
    (->titlecase	#x0394)
    (greek-iso8859-7	#xE4)	; δ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER DELTA")
    (->ucs		. #x03B4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B4)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (japanese-jisx0208-1978	#x26 #x44)	; �����
    (chinese-gb2312		#x26 #x44)	; �����
    (japanese-jisx0208		#x26 #x44)	; �����
    (korean-ksc5601		#x25 #x64)	; �����
    (chinese-cns11643-1		#x25 #x32)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (ucs		. #x03B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0395)
    (->titlecase	#x0395)
    (greek-iso8859-7	#xE5)	; ε
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON")
    (->ucs		. #x03B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B5)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (japanese-jisx0208-1978	#x26 #x45)	; �����
    (chinese-gb2312		#x26 #x45)	; �����
    (japanese-jisx0208		#x26 #x45)	; �����
    (korean-ksc5601		#x25 #x65)	; �����
    (chinese-cns11643-1		#x25 #x33)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (ucs		. #x03B6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0396)
    (->titlecase	#x0396)
    (greek-iso8859-7	#xE6)	; ζ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ZETA")
    (->ucs		. #x03B6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B6)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (japanese-jisx0208-1978	#x26 #x46)	; �����
    (chinese-gb2312		#x26 #x46)	; �����
    (japanese-jisx0208		#x26 #x46)	; �����
    (korean-ksc5601		#x25 #x66)	; �����
    (chinese-cns11643-1		#x25 #x34)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (ucs		. #x03B7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0397)
    (->titlecase	#x0397)
    (greek-iso8859-7	#xE7)	; η
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA")
    (->ucs		. #x03B7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B7)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (japanese-jisx0208-1978	#x26 #x47)	; �����
    (chinese-gb2312		#x26 #x47)	; �����
    (japanese-jisx0208		#x26 #x47)	; �����
    (korean-ksc5601		#x25 #x67)	; �����
    (chinese-cns11643-1		#x25 #x35)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (ucs		. #x03B8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (greek-iso8859-7	#xE8)	; θ
    (ipa		#xC8)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER THETA")
    (->ucs		. #x03B8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B8)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (japanese-jisx0208-1978	#x26 #x48)	; �����
    (chinese-gb2312		#x26 #x48)	; �����
    (japanese-jisx0208		#x26 #x48)	; �����
    (korean-ksc5601		#x25 #x68)	; �����
    (chinese-cns11643-1		#x25 #x36)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (ucs		. #x03B9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0399)
    (->titlecase	#x0399)
    (greek-iso8859-7	#xE9)	; ι
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA")
    (->ucs		. #x03B9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B9)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (japanese-jisx0208-1978	#x26 #x49)	; �����
    (chinese-gb2312		#x26 #x49)	; �����
    (japanese-jisx0208		#x26 #x49)	; �����
    (korean-ksc5601		#x25 #x69)	; �����
    (chinese-cns11643-1		#x25 #x37)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (ucs		. #x03BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (greek-iso8859-7	#xEA)	; κ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER KAPPA")
    (->ucs		. #x03BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BA)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (japanese-jisx0208-1978	#x26 #x4A)	; �����
    (chinese-gb2312		#x26 #x4A)	; �����
    (japanese-jisx0208		#x26 #x4A)	; �����
    (korean-ksc5601		#x25 #x6A)	; �����
    (chinese-cns11643-1		#x25 #x38)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (ucs		. #x03BB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039B)
    (->titlecase	#x039B)
    (greek-iso8859-7	#xEB)	; λ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER LAMDA")
    (->ucs		. #x03BB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BB)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (japanese-jisx0208-1978	#x26 #x4B)	; �����
    (chinese-gb2312		#x26 #x4B)	; �����
    (japanese-jisx0208		#x26 #x4B)	; �����
    (korean-ksc5601		#x25 #x6B)	; �����
    (chinese-cns11643-1		#x25 #x39)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (ucs		. #x03BC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (greek-iso8859-7	#xEC)	; μ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER MU")
    (->ucs		. #x03BC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (japanese-jisx0208-1978	#x26 #x4C)	; �����
    (chinese-gb2312		#x26 #x4C)	; �����
    (japanese-jisx0208		#x26 #x4C)	; �����
    (korean-ksc5601		#x25 #x6C)	; �����
    (chinese-cns11643-1		#x25 #x3A)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (ucs		. #x03BD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039D)
    (->titlecase	#x039D)
    (greek-iso8859-7	#xED)	; ν
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER NU")
    (->ucs		. #x03BD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (japanese-jisx0208-1978	#x26 #x4D)	; �����
    (chinese-gb2312		#x26 #x4D)	; �����
    (japanese-jisx0208		#x26 #x4D)	; �����
    (korean-ksc5601		#x25 #x6D)	; �����
    (chinese-cns11643-1		#x25 #x3B)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (ucs		. #x03BE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039E)
    (->titlecase	#x039E)
    (greek-iso8859-7	#xEE)	; ξ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER XI")
    (->ucs		. #x03BE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (japanese-jisx0208-1978	#x26 #x4E)	; �����
    (chinese-gb2312		#x26 #x4E)	; �����
    (japanese-jisx0208		#x26 #x4E)	; �����
    (korean-ksc5601		#x25 #x6E)	; �����
    (chinese-cns11643-1		#x25 #x3C)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (ucs		. #x03BF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039F)
    (->titlecase	#x039F)
    (greek-iso8859-7	#xEF)	; ο
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON")
    (->ucs		. #x03BF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BF)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (japanese-jisx0208-1978	#x26 #x4F)	; �����
    (chinese-gb2312		#x26 #x4F)	; �����
    (japanese-jisx0208		#x26 #x4F)	; �����
    (korean-ksc5601		#x25 #x6F)	; �����
    (chinese-cns11643-1		#x25 #x3D)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (ucs		. #x03C0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (greek-iso8859-7	#xF0)	; π
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PI")
    (->ucs		. #x03C0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C0)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (japanese-jisx0208-1978	#x26 #x50)	; �����
    (chinese-gb2312		#x26 #x50)	; �����
    (japanese-jisx0208		#x26 #x50)	; �����
    (korean-ksc5601		#x25 #x70)	; �����
    (chinese-cns11643-1		#x25 #x3E)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (ucs		. #x03C1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (greek-iso8859-7	#xF1)	; ρ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER RHO")
    (->ucs		. #x03C1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C1)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (japanese-jisx0208-1978	#x26 #x51)	; �����
    (chinese-gb2312		#x26 #x51)	; �����
    (japanese-jisx0208		#x26 #x51)	; �����
    (korean-ksc5601		#x25 #x71)	; �����
    (chinese-cns11643-1		#x25 #x3F)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (ucs		. #x03C2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7		#xF2)	; ς
    (japanese-jisx0213-1	#x26 #x59)	; ς
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER FINAL SIGMA")
    (->ucs		. #x03C2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C2)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (japanese-jisx0212	#x26 #x78)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (ucs		. #x03C3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7	#xF3)	; σ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER SIGMA")
    (->ucs		. #x03C3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C3)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (japanese-jisx0208-1978	#x26 #x52)	; �����
    (chinese-gb2312		#x26 #x52)	; �����
    (japanese-jisx0208		#x26 #x52)	; �����
    (korean-ksc5601		#x25 #x72)	; �����
    (chinese-cns11643-1		#x25 #x40)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (ucs		. #x03C4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A4)
    (->titlecase	#x03A4)
    (greek-iso8859-7	#xF4)	; τ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER TAU")
    (->ucs		. #x03C4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C4)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (japanese-jisx0208-1978	#x26 #x53)	; �����
    (chinese-gb2312		#x26 #x53)	; �����
    (japanese-jisx0208		#x26 #x53)	; �����
    (korean-ksc5601		#x25 #x73)	; �����
    (chinese-cns11643-1		#x25 #x41)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (ucs		. #x03C5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A5)
    (->titlecase	#x03A5)
    (greek-iso8859-7	#xF5)	; υ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON")
    (->ucs		. #x03C5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C5)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (japanese-jisx0208-1978	#x26 #x54)	; �����
    (chinese-gb2312		#x26 #x54)	; �����
    (japanese-jisx0208		#x26 #x54)	; �����
    (korean-ksc5601		#x25 #x74)	; �����
    (chinese-cns11643-1		#x25 #x42)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (ucs		. #x03C6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (greek-iso8859-7	#xF6)	; φ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PHI")
    (->ucs		. #x03C6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C6)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (japanese-jisx0208-1978	#x26 #x55)	; �����
    (chinese-gb2312		#x26 #x55)	; �����
    (japanese-jisx0208		#x26 #x55)	; �����
    (korean-ksc5601		#x25 #x75)	; �����
    (chinese-cns11643-1		#x25 #x43)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (ucs		. #x03C7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A7)
    (->titlecase	#x03A7)
    (greek-iso8859-7	#xF7)	; χ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER CHI")
    (->ucs		. #x03C7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C7)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (japanese-jisx0208-1978	#x26 #x56)	; �����
    (chinese-gb2312		#x26 #x56)	; �����
    (japanese-jisx0208		#x26 #x56)	; �����
    (korean-ksc5601		#x25 #x76)	; �����
    (chinese-cns11643-1		#x25 #x44)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (ucs		. #x03C8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A8)
    (->titlecase	#x03A8)
    (greek-iso8859-7	#xF8)	; ψ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PSI")
    (->ucs		. #x03C8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C8)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (japanese-jisx0208-1978	#x26 #x57)	; �����
    (chinese-gb2312		#x26 #x57)	; �����
    (japanese-jisx0208		#x26 #x57)	; �����
    (korean-ksc5601		#x25 #x77)	; �����
    (chinese-cns11643-1		#x25 #x45)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (ucs		. #x03C9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A9)
    (->titlecase	#x03A9)
    (greek-iso8859-7	#xF9)	; ω
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA")
    (->ucs		. #x03C9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C9)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (japanese-jisx0208-1978	#x26 #x58)	; �����
    (chinese-gb2312		#x26 #x58)	; �����
    (japanese-jisx0208		#x26 #x58)	; �����
    (korean-ksc5601		#x25 #x78)	; �����
    (chinese-cns11643-1		#x25 #x46)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (ucs		. #x03CA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->uppercase	#x03AA)
    (->titlecase	#x03AA)
    (greek-iso8859-7	#xFA)	; ϊ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03CA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CA)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x75)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (ucs		. #x03CB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->uppercase	#x03AB)
    (->titlecase	#x03AB)
    (greek-iso8859-7	#xFB)	; ϋ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03CB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CB)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	#x26 #x7A)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (ucs		. #x03CC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->uppercase	#x038C)
    (->titlecase	#x038C)
    (greek-iso8859-7	#xFC)	; ό
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")
    (->ucs		. #x03CC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	#x26 #x77)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (ucs		. #x03CD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->uppercase	#x038E)
    (->titlecase	#x038E)
    (greek-iso8859-7	#xFD)	; ύ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")
    (->ucs		. #x03CD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	#x26 #x79)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (ucs		. #x03CE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->uppercase	#x038F)
    (->titlecase	#x038F)
    (greek-iso8859-7	#xFE)	; ώ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")
    (->ucs		. #x03CE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	#x26 #x7C)	; �����
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (ucs		. #x03D0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B2)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (ucs		. #x03D1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B8)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (ucs		. #x03D2)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03A5)
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (ucs		. #x03D3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0301)
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (ucs		. #x03D4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0308)
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (ucs		. #x03D5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C6)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (ucs		. #x03D6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C0)
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
    (mirrored		. nil)
    (->decomposition	compat #x03BA)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (ucs		. #x03F1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C1)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (ucs		. #x03F2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C2)
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
