;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    (->decomposition	#x02B9)
    (=ucs		. #x0374)	; Í´
    ))
(define-char
  '((name		. "GREEK LOWER NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Aristeri keraia")
    (=ucs		. #x0375)	; Íµ
    ))
(define-char
  '((name		. "GREEK YPOGEGRAMMENI")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0345)
    (=ucs		. #x037A)	; Íº
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    (->decomposition	#x003B)
    (=ucs		. #x037E)	; Í¾
    ))
(define-char
  '((name		. "GREEK TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek tonos")
      (=jis-x0212	  . #x2238)	; ø»Š¦…
      (=ucs@jis		  . #x0384)	; ø»Š¦…
      ))
    (=ucs		. #x0384)	; Î„
    (greek-iso8859-7	. #xB4)	; øº’»´
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
      (=ucs		  . #x0384)	; Î„
      ))
    (=jis-x0212		. #x2238)	; ø»Š¦…
    (=ucs@jis		. #x0384)	; ø»Š¦…
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek dialytika tonos")
      (=jis-x0212	  . #x2239)	; ø»Š¦†
      (=ucs@jis		  . #x0385)	; ø»Š¦†
      ))
    (=ucs		. #x0385)	; Î…
    (greek-iso8859-7	. #xB5)	; øº’»µ
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
      (=ucs		  . #x0385)	; Î…
      ))
    (=jis-x0212		. #x2239)	; ø»Š¦†
    (=ucs@jis		. #x0385)	; ø»Š¦†
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter alpha with tonos")
      (=jis-x0212	  . #x2661)	; ø»Š¬¦
      (=ucs@jis		  . #x0386)	; ø»Š¬¦
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; Î¬
      ))
    (=ucs		. #x0386)	; Î†
    (greek-iso8859-7	. #xB6)	; øº’»¶
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
      (=ucs		  . #x0386)	; Î†
      ))
    (=jis-x0212		. #x2661)	; ø»Š¬¦
    (=ucs@jis		. #x0386)	; ø»Š¬¦
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00B7)
    (=ucs		. #x0387)	; Î‡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0395 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter epsilon with tonos")
      (=jis-x0212	  . #x2662)	; ø»Š¬§
      (=ucs@jis		  . #x0388)	; ø»Š¬§
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; Î­
      ))
    (=ucs		. #x0388)	; Îˆ
    (greek-iso8859-7	. #xB8)	; øº’»¸
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
      (=ucs		  . #x0388)	; Îˆ
      ))
    (=jis-x0212		. #x2662)	; ø»Š¬§
    (=ucs@jis		. #x0388)	; ø»Š¬§
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter eta with tonos")
      (=jis-x0212	  . #x2663)	; ø»Š¬¨
      (=ucs@jis		  . #x0389)	; ø»Š¬¨
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; Î®
      ))
    (=ucs		. #x0389)	; Î‰
    (greek-iso8859-7	. #xB9)	; øº’»¹
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
      (=ucs		  . #x0389)	; Î‰
      ))
    (=jis-x0212		. #x2663)	; ø»Š¬¨
    (=ucs@jis		. #x0389)	; ø»Š¬¨
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with tonos")
      (=jis-x0212	  . #x2664)	; ø»Š¬©
      (=ucs@jis		  . #x038A)	; ø»Š¬©
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; Î¯
      ))
    (=ucs		. #x038A)	; ÎŠ
    (greek-iso8859-7	. #xBA)	; øº’»º
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
      (=ucs		  . #x038A)	; ÎŠ
      ))
    (=jis-x0212		. #x2664)	; ø»Š¬©
    (=ucs@jis		. #x038A)	; ø»Š¬©
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omicron with tonos")
      (=jis-x0212	  . #x2667)	; ø»Š¬¬
      (=ucs@jis		  . #x038C)	; ø»Š¬¬
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ÏŒ
      ))
    (=ucs		. #x038C)	; ÎŒ
    (greek-iso8859-7	. #xBC)	; øº’»¼
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
      (=ucs		  . #x038C)	; ÎŒ
      ))
    (=jis-x0212		. #x2667)	; ø»Š¬¬
    (=ucs@jis		. #x038C)	; ø»Š¬¬
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with tonos")
      (=jis-x0212	  . #x2669)	; ø»Š¬®
      (=ucs@jis		  . #x038E)	; ø»Š¬®
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; Ï
      ))
    (=ucs		. #x038E)	; ÎŽ
    (greek-iso8859-7	. #xBE)	; øº’»¾
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
      (=ucs		  . #x038E)	; ÎŽ
      ))
    (=jis-x0212		. #x2669)	; ø»Š¬®
    (=ucs@jis		. #x038E)	; ø»Š¬®
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omega with tonos")
      (=jis-x0212	  . #x266C)	; ø»Š¬±
      (=ucs@jis		  . #x038F)	; ø»Š¬±
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ÏŽ
      ))
    (=ucs		. #x038F)	; Î
    (greek-iso8859-7	. #xBF)	; øº’»¿
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
      (=ucs		  . #x038F)	; Î
      ))
    (=jis-x0212		. #x266C)	; ø»Š¬±
    (=ucs@jis		. #x038F)	; ø»Š¬±
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika and tonos")
      (=jis-x0212	  . #x2676)	; ø»Š¬»
      (=ucs@jis		  . #x0390)	; ø»Š¬»
      ))
    (=ucs		. #x0390)	; Î
    (greek-iso8859-7	. #xC0)	; øº’¼€
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
      (=ucs		  . #x0390)	; Î
      ))
    (=jis-x0212		. #x2676)	; ø»Š¬»
    (=ucs@jis		. #x0390)	; ø»Š¬»
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter alpha")
      (=gb2312		  . #x2621)	; ø»„š
      (=jis-x0208	  . #x2621)	; ø½‰½’
      (=ks-x1001	  . #x2541)	; ø»ˆ ¤
      (=cns11643-1	  . #x2475)	; ø»‘ˆŠ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; Î±
      ))
    (=ucs		. #x0391)	; Î‘
    (greek-iso8859-7	. #xC1)	; øº’¼
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
      (=ucs		  . #x0391)	; Î‘
      ))
    (=gb2312		. #x2621)	; ø»„š
    (=jis-x0208		. #x2621)	; ø½‰½’
    (=ks-x1001		. #x2541)	; ø»ˆ ¤
    (=cns11643-1	. #x2475)	; ø»‘ˆŠ
    (=big5		. #xA344)	; ý¢€Š„
    (=ucs@jis		. #x0391)	; ø»„š
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter beta")
      (=gb2312		  . #x2622)	; ø»„›
      (=jis-x0208	  . #x2622)	; ø½‰½“
      (=ks-x1001	  . #x2542)	; ø»ˆ ¥
      (=cns11643-1	  . #x2476)	; ø»‘ˆ‹
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; Î²
      ))
    (=ucs		. #x0392)	; Î’
    (greek-iso8859-7	. #xC2)	; øº’¼‚
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
      (=ucs		  . #x0392)	; Î’
      ))
    (=gb2312		. #x2622)	; ø»„›
    (=jis-x0208		. #x2622)	; ø½‰½“
    (=ks-x1001		. #x2542)	; ø»ˆ ¥
    (=cns11643-1	. #x2476)	; ø»‘ˆ‹
    (=big5		. #xA345)	; ý¢€Š…
    (=ucs@jis		. #x0392)	; ø»„›
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter gamma")
      (=gb2312		  . #x2623)	; ø»„œ
      (=jis-x0208	  . #x2623)	; ø½‰½”
      (=ks-x1001	  . #x2543)	; ø»ˆ ¦
      (=cns11643-1	  . #x2477)	; ø»‘ˆŒ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; Î³
      ))
    (=ucs		. #x0393)	; Î“
    (greek-iso8859-7	. #xC3)	; øº’¼ƒ
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
      (=ucs		  . #x0393)	; Î“
      ))
    (=gb2312		. #x2623)	; ø»„œ
    (=jis-x0208		. #x2623)	; ø½‰½”
    (=ks-x1001		. #x2543)	; ø»ˆ ¦
    (=cns11643-1	. #x2477)	; ø»‘ˆŒ
    (=big5		. #xA346)	; ý¢€Š†
    (=ucs@jis		. #x0393)	; ø»„œ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter delta")
      (=gb2312		  . #x2624)	; ø»„
      (=jis-x0208	  . #x2624)	; ø½‰½•
      (=ks-x1001	  . #x2544)	; ø»ˆ §
      (=cns11643-1	  . #x2478)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; Î´
      ))
    (=ucs		. #x0394)	; Î”
    (greek-iso8859-7	. #xC4)	; øº’¼„
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
      (=ucs		  . #x0394)	; Î”
      ))
    (=gb2312		. #x2624)	; ø»„
    (=jis-x0208		. #x2624)	; ø½‰½•
    (=ks-x1001		. #x2544)	; ø»ˆ §
    (=cns11643-1	. #x2478)	; ø»‘ˆ
    (=big5		. #xA347)	; ý¢€Š‡
    (=ucs@jis		. #x0394)	; ø»„
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter epsilon")
      (=gb2312		  . #x2625)	; ø»„ž
      (=jis-x0208	  . #x2625)	; ø½‰½–
      (=ks-x1001	  . #x2545)	; ø»ˆ ¨
      (=cns11643-1	  . #x2479)	; ø»‘ˆŽ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; Îµ
      ))
    (=ucs		. #x0395)	; Î•
    (greek-iso8859-7	. #xC5)	; øº’¼…
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
      (=ucs		  . #x0395)	; Î•
      ))
    (=gb2312		. #x2625)	; ø»„ž
    (=jis-x0208		. #x2625)	; ø½‰½–
    (=ks-x1001		. #x2545)	; ø»ˆ ¨
    (=cns11643-1	. #x2479)	; ø»‘ˆŽ
    (=big5		. #xA348)	; ý¢€Šˆ
    (=ucs@jis		. #x0395)	; ø»„ž
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter zeta")
      (=gb2312		  . #x2626)	; ø»„Ÿ
      (=jis-x0208	  . #x2626)	; ø½‰½—
      (=ks-x1001	  . #x2546)	; ø»ˆ ©
      (=cns11643-1	  . #x247A)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; Î¶
      ))
    (=ucs		. #x0396)	; Î–
    (greek-iso8859-7	. #xC6)	; øº’¼†
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
      (=ucs		  . #x0396)	; Î–
      ))
    (=gb2312		. #x2626)	; ø»„Ÿ
    (=jis-x0208		. #x2626)	; ø½‰½—
    (=ks-x1001		. #x2546)	; ø»ˆ ©
    (=cns11643-1	. #x247A)	; ø»‘ˆ
    (=big5		. #xA349)	; ý¢€Š‰
    (=ucs@jis		. #x0396)	; ø»„Ÿ
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter eta")
      (=gb2312		  . #x2627)	; ø»„ 
      (=jis-x0208	  . #x2627)	; ø½‰½˜
      (=ks-x1001	  . #x2547)	; ø»ˆ ª
      (=cns11643-1	  . #x247B)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; Î·
      ))
    (=ucs		. #x0397)	; Î—
    (greek-iso8859-7	. #xC7)	; øº’¼‡
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
      (=ucs		  . #x0397)	; Î—
      ))
    (=gb2312		. #x2627)	; ø»„ 
    (=jis-x0208		. #x2627)	; ø½‰½˜
    (=ks-x1001		. #x2547)	; ø»ˆ ª
    (=cns11643-1	. #x247B)	; ø»‘ˆ
    (=big5		. #xA34A)	; ý¢€ŠŠ
    (=ucs@jis		. #x0397)	; ø»„ 
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter theta")
      (=gb2312		  . #x2628)	; ø»„¡
      (=jis-x0208	  . #x2628)	; ø½‰½™
      (=ks-x1001	  . #x2548)	; ø»ˆ «
      (=cns11643-1	  . #x247C)	; ø»‘ˆ‘
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; Î¸
      ))
    (=ucs		. #x0398)	; Î˜
    (greek-iso8859-7	. #xC8)	; øº’¼ˆ
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
      (=ucs		  . #x0398)	; Î˜
      ))
    (=gb2312		. #x2628)	; ø»„¡
    (=jis-x0208		. #x2628)	; ø½‰½™
    (=ks-x1001		. #x2548)	; ø»ˆ «
    (=cns11643-1	. #x247C)	; ø»‘ˆ‘
    (=big5		. #xA34B)	; ý¢€Š‹
    (=ucs@jis		. #x0398)	; ø»„¡
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter iota")
      (=gb2312		  . #x2629)	; ø»„¢
      (=jis-x0208	  . #x2629)	; ø½‰½š
      (=ks-x1001	  . #x2549)	; ø»ˆ ¬
      (=cns11643-1	  . #x247D)	; ø»‘ˆ’
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; Î¹
      ))
    (=ucs		. #x0399)	; Î™
    (greek-iso8859-7	. #xC9)	; øº’¼‰
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
      (=ucs		  . #x0399)	; Î™
      ))
    (=gb2312		. #x2629)	; ø»„¢
    (=jis-x0208		. #x2629)	; ø½‰½š
    (=ks-x1001		. #x2549)	; ø»ˆ ¬
    (=cns11643-1	. #x247D)	; ø»‘ˆ’
    (=big5		. #xA34C)	; ý¢€ŠŒ
    (=ucs@jis		. #x0399)	; ø»„¢
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter kappa")
      (=gb2312		  . #x262A)	; ø»„£
      (=jis-x0208	  . #x262A)	; ø½‰½›
      (=ks-x1001	  . #x254A)	; ø»ˆ ­
      (=cns11643-1	  . #x247E)	; ø»‘ˆ“
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; Îº
      ))
    (=ucs		. #x039A)	; Îš
    (greek-iso8859-7	. #xCA)	; øº’¼Š
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
      (=ucs		  . #x039A)	; Îš
      ))
    (=gb2312		. #x262A)	; ø»„£
    (=jis-x0208		. #x262A)	; ø½‰½›
    (=ks-x1001		. #x254A)	; ø»ˆ ­
    (=cns11643-1	. #x247E)	; ø»‘ˆ“
    (=big5		. #xA34D)	; ý¢€Š
    (=ucs@jis		. #x039A)	; ø»„£
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter lamda")
      (=gb2312		  . #x262B)	; ø»„¤
      (=jis-x0208	  . #x262B)	; ø½‰½œ
      (=ks-x1001	  . #x254B)	; ø»ˆ ®
      (=cns11643-1	  . #x2521)	; ø»‘ˆ”
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; Î»
      ))
    (=ucs		. #x039B)	; Î›
    (greek-iso8859-7	. #xCB)	; øº’¼‹
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
      (=ucs		  . #x039B)	; Î›
      ))
    (=gb2312		. #x262B)	; ø»„¤
    (=jis-x0208		. #x262B)	; ø½‰½œ
    (=ks-x1001		. #x254B)	; ø»ˆ ®
    (=cns11643-1	. #x2521)	; ø»‘ˆ”
    (=big5		. #xA34E)	; ý¢€ŠŽ
    (=ucs@jis		. #x039B)	; ø»„¤
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter mu")
      (=gb2312		  . #x262C)	; ø»„¥
      (=jis-x0208	  . #x262C)	; ø½‰½
      (=ks-x1001	  . #x254C)	; ø»ˆ ¯
      (=cns11643-1	  . #x2522)	; ø»‘ˆ•
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; Î¼
      ))
    (=ucs		. #x039C)	; Îœ
    (greek-iso8859-7	. #xCC)	; øº’¼Œ
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
      (=ucs		  . #x039C)	; Îœ
      ))
    (=gb2312		. #x262C)	; ø»„¥
    (=jis-x0208		. #x262C)	; ø½‰½
    (=ks-x1001		. #x254C)	; ø»ˆ ¯
    (=cns11643-1	. #x2522)	; ø»‘ˆ•
    (=big5		. #xA34F)	; ý¢€Š
    (=ucs@jis		. #x039C)	; ø»„¥
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter nu")
      (=gb2312		  . #x262D)	; ø»„¦
      (=jis-x0208	  . #x262D)	; ø½‰½ž
      (=ks-x1001	  . #x254D)	; ø»ˆ °
      (=cns11643-1	  . #x2523)	; ø»‘ˆ–
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; Î½
      ))
    (=ucs		. #x039D)	; Î
    (greek-iso8859-7	. #xCD)	; øº’¼
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
      (=ucs		  . #x039D)	; Î
      ))
    (=gb2312		. #x262D)	; ø»„¦
    (=jis-x0208		. #x262D)	; ø½‰½ž
    (=ks-x1001		. #x254D)	; ø»ˆ °
    (=cns11643-1	. #x2523)	; ø»‘ˆ–
    (=big5		. #xA350)	; ý¢€Š
    (=ucs@jis		. #x039D)	; ø»„¦
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter xi")
      (=gb2312		  . #x262E)	; ø»„§
      (=jis-x0208	  . #x262E)	; ø½‰½Ÿ
      (=ks-x1001	  . #x254E)	; ø»ˆ ±
      (=cns11643-1	  . #x2524)	; ø»‘ˆ—
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; Î¾
      ))
    (=ucs		. #x039E)	; Îž
    (greek-iso8859-7	. #xCE)	; øº’¼Ž
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
      (=ucs		  . #x039E)	; Îž
      ))
    (=gb2312		. #x262E)	; ø»„§
    (=jis-x0208		. #x262E)	; ø½‰½Ÿ
    (=ks-x1001		. #x254E)	; ø»ˆ ±
    (=cns11643-1	. #x2524)	; ø»‘ˆ—
    (=big5		. #xA351)	; ý¢€Š‘
    (=ucs@jis		. #x039E)	; ø»„§
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omicron")
      (=gb2312		  . #x262F)	; ø»„¨
      (=jis-x0208	  . #x262F)	; ø½‰½ 
      (=ks-x1001	  . #x254F)	; ø»ˆ ²
      (=cns11643-1	  . #x2525)	; ø»‘ˆ˜
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; Î¿
      ))
    (=ucs		. #x039F)	; ÎŸ
    (greek-iso8859-7	. #xCF)	; øº’¼
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
      (=ucs		  . #x039F)	; ÎŸ
      ))
    (=gb2312		. #x262F)	; ø»„¨
    (=jis-x0208		. #x262F)	; ø½‰½ 
    (=ks-x1001		. #x254F)	; ø»ˆ ²
    (=cns11643-1	. #x2525)	; ø»‘ˆ˜
    (=big5		. #xA352)	; ý¢€Š’
    (=ucs@jis		. #x039F)	; ø»„¨
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter pi")
      (=gb2312		  . #x2630)	; ø»„©
      (=jis-x0208	  . #x2630)	; ø½‰½¡
      (=ks-x1001	  . #x2550)	; ø»ˆ ³
      (=cns11643-1	  . #x2526)	; ø»‘ˆ™
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; Ï€
      ))
    (=ucs		. #x03A0)	; Î 
    (greek-iso8859-7	. #xD0)	; øº’¼
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
      (=ucs		  . #x03A0)	; Î 
      ))
    (=gb2312		. #x2630)	; ø»„©
    (=jis-x0208		. #x2630)	; ø½‰½¡
    (=ks-x1001		. #x2550)	; ø»ˆ ³
    (=cns11643-1	. #x2526)	; ø»‘ˆ™
    (=big5		. #xA353)	; ý¢€Š“
    (=ucs@jis		. #x03A0)	; ø»„©
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter rho")
      (=gb2312		  . #x2631)	; ø»„ª
      (=jis-x0208	  . #x2631)	; ø½‰½¢
      (=ks-x1001	  . #x2551)	; ø»ˆ ´
      (=cns11643-1	  . #x2527)	; ø»‘ˆš
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; Ï
      ))
    (=ucs		. #x03A1)	; Î¡
    (greek-iso8859-7	. #xD1)	; øº’¼‘
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
      (=ucs		  . #x03A1)	; Î¡
      ))
    (=gb2312		. #x2631)	; ø»„ª
    (=jis-x0208		. #x2631)	; ø½‰½¢
    (=ks-x1001		. #x2551)	; ø»ˆ ´
    (=cns11643-1	. #x2527)	; ø»‘ˆš
    (=big5		. #xA354)	; ý¢€Š”
    (=ucs@jis		. #x03A1)	; ø»„ª
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter sigma")
      (=gb2312		  . #x2632)	; ø»„«
      (=jis-x0208	  . #x2632)	; ø½‰½£
      (=ks-x1001	  . #x2552)	; ø»ˆ µ
      (=cns11643-1	  . #x2528)	; ø»‘ˆ›
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; Ïƒ
      ))
    (=ucs		. #x03A3)	; Î£
    (greek-iso8859-7	. #xD3)	; øº’¼“
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
      (=ucs		  . #x03A3)	; Î£
      ))
    (=gb2312		. #x2632)	; ø»„«
    (=jis-x0208		. #x2632)	; ø½‰½£
    (=ks-x1001		. #x2552)	; ø»ˆ µ
    (=cns11643-1	. #x2528)	; ø»‘ˆ›
    (=big5		. #xA355)	; ý¢€Š•
    (=ucs@jis		. #x03A3)	; ø»„«
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter tau")
      (=gb2312		  . #x2633)	; ø»„¬
      (=jis-x0208	  . #x2633)	; ø½‰½¤
      (=ks-x1001	  . #x2553)	; ø»ˆ ¶
      (=cns11643-1	  . #x2529)	; ø»‘ˆœ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; Ï„
      ))
    (=ucs		. #x03A4)	; Î¤
    (greek-iso8859-7	. #xD4)	; øº’¼”
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
      (=ucs		  . #x03A4)	; Î¤
      ))
    (=gb2312		. #x2633)	; ø»„¬
    (=jis-x0208		. #x2633)	; ø½‰½¤
    (=ks-x1001		. #x2553)	; ø»ˆ ¶
    (=cns11643-1	. #x2529)	; ø»‘ˆœ
    (=big5		. #xA356)	; ý¢€Š–
    (=ucs@jis		. #x03A4)	; ø»„¬
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter upsilon")
      (=gb2312		  . #x2634)	; ø»„­
      (=jis-x0208	  . #x2634)	; ø½‰½¥
      (=ks-x1001	  . #x2554)	; ø»ˆ ·
      (=cns11643-1	  . #x252A)	; ø»‘ˆ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; Ï…
      ))
    (=ucs		. #x03A5)	; Î¥
    (greek-iso8859-7	. #xD5)	; øº’¼•
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
      (=ucs		  . #x03A5)	; Î¥
      ))
    (=gb2312		. #x2634)	; ø»„­
    (=jis-x0208		. #x2634)	; ø½‰½¥
    (=ks-x1001		. #x2554)	; ø»ˆ ·
    (=cns11643-1	. #x252A)	; ø»‘ˆ
    (=big5		. #xA357)	; ý¢€Š—
    (=ucs@jis		. #x03A5)	; ø»„­
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter phi")
      (=gb2312		  . #x2635)	; ø»„®
      (=jis-x0208	  . #x2635)	; ø½‰½¦
      (=ks-x1001	  . #x2555)	; ø»ˆ ¸
      (=cns11643-1	  . #x252B)	; ø»‘ˆž
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; Ï†
      ))
    (=ucs		. #x03A6)	; Î¦
    (greek-iso8859-7	. #xD6)	; øº’¼–
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
      (=ucs		  . #x03A6)	; Î¦
      ))
    (=gb2312		. #x2635)	; ø»„®
    (=jis-x0208		. #x2635)	; ø½‰½¦
    (=ks-x1001		. #x2555)	; ø»ˆ ¸
    (=cns11643-1	. #x252B)	; ø»‘ˆž
    (=big5		. #xA358)	; ý¢€Š˜
    (=ucs@jis		. #x03A6)	; ø»„®
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter chi")
      (=gb2312		  . #x2636)	; ø»„¯
      (=jis-x0208	  . #x2636)	; ø½‰½§
      (=ks-x1001	  . #x2556)	; ø»ˆ ¹
      (=cns11643-1	  . #x252C)	; ø»‘ˆŸ
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; Ï‡
      ))
    (=ucs		. #x03A7)	; Î§
    (greek-iso8859-7	. #xD7)	; øº’¼—
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
      (=ucs		  . #x03A7)	; Î§
      ))
    (=gb2312		. #x2636)	; ø»„¯
    (=jis-x0208		. #x2636)	; ø½‰½§
    (=ks-x1001		. #x2556)	; ø»ˆ ¹
    (=cns11643-1	. #x252C)	; ø»‘ˆŸ
    (=big5		. #xA359)	; ý¢€Š™
    (=ucs@jis		. #x03A7)	; ø»„¯
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter psi")
      (=gb2312		  . #x2637)	; ø»„°
      (=jis-x0208	  . #x2637)	; ø½‰½¨
      (=ks-x1001	  . #x2557)	; ø»ˆ º
      (=cns11643-1	  . #x252D)	; ø»‘ˆ 
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; Ïˆ
      ))
    (=ucs		. #x03A8)	; Î¨
    (greek-iso8859-7	. #xD8)	; øº’¼˜
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
      (=ucs		  . #x03A8)	; Î¨
      ))
    (=gb2312		. #x2637)	; ø»„°
    (=jis-x0208		. #x2637)	; ø½‰½¨
    (=ks-x1001		. #x2557)	; ø»ˆ º
    (=cns11643-1	. #x252D)	; ø»‘ˆ 
    (=big5		. #xA35A)	; ý¢€Šš
    (=ucs@jis		. #x03A8)	; ø»„°
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omega")
      (=gb2312		  . #x2638)	; ø»„±
      (=jis-x0208	  . #x2638)	; ø½‰½©
      (=ks-x1001	  . #x2558)	; ø»ˆ »
      (=cns11643-1	  . #x252E)	; ø»‘ˆ¡
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; Ï‰
      ))
    (=ucs		. #x03A9)	; Î©
    (greek-iso8859-7	. #xD9)	; øº’¼™
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
      (=ucs		  . #x03A9)	; Î©
      ))
    (=gb2312		. #x2638)	; ø»„±
    (=jis-x0208		. #x2638)	; ø½‰½©
    (=ks-x1001		. #x2558)	; ø»ˆ »
    (=cns11643-1	. #x252E)	; ø»‘ˆ¡
    (=big5		. #xA35B)	; ý¢€Š›
    (=ucs@jis		. #x03A9)	; ø»„±
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with dialytika")
      (=jis-x0212	  . #x2665)	; ø»Š¬ª
      (=ucs@jis		  . #x03AA)	; ø»Š¬ª
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ÏŠ
      ))
    (=ucs		. #x03AA)	; Îª
    (greek-iso8859-7	. #xDA)	; øº’¼š
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
      (=ucs		  . #x03AA)	; Îª
      ))
    (=jis-x0212		. #x2665)	; ø»Š¬ª
    (=ucs@jis		. #x03AA)	; ø»Š¬ª
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with dialytika")
      (=jis-x0212	  . #x266A)	; ø»Š¬¯
      (=ucs@jis		  . #x03AB)	; ø»Š¬¯
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; Ï‹
      ))
    (=ucs		. #x03AB)	; Î«
    (greek-iso8859-7	. #xDB)	; øº’¼›
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
      (=ucs		  . #x03AB)	; Î«
      ))
    (=jis-x0212		. #x266A)	; ø»Š¬¯
    (=ucs@jis		. #x03AB)	; ø»Š¬¯
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter alpha with tonos")
      (=jis-x0212	  . #x2671)	; ø»Š¬¶
      (=ucs@jis		  . #x03AC)	; ø»Š¬¶
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Î†
      ))
    (=ucs		. #x03AC)	; Î¬
    (greek-iso8859-7	. #xDC)	; øº’¼œ
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
      (=ucs		  . #x03AC)	; Î¬
      ))
    (=jis-x0212		. #x2671)	; ø»Š¬¶
    (=ucs@jis		. #x03AC)	; ø»Š¬¶
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter epsilon with tonos")
      (=jis-x0212	  . #x2672)	; ø»Š¬·
      (=ucs@jis		  . #x03AD)	; ø»Š¬·
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Îˆ
      ))
    (=ucs		. #x03AD)	; Î­
    (greek-iso8859-7	. #xDD)	; øº’¼
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
      (=ucs		  . #x03AD)	; Î­
      ))
    (=jis-x0212		. #x2672)	; ø»Š¬·
    (=ucs@jis		. #x03AD)	; ø»Š¬·
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter eta with tonos")
      (=jis-x0212	  . #x2673)	; ø»Š¬¸
      (=ucs@jis		  . #x03AE)	; ø»Š¬¸
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Î‰
      ))
    (=ucs		. #x03AE)	; Î®
    (greek-iso8859-7	. #xDE)	; øº’¼ž
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
      (=ucs		  . #x03AE)	; Î®
      ))
    (=jis-x0212		. #x2673)	; ø»Š¬¸
    (=ucs@jis		. #x03AE)	; ø»Š¬¸
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with tonos")
      (=jis-x0212	  . #x2674)	; ø»Š¬¹
      (=ucs@jis		  . #x03AF)	; ø»Š¬¹
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; ÎŠ
      ))
    (=ucs		. #x03AF)	; Î¯
    (greek-iso8859-7	. #xDF)	; øº’¼Ÿ
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
      (=ucs		  . #x03AF)	; Î¯
      ))
    (=jis-x0212		. #x2674)	; ø»Š¬¹
    (=ucs@jis		. #x03AF)	; ø»Š¬¹
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika and tonos")
      (=jis-x0212	  . #x267B)	; ø»Š­€
      (=ucs@jis		  . #x03B0)	; ø»Š­€
      ))
    (=ucs		. #x03B0)	; Î°
    (greek-iso8859-7	. #xE0)	; øº’¼ 
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
      (=ucs		  . #x03B0)	; Î°
      ))
    (=jis-x0212		. #x267B)	; ø»Š­€
    (=ucs@jis		. #x03B0)	; ø»Š­€
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter alpha")
      (=gb2312		  . #x2641)	; ø»„º
      (=jis-x0208	  . #x2641)	; ø½‰½²
      (=ks-x1001	  . #x2561)	; ø»ˆ¡„
      (=cns11643-1	  . #x252F)	; ø»‘ˆ¢
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Î‘
      ))
    (=ucs		. #x03B1)	; Î±
    (greek-iso8859-7	. #xE1)	; øº’¼¡
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
      (=ucs		  . #x03B1)	; Î±
      ))
    (=gb2312		. #x2641)	; ø»„º
    (=jis-x0208		. #x2641)	; ø½‰½²
    (=ks-x1001		. #x2561)	; ø»ˆ¡„
    (=cns11643-1	. #x252F)	; ø»‘ˆ¢
    (=big5		. #xA35C)	; ý¢€Šœ
    (=ucs@jis		. #x03B1)	; ø»„º
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter beta")
      (=gb2312		  . #x2642)	; ø»„»
      (=jis-x0208	  . #x2642)	; ø½‰½³
      (=ks-x1001	  . #x2562)	; ø»ˆ¡…
      (=cns11643-1	  . #x2530)	; ø»‘ˆ£
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Î’
      ))
    (=ucs		. #x03B2)	; Î²
    (greek-iso8859-7	. #xE2)	; øº’¼¢
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
      (=ucs		  . #x03B2)	; Î²
      ))
    (=gb2312		. #x2642)	; ø»„»
    (=jis-x0208		. #x2642)	; ø½‰½³
    (=ks-x1001		. #x2562)	; ø»ˆ¡…
    (=cns11643-1	. #x2530)	; ø»‘ˆ£
    (=big5		. #xA35D)	; ý¢€Š
    (=ucs@jis		. #x03B2)	; ø»„»
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter gamma")
      (=gb2312		  . #x2643)	; ø»„¼
      (=jis-x0208	  . #x2643)	; ø½‰½´
      (=ks-x1001	  . #x2563)	; ø»ˆ¡†
      (=cns11643-1	  . #x2531)	; ø»‘ˆ¤
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Î“
      ))
    (=ucs		. #x03B3)	; Î³
    (greek-iso8859-7	. #xE3)	; øº’¼£
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
      (=ucs		  . #x03B3)	; Î³
      ))
    (=gb2312		. #x2643)	; ø»„¼
    (=jis-x0208		. #x2643)	; ø½‰½´
    (=ks-x1001		. #x2563)	; ø»ˆ¡†
    (=cns11643-1	. #x2531)	; ø»‘ˆ¤
    (=big5		. #xA35E)	; ý¢€Šž
    (=ucs@jis		. #x03B3)	; ø»„¼
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter delta")
      (=gb2312		  . #x2644)	; ø»„½
      (=jis-x0208	  . #x2644)	; ø½‰½µ
      (=ks-x1001	  . #x2564)	; ø»ˆ¡‡
      (=cns11643-1	  . #x2532)	; ø»‘ˆ¥
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Î”
      ))
    (=ucs		. #x03B4)	; Î´
    (greek-iso8859-7	. #xE4)	; øº’¼¤
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
      (=ucs		  . #x03B4)	; Î´
      ))
    (=gb2312		. #x2644)	; ø»„½
    (=jis-x0208		. #x2644)	; ø½‰½µ
    (=ks-x1001		. #x2564)	; ø»ˆ¡‡
    (=cns11643-1	. #x2532)	; ø»‘ˆ¥
    (=big5		. #xA35F)	; ý¢€ŠŸ
    (=ucs@jis		. #x03B4)	; ø»„½
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter epsilon")
      (=gb2312		  . #x2645)	; ø»„¾
      (=jis-x0208	  . #x2645)	; ø½‰½¶
      (=ks-x1001	  . #x2565)	; ø»ˆ¡ˆ
      (=cns11643-1	  . #x2533)	; ø»‘ˆ¦
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Î•
      ))
    (=ucs		. #x03B5)	; Îµ
    (greek-iso8859-7	. #xE5)	; øº’¼¥
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
      (=ucs		  . #x03B5)	; Îµ
      ))
    (=gb2312		. #x2645)	; ø»„¾
    (=jis-x0208		. #x2645)	; ø½‰½¶
    (=ks-x1001		. #x2565)	; ø»ˆ¡ˆ
    (=cns11643-1	. #x2533)	; ø»‘ˆ¦
    (=big5		. #xA360)	; ý¢€Š 
    (=ucs@jis		. #x03B5)	; ø»„¾
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter zeta")
      (=gb2312		  . #x2646)	; ø»„¿
      (=jis-x0208	  . #x2646)	; ø½‰½·
      (=ks-x1001	  . #x2566)	; ø»ˆ¡‰
      (=cns11643-1	  . #x2534)	; ø»‘ˆ§
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Î–
      ))
    (=ucs		. #x03B6)	; Î¶
    (greek-iso8859-7	. #xE6)	; øº’¼¦
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
      (=ucs		  . #x03B6)	; Î¶
      ))
    (=gb2312		. #x2646)	; ø»„¿
    (=jis-x0208		. #x2646)	; ø½‰½·
    (=ks-x1001		. #x2566)	; ø»ˆ¡‰
    (=cns11643-1	. #x2534)	; ø»‘ˆ§
    (=big5		. #xA361)	; ý¢€Š¡
    (=ucs@jis		. #x03B6)	; ø»„¿
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter eta")
      (=gb2312		  . #x2647)	; ø»„Ž€
      (=jis-x0208	  . #x2647)	; ø½‰½¸
      (=ks-x1001	  . #x2567)	; ø»ˆ¡Š
      (=cns11643-1	  . #x2535)	; ø»‘ˆ¨
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Î—
      ))
    (=ucs		. #x03B7)	; Î·
    (greek-iso8859-7	. #xE7)	; øº’¼§
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
      (=ucs		  . #x03B7)	; Î·
      ))
    (=gb2312		. #x2647)	; ø»„Ž€
    (=jis-x0208		. #x2647)	; ø½‰½¸
    (=ks-x1001		. #x2567)	; ø»ˆ¡Š
    (=cns11643-1	. #x2535)	; ø»‘ˆ¨
    (=big5		. #xA362)	; ý¢€Š¢
    (=ucs@jis		. #x03B7)	; ø»„Ž€
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter theta")
      (=gb2312		  . #x2648)	; ø»„Ž
      (=jis-x0208	  . #x2648)	; ø½‰½¹
      (=ks-x1001	  . #x2568)	; ø»ˆ¡‹
      (=cns11643-1	  . #x2536)	; ø»‘ˆ©
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Î˜
      ))
    (=ucs		. #x03B8)	; Î¸
    (greek-iso8859-7	. #xE8)	; øº’¼¨
    (ipa		. #xC8)	; øº’›ˆ
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
      (=ucs		  . #x03B8)	; Î¸
      ))
    (=gb2312		. #x2648)	; ø»„Ž
    (=jis-x0208		. #x2648)	; ø½‰½¹
    (=ks-x1001		. #x2568)	; ø»ˆ¡‹
    (=cns11643-1	. #x2536)	; ø»‘ˆ©
    (=big5		. #xA363)	; ý¢€Š£
    (=ucs@jis		. #x03B8)	; ø»„Ž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter iota")
      (=gb2312		  . #x2649)	; ø»„Ž‚
      (=jis-x0208	  . #x2649)	; ø½‰½º
      (=ks-x1001	  . #x2569)	; ø»ˆ¡Œ
      (=cns11643-1	  . #x2537)	; ø»‘ˆª
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Î™
      ))
    (=ucs		. #x03B9)	; Î¹
    (greek-iso8859-7	. #xE9)	; øº’¼©
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
      (=ucs		  . #x03B9)	; Î¹
      ))
    (=gb2312		. #x2649)	; ø»„Ž‚
    (=jis-x0208		. #x2649)	; ø½‰½º
    (=ks-x1001		. #x2569)	; ø»ˆ¡Œ
    (=cns11643-1	. #x2537)	; ø»‘ˆª
    (=big5		. #xA364)	; ý¢€Š¤
    (=ucs@jis		. #x03B9)	; ø»„Ž‚
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter kappa")
      (=gb2312		  . #x264A)	; ø»„Žƒ
      (=jis-x0208	  . #x264A)	; ø½‰½»
      (=ks-x1001	  . #x256A)	; ø»ˆ¡
      (=cns11643-1	  . #x2538)	; ø»‘ˆ«
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Îš
      ))
    (=ucs		. #x03BA)	; Îº
    (greek-iso8859-7	. #xEA)	; øº’¼ª
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
      (=ucs		  . #x039A)	; Îš
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; Îº
      ))
    (=gb2312		. #x264A)	; ø»„Žƒ
    (=jis-x0208		. #x264A)	; ø½‰½»
    (=ks-x1001		. #x256A)	; ø»ˆ¡
    (=cns11643-1	. #x2538)	; ø»‘ˆ«
    (=big5		. #xA365)	; ý¢€Š¥
    (=ucs@jis		. #x03BA)	; ø»„Žƒ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter lamda")
      (=gb2312		  . #x264B)	; ø»„Ž„
      (=jis-x0208	  . #x264B)	; ø½‰½¼
      (=ks-x1001	  . #x256B)	; ø»ˆ¡Ž
      (=cns11643-1	  . #x2539)	; ø»‘ˆ¬
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Î›
      ))
    (=ucs		. #x03BB)	; Î»
    (greek-iso8859-7	. #xEB)	; øº’¼«
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
      (=ucs		  . #x03BB)	; Î»
      ))
    (=gb2312		. #x264B)	; ø»„Ž„
    (=jis-x0208		. #x264B)	; ø½‰½¼
    (=ks-x1001		. #x256B)	; ø»ˆ¡Ž
    (=cns11643-1	. #x2539)	; ø»‘ˆ¬
    (=big5		. #xA366)	; ý¢€Š¦
    (=ucs@jis		. #x03BB)	; ø»„Ž„
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter mu")
      (=gb2312		  . #x264C)	; ø»„Ž…
      (=jis-x0208	  . #x264C)	; ø½‰½½
      (=ks-x1001	  . #x256C)	; ø»ˆ¡
      (=cns11643-1	  . #x253A)	; ø»‘ˆ­
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Îœ
      ))
    (=ucs		. #x03BC)	; Î¼
    (greek-iso8859-7	. #xEC)	; øº’¼¬
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
      (=ucs		  . #x03BC)	; Î¼
      ))
    (=gb2312		. #x264C)	; ø»„Ž…
    (=jis-x0208		. #x264C)	; ø½‰½½
    (=ks-x1001		. #x256C)	; ø»ˆ¡
    (=cns11643-1	. #x253A)	; ø»‘ˆ­
    (=big5		. #xA367)	; ý¢€Š§
    (=ucs@jis		. #x03BC)	; ø»„Ž…
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter nu")
      (=gb2312		  . #x264D)	; ø»„Ž†
      (=jis-x0208	  . #x264D)	; ø½‰½¾
      (=ks-x1001	  . #x256D)	; ø»ˆ¡
      (=cns11643-1	  . #x253B)	; ø»‘ˆ®
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Î
      ))
    (=ucs		. #x03BD)	; Î½
    (greek-iso8859-7	. #xED)	; øº’¼­
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
      (=ucs		  . #x03BD)	; Î½
      ))
    (=gb2312		. #x264D)	; ø»„Ž†
    (=jis-x0208		. #x264D)	; ø½‰½¾
    (=ks-x1001		. #x256D)	; ø»ˆ¡
    (=cns11643-1	. #x253B)	; ø»‘ˆ®
    (=big5		. #xA368)	; ý¢€Š¨
    (=ucs@jis		. #x03BD)	; ø»„Ž†
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter xi")
      (=gb2312		  . #x264E)	; ø»„Ž‡
      (=jis-x0208	  . #x264E)	; ø½‰½¿
      (=ks-x1001	  . #x256E)	; ø»ˆ¡‘
      (=cns11643-1	  . #x253C)	; ø»‘ˆ¯
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Îž
      ))
    (=ucs		. #x03BE)	; Î¾
    (greek-iso8859-7	. #xEE)	; øº’¼®
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
      (=ucs		  . #x03BE)	; Î¾
      ))
    (=gb2312		. #x264E)	; ø»„Ž‡
    (=jis-x0208		. #x264E)	; ø½‰½¿
    (=ks-x1001		. #x256E)	; ø»ˆ¡‘
    (=cns11643-1	. #x253C)	; ø»‘ˆ¯
    (=big5		. #xA369)	; ý¢€Š©
    (=ucs@jis		. #x03BE)	; ø»„Ž‡
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omicron")
      (=gb2312		  . #x264F)	; ø»„Žˆ
      (=jis-x0208	  . #x264F)	; ø½‰¾€
      (=ks-x1001	  . #x256F)	; ø»ˆ¡’
      (=cns11643-1	  . #x253D)	; ø»‘ˆ°
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; ÎŸ
      ))
    (=ucs		. #x03BF)	; Î¿
    (greek-iso8859-7	. #xEF)	; øº’¼¯
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
      (=ucs		  . #x03BF)	; Î¿
      ))
    (=gb2312		. #x264F)	; ø»„Žˆ
    (=jis-x0208		. #x264F)	; ø½‰¾€
    (=ks-x1001		. #x256F)	; ø»ˆ¡’
    (=cns11643-1	. #x253D)	; ø»‘ˆ°
    (=big5		. #xA36A)	; ý¢€Šª
    (=ucs@jis		. #x03BF)	; ø»„Žˆ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter pi")
      (=gb2312		  . #x2650)	; ø»„Ž‰
      (=jis-x0208	  . #x2650)	; ø½‰¾
      (=ks-x1001	  . #x2570)	; ø»ˆ¡“
      (=cns11643-1	  . #x253E)	; ø»‘ˆ±
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Î 
      ))
    (=ucs		. #x03C0)	; Ï€
    (greek-iso8859-7	. #xF0)	; øº’¼°
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
      (=ucs		  . #x03C0)	; Ï€
      ))
    (=gb2312		. #x2650)	; ø»„Ž‰
    (=jis-x0208		. #x2650)	; ø½‰¾
    (=ks-x1001		. #x2570)	; ø»ˆ¡“
    (=cns11643-1	. #x253E)	; ø»‘ˆ±
    (=big5		. #xA36B)	; ý¢€Š«
    (=ucs@jis		. #x03C0)	; ø»„Ž‰
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter rho")
      (=gb2312		  . #x2651)	; ø»„ŽŠ
      (=jis-x0208	  . #x2651)	; ø½‰¾‚
      (=ks-x1001	  . #x2571)	; ø»ˆ¡”
      (=cns11643-1	  . #x253F)	; ø»‘ˆ²
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Î¡
      ))
    (=ucs		. #x03C1)	; Ï
    (greek-iso8859-7	. #xF1)	; øº’¼±
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
      (=ucs		  . #x03C1)	; Ï
      ))
    (=gb2312		. #x2651)	; ø»„ŽŠ
    (=jis-x0208		. #x2651)	; ø½‰¾‚
    (=ks-x1001		. #x2571)	; ø»ˆ¡”
    (=cns11643-1	. #x253F)	; ø»‘ˆ²
    (=big5		. #xA36C)	; ý¢€Š¬
    (=ucs@jis		. #x03C1)	; ø»„ŽŠ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter final sigma")
      (=jis-x0212	  . #x2678)	; ø»Š¬½
      (=jis-x0213-1-2000  . #x2659)	; ø»¢›Š
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Î£
      ))
    (=ucs		. #x03C2)	; Ï‚
    (greek-iso8859-7	. #xF2)	; øº’¼²
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
      (=ucs		  . #x03C2)	; Ï‚
      ))
    (=jis-x0212		. #x2678)	; ø»Š¬½
    (=jis-x0213-1-2000	. #x2659)	; ø»¢›Š
    (=ucs@jis		. #x03C2)	; ø»Š¬½
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter sigma")
      (=gb2312		  . #x2652)	; ø»„Ž‹
      (=jis-x0208	  . #x2652)	; ø½‰¾ƒ
      (=ks-x1001	  . #x2572)	; ø»ˆ¡•
      (=cns11643-1	  . #x2540)	; ø»‘ˆ³
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Î£
      ))
    (=ucs		. #x03C3)	; Ïƒ
    (greek-iso8859-7	. #xF3)	; øº’¼³
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
      (=ucs		  . #x03C3)	; Ïƒ
      ))
    (=gb2312		. #x2652)	; ø»„Ž‹
    (=jis-x0208		. #x2652)	; ø½‰¾ƒ
    (=ks-x1001		. #x2572)	; ø»ˆ¡•
    (=cns11643-1	. #x2540)	; ø»‘ˆ³
    (=big5		. #xA36D)	; ý¢€Š­
    (=ucs@jis		. #x03C3)	; ø»„Ž‹
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter tau")
      (=gb2312		  . #x2653)	; ø»„ŽŒ
      (=jis-x0208	  . #x2653)	; ø½‰¾„
      (=ks-x1001	  . #x2573)	; ø»ˆ¡–
      (=cns11643-1	  . #x2541)	; ø»‘ˆ´
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Î¤
      ))
    (=ucs		. #x03C4)	; Ï„
    (greek-iso8859-7	. #xF4)	; øº’¼´
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
      (=ucs		  . #x03C4)	; Ï„
      ))
    (=gb2312		. #x2653)	; ø»„ŽŒ
    (=jis-x0208		. #x2653)	; ø½‰¾„
    (=ks-x1001		. #x2573)	; ø»ˆ¡–
    (=cns11643-1	. #x2541)	; ø»‘ˆ´
    (=big5		. #xA36E)	; ý¢€Š®
    (=ucs@jis		. #x03C4)	; ø»„ŽŒ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter upsilon")
      (=gb2312		  . #x2654)	; ø»„Ž
      (=jis-x0208	  . #x2654)	; ø½‰¾…
      (=ks-x1001	  . #x2574)	; ø»ˆ¡—
      (=cns11643-1	  . #x2542)	; ø»‘ˆµ
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Î¥
      ))
    (=ucs		. #x03C5)	; Ï…
    (greek-iso8859-7	. #xF5)	; øº’¼µ
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
      (=ucs		  . #x03C5)	; Ï…
      ))
    (=gb2312		. #x2654)	; ø»„Ž
    (=jis-x0208		. #x2654)	; ø½‰¾…
    (=ks-x1001		. #x2574)	; ø»ˆ¡—
    (=cns11643-1	. #x2542)	; ø»‘ˆµ
    (=big5		. #xA36F)	; ý¢€Š¯
    (=ucs@jis		. #x03C5)	; ø»„Ž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter phi")
      (=gb2312		  . #x2655)	; ø»„ŽŽ
      (=jis-x0208	  . #x2655)	; ø½‰¾†
      (=ks-x1001	  . #x2575)	; ø»ˆ¡˜
      (=cns11643-1	  . #x2543)	; ø»‘ˆ¶
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Î¦
      ))
    (=ucs		. #x03C6)	; Ï†
    (greek-iso8859-7	. #xF6)	; øº’¼¶
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
      (=ucs		  . #x03C6)	; Ï†
      ))
    (=gb2312		. #x2655)	; ø»„ŽŽ
    (=jis-x0208		. #x2655)	; ø½‰¾†
    (=ks-x1001		. #x2575)	; ø»ˆ¡˜
    (=cns11643-1	. #x2543)	; ø»‘ˆ¶
    (=big5		. #xA370)	; ý¢€Š°
    (=ucs@jis		. #x03C6)	; ø»„ŽŽ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter chi")
      (=gb2312		  . #x2656)	; ø»„Ž
      (=jis-x0208	  . #x2656)	; ø½‰¾‡
      (=ks-x1001	  . #x2576)	; ø»ˆ¡™
      (=cns11643-1	  . #x2544)	; ø»‘ˆ·
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Î§
      ))
    (=ucs		. #x03C7)	; Ï‡
    (greek-iso8859-7	. #xF7)	; øº’¼·
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
      (=ucs		  . #x03C7)	; Ï‡
      ))
    (=gb2312		. #x2656)	; ø»„Ž
    (=jis-x0208		. #x2656)	; ø½‰¾‡
    (=ks-x1001		. #x2576)	; ø»ˆ¡™
    (=cns11643-1	. #x2544)	; ø»‘ˆ·
    (=big5		. #xA371)	; ý¢€Š±
    (=ucs@jis		. #x03C7)	; ø»„Ž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter psi")
      (=gb2312		  . #x2657)	; ø»„Ž
      (=jis-x0208	  . #x2657)	; ø½‰¾ˆ
      (=ks-x1001	  . #x2577)	; ø»ˆ¡š
      (=cns11643-1	  . #x2545)	; ø»‘ˆ¸
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Î¨
      ))
    (=ucs		. #x03C8)	; Ïˆ
    (greek-iso8859-7	. #xF8)	; øº’¼¸
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
      (=ucs		  . #x03C8)	; Ïˆ
      ))
    (=gb2312		. #x2657)	; ø»„Ž
    (=jis-x0208		. #x2657)	; ø½‰¾ˆ
    (=ks-x1001		. #x2577)	; ø»ˆ¡š
    (=cns11643-1	. #x2545)	; ø»‘ˆ¸
    (=big5		. #xA372)	; ý¢€Š²
    (=ucs@jis		. #x03C8)	; ø»„Ž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omega")
      (=gb2312		  . #x2658)	; ø»„Ž‘
      (=jis-x0208	  . #x2658)	; ø½‰¾‰
      (=ks-x1001	  . #x2578)	; ø»ˆ¡›
      (=cns11643-1	  . #x2546)	; ø»‘ˆ¹
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Î©
      ))
    (=ucs		. #x03C9)	; Ï‰
    (greek-iso8859-7	. #xF9)	; øº’¼¹
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
      (=ucs		  . #x03C9)	; Ï‰
      ))
    (=gb2312		. #x2658)	; ø»„Ž‘
    (=jis-x0208		. #x2658)	; ø½‰¾‰
    (=ks-x1001		. #x2578)	; ø»ˆ¡›
    (=cns11643-1	. #x2546)	; ø»‘ˆ¹
    (=big5		. #xA373)	; ý¢€Š³
    (=ucs@jis		. #x03C9)	; ø»„Ž‘
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika")
      (=jis-x0212	  . #x2675)	; ø»Š¬º
      (=ucs@jis		  . #x03CA)	; ø»Š¬º
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Îª
      ))
    (=ucs		. #x03CA)	; ÏŠ
    (greek-iso8859-7	. #xFA)	; øº’¼º
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
      (=ucs		  . #x03CA)	; ÏŠ
      ))
    (=jis-x0212		. #x2675)	; ø»Š¬º
    (=ucs@jis		. #x03CA)	; ø»Š¬º
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika")
      (=jis-x0212	  . #x267A)	; ø»Š¬¿
      (=ucs@jis		  . #x03CB)	; ø»Š¬¿
      ))
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Î«
      ))
    (=ucs		. #x03CB)	; Ï‹
    (greek-iso8859-7	. #xFB)	; øº’¼»
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
      (=ucs		  . #x03CB)	; Ï‹
      ))
    (=jis-x0212		. #x267A)	; ø»Š¬¿
    (=ucs@jis		. #x03CB)	; ø»Š¬¿
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omicron with tonos")
      (=jis-x0212	  . #x2677)	; ø»Š¬¼
      (=ucs@jis		  . #x03CC)	; ø»Š¬¼
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; ÎŒ
      ))
    (=ucs		. #x03CC)	; ÏŒ
    (greek-iso8859-7	. #xFC)	; øº’¼¼
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
      (=ucs		  . #x03CC)	; ÏŒ
      ))
    (=jis-x0212		. #x2677)	; ø»Š¬¼
    (=ucs@jis		. #x03CC)	; ø»Š¬¼
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with tonos")
      (=jis-x0212	  . #x2679)	; ø»Š¬¾
      (=ucs@jis		  . #x03CD)	; ø»Š¬¾
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; ÎŽ
      ))
    (=ucs		. #x03CD)	; Ï
    (greek-iso8859-7	. #xFD)	; øº’¼½
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
      (=ucs		  . #x03CD)	; Ï
      ))
    (=jis-x0212		. #x2679)	; ø»Š¬¾
    (=ucs@jis		. #x03CD)	; ø»Š¬¾
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omega with tonos")
      (=jis-x0212	  . #x267C)	; ø»Š­
      (=ucs@jis		  . #x03CE)	; ø»Š­
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Î
      ))
    (=ucs		. #x03CE)	; ÏŽ
    (greek-iso8859-7	. #xFE)	; øº’¼¾
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
      (=ucs		  . #x03CE)	; ÏŽ
      ))
    (=jis-x0212		. #x267C)	; ø»Š­
    (=ucs@jis		. #x03CE)	; ø»Š­
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B2)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Î’
      ))
    (=ucs		. #x03D0)	; Ï
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B8)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Î˜
      ))
    (=ucs		. #x03D1)	; Ï‘
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03A5)
    (=ucs		. #x03D2)	; Ï’
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0301)
    (=ucs		. #x03D3)	; Ï“
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0308)
    (=ucs		. #x03D4)	; Ï”
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C6)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Î¦
      ))
    (=ucs		. #x03D5)	; Ï•
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C0)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Î 
      ))
    (=ucs		. #x03D6)	; Ï–
    ))
(define-char
  '((name		. "GREEK KAI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x03D7)	; Ï—
    ))
(define-char
  '((name		. "GREEK LETTER STIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER STIGMA")
      (=ucs		  . #x03DB)	; Ï›
      ))
    (=ucs		. #x03DA)	; Ïš
    ))
(define-char
  '((name		. "GREEK SMALL LETTER STIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER STIGMA")
      (=ucs		  . #x03DA)	; Ïš
      ))
    (=ucs		. #x03DB)	; Ï›
    ))
(define-char
  '((name		. "GREEK LETTER DIGAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DIGAMMA")
      (=ucs		  . #x03DD)	; Ï
      ))
    (=ucs		. #x03DC)	; Ïœ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DIGAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER DIGAMMA")
      (=ucs		  . #x03DC)	; Ïœ
      ))
    (=ucs		. #x03DD)	; Ï
    ))
(define-char
  '((name		. "GREEK LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KOPPA")
      (=ucs		  . #x03DF)	; ÏŸ
      ))
    (=ucs		. #x03DE)	; Ïž
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER KOPPA")
      (=ucs		  . #x03DE)	; Ïž
      ))
    (=ucs		. #x03DF)	; ÏŸ
    ))
(define-char
  '((name		. "GREEK LETTER SAMPI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SAMPI")
      (=ucs		  . #x03E1)	; Ï¡
      ))
    (=ucs		. #x03E0)	; Ï 
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SAMPI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER SAMPI")
      (=ucs		  . #x03E0)	; Ï 
      ))
    (=ucs		. #x03E1)	; Ï¡
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER SHEI")
      (=ucs		  . #x03E3)	; Ï£
      ))
    (=ucs		. #x03E2)	; Ï¢
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER SHEI")
      (=ucs		  . #x03E2)	; Ï¢
      ))
    (=ucs		. #x03E3)	; Ï£
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER FEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER FEI")
      (=ucs		  . #x03E5)	; Ï¥
      ))
    (=ucs		. #x03E4)	; Ï¤
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER FEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER FEI")
      (=ucs		  . #x03E4)	; Ï¤
      ))
    (=ucs		. #x03E5)	; Ï¥
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER KHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER KHEI")
      (=ucs		  . #x03E7)	; Ï§
      ))
    (=ucs		. #x03E6)	; Ï¦
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER KHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER KHEI")
      (=ucs		  . #x03E6)	; Ï¦
      ))
    (=ucs		. #x03E7)	; Ï§
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER HORI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER HORI")
      (=ucs		  . #x03E9)	; Ï©
      ))
    (=ucs		. #x03E8)	; Ï¨
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER HORI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER HORI")
      (=ucs		  . #x03E8)	; Ï¨
      ))
    (=ucs		. #x03E9)	; Ï©
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER GANGIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER GANGIA")
      (=ucs		  . #x03EB)	; Ï«
      ))
    (=ucs		. #x03EA)	; Ïª
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER GANGIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER GANGIA")
      (=ucs		  . #x03EA)	; Ïª
      ))
    (=ucs		. #x03EB)	; Ï«
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHIMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER SHIMA")
      (=ucs		  . #x03ED)	; Ï­
      ))
    (=ucs		. #x03EC)	; Ï¬
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHIMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER SHIMA")
      (=ucs		  . #x03EC)	; Ï¬
      ))
    (=ucs		. #x03ED)	; Ï­
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER DEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER DEI")
      (=ucs		  . #x03EF)	; Ï¯
      ))
    (=ucs		. #x03EE)	; Ï®
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER DEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER DEI")
      (=ucs		  . #x03EE)	; Ï®
      ))
    (=ucs		. #x03EF)	; Ï¯
    ))
(define-char
  '((name		. "GREEK KAPPA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BA)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Îš
      ))
    (=ucs		. #x03F0)	; Ï°
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C1)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Î¡
      ))
    (=ucs		. #x03F1)	; Ï±
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C2)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Î£
      ))
    (=ucs		. #x03F2)	; Ï²
    ))
(define-char
  '((name		. "GREEK LETTER YOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x03F3)	; Ï³
    ))
