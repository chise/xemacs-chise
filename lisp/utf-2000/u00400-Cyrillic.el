;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0300)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE WITH GRAVE")
      (=ucs		  . #x0450)	; ѐ
      ))
    (=ucs		. #x0400)	; Ѐ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0308)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
      (=jis-x0208	  . #x2727)	; &J90-2727;
      (=gb2312		  . #x2727)	; &I-G0-2727;
      (=ks-x1001	  . #x2C27)	; &I-K0-2C27;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; ё
      ))
    (=ucs		. #x0401)	; Ё
    (cyrillic-iso8859-5 . #xA1)	; &I-CYRILLIC-21;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
    (=>ucs		. #x0401)	; Ё
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0401)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IO")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ё
      ))
    (=jis-x0208		. #x2727)	; &J90-2727;
    (=gb2312		. #x2727)	; &I-G0-2727;
    (=ks-x1001		. #x2C27)	; &I-K0-2C27;
    (=big5-eten		. #xC7F9)	; &B-C7F9;
    (=ucs@jis		. #x0401)	; &J90-2727;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
      (=jis-x0212	  . #x2742)	; &JSP-2742;
      (=ucs@jis		  . #x0402)	; &JSP-2742;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; ђ
      ))
    (=ucs		. #x0402)	; Ђ
    (cyrillic-iso8859-5 . #xA2)	; &I-CYRILLIC-22;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
    (=>ucs		. #x0402)	; Ђ
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
      (=ucs		  . #x0402)	; Ђ
      ))
    (=jis-x0212		. #x2742)	; &JSP-2742;
    (=ucs@jis		. #x0402)	; &JSP-2742;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0413 #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
      (=jis-x0212	  . #x2743)	; &JSP-2743;
      (=ucs@jis		  . #x0403)	; &JSP-2743;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; ѓ
      ))
    (=ucs		. #x0403)	; Ѓ
    (cyrillic-iso8859-5 . #xA3)	; &I-CYRILLIC-23;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
    (=>ucs		. #x0403)	; Ѓ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0403)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ѓ
      ))
    (=jis-x0212		. #x2743)	; &JSP-2743;
    (=ucs@jis		. #x0403)	; &JSP-2743;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=jis-x0212	  . #x2744)	; &JSP-2744;
      (=ucs@jis		  . #x0404)	; &JSP-2744;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; є
      ))
    (=ucs		. #x0404)	; Є
    (cyrillic-iso8859-5 . #xA4)	; &I-CYRILLIC-24;
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (=>ucs		. #x0404)	; Є
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0404)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Є
      ))
    (=jis-x0212		. #x2744)	; &JSP-2744;
    (=ucs@jis		. #x0404)	; &JSP-2744;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
      (=jis-x0212	  . #x2745)	; &JSP-2745;
      (=ucs@jis		  . #x0405)	; &JSP-2745;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; ѕ
      ))
    (=ucs		. #x0405)	; Ѕ
    (cyrillic-iso8859-5 . #xA5)	; &I-CYRILLIC-25;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
    (=>ucs		. #x0405)	; Ѕ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0405)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ѕ
      ))
    (=jis-x0212		. #x2745)	; &JSP-2745;
    (=ucs@jis		. #x0405)	; &JSP-2745;
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=jis-x0212	  . #x2746)	; &JSP-2746;
      (=ucs@jis		  . #x0406)	; &JSP-2746;
      ))
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      ))
    (=ucs		. #x0406)	; І
    (cyrillic-iso8859-5 . #xA6)	; &I-CYRILLIC-26;
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (=>ucs		. #x0406)	; І
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0406)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      ))
    (<-fullwidth
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      ))
    (=jis-x0212		. #x2746)	; &JSP-2746;
    (=ucs@jis		. #x0406)	; &JSP-2746;
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
      (=jis-x0212	  . #x2747)	; &JSP-2747;
      (=ucs@jis		  . #x0407)	; &JSP-2747;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; ї
      ))
    (=ucs		. #x0407)	; Ї
    (cyrillic-iso8859-5 . #xA7)	; &I-CYRILLIC-27;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YI")
    (=>ucs		. #x0407)	; Ї
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
      (=ucs		  . #x0407)	; Ї
      ))
    (=jis-x0212		. #x2747)	; &JSP-2747;
    (=ucs@jis		. #x0407)	; &JSP-2747;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER JE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
      (=jis-x0212	  . #x2748)	; &JSP-2748;
      (=ucs@jis		  . #x0408)	; &JSP-2748;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; ј
      ))
    (=ucs		. #x0408)	; Ј
    (cyrillic-iso8859-5 . #xA8)	; &I-CYRILLIC-28;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
    (=>ucs		. #x0408)	; Ј
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0408)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER JE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ј
      ))
    (=jis-x0212		. #x2748)	; &JSP-2748;
    (=ucs@jis		. #x0408)	; &JSP-2748;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
      (=jis-x0212	  . #x2749)	; &JSP-2749;
      (=ucs@jis		  . #x0409)	; &JSP-2749;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; љ
      ))
    (=ucs		. #x0409)	; Љ
    (cyrillic-iso8859-5 . #xA9)	; &I-CYRILLIC-29;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
    (=>ucs		. #x0409)	; Љ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0409)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER LJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Љ
      ))
    (=jis-x0212		. #x2749)	; &JSP-2749;
    (=ucs@jis		. #x0409)	; &JSP-2749;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER NJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
      (=jis-x0212	  . #x274A)	; &JSP-274A;
      (=ucs@jis		  . #x040A)	; &JSP-274A;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; њ
      ))
    (=ucs		. #x040A)	; Њ
    (cyrillic-iso8859-5 . #xAA)	; &I-CYRILLIC-2A;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
    (=>ucs		. #x040A)	; Њ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040A)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER NJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; Њ
      ))
    (=jis-x0212		. #x274A)	; &JSP-274A;
    (=ucs@jis		. #x040A)	; &JSP-274A;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSHE")
      (=ucs		  . #x045B)	; ћ
      ))
    (=ucs		. #x040B)	; Ћ
    (cyrillic-iso8859-5 . #xAB)	; &I-CYRILLIC-2B;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TSHE")
    (=>ucs		. #x040B)	; Ћ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
      ))
    (=jis-x0212		. #x274B)	; &JSP-274B;
    (=ucs@jis		. #x040B)	; &JSP-274B;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041A #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KJE")
      (=jis-x0212	  . #x274C)	; &JSP-274C;
      (=ucs@jis		  . #x040C)	; &JSP-274C;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; ќ
      ))
    (=ucs		. #x040C)	; Ќ
    (cyrillic-iso8859-5 . #xAC)	; &I-CYRILLIC-2C;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER KJE")
    (=>ucs		. #x040C)	; Ќ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040C)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; Ќ
      ))
    (=jis-x0212		. #x274C)	; &JSP-274C;
    (=ucs@jis		. #x040C)	; &JSP-274C;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0300)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH GRAVE")
      (=ucs		  . #x045D)	; ѝ
      ))
    (=ucs		. #x040D)	; Ѝ
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
      (=jis-x0212	  . #x274D)	; &JSP-274D;
      (=ucs@jis		  . #x040E)	; &JSP-274D;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; ў
      ))
    (=ucs		. #x040E)	; Ў
    (cyrillic-iso8859-5 . #xAE)	; &I-CYRILLIC-2E;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT U")
    (=>ucs		. #x040E)	; Ў
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
      (=ucs		  . #x040E)	; Ў
      ))
    (=jis-x0212		. #x274D)	; &JSP-274D;
    (=ucs@jis		. #x040E)	; &JSP-274D;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
      (=jis-x0212	  . #x274E)	; &JSP-274E;
      (=ucs@jis		  . #x040F)	; &JSP-274E;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; џ
      ))
    (=ucs		. #x040F)	; Џ
    (cyrillic-iso8859-5 . #xAF)	; &I-CYRILLIC-2F;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
    (=>ucs		. #x040F)	; Џ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x040F)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Џ
      ))
    (=jis-x0212		. #x274E)	; &JSP-274E;
    (=ucs@jis		. #x040F)	; &JSP-274E;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER A")
      (=jis-x0208	  . #x2721)	; &J90-2721;
      (=gb2312		  . #x2721)	; &I-G0-2721;
      (=ks-x1001	  . #x2C21)	; &I-K0-2C21;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      ))
    (=ucs		. #x0410)	; А
    (cyrillic-iso8859-5 . #xB0)	; &I-CYRILLIC-30;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER A")
    (=>ucs		. #x0410)	; А
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0410)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER A")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      ))
    (=jis-x0208		. #x2721)	; &J90-2721;
    (=gb2312		. #x2721)	; &I-G0-2721;
    (=ks-x1001		. #x2C21)	; &I-K0-2C21;
    (=big5-eten		. #xC7F3)	; &B-C7F3;
    (=ucs@jis		. #x0410)	; &J90-2721;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
      (=jis-x0208	  . #x2722)	; &J90-2722;
      (=gb2312		  . #x2722)	; &I-G0-2722;
      (=ks-x1001	  . #x2C22)	; &I-K0-2C22;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; б
      ))
    (=ucs		. #x0411)	; Б
    (cyrillic-iso8859-5 . #xB1)	; &I-CYRILLIC-31;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
    (=>ucs		. #x0411)	; Б
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0411)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER BE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Б
      ))
    (=jis-x0208		. #x2722)	; &J90-2722;
    (=gb2312		. #x2722)	; &I-G0-2722;
    (=ks-x1001		. #x2C22)	; &I-K0-2C22;
    (=big5-eten		. #xC7F4)	; &B-C7F4;
    (=ucs@jis		. #x0411)	; &J90-2722;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER VE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
      (=jis-x0208	  . #x2723)	; &J90-2723;
      (=gb2312		  . #x2723)	; &I-G0-2723;
      (=ks-x1001	  . #x2C23)	; &I-K0-2C23;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; в
      ))
    (=ucs		. #x0412)	; В
    (cyrillic-iso8859-5 . #xB2)	; &I-CYRILLIC-32;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
    (=>ucs		. #x0412)	; В
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0412)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER VE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; В
      ))
    (=jis-x0208		. #x2723)	; &J90-2723;
    (=gb2312		. #x2723)	; &I-G0-2723;
    (=ks-x1001		. #x2C23)	; &I-K0-2C23;
    (=big5-eten		. #xC7F5)	; &B-C7F5;
    (=ucs@jis		. #x0412)	; &J90-2723;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
      (=jis-x0208	  . #x2724)	; &J90-2724;
      (=gb2312		  . #x2724)	; &I-G0-2724;
      (=ks-x1001	  . #x2C24)	; &I-K0-2C24;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      ))
    (=ucs		. #x0413)	; Г
    (cyrillic-iso8859-5 . #xB3)	; &I-CYRILLIC-33;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
    (=>ucs		. #x0413)	; Г
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0413)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      ))
    (=jis-x0208		. #x2724)	; &J90-2724;
    (=gb2312		. #x2724)	; &I-G0-2724;
    (=ks-x1001		. #x2C24)	; &I-K0-2C24;
    (=big5-eten		. #xC7F6)	; &B-C7F6;
    (=ucs@jis		. #x0413)	; &J90-2724;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
      (=jis-x0208	  . #x2725)	; &J90-2725;
      (=gb2312		  . #x2725)	; &I-G0-2725;
      (=ks-x1001	  . #x2C25)	; &I-K0-2C25;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; д
      ))
    (=ucs		. #x0414)	; Д
    (cyrillic-iso8859-5 . #xB4)	; &I-CYRILLIC-34;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
    (=>ucs		. #x0414)	; Д
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0414)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Д
      ))
    (=jis-x0208		. #x2725)	; &J90-2725;
    (=gb2312		. #x2725)	; &I-G0-2725;
    (=ks-x1001		. #x2C25)	; &I-K0-2C25;
    (=big5-eten		. #xC7F7)	; &B-C7F7;
    (=ucs@jis		. #x0414)	; &J90-2725;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
      (=jis-x0208	  . #x2726)	; &J90-2726;
      (=gb2312		  . #x2726)	; &I-G0-2726;
      (=ks-x1001	  . #x2C26)	; &I-K0-2C26;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      ))
    (=ucs		. #x0415)	; Е
    (cyrillic-iso8859-5 . #xB5)	; &I-CYRILLIC-35;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
    (=>ucs		. #x0415)	; Е
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0415)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      ))
    (=jis-x0208		. #x2726)	; &J90-2726;
    (=gb2312		. #x2726)	; &I-G0-2726;
    (=ks-x1001		. #x2C26)	; &I-K0-2C26;
    (=big5-eten		. #xC7F8)	; &B-C7F8;
    (=ucs@jis		. #x0415)	; &J90-2726;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
      (=jis-x0208	  . #x2728)	; &J90-2728;
      (=gb2312		  . #x2728)	; &I-G0-2728;
      (=ks-x1001	  . #x2C28)	; &I-K0-2C28;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      ))
    (=ucs		. #x0416)	; Ж
    (cyrillic-iso8859-5 . #xB6)	; &I-CYRILLIC-36;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
    (=>ucs		. #x0416)	; Ж
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0416)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      ))
    (=jis-x0208		. #x2728)	; &J90-2728;
    (=gb2312		. #x2728)	; &I-G0-2728;
    (=ks-x1001		. #x2C28)	; &I-K0-2C28;
    (=big5-eten		. #xC7FA)	; &B-C7FA;
    (=ucs@jis		. #x0416)	; &J90-2728;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
      (=jis-x0208	  . #x2729)	; &J90-2729;
      (=gb2312		  . #x2729)	; &I-G0-2729;
      (=ks-x1001	  . #x2C29)	; &I-K0-2C29;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      ))
    (=ucs		. #x0417)	; З
    (cyrillic-iso8859-5 . #xB7)	; &I-CYRILLIC-37;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
    (=>ucs		. #x0417)	; З
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0417)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      ))
    (=jis-x0208		. #x2729)	; &J90-2729;
    (=gb2312		. #x2729)	; &I-G0-2729;
    (=ks-x1001		. #x2C29)	; &I-K0-2C29;
    (=big5-eten		. #xC7FB)	; &B-C7FB;
    (=ucs@jis		. #x0417)	; &J90-2729;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER I")
      (=jis-x0208	  . #x272A)	; &J90-272A;
      (=gb2312		  . #x272A)	; &I-G0-272A;
      (=ks-x1001	  . #x2C2A)	; &I-K0-2C2A;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      ))
    (=ucs		. #x0418)	; И
    (cyrillic-iso8859-5 . #xB8)	; &I-CYRILLIC-38;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER I")
    (=>ucs		. #x0418)	; И
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0418)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      ))
    (=jis-x0208		. #x272A)	; &J90-272A;
    (=gb2312		. #x272A)	; &I-G0-272A;
    (=ks-x1001		. #x2C2A)	; &I-K0-2C2A;
    (=big5-eten		. #xC7FC)	; &B-C7FC;
    (=ucs@jis		. #x0418)	; &J90-272A;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
      (=jis-x0208	  . #x272B)	; &J90-272B;
      (=gb2312		  . #x272B)	; &I-G0-272B;
      (=ks-x1001	  . #x2C2B)	; &I-K0-2C2B;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; й
      ))
    (=ucs		. #x0419)	; Й
    (cyrillic-iso8859-5 . #xB9)	; &I-CYRILLIC-39;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
    (=>ucs		. #x0419)	; Й
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0419)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Й
      ))
    (=jis-x0208		. #x272B)	; &J90-272B;
    (=gb2312		. #x272B)	; &I-G0-272B;
    (=ks-x1001		. #x2C2B)	; &I-K0-2C2B;
    (=big5-eten		. #xC7FD)	; &B-C7FD;
    (=ucs@jis		. #x0419)	; &J90-272B;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
      (=jis-x0208	  . #x272C)	; &J90-272C;
      (=gb2312		  . #x272C)	; &I-G0-272C;
      (=ks-x1001	  . #x2C2C)	; &I-K0-2C2C;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      ))
    (=ucs		. #x041A)	; К
    (cyrillic-iso8859-5 . #xBA)	; &I-CYRILLIC-3A;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
    (=>ucs		. #x041A)	; К
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041A)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      ))
    (=jis-x0208		. #x272C)	; &J90-272C;
    (=gb2312		. #x272C)	; &I-G0-272C;
    (=ks-x1001		. #x2C2C)	; &I-K0-2C2C;
    (=big5-eten		. #xC7FE)	; &B-C7FE;
    (=ucs@jis		. #x041A)	; &J90-272C;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
      (=jis-x0208	  . #x272D)	; &J90-272D;
      (=gb2312		  . #x272D)	; &I-G0-272D;
      (=ks-x1001	  . #x2C2D)	; &I-K0-2C2D;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; л
      ))
    (=ucs		. #x041B)	; Л
    (cyrillic-iso8859-5 . #xBB)	; &I-CYRILLIC-3B;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
    (=>ucs		. #x041B)	; Л
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041B)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EL")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Л
      ))
    (=jis-x0208		. #x272D)	; &J90-272D;
    (=gb2312		. #x272D)	; &I-G0-272D;
    (=ks-x1001		. #x2C2D)	; &I-K0-2C2D;
    (=big5-eten		. #xC840)	; &B-C840;
    (=ucs@jis		. #x041B)	; &J90-272D;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EM")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
      (=jis-x0208	  . #x272E)	; &J90-272E;
      (=gb2312		  . #x272E)	; &I-G0-272E;
      (=ks-x1001	  . #x2C2E)	; &I-K0-2C2E;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; м
      ))
    (=ucs		. #x041C)	; М
    (cyrillic-iso8859-5 . #xBC)	; &I-CYRILLIC-3C;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
    (=>ucs		. #x041C)	; М
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041C)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EM")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; М
      ))
    (=jis-x0208		. #x272E)	; &J90-272E;
    (=gb2312		. #x272E)	; &I-G0-272E;
    (=ks-x1001		. #x2C2E)	; &I-K0-2C2E;
    (=big5-eten		. #xC841)	; &B-C841;
    (=ucs@jis		. #x041C)	; &J90-272E;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
      (=jis-x0208	  . #x272F)	; &J90-272F;
      (=gb2312		  . #x272F)	; &I-G0-272F;
      (=ks-x1001	  . #x2C2F)	; &I-K0-2C2F;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; н
      ))
    (=ucs		. #x041D)	; Н
    (cyrillic-iso8859-5 . #xBD)	; &I-CYRILLIC-3D;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
    (=>ucs		. #x041D)	; Н
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041D)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Н
      ))
    (=jis-x0208		. #x272F)	; &J90-272F;
    (=gb2312		. #x272F)	; &I-G0-272F;
    (=ks-x1001		. #x2C2F)	; &I-K0-2C2F;
    (=big5-eten		. #xC842)	; &B-C842;
    (=ucs@jis		. #x041D)	; &J90-272F;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER O")
      (=jis-x0208	  . #x2730)	; &J90-2730;
      (=gb2312		  . #x2730)	; &I-G0-2730;
      (=ks-x1001	  . #x2C30)	; &I-K0-2C30;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      ))
    (=ucs		. #x041E)	; О
    (cyrillic-iso8859-5 . #xBE)	; &I-CYRILLIC-3E;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER O")
    (=>ucs		. #x041E)	; О
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041E)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER O")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      ))
    (=jis-x0208		. #x2730)	; &J90-2730;
    (=gb2312		. #x2730)	; &I-G0-2730;
    (=ks-x1001		. #x2C30)	; &I-K0-2C30;
    (=big5-eten		. #xC843)	; &B-C843;
    (=ucs@jis		. #x041E)	; &J90-2730;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
      (=jis-x0208	  . #x2731)	; &J90-2731;
      (=gb2312		  . #x2731)	; &I-G0-2731;
      (=ks-x1001	  . #x2C31)	; &I-K0-2C31;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; п
      ))
    (=ucs		. #x041F)	; П
    (cyrillic-iso8859-5 . #xBF)	; &I-CYRILLIC-3F;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
    (=>ucs		. #x041F)	; П
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x041F)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER PE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; П
      ))
    (=jis-x0208		. #x2731)	; &J90-2731;
    (=gb2312		. #x2731)	; &I-G0-2731;
    (=ks-x1001		. #x2C31)	; &I-K0-2C31;
    (=big5-eten		. #xC844)	; &B-C844;
    (=ucs@jis		. #x041F)	; &J90-2731;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
      (=jis-x0208	  . #x2732)	; &J90-2732;
      (=gb2312		  . #x2732)	; &I-G0-2732;
      (=ks-x1001	  . #x2C32)	; &I-K0-2C32;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; р
      ))
    (=ucs		. #x0420)	; Р
    (cyrillic-iso8859-5 . #xC0)	; &I-CYRILLIC-40;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
    (=>ucs		. #x0420)	; Р
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0420)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ER")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Р
      ))
    (=jis-x0208		. #x2732)	; &J90-2732;
    (=gb2312		. #x2732)	; &I-G0-2732;
    (=ks-x1001		. #x2C32)	; &I-K0-2C32;
    (=big5-eten		. #xC845)	; &B-C845;
    (=ucs@jis		. #x0420)	; &J90-2732;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
      (=jis-x0208	  . #x2733)	; &J90-2733;
      (=gb2312		  . #x2733)	; &I-G0-2733;
      (=ks-x1001	  . #x2C33)	; &I-K0-2C33;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; с
      ))
    (=ucs		. #x0421)	; С
    (cyrillic-iso8859-5 . #xC1)	; &I-CYRILLIC-41;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
    (=>ucs		. #x0421)	; С
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0421)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ES")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; С
      ))
    (=jis-x0208		. #x2733)	; &J90-2733;
    (=gb2312		. #x2733)	; &I-G0-2733;
    (=ks-x1001		. #x2C33)	; &I-K0-2C33;
    (=big5-eten		. #xC846)	; &B-C846;
    (=ucs@jis		. #x0421)	; &J90-2733;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
      (=jis-x0208	  . #x2734)	; &J90-2734;
      (=gb2312		  . #x2734)	; &I-G0-2734;
      (=ks-x1001	  . #x2C34)	; &I-K0-2C34;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; т
      ))
    (=ucs		. #x0422)	; Т
    (cyrillic-iso8859-5 . #xC2)	; &I-CYRILLIC-42;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
    (=>ucs		. #x0422)	; Т
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0422)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Т
      ))
    (=jis-x0208		. #x2734)	; &J90-2734;
    (=gb2312		. #x2734)	; &I-G0-2734;
    (=ks-x1001		. #x2C34)	; &I-K0-2C34;
    (=big5-eten		. #xC847)	; &B-C847;
    (=ucs@jis		. #x0422)	; &J90-2734;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER U")
      (=jis-x0208	  . #x2735)	; &J90-2735;
      (=gb2312		  . #x2735)	; &I-G0-2735;
      (=ks-x1001	  . #x2C35)	; &I-K0-2C35;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      ))
    (=ucs		. #x0423)	; У
    (cyrillic-iso8859-5 . #xC3)	; &I-CYRILLIC-43;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER U")
    (=>ucs		. #x0423)	; У
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0423)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER U")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      ))
    (=jis-x0208		. #x2735)	; &J90-2735;
    (=gb2312		. #x2735)	; &I-G0-2735;
    (=ks-x1001		. #x2C35)	; &I-K0-2C35;
    (=big5-eten		. #xC848)	; &B-C848;
    (=ucs@jis		. #x0423)	; &J90-2735;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EF")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
      (=jis-x0208	  . #x2736)	; &J90-2736;
      (=gb2312		  . #x2736)	; &I-G0-2736;
      (=ks-x1001	  . #x2C36)	; &I-K0-2C36;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; ф
      ))
    (=ucs		. #x0424)	; Ф
    (cyrillic-iso8859-5 . #xC4)	; &I-CYRILLIC-44;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
    (=>ucs		. #x0424)	; Ф
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0424)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EF")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ф
      ))
    (=jis-x0208		. #x2736)	; &J90-2736;
    (=gb2312		. #x2736)	; &I-G0-2736;
    (=ks-x1001		. #x2C36)	; &I-K0-2C36;
    (=big5-eten		. #xC849)	; &B-C849;
    (=ucs@jis		. #x0424)	; &J90-2736;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
      (=jis-x0208	  . #x2737)	; &J90-2737;
      (=gb2312		  . #x2737)	; &I-G0-2737;
      (=ks-x1001	  . #x2C37)	; &I-K0-2C37;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; х
      ))
    (=ucs		. #x0425)	; Х
    (cyrillic-iso8859-5 . #xC5)	; &I-CYRILLIC-45;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
    (=>ucs		. #x0425)	; Х
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0425)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Х
      ))
    (=jis-x0208		. #x2737)	; &J90-2737;
    (=gb2312		. #x2737)	; &I-G0-2737;
    (=ks-x1001		. #x2C37)	; &I-K0-2C37;
    (=big5-eten		. #xC84A)	; &B-C84A;
    (=ucs@jis		. #x0425)	; &J90-2737;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
      (=jis-x0208	  . #x2738)	; &J90-2738;
      (=gb2312		  . #x2738)	; &I-G0-2738;
      (=ks-x1001	  . #x2C38)	; &I-K0-2C38;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; ц
      ))
    (=ucs		. #x0426)	; Ц
    (cyrillic-iso8859-5 . #xC6)	; &I-CYRILLIC-46;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
    (=>ucs		. #x0426)	; Ц
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0426)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ц
      ))
    (=jis-x0208		. #x2738)	; &J90-2738;
    (=gb2312		. #x2738)	; &I-G0-2738;
    (=ks-x1001		. #x2C38)	; &I-K0-2C38;
    (=big5-eten		. #xC84B)	; &B-C84B;
    (=ucs@jis		. #x0426)	; &J90-2738;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
      (=jis-x0208	  . #x2739)	; &J90-2739;
      (=gb2312		  . #x2739)	; &I-G0-2739;
      (=ks-x1001	  . #x2C39)	; &I-K0-2C39;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      ))
    (=ucs		. #x0427)	; Ч
    (cyrillic-iso8859-5 . #xC7)	; &I-CYRILLIC-47;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
    (=>ucs		. #x0427)	; Ч
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0427)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER CHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      ))
    (=jis-x0208		. #x2739)	; &J90-2739;
    (=gb2312		. #x2739)	; &I-G0-2739;
    (=ks-x1001		. #x2C39)	; &I-K0-2C39;
    (=big5-eten		. #xC84C)	; &B-C84C;
    (=ucs@jis		. #x0427)	; &J90-2739;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
      (=jis-x0208	  . #x273A)	; &J90-273A;
      (=gb2312		  . #x273A)	; &I-G0-273A;
      (=ks-x1001	  . #x2C3A)	; &I-K0-2C3A;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; ш
      ))
    (=ucs		. #x0428)	; Ш
    (cyrillic-iso8859-5 . #xC8)	; &I-CYRILLIC-48;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
    (=>ucs		. #x0428)	; Ш
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0428)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ш
      ))
    (=jis-x0208		. #x273A)	; &J90-273A;
    (=gb2312		. #x273A)	; &I-G0-273A;
    (=ks-x1001		. #x2C3A)	; &I-K0-2C3A;
    (=big5-eten		. #xC84D)	; &B-C84D;
    (=ucs@jis		. #x0428)	; &J90-273A;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHCHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
      (=jis-x0208	  . #x273B)	; &J90-273B;
      (=gb2312		  . #x273B)	; &I-G0-273B;
      (=ks-x1001	  . #x2C3B)	; &I-K0-2C3B;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; щ
      ))
    (=ucs		. #x0429)	; Щ
    (cyrillic-iso8859-5 . #xC9)	; &I-CYRILLIC-49;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
    (=>ucs		. #x0429)	; Щ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0429)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Щ
      ))
    (=jis-x0208		. #x273B)	; &J90-273B;
    (=gb2312		. #x273B)	; &I-G0-273B;
    (=ks-x1001		. #x2C3B)	; &I-K0-2C3B;
    (=big5-eten		. #xC84E)	; &B-C84E;
    (=ucs@jis		. #x0429)	; &J90-273B;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HARD SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      (=jis-x0208	  . #x273C)	; &J90-273C;
      (=gb2312		  . #x273C)	; &I-G0-273C;
      (=ks-x1001	  . #x2C3C)	; &I-K0-2C3C;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ъ
      ))
    (=ucs		. #x042A)	; Ъ
    (cyrillic-iso8859-5 . #xCA)	; &I-CYRILLIC-4A;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
    (=>ucs		. #x042A)	; Ъ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042A)
    (->lowercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ъ
      ))
    (=jis-x0208		. #x273C)	; &J90-273C;
    (=gb2312		. #x273C)	; &I-G0-273C;
    (=ks-x1001		. #x2C3C)	; &I-K0-2C3C;
    (=big5-eten		. #xC84F)	; &B-C84F;
    (=ucs@jis		. #x042A)	; &J90-273C;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
      (=jis-x0208	  . #x273D)	; &J90-273D;
      (=gb2312		  . #x273D)	; &I-G0-273D;
      (=ks-x1001	  . #x2C3D)	; &I-K0-2C3D;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      ))
    (=ucs		. #x042B)	; Ы
    (cyrillic-iso8859-5 . #xCB)	; &I-CYRILLIC-4B;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
    (=>ucs		. #x042B)	; Ы
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042B)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YERU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      ))
    (=jis-x0208		. #x273D)	; &J90-273D;
    (=gb2312		. #x273D)	; &I-G0-273D;
    (=ks-x1001		. #x2C3D)	; &I-K0-2C3D;
    (=big5-eten		. #xC850)	; &B-C850;
    (=ucs@jis		. #x042B)	; &J90-273D;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=jis-x0208	  . #x273E)	; &J90-273E;
      (=gb2312		  . #x273E)	; &I-G0-273E;
      (=ks-x1001	  . #x2C3E)	; &I-K0-2C3E;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ь
      ))
    (=ucs		. #x042C)	; Ь
    (cyrillic-iso8859-5 . #xCC)	; &I-CYRILLIC-4C;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
    (=>ucs		. #x042C)	; Ь
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042C)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ь
      ))
    (=jis-x0208		. #x273E)	; &J90-273E;
    (=gb2312		. #x273E)	; &I-G0-273E;
    (=ks-x1001		. #x2C3E)	; &I-K0-2C3E;
    (=big5-eten		. #xC851)	; &B-C851;
    (=ucs@jis		. #x042C)	; &J90-273E;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER E")
      (=jis-x0208	  . #x273F)	; &J90-273F;
      (=gb2312		  . #x273F)	; &I-G0-273F;
      (=ks-x1001	  . #x2C3F)	; &I-K0-2C3F;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      ))
    (=ucs		. #x042D)	; Э
    (cyrillic-iso8859-5 . #xCD)	; &I-CYRILLIC-4D;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER E")
    (=>ucs		. #x042D)	; Э
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042D)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER E")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      ))
    (=jis-x0208		. #x273F)	; &J90-273F;
    (=gb2312		. #x273F)	; &I-G0-273F;
    (=ks-x1001		. #x2C3F)	; &I-K0-2C3F;
    (=big5-eten		. #xC852)	; &B-C852;
    (=ucs@jis		. #x042D)	; &J90-273F;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
      (=jis-x0208	  . #x2740)	; &J90-2740;
      (=gb2312		  . #x2740)	; &I-G0-2740;
      (=ks-x1001	  . #x2C40)	; &I-K0-2C40;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ю
      ))
    (=ucs		. #x042E)	; Ю
    (cyrillic-iso8859-5 . #xCE)	; &I-CYRILLIC-4E;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
    (=>ucs		. #x042E)	; Ю
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042E)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ю
      ))
    (=jis-x0208		. #x2740)	; &J90-2740;
    (=gb2312		. #x2740)	; &I-G0-2740;
    (=ks-x1001		. #x2C40)	; &I-K0-2C40;
    (=big5-eten		. #xC853)	; &B-C853;
    (=ucs@jis		. #x042E)	; &J90-2740;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YA")
      (=jis-x0208	  . #x2741)	; &J90-2741;
      (=gb2312		  . #x2741)	; &I-G0-2741;
      (=ks-x1001	  . #x2C41)	; &I-K0-2C41;
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; я
      ))
    (=ucs		. #x042F)	; Я
    (cyrillic-iso8859-5 . #xCF)	; &I-CYRILLIC-4F;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC CAPITAL LETTER YA")
    (=>ucs		. #x042F)	; Я
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x042F)
    (->lowercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Я
      ))
    (=jis-x0208		. #x2741)	; &J90-2741;
    (=gb2312		. #x2741)	; &I-G0-2741;
    (=ks-x1001		. #x2C41)	; &I-K0-2C41;
    (=big5-eten		. #xC854)	; &B-C854;
    (=ucs@jis		. #x042F)	; &J90-2741;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER A")
      (=jis-x0208	  . #x2751)	; &J90-2751;
      (=gb2312		  . #x2751)	; &I-G0-2751;
      (=ks-x1001	  . #x2C51)	; &I-K0-2C51;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      ))
    (=ucs		. #x0430)	; а
    (cyrillic-iso8859-5 . #xD0)	; &I-CYRILLIC-50;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER A")
    (=>ucs		. #x0430)	; а
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0430)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER A")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      ))
    (=jis-x0208		. #x2751)	; &J90-2751;
    (=gb2312		. #x2751)	; &I-G0-2751;
    (=ks-x1001		. #x2C51)	; &I-K0-2C51;
    (=big5-eten		. #xC855)	; &B-C855;
    (=ucs@jis		. #x0430)	; &J90-2751;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER BE")
      (=jis-x0208	  . #x2752)	; &J90-2752;
      (=gb2312		  . #x2752)	; &I-G0-2752;
      (=ks-x1001	  . #x2C52)	; &I-K0-2C52;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Б
      ))
    (=ucs		. #x0431)	; б
    (cyrillic-iso8859-5 . #xD1)	; &I-CYRILLIC-51;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER BE")
    (=>ucs		. #x0431)	; б
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0431)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; б
      ))
    (=jis-x0208		. #x2752)	; &J90-2752;
    (=gb2312		. #x2752)	; &I-G0-2752;
    (=ks-x1001		. #x2C52)	; &I-K0-2C52;
    (=big5-eten		. #xC856)	; &B-C856;
    (=ucs@jis		. #x0431)	; &J90-2752;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER VE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER VE")
      (=jis-x0208	  . #x2753)	; &J90-2753;
      (=gb2312		  . #x2753)	; &I-G0-2753;
      (=ks-x1001	  . #x2C53)	; &I-K0-2C53;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; В
      ))
    (=ucs		. #x0432)	; в
    (cyrillic-iso8859-5 . #xD2)	; &I-CYRILLIC-52;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER VE")
    (=>ucs		. #x0432)	; в
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0432)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; в
      ))
    (=jis-x0208		. #x2753)	; &J90-2753;
    (=gb2312		. #x2753)	; &I-G0-2753;
    (=ks-x1001		. #x2C53)	; &I-K0-2C53;
    (=big5-eten		. #xC857)	; &B-C857;
    (=ucs@jis		. #x0432)	; &J90-2753;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GHE")
      (=jis-x0208	  . #x2754)	; &J90-2754;
      (=gb2312		  . #x2754)	; &I-G0-2754;
      (=ks-x1001	  . #x2C54)	; &I-K0-2C54;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      ))
    (=ucs		. #x0433)	; г
    (cyrillic-iso8859-5 . #xD3)	; &I-CYRILLIC-53;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER GHE")
    (=>ucs		. #x0433)	; г
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0433)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      ))
    (=jis-x0208		. #x2754)	; &J90-2754;
    (=gb2312		. #x2754)	; &I-G0-2754;
    (=ks-x1001		. #x2C54)	; &I-K0-2C54;
    (=big5-eten		. #xC858)	; &B-C858;
    (=ucs@jis		. #x0433)	; &J90-2754;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DE")
      (=jis-x0208	  . #x2755)	; &J90-2755;
      (=gb2312		  . #x2755)	; &I-G0-2755;
      (=ks-x1001	  . #x2C55)	; &I-K0-2C55;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Д
      ))
    (=ucs		. #x0434)	; д
    (cyrillic-iso8859-5 . #xD4)	; &I-CYRILLIC-54;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DE")
    (=>ucs		. #x0434)	; д
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0434)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; д
      ))
    (=jis-x0208		. #x2755)	; &J90-2755;
    (=gb2312		. #x2755)	; &I-G0-2755;
    (=ks-x1001		. #x2C55)	; &I-K0-2C55;
    (=big5-eten		. #xC859)	; &B-C859;
    (=ucs@jis		. #x0434)	; &J90-2755;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IE")
      (=jis-x0208	  . #x2756)	; &J90-2756;
      (=gb2312		  . #x2756)	; &I-G0-2756;
      (=ks-x1001	  . #x2C56)	; &I-K0-2C56;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      ))
    (=ucs		. #x0435)	; е
    (cyrillic-iso8859-5 . #xD5)	; &I-CYRILLIC-55;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER IE")
    (=>ucs		. #x0435)	; е
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0435)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      ))
    (=jis-x0208		. #x2756)	; &J90-2756;
    (=gb2312		. #x2756)	; &I-G0-2756;
    (=ks-x1001		. #x2C56)	; &I-K0-2C56;
    (=big5-eten		. #xC85A)	; &B-C85A;
    (=ucs@jis		. #x0435)	; &J90-2756;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
      (=jis-x0208	  . #x2758)	; &J90-2758;
      (=gb2312		  . #x2758)	; &I-G0-2758;
      (=ks-x1001	  . #x2C58)	; &I-K0-2C58;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      ))
    (=ucs		. #x0436)	; ж
    (cyrillic-iso8859-5 . #xD6)	; &I-CYRILLIC-56;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
    (=>ucs		. #x0436)	; ж
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0436)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      ))
    (=jis-x0208		. #x2758)	; &J90-2758;
    (=gb2312		. #x2758)	; &I-G0-2758;
    (=ks-x1001		. #x2C58)	; &I-K0-2C58;
    (=big5-eten		. #xC85C)	; &B-C85C;
    (=ucs@jis		. #x0436)	; &J90-2758;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZE")
      (=jis-x0208	  . #x2759)	; &J90-2759;
      (=gb2312		  . #x2759)	; &I-G0-2759;
      (=ks-x1001	  . #x2C59)	; &I-K0-2C59;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      ))
    (=ucs		. #x0437)	; з
    (cyrillic-iso8859-5 . #xD7)	; &I-CYRILLIC-57;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ZE")
    (=>ucs		. #x0437)	; з
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0437)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      ))
    (=jis-x0208		. #x2759)	; &J90-2759;
    (=gb2312		. #x2759)	; &I-G0-2759;
    (=ks-x1001		. #x2C59)	; &I-K0-2C59;
    (=big5-eten		. #xC85D)	; &B-C85D;
    (=ucs@jis		. #x0437)	; &J90-2759;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER I")
      (=jis-x0208	  . #x275A)	; &J90-275A;
      (=gb2312		  . #x275A)	; &I-G0-275A;
      (=ks-x1001	  . #x2C5A)	; &I-K0-2C5A;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      ))
    (=ucs		. #x0438)	; и
    (cyrillic-iso8859-5 . #xD8)	; &I-CYRILLIC-58;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER I")
    (=>ucs		. #x0438)	; и
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0438)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      ))
    (=jis-x0208		. #x275A)	; &J90-275A;
    (=gb2312		. #x275A)	; &I-G0-275A;
    (=ks-x1001		. #x2C5A)	; &I-K0-2C5A;
    (=big5-eten		. #xC85E)	; &B-C85E;
    (=ucs@jis		. #x0438)	; &J90-275A;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
      (=jis-x0208	  . #x275B)	; &J90-275B;
      (=gb2312		  . #x275B)	; &I-G0-275B;
      (=ks-x1001	  . #x2C5B)	; &I-K0-2C5B;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Й
      ))
    (=ucs		. #x0439)	; й
    (cyrillic-iso8859-5 . #xD9)	; &I-CYRILLIC-59;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
    (=>ucs		. #x0439)	; й
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0439)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; й
      ))
    (=jis-x0208		. #x275B)	; &J90-275B;
    (=gb2312		. #x275B)	; &I-G0-275B;
    (=ks-x1001		. #x2C5B)	; &I-K0-2C5B;
    (=big5-eten		. #xC85F)	; &B-C85F;
    (=ucs@jis		. #x0439)	; &J90-275B;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KA")
      (=jis-x0208	  . #x275C)	; &J90-275C;
      (=gb2312		  . #x275C)	; &I-G0-275C;
      (=ks-x1001	  . #x2C5C)	; &I-K0-2C5C;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      ))
    (=ucs		. #x043A)	; к
    (cyrillic-iso8859-5 . #xDA)	; &I-CYRILLIC-5A;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER KA")
    (=>ucs		. #x043A)	; к
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043A)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      ))
    (=jis-x0208		. #x275C)	; &J90-275C;
    (=gb2312		. #x275C)	; &I-G0-275C;
    (=ks-x1001		. #x2C5C)	; &I-K0-2C5C;
    (=big5-eten		. #xC860)	; &B-C860;
    (=ucs@jis		. #x043A)	; &J90-275C;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EL")
      (=jis-x0208	  . #x275D)	; &J90-275D;
      (=gb2312		  . #x275D)	; &I-G0-275D;
      (=ks-x1001	  . #x2C5D)	; &I-K0-2C5D;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Л
      ))
    (=ucs		. #x043B)	; л
    (cyrillic-iso8859-5 . #xDB)	; &I-CYRILLIC-5B;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EL")
    (=>ucs		. #x043B)	; л
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043B)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; л
      ))
    (=jis-x0208		. #x275D)	; &J90-275D;
    (=gb2312		. #x275D)	; &I-G0-275D;
    (=ks-x1001		. #x2C5D)	; &I-K0-2C5D;
    (=big5-eten		. #xC861)	; &B-C861;
    (=ucs@jis		. #x043B)	; &J90-275D;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EM")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EM")
      (=jis-x0208	  . #x275E)	; &J90-275E;
      (=gb2312		  . #x275E)	; &I-G0-275E;
      (=ks-x1001	  . #x2C5E)	; &I-K0-2C5E;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; М
      ))
    (=ucs		. #x043C)	; м
    (cyrillic-iso8859-5 . #xDC)	; &I-CYRILLIC-5C;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EM")
    (=>ucs		. #x043C)	; м
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043C)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; м
      ))
    (=jis-x0208		. #x275E)	; &J90-275E;
    (=gb2312		. #x275E)	; &I-G0-275E;
    (=ks-x1001		. #x2C5E)	; &I-K0-2C5E;
    (=big5-eten		. #xC862)	; &B-C862;
    (=ucs@jis		. #x043C)	; &J90-275E;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EN")
      (=jis-x0208	  . #x275F)	; &J90-275F;
      (=gb2312		  . #x275F)	; &I-G0-275F;
      (=ks-x1001	  . #x2C5F)	; &I-K0-2C5F;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Н
      ))
    (=ucs		. #x043D)	; н
    (cyrillic-iso8859-5 . #xDD)	; &I-CYRILLIC-5D;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EN")
    (=>ucs		. #x043D)	; н
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043D)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; н
      ))
    (=jis-x0208		. #x275F)	; &J90-275F;
    (=gb2312		. #x275F)	; &I-G0-275F;
    (=ks-x1001		. #x2C5F)	; &I-K0-2C5F;
    (=big5-eten		. #xC863)	; &B-C863;
    (=ucs@jis		. #x043D)	; &J90-275F;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER O")
      (=jis-x0208	  . #x2760)	; &J90-2760;
      (=gb2312		  . #x2760)	; &I-G0-2760;
      (=ks-x1001	  . #x2C60)	; &I-K0-2C60;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      ))
    (=ucs		. #x043E)	; о
    (cyrillic-iso8859-5 . #xDE)	; &I-CYRILLIC-5E;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER O")
    (=>ucs		. #x043E)	; о
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043E)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER O")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      ))
    (=jis-x0208		. #x2760)	; &J90-2760;
    (=gb2312		. #x2760)	; &I-G0-2760;
    (=ks-x1001		. #x2C60)	; &I-K0-2C60;
    (=big5-eten		. #xC864)	; &B-C864;
    (=ucs@jis		. #x043E)	; &J90-2760;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER PE")
      (=jis-x0208	  . #x2761)	; &J90-2761;
      (=gb2312		  . #x2761)	; &I-G0-2761;
      (=ks-x1001	  . #x2C61)	; &I-K0-2C61;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; П
      ))
    (=ucs		. #x043F)	; п
    (cyrillic-iso8859-5 . #xDF)	; &I-CYRILLIC-5F;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER PE")
    (=>ucs		. #x043F)	; п
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x043F)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; п
      ))
    (=jis-x0208		. #x2761)	; &J90-2761;
    (=gb2312		. #x2761)	; &I-G0-2761;
    (=ks-x1001		. #x2C61)	; &I-K0-2C61;
    (=big5-eten		. #xC865)	; &B-C865;
    (=ucs@jis		. #x043F)	; &J90-2761;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ER")
      (=jis-x0208	  . #x2762)	; &J90-2762;
      (=gb2312		  . #x2762)	; &I-G0-2762;
      (=ks-x1001	  . #x2C62)	; &I-K0-2C62;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Р
      ))
    (=ucs		. #x0440)	; р
    (cyrillic-iso8859-5 . #xE0)	; &I-CYRILLIC-60;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ER")
    (=>ucs		. #x0440)	; р
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0440)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; р
      ))
    (=jis-x0208		. #x2762)	; &J90-2762;
    (=gb2312		. #x2762)	; &I-G0-2762;
    (=ks-x1001		. #x2C62)	; &I-K0-2C62;
    (=big5-eten		. #xC866)	; &B-C866;
    (=ucs@jis		. #x0440)	; &J90-2762;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ES")
      (=jis-x0208	  . #x2763)	; &J90-2763;
      (=gb2312		  . #x2763)	; &I-G0-2763;
      (=ks-x1001	  . #x2C63)	; &I-K0-2C63;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; С
      ))
    (=ucs		. #x0441)	; с
    (cyrillic-iso8859-5 . #xE1)	; &I-CYRILLIC-61;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER ES")
    (=>ucs		. #x0441)	; с
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0441)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; с
      ))
    (=jis-x0208		. #x2763)	; &J90-2763;
    (=gb2312		. #x2763)	; &I-G0-2763;
    (=ks-x1001		. #x2C63)	; &I-K0-2C63;
    (=big5-eten		. #xC867)	; &B-C867;
    (=ucs@jis		. #x0441)	; &J90-2763;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TE")
      (=jis-x0208	  . #x2764)	; &J90-2764;
      (=gb2312		  . #x2764)	; &I-G0-2764;
      (=ks-x1001	  . #x2C64)	; &I-K0-2C64;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Т
      ))
    (=ucs		. #x0442)	; т
    (cyrillic-iso8859-5 . #xE2)	; &I-CYRILLIC-62;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TE")
    (=>ucs		. #x0442)	; т
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0442)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; т
      ))
    (=jis-x0208		. #x2764)	; &J90-2764;
    (=gb2312		. #x2764)	; &I-G0-2764;
    (=ks-x1001		. #x2C64)	; &I-K0-2C64;
    (=big5-eten		. #xC868)	; &B-C868;
    (=ucs@jis		. #x0442)	; &J90-2764;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER U")
      (=jis-x0208	  . #x2765)	; &J90-2765;
      (=gb2312		  . #x2765)	; &I-G0-2765;
      (=ks-x1001	  . #x2C65)	; &I-K0-2C65;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      ))
    (=ucs		. #x0443)	; у
    (cyrillic-iso8859-5 . #xE3)	; &I-CYRILLIC-63;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER U")
    (=>ucs		. #x0443)	; у
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0443)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER U")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      ))
    (=jis-x0208		. #x2765)	; &J90-2765;
    (=gb2312		. #x2765)	; &I-G0-2765;
    (=ks-x1001		. #x2C65)	; &I-K0-2C65;
    (=big5-eten		. #xC869)	; &B-C869;
    (=ucs@jis		. #x0443)	; &J90-2765;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EF")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EF")
      (=jis-x0208	  . #x2766)	; &J90-2766;
      (=gb2312		  . #x2766)	; &I-G0-2766;
      (=ks-x1001	  . #x2C66)	; &I-K0-2C66;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ф
      ))
    (=ucs		. #x0444)	; ф
    (cyrillic-iso8859-5 . #xE4)	; &I-CYRILLIC-64;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER EF")
    (=>ucs		. #x0444)	; ф
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0444)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; ф
      ))
    (=jis-x0208		. #x2766)	; &J90-2766;
    (=gb2312		. #x2766)	; &I-G0-2766;
    (=ks-x1001		. #x2C66)	; &I-K0-2C66;
    (=big5-eten		. #xC86A)	; &B-C86A;
    (=ucs@jis		. #x0444)	; &J90-2766;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HA")
      (=jis-x0208	  . #x2767)	; &J90-2767;
      (=gb2312		  . #x2767)	; &I-G0-2767;
      (=ks-x1001	  . #x2C67)	; &I-K0-2C67;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Х
      ))
    (=ucs		. #x0445)	; х
    (cyrillic-iso8859-5 . #xE5)	; &I-CYRILLIC-65;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER HA")
    (=>ucs		. #x0445)	; х
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0445)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; х
      ))
    (=jis-x0208		. #x2767)	; &J90-2767;
    (=gb2312		. #x2767)	; &I-G0-2767;
    (=ks-x1001		. #x2C67)	; &I-K0-2C67;
    (=big5-eten		. #xC86B)	; &B-C86B;
    (=ucs@jis		. #x0445)	; &J90-2767;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSE")
      (=jis-x0208	  . #x2768)	; &J90-2768;
      (=gb2312		  . #x2768)	; &I-G0-2768;
      (=ks-x1001	  . #x2C68)	; &I-K0-2C68;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ц
      ))
    (=ucs		. #x0446)	; ц
    (cyrillic-iso8859-5 . #xE6)	; &I-CYRILLIC-66;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TSE")
    (=>ucs		. #x0446)	; ц
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0446)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; ц
      ))
    (=jis-x0208		. #x2768)	; &J90-2768;
    (=gb2312		. #x2768)	; &I-G0-2768;
    (=ks-x1001		. #x2C68)	; &I-K0-2C68;
    (=big5-eten		. #xC86C)	; &B-C86C;
    (=ucs@jis		. #x0446)	; &J90-2768;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER CHE")
      (=jis-x0208	  . #x2769)	; &J90-2769;
      (=gb2312		  . #x2769)	; &I-G0-2769;
      (=ks-x1001	  . #x2C69)	; &I-K0-2C69;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      ))
    (=ucs		. #x0447)	; ч
    (cyrillic-iso8859-5 . #xE7)	; &I-CYRILLIC-67;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER CHE")
    (=>ucs		. #x0447)	; ч
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0447)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      ))
    (=jis-x0208		. #x2769)	; &J90-2769;
    (=gb2312		. #x2769)	; &I-G0-2769;
    (=ks-x1001		. #x2C69)	; &I-K0-2C69;
    (=big5-eten		. #xC86D)	; &B-C86D;
    (=ucs@jis		. #x0447)	; &J90-2769;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHA")
      (=jis-x0208	  . #x276A)	; &J90-276A;
      (=gb2312		  . #x276A)	; &I-G0-276A;
      (=ks-x1001	  . #x2C6A)	; &I-K0-2C6A;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ш
      ))
    (=ucs		. #x0448)	; ш
    (cyrillic-iso8859-5 . #xE8)	; &I-CYRILLIC-68;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHA")
    (=>ucs		. #x0448)	; ш
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0448)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; ш
      ))
    (=jis-x0208		. #x276A)	; &J90-276A;
    (=gb2312		. #x276A)	; &I-G0-276A;
    (=ks-x1001		. #x2C6A)	; &I-K0-2C6A;
    (=big5-eten		. #xC86E)	; &B-C86E;
    (=ucs@jis		. #x0448)	; &J90-276A;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHCHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
      (=jis-x0208	  . #x276B)	; &J90-276B;
      (=gb2312		  . #x276B)	; &I-G0-276B;
      (=ks-x1001	  . #x2C6B)	; &I-K0-2C6B;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Щ
      ))
    (=ucs		. #x0449)	; щ
    (cyrillic-iso8859-5 . #xE9)	; &I-CYRILLIC-69;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
    (=>ucs		. #x0449)	; щ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0449)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; щ
      ))
    (=jis-x0208		. #x276B)	; &J90-276B;
    (=gb2312		. #x276B)	; &I-G0-276B;
    (=ks-x1001		. #x2C6B)	; &I-K0-2C6B;
    (=big5-eten		. #xC86F)	; &B-C86F;
    (=ucs@jis		. #x0449)	; &J90-276B;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HARD SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HARD SIGN")
      (=jis-x0208	  . #x276C)	; &J90-276C;
      (=gb2312		  . #x276C)	; &I-G0-276C;
      (=ks-x1001	  . #x2C6C)	; &I-K0-2C6C;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ъ
      ))
    (=ucs		. #x044A)	; ъ
    (cyrillic-iso8859-5 . #xEA)	; &I-CYRILLIC-6A;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER HARD SIGN")
    (=>ucs		. #x044A)	; ъ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044A)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ъ
      ))
    (=jis-x0208		. #x276C)	; &J90-276C;
    (=gb2312		. #x276C)	; &I-G0-276C;
    (=ks-x1001		. #x2C6C)	; &I-K0-2C6C;
    (=big5-eten		. #xC870)	; &B-C870;
    (=ucs@jis		. #x044A)	; &J90-276C;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YERU")
      (=jis-x0208	  . #x276D)	; &J90-276D;
      (=gb2312		  . #x276D)	; &I-G0-276D;
      (=ks-x1001	  . #x2C6D)	; &I-K0-2C6D;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      ))
    (=ucs		. #x044B)	; ы
    (cyrillic-iso8859-5 . #xEB)	; &I-CYRILLIC-6B;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YERU")
    (=>ucs		. #x044B)	; ы
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044B)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      ))
    (=jis-x0208		. #x276D)	; &J90-276D;
    (=gb2312		. #x276D)	; &I-G0-276D;
    (=ks-x1001		. #x2C6D)	; &I-K0-2C6D;
    (=big5-eten		. #xC871)	; &B-C871;
    (=ucs@jis		. #x044B)	; &J90-276D;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
      (=jis-x0208	  . #x276E)	; &J90-276E;
      (=gb2312		  . #x276E)	; &I-G0-276E;
      (=ks-x1001	  . #x2C6E)	; &I-K0-2C6E;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ь
      ))
    (=ucs		. #x044C)	; ь
    (cyrillic-iso8859-5 . #xEC)	; &I-CYRILLIC-6C;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
    (=>ucs		. #x044C)	; ь
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044C)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ь
      ))
    (=jis-x0208		. #x276E)	; &J90-276E;
    (=gb2312		. #x276E)	; &I-G0-276E;
    (=ks-x1001		. #x2C6E)	; &I-K0-2C6E;
    (=big5-eten		. #xC872)	; &B-C872;
    (=ucs@jis		. #x044C)	; &J90-276E;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER E")
      (=jis-x0208	  . #x276F)	; &J90-276F;
      (=gb2312		  . #x276F)	; &I-G0-276F;
      (=ks-x1001	  . #x2C6F)	; &I-K0-2C6F;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      ))
    (=ucs		. #x044D)	; э
    (cyrillic-iso8859-5 . #xED)	; &I-CYRILLIC-6D;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER E")
    (=>ucs		. #x044D)	; э
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044D)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER E")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      ))
    (=jis-x0208		. #x276F)	; &J90-276F;
    (=gb2312		. #x276F)	; &I-G0-276F;
    (=ks-x1001		. #x2C6F)	; &I-K0-2C6F;
    (=big5-eten		. #xC873)	; &B-C873;
    (=ucs@jis		. #x044D)	; &J90-276F;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YU")
      (=jis-x0208	  . #x2770)	; &J90-2770;
      (=gb2312		  . #x2770)	; &I-G0-2770;
      (=ks-x1001	  . #x2C70)	; &I-K0-2C70;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ю
      ))
    (=ucs		. #x044E)	; ю
    (cyrillic-iso8859-5 . #xEE)	; &I-CYRILLIC-6E;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YU")
    (=>ucs		. #x044E)	; ю
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044E)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ю
      ))
    (=jis-x0208		. #x2770)	; &J90-2770;
    (=gb2312		. #x2770)	; &I-G0-2770;
    (=ks-x1001		. #x2C70)	; &I-K0-2C70;
    (=big5-eten		. #xC874)	; &B-C874;
    (=ucs@jis		. #x044E)	; &J90-2770;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      (=jis-x0208	  . #x2771)	; &J90-2771;
      (=gb2312		  . #x2771)	; &I-G0-2771;
      (=ks-x1001	  . #x2C71)	; &I-K0-2C71;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Я
      ))
    (=ucs		. #x044F)	; я
    (cyrillic-iso8859-5 . #xEF)	; &I-CYRILLIC-6F;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YA")
    (=>ucs		. #x044F)	; я
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x044F)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; я
      ))
    (=jis-x0208		. #x2771)	; &J90-2771;
    (=gb2312		. #x2771)	; &I-G0-2771;
    (=ks-x1001		. #x2C71)	; &I-K0-2C71;
    (=big5-eten		. #xC875)	; &B-C875;
    (=ucs@jis		. #x044F)	; &J90-2771;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0300)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
      (=ucs		  . #x0400)	; Ѐ
      ))
    (=ucs		. #x0450)	; ѐ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0308)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IO")
      (=jis-x0208	  . #x2757)	; &J90-2757;
      (=gb2312		  . #x2757)	; &I-G0-2757;
      (=ks-x1001	  . #x2C57)	; &I-K0-2C57;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ё
      ))
    (=ucs		. #x0451)	; ё
    (cyrillic-iso8859-5 . #xF1)	; &I-CYRILLIC-71;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER IO")
    (=>ucs		. #x0451)	; ё
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0451)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IO")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; ё
      ))
    (=jis-x0208		. #x2757)	; &J90-2757;
    (=gb2312		. #x2757)	; &I-G0-2757;
    (=ks-x1001		. #x2C57)	; &I-K0-2C57;
    (=big5-eten		. #xC85B)	; &B-C85B;
    (=ucs@jis		. #x0451)	; &J90-2757;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DJE")
      (=jis-x0212	  . #x2772)	; &JSP-2772;
      (=ucs@jis		  . #x0452)	; &JSP-2772;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ђ
      ))
    (=ucs		. #x0452)	; ђ
    (cyrillic-iso8859-5 . #xF2)	; &I-CYRILLIC-72;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DJE")
    (=>ucs		. #x0452)	; ђ
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
      (=ucs		  . #x0452)	; ђ
      ))
    (=jis-x0212		. #x2772)	; &JSP-2772;
    (=ucs@jis		. #x0452)	; &JSP-2772;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0433 #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GJE")
      (=jis-x0212	  . #x2773)	; &JSP-2773;
      (=ucs@jis		  . #x0453)	; &JSP-2773;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ѓ
      ))
    (=ucs		. #x0453)	; ѓ
    (cyrillic-iso8859-5 . #xF3)	; &I-CYRILLIC-73;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER GJE")
    (=>ucs		. #x0453)	; ѓ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0453)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; ѓ
      ))
    (=jis-x0212		. #x2773)	; &JSP-2773;
    (=ucs@jis		. #x0453)	; &JSP-2773;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UKRAINIAN IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=jis-x0212	  . #x2774)	; &JSP-2774;
      (=ucs@jis		  . #x0454)	; &JSP-2774;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Є
      ))
    (=ucs		. #x0454)	; є
    (cyrillic-iso8859-5 . #xF4)	; &I-CYRILLIC-74;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
    (=>ucs		. #x0454)	; є
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0454)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; є
      ))
    (=jis-x0212		. #x2774)	; &JSP-2774;
    (=ucs@jis		. #x0454)	; &JSP-2774;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZE")
      (=jis-x0212	  . #x2775)	; &JSP-2775;
      (=ucs@jis		  . #x0455)	; &JSP-2775;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ѕ
      ))
    (=ucs		. #x0455)	; ѕ
    (cyrillic-iso8859-5 . #xF5)	; &I-CYRILLIC-75;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DZE")
    (=>ucs		. #x0455)	; ѕ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0455)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; ѕ
      ))
    (=jis-x0212		. #x2775)	; &JSP-2775;
    (=ucs@jis		. #x0455)	; &JSP-2775;
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=jis-x0212	  . #x2776)	; &JSP-2776;
      (=ucs@jis		  . #x0456)	; &JSP-2776;
      ))
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      ))
    (=ucs		. #x0456)	; і
    (cyrillic-iso8859-5 . #xF6)	; &I-CYRILLIC-76;
    ))
(define-char
  '((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (=>ucs		. #x0456)	; і
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0456)
    (->uppercase
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      ))
    (<-fullwidth
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      ))
    (=jis-x0212		. #x2776)	; &JSP-2776;
    (=ucs@jis		. #x0456)	; &JSP-2776;
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
      (=jis-x0212	  . #x2777)	; &JSP-2777;
      (=ucs@jis		  . #x0457)	; &JSP-2777;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ї
      ))
    (=ucs		. #x0457)	; ї
    (cyrillic-iso8859-5 . #xF7)	; &I-CYRILLIC-77;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER YI")
    (=>ucs		. #x0457)	; ї
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
      (=ucs		  . #x0457)	; ї
      ))
    (=jis-x0212		. #x2777)	; &JSP-2777;
    (=ucs@jis		. #x0457)	; &JSP-2777;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER JE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER JE")
      (=jis-x0212	  . #x2778)	; &JSP-2778;
      (=ucs@jis		  . #x0458)	; &JSP-2778;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ј
      ))
    (=ucs		. #x0458)	; ј
    (cyrillic-iso8859-5 . #xF8)	; &I-CYRILLIC-78;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER JE")
    (=>ucs		. #x0458)	; ј
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0458)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; ј
      ))
    (=jis-x0212		. #x2778)	; &JSP-2778;
    (=ucs@jis		. #x0458)	; &JSP-2778;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER LJE")
      (=jis-x0212	  . #x2779)	; &JSP-2779;
      (=ucs@jis		  . #x0459)	; &JSP-2779;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Љ
      ))
    (=ucs		. #x0459)	; љ
    (cyrillic-iso8859-5 . #xF9)	; &I-CYRILLIC-79;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER LJE")
    (=>ucs		. #x0459)	; љ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0459)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; љ
      ))
    (=jis-x0212		. #x2779)	; &JSP-2779;
    (=ucs@jis		. #x0459)	; &JSP-2779;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER NJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER NJE")
      (=jis-x0212	  . #x277A)	; &JSP-277A;
      (=ucs@jis		  . #x045A)	; &JSP-277A;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; Њ
      ))
    (=ucs		. #x045A)	; њ
    (cyrillic-iso8859-5 . #xFA)	; &I-CYRILLIC-7A;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER NJE")
    (=>ucs		. #x045A)	; њ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045A)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; њ
      ))
    (=jis-x0212		. #x277A)	; &JSP-277A;
    (=ucs@jis		. #x045A)	; &JSP-277A;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
      (=jis-x0212	  . #x277B)	; &JSP-277B;
      (=ucs@jis		  . #x045B)	; &JSP-277B;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSHE")
      (=ucs		  . #x040B)	; Ћ
      ))
    (=ucs		. #x045B)	; ћ
    (cyrillic-iso8859-5 . #xFB)	; &I-CYRILLIC-7B;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
    (=>ucs		. #x045B)	; ћ
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
      (=ucs		  . #x045B)	; ћ
      ))
    (=jis-x0212		. #x277B)	; &JSP-277B;
    (=ucs@jis		. #x045B)	; &JSP-277B;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043A #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      (=jis-x0212	  . #x277C)	; &JSP-277C;
      (=ucs@jis		  . #x045C)	; &JSP-277C;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; Ќ
      ))
    (=ucs		. #x045C)	; ќ
    (cyrillic-iso8859-5 . #xFC)	; &I-CYRILLIC-7C;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER KJE")
    (=>ucs		. #x045C)	; ќ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045C)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; ќ
      ))
    (=jis-x0212		. #x277C)	; &JSP-277C;
    (=ucs@jis		. #x045C)	; &JSP-277C;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0300)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH GRAVE")
      (=ucs		  . #x040D)	; Ѝ
      ))
    (=ucs		. #x045D)	; ѝ
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
      (=jis-x0212	  . #x277D)	; &JSP-277D;
      (=ucs@jis		  . #x045E)	; &JSP-277D;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; Ў
      ))
    (=ucs		. #x045E)	; ў
    (cyrillic-iso8859-5 . #xFE)	; &I-CYRILLIC-7E;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER SHORT U")
    (=>ucs		. #x045E)	; ў
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
      (=ucs		  . #x045E)	; ў
      ))
    (=jis-x0212		. #x277D)	; &JSP-277D;
    (=ucs@jis		. #x045E)	; &JSP-277D;
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
      (=jis-x0212	  . #x277E)	; &JSP-277E;
      (=ucs@jis		  . #x045F)	; &JSP-277E;
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Џ
      ))
    (=ucs		. #x045F)	; џ
    (cyrillic-iso8859-5 . #xFF)	; &I-CYRILLIC-7F;
    ))
(define-char
  '((name		. "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
    (=>ucs		. #x045F)	; џ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x045F)
    (->uppercase
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
      ))
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; џ
      ))
    (=jis-x0212		. #x277E)	; &JSP-277E;
    (=ucs@jis		. #x045F)	; &JSP-277E;
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OMEGA")
      (=ucs		  . #x0461)	; ѡ
      ))
    (=ucs		. #x0460)	; Ѡ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OMEGA")
      (=ucs		  . #x0460)	; Ѡ
      ))
    (=ucs		. #x0461)	; ѡ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YAT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YAT")
      (=ucs		  . #x0463)	; ѣ
      ))
    (=ucs		. #x0462)	; Ѣ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YAT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YAT")
      (=ucs		  . #x0462)	; Ѣ
      ))
    (=ucs		. #x0463)	; ѣ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED E")
      (=ucs		  . #x0465)	; ѥ
      ))
    (=ucs		. #x0464)	; Ѥ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IOTIFIED E")
      (=ucs		  . #x0464)	; Ѥ
      ))
    (=ucs		. #x0465)	; ѥ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LITTLE YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LITTLE YUS")
      (=ucs		  . #x0467)	; ѧ
      ))
    (=ucs		. #x0466)	; Ѧ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LITTLE YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LITTLE YUS")
      (=ucs		  . #x0466)	; Ѧ
      ))
    (=ucs		. #x0467)	; ѧ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
      (=ucs		  . #x0469)	; ѩ
      ))
    (=ucs		. #x0468)	; Ѩ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
      (=ucs		  . #x0468)	; Ѩ
      ))
    (=ucs		. #x0469)	; ѩ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BIG YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BIG YUS")
      (=ucs		  . #x046B)	; ѫ
      ))
    (=ucs		. #x046A)	; Ѫ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BIG YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BIG YUS")
      (=ucs		  . #x046A)	; Ѫ
      ))
    (=ucs		. #x046B)	; ѫ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
      (=ucs		  . #x046D)	; ѭ
      ))
    (=ucs		. #x046C)	; Ѭ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
      (=ucs		  . #x046C)	; Ѭ
      ))
    (=ucs		. #x046D)	; ѭ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KSI")
      (=ucs		  . #x046F)	; ѯ
      ))
    (=ucs		. #x046E)	; Ѯ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KSI")
      (=ucs		  . #x046E)	; Ѯ
      ))
    (=ucs		. #x046F)	; ѯ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PSI")
      (=ucs		  . #x0471)	; ѱ
      ))
    (=ucs		. #x0470)	; Ѱ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PSI")
      (=ucs		  . #x0470)	; Ѱ
      ))
    (=ucs		. #x0471)	; ѱ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER FITA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER FITA")
      (=ucs		  . #x0473)	; ѳ
      ))
    (=ucs		. #x0472)	; Ѳ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER FITA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER FITA")
      (=ucs		  . #x0472)	; Ѳ
      ))
    (=ucs		. #x0473)	; ѳ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IZHITSA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IZHITSA")
      (=ucs		  . #x0475)	; ѵ
      ))
    (=ucs		. #x0474)	; Ѵ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IZHITSA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IZHITSA")
      (=ucs		  . #x0474)	; Ѵ
      ))
    (=ucs		. #x0475)	; ѵ
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0474 #x030F)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
      (=ucs		  . #x0477)	; ѷ
      ))
    (=ucs		. #x0476)	; Ѷ
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0475 #x030F)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
      (=ucs		  . #x0476)	; Ѷ
      ))
    (=ucs		. #x0477)	; ѷ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UK")
      (=ucs		  . #x0479)	; ѹ
      ))
    (=ucs		. #x0478)	; Ѹ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UK")
      (=ucs		  . #x0478)	; Ѹ
      ))
    (=ucs		. #x0479)	; ѹ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ROUND OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ROUND OMEGA")
      (=ucs		  . #x047B)	; ѻ
      ))
    (=ucs		. #x047A)	; Ѻ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ROUND OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ROUND OMEGA")
      (=ucs		  . #x047A)	; Ѻ
      ))
    (=ucs		. #x047B)	; ѻ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
      (=ucs		  . #x047D)	; ѽ
      ))
    (=ucs		. #x047C)	; Ѽ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
      (=ucs		  . #x047C)	; Ѽ
      ))
    (=ucs		. #x047D)	; ѽ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OT")
      (=ucs		  . #x047F)	; ѿ
      ))
    (=ucs		. #x047E)	; Ѿ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OT")
      (=ucs		  . #x047E)	; Ѿ
      ))
    (=ucs		. #x047F)	; ѿ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KOPPA")
      (=ucs		  . #x0481)	; ҁ
      ))
    (=ucs		. #x0480)	; Ҁ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KOPPA")
      (=ucs		  . #x0480)	; Ҁ
      ))
    (=ucs		. #x0481)	; ҁ
    ))
(define-char
  '((name		. "CYRILLIC THOUSANDS SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0482)	; ҂
    ))
(define-char
  '((name		. "COMBINING CYRILLIC TITLO")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0483)	; ҃
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PALATALIZATION")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0484)	; ҄
    ))
(define-char
  '((name		. "COMBINING CYRILLIC DASIA PNEUMATA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0485)	; ҅
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PSILI PNEUMATA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0486)	; ҆
    ))
(define-char
  '((name		. "COMBINING CYRILLIC HUNDRED THOUSANDS SIGN")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0488)	; ҈
    ))
(define-char
  '((name		. "COMBINING CYRILLIC MILLIONS SIGN")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0489)	; ҉
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SEMISOFT SIGN")
      (=ucs		  . #x048D)	; ҍ
      ))
    (=ucs		. #x048C)	; Ҍ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SEMISOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
      (=ucs		  . #x048C)	; Ҍ
      ))
    (=ucs		. #x048D)	; ҍ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER WITH TICK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER WITH TICK")
      (=ucs		  . #x048F)	; ҏ
      ))
    (=ucs		. #x048E)	; Ҏ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER WITH TICK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER WITH TICK")
      (=ucs		  . #x048E)	; Ҏ
      ))
    (=ucs		. #x048F)	; ҏ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH UPTURN")
      (=ucs		  . #x0491)	; ґ
      ))
    (=ucs		. #x0490)	; Ґ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH UPTURN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
      (=ucs		  . #x0490)	; Ґ
      ))
    (=ucs		. #x0491)	; ґ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH STROKE")
      (=ucs		  . #x0493)	; ғ
      ))
    (=ucs		. #x0492)	; Ғ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
      (=ucs		  . #x0492)	; Ғ
      ))
    (=ucs		. #x0493)	; ғ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
      (=ucs		  . #x0495)	; ҕ
      ))
    (=ucs		. #x0494)	; Ҕ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
      (=ucs		  . #x0494)	; Ҕ
      ))
    (=ucs		. #x0495)	; ҕ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
      (=ucs		  . #x0497)	; җ
      ))
    (=ucs		. #x0496)	; Җ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
      (=ucs		  . #x0496)	; Җ
      ))
    (=ucs		. #x0497)	; җ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
      (=ucs		  . #x0499)	; ҙ
      ))
    (=ucs		. #x0498)	; Ҙ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
      (=ucs		  . #x0498)	; Ҙ
      ))
    (=ucs		. #x0499)	; ҙ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH DESCENDER")
      (=ucs		  . #x049B)	; қ
      ))
    (=ucs		. #x049A)	; Қ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
      (=ucs		  . #x049A)	; Қ
      ))
    (=ucs		. #x049B)	; қ
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
      (=ucs		  . #x049D)	; ҝ
      ))
    (=ucs		. #x049C)	; Ҝ
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
      (=ucs		  . #x049C)	; Ҝ
      ))
    (=ucs		. #x049D)	; ҝ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH STROKE")
      (=ucs		  . #x049F)	; ҟ
      ))
    (=ucs		. #x049E)	; Ҟ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH STROKE")
      (=ucs		  . #x049E)	; Ҟ
      ))
    (=ucs		. #x049F)	; ҟ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BASHKIR KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BASHKIR KA")
      (=ucs		  . #x04A1)	; ҡ
      ))
    (=ucs		. #x04A0)	; Ҡ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BASHKIR KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BASHKIR KA")
      (=ucs		  . #x04A0)	; Ҡ
      ))
    (=ucs		. #x04A1)	; ҡ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN WITH DESCENDER")
      (=ucs		  . #x04A3)	; ң
      ))
    (=ucs		. #x04A2)	; Ң
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
      (=ucs		  . #x04A2)	; Ң
      ))
    (=ucs		. #x04A3)	; ң
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE EN GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE EN GHE")
      (=ucs		  . #x04A5)	; ҥ
      ))
    (=ucs		. #x04A4)	; Ҥ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE EN GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE EN GHE")
      (=ucs		  . #x04A4)	; Ҥ
      ))
    (=ucs		. #x04A5)	; ҥ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
      (=ucs		  . #x04A7)	; ҧ
      ))
    (=ucs		. #x04A6)	; Ҧ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
      (=ucs		  . #x04A6)	; Ҧ
      ))
    (=ucs		. #x04A7)	; ҧ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN HA")
      (=ucs		  . #x04A9)	; ҩ
      ))
    (=ucs		. #x04A8)	; Ҩ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
      (=ucs		  . #x04A8)	; Ҩ
      ))
    (=ucs		. #x04A9)	; ҩ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES WITH DESCENDER")
      (=ucs		  . #x04AB)	; ҫ
      ))
    (=ucs		. #x04AA)	; Ҫ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
      (=ucs		  . #x04AA)	; Ҫ
      ))
    (=ucs		. #x04AB)	; ҫ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE WITH DESCENDER")
      (=ucs		  . #x04AD)	; ҭ
      ))
    (=ucs		. #x04AC)	; Ҭ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
      (=ucs		  . #x04AC)	; Ҭ
      ))
    (=ucs		. #x04AD)	; ҭ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER STRAIGHT U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER STRAIGHT U")
      (=ucs		  . #x04AF)	; ү
      ))
    (=ucs		. #x04AE)	; Ү
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER STRAIGHT U")
      (=ucs		  . #x04AE)	; Ү
      ))
    (=ucs		. #x04AF)	; ү
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
      (=ucs		  . #x04B1)	; ұ
      ))
    (=ucs		. #x04B0)	; Ұ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
      (=ucs		  . #x04B0)	; Ұ
      ))
    (=ucs		. #x04B1)	; ұ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA WITH DESCENDER")
      (=ucs		  . #x04B3)	; ҳ
      ))
    (=ucs		. #x04B2)	; Ҳ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
      (=ucs		  . #x04B2)	; Ҳ
      ))
    (=ucs		. #x04B3)	; ҳ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE TE TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE TE TSE")
      (=ucs		  . #x04B5)	; ҵ
      ))
    (=ucs		. #x04B4)	; Ҵ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE TE TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE TE TSE")
      (=ucs		  . #x04B4)	; Ҵ
      ))
    (=ucs		. #x04B5)	; ҵ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
      (=ucs		  . #x04B7)	; ҷ
      ))
    (=ucs		. #x04B6)	; Ҷ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
      (=ucs		  . #x04B6)	; Ҷ
      ))
    (=ucs		. #x04B7)	; ҷ
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
      (=ucs		  . #x04B9)	; ҹ
      ))
    (=ucs		. #x04B8)	; Ҹ
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
      (=ucs		  . #x04B8)	; Ҹ
      ))
    (=ucs		. #x04B9)	; ҹ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHHA")
      (=ucs		  . #x04BB)	; һ
      ))
    (=ucs		. #x04BA)	; Һ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHHA")
      (=ucs		  . #x04BA)	; Һ
      ))
    (=ucs		. #x04BB)	; һ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN CHE")
      (=ucs		  . #x04BD)	; ҽ
      ))
    (=ucs		. #x04BC)	; Ҽ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
      (=ucs		  . #x04BC)	; Ҽ
      ))
    (=ucs		. #x04BD)	; ҽ
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
      (=ucs		  . #x04BF)	; ҿ
      ))
    (=ucs		. #x04BE)	; Ҿ
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
      (=ucs		  . #x04BE)	; Ҿ
      ))
    (=ucs		. #x04BF)	; ҿ
    ))
(define-char
  '((name		. "CYRILLIC LETTER PALOCHKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C0)	; Ӏ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0416 #x0306)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH BREVE")
      (=ucs		  . #x04C2)	; ӂ
      ))
    (=ucs		. #x04C1)	; Ӂ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0436 #x0306)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
      (=ucs		  . #x04C1)	; Ӂ
      ))
    (=ucs		. #x04C2)	; ӂ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH HOOK")
      (=ucs		  . #x04C4)	; ӄ
      ))
    (=ucs		. #x04C3)	; Ӄ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH HOOK")
      (=ucs		  . #x04C3)	; Ӄ
      ))
    (=ucs		. #x04C4)	; ӄ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN WITH HOOK")
      (=ucs		  . #x04C8)	; ӈ
      ))
    (=ucs		. #x04C7)	; Ӈ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN WITH HOOK")
      (=ucs		  . #x04C7)	; Ӈ
      ))
    (=ucs		. #x04C8)	; ӈ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
      (=ucs		  . #x04CC)	; ӌ
      ))
    (=ucs		. #x04CB)	; Ӌ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
      (=ucs		  . #x04CB)	; Ӌ
      ))
    (=ucs		. #x04CC)	; ӌ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0410 #x0306)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A WITH BREVE")
      (=ucs		  . #x04D1)	; ӑ
      ))
    (=ucs		. #x04D0)	; Ӑ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0430 #x0306)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x04D0)	; Ӑ
      ))
    (=ucs		. #x04D1)	; ӑ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0410 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A WITH DIAERESIS")
      (=ucs		  . #x04D3)	; ӓ
      ))
    (=ucs		. #x04D2)	; Ӓ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0430 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
      (=ucs		  . #x04D2)	; Ӓ
      ))
    (=ucs		. #x04D3)	; ӓ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE A IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE A IE")
      (=ucs		  . #x04D5)	; ӕ
      ))
    (=ucs		. #x04D4)	; Ӕ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE A IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE A IE")
      (=ucs		  . #x04D4)	; Ӕ
      ))
    (=ucs		. #x04D5)	; ӕ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0415 #x0306)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE WITH BREVE")
      (=ucs		  . #x04D7)	; ӗ
      ))
    (=ucs		. #x04D6)	; Ӗ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0435 #x0306)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE WITH BREVE")
      (=ucs		  . #x04D6)	; Ӗ
      ))
    (=ucs		. #x04D7)	; ӗ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SCHWA")
      (=ucs		  . #x04D9)	; ә
      ))
    (=ucs		. #x04D8)	; Ә
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SCHWA")
      (=ucs		  . #x04D8)	; Ә
      ))
    (=ucs		. #x04D9)	; ә
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04D8 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
      (=ucs		  . #x04DB)	; ӛ
      ))
    (=ucs		. #x04DA)	; Ӛ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04D9 #x0308)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
      (=ucs		  . #x04DA)	; Ӛ
      ))
    (=ucs		. #x04DB)	; ӛ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0416 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
      (=ucs		  . #x04DD)	; ӝ
      ))
    (=ucs		. #x04DC)	; Ӝ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0436 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
      (=ucs		  . #x04DC)	; Ӝ
      ))
    (=ucs		. #x04DD)	; ӝ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0417 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
      (=ucs		  . #x04DF)	; ӟ
      ))
    (=ucs		. #x04DE)	; Ӟ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0437 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
      (=ucs		  . #x04DE)	; Ӟ
      ))
    (=ucs		. #x04DF)	; ӟ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN DZE")
      (=ucs		  . #x04E1)	; ӡ
      ))
    (=ucs		. #x04E0)	; Ӡ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
      (=ucs		  . #x04E0)	; Ӡ
      ))
    (=ucs		. #x04E1)	; ӡ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0304)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH MACRON")
      (=ucs		  . #x04E3)	; ӣ
      ))
    (=ucs		. #x04E2)	; Ӣ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0304)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x04E2)	; Ӣ
      ))
    (=ucs		. #x04E3)	; ӣ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH DIAERESIS")
      (=ucs		  . #x04E5)	; ӥ
      ))
    (=ucs		. #x04E4)	; Ӥ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
      (=ucs		  . #x04E4)	; Ӥ
      ))
    (=ucs		. #x04E5)	; ӥ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041E #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O WITH DIAERESIS")
      (=ucs		  . #x04E7)	; ӧ
      ))
    (=ucs		. #x04E6)	; Ӧ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043E #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
      (=ucs		  . #x04E6)	; Ӧ
      ))
    (=ucs		. #x04E7)	; ӧ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BARRED O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BARRED O")
      (=ucs		  . #x04E9)	; ө
      ))
    (=ucs		. #x04E8)	; Ө
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BARRED O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BARRED O")
      (=ucs		  . #x04E8)	; Ө
      ))
    (=ucs		. #x04E9)	; ө
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04E8 #x0308)
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
      (=ucs		  . #x04EB)	; ӫ
      ))
    (=ucs		. #x04EA)	; Ӫ
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x04E9 #x0308)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
      (=ucs		  . #x04EA)	; Ӫ
      ))
    (=ucs		. #x04EB)	; ӫ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x042D #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E WITH DIAERESIS")
      (=ucs		  . #x04ED)	; ӭ
      ))
    (=ucs		. #x04EC)	; Ӭ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x044D #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
      (=ucs		  . #x04EC)	; Ӭ
      ))
    (=ucs		. #x04ED)	; ӭ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x0304)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH MACRON")
      (=ucs		  . #x04EF)	; ӯ
      ))
    (=ucs		. #x04EE)	; Ӯ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x0304)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x04EE)	; Ӯ
      ))
    (=ucs		. #x04EF)	; ӯ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH DIAERESIS")
      (=ucs		  . #x04F1)	; ӱ
      ))
    (=ucs		. #x04F0)	; Ӱ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
      (=ucs		  . #x04F0)	; Ӱ
      ))
    (=ucs		. #x04F1)	; ӱ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0423 #x030B)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x04F3)	; ӳ
      ))
    (=ucs		. #x04F2)	; Ӳ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0443 #x030B)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x04F2)	; Ӳ
      ))
    (=ucs		. #x04F3)	; ӳ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0427 #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
      (=ucs		  . #x04F5)	; ӵ
      ))
    (=ucs		. #x04F4)	; Ӵ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0447 #x0308)
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
      (=ucs		  . #x04F4)	; Ӵ
      ))
    (=ucs		. #x04F5)	; ӵ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x042B #x0308)
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
      (=ucs		  . #x04F9)	; ӹ
      ))
    (=ucs		. #x04F8)	; Ӹ
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x044B #x0308)
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
      (=ucs		  . #x04F8)	; Ӹ
      ))
    (=ucs		. #x04F9)	; ӹ
    ))
