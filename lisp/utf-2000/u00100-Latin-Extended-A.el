;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (=ucs		. #x0100)	; Ā
    (latin-iso8859-4	. #xC0)	; &I-LATIN4-40;
    ))
(define-char
  '((->decomposition	#xFF21 #x0304)
    (->lowercase
     ((=gb2312		  . #x2821)	; &JX1-297A; [08-01]
      (=jis-x0212	  . #x2B27)	; &I-JSP-2B27; [11-07]
      (=jis-x0213-1-2000  . #x297A)	; &I-JX1-297A; [09-90]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (=jis-x0212		. #x2A27)	; &JX1-2975; [10-07]
    (=jis-x0213-1-2000	. #x2975)	; &I-JX1-2975; [09-85]
    (=jef-china3	. #x87A8)	; &I-JC3-87A8;
    (=ucs@jis/fw	. #x0100)	; &JX1-2975;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (=ucs		. #x0101)	; ā
    (latin-iso8859-4	. #xE0)	; &I-LATIN4-60;
    ))
(define-char
  '((->decomposition	#xFF41 #x0304)
    (->uppercase
     ((=jis-x0212	  . #x2A27)	; &JX1-2975; [10-07]
      (=jis-x0213-1-2000  . #x2975)	; &I-JX1-2975; [09-85]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (=gb2312		. #x2821)	; &JX1-297A; [08-01]
    (=jis-x0212		. #x2B27)	; &I-JSP-2B27; [11-07]
    (=jis-x0213-1-2000	. #x297A)	; &I-JX1-297A; [09-90]
    (=jef-china3	. #x87BC)	; &I-JC3-87BC;
    (=ucs@gb/fw		. #x0101)	; &JX1-297A;
    (=ucs@jis/fw	. #x0101)	; &JX1-297A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (=ucs		. #x0102)	; Ă
    (latin-iso8859-2	. #xC3)	; &I-LATIN2-43;
    (latin-tcvn5712	. #xA1)	; &I-VSCII2-21;
    (latin-viscii	. #xC5)	; &I-MULE-VIET-U-65;
    (latin-viscii-upper . #xE5)	; &I-MULE-VIET-U-65;
    ))
(define-char
  '((->decomposition	#xFF21 #x0306)
    (->lowercase
     ((=jis-x0212	  . #x2B25)	; &JX1-2A49; [11-05]
      (=jis-x0213-1-2000  . #x2A49)	; &I-JX1-2A49; [10-41]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (=jis-x0212		. #x2A25)	; &JX1-2A3A; [10-05]
    (=jis-x0213-1-2000	. #x2A3A)	; &I-JX1-2A3A; [10-26]
    (=jef-china3	. #x87DE)	; &I-JC3-87DE;
    (=ucs@jis/fw	. #x0102)	; &JX1-2A3A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (=ucs		. #x0103)	; ă
    (latin-iso8859-2	. #xE3)	; &I-LATIN2-63;
    (latin-tcvn5712	. #xA8)	; &I-VSCII2-28;
    (latin-viscii	. #xE5)	; &I-MULE-VIET-L-65;
    (latin-viscii-lower . #xE5)	; &I-MULE-VIET-L-65;
    ))
(define-char
  '((->decomposition	#xFF41 #x0306)
    (->uppercase
     ((=jis-x0212	  . #x2A25)	; &JX1-2A3A; [10-05]
      (=jis-x0213-1-2000  . #x2A3A)	; &I-JX1-2A3A; [10-26]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (=jis-x0212		. #x2B25)	; &JX1-2A49; [11-05]
    (=jis-x0213-1-2000	. #x2A49)	; &I-JX1-2A49; [10-41]
    (=jef-china3	. #x87E8)	; &I-JC3-87E8;
    (=ucs@jis/fw	. #x0103)	; &JX1-2A49;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (=ucs		. #x0104)	; Ą
    (latin-iso8859-2	. #xA1)	; &I-LATIN2-21;
    (latin-iso8859-4	. #xA1)	; &I-LATIN4-21;
    ))
(define-char
  '((->decomposition	#xFF21 #x0328)
    (->lowercase
     ((=jis-x0212	  . #x2B28)	; &JX1-2A2C; [11-08]
      (=jis-x0213-1-2000  . #x2A2C)	; &I-JX1-2A2C; [10-12]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (=jis-x0212		. #x2A28)	; &JX1-2A21; [10-08]
    (=jis-x0213-1-2000	. #x2A21)	; &I-JX1-2A21; [10-01]
    (=jef-china3	. #x8AA3)	; &I-JC3-8AA3;
    (=ucs@jis/fw	. #x0104)	; &JX1-2A21;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (=ucs		. #x0105)	; ą
    (latin-iso8859-2	. #xB1)	; &I-LATIN2-31;
    (latin-iso8859-4	. #xB1)	; &I-LATIN4-31;
    ))
(define-char
  '((->decomposition	#xFF41 #x0328)
    (->uppercase
     ((=jis-x0212	  . #x2A28)	; &JX1-2A21; [10-08]
      (=jis-x0213-1-2000  . #x2A21)	; &I-JX1-2A21; [10-01]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (=jis-x0212		. #x2B28)	; &JX1-2A2C; [11-08]
    (=jis-x0213-1-2000	. #x2A2C)	; &I-JX1-2A2C; [10-12]
    (=jef-china3	. #x8AAB)	; &I-JC3-8AAB;
    (=ucs@jis/fw	. #x0105)	; &JX1-2A2C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (=ucs		. #x0106)	; Ć
    (latin-iso8859-2	. #xC6)	; &I-LATIN2-46;
    ))
(define-char
  '((->decomposition	#xFF23 #x0301)
    (->lowercase
     ((=jis-x0212	  . #x2B2B)	; &JX1-2A4B; [11-11]
      (=jis-x0213-1-2000  . #x2A4B)	; &I-JX1-2A4B; [10-43]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (=jis-x0212		. #x2A2B)	; &JX1-2A3C; [10-11]
    (=jis-x0213-1-2000	. #x2A3C)	; &I-JX1-2A3C; [10-28]
    (=jef-china3	. #x85D6)	; &I-JC3-85D6;
    (=ucs@jis/fw	. #x0106)	; &JX1-2A3C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (=ucs		. #x0107)	; ć
    (latin-iso8859-2	. #xE6)	; &I-LATIN2-66;
    ))
(define-char
  '((->decomposition	#xFF43 #x0301)
    (->uppercase
     ((=jis-x0212	  . #x2A2B)	; &JX1-2A3C; [10-11]
      (=jis-x0213-1-2000  . #x2A3C)	; &I-JX1-2A3C; [10-28]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (=jis-x0212		. #x2B2B)	; &JX1-2A4B; [11-11]
    (=jis-x0213-1-2000	. #x2A4B)	; &I-JX1-2A4B; [10-43]
    (=jef-china3	. #x85EC)	; &I-JC3-85EC;
    (=ucs@jis/fw	. #x0107)	; &JX1-2A4B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (=ucs		. #x0108)	; Ĉ
    (latin-iso8859-3	. #xC6)	; &I-LATIN3-46;
    ))
(define-char
  '((->decomposition	#xFF23 #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B2C)	; &JX1-2A5F; [11-12]
      (=jis-x0213-1-2000  . #x2A5F)	; &I-JX1-2A5F; [10-63]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (=jis-x0212		. #x2A2C)	; &JX1-2A59; [10-12]
    (=jis-x0213-1-2000	. #x2A59)	; &I-JX1-2A59; [10-57]
    (=jef-china3	. #x86B8)	; &I-JC3-86B8;
    (=ucs@jis/fw	. #x0108)	; &JX1-2A59;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (=ucs		. #x0109)	; ĉ
    (latin-iso8859-3	. #xE6)	; &I-LATIN3-66;
    ))
(define-char
  '((->decomposition	#xFF43 #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A2C)	; &JX1-2A59; [10-12]
      (=jis-x0213-1-2000  . #x2A59)	; &I-JX1-2A59; [10-57]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (=jis-x0212		. #x2B2C)	; &JX1-2A5F; [11-12]
    (=jis-x0213-1-2000	. #x2A5F)	; &I-JX1-2A5F; [10-63]
    (=jef-china3	. #x86C5)	; &I-JC3-86C5;
    (=ucs@jis/fw	. #x0109)	; &JX1-2A5F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (=ucs		. #x010A)	; Ċ
    (latin-iso8859-3	. #xC5)	; &I-LATIN3-45;
    ))
(define-char
  '((->decomposition	#xFF23 #x0307)
    (->lowercase
     ((=jis-x0212	  . #x2B2F)	; &JSP-2B2F; [11-15]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (=jis-x0212		. #x2A2F)	; &JSP-2A2F; [10-15]
    (=jef-china3	. #x87FA)	; &I-JC3-87FA;
    (=ucs@jis/fw	. #x010A)	; &JSP-2A2F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (=ucs		. #x010B)	; ċ
    (latin-iso8859-3	. #xE5)	; &I-LATIN3-65;
    ))
(define-char
  '((->decomposition	#xFF43 #x0307)
    (->uppercase
     ((=jis-x0212	  . #x2A2F)	; &JSP-2A2F; [10-15]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (=jis-x0212		. #x2B2F)	; &JSP-2B2F; [11-15]
    (=jef-china3	. #x88B2)	; &I-JC3-88B2;
    (=ucs@jis/fw	. #x010B)	; &JSP-2B2F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (=ucs		. #x010C)	; Č
    (latin-iso8859-2	. #xC8)	; &I-LATIN2-48;
    (latin-iso8859-4	. #xC8)	; &I-LATIN4-48;
    ))
(define-char
  '((->decomposition	#xFF23 #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B2D)	; &JX1-2A4C; [11-13]
      (=jis-x0213-1-2000  . #x2A4C)	; &I-JX1-2A4C; [10-44]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (=jis-x0212		. #x2A2D)	; &JX1-2A3D; [10-13]
    (=jis-x0213-1-2000	. #x2A3D)	; &I-JX1-2A3D; [10-29]
    (=jef-china3	. #x88E0)	; &I-JC3-88E0;
    (=ucs@jis/fw	. #x010C)	; &JX1-2A3D;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (=ucs		. #x010D)	; č
    (latin-iso8859-2	. #xE8)	; &I-LATIN2-68;
    (latin-iso8859-4	. #xE8)	; &I-LATIN4-68;
    ))
(define-char
  '((->decomposition	#xFF43 #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A2D)	; &JX1-2A3D; [10-13]
      (=jis-x0213-1-2000  . #x2A3D)	; &I-JX1-2A3D; [10-29]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (=jis-x0212		. #x2B2D)	; &JX1-2A4C; [11-13]
    (=jis-x0213-1-2000	. #x2A4C)	; &I-JX1-2A4C; [10-44]
    (=jef-china3	. #x88EF)	; &I-JC3-88EF;
    (=ucs@jis/fw	. #x010D)	; &JX1-2A4C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (=ucs		. #x010E)	; Ď
    (latin-iso8859-2	. #xCF)	; &I-LATIN2-4F;
    ))
(define-char
  '((->decomposition	#xFF24 #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B30)	; &JX1-2A4F; [11-16]
      (=jis-x0213-1-2000  . #x2A4F)	; &I-JX1-2A4F; [10-47]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (=jis-x0212		. #x2A30)	; &JX1-2A40; [10-16]
    (=jis-x0213-1-2000	. #x2A40)	; &I-JX1-2A40; [10-32]
    (=jef-china3	. #x88E1)	; &I-JC3-88E1;
    (=ucs@jis/fw	. #x010E)	; &JX1-2A40;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (=ucs		. #x010F)	; ď
    (latin-iso8859-2	. #xEF)	; &I-LATIN2-6F;
    ))
(define-char
  '((->decomposition	#xFF44 #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A30)	; &JX1-2A40; [10-16]
      (=jis-x0213-1-2000  . #x2A40)	; &I-JX1-2A40; [10-32]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (=jis-x0212		. #x2B30)	; &JX1-2A4F; [11-16]
    (=jis-x0213-1-2000	. #x2A4F)	; &I-JX1-2A4F; [10-47]
    (=jef-china3	. #x88F0)	; &I-JC3-88F0;
    (=ucs@jis/fw	. #x010F)	; &JX1-2A4F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (=ucs		. #x0110)	; Đ
    (latin-iso8859-2	. #xD0)	; &I-LATIN2-50;
    (latin-iso8859-4	. #xD0)	; &I-LATIN4-50;
    (latin-tcvn5712	. #xA7)	; &I-VSCII2-27;
    (latin-viscii	. #xD0)	; &I-MULE-VIET-U-70;
    (latin-viscii-upper . #xF0)	; &I-MULE-VIET-U-70;
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x2922)	; &JX1-2A50; [09-02]
      (=jis-x0212	  . #x2942)	; &I-JSP-2942; [09-34]
      (=jis-x0213-1-2000  . #x2A50)	; &I-JX1-2A50; [10-48]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    (=jis-x0212		. #x2922)	; &JSP-2922; [09-02]
    (=jef-china3	. #x83A3)	; &I-JC3-83A3;
    (=ucs@jis/fw	. #x0110)	; &JSP-2922;
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
    (latin-iso8859-2	. #xF0)	; &I-LATIN2-70;
    (latin-iso8859-4	. #xF0)	; &I-LATIN4-70;
    (latin-tcvn5712	. #xAE)	; &I-VSCII2-2E;
    (latin-viscii	. #xF0)	; &I-MULE-VIET-L-70;
    (latin-viscii-lower . #xF0)	; &I-MULE-VIET-L-70;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2922)	; &JSP-2922; [09-02]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (=ks-x1001		. #x2922)	; &JX1-2A50; [09-02]
    (=jis-x0212		. #x2942)	; &I-JSP-2942; [09-34]
    (=jis-x0213-1-2000	. #x2A50)	; &I-JX1-2A50; [10-48]
    (=jef-china3	. #x83AE)	; &I-JC3-83AE;
    (=ucs@jis/fw	. #x0111)	; &JX1-2A50;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (=ucs		. #x0112)	; Ē
    (latin-iso8859-4	. #xAA)	; &I-LATIN4-2A;
    ))
(define-char
  '((->decomposition	#xFF25 #x0304)
    (->lowercase
     ((=gb2312		  . #x2825)	; &JX1-297D; [08-05]
      (=jis-x0212	  . #x2B37)	; &I-JSP-2B37; [11-23]
      (=jis-x0213-1-2000  . #x297D)	; &I-JX1-297D; [09-93]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (=jis-x0212		. #x2A37)	; &JX1-2978; [10-23]
    (=jis-x0213-1-2000	. #x2978)	; &I-JX1-2978; [09-88]
    (=jef-china3	. #x87AB)	; &I-JC3-87AB;
    (=ucs@jis/fw	. #x0112)	; &JX1-2978;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (=ucs		. #x0113)	; ē
    (latin-iso8859-4	. #xBA)	; &I-LATIN4-3A;
    ))
(define-char
  '((->decomposition	#xFF45 #x0304)
    (->uppercase
     ((=jis-x0212	  . #x2A37)	; &JX1-2978; [10-23]
      (=jis-x0213-1-2000  . #x2978)	; &I-JX1-2978; [09-88]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (=gb2312		. #x2825)	; &JX1-297D; [08-05]
    (=jis-x0212		. #x2B37)	; &I-JSP-2B37; [11-23]
    (=jis-x0213-1-2000	. #x297D)	; &I-JX1-297D; [09-93]
    (=jef-china3	. #x87BF)	; &I-JC3-87BF;
    (=ucs@gb/fw		. #x0113)	; &JX1-297D;
    (=ucs@jis/fw	. #x0113)	; &JX1-297D;
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
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (=ucs		. #x0116)	; Ė
    (latin-iso8859-4	. #xCC)	; &I-LATIN4-4C;
    ))
(define-char
  '((->decomposition	#xFF25 #x0307)
    (->lowercase
     ((=jis-x0212	  . #x2B36)	; &JSP-2B36; [11-22]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (=jis-x0212		. #x2A36)	; &JSP-2A36; [10-22]
    (=jef-china3	. #x87FC)	; &I-JC3-87FC;
    (=ucs@jis/fw	. #x0116)	; &JSP-2A36;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (=ucs		. #x0117)	; ė
    (latin-iso8859-4	. #xEC)	; &I-LATIN4-6C;
    ))
(define-char
  '((->decomposition	#xFF45 #x0307)
    (->uppercase
     ((=jis-x0212	  . #x2A36)	; &JSP-2A36; [10-22]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (=jis-x0212		. #x2B36)	; &JSP-2B36; [11-22]
    (=jef-china3	. #x88B4)	; &I-JC3-88B4;
    (=ucs@jis/fw	. #x0117)	; &JSP-2B36;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (=ucs		. #x0118)	; Ę
    (latin-iso8859-2	. #xCA)	; &I-LATIN2-4A;
    (latin-iso8859-4	. #xCA)	; &I-LATIN4-4A;
    ))
(define-char
  '((->decomposition	#xFF25 #x0328)
    (->lowercase
     ((=jis-x0212	  . #x2B38)	; &JX1-2A4D; [11-24]
      (=jis-x0213-1-2000  . #x2A4D)	; &I-JX1-2A4D; [10-45]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (=jis-x0212		. #x2A38)	; &JX1-2A3E; [10-24]
    (=jis-x0213-1-2000	. #x2A3E)	; &I-JX1-2A3E; [10-30]
    (=jef-china3	. #x8AA4)	; &I-JC3-8AA4;
    (=ucs@jis/fw	. #x0118)	; &JX1-2A3E;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (=ucs		. #x0119)	; ę
    (latin-iso8859-2	. #xEA)	; &I-LATIN2-6A;
    (latin-iso8859-4	. #xEA)	; &I-LATIN4-6A;
    ))
(define-char
  '((->decomposition	#xFF45 #x0328)
    (->uppercase
     ((=jis-x0212	  . #x2A38)	; &JX1-2A3E; [10-24]
      (=jis-x0213-1-2000  . #x2A3E)	; &I-JX1-2A3E; [10-30]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (=jis-x0212		. #x2B38)	; &JX1-2A4D; [11-24]
    (=jis-x0213-1-2000	. #x2A4D)	; &I-JX1-2A4D; [10-45]
    (=jef-china3	. #x8AAC)	; &I-JC3-8AAC;
    (=ucs@jis/fw	. #x0119)	; &JX1-2A4D;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (=ucs		. #x011A)	; Ě
    (latin-iso8859-2	. #xCC)	; &I-LATIN2-4C;
    ))
(define-char
  '((->decomposition	#xFF25 #x030C)
    (->lowercase
     ((=gb2312		  . #x2827)	; &JX1-2A4E; [08-07]
      (=jis-x0212	  . #x2B35)	; &I-JSP-2B35; [11-21]
      (=jis-x0213-1-2000  . #x2A4E)	; &I-JX1-2A4E; [10-46]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (=jis-x0212		. #x2A35)	; &JX1-2A3F; [10-21]
    (=jis-x0213-1-2000	. #x2A3F)	; &I-JX1-2A3F; [10-31]
    (=jef-china3	. #x88E2)	; &I-JC3-88E2;
    (=ucs@jis/fw	. #x011A)	; &JX1-2A3F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (=ucs		. #x011B)	; ě
    (latin-iso8859-2	. #xEC)	; &I-LATIN2-6C;
    ))
(define-char
  '((->decomposition	#xFF45 #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A35)	; &JX1-2A3F; [10-21]
      (=jis-x0213-1-2000  . #x2A3F)	; &I-JX1-2A3F; [10-31]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (=gb2312		. #x2827)	; &JX1-2A4E; [08-07]
    (=jis-x0212		. #x2B35)	; &I-JSP-2B35; [11-21]
    (=jis-x0213-1-2000	. #x2A4E)	; &I-JX1-2A4E; [10-46]
    (=jef-china3	. #x88F1)	; &I-JC3-88F1;
    (=ucs@gb/fw		. #x011B)	; &JX1-2A4E;
    (=ucs@jis/fw	. #x011B)	; &JX1-2A4E;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (=ucs		. #x011C)	; Ĝ
    (latin-iso8859-3	. #xD8)	; &I-LATIN3-58;
    ))
(define-char
  '((->decomposition	#xFF27 #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B3A)	; &JX1-2A60; [11-26]
      (=jis-x0213-1-2000  . #x2A60)	; &I-JX1-2A60; [10-64]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (=jis-x0212		. #x2A3A)	; &JX1-2A5A; [10-26]
    (=jis-x0213-1-2000	. #x2A5A)	; &I-JX1-2A5A; [10-58]
    (=jef-china3	. #x86BA)	; &I-JC3-86BA;
    (=ucs@jis/fw	. #x011C)	; &JX1-2A5A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (=ucs		. #x011D)	; ĝ
    (latin-iso8859-3	. #xF8)	; &I-LATIN3-78;
    ))
(define-char
  '((->decomposition	#xFF47 #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A3A)	; &JX1-2A5A; [10-26]
      (=jis-x0213-1-2000  . #x2A5A)	; &I-JX1-2A5A; [10-58]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (=jis-x0212		. #x2B3A)	; &JX1-2A60; [11-26]
    (=jis-x0213-1-2000	. #x2A60)	; &I-JX1-2A60; [10-64]
    (=jef-china3	. #x86C7)	; &I-JC3-86C7;
    (=ucs@jis/fw	. #x011D)	; &JX1-2A60;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (=ucs		. #x011E)	; Ğ
    (latin-iso8859-3	. #xAB)	; &I-LATIN3-2B;
    (latin-iso8859-9	. #xD0)	; &I-LATIN5-50;
    ))
(define-char
  '((->decomposition	#xFF27 #x0306)
    (->lowercase
     ((=jis-x0212	  . #x2B3B)	; &JSP-2B3B; [11-27]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (=jis-x0212		. #x2A3B)	; &JSP-2A3B; [10-27]
    (=jef-china3	. #x87E1)	; &I-JC3-87E1;
    (=ucs@jis/fw	. #x011E)	; &JSP-2A3B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (=ucs		. #x011F)	; ğ
    (latin-iso8859-3	. #xBB)	; &I-LATIN3-3B;
    (latin-iso8859-9	. #xF0)	; &I-LATIN5-70;
    ))
(define-char
  '((->decomposition	#xFF47 #x0306)
    (->uppercase
     ((=jis-x0212	  . #x2A3B)	; &JSP-2A3B; [10-27]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (=jis-x0212		. #x2B3B)	; &JSP-2B3B; [11-27]
    (=jef-china3	. #x87EB)	; &I-JC3-87EB;
    (=ucs@jis/fw	. #x011F)	; &JSP-2B3B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (=ucs		. #x0120)	; Ġ
    (latin-iso8859-3	. #xD5)	; &I-LATIN3-55;
    ))
(define-char
  '((->decomposition	#xFF27 #x0307)
    (->lowercase
     ((=jis-x0212	  . #x2B3D)	; &JSP-2B3D; [11-29]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (=jis-x0212		. #x2A3D)	; &JSP-2A3D; [10-29]
    (=jef-china3	. #x87FE)	; &I-JC3-87FE;
    (=ucs@jis/fw	. #x0120)	; &JSP-2A3D;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (=ucs		. #x0121)	; ġ
    (latin-iso8859-3	. #xF5)	; &I-LATIN3-75;
    ))
(define-char
  '((->decomposition	#xFF47 #x0307)
    (->uppercase
     ((=jis-x0212	  . #x2A3D)	; &JSP-2A3D; [10-29]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (=jis-x0212		. #x2B3D)	; &JSP-2B3D; [11-29]
    (=jef-china3	. #x88B6)	; &I-JC3-88B6;
    (=ucs@jis/fw	. #x0121)	; &JSP-2B3D;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CEDILLA")
      (=ucs		  . #x0123)	; ģ
      ))
    (=ucs		. #x0122)	; Ģ
    (latin-iso8859-4	. #xAB)	; &I-LATIN4-2B;
    ))
(define-char
  '((->decomposition	#xFF27 #x0327)
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    (=jis-x0212		. #x2A3C)	; &JSP-2A3C; [10-28]
    (=ucs@jis/fw	. #x0122)	; &JSP-2A3C;
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
    (latin-iso8859-4	. #xBB)	; &I-LATIN4-3B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0048 #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (=ucs		. #x0124)	; Ĥ
    (latin-iso8859-3	. #xA6)	; &I-LATIN3-26;
    ))
(define-char
  '((->decomposition	#xFF28 #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B3E)	; &JX1-2A61; [11-30]
      (=jis-x0213-1-2000  . #x2A61)	; &I-JX1-2A61; [10-65]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (=jis-x0212		. #x2A3E)	; &JX1-2A5B; [10-30]
    (=jis-x0213-1-2000	. #x2A5B)	; &I-JX1-2A5B; [10-59]
    (=jef-china3	. #x86BB)	; &I-JC3-86BB;
    (=ucs@jis/fw	. #x0124)	; &JX1-2A5B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (=ucs		. #x0125)	; ĥ
    (latin-iso8859-3	. #xB6)	; &I-LATIN3-36;
    ))
(define-char
  '((->decomposition	#xFF48 #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A3E)	; &JX1-2A5B; [10-30]
      (=jis-x0213-1-2000  . #x2A5B)	; &I-JX1-2A5B; [10-59]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (=jis-x0212		. #x2B3E)	; &JX1-2A61; [11-30]
    (=jis-x0213-1-2000	. #x2A61)	; &I-JX1-2A61; [10-65]
    (=jef-china3	. #x86C8)	; &I-JC3-86C8;
    (=ucs@jis/fw	. #x0125)	; &JX1-2A61;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=ucs		. #x0126)	; Ħ
    (latin-iso8859-3	. #xA1)	; &I-LATIN3-21;
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x2924)	; &JX1-2A7D; [09-04]
      (=jis-x0212	  . #x2944)	; &I-JSP-2944; [09-36]
      (=jis-x0213-1-2000  . #x2A7D)	; &I-JX1-2A7D; [10-93]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (=ks-x1001		. #x2824)	; &JSP-2924; [08-04]
    (=jis-x0212		. #x2924)	; &I-JSP-2924; [09-04]
    (=ucs@jis/fw	. #x0126)	; &JSP-2924;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (=ucs		. #x0127)	; ħ
    (latin-iso8859-3	. #xB1)	; &I-LATIN3-31;
    ))
(define-char
  '((->uppercase
     ((=ks-x1001	  . #x2824)	; &JSP-2924; [08-04]
      (=jis-x0212	  . #x2924)	; &I-JSP-2924; [09-04]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=ks-x1001		. #x2924)	; &JX1-2A7D; [09-04]
    (=jis-x0212		. #x2944)	; &I-JSP-2944; [09-36]
    (=jis-x0213-1-2000	. #x2A7D)	; &I-JX1-2A7D; [10-93]
    (=ucs@jis/fw	. #x0127)	; &JX1-2A7D;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (=ucs		. #x0128)	; Ĩ
    (latin-iso8859-4	. #xA5)	; &I-LATIN4-25;
    (latin-viscii	. #xCE)	; &I-MULE-VIET-U-6E;
    (latin-viscii-upper . #xEE)	; &I-MULE-VIET-U-6E;
    ))
(define-char
  '((->decomposition	#xFF29 #x0303)
    (->lowercase
     ((=jis-x0212	  . #x2B47)	; &JSP-2B47; [11-39]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (=jis-x0212		. #x2A47)	; &JSP-2A47; [10-39]
    (=jef-china3	. #x86E5)	; &I-JC3-86E5;
    (=ucs@jis/fw	. #x0128)	; &JSP-2A47;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (=ucs		. #x0129)	; ĩ
    (latin-iso8859-4	. #xB5)	; &I-LATIN4-35;
    (latin-tcvn5712	. #xDC)	; &I-VSCII2-5C;
    (latin-viscii	. #xEE)	; &I-MULE-VIET-L-6E;
    (latin-viscii-lower . #xEE)	; &I-MULE-VIET-L-6E;
    ))
(define-char
  '((->decomposition	#xFF49 #x0303)
    (->uppercase
     ((=jis-x0212	  . #x2A47)	; &JSP-2A47; [10-39]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (=jis-x0212		. #x2B47)	; &JSP-2B47; [11-39]
    (=ucs@jis/fw	. #x0129)	; &JSP-2B47;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (=ucs		. #x012A)	; Ī
    (latin-iso8859-4	. #xCF)	; &I-LATIN4-4F;
    ))
(define-char
  '((->decomposition	#xFF29 #x0304)
    (->lowercase
     ((=gb2312		  . #x2829)	; &JX1-297B; [08-09]
      (=jis-x0212	  . #x2B45)	; &I-JSP-2B45; [11-37]
      (=jis-x0213-1-2000  . #x297B)	; &I-JX1-297B; [09-91]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (=jis-x0212		. #x2A45)	; &JX1-2976; [10-37]
    (=jis-x0213-1-2000	. #x2976)	; &I-JX1-2976; [09-86]
    (=jef-china3	. #x87AD)	; &I-JC3-87AD;
    (=ucs@jis/fw	. #x012A)	; &JX1-2976;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (=ucs		. #x012B)	; ī
    (latin-iso8859-4	. #xEF)	; &I-LATIN4-6F;
    ))
(define-char
  '((->decomposition	#xFF49 #x0304)
    (->uppercase
     ((=jis-x0212	  . #x2A45)	; &JX1-2976; [10-37]
      (=jis-x0213-1-2000  . #x2976)	; &I-JX1-2976; [09-86]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (=gb2312		. #x2829)	; &JX1-297B; [08-09]
    (=jis-x0212		. #x2B45)	; &I-JSP-2B45; [11-37]
    (=jis-x0213-1-2000	. #x297B)	; &I-JX1-297B; [09-91]
    (=ucs@gb/fw		. #x012B)	; &JX1-297B;
    (=ucs@jis/fw	. #x012B)	; &JX1-297B;
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
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (=ucs		. #x012E)	; Į
    (latin-iso8859-4	. #xC7)	; &I-LATIN4-47;
    ))
(define-char
  '((->decomposition	#xFF29 #x0328)
    (->lowercase
     ((=jis-x0212	  . #x2B46)	; &JSP-2B46; [11-38]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (=jis-x0212		. #x2A46)	; &JSP-2A46; [10-38]
    (=jef-china3	. #x8AA6)	; &I-JC3-8AA6;
    (=ucs@jis/fw	. #x012E)	; &JSP-2A46;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (=ucs		. #x012F)	; į
    (latin-iso8859-4	. #xE7)	; &I-LATIN4-67;
    ))
(define-char
  '((->decomposition	#xFF49 #x0328)
    (->uppercase
     ((=jis-x0212	  . #x2A46)	; &JSP-2A46; [10-38]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (=jis-x0212		. #x2B46)	; &JSP-2B46; [11-38]
    (=jef-china3	. #x8AAE)	; &I-JC3-8AAE;
    (=ucs@jis/fw	. #x012F)	; &JSP-2B46;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    (=ucs		. #x0130)	; İ
    (latin-iso8859-3	. #xA9)	; &I-LATIN3-29;
    (latin-iso8859-9	. #xDD)	; &I-LATIN5-5D;
    ))
(define-char
  '((->decomposition	#xFF29 #x0307)
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH DOT ABOVE")
      (=ucs		  . #x0130)	; İ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DOT ABOVE")
      (=ucs		  . #x0130)	; İ
      ))
    (=jis-x0212		. #x2A44)	; &JSP-2A44; [10-36]
    (=jef-china3	. #x88A2)	; &I-JC3-88A2;
    (=ucs@jis/fw	. #x0130)	; &JSP-2A44;
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
    (latin-iso8859-3	. #xB9)	; &I-LATIN3-39;
    (latin-iso8859-9	. #xFD)	; &I-LATIN5-7D;
    ))
(define-char
  '((->uppercase
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER DOTLESS I")
      (=ucs		  . #x0131)	; ı
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER DOTLESS I")
      (=ucs		  . #x0131)	; ı
      ))
    (=ks-x1001		. #x2925)	; &JSP-2945; [09-05]
    (=jis-x0212		. #x2945)	; &I-JSP-2945; [09-37]
    (=jef-china3	. #x83B3)	; &I-JC3-83B3;
    (=ucs@jis/fw	. #x0131)	; &JSP-2945;
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
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x2926)	; &JSP-2946; [09-06]
      (=jis-x0212	  . #x2946)	; &I-JSP-2946; [09-38]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (=ks-x1001		. #x2826)	; &JSP-2926; [08-06]
    (=jis-x0212		. #x2926)	; &I-JSP-2926; [09-06]
    (=ucs@jis		. #x0132)	; &JSP-2926;
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (=ucs		. #x0133)	; ĳ
    ))
(define-char
  '((->uppercase
     ((=ks-x1001	  . #x2826)	; &JSP-2926; [08-06]
      (=jis-x0212	  . #x2926)	; &I-JSP-2926; [09-06]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    (=ks-x1001		. #x2926)	; &JSP-2946; [09-06]
    (=jis-x0212		. #x2946)	; &I-JSP-2946; [09-38]
    (=ucs@jis/fw	. #x0133)	; &JSP-2946;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (=ucs		. #x0134)	; Ĵ
    (latin-iso8859-3	. #xAC)	; &I-LATIN3-2C;
    ))
(define-char
  '((->decomposition	#xFF2A #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B48)	; &JX1-2A62; [11-40]
      (=jis-x0213-1-2000  . #x2A62)	; &I-JX1-2A62; [10-66]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (=jis-x0212		. #x2A48)	; &JX1-2A5C; [10-40]
    (=jis-x0213-1-2000	. #x2A5C)	; &I-JX1-2A5C; [10-60]
    (=jef-china3	. #x86BD)	; &I-JC3-86BD;
    (=ucs@jis/fw	. #x0134)	; &JX1-2A5C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (=ucs		. #x0135)	; ĵ
    (latin-iso8859-3	. #xBC)	; &I-LATIN3-3C;
    ))
(define-char
  '((->decomposition	#xFF4A #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A48)	; &JX1-2A5C; [10-40]
      (=jis-x0213-1-2000  . #x2A5C)	; &I-JX1-2A5C; [10-60]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (=jis-x0212		. #x2B48)	; &JX1-2A62; [11-40]
    (=jis-x0213-1-2000	. #x2A62)	; &I-JX1-2A62; [10-66]
    (=jef-china3	. #x86CA)	; &I-JC3-86CA;
    (=ucs@jis/fw	. #x0135)	; &JX1-2A62;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (=ucs		. #x0136)	; Ķ
    (latin-iso8859-4	. #xD3)	; &I-LATIN4-53;
    ))
(define-char
  '((->decomposition	#xFF2B #x0327)
    (->lowercase
     ((=jis-x0212	  . #x2B49)	; &JSP-2B49; [11-41]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (=jis-x0212		. #x2A49)	; &JSP-2A49; [10-41]
    (=ucs@jis/fw	. #x0136)	; &JSP-2A49;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (=ucs		. #x0137)	; ķ
    (latin-iso8859-4	. #xF3)	; &I-LATIN4-73;
    ))
(define-char
  '((->decomposition	#xFF4B #x0327)
    (->uppercase
     ((=jis-x0212	  . #x2A49)	; &JSP-2A49; [10-41]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (=jis-x0212		. #x2B49)	; &JSP-2B49; [11-41]
    (=ucs@jis/fw	. #x0137)	; &JSP-2B49;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (=ucs		. #x0138)	; ĸ
    (latin-iso8859-4	. #xA2)	; &I-LATIN4-22;
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER KRA")
      (=ucs		  . #x0138)	; ĸ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER KRA")
      (=ucs		  . #x0138)	; ĸ
      ))
    (=ks-x1001		. #x2927)	; &JSP-2947; [09-07]
    (=jis-x0212		. #x2947)	; &I-JSP-2947; [09-39]
    (=ucs@jis/fw	. #x0138)	; &JSP-2947;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (=ucs		. #x0139)	; Ĺ
    (latin-iso8859-2	. #xC5)	; &I-LATIN2-45;
    ))
(define-char
  '((->decomposition	#xFF2C #x0301)
    (->lowercase
     ((=jis-x0212	  . #x2B4A)	; &JX1-2A4A; [11-42]
      (=jis-x0213-1-2000  . #x2A4A)	; &I-JX1-2A4A; [10-42]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (=jis-x0212		. #x2A4A)	; &JX1-2A3B; [10-42]
    (=jis-x0213-1-2000	. #x2A3B)	; &I-JX1-2A3B; [10-27]
    (=jef-china3	. #x85DD)	; &I-JC3-85DD;
    (=ucs@jis/fw	. #x0139)	; &JX1-2A3B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (=ucs		. #x013A)	; ĺ
    (latin-iso8859-2	. #xE5)	; &I-LATIN2-65;
    ))
(define-char
  '((->decomposition	#xFF4C #x0301)
    (->uppercase
     ((=jis-x0212	  . #x2A4A)	; &JX1-2A3B; [10-42]
      (=jis-x0213-1-2000  . #x2A3B)	; &I-JX1-2A3B; [10-27]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (=jis-x0212		. #x2B4A)	; &JX1-2A4A; [11-42]
    (=jis-x0213-1-2000	. #x2A4A)	; &I-JX1-2A4A; [10-42]
    (=jef-china3	. #x85F3)	; &I-JC3-85F3;
    (=ucs@jis/fw	. #x013A)	; &JX1-2A4A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (=ucs		. #x013B)	; Ļ
    (latin-iso8859-4	. #xA6)	; &I-LATIN4-26;
    ))
(define-char
  '((->decomposition	#xFF2C #x0327)
    (->lowercase
     ((=jis-x0212	  . #x2B4C)	; &JSP-2B4C; [11-44]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (=jis-x0212		. #x2A4C)	; &JSP-2A4C; [10-44]
    (=jef-china3	. #x89F8)	; &I-JC3-89F8;
    (=ucs@jis/fw	. #x013B)	; &JSP-2A4C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (=ucs		. #x013C)	; ļ
    (latin-iso8859-4	. #xB6)	; &I-LATIN4-36;
    ))
(define-char
  '((->decomposition	#xFF4C #x0327)
    (->uppercase
     ((=jis-x0212	  . #x2A4C)	; &JSP-2A4C; [10-44]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (=jis-x0212		. #x2B4C)	; &JSP-2B4C; [11-44]
    (=jef-china3	. #x89FE)	; &I-JC3-89FE;
    (=ucs@jis/fw	. #x013C)	; &JSP-2B4C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (=ucs		. #x013D)	; Ľ
    (latin-iso8859-2	. #xA5)	; &I-LATIN2-25;
    ))
(define-char
  '((->decomposition	#xFF2C #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B4B)	; &JX1-2A2F; [11-43]
      (=jis-x0213-1-2000  . #x2A2F)	; &I-JX1-2A2F; [10-15]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (=jis-x0212		. #x2A4B)	; &JX1-2A24; [10-43]
    (=jis-x0213-1-2000	. #x2A24)	; &I-JX1-2A24; [10-04]
    (=jef-china3	. #x88E6)	; &I-JC3-88E6;
    (=ucs@jis/fw	. #x013D)	; &JX1-2A24;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (=ucs		. #x013E)	; ľ
    (latin-iso8859-2	. #xB5)	; &I-LATIN2-35;
    ))
(define-char
  '((->decomposition	#xFF4C #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A4B)	; &JX1-2A24; [10-43]
      (=jis-x0213-1-2000  . #x2A24)	; &I-JX1-2A24; [10-04]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (=jis-x0212		. #x2B4B)	; &JX1-2A2F; [11-43]
    (=jis-x0213-1-2000	. #x2A2F)	; &I-JX1-2A2F; [10-15]
    (=jef-china3	. #x88F5)	; &I-JC3-88F5;
    (=ucs@jis/fw	. #x013E)	; &JX1-2A2F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (=ucs		. #x013F)	; Ŀ
    ))
(define-char
  '((->decomposition	compat #xFF2C #x00B7)
    (->lowercase
     ((=ks-x1001	  . #x2928)	; &JSP-2949; [09-08]
      (=jis-x0212	  . #x2949)	; &I-JSP-2949; [09-41]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (=ks-x1001		. #x2828)	; &JSP-2929; [08-08]
    (=jis-x0212		. #x2929)	; &I-JSP-2929; [09-09]
    (=ucs@jis/fw	. #x013F)	; &JSP-2929;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (=ucs		. #x0140)	; ŀ
    ))
(define-char
  '((->decomposition	compat #xFF4C #x00B7)
    (->uppercase
     ((=ks-x1001	  . #x2828)	; &JSP-2929; [08-08]
      (=jis-x0212	  . #x2929)	; &I-JSP-2929; [09-09]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (=ks-x1001		. #x2928)	; &JSP-2949; [09-08]
    (=jis-x0212		. #x2949)	; &I-JSP-2949; [09-41]
    (=ucs@jis/fw	. #x0140)	; &JSP-2949;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (=ucs		. #x0141)	; Ł
    (latin-iso8859-2	. #xA3)	; &I-LATIN2-23;
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x2929)	; &JX1-2A2E; [09-09]
      (=jis-x0212	  . #x2948)	; &I-JSP-2948; [09-40]
      (=jis-x0213-1-2000  . #x2A2E)	; &I-JX1-2A2E; [10-14]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (=ks-x1001		. #x2829)	; &JX1-2A23; [08-09]
    (=jis-x0212		. #x2928)	; &I-JSP-2928; [09-08]
    (=jis-x0213-1-2000	. #x2A23)	; &I-JX1-2A23; [10-03]
    (=jef-china3	. #x83A1)	; &I-JC3-83A1;
    (=ucs@jis/fw	. #x0141)	; &JX1-2A23;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (=ucs		. #x0142)	; ł
    (latin-iso8859-2	. #xB3)	; &I-LATIN2-33;
    ))
(define-char
  '((->uppercase
     ((=ks-x1001	  . #x2829)	; &JX1-2A23; [08-09]
      (=jis-x0212	  . #x2928)	; &I-JSP-2928; [09-08]
      (=jis-x0213-1-2000  . #x2A23)	; &I-JX1-2A23; [10-03]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (=ks-x1001		. #x2929)	; &JX1-2A2E; [09-09]
    (=jis-x0212		. #x2948)	; &I-JSP-2948; [09-40]
    (=jis-x0213-1-2000	. #x2A2E)	; &I-JX1-2A2E; [10-14]
    (=ucs@jis/fw	. #x0142)	; &JX1-2A2E;
    ))
(define-char
  '((<-denotational
     ((=ks-x1001	  . #x2929)	; &JX1-2A2E; [09-09]
      (=jis-x0212	  . #x2948)	; &I-JSP-2948; [09-40]
      (=jis-x0213-1-2000  . #x2A2E)	; &I-JX1-2A2E; [10-14]
      ))
    (=jef-china3	. #x83AC)	; &JC3-83AC;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (=ucs		. #x0143)	; Ń
    (latin-iso8859-2	. #xD1)	; &I-LATIN2-51;
    ))
(define-char
  '((->decomposition	#xFF2E #x0301)
    (->lowercase
     ((=jis-x0212	  . #x2B4D)	; &JX1-2A51; [11-45]
      (=jis-x0213-1-2000  . #x2A51)	; &I-JX1-2A51; [10-49]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (=jis-x0212		. #x2A4D)	; &JX1-2A41; [10-45]
    (=jis-x0213-1-2000	. #x2A41)	; &I-JX1-2A41; [10-33]
    (=jef-china3	. #x85DF)	; &I-JC3-85DF;
    (=ucs@jis/fw	. #x0143)	; &JX1-2A41;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (=ucs		. #x0144)	; ń
    (latin-iso8859-2	. #xF1)	; &I-LATIN2-71;
    ))
(define-char
  '((->decomposition	#xFF4E #x0301)
    (->uppercase
     ((=jis-x0212	  . #x2A4D)	; &JX1-2A41; [10-45]
      (=jis-x0213-1-2000  . #x2A41)	; &I-JX1-2A41; [10-33]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (=jis-x0212		. #x2B4D)	; &JX1-2A51; [11-45]
    (=jis-x0213-1-2000	. #x2A51)	; &I-JX1-2A51; [10-49]
    (=jef-china3	. #x85F5)	; &I-JC3-85F5;
    (=ucs@jis/fw	. #x0144)	; &JX1-2A51;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (=ucs		. #x0145)	; Ņ
    (latin-iso8859-4	. #xD1)	; &I-LATIN4-51;
    ))
(define-char
  '((->decomposition	#xFF2E #x0327)
    (->lowercase
     ((=jis-x0212	  . #x2B4F)	; &JSP-2B4F; [11-47]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (=jis-x0212		. #x2A4F)	; &JSP-2A4F; [10-47]
    (=jef-china3	. #x89F9)	; &I-JC3-89F9;
    (=ucs@jis/fw	. #x0145)	; &JSP-2A4F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (=ucs		. #x0146)	; ņ
    (latin-iso8859-4	. #xF1)	; &I-LATIN4-71;
    ))
(define-char
  '((->decomposition	#xFF4E #x0327)
    (->uppercase
     ((=jis-x0212	  . #x2A4F)	; &JSP-2A4F; [10-47]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (=jis-x0212		. #x2B4F)	; &JSP-2B4F; [11-47]
    (=jef-china3	. #x8AA1)	; &I-JC3-8AA1;
    (=ucs@jis/fw	. #x0146)	; &JSP-2B4F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (=ucs		. #x0147)	; Ň
    (latin-iso8859-2	. #xD2)	; &I-LATIN2-52;
    ))
(define-char
  '((->decomposition	#xFF2E #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B4E)	; &JX1-2A52; [11-46]
      (=jis-x0213-1-2000  . #x2A52)	; &I-JX1-2A52; [10-50]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (=jis-x0212		. #x2A4E)	; &JX1-2A42; [10-46]
    (=jis-x0213-1-2000	. #x2A42)	; &I-JX1-2A42; [10-34]
    (=jef-china3	. #x88E7)	; &I-JC3-88E7;
    (=ucs@jis/fw	. #x0147)	; &JX1-2A42;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (=ucs		. #x0148)	; ň
    (latin-iso8859-2	. #xF2)	; &I-LATIN2-72;
    ))
(define-char
  '((->decomposition	#xFF4E #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A4E)	; &JX1-2A42; [10-46]
      (=jis-x0213-1-2000  . #x2A42)	; &I-JX1-2A42; [10-34]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (=jis-x0212		. #x2B4E)	; &JX1-2A52; [11-46]
    (=jis-x0213-1-2000	. #x2A52)	; &I-JX1-2A52; [10-50]
    (=jef-china3	. #x88F6)	; &I-JC3-88F6;
    (=ucs@jis/fw	. #x0148)	; &JX1-2A52;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    (=ucs		. #x0149)	; ŉ
    ))
(define-char
  '((->decomposition	compat #x02BC #xFF4E)
    (<-denotational
     ((name . "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
      (=ucs		  . #x0149)	; ŉ
      ))
    (<-fullwidth
     ((name . "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
      (=ucs		  . #x0149)	; ŉ
      ))
    (=ks-x1001		. #x2930)	; &JSP-294A; [09-16]
    (=jis-x0212		. #x294A)	; &I-JSP-294A; [09-42]
    (=ucs@jis/fw	. #x0149)	; &JSP-294A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (=ucs		. #x014A)	; Ŋ
    (latin-iso8859-4	. #xBD)	; &I-LATIN4-3D;
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x292F)	; &JX1-2A7A; [09-15]
      (=jis-x0212	  . #x294B)	; &I-JSP-294B; [09-43]
      (=jis-x0213-1-2000  . #x2A7A)	; &I-JX1-2A7A; [10-90]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (=ks-x1001		. #x282F)	; &JSP-292B; [08-15]
    (=jis-x0212		. #x292B)	; &I-JSP-292B; [09-11]
    (=ucs@jis/fw	. #x014A)	; &JSP-292B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (=ucs		. #x014B)	; ŋ
    (latin-iso8859-4	. #xBF)	; &I-LATIN4-3F;
    (ipa		. #xD5)	; &I-MULE-IPA-55;
    ))
(define-char
  '((->uppercase
     ((=ks-x1001	  . #x282F)	; &JSP-292B; [08-15]
      (=jis-x0212	  . #x292B)	; &I-JSP-292B; [09-11]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (=ks-x1001		. #x292F)	; &JX1-2A7A; [09-15]
    (=jis-x0212		. #x294B)	; &I-JSP-294B; [09-43]
    (=jis-x0213-1-2000	. #x2A7A)	; &I-JX1-2A7A; [10-90]
    (=ucs@jis/fw	. #x014B)	; &JX1-2A7A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (=ucs		. #x014C)	; Ō
    (latin-iso8859-4	. #xD2)	; &I-LATIN4-52;
    ))
(define-char
  '((->decomposition	#xFF2F #x0304)
    (->lowercase
     ((=gb2312		  . #x282D)	; &JX1-297E; [08-13]
      (=jis-x0212	  . #x2B57)	; &I-JSP-2B57; [11-55]
      (=jis-x0213-1-2000  . #x297E)	; &I-JX1-297E; [09-94]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (=jis-x0212		. #x2A57)	; &JX1-2979; [10-55]
    (=jis-x0213-1-2000	. #x2979)	; &I-JX1-2979; [09-89]
    (=jef-china3	. #x87B3)	; &I-JC3-87B3;
    (=ucs@jis/fw	. #x014C)	; &JX1-2979;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (=ucs		. #x014D)	; ō
    (latin-iso8859-4	. #xF2)	; &I-LATIN4-72;
    ))
(define-char
  '((->decomposition	#xFF4F #x0304)
    (->uppercase
     ((=jis-x0212	  . #x2A57)	; &JX1-2979; [10-55]
      (=jis-x0213-1-2000  . #x2979)	; &I-JX1-2979; [09-89]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (=gb2312		. #x282D)	; &JX1-297E; [08-13]
    (=jis-x0212		. #x2B57)	; &I-JSP-2B57; [11-55]
    (=jis-x0213-1-2000	. #x297E)	; &I-JX1-297E; [09-94]
    (=jef-china3	. #x87C7)	; &I-JC3-87C7;
    (=ucs@gb/fw		. #x014D)	; &JX1-297E;
    (=ucs@jis/fw	. #x014D)	; &JX1-297E;
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
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (=ucs		. #x0150)	; Ő
    (latin-iso8859-2	. #xD5)	; &I-LATIN2-55;
    ))
(define-char
  '((->decomposition	#xFF2F #x030B)
    (->lowercase
     ((=jis-x0212	  . #x2B56)	; &JX1-2A53; [11-54]
      (=jis-x0213-1-2000  . #x2A53)	; &I-JX1-2A53; [10-51]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (=jis-x0212		. #x2A56)	; &JX1-2A43; [10-54]
    (=jis-x0213-1-2000	. #x2A43)	; &I-JX1-2A43; [10-35]
    (=jef-china3	. #x89E2)	; &I-JC3-89E2;
    (=ucs@jis/fw	. #x0150)	; &JX1-2A43;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (=ucs		. #x0151)	; ő
    (latin-iso8859-2	. #xF5)	; &I-LATIN2-75;
    ))
(define-char
  '((->decomposition	#xFF4F #x030B)
    (->uppercase
     ((=jis-x0212	  . #x2A56)	; &JX1-2A43; [10-54]
      (=jis-x0213-1-2000  . #x2A43)	; &I-JX1-2A43; [10-35]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (=jis-x0212		. #x2B56)	; &JX1-2A53; [11-54]
    (=jis-x0213-1-2000	. #x2A53)	; &I-JX1-2A53; [10-51]
    (=jef-china3	. #x89E5)	; &I-JC3-89E5;
    (=ucs@jis/fw	. #x0151)	; &JX1-2A53;
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
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x292B)	; &JX1-2B2A; [09-11]
      (=jis-x0212	  . #x294D)	; &I-JSP-294D; [09-45]
      (=jis-x0213-1-2000  . #x2B2A)	; &I-JX1-2B2A; [11-10]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (=ks-x1001		. #x282B)	; &JX1-2B2B; [08-11]
    (=jis-x0212		. #x292D)	; &I-JSP-292D; [09-13]
    (=jis-x0213-1-2000	. #x2B2B)	; &I-JX1-2B2B; [11-11]
    (=jef-china3	. #x83A6)	; &I-JC3-83A6;
    (=ucs@jis		. #x0152)	; &JX1-2B2B;
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (=ucs		. #x0153)	; œ
    (ipa		. #xB0)	; &I-MULE-IPA-30;
    ))
(define-char
  '((->uppercase
     ((=ks-x1001	  . #x282B)	; &JX1-2B2B; [08-11]
      (=jis-x0212	  . #x292D)	; &I-JSP-292D; [09-13]
      (=jis-x0213-1-2000  . #x2B2B)	; &I-JX1-2B2B; [11-11]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    (=ks-x1001		. #x292B)	; &JX1-2B2A; [09-11]
    (=jis-x0212		. #x294D)	; &I-JSP-294D; [09-45]
    (=jis-x0213-1-2000	. #x2B2A)	; &I-JX1-2B2A; [11-10]
    (=jef-china3	. #x83B1)	; &I-JC3-83B1;
    (=ucs@jis		. #x0153)	; &JX1-2B2A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (=ucs		. #x0154)	; Ŕ
    (latin-iso8859-2	. #xC0)	; &I-LATIN2-40;
    ))
(define-char
  '((->decomposition	#xFF32 #x0301)
    (->lowercase
     ((=jis-x0212	  . #x2B59)	; &JX1-2A48; [11-57]
      (=jis-x0213-1-2000  . #x2A48)	; &I-JX1-2A48; [10-40]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (=jis-x0212		. #x2A59)	; &JX1-2A39; [10-57]
    (=jis-x0213-1-2000	. #x2A39)	; &I-JX1-2A39; [10-25]
    (=jef-china3	. #x85E3)	; &I-JC3-85E3;
    (=ucs@jis/fw	. #x0154)	; &JX1-2A39;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (=ucs		. #x0155)	; ŕ
    (latin-iso8859-2	. #xE0)	; &I-LATIN2-60;
    ))
(define-char
  '((->decomposition	#xFF52 #x0301)
    (->uppercase
     ((=jis-x0212	  . #x2A59)	; &JX1-2A39; [10-57]
      (=jis-x0213-1-2000  . #x2A39)	; &I-JX1-2A39; [10-25]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (=jis-x0212		. #x2B59)	; &JX1-2A48; [11-57]
    (=jis-x0213-1-2000	. #x2A48)	; &I-JX1-2A48; [10-40]
    (=jef-china3	. #x85F9)	; &I-JC3-85F9;
    (=ucs@jis/fw	. #x0155)	; &JX1-2A48;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (=ucs		. #x0156)	; Ŗ
    (latin-iso8859-4	. #xA3)	; &I-LATIN4-23;
    ))
(define-char
  '((->decomposition	#xFF32 #x0327)
    (->lowercase
     ((=jis-x0212	  . #x2B5B)	; &JSP-2B5B; [11-59]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (=jis-x0212		. #x2A5B)	; &JSP-2A5B; [10-59]
    (=ucs@jis/fw	. #x0156)	; &JSP-2A5B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (=ucs		. #x0157)	; ŗ
    (latin-iso8859-4	. #xB3)	; &I-LATIN4-33;
    ))
(define-char
  '((->decomposition	#xFF52 #x0327)
    (->uppercase
     ((=jis-x0212	  . #x2A5B)	; &JSP-2A5B; [10-59]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (=jis-x0212		. #x2B5B)	; &JSP-2B5B; [11-59]
    (=ucs@jis/fw	. #x0157)	; &JSP-2B5B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (=ucs		. #x0158)	; Ř
    (latin-iso8859-2	. #xD8)	; &I-LATIN2-58;
    ))
(define-char
  '((->decomposition	#xFF32 #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B5A)	; &JX1-2A54; [11-58]
      (=jis-x0213-1-2000  . #x2A54)	; &I-JX1-2A54; [10-52]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (=jis-x0212		. #x2A5A)	; &JX1-2A44; [10-58]
    (=jis-x0213-1-2000	. #x2A44)	; &I-JX1-2A44; [10-36]
    (=jef-china3	. #x88E9)	; &I-JC3-88E9;
    (=ucs@jis/fw	. #x0158)	; &JX1-2A44;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (=ucs		. #x0159)	; ř
    (latin-iso8859-2	. #xF8)	; &I-LATIN2-78;
    ))
(define-char
  '((->decomposition	#xFF52 #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A5A)	; &JX1-2A44; [10-58]
      (=jis-x0213-1-2000  . #x2A44)	; &I-JX1-2A44; [10-36]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (=jis-x0212		. #x2B5A)	; &JX1-2A54; [11-58]
    (=jis-x0213-1-2000	. #x2A54)	; &I-JX1-2A54; [10-52]
    (=jef-china3	. #x88F8)	; &I-JC3-88F8;
    (=ucs@jis/fw	. #x0159)	; &JX1-2A54;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (=ucs		. #x015A)	; Ś
    (latin-iso8859-2	. #xA6)	; &I-LATIN2-26;
    ))
(define-char
  '((->decomposition	#xFF33 #x0301)
    (->lowercase
     ((=jis-x0212	  . #x2B5C)	; &JX1-2A30; [11-60]
      (=jis-x0213-1-2000  . #x2A30)	; &I-JX1-2A30; [10-16]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (=jis-x0212		. #x2A5C)	; &JX1-2A25; [10-60]
    (=jis-x0213-1-2000	. #x2A25)	; &I-JX1-2A25; [10-05]
    (=jef-china3	. #x85E4)	; &I-JC3-85E4;
    (=ucs@jis/fw	. #x015A)	; &JX1-2A25;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (=ucs		. #x015B)	; ś
    (latin-iso8859-2	. #xB6)	; &I-LATIN2-36;
    ))
(define-char
  '((->decomposition	#xFF53 #x0301)
    (->uppercase
     ((=jis-x0212	  . #x2A5C)	; &JX1-2A25; [10-60]
      (=jis-x0213-1-2000  . #x2A25)	; &I-JX1-2A25; [10-05]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (=jis-x0212		. #x2B5C)	; &JX1-2A30; [11-60]
    (=jis-x0213-1-2000	. #x2A30)	; &I-JX1-2A30; [10-16]
    (=jef-china3	. #x85FA)	; &I-JC3-85FA;
    (=ucs@jis/fw	. #x015B)	; &JX1-2A30;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (=ucs		. #x015C)	; Ŝ
    (latin-iso8859-3	. #xDE)	; &I-LATIN3-5E;
    ))
(define-char
  '((->decomposition	#xFF33 #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B5D)	; &JX1-2A63; [11-61]
      (=jis-x0213-1-2000  . #x2A63)	; &I-JX1-2A63; [10-67]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (=jis-x0212		. #x2A5D)	; &JX1-2A5D; [10-61]
    (=jis-x0213-1-2000	. #x2A5D)	; &I-JX1-2A5D; [10-61]
    (=jef-china3	. #x86C0)	; &I-JC3-86C0;
    (=ucs@jis/fw	. #x015C)	; &JX1-2A5D;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (=ucs		. #x015D)	; ŝ
    (latin-iso8859-3	. #xFE)	; &I-LATIN3-7E;
    ))
(define-char
  '((->decomposition	#xFF53 #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A5D)	; &JX1-2A5D; [10-61]
      (=jis-x0213-1-2000  . #x2A5D)	; &I-JX1-2A5D; [10-61]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (=jis-x0212		. #x2B5D)	; &JX1-2A63; [11-61]
    (=jis-x0213-1-2000	. #x2A63)	; &I-JX1-2A63; [10-67]
    (=jef-china3	. #x86CD)	; &I-JC3-86CD;
    (=ucs@jis/fw	. #x015D)	; &JX1-2A63;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (=ucs		. #x015E)	; Ş
    (latin-iso8859-2	. #xAA)	; &I-LATIN2-2A;
    (latin-iso8859-3	. #xAA)	; &I-LATIN3-2A;
    (latin-iso8859-9	. #xDE)	; &I-LATIN5-5E;
    ))
(define-char
  '((->decomposition	#xFF33 #x0327)
    (->lowercase
     ((=jis-x0212	  . #x2B5F)	; &JX1-2A33; [11-63]
      (=jis-x0213-1-2000  . #x2A33)	; &I-JX1-2A33; [10-19]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (=jis-x0212		. #x2A5F)	; &JX1-2A27; [10-63]
    (=jis-x0213-1-2000	. #x2A27)	; &I-JX1-2A27; [10-07]
    (=ucs@jis/fw	. #x015E)	; &JX1-2A27;
    (->subsumptive
     ((=jef-china3	  . #x89FA)	; &JC3-89FA;
      )
     ((=jef-china3	  . #x8BCB)	; &JC3-8BCB;
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (=ucs		. #x015F)	; ş
    (latin-iso8859-2	. #xBA)	; &I-LATIN2-3A;
    (latin-iso8859-3	. #xBA)	; &I-LATIN3-3A;
    (latin-iso8859-9	. #xFE)	; &I-LATIN5-7E;
    ))
(define-char
  '((->decomposition	#xFF53 #x0327)
    (->uppercase
     ((=jis-x0212	  . #x2A5F)	; &JX1-2A27; [10-63]
      (=jis-x0213-1-2000  . #x2A27)	; &I-JX1-2A27; [10-07]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (=jis-x0212		. #x2B5F)	; &JX1-2A33; [11-63]
    (=jis-x0213-1-2000	. #x2A33)	; &I-JX1-2A33; [10-19]
    (=jef-china3	. #x8AA2)	; &I-JC3-8AA2;
    (=ucs@jis/fw	. #x015F)	; &JX1-2A33;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (=ucs		. #x0160)	; Š
    (latin-iso8859-2	. #xA9)	; &I-LATIN2-29;
    (latin-iso8859-4	. #xA9)	; &I-LATIN4-29;
    ))
(define-char
  '((->decomposition	#xFF33 #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B5E)	; &JX1-2A32; [11-62]
      (=jis-x0213-1-2000  . #x2A32)	; &I-JX1-2A32; [10-18]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (=jis-x0212		. #x2A5E)	; &JX1-2A26; [10-62]
    (=jis-x0213-1-2000	. #x2A26)	; &I-JX1-2A26; [10-06]
    (=jef-china3	. #x88EA)	; &I-JC3-88EA;
    (=ucs@jis/fw	. #x0160)	; &JX1-2A26;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (=ucs		. #x0161)	; š
    (latin-iso8859-2	. #xB9)	; &I-LATIN2-39;
    (latin-iso8859-4	. #xB9)	; &I-LATIN4-39;
    ))
(define-char
  '((->decomposition	#xFF53 #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A5E)	; &JX1-2A26; [10-62]
      (=jis-x0213-1-2000  . #x2A26)	; &I-JX1-2A26; [10-06]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (=jis-x0212		. #x2B5E)	; &JX1-2A32; [11-62]
    (=jis-x0213-1-2000	. #x2A32)	; &I-JX1-2A32; [10-18]
    (=jef-china3	. #x88F9)	; &I-JC3-88F9;
    (=ucs@jis/fw	. #x0161)	; &JX1-2A32;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x0327)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (=ucs		. #x0162)	; Ţ
    (latin-iso8859-2	. #xDE)	; &I-LATIN2-5E;
    ))
(define-char
  '((->decomposition	#xFF34 #x0327)
    (->lowercase
     ((=jis-x0212	  . #x2B61)	; &JX1-2A57; [11-65]
      (=jis-x0213-1-2000  . #x2A57)	; &I-JX1-2A57; [10-55]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (=jis-x0212		. #x2A61)	; &JX1-2A47; [10-65]
    (=jis-x0213-1-2000	. #x2A47)	; &I-JX1-2A47; [10-39]
    (=jef-china3	. #x8BCC)	; &I-JC3-8BCC;
    (=ucs@jis/fw	. #x0162)	; &JX1-2A47;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x0327)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (=ucs		. #x0163)	; ţ
    (latin-iso8859-2	. #xFE)	; &I-LATIN2-7E;
    ))
(define-char
  '((->decomposition	#xFF54 #x0327)
    (->uppercase
     ((=jis-x0212	  . #x2A61)	; &JX1-2A47; [10-65]
      (=jis-x0213-1-2000  . #x2A47)	; &I-JX1-2A47; [10-39]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (=jis-x0212		. #x2B61)	; &JX1-2A57; [11-65]
    (=jis-x0213-1-2000	. #x2A57)	; &I-JX1-2A57; [10-55]
    (=ucs@jis/fw	. #x0163)	; &JX1-2A57;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (=ucs		. #x0164)	; Ť
    (latin-iso8859-2	. #xAB)	; &I-LATIN2-2B;
    ))
(define-char
  '((->decomposition	#xFF34 #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B60)	; &JX1-2A34; [11-64]
      (=jis-x0213-1-2000  . #x2A34)	; &I-JX1-2A34; [10-20]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (=jis-x0212		. #x2A60)	; &JX1-2A28; [10-64]
    (=jis-x0213-1-2000	. #x2A28)	; &I-JX1-2A28; [10-08]
    (=jef-china3	. #x88EB)	; &I-JC3-88EB;
    (=ucs@jis/fw	. #x0164)	; &JX1-2A28;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (=ucs		. #x0165)	; ť
    (latin-iso8859-2	. #xBB)	; &I-LATIN2-3B;
    ))
(define-char
  '((->decomposition	#xFF54 #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A60)	; &JX1-2A28; [10-64]
      (=jis-x0213-1-2000  . #x2A28)	; &I-JX1-2A28; [10-08]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (=jis-x0212		. #x2B60)	; &JX1-2A34; [11-64]
    (=jis-x0213-1-2000	. #x2A34)	; &I-JX1-2A34; [10-20]
    (=jef-china3	. #x88FA)	; &I-JC3-88FA;
    (=ucs@jis/fw	. #x0165)	; &JX1-2A34;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (=ucs		. #x0166)	; Ŧ
    (latin-iso8859-4	. #xAC)	; &I-LATIN4-2C;
    ))
(define-char
  '((->lowercase
     ((=ks-x1001	  . #x292E)	; &JSP-294F; [09-14]
      (=jis-x0212	  . #x294F)	; &I-JSP-294F; [09-47]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (=ks-x1001		. #x282E)	; &JSP-292F; [08-14]
    (=jis-x0212		. #x292F)	; &I-JSP-292F; [09-15]
    (=ucs@jis/fw	. #x0166)	; &JSP-292F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (=ucs		. #x0167)	; ŧ
    (latin-iso8859-4	. #xBC)	; &I-LATIN4-3C;
    ))
(define-char
  '((->uppercase
     ((=ks-x1001	  . #x282E)	; &JSP-292F; [08-14]
      (=jis-x0212	  . #x292F)	; &I-JSP-292F; [09-15]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (=ks-x1001		. #x292E)	; &JSP-294F; [09-14]
    (=jis-x0212		. #x294F)	; &I-JSP-294F; [09-47]
    (=ucs@jis/fw	. #x0167)	; &JSP-294F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (=ucs		. #x0168)	; Ũ
    (latin-iso8859-4	. #xDD)	; &I-LATIN4-5D;
    (latin-viscii	. #x9D)	; &I-MULE-VIET-U-7B;
    (latin-viscii-upper . #xFB)	; &I-MULE-VIET-U-7B;
    ))
(define-char
  '((->decomposition	#xFF35 #x0303)
    (->lowercase
     ((=jis-x0212	  . #x2B6C)	; &JSP-2B6C; [11-76]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (=jis-x0212		. #x2A6C)	; &JSP-2A6C; [10-76]
    (=jef-china3	. #x86EB)	; &I-JC3-86EB;
    (=ucs@jis/fw	. #x0168)	; &JSP-2A6C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (=ucs		. #x0169)	; ũ
    (latin-iso8859-4	. #xFD)	; &I-LATIN4-7D;
    (latin-tcvn5712	. #xF2)	; &I-VSCII2-72;
    (latin-viscii	. #xFB)	; &I-MULE-VIET-L-7B;
    (latin-viscii-lower . #xFB)	; &I-MULE-VIET-L-7B;
    ))
(define-char
  '((->decomposition	#xFF55 #x0303)
    (->uppercase
     ((=jis-x0212	  . #x2A6C)	; &JSP-2A6C; [10-76]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (=jis-x0212		. #x2B6C)	; &JSP-2B6C; [11-76]
    (=jef-china3	. #x86F8)	; &I-JC3-86F8;
    (=ucs@jis/fw	. #x0169)	; &JSP-2B6C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (=ucs		. #x016A)	; Ū
    (latin-iso8859-4	. #xDE)	; &I-LATIN4-5E;
    ))
(define-char
  '((->decomposition	#xFF35 #x0304)
    (->lowercase
     ((=gb2312		  . #x2831)	; &JX1-297C; [08-17]
      (=jis-x0212	  . #x2B69)	; &I-JSP-2B69; [11-73]
      (=jis-x0213-1-2000  . #x297C)	; &I-JX1-297C; [09-92]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=jis-x0212		. #x2A69)	; &JX1-2977; [10-73]
    (=jis-x0213-1-2000	. #x2977)	; &I-JX1-2977; [09-87]
    (=jef-china3	. #x87B9)	; &I-JC3-87B9;
    (=ucs@jis/fw	. #x016A)	; &JX1-2977;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=ucs		. #x016B)	; ū
    (latin-iso8859-4	. #xFE)	; &I-LATIN4-7E;
    ))
(define-char
  '((->decomposition	#xFF55 #x0304)
    (->uppercase
     ((=jis-x0212	  . #x2A69)	; &JX1-2977; [10-73]
      (=jis-x0213-1-2000  . #x2977)	; &I-JX1-2977; [09-87]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (=gb2312		. #x2831)	; &JX1-297C; [08-17]
    (=jis-x0212		. #x2B69)	; &I-JSP-2B69; [11-73]
    (=jis-x0213-1-2000	. #x297C)	; &I-JX1-297C; [09-92]
    (=jef-china3	. #x87CD)	; &I-JC3-87CD;
    (=ucs@gb/fw		. #x016B)	; &JX1-297C;
    (=ucs@jis/fw	. #x016B)	; &JX1-297C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (=ucs		. #x016C)	; Ŭ
    (latin-iso8859-3	. #xDD)	; &I-LATIN3-5D;
    ))
(define-char
  '((->decomposition	#xFF35 #x0306)
    (->lowercase
     ((=jis-x0212	  . #x2B66)	; &JX1-2A64; [11-70]
      (=jis-x0213-1-2000  . #x2A64)	; &I-JX1-2A64; [10-68]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (=jis-x0212		. #x2A66)	; &JX1-2A5E; [10-70]
    (=jis-x0213-1-2000	. #x2A5E)	; &I-JX1-2A5E; [10-62]
    (=jef-china3	. #x87E5)	; &I-JC3-87E5;
    (=ucs@jis/fw	. #x016C)	; &JX1-2A5E;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (=ucs		. #x016D)	; ŭ
    (latin-iso8859-3	. #xFD)	; &I-LATIN3-7D;
    ))
(define-char
  '((->decomposition	#xFF55 #x0306)
    (->uppercase
     ((=jis-x0212	  . #x2A66)	; &JX1-2A5E; [10-70]
      (=jis-x0213-1-2000  . #x2A5E)	; &I-JX1-2A5E; [10-62]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (=jis-x0212		. #x2B66)	; &JX1-2A64; [11-70]
    (=jis-x0213-1-2000	. #x2A64)	; &I-JX1-2A64; [10-68]
    (=jef-china3	. #x87EF)	; &I-JC3-87EF;
    (=ucs@jis/fw	. #x016D)	; &JX1-2A64;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (=ucs		. #x016E)	; Ů
    (latin-iso8859-2	. #xD9)	; &I-LATIN2-59;
    ))
(define-char
  '((->decomposition	#xFF35 #x030A)
    (->lowercase
     ((=jis-x0212	  . #x2B6B)	; &JX1-2A55; [11-75]
      (=jis-x0213-1-2000  . #x2A55)	; &I-JX1-2A55; [10-53]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (=jis-x0212		. #x2A6B)	; &JX1-2A45; [10-75]
    (=jis-x0213-1-2000	. #x2A45)	; &I-JX1-2A45; [10-37]
    (=jef-china3	. #x89A5)	; &I-JC3-89A5;
    (=ucs@jis/fw	. #x016E)	; &JX1-2A45;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (=ucs		. #x016F)	; ů
    (latin-iso8859-2	. #xF9)	; &I-LATIN2-79;
    ))
(define-char
  '((->decomposition	#xFF55 #x030A)
    (->uppercase
     ((=jis-x0212	  . #x2A6B)	; &JX1-2A45; [10-75]
      (=jis-x0213-1-2000  . #x2A45)	; &I-JX1-2A45; [10-37]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (=jis-x0212		. #x2B6B)	; &JX1-2A55; [11-75]
    (=jis-x0213-1-2000	. #x2A55)	; &I-JX1-2A55; [10-53]
    (=jef-china3	. #x89AD)	; &I-JC3-89AD;
    (=ucs@jis/fw	. #x016F)	; &JX1-2A55;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (=ucs		. #x0170)	; Ű
    (latin-iso8859-2	. #xDB)	; &I-LATIN2-5B;
    ))
(define-char
  '((->decomposition	#xFF35 #x030B)
    (->lowercase
     ((=jis-x0212	  . #x2B68)	; &JX1-2A56; [11-72]
      (=jis-x0213-1-2000  . #x2A56)	; &I-JX1-2A56; [10-54]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (=jis-x0212		. #x2A68)	; &JX1-2A46; [10-72]
    (=jis-x0213-1-2000	. #x2A46)	; &I-JX1-2A46; [10-38]
    (=jef-china3	. #x89E3)	; &I-JC3-89E3;
    (=ucs@jis/fw	. #x0170)	; &JX1-2A46;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (=ucs		. #x0171)	; ű
    (latin-iso8859-2	. #xFB)	; &I-LATIN2-7B;
    ))
(define-char
  '((->decomposition	#xFF55 #x030B)
    (->uppercase
     ((=jis-x0212	  . #x2A68)	; &JX1-2A46; [10-72]
      (=jis-x0213-1-2000  . #x2A46)	; &I-JX1-2A46; [10-38]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (=jis-x0212		. #x2B68)	; &JX1-2A56; [11-72]
    (=jis-x0213-1-2000	. #x2A56)	; &I-JX1-2A56; [10-54]
    (=jef-china3	. #x89E6)	; &I-JC3-89E6;
    (=ucs@jis/fw	. #x0171)	; &JX1-2A56;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (=ucs		. #x0172)	; Ų
    (latin-iso8859-4	. #xD9)	; &I-LATIN4-59;
    ))
(define-char
  '((->decomposition	#xFF35 #x0328)
    (->lowercase
     ((=jis-x0212	  . #x2B6A)	; &JSP-2B6A; [11-74]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (=jis-x0212		. #x2A6A)	; &JSP-2A6A; [10-74]
    (=jef-china3	. #x8AAA)	; &I-JC3-8AAA;
    (=ucs@jis/fw	. #x0172)	; &JSP-2A6A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (=ucs		. #x0173)	; ų
    (latin-iso8859-4	. #xF9)	; &I-LATIN4-79;
    ))
(define-char
  '((->decomposition	#xFF55 #x0328)
    (->uppercase
     ((=jis-x0212	  . #x2A6A)	; &JSP-2A6A; [10-74]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (=jis-x0212		. #x2B6A)	; &JSP-2B6A; [11-74]
    (=jef-china3	. #x8AB2)	; &I-JC3-8AB2;
    (=ucs@jis/fw	. #x0173)	; &JSP-2B6A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (=ucs		. #x0174)	; Ŵ
    ))
(define-char
  '((->decomposition	#xFF37 #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B71)	; &JSP-2B71; [11-81]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (=jis-x0212		. #x2A71)	; &JSP-2A71; [10-81]
    (=jef-china3	. #x86C2)	; &I-JC3-86C2;
    (=ucs@jis/fw	. #x0174)	; &JSP-2A71;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (=ucs		. #x0175)	; ŵ
    ))
(define-char
  '((->decomposition	#xFF57 #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A71)	; &JSP-2A71; [10-81]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (=jis-x0212		. #x2B71)	; &JSP-2B71; [11-81]
    (=jef-china3	. #x86CF)	; &I-JC3-86CF;
    (=ucs@jis/fw	. #x0175)	; &JSP-2B71;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (=ucs		. #x0176)	; Ŷ
    ))
(define-char
  '((->decomposition	#xFF39 #x0302)
    (->lowercase
     ((=jis-x0212	  . #x2B74)	; &JSP-2B74; [11-84]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (=jis-x0212		. #x2A74)	; &JSP-2A74; [10-84]
    (=jef-china3	. #x86C3)	; &I-JC3-86C3;
    (=ucs@jis/fw	. #x0176)	; &JSP-2A74;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (=ucs		. #x0177)	; ŷ
    ))
(define-char
  '((->decomposition	#xFF59 #x0302)
    (->uppercase
     ((=jis-x0212	  . #x2A74)	; &JSP-2A74; [10-84]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (=jis-x0212		. #x2B74)	; &JSP-2B74; [11-84]
    (=jef-china3	. #x86D0)	; &I-JC3-86D0;
    (=ucs@jis/fw	. #x0177)	; &JSP-2B74;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x00FF)	; ÿ
      ))
    (=ucs		. #x0178)	; Ÿ
    ))
(define-char
  '((->decomposition	#xFF39 #x0308)
    (->lowercase
     ((=jis-x0212	  . #x2B73)	; &JX1-2974; [11-83]
      (=jis-x0213-1-2000  . #x2974)	; &I-JX1-2974; [09-84]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Ÿ
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Ÿ
      ))
    (=jis-x0212		. #x2A73)	; &JSP-2A73; [10-83]
    (=ucs@jis/fw	. #x0178)	; &JSP-2A73;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (=ucs		. #x0179)	; Ź
    (latin-iso8859-2	. #xAC)	; &I-LATIN2-2C;
    ))
(define-char
  '((->decomposition	#xFF3A #x0301)
    (->lowercase
     ((=jis-x0212	  . #x2B75)	; &JX1-2A35; [11-85]
      (=jis-x0213-1-2000  . #x2A35)	; &I-JX1-2A35; [10-21]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (=jis-x0212		. #x2A75)	; &JX1-2A29; [10-85]
    (=jis-x0213-1-2000	. #x2A29)	; &I-JX1-2A29; [10-09]
    (=jef-china3	. #x85EA)	; &I-JC3-85EA;
    (=ucs@jis/fw	. #x0179)	; &JX1-2A29;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (=ucs		. #x017A)	; ź
    (latin-iso8859-2	. #xBC)	; &I-LATIN2-3C;
    ))
(define-char
  '((->decomposition	#xFF5A #x0301)
    (->uppercase
     ((=jis-x0212	  . #x2A75)	; &JX1-2A29; [10-85]
      (=jis-x0213-1-2000  . #x2A29)	; &I-JX1-2A29; [10-09]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (=jis-x0212		. #x2B75)	; &JX1-2A35; [11-85]
    (=jis-x0213-1-2000	. #x2A35)	; &I-JX1-2A35; [10-21]
    (=jef-china3	. #x86A2)	; &I-JC3-86A2;
    (=ucs@jis/fw	. #x017A)	; &JX1-2A35;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (=ucs		. #x017B)	; Ż
    (latin-iso8859-2	. #xAF)	; &I-LATIN2-2F;
    (latin-iso8859-3	. #xAF)	; &I-LATIN3-2F;
    ))
(define-char
  '((->decomposition	#xFF3A #x0307)
    (->lowercase
     ((=jis-x0212	  . #x2B77)	; &JX1-2A38; [11-87]
      (=jis-x0213-1-2000  . #x2A38)	; &I-JX1-2A38; [10-24]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (=jis-x0212		. #x2A77)	; &JX1-2A2B; [10-87]
    (=jis-x0213-1-2000	. #x2A2B)	; &I-JX1-2A2B; [10-11]
    (=jef-china3	. #x88AF)	; &I-JC3-88AF;
    (=ucs@jis/fw	. #x017B)	; &JX1-2A2B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (=ucs		. #x017C)	; ż
    (latin-iso8859-2	. #xBF)	; &I-LATIN2-3F;
    (latin-iso8859-3	. #xBF)	; &I-LATIN3-3F;
    ))
(define-char
  '((->decomposition	#xFF5A #x0307)
    (->uppercase
     ((=jis-x0212	  . #x2A77)	; &JX1-2A2B; [10-87]
      (=jis-x0213-1-2000  . #x2A2B)	; &I-JX1-2A2B; [10-11]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (=jis-x0212		. #x2B77)	; &JX1-2A38; [11-87]
    (=jis-x0213-1-2000	. #x2A38)	; &I-JX1-2A38; [10-24]
    (=jef-china3	. #x88C4)	; &I-JC3-88C4;
    (=ucs@jis/fw	. #x017C)	; &JX1-2A38;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (=ucs		. #x017D)	; Ž
    (latin-iso8859-2	. #xAE)	; &I-LATIN2-2E;
    (latin-iso8859-4	. #xAE)	; &I-LATIN4-2E;
    ))
(define-char
  '((->decomposition	#xFF3A #x030C)
    (->lowercase
     ((=jis-x0212	  . #x2B76)	; &JX1-2A37; [11-86]
      (=jis-x0213-1-2000  . #x2A37)	; &I-JX1-2A37; [10-23]
      ))
    (<-denotational
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (=jis-x0212		. #x2A76)	; &JX1-2A2A; [10-86]
    (=jis-x0213-1-2000	. #x2A2A)	; &I-JX1-2A2A; [10-10]
    (=jef-china3	. #x88ED)	; &I-JC3-88ED;
    (=ucs@jis/fw	. #x017D)	; &JX1-2A2A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (=ucs		. #x017E)	; ž
    (latin-iso8859-2	. #xBE)	; &I-LATIN2-3E;
    (latin-iso8859-4	. #xBE)	; &I-LATIN4-3E;
    ))
(define-char
  '((->decomposition	#xFF5A #x030C)
    (->uppercase
     ((=jis-x0212	  . #x2A76)	; &JX1-2A2A; [10-86]
      (=jis-x0213-1-2000  . #x2A2A)	; &I-JX1-2A2A; [10-10]
      ))
    (<-denotational
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (=jis-x0212		. #x2B76)	; &JX1-2A37; [11-86]
    (=jis-x0213-1-2000	. #x2A37)	; &I-JX1-2A37; [10-23]
    (=jef-china3	. #x88FC)	; &I-JC3-88FC;
    (=ucs@jis/fw	. #x017E)	; &JX1-2A37;
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
