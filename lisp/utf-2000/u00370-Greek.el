(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    (->decomposition	#x02B9)
    (ucs		. #x374)	; ʹ
    ))
(define-char
  '((name		. "GREEK LOWER NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Aristeri keraia")
    (ucs		. #x375)	; ͵
    ))
(define-char
  '((name		. "GREEK YPOGEGRAMMENI")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0345)
    (ucs		. #x37A)	; ͺ
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    (->decomposition	#x003B)
    (ucs		. #x37E)	; ;
    ))
(define-char
  '((name		. "GREEK TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (greek-iso8859-7	. #xB4)	; �����
    (ucs		. #x384)	; ΄
    ))
(define-char
  '((name		. "FULLWIDTH GREEK TONOS")
    (->ucs		. #x0384)	; ΄
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0384)
    (japanese-jisx0212	. #x2238)	; �����
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (greek-iso8859-7	. #xB5)	; �����
    (ucs		. #x385)	; ΅
    ))
(define-char
  '((name		. "FULLWIDTH GREEK DIALYTIKA TONOS")
    (->ucs		. #x0385)	; ΅
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0385)
    (japanese-jisx0212	. #x2239)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->lowercase	#x03AC)
    (greek-iso8859-7	. #xB6)	; �����
    (ucs		. #x386)	; Ά
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (->ucs		. #x0386)	; Ά
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0386)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	. #x2661)	; �����
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00B7)
    (ucs		. #x387)	; ·
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0395 #x0301)
    (->lowercase	#x03AD)
    (greek-iso8859-7	. #xB8)	; �����
    (ucs		. #x388)	; Έ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (->ucs		. #x0388)	; Έ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0388)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2662)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->lowercase	#x03AE)
    (greek-iso8859-7	. #xB9)	; �����
    (ucs		. #x389)	; Ή
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")
    (->ucs		. #x0389)	; Ή
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0389)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	. #x2663)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->lowercase	#x03AF)
    (greek-iso8859-7	. #xBA)	; �����
    (ucs		. #x38A)	; Ί
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")
    (->ucs		. #x038A)	; Ί
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038A)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	. #x2664)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->lowercase	#x03CC)
    (greek-iso8859-7	. #xBC)	; �����
    (ucs		. #x38C)	; Ό
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (->ucs		. #x038C)	; Ό
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038C)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	. #x2667)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->lowercase	#x03CD)
    (greek-iso8859-7	. #xBE)	; �����
    (ucs		. #x38E)	; Ύ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (->ucs		. #x038E)	; Ύ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038E)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2669)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->lowercase	#x03CE)
    (greek-iso8859-7	. #xBF)	; �����
    (ucs		. #x38F)	; Ώ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (->ucs		. #x038F)	; Ώ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038F)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	. #x266C)	; �����
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (greek-iso8859-7	. #xC0)	; �����
    (ucs		. #x390)	; ΐ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (->ucs		. #x0390)	; ΐ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0390)
    (japanese-jisx0212	. #x2676)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B1)
    (greek-iso8859-7	. #xC1)	; �����
    (ucs		. #x391)	; Α
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA")
    (->ucs		. #x0391)	; Α
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0391)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ALPHA")))
    (japanese-jisx0208-1978	. #x2621)	; �����
    (chinese-gb2312		. #x2621)	; �����
    (japanese-jisx0208		. #x2621)	; �����
    (korean-ksc5601		. #x2541)	; �����
    (chinese-cns11643-1		. #x2475)	; �����
    (japanese-jisx0208-1990	. #x2621)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B2)
    (greek-iso8859-7	. #xC2)	; �����
    (ucs		. #x392)	; Β
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER BETA")
    (->ucs		. #x0392)	; Β
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0392)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER BETA")))
    (japanese-jisx0208-1978	. #x2622)	; �����
    (chinese-gb2312		. #x2622)	; �����
    (japanese-jisx0208		. #x2622)	; �����
    (korean-ksc5601		. #x2542)	; �����
    (chinese-cns11643-1		. #x2476)	; �����
    (japanese-jisx0208-1990	. #x2622)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B3)
    (greek-iso8859-7	. #xC3)	; �����
    (ucs		. #x393)	; Γ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER GAMMA")
    (->ucs		. #x0393)	; Γ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0393)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER GAMMA")))
    (japanese-jisx0208-1978	. #x2623)	; �����
    (chinese-gb2312		. #x2623)	; �����
    (japanese-jisx0208		. #x2623)	; �����
    (korean-ksc5601		. #x2543)	; �����
    (chinese-cns11643-1		. #x2477)	; �����
    (japanese-jisx0208-1990	. #x2623)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B4)
    (greek-iso8859-7	. #xC4)	; �����
    (ucs		. #x394)	; Δ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER DELTA")
    (->ucs		. #x0394)	; Δ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0394)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER DELTA")))
    (japanese-jisx0208-1978	. #x2624)	; �����
    (chinese-gb2312		. #x2624)	; �����
    (japanese-jisx0208		. #x2624)	; �����
    (korean-ksc5601		. #x2544)	; �����
    (chinese-cns11643-1		. #x2478)	; �����
    (japanese-jisx0208-1990	. #x2624)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B5)
    (greek-iso8859-7	. #xC5)	; �����
    (ucs		. #x395)	; Ε
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON")
    (->ucs		. #x0395)	; Ε
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0395)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER EPSILON")))
    (japanese-jisx0208-1978	. #x2625)	; �����
    (chinese-gb2312		. #x2625)	; �����
    (japanese-jisx0208		. #x2625)	; �����
    (korean-ksc5601		. #x2545)	; �����
    (chinese-cns11643-1		. #x2479)	; �����
    (japanese-jisx0208-1990	. #x2625)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B6)
    (greek-iso8859-7	. #xC6)	; �����
    (ucs		. #x396)	; Ζ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ZETA")
    (->ucs		. #x0396)	; Ζ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0396)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ZETA")))
    (japanese-jisx0208-1978	. #x2626)	; �����
    (chinese-gb2312		. #x2626)	; �����
    (japanese-jisx0208		. #x2626)	; �����
    (korean-ksc5601		. #x2546)	; �����
    (chinese-cns11643-1		. #x247A)	; �����
    (japanese-jisx0208-1990	. #x2626)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B7)
    (greek-iso8859-7	. #xC7)	; �����
    (ucs		. #x397)	; Η
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA")
    (->ucs		. #x0397)	; Η
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0397)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ETA")))
    (japanese-jisx0208-1978	. #x2627)	; �����
    (chinese-gb2312		. #x2627)	; �����
    (japanese-jisx0208		. #x2627)	; �����
    (korean-ksc5601		. #x2547)	; �����
    (chinese-cns11643-1		. #x247B)	; �����
    (japanese-jisx0208-1990	. #x2627)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B8)
    (greek-iso8859-7	. #xC8)	; �����
    (ucs		. #x398)	; Θ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER THETA")
    (->ucs		. #x0398)	; Θ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0398)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER THETA")))
    (japanese-jisx0208-1978	. #x2628)	; �����
    (chinese-gb2312		. #x2628)	; �����
    (japanese-jisx0208		. #x2628)	; �����
    (korean-ksc5601		. #x2548)	; �����
    (chinese-cns11643-1		. #x247C)	; �����
    (japanese-jisx0208-1990	. #x2628)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B9)
    (greek-iso8859-7	. #xC9)	; �����
    (ucs		. #x399)	; Ι
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA")
    (->ucs		. #x0399)	; Ι
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0399)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA")))
    (japanese-jisx0208-1978	. #x2629)	; �����
    (chinese-gb2312		. #x2629)	; �����
    (japanese-jisx0208		. #x2629)	; �����
    (korean-ksc5601		. #x2549)	; �����
    (chinese-cns11643-1		. #x247D)	; �����
    (japanese-jisx0208-1990	. #x2629)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BA)
    (greek-iso8859-7	. #xCA)	; �����
    (ucs		. #x39A)	; Κ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER KAPPA")
    (->ucs		. #x039A)	; Κ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039A)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER KAPPA")))
    (japanese-jisx0208-1978	. #x262A)	; �����
    (chinese-gb2312		. #x262A)	; �����
    (japanese-jisx0208		. #x262A)	; �����
    (korean-ksc5601		. #x254A)	; �����
    (chinese-cns11643-1		. #x247E)	; �����
    (japanese-jisx0208-1990	. #x262A)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BB)
    (greek-iso8859-7	. #xCB)	; �����
    (ucs		. #x39B)	; Λ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER LAMDA")
    (->ucs		. #x039B)	; Λ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039B)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER LAMDA")))
    (japanese-jisx0208-1978	. #x262B)	; �����
    (chinese-gb2312		. #x262B)	; �����
    (japanese-jisx0208		. #x262B)	; �����
    (korean-ksc5601		. #x254B)	; �����
    (chinese-cns11643-1		. #x2521)	; �����
    (japanese-jisx0208-1990	. #x262B)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BC)
    (greek-iso8859-7	. #xCC)	; �����
    (ucs		. #x39C)	; Μ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER MU")
    (->ucs		. #x039C)	; Μ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039C)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER MU")))
    (japanese-jisx0208-1978	. #x262C)	; �����
    (chinese-gb2312		. #x262C)	; �����
    (japanese-jisx0208		. #x262C)	; �����
    (korean-ksc5601		. #x254C)	; �����
    (chinese-cns11643-1		. #x2522)	; �����
    (japanese-jisx0208-1990	. #x262C)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BD)
    (greek-iso8859-7	. #xCD)	; �����
    (ucs		. #x39D)	; Ν
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER NU")
    (->ucs		. #x039D)	; Ν
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039D)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER NU")))
    (japanese-jisx0208-1978	. #x262D)	; �����
    (chinese-gb2312		. #x262D)	; �����
    (japanese-jisx0208		. #x262D)	; �����
    (korean-ksc5601		. #x254D)	; �����
    (chinese-cns11643-1		. #x2523)	; �����
    (japanese-jisx0208-1990	. #x262D)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BE)
    (greek-iso8859-7	. #xCE)	; �����
    (ucs		. #x39E)	; Ξ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER XI")
    (->ucs		. #x039E)	; Ξ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039E)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER XI")))
    (japanese-jisx0208-1978	. #x262E)	; �����
    (chinese-gb2312		. #x262E)	; �����
    (japanese-jisx0208		. #x262E)	; �����
    (korean-ksc5601		. #x254E)	; �����
    (chinese-cns11643-1		. #x2524)	; �����
    (japanese-jisx0208-1990	. #x262E)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BF)
    (greek-iso8859-7	. #xCF)	; �����
    (ucs		. #x39F)	; Ο
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON")
    (->ucs		. #x039F)	; Ο
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039F)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMICRON")))
    (japanese-jisx0208-1978	. #x262F)	; �����
    (chinese-gb2312		. #x262F)	; �����
    (japanese-jisx0208		. #x262F)	; �����
    (korean-ksc5601		. #x254F)	; �����
    (chinese-cns11643-1		. #x2525)	; �����
    (japanese-jisx0208-1990	. #x262F)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C0)
    (greek-iso8859-7	. #xD0)	; �����
    (ucs		. #x3A0)	; Π
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PI")
    (->ucs		. #x03A0)	; Π
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A0)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PI")))
    (japanese-jisx0208-1978	. #x2630)	; �����
    (chinese-gb2312		. #x2630)	; �����
    (japanese-jisx0208		. #x2630)	; �����
    (korean-ksc5601		. #x2550)	; �����
    (chinese-cns11643-1		. #x2526)	; �����
    (japanese-jisx0208-1990	. #x2630)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C1)
    (greek-iso8859-7	. #xD1)	; �����
    (ucs		. #x3A1)	; Ρ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER RHO")
    (->ucs		. #x03A1)	; Ρ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A1)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER RHO")))
    (japanese-jisx0208-1978	. #x2631)	; �����
    (chinese-gb2312		. #x2631)	; �����
    (japanese-jisx0208		. #x2631)	; �����
    (korean-ksc5601		. #x2551)	; �����
    (chinese-cns11643-1		. #x2527)	; �����
    (japanese-jisx0208-1990	. #x2631)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C3)
    (greek-iso8859-7	. #xD3)	; �����
    (ucs		. #x3A3)	; Σ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER SIGMA")
    (->ucs		. #x03A3)	; Σ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A3)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER SIGMA")))
    (japanese-jisx0208-1978	. #x2632)	; �����
    (chinese-gb2312		. #x2632)	; �����
    (japanese-jisx0208		. #x2632)	; �����
    (korean-ksc5601		. #x2552)	; �����
    (chinese-cns11643-1		. #x2528)	; �����
    (japanese-jisx0208-1990	. #x2632)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C4)
    (greek-iso8859-7	. #xD4)	; �����
    (ucs		. #x3A4)	; Τ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER TAU")
    (->ucs		. #x03A4)	; Τ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A4)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER TAU")))
    (japanese-jisx0208-1978	. #x2633)	; �����
    (chinese-gb2312		. #x2633)	; �����
    (japanese-jisx0208		. #x2633)	; �����
    (korean-ksc5601		. #x2553)	; �����
    (chinese-cns11643-1		. #x2529)	; �����
    (japanese-jisx0208-1990	. #x2633)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C5)
    (greek-iso8859-7	. #xD5)	; �����
    (ucs		. #x3A5)	; Υ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON")
    (->ucs		. #x03A5)	; Υ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A5)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON")))
    (japanese-jisx0208-1978	. #x2634)	; �����
    (chinese-gb2312		. #x2634)	; �����
    (japanese-jisx0208		. #x2634)	; �����
    (korean-ksc5601		. #x2554)	; �����
    (chinese-cns11643-1		. #x252A)	; �����
    (japanese-jisx0208-1990	. #x2634)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C6)
    (greek-iso8859-7	. #xD6)	; �����
    (ucs		. #x3A6)	; Φ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PHI")
    (->ucs		. #x03A6)	; Φ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A6)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PHI")))
    (japanese-jisx0208-1978	. #x2635)	; �����
    (chinese-gb2312		. #x2635)	; �����
    (japanese-jisx0208		. #x2635)	; �����
    (korean-ksc5601		. #x2555)	; �����
    (chinese-cns11643-1		. #x252B)	; �����
    (japanese-jisx0208-1990	. #x2635)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C7)
    (greek-iso8859-7	. #xD7)	; �����
    (ucs		. #x3A7)	; Χ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER CHI")
    (->ucs		. #x03A7)	; Χ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A7)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER CHI")))
    (japanese-jisx0208-1978	. #x2636)	; �����
    (chinese-gb2312		. #x2636)	; �����
    (japanese-jisx0208		. #x2636)	; �����
    (korean-ksc5601		. #x2556)	; �����
    (chinese-cns11643-1		. #x252C)	; �����
    (japanese-jisx0208-1990	. #x2636)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C8)
    (greek-iso8859-7	. #xD8)	; �����
    (ucs		. #x3A8)	; Ψ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PSI")
    (->ucs		. #x03A8)	; Ψ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A8)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PSI")))
    (japanese-jisx0208-1978	. #x2637)	; �����
    (chinese-gb2312		. #x2637)	; �����
    (japanese-jisx0208		. #x2637)	; �����
    (korean-ksc5601		. #x2557)	; �����
    (chinese-cns11643-1		. #x252D)	; �����
    (japanese-jisx0208-1990	. #x2637)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C9)
    (greek-iso8859-7	. #xD9)	; �����
    (ucs		. #x3A9)	; Ω
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA")
    (->ucs		. #x03A9)	; Ω
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A9)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMEGA")))
    (japanese-jisx0208-1978	. #x2638)	; �����
    (chinese-gb2312		. #x2638)	; �����
    (japanese-jisx0208		. #x2638)	; �����
    (korean-ksc5601		. #x2558)	; �����
    (chinese-cns11643-1		. #x252E)	; �����
    (japanese-jisx0208-1990	. #x2638)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->lowercase	#x03CA)
    (greek-iso8859-7	. #xDA)	; �����
    (ucs		. #x3AA)	; Ϊ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03AA)	; Ϊ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AA)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	. #x2665)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->lowercase	#x03CB)
    (greek-iso8859-7	. #xDB)	; �����
    (ucs		. #x3AB)	; Ϋ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03AB)	; Ϋ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AB)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	. #x266A)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->uppercase	#x0386)
    (->titlecase	#x0386)
    (greek-iso8859-7	. #xDC)	; �����
    (ucs		. #x3AC)	; ά
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")
    (->ucs		. #x03AC)	; ά
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	. #x2671)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->uppercase	#x0388)
    (->titlecase	#x0388)
    (greek-iso8859-7	. #xDD)	; �����
    (ucs		. #x3AD)	; έ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")
    (->ucs		. #x03AD)	; έ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2672)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->uppercase	#x0389)
    (->titlecase	#x0389)
    (greek-iso8859-7	. #xDE)	; �����
    (ucs		. #x3AE)	; ή
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")
    (->ucs		. #x03AE)	; ή
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	. #x2673)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->uppercase	#x038A)
    (->titlecase	#x038A)
    (greek-iso8859-7	. #xDF)	; �����
    (ucs		. #x3AF)	; ί
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")
    (->ucs		. #x03AF)	; ί
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AF)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	. #x2674)	; �����
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (greek-iso8859-7	. #xE0)	; �����
    (ucs		. #x3B0)	; ΰ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (->ucs		. #x03B0)	; ΰ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B0)
    (japanese-jisx0212	. #x267B)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0391)
    (->titlecase	#x0391)
    (greek-iso8859-7	. #xE1)	; �����
    (ucs		. #x3B1)	; α
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA")
    (->ucs		. #x03B1)	; α
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B1)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (japanese-jisx0208-1978	. #x2641)	; �����
    (chinese-gb2312		. #x2641)	; �����
    (japanese-jisx0208		. #x2641)	; �����
    (korean-ksc5601		. #x2561)	; �����
    (chinese-cns11643-1		. #x252F)	; �����
    (japanese-jisx0208-1990	. #x2641)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (greek-iso8859-7	. #xE2)	; �����
    (ucs		. #x3B2)	; β
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER BETA")
    (->ucs		. #x03B2)	; β
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B2)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (japanese-jisx0208-1978	. #x2642)	; �����
    (chinese-gb2312		. #x2642)	; �����
    (japanese-jisx0208		. #x2642)	; �����
    (korean-ksc5601		. #x2562)	; �����
    (chinese-cns11643-1		. #x2530)	; �����
    (japanese-jisx0208-1990	. #x2642)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0393)
    (->titlecase	#x0393)
    (greek-iso8859-7	. #xE3)	; �����
    (ucs		. #x3B3)	; γ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER GAMMA")
    (->ucs		. #x03B3)	; γ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B3)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (japanese-jisx0208-1978	. #x2643)	; �����
    (chinese-gb2312		. #x2643)	; �����
    (japanese-jisx0208		. #x2643)	; �����
    (korean-ksc5601		. #x2563)	; �����
    (chinese-cns11643-1		. #x2531)	; �����
    (japanese-jisx0208-1990	. #x2643)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0394)
    (->titlecase	#x0394)
    (greek-iso8859-7	. #xE4)	; �����
    (ucs		. #x3B4)	; δ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER DELTA")
    (->ucs		. #x03B4)	; δ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B4)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (japanese-jisx0208-1978	. #x2644)	; �����
    (chinese-gb2312		. #x2644)	; �����
    (japanese-jisx0208		. #x2644)	; �����
    (korean-ksc5601		. #x2564)	; �����
    (chinese-cns11643-1		. #x2532)	; �����
    (japanese-jisx0208-1990	. #x2644)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0395)
    (->titlecase	#x0395)
    (greek-iso8859-7	. #xE5)	; �����
    (ucs		. #x3B5)	; ε
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON")
    (->ucs		. #x03B5)	; ε
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B5)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (japanese-jisx0208-1978	. #x2645)	; �����
    (chinese-gb2312		. #x2645)	; �����
    (japanese-jisx0208		. #x2645)	; �����
    (korean-ksc5601		. #x2565)	; �����
    (chinese-cns11643-1		. #x2533)	; �����
    (japanese-jisx0208-1990	. #x2645)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0396)
    (->titlecase	#x0396)
    (greek-iso8859-7	. #xE6)	; �����
    (ucs		. #x3B6)	; ζ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ZETA")
    (->ucs		. #x03B6)	; ζ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B6)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (japanese-jisx0208-1978	. #x2646)	; �����
    (chinese-gb2312		. #x2646)	; �����
    (japanese-jisx0208		. #x2646)	; �����
    (korean-ksc5601		. #x2566)	; �����
    (chinese-cns11643-1		. #x2534)	; �����
    (japanese-jisx0208-1990	. #x2646)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0397)
    (->titlecase	#x0397)
    (greek-iso8859-7	. #xE7)	; �����
    (ucs		. #x3B7)	; η
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA")
    (->ucs		. #x03B7)	; η
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B7)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (japanese-jisx0208-1978	. #x2647)	; �����
    (chinese-gb2312		. #x2647)	; �����
    (japanese-jisx0208		. #x2647)	; �����
    (korean-ksc5601		. #x2567)	; �����
    (chinese-cns11643-1		. #x2535)	; �����
    (japanese-jisx0208-1990	. #x2647)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (greek-iso8859-7	. #xE8)	; �����
    (ipa		. #xC8)	; �����
    (ucs		. #x3B8)	; θ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER THETA")
    (->ucs		. #x03B8)	; θ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B8)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (japanese-jisx0208-1978	. #x2648)	; �����
    (chinese-gb2312		. #x2648)	; �����
    (japanese-jisx0208		. #x2648)	; �����
    (korean-ksc5601		. #x2568)	; �����
    (chinese-cns11643-1		. #x2536)	; �����
    (japanese-jisx0208-1990	. #x2648)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0399)
    (->titlecase	#x0399)
    (greek-iso8859-7	. #xE9)	; �����
    (ucs		. #x3B9)	; ι
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA")
    (->ucs		. #x03B9)	; ι
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B9)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (japanese-jisx0208-1978	. #x2649)	; �����
    (chinese-gb2312		. #x2649)	; �����
    (japanese-jisx0208		. #x2649)	; �����
    (korean-ksc5601		. #x2569)	; �����
    (chinese-cns11643-1		. #x2537)	; �����
    (japanese-jisx0208-1990	. #x2649)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (greek-iso8859-7	. #xEA)	; �����
    (ucs		. #x3BA)	; κ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER KAPPA")
    (->ucs		. #x03BA)	; κ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BA)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (japanese-jisx0208-1978	. #x264A)	; �����
    (chinese-gb2312		. #x264A)	; �����
    (japanese-jisx0208		. #x264A)	; �����
    (korean-ksc5601		. #x256A)	; �����
    (chinese-cns11643-1		. #x2538)	; �����
    (japanese-jisx0208-1990	. #x264A)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039B)
    (->titlecase	#x039B)
    (greek-iso8859-7	. #xEB)	; �����
    (ucs		. #x3BB)	; λ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER LAMDA")
    (->ucs		. #x03BB)	; λ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BB)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (japanese-jisx0208-1978	. #x264B)	; �����
    (chinese-gb2312		. #x264B)	; �����
    (japanese-jisx0208		. #x264B)	; �����
    (korean-ksc5601		. #x256B)	; �����
    (chinese-cns11643-1		. #x2539)	; �����
    (japanese-jisx0208-1990	. #x264B)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (greek-iso8859-7	. #xEC)	; �����
    (ucs		. #x3BC)	; μ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER MU")
    (->ucs		. #x03BC)	; μ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (japanese-jisx0208-1978	. #x264C)	; �����
    (chinese-gb2312		. #x264C)	; �����
    (japanese-jisx0208		. #x264C)	; �����
    (korean-ksc5601		. #x256C)	; �����
    (chinese-cns11643-1		. #x253A)	; �����
    (japanese-jisx0208-1990	. #x264C)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039D)
    (->titlecase	#x039D)
    (greek-iso8859-7	. #xED)	; �����
    (ucs		. #x3BD)	; ν
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER NU")
    (->ucs		. #x03BD)	; ν
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (japanese-jisx0208-1978	. #x264D)	; �����
    (chinese-gb2312		. #x264D)	; �����
    (japanese-jisx0208		. #x264D)	; �����
    (korean-ksc5601		. #x256D)	; �����
    (chinese-cns11643-1		. #x253B)	; �����
    (japanese-jisx0208-1990	. #x264D)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039E)
    (->titlecase	#x039E)
    (greek-iso8859-7	. #xEE)	; �����
    (ucs		. #x3BE)	; ξ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER XI")
    (->ucs		. #x03BE)	; ξ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (japanese-jisx0208-1978	. #x264E)	; �����
    (chinese-gb2312		. #x264E)	; �����
    (japanese-jisx0208		. #x264E)	; �����
    (korean-ksc5601		. #x256E)	; �����
    (chinese-cns11643-1		. #x253C)	; �����
    (japanese-jisx0208-1990	. #x264E)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039F)
    (->titlecase	#x039F)
    (greek-iso8859-7	. #xEF)	; �����
    (ucs		. #x3BF)	; ο
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON")
    (->ucs		. #x03BF)	; ο
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BF)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (japanese-jisx0208-1978	. #x264F)	; �����
    (chinese-gb2312		. #x264F)	; �����
    (japanese-jisx0208		. #x264F)	; �����
    (korean-ksc5601		. #x256F)	; �����
    (chinese-cns11643-1		. #x253D)	; �����
    (japanese-jisx0208-1990	. #x264F)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (greek-iso8859-7	. #xF0)	; �����
    (ucs		. #x3C0)	; π
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PI")
    (->ucs		. #x03C0)	; π
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C0)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (japanese-jisx0208-1978	. #x2650)	; �����
    (chinese-gb2312		. #x2650)	; �����
    (japanese-jisx0208		. #x2650)	; �����
    (korean-ksc5601		. #x2570)	; �����
    (chinese-cns11643-1		. #x253E)	; �����
    (japanese-jisx0208-1990	. #x2650)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (greek-iso8859-7	. #xF1)	; �����
    (ucs		. #x3C1)	; ρ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER RHO")
    (->ucs		. #x03C1)	; ρ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C1)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (japanese-jisx0208-1978	. #x2651)	; �����
    (chinese-gb2312		. #x2651)	; �����
    (japanese-jisx0208		. #x2651)	; �����
    (korean-ksc5601		. #x2571)	; �����
    (chinese-cns11643-1		. #x253F)	; �����
    (japanese-jisx0208-1990	. #x2651)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7		. #xF2)	; �����
    (japanese-jisx0213-1	. #x2659)	; ς
    (ucs			. #x3C2)	; ς
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER FINAL SIGMA")
    (->ucs		. #x03C2)	; ς
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C2)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (japanese-jisx0212	. #x2678)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7	. #xF3)	; �����
    (ucs		. #x3C3)	; σ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER SIGMA")
    (->ucs		. #x03C3)	; σ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C3)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (japanese-jisx0208-1978	. #x2652)	; �����
    (chinese-gb2312		. #x2652)	; �����
    (japanese-jisx0208		. #x2652)	; �����
    (korean-ksc5601		. #x2572)	; �����
    (chinese-cns11643-1		. #x2540)	; �����
    (japanese-jisx0208-1990	. #x2652)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A4)
    (->titlecase	#x03A4)
    (greek-iso8859-7	. #xF4)	; �����
    (ucs		. #x3C4)	; τ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER TAU")
    (->ucs		. #x03C4)	; τ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C4)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (japanese-jisx0208-1978	. #x2653)	; �����
    (chinese-gb2312		. #x2653)	; �����
    (japanese-jisx0208		. #x2653)	; �����
    (korean-ksc5601		. #x2573)	; �����
    (chinese-cns11643-1		. #x2541)	; �����
    (japanese-jisx0208-1990	. #x2653)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A5)
    (->titlecase	#x03A5)
    (greek-iso8859-7	. #xF5)	; �����
    (ucs		. #x3C5)	; υ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON")
    (->ucs		. #x03C5)	; υ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C5)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (japanese-jisx0208-1978	. #x2654)	; �����
    (chinese-gb2312		. #x2654)	; �����
    (japanese-jisx0208		. #x2654)	; �����
    (korean-ksc5601		. #x2574)	; �����
    (chinese-cns11643-1		. #x2542)	; �����
    (japanese-jisx0208-1990	. #x2654)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (greek-iso8859-7	. #xF6)	; �����
    (ucs		. #x3C6)	; φ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PHI")
    (->ucs		. #x03C6)	; φ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C6)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (japanese-jisx0208-1978	. #x2655)	; �����
    (chinese-gb2312		. #x2655)	; �����
    (japanese-jisx0208		. #x2655)	; �����
    (korean-ksc5601		. #x2575)	; �����
    (chinese-cns11643-1		. #x2543)	; �����
    (japanese-jisx0208-1990	. #x2655)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A7)
    (->titlecase	#x03A7)
    (greek-iso8859-7	. #xF7)	; �����
    (ucs		. #x3C7)	; χ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER CHI")
    (->ucs		. #x03C7)	; χ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C7)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (japanese-jisx0208-1978	. #x2656)	; �����
    (chinese-gb2312		. #x2656)	; �����
    (japanese-jisx0208		. #x2656)	; �����
    (korean-ksc5601		. #x2576)	; �����
    (chinese-cns11643-1		. #x2544)	; �����
    (japanese-jisx0208-1990	. #x2656)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A8)
    (->titlecase	#x03A8)
    (greek-iso8859-7	. #xF8)	; �����
    (ucs		. #x3C8)	; ψ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PSI")
    (->ucs		. #x03C8)	; ψ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C8)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (japanese-jisx0208-1978	. #x2657)	; �����
    (chinese-gb2312		. #x2657)	; �����
    (japanese-jisx0208		. #x2657)	; �����
    (korean-ksc5601		. #x2577)	; �����
    (chinese-cns11643-1		. #x2545)	; �����
    (japanese-jisx0208-1990	. #x2657)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A9)
    (->titlecase	#x03A9)
    (greek-iso8859-7	. #xF9)	; �����
    (ucs		. #x3C9)	; ω
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA")
    (->ucs		. #x03C9)	; ω
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C9)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (japanese-jisx0208-1978	. #x2658)	; �����
    (chinese-gb2312		. #x2658)	; �����
    (japanese-jisx0208		. #x2658)	; �����
    (korean-ksc5601		. #x2578)	; �����
    (chinese-cns11643-1		. #x2546)	; �����
    (japanese-jisx0208-1990	. #x2658)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->uppercase	#x03AA)
    (->titlecase	#x03AA)
    (greek-iso8859-7	. #xFA)	; �����
    (ucs		. #x3CA)	; ϊ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03CA)	; ϊ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CA)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	. #x2675)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->uppercase	#x03AB)
    (->titlecase	#x03AB)
    (greek-iso8859-7	. #xFB)	; �����
    (ucs		. #x3CB)	; ϋ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03CB)	; ϋ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CB)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	. #x267A)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->uppercase	#x038C)
    (->titlecase	#x038C)
    (greek-iso8859-7	. #xFC)	; �����
    (ucs		. #x3CC)	; ό
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")
    (->ucs		. #x03CC)	; ό
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	. #x2677)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->uppercase	#x038E)
    (->titlecase	#x038E)
    (greek-iso8859-7	. #xFD)	; �����
    (ucs		. #x3CD)	; ύ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")
    (->ucs		. #x03CD)	; ύ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2679)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->uppercase	#x038F)
    (->titlecase	#x038F)
    (greek-iso8859-7	. #xFE)	; �����
    (ucs		. #x3CE)	; ώ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")
    (->ucs		. #x03CE)	; ώ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	. #x267C)	; �����
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B2)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (ucs		. #x3D0)	; ϐ
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B8)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (ucs		. #x3D1)	; ϑ
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03A5)
    (ucs		. #x3D2)	; ϒ
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0301)
    (ucs		. #x3D3)	; ϓ
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0308)
    (ucs		. #x3D4)	; ϔ
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C6)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (ucs		. #x3D5)	; ϕ
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C0)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (ucs		. #x3D6)	; ϖ
    ))
(define-char
  '((name		. "GREEK KAI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x3D7)	; ϗ
    ))
(define-char
  '((name		. "GREEK LETTER STIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DB)
    (ucs		. #x3DA)	; Ϛ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER STIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DA)
    (->titlecase	#x03DA)
    (ucs		. #x3DB)	; ϛ
    ))
(define-char
  '((name		. "GREEK LETTER DIGAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DD)
    (ucs		. #x3DC)	; Ϝ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DIGAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DC)
    (->titlecase	#x03DC)
    (ucs		. #x3DD)	; ϝ
    ))
(define-char
  '((name		. "GREEK LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DF)
    (ucs		. #x3DE)	; Ϟ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DE)
    (->titlecase	#x03DE)
    (ucs		. #x3DF)	; ϟ
    ))
(define-char
  '((name		. "GREEK LETTER SAMPI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E1)
    (ucs		. #x3E0)	; Ϡ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SAMPI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E0)
    (->titlecase	#x03E0)
    (ucs		. #x3E1)	; ϡ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E3)
    (ucs		. #x3E2)	; Ϣ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E2)
    (->titlecase	#x03E2)
    (ucs		. #x3E3)	; ϣ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER FEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E5)
    (ucs		. #x3E4)	; Ϥ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER FEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E4)
    (->titlecase	#x03E4)
    (ucs		. #x3E5)	; ϥ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER KHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E7)
    (ucs		. #x3E6)	; Ϧ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER KHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E6)
    (->titlecase	#x03E6)
    (ucs		. #x3E7)	; ϧ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER HORI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E9)
    (ucs		. #x3E8)	; Ϩ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER HORI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E8)
    (->titlecase	#x03E8)
    (ucs		. #x3E9)	; ϩ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER GANGIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03EB)
    (ucs		. #x3EA)	; Ϫ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER GANGIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EA)
    (->titlecase	#x03EA)
    (ucs		. #x3EB)	; ϫ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHIMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03ED)
    (ucs		. #x3EC)	; Ϭ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHIMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EC)
    (->titlecase	#x03EC)
    (ucs		. #x3ED)	; ϭ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER DEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03EF)
    (ucs		. #x3EE)	; Ϯ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER DEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EE)
    (->titlecase	#x03EE)
    (ucs		. #x3EF)	; ϯ
    ))
(define-char
  '((name		. "GREEK KAPPA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BA)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (ucs		. #x3F0)	; ϰ
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C1)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (ucs		. #x3F1)	; ϱ
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C2)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (ucs		. #x3F2)	; ϲ
    ))
(define-char
  '((name		. "GREEK LETTER YOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x3F3)	; ϳ
    ))
