;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with macron")
      (=jis-x0213-1-2000  . #x2975)	; �����
      (=jis-x0212	  . #x2A27)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (=ucs		. #x0100)	; Ā
    (latin-iso8859-4	. #xC0)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with macron")
    (=>ucs		. #x0100)	; Ā
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0100)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (=jis-x0213-1-2000	. #x2975)	; �����
    (=jis-x0212		. #x2A27)	; �����
    (=jef-china3	. #x87A8)	; �����
    (=ucs@jis		. #x0100)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with macron")
      (=jis-x0213-1-2000  . #x297A)	; �����
      (=jis-x0212	  . #x2B27)	; �����
      (=gb2312		  . #x2821)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (=ucs		. #x0101)	; ā
    (latin-iso8859-4	. #xE0)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter a with macron")
    (=>ucs		. #x0101)	; ā
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0101)
    (->uppercase
     ((name . "fullwidth latin capital letter a with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (=jis-x0213-1-2000	. #x297A)	; �����
    (=jis-x0212		. #x2B27)	; �����
    (=gb2312		. #x2821)	; �����
    (=jef-china3	. #x87BC)	; �����
    (=ucs@jis		. #x0101)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with breve")
      (=jis-x0213-1-2000  . #x2A3A)	; �����
      (=jis-x0212	  . #x2A25)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (=ucs		. #x0102)	; Ă
    (latin-tcvn5712	. #xA1)	; �����
    (latin-iso8859-2	. #xC3)	; �����
    (latin-viscii	. #xC5)	; �����
    (latin-viscii-upper . #xE5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with breve")
    (=>ucs		. #x0102)	; Ă
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0102)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (=jis-x0213-1-2000	. #x2A3A)	; �����
    (=jis-x0212		. #x2A25)	; �����
    (=jef-china3	. #x87DE)	; �����
    (=ucs@jis		. #x0102)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with breve")
      (=jis-x0213-1-2000  . #x2A49)	; �����
      (=jis-x0212	  . #x2B25)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (=ucs		. #x0103)	; ă
    (latin-tcvn5712	. #xA8)	; �����
    (latin-iso8859-2	. #xE3)	; �����
    (latin-viscii	. #xE5)	; �����
    (latin-viscii-lower . #xE5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter a with breve")
    (=>ucs		. #x0103)	; ă
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0103)
    (->uppercase
     ((name . "fullwidth latin capital letter a with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (=jis-x0213-1-2000	. #x2A49)	; �����
    (=jis-x0212		. #x2B25)	; �����
    (=jef-china3	. #x87E8)	; �����
    (=ucs@jis		. #x0103)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with ogonek")
      (=jis-x0213-1-2000  . #x2A21)	; �����
      (=jis-x0212	  . #x2A28)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (=ucs		. #x0104)	; Ą
    (latin-iso8859-4	. #xA1)	; �����
    (latin-iso8859-2	. #xA1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter a with ogonek")
    (=>ucs		. #x0104)	; Ą
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0104)
    (->lowercase
     ((name		  . "fullwidth latin small letter a with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (=jis-x0213-1-2000	. #x2A21)	; �����
    (=jis-x0212		. #x2A28)	; �����
    (=jef-china3	. #x8AA3)	; �����
    (=ucs@jis		. #x0104)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with ogonek")
      (=jis-x0213-1-2000  . #x2A2C)	; �����
      (=jis-x0212	  . #x2B28)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (=ucs		. #x0105)	; ą
    (latin-iso8859-4	. #xB1)	; �����
    (latin-iso8859-2	. #xB1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter a with ogonek")
    (=>ucs		. #x0105)	; ą
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0105)
    (->uppercase
     ((name . "fullwidth latin capital letter a with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (=jis-x0213-1-2000	. #x2A2C)	; �����
    (=jis-x0212		. #x2B28)	; �����
    (=jef-china3	. #x8AAB)	; �����
    (=ucs@jis		. #x0105)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with acute")
      (=jis-x0213-1-2000  . #x2A3C)	; �����
      (=jis-x0212	  . #x2A2B)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (=ucs		. #x0106)	; Ć
    (latin-iso8859-2	. #xC6)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with acute")
    (=>ucs		. #x0106)	; Ć
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0106)
    (->lowercase
     ((name		  . "fullwidth latin small letter c with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (=jis-x0213-1-2000	. #x2A3C)	; �����
    (=jis-x0212		. #x2A2B)	; �����
    (=jef-china3	. #x85D6)	; �����
    (=ucs@jis		. #x0106)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with acute")
      (=jis-x0213-1-2000  . #x2A4B)	; �����
      (=jis-x0212	  . #x2B2B)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (=ucs		. #x0107)	; ć
    (latin-iso8859-2	. #xE6)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter c with acute")
    (=>ucs		. #x0107)	; ć
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0107)
    (->uppercase
     ((name . "fullwidth latin capital letter c with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (=jis-x0213-1-2000	. #x2A4B)	; �����
    (=jis-x0212		. #x2B2B)	; �����
    (=jef-china3	. #x85EC)	; �����
    (=ucs@jis		. #x0107)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with circumflex")
      (=jis-x0213-1-2000  . #x2A59)	; �����
      (=jis-x0212	  . #x2A2C)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (=ucs		. #x0108)	; Ĉ
    (latin-iso8859-3	. #xC6)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter c with circumflex")
    (=>ucs		. #x0108)	; Ĉ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0108)
    (->lowercase
     ((name . "fullwidth latin small letter c with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (=jis-x0213-1-2000	. #x2A59)	; �����
    (=jis-x0212		. #x2A2C)	; �����
    (=jef-china3	. #x86B8)	; �����
    (=ucs@jis		. #x0108)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter c with circumflex")
      (=jis-x0213-1-2000  . #x2A5F)	; �����
      (=jis-x0212	  . #x2B2C)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (=ucs		. #x0109)	; ĉ
    (latin-iso8859-3	. #xE6)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter c with circumflex")
    (=>ucs		. #x0109)	; ĉ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0109)
    (->uppercase
     ((name . "fullwidth latin capital letter c with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (=jis-x0213-1-2000	. #x2A5F)	; �����
    (=jis-x0212		. #x2B2C)	; �����
    (=jef-china3	. #x86C5)	; �����
    (=ucs@jis		. #x0109)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with dot above")
      (=jis-x0212	  . #x2A2F)	; �����
      (=jef-china3	  . #x87FA)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (=ucs		. #x010A)	; Ċ
    (latin-iso8859-3	. #xC5)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter c with dot above")
    (=>ucs		. #x010A)	; Ċ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010A)
    (->lowercase
     ((name . "fullwidth latin small letter c with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (=jis-x0212		. #x2A2F)	; �����
    (=jef-china3	. #x87FA)	; �����
    (=ucs@jis		. #x010A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter c with dot above")
      (=jis-x0212	  . #x2B2F)	; �����
      (=jef-china3	  . #x88B2)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (=ucs		. #x010B)	; ċ
    (latin-iso8859-3	. #xE5)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter c with dot above")
    (=>ucs		. #x010B)	; ċ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010B)
    (->uppercase
     ((name . "fullwidth latin capital letter c with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (=jis-x0212		. #x2B2F)	; �����
    (=jef-china3	. #x88B2)	; �����
    (=ucs@jis		. #x010B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with caron")
      (=jis-x0213-1-2000  . #x2A3D)	; �����
      (=jis-x0212	  . #x2A2D)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (=ucs		. #x010C)	; Č
    (latin-iso8859-4	. #xC8)	; �����
    (latin-iso8859-2	. #xC8)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter c with caron")
    (=>ucs		. #x010C)	; Č
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010C)
    (->lowercase
     ((name . "fullwidth latin capital letter c with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (=jis-x0213-1-2000	. #x2A3D)	; �����
    (=jis-x0212		. #x2A2D)	; �����
    (=jef-china3	. #x88E0)	; �����
    (=ucs@jis		. #x010C)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with caron")
      (=jis-x0213-1-2000  . #x2A4C)	; �����
      (=jis-x0212	  . #x2B2D)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (=ucs		. #x010D)	; č
    (latin-iso8859-4	. #xE8)	; �����
    (latin-iso8859-2	. #xE8)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter c with caron")
    (=>ucs		. #x010D)	; č
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010D)
    (->uppercase
     ((name		  . "fullwidth latin small letter c with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (=jis-x0213-1-2000	. #x2A4C)	; �����
    (=jis-x0212		. #x2B2D)	; �����
    (=jef-china3	. #x88EF)	; �����
    (=ucs@jis		. #x010D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter d with caron")
      (=jis-x0213-1-2000  . #x2A40)	; �����
      (=jis-x0212	  . #x2A30)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (=ucs		. #x010E)	; Ď
    (latin-iso8859-2	. #xCF)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter d with caron")
    (=>ucs		. #x010E)	; Ď
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010E)
    (->lowercase
     ((name		  . "fullwidth latin small letter d with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (=jis-x0213-1-2000	. #x2A40)	; �����
    (=jis-x0212		. #x2A30)	; �����
    (=jef-china3	. #x88E1)	; �����
    (=ucs@jis		. #x010E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter d with caron")
      (=jis-x0213-1-2000  . #x2A4F)	; �����
      (=jis-x0212	  . #x2B30)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (=ucs		. #x010F)	; ď
    (latin-iso8859-2	. #xEF)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter d with caron")
    (=>ucs		. #x010F)	; ď
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x010F)
    (->uppercase
     ((name . "fullwidth latin capital letter d with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (=jis-x0213-1-2000	. #x2A4F)	; �����
    (=jis-x0212		. #x2B30)	; �����
    (=jef-china3	. #x88F0)	; �����
    (=ucs@jis		. #x010F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
      (=jis-x0212	  . #x2922)	; �����
      (=jef-china3	  . #x83A3)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (=ucs		. #x0110)	; Đ
    (latin-tcvn5712	. #xA7)	; �����
    (latin-iso8859-4	. #xD0)	; �����
    (latin-iso8859-2	. #xD0)	; �����
    (latin-viscii	. #xD0)	; �����
    (latin-viscii-upper . #xF0)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
    (=>ucs		. #x0110)	; Đ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0110)
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER D WITH STROKE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    (=jis-x0212		. #x2922)	; �����
    (=jef-china3	. #x83A3)	; �����
    (=ucs@jis		. #x0110)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    (=ucs		. #x0111)	; đ
    (latin-tcvn5712	. #xAE)	; �����
    (latin-iso8859-4	. #xF0)	; �����
    (latin-iso8859-2	. #xF0)	; �����
    (latin-viscii	. #xF0)	; �����
    (latin-viscii-lower . #xF0)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter d with stroke")
    (=>ucs		. #x0111)	; đ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "fullwidth latin capital letter d with stroke")
      ))
    (=jis-x0213-1-2000	. #x2A50)	; �����
    (=jis-x0212		. #x2942)	; �����
    (=ks-x1001		. #x2922)	; �����
    (=jef-china3	. #x83AE)	; �����
    (=ucs@jis		. #x0111)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with macron")
      (=jis-x0213-1-2000  . #x2978)	; �����
      (=jis-x0212	  . #x2A37)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (=ucs		. #x0112)	; Ē
    (latin-iso8859-4	. #xAA)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with macron")
    (=>ucs		. #x0112)	; Ē
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0112)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (=jis-x0213-1-2000	. #x2978)	; �����
    (=jis-x0212		. #x2A37)	; �����
    (=jef-china3	. #x87AB)	; �����
    (=ucs@jis		. #x0112)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with macron")
      (=jis-x0213-1-2000  . #x297D)	; �����
      (=jis-x0212	  . #x2B37)	; �����
      (=gb2312		  . #x2825)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (=ucs		. #x0113)	; ē
    (latin-iso8859-4	. #xBA)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter e with macron")
    (=>ucs		. #x0113)	; ē
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0113)
    (->uppercase
     ((name . "fullwidth latin capital letter e with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (=jis-x0213-1-2000	. #x297D)	; �����
    (=jis-x0212		. #x2B37)	; �����
    (=gb2312		. #x2825)	; �����
    (=jef-china3	. #x87BF)	; �����
    (=ucs@jis		. #x0113)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH BREVE")
      (=ucs		  . #x0115)	; ĕ
      ))
    (=ucs		. #x0114)	; Ĕ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH BREVE")
      (=ucs		  . #x0114)	; Ĕ
      ))
    (=ucs		. #x0115)	; ĕ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=jis-x0212	  . #x2A36)	; �����
      (=jef-china3	  . #x87FC)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (=ucs		. #x0116)	; Ė
    (latin-iso8859-4	. #xCC)	; �����
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (=>ucs		. #x0116)	; Ė
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0116)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (=jis-x0212		. #x2A36)	; �����
    (=jef-china3	. #x87FC)	; �����
    (=ucs@jis		. #x0116)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
      (=jis-x0212	  . #x2B36)	; �����
      (=jef-china3	  . #x88B4)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (=ucs		. #x0117)	; ė
    (latin-iso8859-4	. #xEC)	; �����
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
    (=>ucs		. #x0117)	; ė
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0117)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER E WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (=jis-x0212		. #x2B36)	; �����
    (=jef-china3	. #x88B4)	; �����
    (=ucs@jis		. #x0117)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with ogonek")
      (=jis-x0213-1-2000  . #x2A3E)	; �����
      (=jis-x0212	  . #x2A38)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (=ucs		. #x0118)	; Ę
    (latin-iso8859-4	. #xCA)	; �����
    (latin-iso8859-2	. #xCA)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with ogonek")
    (=>ucs		. #x0118)	; Ę
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0118)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (=jis-x0213-1-2000	. #x2A3E)	; �����
    (=jis-x0212		. #x2A38)	; �����
    (=jef-china3	. #x8AA4)	; �����
    (=ucs@jis		. #x0118)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with ogonek")
      (=jis-x0213-1-2000  . #x2A4D)	; �����
      (=jis-x0212	  . #x2B38)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (=ucs		. #x0119)	; ę
    (latin-iso8859-4	. #xEA)	; �����
    (latin-iso8859-2	. #xEA)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter e with ogonek")
    (=>ucs		. #x0119)	; ę
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0119)
    (->uppercase
     ((name . "fullwidth latin capital letter e with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (=jis-x0213-1-2000	. #x2A4D)	; �����
    (=jis-x0212		. #x2B38)	; �����
    (=jef-china3	. #x8AAC)	; �����
    (=ucs@jis		. #x0119)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with caron")
      (=jis-x0213-1-2000  . #x2A3F)	; �����
      (=jis-x0212	  . #x2A35)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (=ucs		. #x011A)	; Ě
    (latin-iso8859-2	. #xCC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter e with caron")
    (=>ucs		. #x011A)	; Ě
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011A)
    (->lowercase
     ((name		  . "fullwidth latin small letter e with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (=jis-x0213-1-2000	. #x2A3F)	; �����
    (=jis-x0212		. #x2A35)	; �����
    (=jef-china3	. #x88E2)	; �����
    (=ucs@jis		. #x011A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with caron")
      (=jis-x0213-1-2000  . #x2A4E)	; �����
      (=jis-x0212	  . #x2B35)	; �����
      (=gb2312		  . #x2827)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (=ucs		. #x011B)	; ě
    (latin-iso8859-2	. #xEC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter e with caron")
    (=>ucs		. #x011B)	; ě
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011B)
    (->uppercase
     ((name . "fullwidth latin capital letter e with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (=jis-x0213-1-2000	. #x2A4E)	; �����
    (=jis-x0212		. #x2B35)	; �����
    (=gb2312		. #x2827)	; �����
    (=jef-china3	. #x88F1)	; �����
    (=ucs@jis		. #x011B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with circumflex")
      (=jis-x0213-1-2000  . #x2A5A)	; �����
      (=jis-x0212	  . #x2A3A)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (=ucs		. #x011C)	; Ĝ
    (latin-iso8859-3	. #xD8)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter g with circumflex")
    (=>ucs		. #x011C)	; Ĝ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011C)
    (->lowercase
     ((name . "fullwidth latin small letter g with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (=jis-x0213-1-2000	. #x2A5A)	; �����
    (=jis-x0212		. #x2A3A)	; �����
    (=jef-china3	. #x86BA)	; �����
    (=ucs@jis		. #x011C)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter g with circumflex")
      (=jis-x0213-1-2000  . #x2A60)	; �����
      (=jis-x0212	  . #x2B3A)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (=ucs		. #x011D)	; ĝ
    (latin-iso8859-3	. #xF8)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter g with circumflex")
    (=>ucs		. #x011D)	; ĝ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011D)
    (->uppercase
     ((name . "fullwidth latin small letter g with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (=jis-x0213-1-2000	. #x2A60)	; �����
    (=jis-x0212		. #x2B3A)	; �����
    (=jef-china3	. #x86C7)	; �����
    (=ucs@jis		. #x011D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
      (=jis-x0212	  . #x2A3B)	; �����
      (=jef-china3	  . #x87E1)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (=ucs		. #x011E)	; Ğ
    (latin-iso8859-9	. #xD0)	; �����
    (latin-iso8859-3	. #xAB)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
    (=>ucs		. #x011E)	; Ğ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011E)
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (=jis-x0212		. #x2A3B)	; �����
    (=jef-china3	. #x87E1)	; �����
    (=ucs@jis		. #x011E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
      (=jis-x0212	  . #x2B3B)	; �����
      (=jef-china3	  . #x87EB)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (=ucs		. #x011F)	; ğ
    (latin-iso8859-9	. #xF0)	; �����
    (latin-iso8859-3	. #xBB)	; �����
    ))
(define-char
  '((name		. "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
    (=>ucs		. #x011F)	; ğ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x011F)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (=jis-x0212		. #x2B3B)	; �����
    (=jef-china3	. #x87EB)	; �����
    (=ucs@jis		. #x011F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=jis-x0212	  . #x2A3D)	; �����
      (=jef-china3	  . #x87FE)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (=ucs		. #x0120)	; Ġ
    (latin-iso8859-3	. #xD5)	; �����
    ))
(define-char
  '((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (=>ucs		. #x0120)	; Ġ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0120)
    (->lowercase
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (=jis-x0212		. #x2A3D)	; �����
    (=jef-china3	. #x87FE)	; �����
    (=ucs@jis		. #x0120)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
      (=jis-x0212	  . #x2B3D)	; �����
      (=jef-china3	  . #x88B6)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (=ucs		. #x0121)	; ġ
    (latin-iso8859-3	. #xF5)	; �����
    ))
(define-char
  '((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
    (=>ucs		. #x0121)	; ġ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0121)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (=jis-x0212		. #x2B3D)	; �����
    (=jef-china3	. #x88B6)	; �����
    (=ucs@jis		. #x0121)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with cedilla")
      (=jis-x0212	  . #x2A3C)	; �����
      (=ucs@jis		  . #x0122)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CEDILLA")
      (=ucs		  . #x0123)	; ģ
      ))
    (=ucs		. #x0122)	; Ģ
    (latin-iso8859-4	. #xAB)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter g with cedilla")
    (=>ucs		. #x0122)	; Ģ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0122)
    (->lowercase
     ((name . "fullwidth latin small letter g with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    (=jis-x0212		. #x2A3C)	; �����
    (=ucs@jis		. #x0122)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    (=ucs		. #x0123)	; ģ
    (latin-iso8859-4	. #xBB)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with circumflex")
      (=jis-x0213-1-2000  . #x2A5B)	; �����
      (=jis-x0212	  . #x2A3E)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (=ucs		. #x0124)	; Ĥ
    (latin-iso8859-3	. #xA6)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter h with circumflex")
    (=>ucs		. #x0124)	; Ĥ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0124)
    (->lowercase
     ((name . "fullwidth latin small letter h with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (=jis-x0213-1-2000	. #x2A5B)	; �����
    (=jis-x0212		. #x2A3E)	; �����
    (=jef-china3	. #x86BB)	; �����
    (=ucs@jis		. #x0124)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter h with circumflex")
      (=jis-x0213-1-2000  . #x2A61)	; �����
      (=jis-x0212	  . #x2B3E)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (=ucs		. #x0125)	; ĥ
    (latin-iso8859-3	. #xB6)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter h with circumflex")
    (=>ucs		. #x0125)	; ĥ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0125)
    (->uppercase
     ((name . "fullwidth latin capital letter h with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (=jis-x0213-1-2000	. #x2A61)	; �����
    (=jis-x0212		. #x2B3E)	; �����
    (=jef-china3	. #x86C8)	; �����
    (=ucs@jis		. #x0125)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with stroke")
      (=jis-x0212	  . #x2924)	; �����
      (=ks-x1001	  . #x2824)	; �����
      (=ucs@jis		  . #x0126)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=ucs		. #x0126)	; Ħ
    (latin-iso8859-3	. #xA1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter h with stroke")
    (=>ucs		. #x0126)	; Ħ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0126)
    (->lowercase
     ((name		  . "fullwidth latin small letter h with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (=jis-x0212		. #x2924)	; �����
    (=ks-x1001		. #x2824)	; �����
    (=ucs@jis		. #x0126)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter h with stroke")
      (=jis-x0213-1-2000  . #x2A7D)	; �����
      (=jis-x0212	  . #x2944)	; �����
      (=ks-x1001	  . #x2924)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (=ucs		. #x0127)	; ħ
    (latin-iso8859-3	. #xB1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter h with stroke")
    (=>ucs		. #x0127)	; ħ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0127)
    (->uppercase
     ((name . "fullwidth latin capital letter h with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=jis-x0213-1-2000	. #x2A7D)	; �����
    (=jis-x0212		. #x2944)	; �����
    (=ks-x1001		. #x2924)	; �����
    (=ucs@jis		. #x0127)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with tilde")
      (=jis-x0212	  . #x2A47)	; �����
      (=jef-china3	  . #x86E5)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (=ucs		. #x0128)	; Ĩ
    (latin-iso8859-4	. #xA5)	; �����
    (latin-viscii	. #xCE)	; �����
    (latin-viscii-upper . #xEE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with tilde")
    (=>ucs		. #x0128)	; Ĩ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0128)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (=jis-x0212		. #x2A47)	; �����
    (=jef-china3	. #x86E5)	; �����
    (=ucs@jis		. #x0128)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with tilde")
      (=jis-x0212	  . #x2B47)	; �����
      (=ucs@jis		  . #x0129)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (=ucs		. #x0129)	; ĩ
    (latin-tcvn5712	. #xDC)	; �����
    (latin-iso8859-4	. #xB5)	; �����
    (latin-viscii	. #xEE)	; �����
    (latin-viscii-lower . #xEE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter i with tilde")
    (=>ucs		. #x0129)	; ĩ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0129)
    (->uppercase
     ((name . "fullwidth latin capital letter i with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (=jis-x0212		. #x2B47)	; �����
    (=ucs@jis		. #x0129)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with macron")
      (=jis-x0213-1-2000  . #x2976)	; �����
      (=jis-x0212	  . #x2A45)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (=ucs		. #x012A)	; Ī
    (latin-iso8859-4	. #xCF)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with macron")
    (=>ucs		. #x012A)	; Ī
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012A)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (=jis-x0213-1-2000	. #x2976)	; �����
    (=jis-x0212		. #x2A45)	; �����
    (=jef-china3	. #x87AD)	; �����
    (=ucs@jis		. #x012A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with macron")
      (=jis-x0213-1-2000  . #x297B)	; �����
      (=jis-x0212	  . #x2B45)	; �����
      (=gb2312		  . #x2829)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (=ucs		. #x012B)	; ī
    (latin-iso8859-4	. #xEF)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter i with macron")
    (=>ucs		. #x012B)	; ī
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012B)
    (->uppercase
     ((name . "fullwidth latin capital letter i with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (=jis-x0213-1-2000	. #x297B)	; �����
    (=jis-x0212		. #x2B45)	; �����
    (=gb2312		. #x2829)	; �����
    (=ucs@jis		. #x012B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH BREVE")
      (=ucs		  . #x012D)	; ĭ
      ))
    (=ucs		. #x012C)	; Ĭ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH BREVE")
      (=ucs		  . #x012C)	; Ĭ
      ))
    (=ucs		. #x012D)	; ĭ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with ogonek")
      (=jis-x0212	  . #x2A46)	; �����
      (=jef-china3	  . #x8AA6)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (=ucs		. #x012E)	; Į
    (latin-iso8859-4	. #xC7)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter i with ogonek")
    (=>ucs		. #x012E)	; Į
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012E)
    (->lowercase
     ((name		  . "fullwidth latin small letter i with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (=jis-x0212		. #x2A46)	; �����
    (=jef-china3	. #x8AA6)	; �����
    (=ucs@jis		. #x012E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with ogonek")
      (=jis-x0212	  . #x2B46)	; �����
      (=jef-china3	  . #x8AAE)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (=ucs		. #x012F)	; į
    (latin-iso8859-4	. #xE7)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter i with ogonek")
    (=>ucs		. #x012F)	; į
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x012F)
    (->uppercase
     ((name . "fullwidth latin capital letter i with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (=jis-x0212		. #x2B46)	; �����
    (=jef-china3	. #x8AAE)	; �����
    (=ucs@jis		. #x012F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with dot above")
      (=jis-x0212	  . #x2A44)	; �����
      (=jef-china3	  . #x88A2)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    (=ucs		. #x0130)	; İ
    (latin-iso8859-9	. #xDD)	; �����
    (latin-iso8859-3	. #xA9)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter i with dot above")
    (=>ucs		. #x0130)	; İ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0130)
    (->lowercase
     ((name . "fullwidth latin small letter i with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DOT ABOVE")
      (=ucs		  . #x0130)	; İ
      ))
    (=jis-x0212		. #x2A44)	; �����
    (=jef-china3	. #x88A2)	; �����
    (=ucs@jis		. #x0130)	; �����
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
    (=ucs		. #x0131)	; ı
    (latin-iso8859-9	. #xFD)	; �����
    (latin-iso8859-3	. #xB9)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter dotless i")
    (=>ucs		. #x0131)	; ı
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin capital letter dotless i")
      ))
    (=jis-x0212		. #x2945)	; �����
    (=ks-x1001		. #x2925)	; �����
    (=jef-china3	. #x83B3)	; �����
    (=ucs@jis		. #x0131)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0049 #x004A)
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    (=ucs		. #x0132)	; Ĳ
    (=jis-x0212		. #x2926)	; �����
    (=ks-x1001		. #x2826)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature ij")
      (=jis-x0212	  . #x2946)	; �����
      (=ks-x1001	  . #x2926)	; �����
      (=ucs@jis		  . #x0133)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (=ucs		. #x0133)	; ĳ
    ))
(define-char
  '((name		. "fullwidth latin small ligature ij")
    (=>ucs		. #x0133)	; ĳ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0133)
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    (=jis-x0212		. #x2946)	; �����
    (=ks-x1001		. #x2926)	; �����
    (=ucs@jis		. #x0133)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter j with circumflex")
      (=jis-x0213-1-2000  . #x2A5C)	; �����
      (=jis-x0212	  . #x2A48)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (=ucs		. #x0134)	; Ĵ
    (latin-iso8859-3	. #xAC)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter j with circumflex")
    (=>ucs		. #x0134)	; Ĵ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0134)
    (->lowercase
     ((name . "fullwidth latin small letter j with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (=jis-x0213-1-2000	. #x2A5C)	; �����
    (=jis-x0212		. #x2A48)	; �����
    (=jef-china3	. #x86BD)	; �����
    (=ucs@jis		. #x0134)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter j with circumflex")
      (=jis-x0213-1-2000  . #x2A62)	; �����
      (=jis-x0212	  . #x2B48)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (=ucs		. #x0135)	; ĵ
    (latin-iso8859-3	. #xBC)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter j with circumflex")
    (=>ucs		. #x0135)	; ĵ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0135)
    (->uppercase
     ((name . "fullwidth latin capital letter j with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (=jis-x0213-1-2000	. #x2A62)	; �����
    (=jis-x0212		. #x2B48)	; �����
    (=jef-china3	. #x86CA)	; �����
    (=ucs@jis		. #x0135)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter k with cedilla")
      (=jis-x0212	  . #x2A49)	; �����
      (=ucs@jis		  . #x0136)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (=ucs		. #x0136)	; Ķ
    (latin-iso8859-4	. #xD3)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter k with cedilla")
    (=>ucs		. #x0136)	; Ķ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0136)
    (->lowercase
     ((name . "fullwidth latin small letter k with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (=jis-x0212		. #x2A49)	; �����
    (=ucs@jis		. #x0136)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter k with cedilla")
      (=jis-x0212	  . #x2B49)	; �����
      (=ucs@jis		  . #x0137)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (=ucs		. #x0137)	; ķ
    (latin-iso8859-4	. #xF3)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter k with cedilla")
    (=>ucs		. #x0137)	; ķ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0137)
    (->uppercase
     ((name . "fullwidth latin capital letter k with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (=jis-x0212		. #x2B49)	; �����
    (=ucs@jis		. #x0137)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->fullwidth
     ((name		  . "fullwidth latin small letter kra")
      (=jis-x0212	  . #x2947)	; �����
      (=ks-x1001	  . #x2927)	; �����
      (=ucs@jis		  . #x0138)	; �����
      ))
    (=ucs		. #x0138)	; ĸ
    (latin-iso8859-4	. #xA2)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter kra")
    (=>ucs		. #x0138)	; ĸ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->decomposition	wide #x0138)
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER KRA")
      (=ucs		  . #x0138)	; ĸ
      ))
    (=jis-x0212		. #x2947)	; �����
    (=ks-x1001		. #x2927)	; �����
    (=ucs@jis		. #x0138)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with acute")
      (=jis-x0213-1-2000  . #x2A3B)	; �����
      (=jis-x0212	  . #x2A4A)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (=ucs		. #x0139)	; Ĺ
    (latin-iso8859-2	. #xC5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with acute")
    (=>ucs		. #x0139)	; Ĺ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0139)
    (->lowercase
     ((name		  . "fullwidth latin small letter l with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (=jis-x0213-1-2000	. #x2A3B)	; �����
    (=jis-x0212		. #x2A4A)	; �����
    (=jef-china3	. #x85DD)	; �����
    (=ucs@jis		. #x0139)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with acute")
      (=jis-x0213-1-2000  . #x2A4A)	; �����
      (=jis-x0212	  . #x2B4A)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (=ucs		. #x013A)	; ĺ
    (latin-iso8859-2	. #xE5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter l with acute")
    (=>ucs		. #x013A)	; ĺ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013A)
    (->uppercase
     ((name . "fullwidth latin capital letter l with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (=jis-x0213-1-2000	. #x2A4A)	; �����
    (=jis-x0212		. #x2B4A)	; �����
    (=jef-china3	. #x85F3)	; �����
    (=ucs@jis		. #x013A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with cedilla")
      (=jis-x0212	  . #x2A4C)	; �����
      (=jef-china3	  . #x89F8)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (=ucs		. #x013B)	; Ļ
    (latin-iso8859-4	. #xA6)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter l with cedilla")
    (=>ucs		. #x013B)	; Ļ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013B)
    (->lowercase
     ((name . "fullwidth latin capital letter l with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (=jis-x0212		. #x2A4C)	; �����
    (=jef-china3	. #x89F8)	; �����
    (=ucs@jis		. #x013B)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter l with cedilla")
      (=jis-x0212	  . #x2B4C)	; �����
      (=jef-china3	  . #x89FE)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (=ucs		. #x013C)	; ļ
    (latin-iso8859-4	. #xB6)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter l with cedilla")
    (=>ucs		. #x013C)	; ļ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013C)
    (->uppercase
     ((name . "fullwidth latin capital letter l with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (=jis-x0212		. #x2B4C)	; �����
    (=jef-china3	. #x89FE)	; �����
    (=ucs@jis		. #x013C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with caron")
      (=jis-x0213-1-2000  . #x2A24)	; �����
      (=jis-x0212	  . #x2A4B)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (=ucs		. #x013D)	; Ľ
    (latin-iso8859-2	. #xA5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with caron")
    (=>ucs		. #x013D)	; Ľ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013D)
    (->lowercase
     ((name		  . "fullwidth latin small letter l with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (=jis-x0213-1-2000	. #x2A24)	; �����
    (=jis-x0212		. #x2A4B)	; �����
    (=jef-china3	. #x88E6)	; �����
    (=ucs@jis		. #x013D)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with caron")
      (=jis-x0213-1-2000  . #x2A2F)	; �����
      (=jis-x0212	  . #x2B4B)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (=ucs		. #x013E)	; ľ
    (latin-iso8859-2	. #xB5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter l with caron")
    (=>ucs		. #x013E)	; ľ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013E)
    (->uppercase
     ((name . "fullwidth latin capital letter l with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (=jis-x0213-1-2000	. #x2A2F)	; �����
    (=jis-x0212		. #x2B4B)	; �����
    (=jef-china3	. #x88F5)	; �����
    (=ucs@jis		. #x013E)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with middle dot")
      (=jis-x0212	  . #x2929)	; �����
      (=ks-x1001	  . #x2828)	; �����
      (=ucs@jis		  . #x013F)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (=ucs		. #x013F)	; Ŀ
    ))
(define-char
  '((name . "fullwidth latin capital letter l with middle dot")
    (=>ucs		. #x013F)	; Ŀ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x013F)
    (->lowercase
     ((name . "fullwidth latin small letter l with middle dot")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (=jis-x0212		. #x2929)	; �����
    (=ks-x1001		. #x2828)	; �����
    (=ucs@jis		. #x013F)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin small letter l with middle dot")
      (=jis-x0212	  . #x2949)	; �����
      (=ks-x1001	  . #x2928)	; �����
      (=ucs@jis		  . #x0140)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (=ucs		. #x0140)	; ŀ
    ))
(define-char
  '((name . "fullwidth latin small letter l with middle dot")
    (=>ucs		. #x0140)	; ŀ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0140)
    (->uppercase
     ((name . "fullwidth latin capital letter l with middle dot")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (=jis-x0212		. #x2949)	; �����
    (=ks-x1001		. #x2928)	; �����
    (=ucs@jis		. #x0140)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with stroke")
      (=jis-x0213-1-2000  . #x2A23)	; �����
      (=jis-x0212	  . #x2928)	; �����
      (=ks-x1001	  . #x2829)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (=ucs		. #x0141)	; Ł
    (latin-iso8859-2	. #xA3)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter l with stroke")
    (=>ucs		. #x0141)	; Ł
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0141)
    (->lowercase
     ((name		  . "fullwidth latin small letter l with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (=jis-x0213-1-2000	. #x2A23)	; �����
    (=jis-x0212		. #x2928)	; �����
    (=ks-x1001		. #x2829)	; �����
    (=jef-china3	. #x83A1)	; �����
    (=ucs@jis		. #x0141)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with stroke")
      (=jis-x0213-1-2000  . #x2A2E)	; �����
      (=jis-x0212	  . #x2948)	; �����
      (=ks-x1001	  . #x2929)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (=ucs		. #x0142)	; ł
    (latin-iso8859-2	. #xB3)	; �����
    ))
(define-char
  '((=>ucs		. #x0142)	; ł
    (=jef-china3	. #x83AC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter l with stroke")
    (=>ucs		. #x0142)	; ł
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0142)
    (->uppercase
     ((name . "fullwidth latin capital letter l with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (=jis-x0213-1-2000	. #x2A2E)	; �����
    (=jis-x0212		. #x2948)	; �����
    (=ks-x1001		. #x2929)	; �����
    (=ucs@jis		. #x0142)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with acute")
      (=jis-x0213-1-2000  . #x2A41)	; �����
      (=jis-x0212	  . #x2A4D)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (=ucs		. #x0143)	; Ń
    (latin-iso8859-2	. #xD1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with acute")
    (=>ucs		. #x0143)	; Ń
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0143)
    (->lowercase
     ((name		  . "fullwidth latin small letter n with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (=jis-x0213-1-2000	. #x2A41)	; �����
    (=jis-x0212		. #x2A4D)	; �����
    (=jef-china3	. #x85DF)	; �����
    (=ucs@jis		. #x0143)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with acute")
      (=jis-x0213-1-2000  . #x2A51)	; �����
      (=jis-x0212	  . #x2B4D)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (=ucs		. #x0144)	; ń
    (latin-iso8859-2	. #xF1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter n with acute")
    (=>ucs		. #x0144)	; ń
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0144)
    (->uppercase
     ((name . "fullwidth latin capital letter n with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (=jis-x0213-1-2000	. #x2A51)	; �����
    (=jis-x0212		. #x2B4D)	; �����
    (=jef-china3	. #x85F5)	; �����
    (=ucs@jis		. #x0144)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with cedilla")
      (=jis-x0212	  . #x2A4F)	; �����
      (=jef-china3	  . #x89F9)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (=ucs		. #x0145)	; Ņ
    (latin-iso8859-4	. #xD1)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter n with cedilla")
    (=>ucs		. #x0145)	; Ņ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0145)
    (->lowercase
     ((name . "fullwidth latin small letter n with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (=jis-x0212		. #x2A4F)	; �����
    (=jef-china3	. #x89F9)	; �����
    (=ucs@jis		. #x0145)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter n with cedilla")
      (=jis-x0212	  . #x2B4F)	; �����
      (=jef-china3	  . #x8AA1)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (=ucs		. #x0146)	; ņ
    (latin-iso8859-4	. #xF1)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter n with cedilla")
    (=>ucs		. #x0146)	; ņ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0146)
    (->uppercase
     ((name . "fullwidth latin capital letter n with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (=jis-x0212		. #x2B4F)	; �����
    (=jef-china3	. #x8AA1)	; �����
    (=ucs@jis		. #x0146)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with caron")
      (=jis-x0213-1-2000  . #x2A42)	; �����
      (=jis-x0212	  . #x2A4E)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (=ucs		. #x0147)	; Ň
    (latin-iso8859-2	. #xD2)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter n with caron")
    (=>ucs		. #x0147)	; Ň
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0147)
    (->lowercase
     ((name		  . "fullwidth latin small letter n with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (=jis-x0213-1-2000	. #x2A42)	; �����
    (=jis-x0212		. #x2A4E)	; �����
    (=jef-china3	. #x88E7)	; �����
    (=ucs@jis		. #x0147)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with caron")
      (=jis-x0213-1-2000  . #x2A52)	; �����
      (=jis-x0212	  . #x2B4E)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (=ucs		. #x0148)	; ň
    (latin-iso8859-2	. #xF2)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter n with caron")
    (=>ucs		. #x0148)	; ň
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0148)
    (->uppercase
     ((name . "fullwidth latin capital letter n with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (=jis-x0213-1-2000	. #x2A52)	; �����
    (=jis-x0212		. #x2B4E)	; �����
    (=jef-china3	. #x88F6)	; �����
    (=ucs@jis		. #x0148)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    (->fullwidth
     ((name . "fullwidth latin small letter n preceded by apostrophe")
      (=jis-x0212	  . #x294A)	; �����
      (=ks-x1001	  . #x2930)	; �����
      (=ucs@jis		  . #x0149)	; �����
      ))
    (=ucs		. #x0149)	; ŉ
    ))
(define-char
  '((name . "fullwidth latin small letter n preceded by apostrophe")
    (=>ucs		. #x0149)	; ŉ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0149)
    (<-fullwidth
     ((name . "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
      (=ucs		  . #x0149)	; ŉ
      ))
    (=jis-x0212		. #x294A)	; �����
    (=ks-x1001		. #x2930)	; �����
    (=ucs@jis		. #x0149)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter eng")
      (=jis-x0212	  . #x292B)	; �����
      (=ks-x1001	  . #x282F)	; �����
      (=ucs@jis		  . #x014A)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (=ucs		. #x014A)	; Ŋ
    (latin-iso8859-4	. #xBD)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter eng")
    (=>ucs		. #x014A)	; Ŋ
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
      (=ucs		  . #x014A)	; Ŋ
      ))
    (=jis-x0212		. #x292B)	; �����
    (=ks-x1001		. #x282F)	; �����
    (=ucs@jis		. #x014A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin small letter eng")
      (=jis-x0213-1-2000  . #x2A7A)	; �����
      (=jis-x0212	  . #x294B)	; �����
      (=ks-x1001	  . #x292F)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (=ucs		. #x014B)	; ŋ
    (latin-iso8859-4	. #xBF)	; �����
    (ipa		. #xD5)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter eng")
    (=>ucs		. #x014B)	; ŋ
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
      (=ucs		  . #x014B)	; ŋ
      ))
    (=jis-x0213-1-2000	. #x2A7A)	; �����
    (=jis-x0212		. #x294B)	; �����
    (=ks-x1001		. #x292F)	; �����
    (=ucs@jis		. #x014B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with macron")
      (=jis-x0213-1-2000  . #x2979)	; �����
      (=jis-x0212	  . #x2A57)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (=ucs		. #x014C)	; Ō
    (latin-iso8859-4	. #xD2)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter o with macron")
    (=>ucs		. #x014C)	; Ō
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014C)
    (->lowercase
     ((name		  . "fullwidth latin small letter o with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (=jis-x0213-1-2000	. #x2979)	; �����
    (=jis-x0212		. #x2A57)	; �����
    (=jef-china3	. #x87B3)	; �����
    (=ucs@jis		. #x014C)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with macron")
      (=jis-x0213-1-2000  . #x297E)	; �����
      (=jis-x0212	  . #x2B57)	; �����
      (=gb2312		  . #x282D)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (=ucs		. #x014D)	; ō
    (latin-iso8859-4	. #xF2)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter o with macron")
    (=>ucs		. #x014D)	; ō
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x014D)
    (->uppercase
     ((name . "fullwidth latin capital letter o with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (=jis-x0213-1-2000	. #x297E)	; �����
    (=jis-x0212		. #x2B57)	; �����
    (=gb2312		. #x282D)	; �����
    (=jef-china3	. #x87C7)	; �����
    (=ucs@jis		. #x014D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH BREVE")
      (=ucs		  . #x014F)	; ŏ
      ))
    (=ucs		. #x014E)	; Ŏ
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH BREVE")
      (=ucs		  . #x014E)	; Ŏ
      ))
    (=ucs		. #x014F)	; ŏ
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with double acute")
      (=jis-x0213-1-2000  . #x2A43)	; �����
      (=jis-x0212	  . #x2A56)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (=ucs		. #x0150)	; Ő
    (latin-iso8859-2	. #xD5)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter o with double acute")
    (=>ucs		. #x0150)	; Ő
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0150)
    (->lowercase
     ((name . "fullwidth latin small letter o with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (=jis-x0213-1-2000	. #x2A43)	; �����
    (=jis-x0212		. #x2A56)	; �����
    (=jef-china3	. #x89E2)	; �����
    (=ucs@jis		. #x0150)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter o with double acute")
      (=jis-x0213-1-2000  . #x2A53)	; �����
      (=jis-x0212	  . #x2B56)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (=ucs		. #x0151)	; ő
    (latin-iso8859-2	. #xF5)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter o with double acute")
    (=>ucs		. #x0151)	; ő
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0151)
    (->uppercase
     ((name . "fullwidth latin capital letter o with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (=jis-x0213-1-2000	. #x2A53)	; �����
    (=jis-x0212		. #x2B56)	; �����
    (=jef-china3	. #x89E5)	; �����
    (=ucs@jis		. #x0151)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    (=ucs		. #x0152)	; Œ
    (=jis-x0213-1-2000	. #x2B2B)	; �����
    (=jis-x0212		. #x292D)	; �����
    (=ks-x1001		. #x282B)	; �����
    (=jef-china3	. #x83A6)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature oe")
      (=jis-x0213-1-2000  . #x2B2A)	; �����
      (=jis-x0212	  . #x294D)	; �����
      (=ks-x1001	  . #x292B)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (=ucs		. #x0153)	; œ
    (ipa		. #xB0)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small ligature oe")
    (=>ucs		. #x0153)	; œ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0153)
    (->uppercase
     ((name		  . "fullwidth latin capital ligature oe")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    (=jis-x0213-1-2000	. #x2B2A)	; �����
    (=jis-x0212		. #x294D)	; �����
    (=ks-x1001		. #x292B)	; �����
    (=jef-china3	. #x83B1)	; �����
    (=ucs@jis		. #x0153)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with acute")
      (=jis-x0213-1-2000  . #x2A39)	; �����
      (=jis-x0212	  . #x2A59)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (=ucs		. #x0154)	; Ŕ
    (latin-iso8859-2	. #xC0)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter r with acute")
    (=>ucs		. #x0154)	; Ŕ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0154)
    (->lowercase
     ((name		  . "fullwidth latin small letter r with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (=jis-x0213-1-2000	. #x2A39)	; �����
    (=jis-x0212		. #x2A59)	; �����
    (=jef-china3	. #x85E3)	; �����
    (=ucs@jis		. #x0154)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with acute")
      (=jis-x0213-1-2000  . #x2A48)	; �����
      (=jis-x0212	  . #x2B59)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (=ucs		. #x0155)	; ŕ
    (latin-iso8859-2	. #xE0)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter r with acute")
    (=>ucs		. #x0155)	; ŕ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0155)
    (->uppercase
     ((name . "fullwidth latin capital letter r with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (=jis-x0213-1-2000	. #x2A48)	; �����
    (=jis-x0212		. #x2B59)	; �����
    (=jef-china3	. #x85F9)	; �����
    (=ucs@jis		. #x0155)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with cedilla")
      (=jis-x0212	  . #x2A5B)	; �����
      (=ucs@jis		  . #x0156)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (=ucs		. #x0156)	; Ŗ
    (latin-iso8859-4	. #xA3)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter r with cedilla")
    (=>ucs		. #x0156)	; Ŗ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0156)
    (->lowercase
     ((name . "fullwidth latin small letter r with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (=jis-x0212		. #x2A5B)	; �����
    (=ucs@jis		. #x0156)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter r with cedilla")
      (=jis-x0212	  . #x2B5B)	; �����
      (=ucs@jis		  . #x0157)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (=ucs		. #x0157)	; ŗ
    (latin-iso8859-4	. #xB3)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter r with cedilla")
    (=>ucs		. #x0157)	; ŗ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0157)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER R WITH CEDILLA")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (=jis-x0212		. #x2B5B)	; �����
    (=ucs@jis		. #x0157)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with caron")
      (=jis-x0213-1-2000  . #x2A44)	; �����
      (=jis-x0212	  . #x2A5A)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (=ucs		. #x0158)	; Ř
    (latin-iso8859-2	. #xD8)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter r with caron")
    (=>ucs		. #x0158)	; Ř
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0158)
    (->lowercase
     ((name		  . "fullwidth latin small letter r with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (=jis-x0213-1-2000	. #x2A44)	; �����
    (=jis-x0212		. #x2A5A)	; �����
    (=jef-china3	. #x88E9)	; �����
    (=ucs@jis		. #x0158)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with caron")
      (=jis-x0213-1-2000  . #x2A54)	; �����
      (=jis-x0212	  . #x2B5A)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (=ucs		. #x0159)	; ř
    (latin-iso8859-2	. #xF8)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter r with caron")
    (=>ucs		. #x0159)	; ř
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0159)
    (->uppercase
     ((name . "fullwidth latin capital letter r with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (=jis-x0213-1-2000	. #x2A54)	; �����
    (=jis-x0212		. #x2B5A)	; �����
    (=jef-china3	. #x88F8)	; �����
    (=ucs@jis		. #x0159)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with acute")
      (=jis-x0213-1-2000  . #x2A25)	; �����
      (=jis-x0212	  . #x2A5C)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (=ucs		. #x015A)	; Ś
    (latin-iso8859-2	. #xA6)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with acute")
    (=>ucs		. #x015A)	; Ś
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015A)
    (->lowercase
     ((name		  . "fullwidth latin small letter s with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (=jis-x0213-1-2000	. #x2A25)	; �����
    (=jis-x0212		. #x2A5C)	; �����
    (=jef-china3	. #x85E4)	; �����
    (=ucs@jis		. #x015A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with acute")
      (=jis-x0212	  . #x2B5C)	; �����
      (=jef-china3	  . #x85FA)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (=ucs		. #x015B)	; ś
    (=jis-x0213-1-2000	. #x2A30)	; �����
    (latin-iso8859-2	. #xB6)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter s with acute")
    (=>ucs		. #x015B)	; ś
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015B)
    (->uppercase
     ((name . "FULLWIDTH LATIN CAPITAL LETTER S WITH ACUTE")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (=jis-x0212		. #x2B5C)	; �����
    (=jef-china3	. #x85FA)	; �����
    (=ucs@jis		. #x015B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with circumflex")
      (=jis-x0213-1-2000  . #x2A5D)	; �����
      (=jis-x0212	  . #x2A5D)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (=ucs		. #x015C)	; Ŝ
    (latin-iso8859-3	. #xDE)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter s with circumflex")
    (=>ucs		. #x015C)	; Ŝ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015C)
    (->lowercase
     ((name . "fullwidth latin small letter s with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (=jis-x0213-1-2000	. #x2A5D)	; �����
    (=jis-x0212		. #x2A5D)	; �����
    (=jef-china3	. #x86C0)	; �����
    (=ucs@jis		. #x015C)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter s with circumflex")
      (=jis-x0213-1-2000  . #x2A63)	; �����
      (=jis-x0212	  . #x2B5D)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (=ucs		. #x015D)	; ŝ
    (latin-iso8859-3	. #xFE)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter s with circumflex")
    (=>ucs		. #x015D)	; ŝ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015D)
    (->uppercase
     ((name . "fullwidth latin capital letter s with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (=jis-x0213-1-2000	. #x2A63)	; �����
    (=jis-x0212		. #x2B5D)	; �����
    (=jef-china3	. #x86CD)	; �����
    (=ucs@jis		. #x015D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with cedilla")
      (=jis-x0213-1-2000  . #x2A27)	; �����
      (=jis-x0212	  . #x2A5F)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (=ucs		. #x015E)	; Ş
    (latin-iso8859-9	. #xDE)	; �����
    (latin-iso8859-3	. #xAA)	; �����
    (latin-iso8859-2	. #xAA)	; �����
    ))
(define-char
  '((=>ucs		. #x015E)	; Ş
    (=jef-china3	. #x8BCB)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter s with cedilla")
    (=>ucs		. #x015E)	; Ş
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015E)
    (->lowercase
     ((name . "fullwidth latin small letter s with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (=jis-x0213-1-2000	. #x2A27)	; �����
    (=jis-x0212		. #x2A5F)	; �����
    (=jef-china3	. #x89FA)	; �����
    (=ucs@jis		. #x015E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter s with cedilla")
      (=jis-x0213-1-2000  . #x2A33)	; �����
      (=jis-x0212	  . #x2B5F)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (=ucs		. #x015F)	; ş
    (latin-iso8859-9	. #xFE)	; �����
    (latin-iso8859-3	. #xBA)	; �����
    (latin-iso8859-2	. #xBA)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter s with cedilla")
    (=>ucs		. #x015F)	; ş
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x015F)
    (->uppercase
     ((name . "fullwidth latin capital letter s with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (=jis-x0213-1-2000	. #x2A33)	; �����
    (=jis-x0212		. #x2B5F)	; �����
    (=jef-china3	. #x8AA2)	; �����
    (=ucs@jis		. #x015F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with caron")
      (=jis-x0213-1-2000  . #x2A26)	; �����
      (=jis-x0212	  . #x2A5E)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (=ucs		. #x0160)	; Š
    (latin-iso8859-4	. #xA9)	; �����
    (latin-iso8859-2	. #xA9)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter s with caron")
    (=>ucs		. #x0160)	; Š
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0160)
    (->lowercase
     ((name		  . "fullwidth latin small letter s with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (=jis-x0213-1-2000	. #x2A26)	; �����
    (=jis-x0212		. #x2A5E)	; �����
    (=jef-china3	. #x88EA)	; �����
    (=ucs@jis		. #x0160)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with caron")
      (=jis-x0213-1-2000  . #x2A32)	; �����
      (=jis-x0212	  . #x2B5E)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (=ucs		. #x0161)	; š
    (latin-iso8859-4	. #xB9)	; �����
    (latin-iso8859-2	. #xB9)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter s with caron")
    (=>ucs		. #x0161)	; š
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0161)
    (->uppercase
     ((name . "fullwidth latin capital letter s with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (=jis-x0213-1-2000	. #x2A32)	; �����
    (=jis-x0212		. #x2B5E)	; �����
    (=jef-china3	. #x88F9)	; �����
    (=ucs@jis		. #x0161)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with cedilla")
      (=jis-x0213-1-2000  . #x2A47)	; �����
      (=jis-x0212	  . #x2A61)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (=ucs		. #x0162)	; Ţ
    (latin-iso8859-2	. #xDE)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter t with cedilla")
    (=>ucs		. #x0162)	; Ţ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0162)
    (->lowercase
     ((name . "fullwidth latin small letter t with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (=jis-x0213-1-2000	. #x2A47)	; �����
    (=jis-x0212		. #x2A61)	; �����
    (=jef-china3	. #x8BCC)	; �����
    (=ucs@jis		. #x0162)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter t with cedilla")
      (=jis-x0213-1-2000  . #x2A57)	; �����
      (=jis-x0212	  . #x2B61)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (=ucs		. #x0163)	; ţ
    (latin-iso8859-2	. #xFE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter t with cedilla")
    (=>ucs		. #x0163)	; ţ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0163)
    (->uppercase
     ((name . "fullwidth latin capital letter t with cedilla")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (=jis-x0213-1-2000	. #x2A57)	; �����
    (=jis-x0212		. #x2B61)	; �����
    (=ucs@jis		. #x0163)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with caron")
      (=jis-x0213-1-2000  . #x2A28)	; �����
      (=jis-x0212	  . #x2A60)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (=ucs		. #x0164)	; Ť
    (latin-iso8859-2	. #xAB)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter t with caron")
    (=>ucs		. #x0164)	; Ť
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0164)
    (->lowercase
     ((name . "fullwidth latin capital letter t with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (=jis-x0213-1-2000	. #x2A28)	; �����
    (=jis-x0212		. #x2A60)	; �����
    (=jef-china3	. #x88EB)	; �����
    (=ucs@jis		. #x0164)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with caron")
      (=jis-x0213-1-2000  . #x2A34)	; �����
      (=jis-x0212	  . #x2B60)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (=ucs		. #x0165)	; ť
    (latin-iso8859-2	. #xBB)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter t with caron")
    (=>ucs		. #x0165)	; ť
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0165)
    (->uppercase
     ((name . "fullwidth latin capital letter t with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (=jis-x0213-1-2000	. #x2A34)	; �����
    (=jis-x0212		. #x2B60)	; �����
    (=jef-china3	. #x88FA)	; �����
    (=ucs@jis		. #x0165)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with stroke")
      (=jis-x0212	  . #x292F)	; �����
      (=ks-x1001	  . #x282E)	; �����
      (=ucs@jis		  . #x0166)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (=ucs		. #x0166)	; Ŧ
    (latin-iso8859-4	. #xAC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter t with stroke")
    (=>ucs		. #x0166)	; Ŧ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0166)
    (->lowercase
     ((name		  . "fullwidth latin small letter t with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (=jis-x0212		. #x292F)	; �����
    (=ks-x1001		. #x282E)	; �����
    (=ucs@jis		. #x0166)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with stroke")
      (=jis-x0212	  . #x294F)	; �����
      (=ks-x1001	  . #x292E)	; �����
      (=ucs@jis		  . #x0167)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (=ucs		. #x0167)	; ŧ
    (latin-iso8859-4	. #xBC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter t with stroke")
    (=>ucs		. #x0167)	; ŧ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0167)
    (->uppercase
     ((name . "fullwidth latin capital letter t with stroke")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (=jis-x0212		. #x294F)	; �����
    (=ks-x1001		. #x292E)	; �����
    (=ucs@jis		. #x0167)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with tilde")
      (=jis-x0212	  . #x2A6C)	; �����
      (=jef-china3	  . #x86EB)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (=ucs		. #x0168)	; Ũ
    (latin-iso8859-4	. #xDD)	; �����
    (latin-viscii	. #x9D)	; �����
    (latin-viscii-upper . #xFB)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with tilde")
    (=>ucs		. #x0168)	; Ũ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0168)
    (->lowercase
     ((name . "fullwidth latin capital letter u with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (=jis-x0212		. #x2A6C)	; �����
    (=jef-china3	. #x86EB)	; �����
    (=ucs@jis		. #x0168)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with tilde")
      (=jis-x0212	  . #x2B6C)	; �����
      (=jef-china3	  . #x86F8)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (=ucs		. #x0169)	; ũ
    (latin-tcvn5712	. #xF2)	; �����
    (latin-iso8859-4	. #xFD)	; �����
    (latin-viscii	. #xFB)	; �����
    (latin-viscii-lower . #xFB)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter u with tilde")
    (=>ucs		. #x0169)	; ũ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0169)
    (->uppercase
     ((name . "fullwidth latin capital letter u with tilde")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (=jis-x0212		. #x2B6C)	; �����
    (=jef-china3	. #x86F8)	; �����
    (=ucs@jis		. #x0169)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with macron")
      (=jis-x0212	  . #x2A69)	; �����
      (=jef-china3	  . #x87B9)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (=ucs		. #x016A)	; Ū
    (latin-iso8859-4	. #xDE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with macron")
    (=>ucs		. #x016A)	; Ū
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016A)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with macron")
      (=jis-x0213-1-2000  . #x297C)	; �����
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=jis-x0213-1-2000	. #x2977)	; �����
    (=jis-x0212		. #x2A69)	; �����
    (=jef-china3	. #x87B9)	; �����
    (=ucs@jis		. #x016A)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with macron")
      (=jis-x0213-1-2000  . #x297C)	; �����
      (=jis-x0212	  . #x2B69)	; �����
      (=gb2312		  . #x2831)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=ucs		. #x016B)	; ū
    (latin-iso8859-4	. #xFE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter u with macron")
    (=>ucs		. #x016B)	; ū
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016B)
    (->uppercase
     ((name . "fullwidth latin capital letter u with macron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (=jis-x0213-1-2000	. #x297C)	; �����
    (=jis-x0212		. #x2B69)	; �����
    (=gb2312		. #x2831)	; �����
    (=jef-china3	. #x87CD)	; �����
    (=ucs@jis		. #x016B)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with breve")
      (=jis-x0213-1-2000  . #x2A5E)	; �����
      (=jis-x0212	  . #x2A66)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (=ucs		. #x016C)	; Ŭ
    (latin-iso8859-3	. #xDD)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with breve")
    (=>ucs		. #x016C)	; Ŭ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016C)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (=jis-x0213-1-2000	. #x2A5E)	; �����
    (=jis-x0212		. #x2A66)	; �����
    (=jef-china3	. #x87E5)	; �����
    (=ucs@jis		. #x016C)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with breve")
      (=jis-x0213-1-2000  . #x2A64)	; �����
      (=jis-x0212	  . #x2B66)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (=ucs		. #x016D)	; ŭ
    (latin-iso8859-3	. #xFD)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter u with breve")
    (=>ucs		. #x016D)	; ŭ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016D)
    (->uppercase
     ((name . "fullwidth latin capital letter u with breve")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (=jis-x0213-1-2000	. #x2A64)	; �����
    (=jis-x0212		. #x2B66)	; �����
    (=jef-china3	. #x87EF)	; �����
    (=ucs@jis		. #x016D)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ring above")
      (=jis-x0213-1-2000  . #x2A45)	; �����
      (=jis-x0212	  . #x2A6B)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (=ucs		. #x016E)	; Ů
    (latin-iso8859-2	. #xD9)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter u with ring above")
    (=>ucs		. #x016E)	; Ů
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016E)
    (->lowercase
     ((name . "fullwidth latin small letter u with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (=jis-x0213-1-2000	. #x2A45)	; �����
    (=jis-x0212		. #x2A6B)	; �����
    (=jef-china3	. #x89A5)	; �����
    (=ucs@jis		. #x016E)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->fullwidth
     ((name . "fullwidth latin small letter u with ring above")
      (=jis-x0213-1-2000  . #x2A55)	; �����
      (=jis-x0212	  . #x2B6B)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (=ucs		. #x016F)	; ů
    (latin-iso8859-2	. #xF9)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter u with ring above")
    (=>ucs		. #x016F)	; ů
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x016F)
    (->uppercase
     ((name . "fullwidth latin capital letter u with ring above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (=jis-x0213-1-2000	. #x2A55)	; �����
    (=jis-x0212		. #x2B6B)	; �����
    (=jef-china3	. #x89AD)	; �����
    (=ucs@jis		. #x016F)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with double acute")
      (=jis-x0213-1-2000  . #x2A46)	; �����
      (=jis-x0212	  . #x2A68)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (=ucs		. #x0170)	; Ű
    (latin-iso8859-2	. #xDB)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter u with double acute")
    (=>ucs		. #x0170)	; Ű
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0170)
    (->lowercase
     ((name . "fullwidth latin small letter u with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (=jis-x0213-1-2000	. #x2A46)	; �����
    (=jis-x0212		. #x2A68)	; �����
    (=jef-china3	. #x89E3)	; �����
    (=ucs@jis		. #x0170)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter u with double acute")
      (=jis-x0213-1-2000  . #x2A56)	; �����
      (=jis-x0212	  . #x2B68)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (=ucs		. #x0171)	; ű
    (latin-iso8859-2	. #xFB)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter u with double acute")
    (=>ucs		. #x0171)	; ű
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0171)
    (->uppercase
     ((name . "fullwidth latin capital letter u with double acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (=jis-x0213-1-2000	. #x2A56)	; �����
    (=jis-x0212		. #x2B68)	; �����
    (=jef-china3	. #x89E6)	; �����
    (=ucs@jis		. #x0171)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ogonek")
      (=jis-x0212	  . #x2A6A)	; �����
      (=jef-china3	  . #x8AAA)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (=ucs		. #x0172)	; Ų
    (latin-iso8859-4	. #xD9)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter u with ogonek")
    (=>ucs		. #x0172)	; Ų
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0172)
    (->lowercase
     ((name		  . "fullwidth latin small letter u with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (=jis-x0212		. #x2A6A)	; �����
    (=jef-china3	. #x8AAA)	; �����
    (=ucs@jis		. #x0172)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with ogonek")
      (=jis-x0212	  . #x2B6A)	; �����
      (=jef-china3	  . #x8AB2)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (=ucs		. #x0173)	; ų
    (latin-iso8859-4	. #xF9)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter u with ogonek")
    (=>ucs		. #x0173)	; ų
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0173)
    (->uppercase
     ((name . "fullwidth latin capital letter u with ogonek")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (=jis-x0212		. #x2B6A)	; �����
    (=jef-china3	. #x8AB2)	; �����
    (=ucs@jis		. #x0173)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter w with circumflex")
      (=jis-x0212	  . #x2A71)	; �����
      (=jef-china3	  . #x86C2)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (=ucs		. #x0174)	; Ŵ
    ))
(define-char
  '((name . "fullwidth latin capital letter w with circumflex")
    (=>ucs		. #x0174)	; Ŵ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0174)
    (->lowercase
     ((name . "fullwidth latin small letter w with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (=jis-x0212		. #x2A71)	; �����
    (=jef-china3	. #x86C2)	; �����
    (=ucs@jis		. #x0174)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter w with circumflex")
      (=jis-x0212	  . #x2B71)	; �����
      (=jef-china3	  . #x86CF)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (=ucs		. #x0175)	; ŵ
    ))
(define-char
  '((name . "fullwidth latin small letter w with circumflex")
    (=>ucs		. #x0175)	; ŵ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0175)
    (->uppercase
     ((name . "fullwidth latin capital letter w with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (=jis-x0212		. #x2B71)	; �����
    (=jef-china3	. #x86CF)	; �����
    (=ucs@jis		. #x0175)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with circumflex")
      (=jis-x0212	  . #x2A74)	; �����
      (=jef-china3	  . #x86C3)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (=ucs		. #x0176)	; Ŷ
    ))
(define-char
  '((name . "fullwidth latin capital letter y with circumflex")
    (=>ucs		. #x0176)	; Ŷ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0176)
    (->lowercase
     ((name . "fullwidth latin small letter y with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (=jis-x0212		. #x2A74)	; �����
    (=jef-china3	. #x86C3)	; �����
    (=ucs@jis		. #x0176)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter y with circumflex")
      (=jis-x0212	  . #x2B74)	; �����
      (=jef-china3	  . #x86D0)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (=ucs		. #x0177)	; ŷ
    ))
(define-char
  '((name . "fullwidth latin small letter y with circumflex")
    (=>ucs		. #x0177)	; ŷ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0177)
    (->uppercase
     ((name . "fullwidth latin capital letter y with circumflex")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (=jis-x0212		. #x2B74)	; �����
    (=jef-china3	. #x86D0)	; �����
    (=ucs@jis		. #x0177)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with diaeresis")
      (=jis-x0212	  . #x2A73)	; �����
      (=ucs@jis		  . #x0178)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x00FF)	; ÿ
      ))
    (=ucs		. #x0178)	; Ÿ
    ))
(define-char
  '((name . "fullwidth latin capital letter y with diaeresis")
    (=>ucs		. #x0178)	; Ÿ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0178)
    (->lowercase
     ((name . "fullwidth latin small letter y with diaeresis")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Ÿ
      ))
    (=jis-x0212		. #x2A73)	; �����
    (=ucs@jis		. #x0178)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with acute")
      (=jis-x0213-1-2000  . #x2A29)	; �����
      (=jis-x0212	  . #x2A75)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (=ucs		. #x0179)	; Ź
    (latin-iso8859-2	. #xAC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with acute")
    (=>ucs		. #x0179)	; Ź
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0179)
    (->lowercase
     ((name		  . "fullwidth latin small letter z with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (=jis-x0213-1-2000	. #x2A29)	; �����
    (=jis-x0212		. #x2A75)	; �����
    (=jef-china3	. #x85EA)	; �����
    (=ucs@jis		. #x0179)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with acute")
      (=jis-x0213-1-2000  . #x2A35)	; �����
      (=jis-x0212	  . #x2B75)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (=ucs		. #x017A)	; ź
    (latin-iso8859-2	. #xBC)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter z with acute")
    (=>ucs		. #x017A)	; ź
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017A)
    (->uppercase
     ((name . "fullwidth latin capital letter z with acute")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (=jis-x0213-1-2000	. #x2A35)	; �����
    (=jis-x0212		. #x2B75)	; �����
    (=jef-china3	. #x86A2)	; �����
    (=ucs@jis		. #x017A)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with dot above")
      (=jis-x0213-1-2000  . #x2A2B)	; �����
      (=jis-x0212	  . #x2A77)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (=ucs		. #x017B)	; Ż
    (latin-iso8859-3	. #xAF)	; �����
    (latin-iso8859-2	. #xAF)	; �����
    ))
(define-char
  '((name . "fullwidth latin capital letter z with dot above")
    (=>ucs		. #x017B)	; Ż
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017B)
    (->lowercase
     ((name . "fullwidth latin small letter z with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (=jis-x0213-1-2000	. #x2A2B)	; �����
    (=jis-x0212		. #x2A77)	; �����
    (=jef-china3	. #x88AF)	; �����
    (=ucs@jis		. #x017B)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter z with dot above")
      (=jis-x0213-1-2000  . #x2A38)	; �����
      (=jis-x0212	  . #x2B77)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (=ucs		. #x017C)	; ż
    (latin-iso8859-3	. #xBF)	; �����
    (latin-iso8859-2	. #xBF)	; �����
    ))
(define-char
  '((name . "fullwidth latin small letter z with dot above")
    (=>ucs		. #x017C)	; ż
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017C)
    (->uppercase
     ((name . "fullwidth latin capital letter z with dot above")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (=jis-x0213-1-2000	. #x2A38)	; �����
    (=jis-x0212		. #x2B77)	; �����
    (=jef-china3	. #x88C4)	; �����
    (=ucs@jis		. #x017C)	; �����
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with caron")
      (=jis-x0213-1-2000  . #x2A2A)	; �����
      (=jis-x0212	  . #x2A76)	; �����
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (=ucs		. #x017D)	; Ž
    (latin-iso8859-4	. #xAE)	; �����
    (latin-iso8859-2	. #xAE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin capital letter z with caron")
    (=>ucs		. #x017D)	; Ž
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017D)
    (->lowercase
     ((name		  . "fullwidth latin small letter z with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (=jis-x0213-1-2000	. #x2A2A)	; �����
    (=jis-x0212		. #x2A76)	; �����
    (=jef-china3	. #x88ED)	; �����
    (=ucs@jis		. #x017D)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with caron")
      (=jis-x0213-1-2000  . #x2A37)	; �����
      (=jis-x0212	  . #x2B76)	; �����
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (=ucs		. #x017E)	; ž
    (latin-iso8859-4	. #xBE)	; �����
    (latin-iso8859-2	. #xBE)	; �����
    ))
(define-char
  '((name		. "fullwidth latin small letter z with caron")
    (=>ucs		. #x017E)	; ž
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x017E)
    (->uppercase
     ((name . "fullwidth latin capital letter z with caron")
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (=jis-x0213-1-2000	. #x2A37)	; �����
    (=jis-x0212		. #x2B76)	; �����
    (=jef-china3	. #x88FC)	; �����
    (=ucs@jis		. #x017E)	; �����
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
    (=ucs		. #x017F)	; ſ
    ))
