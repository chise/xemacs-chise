(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    (->decomposition	#x02B9)
    (ucs		. #x0374)	; Í´
    ))
(define-char
  '((name		. "GREEK LOWER NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Aristeri keraia")
    (ucs		. #x0375)	; Íµ
    ))
(define-char
  '((name		. "GREEK YPOGEGRAMMENI")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0345)
    (ucs		. #x037A)	; Íº
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    (->decomposition	#x003B)
    (ucs		. #x037E)	; Í¾
    ))
(define-char
  '((name		. "GREEK TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek tonos")
      (japanese-jisx0212  . #x2238)	; ø»Š¦…
      ))
    (greek-iso8859-7	. #xB4)	; øº’»´
    (ucs		. #x0384)	; Î„
    ))
(define-char
  '((name		. "fullwidth greek tonos")
    (=>ucs		. #x0384)	; Î„
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0384)
    (<-fullwidth
     ((name		  . "GREEK TONOS")
      (ucs		  . #x0384)	; Î„
      ))
    (japanese-jisx0212	. #x2238)	; ø»Š¦…
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek dialytika tonos")
      (japanese-jisx0212  . #x2239)	; ø»Š¦†
      ))
    (greek-iso8859-7	. #xB5)	; øº’»µ
    (ucs		. #x0385)	; Î…
    ))
(define-char
  '((name		. "fullwidth greek dialytika tonos")
    (=>ucs		. #x0385)	; Î…
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0385)
    (<-fullwidth
     ((name		  . "GREEK DIALYTIKA TONOS")
      (ucs		  . #x0385)	; Î…
      ))
    (japanese-jisx0212	. #x2239)	; ø»Š¦†
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter alpha with tonos")
      (japanese-jisx0212  . #x2661)	; ø»Š¬¦
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (ucs		  . #x03AC)	; Î¬
      ))
    (greek-iso8859-7	. #xB6)	; øº’»¶
    (ucs		. #x0386)	; Î†
    ))
(define-char
  '((name . "fullwidth greek capital letter alpha with tonos")
    (=>ucs		. #x0386)	; Î†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0386)
    (->lowercase
     ((name . "fullwidth greek small letter alpha with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (ucs		  . #x0386)	; Î†
      ))
    (japanese-jisx0212	. #x2661)	; ø»Š¬¦
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00B7)
    (ucs		. #x0387)	; Î‡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0395 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter epsilon with tonos")
      (japanese-jisx0212  . #x2662)	; ø»Š¬§
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (ucs		  . #x03AD)	; Î­
      ))
    (greek-iso8859-7	. #xB8)	; øº’»¸
    (ucs		. #x0388)	; Îˆ
    ))
(define-char
  '((name . "fullwidth greek capital letter epsilon with tonos")
    (=>ucs		. #x0388)	; Îˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0388)
    (->lowercase
     ((name . "fullwidth greek small letter epsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (ucs		  . #x0388)	; Îˆ
      ))
    (japanese-jisx0212	. #x2662)	; ø»Š¬§
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter eta with tonos")
      (japanese-jisx0212  . #x2663)	; ø»Š¬¨
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (ucs		  . #x03AE)	; Î®
      ))
    (greek-iso8859-7	. #xB9)	; øº’»¹
    (ucs		. #x0389)	; Î‰
    ))
(define-char
  '((name . "fullwidth greek capital letter eta with tonos")
    (=>ucs		. #x0389)	; Î‰
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0389)
    (->lowercase
     ((name . "fullwidth greek small letter eta with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (ucs		  . #x0389)	; Î‰
      ))
    (japanese-jisx0212	. #x2663)	; ø»Š¬¨
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with tonos")
      (japanese-jisx0212  . #x2664)	; ø»Š¬©
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (ucs		  . #x03AF)	; Î¯
      ))
    (greek-iso8859-7	. #xBA)	; øº’»º
    (ucs		. #x038A)	; ÎŠ
    ))
(define-char
  '((name . "fullwidth greek capital letter iota with tonos")
    (=>ucs		. #x038A)	; ÎŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038A)
    (->lowercase
     ((name . "fullwidth greek small letter iota with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (ucs		  . #x038A)	; ÎŠ
      ))
    (japanese-jisx0212	. #x2664)	; ø»Š¬©
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omicron with tonos")
      (japanese-jisx0212  . #x2667)	; ø»Š¬¬
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (ucs		  . #x03CC)	; ÏŒ
      ))
    (greek-iso8859-7	. #xBC)	; øº’»¼
    (ucs		. #x038C)	; ÎŒ
    ))
(define-char
  '((name . "fullwidth greek capital letter omicron with tonos")
    (=>ucs		. #x038C)	; ÎŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038C)
    (->lowercase
     ((name . "fullwidth greek small letter omicron with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (ucs		  . #x038C)	; ÎŒ
      ))
    (japanese-jisx0212	. #x2667)	; ø»Š¬¬
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with tonos")
      (japanese-jisx0212  . #x2669)	; ø»Š¬®
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (ucs		  . #x03CD)	; Ï
      ))
    (greek-iso8859-7	. #xBE)	; øº’»¾
    (ucs		. #x038E)	; ÎŽ
    ))
(define-char
  '((name . "fullwidth greek capital letter upsilon with tonos")
    (=>ucs		. #x038E)	; ÎŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038E)
    (->lowercase
     ((name . "fullwidth greek small letter upsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (ucs		  . #x038E)	; ÎŽ
      ))
    (japanese-jisx0212	. #x2669)	; ø»Š¬®
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omega with tonos")
      (japanese-jisx0212  . #x266C)	; ø»Š¬±
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (ucs		  . #x03CE)	; ÏŽ
      ))
    (greek-iso8859-7	. #xBF)	; øº’»¿
    (ucs		. #x038F)	; Î
    ))
(define-char
  '((name . "fullwidth greek capital letter omega with tonos")
    (=>ucs		. #x038F)	; Î
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038F)
    (->lowercase
     ((name . "fullwidth greek small letter omega with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (ucs		  . #x038F)	; Î
      ))
    (japanese-jisx0212	. #x266C)	; ø»Š¬±
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika and tonos")
      (japanese-jisx0212  . #x2676)	; ø»Š¬»
      ))
    (greek-iso8859-7	. #xC0)	; øº’¼€
    (ucs		. #x0390)	; Î
    ))
(define-char
  '((name . "fullwidth greek small letter iota with dialytika and tonos")
    (=>ucs		. #x0390)	; Î
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0390)
    (<-fullwidth
     ((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
      (ucs		  . #x0390)	; Î
      ))
    (japanese-jisx0212	. #x2676)	; ø»Š¬»
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter alpha")
      (japanese-jisx0208-1978	  . #x2621)	; ø»‚ƒ–
      (chinese-gb2312		  . #x2621)	; ø»„š
      (japanese-jisx0208	  . #x2621)	; ø»†—ž
      (korean-ksc5601		  . #x2541)	; ø»ˆ ¤
      (chinese-cns11643-1	  . #x2475)	; ø»‘ˆŠ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (ucs		  . #x03B1)	; Î±
      ))
    (greek-iso8859-7	. #xC1)	; øº’¼
    (ucs		. #x0391)	; Î‘
    ))
(define-char
  '((name		. "fullwidth greek capital letter alpha")
    (=>ucs		. #x0391)	; Î‘
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0391)
    (->lowercase
     ((name		  . "fullwidth greek small letter alpha")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (ucs		  . #x0391)	; Î‘
      ))
    (japanese-jisx0208-1978	. #x2621)	; ø»‚ƒ–
    (chinese-gb2312		. #x2621)	; ø»„š
    (japanese-jisx0208		. #x2621)	; ø»†—ž
    (korean-ksc5601		. #x2541)	; ø»ˆ ¤
    (chinese-cns11643-1		. #x2475)	; ø»‘ˆŠ
    (japanese-jisx0208-1990	. #x2621)	; ø½‰½’
    (chinese-big5		. #xA344)	; øºŸŸ¾
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter beta")
      (japanese-jisx0208-1978	  . #x2622)	; ø»‚ƒ—
      (chinese-gb2312		  . #x2622)	; ø»„›
      (japanese-jisx0208	  . #x2622)	; ø»†—Ÿ
      (korean-ksc5601		  . #x2542)	; ø»ˆ ¥
      (chinese-cns11643-1	  . #x2476)	; ø»‘ˆ‹
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER BETA")
      (ucs		  . #x03B2)	; Î²
      ))
    (greek-iso8859-7	. #xC2)	; øº’¼‚
    (ucs		. #x0392)	; Î’
    ))
(define-char
  '((name		. "fullwidth greek capital letter beta")
    (=>ucs		. #x0392)	; Î’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0392)
    (->lowercase
     ((name		  . "fullwidth greek small letter beta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (ucs		  . #x0392)	; Î’
      ))
    (japanese-jisx0208-1978	. #x2622)	; ø»‚ƒ—
    (chinese-gb2312		. #x2622)	; ø»„›
    (japanese-jisx0208		. #x2622)	; ø»†—Ÿ
    (korean-ksc5601		. #x2542)	; ø»ˆ ¥
    (chinese-cns11643-1		. #x2476)	; ø»‘ˆ‹
    (japanese-jisx0208-1990	. #x2622)	; ø½‰½“
    (chinese-big5		. #xA345)	; øºŸŸ¿
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter gamma")
      (japanese-jisx0208-1978	  . #x2623)	; ø»‚ƒ˜
      (chinese-gb2312		  . #x2623)	; ø»„œ
      (japanese-jisx0208	  . #x2623)	; ø»†— 
      (korean-ksc5601		  . #x2543)	; ø»ˆ ¦
      (chinese-cns11643-1	  . #x2477)	; ø»‘ˆŒ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (ucs		  . #x03B3)	; Î³
      ))
    (greek-iso8859-7	. #xC3)	; øº’¼ƒ
    (ucs		. #x0393)	; Î“
    ))
(define-char
  '((name		. "fullwidth greek capital letter gamma")
    (=>ucs		. #x0393)	; Î“
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0393)
    (->lowercase
     ((name		  . "fullwidth greek small letter gamma")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (ucs		  . #x0393)	; Î“
      ))
    (japanese-jisx0208-1978	. #x2623)	; ø»‚ƒ˜
    (chinese-gb2312		. #x2623)	; ø»„œ
    (japanese-jisx0208		. #x2623)	; ø»†— 
    (korean-ksc5601		. #x2543)	; ø»ˆ ¦
    (chinese-cns11643-1		. #x2477)	; ø»‘ˆŒ
    (japanese-jisx0208-1990	. #x2623)	; ø½‰½”
    (chinese-big5		. #xA346)	; øºŸ €
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter delta")
      (japanese-jisx0208-1978	  . #x2624)	; ø»‚ƒ™
      (chinese-gb2312		  . #x2624)	; ø»„
      (japanese-jisx0208	  . #x2624)	; ø»†—¡
      (korean-ksc5601		  . #x2544)	; ø»ˆ §
      (chinese-cns11643-1	  . #x2478)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DELTA")
      (ucs		  . #x03B4)	; Î´
      ))
    (greek-iso8859-7	. #xC4)	; øº’¼„
    (ucs		. #x0394)	; Î”
    ))
(define-char
  '((name		. "fullwidth greek capital letter delta")
    (=>ucs		. #x0394)	; Î”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0394)
    (->lowercase
     ((name		  . "fullwidth greek small letter delta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (ucs		  . #x0394)	; Î”
      ))
    (japanese-jisx0208-1978	. #x2624)	; ø»‚ƒ™
    (chinese-gb2312		. #x2624)	; ø»„
    (japanese-jisx0208		. #x2624)	; ø»†—¡
    (korean-ksc5601		. #x2544)	; ø»ˆ §
    (chinese-cns11643-1		. #x2478)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2624)	; ø½‰½•
    (chinese-big5		. #xA347)	; øºŸ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter epsilon")
      (japanese-jisx0208-1978	  . #x2625)	; ø»‚ƒš
      (chinese-gb2312		  . #x2625)	; ø»„ž
      (japanese-jisx0208	  . #x2625)	; ø»†—¢
      (korean-ksc5601		  . #x2545)	; ø»ˆ ¨
      (chinese-cns11643-1	  . #x2479)	; ø»‘ˆŽ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (ucs		  . #x03B5)	; Îµ
      ))
    (greek-iso8859-7	. #xC5)	; øº’¼…
    (ucs		. #x0395)	; Î•
    ))
(define-char
  '((name		. "fullwidth greek capital letter epsilon")
    (=>ucs		. #x0395)	; Î•
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0395)
    (->lowercase
     ((name		  . "fullwidth greek small letter epsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (ucs		  . #x0395)	; Î•
      ))
    (japanese-jisx0208-1978	. #x2625)	; ø»‚ƒš
    (chinese-gb2312		. #x2625)	; ø»„ž
    (japanese-jisx0208		. #x2625)	; ø»†—¢
    (korean-ksc5601		. #x2545)	; ø»ˆ ¨
    (chinese-cns11643-1		. #x2479)	; ø»‘ˆŽ
    (japanese-jisx0208-1990	. #x2625)	; ø½‰½–
    (chinese-big5		. #xA348)	; øºŸ ‚
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter zeta")
      (japanese-jisx0208-1978	  . #x2626)	; ø»‚ƒ›
      (chinese-gb2312		  . #x2626)	; ø»„Ÿ
      (japanese-jisx0208	  . #x2626)	; ø»†—£
      (korean-ksc5601		  . #x2546)	; ø»ˆ ©
      (chinese-cns11643-1	  . #x247A)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ZETA")
      (ucs		  . #x03B6)	; Î¶
      ))
    (greek-iso8859-7	. #xC6)	; øº’¼†
    (ucs		. #x0396)	; Î–
    ))
(define-char
  '((name		. "fullwidth greek capital letter zeta")
    (=>ucs		. #x0396)	; Î–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0396)
    (->lowercase
     ((name		  . "fullwidth greek small letter zeta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (ucs		  . #x0396)	; Î–
      ))
    (japanese-jisx0208-1978	. #x2626)	; ø»‚ƒ›
    (chinese-gb2312		. #x2626)	; ø»„Ÿ
    (japanese-jisx0208		. #x2626)	; ø»†—£
    (korean-ksc5601		. #x2546)	; ø»ˆ ©
    (chinese-cns11643-1		. #x247A)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2626)	; ø½‰½—
    (chinese-big5		. #xA349)	; øºŸ ƒ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter eta")
      (japanese-jisx0208-1978	  . #x2627)	; ø»‚ƒœ
      (chinese-gb2312		  . #x2627)	; ø»„ 
      (japanese-jisx0208	  . #x2627)	; ø»†—¤
      (korean-ksc5601		  . #x2547)	; ø»ˆ ª
      (chinese-cns11643-1	  . #x247B)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA")
      (ucs		  . #x03B7)	; Î·
      ))
    (greek-iso8859-7	. #xC7)	; øº’¼‡
    (ucs		. #x0397)	; Î—
    ))
(define-char
  '((name		. "fullwidth greek capital letter eta")
    (=>ucs		. #x0397)	; Î—
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0397)
    (->lowercase
     ((name		  . "fullwidth greek small letter eta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (ucs		  . #x0397)	; Î—
      ))
    (japanese-jisx0208-1978	. #x2627)	; ø»‚ƒœ
    (chinese-gb2312		. #x2627)	; ø»„ 
    (japanese-jisx0208		. #x2627)	; ø»†—¤
    (korean-ksc5601		. #x2547)	; ø»ˆ ª
    (chinese-cns11643-1		. #x247B)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2627)	; ø½‰½˜
    (chinese-big5		. #xA34A)	; øºŸ „
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter theta")
      (japanese-jisx0208-1978	  . #x2628)	; ø»‚ƒ
      (chinese-gb2312		  . #x2628)	; ø»„¡
      (japanese-jisx0208	  . #x2628)	; ø»†—¥
      (korean-ksc5601		  . #x2548)	; ø»ˆ «
      (chinese-cns11643-1	  . #x247C)	; ø»‘ˆ‘
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER THETA")
      (ucs		  . #x03B8)	; Î¸
      ))
    (greek-iso8859-7	. #xC8)	; øº’¼ˆ
    (ucs		. #x0398)	; Î˜
    ))
(define-char
  '((name		. "fullwidth greek capital letter theta")
    (=>ucs		. #x0398)	; Î˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0398)
    (->lowercase
     ((name		  . "fullwidth greek small letter theta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (ucs		  . #x0398)	; Î˜
      ))
    (japanese-jisx0208-1978	. #x2628)	; ø»‚ƒ
    (chinese-gb2312		. #x2628)	; ø»„¡
    (japanese-jisx0208		. #x2628)	; ø»†—¥
    (korean-ksc5601		. #x2548)	; ø»ˆ «
    (chinese-cns11643-1		. #x247C)	; ø»‘ˆ‘
    (japanese-jisx0208-1990	. #x2628)	; ø½‰½™
    (chinese-big5		. #xA34B)	; øºŸ …
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter iota")
      (japanese-jisx0208-1978	  . #x2629)	; ø»‚ƒž
      (chinese-gb2312		  . #x2629)	; ø»„¢
      (japanese-jisx0208	  . #x2629)	; ø»†—¦
      (korean-ksc5601		  . #x2549)	; ø»ˆ ¬
      (chinese-cns11643-1	  . #x247D)	; ø»‘ˆ’
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA")
      (ucs		  . #x03B9)	; Î¹
      ))
    (greek-iso8859-7	. #xC9)	; øº’¼‰
    (ucs		. #x0399)	; Î™
    ))
(define-char
  '((name		. "fullwidth greek capital letter iota")
    (=>ucs		. #x0399)	; Î™
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0399)
    (->lowercase
     ((name		  . "fullwidth greek small letter iota")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (ucs		  . #x0399)	; Î™
      ))
    (japanese-jisx0208-1978	. #x2629)	; ø»‚ƒž
    (chinese-gb2312		. #x2629)	; ø»„¢
    (japanese-jisx0208		. #x2629)	; ø»†—¦
    (korean-ksc5601		. #x2549)	; ø»ˆ ¬
    (chinese-cns11643-1		. #x247D)	; ø»‘ˆ’
    (japanese-jisx0208-1990	. #x2629)	; ø½‰½š
    (chinese-big5		. #xA34C)	; øºŸ †
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter kappa")
      (japanese-jisx0208-1978	  . #x262A)	; ø»‚ƒŸ
      (chinese-gb2312		  . #x262A)	; ø»„£
      (japanese-jisx0208	  . #x262A)	; ø»†—§
      (korean-ksc5601		  . #x254A)	; ø»ˆ ­
      (chinese-cns11643-1	  . #x247E)	; ø»‘ˆ“
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (ucs		  . #x03BA)	; Îº
      ))
    (greek-iso8859-7	. #xCA)	; øº’¼Š
    (ucs		. #x039A)	; Îš
    ))
(define-char
  '((name		. "fullwidth greek capital letter kappa")
    (=>ucs		. #x039A)	; Îš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039A)
    (->lowercase
     ((name		  . "fullwidth greek small letter kappa")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (ucs		  . #x039A)	; Îš
      ))
    (japanese-jisx0208-1978	. #x262A)	; ø»‚ƒŸ
    (chinese-gb2312		. #x262A)	; ø»„£
    (japanese-jisx0208		. #x262A)	; ø»†—§
    (korean-ksc5601		. #x254A)	; ø»ˆ ­
    (chinese-cns11643-1		. #x247E)	; ø»‘ˆ“
    (japanese-jisx0208-1990	. #x262A)	; ø½‰½›
    (chinese-big5		. #xA34D)	; øºŸ ‡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter lamda")
      (japanese-jisx0208-1978	  . #x262B)	; ø»‚ƒ 
      (chinese-gb2312		  . #x262B)	; ø»„¤
      (japanese-jisx0208	  . #x262B)	; ø»†—¨
      (korean-ksc5601		  . #x254B)	; ø»ˆ ®
      (chinese-cns11643-1	  . #x2521)	; ø»‘ˆ”
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (ucs		  . #x03BB)	; Î»
      ))
    (greek-iso8859-7	. #xCB)	; øº’¼‹
    (ucs		. #x039B)	; Î›
    ))
(define-char
  '((name		. "fullwidth greek capital letter lamda")
    (=>ucs		. #x039B)	; Î›
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039B)
    (->lowercase
     ((name		  . "fullwidth greek small letter lamda")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (ucs		  . #x039B)	; Î›
      ))
    (japanese-jisx0208-1978	. #x262B)	; ø»‚ƒ 
    (chinese-gb2312		. #x262B)	; ø»„¤
    (japanese-jisx0208		. #x262B)	; ø»†—¨
    (korean-ksc5601		. #x254B)	; ø»ˆ ®
    (chinese-cns11643-1		. #x2521)	; ø»‘ˆ”
    (japanese-jisx0208-1990	. #x262B)	; ø½‰½œ
    (chinese-big5		. #xA34E)	; øºŸ ˆ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter mu")
      (japanese-jisx0208-1978	  . #x262C)	; ø»‚ƒ¡
      (chinese-gb2312		  . #x262C)	; ø»„¥
      (japanese-jisx0208	  . #x262C)	; ø»†—©
      (korean-ksc5601		  . #x254C)	; ø»ˆ ¯
      (chinese-cns11643-1	  . #x2522)	; ø»‘ˆ•
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER MU")
      (ucs		  . #x03BC)	; Î¼
      ))
    (greek-iso8859-7	. #xCC)	; øº’¼Œ
    (ucs		. #x039C)	; Îœ
    ))
(define-char
  '((name		. "fullwidth greek capital letter mu")
    (=>ucs		. #x039C)	; Îœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039C)
    (->lowercase
     ((name		  . "fullwidth greek small letter mu")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER MU")
      (ucs		  . #x039C)	; Îœ
      ))
    (japanese-jisx0208-1978	. #x262C)	; ø»‚ƒ¡
    (chinese-gb2312		. #x262C)	; ø»„¥
    (japanese-jisx0208		. #x262C)	; ø»†—©
    (korean-ksc5601		. #x254C)	; ø»ˆ ¯
    (chinese-cns11643-1		. #x2522)	; ø»‘ˆ•
    (japanese-jisx0208-1990	. #x262C)	; ø½‰½
    (chinese-big5		. #xA34F)	; øºŸ ‰
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter nu")
      (japanese-jisx0208-1978	  . #x262D)	; ø»‚ƒ¢
      (chinese-gb2312		  . #x262D)	; ø»„¦
      (japanese-jisx0208	  . #x262D)	; ø»†—ª
      (korean-ksc5601		  . #x254D)	; ø»ˆ °
      (chinese-cns11643-1	  . #x2523)	; ø»‘ˆ–
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER NU")
      (ucs		  . #x03BD)	; Î½
      ))
    (greek-iso8859-7	. #xCD)	; øº’¼
    (ucs		. #x039D)	; Î
    ))
(define-char
  '((name		. "fullwidth greek capital letter nu")
    (=>ucs		. #x039D)	; Î
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039D)
    (->lowercase
     ((name		  . "fullwidth greek small letter nu")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER NU")
      (ucs		  . #x039D)	; Î
      ))
    (japanese-jisx0208-1978	. #x262D)	; ø»‚ƒ¢
    (chinese-gb2312		. #x262D)	; ø»„¦
    (japanese-jisx0208		. #x262D)	; ø»†—ª
    (korean-ksc5601		. #x254D)	; ø»ˆ °
    (chinese-cns11643-1		. #x2523)	; ø»‘ˆ–
    (japanese-jisx0208-1990	. #x262D)	; ø½‰½ž
    (chinese-big5		. #xA350)	; øºŸ Š
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter xi")
      (japanese-jisx0208-1978	  . #x262E)	; ø»‚ƒ£
      (chinese-gb2312		  . #x262E)	; ø»„§
      (japanese-jisx0208	  . #x262E)	; ø»†—«
      (korean-ksc5601		  . #x254E)	; ø»ˆ ±
      (chinese-cns11643-1	  . #x2524)	; ø»‘ˆ—
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER XI")
      (ucs		  . #x03BE)	; Î¾
      ))
    (greek-iso8859-7	. #xCE)	; øº’¼Ž
    (ucs		. #x039E)	; Îž
    ))
(define-char
  '((name		. "fullwidth greek capital letter xi")
    (=>ucs		. #x039E)	; Îž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039E)
    (->lowercase
     ((name		  . "fullwidth greek small letter xi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER XI")
      (ucs		  . #x039E)	; Îž
      ))
    (japanese-jisx0208-1978	. #x262E)	; ø»‚ƒ£
    (chinese-gb2312		. #x262E)	; ø»„§
    (japanese-jisx0208		. #x262E)	; ø»†—«
    (korean-ksc5601		. #x254E)	; ø»ˆ ±
    (chinese-cns11643-1		. #x2524)	; ø»‘ˆ—
    (japanese-jisx0208-1990	. #x262E)	; ø½‰½Ÿ
    (chinese-big5		. #xA351)	; øºŸ ‹
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omicron")
      (japanese-jisx0208-1978	  . #x262F)	; ø»‚ƒ¤
      (chinese-gb2312		  . #x262F)	; ø»„¨
      (japanese-jisx0208	  . #x262F)	; ø»†—¬
      (korean-ksc5601		  . #x254F)	; ø»ˆ ²
      (chinese-cns11643-1	  . #x2525)	; ø»‘ˆ˜
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (ucs		  . #x03BF)	; Î¿
      ))
    (greek-iso8859-7	. #xCF)	; øº’¼
    (ucs		. #x039F)	; ÎŸ
    ))
(define-char
  '((name		. "fullwidth greek capital letter omicron")
    (=>ucs		. #x039F)	; ÎŸ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039F)
    (->lowercase
     ((name		  . "fullwidth greek small letter omicron")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (ucs		  . #x039F)	; ÎŸ
      ))
    (japanese-jisx0208-1978	. #x262F)	; ø»‚ƒ¤
    (chinese-gb2312		. #x262F)	; ø»„¨
    (japanese-jisx0208		. #x262F)	; ø»†—¬
    (korean-ksc5601		. #x254F)	; ø»ˆ ²
    (chinese-cns11643-1		. #x2525)	; ø»‘ˆ˜
    (japanese-jisx0208-1990	. #x262F)	; ø½‰½ 
    (chinese-big5		. #xA352)	; øºŸ Œ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter pi")
      (japanese-jisx0208-1978	  . #x2630)	; ø»‚ƒ¥
      (chinese-gb2312		  . #x2630)	; ø»„©
      (japanese-jisx0208	  . #x2630)	; ø»†—­
      (korean-ksc5601		  . #x2550)	; ø»ˆ ³
      (chinese-cns11643-1	  . #x2526)	; ø»‘ˆ™
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PI")
      (ucs		  . #x03C0)	; Ï€
      ))
    (greek-iso8859-7	. #xD0)	; øº’¼
    (ucs		. #x03A0)	; Î 
    ))
(define-char
  '((name		. "fullwidth greek capital letter pi")
    (=>ucs		. #x03A0)	; Î 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A0)
    (->lowercase
     ((name		  . "fullwidth greek small letter pi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PI")
      (ucs		  . #x03A0)	; Î 
      ))
    (japanese-jisx0208-1978	. #x2630)	; ø»‚ƒ¥
    (chinese-gb2312		. #x2630)	; ø»„©
    (japanese-jisx0208		. #x2630)	; ø»†—­
    (korean-ksc5601		. #x2550)	; ø»ˆ ³
    (chinese-cns11643-1		. #x2526)	; ø»‘ˆ™
    (japanese-jisx0208-1990	. #x2630)	; ø½‰½¡
    (chinese-big5		. #xA353)	; øºŸ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter rho")
      (japanese-jisx0208-1978	  . #x2631)	; ø»‚ƒ¦
      (chinese-gb2312		  . #x2631)	; ø»„ª
      (japanese-jisx0208	  . #x2631)	; ø»†—®
      (korean-ksc5601		  . #x2551)	; ø»ˆ ´
      (chinese-cns11643-1	  . #x2527)	; ø»‘ˆš
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER RHO")
      (ucs		  . #x03C1)	; Ï
      ))
    (greek-iso8859-7	. #xD1)	; øº’¼‘
    (ucs		. #x03A1)	; Î¡
    ))
(define-char
  '((name		. "fullwidth greek capital letter rho")
    (=>ucs		. #x03A1)	; Î¡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A1)
    (->lowercase
     ((name		  . "fullwidth greek small letter rho")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (ucs		  . #x03A1)	; Î¡
      ))
    (japanese-jisx0208-1978	. #x2631)	; ø»‚ƒ¦
    (chinese-gb2312		. #x2631)	; ø»„ª
    (japanese-jisx0208		. #x2631)	; ø»†—®
    (korean-ksc5601		. #x2551)	; ø»ˆ ´
    (chinese-cns11643-1		. #x2527)	; ø»‘ˆš
    (japanese-jisx0208-1990	. #x2631)	; ø½‰½¢
    (chinese-big5		. #xA354)	; øºŸ Ž
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter sigma")
      (japanese-jisx0208-1978	  . #x2632)	; ø»‚ƒ§
      (chinese-gb2312		  . #x2632)	; ø»„«
      (japanese-jisx0208	  . #x2632)	; ø»†—¯
      (korean-ksc5601		  . #x2552)	; ø»ˆ µ
      (chinese-cns11643-1	  . #x2528)	; ø»‘ˆ›
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (ucs		  . #x03C3)	; Ïƒ
      ))
    (greek-iso8859-7	. #xD3)	; øº’¼“
    (ucs		. #x03A3)	; Î£
    ))
(define-char
  '((name		. "fullwidth greek capital letter sigma")
    (=>ucs		. #x03A3)	; Î£
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A3)
    (->lowercase
     ((name		  . "fullwidth greek small letter sigma")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (ucs		  . #x03A3)	; Î£
      ))
    (japanese-jisx0208-1978	. #x2632)	; ø»‚ƒ§
    (chinese-gb2312		. #x2632)	; ø»„«
    (japanese-jisx0208		. #x2632)	; ø»†—¯
    (korean-ksc5601		. #x2552)	; ø»ˆ µ
    (chinese-cns11643-1		. #x2528)	; ø»‘ˆ›
    (japanese-jisx0208-1990	. #x2632)	; ø½‰½£
    (chinese-big5		. #xA355)	; øºŸ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter tau")
      (japanese-jisx0208-1978	  . #x2633)	; ø»‚ƒ¨
      (chinese-gb2312		  . #x2633)	; ø»„¬
      (japanese-jisx0208	  . #x2633)	; ø»†—°
      (korean-ksc5601		  . #x2553)	; ø»ˆ ¶
      (chinese-cns11643-1	  . #x2529)	; ø»‘ˆœ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER TAU")
      (ucs		  . #x03C4)	; Ï„
      ))
    (greek-iso8859-7	. #xD4)	; øº’¼”
    (ucs		. #x03A4)	; Î¤
    ))
(define-char
  '((name		. "fullwidth greek capital letter tau")
    (=>ucs		. #x03A4)	; Î¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A4)
    (->lowercase
     ((name		  . "fullwidth greek small letter tau")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (ucs		  . #x03A4)	; Î¤
      ))
    (japanese-jisx0208-1978	. #x2633)	; ø»‚ƒ¨
    (chinese-gb2312		. #x2633)	; ø»„¬
    (japanese-jisx0208		. #x2633)	; ø»†—°
    (korean-ksc5601		. #x2553)	; ø»ˆ ¶
    (chinese-cns11643-1		. #x2529)	; ø»‘ˆœ
    (japanese-jisx0208-1990	. #x2633)	; ø½‰½¤
    (chinese-big5		. #xA356)	; øºŸ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter upsilon")
      (japanese-jisx0208-1978	  . #x2634)	; ø»‚ƒ©
      (chinese-gb2312		  . #x2634)	; ø»„­
      (japanese-jisx0208	  . #x2634)	; ø»†—±
      (korean-ksc5601		  . #x2554)	; ø»ˆ ·
      (chinese-cns11643-1	  . #x252A)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (ucs		  . #x03C5)	; Ï…
      ))
    (greek-iso8859-7	. #xD5)	; øº’¼•
    (ucs		. #x03A5)	; Î¥
    ))
(define-char
  '((name		. "fullwidth greek capital letter upsilon")
    (=>ucs		. #x03A5)	; Î¥
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A5)
    (->lowercase
     ((name		  . "fullwidth greek small letter upsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (ucs		  . #x03A5)	; Î¥
      ))
    (japanese-jisx0208-1978	. #x2634)	; ø»‚ƒ©
    (chinese-gb2312		. #x2634)	; ø»„­
    (japanese-jisx0208		. #x2634)	; ø»†—±
    (korean-ksc5601		. #x2554)	; ø»ˆ ·
    (chinese-cns11643-1		. #x252A)	; ø»‘ˆ
    (japanese-jisx0208-1990	. #x2634)	; ø½‰½¥
    (chinese-big5		. #xA357)	; øºŸ ‘
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter phi")
      (japanese-jisx0208-1978	  . #x2635)	; ø»‚ƒª
      (chinese-gb2312		  . #x2635)	; ø»„®
      (japanese-jisx0208	  . #x2635)	; ø»†—²
      (korean-ksc5601		  . #x2555)	; ø»ˆ ¸
      (chinese-cns11643-1	  . #x252B)	; ø»‘ˆž
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PHI")
      (ucs		  . #x03C6)	; Ï†
      ))
    (greek-iso8859-7	. #xD6)	; øº’¼–
    (ucs		. #x03A6)	; Î¦
    ))
(define-char
  '((name		. "fullwidth greek capital letter phi")
    (=>ucs		. #x03A6)	; Î¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A6)
    (->lowercase
     ((name		  . "fullwidth greek small letter phi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (ucs		  . #x03A6)	; Î¦
      ))
    (japanese-jisx0208-1978	. #x2635)	; ø»‚ƒª
    (chinese-gb2312		. #x2635)	; ø»„®
    (japanese-jisx0208		. #x2635)	; ø»†—²
    (korean-ksc5601		. #x2555)	; ø»ˆ ¸
    (chinese-cns11643-1		. #x252B)	; ø»‘ˆž
    (japanese-jisx0208-1990	. #x2635)	; ø½‰½¦
    (chinese-big5		. #xA358)	; øºŸ ’
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter chi")
      (japanese-jisx0208-1978	  . #x2636)	; ø»‚ƒ«
      (chinese-gb2312		  . #x2636)	; ø»„¯
      (japanese-jisx0208	  . #x2636)	; ø»†—³
      (korean-ksc5601		  . #x2556)	; ø»ˆ ¹
      (chinese-cns11643-1	  . #x252C)	; ø»‘ˆŸ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER CHI")
      (ucs		  . #x03C7)	; Ï‡
      ))
    (greek-iso8859-7	. #xD7)	; øº’¼—
    (ucs		. #x03A7)	; Î§
    ))
(define-char
  '((name		. "fullwidth greek capital letter chi")
    (=>ucs		. #x03A7)	; Î§
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A7)
    (->lowercase
     ((name		  . "fullwidth greek small letter chi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (ucs		  . #x03A7)	; Î§
      ))
    (japanese-jisx0208-1978	. #x2636)	; ø»‚ƒ«
    (chinese-gb2312		. #x2636)	; ø»„¯
    (japanese-jisx0208		. #x2636)	; ø»†—³
    (korean-ksc5601		. #x2556)	; ø»ˆ ¹
    (chinese-cns11643-1		. #x252C)	; ø»‘ˆŸ
    (japanese-jisx0208-1990	. #x2636)	; ø½‰½§
    (chinese-big5		. #xA359)	; øºŸ “
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter psi")
      (japanese-jisx0208-1978	  . #x2637)	; ø»‚ƒ¬
      (chinese-gb2312		  . #x2637)	; ø»„°
      (japanese-jisx0208	  . #x2637)	; ø»†—´
      (korean-ksc5601		  . #x2557)	; ø»ˆ º
      (chinese-cns11643-1	  . #x252D)	; ø»‘ˆ 
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PSI")
      (ucs		  . #x03C8)	; Ïˆ
      ))
    (greek-iso8859-7	. #xD8)	; øº’¼˜
    (ucs		. #x03A8)	; Î¨
    ))
(define-char
  '((name		. "fullwidth greek capital letter psi")
    (=>ucs		. #x03A8)	; Î¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A8)
    (->lowercase
     ((name		  . "fullwidth greek small letter psi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (ucs		  . #x03A8)	; Î¨
      ))
    (japanese-jisx0208-1978	. #x2637)	; ø»‚ƒ¬
    (chinese-gb2312		. #x2637)	; ø»„°
    (japanese-jisx0208		. #x2637)	; ø»†—´
    (korean-ksc5601		. #x2557)	; ø»ˆ º
    (chinese-cns11643-1		. #x252D)	; ø»‘ˆ 
    (japanese-jisx0208-1990	. #x2637)	; ø½‰½¨
    (chinese-big5		. #xA35A)	; øºŸ ”
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omega")
      (japanese-jisx0208-1978	  . #x2638)	; ø»‚ƒ­
      (chinese-gb2312		  . #x2638)	; ø»„±
      (japanese-jisx0208	  . #x2638)	; ø»†—µ
      (korean-ksc5601		  . #x2558)	; ø»ˆ »
      (chinese-cns11643-1	  . #x252E)	; ø»‘ˆ¡
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (ucs		  . #x03C9)	; Ï‰
      ))
    (greek-iso8859-7	. #xD9)	; øº’¼™
    (ucs		. #x03A9)	; Î©
    ))
(define-char
  '((name		. "fullwidth greek capital letter omega")
    (=>ucs		. #x03A9)	; Î©
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A9)
    (->lowercase
     ((name		  . "fullwidth greek small letter omega")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (ucs		  . #x03A9)	; Î©
      ))
    (japanese-jisx0208-1978	. #x2638)	; ø»‚ƒ­
    (chinese-gb2312		. #x2638)	; ø»„±
    (japanese-jisx0208		. #x2638)	; ø»†—µ
    (korean-ksc5601		. #x2558)	; ø»ˆ »
    (chinese-cns11643-1		. #x252E)	; ø»‘ˆ¡
    (japanese-jisx0208-1990	. #x2638)	; ø½‰½©
    (chinese-big5		. #xA35B)	; øºŸ •
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with dialytika")
      (japanese-jisx0212  . #x2665)	; ø»Š¬ª
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (ucs		  . #x03CA)	; ÏŠ
      ))
    (greek-iso8859-7	. #xDA)	; øº’¼š
    (ucs		. #x03AA)	; Îª
    ))
(define-char
  '((name . "fullwidth greek capital letter iota with dialytika")
    (=>ucs		. #x03AA)	; Îª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AA)
    (->lowercase
     ((name . "fullwidth greek small letter iota with dialytika")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (ucs		  . #x03AA)	; Îª
      ))
    (japanese-jisx0212	. #x2665)	; ø»Š¬ª
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with dialytika")
      (japanese-jisx0212  . #x266A)	; ø»Š¬¯
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (ucs		  . #x03CB)	; Ï‹
      ))
    (greek-iso8859-7	. #xDB)	; øº’¼›
    (ucs		. #x03AB)	; Î«
    ))
(define-char
  '((name . "fullwidth greek capital letter upsilon with dialytika")
    (=>ucs		. #x03AB)	; Î«
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AB)
    (->lowercase
     ((name . "fullwidth greek small letter upsilon with dialytika")
      ))
    (<-fullwidth
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (ucs		  . #x03AB)	; Î«
      ))
    (japanese-jisx0212	. #x266A)	; ø»Š¬¯
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter alpha with tonos")
      (japanese-jisx0212  . #x2671)	; ø»Š¬¶
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (ucs		  . #x0386)	; Î†
      ))
    (greek-iso8859-7	. #xDC)	; øº’¼œ
    (ucs		. #x03AC)	; Î¬
    ))
(define-char
  '((name . "fullwidth greek small letter alpha with tonos")
    (=>ucs		. #x03AC)	; Î¬
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AC)
    (->uppercase
     ((name . "fullwidth greek capital letter alpha with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (ucs		  . #x03AC)	; Î¬
      ))
    (japanese-jisx0212	. #x2671)	; ø»Š¬¶
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter epsilon with tonos")
      (japanese-jisx0212  . #x2672)	; ø»Š¬·
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (ucs		  . #x0388)	; Îˆ
      ))
    (greek-iso8859-7	. #xDD)	; øº’¼
    (ucs		. #x03AD)	; Î­
    ))
(define-char
  '((name . "fullwidth greek small letter epsilon with tonos")
    (=>ucs		. #x03AD)	; Î­
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AD)
    (->uppercase
     ((name . "fullwidth greek capital letter epsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (ucs		  . #x03AD)	; Î­
      ))
    (japanese-jisx0212	. #x2672)	; ø»Š¬·
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter eta with tonos")
      (japanese-jisx0212  . #x2673)	; ø»Š¬¸
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (ucs		  . #x0389)	; Î‰
      ))
    (greek-iso8859-7	. #xDE)	; øº’¼ž
    (ucs		. #x03AE)	; Î®
    ))
(define-char
  '((name		. "fullwidth greek small letter eta with tonos")
    (=>ucs		. #x03AE)	; Î®
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AE)
    (->uppercase
     ((name . "fullwidth greek capital letter eta with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (ucs		  . #x03AE)	; Î®
      ))
    (japanese-jisx0212	. #x2673)	; ø»Š¬¸
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with tonos")
      (japanese-jisx0212  . #x2674)	; ø»Š¬¹
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (ucs		  . #x038A)	; ÎŠ
      ))
    (greek-iso8859-7	. #xDF)	; øº’¼Ÿ
    (ucs		. #x03AF)	; Î¯
    ))
(define-char
  '((name		. "fullwidth greek small letter iota with tonos")
    (=>ucs		. #x03AF)	; Î¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AF)
    (->uppercase
     ((name . "fullwidth greek capital letter iota with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (ucs		  . #x03AF)	; Î¯
      ))
    (japanese-jisx0212	. #x2674)	; ø»Š¬¹
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika and tonos")
      (japanese-jisx0212  . #x267B)	; ø»Š­€
      ))
    (greek-iso8859-7	. #xE0)	; øº’¼ 
    (ucs		. #x03B0)	; Î°
    ))
(define-char
  '((name . "fullwidth greek small letter upsilon with dialytika and tonos")
    (=>ucs		. #x03B0)	; Î°
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B0)
    (<-fullwidth
     ((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
      (ucs		  . #x03B0)	; Î°
      ))
    (japanese-jisx0212	. #x267B)	; ø»Š­€
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter alpha")
      (japanese-jisx0208-1978	  . #x2641)	; ø»‚ƒ¶
      (chinese-gb2312		  . #x2641)	; ø»„º
      (japanese-jisx0208	  . #x2641)	; ø»†—¾
      (korean-ksc5601		  . #x2561)	; ø»ˆ¡„
      (chinese-cns11643-1	  . #x252F)	; ø»‘ˆ¢
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (ucs		  . #x0391)	; Î‘
      ))
    (greek-iso8859-7	. #xE1)	; øº’¼¡
    (ucs		. #x03B1)	; Î±
    ))
(define-char
  '((name		. "fullwidth greek small letter alpha")
    (=>ucs		. #x03B1)	; Î±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B1)
    (->uppercase
     ((name		  . "fullwidth greek capital letter alpha")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (ucs		  . #x03B1)	; Î±
      ))
    (japanese-jisx0208-1978	. #x2641)	; ø»‚ƒ¶
    (chinese-gb2312		. #x2641)	; ø»„º
    (japanese-jisx0208		. #x2641)	; ø»†—¾
    (korean-ksc5601		. #x2561)	; ø»ˆ¡„
    (chinese-cns11643-1		. #x252F)	; ø»‘ˆ¢
    (japanese-jisx0208-1990	. #x2641)	; ø½‰½²
    (chinese-big5		. #xA35C)	; øºŸ –
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter beta")
      (japanese-jisx0208-1978	  . #x2642)	; ø»‚ƒ·
      (chinese-gb2312		  . #x2642)	; ø»„»
      (japanese-jisx0208	  . #x2642)	; ø»†—¿
      (korean-ksc5601		  . #x2562)	; ø»ˆ¡…
      (chinese-cns11643-1	  . #x2530)	; ø»‘ˆ£
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (ucs		  . #x0392)	; Î’
      ))
    (greek-iso8859-7	. #xE2)	; øº’¼¢
    (ucs		. #x03B2)	; Î²
    ))
(define-char
  '((name		. "fullwidth greek small letter beta")
    (=>ucs		. #x03B2)	; Î²
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B2)
    (->uppercase
     ((name		  . "fullwidth greek capital letter beta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER BETA")
      (ucs		  . #x03B2)	; Î²
      ))
    (japanese-jisx0208-1978	. #x2642)	; ø»‚ƒ·
    (chinese-gb2312		. #x2642)	; ø»„»
    (japanese-jisx0208		. #x2642)	; ø»†—¿
    (korean-ksc5601		. #x2562)	; ø»ˆ¡…
    (chinese-cns11643-1		. #x2530)	; ø»‘ˆ£
    (japanese-jisx0208-1990	. #x2642)	; ø½‰½³
    (chinese-big5		. #xA35D)	; øºŸ —
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter gamma")
      (japanese-jisx0208-1978	  . #x2643)	; ø»‚ƒ¸
      (chinese-gb2312		  . #x2643)	; ø»„¼
      (japanese-jisx0208	  . #x2643)	; ø»†˜€
      (korean-ksc5601		  . #x2563)	; ø»ˆ¡†
      (chinese-cns11643-1	  . #x2531)	; ø»‘ˆ¤
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (ucs		  . #x0393)	; Î“
      ))
    (greek-iso8859-7	. #xE3)	; øº’¼£
    (ucs		. #x03B3)	; Î³
    ))
(define-char
  '((name		. "fullwidth greek small letter gamma")
    (=>ucs		. #x03B3)	; Î³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B3)
    (->uppercase
     ((name		  . "fullwidth greek capital letter gamma")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (ucs		  . #x03B3)	; Î³
      ))
    (japanese-jisx0208-1978	. #x2643)	; ø»‚ƒ¸
    (chinese-gb2312		. #x2643)	; ø»„¼
    (japanese-jisx0208		. #x2643)	; ø»†˜€
    (korean-ksc5601		. #x2563)	; ø»ˆ¡†
    (chinese-cns11643-1		. #x2531)	; ø»‘ˆ¤
    (japanese-jisx0208-1990	. #x2643)	; ø½‰½´
    (chinese-big5		. #xA35E)	; øºŸ ˜
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter delta")
      (japanese-jisx0208-1978	  . #x2644)	; ø»‚ƒ¹
      (chinese-gb2312		  . #x2644)	; ø»„½
      (japanese-jisx0208	  . #x2644)	; ø»†˜
      (korean-ksc5601		  . #x2564)	; ø»ˆ¡‡
      (chinese-cns11643-1	  . #x2532)	; ø»‘ˆ¥
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (ucs		  . #x0394)	; Î”
      ))
    (greek-iso8859-7	. #xE4)	; øº’¼¤
    (ucs		. #x03B4)	; Î´
    ))
(define-char
  '((name		. "fullwidth greek small letter delta")
    (=>ucs		. #x03B4)	; Î´
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B4)
    (->uppercase
     ((name		  . "fullwidth greek capital letter delta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER DELTA")
      (ucs		  . #x03B4)	; Î´
      ))
    (japanese-jisx0208-1978	. #x2644)	; ø»‚ƒ¹
    (chinese-gb2312		. #x2644)	; ø»„½
    (japanese-jisx0208		. #x2644)	; ø»†˜
    (korean-ksc5601		. #x2564)	; ø»ˆ¡‡
    (chinese-cns11643-1		. #x2532)	; ø»‘ˆ¥
    (japanese-jisx0208-1990	. #x2644)	; ø½‰½µ
    (chinese-big5		. #xA35F)	; øºŸ ™
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter epsilon")
      (japanese-jisx0208-1978	  . #x2645)	; ø»‚ƒº
      (chinese-gb2312		  . #x2645)	; ø»„¾
      (japanese-jisx0208	  . #x2645)	; ø»†˜‚
      (korean-ksc5601		  . #x2565)	; ø»ˆ¡ˆ
      (chinese-cns11643-1	  . #x2533)	; ø»‘ˆ¦
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (ucs		  . #x0395)	; Î•
      ))
    (greek-iso8859-7	. #xE5)	; øº’¼¥
    (ucs		. #x03B5)	; Îµ
    ))
(define-char
  '((name		. "fullwidth greek small letter epsilon")
    (=>ucs		. #x03B5)	; Îµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B5)
    (->uppercase
     ((name		  . "fullwidth greek capital letter epsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (ucs		  . #x03B5)	; Îµ
      ))
    (japanese-jisx0208-1978	. #x2645)	; ø»‚ƒº
    (chinese-gb2312		. #x2645)	; ø»„¾
    (japanese-jisx0208		. #x2645)	; ø»†˜‚
    (korean-ksc5601		. #x2565)	; ø»ˆ¡ˆ
    (chinese-cns11643-1		. #x2533)	; ø»‘ˆ¦
    (japanese-jisx0208-1990	. #x2645)	; ø½‰½¶
    (chinese-big5		. #xA360)	; øºŸ š
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter zeta")
      (japanese-jisx0208-1978	  . #x2646)	; ø»‚ƒ»
      (chinese-gb2312		  . #x2646)	; ø»„¿
      (japanese-jisx0208	  . #x2646)	; ø»†˜ƒ
      (korean-ksc5601		  . #x2566)	; ø»ˆ¡‰
      (chinese-cns11643-1	  . #x2534)	; ø»‘ˆ§
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (ucs		  . #x0396)	; Î–
      ))
    (greek-iso8859-7	. #xE6)	; øº’¼¦
    (ucs		. #x03B6)	; Î¶
    ))
(define-char
  '((name		. "fullwidth greek small letter zeta")
    (=>ucs		. #x03B6)	; Î¶
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B6)
    (->uppercase
     ((name		  . "fullwidth greek capital letter zeta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ZETA")
      (ucs		  . #x03B6)	; Î¶
      ))
    (japanese-jisx0208-1978	. #x2646)	; ø»‚ƒ»
    (chinese-gb2312		. #x2646)	; ø»„¿
    (japanese-jisx0208		. #x2646)	; ø»†˜ƒ
    (korean-ksc5601		. #x2566)	; ø»ˆ¡‰
    (chinese-cns11643-1		. #x2534)	; ø»‘ˆ§
    (japanese-jisx0208-1990	. #x2646)	; ø½‰½·
    (chinese-big5		. #xA361)	; øºŸ ›
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter eta")
      (japanese-jisx0208-1978	  . #x2647)	; ø»‚ƒ¼
      (chinese-gb2312		  . #x2647)	; ø»„Ž€
      (japanese-jisx0208	  . #x2647)	; ø»†˜„
      (korean-ksc5601		  . #x2567)	; ø»ˆ¡Š
      (chinese-cns11643-1	  . #x2535)	; ø»‘ˆ¨
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (ucs		  . #x0397)	; Î—
      ))
    (greek-iso8859-7	. #xE7)	; øº’¼§
    (ucs		. #x03B7)	; Î·
    ))
(define-char
  '((name		. "fullwidth greek small letter eta")
    (=>ucs		. #x03B7)	; Î·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B7)
    (->uppercase
     ((name		  . "fullwidth greek capital letter eta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ETA")
      (ucs		  . #x03B7)	; Î·
      ))
    (japanese-jisx0208-1978	. #x2647)	; ø»‚ƒ¼
    (chinese-gb2312		. #x2647)	; ø»„Ž€
    (japanese-jisx0208		. #x2647)	; ø»†˜„
    (korean-ksc5601		. #x2567)	; ø»ˆ¡Š
    (chinese-cns11643-1		. #x2535)	; ø»‘ˆ¨
    (japanese-jisx0208-1990	. #x2647)	; ø½‰½¸
    (chinese-big5		. #xA362)	; øºŸ œ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter theta")
      (japanese-jisx0208-1978	  . #x2648)	; ø»‚ƒ½
      (chinese-gb2312		  . #x2648)	; ø»„Ž
      (japanese-jisx0208	  . #x2648)	; ø»†˜…
      (korean-ksc5601		  . #x2568)	; ø»ˆ¡‹
      (chinese-cns11643-1	  . #x2536)	; ø»‘ˆ©
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (ucs		  . #x0398)	; Î˜
      ))
    (greek-iso8859-7	. #xE8)	; øº’¼¨
    (ipa		. #xC8)	; øº’›ˆ
    (ucs		. #x03B8)	; Î¸
    ))
(define-char
  '((name		. "fullwidth greek small letter theta")
    (=>ucs		. #x03B8)	; Î¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B8)
    (->uppercase
     ((name		  . "fullwidth greek capital letter theta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER THETA")
      (ucs		  . #x03B8)	; Î¸
      ))
    (japanese-jisx0208-1978	. #x2648)	; ø»‚ƒ½
    (chinese-gb2312		. #x2648)	; ø»„Ž
    (japanese-jisx0208		. #x2648)	; ø»†˜…
    (korean-ksc5601		. #x2568)	; ø»ˆ¡‹
    (chinese-cns11643-1		. #x2536)	; ø»‘ˆ©
    (japanese-jisx0208-1990	. #x2648)	; ø½‰½¹
    (chinese-big5		. #xA363)	; øºŸ 
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter iota")
      (japanese-jisx0208-1978	  . #x2649)	; ø»‚ƒ¾
      (chinese-gb2312		  . #x2649)	; ø»„Ž‚
      (japanese-jisx0208	  . #x2649)	; ø»†˜†
      (korean-ksc5601		  . #x2569)	; ø»ˆ¡Œ
      (chinese-cns11643-1	  . #x2537)	; ø»‘ˆª
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (ucs		  . #x0399)	; Î™
      ))
    (greek-iso8859-7	. #xE9)	; øº’¼©
    (ucs		. #x03B9)	; Î¹
    ))
(define-char
  '((name		. "fullwidth greek small letter iota")
    (=>ucs		. #x03B9)	; Î¹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B9)
    (->uppercase
     ((name		  . "fullwidth greek capital letter iota")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA")
      (ucs		  . #x03B9)	; Î¹
      ))
    (japanese-jisx0208-1978	. #x2649)	; ø»‚ƒ¾
    (chinese-gb2312		. #x2649)	; ø»„Ž‚
    (japanese-jisx0208		. #x2649)	; ø»†˜†
    (korean-ksc5601		. #x2569)	; ø»ˆ¡Œ
    (chinese-cns11643-1		. #x2537)	; ø»‘ˆª
    (japanese-jisx0208-1990	. #x2649)	; ø½‰½º
    (chinese-big5		. #xA364)	; øºŸ ž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter kappa")
      (japanese-jisx0208-1978	  . #x264A)	; ø»‚ƒ¿
      (chinese-gb2312		  . #x264A)	; ø»„Žƒ
      (japanese-jisx0208	  . #x264A)	; ø»†˜‡
      (korean-ksc5601		  . #x256A)	; ø»ˆ¡
      (chinese-cns11643-1	  . #x2538)	; ø»‘ˆ«
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (ucs		  . #x039A)	; Îš
      ))
    (greek-iso8859-7	. #xEA)	; øº’¼ª
    (ucs		. #x03BA)	; Îº
    ))
(define-char
  '((name		. "fullwidth greek small letter kappa")
    (=>ucs		. #x03BA)	; Îº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BA)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (ucs		  . #x039A)	; Îš
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (ucs		  . #x03BA)	; Îº
      ))
    (japanese-jisx0208-1978	. #x264A)	; ø»‚ƒ¿
    (chinese-gb2312		. #x264A)	; ø»„Žƒ
    (japanese-jisx0208		. #x264A)	; ø»†˜‡
    (korean-ksc5601		. #x256A)	; ø»ˆ¡
    (chinese-cns11643-1		. #x2538)	; ø»‘ˆ«
    (japanese-jisx0208-1990	. #x264A)	; ø½‰½»
    (chinese-big5		. #xA365)	; øºŸ Ÿ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter lamda")
      (japanese-jisx0208-1978	  . #x264B)	; ø»‚„€
      (chinese-gb2312		  . #x264B)	; ø»„Ž„
      (japanese-jisx0208	  . #x264B)	; ø»†˜ˆ
      (korean-ksc5601		  . #x256B)	; ø»ˆ¡Ž
      (chinese-cns11643-1	  . #x2539)	; ø»‘ˆ¬
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (ucs		  . #x039B)	; Î›
      ))
    (greek-iso8859-7	. #xEB)	; øº’¼«
    (ucs		. #x03BB)	; Î»
    ))
(define-char
  '((name		. "fullwidth greek small letter lamda")
    (=>ucs		. #x03BB)	; Î»
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BB)
    (->uppercase
     ((name		  . "fullwidth greek capital letter lamda")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (ucs		  . #x03BB)	; Î»
      ))
    (japanese-jisx0208-1978	. #x264B)	; ø»‚„€
    (chinese-gb2312		. #x264B)	; ø»„Ž„
    (japanese-jisx0208		. #x264B)	; ø»†˜ˆ
    (korean-ksc5601		. #x256B)	; ø»ˆ¡Ž
    (chinese-cns11643-1		. #x2539)	; ø»‘ˆ¬
    (japanese-jisx0208-1990	. #x264B)	; ø½‰½¼
    (chinese-big5		. #xA366)	; øºŸ  
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter mu")
      (japanese-jisx0208-1978	  . #x264C)	; ø»‚„
      (chinese-gb2312		  . #x264C)	; ø»„Ž…
      (japanese-jisx0208	  . #x264C)	; ø»†˜‰
      (korean-ksc5601		  . #x256C)	; ø»ˆ¡
      (chinese-cns11643-1	  . #x253A)	; ø»‘ˆ­
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER MU")
      (ucs		  . #x039C)	; Îœ
      ))
    (greek-iso8859-7	. #xEC)	; øº’¼¬
    (ucs		. #x03BC)	; Î¼
    ))
(define-char
  '((name		. "fullwidth greek small letter mu")
    (=>ucs		. #x03BC)	; Î¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BC)
    (->uppercase
     ((name		  . "fullwidth greek capital letter mu")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER MU")
      (ucs		  . #x03BC)	; Î¼
      ))
    (japanese-jisx0208-1978	. #x264C)	; ø»‚„
    (chinese-gb2312		. #x264C)	; ø»„Ž…
    (japanese-jisx0208		. #x264C)	; ø»†˜‰
    (korean-ksc5601		. #x256C)	; ø»ˆ¡
    (chinese-cns11643-1		. #x253A)	; ø»‘ˆ­
    (japanese-jisx0208-1990	. #x264C)	; ø½‰½½
    (chinese-big5		. #xA367)	; øºŸ ¡
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter nu")
      (japanese-jisx0208-1978	  . #x264D)	; ø»‚„‚
      (chinese-gb2312		  . #x264D)	; ø»„Ž†
      (japanese-jisx0208	  . #x264D)	; ø»†˜Š
      (korean-ksc5601		  . #x256D)	; ø»ˆ¡
      (chinese-cns11643-1	  . #x253B)	; ø»‘ˆ®
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER NU")
      (ucs		  . #x039D)	; Î
      ))
    (greek-iso8859-7	. #xED)	; øº’¼­
    (ucs		. #x03BD)	; Î½
    ))
(define-char
  '((name		. "fullwidth greek small letter nu")
    (=>ucs		. #x03BD)	; Î½
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BD)
    (->uppercase
     ((name		  . "fullwidth greek capital letter nu")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER NU")
      (ucs		  . #x03BD)	; Î½
      ))
    (japanese-jisx0208-1978	. #x264D)	; ø»‚„‚
    (chinese-gb2312		. #x264D)	; ø»„Ž†
    (japanese-jisx0208		. #x264D)	; ø»†˜Š
    (korean-ksc5601		. #x256D)	; ø»ˆ¡
    (chinese-cns11643-1		. #x253B)	; ø»‘ˆ®
    (japanese-jisx0208-1990	. #x264D)	; ø½‰½¾
    (chinese-big5		. #xA368)	; øºŸ ¢
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter xi")
      (japanese-jisx0208-1978	  . #x264E)	; ø»‚„ƒ
      (chinese-gb2312		  . #x264E)	; ø»„Ž‡
      (japanese-jisx0208	  . #x264E)	; ø»†˜‹
      (korean-ksc5601		  . #x256E)	; ø»ˆ¡‘
      (chinese-cns11643-1	  . #x253C)	; ø»‘ˆ¯
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER XI")
      (ucs		  . #x039E)	; Îž
      ))
    (greek-iso8859-7	. #xEE)	; øº’¼®
    (ucs		. #x03BE)	; Î¾
    ))
(define-char
  '((name		. "fullwidth greek small letter xi")
    (=>ucs		. #x03BE)	; Î¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BE)
    (->uppercase
     ((name		  . "fullwidth greek capital letter xi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER XI")
      (ucs		  . #x03BE)	; Î¾
      ))
    (japanese-jisx0208-1978	. #x264E)	; ø»‚„ƒ
    (chinese-gb2312		. #x264E)	; ø»„Ž‡
    (japanese-jisx0208		. #x264E)	; ø»†˜‹
    (korean-ksc5601		. #x256E)	; ø»ˆ¡‘
    (chinese-cns11643-1		. #x253C)	; ø»‘ˆ¯
    (japanese-jisx0208-1990	. #x264E)	; ø½‰½¿
    (chinese-big5		. #xA369)	; øºŸ £
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omicron")
      (japanese-jisx0208-1978	  . #x264F)	; ø»‚„„
      (chinese-gb2312		  . #x264F)	; ø»„Žˆ
      (japanese-jisx0208	  . #x264F)	; ø»†˜Œ
      (korean-ksc5601		  . #x256F)	; ø»ˆ¡’
      (chinese-cns11643-1	  . #x253D)	; ø»‘ˆ°
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (ucs		  . #x039F)	; ÎŸ
      ))
    (greek-iso8859-7	. #xEF)	; øº’¼¯
    (ucs		. #x03BF)	; Î¿
    ))
(define-char
  '((name		. "fullwidth greek small letter omicron")
    (=>ucs		. #x03BF)	; Î¿
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BF)
    (->uppercase
     ((name		  . "fullwidth greek capital letter omicron")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (ucs		  . #x03BF)	; Î¿
      ))
    (japanese-jisx0208-1978	. #x264F)	; ø»‚„„
    (chinese-gb2312		. #x264F)	; ø»„Žˆ
    (japanese-jisx0208		. #x264F)	; ø»†˜Œ
    (korean-ksc5601		. #x256F)	; ø»ˆ¡’
    (chinese-cns11643-1		. #x253D)	; ø»‘ˆ°
    (japanese-jisx0208-1990	. #x264F)	; ø½‰¾€
    (chinese-big5		. #xA36A)	; øºŸ ¤
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter pi")
      (japanese-jisx0208-1978	  . #x2650)	; ø»‚„…
      (chinese-gb2312		  . #x2650)	; ø»„Ž‰
      (japanese-jisx0208	  . #x2650)	; ø»†˜
      (korean-ksc5601		  . #x2570)	; ø»ˆ¡“
      (chinese-cns11643-1	  . #x253E)	; ø»‘ˆ±
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (ucs		  . #x03A0)	; Î 
      ))
    (greek-iso8859-7	. #xF0)	; øº’¼°
    (ucs		. #x03C0)	; Ï€
    ))
(define-char
  '((name		. "fullwidth greek small letter pi")
    (=>ucs		. #x03C0)	; Ï€
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C0)
    (->uppercase
     ((name		  . "fullwidth greek capital letter pi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PI")
      (ucs		  . #x03C0)	; Ï€
      ))
    (japanese-jisx0208-1978	. #x2650)	; ø»‚„…
    (chinese-gb2312		. #x2650)	; ø»„Ž‰
    (japanese-jisx0208		. #x2650)	; ø»†˜
    (korean-ksc5601		. #x2570)	; ø»ˆ¡“
    (chinese-cns11643-1		. #x253E)	; ø»‘ˆ±
    (japanese-jisx0208-1990	. #x2650)	; ø½‰¾
    (chinese-big5		. #xA36B)	; øºŸ ¥
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter rho")
      (japanese-jisx0208-1978	  . #x2651)	; ø»‚„†
      (chinese-gb2312		  . #x2651)	; ø»„ŽŠ
      (japanese-jisx0208	  . #x2651)	; ø»†˜Ž
      (korean-ksc5601		  . #x2571)	; ø»ˆ¡”
      (chinese-cns11643-1	  . #x253F)	; ø»‘ˆ²
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (ucs		  . #x03A1)	; Î¡
      ))
    (greek-iso8859-7	. #xF1)	; øº’¼±
    (ucs		. #x03C1)	; Ï
    ))
(define-char
  '((name		. "fullwidth greek small letter rho")
    (=>ucs		. #x03C1)	; Ï
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C1)
    (->uppercase
     ((name		  . "fullwidth greek capital letter rho")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER RHO")
      (ucs		  . #x03C1)	; Ï
      ))
    (japanese-jisx0208-1978	. #x2651)	; ø»‚„†
    (chinese-gb2312		. #x2651)	; ø»„ŽŠ
    (japanese-jisx0208		. #x2651)	; ø»†˜Ž
    (korean-ksc5601		. #x2571)	; ø»ˆ¡”
    (chinese-cns11643-1		. #x253F)	; ø»‘ˆ²
    (japanese-jisx0208-1990	. #x2651)	; ø½‰¾‚
    (chinese-big5		. #xA36C)	; øºŸ ¦
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter final sigma")
      (japanese-jisx0212	  . #x2678)	; ø»Š¬½
      (japanese-jisx0213-1	  . #x2659)	; ø»¢›Š
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (ucs		  . #x03A3)	; Î£
      ))
    (greek-iso8859-7	. #xF2)	; øº’¼²
    (ucs		. #x03C2)	; Ï‚
    ))
(define-char
  '((name		. "fullwidth greek small letter final sigma")
    (=>ucs		. #x03C2)	; Ï‚
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C2)
    (->uppercase
     ((name		  . "fullwidth greek capital letter final sigma")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER FINAL SIGMA")
      (ucs		  . #x03C2)	; Ï‚
      ))
    (japanese-jisx0212		. #x2678)	; ø»Š¬½
    (japanese-jisx0213-1	. #x2659)	; ø»¢›Š
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter sigma")
      (japanese-jisx0208-1978	  . #x2652)	; ø»‚„‡
      (chinese-gb2312		  . #x2652)	; ø»„Ž‹
      (japanese-jisx0208	  . #x2652)	; ø»†˜
      (korean-ksc5601		  . #x2572)	; ø»ˆ¡•
      (chinese-cns11643-1	  . #x2540)	; ø»‘ˆ³
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (ucs		  . #x03A3)	; Î£
      ))
    (greek-iso8859-7	. #xF3)	; øº’¼³
    (ucs		. #x03C3)	; Ïƒ
    ))
(define-char
  '((name		. "fullwidth greek small letter sigma")
    (=>ucs		. #x03C3)	; Ïƒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C3)
    (->uppercase
     ((name		  . "fullwidth greek capital letter sigma")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (ucs		  . #x03C3)	; Ïƒ
      ))
    (japanese-jisx0208-1978	. #x2652)	; ø»‚„‡
    (chinese-gb2312		. #x2652)	; ø»„Ž‹
    (japanese-jisx0208		. #x2652)	; ø»†˜
    (korean-ksc5601		. #x2572)	; ø»ˆ¡•
    (chinese-cns11643-1		. #x2540)	; ø»‘ˆ³
    (japanese-jisx0208-1990	. #x2652)	; ø½‰¾ƒ
    (chinese-big5		. #xA36D)	; øºŸ §
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter tau")
      (japanese-jisx0208-1978	  . #x2653)	; ø»‚„ˆ
      (chinese-gb2312		  . #x2653)	; ø»„ŽŒ
      (japanese-jisx0208	  . #x2653)	; ø»†˜
      (korean-ksc5601		  . #x2573)	; ø»ˆ¡–
      (chinese-cns11643-1	  . #x2541)	; ø»‘ˆ´
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (ucs		  . #x03A4)	; Î¤
      ))
    (greek-iso8859-7	. #xF4)	; øº’¼´
    (ucs		. #x03C4)	; Ï„
    ))
(define-char
  '((name		. "fullwidth greek small letter tau")
    (=>ucs		. #x03C4)	; Ï„
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C4)
    (->uppercase
     ((name		  . "fullwidth greek capital letter tau")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER TAU")
      (ucs		  . #x03C4)	; Ï„
      ))
    (japanese-jisx0208-1978	. #x2653)	; ø»‚„ˆ
    (chinese-gb2312		. #x2653)	; ø»„ŽŒ
    (japanese-jisx0208		. #x2653)	; ø»†˜
    (korean-ksc5601		. #x2573)	; ø»ˆ¡–
    (chinese-cns11643-1		. #x2541)	; ø»‘ˆ´
    (japanese-jisx0208-1990	. #x2653)	; ø½‰¾„
    (chinese-big5		. #xA36E)	; øºŸ ¨
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter upsilon")
      (japanese-jisx0208-1978	  . #x2654)	; ø»‚„‰
      (chinese-gb2312		  . #x2654)	; ø»„Ž
      (japanese-jisx0208	  . #x2654)	; ø»†˜‘
      (korean-ksc5601		  . #x2574)	; ø»ˆ¡—
      (chinese-cns11643-1	  . #x2542)	; ø»‘ˆµ
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (ucs		  . #x03A5)	; Î¥
      ))
    (greek-iso8859-7	. #xF5)	; øº’¼µ
    (ucs		. #x03C5)	; Ï…
    ))
(define-char
  '((name		. "fullwidth greek small letter upsilon")
    (=>ucs		. #x03C5)	; Ï…
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C5)
    (->uppercase
     ((name		  . "fullwidth greek capital letter upsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (ucs		  . #x03C5)	; Ï…
      ))
    (japanese-jisx0208-1978	. #x2654)	; ø»‚„‰
    (chinese-gb2312		. #x2654)	; ø»„Ž
    (japanese-jisx0208		. #x2654)	; ø»†˜‘
    (korean-ksc5601		. #x2574)	; ø»ˆ¡—
    (chinese-cns11643-1		. #x2542)	; ø»‘ˆµ
    (japanese-jisx0208-1990	. #x2654)	; ø½‰¾…
    (chinese-big5		. #xA36F)	; øºŸ ©
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter phi")
      (japanese-jisx0208-1978	  . #x2655)	; ø»‚„Š
      (chinese-gb2312		  . #x2655)	; ø»„ŽŽ
      (japanese-jisx0208	  . #x2655)	; ø»†˜’
      (korean-ksc5601		  . #x2575)	; ø»ˆ¡˜
      (chinese-cns11643-1	  . #x2543)	; ø»‘ˆ¶
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (ucs		  . #x03A6)	; Î¦
      ))
    (greek-iso8859-7	. #xF6)	; øº’¼¶
    (ucs		. #x03C6)	; Ï†
    ))
(define-char
  '((name		. "fullwidth greek small letter phi")
    (=>ucs		. #x03C6)	; Ï†
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C6)
    (->uppercase
     ((name		  . "fullwidth greek capital letter phi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PHI")
      (ucs		  . #x03C6)	; Ï†
      ))
    (japanese-jisx0208-1978	. #x2655)	; ø»‚„Š
    (chinese-gb2312		. #x2655)	; ø»„ŽŽ
    (japanese-jisx0208		. #x2655)	; ø»†˜’
    (korean-ksc5601		. #x2575)	; ø»ˆ¡˜
    (chinese-cns11643-1		. #x2543)	; ø»‘ˆ¶
    (japanese-jisx0208-1990	. #x2655)	; ø½‰¾†
    (chinese-big5		. #xA370)	; øºŸ ª
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter chi")
      (japanese-jisx0208-1978	  . #x2656)	; ø»‚„‹
      (chinese-gb2312		  . #x2656)	; ø»„Ž
      (japanese-jisx0208	  . #x2656)	; ø»†˜“
      (korean-ksc5601		  . #x2576)	; ø»ˆ¡™
      (chinese-cns11643-1	  . #x2544)	; ø»‘ˆ·
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (ucs		  . #x03A7)	; Î§
      ))
    (greek-iso8859-7	. #xF7)	; øº’¼·
    (ucs		. #x03C7)	; Ï‡
    ))
(define-char
  '((name		. "fullwidth greek small letter chi")
    (=>ucs		. #x03C7)	; Ï‡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C7)
    (->uppercase
     ((name		  . "fullwidth greek capital letter chi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER CHI")
      (ucs		  . #x03C7)	; Ï‡
      ))
    (japanese-jisx0208-1978	. #x2656)	; ø»‚„‹
    (chinese-gb2312		. #x2656)	; ø»„Ž
    (japanese-jisx0208		. #x2656)	; ø»†˜“
    (korean-ksc5601		. #x2576)	; ø»ˆ¡™
    (chinese-cns11643-1		. #x2544)	; ø»‘ˆ·
    (japanese-jisx0208-1990	. #x2656)	; ø½‰¾‡
    (chinese-big5		. #xA371)	; øºŸ «
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter psi")
      (japanese-jisx0208-1978	  . #x2657)	; ø»‚„Œ
      (chinese-gb2312		  . #x2657)	; ø»„Ž
      (japanese-jisx0208	  . #x2657)	; ø»†˜”
      (korean-ksc5601		  . #x2577)	; ø»ˆ¡š
      (chinese-cns11643-1	  . #x2545)	; ø»‘ˆ¸
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (ucs		  . #x03A8)	; Î¨
      ))
    (greek-iso8859-7	. #xF8)	; øº’¼¸
    (ucs		. #x03C8)	; Ïˆ
    ))
(define-char
  '((name		. "fullwidth greek small letter psi")
    (=>ucs		. #x03C8)	; Ïˆ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C8)
    (->uppercase
     ((name		  . "fullwidth greek capital letter psi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PSI")
      (ucs		  . #x03C8)	; Ïˆ
      ))
    (japanese-jisx0208-1978	. #x2657)	; ø»‚„Œ
    (chinese-gb2312		. #x2657)	; ø»„Ž
    (japanese-jisx0208		. #x2657)	; ø»†˜”
    (korean-ksc5601		. #x2577)	; ø»ˆ¡š
    (chinese-cns11643-1		. #x2545)	; ø»‘ˆ¸
    (japanese-jisx0208-1990	. #x2657)	; ø½‰¾ˆ
    (chinese-big5		. #xA372)	; øºŸ ¬
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omega")
      (japanese-jisx0208-1978	  . #x2658)	; ø»‚„
      (chinese-gb2312		  . #x2658)	; ø»„Ž‘
      (japanese-jisx0208	  . #x2658)	; ø»†˜•
      (korean-ksc5601		  . #x2578)	; ø»ˆ¡›
      (chinese-cns11643-1	  . #x2546)	; ø»‘ˆ¹
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (ucs		  . #x03A9)	; Î©
      ))
    (greek-iso8859-7	. #xF9)	; øº’¼¹
    (ucs		. #x03C9)	; Ï‰
    ))
(define-char
  '((name		. "fullwidth greek small letter omega")
    (=>ucs		. #x03C9)	; Ï‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C9)
    (->uppercase
     ((name		  . "fullwidth greek capital letter omega")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (ucs		  . #x03C9)	; Ï‰
      ))
    (japanese-jisx0208-1978	. #x2658)	; ø»‚„
    (chinese-gb2312		. #x2658)	; ø»„Ž‘
    (japanese-jisx0208		. #x2658)	; ø»†˜•
    (korean-ksc5601		. #x2578)	; ø»ˆ¡›
    (chinese-cns11643-1		. #x2546)	; ø»‘ˆ¹
    (japanese-jisx0208-1990	. #x2658)	; ø½‰¾‰
    (chinese-big5		. #xA373)	; øºŸ ­
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika")
      (japanese-jisx0212  . #x2675)	; ø»Š¬º
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (ucs		  . #x03AA)	; Îª
      ))
    (greek-iso8859-7	. #xFA)	; øº’¼º
    (ucs		. #x03CA)	; ÏŠ
    ))
(define-char
  '((name . "fullwidth greek small letter iota with dialytika")
    (=>ucs		. #x03CA)	; ÏŠ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CA)
    (->uppercase
     ((name . "fullwidth greek capital letter iota with dialytika")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (ucs		  . #x03CA)	; ÏŠ
      ))
    (japanese-jisx0212	. #x2675)	; ø»Š¬º
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika")
      (japanese-jisx0212  . #x267A)	; ø»Š¬¿
      ))
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (ucs		  . #x03AB)	; Î«
      ))
    (greek-iso8859-7	. #xFB)	; øº’¼»
    (ucs		. #x03CB)	; Ï‹
    ))
(define-char
  '((name . "fullwidth greek small letter upsilon with dialytika")
    (=>ucs		. #x03CB)	; Ï‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CB)
    (->uppercase
     ((name . "fullwidth greek capital letter upsilon with dialytika")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (ucs		  . #x03CB)	; Ï‹
      ))
    (japanese-jisx0212	. #x267A)	; ø»Š¬¿
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omicron with tonos")
      (japanese-jisx0212  . #x2677)	; ø»Š¬¼
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (ucs		  . #x038C)	; ÎŒ
      ))
    (greek-iso8859-7	. #xFC)	; øº’¼¼
    (ucs		. #x03CC)	; ÏŒ
    ))
(define-char
  '((name . "fullwidth greek small letter omicron with tonos")
    (=>ucs		. #x03CC)	; ÏŒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CC)
    (->uppercase
     ((name . "fullwidth greek capital letter omicron with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (ucs		  . #x03CC)	; ÏŒ
      ))
    (japanese-jisx0212	. #x2677)	; ø»Š¬¼
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with tonos")
      (japanese-jisx0212  . #x2679)	; ø»Š¬¾
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (ucs		  . #x038E)	; ÎŽ
      ))
    (greek-iso8859-7	. #xFD)	; øº’¼½
    (ucs		. #x03CD)	; Ï
    ))
(define-char
  '((name . "fullwidth greek small letter upsilon with tonos")
    (=>ucs		. #x03CD)	; Ï
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CD)
    (->uppercase
     ((name . "fullwidth greek capital letter upsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (ucs		  . #x03CD)	; Ï
      ))
    (japanese-jisx0212	. #x2679)	; ø»Š¬¾
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omega with tonos")
      (japanese-jisx0212  . #x267C)	; ø»Š­
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (ucs		  . #x038F)	; Î
      ))
    (greek-iso8859-7	. #xFE)	; øº’¼¾
    (ucs		. #x03CE)	; ÏŽ
    ))
(define-char
  '((name . "fullwidth greek small letter omega with tonos")
    (=>ucs		. #x03CE)	; ÏŽ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CE)
    (->uppercase
     ((name . "fullwidth greek capital letter omega with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (ucs		  . #x03CE)	; ÏŽ
      ))
    (japanese-jisx0212	. #x267C)	; ø»Š­
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B2)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (ucs		  . #x0392)	; Î’
      ))
    (ucs		. #x03D0)	; Ï
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B8)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (ucs		  . #x0398)	; Î˜
      ))
    (ucs		. #x03D1)	; Ï‘
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03A5)
    (ucs		. #x03D2)	; Ï’
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0301)
    (ucs		. #x03D3)	; Ï“
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0308)
    (ucs		. #x03D4)	; Ï”
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C6)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (ucs		  . #x03A6)	; Î¦
      ))
    (ucs		. #x03D5)	; Ï•
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C0)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (ucs		  . #x03A0)	; Î 
      ))
    (ucs		. #x03D6)	; Ï–
    ))
(define-char
  '((name		. "GREEK KAI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x03D7)	; Ï—
    ))
(define-char
  '((name		. "GREEK LETTER STIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER STIGMA")
      (ucs		  . #x03DB)	; Ï›
      ))
    (ucs		. #x03DA)	; Ïš
    ))
(define-char
  '((name		. "GREEK SMALL LETTER STIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER STIGMA")
      (ucs		  . #x03DA)	; Ïš
      ))
    (ucs		. #x03DB)	; Ï›
    ))
(define-char
  '((name		. "GREEK LETTER DIGAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DIGAMMA")
      (ucs		  . #x03DD)	; Ï
      ))
    (ucs		. #x03DC)	; Ïœ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DIGAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER DIGAMMA")
      (ucs		  . #x03DC)	; Ïœ
      ))
    (ucs		. #x03DD)	; Ï
    ))
(define-char
  '((name		. "GREEK LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KOPPA")
      (ucs		  . #x03DF)	; ÏŸ
      ))
    (ucs		. #x03DE)	; Ïž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER KOPPA")
      (ucs		  . #x03DE)	; Ïž
      ))
    (ucs		. #x03DF)	; ÏŸ
    ))
(define-char
  '((name		. "GREEK LETTER SAMPI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SAMPI")
      (ucs		  . #x03E1)	; Ï¡
      ))
    (ucs		. #x03E0)	; Ï 
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SAMPI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER SAMPI")
      (ucs		  . #x03E0)	; Ï 
      ))
    (ucs		. #x03E1)	; Ï¡
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER SHEI")
      (ucs		  . #x03E3)	; Ï£
      ))
    (ucs		. #x03E2)	; Ï¢
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER SHEI")
      (ucs		  . #x03E2)	; Ï¢
      ))
    (ucs		. #x03E3)	; Ï£
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER FEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER FEI")
      (ucs		  . #x03E5)	; Ï¥
      ))
    (ucs		. #x03E4)	; Ï¤
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER FEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER FEI")
      (ucs		  . #x03E4)	; Ï¤
      ))
    (ucs		. #x03E5)	; Ï¥
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER KHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER KHEI")
      (ucs		  . #x03E7)	; Ï§
      ))
    (ucs		. #x03E6)	; Ï¦
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER KHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER KHEI")
      (ucs		  . #x03E6)	; Ï¦
      ))
    (ucs		. #x03E7)	; Ï§
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER HORI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER HORI")
      (ucs		  . #x03E9)	; Ï©
      ))
    (ucs		. #x03E8)	; Ï¨
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER HORI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER HORI")
      (ucs		  . #x03E8)	; Ï¨
      ))
    (ucs		. #x03E9)	; Ï©
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER GANGIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER GANGIA")
      (ucs		  . #x03EB)	; Ï«
      ))
    (ucs		. #x03EA)	; Ïª
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER GANGIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER GANGIA")
      (ucs		  . #x03EA)	; Ïª
      ))
    (ucs		. #x03EB)	; Ï«
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHIMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER SHIMA")
      (ucs		  . #x03ED)	; Ï­
      ))
    (ucs		. #x03EC)	; Ï¬
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHIMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER SHIMA")
      (ucs		  . #x03EC)	; Ï¬
      ))
    (ucs		. #x03ED)	; Ï­
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER DEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER DEI")
      (ucs		  . #x03EF)	; Ï¯
      ))
    (ucs		. #x03EE)	; Ï®
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER DEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER DEI")
      (ucs		  . #x03EE)	; Ï®
      ))
    (ucs		. #x03EF)	; Ï¯
    ))
(define-char
  '((name		. "GREEK KAPPA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BA)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (ucs		  . #x039A)	; Îš
      ))
    (ucs		. #x03F0)	; Ï°
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C1)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (ucs		  . #x03A1)	; Î¡
      ))
    (ucs		. #x03F1)	; Ï±
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C2)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (ucs		  . #x03A3)	; Î£
      ))
    (ucs		. #x03F2)	; Ï²
    ))
(define-char
  '((name		. "GREEK LETTER YOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (ucs		. #x03F3)	; Ï³
    ))
