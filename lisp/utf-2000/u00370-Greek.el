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
    (greek-iso8859-7	#xB4)	; Î„
    ))
(define-char
  '((name		. "FULLWIDTH GREEK TONOS")
    (->ucs		. #x0384)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0384)
    (japanese-jisx0212	#x22 #x38)	; ø»Š¦…
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (ucs		. #x0385)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (greek-iso8859-7	#xB5)	; Î…
    ))
(define-char
  '((name		. "FULLWIDTH GREEK DIALYTIKA TONOS")
    (->ucs		. #x0385)
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0385)
    (japanese-jisx0212	#x22 #x39)	; ø»Š¦†
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (ucs		. #x0386)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->lowercase	#x03AC)
    (greek-iso8859-7	#xB6)	; Î†
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
    (japanese-jisx0212	#x26 #x61)	; ø»Š¬¦
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
    (greek-iso8859-7	#xB8)	; Îˆ
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
    (japanese-jisx0212	#x26 #x62)	; ø»Š¬§
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (ucs		. #x0389)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->lowercase	#x03AE)
    (greek-iso8859-7	#xB9)	; Î‰
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
    (japanese-jisx0212	#x26 #x63)	; ø»Š¬¨
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (ucs		. #x038A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->lowercase	#x03AF)
    (greek-iso8859-7	#xBA)	; ÎŠ
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
    (japanese-jisx0212	#x26 #x64)	; ø»Š¬©
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (ucs		. #x038C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->lowercase	#x03CC)
    (greek-iso8859-7	#xBC)	; ÎŒ
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
    (japanese-jisx0212	#x26 #x67)	; ø»Š¬¬
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (ucs		. #x038E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->lowercase	#x03CD)
    (greek-iso8859-7	#xBE)	; ÎŽ
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
    (japanese-jisx0212	#x26 #x69)	; ø»Š¬®
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (ucs		. #x038F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->lowercase	#x03CE)
    (greek-iso8859-7	#xBF)	; Î
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
    (japanese-jisx0212	#x26 #x6C)	; ø»Š¬±
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (ucs		. #x0390)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (greek-iso8859-7	#xC0)	; Î
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (->ucs		. #x0390)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0390)
    (japanese-jisx0212	#x26 #x76)	; ø»Š¬»
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (ucs		. #x0391)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B1)
    (greek-iso8859-7	#xC1)	; Î‘
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
    (japanese-jisx0208-1978	#x26 #x21)	; ø»‚ƒ–
    (chinese-gb2312		#x26 #x21)	; ø»„š
    (japanese-jisx0208		#x26 #x21)	; ø»†—ž
    (korean-ksc5601		#x25 #x41)	; ø»ˆ ¤
    (chinese-cns11643-1		#x24 #x75)	; ø»‘ˆŠ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (ucs		. #x0392)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B2)
    (greek-iso8859-7	#xC2)	; Î’
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
    (japanese-jisx0208-1978	#x26 #x22)	; ø»‚ƒ—
    (chinese-gb2312		#x26 #x22)	; ø»„›
    (japanese-jisx0208		#x26 #x22)	; ø»†—Ÿ
    (korean-ksc5601		#x25 #x42)	; ø»ˆ ¥
    (chinese-cns11643-1		#x24 #x76)	; ø»‘ˆ‹
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (ucs		. #x0393)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B3)
    (greek-iso8859-7	#xC3)	; Î“
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
    (japanese-jisx0208-1978	#x26 #x23)	; ø»‚ƒ˜
    (chinese-gb2312		#x26 #x23)	; ø»„œ
    (japanese-jisx0208		#x26 #x23)	; ø»†— 
    (korean-ksc5601		#x25 #x43)	; ø»ˆ ¦
    (chinese-cns11643-1		#x24 #x77)	; ø»‘ˆŒ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (ucs		. #x0394)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B4)
    (greek-iso8859-7	#xC4)	; Î”
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
    (japanese-jisx0208-1978	#x26 #x24)	; ø»‚ƒ™
    (chinese-gb2312		#x26 #x24)	; ø»„
    (japanese-jisx0208		#x26 #x24)	; ø»†—¡
    (korean-ksc5601		#x25 #x44)	; ø»ˆ §
    (chinese-cns11643-1		#x24 #x78)	; ø»‘ˆ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (ucs		. #x0395)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B5)
    (greek-iso8859-7	#xC5)	; Î•
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
    (japanese-jisx0208-1978	#x26 #x25)	; ø»‚ƒš
    (chinese-gb2312		#x26 #x25)	; ø»„ž
    (japanese-jisx0208		#x26 #x25)	; ø»†—¢
    (korean-ksc5601		#x25 #x45)	; ø»ˆ ¨
    (chinese-cns11643-1		#x24 #x79)	; ø»‘ˆŽ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (ucs		. #x0396)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B6)
    (greek-iso8859-7	#xC6)	; Î–
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
    (japanese-jisx0208-1978	#x26 #x26)	; ø»‚ƒ›
    (chinese-gb2312		#x26 #x26)	; ø»„Ÿ
    (japanese-jisx0208		#x26 #x26)	; ø»†—£
    (korean-ksc5601		#x25 #x46)	; ø»ˆ ©
    (chinese-cns11643-1		#x24 #x7A)	; ø»‘ˆ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (ucs		. #x0397)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B7)
    (greek-iso8859-7	#xC7)	; Î—
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
    (japanese-jisx0208-1978	#x26 #x27)	; ø»‚ƒœ
    (chinese-gb2312		#x26 #x27)	; ø»„ 
    (japanese-jisx0208		#x26 #x27)	; ø»†—¤
    (korean-ksc5601		#x25 #x47)	; ø»ˆ ª
    (chinese-cns11643-1		#x24 #x7B)	; ø»‘ˆ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (ucs		. #x0398)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B8)
    (greek-iso8859-7	#xC8)	; Î˜
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
    (japanese-jisx0208-1978	#x26 #x28)	; ø»‚ƒ
    (chinese-gb2312		#x26 #x28)	; ø»„¡
    (japanese-jisx0208		#x26 #x28)	; ø»†—¥
    (korean-ksc5601		#x25 #x48)	; ø»ˆ «
    (chinese-cns11643-1		#x24 #x7C)	; ø»‘ˆ‘
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (ucs		. #x0399)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B9)
    (greek-iso8859-7	#xC9)	; Î™
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
    (japanese-jisx0208-1978	#x26 #x29)	; ø»‚ƒž
    (chinese-gb2312		#x26 #x29)	; ø»„¢
    (japanese-jisx0208		#x26 #x29)	; ø»†—¦
    (korean-ksc5601		#x25 #x49)	; ø»ˆ ¬
    (chinese-cns11643-1		#x24 #x7D)	; ø»‘ˆ’
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (ucs		. #x039A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BA)
    (greek-iso8859-7	#xCA)	; Îš
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
    (japanese-jisx0208-1978	#x26 #x2A)	; ø»‚ƒŸ
    (chinese-gb2312		#x26 #x2A)	; ø»„£
    (japanese-jisx0208		#x26 #x2A)	; ø»†—§
    (korean-ksc5601		#x25 #x4A)	; ø»ˆ ­
    (chinese-cns11643-1		#x24 #x7E)	; ø»‘ˆ“
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (ucs		. #x039B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BB)
    (greek-iso8859-7	#xCB)	; Î›
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
    (japanese-jisx0208-1978	#x26 #x2B)	; ø»‚ƒ 
    (chinese-gb2312		#x26 #x2B)	; ø»„¤
    (japanese-jisx0208		#x26 #x2B)	; ø»†—¨
    (korean-ksc5601		#x25 #x4B)	; ø»ˆ ®
    (chinese-cns11643-1		#x25 #x21)	; ø»‘ˆ”
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (ucs		. #x039C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BC)
    (greek-iso8859-7	#xCC)	; Îœ
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
    (japanese-jisx0208-1978	#x26 #x2C)	; ø»‚ƒ¡
    (chinese-gb2312		#x26 #x2C)	; ø»„¥
    (japanese-jisx0208		#x26 #x2C)	; ø»†—©
    (korean-ksc5601		#x25 #x4C)	; ø»ˆ ¯
    (chinese-cns11643-1		#x25 #x22)	; ø»‘ˆ•
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (ucs		. #x039D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BD)
    (greek-iso8859-7	#xCD)	; Î
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
    (japanese-jisx0208-1978	#x26 #x2D)	; ø»‚ƒ¢
    (chinese-gb2312		#x26 #x2D)	; ø»„¦
    (japanese-jisx0208		#x26 #x2D)	; ø»†—ª
    (korean-ksc5601		#x25 #x4D)	; ø»ˆ °
    (chinese-cns11643-1		#x25 #x23)	; ø»‘ˆ–
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (ucs		. #x039E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BE)
    (greek-iso8859-7	#xCE)	; Îž
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
    (japanese-jisx0208-1978	#x26 #x2E)	; ø»‚ƒ£
    (chinese-gb2312		#x26 #x2E)	; ø»„§
    (japanese-jisx0208		#x26 #x2E)	; ø»†—«
    (korean-ksc5601		#x25 #x4E)	; ø»ˆ ±
    (chinese-cns11643-1		#x25 #x24)	; ø»‘ˆ—
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (ucs		. #x039F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BF)
    (greek-iso8859-7	#xCF)	; ÎŸ
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
    (japanese-jisx0208-1978	#x26 #x2F)	; ø»‚ƒ¤
    (chinese-gb2312		#x26 #x2F)	; ø»„¨
    (japanese-jisx0208		#x26 #x2F)	; ø»†—¬
    (korean-ksc5601		#x25 #x4F)	; ø»ˆ ²
    (chinese-cns11643-1		#x25 #x25)	; ø»‘ˆ˜
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (ucs		. #x03A0)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C0)
    (greek-iso8859-7	#xD0)	; Î 
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
    (japanese-jisx0208-1978	#x26 #x30)	; ø»‚ƒ¥
    (chinese-gb2312		#x26 #x30)	; ø»„©
    (japanese-jisx0208		#x26 #x30)	; ø»†—­
    (korean-ksc5601		#x25 #x50)	; ø»ˆ ³
    (chinese-cns11643-1		#x25 #x26)	; ø»‘ˆ™
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (ucs		. #x03A1)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C1)
    (greek-iso8859-7	#xD1)	; Î¡
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
    (japanese-jisx0208-1978	#x26 #x31)	; ø»‚ƒ¦
    (chinese-gb2312		#x26 #x31)	; ø»„ª
    (japanese-jisx0208		#x26 #x31)	; ø»†—®
    (korean-ksc5601		#x25 #x51)	; ø»ˆ ´
    (chinese-cns11643-1		#x25 #x27)	; ø»‘ˆš
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (ucs		. #x03A3)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C3)
    (greek-iso8859-7	#xD3)	; Î£
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
    (japanese-jisx0208-1978	#x26 #x32)	; ø»‚ƒ§
    (chinese-gb2312		#x26 #x32)	; ø»„«
    (japanese-jisx0208		#x26 #x32)	; ø»†—¯
    (korean-ksc5601		#x25 #x52)	; ø»ˆ µ
    (chinese-cns11643-1		#x25 #x28)	; ø»‘ˆ›
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (ucs		. #x03A4)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C4)
    (greek-iso8859-7	#xD4)	; Î¤
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
    (japanese-jisx0208-1978	#x26 #x33)	; ø»‚ƒ¨
    (chinese-gb2312		#x26 #x33)	; ø»„¬
    (japanese-jisx0208		#x26 #x33)	; ø»†—°
    (korean-ksc5601		#x25 #x53)	; ø»ˆ ¶
    (chinese-cns11643-1		#x25 #x29)	; ø»‘ˆœ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (ucs		. #x03A5)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C5)
    (greek-iso8859-7	#xD5)	; Î¥
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
    (japanese-jisx0208-1978	#x26 #x34)	; ø»‚ƒ©
    (chinese-gb2312		#x26 #x34)	; ø»„­
    (japanese-jisx0208		#x26 #x34)	; ø»†—±
    (korean-ksc5601		#x25 #x54)	; ø»ˆ ·
    (chinese-cns11643-1		#x25 #x2A)	; ø»‘ˆ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (ucs		. #x03A6)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C6)
    (greek-iso8859-7	#xD6)	; Î¦
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
    (japanese-jisx0208-1978	#x26 #x35)	; ø»‚ƒª
    (chinese-gb2312		#x26 #x35)	; ø»„®
    (japanese-jisx0208		#x26 #x35)	; ø»†—²
    (korean-ksc5601		#x25 #x55)	; ø»ˆ ¸
    (chinese-cns11643-1		#x25 #x2B)	; ø»‘ˆž
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (ucs		. #x03A7)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C7)
    (greek-iso8859-7	#xD7)	; Î§
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
    (japanese-jisx0208-1978	#x26 #x36)	; ø»‚ƒ«
    (chinese-gb2312		#x26 #x36)	; ø»„¯
    (japanese-jisx0208		#x26 #x36)	; ø»†—³
    (korean-ksc5601		#x25 #x56)	; ø»ˆ ¹
    (chinese-cns11643-1		#x25 #x2C)	; ø»‘ˆŸ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (ucs		. #x03A8)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C8)
    (greek-iso8859-7	#xD8)	; Î¨
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
    (japanese-jisx0208-1978	#x26 #x37)	; ø»‚ƒ¬
    (chinese-gb2312		#x26 #x37)	; ø»„°
    (japanese-jisx0208		#x26 #x37)	; ø»†—´
    (korean-ksc5601		#x25 #x57)	; ø»ˆ º
    (chinese-cns11643-1		#x25 #x2D)	; ø»‘ˆ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (ucs		. #x03A9)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C9)
    (greek-iso8859-7	#xD9)	; Î©
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
    (japanese-jisx0208-1978	#x26 #x38)	; ø»‚ƒ­
    (chinese-gb2312		#x26 #x38)	; ø»„±
    (japanese-jisx0208		#x26 #x38)	; ø»†—µ
    (korean-ksc5601		#x25 #x58)	; ø»ˆ »
    (chinese-cns11643-1		#x25 #x2E)	; ø»‘ˆ¡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (ucs		. #x03AA)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->lowercase	#x03CA)
    (greek-iso8859-7	#xDA)	; Îª
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
    (japanese-jisx0212	#x26 #x65)	; ø»Š¬ª
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (ucs		. #x03AB)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->lowercase	#x03CB)
    (greek-iso8859-7	#xDB)	; Î«
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
    (japanese-jisx0212	#x26 #x6A)	; ø»Š¬¯
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
    (greek-iso8859-7	#xDC)	; Î¬
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
    (japanese-jisx0212	#x26 #x71)	; ø»Š¬¶
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
    (greek-iso8859-7	#xDD)	; Î­
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
    (japanese-jisx0212	#x26 #x72)	; ø»Š¬·
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
    (greek-iso8859-7	#xDE)	; Î®
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
    (japanese-jisx0212	#x26 #x73)	; ø»Š¬¸
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
    (greek-iso8859-7	#xDF)	; Î¯
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
    (japanese-jisx0212	#x26 #x74)	; ø»Š¬¹
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (ucs		. #x03B0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (greek-iso8859-7	#xE0)	; Î°
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (->ucs		. #x03B0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B0)
    (japanese-jisx0212	#x26 #x7B)	; ø»Š­€
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (ucs		. #x03B1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0391)
    (->titlecase	#x0391)
    (greek-iso8859-7	#xE1)	; Î±
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
    (japanese-jisx0208-1978	#x26 #x41)	; ø»‚ƒ¶
    (chinese-gb2312		#x26 #x41)	; ø»„º
    (japanese-jisx0208		#x26 #x41)	; ø»†—¾
    (korean-ksc5601		#x25 #x61)	; ø»ˆ¡„
    (chinese-cns11643-1		#x25 #x2F)	; ø»‘ˆ¢
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (ucs		. #x03B2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (greek-iso8859-7	#xE2)	; Î²
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
    (japanese-jisx0208-1978	#x26 #x42)	; ø»‚ƒ·
    (chinese-gb2312		#x26 #x42)	; ø»„»
    (japanese-jisx0208		#x26 #x42)	; ø»†—¿
    (korean-ksc5601		#x25 #x62)	; ø»ˆ¡…
    (chinese-cns11643-1		#x25 #x30)	; ø»‘ˆ£
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (ucs		. #x03B3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0393)
    (->titlecase	#x0393)
    (greek-iso8859-7	#xE3)	; Î³
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
    (japanese-jisx0208-1978	#x26 #x43)	; ø»‚ƒ¸
    (chinese-gb2312		#x26 #x43)	; ø»„¼
    (japanese-jisx0208		#x26 #x43)	; ø»†˜€
    (korean-ksc5601		#x25 #x63)	; ø»ˆ¡†
    (chinese-cns11643-1		#x25 #x31)	; ø»‘ˆ¤
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (ucs		. #x03B4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0394)
    (->titlecase	#x0394)
    (greek-iso8859-7	#xE4)	; Î´
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
    (japanese-jisx0208-1978	#x26 #x44)	; ø»‚ƒ¹
    (chinese-gb2312		#x26 #x44)	; ø»„½
    (japanese-jisx0208		#x26 #x44)	; ø»†˜
    (korean-ksc5601		#x25 #x64)	; ø»ˆ¡‡
    (chinese-cns11643-1		#x25 #x32)	; ø»‘ˆ¥
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (ucs		. #x03B5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0395)
    (->titlecase	#x0395)
    (greek-iso8859-7	#xE5)	; Îµ
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
    (japanese-jisx0208-1978	#x26 #x45)	; ø»‚ƒº
    (chinese-gb2312		#x26 #x45)	; ø»„¾
    (japanese-jisx0208		#x26 #x45)	; ø»†˜‚
    (korean-ksc5601		#x25 #x65)	; ø»ˆ¡ˆ
    (chinese-cns11643-1		#x25 #x33)	; ø»‘ˆ¦
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (ucs		. #x03B6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0396)
    (->titlecase	#x0396)
    (greek-iso8859-7	#xE6)	; Î¶
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
    (japanese-jisx0208-1978	#x26 #x46)	; ø»‚ƒ»
    (chinese-gb2312		#x26 #x46)	; ø»„¿
    (japanese-jisx0208		#x26 #x46)	; ø»†˜ƒ
    (korean-ksc5601		#x25 #x66)	; ø»ˆ¡‰
    (chinese-cns11643-1		#x25 #x34)	; ø»‘ˆ§
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (ucs		. #x03B7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0397)
    (->titlecase	#x0397)
    (greek-iso8859-7	#xE7)	; Î·
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
    (japanese-jisx0208-1978	#x26 #x47)	; ø»‚ƒ¼
    (chinese-gb2312		#x26 #x47)	; ø»„Ž€
    (japanese-jisx0208		#x26 #x47)	; ø»†˜„
    (korean-ksc5601		#x25 #x67)	; ø»ˆ¡Š
    (chinese-cns11643-1		#x25 #x35)	; ø»‘ˆ¨
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (ucs		. #x03B8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (greek-iso8859-7	#xE8)	; Î¸
    (ipa		#xC8)	; øº’›ˆ
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
    (japanese-jisx0208-1978	#x26 #x48)	; ø»‚ƒ½
    (chinese-gb2312		#x26 #x48)	; ø»„Ž
    (japanese-jisx0208		#x26 #x48)	; ø»†˜…
    (korean-ksc5601		#x25 #x68)	; ø»ˆ¡‹
    (chinese-cns11643-1		#x25 #x36)	; ø»‘ˆ©
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (ucs		. #x03B9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0399)
    (->titlecase	#x0399)
    (greek-iso8859-7	#xE9)	; Î¹
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
    (japanese-jisx0208-1978	#x26 #x49)	; ø»‚ƒ¾
    (chinese-gb2312		#x26 #x49)	; ø»„Ž‚
    (japanese-jisx0208		#x26 #x49)	; ø»†˜†
    (korean-ksc5601		#x25 #x69)	; ø»ˆ¡Œ
    (chinese-cns11643-1		#x25 #x37)	; ø»‘ˆª
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (ucs		. #x03BA)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (greek-iso8859-7	#xEA)	; Îº
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
    (japanese-jisx0208-1978	#x26 #x4A)	; ø»‚ƒ¿
    (chinese-gb2312		#x26 #x4A)	; ø»„Žƒ
    (japanese-jisx0208		#x26 #x4A)	; ø»†˜‡
    (korean-ksc5601		#x25 #x6A)	; ø»ˆ¡
    (chinese-cns11643-1		#x25 #x38)	; ø»‘ˆ«
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (ucs		. #x03BB)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039B)
    (->titlecase	#x039B)
    (greek-iso8859-7	#xEB)	; Î»
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
    (japanese-jisx0208-1978	#x26 #x4B)	; ø»‚„€
    (chinese-gb2312		#x26 #x4B)	; ø»„Ž„
    (japanese-jisx0208		#x26 #x4B)	; ø»†˜ˆ
    (korean-ksc5601		#x25 #x6B)	; ø»ˆ¡Ž
    (chinese-cns11643-1		#x25 #x39)	; ø»‘ˆ¬
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (ucs		. #x03BC)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (greek-iso8859-7	#xEC)	; Î¼
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
    (japanese-jisx0208-1978	#x26 #x4C)	; ø»‚„
    (chinese-gb2312		#x26 #x4C)	; ø»„Ž…
    (japanese-jisx0208		#x26 #x4C)	; ø»†˜‰
    (korean-ksc5601		#x25 #x6C)	; ø»ˆ¡
    (chinese-cns11643-1		#x25 #x3A)	; ø»‘ˆ­
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (ucs		. #x03BD)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039D)
    (->titlecase	#x039D)
    (greek-iso8859-7	#xED)	; Î½
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
    (japanese-jisx0208-1978	#x26 #x4D)	; ø»‚„‚
    (chinese-gb2312		#x26 #x4D)	; ø»„Ž†
    (japanese-jisx0208		#x26 #x4D)	; ø»†˜Š
    (korean-ksc5601		#x25 #x6D)	; ø»ˆ¡
    (chinese-cns11643-1		#x25 #x3B)	; ø»‘ˆ®
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (ucs		. #x03BE)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039E)
    (->titlecase	#x039E)
    (greek-iso8859-7	#xEE)	; Î¾
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
    (japanese-jisx0208-1978	#x26 #x4E)	; ø»‚„ƒ
    (chinese-gb2312		#x26 #x4E)	; ø»„Ž‡
    (japanese-jisx0208		#x26 #x4E)	; ø»†˜‹
    (korean-ksc5601		#x25 #x6E)	; ø»ˆ¡‘
    (chinese-cns11643-1		#x25 #x3C)	; ø»‘ˆ¯
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (ucs		. #x03BF)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039F)
    (->titlecase	#x039F)
    (greek-iso8859-7	#xEF)	; Î¿
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
    (japanese-jisx0208-1978	#x26 #x4F)	; ø»‚„„
    (chinese-gb2312		#x26 #x4F)	; ø»„Žˆ
    (japanese-jisx0208		#x26 #x4F)	; ø»†˜Œ
    (korean-ksc5601		#x25 #x6F)	; ø»ˆ¡’
    (chinese-cns11643-1		#x25 #x3D)	; ø»‘ˆ°
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (ucs		. #x03C0)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (greek-iso8859-7	#xF0)	; Ï€
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
    (japanese-jisx0208-1978	#x26 #x50)	; ø»‚„…
    (chinese-gb2312		#x26 #x50)	; ø»„Ž‰
    (japanese-jisx0208		#x26 #x50)	; ø»†˜
    (korean-ksc5601		#x25 #x70)	; ø»ˆ¡“
    (chinese-cns11643-1		#x25 #x3E)	; ø»‘ˆ±
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (ucs		. #x03C1)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (greek-iso8859-7	#xF1)	; Ï
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
    (japanese-jisx0208-1978	#x26 #x51)	; ø»‚„†
    (chinese-gb2312		#x26 #x51)	; ø»„ŽŠ
    (japanese-jisx0208		#x26 #x51)	; ø»†˜Ž
    (korean-ksc5601		#x25 #x71)	; ø»ˆ¡”
    (chinese-cns11643-1		#x25 #x3F)	; ø»‘ˆ²
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (ucs		. #x03C2)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7		#xF2)	; Ï‚
    (japanese-jisx0213-1	#x26 #x59)	; Ï‚
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
    (japanese-jisx0212	#x26 #x78)	; ø»Š¬½
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (ucs		. #x03C3)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7	#xF3)	; Ïƒ
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
    (japanese-jisx0208-1978	#x26 #x52)	; ø»‚„‡
    (chinese-gb2312		#x26 #x52)	; ø»„Ž‹
    (japanese-jisx0208		#x26 #x52)	; ø»†˜
    (korean-ksc5601		#x25 #x72)	; ø»ˆ¡•
    (chinese-cns11643-1		#x25 #x40)	; ø»‘ˆ³
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (ucs		. #x03C4)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A4)
    (->titlecase	#x03A4)
    (greek-iso8859-7	#xF4)	; Ï„
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
    (japanese-jisx0208-1978	#x26 #x53)	; ø»‚„ˆ
    (chinese-gb2312		#x26 #x53)	; ø»„ŽŒ
    (japanese-jisx0208		#x26 #x53)	; ø»†˜
    (korean-ksc5601		#x25 #x73)	; ø»ˆ¡–
    (chinese-cns11643-1		#x25 #x41)	; ø»‘ˆ´
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (ucs		. #x03C5)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A5)
    (->titlecase	#x03A5)
    (greek-iso8859-7	#xF5)	; Ï…
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
    (japanese-jisx0208-1978	#x26 #x54)	; ø»‚„‰
    (chinese-gb2312		#x26 #x54)	; ø»„Ž
    (japanese-jisx0208		#x26 #x54)	; ø»†˜‘
    (korean-ksc5601		#x25 #x74)	; ø»ˆ¡—
    (chinese-cns11643-1		#x25 #x42)	; ø»‘ˆµ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (ucs		. #x03C6)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (greek-iso8859-7	#xF6)	; Ï†
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
    (japanese-jisx0208-1978	#x26 #x55)	; ø»‚„Š
    (chinese-gb2312		#x26 #x55)	; ø»„ŽŽ
    (japanese-jisx0208		#x26 #x55)	; ø»†˜’
    (korean-ksc5601		#x25 #x75)	; ø»ˆ¡˜
    (chinese-cns11643-1		#x25 #x43)	; ø»‘ˆ¶
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (ucs		. #x03C7)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A7)
    (->titlecase	#x03A7)
    (greek-iso8859-7	#xF7)	; Ï‡
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
    (japanese-jisx0208-1978	#x26 #x56)	; ø»‚„‹
    (chinese-gb2312		#x26 #x56)	; ø»„Ž
    (japanese-jisx0208		#x26 #x56)	; ø»†˜“
    (korean-ksc5601		#x25 #x76)	; ø»ˆ¡™
    (chinese-cns11643-1		#x25 #x44)	; ø»‘ˆ·
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (ucs		. #x03C8)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A8)
    (->titlecase	#x03A8)
    (greek-iso8859-7	#xF8)	; Ïˆ
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
    (japanese-jisx0208-1978	#x26 #x57)	; ø»‚„Œ
    (chinese-gb2312		#x26 #x57)	; ø»„Ž
    (japanese-jisx0208		#x26 #x57)	; ø»†˜”
    (korean-ksc5601		#x25 #x77)	; ø»ˆ¡š
    (chinese-cns11643-1		#x25 #x45)	; ø»‘ˆ¸
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (ucs		. #x03C9)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A9)
    (->titlecase	#x03A9)
    (greek-iso8859-7	#xF9)	; Ï‰
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
    (japanese-jisx0208-1978	#x26 #x58)	; ø»‚„
    (chinese-gb2312		#x26 #x58)	; ø»„Ž‘
    (japanese-jisx0208		#x26 #x58)	; ø»†˜•
    (korean-ksc5601		#x25 #x78)	; ø»ˆ¡›
    (chinese-cns11643-1		#x25 #x46)	; ø»‘ˆ¹
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
    (greek-iso8859-7	#xFA)	; ÏŠ
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
    (japanese-jisx0212	#x26 #x75)	; ø»Š¬º
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
    (greek-iso8859-7	#xFB)	; Ï‹
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
    (japanese-jisx0212	#x26 #x7A)	; ø»Š¬¿
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
    (greek-iso8859-7	#xFC)	; ÏŒ
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
    (japanese-jisx0212	#x26 #x77)	; ø»Š¬¼
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
    (greek-iso8859-7	#xFD)	; Ï
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
    (japanese-jisx0212	#x26 #x79)	; ø»Š¬¾
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
    (greek-iso8859-7	#xFE)	; ÏŽ
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
    (japanese-jisx0212	#x26 #x7C)	; ø»Š­
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
