;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with macron")
      (=jis-x0213-1-2000  . #x2975)	; ø»¢ €
      (=jis-x0212	  . #x2A27)	; ø»Š±¤
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; Ä
      ))
    (=ucs		. #x0100)	; Ä€
    (latin-iso8859-4	. #xC0)	; øº’¹€
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with macron")
    (=>ucs		. #x0100)	; Ä€
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0100)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ä€
      ))
    (=jis-x0213-1-2000	. #x2975)	; ø»¢ €
    (=jis-x0212		. #x2A27)	; ø»Š±¤
    (=jef-china3	. #x87A8)	; øºˆž¨
    (=ucs@jis		. #x0100)	; ø»¢ €
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with macron")
      (=jis-x0213-1-2000  . #x297A)	; ø»¢ …
      (=jis-x0212	  . #x2B27)	; ø»Š³‚
      (=gb2312		  . #x2821)	; ø»„–
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ä€
      ))
    (=ucs		. #x0101)	; Ä
    (latin-iso8859-4	. #xE0)	; øº’¹ 
    ))
(define-char
  '((name		. "fullwidth latin small letter a with macron")
    (=>ucs		. #x0101)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0101)
    (->uppercase
     ((name . "fullwidth latin capital letter a with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; Ä
      ))
    (=jis-x0213-1-2000	. #x297A)	; ø»¢ …
    (=jis-x0212		. #x2B27)	; ø»Š³‚
    (=gb2312		. #x2821)	; ø»„–
    (=jef-china3	. #x87BC)	; øºˆž¼
    (=ucs@jis		. #x0101)	; ø»¢ …
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with breve")
      (=jis-x0213-1-2000  . #x2A3A)	; ø»¢ £
      (=jis-x0212	  . #x2A25)	; ø»Š±¢
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; Äƒ
      ))
    (=ucs		. #x0102)	; Ä‚
    (latin-tcvn5712	. #xA1)	; øº“™¡
    (latin-iso8859-2	. #xC3)	; øº’¶ƒ
    (latin-viscii	. #xC5)	; øº’ž¥
    (latin-viscii-upper . #xE5)	; øº’ž¥
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with breve")
    (=>ucs		. #x0102)	; Ä‚
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0102)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ä‚
      ))
    (=jis-x0213-1-2000	. #x2A3A)	; ø»¢ £
    (=jis-x0212		. #x2A25)	; ø»Š±¢
    (=jef-china3	. #x87DE)	; øºˆŸž
    (=ucs@jis		. #x0102)	; ø»¢ £
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with breve")
      (=jis-x0213-1-2000  . #x2A49)	; ø»¢ ²
      (=jis-x0212	  . #x2B25)	; ø»Š³€
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ä‚
      ))
    (=ucs		. #x0103)	; Äƒ
    (latin-tcvn5712	. #xA8)	; øº“™¨
    (latin-iso8859-2	. #xE3)	; øº’¶£
    (latin-viscii	. #xE5)	; øº’…
    (latin-viscii-lower . #xE5)	; øº’…
    ))
(define-char
  '((name		. "fullwidth latin small letter a with breve")
    (=>ucs		. #x0103)	; Äƒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0103)
    (->uppercase
     ((name . "fullwidth latin capital letter a with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; Äƒ
      ))
    (=jis-x0213-1-2000	. #x2A49)	; ø»¢ ²
    (=jis-x0212		. #x2B25)	; ø»Š³€
    (=jef-china3	. #x87E8)	; øºˆŸ¨
    (=ucs@jis		. #x0103)	; ø»¢ ²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with ogonek")
      (=jis-x0213-1-2000  . #x2A21)	; ø»¢ Š
      (=jis-x0212	  . #x2A28)	; ø»Š±¥
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; Ä…
      ))
    (=ucs		. #x0104)	; Ä„
    (latin-iso8859-4	. #xA1)	; øº’¸¡
    (latin-iso8859-2	. #xA1)	; øº’µ¡
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with ogonek")
    (=>ucs		. #x0104)	; Ä„
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0104)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ä„
      ))
    (=jis-x0213-1-2000	. #x2A21)	; ø»¢ Š
    (=jis-x0212		. #x2A28)	; ø»Š±¥
    (=jef-china3	. #x8AA3)	; øºˆª£
    (=ucs@jis		. #x0104)	; ø»¢ Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with ogonek")
      (=jis-x0213-1-2000  . #x2A2C)	; ø»¢ •
      (=jis-x0212	  . #x2B28)	; ø»Š³ƒ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ä„
      ))
    (=ucs		. #x0105)	; Ä…
    (latin-iso8859-4	. #xB1)	; øº’¸±
    (latin-iso8859-2	. #xB1)	; øº’µ±
    ))
(define-char
  '((name		. "fullwidth latin small letter a with ogonek")
    (=>ucs		. #x0105)	; Ä…
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0105)
    (->uppercase
     ((name . "fullwidth latin capital letter a with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; Ä…
      ))
    (=jis-x0213-1-2000	. #x2A2C)	; ø»¢ •
    (=jis-x0212		. #x2B28)	; ø»Š³ƒ
    (=jef-china3	. #x8AAB)	; øºˆª«
    (=ucs@jis		. #x0105)	; ø»¢ •
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with acute")
      (=jis-x0213-1-2000  . #x2A3C)	; ø»¢ ¥
      (=jis-x0212	  . #x2A2B)	; ø»Š±¨
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; Ä‡
      ))
    (=ucs		. #x0106)	; Ä†
    (latin-iso8859-2	. #xC6)	; øº’¶†
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with acute")
    (=>ucs		. #x0106)	; Ä†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0106)
    (->lowercase
     ((name		  . "fullwidth latin small letter c with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ä†
      ))
    (=jis-x0213-1-2000	. #x2A3C)	; ø»¢ ¥
    (=jis-x0212		. #x2A2B)	; ø»Š±¨
    (=jef-china3	. #x85D6)	; øºˆ—–
    (=ucs@jis		. #x0106)	; ø»¢ ¥
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with acute")
      (=jis-x0213-1-2000  . #x2A4B)	; ø»¢ ´
      (=jis-x0212	  . #x2B2B)	; ø»Š³†
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ä†
      ))
    (=ucs		. #x0107)	; Ä‡
    (latin-iso8859-2	. #xE6)	; øº’¶¦
    ))
(define-char
  '((name		. "fullwidth latin small letter c with acute")
    (=>ucs		. #x0107)	; Ä‡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0107)
    (->uppercase
     ((name . "fullwidth latin capital letter c with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; Ä‡
      ))
    (=jis-x0213-1-2000	. #x2A4B)	; ø»¢ ´
    (=jis-x0212		. #x2B2B)	; ø»Š³†
    (=jef-china3	. #x85EC)	; øºˆ—¬
    (=ucs@jis		. #x0107)	; ø»¢ ´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with circumflex")
      (=jis-x0213-1-2000  . #x2A59)	; ø»¢¡‚
      (=jis-x0212	  . #x2A2C)	; ø»Š±©
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; Ä‰
      ))
    (=ucs		. #x0108)	; Äˆ
    (latin-iso8859-3	. #xC6)	; øº’·¦
    ))
(define-char
  '((name . "fullwidth latin capital letter c with circumflex")
    (=>ucs		. #x0108)	; Äˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0108)
    (->lowercase
     ((name . "fullwidth latin small letter c with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Äˆ
      ))
    (=jis-x0213-1-2000	. #x2A59)	; ø»¢¡‚
    (=jis-x0212		. #x2A2C)	; ø»Š±©
    (=jef-china3	. #x86B8)	; øºˆš¸
    (=ucs@jis		. #x0108)	; ø»¢¡‚
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter c with circumflex")
      (=jis-x0213-1-2000  . #x2A5F)	; ø»¢¡ˆ
      (=jis-x0212	  . #x2B2C)	; ø»Š³‡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Äˆ
      ))
    (=ucs		. #x0109)	; Ä‰
    (latin-iso8859-3	. #xE6)	; øº’¸†
    ))
(define-char
  '((name . "fullwidth latin small letter c with circumflex")
    (=>ucs		. #x0109)	; Ä‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0109)
    (->uppercase
     ((name . "fullwidth latin capital letter c with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; Ä‰
      ))
    (=jis-x0213-1-2000	. #x2A5F)	; ø»¢¡ˆ
    (=jis-x0212		. #x2B2C)	; ø»Š³‡
    (=jef-china3	. #x86C5)	; øºˆ›…
    (=ucs@jis		. #x0109)	; ø»¢¡ˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with dot above")
      (=jis-x0212	  . #x2A2F)	; ø»Š±¬
      (=jef-china3	  . #x87FA)	; øºˆŸº
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; Ä‹
      ))
    (=ucs		. #x010A)	; ÄŠ
    (latin-iso8859-3	. #xC5)	; øº’·¥
    ))
(define-char
  '((name . "fullwidth latin capital letter c with dot above")
    (=>ucs		. #x010A)	; ÄŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010A)
    (->lowercase
     ((name . "fullwidth latin small letter c with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; ÄŠ
      ))
    (=jis-x0212		. #x2A2F)	; ø»Š±¬
    (=jef-china3	. #x87FA)	; øºˆŸº
    (=ucs@jis		. #x010A)	; ø»Š±¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter c with dot above")
      (=jis-x0212	  . #x2B2F)	; ø»Š³Š
      (=jef-china3	  . #x88B2)	; øºˆ¢²
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; ÄŠ
      ))
    (=ucs		. #x010B)	; Ä‹
    (latin-iso8859-3	. #xE5)	; øº’¸…
    ))
(define-char
  '((name . "fullwidth latin small letter c with dot above")
    (=>ucs		. #x010B)	; Ä‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010B)
    (->uppercase
     ((name . "fullwidth latin capital letter c with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; Ä‹
      ))
    (=jis-x0212		. #x2B2F)	; ø»Š³Š
    (=jef-china3	. #x88B2)	; øºˆ¢²
    (=ucs@jis		. #x010B)	; ø»Š³Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with caron")
      (=jis-x0213-1-2000  . #x2A3D)	; ø»¢ ¦
      (=jis-x0212	  . #x2A2D)	; ø»Š±ª
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; Ä
      ))
    (=ucs		. #x010C)	; ÄŒ
    (latin-iso8859-4	. #xC8)	; øº’¹ˆ
    (latin-iso8859-2	. #xC8)	; øº’¶ˆ
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with caron")
    (=>ucs		. #x010C)	; ÄŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010C)
    (->lowercase
     ((name . "fullwidth latin capital letter c with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; ÄŒ
      ))
    (=jis-x0213-1-2000	. #x2A3D)	; ø»¢ ¦
    (=jis-x0212		. #x2A2D)	; ø»Š±ª
    (=jef-china3	. #x88E0)	; øºˆ£ 
    (=ucs@jis		. #x010C)	; ø»¢ ¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with caron")
      (=jis-x0213-1-2000  . #x2A4C)	; ø»¢ µ
      (=jis-x0212	  . #x2B2D)	; ø»Š³ˆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; ÄŒ
      ))
    (=ucs		. #x010D)	; Ä
    (latin-iso8859-4	. #xE8)	; øº’¹¨
    (latin-iso8859-2	. #xE8)	; øº’¶¨
    ))
(define-char
  '((name		. "fullwidth latin small letter c with caron")
    (=>ucs		. #x010D)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010D)
    (->uppercase
     ((name		  . "fullwidth latin small letter c with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; Ä
      ))
    (=jis-x0213-1-2000	. #x2A4C)	; ø»¢ µ
    (=jis-x0212		. #x2B2D)	; ø»Š³ˆ
    (=jef-china3	. #x88EF)	; øºˆ£¯
    (=ucs@jis		. #x010D)	; ø»¢ µ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter d with caron")
      (=jis-x0213-1-2000  . #x2A40)	; ø»¢ ©
      (=jis-x0212	  . #x2A30)	; ø»Š±­
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; Ä
      ))
    (=ucs		. #x010E)	; ÄŽ
    (latin-iso8859-2	. #xCF)	; øº’¶
    ))
(define-char
  '((name		. "fullwidth latin capital letter d with caron")
    (=>ucs		. #x010E)	; ÄŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010E)
    (->lowercase
     ((name		  . "fullwidth latin small letter d with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; ÄŽ
      ))
    (=jis-x0213-1-2000	. #x2A40)	; ø»¢ ©
    (=jis-x0212		. #x2A30)	; ø»Š±­
    (=jef-china3	. #x88E1)	; øºˆ£¡
    (=ucs@jis		. #x010E)	; ø»¢ ©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter d with caron")
      (=jis-x0213-1-2000  . #x2A4F)	; ø»¢ ¸
      (=jis-x0212	  . #x2B30)	; ø»Š³‹
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; ÄŽ
      ))
    (=ucs		. #x010F)	; Ä
    (latin-iso8859-2	. #xEF)	; øº’¶¯
    ))
(define-char
  '((name		. "fullwidth latin small letter d with caron")
    (=>ucs		. #x010F)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010F)
    (->uppercase
     ((name . "fullwidth latin capital letter d with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; Ä
      ))
    (=jis-x0213-1-2000	. #x2A4F)	; ø»¢ ¸
    (=jis-x0212		. #x2B30)	; ø»Š³‹
    (=jef-china3	. #x88F0)	; øºˆ£°
    (=ucs@jis		. #x010F)	; ø»¢ ¸
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
      (=jis-x0212	  . #x2922)	; ø»Š°
      (=jef-china3	  . #x83A3)	; øºˆŽ£
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; Ä‘
      ))
    (=ucs		. #x0110)	; Ä
    (latin-tcvn5712	. #xA7)	; øº“™§
    (latin-iso8859-4	. #xD0)	; øº’¹
    (latin-iso8859-2	. #xD0)	; øº’¶
    (latin-viscii	. #xD0)	; øº’ž°
    (latin-viscii-upper . #xF0)	; øº’ž°
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
    (=>ucs		. #x0110)	; Ä
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0110)
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER D WITH STROKE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Ä
      ))
    (=jis-x0212		. #x2922)	; ø»Š°
    (=jef-china3	. #x83A3)	; øºˆŽ£
    (=ucs@jis		. #x0110)	; ø»Š°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Ä
      ))
    (=ucs		. #x0111)	; Ä‘
    (latin-tcvn5712	. #xAE)	; øº“™®
    (latin-iso8859-4	. #xF0)	; øº’¹°
    (latin-iso8859-2	. #xF0)	; øº’¶°
    (latin-viscii	. #xF0)	; øº’
    (latin-viscii-lower . #xF0)	; øº’
    ))
(define-char
  '((name		. "fullwidth latin small letter d with stroke")
    (=>ucs		. #x0111)	; Ä‘
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter d with stroke")
      ))
    (=jis-x0213-1-2000	. #x2A50)	; ø»¢ ¹
    (=jis-x0212		. #x2942)	; ø»Š°¡
    (=ks-x1001		. #x2922)	; ø»ˆ¥½
    (=jef-china3	. #x83AE)	; øºˆŽ®
    (=ucs@jis		. #x0111)	; ø»¢ ¹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with macron")
      (=jis-x0213-1-2000  . #x2978)	; ø»¢ ƒ
      (=jis-x0212	  . #x2A37)	; ø»Š±´
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; Ä“
      ))
    (=ucs		. #x0112)	; Ä’
    (latin-iso8859-4	. #xAA)	; øº’¸ª
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with macron")
    (=>ucs		. #x0112)	; Ä’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0112)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ä’
      ))
    (=jis-x0213-1-2000	. #x2978)	; ø»¢ ƒ
    (=jis-x0212		. #x2A37)	; ø»Š±´
    (=jef-china3	. #x87AB)	; øºˆž«
    (=ucs@jis		. #x0112)	; ø»¢ ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with macron")
      (=jis-x0213-1-2000  . #x297D)	; ø»¢ ˆ
      (=jis-x0212	  . #x2B37)	; ø»Š³’
      (=gb2312		  . #x2825)	; ø»„š
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ä’
      ))
    (=ucs		. #x0113)	; Ä“
    (latin-iso8859-4	. #xBA)	; øº’¸º
    ))
(define-char
  '((name		. "fullwidth latin small letter e with macron")
    (=>ucs		. #x0113)	; Ä“
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0113)
    (->uppercase
     ((name . "fullwidth latin capital letter e with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; Ä“
      ))
    (=jis-x0213-1-2000	. #x297D)	; ø»¢ ˆ
    (=jis-x0212		. #x2B37)	; ø»Š³’
    (=gb2312		. #x2825)	; ø»„š
    (=jef-china3	. #x87BF)	; øºˆž¿
    (=ucs@jis		. #x0113)	; ø»¢ ˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH BREVE")
      (=ucs		  . #x0115)	; Ä•
      ))
    (=ucs		. #x0114)	; Ä”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH BREVE")
      (=ucs		  . #x0114)	; Ä”
      ))
    (=ucs		. #x0115)	; Ä•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=jis-x0212	  . #x2A36)	; ø»Š±³
      (=jef-china3	  . #x87FC)	; øºˆŸ¼
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; Ä—
      ))
    (=ucs		. #x0116)	; Ä–
    (latin-iso8859-4	. #xCC)	; øº’¹Œ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (=>ucs		. #x0116)	; Ä–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0116)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ä–
      ))
    (=jis-x0212		. #x2A36)	; ø»Š±³
    (=jef-china3	. #x87FC)	; øºˆŸ¼
    (=ucs@jis		. #x0116)	; ø»Š±³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
      (=jis-x0212	  . #x2B36)	; ø»Š³‘
      (=jef-china3	  . #x88B4)	; øºˆ¢´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ä–
      ))
    (=ucs		. #x0117)	; Ä—
    (latin-iso8859-4	. #xEC)	; øº’¹¬
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
    (=>ucs		. #x0117)	; Ä—
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0117)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; Ä—
      ))
    (=jis-x0212		. #x2B36)	; ø»Š³‘
    (=jef-china3	. #x88B4)	; øºˆ¢´
    (=ucs@jis		. #x0117)	; ø»Š³‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with ogonek")
      (=jis-x0213-1-2000  . #x2A3E)	; ø»¢ §
      (=jis-x0212	  . #x2A38)	; ø»Š±µ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; Ä™
      ))
    (=ucs		. #x0118)	; Ä˜
    (latin-iso8859-4	. #xCA)	; øº’¹Š
    (latin-iso8859-2	. #xCA)	; øº’¶Š
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with ogonek")
    (=>ucs		. #x0118)	; Ä˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0118)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ä˜
      ))
    (=jis-x0213-1-2000	. #x2A3E)	; ø»¢ §
    (=jis-x0212		. #x2A38)	; ø»Š±µ
    (=jef-china3	. #x8AA4)	; øºˆª¤
    (=ucs@jis		. #x0118)	; ø»¢ §
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with ogonek")
      (=jis-x0213-1-2000  . #x2A4D)	; ø»¢ ¶
      (=jis-x0212	  . #x2B38)	; ø»Š³“
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ä˜
      ))
    (=ucs		. #x0119)	; Ä™
    (latin-iso8859-4	. #xEA)	; øº’¹ª
    (latin-iso8859-2	. #xEA)	; øº’¶ª
    ))
(define-char
  '((name		. "fullwidth latin small letter e with ogonek")
    (=>ucs		. #x0119)	; Ä™
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0119)
    (->uppercase
     ((name . "fullwidth latin capital letter e with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; Ä™
      ))
    (=jis-x0213-1-2000	. #x2A4D)	; ø»¢ ¶
    (=jis-x0212		. #x2B38)	; ø»Š³“
    (=jef-china3	. #x8AAC)	; øºˆª¬
    (=ucs@jis		. #x0119)	; ø»¢ ¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with caron")
      (=jis-x0213-1-2000  . #x2A3F)	; ø»¢ ¨
      (=jis-x0212	  . #x2A35)	; ø»Š±²
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; Ä›
      ))
    (=ucs		. #x011A)	; Äš
    (latin-iso8859-2	. #xCC)	; øº’¶Œ
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with caron")
    (=>ucs		. #x011A)	; Äš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011A)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Äš
      ))
    (=jis-x0213-1-2000	. #x2A3F)	; ø»¢ ¨
    (=jis-x0212		. #x2A35)	; ø»Š±²
    (=jef-china3	. #x88E2)	; øºˆ£¢
    (=ucs@jis		. #x011A)	; ø»¢ ¨
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with caron")
      (=jis-x0213-1-2000  . #x2A4E)	; ø»¢ ·
      (=jis-x0212	  . #x2B35)	; ø»Š³
      (=gb2312		  . #x2827)	; ø»„œ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Äš
      ))
    (=ucs		. #x011B)	; Ä›
    (latin-iso8859-2	. #xEC)	; øº’¶¬
    ))
(define-char
  '((name		. "fullwidth latin small letter e with caron")
    (=>ucs		. #x011B)	; Ä›
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011B)
    (->uppercase
     ((name . "fullwidth latin capital letter e with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; Ä›
      ))
    (=jis-x0213-1-2000	. #x2A4E)	; ø»¢ ·
    (=jis-x0212		. #x2B35)	; ø»Š³
    (=gb2312		. #x2827)	; ø»„œ
    (=jef-china3	. #x88F1)	; øºˆ£±
    (=ucs@jis		. #x011B)	; ø»¢ ·
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with circumflex")
      (=jis-x0213-1-2000  . #x2A5A)	; ø»¢¡ƒ
      (=jis-x0212	  . #x2A3A)	; ø»Š±·
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; Ä
      ))
    (=ucs		. #x011C)	; Äœ
    (latin-iso8859-3	. #xD8)	; øº’·¸
    ))
(define-char
  '((name . "fullwidth latin capital letter g with circumflex")
    (=>ucs		. #x011C)	; Äœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011C)
    (->lowercase
     ((name . "fullwidth latin small letter g with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Äœ
      ))
    (=jis-x0213-1-2000	. #x2A5A)	; ø»¢¡ƒ
    (=jis-x0212		. #x2A3A)	; ø»Š±·
    (=jef-china3	. #x86BA)	; øºˆšº
    (=ucs@jis		. #x011C)	; ø»¢¡ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter g with circumflex")
      (=jis-x0213-1-2000  . #x2A60)	; ø»¢¡‰
      (=jis-x0212	  . #x2B3A)	; ø»Š³•
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Äœ
      ))
    (=ucs		. #x011D)	; Ä
    (latin-iso8859-3	. #xF8)	; øº’¸˜
    ))
(define-char
  '((name . "fullwidth latin small letter g with circumflex")
    (=>ucs		. #x011D)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011D)
    (->uppercase
     ((name . "fullwidth latin small letter g with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; Ä
      ))
    (=jis-x0213-1-2000	. #x2A60)	; ø»¢¡‰
    (=jis-x0212		. #x2B3A)	; ø»Š³•
    (=jef-china3	. #x86C7)	; øºˆ›‡
    (=ucs@jis		. #x011D)	; ø»¢¡‰
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
      (=jis-x0212	  . #x2A3B)	; ø»Š±¸
      (=jef-china3	  . #x87E1)	; øºˆŸ¡
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ÄŸ
      ))
    (=ucs		. #x011E)	; Äž
    (latin-iso8859-9	. #xD0)	; øº“†°
    (latin-iso8859-3	. #xAB)	; øº’·‹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
    (=>ucs		. #x011E)	; Äž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011E)
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Äž
      ))
    (=jis-x0212		. #x2A3B)	; ø»Š±¸
    (=jef-china3	. #x87E1)	; øºˆŸ¡
    (=ucs@jis		. #x011E)	; ø»Š±¸
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
      (=jis-x0212	  . #x2B3B)	; ø»Š³–
      (=jef-china3	  . #x87EB)	; øºˆŸ«
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Äž
      ))
    (=ucs		. #x011F)	; ÄŸ
    (latin-iso8859-9	. #xF0)	; øº“‡
    (latin-iso8859-3	. #xBB)	; øº’·›
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
    (=>ucs		. #x011F)	; ÄŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ÄŸ
      ))
    (=jis-x0212		. #x2B3B)	; ø»Š³–
    (=jef-china3	. #x87EB)	; øºˆŸ«
    (=ucs@jis		. #x011F)	; ø»Š³–
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=jis-x0212	  . #x2A3D)	; ø»Š±º
      (=jef-china3	  . #x87FE)	; øºˆŸ¾
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; Ä¡
      ))
    (=ucs		. #x0120)	; Ä 
    (latin-iso8859-3	. #xD5)	; øº’·µ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (=>ucs		. #x0120)	; Ä 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0120)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ä 
      ))
    (=jis-x0212		. #x2A3D)	; ø»Š±º
    (=jef-china3	. #x87FE)	; øºˆŸ¾
    (=ucs@jis		. #x0120)	; ø»Š±º
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
      (=jis-x0212	  . #x2B3D)	; ø»Š³˜
      (=jef-china3	  . #x88B6)	; øºˆ¢¶
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ä 
      ))
    (=ucs		. #x0121)	; Ä¡
    (latin-iso8859-3	. #xF5)	; øº’¸•
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
    (=>ucs		. #x0121)	; Ä¡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0121)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; Ä¡
      ))
    (=jis-x0212		. #x2B3D)	; ø»Š³˜
    (=jef-china3	. #x88B6)	; øºˆ¢¶
    (=ucs@jis		. #x0121)	; ø»Š³˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with cedilla")
      (=jis-x0212	  . #x2A3C)	; ø»Š±¹
      (=ucs@jis		  . #x0122)	; ø»Š±¹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CEDILLA")
      (=ucs		  . #x0123)	; Ä£
      ))
    (=ucs		. #x0122)	; Ä¢
    (latin-iso8859-4	. #xAB)	; øº’¸«
    ))
(define-char
  '((name . "fullwidth latin capital letter g with cedilla")
    (=>ucs		. #x0122)	; Ä¢
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0122)
    (->lowercase
     ((name . "fullwidth latin small letter g with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ä¢
      ))
    (=jis-x0212		. #x2A3C)	; ø»Š±¹
    (=ucs@jis		. #x0122)	; ø»Š±¹
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ä¢
      ))
    (=ucs		. #x0123)	; Ä£
    (latin-iso8859-4	. #xBB)	; øº’¸»
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with circumflex")
      (=jis-x0213-1-2000  . #x2A5B)	; ø»¢¡„
      (=jis-x0212	  . #x2A3E)	; ø»Š±»
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; Ä¥
      ))
    (=ucs		. #x0124)	; Ä¤
    (latin-iso8859-3	. #xA6)	; øº’·†
    ))
(define-char
  '((name . "fullwidth latin capital letter h with circumflex")
    (=>ucs		. #x0124)	; Ä¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0124)
    (->lowercase
     ((name . "fullwidth latin small letter h with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ä¤
      ))
    (=jis-x0213-1-2000	. #x2A5B)	; ø»¢¡„
    (=jis-x0212		. #x2A3E)	; ø»Š±»
    (=jef-china3	. #x86BB)	; øºˆš»
    (=ucs@jis		. #x0124)	; ø»¢¡„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter h with circumflex")
      (=jis-x0213-1-2000  . #x2A61)	; ø»¢¡Š
      (=jis-x0212	  . #x2B3E)	; ø»Š³™
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ä¤
      ))
    (=ucs		. #x0125)	; Ä¥
    (latin-iso8859-3	. #xB6)	; øº’·–
    ))
(define-char
  '((name . "fullwidth latin small letter h with circumflex")
    (=>ucs		. #x0125)	; Ä¥
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0125)
    (->uppercase
     ((name . "fullwidth latin capital letter h with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; Ä¥
      ))
    (=jis-x0213-1-2000	. #x2A61)	; ø»¢¡Š
    (=jis-x0212		. #x2B3E)	; ø»Š³™
    (=jef-china3	. #x86C8)	; øºˆ›ˆ
    (=ucs@jis		. #x0125)	; ø»¢¡Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with stroke")
      (=jis-x0212	  . #x2924)	; ø»Š°ƒ
      (=ks-x1001	  . #x2824)	; ø»ˆ¤¡
      (=ucs@jis		  . #x0126)	; ø»Š°ƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; Ä§
      ))
    (=ucs		. #x0126)	; Ä¦
    (latin-iso8859-3	. #xA1)	; øº’·
    ))
(define-char
  '((name		. "fullwidth latin capital letter h with stroke")
    (=>ucs		. #x0126)	; Ä¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0126)
    (->lowercase
     ((name		  . "fullwidth latin small letter h with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ä¦
      ))
    (=jis-x0212		. #x2924)	; ø»Š°ƒ
    (=ks-x1001		. #x2824)	; ø»ˆ¤¡
    (=ucs@jis		. #x0126)	; ø»Š°ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter h with stroke")
      (=jis-x0213-1-2000  . #x2A7D)	; ø»¢¡¦
      (=jis-x0212	  . #x2944)	; ø»Š°£
      (=ks-x1001	  . #x2924)	; ø»ˆ¥¿
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ä¦
      ))
    (=ucs		. #x0127)	; Ä§
    (latin-iso8859-3	. #xB1)	; øº’·‘
    ))
(define-char
  '((name		. "fullwidth latin small letter h with stroke")
    (=>ucs		. #x0127)	; Ä§
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0127)
    (->uppercase
     ((name . "fullwidth latin capital letter h with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; Ä§
      ))
    (=jis-x0213-1-2000	. #x2A7D)	; ø»¢¡¦
    (=jis-x0212		. #x2944)	; ø»Š°£
    (=ks-x1001		. #x2924)	; ø»ˆ¥¿
    (=ucs@jis		. #x0127)	; ø»¢¡¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with tilde")
      (=jis-x0212	  . #x2A47)	; ø»Š²„
      (=jef-china3	  . #x86E5)	; øºˆ›¥
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; Ä©
      ))
    (=ucs		. #x0128)	; Ä¨
    (latin-iso8859-4	. #xA5)	; øº’¸¥
    (latin-viscii	. #xCE)	; øº’ž®
    (latin-viscii-upper . #xEE)	; øº’ž®
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with tilde")
    (=>ucs		. #x0128)	; Ä¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0128)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ä¨
      ))
    (=jis-x0212		. #x2A47)	; ø»Š²„
    (=jef-china3	. #x86E5)	; øºˆ›¥
    (=ucs@jis		. #x0128)	; ø»Š²„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with tilde")
      (=jis-x0212	  . #x2B47)	; ø»Š³¢
      (=ucs@jis		  . #x0129)	; ø»Š³¢
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ä¨
      ))
    (=ucs		. #x0129)	; Ä©
    (latin-tcvn5712	. #xDC)	; øº“šœ
    (latin-iso8859-4	. #xB5)	; øº’¸µ
    (latin-viscii	. #xEE)	; øº’Ž
    (latin-viscii-lower . #xEE)	; øº’Ž
    ))
(define-char
  '((name		. "fullwidth latin small letter i with tilde")
    (=>ucs		. #x0129)	; Ä©
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0129)
    (->uppercase
     ((name . "fullwidth latin capital letter i with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; Ä©
      ))
    (=jis-x0212		. #x2B47)	; ø»Š³¢
    (=ucs@jis		. #x0129)	; ø»Š³¢
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with macron")
      (=jis-x0213-1-2000  . #x2976)	; ø»¢ 
      (=jis-x0212	  . #x2A45)	; ø»Š²‚
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; Ä«
      ))
    (=ucs		. #x012A)	; Äª
    (latin-iso8859-4	. #xCF)	; øº’¹
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with macron")
    (=>ucs		. #x012A)	; Äª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012A)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Äª
      ))
    (=jis-x0213-1-2000	. #x2976)	; ø»¢ 
    (=jis-x0212		. #x2A45)	; ø»Š²‚
    (=jef-china3	. #x87AD)	; øºˆž­
    (=ucs@jis		. #x012A)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with macron")
      (=jis-x0213-1-2000  . #x297B)	; ø»¢ †
      (=jis-x0212	  . #x2B45)	; ø»Š³ 
      (=gb2312		  . #x2829)	; ø»„ž
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Äª
      ))
    (=ucs		. #x012B)	; Ä«
    (latin-iso8859-4	. #xEF)	; øº’¹¯
    ))
(define-char
  '((name		. "fullwidth latin small letter i with macron")
    (=>ucs		. #x012B)	; Ä«
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012B)
    (->uppercase
     ((name . "fullwidth latin capital letter i with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; Ä«
      ))
    (=jis-x0213-1-2000	. #x297B)	; ø»¢ †
    (=jis-x0212		. #x2B45)	; ø»Š³ 
    (=gb2312		. #x2829)	; ø»„ž
    (=ucs@jis		. #x012B)	; ø»¢ †
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH BREVE")
      (=ucs		  . #x012D)	; Ä­
      ))
    (=ucs		. #x012C)	; Ä¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH BREVE")
      (=ucs		  . #x012C)	; Ä¬
      ))
    (=ucs		. #x012D)	; Ä­
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with ogonek")
      (=jis-x0212	  . #x2A46)	; ø»Š²ƒ
      (=jef-china3	  . #x8AA6)	; øºˆª¦
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; Ä¯
      ))
    (=ucs		. #x012E)	; Ä®
    (latin-iso8859-4	. #xC7)	; øº’¹‡
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with ogonek")
    (=>ucs		. #x012E)	; Ä®
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012E)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Ä®
      ))
    (=jis-x0212		. #x2A46)	; ø»Š²ƒ
    (=jef-china3	. #x8AA6)	; øºˆª¦
    (=ucs@jis		. #x012E)	; ø»Š²ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with ogonek")
      (=jis-x0212	  . #x2B46)	; ø»Š³¡
      (=jef-china3	  . #x8AAE)	; øºˆª®
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Ä®
      ))
    (=ucs		. #x012F)	; Ä¯
    (latin-iso8859-4	. #xE7)	; øº’¹§
    ))
(define-char
  '((name		. "fullwidth latin small letter i with ogonek")
    (=>ucs		. #x012F)	; Ä¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012F)
    (->uppercase
     ((name . "fullwidth latin capital letter i with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; Ä¯
      ))
    (=jis-x0212		. #x2B46)	; ø»Š³¡
    (=jef-china3	. #x8AAE)	; øºˆª®
    (=ucs@jis		. #x012F)	; ø»Š³¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with dot above")
      (=jis-x0212	  . #x2A44)	; ø»Š²
      (=jef-china3	  . #x88A2)	; øºˆ¢¢
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    (=ucs		. #x0130)	; Ä°
    (latin-iso8859-9	. #xDD)	; øº“†½
    (latin-iso8859-3	. #xA9)	; øº’·‰
    ))
(define-char
  '((name . "fullwidth latin capital letter i with dot above")
    (=>ucs		. #x0130)	; Ä°
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0130)
    (->lowercase
     ((name . "fullwidth latin small letter i with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DOT ABOVE")
      (=ucs		  . #x0130)	; Ä°
      ))
    (=jis-x0212		. #x2A44)	; ø»Š²
    (=jef-china3	. #x88A2)	; øºˆ¢¢
    (=ucs@jis		. #x0130)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER DOTLESS I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      ))
    (=ucs		. #x0131)	; Ä±
    (latin-iso8859-9	. #xFD)	; øº“‡
    (latin-iso8859-3	. #xB9)	; øº’·™
    ))
(define-char
  '((name		. "fullwidth latin small letter dotless i")
    (=>ucs		. #x0131)	; Ä±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin capital letter dotless i")
      ))
    (=jis-x0212		. #x2945)	; ø»Š°¤
    (=ks-x1001		. #x2925)	; ø»ˆ¦€
    (=jef-china3	. #x83B3)	; øºˆŽ³
    (=ucs@jis		. #x0131)	; ø»Š°¤
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0049 #x004A)
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; Ä³
      ))
    (=ucs		. #x0132)	; Ä²
    (=jis-x0212		. #x2926)	; ø»Š°…
    (=ks-x1001		. #x2826)	; ø»ˆ¤£
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature ij")
      (=jis-x0212	  . #x2946)	; ø»Š°¥
      (=ks-x1001	  . #x2926)	; ø»ˆ¦
      (=ucs@jis		  . #x0133)	; ø»Š°¥
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ä²
      ))
    (=ucs		. #x0133)	; Ä³
    ))
(define-char
  '((name		. "fullwidth latin small ligature ij")
    (=>ucs		. #x0133)	; Ä³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0133)
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ä²
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; Ä³
      ))
    (=jis-x0212		. #x2946)	; ø»Š°¥
    (=ks-x1001		. #x2926)	; ø»ˆ¦
    (=ucs@jis		. #x0133)	; ø»Š°¥
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter j with circumflex")
      (=jis-x0213-1-2000  . #x2A5C)	; ø»¢¡…
      (=jis-x0212	  . #x2A48)	; ø»Š²…
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; Äµ
      ))
    (=ucs		. #x0134)	; Ä´
    (latin-iso8859-3	. #xAC)	; øº’·Œ
    ))
(define-char
  '((name . "fullwidth latin capital letter j with circumflex")
    (=>ucs		. #x0134)	; Ä´
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0134)
    (->lowercase
     ((name . "fullwidth latin small letter j with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ä´
      ))
    (=jis-x0213-1-2000	. #x2A5C)	; ø»¢¡…
    (=jis-x0212		. #x2A48)	; ø»Š²…
    (=jef-china3	. #x86BD)	; øºˆš½
    (=ucs@jis		. #x0134)	; ø»¢¡…
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter j with circumflex")
      (=jis-x0213-1-2000  . #x2A62)	; ø»¢¡‹
      (=jis-x0212	  . #x2B48)	; ø»Š³£
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ä´
      ))
    (=ucs		. #x0135)	; Äµ
    (latin-iso8859-3	. #xBC)	; øº’·œ
    ))
(define-char
  '((name . "fullwidth latin small letter j with circumflex")
    (=>ucs		. #x0135)	; Äµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0135)
    (->uppercase
     ((name . "fullwidth latin capital letter j with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; Äµ
      ))
    (=jis-x0213-1-2000	. #x2A62)	; ø»¢¡‹
    (=jis-x0212		. #x2B48)	; ø»Š³£
    (=jef-china3	. #x86CA)	; øºˆ›Š
    (=ucs@jis		. #x0135)	; ø»¢¡‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter k with cedilla")
      (=jis-x0212	  . #x2A49)	; ø»Š²†
      (=ucs@jis		  . #x0136)	; ø»Š²†
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; Ä·
      ))
    (=ucs		. #x0136)	; Ä¶
    (latin-iso8859-4	. #xD3)	; øº’¹“
    ))
(define-char
  '((name . "fullwidth latin capital letter k with cedilla")
    (=>ucs		. #x0136)	; Ä¶
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0136)
    (->lowercase
     ((name . "fullwidth latin small letter k with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ä¶
      ))
    (=jis-x0212		. #x2A49)	; ø»Š²†
    (=ucs@jis		. #x0136)	; ø»Š²†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter k with cedilla")
      (=jis-x0212	  . #x2B49)	; ø»Š³¤
      (=ucs@jis		  . #x0137)	; ø»Š³¤
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ä¶
      ))
    (=ucs		. #x0137)	; Ä·
    (latin-iso8859-4	. #xF3)	; øº’¹³
    ))
(define-char
  '((name		. "fullwidth latin small letter k with cedilla")
    (=>ucs		. #x0137)	; Ä·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0137)
    (->uppercase
     ((name . "fullwidth latin capital letter k with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; Ä·
      ))
    (=jis-x0212		. #x2B49)	; ø»Š³¤
    (=ucs@jis		. #x0137)	; ø»Š³¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->fullwidth
     ((name		  . "fullwidth latin small letter kra")
      (=jis-x0212	  . #x2947)	; ø»Š°¦
      (=ks-x1001	  . #x2927)	; ø»ˆ¦‚
      (=ucs@jis		  . #x0138)	; ø»Š°¦
      ))
    (=ucs		. #x0138)	; Ä¸
    (latin-iso8859-4	. #xA2)	; øº’¸¢
    ))
(define-char
  '((name		. "fullwidth latin small letter kra")
    (=>ucs		. #x0138)	; Ä¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->decomposition	wide #x0138)
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER KRA")
      (=ucs		  . #x0138)	; Ä¸
      ))
    (=jis-x0212		. #x2947)	; ø»Š°¦
    (=ks-x1001		. #x2927)	; ø»ˆ¦‚
    (=ucs@jis		. #x0138)	; ø»Š°¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with acute")
      (=jis-x0213-1-2000  . #x2A3B)	; ø»¢ ¤
      (=jis-x0212	  . #x2A4A)	; ø»Š²‡
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; Äº
      ))
    (=ucs		. #x0139)	; Ä¹
    (latin-iso8859-2	. #xC5)	; øº’¶…
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with acute")
    (=>ucs		. #x0139)	; Ä¹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0139)
    (->lowercase
     ((name		  . "fullwidth latin small letter l with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ä¹
      ))
    (=jis-x0213-1-2000	. #x2A3B)	; ø»¢ ¤
    (=jis-x0212		. #x2A4A)	; ø»Š²‡
    (=jef-china3	. #x85DD)	; øºˆ—
    (=ucs@jis		. #x0139)	; ø»¢ ¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with acute")
      (=jis-x0213-1-2000  . #x2A4A)	; ø»¢ ³
      (=jis-x0212	  . #x2B4A)	; ø»Š³¥
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ä¹
      ))
    (=ucs		. #x013A)	; Äº
    (latin-iso8859-2	. #xE5)	; øº’¶¥
    ))
(define-char
  '((name		. "fullwidth latin small letter l with acute")
    (=>ucs		. #x013A)	; Äº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013A)
    (->uppercase
     ((name . "fullwidth latin capital letter l with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; Äº
      ))
    (=jis-x0213-1-2000	. #x2A4A)	; ø»¢ ³
    (=jis-x0212		. #x2B4A)	; ø»Š³¥
    (=jef-china3	. #x85F3)	; øºˆ—³
    (=ucs@jis		. #x013A)	; ø»¢ ³
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with cedilla")
      (=jis-x0212	  . #x2A4C)	; ø»Š²‰
      (=jef-china3	  . #x89F8)	; øºˆ§¸
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; Ä¼
      ))
    (=ucs		. #x013B)	; Ä»
    (latin-iso8859-4	. #xA6)	; øº’¸¦
    ))
(define-char
  '((name . "fullwidth latin capital letter l with cedilla")
    (=>ucs		. #x013B)	; Ä»
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013B)
    (->lowercase
     ((name . "fullwidth latin capital letter l with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ä»
      ))
    (=jis-x0212		. #x2A4C)	; ø»Š²‰
    (=jef-china3	. #x89F8)	; øºˆ§¸
    (=ucs@jis		. #x013B)	; ø»Š²‰
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter l with cedilla")
      (=jis-x0212	  . #x2B4C)	; ø»Š³§
      (=jef-china3	  . #x89FE)	; øºˆ§¾
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ä»
      ))
    (=ucs		. #x013C)	; Ä¼
    (latin-iso8859-4	. #xB6)	; øº’¸¶
    ))
(define-char
  '((name		. "fullwidth latin small letter l with cedilla")
    (=>ucs		. #x013C)	; Ä¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013C)
    (->uppercase
     ((name . "fullwidth latin capital letter l with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; Ä¼
      ))
    (=jis-x0212		. #x2B4C)	; ø»Š³§
    (=jef-china3	. #x89FE)	; øºˆ§¾
    (=ucs@jis		. #x013C)	; ø»Š³§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with caron")
      (=jis-x0213-1-2000  . #x2A24)	; ø»¢ 
      (=jis-x0212	  . #x2A4B)	; ø»Š²ˆ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; Ä¾
      ))
    (=ucs		. #x013D)	; Ä½
    (latin-iso8859-2	. #xA5)	; øº’µ¥
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with caron")
    (=>ucs		. #x013D)	; Ä½
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013D)
    (->lowercase
     ((name		  . "fullwidth latin small letter l with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ä½
      ))
    (=jis-x0213-1-2000	. #x2A24)	; ø»¢ 
    (=jis-x0212		. #x2A4B)	; ø»Š²ˆ
    (=jef-china3	. #x88E6)	; øºˆ£¦
    (=ucs@jis		. #x013D)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with caron")
      (=jis-x0213-1-2000  . #x2A2F)	; ø»¢ ˜
      (=jis-x0212	  . #x2B4B)	; ø»Š³¦
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ä½
      ))
    (=ucs		. #x013E)	; Ä¾
    (latin-iso8859-2	. #xB5)	; øº’µµ
    ))
(define-char
  '((name		. "fullwidth latin small letter l with caron")
    (=>ucs		. #x013E)	; Ä¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013E)
    (->uppercase
     ((name . "fullwidth latin capital letter l with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; Ä¾
      ))
    (=jis-x0213-1-2000	. #x2A2F)	; ø»¢ ˜
    (=jis-x0212		. #x2B4B)	; ø»Š³¦
    (=jef-china3	. #x88F5)	; øºˆ£µ
    (=ucs@jis		. #x013E)	; ø»¢ ˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with middle dot")
      (=jis-x0212	  . #x2929)	; ø»Š°ˆ
      (=ks-x1001	  . #x2828)	; ø»ˆ¤¥
      (=ucs@jis		  . #x013F)	; ø»Š°ˆ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; Å€
      ))
    (=ucs		. #x013F)	; Ä¿
    ))
(define-char
  '((name . "fullwidth latin capital letter l with middle dot")
    (=>ucs		. #x013F)	; Ä¿
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013F)
    (->lowercase
     ((name . "fullwidth latin small letter l with middle dot")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ä¿
      ))
    (=jis-x0212		. #x2929)	; ø»Š°ˆ
    (=ks-x1001		. #x2828)	; ø»ˆ¤¥
    (=ucs@jis		. #x013F)	; ø»Š°ˆ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin small letter l with middle dot")
      (=jis-x0212	  . #x2949)	; ø»Š°¨
      (=ks-x1001	  . #x2928)	; ø»ˆ¦ƒ
      (=ucs@jis		  . #x0140)	; ø»Š°¨
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ä¿
      ))
    (=ucs		. #x0140)	; Å€
    ))
(define-char
  '((name . "fullwidth latin small letter l with middle dot")
    (=>ucs		. #x0140)	; Å€
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0140)
    (->uppercase
     ((name . "fullwidth latin capital letter l with middle dot")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; Å€
      ))
    (=jis-x0212		. #x2949)	; ø»Š°¨
    (=ks-x1001		. #x2928)	; ø»ˆ¦ƒ
    (=ucs@jis		. #x0140)	; ø»Š°¨
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with stroke")
      (=jis-x0213-1-2000  . #x2A23)	; ø»¢ Œ
      (=jis-x0212	  . #x2928)	; ø»Š°‡
      (=ks-x1001	  . #x2829)	; ø»ˆ¤¦
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; Å‚
      ))
    (=ucs		. #x0141)	; Å
    (latin-iso8859-2	. #xA3)	; øº’µ£
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with stroke")
    (=>ucs		. #x0141)	; Å
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0141)
    (->lowercase
     ((name		  . "fullwidth latin small letter l with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Å
      ))
    (=jis-x0213-1-2000	. #x2A23)	; ø»¢ Œ
    (=jis-x0212		. #x2928)	; ø»Š°‡
    (=ks-x1001		. #x2829)	; ø»ˆ¤¦
    (=jef-china3	. #x83A1)	; øºˆŽ¡
    (=ucs@jis		. #x0141)	; ø»¢ Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with stroke")
      (=jis-x0213-1-2000  . #x2A2E)	; ø»¢ —
      (=jis-x0212	  . #x2948)	; ø»Š°§
      (=ks-x1001	  . #x2929)	; ø»ˆ¦„
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Å
      ))
    (=ucs		. #x0142)	; Å‚
    (latin-iso8859-2	. #xB3)	; øº’µ³
    ))
(define-char
  '((=>ucs		. #x0142)	; Å‚
    (=jef-china3	. #x83AC)	; øºˆŽ¬
    ))
(define-char
  '((name		. "fullwidth latin small letter l with stroke")
    (=>ucs		. #x0142)	; Å‚
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0142)
    (->uppercase
     ((name . "fullwidth latin capital letter l with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; Å‚
      ))
    (=jis-x0213-1-2000	. #x2A2E)	; ø»¢ —
    (=jis-x0212		. #x2948)	; ø»Š°§
    (=ks-x1001		. #x2929)	; ø»ˆ¦„
    (=ucs@jis		. #x0142)	; ø»¢ —
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with acute")
      (=jis-x0213-1-2000  . #x2A41)	; ø»¢ ª
      (=jis-x0212	  . #x2A4D)	; ø»Š²Š
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; Å„
      ))
    (=ucs		. #x0143)	; Åƒ
    (latin-iso8859-2	. #xD1)	; øº’¶‘
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with acute")
    (=>ucs		. #x0143)	; Åƒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0143)
    (->lowercase
     ((name		  . "fullwidth latin small letter n with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Åƒ
      ))
    (=jis-x0213-1-2000	. #x2A41)	; ø»¢ ª
    (=jis-x0212		. #x2A4D)	; ø»Š²Š
    (=jef-china3	. #x85DF)	; øºˆ—Ÿ
    (=ucs@jis		. #x0143)	; ø»¢ ª
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with acute")
      (=jis-x0213-1-2000  . #x2A51)	; ø»¢ º
      (=jis-x0212	  . #x2B4D)	; ø»Š³¨
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Åƒ
      ))
    (=ucs		. #x0144)	; Å„
    (latin-iso8859-2	. #xF1)	; øº’¶±
    ))
(define-char
  '((name		. "fullwidth latin small letter n with acute")
    (=>ucs		. #x0144)	; Å„
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0144)
    (->uppercase
     ((name . "fullwidth latin capital letter n with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; Å„
      ))
    (=jis-x0213-1-2000	. #x2A51)	; ø»¢ º
    (=jis-x0212		. #x2B4D)	; ø»Š³¨
    (=jef-china3	. #x85F5)	; øºˆ—µ
    (=ucs@jis		. #x0144)	; ø»¢ º
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with cedilla")
      (=jis-x0212	  . #x2A4F)	; ø»Š²Œ
      (=jef-china3	  . #x89F9)	; øºˆ§¹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; Å†
      ))
    (=ucs		. #x0145)	; Å…
    (latin-iso8859-4	. #xD1)	; øº’¹‘
    ))
(define-char
  '((name . "fullwidth latin capital letter n with cedilla")
    (=>ucs		. #x0145)	; Å…
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0145)
    (->lowercase
     ((name . "fullwidth latin small letter n with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Å…
      ))
    (=jis-x0212		. #x2A4F)	; ø»Š²Œ
    (=jef-china3	. #x89F9)	; øºˆ§¹
    (=ucs@jis		. #x0145)	; ø»Š²Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter n with cedilla")
      (=jis-x0212	  . #x2B4F)	; ø»Š³ª
      (=jef-china3	  . #x8AA1)	; øºˆª¡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Å…
      ))
    (=ucs		. #x0146)	; Å†
    (latin-iso8859-4	. #xF1)	; øº’¹±
    ))
(define-char
  '((name		. "fullwidth latin small letter n with cedilla")
    (=>ucs		. #x0146)	; Å†
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0146)
    (->uppercase
     ((name . "fullwidth latin capital letter n with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; Å†
      ))
    (=jis-x0212		. #x2B4F)	; ø»Š³ª
    (=jef-china3	. #x8AA1)	; øºˆª¡
    (=ucs@jis		. #x0146)	; ø»Š³ª
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with caron")
      (=jis-x0213-1-2000  . #x2A42)	; ø»¢ «
      (=jis-x0212	  . #x2A4E)	; ø»Š²‹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; Åˆ
      ))
    (=ucs		. #x0147)	; Å‡
    (latin-iso8859-2	. #xD2)	; øº’¶’
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with caron")
    (=>ucs		. #x0147)	; Å‡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0147)
    (->lowercase
     ((name		  . "fullwidth latin small letter n with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Å‡
      ))
    (=jis-x0213-1-2000	. #x2A42)	; ø»¢ «
    (=jis-x0212		. #x2A4E)	; ø»Š²‹
    (=jef-china3	. #x88E7)	; øºˆ£§
    (=ucs@jis		. #x0147)	; ø»¢ «
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with caron")
      (=jis-x0213-1-2000  . #x2A52)	; ø»¢ »
      (=jis-x0212	  . #x2B4E)	; ø»Š³©
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Å‡
      ))
    (=ucs		. #x0148)	; Åˆ
    (latin-iso8859-2	. #xF2)	; øº’¶²
    ))
(define-char
  '((name		. "fullwidth latin small letter n with caron")
    (=>ucs		. #x0148)	; Åˆ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0148)
    (->uppercase
     ((name . "fullwidth latin capital letter n with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; Åˆ
      ))
    (=jis-x0213-1-2000	. #x2A52)	; ø»¢ »
    (=jis-x0212		. #x2B4E)	; ø»Š³©
    (=jef-china3	. #x88F6)	; øºˆ£¶
    (=ucs@jis		. #x0148)	; ø»¢ »
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    (->fullwidth
     ((name . "fullwidth latin small letter n preceded by apostrophe")
      (=jis-x0212	  . #x294A)	; ø»Š°©
      (=ks-x1001	  . #x2930)	; ø»ˆ¦‹
      (=ucs@jis		  . #x0149)	; ø»Š°©
      ))
    (=ucs		. #x0149)	; Å‰
    ))
(define-char
  '((name . "fullwidth latin small letter n preceded by apostrophe")
    (=>ucs		. #x0149)	; Å‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0149)
    (<-fullwidth
     ((name . "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
      (=ucs		  . #x0149)	; Å‰
      ))
    (=jis-x0212		. #x294A)	; ø»Š°©
    (=ks-x1001		. #x2930)	; ø»ˆ¦‹
    (=ucs@jis		. #x0149)	; ø»Š°©
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter eng")
      (=jis-x0212	  . #x292B)	; ø»Š°Š
      (=ks-x1001	  . #x282F)	; ø»ˆ¤¬
      (=ucs@jis		  . #x014A)	; ø»Š°Š
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; Å‹
      ))
    (=ucs		. #x014A)	; ÅŠ
    (latin-iso8859-4	. #xBD)	; øº’¸½
    ))
(define-char
  '((name		. "fullwidth latin capital letter eng")
    (=>ucs		. #x014A)	; ÅŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->decomposition	wide #x014A)
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER ENG")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; ÅŠ
      ))
    (=jis-x0212		. #x292B)	; ø»Š°Š
    (=ks-x1001		. #x282F)	; ø»ˆ¤¬
    (=ucs@jis		. #x014A)	; ø»Š°Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin small letter eng")
      (=jis-x0213-1-2000  . #x2A7A)	; ø»¢¡£
      (=jis-x0212	  . #x294B)	; ø»Š°ª
      (=ks-x1001	  . #x292F)	; ø»ˆ¦Š
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; ÅŠ
      ))
    (=ucs		. #x014B)	; Å‹
    (latin-iso8859-4	. #xBF)	; øº’¸¿
    (ipa		. #xD5)	; øº’›•
    ))
(define-char
  '((name		. "fullwidth latin small letter eng")
    (=>ucs		. #x014B)	; Å‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->decomposition	wide #x014B)
    (->uppercase
     ((name		  . "fullwidth latin capital letter eng")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; Å‹
      ))
    (=jis-x0213-1-2000	. #x2A7A)	; ø»¢¡£
    (=jis-x0212		. #x294B)	; ø»Š°ª
    (=ks-x1001		. #x292F)	; ø»ˆ¦Š
    (=ucs@jis		. #x014B)	; ø»¢¡£
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with macron")
      (=jis-x0213-1-2000  . #x2979)	; ø»¢ „
      (=jis-x0212	  . #x2A57)	; ø»Š²”
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; Å
      ))
    (=ucs		. #x014C)	; ÅŒ
    (latin-iso8859-4	. #xD2)	; øº’¹’
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with macron")
    (=>ucs		. #x014C)	; ÅŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014C)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; ÅŒ
      ))
    (=jis-x0213-1-2000	. #x2979)	; ø»¢ „
    (=jis-x0212		. #x2A57)	; ø»Š²”
    (=jef-china3	. #x87B3)	; øºˆž³
    (=ucs@jis		. #x014C)	; ø»¢ „
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with macron")
      (=jis-x0213-1-2000  . #x297E)	; ø»¢ ‰
      (=jis-x0212	  . #x2B57)	; ø»Š³²
      (=gb2312		  . #x282D)	; ø»„¢
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; ÅŒ
      ))
    (=ucs		. #x014D)	; Å
    (latin-iso8859-4	. #xF2)	; øº’¹²
    ))
(define-char
  '((name		. "fullwidth latin small letter o with macron")
    (=>ucs		. #x014D)	; Å
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014D)
    (->uppercase
     ((name . "fullwidth latin capital letter o with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; Å
      ))
    (=jis-x0213-1-2000	. #x297E)	; ø»¢ ‰
    (=jis-x0212		. #x2B57)	; ø»Š³²
    (=gb2312		. #x282D)	; ø»„¢
    (=jef-china3	. #x87C7)	; øºˆŸ‡
    (=ucs@jis		. #x014D)	; ø»¢ ‰
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH BREVE")
      (=ucs		  . #x014F)	; Å
      ))
    (=ucs		. #x014E)	; ÅŽ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH BREVE")
      (=ucs		  . #x014E)	; ÅŽ
      ))
    (=ucs		. #x014F)	; Å
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with double acute")
      (=jis-x0213-1-2000  . #x2A43)	; ø»¢ ¬
      (=jis-x0212	  . #x2A56)	; ø»Š²“
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; Å‘
      ))
    (=ucs		. #x0150)	; Å
    (latin-iso8859-2	. #xD5)	; øº’¶•
    ))
(define-char
  '((name . "fullwidth latin capital letter o with double acute")
    (=>ucs		. #x0150)	; Å
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0150)
    (->lowercase
     ((name . "fullwidth latin small letter o with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Å
      ))
    (=jis-x0213-1-2000	. #x2A43)	; ø»¢ ¬
    (=jis-x0212		. #x2A56)	; ø»Š²“
    (=jef-china3	. #x89E2)	; øºˆ§¢
    (=ucs@jis		. #x0150)	; ø»¢ ¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter o with double acute")
      (=jis-x0213-1-2000  . #x2A53)	; ø»¢ ¼
      (=jis-x0212	  . #x2B56)	; ø»Š³±
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Å
      ))
    (=ucs		. #x0151)	; Å‘
    (latin-iso8859-2	. #xF5)	; øº’¶µ
    ))
(define-char
  '((name . "fullwidth latin small letter o with double acute")
    (=>ucs		. #x0151)	; Å‘
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0151)
    (->uppercase
     ((name . "fullwidth latin capital letter o with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; Å‘
      ))
    (=jis-x0213-1-2000	. #x2A53)	; ø»¢ ¼
    (=jis-x0212		. #x2B56)	; ø»Š³±
    (=jef-china3	. #x89E5)	; øºˆ§¥
    (=ucs@jis		. #x0151)	; ø»¢ ¼
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; Å“
      ))
    (=ucs		. #x0152)	; Å’
    (=jis-x0213-1-2000	. #x2B2B)	; ø»¢¡²
    (=jis-x0212		. #x292D)	; ø»Š°Œ
    (=ks-x1001		. #x282B)	; ø»ˆ¤¨
    (=jef-china3	. #x83A6)	; øºˆŽ¦
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature oe")
      (=jis-x0213-1-2000  . #x2B2A)	; ø»¢¡±
      (=jis-x0212	  . #x294D)	; ø»Š°¬
      (=ks-x1001	  . #x292B)	; ø»ˆ¦†
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Å’
      ))
    (=ucs		. #x0153)	; Å“
    (ipa		. #xB0)	; øº’š°
    ))
(define-char
  '((name		. "fullwidth latin small ligature oe")
    (=>ucs		. #x0153)	; Å“
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0153)
    (->uppercase
     ((name		  . "fullwidth latin capital ligature oe")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; Å“
      ))
    (=jis-x0213-1-2000	. #x2B2A)	; ø»¢¡±
    (=jis-x0212		. #x294D)	; ø»Š°¬
    (=ks-x1001		. #x292B)	; ø»ˆ¦†
    (=jef-china3	. #x83B1)	; øºˆŽ±
    (=ucs@jis		. #x0153)	; ø»¢¡±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with acute")
      (=jis-x0213-1-2000  . #x2A39)	; ø»¢ ¢
      (=jis-x0212	  . #x2A59)	; ø»Š²–
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; Å•
      ))
    (=ucs		. #x0154)	; Å”
    (latin-iso8859-2	. #xC0)	; øº’¶€
    ))
(define-char
  '((name		. "fullwidth latin capital letter r with acute")
    (=>ucs		. #x0154)	; Å”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0154)
    (->lowercase
     ((name		  . "fullwidth latin small letter r with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Å”
      ))
    (=jis-x0213-1-2000	. #x2A39)	; ø»¢ ¢
    (=jis-x0212		. #x2A59)	; ø»Š²–
    (=jef-china3	. #x85E3)	; øºˆ—£
    (=ucs@jis		. #x0154)	; ø»¢ ¢
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with acute")
      (=jis-x0213-1-2000  . #x2A48)	; ø»¢ ±
      (=jis-x0212	  . #x2B59)	; ø»Š³´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Å”
      ))
    (=ucs		. #x0155)	; Å•
    (latin-iso8859-2	. #xE0)	; øº’¶ 
    ))
(define-char
  '((name		. "fullwidth latin small letter r with acute")
    (=>ucs		. #x0155)	; Å•
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0155)
    (->uppercase
     ((name . "fullwidth latin capital letter r with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; Å•
      ))
    (=jis-x0213-1-2000	. #x2A48)	; ø»¢ ±
    (=jis-x0212		. #x2B59)	; ø»Š³´
    (=jef-china3	. #x85F9)	; øºˆ—¹
    (=ucs@jis		. #x0155)	; ø»¢ ±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with cedilla")
      (=jis-x0212	  . #x2A5B)	; ø»Š²˜
      (=ucs@jis		  . #x0156)	; ø»Š²˜
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; Å—
      ))
    (=ucs		. #x0156)	; Å–
    (latin-iso8859-4	. #xA3)	; øº’¸£
    ))
(define-char
  '((name . "fullwidth latin capital letter r with cedilla")
    (=>ucs		. #x0156)	; Å–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0156)
    (->lowercase
     ((name . "fullwidth latin small letter r with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Å–
      ))
    (=jis-x0212		. #x2A5B)	; ø»Š²˜
    (=ucs@jis		. #x0156)	; ø»Š²˜
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter r with cedilla")
      (=jis-x0212	  . #x2B5B)	; ø»Š³¶
      (=ucs@jis		  . #x0157)	; ø»Š³¶
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Å–
      ))
    (=ucs		. #x0157)	; Å—
    (latin-iso8859-4	. #xB3)	; øº’¸³
    ))
(define-char
  '((name		. "fullwidth latin small letter r with cedilla")
    (=>ucs		. #x0157)	; Å—
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0157)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; Å—
      ))
    (=jis-x0212		. #x2B5B)	; ø»Š³¶
    (=ucs@jis		. #x0157)	; ø»Š³¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with caron")
      (=jis-x0213-1-2000  . #x2A44)	; ø»¢ ­
      (=jis-x0212	  . #x2A5A)	; ø»Š²—
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; Å™
      ))
    (=ucs		. #x0158)	; Å˜
    (latin-iso8859-2	. #xD8)	; øº’¶˜
    ))
(define-char
  '((name		. "fullwidth latin capital letter r with caron")
    (=>ucs		. #x0158)	; Å˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0158)
    (->lowercase
     ((name		  . "fullwidth latin small letter r with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Å˜
      ))
    (=jis-x0213-1-2000	. #x2A44)	; ø»¢ ­
    (=jis-x0212		. #x2A5A)	; ø»Š²—
    (=jef-china3	. #x88E9)	; øºˆ£©
    (=ucs@jis		. #x0158)	; ø»¢ ­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with caron")
      (=jis-x0213-1-2000  . #x2A54)	; ø»¢ ½
      (=jis-x0212	  . #x2B5A)	; ø»Š³µ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Å˜
      ))
    (=ucs		. #x0159)	; Å™
    (latin-iso8859-2	. #xF8)	; øº’¶¸
    ))
(define-char
  '((name		. "fullwidth latin small letter r with caron")
    (=>ucs		. #x0159)	; Å™
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0159)
    (->uppercase
     ((name . "fullwidth latin capital letter r with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; Å™
      ))
    (=jis-x0213-1-2000	. #x2A54)	; ø»¢ ½
    (=jis-x0212		. #x2B5A)	; ø»Š³µ
    (=jef-china3	. #x88F8)	; øºˆ£¸
    (=ucs@jis		. #x0159)	; ø»¢ ½
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with acute")
      (=jis-x0213-1-2000  . #x2A25)	; ø»¢ Ž
      (=jis-x0212	  . #x2A5C)	; ø»Š²™
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; Å›
      ))
    (=ucs		. #x015A)	; Åš
    (latin-iso8859-2	. #xA6)	; øº’µ¦
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with acute")
    (=>ucs		. #x015A)	; Åš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015A)
    (->lowercase
     ((name		  . "fullwidth latin small letter s with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Åš
      ))
    (=jis-x0213-1-2000	. #x2A25)	; ø»¢ Ž
    (=jis-x0212		. #x2A5C)	; ø»Š²™
    (=jef-china3	. #x85E4)	; øºˆ—¤
    (=ucs@jis		. #x015A)	; ø»¢ Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with acute")
      (=jis-x0212	  . #x2B5C)	; ø»Š³·
      (=jef-china3	  . #x85FA)	; øºˆ—º
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Åš
      ))
    (=ucs		. #x015B)	; Å›
    (=jis-x0213-1-2000	. #x2A30)	; ø»¢ ™
    (latin-iso8859-2	. #xB6)	; øº’µ¶
    ))
(define-char
  '((name		. "fullwidth latin small letter s with acute")
    (=>ucs		. #x015B)	; Å›
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; Å›
      ))
    (=jis-x0212		. #x2B5C)	; ø»Š³·
    (=jef-china3	. #x85FA)	; øºˆ—º
    (=ucs@jis		. #x015B)	; ø»Š³·
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with circumflex")
      (=jis-x0213-1-2000  . #x2A5D)	; ø»¢¡†
      (=jis-x0212	  . #x2A5D)	; ø»Š²š
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; Å
      ))
    (=ucs		. #x015C)	; Åœ
    (latin-iso8859-3	. #xDE)	; øº’·¾
    ))
(define-char
  '((name . "fullwidth latin capital letter s with circumflex")
    (=>ucs		. #x015C)	; Åœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015C)
    (->lowercase
     ((name . "fullwidth latin small letter s with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Åœ
      ))
    (=jis-x0213-1-2000	. #x2A5D)	; ø»¢¡†
    (=jis-x0212		. #x2A5D)	; ø»Š²š
    (=jef-china3	. #x86C0)	; øºˆ›€
    (=ucs@jis		. #x015C)	; ø»¢¡†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter s with circumflex")
      (=jis-x0213-1-2000  . #x2A63)	; ø»¢¡Œ
      (=jis-x0212	  . #x2B5D)	; ø»Š³¸
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Åœ
      ))
    (=ucs		. #x015D)	; Å
    (latin-iso8859-3	. #xFE)	; øº’¸ž
    ))
(define-char
  '((name . "fullwidth latin small letter s with circumflex")
    (=>ucs		. #x015D)	; Å
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015D)
    (->uppercase
     ((name . "fullwidth latin capital letter s with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; Å
      ))
    (=jis-x0213-1-2000	. #x2A63)	; ø»¢¡Œ
    (=jis-x0212		. #x2B5D)	; ø»Š³¸
    (=jef-china3	. #x86CD)	; øºˆ›
    (=ucs@jis		. #x015D)	; ø»¢¡Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with cedilla")
      (=jis-x0213-1-2000  . #x2A27)	; ø»¢ 
      (=jis-x0212	  . #x2A5F)	; ø»Š²œ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ÅŸ
      ))
    (=ucs		. #x015E)	; Åž
    (latin-iso8859-9	. #xDE)	; øº“†¾
    (latin-iso8859-3	. #xAA)	; øº’·Š
    (latin-iso8859-2	. #xAA)	; øº’µª
    ))
(define-char
  '((=>ucs		. #x015E)	; Åž
    (=jef-china3	. #x8BCB)	; øºˆ¯‹
    ))
(define-char
  '((name . "fullwidth latin capital letter s with cedilla")
    (=>ucs		. #x015E)	; Åž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015E)
    (->lowercase
     ((name . "fullwidth latin small letter s with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Åž
      ))
    (=jis-x0213-1-2000	. #x2A27)	; ø»¢ 
    (=jis-x0212		. #x2A5F)	; ø»Š²œ
    (=jef-china3	. #x89FA)	; øºˆ§º
    (=ucs@jis		. #x015E)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter s with cedilla")
      (=jis-x0213-1-2000  . #x2A33)	; ø»¢ œ
      (=jis-x0212	  . #x2B5F)	; ø»Š³º
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Åž
      ))
    (=ucs		. #x015F)	; ÅŸ
    (latin-iso8859-9	. #xFE)	; øº“‡ž
    (latin-iso8859-3	. #xBA)	; øº’·š
    (latin-iso8859-2	. #xBA)	; øº’µº
    ))
(define-char
  '((name		. "fullwidth latin small letter s with cedilla")
    (=>ucs		. #x015F)	; ÅŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015F)
    (->uppercase
     ((name . "fullwidth latin capital letter s with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ÅŸ
      ))
    (=jis-x0213-1-2000	. #x2A33)	; ø»¢ œ
    (=jis-x0212		. #x2B5F)	; ø»Š³º
    (=jef-china3	. #x8AA2)	; øºˆª¢
    (=ucs@jis		. #x015F)	; ø»¢ œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with caron")
      (=jis-x0213-1-2000  . #x2A26)	; ø»¢ 
      (=jis-x0212	  . #x2A5E)	; ø»Š²›
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; Å¡
      ))
    (=ucs		. #x0160)	; Å 
    (latin-iso8859-4	. #xA9)	; øº’¸©
    (latin-iso8859-2	. #xA9)	; øº’µ©
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with caron")
    (=>ucs		. #x0160)	; Å 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0160)
    (->lowercase
     ((name		  . "fullwidth latin small letter s with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Å 
      ))
    (=jis-x0213-1-2000	. #x2A26)	; ø»¢ 
    (=jis-x0212		. #x2A5E)	; ø»Š²›
    (=jef-china3	. #x88EA)	; øºˆ£ª
    (=ucs@jis		. #x0160)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with caron")
      (=jis-x0213-1-2000  . #x2A32)	; ø»¢ ›
      (=jis-x0212	  . #x2B5E)	; ø»Š³¹
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Å 
      ))
    (=ucs		. #x0161)	; Å¡
    (latin-iso8859-4	. #xB9)	; øº’¸¹
    (latin-iso8859-2	. #xB9)	; øº’µ¹
    ))
(define-char
  '((name		. "fullwidth latin small letter s with caron")
    (=>ucs		. #x0161)	; Å¡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0161)
    (->uppercase
     ((name . "fullwidth latin capital letter s with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; Å¡
      ))
    (=jis-x0213-1-2000	. #x2A32)	; ø»¢ ›
    (=jis-x0212		. #x2B5E)	; ø»Š³¹
    (=jef-china3	. #x88F9)	; øºˆ£¹
    (=ucs@jis		. #x0161)	; ø»¢ ›
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with cedilla")
      (=jis-x0213-1-2000  . #x2A47)	; ø»¢ °
      (=jis-x0212	  . #x2A61)	; ø»Š²ž
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; Å£
      ))
    (=ucs		. #x0162)	; Å¢
    (latin-iso8859-2	. #xDE)	; øº’¶ž
    ))
(define-char
  '((name . "fullwidth latin capital letter t with cedilla")
    (=>ucs		. #x0162)	; Å¢
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0162)
    (->lowercase
     ((name . "fullwidth latin small letter t with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Å¢
      ))
    (=jis-x0213-1-2000	. #x2A47)	; ø»¢ °
    (=jis-x0212		. #x2A61)	; ø»Š²ž
    (=jef-china3	. #x8BCC)	; øºˆ¯Œ
    (=ucs@jis		. #x0162)	; ø»¢ °
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter t with cedilla")
      (=jis-x0213-1-2000  . #x2A57)	; ø»¢¡€
      (=jis-x0212	  . #x2B61)	; ø»Š³¼
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Å¢
      ))
    (=ucs		. #x0163)	; Å£
    (latin-iso8859-2	. #xFE)	; øº’¶¾
    ))
(define-char
  '((name		. "fullwidth latin small letter t with cedilla")
    (=>ucs		. #x0163)	; Å£
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0163)
    (->uppercase
     ((name . "fullwidth latin capital letter t with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; Å£
      ))
    (=jis-x0213-1-2000	. #x2A57)	; ø»¢¡€
    (=jis-x0212		. #x2B61)	; ø»Š³¼
    (=ucs@jis		. #x0163)	; ø»¢¡€
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with caron")
      (=jis-x0213-1-2000  . #x2A28)	; ø»¢ ‘
      (=jis-x0212	  . #x2A60)	; ø»Š²
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; Å¥
      ))
    (=ucs		. #x0164)	; Å¤
    (latin-iso8859-2	. #xAB)	; øº’µ«
    ))
(define-char
  '((name		. "fullwidth latin capital letter t with caron")
    (=>ucs		. #x0164)	; Å¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0164)
    (->lowercase
     ((name . "fullwidth latin capital letter t with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Å¤
      ))
    (=jis-x0213-1-2000	. #x2A28)	; ø»¢ ‘
    (=jis-x0212		. #x2A60)	; ø»Š²
    (=jef-china3	. #x88EB)	; øºˆ£«
    (=ucs@jis		. #x0164)	; ø»¢ ‘
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with caron")
      (=jis-x0213-1-2000  . #x2A34)	; ø»¢ 
      (=jis-x0212	  . #x2B60)	; ø»Š³»
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Å¤
      ))
    (=ucs		. #x0165)	; Å¥
    (latin-iso8859-2	. #xBB)	; øº’µ»
    ))
(define-char
  '((name		. "fullwidth latin small letter t with caron")
    (=>ucs		. #x0165)	; Å¥
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0165)
    (->uppercase
     ((name . "fullwidth latin capital letter t with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; Å¥
      ))
    (=jis-x0213-1-2000	. #x2A34)	; ø»¢ 
    (=jis-x0212		. #x2B60)	; ø»Š³»
    (=jef-china3	. #x88FA)	; øºˆ£º
    (=ucs@jis		. #x0165)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with stroke")
      (=jis-x0212	  . #x292F)	; ø»Š°Ž
      (=ks-x1001	  . #x282E)	; ø»ˆ¤«
      (=ucs@jis		  . #x0166)	; ø»Š°Ž
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; Å§
      ))
    (=ucs		. #x0166)	; Å¦
    (latin-iso8859-4	. #xAC)	; øº’¸¬
    ))
(define-char
  '((name		. "fullwidth latin capital letter t with stroke")
    (=>ucs		. #x0166)	; Å¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0166)
    (->lowercase
     ((name		  . "fullwidth latin small letter t with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Å¦
      ))
    (=jis-x0212		. #x292F)	; ø»Š°Ž
    (=ks-x1001		. #x282E)	; ø»ˆ¤«
    (=ucs@jis		. #x0166)	; ø»Š°Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with stroke")
      (=jis-x0212	  . #x294F)	; ø»Š°®
      (=ks-x1001	  . #x292E)	; ø»ˆ¦‰
      (=ucs@jis		  . #x0167)	; ø»Š°®
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Å¦
      ))
    (=ucs		. #x0167)	; Å§
    (latin-iso8859-4	. #xBC)	; øº’¸¼
    ))
(define-char
  '((name		. "fullwidth latin small letter t with stroke")
    (=>ucs		. #x0167)	; Å§
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0167)
    (->uppercase
     ((name . "fullwidth latin capital letter t with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; Å§
      ))
    (=jis-x0212		. #x294F)	; ø»Š°®
    (=ks-x1001		. #x292E)	; ø»ˆ¦‰
    (=ucs@jis		. #x0167)	; ø»Š°®
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with tilde")
      (=jis-x0212	  . #x2A6C)	; ø»Š²©
      (=jef-china3	  . #x86EB)	; øºˆ›«
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; Å©
      ))
    (=ucs		. #x0168)	; Å¨
    (latin-iso8859-4	. #xDD)	; øº’¹
    (latin-viscii	. #x9D)	; øº’ž»
    (latin-viscii-upper . #xFB)	; øº’ž»
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with tilde")
    (=>ucs		. #x0168)	; Å¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0168)
    (->lowercase
     ((name . "fullwidth latin capital letter u with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Å¨
      ))
    (=jis-x0212		. #x2A6C)	; ø»Š²©
    (=jef-china3	. #x86EB)	; øºˆ›«
    (=ucs@jis		. #x0168)	; ø»Š²©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with tilde")
      (=jis-x0212	  . #x2B6C)	; ø»Š´‡
      (=jef-china3	  . #x86F8)	; øºˆ›¸
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Å¨
      ))
    (=ucs		. #x0169)	; Å©
    (latin-tcvn5712	. #xF2)	; øº“š²
    (latin-iso8859-4	. #xFD)	; øº’¹½
    (latin-viscii	. #xFB)	; øº’›
    (latin-viscii-lower . #xFB)	; øº’›
    ))
(define-char
  '((name		. "fullwidth latin small letter u with tilde")
    (=>ucs		. #x0169)	; Å©
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0169)
    (->uppercase
     ((name . "fullwidth latin capital letter u with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; Å©
      ))
    (=jis-x0212		. #x2B6C)	; ø»Š´‡
    (=jef-china3	. #x86F8)	; øºˆ›¸
    (=ucs@jis		. #x0169)	; ø»Š´‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with macron")
      (=jis-x0212	  . #x2A69)	; ø»Š²¦
      (=jef-china3	  . #x87B9)	; øºˆž¹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; Å«
      ))
    (=ucs		. #x016A)	; Åª
    (latin-iso8859-4	. #xDE)	; øº’¹ž
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with macron")
    (=>ucs		. #x016A)	; Åª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016A)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with macron")
      (=jis-x0213-1-2000  . #x297C)	; ø»¢ ‡
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Åª
      ))
    (=jis-x0213-1-2000	. #x2977)	; ø»¢ ‚
    (=jis-x0212		. #x2A69)	; ø»Š²¦
    (=jef-china3	. #x87B9)	; øºˆž¹
    (=ucs@jis		. #x016A)	; ø»¢ ‚
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with macron")
      (=jis-x0213-1-2000  . #x297C)	; ø»¢ ‡
      (=jis-x0212	  . #x2B69)	; ø»Š´„
      (=gb2312		  . #x2831)	; ø»„¦
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Åª
      ))
    (=ucs		. #x016B)	; Å«
    (latin-iso8859-4	. #xFE)	; øº’¹¾
    ))
(define-char
  '((name		. "fullwidth latin small letter u with macron")
    (=>ucs		. #x016B)	; Å«
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016B)
    (->uppercase
     ((name . "fullwidth latin capital letter u with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; Å«
      ))
    (=jis-x0213-1-2000	. #x297C)	; ø»¢ ‡
    (=jis-x0212		. #x2B69)	; ø»Š´„
    (=gb2312		. #x2831)	; ø»„¦
    (=jef-china3	. #x87CD)	; øºˆŸ
    (=ucs@jis		. #x016B)	; ø»¢ ‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with breve")
      (=jis-x0213-1-2000  . #x2A5E)	; ø»¢¡‡
      (=jis-x0212	  . #x2A66)	; ø»Š²£
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; Å­
      ))
    (=ucs		. #x016C)	; Å¬
    (latin-iso8859-3	. #xDD)	; øº’·½
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with breve")
    (=>ucs		. #x016C)	; Å¬
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016C)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Å¬
      ))
    (=jis-x0213-1-2000	. #x2A5E)	; ø»¢¡‡
    (=jis-x0212		. #x2A66)	; ø»Š²£
    (=jef-china3	. #x87E5)	; øºˆŸ¥
    (=ucs@jis		. #x016C)	; ø»¢¡‡
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with breve")
      (=jis-x0213-1-2000  . #x2A64)	; ø»¢¡
      (=jis-x0212	  . #x2B66)	; ø»Š´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Å¬
      ))
    (=ucs		. #x016D)	; Å­
    (latin-iso8859-3	. #xFD)	; øº’¸
    ))
(define-char
  '((name		. "fullwidth latin small letter u with breve")
    (=>ucs		. #x016D)	; Å­
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016D)
    (->uppercase
     ((name . "fullwidth latin capital letter u with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; Å­
      ))
    (=jis-x0213-1-2000	. #x2A64)	; ø»¢¡
    (=jis-x0212		. #x2B66)	; ø»Š´
    (=jef-china3	. #x87EF)	; øºˆŸ¯
    (=ucs@jis		. #x016D)	; ø»¢¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ring above")
      (=jis-x0213-1-2000  . #x2A45)	; ø»¢ ®
      (=jis-x0212	  . #x2A6B)	; ø»Š²¨
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; Å¯
      ))
    (=ucs		. #x016E)	; Å®
    (latin-iso8859-2	. #xD9)	; øº’¶™
    ))
(define-char
  '((name . "fullwidth latin capital letter u with ring above")
    (=>ucs		. #x016E)	; Å®
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016E)
    (->lowercase
     ((name . "fullwidth latin small letter u with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Å®
      ))
    (=jis-x0213-1-2000	. #x2A45)	; ø»¢ ®
    (=jis-x0212		. #x2A6B)	; ø»Š²¨
    (=jef-china3	. #x89A5)	; øºˆ¦¥
    (=ucs@jis		. #x016E)	; ø»¢ ®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->fullwidth
     ((name . "fullwidth latin small letter u with ring above")
      (=jis-x0213-1-2000  . #x2A55)	; ø»¢ ¾
      (=jis-x0212	  . #x2B6B)	; ø»Š´†
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Å®
      ))
    (=ucs		. #x016F)	; Å¯
    (latin-iso8859-2	. #xF9)	; øº’¶¹
    ))
(define-char
  '((name . "fullwidth latin small letter u with ring above")
    (=>ucs		. #x016F)	; Å¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016F)
    (->uppercase
     ((name . "fullwidth latin capital letter u with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; Å¯
      ))
    (=jis-x0213-1-2000	. #x2A55)	; ø»¢ ¾
    (=jis-x0212		. #x2B6B)	; ø»Š´†
    (=jef-china3	. #x89AD)	; øºˆ¦­
    (=ucs@jis		. #x016F)	; ø»¢ ¾
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with double acute")
      (=jis-x0213-1-2000  . #x2A46)	; ø»¢ ¯
      (=jis-x0212	  . #x2A68)	; ø»Š²¥
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; Å±
      ))
    (=ucs		. #x0170)	; Å°
    (latin-iso8859-2	. #xDB)	; øº’¶›
    ))
(define-char
  '((name . "fullwidth latin capital letter u with double acute")
    (=>ucs		. #x0170)	; Å°
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0170)
    (->lowercase
     ((name . "fullwidth latin small letter u with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Å°
      ))
    (=jis-x0213-1-2000	. #x2A46)	; ø»¢ ¯
    (=jis-x0212		. #x2A68)	; ø»Š²¥
    (=jef-china3	. #x89E3)	; øºˆ§£
    (=ucs@jis		. #x0170)	; ø»¢ ¯
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter u with double acute")
      (=jis-x0213-1-2000  . #x2A56)	; ø»¢ ¿
      (=jis-x0212	  . #x2B68)	; ø»Š´ƒ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Å°
      ))
    (=ucs		. #x0171)	; Å±
    (latin-iso8859-2	. #xFB)	; øº’¶»
    ))
(define-char
  '((name . "fullwidth latin small letter u with double acute")
    (=>ucs		. #x0171)	; Å±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0171)
    (->uppercase
     ((name . "fullwidth latin capital letter u with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; Å±
      ))
    (=jis-x0213-1-2000	. #x2A56)	; ø»¢ ¿
    (=jis-x0212		. #x2B68)	; ø»Š´ƒ
    (=jef-china3	. #x89E6)	; øºˆ§¦
    (=ucs@jis		. #x0171)	; ø»¢ ¿
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ogonek")
      (=jis-x0212	  . #x2A6A)	; ø»Š²§
      (=jef-china3	  . #x8AAA)	; øºˆªª
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; Å³
      ))
    (=ucs		. #x0172)	; Å²
    (latin-iso8859-4	. #xD9)	; øº’¹™
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with ogonek")
    (=>ucs		. #x0172)	; Å²
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0172)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Å²
      ))
    (=jis-x0212		. #x2A6A)	; ø»Š²§
    (=jef-china3	. #x8AAA)	; øºˆªª
    (=ucs@jis		. #x0172)	; ø»Š²§
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with ogonek")
      (=jis-x0212	  . #x2B6A)	; ø»Š´…
      (=jef-china3	  . #x8AB2)	; øºˆª²
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Å²
      ))
    (=ucs		. #x0173)	; Å³
    (latin-iso8859-4	. #xF9)	; øº’¹¹
    ))
(define-char
  '((name		. "fullwidth latin small letter u with ogonek")
    (=>ucs		. #x0173)	; Å³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0173)
    (->uppercase
     ((name . "fullwidth latin capital letter u with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; Å³
      ))
    (=jis-x0212		. #x2B6A)	; ø»Š´…
    (=jef-china3	. #x8AB2)	; øºˆª²
    (=ucs@jis		. #x0173)	; ø»Š´…
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter w with circumflex")
      (=jis-x0212	  . #x2A71)	; ø»Š²®
      (=jef-china3	  . #x86C2)	; øºˆ›‚
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; Åµ
      ))
    (=ucs		. #x0174)	; Å´
    ))
(define-char
  '((name . "fullwidth latin capital letter w with circumflex")
    (=>ucs		. #x0174)	; Å´
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0174)
    (->lowercase
     ((name . "fullwidth latin small letter w with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Å´
      ))
    (=jis-x0212		. #x2A71)	; ø»Š²®
    (=jef-china3	. #x86C2)	; øºˆ›‚
    (=ucs@jis		. #x0174)	; ø»Š²®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter w with circumflex")
      (=jis-x0212	  . #x2B71)	; ø»Š´Œ
      (=jef-china3	  . #x86CF)	; øºˆ›
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Å´
      ))
    (=ucs		. #x0175)	; Åµ
    ))
(define-char
  '((name . "fullwidth latin small letter w with circumflex")
    (=>ucs		. #x0175)	; Åµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0175)
    (->uppercase
     ((name . "fullwidth latin capital letter w with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; Åµ
      ))
    (=jis-x0212		. #x2B71)	; ø»Š´Œ
    (=jef-china3	. #x86CF)	; øºˆ›
    (=ucs@jis		. #x0175)	; ø»Š´Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with circumflex")
      (=jis-x0212	  . #x2A74)	; ø»Š²±
      (=jef-china3	  . #x86C3)	; øºˆ›ƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; Å·
      ))
    (=ucs		. #x0176)	; Å¶
    ))
(define-char
  '((name . "fullwidth latin capital letter y with circumflex")
    (=>ucs		. #x0176)	; Å¶
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0176)
    (->lowercase
     ((name . "fullwidth latin small letter y with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Å¶
      ))
    (=jis-x0212		. #x2A74)	; ø»Š²±
    (=jef-china3	. #x86C3)	; øºˆ›ƒ
    (=ucs@jis		. #x0176)	; ø»Š²±
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter y with circumflex")
      (=jis-x0212	  . #x2B74)	; ø»Š´
      (=jef-china3	  . #x86D0)	; øºˆ›
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Å¶
      ))
    (=ucs		. #x0177)	; Å·
    ))
(define-char
  '((name . "fullwidth latin small letter y with circumflex")
    (=>ucs		. #x0177)	; Å·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0177)
    (->uppercase
     ((name . "fullwidth latin capital letter y with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; Å·
      ))
    (=jis-x0212		. #x2B74)	; ø»Š´
    (=jef-china3	. #x86D0)	; øºˆ›
    (=ucs@jis		. #x0177)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with diaeresis")
      (=jis-x0212	  . #x2A73)	; ø»Š²°
      (=ucs@jis		  . #x0178)	; ø»Š²°
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x00FF)	; Ã¿
      ))
    (=ucs		. #x0178)	; Å¸
    ))
(define-char
  '((name . "fullwidth latin capital letter y with diaeresis")
    (=>ucs		. #x0178)	; Å¸
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0178)
    (->lowercase
     ((name . "fullwidth latin small letter y with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Å¸
      ))
    (=jis-x0212		. #x2A73)	; ø»Š²°
    (=ucs@jis		. #x0178)	; ø»Š²°
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with acute")
      (=jis-x0213-1-2000  . #x2A29)	; ø»¢ ’
      (=jis-x0212	  . #x2A75)	; ø»Š²²
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; Åº
      ))
    (=ucs		. #x0179)	; Å¹
    (latin-iso8859-2	. #xAC)	; øº’µ¬
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with acute")
    (=>ucs		. #x0179)	; Å¹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0179)
    (->lowercase
     ((name		  . "fullwidth latin small letter z with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Å¹
      ))
    (=jis-x0213-1-2000	. #x2A29)	; ø»¢ ’
    (=jis-x0212		. #x2A75)	; ø»Š²²
    (=jef-china3	. #x85EA)	; øºˆ—ª
    (=ucs@jis		. #x0179)	; ø»¢ ’
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with acute")
      (=jis-x0213-1-2000  . #x2A35)	; ø»¢ ž
      (=jis-x0212	  . #x2B75)	; ø»Š´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Å¹
      ))
    (=ucs		. #x017A)	; Åº
    (latin-iso8859-2	. #xBC)	; øº’µ¼
    ))
(define-char
  '((name		. "fullwidth latin small letter z with acute")
    (=>ucs		. #x017A)	; Åº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017A)
    (->uppercase
     ((name . "fullwidth latin capital letter z with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; Åº
      ))
    (=jis-x0213-1-2000	. #x2A35)	; ø»¢ ž
    (=jis-x0212		. #x2B75)	; ø»Š´
    (=jef-china3	. #x86A2)	; øºˆš¢
    (=ucs@jis		. #x017A)	; ø»¢ ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with dot above")
      (=jis-x0213-1-2000  . #x2A2B)	; ø»¢ ”
      (=jis-x0212	  . #x2A77)	; ø»Š²´
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; Å¼
      ))
    (=ucs		. #x017B)	; Å»
    (latin-iso8859-3	. #xAF)	; øº’·
    (latin-iso8859-2	. #xAF)	; øº’µ¯
    ))
(define-char
  '((name . "fullwidth latin capital letter z with dot above")
    (=>ucs		. #x017B)	; Å»
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017B)
    (->lowercase
     ((name . "fullwidth latin small letter z with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Å»
      ))
    (=jis-x0213-1-2000	. #x2A2B)	; ø»¢ ”
    (=jis-x0212		. #x2A77)	; ø»Š²´
    (=jef-china3	. #x88AF)	; øºˆ¢¯
    (=ucs@jis		. #x017B)	; ø»¢ ”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter z with dot above")
      (=jis-x0213-1-2000  . #x2A38)	; ø»¢ ¡
      (=jis-x0212	  . #x2B77)	; ø»Š´’
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Å»
      ))
    (=ucs		. #x017C)	; Å¼
    (latin-iso8859-3	. #xBF)	; øº’·Ÿ
    (latin-iso8859-2	. #xBF)	; øº’µ¿
    ))
(define-char
  '((name . "fullwidth latin small letter z with dot above")
    (=>ucs		. #x017C)	; Å¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017C)
    (->uppercase
     ((name . "fullwidth latin capital letter z with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; Å¼
      ))
    (=jis-x0213-1-2000	. #x2A38)	; ø»¢ ¡
    (=jis-x0212		. #x2B77)	; ø»Š´’
    (=jef-china3	. #x88C4)	; øºˆ£„
    (=ucs@jis		. #x017C)	; ø»¢ ¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with caron")
      (=jis-x0213-1-2000  . #x2A2A)	; ø»¢ “
      (=jis-x0212	  . #x2A76)	; ø»Š²³
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; Å¾
      ))
    (=ucs		. #x017D)	; Å½
    (latin-iso8859-4	. #xAE)	; øº’¸®
    (latin-iso8859-2	. #xAE)	; øº’µ®
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with caron")
    (=>ucs		. #x017D)	; Å½
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017D)
    (->lowercase
     ((name		  . "fullwidth latin small letter z with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Å½
      ))
    (=jis-x0213-1-2000	. #x2A2A)	; ø»¢ “
    (=jis-x0212		. #x2A76)	; ø»Š²³
    (=jef-china3	. #x88ED)	; øºˆ£­
    (=ucs@jis		. #x017D)	; ø»¢ “
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with caron")
      (=jis-x0213-1-2000  . #x2A37)	; ø»¢  
      (=jis-x0212	  . #x2B76)	; ø»Š´‘
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Å½
      ))
    (=ucs		. #x017E)	; Å¾
    (latin-iso8859-4	. #xBE)	; øº’¸¾
    (latin-iso8859-2	. #xBE)	; øº’µ¾
    ))
(define-char
  '((name		. "fullwidth latin small letter z with caron")
    (=>ucs		. #x017E)	; Å¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017E)
    (->uppercase
     ((name . "fullwidth latin capital letter z with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; Å¾
      ))
    (=jis-x0213-1-2000	. #x2A37)	; ø»¢  
    (=jis-x0212		. #x2B76)	; ø»Š´‘
    (=jef-china3	. #x88FC)	; øºˆ£¼
    (=ucs@jis		. #x017E)	; ø»¢  
    ))
(define-char
  '((name		. "LATIN SMALL LETTER LONG S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0073)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      ))
    (=ucs		. #x017F)	; Å¿
    ))
