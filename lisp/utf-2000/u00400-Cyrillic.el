;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0300)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE WITH GRAVE")
      (=ucs		  . #x0450)	; Ñ
      ))
    (=ucs		. #x0400)	; Ð€
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0308)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
      (=gb2312		  . #x2727)	; ø»„Ž¾
      (=jis-x0208	  . #x2727)	; ø½‰¾¶
      (=ks-x1001	  . #x2C27)	; ø»ˆªœ
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; Ñ‘
      ))
    (=ucs		. #x0401)	; Ð
    (cyrillic-iso8859-5 . #xA1)	; øº“„¡
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
    (=>ucs		. #x0401)	; Ð
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0401)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IO")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ð
      ))
    (=gb2312		. #x2727)	; ø»„Ž¾
    (=jis-x0208		. #x2727)	; ø½‰¾¶
    (=ks-x1001		. #x2C27)	; ø»ˆªœ
    (=big5-eten		. #xC7F9)	; ý¢€ŒŸ¹
    (=ucs@jis		. #x0401)	; ø»„Ž¾
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
      (=jis-x0212	  . #x2742)	; ø»Š­¥
      (=ucs@jis		  . #x0402)	; ø»Š­¥
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; Ñ’
      ))
    (=ucs		. #x0402)	; Ð‚
    (cyrillic-iso8859-5 . #xA2)	; øº“„¢
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
    (=>ucs		. #x0402)	; Ð‚
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->decomposition	wide #x0402)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ð‚
      ))
    (=jis-x0212		. #x2742)	; ø»Š­¥
    (=ucs@jis		. #x0402)	; ø»Š­¥
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0413 #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
      (=jis-x0212	  . #x2743)	; ø»Š­¦
      (=ucs@jis		  . #x0403)	; ø»Š­¦
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; Ñ“
      ))
    (=ucs		. #x0403)	; Ðƒ
    (cyrillic-iso8859-5 . #xA3)	; øº“„£
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
    (=>ucs		. #x0403)	; Ðƒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0403)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ðƒ
      ))
    (=jis-x0212		. #x2743)	; ø»Š­¦
    (=ucs@jis		. #x0403)	; ø»Š­¦
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=jis-x0212	  . #x2744)	; ø»Š­§
      (=ucs@jis		  . #x0404)	; ø»Š­§
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; Ñ”
      ))
    (=ucs		. #x0404)	; Ð„
    (cyrillic-iso8859-5 . #xA4)	; øº“„¤
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (=>ucs		. #x0404)	; Ð„
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0404)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Ð„
      ))
    (=jis-x0212		. #x2744)	; ø»Š­§
    (=ucs@jis		. #x0404)	; ø»Š­§
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
      (=jis-x0212	  . #x2745)	; ø»Š­¨
      (=ucs@jis		  . #x0405)	; ø»Š­¨
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; Ñ•
      ))
    (=ucs		. #x0405)	; Ð…
    (cyrillic-iso8859-5 . #xA5)	; øº“„¥
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
    (=>ucs		. #x0405)	; Ð…
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0405)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ð…
      ))
    (=jis-x0212		. #x2745)	; ø»Š­¨
    (=ucs@jis		. #x0405)	; ø»Š­¨
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=jis-x0212	  . #x2746)	; ø»Š­©
      (=ucs@jis		  . #x0406)	; ø»Š­©
      ))
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; Ñ–
      ))
    (=ucs		. #x0406)	; Ð†
    (cyrillic-iso8859-5 . #xA6)	; øº“„¦
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (=>ucs		. #x0406)	; Ð†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0406)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      ))
    (<-fullwidth
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; Ð†
      ))
    (=jis-x0212		. #x2746)	; ø»Š­©
    (=ucs@jis		. #x0406)	; ø»Š­©
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	#x0406 #x0308)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YI")
      (=jis-x0212	  . #x2747)	; ø»Š­ª
      (=ucs@jis		  . #x0407)	; ø»Š­ª
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; Ñ—
      ))
    (=ucs		. #x0407)	; Ð‡
    (cyrillic-iso8859-5 . #xA7)	; øº“„§
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YI")
    (=>ucs		. #x0407)	; Ð‡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	wide #x0407)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YI")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ð‡
      ))
    (=jis-x0212		. #x2747)	; ø»Š­ª
    (=ucs@jis		. #x0407)	; ø»Š­ª
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER JE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
      (=jis-x0212	  . #x2748)	; ø»Š­«
      (=ucs@jis		  . #x0408)	; ø»Š­«
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; Ñ˜
      ))
    (=ucs		. #x0408)	; Ðˆ
    (cyrillic-iso8859-5 . #xA8)	; øº“„¨
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
    (=>ucs		. #x0408)	; Ðˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0408)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER JE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ðˆ
      ))
    (=jis-x0212		. #x2748)	; ø»Š­«
    (=ucs@jis		. #x0408)	; ø»Š­«
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
      (=jis-x0212	  . #x2749)	; ø»Š­¬
      (=ucs@jis		  . #x0409)	; ø»Š­¬
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; Ñ™
      ))
    (=ucs		. #x0409)	; Ð‰
    (cyrillic-iso8859-5 . #xA9)	; øº“„©
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
    (=>ucs		. #x0409)	; Ð‰
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0409)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER LJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Ð‰
      ))
    (=jis-x0212		. #x2749)	; ø»Š­¬
    (=ucs@jis		. #x0409)	; ø»Š­¬
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER NJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
      (=jis-x0212	  . #x274A)	; ø»Š­­
      (=ucs@jis		  . #x040A)	; ø»Š­­
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; Ñš
      ))
    (=ucs		. #x040A)	; ÐŠ
    (cyrillic-iso8859-5 . #xAA)	; øº“„ª
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
    (=>ucs		. #x040A)	; ÐŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040A)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER NJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; ÐŠ
      ))
    (=jis-x0212		. #x274A)	; ø»Š­­
    (=ucs@jis		. #x040A)	; ø»Š­­
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSHE")
      (=ucs		  . #x045B)	; Ñ›
      ))
    (=ucs		. #x040B)	; Ð‹
    (cyrillic-iso8859-5 . #xAB)	; øº“„«
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TSHE")
    (=>ucs		. #x040B)	; Ð‹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
      ))
    (=jis-x0212		. #x274B)	; ø»Š­®
    (=ucs@jis		. #x040B)	; ø»Š­®
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041A #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KJE")
      (=jis-x0212	  . #x274C)	; ø»Š­¯
      (=ucs@jis		  . #x040C)	; ø»Š­¯
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; Ñœ
      ))
    (=ucs		. #x040C)	; ÐŒ
    (cyrillic-iso8859-5 . #xAC)	; øº“„¬
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER KJE")
    (=>ucs		. #x040C)	; ÐŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040C)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; ÐŒ
      ))
    (=jis-x0212		. #x274C)	; ø»Š­¯
    (=ucs@jis		. #x040C)	; ø»Š­¯
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0300)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH GRAVE")
      (=ucs		  . #x045D)	; Ñ
      ))
    (=ucs		. #x040D)	; Ð
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	#x0423 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")
      (=jis-x0212	  . #x274D)	; ø»Š­°
      (=ucs@jis		  . #x040E)	; ø»Š­°
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; Ñž
      ))
    (=ucs		. #x040E)	; ÐŽ
    (cyrillic-iso8859-5 . #xAE)	; øº“„®
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")
    (=>ucs		. #x040E)	; ÐŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	wide #x040E)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT U")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; ÐŽ
      ))
    (=jis-x0212		. #x274D)	; ø»Š­°
    (=ucs@jis		. #x040E)	; ø»Š­°
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
      (=jis-x0212	  . #x274E)	; ø»Š­±
      (=ucs@jis		  . #x040F)	; ø»Š­±
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; ÑŸ
      ))
    (=ucs		. #x040F)	; Ð
    (cyrillic-iso8859-5 . #xAF)	; øº“„¯
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
    (=>ucs		. #x040F)	; Ð
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040F)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Ð
      ))
    (=jis-x0212		. #x274E)	; ø»Š­±
    (=ucs@jis		. #x040F)	; ø»Š­±
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER A")
      (=gb2312		  . #x2721)	; ø»„Ž¸
      (=jis-x0208	  . #x2721)	; ø½‰¾°
      (=ks-x1001	  . #x2C21)	; ø»ˆª–
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; Ð°
      ))
    (=ucs		. #x0410)	; Ð
    (cyrillic-iso8859-5 . #xB0)	; øº“„°
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER A")
    (=>ucs		. #x0410)	; Ð
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0410)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER A")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; Ð
      ))
    (=gb2312		. #x2721)	; ø»„Ž¸
    (=jis-x0208		. #x2721)	; ø½‰¾°
    (=ks-x1001		. #x2C21)	; ø»ˆª–
    (=big5-eten		. #xC7F3)	; ý¢€ŒŸ³
    (=ucs@jis		. #x0410)	; ø»„Ž¸
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
      (=gb2312		  . #x2722)	; ø»„Ž¹
      (=jis-x0208	  . #x2722)	; ø½‰¾±
      (=ks-x1001	  . #x2C22)	; ø»ˆª—
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; Ð±
      ))
    (=ucs		. #x0411)	; Ð‘
    (cyrillic-iso8859-5 . #xB1)	; øº“„±
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
    (=>ucs		. #x0411)	; Ð‘
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0411)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER BE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Ð‘
      ))
    (=gb2312		. #x2722)	; ø»„Ž¹
    (=jis-x0208		. #x2722)	; ø½‰¾±
    (=ks-x1001		. #x2C22)	; ø»ˆª—
    (=big5-eten		. #xC7F4)	; ý¢€ŒŸ´
    (=ucs@jis		. #x0411)	; ø»„Ž¹
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER VE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
      (=gb2312		  . #x2723)	; ø»„Žº
      (=jis-x0208	  . #x2723)	; ø½‰¾²
      (=ks-x1001	  . #x2C23)	; ø»ˆª˜
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; Ð²
      ))
    (=ucs		. #x0412)	; Ð’
    (cyrillic-iso8859-5 . #xB2)	; øº“„²
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
    (=>ucs		. #x0412)	; Ð’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0412)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER VE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; Ð’
      ))
    (=gb2312		. #x2723)	; ø»„Žº
    (=jis-x0208		. #x2723)	; ø½‰¾²
    (=ks-x1001		. #x2C23)	; ø»ˆª˜
    (=big5-eten		. #xC7F5)	; ý¢€ŒŸµ
    (=ucs@jis		. #x0412)	; ø»„Žº
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
      (=gb2312		  . #x2724)	; ø»„Ž»
      (=jis-x0208	  . #x2724)	; ø½‰¾³
      (=ks-x1001	  . #x2C24)	; ø»ˆª™
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; Ð³
      ))
    (=ucs		. #x0413)	; Ð“
    (cyrillic-iso8859-5 . #xB3)	; øº“„³
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
    (=>ucs		. #x0413)	; Ð“
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0413)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Ð“
      ))
    (=gb2312		. #x2724)	; ø»„Ž»
    (=jis-x0208		. #x2724)	; ø½‰¾³
    (=ks-x1001		. #x2C24)	; ø»ˆª™
    (=big5-eten		. #xC7F6)	; ý¢€ŒŸ¶
    (=ucs@jis		. #x0413)	; ø»„Ž»
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
      (=gb2312		  . #x2725)	; ø»„Ž¼
      (=jis-x0208	  . #x2725)	; ø½‰¾´
      (=ks-x1001	  . #x2C25)	; ø»ˆªš
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; Ð´
      ))
    (=ucs		. #x0414)	; Ð”
    (cyrillic-iso8859-5 . #xB4)	; øº“„´
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
    (=>ucs		. #x0414)	; Ð”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0414)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Ð”
      ))
    (=gb2312		. #x2725)	; ø»„Ž¼
    (=jis-x0208		. #x2725)	; ø½‰¾´
    (=ks-x1001		. #x2C25)	; ø»ˆªš
    (=big5-eten		. #xC7F7)	; ý¢€ŒŸ·
    (=ucs@jis		. #x0414)	; ø»„Ž¼
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
      (=gb2312		  . #x2726)	; ø»„Ž½
      (=jis-x0208	  . #x2726)	; ø½‰¾µ
      (=ks-x1001	  . #x2C26)	; ø»ˆª›
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; Ðµ
      ))
    (=ucs		. #x0415)	; Ð•
    (cyrillic-iso8859-5 . #xB5)	; øº“„µ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
    (=>ucs		. #x0415)	; Ð•
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0415)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Ð•
      ))
    (=gb2312		. #x2726)	; ø»„Ž½
    (=jis-x0208		. #x2726)	; ø½‰¾µ
    (=ks-x1001		. #x2C26)	; ø»ˆª›
    (=big5-eten		. #xC7F8)	; ý¢€ŒŸ¸
    (=ucs@jis		. #x0415)	; ø»„Ž½
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
      (=gb2312		  . #x2728)	; ø»„Ž¿
      (=jis-x0208	  . #x2728)	; ø½‰¾·
      (=ks-x1001	  . #x2C28)	; ø»ˆª
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; Ð¶
      ))
    (=ucs		. #x0416)	; Ð–
    (cyrillic-iso8859-5 . #xB6)	; øº“„¶
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
    (=>ucs		. #x0416)	; Ð–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0416)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ð–
      ))
    (=gb2312		. #x2728)	; ø»„Ž¿
    (=jis-x0208		. #x2728)	; ø½‰¾·
    (=ks-x1001		. #x2C28)	; ø»ˆª
    (=big5-eten		. #xC7FA)	; ý¢€ŒŸº
    (=ucs@jis		. #x0416)	; ø»„Ž¿
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
      (=gb2312		  . #x2729)	; ø»„€
      (=jis-x0208	  . #x2729)	; ø½‰¾¸
      (=ks-x1001	  . #x2C29)	; ø»ˆªž
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; Ð·
      ))
    (=ucs		. #x0417)	; Ð—
    (cyrillic-iso8859-5 . #xB7)	; øº“„·
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
    (=>ucs		. #x0417)	; Ð—
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0417)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; Ð—
      ))
    (=gb2312		. #x2729)	; ø»„€
    (=jis-x0208		. #x2729)	; ø½‰¾¸
    (=ks-x1001		. #x2C29)	; ø»ˆªž
    (=big5-eten		. #xC7FB)	; ý¢€ŒŸ»
    (=ucs@jis		. #x0417)	; ø»„€
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER I")
      (=gb2312		  . #x272A)	; ø»„
      (=jis-x0208	  . #x272A)	; ø½‰¾¹
      (=ks-x1001	  . #x2C2A)	; ø»ˆªŸ
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; Ð¸
      ))
    (=ucs		. #x0418)	; Ð˜
    (cyrillic-iso8859-5 . #xB8)	; øº“„¸
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER I")
    (=>ucs		. #x0418)	; Ð˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0418)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; Ð˜
      ))
    (=gb2312		. #x272A)	; ø»„
    (=jis-x0208		. #x272A)	; ø½‰¾¹
    (=ks-x1001		. #x2C2A)	; ø»ˆªŸ
    (=big5-eten		. #xC7FC)	; ý¢€ŒŸ¼
    (=ucs@jis		. #x0418)	; ø»„
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
      (=gb2312		  . #x272B)	; ø»„‚
      (=jis-x0208	  . #x272B)	; ø½‰¾º
      (=ks-x1001	  . #x2C2B)	; ø»ˆª 
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; Ð¹
      ))
    (=ucs		. #x0419)	; Ð™
    (cyrillic-iso8859-5 . #xB9)	; øº“„¹
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
    (=>ucs		. #x0419)	; Ð™
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0419)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Ð™
      ))
    (=gb2312		. #x272B)	; ø»„‚
    (=jis-x0208		. #x272B)	; ø½‰¾º
    (=ks-x1001		. #x2C2B)	; ø»ˆª 
    (=big5-eten		. #xC7FD)	; ý¢€ŒŸ½
    (=ucs@jis		. #x0419)	; ø»„‚
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
      (=gb2312		  . #x272C)	; ø»„ƒ
      (=jis-x0208	  . #x272C)	; ø½‰¾»
      (=ks-x1001	  . #x2C2C)	; ø»ˆª¡
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; Ðº
      ))
    (=ucs		. #x041A)	; Ðš
    (cyrillic-iso8859-5 . #xBA)	; øº“„º
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
    (=>ucs		. #x041A)	; Ðš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041A)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; Ðš
      ))
    (=gb2312		. #x272C)	; ø»„ƒ
    (=jis-x0208		. #x272C)	; ø½‰¾»
    (=ks-x1001		. #x2C2C)	; ø»ˆª¡
    (=big5-eten		. #xC7FE)	; ý¢€ŒŸ¾
    (=ucs@jis		. #x041A)	; ø»„ƒ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
      (=gb2312		  . #x272D)	; ø»„„
      (=jis-x0208	  . #x272D)	; ø½‰¾¼
      (=ks-x1001	  . #x2C2D)	; ø»ˆª¢
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; Ð»
      ))
    (=ucs		. #x041B)	; Ð›
    (cyrillic-iso8859-5 . #xBB)	; øº“„»
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
    (=>ucs		. #x041B)	; Ð›
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041B)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EL")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Ð›
      ))
    (=gb2312		. #x272D)	; ø»„„
    (=jis-x0208		. #x272D)	; ø½‰¾¼
    (=ks-x1001		. #x2C2D)	; ø»ˆª¢
    (=big5-eten		. #xC840)	; ý¢€Œ¡€
    (=ucs@jis		. #x041B)	; ø»„„
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EM")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
      (=gb2312		  . #x272E)	; ø»„…
      (=jis-x0208	  . #x272E)	; ø½‰¾½
      (=ks-x1001	  . #x2C2E)	; ø»ˆª£
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; Ð¼
      ))
    (=ucs		. #x041C)	; Ðœ
    (cyrillic-iso8859-5 . #xBC)	; øº“„¼
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
    (=>ucs		. #x041C)	; Ðœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041C)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EM")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; Ðœ
      ))
    (=gb2312		. #x272E)	; ø»„…
    (=jis-x0208		. #x272E)	; ø½‰¾½
    (=ks-x1001		. #x2C2E)	; ø»ˆª£
    (=big5-eten		. #xC841)	; ý¢€Œ¡
    (=ucs@jis		. #x041C)	; ø»„…
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
      (=gb2312		  . #x272F)	; ø»„†
      (=jis-x0208	  . #x272F)	; ø½‰¾¾
      (=ks-x1001	  . #x2C2F)	; ø»ˆª¤
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; Ð½
      ))
    (=ucs		. #x041D)	; Ð
    (cyrillic-iso8859-5 . #xBD)	; øº“„½
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
    (=>ucs		. #x041D)	; Ð
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041D)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Ð
      ))
    (=gb2312		. #x272F)	; ø»„†
    (=jis-x0208		. #x272F)	; ø½‰¾¾
    (=ks-x1001		. #x2C2F)	; ø»ˆª¤
    (=big5-eten		. #xC842)	; ý¢€Œ¡‚
    (=ucs@jis		. #x041D)	; ø»„†
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER O")
      (=gb2312		  . #x2730)	; ø»„‡
      (=jis-x0208	  . #x2730)	; ø½‰¾¿
      (=ks-x1001	  . #x2C30)	; ø»ˆª¥
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; Ð¾
      ))
    (=ucs		. #x041E)	; Ðž
    (cyrillic-iso8859-5 . #xBE)	; øº“„¾
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER O")
    (=>ucs		. #x041E)	; Ðž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041E)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER O")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; Ðž
      ))
    (=gb2312		. #x2730)	; ø»„‡
    (=jis-x0208		. #x2730)	; ø½‰¾¿
    (=ks-x1001		. #x2C30)	; ø»ˆª¥
    (=big5-eten		. #xC843)	; ý¢€Œ¡ƒ
    (=ucs@jis		. #x041E)	; ø»„‡
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
      (=gb2312		  . #x2731)	; ø»„ˆ
      (=jis-x0208	  . #x2731)	; ø½‰¿€
      (=ks-x1001	  . #x2C31)	; ø»ˆª¦
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; Ð¿
      ))
    (=ucs		. #x041F)	; ÐŸ
    (cyrillic-iso8859-5 . #xBF)	; øº“„¿
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
    (=>ucs		. #x041F)	; ÐŸ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041F)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER PE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; ÐŸ
      ))
    (=gb2312		. #x2731)	; ø»„ˆ
    (=jis-x0208		. #x2731)	; ø½‰¿€
    (=ks-x1001		. #x2C31)	; ø»ˆª¦
    (=big5-eten		. #xC844)	; ý¢€Œ¡„
    (=ucs@jis		. #x041F)	; ø»„ˆ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
      (=gb2312		  . #x2732)	; ø»„‰
      (=jis-x0208	  . #x2732)	; ø½‰¿
      (=ks-x1001	  . #x2C32)	; ø»ˆª§
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; Ñ€
      ))
    (=ucs		. #x0420)	; Ð 
    (cyrillic-iso8859-5 . #xC0)	; øº“…€
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
    (=>ucs		. #x0420)	; Ð 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0420)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ER")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Ð 
      ))
    (=gb2312		. #x2732)	; ø»„‰
    (=jis-x0208		. #x2732)	; ø½‰¿
    (=ks-x1001		. #x2C32)	; ø»ˆª§
    (=big5-eten		. #xC845)	; ý¢€Œ¡…
    (=ucs@jis		. #x0420)	; ø»„‰
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
      (=gb2312		  . #x2733)	; ø»„Š
      (=jis-x0208	  . #x2733)	; ø½‰¿‚
      (=ks-x1001	  . #x2C33)	; ø»ˆª¨
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; Ñ
      ))
    (=ucs		. #x0421)	; Ð¡
    (cyrillic-iso8859-5 . #xC1)	; øº“…
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
    (=>ucs		. #x0421)	; Ð¡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0421)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ES")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; Ð¡
      ))
    (=gb2312		. #x2733)	; ø»„Š
    (=jis-x0208		. #x2733)	; ø½‰¿‚
    (=ks-x1001		. #x2C33)	; ø»ˆª¨
    (=big5-eten		. #xC846)	; ý¢€Œ¡†
    (=ucs@jis		. #x0421)	; ø»„Š
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
      (=gb2312		  . #x2734)	; ø»„‹
      (=jis-x0208	  . #x2734)	; ø½‰¿ƒ
      (=ks-x1001	  . #x2C34)	; ø»ˆª©
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; Ñ‚
      ))
    (=ucs		. #x0422)	; Ð¢
    (cyrillic-iso8859-5 . #xC2)	; øº“…‚
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
    (=>ucs		. #x0422)	; Ð¢
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0422)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Ð¢
      ))
    (=gb2312		. #x2734)	; ø»„‹
    (=jis-x0208		. #x2734)	; ø½‰¿ƒ
    (=ks-x1001		. #x2C34)	; ø»ˆª©
    (=big5-eten		. #xC847)	; ý¢€Œ¡‡
    (=ucs@jis		. #x0422)	; ø»„‹
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER U")
      (=gb2312		  . #x2735)	; ø»„Œ
      (=jis-x0208	  . #x2735)	; ø½‰¿„
      (=ks-x1001	  . #x2C35)	; ø»ˆªª
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; Ñƒ
      ))
    (=ucs		. #x0423)	; Ð£
    (cyrillic-iso8859-5 . #xC3)	; øº“…ƒ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER U")
    (=>ucs		. #x0423)	; Ð£
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0423)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER U")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; Ð£
      ))
    (=gb2312		. #x2735)	; ø»„Œ
    (=jis-x0208		. #x2735)	; ø½‰¿„
    (=ks-x1001		. #x2C35)	; ø»ˆªª
    (=big5-eten		. #xC848)	; ý¢€Œ¡ˆ
    (=ucs@jis		. #x0423)	; ø»„Œ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EF")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
      (=gb2312		  . #x2736)	; ø»„
      (=jis-x0208	  . #x2736)	; ø½‰¿…
      (=ks-x1001	  . #x2C36)	; ø»ˆª«
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; Ñ„
      ))
    (=ucs		. #x0424)	; Ð¤
    (cyrillic-iso8859-5 . #xC4)	; øº“…„
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
    (=>ucs		. #x0424)	; Ð¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0424)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EF")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ð¤
      ))
    (=gb2312		. #x2736)	; ø»„
    (=jis-x0208		. #x2736)	; ø½‰¿…
    (=ks-x1001		. #x2C36)	; ø»ˆª«
    (=big5-eten		. #xC849)	; ý¢€Œ¡‰
    (=ucs@jis		. #x0424)	; ø»„
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
      (=gb2312		  . #x2737)	; ø»„Ž
      (=jis-x0208	  . #x2737)	; ø½‰¿†
      (=ks-x1001	  . #x2C37)	; ø»ˆª¬
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; Ñ…
      ))
    (=ucs		. #x0425)	; Ð¥
    (cyrillic-iso8859-5 . #xC5)	; øº“……
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
    (=>ucs		. #x0425)	; Ð¥
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0425)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Ð¥
      ))
    (=gb2312		. #x2737)	; ø»„Ž
    (=jis-x0208		. #x2737)	; ø½‰¿†
    (=ks-x1001		. #x2C37)	; ø»ˆª¬
    (=big5-eten		. #xC84A)	; ý¢€Œ¡Š
    (=ucs@jis		. #x0425)	; ø»„Ž
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
      (=gb2312		  . #x2738)	; ø»„
      (=jis-x0208	  . #x2738)	; ø½‰¿‡
      (=ks-x1001	  . #x2C38)	; ø»ˆª­
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; Ñ†
      ))
    (=ucs		. #x0426)	; Ð¦
    (cyrillic-iso8859-5 . #xC6)	; øº“…†
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
    (=>ucs		. #x0426)	; Ð¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0426)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ð¦
      ))
    (=gb2312		. #x2738)	; ø»„
    (=jis-x0208		. #x2738)	; ø½‰¿‡
    (=ks-x1001		. #x2C38)	; ø»ˆª­
    (=big5-eten		. #xC84B)	; ý¢€Œ¡‹
    (=ucs@jis		. #x0426)	; ø»„
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
      (=gb2312		  . #x2739)	; ø»„
      (=jis-x0208	  . #x2739)	; ø½‰¿ˆ
      (=ks-x1001	  . #x2C39)	; ø»ˆª®
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; Ñ‡
      ))
    (=ucs		. #x0427)	; Ð§
    (cyrillic-iso8859-5 . #xC7)	; øº“…‡
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
    (=>ucs		. #x0427)	; Ð§
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0427)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER CHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ð§
      ))
    (=gb2312		. #x2739)	; ø»„
    (=jis-x0208		. #x2739)	; ø½‰¿ˆ
    (=ks-x1001		. #x2C39)	; ø»ˆª®
    (=big5-eten		. #xC84C)	; ý¢€Œ¡Œ
    (=ucs@jis		. #x0427)	; ø»„
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
      (=gb2312		  . #x273A)	; ø»„‘
      (=jis-x0208	  . #x273A)	; ø½‰¿‰
      (=ks-x1001	  . #x2C3A)	; ø»ˆª¯
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; Ñˆ
      ))
    (=ucs		. #x0428)	; Ð¨
    (cyrillic-iso8859-5 . #xC8)	; øº“…ˆ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
    (=>ucs		. #x0428)	; Ð¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0428)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ð¨
      ))
    (=gb2312		. #x273A)	; ø»„‘
    (=jis-x0208		. #x273A)	; ø½‰¿‰
    (=ks-x1001		. #x2C3A)	; ø»ˆª¯
    (=big5-eten		. #xC84D)	; ý¢€Œ¡
    (=ucs@jis		. #x0428)	; ø»„‘
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHCHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
      (=gb2312		  . #x273B)	; ø»„’
      (=jis-x0208	  . #x273B)	; ø½‰¿Š
      (=ks-x1001	  . #x2C3B)	; ø»ˆª°
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; Ñ‰
      ))
    (=ucs		. #x0429)	; Ð©
    (cyrillic-iso8859-5 . #xC9)	; øº“…‰
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
    (=>ucs		. #x0429)	; Ð©
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0429)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Ð©
      ))
    (=gb2312		. #x273B)	; ø»„’
    (=jis-x0208		. #x273B)	; ø½‰¿Š
    (=ks-x1001		. #x2C3B)	; ø»ˆª°
    (=big5-eten		. #xC84E)	; ý¢€Œ¡Ž
    (=ucs@jis		. #x0429)	; ø»„’
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HARD SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      (=gb2312		  . #x273C)	; ø»„“
      (=jis-x0208	  . #x273C)	; ø½‰¿‹
      (=ks-x1001	  . #x2C3C)	; ø»ˆª±
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ÑŠ
      ))
    (=ucs		. #x042A)	; Ðª
    (cyrillic-iso8859-5 . #xCA)	; øº“…Š
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
    (=>ucs		. #x042A)	; Ðª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042A)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ðª
      ))
    (=gb2312		. #x273C)	; ø»„“
    (=jis-x0208		. #x273C)	; ø½‰¿‹
    (=ks-x1001		. #x2C3C)	; ø»ˆª±
    (=big5-eten		. #xC84F)	; ý¢€Œ¡
    (=ucs@jis		. #x042A)	; ø»„“
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
      (=gb2312		  . #x273D)	; ø»„”
      (=jis-x0208	  . #x273D)	; ø½‰¿Œ
      (=ks-x1001	  . #x2C3D)	; ø»ˆª²
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; Ñ‹
      ))
    (=ucs		. #x042B)	; Ð«
    (cyrillic-iso8859-5 . #xCB)	; øº“…‹
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
    (=>ucs		. #x042B)	; Ð«
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042B)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YERU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ð«
      ))
    (=gb2312		. #x273D)	; ø»„”
    (=jis-x0208		. #x273D)	; ø½‰¿Œ
    (=ks-x1001		. #x2C3D)	; ø»ˆª²
    (=big5-eten		. #xC850)	; ý¢€Œ¡
    (=ucs@jis		. #x042B)	; ø»„”
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=gb2312		  . #x273E)	; ø»„•
      (=jis-x0208	  . #x273E)	; ø½‰¿
      (=ks-x1001	  . #x2C3E)	; ø»ˆª³
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ÑŒ
      ))
    (=ucs		. #x042C)	; Ð¬
    (cyrillic-iso8859-5 . #xCC)	; øº“…Œ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
    (=>ucs		. #x042C)	; Ð¬
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042C)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ð¬
      ))
    (=gb2312		. #x273E)	; ø»„•
    (=jis-x0208		. #x273E)	; ø½‰¿
    (=ks-x1001		. #x2C3E)	; ø»ˆª³
    (=big5-eten		. #xC851)	; ý¢€Œ¡‘
    (=ucs@jis		. #x042C)	; ø»„•
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER E")
      (=gb2312		  . #x273F)	; ø»„–
      (=jis-x0208	  . #x273F)	; ø½‰¿Ž
      (=ks-x1001	  . #x2C3F)	; ø»ˆª´
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; Ñ
      ))
    (=ucs		. #x042D)	; Ð­
    (cyrillic-iso8859-5 . #xCD)	; øº“…
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER E")
    (=>ucs		. #x042D)	; Ð­
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042D)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER E")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Ð­
      ))
    (=gb2312		. #x273F)	; ø»„–
    (=jis-x0208		. #x273F)	; ø½‰¿Ž
    (=ks-x1001		. #x2C3F)	; ø»ˆª´
    (=big5-eten		. #xC852)	; ý¢€Œ¡’
    (=ucs@jis		. #x042D)	; ø»„–
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
      (=gb2312		  . #x2740)	; ø»„—
      (=jis-x0208	  . #x2740)	; ø½‰¿
      (=ks-x1001	  . #x2C40)	; ø»ˆªµ
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ÑŽ
      ))
    (=ucs		. #x042E)	; Ð®
    (cyrillic-iso8859-5 . #xCE)	; øº“…Ž
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
    (=>ucs		. #x042E)	; Ð®
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042E)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ð®
      ))
    (=gb2312		. #x2740)	; ø»„—
    (=jis-x0208		. #x2740)	; ø½‰¿
    (=ks-x1001		. #x2C40)	; ø»ˆªµ
    (=big5-eten		. #xC853)	; ý¢€Œ¡“
    (=ucs@jis		. #x042E)	; ø»„—
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YA")
      (=gb2312		  . #x2741)	; ø»„˜
      (=jis-x0208	  . #x2741)	; ø½‰¿
      (=ks-x1001	  . #x2C41)	; ø»ˆª¶
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; Ñ
      ))
    (=ucs		. #x042F)	; Ð¯
    (cyrillic-iso8859-5 . #xCF)	; øº“…
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YA")
    (=>ucs		. #x042F)	; Ð¯
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042F)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Ð¯
      ))
    (=gb2312		. #x2741)	; ø»„˜
    (=jis-x0208		. #x2741)	; ø½‰¿
    (=ks-x1001		. #x2C41)	; ø»ˆª¶
    (=big5-eten		. #xC854)	; ý¢€Œ¡”
    (=ucs@jis		. #x042F)	; ø»„˜
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER A")
      (=gb2312		  . #x2751)	; ø»„¨
      (=jis-x0208	  . #x2751)	; ø½‰¿ 
      (=ks-x1001	  . #x2C51)	; ø»ˆ«†
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; Ð
      ))
    (=ucs		. #x0430)	; Ð°
    (cyrillic-iso8859-5 . #xD0)	; øº“…
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER A")
    (=>ucs		. #x0430)	; Ð°
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0430)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER A")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; Ð°
      ))
    (=gb2312		. #x2751)	; ø»„¨
    (=jis-x0208		. #x2751)	; ø½‰¿ 
    (=ks-x1001		. #x2C51)	; ø»ˆ«†
    (=big5-eten		. #xC855)	; ý¢€Œ¡•
    (=ucs@jis		. #x0430)	; ø»„¨
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER BE")
      (=gb2312		  . #x2752)	; ø»„©
      (=jis-x0208	  . #x2752)	; ø½‰¿¡
      (=ks-x1001	  . #x2C52)	; ø»ˆ«‡
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Ð‘
      ))
    (=ucs		. #x0431)	; Ð±
    (cyrillic-iso8859-5 . #xD1)	; øº“…‘
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER BE")
    (=>ucs		. #x0431)	; Ð±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0431)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; Ð±
      ))
    (=gb2312		. #x2752)	; ø»„©
    (=jis-x0208		. #x2752)	; ø½‰¿¡
    (=ks-x1001		. #x2C52)	; ø»ˆ«‡
    (=big5-eten		. #xC856)	; ý¢€Œ¡–
    (=ucs@jis		. #x0431)	; ø»„©
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER VE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER VE")
      (=gb2312		  . #x2753)	; ø»„ª
      (=jis-x0208	  . #x2753)	; ø½‰¿¢
      (=ks-x1001	  . #x2C53)	; ø»ˆ«ˆ
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; Ð’
      ))
    (=ucs		. #x0432)	; Ð²
    (cyrillic-iso8859-5 . #xD2)	; øº“…’
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER VE")
    (=>ucs		. #x0432)	; Ð²
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0432)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; Ð²
      ))
    (=gb2312		. #x2753)	; ø»„ª
    (=jis-x0208		. #x2753)	; ø½‰¿¢
    (=ks-x1001		. #x2C53)	; ø»ˆ«ˆ
    (=big5-eten		. #xC857)	; ý¢€Œ¡—
    (=ucs@jis		. #x0432)	; ø»„ª
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GHE")
      (=gb2312		  . #x2754)	; ø»„«
      (=jis-x0208	  . #x2754)	; ø½‰¿£
      (=ks-x1001	  . #x2C54)	; ø»ˆ«‰
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Ð“
      ))
    (=ucs		. #x0433)	; Ð³
    (cyrillic-iso8859-5 . #xD3)	; øº“…“
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER GHE")
    (=>ucs		. #x0433)	; Ð³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0433)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; Ð³
      ))
    (=gb2312		. #x2754)	; ø»„«
    (=jis-x0208		. #x2754)	; ø½‰¿£
    (=ks-x1001		. #x2C54)	; ø»ˆ«‰
    (=big5-eten		. #xC858)	; ý¢€Œ¡˜
    (=ucs@jis		. #x0433)	; ø»„«
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DE")
      (=gb2312		  . #x2755)	; ø»„¬
      (=jis-x0208	  . #x2755)	; ø½‰¿¤
      (=ks-x1001	  . #x2C55)	; ø»ˆ«Š
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Ð”
      ))
    (=ucs		. #x0434)	; Ð´
    (cyrillic-iso8859-5 . #xD4)	; øº“…”
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DE")
    (=>ucs		. #x0434)	; Ð´
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0434)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; Ð´
      ))
    (=gb2312		. #x2755)	; ø»„¬
    (=jis-x0208		. #x2755)	; ø½‰¿¤
    (=ks-x1001		. #x2C55)	; ø»ˆ«Š
    (=big5-eten		. #xC859)	; ý¢€Œ¡™
    (=ucs@jis		. #x0434)	; ø»„¬
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IE")
      (=gb2312		  . #x2756)	; ø»„­
      (=jis-x0208	  . #x2756)	; ø½‰¿¥
      (=ks-x1001	  . #x2C56)	; ø»ˆ«‹
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Ð•
      ))
    (=ucs		. #x0435)	; Ðµ
    (cyrillic-iso8859-5 . #xD5)	; øº“…•
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER IE")
    (=>ucs		. #x0435)	; Ðµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0435)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; Ðµ
      ))
    (=gb2312		. #x2756)	; ø»„­
    (=jis-x0208		. #x2756)	; ø½‰¿¥
    (=ks-x1001		. #x2C56)	; ø»ˆ«‹
    (=big5-eten		. #xC85A)	; ý¢€Œ¡š
    (=ucs@jis		. #x0435)	; ø»„­
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
      (=gb2312		  . #x2758)	; ø»„¯
      (=jis-x0208	  . #x2758)	; ø½‰¿§
      (=ks-x1001	  . #x2C58)	; ø»ˆ«
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ð–
      ))
    (=ucs		. #x0436)	; Ð¶
    (cyrillic-iso8859-5 . #xD6)	; øº“…–
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
    (=>ucs		. #x0436)	; Ð¶
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0436)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; Ð¶
      ))
    (=gb2312		. #x2758)	; ø»„¯
    (=jis-x0208		. #x2758)	; ø½‰¿§
    (=ks-x1001		. #x2C58)	; ø»ˆ«
    (=big5-eten		. #xC85C)	; ý¢€Œ¡œ
    (=ucs@jis		. #x0436)	; ø»„¯
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZE")
      (=gb2312		  . #x2759)	; ø»„°
      (=jis-x0208	  . #x2759)	; ø½‰¿¨
      (=ks-x1001	  . #x2C59)	; ø»ˆ«Ž
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; Ð—
      ))
    (=ucs		. #x0437)	; Ð·
    (cyrillic-iso8859-5 . #xD7)	; øº“…—
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ZE")
    (=>ucs		. #x0437)	; Ð·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0437)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; Ð·
      ))
    (=gb2312		. #x2759)	; ø»„°
    (=jis-x0208		. #x2759)	; ø½‰¿¨
    (=ks-x1001		. #x2C59)	; ø»ˆ«Ž
    (=big5-eten		. #xC85D)	; ý¢€Œ¡
    (=ucs@jis		. #x0437)	; ø»„°
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER I")
      (=gb2312		  . #x275A)	; ø»„±
      (=jis-x0208	  . #x275A)	; ø½‰¿©
      (=ks-x1001	  . #x2C5A)	; ø»ˆ«
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; Ð˜
      ))
    (=ucs		. #x0438)	; Ð¸
    (cyrillic-iso8859-5 . #xD8)	; øº“…˜
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER I")
    (=>ucs		. #x0438)	; Ð¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0438)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; Ð¸
      ))
    (=gb2312		. #x275A)	; ø»„±
    (=jis-x0208		. #x275A)	; ø½‰¿©
    (=ks-x1001		. #x2C5A)	; ø»ˆ«
    (=big5-eten		. #xC85E)	; ý¢€Œ¡ž
    (=ucs@jis		. #x0438)	; ø»„±
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
      (=gb2312		  . #x275B)	; ø»„²
      (=jis-x0208	  . #x275B)	; ø½‰¿ª
      (=ks-x1001	  . #x2C5B)	; ø»ˆ«
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Ð™
      ))
    (=ucs		. #x0439)	; Ð¹
    (cyrillic-iso8859-5 . #xD9)	; øº“…™
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
    (=>ucs		. #x0439)	; Ð¹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0439)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; Ð¹
      ))
    (=gb2312		. #x275B)	; ø»„²
    (=jis-x0208		. #x275B)	; ø½‰¿ª
    (=ks-x1001		. #x2C5B)	; ø»ˆ«
    (=big5-eten		. #xC85F)	; ý¢€Œ¡Ÿ
    (=ucs@jis		. #x0439)	; ø»„²
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KA")
      (=gb2312		  . #x275C)	; ø»„³
      (=jis-x0208	  . #x275C)	; ø½‰¿«
      (=ks-x1001	  . #x2C5C)	; ø»ˆ«‘
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; Ðš
      ))
    (=ucs		. #x043A)	; Ðº
    (cyrillic-iso8859-5 . #xDA)	; øº“…š
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER KA")
    (=>ucs		. #x043A)	; Ðº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043A)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; Ðº
      ))
    (=gb2312		. #x275C)	; ø»„³
    (=jis-x0208		. #x275C)	; ø½‰¿«
    (=ks-x1001		. #x2C5C)	; ø»ˆ«‘
    (=big5-eten		. #xC860)	; ý¢€Œ¡ 
    (=ucs@jis		. #x043A)	; ø»„³
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EL")
      (=gb2312		  . #x275D)	; ø»„´
      (=jis-x0208	  . #x275D)	; ø½‰¿¬
      (=ks-x1001	  . #x2C5D)	; ø»ˆ«’
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Ð›
      ))
    (=ucs		. #x043B)	; Ð»
    (cyrillic-iso8859-5 . #xDB)	; øº“…›
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EL")
    (=>ucs		. #x043B)	; Ð»
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043B)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; Ð»
      ))
    (=gb2312		. #x275D)	; ø»„´
    (=jis-x0208		. #x275D)	; ø½‰¿¬
    (=ks-x1001		. #x2C5D)	; ø»ˆ«’
    (=big5-eten		. #xC861)	; ý¢€Œ¡¡
    (=ucs@jis		. #x043B)	; ø»„´
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EM")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EM")
      (=gb2312		  . #x275E)	; ø»„µ
      (=jis-x0208	  . #x275E)	; ø½‰¿­
      (=ks-x1001	  . #x2C5E)	; ø»ˆ«“
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; Ðœ
      ))
    (=ucs		. #x043C)	; Ð¼
    (cyrillic-iso8859-5 . #xDC)	; øº“…œ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EM")
    (=>ucs		. #x043C)	; Ð¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043C)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; Ð¼
      ))
    (=gb2312		. #x275E)	; ø»„µ
    (=jis-x0208		. #x275E)	; ø½‰¿­
    (=ks-x1001		. #x2C5E)	; ø»ˆ«“
    (=big5-eten		. #xC862)	; ý¢€Œ¡¢
    (=ucs@jis		. #x043C)	; ø»„µ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EN")
      (=gb2312		  . #x275F)	; ø»„¶
      (=jis-x0208	  . #x275F)	; ø½‰¿®
      (=ks-x1001	  . #x2C5F)	; ø»ˆ«”
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Ð
      ))
    (=ucs		. #x043D)	; Ð½
    (cyrillic-iso8859-5 . #xDD)	; øº“…
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EN")
    (=>ucs		. #x043D)	; Ð½
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043D)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; Ð½
      ))
    (=gb2312		. #x275F)	; ø»„¶
    (=jis-x0208		. #x275F)	; ø½‰¿®
    (=ks-x1001		. #x2C5F)	; ø»ˆ«”
    (=big5-eten		. #xC863)	; ý¢€Œ¡£
    (=ucs@jis		. #x043D)	; ø»„¶
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER O")
      (=gb2312		  . #x2760)	; ø»„·
      (=jis-x0208	  . #x2760)	; ø½‰¿¯
      (=ks-x1001	  . #x2C60)	; ø»ˆ«•
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; Ðž
      ))
    (=ucs		. #x043E)	; Ð¾
    (cyrillic-iso8859-5 . #xDE)	; øº“…ž
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER O")
    (=>ucs		. #x043E)	; Ð¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043E)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER O")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; Ð¾
      ))
    (=gb2312		. #x2760)	; ø»„·
    (=jis-x0208		. #x2760)	; ø½‰¿¯
    (=ks-x1001		. #x2C60)	; ø»ˆ«•
    (=big5-eten		. #xC864)	; ý¢€Œ¡¤
    (=ucs@jis		. #x043E)	; ø»„·
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER PE")
      (=gb2312		  . #x2761)	; ø»„¸
      (=jis-x0208	  . #x2761)	; ø½‰¿°
      (=ks-x1001	  . #x2C61)	; ø»ˆ«–
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; ÐŸ
      ))
    (=ucs		. #x043F)	; Ð¿
    (cyrillic-iso8859-5 . #xDF)	; øº“…Ÿ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER PE")
    (=>ucs		. #x043F)	; Ð¿
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043F)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; Ð¿
      ))
    (=gb2312		. #x2761)	; ø»„¸
    (=jis-x0208		. #x2761)	; ø½‰¿°
    (=ks-x1001		. #x2C61)	; ø»ˆ«–
    (=big5-eten		. #xC865)	; ý¢€Œ¡¥
    (=ucs@jis		. #x043F)	; ø»„¸
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ER")
      (=gb2312		  . #x2762)	; ø»„¹
      (=jis-x0208	  . #x2762)	; ø½‰¿±
      (=ks-x1001	  . #x2C62)	; ø»ˆ«—
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Ð 
      ))
    (=ucs		. #x0440)	; Ñ€
    (cyrillic-iso8859-5 . #xE0)	; øº“… 
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ER")
    (=>ucs		. #x0440)	; Ñ€
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0440)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; Ñ€
      ))
    (=gb2312		. #x2762)	; ø»„¹
    (=jis-x0208		. #x2762)	; ø½‰¿±
    (=ks-x1001		. #x2C62)	; ø»ˆ«—
    (=big5-eten		. #xC866)	; ý¢€Œ¡¦
    (=ucs@jis		. #x0440)	; ø»„¹
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ES")
      (=gb2312		  . #x2763)	; ø»„º
      (=jis-x0208	  . #x2763)	; ø½‰¿²
      (=ks-x1001	  . #x2C63)	; ø»ˆ«˜
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; Ð¡
      ))
    (=ucs		. #x0441)	; Ñ
    (cyrillic-iso8859-5 . #xE1)	; øº“…¡
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ES")
    (=>ucs		. #x0441)	; Ñ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0441)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; Ñ
      ))
    (=gb2312		. #x2763)	; ø»„º
    (=jis-x0208		. #x2763)	; ø½‰¿²
    (=ks-x1001		. #x2C63)	; ø»ˆ«˜
    (=big5-eten		. #xC867)	; ý¢€Œ¡§
    (=ucs@jis		. #x0441)	; ø»„º
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TE")
      (=gb2312		  . #x2764)	; ø»„»
      (=jis-x0208	  . #x2764)	; ø½‰¿³
      (=ks-x1001	  . #x2C64)	; ø»ˆ«™
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Ð¢
      ))
    (=ucs		. #x0442)	; Ñ‚
    (cyrillic-iso8859-5 . #xE2)	; øº“…¢
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TE")
    (=>ucs		. #x0442)	; Ñ‚
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0442)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; Ñ‚
      ))
    (=gb2312		. #x2764)	; ø»„»
    (=jis-x0208		. #x2764)	; ø½‰¿³
    (=ks-x1001		. #x2C64)	; ø»ˆ«™
    (=big5-eten		. #xC868)	; ý¢€Œ¡¨
    (=ucs@jis		. #x0442)	; ø»„»
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER U")
      (=gb2312		  . #x2765)	; ø»„¼
      (=jis-x0208	  . #x2765)	; ø½‰¿´
      (=ks-x1001	  . #x2C65)	; ø»ˆ«š
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; Ð£
      ))
    (=ucs		. #x0443)	; Ñƒ
    (cyrillic-iso8859-5 . #xE3)	; øº“…£
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER U")
    (=>ucs		. #x0443)	; Ñƒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0443)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER U")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; Ñƒ
      ))
    (=gb2312		. #x2765)	; ø»„¼
    (=jis-x0208		. #x2765)	; ø½‰¿´
    (=ks-x1001		. #x2C65)	; ø»ˆ«š
    (=big5-eten		. #xC869)	; ý¢€Œ¡©
    (=ucs@jis		. #x0443)	; ø»„¼
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EF")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EF")
      (=gb2312		  . #x2766)	; ø»„½
      (=jis-x0208	  . #x2766)	; ø½‰¿µ
      (=ks-x1001	  . #x2C66)	; ø»ˆ«›
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ð¤
      ))
    (=ucs		. #x0444)	; Ñ„
    (cyrillic-iso8859-5 . #xE4)	; øº“…¤
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EF")
    (=>ucs		. #x0444)	; Ñ„
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0444)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; Ñ„
      ))
    (=gb2312		. #x2766)	; ø»„½
    (=jis-x0208		. #x2766)	; ø½‰¿µ
    (=ks-x1001		. #x2C66)	; ø»ˆ«›
    (=big5-eten		. #xC86A)	; ý¢€Œ¡ª
    (=ucs@jis		. #x0444)	; ø»„½
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HA")
      (=gb2312		  . #x2767)	; ø»„¾
      (=jis-x0208	  . #x2767)	; ø½‰¿¶
      (=ks-x1001	  . #x2C67)	; ø»ˆ«œ
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Ð¥
      ))
    (=ucs		. #x0445)	; Ñ…
    (cyrillic-iso8859-5 . #xE5)	; øº“…¥
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER HA")
    (=>ucs		. #x0445)	; Ñ…
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0445)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; Ñ…
      ))
    (=gb2312		. #x2767)	; ø»„¾
    (=jis-x0208		. #x2767)	; ø½‰¿¶
    (=ks-x1001		. #x2C67)	; ø»ˆ«œ
    (=big5-eten		. #xC86B)	; ý¢€Œ¡«
    (=ucs@jis		. #x0445)	; ø»„¾
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSE")
      (=gb2312		  . #x2768)	; ø»„¿
      (=jis-x0208	  . #x2768)	; ø½‰¿·
      (=ks-x1001	  . #x2C68)	; ø»ˆ«
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ð¦
      ))
    (=ucs		. #x0446)	; Ñ†
    (cyrillic-iso8859-5 . #xE6)	; øº“…¦
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TSE")
    (=>ucs		. #x0446)	; Ñ†
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0446)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; Ñ†
      ))
    (=gb2312		. #x2768)	; ø»„¿
    (=jis-x0208		. #x2768)	; ø½‰¿·
    (=ks-x1001		. #x2C68)	; ø»ˆ«
    (=big5-eten		. #xC86C)	; ý¢€Œ¡¬
    (=ucs@jis		. #x0446)	; ø»„¿
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER CHE")
      (=gb2312		  . #x2769)	; ø»„€
      (=jis-x0208	  . #x2769)	; ø½‰¿¸
      (=ks-x1001	  . #x2C69)	; ø»ˆ«ž
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ð§
      ))
    (=ucs		. #x0447)	; Ñ‡
    (cyrillic-iso8859-5 . #xE7)	; øº“…§
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER CHE")
    (=>ucs		. #x0447)	; Ñ‡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0447)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; Ñ‡
      ))
    (=gb2312		. #x2769)	; ø»„€
    (=jis-x0208		. #x2769)	; ø½‰¿¸
    (=ks-x1001		. #x2C69)	; ø»ˆ«ž
    (=big5-eten		. #xC86D)	; ý¢€Œ¡­
    (=ucs@jis		. #x0447)	; ø»„€
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHA")
      (=gb2312		  . #x276A)	; ø»„
      (=jis-x0208	  . #x276A)	; ø½‰¿¹
      (=ks-x1001	  . #x2C6A)	; ø»ˆ«Ÿ
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ð¨
      ))
    (=ucs		. #x0448)	; Ñˆ
    (cyrillic-iso8859-5 . #xE8)	; øº“…¨
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHA")
    (=>ucs		. #x0448)	; Ñˆ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0448)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; Ñˆ
      ))
    (=gb2312		. #x276A)	; ø»„
    (=jis-x0208		. #x276A)	; ø½‰¿¹
    (=ks-x1001		. #x2C6A)	; ø»ˆ«Ÿ
    (=big5-eten		. #xC86E)	; ý¢€Œ¡®
    (=ucs@jis		. #x0448)	; ø»„
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHCHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
      (=gb2312		  . #x276B)	; ø»„‚
      (=jis-x0208	  . #x276B)	; ø½‰¿º
      (=ks-x1001	  . #x2C6B)	; ø»ˆ« 
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Ð©
      ))
    (=ucs		. #x0449)	; Ñ‰
    (cyrillic-iso8859-5 . #xE9)	; øº“…©
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
    (=>ucs		. #x0449)	; Ñ‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0449)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; Ñ‰
      ))
    (=gb2312		. #x276B)	; ø»„‚
    (=jis-x0208		. #x276B)	; ø½‰¿º
    (=ks-x1001		. #x2C6B)	; ø»ˆ« 
    (=big5-eten		. #xC86F)	; ý¢€Œ¡¯
    (=ucs@jis		. #x0449)	; ø»„‚
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HARD SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HARD SIGN")
      (=gb2312		  . #x276C)	; ø»„ƒ
      (=jis-x0208	  . #x276C)	; ø½‰¿»
      (=ks-x1001	  . #x2C6C)	; ø»ˆ«¡
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ðª
      ))
    (=ucs		. #x044A)	; ÑŠ
    (cyrillic-iso8859-5 . #xEA)	; øº“…ª
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER HARD SIGN")
    (=>ucs		. #x044A)	; ÑŠ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044A)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ÑŠ
      ))
    (=gb2312		. #x276C)	; ø»„ƒ
    (=jis-x0208		. #x276C)	; ø½‰¿»
    (=ks-x1001		. #x2C6C)	; ø»ˆ«¡
    (=big5-eten		. #xC870)	; ý¢€Œ¡°
    (=ucs@jis		. #x044A)	; ø»„ƒ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YERU")
      (=gb2312		  . #x276D)	; ø»„„
      (=jis-x0208	  . #x276D)	; ø½‰¿¼
      (=ks-x1001	  . #x2C6D)	; ø»ˆ«¢
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ð«
      ))
    (=ucs		. #x044B)	; Ñ‹
    (cyrillic-iso8859-5 . #xEB)	; øº“…«
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YERU")
    (=>ucs		. #x044B)	; Ñ‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044B)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; Ñ‹
      ))
    (=gb2312		. #x276D)	; ø»„„
    (=jis-x0208		. #x276D)	; ø½‰¿¼
    (=ks-x1001		. #x2C6D)	; ø»ˆ«¢
    (=big5-eten		. #xC871)	; ý¢€Œ¡±
    (=ucs@jis		. #x044B)	; ø»„„
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
      (=gb2312		  . #x276E)	; ø»„…
      (=jis-x0208	  . #x276E)	; ø½‰¿½
      (=ks-x1001	  . #x2C6E)	; ø»ˆ«£
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ð¬
      ))
    (=ucs		. #x044C)	; ÑŒ
    (cyrillic-iso8859-5 . #xEC)	; øº“…¬
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
    (=>ucs		. #x044C)	; ÑŒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044C)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ÑŒ
      ))
    (=gb2312		. #x276E)	; ø»„…
    (=jis-x0208		. #x276E)	; ø½‰¿½
    (=ks-x1001		. #x2C6E)	; ø»ˆ«£
    (=big5-eten		. #xC872)	; ý¢€Œ¡²
    (=ucs@jis		. #x044C)	; ø»„…
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER E")
      (=gb2312		  . #x276F)	; ø»„†
      (=jis-x0208	  . #x276F)	; ø½‰¿¾
      (=ks-x1001	  . #x2C6F)	; ø»ˆ«¤
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Ð­
      ))
    (=ucs		. #x044D)	; Ñ
    (cyrillic-iso8859-5 . #xED)	; øº“…­
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER E")
    (=>ucs		. #x044D)	; Ñ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044D)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER E")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; Ñ
      ))
    (=gb2312		. #x276F)	; ø»„†
    (=jis-x0208		. #x276F)	; ø½‰¿¾
    (=ks-x1001		. #x2C6F)	; ø»ˆ«¤
    (=big5-eten		. #xC873)	; ý¢€Œ¡³
    (=ucs@jis		. #x044D)	; ø»„†
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YU")
      (=gb2312		  . #x2770)	; ø»„‡
      (=jis-x0208	  . #x2770)	; ø½‰¿¿
      (=ks-x1001	  . #x2C70)	; ø»ˆ«¥
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ð®
      ))
    (=ucs		. #x044E)	; ÑŽ
    (cyrillic-iso8859-5 . #xEE)	; øº“…®
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YU")
    (=>ucs		. #x044E)	; ÑŽ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044E)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ÑŽ
      ))
    (=gb2312		. #x2770)	; ø»„‡
    (=jis-x0208		. #x2770)	; ø½‰¿¿
    (=ks-x1001		. #x2C70)	; ø»ˆ«¥
    (=big5-eten		. #xC874)	; ý¢€Œ¡´
    (=ucs@jis		. #x044E)	; ø»„‡
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      (=gb2312		  . #x2771)	; ø»„ˆ
      (=jis-x0208	  . #x2771)	; ø½Š€€
      (=ks-x1001	  . #x2C71)	; ø»ˆ«¦
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Ð¯
      ))
    (=ucs		. #x044F)	; Ñ
    (cyrillic-iso8859-5 . #xEF)	; øº“…¯
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YA")
    (=>ucs		. #x044F)	; Ñ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044F)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; Ñ
      ))
    (=gb2312		. #x2771)	; ø»„ˆ
    (=jis-x0208		. #x2771)	; ø½Š€€
    (=ks-x1001		. #x2C71)	; ø»ˆ«¦
    (=big5-eten		. #xC875)	; ý¢€Œ¡µ
    (=ucs@jis		. #x044F)	; ø»„ˆ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0300)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
      (=ucs		  . #x0400)	; Ð€
      ))
    (=ucs		. #x0450)	; Ñ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0308)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IO")
      (=gb2312		  . #x2757)	; ø»„®
      (=jis-x0208	  . #x2757)	; ø½‰¿¦
      (=ks-x1001	  . #x2C57)	; ø»ˆ«Œ
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ð
      ))
    (=ucs		. #x0451)	; Ñ‘
    (cyrillic-iso8859-5 . #xF1)	; øº“…±
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER IO")
    (=>ucs		. #x0451)	; Ñ‘
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0451)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; Ñ‘
      ))
    (=gb2312		. #x2757)	; ø»„®
    (=jis-x0208		. #x2757)	; ø½‰¿¦
    (=ks-x1001		. #x2C57)	; ø»ˆ«Œ
    (=big5-eten		. #xC85B)	; ý¢€Œ¡›
    (=ucs@jis		. #x0451)	; ø»„®
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DJE")
      (=jis-x0212	  . #x2772)	; ø»Š®•
      (=ucs@jis		  . #x0452)	; ø»Š®•
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ð‚
      ))
    (=ucs		. #x0452)	; Ñ’
    (cyrillic-iso8859-5 . #xF2)	; øº“…²
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DJE")
    (=>ucs		. #x0452)	; Ñ’
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->decomposition	wide #x0452)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; Ñ’
      ))
    (=jis-x0212		. #x2772)	; ø»Š®•
    (=ucs@jis		. #x0452)	; ø»Š®•
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0433 #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GJE")
      (=jis-x0212	  . #x2773)	; ø»Š®–
      (=ucs@jis		  . #x0453)	; ø»Š®–
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ðƒ
      ))
    (=ucs		. #x0453)	; Ñ“
    (cyrillic-iso8859-5 . #xF3)	; øº“…³
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER GJE")
    (=>ucs		. #x0453)	; Ñ“
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0453)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; Ñ“
      ))
    (=jis-x0212		. #x2773)	; ø»Š®–
    (=ucs@jis		. #x0453)	; ø»Š®–
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UKRAINIAN IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=jis-x0212	  . #x2774)	; ø»Š®—
      (=ucs@jis		  . #x0454)	; ø»Š®—
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Ð„
      ))
    (=ucs		. #x0454)	; Ñ”
    (cyrillic-iso8859-5 . #xF4)	; øº“…´
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
    (=>ucs		. #x0454)	; Ñ”
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0454)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; Ñ”
      ))
    (=jis-x0212		. #x2774)	; ø»Š®—
    (=ucs@jis		. #x0454)	; ø»Š®—
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZE")
      (=jis-x0212	  . #x2775)	; ø»Š®˜
      (=ucs@jis		  . #x0455)	; ø»Š®˜
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ð…
      ))
    (=ucs		. #x0455)	; Ñ•
    (cyrillic-iso8859-5 . #xF5)	; øº“…µ
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DZE")
    (=>ucs		. #x0455)	; Ñ•
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0455)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; Ñ•
      ))
    (=jis-x0212		. #x2775)	; ø»Š®˜
    (=ucs@jis		. #x0455)	; ø»Š®˜
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=jis-x0212	  . #x2776)	; ø»Š®™
      (=ucs@jis		  . #x0456)	; ø»Š®™
      ))
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; Ð†
      ))
    (=ucs		. #x0456)	; Ñ–
    (cyrillic-iso8859-5 . #xF6)	; øº“…¶
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (=>ucs		. #x0456)	; Ñ–
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0456)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      ))
    (<-fullwidth
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; Ñ–
      ))
    (=jis-x0212		. #x2776)	; ø»Š®™
    (=ucs@jis		. #x0456)	; ø»Š®™
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	#x0456 #x0308)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YI")
      (=jis-x0212	  . #x2777)	; ø»Š®š
      (=ucs@jis		  . #x0457)	; ø»Š®š
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ð‡
      ))
    (=ucs		. #x0457)	; Ñ—
    (cyrillic-iso8859-5 . #xF7)	; øº“…·
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YI")
    (=>ucs		. #x0457)	; Ñ—
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (->decomposition	wide #x0457)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YI")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; Ñ—
      ))
    (=jis-x0212		. #x2777)	; ø»Š®š
    (=ucs@jis		. #x0457)	; ø»Š®š
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER JE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER JE")
      (=jis-x0212	  . #x2778)	; ø»Š®›
      (=ucs@jis		  . #x0458)	; ø»Š®›
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ðˆ
      ))
    (=ucs		. #x0458)	; Ñ˜
    (cyrillic-iso8859-5 . #xF8)	; øº“…¸
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER JE")
    (=>ucs		. #x0458)	; Ñ˜
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0458)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; Ñ˜
      ))
    (=jis-x0212		. #x2778)	; ø»Š®›
    (=ucs@jis		. #x0458)	; ø»Š®›
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER LJE")
      (=jis-x0212	  . #x2779)	; ø»Š®œ
      (=ucs@jis		  . #x0459)	; ø»Š®œ
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Ð‰
      ))
    (=ucs		. #x0459)	; Ñ™
    (cyrillic-iso8859-5 . #xF9)	; øº“…¹
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER LJE")
    (=>ucs		. #x0459)	; Ñ™
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0459)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; Ñ™
      ))
    (=jis-x0212		. #x2779)	; ø»Š®œ
    (=ucs@jis		. #x0459)	; ø»Š®œ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER NJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER NJE")
      (=jis-x0212	  . #x277A)	; ø»Š®
      (=ucs@jis		  . #x045A)	; ø»Š®
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; ÐŠ
      ))
    (=ucs		. #x045A)	; Ñš
    (cyrillic-iso8859-5 . #xFA)	; øº“…º
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER NJE")
    (=>ucs		. #x045A)	; Ñš
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045A)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; Ñš
      ))
    (=jis-x0212		. #x277A)	; ø»Š®
    (=ucs@jis		. #x045A)	; ø»Š®
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
      (=jis-x0212	  . #x277B)	; ø»Š®ž
      (=ucs@jis		  . #x045B)	; ø»Š®ž
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSHE")
      (=ucs		  . #x040B)	; Ð‹
      ))
    (=ucs		. #x045B)	; Ñ›
    (cyrillic-iso8859-5 . #xFB)	; øº“…»
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
    (=>ucs		. #x045B)	; Ñ›
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->decomposition	wide #x045B)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TSHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TSHE")
      (=ucs		  . #x045B)	; Ñ›
      ))
    (=jis-x0212		. #x277B)	; ø»Š®ž
    (=ucs@jis		. #x045B)	; ø»Š®ž
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043A #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      (=jis-x0212	  . #x277C)	; ø»Š®Ÿ
      (=ucs@jis		  . #x045C)	; ø»Š®Ÿ
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; ÐŒ
      ))
    (=ucs		. #x045C)	; Ñœ
    (cyrillic-iso8859-5 . #xFC)	; øº“…¼
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER KJE")
    (=>ucs		. #x045C)	; Ñœ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045C)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; Ñœ
      ))
    (=jis-x0212		. #x277C)	; ø»Š®Ÿ
    (=ucs@jis		. #x045C)	; ø»Š®Ÿ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0300)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH GRAVE")
      (=ucs		  . #x040D)	; Ð
      ))
    (=ucs		. #x045D)	; Ñ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	#x0443 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT U")
      (=jis-x0212	  . #x277D)	; ø»Š® 
      (=ucs@jis		  . #x045E)	; ø»Š® 
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; ÐŽ
      ))
    (=ucs		. #x045E)	; Ñž
    (cyrillic-iso8859-5 . #xFE)	; øº“…¾
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHORT U")
    (=>ucs		. #x045E)	; Ñž
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (->decomposition	wide #x045E)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; Ñž
      ))
    (=jis-x0212		. #x277D)	; ø»Š® 
    (=ucs@jis		. #x045E)	; ø»Š® 
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
      (=jis-x0212	  . #x277E)	; ø»Š®¡
      (=ucs@jis		  . #x045F)	; ø»Š®¡
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Ð
      ))
    (=ucs		. #x045F)	; ÑŸ
    (cyrillic-iso8859-5 . #xFF)	; øº“…¿
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
    (=>ucs		. #x045F)	; ÑŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045F)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; ÑŸ
      ))
    (=jis-x0212		. #x277E)	; ø»Š®¡
    (=ucs@jis		. #x045F)	; ø»Š®¡
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OMEGA")
      (=ucs		  . #x0461)	; Ñ¡
      ))
    (=ucs		. #x0460)	; Ñ 
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OMEGA")
      (=ucs		  . #x0460)	; Ñ 
      ))
    (=ucs		. #x0461)	; Ñ¡
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YAT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YAT")
      (=ucs		  . #x0463)	; Ñ£
      ))
    (=ucs		. #x0462)	; Ñ¢
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YAT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YAT")
      (=ucs		  . #x0462)	; Ñ¢
      ))
    (=ucs		. #x0463)	; Ñ£
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED E")
      (=ucs		  . #x0465)	; Ñ¥
      ))
    (=ucs		. #x0464)	; Ñ¤
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IOTIFIED E")
      (=ucs		  . #x0464)	; Ñ¤
      ))
    (=ucs		. #x0465)	; Ñ¥
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LITTLE YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LITTLE YUS")
      (=ucs		  . #x0467)	; Ñ§
      ))
    (=ucs		. #x0466)	; Ñ¦
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LITTLE YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LITTLE YUS")
      (=ucs		  . #x0466)	; Ñ¦
      ))
    (=ucs		. #x0467)	; Ñ§
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
      (=ucs		  . #x0469)	; Ñ©
      ))
    (=ucs		. #x0468)	; Ñ¨
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
      (=ucs		  . #x0468)	; Ñ¨
      ))
    (=ucs		. #x0469)	; Ñ©
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BIG YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BIG YUS")
      (=ucs		  . #x046B)	; Ñ«
      ))
    (=ucs		. #x046A)	; Ñª
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BIG YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BIG YUS")
      (=ucs		  . #x046A)	; Ñª
      ))
    (=ucs		. #x046B)	; Ñ«
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
      (=ucs		  . #x046D)	; Ñ­
      ))
    (=ucs		. #x046C)	; Ñ¬
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
      (=ucs		  . #x046C)	; Ñ¬
      ))
    (=ucs		. #x046D)	; Ñ­
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KSI")
      (=ucs		  . #x046F)	; Ñ¯
      ))
    (=ucs		. #x046E)	; Ñ®
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KSI")
      (=ucs		  . #x046E)	; Ñ®
      ))
    (=ucs		. #x046F)	; Ñ¯
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PSI")
      (=ucs		  . #x0471)	; Ñ±
      ))
    (=ucs		. #x0470)	; Ñ°
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PSI")
      (=ucs		  . #x0470)	; Ñ°
      ))
    (=ucs		. #x0471)	; Ñ±
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER FITA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER FITA")
      (=ucs		  . #x0473)	; Ñ³
      ))
    (=ucs		. #x0472)	; Ñ²
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER FITA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER FITA")
      (=ucs		  . #x0472)	; Ñ²
      ))
    (=ucs		. #x0473)	; Ñ³
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IZHITSA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IZHITSA")
      (=ucs		  . #x0475)	; Ñµ
      ))
    (=ucs		. #x0474)	; Ñ´
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IZHITSA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IZHITSA")
      (=ucs		  . #x0474)	; Ñ´
      ))
    (=ucs		. #x0475)	; Ñµ
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0474 #x030F)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
      (=ucs		  . #x0477)	; Ñ·
      ))
    (=ucs		. #x0476)	; Ñ¶
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0475 #x030F)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
      (=ucs		  . #x0476)	; Ñ¶
      ))
    (=ucs		. #x0477)	; Ñ·
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UK")
      (=ucs		  . #x0479)	; Ñ¹
      ))
    (=ucs		. #x0478)	; Ñ¸
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UK")
      (=ucs		  . #x0478)	; Ñ¸
      ))
    (=ucs		. #x0479)	; Ñ¹
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ROUND OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ROUND OMEGA")
      (=ucs		  . #x047B)	; Ñ»
      ))
    (=ucs		. #x047A)	; Ñº
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ROUND OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ROUND OMEGA")
      (=ucs		  . #x047A)	; Ñº
      ))
    (=ucs		. #x047B)	; Ñ»
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
      (=ucs		  . #x047D)	; Ñ½
      ))
    (=ucs		. #x047C)	; Ñ¼
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
      (=ucs		  . #x047C)	; Ñ¼
      ))
    (=ucs		. #x047D)	; Ñ½
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OT")
      (=ucs		  . #x047F)	; Ñ¿
      ))
    (=ucs		. #x047E)	; Ñ¾
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OT")
      (=ucs		  . #x047E)	; Ñ¾
      ))
    (=ucs		. #x047F)	; Ñ¿
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KOPPA")
      (=ucs		  . #x0481)	; Ò
      ))
    (=ucs		. #x0480)	; Ò€
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KOPPA")
      (=ucs		  . #x0480)	; Ò€
      ))
    (=ucs		. #x0481)	; Ò
    ))
(define-char
  '((name		. "CYRILLIC THOUSANDS SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0482)	; Ò‚
    ))
(define-char
  '((name		. "COMBINING CYRILLIC TITLO")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0483)	; Òƒ
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PALATALIZATION")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0484)	; Ò„
    ))
(define-char
  '((name		. "COMBINING CYRILLIC DASIA PNEUMATA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0485)	; Ò…
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PSILI PNEUMATA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0486)	; Ò†
    ))
(define-char
  '((name		. "COMBINING CYRILLIC HUNDRED THOUSANDS SIGN")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0488)	; Òˆ
    ))
(define-char
  '((name		. "COMBINING CYRILLIC MILLIONS SIGN")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0489)	; Ò‰
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SEMISOFT SIGN")
      (=ucs		  . #x048D)	; Ò
      ))
    (=ucs		. #x048C)	; ÒŒ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SEMISOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
      (=ucs		  . #x048C)	; ÒŒ
      ))
    (=ucs		. #x048D)	; Ò
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER WITH TICK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER WITH TICK")
      (=ucs		  . #x048F)	; Ò
      ))
    (=ucs		. #x048E)	; ÒŽ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER WITH TICK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER WITH TICK")
      (=ucs		  . #x048E)	; ÒŽ
      ))
    (=ucs		. #x048F)	; Ò
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH UPTURN")
      (=ucs		  . #x0491)	; Ò‘
      ))
    (=ucs		. #x0490)	; Ò
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH UPTURN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
      (=ucs		  . #x0490)	; Ò
      ))
    (=ucs		. #x0491)	; Ò‘
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH STROKE")
      (=ucs		  . #x0493)	; Ò“
      ))
    (=ucs		. #x0492)	; Ò’
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
      (=ucs		  . #x0492)	; Ò’
      ))
    (=ucs		. #x0493)	; Ò“
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
      (=ucs		  . #x0495)	; Ò•
      ))
    (=ucs		. #x0494)	; Ò”
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
      (=ucs		  . #x0494)	; Ò”
      ))
    (=ucs		. #x0495)	; Ò•
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
      (=ucs		  . #x0497)	; Ò—
      ))
    (=ucs		. #x0496)	; Ò–
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
      (=ucs		  . #x0496)	; Ò–
      ))
    (=ucs		. #x0497)	; Ò—
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
      (=ucs		  . #x0499)	; Ò™
      ))
    (=ucs		. #x0498)	; Ò˜
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
      (=ucs		  . #x0498)	; Ò˜
      ))
    (=ucs		. #x0499)	; Ò™
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH DESCENDER")
      (=ucs		  . #x049B)	; Ò›
      ))
    (=ucs		. #x049A)	; Òš
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
      (=ucs		  . #x049A)	; Òš
      ))
    (=ucs		. #x049B)	; Ò›
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
      (=ucs		  . #x049D)	; Ò
      ))
    (=ucs		. #x049C)	; Òœ
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
      (=ucs		  . #x049C)	; Òœ
      ))
    (=ucs		. #x049D)	; Ò
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH STROKE")
      (=ucs		  . #x049F)	; ÒŸ
      ))
    (=ucs		. #x049E)	; Òž
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH STROKE")
      (=ucs		  . #x049E)	; Òž
      ))
    (=ucs		. #x049F)	; ÒŸ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BASHKIR KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BASHKIR KA")
      (=ucs		  . #x04A1)	; Ò¡
      ))
    (=ucs		. #x04A0)	; Ò 
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BASHKIR KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BASHKIR KA")
      (=ucs		  . #x04A0)	; Ò 
      ))
    (=ucs		. #x04A1)	; Ò¡
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN WITH DESCENDER")
      (=ucs		  . #x04A3)	; Ò£
      ))
    (=ucs		. #x04A2)	; Ò¢
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
      (=ucs		  . #x04A2)	; Ò¢
      ))
    (=ucs		. #x04A3)	; Ò£
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE EN GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE EN GHE")
      (=ucs		  . #x04A5)	; Ò¥
      ))
    (=ucs		. #x04A4)	; Ò¤
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE EN GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE EN GHE")
      (=ucs		  . #x04A4)	; Ò¤
      ))
    (=ucs		. #x04A5)	; Ò¥
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
      (=ucs		  . #x04A7)	; Ò§
      ))
    (=ucs		. #x04A6)	; Ò¦
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
      (=ucs		  . #x04A6)	; Ò¦
      ))
    (=ucs		. #x04A7)	; Ò§
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN HA")
      (=ucs		  . #x04A9)	; Ò©
      ))
    (=ucs		. #x04A8)	; Ò¨
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
      (=ucs		  . #x04A8)	; Ò¨
      ))
    (=ucs		. #x04A9)	; Ò©
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES WITH DESCENDER")
      (=ucs		  . #x04AB)	; Ò«
      ))
    (=ucs		. #x04AA)	; Òª
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
      (=ucs		  . #x04AA)	; Òª
      ))
    (=ucs		. #x04AB)	; Ò«
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE WITH DESCENDER")
      (=ucs		  . #x04AD)	; Ò­
      ))
    (=ucs		. #x04AC)	; Ò¬
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
      (=ucs		  . #x04AC)	; Ò¬
      ))
    (=ucs		. #x04AD)	; Ò­
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER STRAIGHT U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER STRAIGHT U")
      (=ucs		  . #x04AF)	; Ò¯
      ))
    (=ucs		. #x04AE)	; Ò®
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER STRAIGHT U")
      (=ucs		  . #x04AE)	; Ò®
      ))
    (=ucs		. #x04AF)	; Ò¯
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
      (=ucs		  . #x04B1)	; Ò±
      ))
    (=ucs		. #x04B0)	; Ò°
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
      (=ucs		  . #x04B0)	; Ò°
      ))
    (=ucs		. #x04B1)	; Ò±
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA WITH DESCENDER")
      (=ucs		  . #x04B3)	; Ò³
      ))
    (=ucs		. #x04B2)	; Ò²
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
      (=ucs		  . #x04B2)	; Ò²
      ))
    (=ucs		. #x04B3)	; Ò³
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE TE TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE TE TSE")
      (=ucs		  . #x04B5)	; Òµ
      ))
    (=ucs		. #x04B4)	; Ò´
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE TE TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE TE TSE")
      (=ucs		  . #x04B4)	; Ò´
      ))
    (=ucs		. #x04B5)	; Òµ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
      (=ucs		  . #x04B7)	; Ò·
      ))
    (=ucs		. #x04B6)	; Ò¶
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
      (=ucs		  . #x04B6)	; Ò¶
      ))
    (=ucs		. #x04B7)	; Ò·
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
      (=ucs		  . #x04B9)	; Ò¹
      ))
    (=ucs		. #x04B8)	; Ò¸
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
      (=ucs		  . #x04B8)	; Ò¸
      ))
    (=ucs		. #x04B9)	; Ò¹
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHHA")
      (=ucs		  . #x04BB)	; Ò»
      ))
    (=ucs		. #x04BA)	; Òº
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHHA")
      (=ucs		  . #x04BA)	; Òº
      ))
    (=ucs		. #x04BB)	; Ò»
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN CHE")
      (=ucs		  . #x04BD)	; Ò½
      ))
    (=ucs		. #x04BC)	; Ò¼
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
      (=ucs		  . #x04BC)	; Ò¼
      ))
    (=ucs		. #x04BD)	; Ò½
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
      (=ucs		  . #x04BF)	; Ò¿
      ))
    (=ucs		. #x04BE)	; Ò¾
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
      (=ucs		  . #x04BE)	; Ò¾
      ))
    (=ucs		. #x04BF)	; Ò¿
    ))
(define-char
  '((name		. "CYRILLIC LETTER PALOCHKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C0)	; Ó€
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0416 #x0306)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH BREVE")
      (=ucs		  . #x04C2)	; Ó‚
      ))
    (=ucs		. #x04C1)	; Ó
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0436 #x0306)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
      (=ucs		  . #x04C1)	; Ó
      ))
    (=ucs		. #x04C2)	; Ó‚
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH HOOK")
      (=ucs		  . #x04C4)	; Ó„
      ))
    (=ucs		. #x04C3)	; Óƒ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH HOOK")
      (=ucs		  . #x04C3)	; Óƒ
      ))
    (=ucs		. #x04C4)	; Ó„
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN WITH HOOK")
      (=ucs		  . #x04C8)	; Óˆ
      ))
    (=ucs		. #x04C7)	; Ó‡
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN WITH HOOK")
      (=ucs		  . #x04C7)	; Ó‡
      ))
    (=ucs		. #x04C8)	; Óˆ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
      (=ucs		  . #x04CC)	; ÓŒ
      ))
    (=ucs		. #x04CB)	; Ó‹
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
      (=ucs		  . #x04CB)	; Ó‹
      ))
    (=ucs		. #x04CC)	; ÓŒ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0410 #x0306)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A WITH BREVE")
      (=ucs		  . #x04D1)	; Ó‘
      ))
    (=ucs		. #x04D0)	; Ó
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0430 #x0306)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x04D0)	; Ó
      ))
    (=ucs		. #x04D1)	; Ó‘
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0410 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A WITH DIAERESIS")
      (=ucs		  . #x04D3)	; Ó“
      ))
    (=ucs		. #x04D2)	; Ó’
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0430 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
      (=ucs		  . #x04D2)	; Ó’
      ))
    (=ucs		. #x04D3)	; Ó“
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE A IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE A IE")
      (=ucs		  . #x04D5)	; Ó•
      ))
    (=ucs		. #x04D4)	; Ó”
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE A IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE A IE")
      (=ucs		  . #x04D4)	; Ó”
      ))
    (=ucs		. #x04D5)	; Ó•
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0306)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE WITH BREVE")
      (=ucs		  . #x04D7)	; Ó—
      ))
    (=ucs		. #x04D6)	; Ó–
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0306)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE WITH BREVE")
      (=ucs		  . #x04D6)	; Ó–
      ))
    (=ucs		. #x04D7)	; Ó—
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SCHWA")
      (=ucs		  . #x04D9)	; Ó™
      ))
    (=ucs		. #x04D8)	; Ó˜
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SCHWA")
      (=ucs		  . #x04D8)	; Ó˜
      ))
    (=ucs		. #x04D9)	; Ó™
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04D8 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
      (=ucs		  . #x04DB)	; Ó›
      ))
    (=ucs		. #x04DA)	; Óš
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04D9 #x0308)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
      (=ucs		  . #x04DA)	; Óš
      ))
    (=ucs		. #x04DB)	; Ó›
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0416 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
      (=ucs		  . #x04DD)	; Ó
      ))
    (=ucs		. #x04DC)	; Óœ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0436 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
      (=ucs		  . #x04DC)	; Óœ
      ))
    (=ucs		. #x04DD)	; Ó
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0417 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
      (=ucs		  . #x04DF)	; ÓŸ
      ))
    (=ucs		. #x04DE)	; Óž
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0437 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
      (=ucs		  . #x04DE)	; Óž
      ))
    (=ucs		. #x04DF)	; ÓŸ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN DZE")
      (=ucs		  . #x04E1)	; Ó¡
      ))
    (=ucs		. #x04E0)	; Ó 
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
      (=ucs		  . #x04E0)	; Ó 
      ))
    (=ucs		. #x04E1)	; Ó¡
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0304)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH MACRON")
      (=ucs		  . #x04E3)	; Ó£
      ))
    (=ucs		. #x04E2)	; Ó¢
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0304)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x04E2)	; Ó¢
      ))
    (=ucs		. #x04E3)	; Ó£
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH DIAERESIS")
      (=ucs		  . #x04E5)	; Ó¥
      ))
    (=ucs		. #x04E4)	; Ó¤
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
      (=ucs		  . #x04E4)	; Ó¤
      ))
    (=ucs		. #x04E5)	; Ó¥
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041E #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O WITH DIAERESIS")
      (=ucs		  . #x04E7)	; Ó§
      ))
    (=ucs		. #x04E6)	; Ó¦
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043E #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
      (=ucs		  . #x04E6)	; Ó¦
      ))
    (=ucs		. #x04E7)	; Ó§
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BARRED O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BARRED O")
      (=ucs		  . #x04E9)	; Ó©
      ))
    (=ucs		. #x04E8)	; Ó¨
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BARRED O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BARRED O")
      (=ucs		  . #x04E8)	; Ó¨
      ))
    (=ucs		. #x04E9)	; Ó©
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04E8 #x0308)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
      (=ucs		  . #x04EB)	; Ó«
      ))
    (=ucs		. #x04EA)	; Óª
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04E9 #x0308)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
      (=ucs		  . #x04EA)	; Óª
      ))
    (=ucs		. #x04EB)	; Ó«
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x042D #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E WITH DIAERESIS")
      (=ucs		  . #x04ED)	; Ó­
      ))
    (=ucs		. #x04EC)	; Ó¬
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x044D #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
      (=ucs		  . #x04EC)	; Ó¬
      ))
    (=ucs		. #x04ED)	; Ó­
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x0304)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH MACRON")
      (=ucs		  . #x04EF)	; Ó¯
      ))
    (=ucs		. #x04EE)	; Ó®
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x0304)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x04EE)	; Ó®
      ))
    (=ucs		. #x04EF)	; Ó¯
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH DIAERESIS")
      (=ucs		  . #x04F1)	; Ó±
      ))
    (=ucs		. #x04F0)	; Ó°
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
      (=ucs		  . #x04F0)	; Ó°
      ))
    (=ucs		. #x04F1)	; Ó±
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x030B)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x04F3)	; Ó³
      ))
    (=ucs		. #x04F2)	; Ó²
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x030B)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x04F2)	; Ó²
      ))
    (=ucs		. #x04F3)	; Ó³
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0427 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
      (=ucs		  . #x04F5)	; Óµ
      ))
    (=ucs		. #x04F4)	; Ó´
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0447 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
      (=ucs		  . #x04F4)	; Ó´
      ))
    (=ucs		. #x04F5)	; Óµ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x042B #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
      (=ucs		  . #x04F9)	; Ó¹
      ))
    (=ucs		. #x04F8)	; Ó¸
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x044B #x0308)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
      (=ucs		  . #x04F8)	; Ó¸
      ))
    (=ucs		. #x04F9)	; Ó¹
    ))
