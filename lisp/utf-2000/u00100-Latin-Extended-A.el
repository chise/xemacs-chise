;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with macron")
      (=jis-x0212	  . #x2A27)	; &JX1-2975;
      (=jis-x0213-1-2000  . #x2975)	; &I-JX1-2975;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (=ucs		. #x0100)	; Ā
    (latin-iso8859-4	. #xC0)	; &I-LATIN4-40;
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
    (=jis-x0212		. #x2A27)	; &JX1-2975;
    (=jis-x0213-1-2000	. #x2975)	; &I-JX1-2975;
    (=jef-china3	. #x87A8)	; &I-JC3-87A8;
    (=ucs@jis		. #x0100)	; &JX1-2975;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with macron")
      (=gb2312		  . #x2821)	; &JX1-297A;
      (=jis-x0212	  . #x2B27)	; &I-JSP-2B27;
      (=jis-x0213-1-2000  . #x297A)	; &I-JX1-297A;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (=ucs		. #x0101)	; ā
    (latin-iso8859-4	. #xE0)	; &I-LATIN4-60;
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
    (=gb2312		. #x2821)	; &JX1-297A;
    (=jis-x0212		. #x2B27)	; &I-JSP-2B27;
    (=jis-x0213-1-2000	. #x297A)	; &I-JX1-297A;
    (=jef-china3	. #x87BC)	; &I-JC3-87BC;
    (=ucs@jis		. #x0101)	; &JX1-297A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with breve")
      (=jis-x0212	  . #x2A25)	; &JX1-2A3A;
      (=jis-x0213-1-2000  . #x2A3A)	; &I-JX1-2A3A;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (=ucs		. #x0102)	; Ă
    (latin-iso8859-2	. #xC3)	; &I-LATIN2-43;
    (latin-tcvn5712	. #xA1)	; &I-VSCII2-21;
    (latin-viscii	. #xC5)	; &MCS-00E927A5;
    (latin-viscii-upper . #xE5)	; &MCS-00E927A5;
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
    (=jis-x0212		. #x2A25)	; &JX1-2A3A;
    (=jis-x0213-1-2000	. #x2A3A)	; &I-JX1-2A3A;
    (=jef-china3	. #x87DE)	; &I-JC3-87DE;
    (=ucs@jis		. #x0102)	; &JX1-2A3A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with breve")
      (=jis-x0212	  . #x2B25)	; &JX1-2A49;
      (=jis-x0213-1-2000  . #x2A49)	; &I-JX1-2A49;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (=ucs		. #x0103)	; ă
    (latin-iso8859-2	. #xE3)	; &I-LATIN2-63;
    (latin-tcvn5712	. #xA8)	; &I-VSCII2-28;
    (latin-viscii	. #xE5)	; &MCS-00E92745;
    (latin-viscii-lower . #xE5)	; &MCS-00E92745;
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
    (=jis-x0212		. #x2B25)	; &JX1-2A49;
    (=jis-x0213-1-2000	. #x2A49)	; &I-JX1-2A49;
    (=jef-china3	. #x87E8)	; &I-JC3-87E8;
    (=ucs@jis		. #x0103)	; &JX1-2A49;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0041 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter a with ogonek")
      (=jis-x0212	  . #x2A28)	; &JX1-2A21;
      (=jis-x0213-1-2000  . #x2A21)	; &I-JX1-2A21;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (=ucs		. #x0104)	; Ą
    (latin-iso8859-2	. #xA1)	; &I-LATIN2-21;
    (latin-iso8859-4	. #xA1)	; &I-LATIN4-21;
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
    (=jis-x0212		. #x2A28)	; &JX1-2A21;
    (=jis-x0213-1-2000	. #x2A21)	; &I-JX1-2A21;
    (=jef-china3	. #x8AA3)	; &I-JC3-8AA3;
    (=ucs@jis		. #x0104)	; &JX1-2A21;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0061 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter a with ogonek")
      (=jis-x0212	  . #x2B28)	; &JX1-2A2C;
      (=jis-x0213-1-2000  . #x2A2C)	; &I-JX1-2A2C;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (=ucs		. #x0105)	; ą
    (latin-iso8859-2	. #xB1)	; &I-LATIN2-31;
    (latin-iso8859-4	. #xB1)	; &I-LATIN4-31;
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
    (=jis-x0212		. #x2B28)	; &JX1-2A2C;
    (=jis-x0213-1-2000	. #x2A2C)	; &I-JX1-2A2C;
    (=jef-china3	. #x8AAB)	; &I-JC3-8AAB;
    (=ucs@jis		. #x0105)	; &JX1-2A2C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with acute")
      (=jis-x0212	  . #x2A2B)	; &JX1-2A3C;
      (=jis-x0213-1-2000  . #x2A3C)	; &I-JX1-2A3C;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (=ucs		. #x0106)	; Ć
    (latin-iso8859-2	. #xC6)	; &I-LATIN2-46;
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
    (=jis-x0212		. #x2A2B)	; &JX1-2A3C;
    (=jis-x0213-1-2000	. #x2A3C)	; &I-JX1-2A3C;
    (=jef-china3	. #x85D6)	; &I-JC3-85D6;
    (=ucs@jis		. #x0106)	; &JX1-2A3C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with acute")
      (=jis-x0212	  . #x2B2B)	; &JX1-2A4B;
      (=jis-x0213-1-2000  . #x2A4B)	; &I-JX1-2A4B;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (=ucs		. #x0107)	; ć
    (latin-iso8859-2	. #xE6)	; &I-LATIN2-66;
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
    (=jis-x0212		. #x2B2B)	; &JX1-2A4B;
    (=jis-x0213-1-2000	. #x2A4B)	; &I-JX1-2A4B;
    (=jef-china3	. #x85EC)	; &I-JC3-85EC;
    (=ucs@jis		. #x0107)	; &JX1-2A4B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with circumflex")
      (=jis-x0212	  . #x2A2C)	; &JX1-2A59;
      (=jis-x0213-1-2000  . #x2A59)	; &I-JX1-2A59;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (=ucs		. #x0108)	; Ĉ
    (latin-iso8859-3	. #xC6)	; &I-LATIN3-46;
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
    (=jis-x0212		. #x2A2C)	; &JX1-2A59;
    (=jis-x0213-1-2000	. #x2A59)	; &I-JX1-2A59;
    (=jef-china3	. #x86B8)	; &I-JC3-86B8;
    (=ucs@jis		. #x0108)	; &JX1-2A59;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter c with circumflex")
      (=jis-x0212	  . #x2B2C)	; &JX1-2A5F;
      (=jis-x0213-1-2000  . #x2A5F)	; &I-JX1-2A5F;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (=ucs		. #x0109)	; ĉ
    (latin-iso8859-3	. #xE6)	; &I-LATIN3-66;
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
    (=jis-x0212		. #x2B2C)	; &JX1-2A5F;
    (=jis-x0213-1-2000	. #x2A5F)	; &I-JX1-2A5F;
    (=jef-china3	. #x86C5)	; &I-JC3-86C5;
    (=ucs@jis		. #x0109)	; &JX1-2A5F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with dot above")
      (=jis-x0212	  . #x2A2F)	; &JSP-2A2F;
      (=jef-china3	  . #x87FA)	; &I-JC3-87FA;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (=ucs		. #x010A)	; Ċ
    (latin-iso8859-3	. #xC5)	; &I-LATIN3-45;
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
    (=jis-x0212		. #x2A2F)	; &JSP-2A2F;
    (=jef-china3	. #x87FA)	; &I-JC3-87FA;
    (=ucs@jis		. #x010A)	; &JSP-2A2F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter c with dot above")
      (=jis-x0212	  . #x2B2F)	; &JSP-2B2F;
      (=jef-china3	  . #x88B2)	; &I-JC3-88B2;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (=ucs		. #x010B)	; ċ
    (latin-iso8859-3	. #xE5)	; &I-LATIN3-65;
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
    (=jis-x0212		. #x2B2F)	; &JSP-2B2F;
    (=jef-china3	. #x88B2)	; &I-JC3-88B2;
    (=ucs@jis		. #x010B)	; &JSP-2B2F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0043 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter c with caron")
      (=jis-x0212	  . #x2A2D)	; &JX1-2A3D;
      (=jis-x0213-1-2000  . #x2A3D)	; &I-JX1-2A3D;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (=ucs		. #x010C)	; Č
    (latin-iso8859-2	. #xC8)	; &I-LATIN2-48;
    (latin-iso8859-4	. #xC8)	; &I-LATIN4-48;
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
    (=jis-x0212		. #x2A2D)	; &JX1-2A3D;
    (=jis-x0213-1-2000	. #x2A3D)	; &I-JX1-2A3D;
    (=jef-china3	. #x88E0)	; &I-JC3-88E0;
    (=ucs@jis		. #x010C)	; &JX1-2A3D;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0063 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter c with caron")
      (=jis-x0212	  . #x2B2D)	; &JX1-2A4C;
      (=jis-x0213-1-2000  . #x2A4C)	; &I-JX1-2A4C;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (=ucs		. #x010D)	; č
    (latin-iso8859-2	. #xE8)	; &I-LATIN2-68;
    (latin-iso8859-4	. #xE8)	; &I-LATIN4-68;
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
    (=jis-x0212		. #x2B2D)	; &JX1-2A4C;
    (=jis-x0213-1-2000	. #x2A4C)	; &I-JX1-2A4C;
    (=jef-china3	. #x88EF)	; &I-JC3-88EF;
    (=ucs@jis		. #x010D)	; &JX1-2A4C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0044 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter d with caron")
      (=jis-x0212	  . #x2A30)	; &JX1-2A40;
      (=jis-x0213-1-2000  . #x2A40)	; &I-JX1-2A40;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (=ucs		. #x010E)	; Ď
    (latin-iso8859-2	. #xCF)	; &I-LATIN2-4F;
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
    (=jis-x0212		. #x2A30)	; &JX1-2A40;
    (=jis-x0213-1-2000	. #x2A40)	; &I-JX1-2A40;
    (=jef-china3	. #x88E1)	; &I-JC3-88E1;
    (=ucs@jis		. #x010E)	; &JX1-2A40;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0064 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter d with caron")
      (=jis-x0212	  . #x2B30)	; &JX1-2A4F;
      (=jis-x0213-1-2000  . #x2A4F)	; &I-JX1-2A4F;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (=ucs		. #x010F)	; ď
    (latin-iso8859-2	. #xEF)	; &I-LATIN2-6F;
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
    (=jis-x0212		. #x2B30)	; &JX1-2A4F;
    (=jis-x0213-1-2000	. #x2A4F)	; &I-JX1-2A4F;
    (=jef-china3	. #x88F0)	; &I-JC3-88F0;
    (=ucs@jis		. #x010F)	; &JX1-2A4F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER D WITH STROKE")
      (=jis-x0212	  . #x2922)	; &JSP-2922;
      (=jef-china3	  . #x83A3)	; &I-JC3-83A3;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (=ucs		. #x0110)	; Đ
    (latin-iso8859-2	. #xD0)	; &I-LATIN2-50;
    (latin-iso8859-4	. #xD0)	; &I-LATIN4-50;
    (latin-tcvn5712	. #xA7)	; &I-VSCII2-27;
    (latin-viscii	. #xD0)	; &MCS-00E927B0;
    (latin-viscii-upper . #xF0)	; &MCS-00E927B0;
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
    (=jis-x0212		. #x2922)	; &JSP-2922;
    (=jef-china3	. #x83A3)	; &I-JC3-83A3;
    (=ucs@jis		. #x0110)	; &JSP-2922;
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
    (latin-viscii	. #xF0)	; &MCS-00E92750;
    (latin-viscii-lower . #xF0)	; &MCS-00E92750;
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
    (=ks-x1001		. #x2922)	; &JX1-2A50;
    (=jis-x0212		. #x2942)	; &I-JSP-2942;
    (=jis-x0213-1-2000	. #x2A50)	; &I-JX1-2A50;
    (=jef-china3	. #x83AE)	; &I-JC3-83AE;
    (=ucs@jis		. #x0111)	; &JX1-2A50;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with macron")
      (=jis-x0212	  . #x2A37)	; &JX1-2978;
      (=jis-x0213-1-2000  . #x2978)	; &I-JX1-2978;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (=ucs		. #x0112)	; Ē
    (latin-iso8859-4	. #xAA)	; &I-LATIN4-2A;
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
    (=jis-x0212		. #x2A37)	; &JX1-2978;
    (=jis-x0213-1-2000	. #x2978)	; &I-JX1-2978;
    (=jef-china3	. #x87AB)	; &I-JC3-87AB;
    (=ucs@jis		. #x0112)	; &JX1-2978;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with macron")
      (=gb2312		  . #x2825)	; &JX1-297D;
      (=jis-x0212	  . #x2B37)	; &I-JSP-2B37;
      (=jis-x0213-1-2000  . #x297D)	; &I-JX1-297D;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (=ucs		. #x0113)	; ē
    (latin-iso8859-4	. #xBA)	; &I-LATIN4-3A;
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
    (=gb2312		. #x2825)	; &JX1-297D;
    (=jis-x0212		. #x2B37)	; &I-JSP-2B37;
    (=jis-x0213-1-2000	. #x297D)	; &I-JX1-297D;
    (=jef-china3	. #x87BF)	; &I-JC3-87BF;
    (=ucs@jis		. #x0113)	; &JX1-297D;
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
      (=jis-x0212	  . #x2A36)	; &JSP-2A36;
      (=jef-china3	  . #x87FC)	; &I-JC3-87FC;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (=ucs		. #x0116)	; Ė
    (latin-iso8859-4	. #xCC)	; &I-LATIN4-4C;
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
    (=jis-x0212		. #x2A36)	; &JSP-2A36;
    (=jef-china3	. #x87FC)	; &I-JC3-87FC;
    (=ucs@jis		. #x0116)	; &JSP-2A36;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER E WITH DOT ABOVE")
      (=jis-x0212	  . #x2B36)	; &JSP-2B36;
      (=jef-china3	  . #x88B4)	; &I-JC3-88B4;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (=ucs		. #x0117)	; ė
    (latin-iso8859-4	. #xEC)	; &I-LATIN4-6C;
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
    (=jis-x0212		. #x2B36)	; &JSP-2B36;
    (=jef-china3	. #x88B4)	; &I-JC3-88B4;
    (=ucs@jis		. #x0117)	; &JSP-2B36;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with ogonek")
      (=jis-x0212	  . #x2A38)	; &JX1-2A3E;
      (=jis-x0213-1-2000  . #x2A3E)	; &I-JX1-2A3E;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (=ucs		. #x0118)	; Ę
    (latin-iso8859-2	. #xCA)	; &I-LATIN2-4A;
    (latin-iso8859-4	. #xCA)	; &I-LATIN4-4A;
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
    (=jis-x0212		. #x2A38)	; &JX1-2A3E;
    (=jis-x0213-1-2000	. #x2A3E)	; &I-JX1-2A3E;
    (=jef-china3	. #x8AA4)	; &I-JC3-8AA4;
    (=ucs@jis		. #x0118)	; &JX1-2A3E;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with ogonek")
      (=jis-x0212	  . #x2B38)	; &JX1-2A4D;
      (=jis-x0213-1-2000  . #x2A4D)	; &I-JX1-2A4D;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (=ucs		. #x0119)	; ę
    (latin-iso8859-2	. #xEA)	; &I-LATIN2-6A;
    (latin-iso8859-4	. #xEA)	; &I-LATIN4-6A;
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
    (=jis-x0212		. #x2B38)	; &JX1-2A4D;
    (=jis-x0213-1-2000	. #x2A4D)	; &I-JX1-2A4D;
    (=jef-china3	. #x8AAC)	; &I-JC3-8AAC;
    (=ucs@jis		. #x0119)	; &JX1-2A4D;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0045 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter e with caron")
      (=jis-x0212	  . #x2A35)	; &JX1-2A3F;
      (=jis-x0213-1-2000  . #x2A3F)	; &I-JX1-2A3F;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (=ucs		. #x011A)	; Ě
    (latin-iso8859-2	. #xCC)	; &I-LATIN2-4C;
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
    (=jis-x0212		. #x2A35)	; &JX1-2A3F;
    (=jis-x0213-1-2000	. #x2A3F)	; &I-JX1-2A3F;
    (=jef-china3	. #x88E2)	; &I-JC3-88E2;
    (=ucs@jis		. #x011A)	; &JX1-2A3F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0065 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter e with caron")
      (=gb2312		  . #x2827)	; &JX1-2A4E;
      (=jis-x0212	  . #x2B35)	; &I-JSP-2B35;
      (=jis-x0213-1-2000  . #x2A4E)	; &I-JX1-2A4E;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (=ucs		. #x011B)	; ě
    (latin-iso8859-2	. #xEC)	; &I-LATIN2-6C;
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
    (=gb2312		. #x2827)	; &JX1-2A4E;
    (=jis-x0212		. #x2B35)	; &I-JSP-2B35;
    (=jis-x0213-1-2000	. #x2A4E)	; &I-JX1-2A4E;
    (=jef-china3	. #x88F1)	; &I-JC3-88F1;
    (=ucs@jis		. #x011B)	; &JX1-2A4E;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with circumflex")
      (=jis-x0212	  . #x2A3A)	; &JX1-2A5A;
      (=jis-x0213-1-2000  . #x2A5A)	; &I-JX1-2A5A;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (=ucs		. #x011C)	; Ĝ
    (latin-iso8859-3	. #xD8)	; &I-LATIN3-58;
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
    (=jis-x0212		. #x2A3A)	; &JX1-2A5A;
    (=jis-x0213-1-2000	. #x2A5A)	; &I-JX1-2A5A;
    (=jef-china3	. #x86BA)	; &I-JC3-86BA;
    (=ucs@jis		. #x011C)	; &JX1-2A5A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter g with circumflex")
      (=jis-x0212	  . #x2B3A)	; &JX1-2A60;
      (=jis-x0213-1-2000  . #x2A60)	; &I-JX1-2A60;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (=ucs		. #x011D)	; ĝ
    (latin-iso8859-3	. #xF8)	; &I-LATIN3-78;
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
    (=jis-x0212		. #x2B3A)	; &JX1-2A60;
    (=jis-x0213-1-2000	. #x2A60)	; &I-JX1-2A60;
    (=jef-china3	. #x86C7)	; &I-JC3-86C7;
    (=ucs@jis		. #x011D)	; &JX1-2A60;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0306)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH BREVE")
      (=jis-x0212	  . #x2A3B)	; &JSP-2A3B;
      (=jef-china3	  . #x87E1)	; &I-JC3-87E1;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (=ucs		. #x011E)	; Ğ
    (latin-iso8859-3	. #xAB)	; &I-LATIN3-2B;
    (latin-iso8859-9	. #xD0)	; &I-LATIN5-50;
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
    (=jis-x0212		. #x2A3B)	; &JSP-2A3B;
    (=jef-china3	. #x87E1)	; &I-JC3-87E1;
    (=ucs@jis		. #x011E)	; &JSP-2A3B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G WITH BREVE")
      (=jis-x0212	  . #x2B3B)	; &JSP-2B3B;
      (=jef-china3	  . #x87EB)	; &I-JC3-87EB;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (=ucs		. #x011F)	; ğ
    (latin-iso8859-3	. #xBB)	; &I-LATIN3-3B;
    (latin-iso8859-9	. #xF0)	; &I-LATIN5-70;
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
    (=jis-x0212		. #x2B3B)	; &JSP-2B3B;
    (=jef-china3	. #x87EB)	; &I-JC3-87EB;
    (=ucs@jis		. #x011F)	; &JSP-2B3B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=jis-x0212	  . #x2A3D)	; &JSP-2A3D;
      (=jef-china3	  . #x87FE)	; &I-JC3-87FE;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (=ucs		. #x0120)	; Ġ
    (latin-iso8859-3	. #xD5)	; &I-LATIN3-55;
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
    (=jis-x0212		. #x2A3D)	; &JSP-2A3D;
    (=jef-china3	. #x87FE)	; &I-JC3-87FE;
    (=ucs@jis		. #x0120)	; &JSP-2A3D;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0067 #x0307)
    (->fullwidth
     ((name . "FULLWIDTH LATIN SMALL LETTER G WITH DOT ABOVE")
      (=jis-x0212	  . #x2B3D)	; &JSP-2B3D;
      (=jef-china3	  . #x88B6)	; &I-JC3-88B6;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (=ucs		. #x0121)	; ġ
    (latin-iso8859-3	. #xF5)	; &I-LATIN3-75;
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
    (=jis-x0212		. #x2B3D)	; &JSP-2B3D;
    (=jef-china3	. #x88B6)	; &I-JC3-88B6;
    (=ucs@jis		. #x0121)	; &JSP-2B3D;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0047 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter g with cedilla")
      (=jis-x0212	  . #x2A3C)	; &JSP-2A3C;
      (=ucs@jis		  . #x0122)	; &JSP-2A3C;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CEDILLA")
      (=ucs		  . #x0123)	; ģ
      ))
    (=ucs		. #x0122)	; Ģ
    (latin-iso8859-4	. #xAB)	; &I-LATIN4-2B;
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
    (=jis-x0212		. #x2A3C)	; &JSP-2A3C;
    (=ucs@jis		. #x0122)	; &JSP-2A3C;
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
    (->fullwidth
     ((name . "fullwidth latin capital letter h with circumflex")
      (=jis-x0212	  . #x2A3E)	; &JX1-2A5B;
      (=jis-x0213-1-2000  . #x2A5B)	; &I-JX1-2A5B;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (=ucs		. #x0124)	; Ĥ
    (latin-iso8859-3	. #xA6)	; &I-LATIN3-26;
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
    (=jis-x0212		. #x2A3E)	; &JX1-2A5B;
    (=jis-x0213-1-2000	. #x2A5B)	; &I-JX1-2A5B;
    (=jef-china3	. #x86BB)	; &I-JC3-86BB;
    (=ucs@jis		. #x0124)	; &JX1-2A5B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0068 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter h with circumflex")
      (=jis-x0212	  . #x2B3E)	; &JX1-2A61;
      (=jis-x0213-1-2000  . #x2A61)	; &I-JX1-2A61;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (=ucs		. #x0125)	; ĥ
    (latin-iso8859-3	. #xB6)	; &I-LATIN3-36;
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
    (=jis-x0212		. #x2B3E)	; &JX1-2A61;
    (=jis-x0213-1-2000	. #x2A61)	; &I-JX1-2A61;
    (=jef-china3	. #x86C8)	; &I-JC3-86C8;
    (=ucs@jis		. #x0125)	; &JX1-2A61;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter h with stroke")
      (=ks-x1001	  . #x2824)	; &JSP-2924;
      (=jis-x0212	  . #x2924)	; &I-JSP-2924;
      (=ucs@jis		  . #x0126)	; &JSP-2924;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=ucs		. #x0126)	; Ħ
    (latin-iso8859-3	. #xA1)	; &I-LATIN3-21;
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
    (=ks-x1001		. #x2824)	; &JSP-2924;
    (=jis-x0212		. #x2924)	; &I-JSP-2924;
    (=ucs@jis		. #x0126)	; &JSP-2924;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter h with stroke")
      (=ks-x1001	  . #x2924)	; &JX1-2A7D;
      (=jis-x0212	  . #x2944)	; &I-JSP-2944;
      (=jis-x0213-1-2000  . #x2A7D)	; &I-JX1-2A7D;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (=ucs		. #x0127)	; ħ
    (latin-iso8859-3	. #xB1)	; &I-LATIN3-31;
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
    (=ks-x1001		. #x2924)	; &JX1-2A7D;
    (=jis-x0212		. #x2944)	; &I-JSP-2944;
    (=jis-x0213-1-2000	. #x2A7D)	; &I-JX1-2A7D;
    (=ucs@jis		. #x0127)	; &JX1-2A7D;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with tilde")
      (=jis-x0212	  . #x2A47)	; &JSP-2A47;
      (=jef-china3	  . #x86E5)	; &I-JC3-86E5;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (=ucs		. #x0128)	; Ĩ
    (latin-iso8859-4	. #xA5)	; &I-LATIN4-25;
    (latin-viscii	. #xCE)	; &MCS-00E927AE;
    (latin-viscii-upper . #xEE)	; &MCS-00E927AE;
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
    (=jis-x0212		. #x2A47)	; &JSP-2A47;
    (=jef-china3	. #x86E5)	; &I-JC3-86E5;
    (=ucs@jis		. #x0128)	; &JSP-2A47;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with tilde")
      (=jis-x0212	  . #x2B47)	; &JSP-2B47;
      (=ucs@jis		  . #x0129)	; &JSP-2B47;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (=ucs		. #x0129)	; ĩ
    (latin-iso8859-4	. #xB5)	; &I-LATIN4-35;
    (latin-tcvn5712	. #xDC)	; &I-VSCII2-5C;
    (latin-viscii	. #xEE)	; &MCS-00E9274E;
    (latin-viscii-lower . #xEE)	; &MCS-00E9274E;
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
    (=jis-x0212		. #x2B47)	; &JSP-2B47;
    (=ucs@jis		. #x0129)	; &JSP-2B47;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with macron")
      (=jis-x0212	  . #x2A45)	; &JX1-2976;
      (=jis-x0213-1-2000  . #x2976)	; &I-JX1-2976;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (=ucs		. #x012A)	; Ī
    (latin-iso8859-4	. #xCF)	; &I-LATIN4-4F;
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
    (=jis-x0212		. #x2A45)	; &JX1-2976;
    (=jis-x0213-1-2000	. #x2976)	; &I-JX1-2976;
    (=jef-china3	. #x87AD)	; &I-JC3-87AD;
    (=ucs@jis		. #x012A)	; &JX1-2976;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with macron")
      (=gb2312		  . #x2829)	; &JX1-297B;
      (=jis-x0212	  . #x2B45)	; &I-JSP-2B45;
      (=jis-x0213-1-2000  . #x297B)	; &I-JX1-297B;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (=ucs		. #x012B)	; ī
    (latin-iso8859-4	. #xEF)	; &I-LATIN4-6F;
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
    (=gb2312		. #x2829)	; &JX1-297B;
    (=jis-x0212		. #x2B45)	; &I-JSP-2B45;
    (=jis-x0213-1-2000	. #x297B)	; &I-JX1-297B;
    (=ucs@jis		. #x012B)	; &JX1-297B;
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
      (=jis-x0212	  . #x2A46)	; &JSP-2A46;
      (=jef-china3	  . #x8AA6)	; &I-JC3-8AA6;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (=ucs		. #x012E)	; Į
    (latin-iso8859-4	. #xC7)	; &I-LATIN4-47;
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
    (=jis-x0212		. #x2A46)	; &JSP-2A46;
    (=jef-china3	. #x8AA6)	; &I-JC3-8AA6;
    (=ucs@jis		. #x012E)	; &JSP-2A46;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0069 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter i with ogonek")
      (=jis-x0212	  . #x2B46)	; &JSP-2B46;
      (=jef-china3	  . #x8AAE)	; &I-JC3-8AAE;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (=ucs		. #x012F)	; į
    (latin-iso8859-4	. #xE7)	; &I-LATIN4-67;
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
    (=jis-x0212		. #x2B46)	; &JSP-2B46;
    (=jef-china3	. #x8AAE)	; &I-JC3-8AAE;
    (=ucs@jis		. #x012F)	; &JSP-2B46;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0049 #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter i with dot above")
      (=jis-x0212	  . #x2A44)	; &JSP-2A44;
      (=jef-china3	  . #x88A2)	; &I-JC3-88A2;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    (=ucs		. #x0130)	; İ
    (latin-iso8859-3	. #xA9)	; &I-LATIN3-29;
    (latin-iso8859-9	. #xDD)	; &I-LATIN5-5D;
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
    (=jis-x0212		. #x2A44)	; &JSP-2A44;
    (=jef-china3	. #x88A2)	; &I-JC3-88A2;
    (=ucs@jis		. #x0130)	; &JSP-2A44;
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
  '((name		. "fullwidth latin small letter dotless i")
    (=>ucs		. #x0131)	; ı
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "fullwidth latin capital letter dotless i")
      ))
    (=ks-x1001		. #x2925)	; &JSP-2945;
    (=jis-x0212		. #x2945)	; &I-JSP-2945;
    (=jef-china3	. #x83B3)	; &I-JC3-83B3;
    (=ucs@jis		. #x0131)	; &JSP-2945;
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
    (=ks-x1001		. #x2826)	; &I-K0-2826;
    (=jis-x0212		. #x2926)	; &I-JSP-2926;
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0069 #x006A)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature ij")
      (=ks-x1001	  . #x2926)	; &JSP-2946;
      (=jis-x0212	  . #x2946)	; &I-JSP-2946;
      (=ucs@jis		  . #x0133)	; &JSP-2946;
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
    (=ks-x1001		. #x2926)	; &JSP-2946;
    (=jis-x0212		. #x2946)	; &I-JSP-2946;
    (=ucs@jis		. #x0133)	; &JSP-2946;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004A #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter j with circumflex")
      (=jis-x0212	  . #x2A48)	; &JX1-2A5C;
      (=jis-x0213-1-2000  . #x2A5C)	; &I-JX1-2A5C;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (=ucs		. #x0134)	; Ĵ
    (latin-iso8859-3	. #xAC)	; &I-LATIN3-2C;
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
    (=jis-x0212		. #x2A48)	; &JX1-2A5C;
    (=jis-x0213-1-2000	. #x2A5C)	; &I-JX1-2A5C;
    (=jef-china3	. #x86BD)	; &I-JC3-86BD;
    (=ucs@jis		. #x0134)	; &JX1-2A5C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006A #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter j with circumflex")
      (=jis-x0212	  . #x2B48)	; &JX1-2A62;
      (=jis-x0213-1-2000  . #x2A62)	; &I-JX1-2A62;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (=ucs		. #x0135)	; ĵ
    (latin-iso8859-3	. #xBC)	; &I-LATIN3-3C;
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
    (=jis-x0212		. #x2B48)	; &JX1-2A62;
    (=jis-x0213-1-2000	. #x2A62)	; &I-JX1-2A62;
    (=jef-china3	. #x86CA)	; &I-JC3-86CA;
    (=ucs@jis		. #x0135)	; &JX1-2A62;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004B #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter k with cedilla")
      (=jis-x0212	  . #x2A49)	; &JSP-2A49;
      (=ucs@jis		  . #x0136)	; &JSP-2A49;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (=ucs		. #x0136)	; Ķ
    (latin-iso8859-4	. #xD3)	; &I-LATIN4-53;
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
    (=jis-x0212		. #x2A49)	; &JSP-2A49;
    (=ucs@jis		. #x0136)	; &JSP-2A49;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006B #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter k with cedilla")
      (=jis-x0212	  . #x2B49)	; &JSP-2B49;
      (=ucs@jis		  . #x0137)	; &JSP-2B49;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (=ucs		. #x0137)	; ķ
    (latin-iso8859-4	. #xF3)	; &I-LATIN4-73;
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
    (=jis-x0212		. #x2B49)	; &JSP-2B49;
    (=ucs@jis		. #x0137)	; &JSP-2B49;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (->fullwidth
     ((name		  . "fullwidth latin small letter kra")
      (=ks-x1001	  . #x2927)	; &JSP-2947;
      (=jis-x0212	  . #x2947)	; &I-JSP-2947;
      (=ucs@jis		  . #x0138)	; &JSP-2947;
      ))
    (=ucs		. #x0138)	; ĸ
    (latin-iso8859-4	. #xA2)	; &I-LATIN4-22;
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
    (=ks-x1001		. #x2927)	; &JSP-2947;
    (=jis-x0212		. #x2947)	; &I-JSP-2947;
    (=ucs@jis		. #x0138)	; &JSP-2947;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with acute")
      (=jis-x0212	  . #x2A4A)	; &JX1-2A3B;
      (=jis-x0213-1-2000  . #x2A3B)	; &I-JX1-2A3B;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (=ucs		. #x0139)	; Ĺ
    (latin-iso8859-2	. #xC5)	; &I-LATIN2-45;
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
    (=jis-x0212		. #x2A4A)	; &JX1-2A3B;
    (=jis-x0213-1-2000	. #x2A3B)	; &I-JX1-2A3B;
    (=jef-china3	. #x85DD)	; &I-JC3-85DD;
    (=ucs@jis		. #x0139)	; &JX1-2A3B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with acute")
      (=jis-x0212	  . #x2B4A)	; &JX1-2A4A;
      (=jis-x0213-1-2000  . #x2A4A)	; &I-JX1-2A4A;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (=ucs		. #x013A)	; ĺ
    (latin-iso8859-2	. #xE5)	; &I-LATIN2-65;
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
    (=jis-x0212		. #x2B4A)	; &JX1-2A4A;
    (=jis-x0213-1-2000	. #x2A4A)	; &I-JX1-2A4A;
    (=jef-china3	. #x85F3)	; &I-JC3-85F3;
    (=ucs@jis		. #x013A)	; &JX1-2A4A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with cedilla")
      (=jis-x0212	  . #x2A4C)	; &JSP-2A4C;
      (=jef-china3	  . #x89F8)	; &I-JC3-89F8;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (=ucs		. #x013B)	; Ļ
    (latin-iso8859-4	. #xA6)	; &I-LATIN4-26;
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
    (=jis-x0212		. #x2A4C)	; &JSP-2A4C;
    (=jef-china3	. #x89F8)	; &I-JC3-89F8;
    (=ucs@jis		. #x013B)	; &JSP-2A4C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter l with cedilla")
      (=jis-x0212	  . #x2B4C)	; &JSP-2B4C;
      (=jef-china3	  . #x89FE)	; &I-JC3-89FE;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (=ucs		. #x013C)	; ļ
    (latin-iso8859-4	. #xB6)	; &I-LATIN4-36;
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
    (=jis-x0212		. #x2B4C)	; &JSP-2B4C;
    (=jef-china3	. #x89FE)	; &I-JC3-89FE;
    (=ucs@jis		. #x013C)	; &JSP-2B4C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004C #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with caron")
      (=jis-x0212	  . #x2A4B)	; &JX1-2A24;
      (=jis-x0213-1-2000  . #x2A24)	; &I-JX1-2A24;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (=ucs		. #x013D)	; Ľ
    (latin-iso8859-2	. #xA5)	; &I-LATIN2-25;
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
    (=jis-x0212		. #x2A4B)	; &JX1-2A24;
    (=jis-x0213-1-2000	. #x2A24)	; &I-JX1-2A24;
    (=jef-china3	. #x88E6)	; &I-JC3-88E6;
    (=ucs@jis		. #x013D)	; &JX1-2A24;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006C #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with caron")
      (=jis-x0212	  . #x2B4B)	; &JX1-2A2F;
      (=jis-x0213-1-2000  . #x2A2F)	; &I-JX1-2A2F;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (=ucs		. #x013E)	; ľ
    (latin-iso8859-2	. #xB5)	; &I-LATIN2-35;
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
    (=jis-x0212		. #x2B4B)	; &JX1-2A2F;
    (=jis-x0213-1-2000	. #x2A2F)	; &I-JX1-2A2F;
    (=jef-china3	. #x88F5)	; &I-JC3-88F5;
    (=ucs@jis		. #x013E)	; &JX1-2A2F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x004C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with middle dot")
      (=ks-x1001	  . #x2828)	; &JSP-2929;
      (=jis-x0212	  . #x2929)	; &I-JSP-2929;
      (=ucs@jis		  . #x013F)	; &JSP-2929;
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
    (=ks-x1001		. #x2828)	; &JSP-2929;
    (=jis-x0212		. #x2929)	; &I-JSP-2929;
    (=ucs@jis		. #x013F)	; &JSP-2929;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x006C #x00B7)
    (->fullwidth
     ((name . "fullwidth latin small letter l with middle dot")
      (=ks-x1001	  . #x2928)	; &JSP-2949;
      (=jis-x0212	  . #x2949)	; &I-JSP-2949;
      (=ucs@jis		  . #x0140)	; &JSP-2949;
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
    (=ks-x1001		. #x2928)	; &JSP-2949;
    (=jis-x0212		. #x2949)	; &I-JSP-2949;
    (=ucs@jis		. #x0140)	; &JSP-2949;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter l with stroke")
      (=ks-x1001	  . #x2829)	; &JX1-2A23;
      (=jis-x0212	  . #x2928)	; &I-JSP-2928;
      (=jis-x0213-1-2000  . #x2A23)	; &I-JX1-2A23;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (=ucs		. #x0141)	; Ł
    (latin-iso8859-2	. #xA3)	; &I-LATIN2-23;
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
    (=ks-x1001		. #x2829)	; &JX1-2A23;
    (=jis-x0212		. #x2928)	; &I-JSP-2928;
    (=jis-x0213-1-2000	. #x2A23)	; &I-JX1-2A23;
    (=jef-china3	. #x83A1)	; &I-JC3-83A1;
    (=ucs@jis		. #x0141)	; &JX1-2A23;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter l with stroke")
      (=ks-x1001	  . #x2929)	; &JX1-2A2E;
      (=jis-x0212	  . #x2948)	; &I-JSP-2948;
      (=jis-x0213-1-2000  . #x2A2E)	; &I-JX1-2A2E;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (=ucs		. #x0142)	; ł
    (latin-iso8859-2	. #xB3)	; &I-LATIN2-33;
    ))
(define-char
  '((=>ucs		. #x0142)	; ł
    (=jef-china3	. #x83AC)	; &JC3-83AC;
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
    (=ks-x1001		. #x2929)	; &JX1-2A2E;
    (=jis-x0212		. #x2948)	; &I-JSP-2948;
    (=jis-x0213-1-2000	. #x2A2E)	; &I-JX1-2A2E;
    (=ucs@jis		. #x0142)	; &JX1-2A2E;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with acute")
      (=jis-x0212	  . #x2A4D)	; &JX1-2A41;
      (=jis-x0213-1-2000  . #x2A41)	; &I-JX1-2A41;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (=ucs		. #x0143)	; Ń
    (latin-iso8859-2	. #xD1)	; &I-LATIN2-51;
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
    (=jis-x0212		. #x2A4D)	; &JX1-2A41;
    (=jis-x0213-1-2000	. #x2A41)	; &I-JX1-2A41;
    (=jef-china3	. #x85DF)	; &I-JC3-85DF;
    (=ucs@jis		. #x0143)	; &JX1-2A41;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with acute")
      (=jis-x0212	  . #x2B4D)	; &JX1-2A51;
      (=jis-x0213-1-2000  . #x2A51)	; &I-JX1-2A51;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (=ucs		. #x0144)	; ń
    (latin-iso8859-2	. #xF1)	; &I-LATIN2-71;
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
    (=jis-x0212		. #x2B4D)	; &JX1-2A51;
    (=jis-x0213-1-2000	. #x2A51)	; &I-JX1-2A51;
    (=jef-china3	. #x85F5)	; &I-JC3-85F5;
    (=ucs@jis		. #x0144)	; &JX1-2A51;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with cedilla")
      (=jis-x0212	  . #x2A4F)	; &JSP-2A4F;
      (=jef-china3	  . #x89F9)	; &I-JC3-89F9;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (=ucs		. #x0145)	; Ņ
    (latin-iso8859-4	. #xD1)	; &I-LATIN4-51;
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
    (=jis-x0212		. #x2A4F)	; &JSP-2A4F;
    (=jef-china3	. #x89F9)	; &I-JC3-89F9;
    (=ucs@jis		. #x0145)	; &JSP-2A4F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter n with cedilla")
      (=jis-x0212	  . #x2B4F)	; &JSP-2B4F;
      (=jef-china3	  . #x8AA1)	; &I-JC3-8AA1;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (=ucs		. #x0146)	; ņ
    (latin-iso8859-4	. #xF1)	; &I-LATIN4-71;
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
    (=jis-x0212		. #x2B4F)	; &JSP-2B4F;
    (=jef-china3	. #x8AA1)	; &I-JC3-8AA1;
    (=ucs@jis		. #x0146)	; &JSP-2B4F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004E #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter n with caron")
      (=jis-x0212	  . #x2A4E)	; &JX1-2A42;
      (=jis-x0213-1-2000  . #x2A42)	; &I-JX1-2A42;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (=ucs		. #x0147)	; Ň
    (latin-iso8859-2	. #xD2)	; &I-LATIN2-52;
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
    (=jis-x0212		. #x2A4E)	; &JX1-2A42;
    (=jis-x0213-1-2000	. #x2A42)	; &I-JX1-2A42;
    (=jef-china3	. #x88E7)	; &I-JC3-88E7;
    (=ucs@jis		. #x0147)	; &JX1-2A42;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006E #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter n with caron")
      (=jis-x0212	  . #x2B4E)	; &JX1-2A52;
      (=jis-x0213-1-2000  . #x2A52)	; &I-JX1-2A52;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (=ucs		. #x0148)	; ň
    (latin-iso8859-2	. #xF2)	; &I-LATIN2-72;
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
    (=jis-x0212		. #x2B4E)	; &JX1-2A52;
    (=jis-x0213-1-2000	. #x2A52)	; &I-JX1-2A52;
    (=jef-china3	. #x88F6)	; &I-JC3-88F6;
    (=ucs@jis		. #x0148)	; &JX1-2A52;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x02BC #x006E)
    (->fullwidth
     ((name . "fullwidth latin small letter n preceded by apostrophe")
      (=ks-x1001	  . #x2930)	; &JSP-294A;
      (=jis-x0212	  . #x294A)	; &I-JSP-294A;
      (=ucs@jis		  . #x0149)	; &JSP-294A;
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
    (=ks-x1001		. #x2930)	; &JSP-294A;
    (=jis-x0212		. #x294A)	; &I-JSP-294A;
    (=ucs@jis		. #x0149)	; &JSP-294A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin capital letter eng")
      (=ks-x1001	  . #x282F)	; &JSP-292B;
      (=jis-x0212	  . #x292B)	; &I-JSP-292B;
      (=ucs@jis		  . #x014A)	; &JSP-292B;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (=ucs		. #x014A)	; Ŋ
    (latin-iso8859-4	. #xBD)	; &I-LATIN4-3D;
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
    (=ks-x1001		. #x282F)	; &JSP-292B;
    (=jis-x0212		. #x292B)	; &I-JSP-292B;
    (=ucs@jis		. #x014A)	; &JSP-292B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (->fullwidth
     ((name		  . "fullwidth latin small letter eng")
      (=ks-x1001	  . #x292F)	; &JX1-2A7A;
      (=jis-x0212	  . #x294B)	; &I-JSP-294B;
      (=jis-x0213-1-2000  . #x2A7A)	; &I-JX1-2A7A;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (=ucs		. #x014B)	; ŋ
    (latin-iso8859-4	. #xBF)	; &I-LATIN4-3F;
    (ipa		. #xD5)	; &I-MULE-IPA-55;
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
    (=ks-x1001		. #x292F)	; &JX1-2A7A;
    (=jis-x0212		. #x294B)	; &I-JSP-294B;
    (=jis-x0213-1-2000	. #x2A7A)	; &I-JX1-2A7A;
    (=ucs@jis		. #x014B)	; &JX1-2A7A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x004F #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter o with macron")
      (=jis-x0212	  . #x2A57)	; &JX1-2979;
      (=jis-x0213-1-2000  . #x2979)	; &I-JX1-2979;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (=ucs		. #x014C)	; Ō
    (latin-iso8859-4	. #xD2)	; &I-LATIN4-52;
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
    (=jis-x0212		. #x2A57)	; &JX1-2979;
    (=jis-x0213-1-2000	. #x2979)	; &I-JX1-2979;
    (=jef-china3	. #x87B3)	; &I-JC3-87B3;
    (=ucs@jis		. #x014C)	; &JX1-2979;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter o with macron")
      (=gb2312		  . #x282D)	; &JX1-297E;
      (=jis-x0212	  . #x2B57)	; &I-JSP-2B57;
      (=jis-x0213-1-2000  . #x297E)	; &I-JX1-297E;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (=ucs		. #x014D)	; ō
    (latin-iso8859-4	. #xF2)	; &I-LATIN4-72;
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
    (=gb2312		. #x282D)	; &JX1-297E;
    (=jis-x0212		. #x2B57)	; &I-JSP-2B57;
    (=jis-x0213-1-2000	. #x297E)	; &I-JX1-297E;
    (=jef-china3	. #x87C7)	; &I-JC3-87C7;
    (=ucs@jis		. #x014D)	; &JX1-297E;
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
      (=jis-x0212	  . #x2A56)	; &JX1-2A43;
      (=jis-x0213-1-2000  . #x2A43)	; &I-JX1-2A43;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (=ucs		. #x0150)	; Ő
    (latin-iso8859-2	. #xD5)	; &I-LATIN2-55;
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
    (=jis-x0212		. #x2A56)	; &JX1-2A43;
    (=jis-x0213-1-2000	. #x2A43)	; &I-JX1-2A43;
    (=jef-china3	. #x89E2)	; &I-JC3-89E2;
    (=ucs@jis		. #x0150)	; &JX1-2A43;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x006F #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter o with double acute")
      (=jis-x0212	  . #x2B56)	; &JX1-2A53;
      (=jis-x0213-1-2000  . #x2A53)	; &I-JX1-2A53;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (=ucs		. #x0151)	; ő
    (latin-iso8859-2	. #xF5)	; &I-LATIN2-75;
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
    (=jis-x0212		. #x2B56)	; &JX1-2A53;
    (=jis-x0213-1-2000	. #x2A53)	; &I-JX1-2A53;
    (=jef-china3	. #x89E5)	; &I-JC3-89E5;
    (=ucs@jis		. #x0151)	; &JX1-2A53;
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
    (=ks-x1001		. #x282B)	; &I-K0-282B;
    (=jis-x0212		. #x292D)	; &I-JSP-292D;
    (=jis-x0213-1-2000	. #x2B2B)	; &I-JX1-2B2B;
    (=jef-china3	. #x83A6)	; &I-JC3-83A6;
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small ligature oe")
      (=ks-x1001	  . #x292B)	; &JX1-2B2A;
      (=jis-x0212	  . #x294D)	; &I-JSP-294D;
      (=jis-x0213-1-2000  . #x2B2A)	; &I-JX1-2B2A;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (=ucs		. #x0153)	; œ
    (ipa		. #xB0)	; &I-MULE-IPA-30;
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
    (=ks-x1001		. #x292B)	; &JX1-2B2A;
    (=jis-x0212		. #x294D)	; &I-JSP-294D;
    (=jis-x0213-1-2000	. #x2B2A)	; &I-JX1-2B2A;
    (=jef-china3	. #x83B1)	; &I-JC3-83B1;
    (=ucs@jis		. #x0153)	; &JX1-2B2A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with acute")
      (=jis-x0212	  . #x2A59)	; &JX1-2A39;
      (=jis-x0213-1-2000  . #x2A39)	; &I-JX1-2A39;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (=ucs		. #x0154)	; Ŕ
    (latin-iso8859-2	. #xC0)	; &I-LATIN2-40;
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
    (=jis-x0212		. #x2A59)	; &JX1-2A39;
    (=jis-x0213-1-2000	. #x2A39)	; &I-JX1-2A39;
    (=jef-china3	. #x85E3)	; &I-JC3-85E3;
    (=ucs@jis		. #x0154)	; &JX1-2A39;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with acute")
      (=jis-x0212	  . #x2B59)	; &JX1-2A48;
      (=jis-x0213-1-2000  . #x2A48)	; &I-JX1-2A48;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (=ucs		. #x0155)	; ŕ
    (latin-iso8859-2	. #xE0)	; &I-LATIN2-60;
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
    (=jis-x0212		. #x2B59)	; &JX1-2A48;
    (=jis-x0213-1-2000	. #x2A48)	; &I-JX1-2A48;
    (=jef-china3	. #x85F9)	; &I-JC3-85F9;
    (=ucs@jis		. #x0155)	; &JX1-2A48;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with cedilla")
      (=jis-x0212	  . #x2A5B)	; &JSP-2A5B;
      (=ucs@jis		  . #x0156)	; &JSP-2A5B;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (=ucs		. #x0156)	; Ŗ
    (latin-iso8859-4	. #xA3)	; &I-LATIN4-23;
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
    (=jis-x0212		. #x2A5B)	; &JSP-2A5B;
    (=ucs@jis		. #x0156)	; &JSP-2A5B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter r with cedilla")
      (=jis-x0212	  . #x2B5B)	; &JSP-2B5B;
      (=ucs@jis		  . #x0157)	; &JSP-2B5B;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (=ucs		. #x0157)	; ŗ
    (latin-iso8859-4	. #xB3)	; &I-LATIN4-33;
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
    (=jis-x0212		. #x2B5B)	; &JSP-2B5B;
    (=ucs@jis		. #x0157)	; &JSP-2B5B;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0052 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter r with caron")
      (=jis-x0212	  . #x2A5A)	; &JX1-2A44;
      (=jis-x0213-1-2000  . #x2A44)	; &I-JX1-2A44;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (=ucs		. #x0158)	; Ř
    (latin-iso8859-2	. #xD8)	; &I-LATIN2-58;
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
    (=jis-x0212		. #x2A5A)	; &JX1-2A44;
    (=jis-x0213-1-2000	. #x2A44)	; &I-JX1-2A44;
    (=jef-china3	. #x88E9)	; &I-JC3-88E9;
    (=ucs@jis		. #x0158)	; &JX1-2A44;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0072 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter r with caron")
      (=jis-x0212	  . #x2B5A)	; &JX1-2A54;
      (=jis-x0213-1-2000  . #x2A54)	; &I-JX1-2A54;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (=ucs		. #x0159)	; ř
    (latin-iso8859-2	. #xF8)	; &I-LATIN2-78;
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
    (=jis-x0212		. #x2B5A)	; &JX1-2A54;
    (=jis-x0213-1-2000	. #x2A54)	; &I-JX1-2A54;
    (=jef-china3	. #x88F8)	; &I-JC3-88F8;
    (=ucs@jis		. #x0159)	; &JX1-2A54;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with acute")
      (=jis-x0212	  . #x2A5C)	; &JX1-2A25;
      (=jis-x0213-1-2000  . #x2A25)	; &I-JX1-2A25;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (=ucs		. #x015A)	; Ś
    (latin-iso8859-2	. #xA6)	; &I-LATIN2-26;
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
    (=jis-x0212		. #x2A5C)	; &JX1-2A25;
    (=jis-x0213-1-2000	. #x2A25)	; &I-JX1-2A25;
    (=jef-china3	. #x85E4)	; &I-JC3-85E4;
    (=ucs@jis		. #x015A)	; &JX1-2A25;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with acute")
      (=jis-x0212	  . #x2B5C)	; &JSP-2B5C;
      (=jef-china3	  . #x85FA)	; &I-JC3-85FA;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (=ucs		. #x015B)	; ś
    (=jis-x0213-1-2000	. #x2A30)	; &I-JX1-2A30;
    (latin-iso8859-2	. #xB6)	; &I-LATIN2-36;
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
    (=jis-x0212		. #x2B5C)	; &JSP-2B5C;
    (=jef-china3	. #x85FA)	; &I-JC3-85FA;
    (=ucs@jis		. #x015B)	; &JSP-2B5C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with circumflex")
      (=jis-x0212	  . #x2A5D)	; &JX1-2A5D;
      (=jis-x0213-1-2000  . #x2A5D)	; &I-JX1-2A5D;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (=ucs		. #x015C)	; Ŝ
    (latin-iso8859-3	. #xDE)	; &I-LATIN3-5E;
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
    (=jis-x0212		. #x2A5D)	; &JX1-2A5D;
    (=jis-x0213-1-2000	. #x2A5D)	; &I-JX1-2A5D;
    (=jef-china3	. #x86C0)	; &I-JC3-86C0;
    (=ucs@jis		. #x015C)	; &JX1-2A5D;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter s with circumflex")
      (=jis-x0212	  . #x2B5D)	; &JX1-2A63;
      (=jis-x0213-1-2000  . #x2A63)	; &I-JX1-2A63;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (=ucs		. #x015D)	; ŝ
    (latin-iso8859-3	. #xFE)	; &I-LATIN3-7E;
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
    (=jis-x0212		. #x2B5D)	; &JX1-2A63;
    (=jis-x0213-1-2000	. #x2A63)	; &I-JX1-2A63;
    (=jef-china3	. #x86CD)	; &I-JC3-86CD;
    (=ucs@jis		. #x015D)	; &JX1-2A63;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with cedilla")
      (=jis-x0212	  . #x2A5F)	; &JX1-2A27;
      (=jis-x0213-1-2000  . #x2A27)	; &I-JX1-2A27;
      ))
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
  '((=>ucs		. #x015E)	; Ş
    (=jef-china3	. #x8BCB)	; &JC3-8BCB;
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
    (=jis-x0212		. #x2A5F)	; &JX1-2A27;
    (=jis-x0213-1-2000	. #x2A27)	; &I-JX1-2A27;
    (=jef-china3	. #x89FA)	; &I-JC3-89FA;
    (=ucs@jis		. #x015E)	; &JX1-2A27;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter s with cedilla")
      (=jis-x0212	  . #x2B5F)	; &JX1-2A33;
      (=jis-x0213-1-2000  . #x2A33)	; &I-JX1-2A33;
      ))
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
    (=jis-x0212		. #x2B5F)	; &JX1-2A33;
    (=jis-x0213-1-2000	. #x2A33)	; &I-JX1-2A33;
    (=jef-china3	. #x8AA2)	; &I-JC3-8AA2;
    (=ucs@jis		. #x015F)	; &JX1-2A33;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0053 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter s with caron")
      (=jis-x0212	  . #x2A5E)	; &JX1-2A26;
      (=jis-x0213-1-2000  . #x2A26)	; &I-JX1-2A26;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (=ucs		. #x0160)	; Š
    (latin-iso8859-2	. #xA9)	; &I-LATIN2-29;
    (latin-iso8859-4	. #xA9)	; &I-LATIN4-29;
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
    (=jis-x0212		. #x2A5E)	; &JX1-2A26;
    (=jis-x0213-1-2000	. #x2A26)	; &I-JX1-2A26;
    (=jef-china3	. #x88EA)	; &I-JC3-88EA;
    (=ucs@jis		. #x0160)	; &JX1-2A26;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0073 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter s with caron")
      (=jis-x0212	  . #x2B5E)	; &JX1-2A32;
      (=jis-x0213-1-2000  . #x2A32)	; &I-JX1-2A32;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (=ucs		. #x0161)	; š
    (latin-iso8859-2	. #xB9)	; &I-LATIN2-39;
    (latin-iso8859-4	. #xB9)	; &I-LATIN4-39;
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
    (=jis-x0212		. #x2B5E)	; &JX1-2A32;
    (=jis-x0213-1-2000	. #x2A32)	; &I-JX1-2A32;
    (=jef-china3	. #x88F9)	; &I-JC3-88F9;
    (=ucs@jis		. #x0161)	; &JX1-2A32;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x0327)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with cedilla")
      (=jis-x0212	  . #x2A61)	; &JX1-2A47;
      (=jis-x0213-1-2000  . #x2A47)	; &I-JX1-2A47;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (=ucs		. #x0162)	; Ţ
    (latin-iso8859-2	. #xDE)	; &I-LATIN2-5E;
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
    (=jis-x0212		. #x2A61)	; &JX1-2A47;
    (=jis-x0213-1-2000	. #x2A47)	; &I-JX1-2A47;
    (=jef-china3	. #x8BCC)	; &I-JC3-8BCC;
    (=ucs@jis		. #x0162)	; &JX1-2A47;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x0327)
    (->fullwidth
     ((name . "fullwidth latin small letter t with cedilla")
      (=jis-x0212	  . #x2B61)	; &JX1-2A57;
      (=jis-x0213-1-2000  . #x2A57)	; &I-JX1-2A57;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (=ucs		. #x0163)	; ţ
    (latin-iso8859-2	. #xFE)	; &I-LATIN2-7E;
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
    (=jis-x0212		. #x2B61)	; &JX1-2A57;
    (=jis-x0213-1-2000	. #x2A57)	; &I-JX1-2A57;
    (=ucs@jis		. #x0163)	; &JX1-2A57;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0054 #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with caron")
      (=jis-x0212	  . #x2A60)	; &JX1-2A28;
      (=jis-x0213-1-2000  . #x2A28)	; &I-JX1-2A28;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (=ucs		. #x0164)	; Ť
    (latin-iso8859-2	. #xAB)	; &I-LATIN2-2B;
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
    (=jis-x0212		. #x2A60)	; &JX1-2A28;
    (=jis-x0213-1-2000	. #x2A28)	; &I-JX1-2A28;
    (=jef-china3	. #x88EB)	; &I-JC3-88EB;
    (=ucs@jis		. #x0164)	; &JX1-2A28;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0074 #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with caron")
      (=jis-x0212	  . #x2B60)	; &JX1-2A34;
      (=jis-x0213-1-2000  . #x2A34)	; &I-JX1-2A34;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (=ucs		. #x0165)	; ť
    (latin-iso8859-2	. #xBB)	; &I-LATIN2-3B;
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
    (=jis-x0212		. #x2B60)	; &JX1-2A34;
    (=jis-x0213-1-2000	. #x2A34)	; &I-JX1-2A34;
    (=jef-china3	. #x88FA)	; &I-JC3-88FA;
    (=ucs@jis		. #x0165)	; &JX1-2A34;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "fullwidth latin capital letter t with stroke")
      (=ks-x1001	  . #x282E)	; &JSP-292F;
      (=jis-x0212	  . #x292F)	; &I-JSP-292F;
      (=ucs@jis		  . #x0166)	; &JSP-292F;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (=ucs		. #x0166)	; Ŧ
    (latin-iso8859-4	. #xAC)	; &I-LATIN4-2C;
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
    (=ks-x1001		. #x282E)	; &JSP-292F;
    (=jis-x0212		. #x292F)	; &I-JSP-292F;
    (=ucs@jis		. #x0166)	; &JSP-292F;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth latin small letter t with stroke")
      (=ks-x1001	  . #x292E)	; &JSP-294F;
      (=jis-x0212	  . #x294F)	; &I-JSP-294F;
      (=ucs@jis		  . #x0167)	; &JSP-294F;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (=ucs		. #x0167)	; ŧ
    (latin-iso8859-4	. #xBC)	; &I-LATIN4-3C;
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
    (=ks-x1001		. #x292E)	; &JSP-294F;
    (=jis-x0212		. #x294F)	; &I-JSP-294F;
    (=ucs@jis		. #x0167)	; &JSP-294F;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0303)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with tilde")
      (=jis-x0212	  . #x2A6C)	; &JSP-2A6C;
      (=jef-china3	  . #x86EB)	; &I-JC3-86EB;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (=ucs		. #x0168)	; Ũ
    (latin-iso8859-4	. #xDD)	; &I-LATIN4-5D;
    (latin-viscii	. #x9D)	; &MCS-00E927BB;
    (latin-viscii-upper . #xFB)	; &MCS-00E927BB;
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
    (=jis-x0212		. #x2A6C)	; &JSP-2A6C;
    (=jef-china3	. #x86EB)	; &I-JC3-86EB;
    (=ucs@jis		. #x0168)	; &JSP-2A6C;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0303)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with tilde")
      (=jis-x0212	  . #x2B6C)	; &JSP-2B6C;
      (=jef-china3	  . #x86F8)	; &I-JC3-86F8;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (=ucs		. #x0169)	; ũ
    (latin-iso8859-4	. #xFD)	; &I-LATIN4-7D;
    (latin-tcvn5712	. #xF2)	; &I-VSCII2-72;
    (latin-viscii	. #xFB)	; &MCS-00E9275B;
    (latin-viscii-lower . #xFB)	; &MCS-00E9275B;
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
    (=jis-x0212		. #x2B6C)	; &JSP-2B6C;
    (=jef-china3	. #x86F8)	; &I-JC3-86F8;
    (=ucs@jis		. #x0169)	; &JSP-2B6C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0304)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with macron")
      (=jis-x0212	  . #x2A69)	; &JX1-2977;
      (=jef-china3	  . #x87B9)	; &I-JC3-87B9;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (=ucs		. #x016A)	; Ū
    (latin-iso8859-4	. #xDE)	; &I-LATIN4-5E;
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
      (=jis-x0213-1-2000  . #x297C)	; &I-JX1-297C;
      ))
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=jis-x0212		. #x2A69)	; &JX1-2977;
    (=jis-x0213-1-2000	. #x2977)	; &I-JX1-2977;
    (=jef-china3	. #x87B9)	; &I-JC3-87B9;
    (=ucs@jis		. #x016A)	; &JX1-2977;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0304)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with macron")
      (=gb2312		  . #x2831)	; &JX1-297C;
      (=jis-x0212	  . #x2B69)	; &I-JSP-2B69;
      (=jis-x0213-1-2000  . #x297C)	; &I-JX1-297C;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=ucs		. #x016B)	; ū
    (latin-iso8859-4	. #xFE)	; &I-LATIN4-7E;
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
    (=gb2312		. #x2831)	; &JX1-297C;
    (=jis-x0212		. #x2B69)	; &I-JSP-2B69;
    (=jis-x0213-1-2000	. #x297C)	; &I-JX1-297C;
    (=jef-china3	. #x87CD)	; &I-JC3-87CD;
    (=ucs@jis		. #x016B)	; &JX1-297C;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0306)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with breve")
      (=jis-x0212	  . #x2A66)	; &JX1-2A5E;
      (=jis-x0213-1-2000  . #x2A5E)	; &I-JX1-2A5E;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (=ucs		. #x016C)	; Ŭ
    (latin-iso8859-3	. #xDD)	; &I-LATIN3-5D;
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
    (=jis-x0212		. #x2A66)	; &JX1-2A5E;
    (=jis-x0213-1-2000	. #x2A5E)	; &I-JX1-2A5E;
    (=jef-china3	. #x87E5)	; &I-JC3-87E5;
    (=ucs@jis		. #x016C)	; &JX1-2A5E;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0306)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with breve")
      (=jis-x0212	  . #x2B66)	; &JX1-2A64;
      (=jis-x0213-1-2000  . #x2A64)	; &I-JX1-2A64;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (=ucs		. #x016D)	; ŭ
    (latin-iso8859-3	. #xFD)	; &I-LATIN3-7D;
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
    (=jis-x0212		. #x2B66)	; &JX1-2A64;
    (=jis-x0213-1-2000	. #x2A64)	; &I-JX1-2A64;
    (=jef-china3	. #x87EF)	; &I-JC3-87EF;
    (=ucs@jis		. #x016D)	; &JX1-2A64;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030A)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ring above")
      (=jis-x0212	  . #x2A6B)	; &JX1-2A45;
      (=jis-x0213-1-2000  . #x2A45)	; &I-JX1-2A45;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (=ucs		. #x016E)	; Ů
    (latin-iso8859-2	. #xD9)	; &I-LATIN2-59;
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
    (=jis-x0212		. #x2A6B)	; &JX1-2A45;
    (=jis-x0213-1-2000	. #x2A45)	; &I-JX1-2A45;
    (=jef-china3	. #x89A5)	; &I-JC3-89A5;
    (=ucs@jis		. #x016E)	; &JX1-2A45;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030A)
    (->fullwidth
     ((name . "fullwidth latin small letter u with ring above")
      (=jis-x0212	  . #x2B6B)	; &JX1-2A55;
      (=jis-x0213-1-2000  . #x2A55)	; &I-JX1-2A55;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (=ucs		. #x016F)	; ů
    (latin-iso8859-2	. #xF9)	; &I-LATIN2-79;
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
    (=jis-x0212		. #x2B6B)	; &JX1-2A55;
    (=jis-x0213-1-2000	. #x2A55)	; &I-JX1-2A55;
    (=jef-china3	. #x89AD)	; &I-JC3-89AD;
    (=ucs@jis		. #x016F)	; &JX1-2A55;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x030B)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with double acute")
      (=jis-x0212	  . #x2A68)	; &JX1-2A46;
      (=jis-x0213-1-2000  . #x2A46)	; &I-JX1-2A46;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (=ucs		. #x0170)	; Ű
    (latin-iso8859-2	. #xDB)	; &I-LATIN2-5B;
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
    (=jis-x0212		. #x2A68)	; &JX1-2A46;
    (=jis-x0213-1-2000	. #x2A46)	; &I-JX1-2A46;
    (=jef-china3	. #x89E3)	; &I-JC3-89E3;
    (=ucs@jis		. #x0170)	; &JX1-2A46;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x030B)
    (->fullwidth
     ((name . "fullwidth latin small letter u with double acute")
      (=jis-x0212	  . #x2B68)	; &JX1-2A56;
      (=jis-x0213-1-2000  . #x2A56)	; &I-JX1-2A56;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (=ucs		. #x0171)	; ű
    (latin-iso8859-2	. #xFB)	; &I-LATIN2-7B;
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
    (=jis-x0212		. #x2B68)	; &JX1-2A56;
    (=jis-x0213-1-2000	. #x2A56)	; &I-JX1-2A56;
    (=jef-china3	. #x89E6)	; &I-JC3-89E6;
    (=ucs@jis		. #x0171)	; &JX1-2A56;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0055 #x0328)
    (->fullwidth
     ((name . "fullwidth latin capital letter u with ogonek")
      (=jis-x0212	  . #x2A6A)	; &JSP-2A6A;
      (=jef-china3	  . #x8AAA)	; &I-JC3-8AAA;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (=ucs		. #x0172)	; Ų
    (latin-iso8859-4	. #xD9)	; &I-LATIN4-59;
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
    (=jis-x0212		. #x2A6A)	; &JSP-2A6A;
    (=jef-china3	. #x8AAA)	; &I-JC3-8AAA;
    (=ucs@jis		. #x0172)	; &JSP-2A6A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0075 #x0328)
    (->fullwidth
     ((name		  . "fullwidth latin small letter u with ogonek")
      (=jis-x0212	  . #x2B6A)	; &JSP-2B6A;
      (=jef-china3	  . #x8AB2)	; &I-JC3-8AB2;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (=ucs		. #x0173)	; ų
    (latin-iso8859-4	. #xF9)	; &I-LATIN4-79;
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
    (=jis-x0212		. #x2B6A)	; &JSP-2B6A;
    (=jef-china3	. #x8AB2)	; &I-JC3-8AB2;
    (=ucs@jis		. #x0173)	; &JSP-2B6A;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0057 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter w with circumflex")
      (=jis-x0212	  . #x2A71)	; &JSP-2A71;
      (=jef-china3	  . #x86C2)	; &I-JC3-86C2;
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
    (=jis-x0212		. #x2A71)	; &JSP-2A71;
    (=jef-china3	. #x86C2)	; &I-JC3-86C2;
    (=ucs@jis		. #x0174)	; &JSP-2A71;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0077 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter w with circumflex")
      (=jis-x0212	  . #x2B71)	; &JSP-2B71;
      (=jef-china3	  . #x86CF)	; &I-JC3-86CF;
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
    (=jis-x0212		. #x2B71)	; &JSP-2B71;
    (=jef-china3	. #x86CF)	; &I-JC3-86CF;
    (=ucs@jis		. #x0175)	; &JSP-2B71;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0302)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with circumflex")
      (=jis-x0212	  . #x2A74)	; &JSP-2A74;
      (=jef-china3	  . #x86C3)	; &I-JC3-86C3;
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
    (=jis-x0212		. #x2A74)	; &JSP-2A74;
    (=jef-china3	. #x86C3)	; &I-JC3-86C3;
    (=ucs@jis		. #x0176)	; &JSP-2A74;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0079 #x0302)
    (->fullwidth
     ((name . "fullwidth latin small letter y with circumflex")
      (=jis-x0212	  . #x2B74)	; &JSP-2B74;
      (=jef-china3	  . #x86D0)	; &I-JC3-86D0;
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
    (=jis-x0212		. #x2B74)	; &JSP-2B74;
    (=jef-china3	. #x86D0)	; &I-JC3-86D0;
    (=ucs@jis		. #x0177)	; &JSP-2B74;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0059 #x0308)
    (->fullwidth
     ((name . "fullwidth latin capital letter y with diaeresis")
      (=jis-x0212	  . #x2A73)	; &JSP-2A73;
      (=ucs@jis		  . #x0178)	; &JSP-2A73;
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
    (=jis-x0212		. #x2A73)	; &JSP-2A73;
    (=ucs@jis		. #x0178)	; &JSP-2A73;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0301)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with acute")
      (=jis-x0212	  . #x2A75)	; &JX1-2A29;
      (=jis-x0213-1-2000  . #x2A29)	; &I-JX1-2A29;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (=ucs		. #x0179)	; Ź
    (latin-iso8859-2	. #xAC)	; &I-LATIN2-2C;
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
    (=jis-x0212		. #x2A75)	; &JX1-2A29;
    (=jis-x0213-1-2000	. #x2A29)	; &I-JX1-2A29;
    (=jef-china3	. #x85EA)	; &I-JC3-85EA;
    (=ucs@jis		. #x0179)	; &JX1-2A29;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0301)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with acute")
      (=jis-x0212	  . #x2B75)	; &JX1-2A35;
      (=jis-x0213-1-2000  . #x2A35)	; &I-JX1-2A35;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (=ucs		. #x017A)	; ź
    (latin-iso8859-2	. #xBC)	; &I-LATIN2-3C;
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
    (=jis-x0212		. #x2B75)	; &JX1-2A35;
    (=jis-x0213-1-2000	. #x2A35)	; &I-JX1-2A35;
    (=jef-china3	. #x86A2)	; &I-JC3-86A2;
    (=ucs@jis		. #x017A)	; &JX1-2A35;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x0307)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with dot above")
      (=jis-x0212	  . #x2A77)	; &JX1-2A2B;
      (=jis-x0213-1-2000  . #x2A2B)	; &I-JX1-2A2B;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (=ucs		. #x017B)	; Ż
    (latin-iso8859-2	. #xAF)	; &I-LATIN2-2F;
    (latin-iso8859-3	. #xAF)	; &I-LATIN3-2F;
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
    (=jis-x0212		. #x2A77)	; &JX1-2A2B;
    (=jis-x0213-1-2000	. #x2A2B)	; &I-JX1-2A2B;
    (=jef-china3	. #x88AF)	; &I-JC3-88AF;
    (=ucs@jis		. #x017B)	; &JX1-2A2B;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x0307)
    (->fullwidth
     ((name . "fullwidth latin small letter z with dot above")
      (=jis-x0212	  . #x2B77)	; &JX1-2A38;
      (=jis-x0213-1-2000  . #x2A38)	; &I-JX1-2A38;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (=ucs		. #x017C)	; ż
    (latin-iso8859-2	. #xBF)	; &I-LATIN2-3F;
    (latin-iso8859-3	. #xBF)	; &I-LATIN3-3F;
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
    (=jis-x0212		. #x2B77)	; &JX1-2A38;
    (=jis-x0213-1-2000	. #x2A38)	; &I-JX1-2A38;
    (=jef-china3	. #x88C4)	; &I-JC3-88C4;
    (=ucs@jis		. #x017C)	; &JX1-2A38;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x005A #x030C)
    (->fullwidth
     ((name . "fullwidth latin capital letter z with caron")
      (=jis-x0212	  . #x2A76)	; &JX1-2A2A;
      (=jis-x0213-1-2000  . #x2A2A)	; &I-JX1-2A2A;
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (=ucs		. #x017D)	; Ž
    (latin-iso8859-2	. #xAE)	; &I-LATIN2-2E;
    (latin-iso8859-4	. #xAE)	; &I-LATIN4-2E;
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
    (=jis-x0212		. #x2A76)	; &JX1-2A2A;
    (=jis-x0213-1-2000	. #x2A2A)	; &I-JX1-2A2A;
    (=jef-china3	. #x88ED)	; &I-JC3-88ED;
    (=ucs@jis		. #x017D)	; &JX1-2A2A;
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x007A #x030C)
    (->fullwidth
     ((name		  . "fullwidth latin small letter z with caron")
      (=jis-x0212	  . #x2B76)	; &JX1-2A37;
      (=jis-x0213-1-2000  . #x2A37)	; &I-JX1-2A37;
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (=ucs		. #x017E)	; ž
    (latin-iso8859-2	. #xBE)	; &I-LATIN2-3E;
    (latin-iso8859-4	. #xBE)	; &I-LATIN4-3E;
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
    (=jis-x0212		. #x2B76)	; &JX1-2A37;
    (=jis-x0213-1-2000	. #x2A37)	; &I-JX1-2A37;
    (=jef-china3	. #x88FC)	; &I-JC3-88FC;
    (=ucs@jis		. #x017E)	; &JX1-2A37;
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
