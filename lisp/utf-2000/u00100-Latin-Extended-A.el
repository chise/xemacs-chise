(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (ucs		. #x0100)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->lowercase	#x0101)
    (latin-iso8859-4		#xC0)	; �����
    (japanese-jisx0213-1	#x29 #x75)	; Ā
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
    (japanese-jisx0212	#x2A #x27)	; �����
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
    (latin-iso8859-4		#xE0)	; �����
    (japanese-jisx0213-1	#x29 #x7A)	; ā
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
    (chinese-gb2312	#x28 #x21)	; �����
    (japanese-jisx0212	#x2B #x27)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (ucs		. #x0102)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->lowercase	#x0103)
    (latin-iso8859-2		#xC3)	; �����
    (latin-viscii-upper		#xE5)	; Ă
    (latin-viscii		#xC5)	; Ă
    (japanese-jisx0213-1	#x2A #x3A)	; Ă
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
    (japanese-jisx0212	#x2A #x25)	; �����
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
    (latin-iso8859-2		#xE3)	; �����
    (latin-viscii-lower		#xE5)	; ă
    (latin-viscii		#xE5)	; ă
    (japanese-jisx0213-1	#x2A #x49)	; ă
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
    (japanese-jisx0212	#x2B #x25)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (ucs		. #x0104)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->lowercase	#x0105)
    (latin-iso8859-2		#xA1)	; �����
    (latin-iso8859-4		#xA1)	; �����
    (japanese-jisx0213-1	#x2A #x21)	; Ą
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
    (japanese-jisx0212	#x2A #x28)	; �����
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
    (latin-iso8859-2		#xB1)	; �����
    (latin-iso8859-4		#xB1)	; �����
    (japanese-jisx0213-1	#x2A #x2C)	; ą
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
    (japanese-jisx0212	#x2B #x28)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (ucs		. #x0106)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->lowercase	#x0107)
    (latin-iso8859-2		#xC6)	; �����
    (japanese-jisx0213-1	#x2A #x3C)	; Ć
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
    (japanese-jisx0212	#x2A #x2B)	; �����
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
    (latin-iso8859-2		#xE6)	; �����
    (japanese-jisx0213-1	#x2A #x4B)	; ć
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
    (japanese-jisx0212	#x2B #x2B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (ucs		. #x0108)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->lowercase	#x0109)
    (latin-iso8859-3		#xC6)	; �����
    (japanese-jisx0213-1	#x2A #x59)	; Ĉ
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
    (japanese-jisx0212	#x2A #x2C)	; �����
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
    (latin-iso8859-3		#xE6)	; �����
    (japanese-jisx0213-1	#x2A #x5F)	; ĉ
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
    (japanese-jisx0212	#x2B #x2C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (ucs		. #x010A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->lowercase	#x010B)
    (latin-iso8859-3	#xC5)	; �����
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
    (japanese-jisx0212	#x2A #x2F)	; �����
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
    (latin-iso8859-3	#xE5)	; �����
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
    (japanese-jisx0212	#x2B #x2F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (ucs		. #x010C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->lowercase	#x010D)
    (latin-iso8859-2		#xC8)	; �����
    (latin-iso8859-4		#xC8)	; �����
    (japanese-jisx0213-1	#x2A #x3D)	; Č
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
    (japanese-jisx0212	#x2A #x2D)	; �����
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
    (latin-iso8859-2		#xE8)	; �����
    (latin-iso8859-4		#xE8)	; �����
    (japanese-jisx0213-1	#x2A #x4C)	; č
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
    (japanese-jisx0212	#x2B #x2D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (ucs		. #x010E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->lowercase	#x010F)
    (latin-iso8859-2		#xCF)	; �����
    (japanese-jisx0213-1	#x2A #x40)	; Ď
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
    (japanese-jisx0212	#x2A #x30)	; �����
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
    (latin-iso8859-2		#xEF)	; �����
    (japanese-jisx0213-1	#x2A #x4F)	; ď
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
    (japanese-jisx0212	#x2B #x30)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (ucs		. #x0110)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0111)
    (latin-iso8859-2	#xD0)	; �����
    (latin-iso8859-4	#xD0)	; �����
    (latin-viscii-upper #xF0)	; Đ
    (latin-viscii	#xD0)	; Đ
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
    (japanese-jisx0212	#x29 #x22)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (ucs		. #x0111)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0110)
    (->titlecase	#x0110)
    (latin-iso8859-2		#xF0)	; �����
    (latin-iso8859-4		#xF0)	; �����
    (latin-viscii-lower		#xF0)	; đ
    (latin-viscii		#xF0)	; đ
    (japanese-jisx0213-1	#x2A #x50)	; đ
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
    (korean-ksc5601	#x29 #x22)	; �����
    (japanese-jisx0212	#x29 #x42)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (ucs		. #x0112)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->lowercase	#x0113)
    (latin-iso8859-4		#xAA)	; �����
    (japanese-jisx0213-1	#x29 #x78)	; Ē
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
    (japanese-jisx0212	#x2A #x37)	; �����
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
    (latin-iso8859-4		#xBA)	; �����
    (japanese-jisx0213-1	#x29 #x7D)	; ē
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
    (chinese-gb2312	#x28 #x25)	; �����
    (japanese-jisx0212	#x2B #x37)	; �����
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
    (latin-iso8859-4	#xCC)	; �����
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
    (japanese-jisx0212	#x2A #x36)	; �����
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
    (latin-iso8859-4	#xEC)	; �����
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
    (japanese-jisx0212	#x2B #x36)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (ucs		. #x0118)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->lowercase	#x0119)
    (latin-iso8859-2		#xCA)	; �����
    (latin-iso8859-4		#xCA)	; �����
    (japanese-jisx0213-1	#x2A #x3E)	; Ę
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
    (japanese-jisx0212	#x2A #x38)	; �����
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
    (latin-iso8859-2		#xEA)	; �����
    (latin-iso8859-4		#xEA)	; �����
    (japanese-jisx0213-1	#x2A #x4D)	; ę
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
    (japanese-jisx0212	#x2B #x38)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (ucs		. #x011A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->lowercase	#x011B)
    (latin-iso8859-2		#xCC)	; �����
    (japanese-jisx0213-1	#x2A #x3F)	; Ě
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
    (japanese-jisx0212	#x2A #x35)	; �����
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
    (latin-iso8859-2		#xEC)	; �����
    (japanese-jisx0213-1	#x2A #x4E)	; ě
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
    (chinese-gb2312	#x28 #x27)	; �����
    (japanese-jisx0212	#x2B #x35)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (ucs		. #x011C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->lowercase	#x011D)
    (latin-iso8859-3		#xD8)	; �����
    (japanese-jisx0213-1	#x2A #x5A)	; Ĝ
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
    (japanese-jisx0212	#x2A #x3A)	; �����
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
    (latin-iso8859-3		#xF8)	; �����
    (japanese-jisx0213-1	#x2A #x60)	; ĝ
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
    (japanese-jisx0212	#x2B #x3A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (ucs		. #x011E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->lowercase	#x011F)
    (latin-iso8859-3	#xAB)	; �����
    (latin-iso8859-9	#xD0)	; �����
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
    (japanese-jisx0212	#x2A #x3B)	; �����
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
    (latin-iso8859-3	#xBB)	; �����
    (latin-iso8859-9	#xF0)	; �����
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
    (japanese-jisx0212	#x2B #x3B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (ucs		. #x0120)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->lowercase	#x0121)
    (latin-iso8859-3	#xD5)	; �����
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
    (japanese-jisx0212	#x2A #x3D)	; �����
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
    (latin-iso8859-3	#xF5)	; �����
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
    (japanese-jisx0212	#x2B #x3D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (ucs		. #x0122)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->lowercase	#x0123)
    (latin-iso8859-4	#xAB)	; �����
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
    (japanese-jisx0212	#x2A #x3C)	; �����
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
    (latin-iso8859-4	#xBB)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (ucs		. #x0124)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->lowercase	#x0125)
    (latin-iso8859-3		#xA6)	; �����
    (japanese-jisx0213-1	#x2A #x5B)	; Ĥ
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
    (japanese-jisx0212	#x2A #x3E)	; �����
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
    (latin-iso8859-3		#xB6)	; �����
    (japanese-jisx0213-1	#x2A #x61)	; ĥ
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
    (japanese-jisx0212	#x2B #x3E)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (ucs		. #x0126)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0127)
    (latin-iso8859-3	#xA1)	; �����
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
    (korean-ksc5601	#x28 #x24)	; �����
    (japanese-jisx0212	#x29 #x24)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (ucs		. #x0127)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0126)
    (->titlecase	#x0126)
    (latin-iso8859-3		#xB1)	; �����
    (japanese-jisx0213-1	#x2A #x7D)	; ħ
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
    (korean-ksc5601	#x29 #x24)	; �����
    (japanese-jisx0212	#x29 #x44)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (ucs		. #x0128)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->lowercase	#x0129)
    (latin-iso8859-4	#xA5)	; �����
    (latin-viscii-upper #xEE)	; Ĩ
    (latin-viscii	#xCE)	; Ĩ
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
    (japanese-jisx0212	#x2A #x47)	; �����
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
    (latin-iso8859-4	#xB5)	; �����
    (latin-viscii-lower #xEE)	; ĩ
    (latin-viscii	#xEE)	; ĩ
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
    (japanese-jisx0212	#x2B #x47)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (ucs		. #x012A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->lowercase	#x012B)
    (latin-iso8859-4		#xCF)	; �����
    (japanese-jisx0213-1	#x29 #x76)	; Ī
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
    (japanese-jisx0212	#x2A #x45)	; �����
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
    (latin-iso8859-4		#xEF)	; �����
    (japanese-jisx0213-1	#x29 #x7B)	; ī
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
    (chinese-gb2312	#x28 #x29)	; �����
    (japanese-jisx0212	#x2B #x45)	; �����
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
    (latin-iso8859-4	#xC7)	; �����
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
    (japanese-jisx0212	#x2A #x46)	; �����
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
    (latin-iso8859-4	#xE7)	; �����
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
    (japanese-jisx0212	#x2B #x46)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (ucs		. #x0130)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->lowercase	#x0069)
    (latin-iso8859-3	#xA9)	; �����
    (latin-iso8859-9	#xDD)	; �����
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
    (japanese-jisx0212	#x2A #x44)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER DOTLESS I")
    (ucs		. #x0131)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0049)
    (->titlecase	#x0049)
    (latin-iso8859-3	#xB9)	; �����
    (latin-iso8859-9	#xFD)	; �����
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
    (korean-ksc5601	#x29 #x25)	; �����
    (japanese-jisx0212	#x29 #x45)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (ucs		. #x0132)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0049 #x004A)
    (->lowercase	#x0133)
    (korean-ksc5601	#x28 #x26)	; �����
    (japanese-jisx0212	#x29 #x26)	; �����
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
    (korean-ksc5601	#x29 #x26)	; �����
    (japanese-jisx0212	#x29 #x46)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (ucs		. #x0134)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->lowercase	#x0135)
    (latin-iso8859-3		#xAC)	; �����
    (japanese-jisx0213-1	#x2A #x5C)	; Ĵ
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
    (japanese-jisx0212	#x2A #x48)	; �����
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
    (latin-iso8859-3		#xBC)	; �����
    (japanese-jisx0213-1	#x2A #x62)	; ĵ
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
    (japanese-jisx0212	#x2B #x48)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (ucs		. #x0136)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->lowercase	#x0137)
    (latin-iso8859-4	#xD3)	; �����
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
    (japanese-jisx0212	#x2A #x49)	; �����
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
    (latin-iso8859-4	#xF3)	; �����
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
    (japanese-jisx0212	#x2B #x49)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (ucs		. #x0138)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (latin-iso8859-4	#xA2)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER KRA")
    (->ucs		. #x0138)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->decomposition	wide #x0138)
    (korean-ksc5601	#x29 #x27)	; �����
    (japanese-jisx0212	#x29 #x47)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (ucs		. #x0139)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->lowercase	#x013A)
    (latin-iso8859-2		#xC5)	; �����
    (japanese-jisx0213-1	#x2A #x3B)	; Ĺ
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
    (japanese-jisx0212	#x2A #x4A)	; �����
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
    (latin-iso8859-2		#xE5)	; �����
    (japanese-jisx0213-1	#x2A #x4A)	; ĺ
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
    (japanese-jisx0212	#x2B #x4A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (ucs		. #x013B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->lowercase	#x013C)
    (latin-iso8859-4	#xA6)	; �����
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
    (japanese-jisx0212	#x2A #x4C)	; �����
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
    (latin-iso8859-4	#xB6)	; �����
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
    (japanese-jisx0212	#x2B #x4C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (ucs		. #x013D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->lowercase	#x013E)
    (latin-iso8859-2		#xA5)	; �����
    (japanese-jisx0213-1	#x2A #x24)	; Ľ
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
    (japanese-jisx0212	#x2A #x4B)	; �����
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
    (latin-iso8859-2		#xB5)	; �����
    (japanese-jisx0213-1	#x2A #x2F)	; ľ
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
    (japanese-jisx0212	#x2B #x4B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (ucs		. #x013F)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->lowercase	#x0140)
    (japanese-jisx0213-1	#x28 #x75)	; Ŀ
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
    (korean-ksc5601	#x28 #x28)	; �����
    (japanese-jisx0212	#x29 #x29)	; �����
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
    (korean-ksc5601	#x29 #x28)	; �����
    (japanese-jisx0212	#x29 #x49)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (ucs		. #x0141)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0142)
    (latin-iso8859-2		#xA3)	; �����
    (japanese-jisx0213-1	#x2A #x23)	; Ł
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
    (korean-ksc5601	#x28 #x29)	; �����
    (japanese-jisx0212	#x29 #x28)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (ucs		. #x0142)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0141)
    (->titlecase	#x0141)
    (latin-iso8859-2		#xB3)	; �����
    (japanese-jisx0213-1	#x2A #x2E)	; ł
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
    (korean-ksc5601	#x29 #x29)	; �����
    (japanese-jisx0212	#x29 #x48)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (ucs		. #x0143)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->lowercase	#x0144)
    (latin-iso8859-2		#xD1)	; �����
    (japanese-jisx0213-1	#x2A #x41)	; Ń
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
    (japanese-jisx0212	#x2A #x4D)	; �����
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
    (latin-iso8859-2		#xF1)	; �����
    (japanese-jisx0213-1	#x2A #x51)	; ń
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
    (japanese-jisx0212	#x2B #x4D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (ucs		. #x0145)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->lowercase	#x0146)
    (latin-iso8859-4	#xD1)	; �����
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
    (japanese-jisx0212	#x2A #x4F)	; �����
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
    (latin-iso8859-4	#xF1)	; �����
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
    (japanese-jisx0212	#x2B #x4F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (ucs		. #x0147)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->lowercase	#x0148)
    (latin-iso8859-2		#xD2)	; �����
    (japanese-jisx0213-1	#x2A #x42)	; Ň
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
    (japanese-jisx0212	#x2A #x4E)	; �����
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
    (latin-iso8859-2		#xF2)	; �����
    (japanese-jisx0213-1	#x2A #x52)	; ň
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
    (japanese-jisx0212	#x2B #x4E)	; �����
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
    (korean-ksc5601	#x29 #x30)	; �����
    (japanese-jisx0212	#x29 #x4A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (ucs		. #x014A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->lowercase	#x014B)
    (latin-iso8859-4	#xBD)	; �����
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
    (korean-ksc5601	#x28 #x2F)	; �����
    (japanese-jisx0212	#x29 #x2B)	; �����
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
    (latin-iso8859-4		#xBF)	; �����
    (ipa			#xD5)	; �����
    (japanese-jisx0213-1	#x2A #x7A)	; ŋ
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
    (korean-ksc5601	#x29 #x2F)	; �����
    (japanese-jisx0212	#x29 #x4B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (ucs		. #x014C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->lowercase	#x014D)
    (latin-iso8859-4		#xD2)	; �����
    (japanese-jisx0213-1	#x29 #x79)	; Ō
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
    (japanese-jisx0212	#x2A #x57)	; �����
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
    (latin-iso8859-4		#xF2)	; �����
    (japanese-jisx0213-1	#x29 #x7E)	; ō
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
    (chinese-gb2312	#x28 #x2D)	; �����
    (japanese-jisx0212	#x2B #x57)	; �����
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
    (latin-iso8859-2		#xD5)	; �����
    (japanese-jisx0213-1	#x2A #x43)	; Ő
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
    (japanese-jisx0212	#x2A #x56)	; �����
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
    (latin-iso8859-2		#xF5)	; �����
    (japanese-jisx0213-1	#x2A #x53)	; ő
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
    (japanese-jisx0212	#x2B #x56)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (ucs		. #x0152)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0153)
    (korean-ksc5601		#x28 #x2B)	; �����
    (japanese-jisx0212		#x29 #x2D)	; �����
    (japanese-jisx0213-1	#x2B #x2B)	; Œ
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (ucs		. #x0153)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0152)
    (->titlecase	#x0152)
    (ipa			#xB0)	; �����
    (japanese-jisx0213-1	#x2B #x2A)	; œ
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
    (korean-ksc5601	#x29 #x2B)	; �����
    (japanese-jisx0212	#x29 #x4D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (ucs		. #x0154)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->lowercase	#x0155)
    (latin-iso8859-2		#xC0)	; �����
    (japanese-jisx0213-1	#x2A #x39)	; Ŕ
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
    (japanese-jisx0212	#x2A #x59)	; �����
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
    (latin-iso8859-2		#xE0)	; �����
    (japanese-jisx0213-1	#x2A #x48)	; ŕ
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
    (japanese-jisx0212	#x2B #x59)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (ucs		. #x0156)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->lowercase	#x0157)
    (latin-iso8859-4	#xA3)	; �����
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
    (japanese-jisx0212	#x2A #x5B)	; �����
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
    (latin-iso8859-4	#xB3)	; �����
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
    (japanese-jisx0212	#x2B #x5B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (ucs		. #x0158)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->lowercase	#x0159)
    (latin-iso8859-2		#xD8)	; �����
    (japanese-jisx0213-1	#x2A #x44)	; Ř
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
    (japanese-jisx0212	#x2A #x5A)	; �����
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
    (latin-iso8859-2		#xF8)	; �����
    (japanese-jisx0213-1	#x2A #x54)	; ř
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
    (japanese-jisx0212	#x2B #x5A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (ucs		. #x015A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->lowercase	#x015B)
    (latin-iso8859-2		#xA6)	; �����
    (japanese-jisx0213-1	#x2A #x25)	; Ś
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
    (japanese-jisx0212	#x2A #x5C)	; �����
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
    (latin-iso8859-2		#xB6)	; �����
    (japanese-jisx0213-1	#x2A #x30)	; ś
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
    (japanese-jisx0212	#x2B #x5C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (ucs		. #x015C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->lowercase	#x015D)
    (latin-iso8859-3		#xDE)	; �����
    (japanese-jisx0213-1	#x2A #x5D)	; Ŝ
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
    (japanese-jisx0212	#x2A #x5D)	; �����
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
    (latin-iso8859-3		#xFE)	; �����
    (japanese-jisx0213-1	#x2A #x63)	; ŝ
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
    (japanese-jisx0212	#x2B #x5D)	; �����
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
    (latin-iso8859-2		#xAA)	; �����
    (latin-iso8859-3		#xAA)	; �����
    (latin-iso8859-9		#xDE)	; �����
    (japanese-jisx0213-1	#x2A #x27)	; Ş
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
    (japanese-jisx0212	#x2A #x5F)	; �����
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
    (latin-iso8859-2		#xBA)	; �����
    (latin-iso8859-3		#xBA)	; �����
    (latin-iso8859-9		#xFE)	; �����
    (japanese-jisx0213-1	#x2A #x33)	; ş
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
    (japanese-jisx0212	#x2B #x5F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (ucs		. #x0160)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->lowercase	#x0161)
    (latin-iso8859-2		#xA9)	; �����
    (latin-iso8859-4		#xA9)	; �����
    (japanese-jisx0213-1	#x2A #x26)	; Š
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
    (japanese-jisx0212	#x2A #x5E)	; �����
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
    (latin-iso8859-2		#xB9)	; �����
    (latin-iso8859-4		#xB9)	; �����
    (japanese-jisx0213-1	#x2A #x32)	; š
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
    (japanese-jisx0212	#x2B #x5E)	; �����
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
    (latin-iso8859-2		#xDE)	; �����
    (japanese-jisx0213-1	#x2A #x47)	; Ţ
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
    (japanese-jisx0212	#x2A #x61)	; �����
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
    (latin-iso8859-2		#xFE)	; �����
    (japanese-jisx0213-1	#x2A #x57)	; ţ
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
    (japanese-jisx0212	#x2B #x61)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (ucs		. #x0164)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->lowercase	#x0165)
    (latin-iso8859-2		#xAB)	; �����
    (japanese-jisx0213-1	#x2A #x28)	; Ť
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
    (japanese-jisx0212	#x2A #x60)	; �����
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
    (latin-iso8859-2		#xBB)	; �����
    (japanese-jisx0213-1	#x2A #x34)	; ť
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
    (japanese-jisx0212	#x2B #x60)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (ucs		. #x0166)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase	#x0167)
    (latin-iso8859-4	#xAC)	; �����
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
    (korean-ksc5601	#x28 #x2E)	; �����
    (japanese-jisx0212	#x29 #x2F)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (ucs		. #x0167)
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase	#x0166)
    (->titlecase	#x0166)
    (latin-iso8859-4	#xBC)	; �����
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
    (korean-ksc5601	#x29 #x2E)	; �����
    (japanese-jisx0212	#x29 #x4F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (ucs		. #x0168)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->lowercase	#x0169)
    (latin-iso8859-4	#xDD)	; �����
    (latin-viscii-upper #xFB)	; Ũ
    (latin-viscii	#x9D)	; Ũ
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
    (japanese-jisx0212	#x2A #x6C)	; �����
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
    (latin-iso8859-4	#xFD)	; �����
    (latin-viscii-lower #xFB)	; ũ
    (latin-viscii	#xFB)	; ũ
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
    (japanese-jisx0212	#x2B #x6C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (ucs		. #x016A)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->lowercase	#x016B)
    (latin-iso8859-4		#xDE)	; �����
    (japanese-jisx0213-1	#x29 #x7C)	; Ū
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
    (japanese-jisx0212	#x2A #x69)	; �����
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
    (latin-iso8859-4	#xFE)	; �����
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
    (chinese-gb2312	#x28 #x31)	; �����
    (japanese-jisx0212	#x2B #x69)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (ucs		. #x016C)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->lowercase	#x016D)
    (latin-iso8859-3		#xDD)	; �����
    (japanese-jisx0213-1	#x2A #x5E)	; Ŭ
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
    (japanese-jisx0212	#x2A #x66)	; �����
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
    (latin-iso8859-3		#xFD)	; �����
    (japanese-jisx0213-1	#x2A #x64)	; ŭ
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
    (japanese-jisx0212	#x2B #x66)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (ucs		. #x016E)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->lowercase	#x016F)
    (latin-iso8859-2		#xD9)	; �����
    (japanese-jisx0213-1	#x2A #x45)	; Ů
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
    (japanese-jisx0212	#x2A #x6B)	; �����
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
    (latin-iso8859-2		#xF9)	; �����
    (japanese-jisx0213-1	#x2A #x55)	; ů
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
    (japanese-jisx0212	#x2B #x6B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (ucs		. #x0170)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->lowercase	#x0171)
    (latin-iso8859-2		#xDB)	; �����
    (japanese-jisx0213-1	#x2A #x46)	; Ű
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
    (japanese-jisx0212	#x2A #x68)	; �����
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
    (latin-iso8859-2		#xFB)	; �����
    (japanese-jisx0213-1	#x2A #x56)	; ű
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
    (japanese-jisx0212	#x2B #x68)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (ucs		. #x0172)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->lowercase	#x0173)
    (latin-iso8859-4	#xD9)	; �����
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
    (japanese-jisx0212	#x2A #x6A)	; �����
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
    (latin-iso8859-4	#xF9)	; �����
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
    (japanese-jisx0212	#x2B #x6A)	; �����
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
    (japanese-jisx0212	#x2A #x71)	; �����
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
    (japanese-jisx0212	#x2B #x71)	; �����
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
    (japanese-jisx0212	#x2A #x74)	; �����
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
    (japanese-jisx0212	#x2B #x74)	; �����
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
    (japanese-jisx0212	#x2A #x73)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (ucs		. #x0179)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->lowercase	#x017A)
    (latin-iso8859-2		#xAC)	; �����
    (japanese-jisx0213-1	#x2A #x29)	; Ź
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
    (japanese-jisx0212	#x2A #x75)	; �����
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
    (latin-iso8859-2		#xBC)	; �����
    (japanese-jisx0213-1	#x2A #x35)	; ź
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
    (japanese-jisx0212	#x2B #x75)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (ucs		. #x017B)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->lowercase	#x017C)
    (latin-iso8859-2		#xAF)	; �����
    (latin-iso8859-3		#xAF)	; �����
    (japanese-jisx0213-1	#x2A #x2B)	; Ż
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
    (japanese-jisx0212	#x2A #x77)	; �����
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
    (latin-iso8859-2		#xBF)	; �����
    (latin-iso8859-3		#xBF)	; �����
    (japanese-jisx0213-1	#x2A #x38)	; ż
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
    (japanese-jisx0212	#x2B #x77)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (ucs		. #x017D)
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->lowercase	#x017E)
    (latin-iso8859-2		#xAE)	; �����
    (latin-iso8859-4		#xAE)	; �����
    (japanese-jisx0213-1	#x2A #x2A)	; Ž
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
    (japanese-jisx0212	#x2A #x76)	; �����
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
    (latin-iso8859-2		#xBE)	; �����
    (latin-iso8859-4		#xBE)	; �����
    (japanese-jisx0213-1	#x2A #x37)	; ž
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
    (japanese-jisx0212	#x2B #x76)	; �����
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
