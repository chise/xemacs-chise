(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    (->decomposition	#x02B9)
    (ucs		. #x374)	; Í´
    ))
(define-char
  '((name		. "GREEK LOWER NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Aristeri keraia")
    (ucs		. #x375)	; Íµ
    ))
(define-char
  '((name		. "GREEK YPOGEGRAMMENI")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0345)
    (ucs		. #x37A)	; Íº
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    (->decomposition	#x003B)
    (ucs		. #x37E)	; Í¾
    ))
(define-char
  '((name		. "GREEK TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (greek-iso8859-7	. #xB4)	; øº’»´
    (ucs		. #x384)	; Î„
    ))
(define-char
  '((name		. "FULLWIDTH GREEK TONOS")
    (->ucs		. #x0384)	; Î„
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0384)
    (japanese-jisx0212	. #x2238)	; ø»Š¦…
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (greek-iso8859-7	. #xB5)	; øº’»µ
    (ucs		. #x385)	; Î…
    ))
(define-char
  '((name		. "FULLWIDTH GREEK DIALYTIKA TONOS")
    (->ucs		. #x0385)	; Î…
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0385)
    (japanese-jisx0212	. #x2239)	; ø»Š¦†
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->lowercase	#x03AC)
    (greek-iso8859-7	. #xB6)	; øº’»¶
    (ucs		. #x386)	; Î†
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (->ucs		. #x0386)	; Î†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0386)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	. #x2661)	; ø»Š¬¦
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00B7)
    (ucs		. #x387)	; Î‡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0395 #x0301)
    (->lowercase	#x03AD)
    (greek-iso8859-7	. #xB8)	; øº’»¸
    (ucs		. #x388)	; Îˆ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (->ucs		. #x0388)	; Îˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0388)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2662)	; ø»Š¬§
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->lowercase	#x03AE)
    (greek-iso8859-7	. #xB9)	; øº’»¹
    (ucs		. #x389)	; Î‰
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")
    (->ucs		. #x0389)	; Î‰
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0389)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	. #x2663)	; ø»Š¬¨
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->lowercase	#x03AF)
    (greek-iso8859-7	. #xBA)	; øº’»º
    (ucs		. #x38A)	; ÎŠ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")
    (->ucs		. #x038A)	; ÎŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038A)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	. #x2664)	; ø»Š¬©
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->lowercase	#x03CC)
    (greek-iso8859-7	. #xBC)	; øº’»¼
    (ucs		. #x38C)	; ÎŒ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (->ucs		. #x038C)	; ÎŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038C)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	. #x2667)	; ø»Š¬¬
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->lowercase	#x03CD)
    (greek-iso8859-7	. #xBE)	; øº’»¾
    (ucs		. #x38E)	; ÎŽ
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (->ucs		. #x038E)	; ÎŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038E)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2669)	; ø»Š¬®
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->lowercase	#x03CE)
    (greek-iso8859-7	. #xBF)	; øº’»¿
    (ucs		. #x38F)	; Î
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (->ucs		. #x038F)	; Î
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038F)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	. #x266C)	; ø»Š¬±
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (greek-iso8859-7	. #xC0)	; øº’¼€
    (ucs		. #x390)	; Î
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (->ucs		. #x0390)	; Î
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0390)
    (japanese-jisx0212	. #x2676)	; ø»Š¬»
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B1)
    (greek-iso8859-7	. #xC1)	; øº’¼
    (ucs		. #x391)	; Î‘
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ALPHA")
    (->ucs		. #x0391)	; Î‘
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0391)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ALPHA")))
    (japanese-jisx0208-1978	. #x2621)	; ø»‚ƒ–
    (chinese-gb2312		. #x2621)	; ø»„š
    (japanese-jisx0208		. #x2621)	; ø»†—ž
    (korean-ksc5601		. #x2541)	; ø»ˆ ¤
    (chinese-cns11643-1		. #x2475)	; ø»‘ˆŠ
    (japanese-jisx0208-1990	. #x2621)	; ø»‚ƒ–
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B2)
    (greek-iso8859-7	. #xC2)	; øº’¼‚
    (ucs		. #x392)	; Î’
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER BETA")
    (->ucs		. #x0392)	; Î’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0392)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER BETA")))
    (japanese-jisx0208-1978	. #x2622)	; ø»‚ƒ—
    (chinese-gb2312		. #x2622)	; ø»„›
    (japanese-jisx0208		. #x2622)	; ø»†—Ÿ
    (korean-ksc5601		. #x2542)	; ø»ˆ ¥
    (chinese-cns11643-1		. #x2476)	; ø»‘ˆ‹
    (japanese-jisx0208-1990	. #x2622)	; ø»‚ƒ—
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B3)
    (greek-iso8859-7	. #xC3)	; øº’¼ƒ
    (ucs		. #x393)	; Î“
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER GAMMA")
    (->ucs		. #x0393)	; Î“
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0393)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER GAMMA")))
    (japanese-jisx0208-1978	. #x2623)	; ø»‚ƒ˜
    (chinese-gb2312		. #x2623)	; ø»„œ
    (japanese-jisx0208		. #x2623)	; ø»†— 
    (korean-ksc5601		. #x2543)	; ø»ˆ ¦
    (chinese-cns11643-1		. #x2477)	; ø»‘ˆŒ
    (japanese-jisx0208-1990	. #x2623)	; ø»‚ƒ˜
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B4)
    (greek-iso8859-7	. #xC4)	; øº’¼„
    (ucs		. #x394)	; Î”
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER DELTA")
    (->ucs		. #x0394)	; Î”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0394)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER DELTA")))
    (japanese-jisx0208-1978	. #x2624)	; ø»‚ƒ™
    (chinese-gb2312		. #x2624)	; ø»„
    (japanese-jisx0208		. #x2624)	; ø»†—¡
    (korean-ksc5601		. #x2544)	; ø»ˆ §
    (chinese-cns11643-1		. #x2478)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2624)	; ø»‚ƒ™
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B5)
    (greek-iso8859-7	. #xC5)	; øº’¼…
    (ucs		. #x395)	; Î•
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER EPSILON")
    (->ucs		. #x0395)	; Î•
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0395)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER EPSILON")))
    (japanese-jisx0208-1978	. #x2625)	; ø»‚ƒš
    (chinese-gb2312		. #x2625)	; ø»„ž
    (japanese-jisx0208		. #x2625)	; ø»†—¢
    (korean-ksc5601		. #x2545)	; ø»ˆ ¨
    (chinese-cns11643-1		. #x2479)	; ø»‘ˆŽ
    (japanese-jisx0208-1990	. #x2625)	; ø»‚ƒš
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B6)
    (greek-iso8859-7	. #xC6)	; øº’¼†
    (ucs		. #x396)	; Î–
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ZETA")
    (->ucs		. #x0396)	; Î–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0396)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ZETA")))
    (japanese-jisx0208-1978	. #x2626)	; ø»‚ƒ›
    (chinese-gb2312		. #x2626)	; ø»„Ÿ
    (japanese-jisx0208		. #x2626)	; ø»†—£
    (korean-ksc5601		. #x2546)	; ø»ˆ ©
    (chinese-cns11643-1		. #x247A)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2626)	; ø»‚ƒ›
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B7)
    (greek-iso8859-7	. #xC7)	; øº’¼‡
    (ucs		. #x397)	; Î—
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER ETA")
    (->ucs		. #x0397)	; Î—
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0397)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER ETA")))
    (japanese-jisx0208-1978	. #x2627)	; ø»‚ƒœ
    (chinese-gb2312		. #x2627)	; ø»„ 
    (japanese-jisx0208		. #x2627)	; ø»†—¤
    (korean-ksc5601		. #x2547)	; ø»ˆ ª
    (chinese-cns11643-1		. #x247B)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2627)	; ø»‚ƒœ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B8)
    (greek-iso8859-7	. #xC8)	; øº’¼ˆ
    (ucs		. #x398)	; Î˜
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER THETA")
    (->ucs		. #x0398)	; Î˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0398)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER THETA")))
    (japanese-jisx0208-1978	. #x2628)	; ø»‚ƒ
    (chinese-gb2312		. #x2628)	; ø»„¡
    (japanese-jisx0208		. #x2628)	; ø»†—¥
    (korean-ksc5601		. #x2548)	; ø»ˆ «
    (chinese-cns11643-1		. #x247C)	; ø»‘ˆ‘
    (japanese-jisx0208-1990	. #x2628)	; ø»‚ƒ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03B9)
    (greek-iso8859-7	. #xC9)	; øº’¼‰
    (ucs		. #x399)	; Î™
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER IOTA")
    (->ucs		. #x0399)	; Î™
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0399)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA")))
    (japanese-jisx0208-1978	. #x2629)	; ø»‚ƒž
    (chinese-gb2312		. #x2629)	; ø»„¢
    (japanese-jisx0208		. #x2629)	; ø»†—¦
    (korean-ksc5601		. #x2549)	; ø»ˆ ¬
    (chinese-cns11643-1		. #x247D)	; ø»‘ˆ’
    (japanese-jisx0208-1990	. #x2629)	; ø»‚ƒž
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BA)
    (greek-iso8859-7	. #xCA)	; øº’¼Š
    (ucs		. #x39A)	; Îš
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER KAPPA")
    (->ucs		. #x039A)	; Îš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039A)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER KAPPA")))
    (japanese-jisx0208-1978	. #x262A)	; ø»‚ƒŸ
    (chinese-gb2312		. #x262A)	; ø»„£
    (japanese-jisx0208		. #x262A)	; ø»†—§
    (korean-ksc5601		. #x254A)	; ø»ˆ ­
    (chinese-cns11643-1		. #x247E)	; ø»‘ˆ“
    (japanese-jisx0208-1990	. #x262A)	; ø»‚ƒŸ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BB)
    (greek-iso8859-7	. #xCB)	; øº’¼‹
    (ucs		. #x39B)	; Î›
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER LAMDA")
    (->ucs		. #x039B)	; Î›
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039B)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER LAMDA")))
    (japanese-jisx0208-1978	. #x262B)	; ø»‚ƒ 
    (chinese-gb2312		. #x262B)	; ø»„¤
    (japanese-jisx0208		. #x262B)	; ø»†—¨
    (korean-ksc5601		. #x254B)	; ø»ˆ ®
    (chinese-cns11643-1		. #x2521)	; ø»‘ˆ”
    (japanese-jisx0208-1990	. #x262B)	; ø»‚ƒ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BC)
    (greek-iso8859-7	. #xCC)	; øº’¼Œ
    (ucs		. #x39C)	; Îœ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER MU")
    (->ucs		. #x039C)	; Îœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039C)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER MU")))
    (japanese-jisx0208-1978	. #x262C)	; ø»‚ƒ¡
    (chinese-gb2312		. #x262C)	; ø»„¥
    (japanese-jisx0208		. #x262C)	; ø»†—©
    (korean-ksc5601		. #x254C)	; ø»ˆ ¯
    (chinese-cns11643-1		. #x2522)	; ø»‘ˆ•
    (japanese-jisx0208-1990	. #x262C)	; ø»‚ƒ¡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BD)
    (greek-iso8859-7	. #xCD)	; øº’¼
    (ucs		. #x39D)	; Î
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER NU")
    (->ucs		. #x039D)	; Î
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039D)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER NU")))
    (japanese-jisx0208-1978	. #x262D)	; ø»‚ƒ¢
    (chinese-gb2312		. #x262D)	; ø»„¦
    (japanese-jisx0208		. #x262D)	; ø»†—ª
    (korean-ksc5601		. #x254D)	; ø»ˆ °
    (chinese-cns11643-1		. #x2523)	; ø»‘ˆ–
    (japanese-jisx0208-1990	. #x262D)	; ø»‚ƒ¢
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BE)
    (greek-iso8859-7	. #xCE)	; øº’¼Ž
    (ucs		. #x39E)	; Îž
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER XI")
    (->ucs		. #x039E)	; Îž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039E)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER XI")))
    (japanese-jisx0208-1978	. #x262E)	; ø»‚ƒ£
    (chinese-gb2312		. #x262E)	; ø»„§
    (japanese-jisx0208		. #x262E)	; ø»†—«
    (korean-ksc5601		. #x254E)	; ø»ˆ ±
    (chinese-cns11643-1		. #x2524)	; ø»‘ˆ—
    (japanese-jisx0208-1990	. #x262E)	; ø»‚ƒ£
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03BF)
    (greek-iso8859-7	. #xCF)	; øº’¼
    (ucs		. #x39F)	; ÎŸ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMICRON")
    (->ucs		. #x039F)	; ÎŸ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039F)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMICRON")))
    (japanese-jisx0208-1978	. #x262F)	; ø»‚ƒ¤
    (chinese-gb2312		. #x262F)	; ø»„¨
    (japanese-jisx0208		. #x262F)	; ø»†—¬
    (korean-ksc5601		. #x254F)	; ø»ˆ ²
    (chinese-cns11643-1		. #x2525)	; ø»‘ˆ˜
    (japanese-jisx0208-1990	. #x262F)	; ø»‚ƒ¤
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C0)
    (greek-iso8859-7	. #xD0)	; øº’¼
    (ucs		. #x3A0)	; Î 
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PI")
    (->ucs		. #x03A0)	; Î 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A0)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PI")))
    (japanese-jisx0208-1978	. #x2630)	; ø»‚ƒ¥
    (chinese-gb2312		. #x2630)	; ø»„©
    (japanese-jisx0208		. #x2630)	; ø»†—­
    (korean-ksc5601		. #x2550)	; ø»ˆ ³
    (chinese-cns11643-1		. #x2526)	; ø»‘ˆ™
    (japanese-jisx0208-1990	. #x2630)	; ø»‚ƒ¥
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C1)
    (greek-iso8859-7	. #xD1)	; øº’¼‘
    (ucs		. #x3A1)	; Î¡
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER RHO")
    (->ucs		. #x03A1)	; Î¡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A1)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER RHO")))
    (japanese-jisx0208-1978	. #x2631)	; ø»‚ƒ¦
    (chinese-gb2312		. #x2631)	; ø»„ª
    (japanese-jisx0208		. #x2631)	; ø»†—®
    (korean-ksc5601		. #x2551)	; ø»ˆ ´
    (chinese-cns11643-1		. #x2527)	; ø»‘ˆš
    (japanese-jisx0208-1990	. #x2631)	; ø»‚ƒ¦
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C3)
    (greek-iso8859-7	. #xD3)	; øº’¼“
    (ucs		. #x3A3)	; Î£
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER SIGMA")
    (->ucs		. #x03A3)	; Î£
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A3)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER SIGMA")))
    (japanese-jisx0208-1978	. #x2632)	; ø»‚ƒ§
    (chinese-gb2312		. #x2632)	; ø»„«
    (japanese-jisx0208		. #x2632)	; ø»†—¯
    (korean-ksc5601		. #x2552)	; ø»ˆ µ
    (chinese-cns11643-1		. #x2528)	; ø»‘ˆ›
    (japanese-jisx0208-1990	. #x2632)	; ø»‚ƒ§
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C4)
    (greek-iso8859-7	. #xD4)	; øº’¼”
    (ucs		. #x3A4)	; Î¤
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER TAU")
    (->ucs		. #x03A4)	; Î¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A4)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER TAU")))
    (japanese-jisx0208-1978	. #x2633)	; ø»‚ƒ¨
    (chinese-gb2312		. #x2633)	; ø»„¬
    (japanese-jisx0208		. #x2633)	; ø»†—°
    (korean-ksc5601		. #x2553)	; ø»ˆ ¶
    (chinese-cns11643-1		. #x2529)	; ø»‘ˆœ
    (japanese-jisx0208-1990	. #x2633)	; ø»‚ƒ¨
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C5)
    (greek-iso8859-7	. #xD5)	; øº’¼•
    (ucs		. #x3A5)	; Î¥
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER UPSILON")
    (->ucs		. #x03A5)	; Î¥
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A5)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON")))
    (japanese-jisx0208-1978	. #x2634)	; ø»‚ƒ©
    (chinese-gb2312		. #x2634)	; ø»„­
    (japanese-jisx0208		. #x2634)	; ø»†—±
    (korean-ksc5601		. #x2554)	; ø»ˆ ·
    (chinese-cns11643-1		. #x252A)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2634)	; ø»‚ƒ©
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C6)
    (greek-iso8859-7	. #xD6)	; øº’¼–
    (ucs		. #x3A6)	; Î¦
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PHI")
    (->ucs		. #x03A6)	; Î¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A6)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PHI")))
    (japanese-jisx0208-1978	. #x2635)	; ø»‚ƒª
    (chinese-gb2312		. #x2635)	; ø»„®
    (japanese-jisx0208		. #x2635)	; ø»†—²
    (korean-ksc5601		. #x2555)	; ø»ˆ ¸
    (chinese-cns11643-1		. #x252B)	; ø»‘ˆž
    (japanese-jisx0208-1990	. #x2635)	; ø»‚ƒª
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C7)
    (greek-iso8859-7	. #xD7)	; øº’¼—
    (ucs		. #x3A7)	; Î§
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER CHI")
    (->ucs		. #x03A7)	; Î§
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A7)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER CHI")))
    (japanese-jisx0208-1978	. #x2636)	; ø»‚ƒ«
    (chinese-gb2312		. #x2636)	; ø»„¯
    (japanese-jisx0208		. #x2636)	; ø»†—³
    (korean-ksc5601		. #x2556)	; ø»ˆ ¹
    (chinese-cns11643-1		. #x252C)	; ø»‘ˆŸ
    (japanese-jisx0208-1990	. #x2636)	; ø»‚ƒ«
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C8)
    (greek-iso8859-7	. #xD8)	; øº’¼˜
    (ucs		. #x3A8)	; Î¨
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER PSI")
    (->ucs		. #x03A8)	; Î¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A8)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER PSI")))
    (japanese-jisx0208-1978	. #x2637)	; ø»‚ƒ¬
    (chinese-gb2312		. #x2637)	; ø»„°
    (japanese-jisx0208		. #x2637)	; ø»†—´
    (korean-ksc5601		. #x2557)	; ø»ˆ º
    (chinese-cns11643-1		. #x252D)	; ø»‘ˆ 
    (japanese-jisx0208-1990	. #x2637)	; ø»‚ƒ¬
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03C9)
    (greek-iso8859-7	. #xD9)	; øº’¼™
    (ucs		. #x3A9)	; Î©
    ))
(define-char
  '((name		. "FULLWIDTH GREEK CAPITAL LETTER OMEGA")
    (->ucs		. #x03A9)	; Î©
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A9)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER OMEGA")))
    (japanese-jisx0208-1978	. #x2638)	; ø»‚ƒ­
    (chinese-gb2312		. #x2638)	; ø»„±
    (japanese-jisx0208		. #x2638)	; ø»†—µ
    (korean-ksc5601		. #x2558)	; ø»ˆ »
    (chinese-cns11643-1		. #x252E)	; ø»‘ˆ¡
    (japanese-jisx0208-1990	. #x2638)	; ø»‚ƒ­
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->lowercase	#x03CA)
    (greek-iso8859-7	. #xDA)	; øº’¼š
    (ucs		. #x3AA)	; Îª
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03AA)	; Îª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AA)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	. #x2665)	; ø»Š¬ª
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->lowercase	#x03CB)
    (greek-iso8859-7	. #xDB)	; øº’¼›
    (ucs		. #x3AB)	; Î«
    ))
(define-char
  '((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03AB)	; Î«
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AB)
    (->lowercase
     ((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	. #x266A)	; ø»Š¬¯
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->uppercase	#x0386)
    (->titlecase	#x0386)
    (greek-iso8859-7	. #xDC)	; øº’¼œ
    (ucs		. #x3AC)	; Î¬
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA WITH TONOS")
    (->ucs		. #x03AC)	; Î¬
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA WITH TONOS")))
    (japanese-jisx0212	. #x2671)	; ø»Š¬¶
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->uppercase	#x0388)
    (->titlecase	#x0388)
    (greek-iso8859-7	. #xDD)	; øº’¼
    (ucs		. #x3AD)	; Î­
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON WITH TONOS")
    (->ucs		. #x03AD)	; Î­
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2672)	; ø»Š¬·
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->uppercase	#x0389)
    (->titlecase	#x0389)
    (greek-iso8859-7	. #xDE)	; øº’¼ž
    (ucs		. #x3AE)	; Î®
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA WITH TONOS")
    (->ucs		. #x03AE)	; Î®
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA WITH TONOS")))
    (japanese-jisx0212	. #x2673)	; ø»Š¬¸
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->uppercase	#x038A)
    (->titlecase	#x038A)
    (greek-iso8859-7	. #xDF)	; øº’¼Ÿ
    (ucs		. #x3AF)	; Î¯
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA WITH TONOS")
    (->ucs		. #x03AF)	; Î¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AF)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH TONOS")))
    (japanese-jisx0212	. #x2674)	; ø»Š¬¹
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (greek-iso8859-7	. #xE0)	; øº’¼ 
    (ucs		. #x3B0)	; Î°
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (->ucs		. #x03B0)	; Î°
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B0)
    (japanese-jisx0212	. #x267B)	; ø»Š­€
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0391)
    (->titlecase	#x0391)
    (greek-iso8859-7	. #xE1)	; øº’¼¡
    (ucs		. #x3B1)	; Î±
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ALPHA")
    (->ucs		. #x03B1)	; Î±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B1)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ALPHA")))
    (japanese-jisx0208-1978	. #x2641)	; ø»‚ƒ¶
    (chinese-gb2312		. #x2641)	; ø»„º
    (japanese-jisx0208		. #x2641)	; ø»†—¾
    (korean-ksc5601		. #x2561)	; ø»ˆ¡„
    (chinese-cns11643-1		. #x252F)	; ø»‘ˆ¢
    (japanese-jisx0208-1990	. #x2641)	; ø»‚ƒ¶
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (greek-iso8859-7	. #xE2)	; øº’¼¢
    (ucs		. #x3B2)	; Î²
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER BETA")
    (->ucs		. #x03B2)	; Î²
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B2)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER BETA")))
    (japanese-jisx0208-1978	. #x2642)	; ø»‚ƒ·
    (chinese-gb2312		. #x2642)	; ø»„»
    (japanese-jisx0208		. #x2642)	; ø»†—¿
    (korean-ksc5601		. #x2562)	; ø»ˆ¡…
    (chinese-cns11643-1		. #x2530)	; ø»‘ˆ£
    (japanese-jisx0208-1990	. #x2642)	; ø»‚ƒ·
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0393)
    (->titlecase	#x0393)
    (greek-iso8859-7	. #xE3)	; øº’¼£
    (ucs		. #x3B3)	; Î³
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER GAMMA")
    (->ucs		. #x03B3)	; Î³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B3)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER GAMMA")))
    (japanese-jisx0208-1978	. #x2643)	; ø»‚ƒ¸
    (chinese-gb2312		. #x2643)	; ø»„¼
    (japanese-jisx0208		. #x2643)	; ø»†˜€
    (korean-ksc5601		. #x2563)	; ø»ˆ¡†
    (chinese-cns11643-1		. #x2531)	; ø»‘ˆ¤
    (japanese-jisx0208-1990	. #x2643)	; ø»‚ƒ¸
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0394)
    (->titlecase	#x0394)
    (greek-iso8859-7	. #xE4)	; øº’¼¤
    (ucs		. #x3B4)	; Î´
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER DELTA")
    (->ucs		. #x03B4)	; Î´
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B4)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER DELTA")))
    (japanese-jisx0208-1978	. #x2644)	; ø»‚ƒ¹
    (chinese-gb2312		. #x2644)	; ø»„½
    (japanese-jisx0208		. #x2644)	; ø»†˜
    (korean-ksc5601		. #x2564)	; ø»ˆ¡‡
    (chinese-cns11643-1		. #x2532)	; ø»‘ˆ¥
    (japanese-jisx0208-1990	. #x2644)	; ø»‚ƒ¹
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0395)
    (->titlecase	#x0395)
    (greek-iso8859-7	. #xE5)	; øº’¼¥
    (ucs		. #x3B5)	; Îµ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER EPSILON")
    (->ucs		. #x03B5)	; Îµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B5)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER EPSILON")))
    (japanese-jisx0208-1978	. #x2645)	; ø»‚ƒº
    (chinese-gb2312		. #x2645)	; ø»„¾
    (japanese-jisx0208		. #x2645)	; ø»†˜‚
    (korean-ksc5601		. #x2565)	; ø»ˆ¡ˆ
    (chinese-cns11643-1		. #x2533)	; ø»‘ˆ¦
    (japanese-jisx0208-1990	. #x2645)	; ø»‚ƒº
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0396)
    (->titlecase	#x0396)
    (greek-iso8859-7	. #xE6)	; øº’¼¦
    (ucs		. #x3B6)	; Î¶
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ZETA")
    (->ucs		. #x03B6)	; Î¶
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B6)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ZETA")))
    (japanese-jisx0208-1978	. #x2646)	; ø»‚ƒ»
    (chinese-gb2312		. #x2646)	; ø»„¿
    (japanese-jisx0208		. #x2646)	; ø»†˜ƒ
    (korean-ksc5601		. #x2566)	; ø»ˆ¡‰
    (chinese-cns11643-1		. #x2534)	; ø»‘ˆ§
    (japanese-jisx0208-1990	. #x2646)	; ø»‚ƒ»
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0397)
    (->titlecase	#x0397)
    (greek-iso8859-7	. #xE7)	; øº’¼§
    (ucs		. #x3B7)	; Î·
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER ETA")
    (->ucs		. #x03B7)	; Î·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B7)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER ETA")))
    (japanese-jisx0208-1978	. #x2647)	; ø»‚ƒ¼
    (chinese-gb2312		. #x2647)	; ø»„Ž€
    (japanese-jisx0208		. #x2647)	; ø»†˜„
    (korean-ksc5601		. #x2567)	; ø»ˆ¡Š
    (chinese-cns11643-1		. #x2535)	; ø»‘ˆ¨
    (japanese-jisx0208-1990	. #x2647)	; ø»‚ƒ¼
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (greek-iso8859-7	. #xE8)	; øº’¼¨
    (ipa		. #xC8)	; øº’›ˆ
    (ucs		. #x3B8)	; Î¸
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER THETA")
    (->ucs		. #x03B8)	; Î¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B8)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER THETA")))
    (japanese-jisx0208-1978	. #x2648)	; ø»‚ƒ½
    (chinese-gb2312		. #x2648)	; ø»„Ž
    (japanese-jisx0208		. #x2648)	; ø»†˜…
    (korean-ksc5601		. #x2568)	; ø»ˆ¡‹
    (chinese-cns11643-1		. #x2536)	; ø»‘ˆ©
    (japanese-jisx0208-1990	. #x2648)	; ø»‚ƒ½
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0399)
    (->titlecase	#x0399)
    (greek-iso8859-7	. #xE9)	; øº’¼©
    (ucs		. #x3B9)	; Î¹
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER IOTA")
    (->ucs		. #x03B9)	; Î¹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B9)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA")))
    (japanese-jisx0208-1978	. #x2649)	; ø»‚ƒ¾
    (chinese-gb2312		. #x2649)	; ø»„Ž‚
    (japanese-jisx0208		. #x2649)	; ø»†˜†
    (korean-ksc5601		. #x2569)	; ø»ˆ¡Œ
    (chinese-cns11643-1		. #x2537)	; ø»‘ˆª
    (japanese-jisx0208-1990	. #x2649)	; ø»‚ƒ¾
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (greek-iso8859-7	. #xEA)	; øº’¼ª
    (ucs		. #x3BA)	; Îº
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER KAPPA")
    (->ucs		. #x03BA)	; Îº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BA)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (japanese-jisx0208-1978	. #x264A)	; ø»‚ƒ¿
    (chinese-gb2312		. #x264A)	; ø»„Žƒ
    (japanese-jisx0208		. #x264A)	; ø»†˜‡
    (korean-ksc5601		. #x256A)	; ø»ˆ¡
    (chinese-cns11643-1		. #x2538)	; ø»‘ˆ«
    (japanese-jisx0208-1990	. #x264A)	; ø»‚ƒ¿
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039B)
    (->titlecase	#x039B)
    (greek-iso8859-7	. #xEB)	; øº’¼«
    (ucs		. #x3BB)	; Î»
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER LAMDA")
    (->ucs		. #x03BB)	; Î»
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BB)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER LAMDA")))
    (japanese-jisx0208-1978	. #x264B)	; ø»‚„€
    (chinese-gb2312		. #x264B)	; ø»„Ž„
    (japanese-jisx0208		. #x264B)	; ø»†˜ˆ
    (korean-ksc5601		. #x256B)	; ø»ˆ¡Ž
    (chinese-cns11643-1		. #x2539)	; ø»‘ˆ¬
    (japanese-jisx0208-1990	. #x264B)	; ø»‚„€
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039C)
    (->titlecase	#x039C)
    (greek-iso8859-7	. #xEC)	; øº’¼¬
    (ucs		. #x3BC)	; Î¼
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER MU")
    (->ucs		. #x03BC)	; Î¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER MU")))
    (japanese-jisx0208-1978	. #x264C)	; ø»‚„
    (chinese-gb2312		. #x264C)	; ø»„Ž…
    (japanese-jisx0208		. #x264C)	; ø»†˜‰
    (korean-ksc5601		. #x256C)	; ø»ˆ¡
    (chinese-cns11643-1		. #x253A)	; ø»‘ˆ­
    (japanese-jisx0208-1990	. #x264C)	; ø»‚„
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039D)
    (->titlecase	#x039D)
    (greek-iso8859-7	. #xED)	; øº’¼­
    (ucs		. #x3BD)	; Î½
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER NU")
    (->ucs		. #x03BD)	; Î½
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER NU")))
    (japanese-jisx0208-1978	. #x264D)	; ø»‚„‚
    (chinese-gb2312		. #x264D)	; ø»„Ž†
    (japanese-jisx0208		. #x264D)	; ø»†˜Š
    (korean-ksc5601		. #x256D)	; ø»ˆ¡
    (chinese-cns11643-1		. #x253B)	; ø»‘ˆ®
    (japanese-jisx0208-1990	. #x264D)	; ø»‚„‚
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039E)
    (->titlecase	#x039E)
    (greek-iso8859-7	. #xEE)	; øº’¼®
    (ucs		. #x3BE)	; Î¾
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER XI")
    (->ucs		. #x03BE)	; Î¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER XI")))
    (japanese-jisx0208-1978	. #x264E)	; ø»‚„ƒ
    (chinese-gb2312		. #x264E)	; ø»„Ž‡
    (japanese-jisx0208		. #x264E)	; ø»†˜‹
    (korean-ksc5601		. #x256E)	; ø»ˆ¡‘
    (chinese-cns11643-1		. #x253C)	; ø»‘ˆ¯
    (japanese-jisx0208-1990	. #x264E)	; ø»‚„ƒ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x039F)
    (->titlecase	#x039F)
    (greek-iso8859-7	. #xEF)	; øº’¼¯
    (ucs		. #x3BF)	; Î¿
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON")
    (->ucs		. #x03BF)	; Î¿
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BF)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON")))
    (japanese-jisx0208-1978	. #x264F)	; ø»‚„„
    (chinese-gb2312		. #x264F)	; ø»„Žˆ
    (japanese-jisx0208		. #x264F)	; ø»†˜Œ
    (korean-ksc5601		. #x256F)	; ø»ˆ¡’
    (chinese-cns11643-1		. #x253D)	; ø»‘ˆ°
    (japanese-jisx0208-1990	. #x264F)	; ø»‚„„
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (greek-iso8859-7	. #xF0)	; øº’¼°
    (ucs		. #x3C0)	; Ï€
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PI")
    (->ucs		. #x03C0)	; Ï€
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C0)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PI")))
    (japanese-jisx0208-1978	. #x2650)	; ø»‚„…
    (chinese-gb2312		. #x2650)	; ø»„Ž‰
    (japanese-jisx0208		. #x2650)	; ø»†˜
    (korean-ksc5601		. #x2570)	; ø»ˆ¡“
    (chinese-cns11643-1		. #x253E)	; ø»‘ˆ±
    (japanese-jisx0208-1990	. #x2650)	; ø»‚„…
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (greek-iso8859-7	. #xF1)	; øº’¼±
    (ucs		. #x3C1)	; Ï
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER RHO")
    (->ucs		. #x03C1)	; Ï
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C1)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER RHO")))
    (japanese-jisx0208-1978	. #x2651)	; ø»‚„†
    (chinese-gb2312		. #x2651)	; ø»„ŽŠ
    (japanese-jisx0208		. #x2651)	; ø»†˜Ž
    (korean-ksc5601		. #x2571)	; ø»ˆ¡”
    (chinese-cns11643-1		. #x253F)	; ø»‘ˆ²
    (japanese-jisx0208-1990	. #x2651)	; ø»‚„†
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7		. #xF2)	; øº’¼²
    (japanese-jisx0213-1	. #x2659)	; Ï‚
    (ucs			. #x3C2)	; Ï‚
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER FINAL SIGMA")
    (->ucs		. #x03C2)	; Ï‚
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C2)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER FINAL SIGMA")))
    (japanese-jisx0212	. #x2678)	; ø»Š¬½
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (greek-iso8859-7	. #xF3)	; øº’¼³
    (ucs		. #x3C3)	; Ïƒ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER SIGMA")
    (->ucs		. #x03C3)	; Ïƒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C3)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER SIGMA")))
    (japanese-jisx0208-1978	. #x2652)	; ø»‚„‡
    (chinese-gb2312		. #x2652)	; ø»„Ž‹
    (japanese-jisx0208		. #x2652)	; ø»†˜
    (korean-ksc5601		. #x2572)	; ø»ˆ¡•
    (chinese-cns11643-1		. #x2540)	; ø»‘ˆ³
    (japanese-jisx0208-1990	. #x2652)	; ø»‚„‡
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A4)
    (->titlecase	#x03A4)
    (greek-iso8859-7	. #xF4)	; øº’¼´
    (ucs		. #x3C4)	; Ï„
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER TAU")
    (->ucs		. #x03C4)	; Ï„
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C4)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER TAU")))
    (japanese-jisx0208-1978	. #x2653)	; ø»‚„ˆ
    (chinese-gb2312		. #x2653)	; ø»„ŽŒ
    (japanese-jisx0208		. #x2653)	; ø»†˜
    (korean-ksc5601		. #x2573)	; ø»ˆ¡–
    (chinese-cns11643-1		. #x2541)	; ø»‘ˆ´
    (japanese-jisx0208-1990	. #x2653)	; ø»‚„ˆ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A5)
    (->titlecase	#x03A5)
    (greek-iso8859-7	. #xF5)	; øº’¼µ
    (ucs		. #x3C5)	; Ï…
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON")
    (->ucs		. #x03C5)	; Ï…
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C5)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON")))
    (japanese-jisx0208-1978	. #x2654)	; ø»‚„‰
    (chinese-gb2312		. #x2654)	; ø»„Ž
    (japanese-jisx0208		. #x2654)	; ø»†˜‘
    (korean-ksc5601		. #x2574)	; ø»ˆ¡—
    (chinese-cns11643-1		. #x2542)	; ø»‘ˆµ
    (japanese-jisx0208-1990	. #x2654)	; ø»‚„‰
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (greek-iso8859-7	. #xF6)	; øº’¼¶
    (ucs		. #x3C6)	; Ï†
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PHI")
    (->ucs		. #x03C6)	; Ï†
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C6)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PHI")))
    (japanese-jisx0208-1978	. #x2655)	; ø»‚„Š
    (chinese-gb2312		. #x2655)	; ø»„ŽŽ
    (japanese-jisx0208		. #x2655)	; ø»†˜’
    (korean-ksc5601		. #x2575)	; ø»ˆ¡˜
    (chinese-cns11643-1		. #x2543)	; ø»‘ˆ¶
    (japanese-jisx0208-1990	. #x2655)	; ø»‚„Š
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A7)
    (->titlecase	#x03A7)
    (greek-iso8859-7	. #xF7)	; øº’¼·
    (ucs		. #x3C7)	; Ï‡
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER CHI")
    (->ucs		. #x03C7)	; Ï‡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C7)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER CHI")))
    (japanese-jisx0208-1978	. #x2656)	; ø»‚„‹
    (chinese-gb2312		. #x2656)	; ø»„Ž
    (japanese-jisx0208		. #x2656)	; ø»†˜“
    (korean-ksc5601		. #x2576)	; ø»ˆ¡™
    (chinese-cns11643-1		. #x2544)	; ø»‘ˆ·
    (japanese-jisx0208-1990	. #x2656)	; ø»‚„‹
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A8)
    (->titlecase	#x03A8)
    (greek-iso8859-7	. #xF8)	; øº’¼¸
    (ucs		. #x3C8)	; Ïˆ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER PSI")
    (->ucs		. #x03C8)	; Ïˆ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C8)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER PSI")))
    (japanese-jisx0208-1978	. #x2657)	; ø»‚„Œ
    (chinese-gb2312		. #x2657)	; ø»„Ž
    (japanese-jisx0208		. #x2657)	; ø»†˜”
    (korean-ksc5601		. #x2577)	; ø»ˆ¡š
    (chinese-cns11643-1		. #x2545)	; ø»‘ˆ¸
    (japanese-jisx0208-1990	. #x2657)	; ø»‚„Œ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03A9)
    (->titlecase	#x03A9)
    (greek-iso8859-7	. #xF9)	; øº’¼¹
    (ucs		. #x3C9)	; Ï‰
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA")
    (->ucs		. #x03C9)	; Ï‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C9)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA")))
    (japanese-jisx0208-1978	. #x2658)	; ø»‚„
    (chinese-gb2312		. #x2658)	; ø»„Ž‘
    (japanese-jisx0208		. #x2658)	; ø»†˜•
    (korean-ksc5601		. #x2578)	; ø»ˆ¡›
    (chinese-cns11643-1		. #x2546)	; ø»‘ˆ¹
    (japanese-jisx0208-1990	. #x2658)	; ø»‚„
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->uppercase	#x03AA)
    (->titlecase	#x03AA)
    (greek-iso8859-7	. #xFA)	; øº’¼º
    (ucs		. #x3CA)	; ÏŠ
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (->ucs		. #x03CA)	; ÏŠ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CA)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")))
    (japanese-jisx0212	. #x2675)	; ø»Š¬º
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->uppercase	#x03AB)
    (->titlecase	#x03AB)
    (greek-iso8859-7	. #xFB)	; øº’¼»
    (ucs		. #x3CB)	; Ï‹
    ))
(define-char
  '((name . "FULLWIDTH GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (->ucs		. #x03CB)	; Ï‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CB)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")))
    (japanese-jisx0212	. #x267A)	; ø»Š¬¿
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->uppercase	#x038C)
    (->titlecase	#x038C)
    (greek-iso8859-7	. #xFC)	; øº’¼¼
    (ucs		. #x3CC)	; ÏŒ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMICRON WITH TONOS")
    (->ucs		. #x03CC)	; ÏŒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CC)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMICRON WITH TONOS")))
    (japanese-jisx0212	. #x2677)	; ø»Š¬¼
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->uppercase	#x038E)
    (->titlecase	#x038E)
    (greek-iso8859-7	. #xFD)	; øº’¼½
    (ucs		. #x3CD)	; Ï
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER UPSILON WITH TONOS")
    (->ucs		. #x03CD)	; Ï
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CD)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER UPSILON WITH TONOS")))
    (japanese-jisx0212	. #x2679)	; ø»Š¬¾
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->uppercase	#x038F)
    (->titlecase	#x038F)
    (greek-iso8859-7	. #xFE)	; øº’¼¾
    (ucs		. #x3CE)	; ÏŽ
    ))
(define-char
  '((name		. "FULLWIDTH GREEK SMALL LETTER OMEGA WITH TONOS")
    (->ucs		. #x03CE)	; ÏŽ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CE)
    (->uppercase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (->titlecase
     ((name . "FULLWIDTH GREEK CAPITAL LETTER OMEGA WITH TONOS")))
    (japanese-jisx0212	. #x267C)	; ø»Š­
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B2)
    (->uppercase	#x0392)
    (->titlecase	#x0392)
    (ucs		. #x3D0)	; Ï
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B8)
    (->uppercase	#x0398)
    (->titlecase	#x0398)
    (ucs		. #x3D1)	; Ï‘
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03A5)
    (ucs		. #x3D2)	; Ï’
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0301)
    (ucs		. #x3D3)	; Ï“
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0308)
    (ucs		. #x3D4)	; Ï”
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C6)
    (->uppercase	#x03A6)
    (->titlecase	#x03A6)
    (ucs		. #x3D5)	; Ï•
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C0)
    (->uppercase	#x03A0)
    (->titlecase	#x03A0)
    (ucs		. #x3D6)	; Ï–
    ))
(define-char
  '((name		. "GREEK KAI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x3D7)	; Ï—
    ))
(define-char
  '((name		. "GREEK LETTER STIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DB)
    (ucs		. #x3DA)	; Ïš
    ))
(define-char
  '((name		. "GREEK SMALL LETTER STIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DA)
    (->titlecase	#x03DA)
    (ucs		. #x3DB)	; Ï›
    ))
(define-char
  '((name		. "GREEK LETTER DIGAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DD)
    (ucs		. #x3DC)	; Ïœ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DIGAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DC)
    (->titlecase	#x03DC)
    (ucs		. #x3DD)	; Ï
    ))
(define-char
  '((name		. "GREEK LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03DF)
    (ucs		. #x3DE)	; Ïž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03DE)
    (->titlecase	#x03DE)
    (ucs		. #x3DF)	; ÏŸ
    ))
(define-char
  '((name		. "GREEK LETTER SAMPI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E1)
    (ucs		. #x3E0)	; Ï 
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SAMPI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E0)
    (->titlecase	#x03E0)
    (ucs		. #x3E1)	; Ï¡
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E3)
    (ucs		. #x3E2)	; Ï¢
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E2)
    (->titlecase	#x03E2)
    (ucs		. #x3E3)	; Ï£
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER FEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E5)
    (ucs		. #x3E4)	; Ï¤
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER FEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E4)
    (->titlecase	#x03E4)
    (ucs		. #x3E5)	; Ï¥
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER KHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E7)
    (ucs		. #x3E6)	; Ï¦
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER KHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E6)
    (->titlecase	#x03E6)
    (ucs		. #x3E7)	; Ï§
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER HORI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03E9)
    (ucs		. #x3E8)	; Ï¨
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER HORI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03E8)
    (->titlecase	#x03E8)
    (ucs		. #x3E9)	; Ï©
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER GANGIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03EB)
    (ucs		. #x3EA)	; Ïª
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER GANGIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EA)
    (->titlecase	#x03EA)
    (ucs		. #x3EB)	; Ï«
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHIMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03ED)
    (ucs		. #x3EC)	; Ï¬
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHIMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EC)
    (->titlecase	#x03EC)
    (ucs		. #x3ED)	; Ï­
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER DEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x03EF)
    (ucs		. #x3EE)	; Ï®
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER DEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x03EE)
    (->titlecase	#x03EE)
    (ucs		. #x3EF)	; Ï¯
    ))
(define-char
  '((name		. "GREEK KAPPA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BA)
    (->uppercase	#x039A)
    (->titlecase	#x039A)
    (ucs		. #x3F0)	; Ï°
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C1)
    (->uppercase	#x03A1)
    (->titlecase	#x03A1)
    (ucs		. #x3F1)	; Ï±
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C2)
    (->uppercase	#x03A3)
    (->titlecase	#x03A3)
    (ucs		. #x3F2)	; Ï²
    ))
(define-char
  '((name		. "GREEK LETTER YOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x3F3)	; Ï³
    ))
