(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (ucs		. #x0100)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->lowercase	#x0101)
    (latin-iso8859-4		#xC0)	; øº’¹€
    (japanese-jisx0213-1	#x29 #x75)	; Ä€
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH MACRON")
    (->ucs		. #x0100)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0100)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH MACRON")))
    (japanese-jisx0212	#x2A #x27)	; ø»Š±¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (ucs		. #x0101)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->uppercase	#x0100)
    (->titlecase	#x0100)
    (latin-iso8859-4		#xE0)	; øº’¹ 
    (japanese-jisx0213-1	#x29 #x7A)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH MACRON")
    (->ucs		. #x0101)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0101)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH MACRON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH MACRON")))
    (chinese-gb2312	#x28 #x21)	; ø»„–
    (japanese-jisx0212	#x2B #x27)	; ø»Š³‚
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (ucs		. #x0102)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->lowercase	#x0103)
    (latin-iso8859-2		#xC3)	; øº’¶ƒ
    (latin-viscii-upper		#xE5)	; Ä‚
    (latin-viscii		#xC5)	; Ä‚
    (japanese-jisx0213-1	#x2A #x3A)	; Ä‚
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH BREVE")
    (->ucs		. #x0102)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0102)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH BREVE")))
    (japanese-jisx0212	#x2A #x25)	; ø»Š±¢
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (ucs		. #x0103)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->uppercase	#x0102)
    (->titlecase	#x0102)
    (latin-iso8859-2		#xE3)	; øº’¶£
    (latin-viscii-lower		#xE5)	; Äƒ
    (latin-viscii		#xE5)	; Äƒ
    (japanese-jisx0213-1	#x2A #x49)	; Äƒ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH BREVE")
    (->ucs		. #x0103)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0103)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH BREVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH BREVE")))
    (japanese-jisx0212	#x2B #x25)	; ø»Š³€
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (ucs		. #x0104)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->lowercase	#x0105)
    (latin-iso8859-2		#xA1)	; øº’µ¡
    (latin-iso8859-4		#xA1)	; øº’¸¡
    (japanese-jisx0213-1	#x2A #x21)	; Ä„
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER A WITH OGONEK")
    (->ucs		. #x0104)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0104)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER A WITH OGONEK")))
    (japanese-jisx0212	#x2A #x28)	; ø»Š±¥
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (ucs		. #x0105)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->uppercase	#x0104)
    (->titlecase	#x0104)
    (latin-iso8859-2		#xB1)	; øº’µ±
    (latin-iso8859-4		#xB1)	; øº’¸±
    (japanese-jisx0213-1	#x2A #x2C)	; Ä…
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER A WITH OGONEK")
    (->ucs		. #x0105)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0105)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH OGONEK")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER A WITH OGONEK")))
    (japanese-jisx0212	#x2B #x28)	; ø»Š³ƒ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (ucs		. #x0106)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->lowercase	#x0107)
    (latin-iso8859-2		#xC6)	; øº’¶†
    (japanese-jisx0213-1	#x2A #x3C)	; Ä†
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH ACUTE")
    (->ucs		. #x0106)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0106)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH ACUTE")))
    (japanese-jisx0212	#x2A #x2B)	; ø»Š±¨
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (ucs		. #x0107)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->uppercase	#x0106)
    (->titlecase	#x0106)
    (latin-iso8859-2		#xE6)	; øº’¶¦
    (japanese-jisx0213-1	#x2A #x4B)	; Ä‡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH ACUTE")
    (->ucs		. #x0107)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0107)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH ACUTE")))
    (japanese-jisx0212	#x2B #x2B)	; ø»Š³†
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (ucs		. #x0108)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->lowercase	#x0109)
    (latin-iso8859-3		#xC6)	; øº’·¦
    (japanese-jisx0213-1	#x2A #x59)	; Äˆ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (->ucs		. #x0108)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0108)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x2C)	; ø»Š±©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (ucs		. #x0109)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->uppercase	#x0108)
    (->titlecase	#x0108)
    (latin-iso8859-3		#xE6)	; øº’¸†
    (japanese-jisx0213-1	#x2A #x5F)	; Ä‰
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (->ucs		. #x0109)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0109)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x2C)	; ø»Š³‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (ucs		. #x010A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->lowercase	#x010B)
    (latin-iso8859-3	#xC5)	; øº’·¥
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (->ucs		. #x010A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH DOT ABOVE")))
    (japanese-jisx0212	#x2A #x2F)	; ø»Š±¬
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (ucs		. #x010B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->uppercase	#x010A)
    (->titlecase	#x010A)
    (latin-iso8859-3	#xE5)	; øº’¸…
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH DOT ABOVE")
    (->ucs		. #x010B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH DOT ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH DOT ABOVE")))
    (japanese-jisx0212	#x2B #x2F)	; ø»Š³Š
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (ucs		. #x010C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->lowercase	#x010D)
    (latin-iso8859-2		#xC8)	; øº’¶ˆ
    (latin-iso8859-4		#xC8)	; øº’¹ˆ
    (japanese-jisx0213-1	#x2A #x3D)	; ÄŒ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER C WITH CARON")
    (->ucs		. #x010C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010C)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER C WITH CARON")))
    (japanese-jisx0212	#x2A #x2D)	; ø»Š±ª
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (ucs		. #x010D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->uppercase	#x010C)
    (->titlecase	#x010C)
    (latin-iso8859-2		#xE8)	; øº’¶¨
    (latin-iso8859-4		#xE8)	; øº’¹¨
    (japanese-jisx0213-1	#x2A #x4C)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER C WITH CARON")
    (->ucs		. #x010D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010D)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER C WITH CARON")))
    (japanese-jisx0212	#x2B #x2D)	; ø»Š³ˆ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (ucs		. #x010E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->lowercase	#x010F)
    (latin-iso8859-2		#xCF)	; øº’¶
    (japanese-jisx0213-1	#x2A #x40)	; ÄŽ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER D WITH CARON")
    (->ucs		. #x010E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER D WITH CARON")))
    (japanese-jisx0212	#x2A #x30)	; ø»Š±­
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (ucs		. #x010F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->uppercase	#x010E)
    (->titlecase	#x010E)
    (latin-iso8859-2		#xEF)	; øº’¶¯
    (japanese-jisx0213-1	#x2A #x4F)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER D WITH CARON")
    (->ucs		. #x010F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH CARON")))
    (japanese-jisx0212	#x2B #x30)	; ø»Š³‹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (ucs		. #x0110)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0111)
    (latin-iso8859-2	#xD0)	; øº’¶
    (latin-iso8859-4	#xD0)	; øº’¹
    (latin-viscii-upper #xF0)	; Ä
    (latin-viscii	#xD0)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
    (->ucs		. #x0110)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0110)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER D WITH STROKE")))
    (japanese-jisx0212	#x29 #x22)	; ø»Š°
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (ucs		. #x0111)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0110)
    (->titlecase	#x0110)
    (latin-iso8859-2		#xF0)	; øº’¶°
    (latin-iso8859-4		#xF0)	; øº’¹°
    (latin-viscii-lower		#xF0)	; Ä‘
    (latin-viscii		#xF0)	; Ä‘
    (japanese-jisx0213-1	#x2A #x50)	; Ä‘
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER D WITH STROKE")
    (->ucs		. #x0111)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")))
    (korean-ksc5601	#x29 #x22)	; ø»ˆ¥½
    (japanese-jisx0212	#x29 #x42)	; ø»Š°¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (ucs		. #x0112)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->lowercase	#x0113)
    (latin-iso8859-4		#xAA)	; øº’¸ª
    (japanese-jisx0213-1	#x29 #x78)	; Ä’
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH MACRON")
    (->ucs		. #x0112)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0112)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH MACRON")))
    (japanese-jisx0212	#x2A #x37)	; ø»Š±´
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (ucs		. #x0113)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->uppercase	#x0112)
    (->titlecase	#x0112)
    (latin-iso8859-4		#xBA)	; øº’¸º
    (japanese-jisx0213-1	#x29 #x7D)	; Ä“
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH MACRON")
    (->ucs		. #x0113)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0113)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH MACRON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH MACRON")))
    (chinese-gb2312	#x28 #x25)	; ø»„š
    (japanese-jisx0212	#x2B #x37)	; ø»Š³’
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH BREVE")
    (ucs		. #x0114)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0306)
    (->lowercase	#x0115)
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH BREVE")
    (ucs		. #x0115)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0306)
    (->uppercase	#x0114)
    (->titlecase	#x0114)
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (ucs		. #x0116)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0307)
    (->lowercase	#x0117)
    (latin-iso8859-4	#xCC)	; øº’¹Œ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (->ucs		. #x0116)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0116)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")))
    (japanese-jisx0212	#x2A #x36)	; ø»Š±³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (ucs		. #x0117)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->uppercase	#x0116)
    (->titlecase	#x0116)
    (latin-iso8859-4	#xEC)	; øº’¹¬
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
    (->ucs		. #x0117)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0117)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")))
    (japanese-jisx0212	#x2B #x36)	; ø»Š³‘
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (ucs		. #x0118)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->lowercase	#x0119)
    (latin-iso8859-2		#xCA)	; øº’¶Š
    (latin-iso8859-4		#xCA)	; øº’¹Š
    (japanese-jisx0213-1	#x2A #x3E)	; Ä˜
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH OGONEK")
    (->ucs		. #x0118)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0118)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH OGONEK")))
    (japanese-jisx0212	#x2A #x38)	; ø»Š±µ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (ucs		. #x0119)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->uppercase	#x0118)
    (->titlecase	#x0118)
    (latin-iso8859-2		#xEA)	; øº’¶ª
    (latin-iso8859-4		#xEA)	; øº’¹ª
    (japanese-jisx0213-1	#x2A #x4D)	; Ä™
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH OGONEK")
    (->ucs		. #x0119)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0119)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH OGONEK")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH OGONEK")))
    (japanese-jisx0212	#x2B #x38)	; ø»Š³“
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (ucs		. #x011A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->lowercase	#x011B)
    (latin-iso8859-2		#xCC)	; øº’¶Œ
    (japanese-jisx0213-1	#x2A #x3F)	; Äš
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER E WITH CARON")
    (->ucs		. #x011A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH CARON")))
    (japanese-jisx0212	#x2A #x35)	; ø»Š±²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (ucs		. #x011B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->uppercase	#x011A)
    (->titlecase	#x011A)
    (latin-iso8859-2		#xEC)	; øº’¶¬
    (japanese-jisx0213-1	#x2A #x4E)	; Ä›
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER E WITH CARON")
    (->ucs		. #x011B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH CARON")))
    (chinese-gb2312	#x28 #x27)	; ø»„œ
    (japanese-jisx0212	#x2B #x35)	; ø»Š³
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (ucs		. #x011C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->lowercase	#x011D)
    (latin-iso8859-3		#xD8)	; øº’·¸
    (japanese-jisx0213-1	#x2A #x5A)	; Äœ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (->ucs		. #x011C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011C)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x3A)	; ø»Š±·
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (ucs		. #x011D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->uppercase	#x011C)
    (->titlecase	#x011C)
    (latin-iso8859-3		#xF8)	; øº’¸˜
    (japanese-jisx0213-1	#x2A #x60)	; Ä
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (->ucs		. #x011D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011D)
    (->uppercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x3A)	; ø»Š³•
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (ucs		. #x011E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->lowercase	#x011F)
    (latin-iso8859-3	#xAB)	; øº’·‹
    (latin-iso8859-9	#xD0)	; øº“†°
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
    (->ucs		. #x011E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")))
    (japanese-jisx0212	#x2A #x3B)	; ø»Š±¸
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (ucs		. #x011F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->uppercase	#x011E)
    (->titlecase	#x011E)
    (latin-iso8859-3	#xBB)	; øº’·›
    (latin-iso8859-9	#xF0)	; øº“‡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
    (->ucs		. #x011F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")))
    (japanese-jisx0212	#x2B #x3B)	; ø»Š³–
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (ucs		. #x0120)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->lowercase	#x0121)
    (latin-iso8859-3	#xD5)	; øº’·µ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (->ucs		. #x0120)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0120)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")))
    (japanese-jisx0212	#x2A #x3D)	; ø»Š±º
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (ucs		. #x0121)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->uppercase	#x0120)
    (->titlecase	#x0120)
    (latin-iso8859-3	#xF5)	; øº’¸•
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
    (->ucs		. #x0121)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0121)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")))
    (japanese-jisx0212	#x2B #x3D)	; ø»Š³˜
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (ucs		. #x0122)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->lowercase	#x0123)
    (latin-iso8859-4	#xAB)	; øº’¸«
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH CEDILLA")
    (->ucs		. #x0122)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0122)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x3C)	; ø»Š±¹
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CEDILLA")
    (ucs		. #x0123)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0327)
    (->uppercase	#x0122)
    (->titlecase	#x0122)
    (latin-iso8859-4	#xBB)	; øº’¸»
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (ucs		. #x0124)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->lowercase	#x0125)
    (latin-iso8859-3		#xA6)	; øº’·†
    (japanese-jisx0213-1	#x2A #x5B)	; Ä¤
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (->ucs		. #x0124)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0124)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER H WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x3E)	; ø»Š±»
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (ucs		. #x0125)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->uppercase	#x0124)
    (->titlecase	#x0124)
    (latin-iso8859-3		#xB6)	; øº’·–
    (japanese-jisx0213-1	#x2A #x61)	; Ä¥
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (->ucs		. #x0125)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0125)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER H WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER H WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x3E)	; ø»Š³™
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (ucs		. #x0126)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0127)
    (latin-iso8859-3	#xA1)	; øº’·
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER H WITH STROKE")
    (->ucs		. #x0126)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0126)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER H WITH STROKE")))
    (korean-ksc5601	#x28 #x24)	; ø»ˆ¤¡
    (japanese-jisx0212	#x29 #x24)	; ø»Š°ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (ucs		. #x0127)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0126)
    (->titlecase	#x0126)
    (latin-iso8859-3		#xB1)	; øº’·‘
    (japanese-jisx0213-1	#x2A #x7D)	; Ä§
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER H WITH STROKE")
    (->ucs		. #x0127)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0127)
    (->uppercase	#x0126)
    (->titlecase	#x0126)
    (korean-ksc5601	#x29 #x24)	; ø»ˆ¥¿
    (japanese-jisx0212	#x29 #x44)	; ø»Š°£
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (ucs		. #x0128)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->lowercase	#x0129)
    (latin-iso8859-4	#xA5)	; øº’¸¥
    (latin-viscii-upper #xEE)	; Ä¨
    (latin-viscii	#xCE)	; Ä¨
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH TILDE")
    (->ucs		. #x0128)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0128)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH TILDE")))
    (japanese-jisx0212	#x2A #x47)	; ø»Š²„
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (ucs		. #x0129)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->uppercase	#x0128)
    (->titlecase	#x0128)
    (latin-iso8859-4	#xB5)	; øº’¸µ
    (latin-viscii-lower #xEE)	; Ä©
    (latin-viscii	#xEE)	; Ä©
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH TILDE")
    (->ucs		. #x0129)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0129)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH TILDE")))
    (japanese-jisx0212	#x2B #x47)	; ø»Š³¢
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (ucs		. #x012A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->lowercase	#x012B)
    (latin-iso8859-4		#xCF)	; øº’¹
    (japanese-jisx0213-1	#x29 #x76)	; Äª
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH MACRON")
    (->ucs		. #x012A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH MACRON")))
    (japanese-jisx0212	#x2A #x45)	; ø»Š²‚
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (ucs		. #x012B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->uppercase	#x012A)
    (->titlecase	#x012A)
    (latin-iso8859-4		#xEF)	; øº’¹¯
    (japanese-jisx0213-1	#x29 #x7B)	; Ä«
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH MACRON")
    (->ucs		. #x012B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH MACRON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH MACRON")))
    (chinese-gb2312	#x28 #x29)	; ø»„ž
    (japanese-jisx0212	#x2B #x45)	; ø»Š³ 
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH BREVE")
    (ucs		. #x012C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0306)
    (->lowercase	#x012D)
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH BREVE")
    (ucs		. #x012D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0306)
    (->uppercase	#x012C)
    (->titlecase	#x012C)
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH OGONEK")
    (ucs		. #x012E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0328)
    (->lowercase	#x012F)
    (latin-iso8859-4	#xC7)	; øº’¹‡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH OGONEK")
    (->ucs		. #x012E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH OGONEK")))
    (japanese-jisx0212	#x2A #x46)	; ø»Š²ƒ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (ucs		. #x012F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->uppercase	#x012E)
    (->titlecase	#x012E)
    (latin-iso8859-4	#xE7)	; øº’¹§
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER I WITH OGONEK")
    (->ucs		. #x012F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH OGONEK")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER I WITH OGONEK")))
    (japanese-jisx0212	#x2B #x46)	; ø»Š³¡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (ucs		. #x0130)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->lowercase	#x0069)
    (latin-iso8859-3	#xA9)	; øº’·‰
    (latin-iso8859-9	#xDD)	; øº“†½
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (->ucs		. #x0130)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0130)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER I WITH DOT ABOVE")))
    (japanese-jisx0212	#x2A #x44)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER DOTLESS I")
    (ucs		. #x0131)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0049)
    (->titlecase	#x0049)
    (latin-iso8859-3	#xB9)	; øº’·™
    (latin-iso8859-9	#xFD)	; øº“‡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER DOTLESS I")
    (->ucs		. #x0131)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER DOTLESS I")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER DOTLESS I")))
    (korean-ksc5601	#x29 #x25)	; ø»ˆ¦€
    (japanese-jisx0212	#x29 #x45)	; ø»Š°¤
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (ucs		. #x0132)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0049 #x004A)
    (->lowercase	#x0133)
    (korean-ksc5601	#x28 #x26)	; ø»ˆ¤£
    (japanese-jisx0212	#x29 #x26)	; ø»Š°…
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (ucs		. #x0133)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->uppercase	#x0132)
    (->titlecase	#x0132)
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LIGATURE IJ")
    (->ucs		. #x0133)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0133)
    (->uppercase	#x0132)
    (->titlecase	#x0132)
    (korean-ksc5601	#x29 #x26)	; ø»ˆ¦
    (japanese-jisx0212	#x29 #x46)	; ø»Š°¥
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (ucs		. #x0134)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->lowercase	#x0135)
    (latin-iso8859-3		#xAC)	; øº’·Œ
    (japanese-jisx0213-1	#x2A #x5C)	; Ä´
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (->ucs		. #x0134)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0134)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER J WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x48)	; ø»Š²…
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (ucs		. #x0135)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->uppercase	#x0134)
    (->titlecase	#x0134)
    (latin-iso8859-3		#xBC)	; øº’·œ
    (japanese-jisx0213-1	#x2A #x62)	; Äµ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (->ucs		. #x0135)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0135)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER J WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER J WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x48)	; ø»Š³£
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (ucs		. #x0136)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->lowercase	#x0137)
    (latin-iso8859-4	#xD3)	; øº’¹“
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER K WITH CEDILLA")
    (->ucs		. #x0136)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0136)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER K WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x49)	; ø»Š²†
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (ucs		. #x0137)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->uppercase	#x0136)
    (->titlecase	#x0136)
    (latin-iso8859-4	#xF3)	; øº’¹³
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER K WITH CEDILLA")
    (->ucs		. #x0137)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0137)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER K WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER K WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x49)	; ø»Š³¤
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (ucs		. #x0138)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (latin-iso8859-4	#xA2)	; øº’¸¢
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER KRA")
    (->ucs		. #x0138)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->decomposition	wide #x0138)
    (korean-ksc5601	#x29 #x27)	; ø»ˆ¦‚
    (japanese-jisx0212	#x29 #x47)	; ø»Š°¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (ucs		. #x0139)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->lowercase	#x013A)
    (latin-iso8859-2		#xC5)	; øº’¶…
    (japanese-jisx0213-1	#x2A #x3B)	; Ä¹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER L WITH ACUTE")
    (->ucs		. #x0139)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0139)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER L WITH ACUTE")))
    (japanese-jisx0212	#x2A #x4A)	; ø»Š²‡
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (ucs		. #x013A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->uppercase	#x0139)
    (->titlecase	#x0139)
    (latin-iso8859-2		#xE5)	; øº’¶¥
    (japanese-jisx0213-1	#x2A #x4A)	; Äº
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH ACUTE")
    (->ucs		. #x013A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013A)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH ACUTE")))
    (japanese-jisx0212	#x2B #x4A)	; ø»Š³¥
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (ucs		. #x013B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->lowercase	#x013C)
    (latin-iso8859-4	#xA6)	; øº’¸¦
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")
    (->ucs		. #x013B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013B)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x4C)	; ø»Š²‰
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (ucs		. #x013C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->uppercase	#x013B)
    (->titlecase	#x013B)
    (latin-iso8859-4	#xB6)	; øº’¸¶
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH CEDILLA")
    (->ucs		. #x013C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013C)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x4C)	; ø»Š³§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (ucs		. #x013D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->lowercase	#x013E)
    (latin-iso8859-2		#xA5)	; øº’µ¥
    (japanese-jisx0213-1	#x2A #x24)	; Ä½
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER L WITH CARON")
    (->ucs		. #x013D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013D)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER L WITH CARON")))
    (japanese-jisx0212	#x2A #x4B)	; ø»Š²ˆ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (ucs		. #x013E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->uppercase	#x013D)
    (->titlecase	#x013D)
    (latin-iso8859-2		#xB5)	; øº’µµ
    (japanese-jisx0213-1	#x2A #x2F)	; Ä¾
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH CARON")
    (->ucs		. #x013E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013E)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH CARON")))
    (japanese-jisx0212	#x2B #x4B)	; ø»Š³¦
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (ucs		. #x013F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->lowercase	#x0140)
    (japanese-jisx0213-1	#x28 #x75)	; Ä¿
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (->ucs		. #x013F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013F)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER L WITH MIDDLE DOT")))
    (korean-ksc5601	#x28 #x28)	; ø»ˆ¤¥
    (japanese-jisx0212	#x29 #x29)	; ø»Š°ˆ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (ucs		. #x0140)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->uppercase	#x013F)
    (->titlecase	#x013F)
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH MIDDLE DOT")
    (->ucs		. #x0140)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0140)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH MIDDLE DOT")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH MIDDLE DOT")))
    (korean-ksc5601	#x29 #x28)	; ø»ˆ¦ƒ
    (japanese-jisx0212	#x29 #x49)	; ø»Š°¨
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (ucs		. #x0141)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0142)
    (latin-iso8859-2		#xA3)	; øº’µ£
    (japanese-jisx0213-1	#x2A #x23)	; Å
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER L WITH STROKE")
    (->ucs		. #x0141)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0141)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER L WITH STROKE")))
    (korean-ksc5601	#x28 #x29)	; ø»ˆ¤¦
    (japanese-jisx0212	#x29 #x28)	; ø»Š°‡
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (ucs		. #x0142)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0141)
    (->titlecase	#x0141)
    (latin-iso8859-2		#xB3)	; øº’µ³
    (japanese-jisx0213-1	#x2A #x2E)	; Å‚
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER L WITH STROKE")
    (->ucs		. #x0142)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0142)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER L WITH STROKE")))
    (korean-ksc5601	#x29 #x29)	; ø»ˆ¦„
    (japanese-jisx0212	#x29 #x48)	; ø»Š°§
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (ucs		. #x0143)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->lowercase	#x0144)
    (latin-iso8859-2		#xD1)	; øº’¶‘
    (japanese-jisx0213-1	#x2A #x41)	; Åƒ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH ACUTE")
    (->ucs		. #x0143)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0143)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH ACUTE")))
    (japanese-jisx0212	#x2A #x4D)	; ø»Š²Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (ucs		. #x0144)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->uppercase	#x0143)
    (->titlecase	#x0143)
    (latin-iso8859-2		#xF1)	; øº’¶±
    (japanese-jisx0213-1	#x2A #x51)	; Å„
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH ACUTE")
    (->ucs		. #x0144)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0144)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH ACUTE")))
    (japanese-jisx0212	#x2B #x4D)	; ø»Š³¨
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (ucs		. #x0145)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->lowercase	#x0146)
    (latin-iso8859-4	#xD1)	; øº’¹‘
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH CEDILLA")
    (->ucs		. #x0145)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0145)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x4F)	; ø»Š²Œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (ucs		. #x0146)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->uppercase	#x0145)
    (->titlecase	#x0145)
    (latin-iso8859-4	#xF1)	; øº’¹±
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH CEDILLA")
    (->ucs		. #x0146)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0146)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER N WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x4F)	; ø»Š³ª
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (ucs		. #x0147)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->lowercase	#x0148)
    (latin-iso8859-2		#xD2)	; øº’¶’
    (japanese-jisx0213-1	#x2A #x42)	; Å‡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER N WITH CARON")
    (->ucs		. #x0147)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0147)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER N WITH CARON")))
    (japanese-jisx0212	#x2A #x4E)	; ø»Š²‹
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (ucs		. #x0148)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->uppercase	#x0147)
    (->titlecase	#x0147)
    (latin-iso8859-2		#xF2)	; øº’¶²
    (japanese-jisx0213-1	#x2A #x52)	; Åˆ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER N WITH CARON")
    (->ucs		. #x0148)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0148)
    (->uppercase	#x0147)
    (->titlecase	#x0147)
    (japanese-jisx0212	#x2B #x4E)	; ø»Š³©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (ucs		. #x0149)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (->ucs		. #x0149)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0149)
    (korean-ksc5601	#x29 #x30)	; ø»ˆ¦‹
    (japanese-jisx0212	#x29 #x4A)	; ø»Š°©
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (ucs		. #x014A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->lowercase	#x014B)
    (latin-iso8859-4	#xBD)	; øº’¸½
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER ENG")
    (->ucs		. #x014A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->decomposition	wide #x014A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER ENG")))
    (korean-ksc5601	#x28 #x2F)	; ø»ˆ¤¬
    (japanese-jisx0212	#x29 #x2B)	; ø»Š°Š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (ucs		. #x014B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->uppercase	#x014A)
    (->titlecase	#x014A)
    (latin-iso8859-4		#xBF)	; øº’¸¿
    (ipa			#xD5)	; øº’›•
    (japanese-jisx0213-1	#x2A #x7A)	; Å‹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER ENG")
    (->ucs		. #x014B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->decomposition	wide #x014B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ENG")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER ENG")))
    (korean-ksc5601	#x29 #x2F)	; ø»ˆ¦Š
    (japanese-jisx0212	#x29 #x4B)	; ø»Š°ª
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (ucs		. #x014C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->lowercase	#x014D)
    (latin-iso8859-4		#xD2)	; øº’¹’
    (japanese-jisx0213-1	#x29 #x79)	; ÅŒ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER O WITH MACRON")
    (->ucs		. #x014C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014C)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH MACRON")))
    (japanese-jisx0212	#x2A #x57)	; ø»Š²”
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (ucs		. #x014D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->uppercase	#x014C)
    (->titlecase	#x014C)
    (latin-iso8859-4		#xF2)	; øº’¹²
    (japanese-jisx0213-1	#x29 #x7E)	; Å
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER O WITH MACRON")
    (->ucs		. #x014D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014D)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH MACRON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH MACRON")))
    (chinese-gb2312	#x28 #x2D)	; ø»„¢
    (japanese-jisx0212	#x2B #x57)	; ø»Š³²
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH BREVE")
    (ucs		. #x014E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0306)
    (->lowercase	#x014F)
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH BREVE")
    (ucs		. #x014F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0306)
    (->uppercase	#x014E)
    (->titlecase	#x014E)
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (ucs		. #x0150)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x030B)
    (->lowercase	#x0151)
    (latin-iso8859-2		#xD5)	; øº’¶•
    (japanese-jisx0213-1	#x2A #x43)	; Å
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (->ucs		. #x0150)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0150)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER O WITH DOUBLE ACUTE")))
    (japanese-jisx0212	#x2A #x56)	; ø»Š²“
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (ucs		. #x0151)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->uppercase	#x0150)
    (->titlecase	#x0150)
    (latin-iso8859-2		#xF5)	; øº’¶µ
    (japanese-jisx0213-1	#x2A #x53)	; Å‘
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (->ucs		. #x0151)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0151)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")))
    (japanese-jisx0212	#x2B #x56)	; ø»Š³±
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (ucs		. #x0152)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0153)
    (korean-ksc5601		#x28 #x2B)	; ø»ˆ¤¨
    (japanese-jisx0212		#x29 #x2D)	; ø»Š°Œ
    (japanese-jisx0213-1	#x2B #x2B)	; Å’
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (ucs		. #x0153)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0152)
    (->titlecase	#x0152)
    (ipa			#xB0)	; øº’š°
    (japanese-jisx0213-1	#x2B #x2A)	; Å“
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LIGATURE OE")
    (->ucs		. #x0153)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0153)
    (->uppercase	#x0152)
    (->titlecase	#x0152)
    (korean-ksc5601	#x29 #x2B)	; ø»ˆ¦†
    (japanese-jisx0212	#x29 #x4D)	; ø»Š°¬
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (ucs		. #x0154)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->lowercase	#x0155)
    (latin-iso8859-2		#xC0)	; øº’¶€
    (japanese-jisx0213-1	#x2A #x39)	; Å”
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER R WITH ACUTE")
    (->ucs		. #x0154)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0154)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER R WITH ACUTE")))
    (japanese-jisx0212	#x2A #x59)	; ø»Š²–
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (ucs		. #x0155)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->uppercase	#x0154)
    (->titlecase	#x0154)
    (latin-iso8859-2		#xE0)	; øº’¶ 
    (japanese-jisx0213-1	#x2A #x48)	; Å•
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER R WITH ACUTE")
    (->ucs		. #x0155)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0155)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH ACUTE")))
    (japanese-jisx0212	#x2B #x59)	; ø»Š³´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (ucs		. #x0156)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->lowercase	#x0157)
    (latin-iso8859-4	#xA3)	; øº’¸£
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")
    (->ucs		. #x0156)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0156)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER R WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x5B)	; ø»Š²˜
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (ucs		. #x0157)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->uppercase	#x0156)
    (->titlecase	#x0156)
    (latin-iso8859-4	#xB3)	; øº’¸³
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER R WITH CEDILLA")
    (->ucs		. #x0157)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0157)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x5B)	; ø»Š³¶
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (ucs		. #x0158)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->lowercase	#x0159)
    (latin-iso8859-2		#xD8)	; øº’¶˜
    (japanese-jisx0213-1	#x2A #x44)	; Å˜
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER R WITH CARON")
    (->ucs		. #x0158)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0158)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER R WITH CARON")))
    (japanese-jisx0212	#x2A #x5A)	; ø»Š²—
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (ucs		. #x0159)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->uppercase	#x0158)
    (->titlecase	#x0158)
    (latin-iso8859-2		#xF8)	; øº’¶¸
    (japanese-jisx0213-1	#x2A #x54)	; Å™
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER R WITH CARON")
    (->ucs		. #x0159)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0159)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CARON")))
    (japanese-jisx0212	#x2B #x5A)	; ø»Š³µ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (ucs		. #x015A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->lowercase	#x015B)
    (latin-iso8859-2		#xA6)	; øº’µ¦
    (japanese-jisx0213-1	#x2A #x25)	; Åš
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")
    (->ucs		. #x015A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER S WITH ACUTE")))
    (japanese-jisx0212	#x2A #x5C)	; ø»Š²™
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (ucs		. #x015B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->uppercase	#x015A)
    (->titlecase	#x015A)
    (latin-iso8859-2		#xB6)	; øº’µ¶
    (japanese-jisx0213-1	#x2A #x30)	; Å›
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER S WITH ACUTE")
    (->ucs		. #x015B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")))
    (japanese-jisx0212	#x2B #x5C)	; ø»Š³·
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (ucs		. #x015C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->lowercase	#x015D)
    (latin-iso8859-3		#xDE)	; øº’·¾
    (japanese-jisx0213-1	#x2A #x5D)	; Åœ
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (->ucs		. #x015C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015C)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER S WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x5D)	; ø»Š²š
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (ucs		. #x015D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->uppercase	#x015C)
    (->titlecase	#x015C)
    (latin-iso8859-3		#xFE)	; øº’¸ž
    (japanese-jisx0213-1	#x2A #x63)	; Å
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (->ucs		. #x015D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015D)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x5D)	; ø»Š³¸
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (ucs		. #x015E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0053 #x0327)
    (->lowercase	#x015F)
    (latin-iso8859-2		#xAA)	; øº’µª
    (latin-iso8859-3		#xAA)	; øº’·Š
    (latin-iso8859-9		#xDE)	; øº“†¾
    (japanese-jisx0213-1	#x2A #x27)	; Åž
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER S WITH CEDILLA")
    (->ucs		. #x015E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x015E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER S WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x5F)	; ø»Š²œ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (ucs		. #x015F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0073 #x0327)
    (->uppercase	#x015E)
    (->titlecase	#x015E)
    (latin-iso8859-2		#xBA)	; øº’µº
    (latin-iso8859-3		#xBA)	; øº’·š
    (latin-iso8859-9		#xFE)	; øº“‡ž
    (japanese-jisx0213-1	#x2A #x33)	; ÅŸ
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER S WITH CEDILLA")
    (->ucs		. #x015F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x015F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x5F)	; ø»Š³º
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (ucs		. #x0160)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->lowercase	#x0161)
    (latin-iso8859-2		#xA9)	; øº’µ©
    (latin-iso8859-4		#xA9)	; øº’¸©
    (japanese-jisx0213-1	#x2A #x26)	; Å 
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER S WITH CARON")
    (->ucs		. #x0160)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0160)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER S WITH CARON")))
    (japanese-jisx0212	#x2A #x5E)	; ø»Š²›
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (ucs		. #x0161)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->uppercase	#x0160)
    (->titlecase	#x0160)
    (latin-iso8859-2		#xB9)	; øº’µ¹
    (latin-iso8859-4		#xB9)	; øº’¸¹
    (japanese-jisx0213-1	#x2A #x32)	; Å¡
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER S WITH CARON")
    (->ucs		. #x0161)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0161)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH CARON")))
    (japanese-jisx0212	#x2B #x5E)	; ø»Š³¹
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (ucs		. #x0162)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0054 #x0327)
    (->lowercase	#x0163)
    (latin-iso8859-2		#xDE)	; øº’¶ž
    (japanese-jisx0213-1	#x2A #x47)	; Å¢
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER T WITH CEDILLA")
    (->ucs		. #x0162)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x0162)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER T WITH CEDILLA")))
    (japanese-jisx0212	#x2A #x61)	; ø»Š²ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (ucs		. #x0163)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	#x0074 #x0327)
    (->uppercase	#x0162)
    (->titlecase	#x0162)
    (latin-iso8859-2		#xFE)	; øº’¶¾
    (japanese-jisx0213-1	#x2A #x57)	; Å£
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER T WITH CEDILLA")
    (->ucs		. #x0163)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (->decomposition	wide #x0163)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH CEDILLA")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH CEDILLA")))
    (japanese-jisx0212	#x2B #x61)	; ø»Š³¼
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (ucs		. #x0164)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->lowercase	#x0165)
    (latin-iso8859-2		#xAB)	; øº’µ«
    (japanese-jisx0213-1	#x2A #x28)	; Å¤
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER T WITH CARON")
    (->ucs		. #x0164)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0164)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH CARON")))
    (japanese-jisx0212	#x2A #x60)	; ø»Š²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (ucs		. #x0165)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->uppercase	#x0164)
    (->titlecase	#x0164)
    (latin-iso8859-2		#xBB)	; øº’µ»
    (japanese-jisx0213-1	#x2A #x34)	; Å¥
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER T WITH CARON")
    (->ucs		. #x0165)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0165)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH CARON")))
    (japanese-jisx0212	#x2B #x60)	; ø»Š³»
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (ucs		. #x0166)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0167)
    (latin-iso8859-4	#xAC)	; øº’¸¬
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER T WITH STROKE")
    (->ucs		. #x0166)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0166)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER T WITH STROKE")))
    (korean-ksc5601	#x28 #x2E)	; ø»ˆ¤«
    (japanese-jisx0212	#x29 #x2F)	; ø»Š°Ž
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (ucs		. #x0167)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0166)
    (->titlecase	#x0166)
    (latin-iso8859-4	#xBC)	; øº’¸¼
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER T WITH STROKE")
    (->ucs		. #x0167)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0167)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH STROKE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER T WITH STROKE")))
    (korean-ksc5601	#x29 #x2E)	; ø»ˆ¦‰
    (japanese-jisx0212	#x29 #x4F)	; ø»Š°®
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (ucs		. #x0168)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->lowercase	#x0169)
    (latin-iso8859-4	#xDD)	; øº’¹
    (latin-viscii-upper #xFB)	; Å¨
    (latin-viscii	#x9D)	; Å¨
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")
    (->ucs		. #x0168)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0168)
    (->lowercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")))
    (japanese-jisx0212	#x2A #x6C)	; ø»Š²©
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (ucs		. #x0169)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->uppercase	#x0168)
    (->titlecase	#x0168)
    (latin-iso8859-4	#xFD)	; øº’¹½
    (latin-viscii-lower #xFB)	; Å©
    (latin-viscii	#xFB)	; Å©
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH TILDE")
    (->ucs		. #x0169)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0169)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH TILDE")))
    (japanese-jisx0212	#x2B #x6C)	; ø»Š´‡
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (ucs		. #x016A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->lowercase	#x016B)
    (latin-iso8859-4		#xDE)	; øº’¹ž
    (japanese-jisx0213-1	#x29 #x7C)	; Åª
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH MACRON")
    (->ucs		. #x016A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016A)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH MACRON")))
    (japanese-jisx0212	#x2A #x69)	; ø»Š²¦
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (ucs		. #x016B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->uppercase	#x016A)
    (->titlecase	#x016A)
    (latin-iso8859-4	#xFE)	; øº’¹¾
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH MACRON")
    (->ucs		. #x016B)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH MACRON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH MACRON")))
    (chinese-gb2312	#x28 #x31)	; ø»„¦
    (japanese-jisx0212	#x2B #x69)	; ø»Š´„
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (ucs		. #x016C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->lowercase	#x016D)
    (latin-iso8859-3		#xDD)	; øº’·½
    (japanese-jisx0213-1	#x2A #x5E)	; Å¬
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH BREVE")
    (->ucs		. #x016C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016C)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH BREVE")))
    (japanese-jisx0212	#x2A #x66)	; ø»Š²£
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (ucs		. #x016D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->uppercase	#x016C)
    (->titlecase	#x016C)
    (latin-iso8859-3		#xFD)	; øº’¸
    (japanese-jisx0213-1	#x2A #x64)	; Å­
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH BREVE")
    (->ucs		. #x016D)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016D)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH BREVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH BREVE")))
    (japanese-jisx0212	#x2B #x66)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (ucs		. #x016E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->lowercase	#x016F)
    (latin-iso8859-2		#xD9)	; øº’¶™
    (japanese-jisx0213-1	#x2A #x45)	; Å®
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH RING ABOVE")
    (->ucs		. #x016E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016E)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH RING ABOVE")))
    (japanese-jisx0212	#x2A #x6B)	; ø»Š²¨
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (ucs		. #x016F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->uppercase	#x016E)
    (->titlecase	#x016E)
    (latin-iso8859-2		#xF9)	; øº’¶¹
    (japanese-jisx0213-1	#x2A #x55)	; Å¯
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH RING ABOVE")
    (->ucs		. #x016F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH RING ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH RING ABOVE")))
    (japanese-jisx0212	#x2B #x6B)	; ø»Š´†
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (ucs		. #x0170)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->lowercase	#x0171)
    (latin-iso8859-2		#xDB)	; øº’¶›
    (japanese-jisx0213-1	#x2A #x46)	; Å°
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (->ucs		. #x0170)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0170)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH DOUBLE ACUTE")))
    (japanese-jisx0212	#x2A #x68)	; ø»Š²¥
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (ucs		. #x0171)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->uppercase	#x0170)
    (->titlecase	#x0170)
    (latin-iso8859-2		#xFB)	; øº’¶»
    (japanese-jisx0213-1	#x2A #x56)	; Å±
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (->ucs		. #x0171)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0171)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")))
    (japanese-jisx0212	#x2B #x68)	; ø»Š´ƒ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (ucs		. #x0172)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->lowercase	#x0173)
    (latin-iso8859-4	#xD9)	; øº’¹™
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER U WITH OGONEK")
    (->ucs		. #x0172)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0172)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER U WITH OGONEK")))
    (japanese-jisx0212	#x2A #x6A)	; ø»Š²§
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (ucs		. #x0173)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->uppercase	#x0172)
    (->titlecase	#x0172)
    (latin-iso8859-4	#xF9)	; øº’¹¹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER U WITH OGONEK")
    (->ucs		. #x0173)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0173)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH OGONEK")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER U WITH OGONEK")))
    (japanese-jisx0212	#x2B #x6A)	; ø»Š´…
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (ucs		. #x0174)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->lowercase	#x0175)
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (->ucs		. #x0174)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0174)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER W WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x71)	; ø»Š²®
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (ucs		. #x0175)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->uppercase	#x0174)
    (->titlecase	#x0174)
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (->ucs		. #x0175)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0175)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER W WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER W WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x71)	; ø»Š´Œ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (ucs		. #x0176)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->lowercase	#x0177)
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (->ucs		. #x0176)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0176)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2A #x74)	; ø»Š²±
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (ucs		. #x0177)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->uppercase	#x0176)
    (->titlecase	#x0176)
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (->ucs		. #x0177)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0177)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")))
    (japanese-jisx0212	#x2B #x74)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (ucs		. #x0178)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->lowercase	#x00FF)
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (->ucs		. #x0178)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0178)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Y WITH DIAERESIS")))
    (japanese-jisx0212	#x2A #x73)	; ø»Š²°
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (ucs		. #x0179)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->lowercase	#x017A)
    (latin-iso8859-2		#xAC)	; øº’µ¬
    (japanese-jisx0213-1	#x2A #x29)	; Å¹
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Z WITH ACUTE")
    (->ucs		. #x0179)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0179)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Z WITH ACUTE")))
    (japanese-jisx0212	#x2A #x75)	; ø»Š²²
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (ucs		. #x017A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->uppercase	#x0179)
    (->titlecase	#x0179)
    (latin-iso8859-2		#xBC)	; øº’µ¼
    (japanese-jisx0213-1	#x2A #x35)	; Åº
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Z WITH ACUTE")
    (->ucs		. #x017A)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017A)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Z WITH ACUTE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Z WITH ACUTE")))
    (japanese-jisx0212	#x2B #x75)	; ø»Š´
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (ucs		. #x017B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->lowercase	#x017C)
    (latin-iso8859-2		#xAF)	; øº’µ¯
    (latin-iso8859-3		#xAF)	; øº’·
    (japanese-jisx0213-1	#x2A #x2B)	; Å»
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (->ucs		. #x017B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017B)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Z WITH DOT ABOVE")))
    (japanese-jisx0212	#x2A #x77)	; ø»Š²´
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (ucs		. #x017C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->uppercase	#x017B)
    (->titlecase	#x017B)
    (latin-iso8859-2		#xBF)	; øº’µ¿
    (latin-iso8859-3		#xBF)	; øº’·Ÿ
    (japanese-jisx0213-1	#x2A #x38)	; Å¼
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Z WITH DOT ABOVE")
    (->ucs		. #x017C)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017C)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Z WITH DOT ABOVE")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Z WITH DOT ABOVE")))
    (japanese-jisx0212	#x2B #x77)	; ø»Š´’
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (ucs		. #x017D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->lowercase	#x017E)
    (latin-iso8859-2		#xAE)	; øº’µ®
    (latin-iso8859-4		#xAE)	; øº’¸®
    (japanese-jisx0213-1	#x2A #x2A)	; Å½
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER Z WITH CARON")
    (->ucs		. #x017D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017D)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER Z WITH CARON")))
    (japanese-jisx0212	#x2A #x76)	; ø»Š²³
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (ucs		. #x017E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->uppercase	#x017D)
    (->titlecase	#x017D)
    (latin-iso8859-2		#xBE)	; øº’µ¾
    (latin-iso8859-4		#xBE)	; øº’¸¾
    (japanese-jisx0213-1	#x2A #x37)	; Å¾
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER Z WITH CARON")
    (->ucs		. #x017E)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017E)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Z WITH CARON")))
    (->titlecase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER Z WITH CARON")))
    (japanese-jisx0212	#x2B #x76)	; ø»Š´‘
    ))
(define-char
  '((name		. "LATIN SMALL LETTER LONG S")
    (ucs		. #x017F)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0073)
    (->uppercase	#x0053)
    (->titlecase	#x0053)
    ))
