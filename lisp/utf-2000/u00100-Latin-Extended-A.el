(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->lowercase	#x0101)
    (latin-iso8859-4	. #xC0)	; øº’¹€
    (ucs		. #x100)	; Ä€
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with macron")
    (->ucs		. #x0100)	; Ä€
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0100)
    (->lowercase
     ((name . "fullwidth latin small letter a with macron")))
    (japanese-jisx0212		. #x2A27)	; ø»Š±¤
    (japanese-jisx0213-1	. #x2975)	; ø»¢ €
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->uppercase	#x0100)
    (->titlecase	#x0100)
    (latin-iso8859-4	. #xE0)	; øº’¹ 
    (ucs		. #x101)	; Ä
    ))
(define-char
  '((name		. "fullwidth latin small letter a with macron")
    (->ucs		. #x0101)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0101)
    (->uppercase
     ((name . "fullwidth latin capital letter a with macron")))
    (->titlecase
     ((name . "fullwidth latin capital letter a with macron")))
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
    (->lowercase	#x0103)
    (latin-iso8859-2		. #xC3)	; øº’¶ƒ
    (latin-tcvn5712		. #xA1)	; øº“™¡
    (latin-viscii-upper		. #xE5)	; øº’ž¥
    (latin-viscii		. #xC5)	; øº’ž¥
    (ucs			. #x102)	; Ä‚
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with breve")
    (->ucs		. #x0102)	; Ä‚
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0102)
    (->lowercase
     ((name . "fullwidth latin small letter a with breve")))
    (japanese-jisx0212		. #x2A25)	; ø»Š±¢
    (japanese-jisx0213-1	. #x2A3A)	; ø»¢ £
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->uppercase	#x0102)
    (->titlecase	#x0102)
    (latin-iso8859-2		. #xE3)	; øº’¶£
    (latin-tcvn5712		. #xA8)	; øº“™¨
    (latin-viscii-lower		. #xE5)	; øº’…
    (latin-viscii		. #xE5)	; øº’…
    (ucs			. #x103)	; Äƒ
    ))
(define-char
  '((name		. "fullwidth latin small letter a with breve")
    (->ucs		. #x0103)	; Äƒ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0103)
    (->uppercase
     ((name . "fullwidth latin capital letter a with breve")))
    (->titlecase
     ((name . "fullwidth latin capital letter a with breve")))
    (japanese-jisx0212		. #x2B25)	; ø»Š³€
    (japanese-jisx0213-1	. #x2A49)	; ø»¢ ²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->lowercase	#x0105)
    (latin-iso8859-2	. #xA1)	; øº’µ¡
    (latin-iso8859-4	. #xA1)	; øº’¸¡
    (ucs		. #x104)	; Ä„
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with ogonek")
    (->ucs		. #x0104)	; Ä„
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0104)
    (->lowercase
     ((name . "fullwidth latin small letter a with ogonek")))
    (japanese-jisx0212		. #x2A28)	; ø»Š±¥
    (japanese-jisx0213-1	. #x2A21)	; ø»¢ Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->uppercase	#x0104)
    (->titlecase	#x0104)
    (latin-iso8859-2	. #xB1)	; øº’µ±
    (latin-iso8859-4	. #xB1)	; øº’¸±
    (ucs		. #x105)	; Ä…
    ))
(define-char
  '((name		. "fullwidth latin small letter a with ogonek")
    (->ucs		. #x0105)	; Ä…
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0105)
    (->uppercase
     ((name . "fullwidth latin capital letter a with ogonek")))
    (->titlecase
     ((name . "fullwidth latin capital letter a with ogonek")))
    (japanese-jisx0212		. #x2B28)	; ø»Š³ƒ
    (japanese-jisx0213-1	. #x2A2C)	; ø»¢ •
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->lowercase	#x0107)
    (latin-iso8859-2	. #xC6)	; øº’¶†
    (ucs		. #x106)	; Ä†
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with acute")
    (->ucs		. #x0106)	; Ä†
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0106)
    (->lowercase
     ((name . "fullwidth latin small letter c with acute")))
    (japanese-jisx0212		. #x2A2B)	; ø»Š±¨
    (japanese-jisx0213-1	. #x2A3C)	; ø»¢ ¥
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->uppercase	#x0106)
    (->titlecase	#x0106)
    (latin-iso8859-2	. #xE6)	; øº’¶¦
    (ucs		. #x107)	; Ä‡
    ))
(define-char
  '((name		. "fullwidth latin small letter c with acute")
    (->ucs		. #x0107)	; Ä‡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0107)
    (->uppercase
     ((name . "fullwidth latin capital letter c with acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter c with acute")))
    (japanese-jisx0212		. #x2B2B)	; ø»Š³†
    (japanese-jisx0213-1	. #x2A4B)	; ø»¢ ´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->lowercase	#x0109)
    (latin-iso8859-3	. #xC6)	; øº’·¦
    (ucs		. #x108)	; Äˆ
    ))
(define-char
  '((name . "fullwidth latin capital letter c with circumflex")
    (->ucs		. #x0108)	; Äˆ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0108)
    (->lowercase
     ((name . "fullwidth latin small letter c with circumflex")))
    (japanese-jisx0212		. #x2A2C)	; ø»Š±©
    (japanese-jisx0213-1	. #x2A59)	; ø»¢¡‚
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->uppercase	#x0108)
    (->titlecase	#x0108)
    (latin-iso8859-3	. #xE6)	; øº’¸†
    (ucs		. #x109)	; Ä‰
    ))
(define-char
  '((name		. "fullwidth latin small letter c with circumflex")
    (->ucs		. #x0109)	; Ä‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0109)
    (->uppercase
     ((name . "fullwidth latin capital letter c with circumflex")))
    (->titlecase
     ((name . "fullwidth latin capital letter c with circumflex")))
    (japanese-jisx0212		. #x2B2C)	; ø»Š³‡
    (japanese-jisx0213-1	. #x2A5F)	; ø»¢¡ˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->lowercase	#x010B)
    (latin-iso8859-3	. #xC5)	; øº’·¥
    (ucs		. #x10A)	; ÄŠ
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with dot above")
    (->ucs		. #x010A)	; ÄŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010A)
    (->lowercase
     ((name . "fullwidth latin small letter c with dot above")))
    (japanese-jisx0212	. #x2A2F)	; ø»Š±¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->uppercase	#x010A)
    (->titlecase	#x010A)
    (latin-iso8859-3	. #xE5)	; øº’¸…
    (ucs		. #x10B)	; Ä‹
    ))
(define-char
  '((name		. "fullwidth latin small letter c with dot above")
    (->ucs		. #x010B)	; Ä‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010B)
    (->uppercase
     ((name . "fullwidth latin capital letter c with dot above")))
    (->titlecase
     ((name . "fullwidth latin capital letter c with dot above")))
    (japanese-jisx0212	. #x2B2F)	; ø»Š³Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->lowercase	#x010D)
    (latin-iso8859-2	. #xC8)	; øº’¶ˆ
    (latin-iso8859-4	. #xC8)	; øº’¹ˆ
    (ucs		. #x10C)	; ÄŒ
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with caron")
    (->ucs		. #x010C)	; ÄŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010C)
    (->lowercase
     ((name . "fullwidth latin capital letter c with caron")))
    (japanese-jisx0212		. #x2A2D)	; ø»Š±ª
    (japanese-jisx0213-1	. #x2A3D)	; ø»¢ ¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->uppercase	#x010C)
    (->titlecase	#x010C)
    (latin-iso8859-2	. #xE8)	; øº’¶¨
    (latin-iso8859-4	. #xE8)	; øº’¹¨
    (ucs		. #x10D)	; Ä
    ))
(define-char
  '((name		. "fullwidth latin small letter c with caron")
    (->ucs		. #x010D)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010D)
    (->uppercase
     ((name . "fullwidth latin small letter c with caron")))
    (->titlecase
     ((name . "fullwidth latin small letter c with caron")))
    (japanese-jisx0212		. #x2B2D)	; ø»Š³ˆ
    (japanese-jisx0213-1	. #x2A4C)	; ø»¢ µ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->lowercase	#x010F)
    (latin-iso8859-2	. #xCF)	; øº’¶
    (ucs		. #x10E)	; ÄŽ
    ))
(define-char
  '((name		. "fullwidth latin capital letter d with caron")
    (->ucs		. #x010E)	; ÄŽ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010E)
    (->lowercase
     ((name . "fullwidth latin small letter d with caron")))
    (japanese-jisx0212		. #x2A30)	; ø»Š±­
    (japanese-jisx0213-1	. #x2A40)	; ø»¢ ©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->uppercase	#x010E)
    (->titlecase	#x010E)
    (latin-iso8859-2	. #xEF)	; øº’¶¯
    (ucs		. #x10F)	; Ä
    ))
(define-char
  '((name		. "fullwidth latin small letter d with caron")
    (->ucs		. #x010F)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010F)
    (->uppercase
     ((name . "fullwidth latin capital letter d with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter d with caron")))
    (japanese-jisx0212		. #x2B30)	; ø»Š³‹
    (japanese-jisx0213-1	. #x2A4F)	; ø»¢ ¸
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0111)
    (latin-iso8859-2		. #xD0)	; øº’¶
    (latin-iso8859-4		. #xD0)	; øº’¹
    (latin-tcvn5712		. #xA7)	; øº“™§
    (latin-viscii-upper		. #xF0)	; øº’ž°
    (latin-viscii		. #xD0)	; øº’ž°
    (ucs			. #x110)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
    (->ucs		. #x0110)	; Ä
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0110)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER D WITH STROKE")))
    (japanese-jisx0212	. #x2922)	; ø»Š°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0110)
    (->titlecase	#x0110)
    (latin-iso8859-2		. #xF0)	; øº’¶°
    (latin-iso8859-4		. #xF0)	; øº’¹°
    (latin-tcvn5712		. #xAE)	; øº“™®
    (latin-viscii-lower		. #xF0)	; øº’
    (latin-viscii		. #xF0)	; øº’
    (ucs			. #x111)	; Ä‘
    ))
(define-char
  '((name		. "fullwidth latin small letter d with stroke")
    (->ucs		. #x0111)	; Ä‘
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter d with stroke")))
    (->titlecase
     ((name . "fullwidth latin capital letter d with stroke")))
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
    (->lowercase	#x0113)
    (latin-iso8859-4	. #xAA)	; øº’¸ª
    (ucs		. #x112)	; Ä’
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with macron")
    (->ucs		. #x0112)	; Ä’
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0112)
    (->lowercase
     ((name . "fullwidth latin small letter e with macron")))
    (japanese-jisx0212		. #x2A37)	; ø»Š±´
    (japanese-jisx0213-1	. #x2978)	; ø»¢ ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->uppercase	#x0112)
    (->titlecase	#x0112)
    (latin-iso8859-4	. #xBA)	; øº’¸º
    (ucs		. #x113)	; Ä“
    ))
(define-char
  '((name		. "fullwidth latin small letter e with macron")
    (->ucs		. #x0113)	; Ä“
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0113)
    (->uppercase
     ((name . "fullwidth latin capital letter e with macron")))
    (->titlecase
     ((name . "fullwidth latin capital letter e with macron")))
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
    (->lowercase	#x0115)
    (ucs		. #x114)	; Ä”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0306)
    (->uppercase	#x0114)
    (->titlecase	#x0114)
    (ucs		. #x115)	; Ä•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0307)
    (->lowercase	#x0117)
    (latin-iso8859-4	. #xCC)	; øº’¹Œ
    (ucs		. #x116)	; Ä–
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (->ucs		. #x0116)	; Ä–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0116)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")))
    (japanese-jisx0212	. #x2A36)	; ø»Š±³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->uppercase	#x0116)
    (->titlecase	#x0116)
    (latin-iso8859-4	. #xEC)	; øº’¹¬
    (ucs		. #x117)	; Ä—
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
    (->ucs		. #x0117)	; Ä—
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0117)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")))
    (japanese-jisx0212	. #x2B36)	; ø»Š³‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->lowercase	#x0119)
    (latin-iso8859-2	. #xCA)	; øº’¶Š
    (latin-iso8859-4	. #xCA)	; øº’¹Š
    (ucs		. #x118)	; Ä˜
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with ogonek")
    (->ucs		. #x0118)	; Ä˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0118)
    (->lowercase
     ((name . "fullwidth latin small letter e with ogonek")))
    (japanese-jisx0212		. #x2A38)	; ø»Š±µ
    (japanese-jisx0213-1	. #x2A3E)	; ø»¢ §
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->uppercase	#x0118)
    (->titlecase	#x0118)
    (latin-iso8859-2	. #xEA)	; øº’¶ª
    (latin-iso8859-4	. #xEA)	; øº’¹ª
    (ucs		. #x119)	; Ä™
    ))
(define-char
  '((name		. "fullwidth latin small letter e with ogonek")
    (->ucs		. #x0119)	; Ä™
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0119)
    (->uppercase
     ((name . "fullwidth latin capital letter e with ogonek")))
    (->titlecase
     ((name . "fullwidth latin capital letter e with ogonek")))
    (japanese-jisx0212		. #x2B38)	; ø»Š³“
    (japanese-jisx0213-1	. #x2A4D)	; ø»¢ ¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->lowercase	#x011B)
    (latin-iso8859-2	. #xCC)	; øº’¶Œ
    (ucs		. #x11A)	; Äš
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with caron")
    (->ucs		. #x011A)	; Äš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011A)
    (->lowercase
     ((name . "fullwidth latin small letter e with caron")))
    (japanese-jisx0212		. #x2A35)	; ø»Š±²
    (japanese-jisx0213-1	. #x2A3F)	; ø»¢ ¨
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->uppercase	#x011A)
    (->titlecase	#x011A)
    (latin-iso8859-2	. #xEC)	; øº’¶¬
    (ucs		. #x11B)	; Ä›
    ))
(define-char
  '((name		. "fullwidth latin small letter e with caron")
    (->ucs		. #x011B)	; Ä›
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011B)
    (->uppercase
     ((name . "fullwidth latin capital letter e with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter e with caron")))
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
    (->lowercase	#x011D)
    (latin-iso8859-3	. #xD8)	; øº’·¸
    (ucs		. #x11C)	; Äœ
    ))
(define-char
  '((name . "fullwidth latin capital letter g with circumflex")
    (->ucs		. #x011C)	; Äœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011C)
    (->lowercase
     ((name . "fullwidth latin small letter g with circumflex")))
    (japanese-jisx0212		. #x2A3A)	; ø»Š±·
    (japanese-jisx0213-1	. #x2A5A)	; ø»¢¡ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->uppercase	#x011C)
    (->titlecase	#x011C)
    (latin-iso8859-3	. #xF8)	; øº’¸˜
    (ucs		. #x11D)	; Ä
    ))
(define-char
  '((name		. "fullwidth latin small letter g with circumflex")
    (->ucs		. #x011D)	; Ä
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011D)
    (->uppercase
     ((name . "fullwidth latin small letter g with circumflex")))
    (->titlecase
     ((name . "fullwidth latin small letter g with circumflex")))
    (japanese-jisx0212		. #x2B3A)	; ø»Š³•
    (japanese-jisx0213-1	. #x2A60)	; ø»¢¡‰
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->lowercase	#x011F)
    (latin-iso8859-3	. #xAB)	; øº’·‹
    (latin-iso8859-9	. #xD0)	; øº“†°
    (ucs		. #x11E)	; Äž
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
    (->ucs		. #x011E)	; Äž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")))
    (japanese-jisx0212	. #x2A3B)	; ø»Š±¸
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->uppercase	#x011E)
    (->titlecase	#x011E)
    (latin-iso8859-3	. #xBB)	; øº’·›
    (latin-iso8859-9	. #xF0)	; øº“‡
    (ucs		. #x11F)	; ÄŸ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
    (->ucs		. #x011F)	; ÄŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")))
    (japanese-jisx0212	. #x2B3B)	; ø»Š³–
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->lowercase	#x0121)
    (latin-iso8859-3	. #xD5)	; øº’·µ
    (ucs		. #x120)	; Ä 
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (->ucs		. #x0120)	; Ä 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0120)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")))
    (japanese-jisx0212	. #x2A3D)	; ø»Š±º
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->uppercase	#x0120)
    (->titlecase	#x0120)
    (latin-iso8859-3	. #xF5)	; øº’¸•
    (ucs		. #x121)	; Ä¡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
    (->ucs		. #x0121)	; Ä¡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0121)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")))
    (japanese-jisx0212	. #x2B3D)	; ø»Š³˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->lowercase	#x0123)
    (latin-iso8859-4	. #xAB)	; øº’¸«
    (ucs		. #x122)	; Ä¢
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH CEDILLA")
    (->ucs		. #x0122)	; Ä¢
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0122)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH CEDILLA")))
    (japanese-jisx0212	. #x2A3C)	; ø»Š±¹
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0327)
    (->uppercase	#x0122)
    (->titlecase	#x0122)
    (latin-iso8859-4	. #xBB)	; øº’¸»
    (ucs		. #x123)	; Ä£
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->lowercase	#x0125)
    (latin-iso8859-3	. #xA6)	; øº’·†
    (ucs		. #x124)	; Ä¤
    ))
(define-char
  '((name . "fullwidth latin capital letter h with circumflex")
    (->ucs		. #x0124)	; Ä¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0124)
    (->lowercase
     ((name . "fullwidth latin small letter h with circumflex")))
    (japanese-jisx0212		. #x2A3E)	; ø»Š±»
    (japanese-jisx0213-1	. #x2A5B)	; ø»¢¡„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->uppercase	#x0124)
    (->titlecase	#x0124)
    (latin-iso8859-3	. #xB6)	; øº’·–
    (ucs		. #x125)	; Ä¥
    ))
(define-char
  '((name		. "fullwidth latin small letter h with circumflex")
    (->ucs		. #x0125)	; Ä¥
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0125)
    (->uppercase
     ((name . "fullwidth latin capital letter h with circumflex")))
    (->titlecase
     ((name . "fullwidth latin capital letter h with circumflex")))
    (japanese-jisx0212		. #x2B3E)	; ø»Š³™
    (japanese-jisx0213-1	. #x2A61)	; ø»¢¡Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0127)
    (latin-iso8859-3	. #xA1)	; øº’·
    (ucs		. #x126)	; Ä¦
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER H WITH STROKE")
    (->ucs		. #x0126)	; Ä¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0126)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER H WITH STROKE")))
    (korean-ksc5601	. #x2824)	; ø»ˆ¤¡
    (japanese-jisx0212	. #x2924)	; ø»Š°ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0126)
    (->titlecase	#x0126)
    (latin-iso8859-3	. #xB1)	; øº’·‘
    (ucs		. #x127)	; Ä§
    ))
(define-char
  '((name		. "fullwidth latin small letter h with stroke")
    (->ucs		. #x0127)	; Ä§
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0127)
    (->uppercase
     ((name . "fullwidth latin capital letter h with stroke")))
    (->titlecase
     ((name . "fullwidth latin capital letter h with stroke")))
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
    (->lowercase	#x0129)
    (latin-iso8859-4		. #xA5)	; øº’¸¥
    (latin-viscii-upper		. #xEE)	; øº’ž®
    (latin-viscii		. #xCE)	; øº’ž®
    (ucs			. #x128)	; Ä¨
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH TILDE")
    (->ucs		. #x0128)	; Ä¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0128)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH TILDE")))
    (japanese-jisx0212	. #x2A47)	; ø»Š²„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->uppercase	#x0128)
    (->titlecase	#x0128)
    (latin-iso8859-4		. #xB5)	; øº’¸µ
    (latin-tcvn5712		. #xDC)	; øº“šœ
    (latin-viscii-lower		. #xEE)	; øº’Ž
    (latin-viscii		. #xEE)	; øº’Ž
    (ucs			. #x129)	; Ä©
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH TILDE")
    (->ucs		. #x0129)	; Ä©
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0129)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH TILDE")))
    (japanese-jisx0212	. #x2B47)	; ø»Š³¢
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->lowercase	#x012B)
    (latin-iso8859-4	. #xCF)	; øº’¹
    (ucs		. #x12A)	; Äª
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with macron")
    (->ucs		. #x012A)	; Äª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012A)
    (->lowercase
     ((name . "fullwidth latin small letter i with macron")))
    (japanese-jisx0212		. #x2A45)	; ø»Š²‚
    (japanese-jisx0213-1	. #x2976)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->uppercase	#x012A)
    (->titlecase	#x012A)
    (latin-iso8859-4	. #xEF)	; øº’¹¯
    (ucs		. #x12B)	; Ä«
    ))
(define-char
  '((name		. "fullwidth latin small letter i with macron")
    (->ucs		. #x012B)	; Ä«
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012B)
    (->uppercase
     ((name . "fullwidth latin capital letter i with macron")))
    (->titlecase
     ((name . "fullwidth latin capital letter i with macron")))
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
    (->lowercase	#x012D)
    (ucs		. #x12C)	; Ä¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0306)
    (->uppercase	#x012C)
    (->titlecase	#x012C)
    (ucs		. #x12D)	; Ä­
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0328)
    (->lowercase	#x012F)
    (latin-iso8859-4	. #xC7)	; øº’¹‡
    (ucs		. #x12E)	; Ä®
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH OGONEK")
    (->ucs		. #x012E)	; Ä®
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH OGONEK")))
    (japanese-jisx0212	. #x2A46)	; ø»Š²ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->uppercase	#x012E)
    (->titlecase	#x012E)
    (latin-iso8859-4	. #xE7)	; øº’¹§
    (ucs		. #x12F)	; Ä¯
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH OGONEK")
    (->ucs		. #x012F)	; Ä¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH OGONEK")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH OGONEK")))
    (japanese-jisx0212	. #x2B46)	; ø»Š³¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->lowercase	#x0069)
    (latin-iso8859-3	. #xA9)	; øº’·‰
    (latin-iso8859-9	. #xDD)	; øº“†½
    (ucs		. #x130)	; Ä°
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (->ucs		. #x0130)	; Ä°
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0130)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH DOT ABOVE")))
    (japanese-jisx0212	. #x2A44)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER DOTLESS I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0049)
    (->titlecase	#x0049)
    (latin-iso8859-3	. #xB9)	; øº’·™
    (latin-iso8859-9	. #xFD)	; øº“‡
    (ucs		. #x131)	; Ä±
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER DOTLESS I")
    (->ucs		. #x0131)	; Ä±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER DOTLESS I")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER DOTLESS I")))
    (korean-ksc5601	. #x2925)	; ø»ˆ¦€
    (japanese-jisx0212	. #x2945)	; ø»Š°¤
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0049 #x004A)
    (->lowercase	#x0133)
    (korean-ksc5601	. #x2826)	; ø»ˆ¤£
    (japanese-jisx0212	. #x2926)	; ø»Š°…
    (ucs		. #x132)	; Ä²
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->uppercase	#x0132)
    (->titlecase	#x0132)
    (ucs		. #x133)	; Ä³
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LIGATURE IJ")
    (->ucs		. #x0133)	; Ä³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0133)
    (->uppercase	#x0132)
    (->titlecase	#x0132)
    (korean-ksc5601	. #x2926)	; ø»ˆ¦
    (japanese-jisx0212	. #x2946)	; ø»Š°¥
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->lowercase	#x0135)
    (latin-iso8859-3	. #xAC)	; øº’·Œ
    (ucs		. #x134)	; Ä´
    ))
(define-char
  '((name . "fullwidth latin capital letter j with circumflex")
    (->ucs		. #x0134)	; Ä´
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0134)
    (->lowercase
     ((name . "fullwidth latin small letter j with circumflex")))
    (japanese-jisx0212		. #x2A48)	; ø»Š²…
    (japanese-jisx0213-1	. #x2A5C)	; ø»¢¡…
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->uppercase	#x0134)
    (->titlecase	#x0134)
    (latin-iso8859-3	. #xBC)	; øº’·œ
    (ucs		. #x135)	; Äµ
    ))
(define-char
  '((name		. "fullwidth latin small letter j with circumflex")
    (->ucs		. #x0135)	; Äµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0135)
    (->uppercase
     ((name . "fullwidth latin capital letter j with circumflex")))
    (->titlecase
     ((name . "fullwidth latin capital letter j with circumflex")))
    (japanese-jisx0212		. #x2B48)	; ø»Š³£
    (japanese-jisx0213-1	. #x2A62)	; ø»¢¡‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->lowercase	#x0137)
    (latin-iso8859-4	. #xD3)	; øº’¹“
    (ucs		. #x136)	; Ä¶
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER K WITH CEDILLA")
    (->ucs		. #x0136)	; Ä¶
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0136)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER K WITH CEDILLA")))
    (japanese-jisx0212	. #x2A49)	; ø»Š²†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->uppercase	#x0136)
    (->titlecase	#x0136)
    (latin-iso8859-4	. #xF3)	; øº’¹³
    (ucs		. #x137)	; Ä·
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER K WITH CEDILLA")
    (->ucs		. #x0137)	; Ä·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0137)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER K WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER K WITH CEDILLA")))
    (japanese-jisx0212	. #x2B49)	; ø»Š³¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (latin-iso8859-4	. #xA2)	; øº’¸¢
    (ucs		. #x138)	; Ä¸
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER KRA")
    (->ucs		. #x0138)	; Ä¸
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->decomposition	wide #x0138)
    (korean-ksc5601	. #x2927)	; ø»ˆ¦‚
    (japanese-jisx0212	. #x2947)	; ø»Š°¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->lowercase	#x013A)
    (latin-iso8859-2	. #xC5)	; øº’¶…
    (ucs		. #x139)	; Ä¹
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with acute")
    (->ucs		. #x0139)	; Ä¹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0139)
    (->lowercase
     ((name . "fullwidth latin small letter l with acute")))
    (japanese-jisx0212		. #x2A4A)	; ø»Š²‡
    (japanese-jisx0213-1	. #x2A3B)	; ø»¢ ¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->uppercase	#x0139)
    (->titlecase	#x0139)
    (latin-iso8859-2	. #xE5)	; øº’¶¥
    (ucs		. #x13A)	; Äº
    ))
(define-char
  '((name		. "fullwidth latin small letter l with acute")
    (->ucs		. #x013A)	; Äº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013A)
    (->uppercase
     ((name . "fullwidth latin capital letter l with acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter l with acute")))
    (japanese-jisx0212		. #x2B4A)	; ø»Š³¥
    (japanese-jisx0213-1	. #x2A4A)	; ø»¢ ³
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->lowercase	#x013C)
    (latin-iso8859-4	. #xA6)	; øº’¸¦
    (ucs		. #x13B)	; Ä»
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")
    (->ucs		. #x013B)	; Ä»
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013B)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")))
    (japanese-jisx0212	. #x2A4C)	; ø»Š²‰
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->uppercase	#x013B)
    (->titlecase	#x013B)
    (latin-iso8859-4	. #xB6)	; øº’¸¶
    (ucs		. #x13C)	; Ä¼
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH CEDILLA")
    (->ucs		. #x013C)	; Ä¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013C)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")))
    (japanese-jisx0212	. #x2B4C)	; ø»Š³§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->lowercase	#x013E)
    (latin-iso8859-2	. #xA5)	; øº’µ¥
    (ucs		. #x13D)	; Ä½
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with caron")
    (->ucs		. #x013D)	; Ä½
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013D)
    (->lowercase
     ((name . "fullwidth latin small letter l with caron")))
    (japanese-jisx0212		. #x2A4B)	; ø»Š²ˆ
    (japanese-jisx0213-1	. #x2A24)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->uppercase	#x013D)
    (->titlecase	#x013D)
    (latin-iso8859-2	. #xB5)	; øº’µµ
    (ucs		. #x13E)	; Ä¾
    ))
(define-char
  '((name		. "fullwidth latin small letter l with caron")
    (->ucs		. #x013E)	; Ä¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013E)
    (->uppercase
     ((name . "fullwidth latin capital letter l with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter l with caron")))
    (japanese-jisx0212		. #x2B4B)	; ø»Š³¦
    (japanese-jisx0213-1	. #x2A2F)	; ø»¢ ˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->lowercase	#x0140)
    (ucs		. #x13F)	; Ä¿
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (->ucs		. #x013F)	; Ä¿
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013F)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER L WITH MIDDLE DOT")))
    (korean-ksc5601	. #x2828)	; ø»ˆ¤¥
    (japanese-jisx0212	. #x2929)	; ø»Š°ˆ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->uppercase	#x013F)
    (->titlecase	#x013F)
    (ucs		. #x140)	; Å€
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH MIDDLE DOT")
    (->ucs		. #x0140)	; Å€
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0140)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH MIDDLE DOT")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH MIDDLE DOT")))
    (korean-ksc5601	. #x2928)	; ø»ˆ¦ƒ
    (japanese-jisx0212	. #x2949)	; ø»Š°¨
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0142)
    (latin-iso8859-2	. #xA3)	; øº’µ£
    (ucs		. #x141)	; Å
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with stroke")
    (->ucs		. #x0141)	; Å
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0141)
    (->lowercase
     ((name . "fullwidth latin small letter l with stroke")))
    (korean-ksc5601		. #x2829)	; ø»ˆ¤¦
    (japanese-jisx0212		. #x2928)	; ø»Š°‡
    (japanese-jisx0213-1	. #x2A23)	; ø»¢ Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0141)
    (->titlecase	#x0141)
    (latin-iso8859-2	. #xB3)	; øº’µ³
    (ucs		. #x142)	; Å‚
    ))
(define-char
  '((name		. "fullwidth latin small letter l with stroke")
    (->ucs		. #x0142)	; Å‚
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0142)
    (->uppercase
     ((name . "fullwidth latin capital letter l with stroke")))
    (->titlecase
     ((name . "fullwidth latin capital letter l with stroke")))
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
    (->lowercase	#x0144)
    (latin-iso8859-2	. #xD1)	; øº’¶‘
    (ucs		. #x143)	; Åƒ
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with acute")
    (->ucs		. #x0143)	; Åƒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0143)
    (->lowercase
     ((name . "fullwidth latin small letter n with acute")))
    (japanese-jisx0212		. #x2A4D)	; ø»Š²Š
    (japanese-jisx0213-1	. #x2A41)	; ø»¢ ª
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->uppercase	#x0143)
    (->titlecase	#x0143)
    (latin-iso8859-2	. #xF1)	; øº’¶±
    (ucs		. #x144)	; Å„
    ))
(define-char
  '((name		. "fullwidth latin small letter n with acute")
    (->ucs		. #x0144)	; Å„
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0144)
    (->uppercase
     ((name . "fullwidth latin capital letter n with acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter n with acute")))
    (japanese-jisx0212		. #x2B4D)	; ø»Š³¨
    (japanese-jisx0213-1	. #x2A51)	; ø»¢ º
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->lowercase	#x0146)
    (latin-iso8859-4	. #xD1)	; øº’¹‘
    (ucs		. #x145)	; Å…
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH CEDILLA")
    (->ucs		. #x0145)	; Å…
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0145)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH CEDILLA")))
    (japanese-jisx0212	. #x2A4F)	; ø»Š²Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->uppercase	#x0145)
    (->titlecase	#x0145)
    (latin-iso8859-4	. #xF1)	; øº’¹±
    (ucs		. #x146)	; Å†
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH CEDILLA")
    (->ucs		. #x0146)	; Å†
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0146)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH CEDILLA")))
    (japanese-jisx0212	. #x2B4F)	; ø»Š³ª
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->lowercase	#x0148)
    (latin-iso8859-2	. #xD2)	; øº’¶’
    (ucs		. #x147)	; Å‡
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with caron")
    (->ucs		. #x0147)	; Å‡
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0147)
    (->lowercase
     ((name . "fullwidth latin small letter n with caron")))
    (japanese-jisx0212		. #x2A4E)	; ø»Š²‹
    (japanese-jisx0213-1	. #x2A42)	; ø»¢ «
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->uppercase	#x0147)
    (->titlecase	#x0147)
    (latin-iso8859-2	. #xF2)	; øº’¶²
    (ucs		. #x148)	; Åˆ
    ))
(define-char
  '((name		. "fullwidth latin small letter n with caron")
    (->ucs		. #x0148)	; Åˆ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0148)
    (->uppercase
     ((name . "fullwidth latin capital letter n with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter n with caron")))
    (japanese-jisx0212		. #x2B4E)	; ø»Š³©
    (japanese-jisx0213-1	. #x2A52)	; ø»¢ »
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    (ucs		. #x149)	; Å‰
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (->ucs		. #x0149)	; Å‰
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0149)
    (korean-ksc5601	. #x2930)	; ø»ˆ¦‹
    (japanese-jisx0212	. #x294A)	; ø»Š°©
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->lowercase	#x014B)
    (latin-iso8859-4	. #xBD)	; øº’¸½
    (ucs		. #x14A)	; ÅŠ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER ENG")
    (->ucs		. #x014A)	; ÅŠ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->decomposition	wide #x014A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER ENG")))
    (korean-ksc5601	. #x282F)	; ø»ˆ¤¬
    (japanese-jisx0212	. #x292B)	; ø»Š°Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->uppercase	#x014A)
    (->titlecase	#x014A)
    (latin-iso8859-4	. #xBF)	; øº’¸¿
    (ipa		. #xD5)	; øº’›•
    (ucs		. #x14B)	; Å‹
    ))
(define-char
  '((name		. "fullwidth latin small letter eng")
    (->ucs		. #x014B)	; Å‹
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->decomposition	wide #x014B)
    (->uppercase
     ((name . "fullwidth latin capital letter eng")))
    (->titlecase
     ((name . "fullwidth latin capital letter eng")))
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
    (->lowercase	#x014D)
    (latin-iso8859-4	. #xD2)	; øº’¹’
    (ucs		. #x14C)	; ÅŒ
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with macron")
    (->ucs		. #x014C)	; ÅŒ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014C)
    (->lowercase
     ((name . "fullwidth latin small letter o with macron")))
    (japanese-jisx0212		. #x2A57)	; ø»Š²”
    (japanese-jisx0213-1	. #x2979)	; ø»¢ „
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->uppercase	#x014C)
    (->titlecase	#x014C)
    (latin-iso8859-4	. #xF2)	; øº’¹²
    (ucs		. #x14D)	; Å
    ))
(define-char
  '((name		. "fullwidth latin small letter o with macron")
    (->ucs		. #x014D)	; Å
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014D)
    (->uppercase
     ((name . "fullwidth latin capital letter o with macron")))
    (->titlecase
     ((name . "fullwidth latin capital letter o with macron")))
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
    (->lowercase	#x014F)
    (ucs		. #x14E)	; ÅŽ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0306)
    (->uppercase	#x014E)
    (->titlecase	#x014E)
    (ucs		. #x14F)	; Å
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x030B)
    (->lowercase	#x0151)
    (latin-iso8859-2	. #xD5)	; øº’¶•
    (ucs		. #x150)	; Å
    ))
(define-char
  '((name . "fullwidth latin capital letter o with double acute")
    (->ucs		. #x0150)	; Å
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0150)
    (->lowercase
     ((name . "fullwidth latin small letter o with double acute")))
    (japanese-jisx0212		. #x2A56)	; ø»Š²“
    (japanese-jisx0213-1	. #x2A43)	; ø»¢ ¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->uppercase	#x0150)
    (->titlecase	#x0150)
    (latin-iso8859-2	. #xF5)	; øº’¶µ
    (ucs		. #x151)	; Å‘
    ))
(define-char
  '((name . "fullwidth latin small letter o with double acute")
    (->ucs		. #x0151)	; Å‘
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0151)
    (->uppercase
     ((name . "fullwidth latin capital letter o with double acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter o with double acute")))
    (japanese-jisx0212		. #x2B56)	; ø»Š³±
    (japanese-jisx0213-1	. #x2A53)	; ø»¢ ¼
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0153)
    (korean-ksc5601		. #x282B)	; ø»ˆ¤¨
    (japanese-jisx0212		. #x292D)	; ø»Š°Œ
    (japanese-jisx0213-1	. #x2B2B)	; ø»¢¡²
    (ucs			. #x152)	; Å’
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0152)
    (->titlecase	#x0152)
    (ipa		. #xB0)	; øº’š°
    (ucs		. #x153)	; Å“
    ))
(define-char
  '((name		. "fullwidth latin small ligature oe")
    (->ucs		. #x0153)	; Å“
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0153)
    (->uppercase
     ((name . "fullwidth latin capital ligature oe")))
    (->titlecase
     ((name . "fullwidth latin capital ligature oe")))
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
    (->lowercase	#x0155)
    (latin-iso8859-2	. #xC0)	; øº’¶€
    (ucs		. #x154)	; Å”
    ))
(define-char
  '((name		. "fullwidth latin capital letter r with acute")
    (->ucs		. #x0154)	; Å”
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0154)
    (->lowercase
     ((name . "fullwidth latin small letter r with acute")))
    (japanese-jisx0212		. #x2A59)	; ø»Š²–
    (japanese-jisx0213-1	. #x2A39)	; ø»¢ ¢
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->uppercase	#x0154)
    (->titlecase	#x0154)
    (latin-iso8859-2	. #xE0)	; øº’¶ 
    (ucs		. #x155)	; Å•
    ))
(define-char
  '((name		. "fullwidth latin small letter r with acute")
    (->ucs		. #x0155)	; Å•
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0155)
    (->uppercase
     ((name . "fullwidth latin capital letter r with acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter r with acute")))
    (japanese-jisx0212		. #x2B59)	; ø»Š³´
    (japanese-jisx0213-1	. #x2A48)	; ø»¢ ±
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->lowercase	#x0157)
    (latin-iso8859-4	. #xA3)	; øº’¸£
    (ucs		. #x156)	; Å–
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")
    (->ucs		. #x0156)	; Å–
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0156)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER R WITH CEDILLA")))
    (japanese-jisx0212	. #x2A5B)	; ø»Š²˜
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->uppercase	#x0156)
    (->titlecase	#x0156)
    (latin-iso8859-4	. #xB3)	; øº’¸³
    (ucs		. #x157)	; Å—
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER R WITH CEDILLA")
    (->ucs		. #x0157)	; Å—
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0157)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")))
    (japanese-jisx0212	. #x2B5B)	; ø»Š³¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->lowercase	#x0159)
    (latin-iso8859-2	. #xD8)	; øº’¶˜
    (ucs		. #x158)	; Å˜
    ))
(define-char
  '((name		. "fullwidth latin capital letter r with caron")
    (->ucs		. #x0158)	; Å˜
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0158)
    (->lowercase
     ((name . "fullwidth latin small letter r with caron")))
    (japanese-jisx0212		. #x2A5A)	; ø»Š²—
    (japanese-jisx0213-1	. #x2A44)	; ø»¢ ­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->uppercase	#x0158)
    (->titlecase	#x0158)
    (latin-iso8859-2	. #xF8)	; øº’¶¸
    (ucs		. #x159)	; Å™
    ))
(define-char
  '((name		. "fullwidth latin small letter r with caron")
    (->ucs		. #x0159)	; Å™
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0159)
    (->uppercase
     ((name . "fullwidth latin capital letter r with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter r with caron")))
    (japanese-jisx0212		. #x2B5A)	; ø»Š³µ
    (japanese-jisx0213-1	. #x2A54)	; ø»¢ ½
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->lowercase	#x015B)
    (latin-iso8859-2	. #xA6)	; øº’µ¦
    (ucs		. #x15A)	; Åš
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with acute")
    (->ucs		. #x015A)	; Åš
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015A)
    (->lowercase
     ((name . "fullwidth latin small letter s with acute")))
    (japanese-jisx0212		. #x2A5C)	; ø»Š²™
    (japanese-jisx0213-1	. #x2A25)	; ø»¢ Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->uppercase	#x015A)
    (->titlecase	#x015A)
    (latin-iso8859-2		. #xB6)	; øº’µ¶
    (japanese-jisx0213-1	. #x2A30)	; ø»¢ ™
    (ucs			. #x15B)	; Å›
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER S WITH ACUTE")
    (->ucs		. #x015B)	; Å›
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")))
    (japanese-jisx0212	. #x2B5C)	; ø»Š³·
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->lowercase	#x015D)
    (latin-iso8859-3	. #xDE)	; øº’·¾
    (ucs		. #x15C)	; Åœ
    ))
(define-char
  '((name . "fullwidth latin capital letter s with circumflex")
    (->ucs		. #x015C)	; Åœ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015C)
    (->lowercase
     ((name . "fullwidth latin small letter s with circumflex")))
    (japanese-jisx0212		. #x2A5D)	; ø»Š²š
    (japanese-jisx0213-1	. #x2A5D)	; ø»¢¡†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->uppercase	#x015C)
    (->titlecase	#x015C)
    (latin-iso8859-3	. #xFE)	; øº’¸ž
    (ucs		. #x15D)	; Å
    ))
(define-char
  '((name		. "fullwidth latin small letter s with circumflex")
    (->ucs		. #x015D)	; Å
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015D)
    (->uppercase
     ((name . "fullwidth latin capital letter s with circumflex")))
    (->titlecase
     ((name . "fullwidth latin capital letter s with circumflex")))
    (japanese-jisx0212		. #x2B5D)	; ø»Š³¸
    (japanese-jisx0213-1	. #x2A63)	; ø»¢¡Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0053 #x0327)
    (->lowercase	#x015F)
    (latin-iso8859-2	. #xAA)	; øº’µª
    (latin-iso8859-3	. #xAA)	; øº’·Š
    (latin-iso8859-9	. #xDE)	; øº“†¾
    (ucs		. #x15E)	; Åž
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with cedilla")
    (->ucs		. #x015E)	; Åž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x015E)
    (->lowercase
     ((name . "fullwidth latin small letter s with cedilla")))
    (japanese-jisx0212		. #x2A5F)	; ø»Š²œ
    (japanese-jisx0213-1	. #x2A27)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0073 #x0327)
    (->uppercase	#x015E)
    (->titlecase	#x015E)
    (latin-iso8859-2	. #xBA)	; øº’µº
    (latin-iso8859-3	. #xBA)	; øº’·š
    (latin-iso8859-9	. #xFE)	; øº“‡ž
    (ucs		. #x15F)	; ÅŸ
    ))
(define-char
  '((name		. "fullwidth latin small letter s with cedilla")
    (->ucs		. #x015F)	; ÅŸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x015F)
    (->uppercase
     ((name . "fullwidth latin capital letter s with cedilla")))
    (->titlecase
     ((name . "fullwidth latin capital letter s with cedilla")))
    (japanese-jisx0212		. #x2B5F)	; ø»Š³º
    (japanese-jisx0213-1	. #x2A33)	; ø»¢ œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->lowercase	#x0161)
    (latin-iso8859-2	. #xA9)	; øº’µ©
    (latin-iso8859-4	. #xA9)	; øº’¸©
    (ucs		. #x160)	; Å 
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with caron")
    (->ucs		. #x0160)	; Å 
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0160)
    (->lowercase
     ((name . "fullwidth latin small letter s with caron")))
    (japanese-jisx0212		. #x2A5E)	; ø»Š²›
    (japanese-jisx0213-1	. #x2A26)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->uppercase	#x0160)
    (->titlecase	#x0160)
    (latin-iso8859-2	. #xB9)	; øº’µ¹
    (latin-iso8859-4	. #xB9)	; øº’¸¹
    (ucs		. #x161)	; Å¡
    ))
(define-char
  '((name		. "fullwidth latin small letter s with caron")
    (->ucs		. #x0161)	; Å¡
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0161)
    (->uppercase
     ((name . "fullwidth latin capital letter s with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter s with caron")))
    (japanese-jisx0212		. #x2B5E)	; ø»Š³¹
    (japanese-jisx0213-1	. #x2A32)	; ø»¢ ›
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0054 #x0327)
    (->lowercase	#x0163)
    (latin-iso8859-2	. #xDE)	; øº’¶ž
    (ucs		. #x162)	; Å¢
    ))
(define-char
  '((name		. "fullwidth latin capital letter t with cedilla")
    (->ucs		. #x0162)	; Å¢
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x0162)
    (->lowercase
     ((name . "fullwidth latin small letter t with cedilla")))
    (japanese-jisx0212		. #x2A61)	; ø»Š²ž
    (japanese-jisx0213-1	. #x2A47)	; ø»¢ °
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x0327)
    (->uppercase	#x0162)
    (->titlecase	#x0162)
    (latin-iso8859-2	. #xFE)	; øº’¶¾
    (ucs		. #x163)	; Å£
    ))
(define-char
  '((name		. "fullwidth latin small letter t with cedilla")
    (->ucs		. #x0163)	; Å£
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0163)
    (->uppercase
     ((name . "fullwidth latin capital letter t with cedilla")))
    (->titlecase
     ((name . "fullwidth latin capital letter t with cedilla")))
    (japanese-jisx0212		. #x2B61)	; ø»Š³¼
    (japanese-jisx0213-1	. #x2A57)	; ø»¢¡€
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->lowercase	#x0165)
    (latin-iso8859-2	. #xAB)	; øº’µ«
    (ucs		. #x164)	; Å¤
    ))
(define-char
  '((name		. "fullwidth latin capital letter t with caron")
    (->ucs		. #x0164)	; Å¤
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0164)
    (->lowercase
     ((name . "fullwidth latin capital letter t with caron")))
    (japanese-jisx0212		. #x2A60)	; ø»Š²
    (japanese-jisx0213-1	. #x2A28)	; ø»¢ ‘
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->uppercase	#x0164)
    (->titlecase	#x0164)
    (latin-iso8859-2	. #xBB)	; øº’µ»
    (ucs		. #x165)	; Å¥
    ))
(define-char
  '((name		. "fullwidth latin small letter t with caron")
    (->ucs		. #x0165)	; Å¥
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0165)
    (->uppercase
     ((name . "fullwidth latin capital letter t with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter t with caron")))
    (japanese-jisx0212		. #x2B60)	; ø»Š³»
    (japanese-jisx0213-1	. #x2A34)	; ø»¢ 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0167)
    (latin-iso8859-4	. #xAC)	; øº’¸¬
    (ucs		. #x166)	; Å¦
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER T WITH STROKE")
    (->ucs		. #x0166)	; Å¦
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0166)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER T WITH STROKE")))
    (korean-ksc5601	. #x282E)	; ø»ˆ¤«
    (japanese-jisx0212	. #x292F)	; ø»Š°Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0166)
    (->titlecase	#x0166)
    (latin-iso8859-4	. #xBC)	; øº’¸¼
    (ucs		. #x167)	; Å§
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER T WITH STROKE")
    (->ucs		. #x0167)	; Å§
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0167)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH STROKE")))
    (korean-ksc5601	. #x292E)	; ø»ˆ¦‰
    (japanese-jisx0212	. #x294F)	; ø»Š°®
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->lowercase	#x0169)
    (latin-iso8859-4		. #xDD)	; øº’¹
    (latin-viscii-upper		. #xFB)	; øº’ž»
    (latin-viscii		. #x9D)	; øº’ž»
    (ucs			. #x168)	; Å¨
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")
    (->ucs		. #x0168)	; Å¨
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0168)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")))
    (japanese-jisx0212	. #x2A6C)	; ø»Š²©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->uppercase	#x0168)
    (->titlecase	#x0168)
    (latin-iso8859-4		. #xFD)	; øº’¹½
    (latin-tcvn5712		. #xF2)	; øº“š²
    (latin-viscii-lower		. #xFB)	; øº’›
    (latin-viscii		. #xFB)	; øº’›
    (ucs			. #x169)	; Å©
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH TILDE")
    (->ucs		. #x0169)	; Å©
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0169)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")))
    (japanese-jisx0212	. #x2B6C)	; ø»Š´‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->lowercase	#x016B)
    (latin-iso8859-4	. #xDE)	; øº’¹ž
    (ucs		. #x16A)	; Åª
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with macron")
    (->ucs		. #x016A)	; Åª
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016A)
    (->lowercase
     ((name . "fullwidth latin small letter u with macron")))
    (japanese-jisx0213	. 10615)
    (japanese-jisx0212	. #x2A69)	; ø»Š²¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->uppercase	#x016A)
    (->titlecase	#x016A)
    (latin-iso8859-4	. #xFE)	; øº’¹¾
    (ucs		. #x16B)	; Å«
    ))
(define-char
  '((name		. "fullwidth latin small letter u with macron")
    (->ucs		. #x016B)	; Å«
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016B)
    (->uppercase
     ((name . "fullwidth latin capital letter u with macron")))
    (->titlecase
     ((name . "fullwidth latin capital letter u with macron")))
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
    (->lowercase	#x016D)
    (latin-iso8859-3	. #xDD)	; øº’·½
    (ucs		. #x16C)	; Å¬
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with breve")
    (->ucs		. #x016C)	; Å¬
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016C)
    (->lowercase
     ((name . "fullwidth latin small letter u with breve")))
    (japanese-jisx0212		. #x2A66)	; ø»Š²£
    (japanese-jisx0213-1	. #x2A5E)	; ø»¢¡‡
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->uppercase	#x016C)
    (->titlecase	#x016C)
    (latin-iso8859-3	. #xFD)	; øº’¸
    (ucs		. #x16D)	; Å­
    ))
(define-char
  '((name		. "fullwidth latin small letter u with breve")
    (->ucs		. #x016D)	; Å­
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016D)
    (->uppercase
     ((name . "fullwidth latin capital letter u with breve")))
    (->titlecase
     ((name . "fullwidth latin capital letter u with breve")))
    (japanese-jisx0212		. #x2B66)	; ø»Š´
    (japanese-jisx0213-1	. #x2A64)	; ø»¢¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->lowercase	#x016F)
    (latin-iso8859-2	. #xD9)	; øº’¶™
    (ucs		. #x16E)	; Å®
    ))
(define-char
  '((name . "fullwidth latin capital letter u with ring above")
    (->ucs		. #x016E)	; Å®
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016E)
    (->lowercase
     ((name . "fullwidth latin small letter u with ring above")))
    (japanese-jisx0212		. #x2A6B)	; ø»Š²¨
    (japanese-jisx0213-1	. #x2A45)	; ø»¢ ®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->uppercase	#x016E)
    (->titlecase	#x016E)
    (latin-iso8859-2	. #xF9)	; øº’¶¹
    (ucs		. #x16F)	; Å¯
    ))
(define-char
  '((name		. "fullwidth latin small letter u with ring above")
    (->ucs		. #x016F)	; Å¯
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016F)
    (->uppercase
     ((name . "fullwidth latin capital letter u with ring above")))
    (->titlecase
     ((name . "fullwidth latin capital letter u with ring above")))
    (japanese-jisx0212		. #x2B6B)	; ø»Š´†
    (japanese-jisx0213-1	. #x2A55)	; ø»¢ ¾
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->lowercase	#x0171)
    (latin-iso8859-2	. #xDB)	; øº’¶›
    (ucs		. #x170)	; Å°
    ))
(define-char
  '((name . "fullwidth latin capital letter u with double acute")
    (->ucs		. #x0170)	; Å°
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0170)
    (->lowercase
     ((name . "fullwidth latin small letter u with double acute")))
    (japanese-jisx0212		. #x2A68)	; ø»Š²¥
    (japanese-jisx0213-1	. #x2A46)	; ø»¢ ¯
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->uppercase	#x0170)
    (->titlecase	#x0170)
    (latin-iso8859-2	. #xFB)	; øº’¶»
    (ucs		. #x171)	; Å±
    ))
(define-char
  '((name . "fullwidth latin small letter u with double acute")
    (->ucs		. #x0171)	; Å±
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0171)
    (->uppercase
     ((name . "fullwidth latin capital letter u with double acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter u with double acute")))
    (japanese-jisx0212		. #x2B68)	; ø»Š´ƒ
    (japanese-jisx0213-1	. #x2A56)	; ø»¢ ¿
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->lowercase	#x0173)
    (latin-iso8859-4	. #xD9)	; øº’¹™
    (ucs		. #x172)	; Å²
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH OGONEK")
    (->ucs		. #x0172)	; Å²
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0172)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH OGONEK")))
    (japanese-jisx0212	. #x2A6A)	; ø»Š²§
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->uppercase	#x0172)
    (->titlecase	#x0172)
    (latin-iso8859-4	. #xF9)	; øº’¹¹
    (ucs		. #x173)	; Å³
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH OGONEK")
    (->ucs		. #x0173)	; Å³
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0173)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH OGONEK")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH OGONEK")))
    (japanese-jisx0212	. #x2B6A)	; ø»Š´…
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->lowercase	#x0175)
    (ucs		. #x174)	; Å´
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (->ucs		. #x0174)	; Å´
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0174)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER W WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A71)	; ø»Š²®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->uppercase	#x0174)
    (->titlecase	#x0174)
    (ucs		. #x175)	; Åµ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (->ucs		. #x0175)	; Åµ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0175)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER W WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER W WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B71)	; ø»Š´Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->lowercase	#x0177)
    (ucs		. #x176)	; Å¶
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (->ucs		. #x0176)	; Å¶
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0176)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2A74)	; ø»Š²±
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->uppercase	#x0176)
    (->titlecase	#x0176)
    (ucs		. #x177)	; Å·
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (->ucs		. #x0177)	; Å·
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0177)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")))
    (japanese-jisx0212	. #x2B74)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->lowercase	#x00FF)
    (ucs		. #x178)	; Å¸
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (->ucs		. #x0178)	; Å¸
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0178)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH DIAERESIS")))
    (japanese-jisx0212	. #x2A73)	; ø»Š²°
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->lowercase	#x017A)
    (latin-iso8859-2	. #xAC)	; øº’µ¬
    (ucs		. #x179)	; Å¹
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with acute")
    (->ucs		. #x0179)	; Å¹
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0179)
    (->lowercase
     ((name . "fullwidth latin small letter z with acute")))
    (japanese-jisx0212		. #x2A75)	; ø»Š²²
    (japanese-jisx0213-1	. #x2A29)	; ø»¢ ’
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->uppercase	#x0179)
    (->titlecase	#x0179)
    (latin-iso8859-2	. #xBC)	; øº’µ¼
    (ucs		. #x17A)	; Åº
    ))
(define-char
  '((name		. "fullwidth latin small letter z with acute")
    (->ucs		. #x017A)	; Åº
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017A)
    (->uppercase
     ((name . "fullwidth latin capital letter z with acute")))
    (->titlecase
     ((name . "fullwidth latin capital letter z with acute")))
    (japanese-jisx0212		. #x2B75)	; ø»Š´
    (japanese-jisx0213-1	. #x2A35)	; ø»¢ ž
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->lowercase	#x017C)
    (latin-iso8859-2	. #xAF)	; øº’µ¯
    (latin-iso8859-3	. #xAF)	; øº’·
    (ucs		. #x17B)	; Å»
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with dot above")
    (->ucs		. #x017B)	; Å»
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017B)
    (->lowercase
     ((name . "fullwidth latin small letter z with dot above")))
    (japanese-jisx0212		. #x2A77)	; ø»Š²´
    (japanese-jisx0213-1	. #x2A2B)	; ø»¢ ”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->uppercase	#x017B)
    (->titlecase	#x017B)
    (latin-iso8859-2	. #xBF)	; øº’µ¿
    (latin-iso8859-3	. #xBF)	; øº’·Ÿ
    (ucs		. #x17C)	; Å¼
    ))
(define-char
  '((name		. "fullwidth latin small letter z with dot above")
    (->ucs		. #x017C)	; Å¼
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017C)
    (->uppercase
     ((name . "fullwidth latin capital letter z with dot above")))
    (->titlecase
     ((name . "fullwidth latin capital letter z with dot above")))
    (japanese-jisx0212		. #x2B77)	; ø»Š´’
    (japanese-jisx0213-1	. #x2A38)	; ø»¢ ¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->lowercase	#x017E)
    (latin-iso8859-2	. #xAE)	; øº’µ®
    (latin-iso8859-4	. #xAE)	; øº’¸®
    (ucs		. #x17D)	; Å½
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with caron")
    (->ucs		. #x017D)	; Å½
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017D)
    (->lowercase
     ((name . "fullwidth latin small letter z with caron")))
    (japanese-jisx0212		. #x2A76)	; ø»Š²³
    (japanese-jisx0213-1	. #x2A2A)	; ø»¢ “
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->uppercase	#x017D)
    (->titlecase	#x017D)
    (latin-iso8859-2	. #xBE)	; øº’µ¾
    (latin-iso8859-4	. #xBE)	; øº’¸¾
    (ucs		. #x17E)	; Å¾
    ))
(define-char
  '((name		. "fullwidth latin small letter z with caron")
    (->ucs		. #x017E)	; Å¾
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017E)
    (->uppercase
     ((name . "fullwidth latin capital letter z with caron")))
    (->titlecase
     ((name . "fullwidth latin capital letter z with caron")))
    (japanese-jisx0212		. #x2B76)	; ø»Š´‘
    (japanese-jisx0213-1	. #x2A37)	; ø»¢  
    ))
(define-char
  '((name		. "LATIN SMALL LETTER LONG S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0073)
    (->uppercase	#x0053)
    (->titlecase	#x0053)
    (ucs		. #x17F)	; Å¿
    ))
