(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with macron")
      (japanese-jisx0212	  . #x2A27)	; ø»Š±¤
      (japanese-jisx0213-1	  . #x2975)	; ø»¢ €
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (ucs		  . #x0101)	; Ä
      ))
    (latin-iso8859-4	. #xC0)	; øº’¹€
    (ucs		. #x0100)	; Ä€
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
      (ucs		  . #x0100)	; Ä€
      ))
    (japanese-jisx0212		. #x2A27)	; ø»Š±¤
    (japanese-jisx0213-1	. #x2975)	; ø»¢ €
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with macron")
      (chinese-gb2312		  . #x2821)	; ø»„–
      (japanese-jisx0212	  . #x2B27)	; ø»Š³‚
      (japanese-jisx0213-1	  . #x297A)	; ø»¢ …
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (ucs		  . #x0100)	; Ä€
      ))
    (latin-iso8859-4	. #xE0)	; øº’¹ 
    (ucs		. #x0101)	; Ä
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
      (ucs		  . #x0101)	; Ä
      ))
    (chinese-gb2312		. #x2821)	; ø»„–
    (japanese-jisx0212		. #x2B27)	; ø»Š³‚
    (japanese-jisx0213-1	. #x297A)	; ø»¢ …
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with breve")
      (japanese-jisx0212	  . #x2A25)	; ø»Š±¢
      (japanese-jisx0213-1	  . #x2A3A)	; ø»¢ £
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (ucs		  . #x0103)	; Äƒ
      ))
    (latin-iso8859-2	. #xC3)	; øº’¶ƒ
    (latin-tcvn5712	. #xA1)	; øº“™¡
    (latin-viscii-upper . #xE5)	; øº’ž¥
    (latin-viscii	. #xC5)	; øº’ž¥
    (ucs		. #x0102)	; Ä‚
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
      (ucs		  . #x0102)	; Ä‚
      ))
    (japanese-jisx0212		. #x2A25)	; ø»Š±¢
    (japanese-jisx0213-1	. #x2A3A)	; ø»¢ £
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with breve")
      (japanese-jisx0212	  . #x2B25)	; ø»Š³€
      (japanese-jisx0213-1	  . #x2A49)	; ø»¢ ²
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (ucs		  . #x0102)	; Ä‚
      ))
    (latin-iso8859-2	. #xE3)	; øº’¶£
    (latin-tcvn5712	. #xA8)	; øº“™¨
    (latin-viscii-lower . #xE5)	; øº’…
    (latin-viscii	. #xE5)	; øº’…
    (ucs		. #x0103)	; Äƒ
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
      (ucs		  . #x0103)	; Äƒ
      ))
    (japanese-jisx0212		. #x2B25)	; ø»Š³€
    (japanese-jisx0213-1	. #x2A49)	; ø»¢ ²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with ogonek")
      (japanese-jisx0212	  . #x2A28)	; ø»Š±¥
      (japanese-jisx0213-1	  . #x2A21)	; ø»¢ Š
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (ucs		  . #x0105)	; Ä…
      ))
    (latin-iso8859-2	. #xA1)	; øº’µ¡
    (latin-iso8859-4	. #xA1)	; øº’¸¡
    (ucs		. #x0104)	; Ä„
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
      (ucs		  . #x0104)	; Ä„
      ))
    (japanese-jisx0212		. #x2A28)	; ø»Š±¥
    (japanese-jisx0213-1	. #x2A21)	; ø»¢ Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with ogonek")
      (japanese-jisx0212	  . #x2B28)	; ø»Š³ƒ
      (japanese-jisx0213-1	  . #x2A2C)	; ø»¢ •
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (ucs		  . #x0104)	; Ä„
      ))
    (latin-iso8859-2	. #xB1)	; øº’µ±
    (latin-iso8859-4	. #xB1)	; øº’¸±
    (ucs		. #x0105)	; Ä…
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
      (ucs		  . #x0105)	; Ä…
      ))
    (japanese-jisx0212		. #x2B28)	; ø»Š³ƒ
    (japanese-jisx0213-1	. #x2A2C)	; ø»¢ •
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with acute")
      (japanese-jisx0212	  . #x2A2B)	; ø»Š±¨
      (japanese-jisx0213-1	  . #x2A3C)	; ø»¢ ¥
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (ucs		  . #x0107)	; Ä‡
      ))
    (latin-iso8859-2	. #xC6)	; øº’¶†
    (ucs		. #x0106)	; Ä†
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
      (ucs		  . #x0106)	; Ä†
      ))
    (japanese-jisx0212		. #x2A2B)	; ø»Š±¨
    (japanese-jisx0213-1	. #x2A3C)	; ø»¢ ¥
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with acute")
      (japanese-jisx0212	  . #x2B2B)	; ø»Š³†
      (japanese-jisx0213-1	  . #x2A4B)	; ø»¢ ´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (ucs		  . #x0106)	; Ä†
      ))
    (latin-iso8859-2	. #xE6)	; øº’¶¦
    (ucs		. #x0107)	; Ä‡
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
      (ucs		  . #x0107)	; Ä‡
      ))
    (japanese-jisx0212		. #x2B2B)	; ø»Š³†
    (japanese-jisx0213-1	. #x2A4B)	; ø»¢ ´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with circumflex")
      (japanese-jisx0212	  . #x2A2C)	; ø»Š±©
      (japanese-jisx0213-1	  . #x2A59)	; ø»¢¡‚
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (ucs		  . #x0109)	; Ä‰
      ))
    (latin-iso8859-3	. #xC6)	; øº’·¦
    (ucs		. #x0108)	; Äˆ
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
      (ucs		  . #x0108)	; Äˆ
      ))
    (japanese-jisx0212		. #x2A2C)	; ø»Š±©
    (japanese-jisx0213-1	. #x2A59)	; ø»¢¡‚
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter c with circumflex")
      (japanese-jisx0212	  . #x2B2C)	; ø»Š³‡
      (japanese-jisx0213-1	  . #x2A5F)	; ø»¢¡ˆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (ucs		  . #x0108)	; Äˆ
      ))
    (latin-iso8859-3	. #xE6)	; øº’¸†
    (ucs		. #x0109)	; Ä‰
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
      (ucs		  . #x0109)	; Ä‰
      ))
    (japanese-jisx0212		. #x2B2C)	; ø»Š³‡
    (japanese-jisx0213-1	. #x2A5F)	; ø»¢¡ˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with dot above")
      (japanese-jisx0212  . #x2A2F)	; ø»Š±¬
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (ucs		  . #x010B)	; Ä‹
      ))
    (latin-iso8859-3	. #xC5)	; øº’·¥
    (ucs		. #x010A)	; ÄŠ
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
      (ucs		  . #x010A)	; ÄŠ
      ))
    (japanese-jisx0212	. #x2A2F)	; ø»Š±¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter c with dot above")
      (japanese-jisx0212  . #x2B2F)	; ø»Š³Š
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (ucs		  . #x010A)	; ÄŠ
      ))
    (latin-iso8859-3	. #xE5)	; øº’¸…
    (ucs		. #x010B)	; Ä‹
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
      (ucs		  . #x010B)	; Ä‹
      ))
    (japanese-jisx0212	. #x2B2F)	; ø»Š³Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with caron")
      (japanese-jisx0212	  . #x2A2D)	; ø»Š±ª
      (japanese-jisx0213-1	  . #x2A3D)	; ø»¢ ¦
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (ucs		  . #x010D)	; Ä
      ))
    (latin-iso8859-2	. #xC8)	; øº’¶ˆ
    (latin-iso8859-4	. #xC8)	; øº’¹ˆ
    (ucs		. #x010C)	; ÄŒ
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
      (ucs		  . #x010C)	; ÄŒ
      ))
    (japanese-jisx0212		. #x2A2D)	; ø»Š±ª
    (japanese-jisx0213-1	. #x2A3D)	; ø»¢ ¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with caron")
      (japanese-jisx0212	  . #x2B2D)	; ø»Š³ˆ
      (japanese-jisx0213-1	  . #x2A4C)	; ø»¢ µ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (ucs		  . #x010C)	; ÄŒ
      ))
    (latin-iso8859-2	. #xE8)	; øº’¶¨
    (latin-iso8859-4	. #xE8)	; øº’¹¨
    (ucs		. #x010D)	; Ä
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
      (ucs		  . #x010D)	; Ä
      ))
    (japanese-jisx0212		. #x2B2D)	; ø»Š³ˆ
    (japanese-jisx0213-1	. #x2A4C)	; ø»¢ µ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter d with caron")
      (japanese-jisx0212	  . #x2A30)	; ø»Š±­
      (japanese-jisx0213-1	  . #x2A40)	; ø»¢ ©
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (ucs		  . #x010F)	; Ä
      ))
    (latin-iso8859-2	. #xCF)	; øº’¶
    (ucs		. #x010E)	; ÄŽ
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
      (ucs		  . #x010E)	; ÄŽ
      ))
    (japanese-jisx0212		. #x2A30)	; ø»Š±­
    (japanese-jisx0213-1	. #x2A40)	; ø»¢ ©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter d with caron")
      (japanese-jisx0212	  . #x2B30)	; ø»Š³‹
      (japanese-jisx0213-1	  . #x2A4F)	; ø»¢ ¸
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (ucs		  . #x010E)	; ÄŽ
      ))
    (latin-iso8859-2	. #xEF)	; øº’¶¯
    (ucs		. #x010F)	; Ä
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
      (ucs		  . #x010F)	; Ä
      ))
    (japanese-jisx0212		. #x2B30)	; ø»Š³‹
    (japanese-jisx0213-1	. #x2A4F)	; ø»¢ ¸
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
      (japanese-jisx0212  . #x2922)	; ø»Š°
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (ucs		  . #x0111)	; Ä‘
      ))
    (latin-iso8859-2	. #xD0)	; øº’¶
    (latin-iso8859-4	. #xD0)	; øº’¹
    (latin-tcvn5712	. #xA7)	; øº“™§
    (latin-viscii-upper . #xF0)	; øº’ž°
    (latin-viscii	. #xD0)	; øº’ž°
    (ucs		. #x0110)	; Ä
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
      (ucs		  . #x0110)	; Ä
      ))
    (japanese-jisx0212	. #x2922)	; ø»Š°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (ucs		  . #x0110)	; Ä
      ))
    (latin-iso8859-2	. #xF0)	; øº’¶°
    (latin-iso8859-4	. #xF0)	; øº’¹°
    (latin-tcvn5712	. #xAE)	; øº“™®
    (latin-viscii-lower . #xF0)	; øº’
    (latin-viscii	. #xF0)	; øº’
    (ucs		. #x0111)	; Ä‘
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
    (korean-ksc5601		. #x2922)	; ø»ˆ¥½
    (japanese-jisx0212		. #x2942)	; ø»Š°¡
    (japanese-jisx0213-1	. #x2A50)	; ø»¢ ¹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with macron")
      (japanese-jisx0212	  . #x2A37)	; ø»Š±´
      (japanese-jisx0213-1	  . #x2978)	; ø»¢ ƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (ucs		  . #x0113)	; Ä“
      ))
    (latin-iso8859-4	. #xAA)	; øº’¸ª
    (ucs		. #x0112)	; Ä’
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
      (ucs		  . #x0112)	; Ä’
      ))
    (japanese-jisx0212		. #x2A37)	; ø»Š±´
    (japanese-jisx0213-1	. #x2978)	; ø»¢ ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with macron")
      (chinese-gb2312		  . #x2825)	; ø»„š
      (japanese-jisx0212	  . #x2B37)	; ø»Š³’
      (japanese-jisx0213-1	  . #x297D)	; ø»¢ ˆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (ucs		  . #x0112)	; Ä’
      ))
    (latin-iso8859-4	. #xBA)	; øº’¸º
    (ucs		. #x0113)	; Ä“
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
      (ucs		  . #x0113)	; Ä“
      ))
    (chinese-gb2312		. #x2825)	; ø»„š
    (japanese-jisx0212		. #x2B37)	; ø»Š³’
    (japanese-jisx0213-1	. #x297D)	; ø»¢ ˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH BREVE")
      (ucs		  . #x0115)	; Ä•
      ))
    (ucs		. #x0114)	; Ä”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH BREVE")
      (ucs		  . #x0114)	; Ä”
      ))
    (ucs		. #x0115)	; Ä•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (japanese-jisx0212  . #x2A36)	; ø»Š±³
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (ucs		  . #x0117)	; Ä—
      ))
    (latin-iso8859-4	. #xCC)	; øº’¹Œ
    (ucs		. #x0116)	; Ä–
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
      (ucs		  . #x0116)	; Ä–
      ))
    (japanese-jisx0212	. #x2A36)	; ø»Š±³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
      (japanese-jisx0212  . #x2B36)	; ø»Š³‘
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (ucs		  . #x0116)	; Ä–
      ))
    (latin-iso8859-4	. #xEC)	; øº’¹¬
    (ucs		. #x0117)	; Ä—
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
      (ucs		  . #x0117)	; Ä—
      ))
    (japanese-jisx0212	. #x2B36)	; ø»Š³‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with ogonek")
      (japanese-jisx0212	  . #x2A38)	; ø»Š±µ
      (japanese-jisx0213-1	  . #x2A3E)	; ø»¢ §
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (ucs		  . #x0119)	; Ä™
      ))
    (latin-iso8859-2	. #xCA)	; øº’¶Š
    (latin-iso8859-4	. #xCA)	; øº’¹Š
    (ucs		. #x0118)	; Ä˜
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
      (ucs		  . #x0118)	; Ä˜
      ))
    (japanese-jisx0212		. #x2A38)	; ø»Š±µ
    (japanese-jisx0213-1	. #x2A3E)	; ø»¢ §
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with ogonek")
      (japanese-jisx0212	  . #x2B38)	; ø»Š³“
      (japanese-jisx0213-1	  . #x2A4D)	; ø»¢ ¶
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (ucs		  . #x0118)	; Ä˜
      ))
    (latin-iso8859-2	. #xEA)	; øº’¶ª
    (latin-iso8859-4	. #xEA)	; øº’¹ª
    (ucs		. #x0119)	; Ä™
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
      (ucs		  . #x0119)	; Ä™
      ))
    (japanese-jisx0212		. #x2B38)	; ø»Š³“
    (japanese-jisx0213-1	. #x2A4D)	; ø»¢ ¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with caron")
      (japanese-jisx0212	  . #x2A35)	; ø»Š±²
      (japanese-jisx0213-1	  . #x2A3F)	; ø»¢ ¨
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (ucs		  . #x011B)	; Ä›
      ))
    (latin-iso8859-2	. #xCC)	; øº’¶Œ
    (ucs		. #x011A)	; Äš
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
      (ucs		  . #x011A)	; Äš
      ))
    (japanese-jisx0212		. #x2A35)	; ø»Š±²
    (japanese-jisx0213-1	. #x2A3F)	; ø»¢ ¨
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with caron")
      (chinese-gb2312		  . #x2827)	; ø»„œ
      (japanese-jisx0212	  . #x2B35)	; ø»Š³
      (japanese-jisx0213-1	  . #x2A4E)	; ø»¢ ·
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (ucs		  . #x011A)	; Äš
      ))
    (latin-iso8859-2	. #xEC)	; øº’¶¬
    (ucs		. #x011B)	; Ä›
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
      (ucs		  . #x011B)	; Ä›
      ))
    (chinese-gb2312		. #x2827)	; ø»„œ
    (japanese-jisx0212		. #x2B35)	; ø»Š³
    (japanese-jisx0213-1	. #x2A4E)	; ø»¢ ·
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with circumflex")
      (japanese-jisx0212	  . #x2A3A)	; ø»Š±·
      (japanese-jisx0213-1	  . #x2A5A)	; ø»¢¡ƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (ucs		  . #x011D)	; Ä
      ))
    (latin-iso8859-3	. #xD8)	; øº’·¸
    (ucs		. #x011C)	; Äœ
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
      (ucs		  . #x011C)	; Äœ
      ))
    (japanese-jisx0212		. #x2A3A)	; ø»Š±·
    (japanese-jisx0213-1	. #x2A5A)	; ø»¢¡ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter g with circumflex")
      (japanese-jisx0212	  . #x2B3A)	; ø»Š³•
      (japanese-jisx0213-1	  . #x2A60)	; ø»¢¡‰
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (ucs		  . #x011C)	; Äœ
      ))
    (latin-iso8859-3	. #xF8)	; øº’¸˜
    (ucs		. #x011D)	; Ä
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
      (ucs		  . #x011D)	; Ä
      ))
    (japanese-jisx0212		. #x2B3A)	; ø»Š³•
    (japanese-jisx0213-1	. #x2A60)	; ø»¢¡‰
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
      (japanese-jisx0212  . #x2A3B)	; ø»Š±¸
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (ucs		  . #x011F)	; ÄŸ
      ))
    (latin-iso8859-3	. #xAB)	; øº’·‹
    (latin-iso8859-9	. #xD0)	; øº“†°
    (ucs		. #x011E)	; Äž
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
      (ucs		  . #x011E)	; Äž
      ))
    (japanese-jisx0212	. #x2A3B)	; ø»Š±¸
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
      (japanese-jisx0212  . #x2B3B)	; ø»Š³–
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (ucs		  . #x011E)	; Äž
      ))
    (latin-iso8859-3	. #xBB)	; øº’·›
    (latin-iso8859-9	. #xF0)	; øº“‡
    (ucs		. #x011F)	; ÄŸ
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
      (ucs		  . #x011F)	; ÄŸ
      ))
    (japanese-jisx0212	. #x2B3B)	; ø»Š³–
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (japanese-jisx0212  . #x2A3D)	; ø»Š±º
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (ucs		  . #x0121)	; Ä¡
      ))
    (latin-iso8859-3	. #xD5)	; øº’·µ
    (ucs		. #x0120)	; Ä 
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
      (ucs		  . #x0120)	; Ä 
      ))
    (japanese-jisx0212	. #x2A3D)	; ø»Š±º
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
      (japanese-jisx0212  . #x2B3D)	; ø»Š³˜
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (ucs		  . #x0120)	; Ä 
      ))
    (latin-iso8859-3	. #xF5)	; øº’¸•
    (ucs		. #x0121)	; Ä¡
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
      (ucs		  . #x0121)	; Ä¡
      ))
    (japanese-jisx0212	. #x2B3D)	; ø»Š³˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with cedilla")
      (japanese-jisx0212  . #x2A3C)	; ø»Š±¹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CEDILLA")
      (ucs		  . #x0123)	; Ä£
      ))
    (latin-iso8859-4	. #xAB)	; øº’¸«
    (ucs		. #x0122)	; Ä¢
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
      (ucs		  . #x0122)	; Ä¢
      ))
    (japanese-jisx0212	. #x2A3C)	; ø»Š±¹
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (ucs		  . #x0122)	; Ä¢
      ))
    (latin-iso8859-4	. #xBB)	; øº’¸»
    (ucs		. #x0123)	; Ä£
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with circumflex")
      (japanese-jisx0212	  . #x2A3E)	; ø»Š±»
      (japanese-jisx0213-1	  . #x2A5B)	; ø»¢¡„
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (ucs		  . #x0125)	; Ä¥
      ))
    (latin-iso8859-3	. #xA6)	; øº’·†
    (ucs		. #x0124)	; Ä¤
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
      (ucs		  . #x0124)	; Ä¤
      ))
    (japanese-jisx0212		. #x2A3E)	; ø»Š±»
    (japanese-jisx0213-1	. #x2A5B)	; ø»¢¡„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter h with circumflex")
      (japanese-jisx0212	  . #x2B3E)	; ø»Š³™
      (japanese-jisx0213-1	  . #x2A61)	; ø»¢¡Š
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (ucs		  . #x0124)	; Ä¤
      ))
    (latin-iso8859-3	. #xB6)	; øº’·–
    (ucs		. #x0125)	; Ä¥
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
      (ucs		  . #x0125)	; Ä¥
      ))
    (japanese-jisx0212		. #x2B3E)	; ø»Š³™
    (japanese-jisx0213-1	. #x2A61)	; ø»¢¡Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with stroke")
      (korean-ksc5601	  . #x2824)	; ø»ˆ¤¡
      (japanese-jisx0212  . #x2924)	; ø»Š°ƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (ucs		  . #x0127)	; Ä§
      ))
    (latin-iso8859-3	. #xA1)	; øº’·
    (ucs		. #x0126)	; Ä¦
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
      (ucs		  . #x0126)	; Ä¦
      ))
    (korean-ksc5601	. #x2824)	; ø»ˆ¤¡
    (japanese-jisx0212	. #x2924)	; ø»Š°ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter h with stroke")
      (korean-ksc5601		  . #x2924)	; ø»ˆ¥¿
      (japanese-jisx0212	  . #x2944)	; ø»Š°£
      (japanese-jisx0213-1	  . #x2A7D)	; ø»¢¡¦
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (ucs		  . #x0126)	; Ä¦
      ))
    (latin-iso8859-3	. #xB1)	; øº’·‘
    (ucs		. #x0127)	; Ä§
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
      (ucs		  . #x0127)	; Ä§
      ))
    (korean-ksc5601		. #x2924)	; ø»ˆ¥¿
    (japanese-jisx0212		. #x2944)	; ø»Š°£
    (japanese-jisx0213-1	. #x2A7D)	; ø»¢¡¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with tilde")
      (japanese-jisx0212  . #x2A47)	; ø»Š²„
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (ucs		  . #x0129)	; Ä©
      ))
    (latin-iso8859-4	. #xA5)	; øº’¸¥
    (latin-viscii-upper . #xEE)	; øº’ž®
    (latin-viscii	. #xCE)	; øº’ž®
    (ucs		. #x0128)	; Ä¨
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
      (ucs		  . #x0128)	; Ä¨
      ))
    (japanese-jisx0212	. #x2A47)	; ø»Š²„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with tilde")
      (japanese-jisx0212  . #x2B47)	; ø»Š³¢
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (ucs		  . #x0128)	; Ä¨
      ))
    (latin-iso8859-4	. #xB5)	; øº’¸µ
    (latin-tcvn5712	. #xDC)	; øº“šœ
    (latin-viscii-lower . #xEE)	; øº’Ž
    (latin-viscii	. #xEE)	; øº’Ž
    (ucs		. #x0129)	; Ä©
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
      (ucs		  . #x0129)	; Ä©
      ))
    (japanese-jisx0212	. #x2B47)	; ø»Š³¢
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with macron")
      (japanese-jisx0212	  . #x2A45)	; ø»Š²‚
      (japanese-jisx0213-1	  . #x2976)	; ø»¢ 
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (ucs		  . #x012B)	; Ä«
      ))
    (latin-iso8859-4	. #xCF)	; øº’¹
    (ucs		. #x012A)	; Äª
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
      (ucs		  . #x012A)	; Äª
      ))
    (japanese-jisx0212		. #x2A45)	; ø»Š²‚
    (japanese-jisx0213-1	. #x2976)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with macron")
      (chinese-gb2312		  . #x2829)	; ø»„ž
      (japanese-jisx0212	  . #x2B45)	; ø»Š³ 
      (japanese-jisx0213-1	  . #x297B)	; ø»¢ †
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (ucs		  . #x012A)	; Äª
      ))
    (latin-iso8859-4	. #xEF)	; øº’¹¯
    (ucs		. #x012B)	; Ä«
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
      (ucs		  . #x012B)	; Ä«
      ))
    (chinese-gb2312		. #x2829)	; ø»„ž
    (japanese-jisx0212		. #x2B45)	; ø»Š³ 
    (japanese-jisx0213-1	. #x297B)	; ø»¢ †
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH BREVE")
      (ucs		  . #x012D)	; Ä­
      ))
    (ucs		. #x012C)	; Ä¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH BREVE")
      (ucs		  . #x012C)	; Ä¬
      ))
    (ucs		. #x012D)	; Ä­
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with ogonek")
      (japanese-jisx0212  . #x2A46)	; ø»Š²ƒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (ucs		  . #x012F)	; Ä¯
      ))
    (latin-iso8859-4	. #xC7)	; øº’¹‡
    (ucs		. #x012E)	; Ä®
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
      (ucs		  . #x012E)	; Ä®
      ))
    (japanese-jisx0212	. #x2A46)	; ø»Š²ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with ogonek")
      (japanese-jisx0212  . #x2B46)	; ø»Š³¡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (ucs		  . #x012E)	; Ä®
      ))
    (latin-iso8859-4	. #xE7)	; øº’¹§
    (ucs		. #x012F)	; Ä¯
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
      (ucs		  . #x012F)	; Ä¯
      ))
    (japanese-jisx0212	. #x2B46)	; ø»Š³¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with dot above")
      (japanese-jisx0212  . #x2A44)	; ø»Š²
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (ucs		  . #x0069)	; i
      ))
    (latin-iso8859-3	. #xA9)	; øº’·‰
    (latin-iso8859-9	. #xDD)	; øº“†½
    (ucs		. #x0130)	; Ä°
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
      (ucs		  . #x0130)	; Ä°
      ))
    (japanese-jisx0212	. #x2A44)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER DOTLESS I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (ucs		  . #x0049)	; I
      ))
    (latin-iso8859-3	. #xB9)	; øº’·™
    (latin-iso8859-9	. #xFD)	; øº“‡
    (ucs		. #x0131)	; Ä±
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
    (korean-ksc5601	. #x2925)	; ø»ˆ¦€
    (japanese-jisx0212	. #x2945)	; ø»Š°¤
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0049 #x004A)
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (ucs		  . #x0133)	; Ä³
      ))
    (korean-ksc5601	. #x2826)	; ø»ˆ¤£
    (japanese-jisx0212	. #x2926)	; ø»Š°…
    (ucs		. #x0132)	; Ä²
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature ij")
      (korean-ksc5601	  . #x2926)	; ø»ˆ¦
      (japanese-jisx0212  . #x2946)	; ø»Š°¥
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (ucs		  . #x0132)	; Ä²
      ))
    (ucs		. #x0133)	; Ä³
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
      (ucs		  . #x0132)	; Ä²
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (ucs		  . #x0133)	; Ä³
      ))
    (korean-ksc5601	. #x2926)	; ø»ˆ¦
    (japanese-jisx0212	. #x2946)	; ø»Š°¥
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter j with circumflex")
      (japanese-jisx0212	  . #x2A48)	; ø»Š²…
      (japanese-jisx0213-1	  . #x2A5C)	; ø»¢¡…
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (ucs		  . #x0135)	; Äµ
      ))
    (latin-iso8859-3	. #xAC)	; øº’·Œ
    (ucs		. #x0134)	; Ä´
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
      (ucs		  . #x0134)	; Ä´
      ))
    (japanese-jisx0212		. #x2A48)	; ø»Š²…
    (japanese-jisx0213-1	. #x2A5C)	; ø»¢¡…
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter j with circumflex")
      (japanese-jisx0212	  . #x2B48)	; ø»Š³£
      (japanese-jisx0213-1	  . #x2A62)	; ø»¢¡‹
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (ucs		  . #x0134)	; Ä´
      ))
    (latin-iso8859-3	. #xBC)	; øº’·œ
    (ucs		. #x0135)	; Äµ
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
      (ucs		  . #x0135)	; Äµ
      ))
    (japanese-jisx0212		. #x2B48)	; ø»Š³£
    (japanese-jisx0213-1	. #x2A62)	; ø»¢¡‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter k with cedilla")
      (japanese-jisx0212  . #x2A49)	; ø»Š²†
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (ucs		  . #x0137)	; Ä·
      ))
    (latin-iso8859-4	. #xD3)	; øº’¹“
    (ucs		. #x0136)	; Ä¶
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
      (ucs		  . #x0136)	; Ä¶
      ))
    (japanese-jisx0212	. #x2A49)	; ø»Š²†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter k with cedilla")
      (japanese-jisx0212  . #x2B49)	; ø»Š³¤
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (ucs		  . #x0136)	; Ä¶
      ))
    (latin-iso8859-4	. #xF3)	; øº’¹³
    (ucs		. #x0137)	; Ä·
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
      (ucs		  . #x0137)	; Ä·
      ))
    (japanese-jisx0212	. #x2B49)	; ø»Š³¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->fullwidth
     ((name		  . "fullwidth latin small letter kra")
      (korean-ksc5601	  . #x2927)	; ø»ˆ¦‚
      (japanese-jisx0212  . #x2947)	; ø»Š°¦
      ))
    (latin-iso8859-4	. #xA2)	; øº’¸¢
    (ucs		. #x0138)	; Ä¸
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
      (ucs		  . #x0138)	; Ä¸
      ))
    (korean-ksc5601	. #x2927)	; ø»ˆ¦‚
    (japanese-jisx0212	. #x2947)	; ø»Š°¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with acute")
      (japanese-jisx0212	  . #x2A4A)	; ø»Š²‡
      (japanese-jisx0213-1	  . #x2A3B)	; ø»¢ ¤
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (ucs		  . #x013A)	; Äº
      ))
    (latin-iso8859-2	. #xC5)	; øº’¶…
    (ucs		. #x0139)	; Ä¹
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
      (ucs		  . #x0139)	; Ä¹
      ))
    (japanese-jisx0212		. #x2A4A)	; ø»Š²‡
    (japanese-jisx0213-1	. #x2A3B)	; ø»¢ ¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with acute")
      (japanese-jisx0212	  . #x2B4A)	; ø»Š³¥
      (japanese-jisx0213-1	  . #x2A4A)	; ø»¢ ³
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (ucs		  . #x0139)	; Ä¹
      ))
    (latin-iso8859-2	. #xE5)	; øº’¶¥
    (ucs		. #x013A)	; Äº
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
      (ucs		  . #x013A)	; Äº
      ))
    (japanese-jisx0212		. #x2B4A)	; ø»Š³¥
    (japanese-jisx0213-1	. #x2A4A)	; ø»¢ ³
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with cedilla")
      (japanese-jisx0212  . #x2A4C)	; ø»Š²‰
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (ucs		  . #x013C)	; Ä¼
      ))
    (latin-iso8859-4	. #xA6)	; øº’¸¦
    (ucs		. #x013B)	; Ä»
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
      (ucs		  . #x013B)	; Ä»
      ))
    (japanese-jisx0212	. #x2A4C)	; ø»Š²‰
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter l with cedilla")
      (japanese-jisx0212  . #x2B4C)	; ø»Š³§
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (ucs		  . #x013B)	; Ä»
      ))
    (latin-iso8859-4	. #xB6)	; øº’¸¶
    (ucs		. #x013C)	; Ä¼
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
      (ucs		  . #x013C)	; Ä¼
      ))
    (japanese-jisx0212	. #x2B4C)	; ø»Š³§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with caron")
      (japanese-jisx0212	  . #x2A4B)	; ø»Š²ˆ
      (japanese-jisx0213-1	  . #x2A24)	; ø»¢ 
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (ucs		  . #x013E)	; Ä¾
      ))
    (latin-iso8859-2	. #xA5)	; øº’µ¥
    (ucs		. #x013D)	; Ä½
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
      (ucs		  . #x013D)	; Ä½
      ))
    (japanese-jisx0212		. #x2A4B)	; ø»Š²ˆ
    (japanese-jisx0213-1	. #x2A24)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with caron")
      (japanese-jisx0212	  . #x2B4B)	; ø»Š³¦
      (japanese-jisx0213-1	  . #x2A2F)	; ø»¢ ˜
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (ucs		  . #x013D)	; Ä½
      ))
    (latin-iso8859-2	. #xB5)	; øº’µµ
    (ucs		. #x013E)	; Ä¾
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
      (ucs		  . #x013E)	; Ä¾
      ))
    (japanese-jisx0212		. #x2B4B)	; ø»Š³¦
    (japanese-jisx0213-1	. #x2A2F)	; ø»¢ ˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with middle dot")
      (korean-ksc5601	  . #x2828)	; ø»ˆ¤¥
      (japanese-jisx0212  . #x2929)	; ø»Š°ˆ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (ucs		  . #x0140)	; Å€
      ))
    (ucs		. #x013F)	; Ä¿
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
      (ucs		  . #x013F)	; Ä¿
      ))
    (korean-ksc5601	. #x2828)	; ø»ˆ¤¥
    (japanese-jisx0212	. #x2929)	; ø»Š°ˆ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin small letter l with middle dot")
      (korean-ksc5601	  . #x2928)	; ø»ˆ¦ƒ
      (japanese-jisx0212  . #x2949)	; ø»Š°¨
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (ucs		  . #x013F)	; Ä¿
      ))
    (ucs		. #x0140)	; Å€
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
      (ucs		  . #x0140)	; Å€
      ))
    (korean-ksc5601	. #x2928)	; ø»ˆ¦ƒ
    (japanese-jisx0212	. #x2949)	; ø»Š°¨
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with stroke")
      (korean-ksc5601		  . #x2829)	; ø»ˆ¤¦
      (japanese-jisx0212	  . #x2928)	; ø»Š°‡
      (japanese-jisx0213-1	  . #x2A23)	; ø»¢ Œ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (ucs		  . #x0142)	; Å‚
      ))
    (latin-iso8859-2	. #xA3)	; øº’µ£
    (ucs		. #x0141)	; Å
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
      (ucs		  . #x0141)	; Å
      ))
    (korean-ksc5601		. #x2829)	; ø»ˆ¤¦
    (japanese-jisx0212		. #x2928)	; ø»Š°‡
    (japanese-jisx0213-1	. #x2A23)	; ø»¢ Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with stroke")
      (korean-ksc5601		  . #x2929)	; ø»ˆ¦„
      (japanese-jisx0212	  . #x2948)	; ø»Š°§
      (japanese-jisx0213-1	  . #x2A2E)	; ø»¢ —
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (ucs		  . #x0141)	; Å
      ))
    (latin-iso8859-2	. #xB3)	; øº’µ³
    (ucs		. #x0142)	; Å‚
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
      (ucs		  . #x0142)	; Å‚
      ))
    (korean-ksc5601		. #x2929)	; ø»ˆ¦„
    (japanese-jisx0212		. #x2948)	; ø»Š°§
    (japanese-jisx0213-1	. #x2A2E)	; ø»¢ —
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with acute")
      (japanese-jisx0212	  . #x2A4D)	; ø»Š²Š
      (japanese-jisx0213-1	  . #x2A41)	; ø»¢ ª
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (ucs		  . #x0144)	; Å„
      ))
    (latin-iso8859-2	. #xD1)	; øº’¶‘
    (ucs		. #x0143)	; Åƒ
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
      (ucs		  . #x0143)	; Åƒ
      ))
    (japanese-jisx0212		. #x2A4D)	; ø»Š²Š
    (japanese-jisx0213-1	. #x2A41)	; ø»¢ ª
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with acute")
      (japanese-jisx0212	  . #x2B4D)	; ø»Š³¨
      (japanese-jisx0213-1	  . #x2A51)	; ø»¢ º
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (ucs		  . #x0143)	; Åƒ
      ))
    (latin-iso8859-2	. #xF1)	; øº’¶±
    (ucs		. #x0144)	; Å„
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
      (ucs		  . #x0144)	; Å„
      ))
    (japanese-jisx0212		. #x2B4D)	; ø»Š³¨
    (japanese-jisx0213-1	. #x2A51)	; ø»¢ º
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with cedilla")
      (japanese-jisx0212  . #x2A4F)	; ø»Š²Œ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (ucs		  . #x0146)	; Å†
      ))
    (latin-iso8859-4	. #xD1)	; øº’¹‘
    (ucs		. #x0145)	; Å…
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
      (ucs		  . #x0145)	; Å…
      ))
    (japanese-jisx0212	. #x2A4F)	; ø»Š²Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter n with cedilla")
      (japanese-jisx0212  . #x2B4F)	; ø»Š³ª
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (ucs		  . #x0145)	; Å…
      ))
    (latin-iso8859-4	. #xF1)	; øº’¹±
    (ucs		. #x0146)	; Å†
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
      (ucs		  . #x0146)	; Å†
      ))
    (japanese-jisx0212	. #x2B4F)	; ø»Š³ª
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with caron")
      (japanese-jisx0212	  . #x2A4E)	; ø»Š²‹
      (japanese-jisx0213-1	  . #x2A42)	; ø»¢ «
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (ucs		  . #x0148)	; Åˆ
      ))
    (latin-iso8859-2	. #xD2)	; øº’¶’
    (ucs		. #x0147)	; Å‡
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
      (ucs		  . #x0147)	; Å‡
      ))
    (japanese-jisx0212		. #x2A4E)	; ø»Š²‹
    (japanese-jisx0213-1	. #x2A42)	; ø»¢ «
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with caron")
      (japanese-jisx0212	  . #x2B4E)	; ø»Š³©
      (japanese-jisx0213-1	  . #x2A52)	; ø»¢ »
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (ucs		  . #x0147)	; Å‡
      ))
    (latin-iso8859-2	. #xF2)	; øº’¶²
    (ucs		. #x0148)	; Åˆ
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
      (ucs		  . #x0148)	; Åˆ
      ))
    (japanese-jisx0212		. #x2B4E)	; ø»Š³©
    (japanese-jisx0213-1	. #x2A52)	; ø»¢ »
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    (->fullwidth
     ((name . "fullwidth latin small letter n preceded by apostrophe")
      (korean-ksc5601	  . #x2930)	; ø»ˆ¦‹
      (japanese-jisx0212  . #x294A)	; ø»Š°©
      ))
    (ucs		. #x0149)	; Å‰
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
      (ucs		  . #x0149)	; Å‰
      ))
    (korean-ksc5601	. #x2930)	; ø»ˆ¦‹
    (japanese-jisx0212	. #x294A)	; ø»Š°©
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter eng")
      (korean-ksc5601	  . #x282F)	; ø»ˆ¤¬
      (japanese-jisx0212  . #x292B)	; ø»Š°Š
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ENG")
      (ucs		  . #x014B)	; Å‹
      ))
    (latin-iso8859-4	. #xBD)	; øº’¸½
    (ucs		. #x014A)	; ÅŠ
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
      (ucs		  . #x014A)	; ÅŠ
      ))
    (korean-ksc5601	. #x282F)	; ø»ˆ¤¬
    (japanese-jisx0212	. #x292B)	; ø»Š°Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin small letter eng")
      (korean-ksc5601		  . #x292F)	; ø»ˆ¦Š
      (japanese-jisx0212	  . #x294B)	; ø»Š°ª
      (japanese-jisx0213-1	  . #x2A7A)	; ø»¢¡£
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (ucs		  . #x014A)	; ÅŠ
      ))
    (latin-iso8859-4	. #xBF)	; øº’¸¿
    (ipa		. #xD5)	; øº’›•
    (ucs		. #x014B)	; Å‹
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
      (ucs		  . #x014B)	; Å‹
      ))
    (korean-ksc5601		. #x292F)	; ø»ˆ¦Š
    (japanese-jisx0212		. #x294B)	; ø»Š°ª
    (japanese-jisx0213-1	. #x2A7A)	; ø»¢¡£
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with macron")
      (japanese-jisx0212	  . #x2A57)	; ø»Š²”
      (japanese-jisx0213-1	  . #x2979)	; ø»¢ „
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (ucs		  . #x014D)	; Å
      ))
    (latin-iso8859-4	. #xD2)	; øº’¹’
    (ucs		. #x014C)	; ÅŒ
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
      (ucs		  . #x014C)	; ÅŒ
      ))
    (japanese-jisx0212		. #x2A57)	; ø»Š²”
    (japanese-jisx0213-1	. #x2979)	; ø»¢ „
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with macron")
      (chinese-gb2312		  . #x282D)	; ø»„¢
      (japanese-jisx0212	  . #x2B57)	; ø»Š³²
      (japanese-jisx0213-1	  . #x297E)	; ø»¢ ‰
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (ucs		  . #x014C)	; ÅŒ
      ))
    (latin-iso8859-4	. #xF2)	; øº’¹²
    (ucs		. #x014D)	; Å
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
      (ucs		  . #x014D)	; Å
      ))
    (chinese-gb2312		. #x282D)	; ø»„¢
    (japanese-jisx0212		. #x2B57)	; ø»Š³²
    (japanese-jisx0213-1	. #x297E)	; ø»¢ ‰
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH BREVE")
      (ucs		  . #x014F)	; Å
      ))
    (ucs		. #x014E)	; ÅŽ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH BREVE")
      (ucs		  . #x014E)	; ÅŽ
      ))
    (ucs		. #x014F)	; Å
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with double acute")
      (japanese-jisx0212	  . #x2A56)	; ø»Š²“
      (japanese-jisx0213-1	  . #x2A43)	; ø»¢ ¬
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (ucs		  . #x0151)	; Å‘
      ))
    (latin-iso8859-2	. #xD5)	; øº’¶•
    (ucs		. #x0150)	; Å
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
      (ucs		  . #x0150)	; Å
      ))
    (japanese-jisx0212		. #x2A56)	; ø»Š²“
    (japanese-jisx0213-1	. #x2A43)	; ø»¢ ¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter o with double acute")
      (japanese-jisx0212	  . #x2B56)	; ø»Š³±
      (japanese-jisx0213-1	  . #x2A53)	; ø»¢ ¼
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (ucs		  . #x0150)	; Å
      ))
    (latin-iso8859-2	. #xF5)	; øº’¶µ
    (ucs		. #x0151)	; Å‘
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
      (ucs		  . #x0151)	; Å‘
      ))
    (japanese-jisx0212		. #x2B56)	; ø»Š³±
    (japanese-jisx0213-1	. #x2A53)	; ø»¢ ¼
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE OE")
      (ucs		  . #x0153)	; Å“
      ))
    (korean-ksc5601		. #x282B)	; ø»ˆ¤¨
    (japanese-jisx0212		. #x292D)	; ø»Š°Œ
    (japanese-jisx0213-1	. #x2B2B)	; ø»¢¡²
    (ucs			. #x0152)	; Å’
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature oe")
      (korean-ksc5601		  . #x292B)	; ø»ˆ¦†
      (japanese-jisx0212	  . #x294D)	; ø»Š°¬
      (japanese-jisx0213-1	  . #x2B2A)	; ø»¢¡±
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (ucs		  . #x0152)	; Å’
      ))
    (ipa		. #xB0)	; øº’š°
    (ucs		. #x0153)	; Å“
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
      (ucs		  . #x0153)	; Å“
      ))
    (korean-ksc5601		. #x292B)	; ø»ˆ¦†
    (japanese-jisx0212		. #x294D)	; ø»Š°¬
    (japanese-jisx0213-1	. #x2B2A)	; ø»¢¡±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with acute")
      (japanese-jisx0212	  . #x2A59)	; ø»Š²–
      (japanese-jisx0213-1	  . #x2A39)	; ø»¢ ¢
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (ucs		  . #x0155)	; Å•
      ))
    (latin-iso8859-2	. #xC0)	; øº’¶€
    (ucs		. #x0154)	; Å”
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
      (ucs		  . #x0154)	; Å”
      ))
    (japanese-jisx0212		. #x2A59)	; ø»Š²–
    (japanese-jisx0213-1	. #x2A39)	; ø»¢ ¢
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with acute")
      (japanese-jisx0212	  . #x2B59)	; ø»Š³´
      (japanese-jisx0213-1	  . #x2A48)	; ø»¢ ±
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (ucs		  . #x0154)	; Å”
      ))
    (latin-iso8859-2	. #xE0)	; øº’¶ 
    (ucs		. #x0155)	; Å•
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
      (ucs		  . #x0155)	; Å•
      ))
    (japanese-jisx0212		. #x2B59)	; ø»Š³´
    (japanese-jisx0213-1	. #x2A48)	; ø»¢ ±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with cedilla")
      (japanese-jisx0212  . #x2A5B)	; ø»Š²˜
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (ucs		  . #x0157)	; Å—
      ))
    (latin-iso8859-4	. #xA3)	; øº’¸£
    (ucs		. #x0156)	; Å–
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
      (ucs		  . #x0156)	; Å–
      ))
    (japanese-jisx0212	. #x2A5B)	; ø»Š²˜
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter r with cedilla")
      (japanese-jisx0212  . #x2B5B)	; ø»Š³¶
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (ucs		  . #x0156)	; Å–
      ))
    (latin-iso8859-4	. #xB3)	; øº’¸³
    (ucs		. #x0157)	; Å—
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
      (ucs		  . #x0157)	; Å—
      ))
    (japanese-jisx0212	. #x2B5B)	; ø»Š³¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with caron")
      (japanese-jisx0212	  . #x2A5A)	; ø»Š²—
      (japanese-jisx0213-1	  . #x2A44)	; ø»¢ ­
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (ucs		  . #x0159)	; Å™
      ))
    (latin-iso8859-2	. #xD8)	; øº’¶˜
    (ucs		. #x0158)	; Å˜
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
      (ucs		  . #x0158)	; Å˜
      ))
    (japanese-jisx0212		. #x2A5A)	; ø»Š²—
    (japanese-jisx0213-1	. #x2A44)	; ø»¢ ­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with caron")
      (japanese-jisx0212	  . #x2B5A)	; ø»Š³µ
      (japanese-jisx0213-1	  . #x2A54)	; ø»¢ ½
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (ucs		  . #x0158)	; Å˜
      ))
    (latin-iso8859-2	. #xF8)	; øº’¶¸
    (ucs		. #x0159)	; Å™
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
      (ucs		  . #x0159)	; Å™
      ))
    (japanese-jisx0212		. #x2B5A)	; ø»Š³µ
    (japanese-jisx0213-1	. #x2A54)	; ø»¢ ½
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with acute")
      (japanese-jisx0212	  . #x2A5C)	; ø»Š²™
      (japanese-jisx0213-1	  . #x2A25)	; ø»¢ Ž
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (ucs		  . #x015B)	; Å›
      ))
    (latin-iso8859-2	. #xA6)	; øº’µ¦
    (ucs		. #x015A)	; Åš
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
      (ucs		  . #x015A)	; Åš
      ))
    (japanese-jisx0212		. #x2A5C)	; ø»Š²™
    (japanese-jisx0213-1	. #x2A25)	; ø»¢ Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with acute")
      (japanese-jisx0212  . #x2B5C)	; ø»Š³·
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (ucs		  . #x015A)	; Åš
      ))
    (latin-iso8859-2		. #xB6)	; øº’µ¶
    (japanese-jisx0213-1	. #x2A30)	; ø»¢ ™
    (ucs			. #x015B)	; Å›
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
      (ucs		  . #x015B)	; Å›
      ))
    (japanese-jisx0212	. #x2B5C)	; ø»Š³·
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with circumflex")
      (japanese-jisx0212	  . #x2A5D)	; ø»Š²š
      (japanese-jisx0213-1	  . #x2A5D)	; ø»¢¡†
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (ucs		  . #x015D)	; Å
      ))
    (latin-iso8859-3	. #xDE)	; øº’·¾
    (ucs		. #x015C)	; Åœ
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
      (ucs		  . #x015C)	; Åœ
      ))
    (japanese-jisx0212		. #x2A5D)	; ø»Š²š
    (japanese-jisx0213-1	. #x2A5D)	; ø»¢¡†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter s with circumflex")
      (japanese-jisx0212	  . #x2B5D)	; ø»Š³¸
      (japanese-jisx0213-1	  . #x2A63)	; ø»¢¡Œ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (ucs		  . #x015C)	; Åœ
      ))
    (latin-iso8859-3	. #xFE)	; øº’¸ž
    (ucs		. #x015D)	; Å
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
      (ucs		  . #x015D)	; Å
      ))
    (japanese-jisx0212		. #x2B5D)	; ø»Š³¸
    (japanese-jisx0213-1	. #x2A63)	; ø»¢¡Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with cedilla")
      (japanese-jisx0212	  . #x2A5F)	; ø»Š²œ
      (japanese-jisx0213-1	  . #x2A27)	; ø»¢ 
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (ucs		  . #x015F)	; ÅŸ
      ))
    (latin-iso8859-2	. #xAA)	; øº’µª
    (latin-iso8859-3	. #xAA)	; øº’·Š
    (latin-iso8859-9	. #xDE)	; øº“†¾
    (ucs		. #x015E)	; Åž
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
      (ucs		  . #x015E)	; Åž
      ))
    (japanese-jisx0212		. #x2A5F)	; ø»Š²œ
    (japanese-jisx0213-1	. #x2A27)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter s with cedilla")
      (japanese-jisx0212	  . #x2B5F)	; ø»Š³º
      (japanese-jisx0213-1	  . #x2A33)	; ø»¢ œ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (ucs		  . #x015E)	; Åž
      ))
    (latin-iso8859-2	. #xBA)	; øº’µº
    (latin-iso8859-3	. #xBA)	; øº’·š
    (latin-iso8859-9	. #xFE)	; øº“‡ž
    (ucs		. #x015F)	; ÅŸ
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
      (ucs		  . #x015F)	; ÅŸ
      ))
    (japanese-jisx0212		. #x2B5F)	; ø»Š³º
    (japanese-jisx0213-1	. #x2A33)	; ø»¢ œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with caron")
      (japanese-jisx0212	  . #x2A5E)	; ø»Š²›
      (japanese-jisx0213-1	  . #x2A26)	; ø»¢ 
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (ucs		  . #x0161)	; Å¡
      ))
    (latin-iso8859-2	. #xA9)	; øº’µ©
    (latin-iso8859-4	. #xA9)	; øº’¸©
    (ucs		. #x0160)	; Å 
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
      (ucs		  . #x0160)	; Å 
      ))
    (japanese-jisx0212		. #x2A5E)	; ø»Š²›
    (japanese-jisx0213-1	. #x2A26)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with caron")
      (japanese-jisx0212	  . #x2B5E)	; ø»Š³¹
      (japanese-jisx0213-1	  . #x2A32)	; ø»¢ ›
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (ucs		  . #x0160)	; Å 
      ))
    (latin-iso8859-2	. #xB9)	; øº’µ¹
    (latin-iso8859-4	. #xB9)	; øº’¸¹
    (ucs		. #x0161)	; Å¡
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
      (ucs		  . #x0161)	; Å¡
      ))
    (japanese-jisx0212		. #x2B5E)	; ø»Š³¹
    (japanese-jisx0213-1	. #x2A32)	; ø»¢ ›
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with cedilla")
      (japanese-jisx0212	  . #x2A61)	; ø»Š²ž
      (japanese-jisx0213-1	  . #x2A47)	; ø»¢ °
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (ucs		  . #x0163)	; Å£
      ))
    (latin-iso8859-2	. #xDE)	; øº’¶ž
    (ucs		. #x0162)	; Å¢
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
      (ucs		  . #x0162)	; Å¢
      ))
    (japanese-jisx0212		. #x2A61)	; ø»Š²ž
    (japanese-jisx0213-1	. #x2A47)	; ø»¢ °
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter t with cedilla")
      (japanese-jisx0212	  . #x2B61)	; ø»Š³¼
      (japanese-jisx0213-1	  . #x2A57)	; ø»¢¡€
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (ucs		  . #x0162)	; Å¢
      ))
    (latin-iso8859-2	. #xFE)	; øº’¶¾
    (ucs		. #x0163)	; Å£
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
      (ucs		  . #x0163)	; Å£
      ))
    (japanese-jisx0212		. #x2B61)	; ø»Š³¼
    (japanese-jisx0213-1	. #x2A57)	; ø»¢¡€
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with caron")
      (japanese-jisx0212	  . #x2A60)	; ø»Š²
      (japanese-jisx0213-1	  . #x2A28)	; ø»¢ ‘
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (ucs		  . #x0165)	; Å¥
      ))
    (latin-iso8859-2	. #xAB)	; øº’µ«
    (ucs		. #x0164)	; Å¤
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
      (ucs		  . #x0164)	; Å¤
      ))
    (japanese-jisx0212		. #x2A60)	; ø»Š²
    (japanese-jisx0213-1	. #x2A28)	; ø»¢ ‘
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with caron")
      (japanese-jisx0212	  . #x2B60)	; ø»Š³»
      (japanese-jisx0213-1	  . #x2A34)	; ø»¢ 
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (ucs		  . #x0164)	; Å¤
      ))
    (latin-iso8859-2	. #xBB)	; øº’µ»
    (ucs		. #x0165)	; Å¥
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
      (ucs		  . #x0165)	; Å¥
      ))
    (japanese-jisx0212		. #x2B60)	; ø»Š³»
    (japanese-jisx0213-1	. #x2A34)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with stroke")
      (korean-ksc5601	  . #x282E)	; ø»ˆ¤«
      (japanese-jisx0212  . #x292F)	; ø»Š°Ž
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (ucs		  . #x0167)	; Å§
      ))
    (latin-iso8859-4	. #xAC)	; øº’¸¬
    (ucs		. #x0166)	; Å¦
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
      (ucs		  . #x0166)	; Å¦
      ))
    (korean-ksc5601	. #x282E)	; ø»ˆ¤«
    (japanese-jisx0212	. #x292F)	; ø»Š°Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with stroke")
      (korean-ksc5601	  . #x292E)	; ø»ˆ¦‰
      (japanese-jisx0212  . #x294F)	; ø»Š°®
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (ucs		  . #x0166)	; Å¦
      ))
    (latin-iso8859-4	. #xBC)	; øº’¸¼
    (ucs		. #x0167)	; Å§
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
      (ucs		  . #x0167)	; Å§
      ))
    (korean-ksc5601	. #x292E)	; ø»ˆ¦‰
    (japanese-jisx0212	. #x294F)	; ø»Š°®
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with tilde")
      (japanese-jisx0212  . #x2A6C)	; ø»Š²©
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (ucs		  . #x0169)	; Å©
      ))
    (latin-iso8859-4	. #xDD)	; øº’¹
    (latin-viscii-upper . #xFB)	; øº’ž»
    (latin-viscii	. #x9D)	; øº’ž»
    (ucs		. #x0168)	; Å¨
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
      (ucs		  . #x0168)	; Å¨
      ))
    (japanese-jisx0212	. #x2A6C)	; ø»Š²©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with tilde")
      (japanese-jisx0212  . #x2B6C)	; ø»Š´‡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (ucs		  . #x0168)	; Å¨
      ))
    (latin-iso8859-4	. #xFD)	; øº’¹½
    (latin-tcvn5712	. #xF2)	; øº“š²
    (latin-viscii-lower . #xFB)	; øº’›
    (latin-viscii	. #xFB)	; øº’›
    (ucs		. #x0169)	; Å©
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
      (ucs		  . #x0169)	; Å©
      ))
    (japanese-jisx0212	. #x2B6C)	; ø»Š´‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with macron")
      (japanese-jisx0212  . #x2A69)	; ø»Š²¦
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (ucs		  . #x016B)	; Å«
      ))
    (latin-iso8859-4	. #xDE)	; øº’¹ž
    (ucs		. #x016A)	; Åª
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
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (ucs		  . #x016A)	; Åª
      ))
    (japanese-jisx0213	. 10615)
    (japanese-jisx0212	. #x2A69)	; ø»Š²¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with macron")
      (chinese-gb2312		  . #x2831)	; ø»„¦
      (japanese-jisx0212	  . #x2B69)	; ø»Š´„
      (japanese-jisx0213-1	  . #x297C)	; ø»¢ ‡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (ucs		  . #x016A)	; Åª
      ))
    (latin-iso8859-4	. #xFE)	; øº’¹¾
    (ucs		. #x016B)	; Å«
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
      (ucs		  . #x016B)	; Å«
      ))
    (chinese-gb2312		. #x2831)	; ø»„¦
    (japanese-jisx0212		. #x2B69)	; ø»Š´„
    (japanese-jisx0213-1	. #x297C)	; ø»¢ ‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with breve")
      (japanese-jisx0212	  . #x2A66)	; ø»Š²£
      (japanese-jisx0213-1	  . #x2A5E)	; ø»¢¡‡
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (ucs		  . #x016D)	; Å­
      ))
    (latin-iso8859-3	. #xDD)	; øº’·½
    (ucs		. #x016C)	; Å¬
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
      (ucs		  . #x016C)	; Å¬
      ))
    (japanese-jisx0212		. #x2A66)	; ø»Š²£
    (japanese-jisx0213-1	. #x2A5E)	; ø»¢¡‡
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with breve")
      (japanese-jisx0212	  . #x2B66)	; ø»Š´
      (japanese-jisx0213-1	  . #x2A64)	; ø»¢¡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (ucs		  . #x016C)	; Å¬
      ))
    (latin-iso8859-3	. #xFD)	; øº’¸
    (ucs		. #x016D)	; Å­
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
      (ucs		  . #x016D)	; Å­
      ))
    (japanese-jisx0212		. #x2B66)	; ø»Š´
    (japanese-jisx0213-1	. #x2A64)	; ø»¢¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ring above")
      (japanese-jisx0212	  . #x2A6B)	; ø»Š²¨
      (japanese-jisx0213-1	  . #x2A45)	; ø»¢ ®
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (ucs		  . #x016F)	; Å¯
      ))
    (latin-iso8859-2	. #xD9)	; øº’¶™
    (ucs		. #x016E)	; Å®
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
      (ucs		  . #x016E)	; Å®
      ))
    (japanese-jisx0212		. #x2A6B)	; ø»Š²¨
    (japanese-jisx0213-1	. #x2A45)	; ø»¢ ®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->fullwidth
     ((name . "fullwidth latin small letter u with ring above")
      (japanese-jisx0212	  . #x2B6B)	; ø»Š´†
      (japanese-jisx0213-1	  . #x2A55)	; ø»¢ ¾
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (ucs		  . #x016E)	; Å®
      ))
    (latin-iso8859-2	. #xF9)	; øº’¶¹
    (ucs		. #x016F)	; Å¯
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
      (ucs		  . #x016F)	; Å¯
      ))
    (japanese-jisx0212		. #x2B6B)	; ø»Š´†
    (japanese-jisx0213-1	. #x2A55)	; ø»¢ ¾
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with double acute")
      (japanese-jisx0212	  . #x2A68)	; ø»Š²¥
      (japanese-jisx0213-1	  . #x2A46)	; ø»¢ ¯
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (ucs		  . #x0171)	; Å±
      ))
    (latin-iso8859-2	. #xDB)	; øº’¶›
    (ucs		. #x0170)	; Å°
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
      (ucs		  . #x0170)	; Å°
      ))
    (japanese-jisx0212		. #x2A68)	; ø»Š²¥
    (japanese-jisx0213-1	. #x2A46)	; ø»¢ ¯
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter u with double acute")
      (japanese-jisx0212	  . #x2B68)	; ø»Š´ƒ
      (japanese-jisx0213-1	  . #x2A56)	; ø»¢ ¿
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (ucs		  . #x0170)	; Å°
      ))
    (latin-iso8859-2	. #xFB)	; øº’¶»
    (ucs		. #x0171)	; Å±
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
      (ucs		  . #x0171)	; Å±
      ))
    (japanese-jisx0212		. #x2B68)	; ø»Š´ƒ
    (japanese-jisx0213-1	. #x2A56)	; ø»¢ ¿
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ogonek")
      (japanese-jisx0212  . #x2A6A)	; ø»Š²§
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (ucs		  . #x0173)	; Å³
      ))
    (latin-iso8859-4	. #xD9)	; øº’¹™
    (ucs		. #x0172)	; Å²
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
      (ucs		  . #x0172)	; Å²
      ))
    (japanese-jisx0212	. #x2A6A)	; ø»Š²§
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with ogonek")
      (japanese-jisx0212  . #x2B6A)	; ø»Š´…
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (ucs		  . #x0172)	; Å²
      ))
    (latin-iso8859-4	. #xF9)	; øº’¹¹
    (ucs		. #x0173)	; Å³
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
      (ucs		  . #x0173)	; Å³
      ))
    (japanese-jisx0212	. #x2B6A)	; ø»Š´…
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter w with circumflex")
      (japanese-jisx0212  . #x2A71)	; ø»Š²®
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (ucs		  . #x0175)	; Åµ
      ))
    (ucs		. #x0174)	; Å´
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
      (ucs		  . #x0174)	; Å´
      ))
    (japanese-jisx0212	. #x2A71)	; ø»Š²®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter w with circumflex")
      (japanese-jisx0212  . #x2B71)	; ø»Š´Œ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (ucs		  . #x0174)	; Å´
      ))
    (ucs		. #x0175)	; Åµ
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
      (ucs		  . #x0175)	; Åµ
      ))
    (japanese-jisx0212	. #x2B71)	; ø»Š´Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with circumflex")
      (japanese-jisx0212  . #x2A74)	; ø»Š²±
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (ucs		  . #x0177)	; Å·
      ))
    (ucs		. #x0176)	; Å¶
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
      (ucs		  . #x0176)	; Å¶
      ))
    (japanese-jisx0212	. #x2A74)	; ø»Š²±
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter y with circumflex")
      (japanese-jisx0212  . #x2B74)	; ø»Š´
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (ucs		  . #x0176)	; Å¶
      ))
    (ucs		. #x0177)	; Å·
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
      (ucs		  . #x0177)	; Å·
      ))
    (japanese-jisx0212	. #x2B74)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with diaeresis")
      (japanese-jisx0212  . #x2A73)	; ø»Š²°
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (ucs		  . #x00FF)	; Ã¿
      ))
    (ucs		. #x0178)	; Å¸
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
      (ucs		  . #x0178)	; Å¸
      ))
    (japanese-jisx0212	. #x2A73)	; ø»Š²°
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with acute")
      (japanese-jisx0212	  . #x2A75)	; ø»Š²²
      (japanese-jisx0213-1	  . #x2A29)	; ø»¢ ’
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (ucs		  . #x017A)	; Åº
      ))
    (latin-iso8859-2	. #xAC)	; øº’µ¬
    (ucs		. #x0179)	; Å¹
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
      (ucs		  . #x0179)	; Å¹
      ))
    (japanese-jisx0212		. #x2A75)	; ø»Š²²
    (japanese-jisx0213-1	. #x2A29)	; ø»¢ ’
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with acute")
      (japanese-jisx0212	  . #x2B75)	; ø»Š´
      (japanese-jisx0213-1	  . #x2A35)	; ø»¢ ž
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (ucs		  . #x0179)	; Å¹
      ))
    (latin-iso8859-2	. #xBC)	; øº’µ¼
    (ucs		. #x017A)	; Åº
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
      (ucs		  . #x017A)	; Åº
      ))
    (japanese-jisx0212		. #x2B75)	; ø»Š´
    (japanese-jisx0213-1	. #x2A35)	; ø»¢ ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with dot above")
      (japanese-jisx0212	  . #x2A77)	; ø»Š²´
      (japanese-jisx0213-1	  . #x2A2B)	; ø»¢ ”
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (ucs		  . #x017C)	; Å¼
      ))
    (latin-iso8859-2	. #xAF)	; øº’µ¯
    (latin-iso8859-3	. #xAF)	; øº’·
    (ucs		. #x017B)	; Å»
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
      (ucs		  . #x017B)	; Å»
      ))
    (japanese-jisx0212		. #x2A77)	; ø»Š²´
    (japanese-jisx0213-1	. #x2A2B)	; ø»¢ ”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter z with dot above")
      (japanese-jisx0212	  . #x2B77)	; ø»Š´’
      (japanese-jisx0213-1	  . #x2A38)	; ø»¢ ¡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (ucs		  . #x017B)	; Å»
      ))
    (latin-iso8859-2	. #xBF)	; øº’µ¿
    (latin-iso8859-3	. #xBF)	; øº’·Ÿ
    (ucs		. #x017C)	; Å¼
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
      (ucs		  . #x017C)	; Å¼
      ))
    (japanese-jisx0212		. #x2B77)	; ø»Š´’
    (japanese-jisx0213-1	. #x2A38)	; ø»¢ ¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with caron")
      (japanese-jisx0212	  . #x2A76)	; ø»Š²³
      (japanese-jisx0213-1	  . #x2A2A)	; ø»¢ “
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (ucs		  . #x017E)	; Å¾
      ))
    (latin-iso8859-2	. #xAE)	; øº’µ®
    (latin-iso8859-4	. #xAE)	; øº’¸®
    (ucs		. #x017D)	; Å½
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
      (ucs		  . #x017D)	; Å½
      ))
    (japanese-jisx0212		. #x2A76)	; ø»Š²³
    (japanese-jisx0213-1	. #x2A2A)	; ø»¢ “
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with caron")
      (japanese-jisx0212	  . #x2B76)	; ø»Š´‘
      (japanese-jisx0213-1	  . #x2A37)	; ø»¢  
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (ucs		  . #x017D)	; Å½
      ))
    (latin-iso8859-2	. #xBE)	; øº’µ¾
    (latin-iso8859-4	. #xBE)	; øº’¸¾
    (ucs		. #x017E)	; Å¾
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
      (ucs		  . #x017E)	; Å¾
      ))
    (japanese-jisx0212		. #x2B76)	; ø»Š´‘
    (japanese-jisx0213-1	. #x2A37)	; ø»¢  
    ))
(define-char
  '((name		. "LATIN SMALL LETTER LONG S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0073)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (ucs		  . #x0053)	; S
      ))
    (ucs		. #x017F)	; Å¿
    ))
