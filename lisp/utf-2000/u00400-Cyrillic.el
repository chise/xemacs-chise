;; -*- coding: utf-8-mcs -*-
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
      (=gb2312		  . #x2727)	; �����
      (=jis-x0208	  . #x2727)	; �����
      (=ks-x1001	  . #x2C27)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; ё
      ))
    (=ucs		. #x0401)	; Ё
    (cyrillic-iso8859-5 . #xA1)	; �����
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
    (=gb2312		. #x2727)	; �����
    (=jis-x0208		. #x2727)	; �����
    (=ks-x1001		. #x2C27)	; �����
    (=big5-eten		. #xC7F9)	; ������
    (=ucs@jis		. #x0401)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DJE")
      (=jis-x0212	  . #x2742)	; �����
      (=ucs@jis		  . #x0402)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; ђ
      ))
    (=ucs		. #x0402)	; Ђ
    (cyrillic-iso8859-5 . #xA2)	; �����
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
    (=jis-x0212		. #x2742)	; �����
    (=ucs@jis		. #x0402)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0413 #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GJE")
      (=jis-x0212	  . #x2743)	; �����
      (=ucs@jis		  . #x0403)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; ѓ
      ))
    (=ucs		. #x0403)	; Ѓ
    (cyrillic-iso8859-5 . #xA3)	; �����
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
    (=jis-x0212		. #x2743)	; �����
    (=ucs@jis		. #x0403)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=jis-x0212	  . #x2744)	; �����
      (=ucs@jis		  . #x0404)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; є
      ))
    (=ucs		. #x0404)	; Є
    (cyrillic-iso8859-5 . #xA4)	; �����
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
    (=jis-x0212		. #x2744)	; �����
    (=ucs@jis		. #x0404)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZE")
      (=jis-x0212	  . #x2745)	; �����
      (=ucs@jis		  . #x0405)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; ѕ
      ))
    (=ucs		. #x0405)	; Ѕ
    (cyrillic-iso8859-5 . #xA5)	; �����
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
    (=jis-x0212		. #x2745)	; �����
    (=ucs@jis		. #x0405)	; �����
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=jis-x0212	  . #x2746)	; �����
      (=ucs@jis		  . #x0406)	; �����
      ))
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      ))
    (=ucs		. #x0406)	; І
    (cyrillic-iso8859-5 . #xA6)	; �����
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
    (=jis-x0212		. #x2746)	; �����
    (=ucs@jis		. #x0406)	; �����
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
      (=jis-x0212	  . #x2747)	; �����
      (=ucs@jis		  . #x0407)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; ї
      ))
    (=ucs		. #x0407)	; Ї
    (cyrillic-iso8859-5 . #xA7)	; �����
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
    (=jis-x0212		. #x2747)	; �����
    (=ucs@jis		. #x0407)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER JE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER JE")
      (=jis-x0212	  . #x2748)	; �����
      (=ucs@jis		  . #x0408)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; ј
      ))
    (=ucs		. #x0408)	; Ј
    (cyrillic-iso8859-5 . #xA8)	; �����
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
    (=jis-x0212		. #x2748)	; �����
    (=ucs@jis		. #x0408)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER LJE")
      (=jis-x0212	  . #x2749)	; �����
      (=ucs@jis		  . #x0409)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; љ
      ))
    (=ucs		. #x0409)	; Љ
    (cyrillic-iso8859-5 . #xA9)	; �����
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
    (=jis-x0212		. #x2749)	; �����
    (=ucs@jis		. #x0409)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER NJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER NJE")
      (=jis-x0212	  . #x274A)	; �����
      (=ucs@jis		  . #x040A)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; њ
      ))
    (=ucs		. #x040A)	; Њ
    (cyrillic-iso8859-5 . #xAA)	; �����
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
    (=jis-x0212		. #x274A)	; �����
    (=ucs@jis		. #x040A)	; �����
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
    (cyrillic-iso8859-5 . #xAB)	; �����
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
    (=jis-x0212		. #x274B)	; �����
    (=ucs@jis		. #x040B)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x041A #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KJE")
      (=jis-x0212	  . #x274C)	; �����
      (=ucs@jis		  . #x040C)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; ќ
      ))
    (=ucs		. #x040C)	; Ќ
    (cyrillic-iso8859-5 . #xAC)	; �����
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
    (=jis-x0212		. #x274C)	; �����
    (=ucs@jis		. #x040C)	; �����
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
      (=jis-x0212	  . #x274D)	; �����
      (=ucs@jis		  . #x040E)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; ў
      ))
    (=ucs		. #x040E)	; Ў
    (cyrillic-iso8859-5 . #xAE)	; �����
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
    (=jis-x0212		. #x274D)	; �����
    (=ucs@jis		. #x040E)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DZHE")
      (=jis-x0212	  . #x274E)	; �����
      (=ucs@jis		  . #x040F)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; џ
      ))
    (=ucs		. #x040F)	; Џ
    (cyrillic-iso8859-5 . #xAF)	; �����
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
    (=jis-x0212		. #x274E)	; �����
    (=ucs@jis		. #x040F)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER A")
      (=gb2312		  . #x2721)	; �����
      (=jis-x0208	  . #x2721)	; �����
      (=ks-x1001	  . #x2C21)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      ))
    (=ucs		. #x0410)	; А
    (cyrillic-iso8859-5 . #xB0)	; �����
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
    (=gb2312		. #x2721)	; �����
    (=jis-x0208		. #x2721)	; �����
    (=ks-x1001		. #x2C21)	; �����
    (=big5-eten		. #xC7F3)	; ������
    (=ucs@jis		. #x0410)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER BE")
      (=gb2312		  . #x2722)	; �����
      (=jis-x0208	  . #x2722)	; �����
      (=ks-x1001	  . #x2C22)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; б
      ))
    (=ucs		. #x0411)	; Б
    (cyrillic-iso8859-5 . #xB1)	; �����
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
    (=gb2312		. #x2722)	; �����
    (=jis-x0208		. #x2722)	; �����
    (=ks-x1001		. #x2C22)	; �����
    (=big5-eten		. #xC7F4)	; ������
    (=ucs@jis		. #x0411)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER VE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER VE")
      (=gb2312		  . #x2723)	; �����
      (=jis-x0208	  . #x2723)	; �����
      (=ks-x1001	  . #x2C23)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; в
      ))
    (=ucs		. #x0412)	; В
    (cyrillic-iso8859-5 . #xB2)	; �����
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
    (=gb2312		. #x2723)	; �����
    (=jis-x0208		. #x2723)	; �����
    (=ks-x1001		. #x2C23)	; �����
    (=big5-eten		. #xC7F5)	; ������
    (=ucs@jis		. #x0412)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER GHE")
      (=gb2312		  . #x2724)	; �����
      (=jis-x0208	  . #x2724)	; �����
      (=ks-x1001	  . #x2C24)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      ))
    (=ucs		. #x0413)	; Г
    (cyrillic-iso8859-5 . #xB3)	; �����
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
    (=gb2312		. #x2724)	; �����
    (=jis-x0208		. #x2724)	; �����
    (=ks-x1001		. #x2C24)	; �����
    (=big5-eten		. #xC7F6)	; ������
    (=ucs@jis		. #x0413)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER DE")
      (=gb2312		  . #x2725)	; �����
      (=jis-x0208	  . #x2725)	; �����
      (=ks-x1001	  . #x2C25)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; д
      ))
    (=ucs		. #x0414)	; Д
    (cyrillic-iso8859-5 . #xB4)	; �����
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
    (=gb2312		. #x2725)	; �����
    (=jis-x0208		. #x2725)	; �����
    (=ks-x1001		. #x2C25)	; �����
    (=big5-eten		. #xC7F7)	; ������
    (=ucs@jis		. #x0414)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER IE")
      (=gb2312		  . #x2726)	; �����
      (=jis-x0208	  . #x2726)	; �����
      (=ks-x1001	  . #x2C26)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      ))
    (=ucs		. #x0415)	; Е
    (cyrillic-iso8859-5 . #xB5)	; �����
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
    (=gb2312		. #x2726)	; �����
    (=jis-x0208		. #x2726)	; �����
    (=ks-x1001		. #x2C26)	; �����
    (=big5-eten		. #xC7F8)	; ������
    (=ucs@jis		. #x0415)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZHE")
      (=gb2312		  . #x2728)	; �����
      (=jis-x0208	  . #x2728)	; �����
      (=ks-x1001	  . #x2C28)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      ))
    (=ucs		. #x0416)	; Ж
    (cyrillic-iso8859-5 . #xB6)	; �����
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
    (=gb2312		. #x2728)	; �����
    (=jis-x0208		. #x2728)	; �����
    (=ks-x1001		. #x2C28)	; �����
    (=big5-eten		. #xC7FA)	; ������
    (=ucs@jis		. #x0416)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ZE")
      (=gb2312		  . #x2729)	; �����
      (=jis-x0208	  . #x2729)	; �����
      (=ks-x1001	  . #x2C29)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      ))
    (=ucs		. #x0417)	; З
    (cyrillic-iso8859-5 . #xB7)	; �����
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
    (=gb2312		. #x2729)	; �����
    (=jis-x0208		. #x2729)	; �����
    (=ks-x1001		. #x2C29)	; �����
    (=big5-eten		. #xC7FB)	; ������
    (=ucs@jis		. #x0417)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER I")
      (=gb2312		  . #x272A)	; �����
      (=jis-x0208	  . #x272A)	; �����
      (=ks-x1001	  . #x2C2A)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      ))
    (=ucs		. #x0418)	; И
    (cyrillic-iso8859-5 . #xB8)	; �����
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
    (=gb2312		. #x272A)	; �����
    (=jis-x0208		. #x272A)	; �����
    (=ks-x1001		. #x2C2A)	; �����
    (=big5-eten		. #xC7FC)	; ������
    (=ucs@jis		. #x0418)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0418 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHORT I")
      (=gb2312		  . #x272B)	; �����
      (=jis-x0208	  . #x272B)	; �����
      (=ks-x1001	  . #x2C2B)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; й
      ))
    (=ucs		. #x0419)	; Й
    (cyrillic-iso8859-5 . #xB9)	; �����
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
    (=gb2312		. #x272B)	; �����
    (=jis-x0208		. #x272B)	; �����
    (=ks-x1001		. #x2C2B)	; �����
    (=big5-eten		. #xC7FD)	; ������
    (=ucs@jis		. #x0419)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER KA")
      (=gb2312		  . #x272C)	; �����
      (=jis-x0208	  . #x272C)	; �����
      (=ks-x1001	  . #x2C2C)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      ))
    (=ucs		. #x041A)	; К
    (cyrillic-iso8859-5 . #xBA)	; �����
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
    (=gb2312		. #x272C)	; �����
    (=jis-x0208		. #x272C)	; �����
    (=ks-x1001		. #x2C2C)	; �����
    (=big5-eten		. #xC7FE)	; ������
    (=ucs@jis		. #x041A)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EL")
      (=gb2312		  . #x272D)	; �����
      (=jis-x0208	  . #x272D)	; �����
      (=ks-x1001	  . #x2C2D)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; л
      ))
    (=ucs		. #x041B)	; Л
    (cyrillic-iso8859-5 . #xBB)	; �����
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
    (=gb2312		. #x272D)	; �����
    (=jis-x0208		. #x272D)	; �����
    (=ks-x1001		. #x2C2D)	; �����
    (=big5-eten		. #xC840)	; ������
    (=ucs@jis		. #x041B)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EM")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EM")
      (=gb2312		  . #x272E)	; �����
      (=jis-x0208	  . #x272E)	; �����
      (=ks-x1001	  . #x2C2E)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; м
      ))
    (=ucs		. #x041C)	; М
    (cyrillic-iso8859-5 . #xBC)	; �����
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
    (=gb2312		. #x272E)	; �����
    (=jis-x0208		. #x272E)	; �����
    (=ks-x1001		. #x2C2E)	; �����
    (=big5-eten		. #xC841)	; ������
    (=ucs@jis		. #x041C)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EN")
      (=gb2312		  . #x272F)	; �����
      (=jis-x0208	  . #x272F)	; �����
      (=ks-x1001	  . #x2C2F)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; н
      ))
    (=ucs		. #x041D)	; Н
    (cyrillic-iso8859-5 . #xBD)	; �����
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
    (=gb2312		. #x272F)	; �����
    (=jis-x0208		. #x272F)	; �����
    (=ks-x1001		. #x2C2F)	; �����
    (=big5-eten		. #xC842)	; ������
    (=ucs@jis		. #x041D)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER O")
      (=gb2312		  . #x2730)	; �����
      (=jis-x0208	  . #x2730)	; �����
      (=ks-x1001	  . #x2C30)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      ))
    (=ucs		. #x041E)	; О
    (cyrillic-iso8859-5 . #xBE)	; �����
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
    (=gb2312		. #x2730)	; �����
    (=jis-x0208		. #x2730)	; �����
    (=ks-x1001		. #x2C30)	; �����
    (=big5-eten		. #xC843)	; ������
    (=ucs@jis		. #x041E)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER PE")
      (=gb2312		  . #x2731)	; �����
      (=jis-x0208	  . #x2731)	; �����
      (=ks-x1001	  . #x2C31)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; п
      ))
    (=ucs		. #x041F)	; П
    (cyrillic-iso8859-5 . #xBF)	; �����
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
    (=gb2312		. #x2731)	; �����
    (=jis-x0208		. #x2731)	; �����
    (=ks-x1001		. #x2C31)	; �����
    (=big5-eten		. #xC844)	; ������
    (=ucs@jis		. #x041F)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ER")
      (=gb2312		  . #x2732)	; �����
      (=jis-x0208	  . #x2732)	; �����
      (=ks-x1001	  . #x2C32)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; р
      ))
    (=ucs		. #x0420)	; Р
    (cyrillic-iso8859-5 . #xC0)	; �����
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
    (=gb2312		. #x2732)	; �����
    (=jis-x0208		. #x2732)	; �����
    (=ks-x1001		. #x2C32)	; �����
    (=big5-eten		. #xC845)	; ������
    (=ucs@jis		. #x0420)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER ES")
      (=gb2312		  . #x2733)	; �����
      (=jis-x0208	  . #x2733)	; �����
      (=ks-x1001	  . #x2C33)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; с
      ))
    (=ucs		. #x0421)	; С
    (cyrillic-iso8859-5 . #xC1)	; �����
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
    (=gb2312		. #x2733)	; �����
    (=jis-x0208		. #x2733)	; �����
    (=ks-x1001		. #x2C33)	; �����
    (=big5-eten		. #xC846)	; ������
    (=ucs@jis		. #x0421)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TE")
      (=gb2312		  . #x2734)	; �����
      (=jis-x0208	  . #x2734)	; �����
      (=ks-x1001	  . #x2C34)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; т
      ))
    (=ucs		. #x0422)	; Т
    (cyrillic-iso8859-5 . #xC2)	; �����
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
    (=gb2312		. #x2734)	; �����
    (=jis-x0208		. #x2734)	; �����
    (=ks-x1001		. #x2C34)	; �����
    (=big5-eten		. #xC847)	; ������
    (=ucs@jis		. #x0422)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER U")
      (=gb2312		  . #x2735)	; �����
      (=jis-x0208	  . #x2735)	; �����
      (=ks-x1001	  . #x2C35)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      ))
    (=ucs		. #x0423)	; У
    (cyrillic-iso8859-5 . #xC3)	; �����
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
    (=gb2312		. #x2735)	; �����
    (=jis-x0208		. #x2735)	; �����
    (=ks-x1001		. #x2C35)	; �����
    (=big5-eten		. #xC848)	; ������
    (=ucs@jis		. #x0423)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EF")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER EF")
      (=gb2312		  . #x2736)	; �����
      (=jis-x0208	  . #x2736)	; �����
      (=ks-x1001	  . #x2C36)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; ф
      ))
    (=ucs		. #x0424)	; Ф
    (cyrillic-iso8859-5 . #xC4)	; �����
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
    (=gb2312		. #x2736)	; �����
    (=jis-x0208		. #x2736)	; �����
    (=ks-x1001		. #x2C36)	; �����
    (=big5-eten		. #xC849)	; ������
    (=ucs@jis		. #x0424)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER HA")
      (=gb2312		  . #x2737)	; �����
      (=jis-x0208	  . #x2737)	; �����
      (=ks-x1001	  . #x2C37)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; х
      ))
    (=ucs		. #x0425)	; Х
    (cyrillic-iso8859-5 . #xC5)	; �����
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
    (=gb2312		. #x2737)	; �����
    (=jis-x0208		. #x2737)	; �����
    (=ks-x1001		. #x2C37)	; �����
    (=big5-eten		. #xC84A)	; ������
    (=ucs@jis		. #x0425)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER TSE")
      (=gb2312		  . #x2738)	; �����
      (=jis-x0208	  . #x2738)	; �����
      (=ks-x1001	  . #x2C38)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; ц
      ))
    (=ucs		. #x0426)	; Ц
    (cyrillic-iso8859-5 . #xC6)	; �����
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
    (=gb2312		. #x2738)	; �����
    (=jis-x0208		. #x2738)	; �����
    (=ks-x1001		. #x2C38)	; �����
    (=big5-eten		. #xC84B)	; ������
    (=ucs@jis		. #x0426)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER CHE")
      (=gb2312		  . #x2739)	; �����
      (=jis-x0208	  . #x2739)	; �����
      (=ks-x1001	  . #x2C39)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      ))
    (=ucs		. #x0427)	; Ч
    (cyrillic-iso8859-5 . #xC7)	; �����
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
    (=gb2312		. #x2739)	; �����
    (=jis-x0208		. #x2739)	; �����
    (=ks-x1001		. #x2C39)	; �����
    (=big5-eten		. #xC84C)	; ������
    (=ucs@jis		. #x0427)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHA")
      (=gb2312		  . #x273A)	; �����
      (=jis-x0208	  . #x273A)	; �����
      (=ks-x1001	  . #x2C3A)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; ш
      ))
    (=ucs		. #x0428)	; Ш
    (cyrillic-iso8859-5 . #xC8)	; �����
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
    (=gb2312		. #x273A)	; �����
    (=jis-x0208		. #x273A)	; �����
    (=ks-x1001		. #x2C3A)	; �����
    (=big5-eten		. #xC84D)	; ������
    (=ucs@jis		. #x0428)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHCHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER SHCHA")
      (=gb2312		  . #x273B)	; �����
      (=jis-x0208	  . #x273B)	; �����
      (=ks-x1001	  . #x2C3B)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; щ
      ))
    (=ucs		. #x0429)	; Щ
    (cyrillic-iso8859-5 . #xC9)	; �����
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
    (=gb2312		. #x273B)	; �����
    (=jis-x0208		. #x273B)	; �����
    (=ks-x1001		. #x2C3B)	; �����
    (=big5-eten		. #xC84E)	; ������
    (=ucs@jis		. #x0429)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HARD SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER HARD SIGN")
      (=gb2312		  . #x273C)	; �����
      (=jis-x0208	  . #x273C)	; �����
      (=ks-x1001	  . #x2C3C)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ъ
      ))
    (=ucs		. #x042A)	; Ъ
    (cyrillic-iso8859-5 . #xCA)	; �����
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
    (=gb2312		. #x273C)	; �����
    (=jis-x0208		. #x273C)	; �����
    (=ks-x1001		. #x2C3C)	; �����
    (=big5-eten		. #xC84F)	; ������
    (=ucs@jis		. #x042A)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YERU")
      (=gb2312		  . #x273D)	; �����
      (=jis-x0208	  . #x273D)	; �����
      (=ks-x1001	  . #x2C3D)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      ))
    (=ucs		. #x042B)	; Ы
    (cyrillic-iso8859-5 . #xCB)	; �����
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
    (=gb2312		. #x273D)	; �����
    (=jis-x0208		. #x273D)	; �����
    (=ks-x1001		. #x2C3D)	; �����
    (=big5-eten		. #xC850)	; ������
    (=ucs@jis		. #x042B)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=gb2312		  . #x273E)	; �����
      (=jis-x0208	  . #x273E)	; �����
      (=ks-x1001	  . #x2C3E)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ь
      ))
    (=ucs		. #x042C)	; Ь
    (cyrillic-iso8859-5 . #xCC)	; �����
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
    (=gb2312		. #x273E)	; �����
    (=jis-x0208		. #x273E)	; �����
    (=ks-x1001		. #x2C3E)	; �����
    (=big5-eten		. #xC851)	; ������
    (=ucs@jis		. #x042C)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER E")
      (=gb2312		  . #x273F)	; �����
      (=jis-x0208	  . #x273F)	; �����
      (=ks-x1001	  . #x2C3F)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      ))
    (=ucs		. #x042D)	; Э
    (cyrillic-iso8859-5 . #xCD)	; �����
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
    (=gb2312		. #x273F)	; �����
    (=jis-x0208		. #x273F)	; �����
    (=ks-x1001		. #x2C3F)	; �����
    (=big5-eten		. #xC852)	; ������
    (=ucs@jis		. #x042D)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YU")
      (=gb2312		  . #x2740)	; �����
      (=jis-x0208	  . #x2740)	; �����
      (=ks-x1001	  . #x2C40)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ю
      ))
    (=ucs		. #x042E)	; Ю
    (cyrillic-iso8859-5 . #xCE)	; �����
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
    (=gb2312		. #x2740)	; �����
    (=jis-x0208		. #x2740)	; �����
    (=ks-x1001		. #x2C40)	; �����
    (=big5-eten		. #xC853)	; ������
    (=ucs@jis		. #x042E)	; �����
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC CAPITAL LETTER YA")
      (=gb2312		  . #x2741)	; �����
      (=jis-x0208	  . #x2741)	; �����
      (=ks-x1001	  . #x2C41)	; �����
      ))
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; я
      ))
    (=ucs		. #x042F)	; Я
    (cyrillic-iso8859-5 . #xCF)	; �����
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
    (=gb2312		. #x2741)	; �����
    (=jis-x0208		. #x2741)	; �����
    (=ks-x1001		. #x2C41)	; �����
    (=big5-eten		. #xC854)	; ������
    (=ucs@jis		. #x042F)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER A")
      (=gb2312		  . #x2751)	; �����
      (=jis-x0208	  . #x2751)	; �����
      (=ks-x1001	  . #x2C51)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      ))
    (=ucs		. #x0430)	; а
    (cyrillic-iso8859-5 . #xD0)	; �����
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
    (=gb2312		. #x2751)	; �����
    (=jis-x0208		. #x2751)	; �����
    (=ks-x1001		. #x2C51)	; �����
    (=big5-eten		. #xC855)	; ������
    (=ucs@jis		. #x0430)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER BE")
      (=gb2312		  . #x2752)	; �����
      (=jis-x0208	  . #x2752)	; �����
      (=ks-x1001	  . #x2C52)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Б
      ))
    (=ucs		. #x0431)	; б
    (cyrillic-iso8859-5 . #xD1)	; �����
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
    (=gb2312		. #x2752)	; �����
    (=jis-x0208		. #x2752)	; �����
    (=ks-x1001		. #x2C52)	; �����
    (=big5-eten		. #xC856)	; ������
    (=ucs@jis		. #x0431)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER VE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER VE")
      (=gb2312		  . #x2753)	; �����
      (=jis-x0208	  . #x2753)	; �����
      (=ks-x1001	  . #x2C53)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; В
      ))
    (=ucs		. #x0432)	; в
    (cyrillic-iso8859-5 . #xD2)	; �����
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
    (=gb2312		. #x2753)	; �����
    (=jis-x0208		. #x2753)	; �����
    (=ks-x1001		. #x2C53)	; �����
    (=big5-eten		. #xC857)	; ������
    (=ucs@jis		. #x0432)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GHE")
      (=gb2312		  . #x2754)	; �����
      (=jis-x0208	  . #x2754)	; �����
      (=ks-x1001	  . #x2C54)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      ))
    (=ucs		. #x0433)	; г
    (cyrillic-iso8859-5 . #xD3)	; �����
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
    (=gb2312		. #x2754)	; �����
    (=jis-x0208		. #x2754)	; �����
    (=ks-x1001		. #x2C54)	; �����
    (=big5-eten		. #xC858)	; ������
    (=ucs@jis		. #x0433)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DE")
      (=gb2312		  . #x2755)	; �����
      (=jis-x0208	  . #x2755)	; �����
      (=ks-x1001	  . #x2C55)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Д
      ))
    (=ucs		. #x0434)	; д
    (cyrillic-iso8859-5 . #xD4)	; �����
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
    (=gb2312		. #x2755)	; �����
    (=jis-x0208		. #x2755)	; �����
    (=ks-x1001		. #x2C55)	; �����
    (=big5-eten		. #xC859)	; ������
    (=ucs@jis		. #x0434)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER IE")
      (=gb2312		  . #x2756)	; �����
      (=jis-x0208	  . #x2756)	; �����
      (=ks-x1001	  . #x2C56)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      ))
    (=ucs		. #x0435)	; е
    (cyrillic-iso8859-5 . #xD5)	; �����
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
    (=gb2312		. #x2756)	; �����
    (=jis-x0208		. #x2756)	; �����
    (=ks-x1001		. #x2C56)	; �����
    (=big5-eten		. #xC85A)	; ������
    (=ucs@jis		. #x0435)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZHE")
      (=gb2312		  . #x2758)	; �����
      (=jis-x0208	  . #x2758)	; �����
      (=ks-x1001	  . #x2C58)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      ))
    (=ucs		. #x0436)	; ж
    (cyrillic-iso8859-5 . #xD6)	; �����
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
    (=gb2312		. #x2758)	; �����
    (=jis-x0208		. #x2758)	; �����
    (=ks-x1001		. #x2C58)	; �����
    (=big5-eten		. #xC85C)	; ������
    (=ucs@jis		. #x0436)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ZE")
      (=gb2312		  . #x2759)	; �����
      (=jis-x0208	  . #x2759)	; �����
      (=ks-x1001	  . #x2C59)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      ))
    (=ucs		. #x0437)	; з
    (cyrillic-iso8859-5 . #xD7)	; �����
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
    (=gb2312		. #x2759)	; �����
    (=jis-x0208		. #x2759)	; �����
    (=ks-x1001		. #x2C59)	; �����
    (=big5-eten		. #xC85D)	; ������
    (=ucs@jis		. #x0437)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER I")
      (=gb2312		  . #x275A)	; �����
      (=jis-x0208	  . #x275A)	; �����
      (=ks-x1001	  . #x2C5A)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      ))
    (=ucs		. #x0438)	; и
    (cyrillic-iso8859-5 . #xD8)	; �����
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
    (=gb2312		. #x275A)	; �����
    (=jis-x0208		. #x275A)	; �����
    (=ks-x1001		. #x2C5A)	; �����
    (=big5-eten		. #xC85E)	; ������
    (=ucs@jis		. #x0438)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0438 #x0306)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHORT I")
      (=gb2312		  . #x275B)	; �����
      (=jis-x0208	  . #x275B)	; �����
      (=ks-x1001	  . #x2C5B)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Й
      ))
    (=ucs		. #x0439)	; й
    (cyrillic-iso8859-5 . #xD9)	; �����
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
    (=gb2312		. #x275B)	; �����
    (=jis-x0208		. #x275B)	; �����
    (=ks-x1001		. #x2C5B)	; �����
    (=big5-eten		. #xC85F)	; ������
    (=ucs@jis		. #x0439)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KA")
      (=gb2312		  . #x275C)	; �����
      (=jis-x0208	  . #x275C)	; �����
      (=ks-x1001	  . #x2C5C)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      ))
    (=ucs		. #x043A)	; к
    (cyrillic-iso8859-5 . #xDA)	; �����
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
    (=gb2312		. #x275C)	; �����
    (=jis-x0208		. #x275C)	; �����
    (=ks-x1001		. #x2C5C)	; �����
    (=big5-eten		. #xC860)	; ������
    (=ucs@jis		. #x043A)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EL")
      (=gb2312		  . #x275D)	; �����
      (=jis-x0208	  . #x275D)	; �����
      (=ks-x1001	  . #x2C5D)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Л
      ))
    (=ucs		. #x043B)	; л
    (cyrillic-iso8859-5 . #xDB)	; �����
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
    (=gb2312		. #x275D)	; �����
    (=jis-x0208		. #x275D)	; �����
    (=ks-x1001		. #x2C5D)	; �����
    (=big5-eten		. #xC861)	; ������
    (=ucs@jis		. #x043B)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EM")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EM")
      (=gb2312		  . #x275E)	; �����
      (=jis-x0208	  . #x275E)	; �����
      (=ks-x1001	  . #x2C5E)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; М
      ))
    (=ucs		. #x043C)	; м
    (cyrillic-iso8859-5 . #xDC)	; �����
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
    (=gb2312		. #x275E)	; �����
    (=jis-x0208		. #x275E)	; �����
    (=ks-x1001		. #x2C5E)	; �����
    (=big5-eten		. #xC862)	; ������
    (=ucs@jis		. #x043C)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EN")
      (=gb2312		  . #x275F)	; �����
      (=jis-x0208	  . #x275F)	; �����
      (=ks-x1001	  . #x2C5F)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Н
      ))
    (=ucs		. #x043D)	; н
    (cyrillic-iso8859-5 . #xDD)	; �����
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
    (=gb2312		. #x275F)	; �����
    (=jis-x0208		. #x275F)	; �����
    (=ks-x1001		. #x2C5F)	; �����
    (=big5-eten		. #xC863)	; ������
    (=ucs@jis		. #x043D)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER O")
      (=gb2312		  . #x2760)	; �����
      (=jis-x0208	  . #x2760)	; �����
      (=ks-x1001	  . #x2C60)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      ))
    (=ucs		. #x043E)	; о
    (cyrillic-iso8859-5 . #xDE)	; �����
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
    (=gb2312		. #x2760)	; �����
    (=jis-x0208		. #x2760)	; �����
    (=ks-x1001		. #x2C60)	; �����
    (=big5-eten		. #xC864)	; ������
    (=ucs@jis		. #x043E)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER PE")
      (=gb2312		  . #x2761)	; �����
      (=jis-x0208	  . #x2761)	; �����
      (=ks-x1001	  . #x2C61)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; П
      ))
    (=ucs		. #x043F)	; п
    (cyrillic-iso8859-5 . #xDF)	; �����
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
    (=gb2312		. #x2761)	; �����
    (=jis-x0208		. #x2761)	; �����
    (=ks-x1001		. #x2C61)	; �����
    (=big5-eten		. #xC865)	; ������
    (=ucs@jis		. #x043F)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ER")
      (=gb2312		  . #x2762)	; �����
      (=jis-x0208	  . #x2762)	; �����
      (=ks-x1001	  . #x2C62)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Р
      ))
    (=ucs		. #x0440)	; р
    (cyrillic-iso8859-5 . #xE0)	; �����
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
    (=gb2312		. #x2762)	; �����
    (=jis-x0208		. #x2762)	; �����
    (=ks-x1001		. #x2C62)	; �����
    (=big5-eten		. #xC866)	; ������
    (=ucs@jis		. #x0440)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER ES")
      (=gb2312		  . #x2763)	; �����
      (=jis-x0208	  . #x2763)	; �����
      (=ks-x1001	  . #x2C63)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; С
      ))
    (=ucs		. #x0441)	; с
    (cyrillic-iso8859-5 . #xE1)	; �����
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
    (=gb2312		. #x2763)	; �����
    (=jis-x0208		. #x2763)	; �����
    (=ks-x1001		. #x2C63)	; �����
    (=big5-eten		. #xC867)	; ������
    (=ucs@jis		. #x0441)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TE")
      (=gb2312		  . #x2764)	; �����
      (=jis-x0208	  . #x2764)	; �����
      (=ks-x1001	  . #x2C64)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Т
      ))
    (=ucs		. #x0442)	; т
    (cyrillic-iso8859-5 . #xE2)	; �����
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
    (=gb2312		. #x2764)	; �����
    (=jis-x0208		. #x2764)	; �����
    (=ks-x1001		. #x2C64)	; �����
    (=big5-eten		. #xC868)	; ������
    (=ucs@jis		. #x0442)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER U")
      (=gb2312		  . #x2765)	; �����
      (=jis-x0208	  . #x2765)	; �����
      (=ks-x1001	  . #x2C65)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      ))
    (=ucs		. #x0443)	; у
    (cyrillic-iso8859-5 . #xE3)	; �����
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
    (=gb2312		. #x2765)	; �����
    (=jis-x0208		. #x2765)	; �����
    (=ks-x1001		. #x2C65)	; �����
    (=big5-eten		. #xC869)	; ������
    (=ucs@jis		. #x0443)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EF")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER EF")
      (=gb2312		  . #x2766)	; �����
      (=jis-x0208	  . #x2766)	; �����
      (=ks-x1001	  . #x2C66)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ф
      ))
    (=ucs		. #x0444)	; ф
    (cyrillic-iso8859-5 . #xE4)	; �����
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
    (=gb2312		. #x2766)	; �����
    (=jis-x0208		. #x2766)	; �����
    (=ks-x1001		. #x2C66)	; �����
    (=big5-eten		. #xC86A)	; ������
    (=ucs@jis		. #x0444)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HA")
      (=gb2312		  . #x2767)	; �����
      (=jis-x0208	  . #x2767)	; �����
      (=ks-x1001	  . #x2C67)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Х
      ))
    (=ucs		. #x0445)	; х
    (cyrillic-iso8859-5 . #xE5)	; �����
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
    (=gb2312		. #x2767)	; �����
    (=jis-x0208		. #x2767)	; �����
    (=ks-x1001		. #x2C67)	; �����
    (=big5-eten		. #xC86B)	; ������
    (=ucs@jis		. #x0445)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSE")
      (=gb2312		  . #x2768)	; �����
      (=jis-x0208	  . #x2768)	; �����
      (=ks-x1001	  . #x2C68)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ц
      ))
    (=ucs		. #x0446)	; ц
    (cyrillic-iso8859-5 . #xE6)	; �����
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
    (=gb2312		. #x2768)	; �����
    (=jis-x0208		. #x2768)	; �����
    (=ks-x1001		. #x2C68)	; �����
    (=big5-eten		. #xC86C)	; ������
    (=ucs@jis		. #x0446)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER CHE")
      (=gb2312		  . #x2769)	; �����
      (=jis-x0208	  . #x2769)	; �����
      (=ks-x1001	  . #x2C69)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      ))
    (=ucs		. #x0447)	; ч
    (cyrillic-iso8859-5 . #xE7)	; �����
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
    (=gb2312		. #x2769)	; �����
    (=jis-x0208		. #x2769)	; �����
    (=ks-x1001		. #x2C69)	; �����
    (=big5-eten		. #xC86D)	; ������
    (=ucs@jis		. #x0447)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHA")
      (=gb2312		  . #x276A)	; �����
      (=jis-x0208	  . #x276A)	; �����
      (=ks-x1001	  . #x2C6A)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ш
      ))
    (=ucs		. #x0448)	; ш
    (cyrillic-iso8859-5 . #xE8)	; �����
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
    (=gb2312		. #x276A)	; �����
    (=jis-x0208		. #x276A)	; �����
    (=ks-x1001		. #x2C6A)	; �����
    (=big5-eten		. #xC86E)	; ������
    (=ucs@jis		. #x0448)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHCHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SHCHA")
      (=gb2312		  . #x276B)	; �����
      (=jis-x0208	  . #x276B)	; �����
      (=ks-x1001	  . #x2C6B)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Щ
      ))
    (=ucs		. #x0449)	; щ
    (cyrillic-iso8859-5 . #xE9)	; �����
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
    (=gb2312		. #x276B)	; �����
    (=jis-x0208		. #x276B)	; �����
    (=ks-x1001		. #x2C6B)	; �����
    (=big5-eten		. #xC86F)	; ������
    (=ucs@jis		. #x0449)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HARD SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER HARD SIGN")
      (=gb2312		  . #x276C)	; �����
      (=jis-x0208	  . #x276C)	; �����
      (=ks-x1001	  . #x2C6C)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ъ
      ))
    (=ucs		. #x044A)	; ъ
    (cyrillic-iso8859-5 . #xEA)	; �����
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
    (=gb2312		. #x276C)	; �����
    (=jis-x0208		. #x276C)	; �����
    (=ks-x1001		. #x2C6C)	; �����
    (=big5-eten		. #xC870)	; ������
    (=ucs@jis		. #x044A)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YERU")
      (=gb2312		  . #x276D)	; �����
      (=jis-x0208	  . #x276D)	; �����
      (=ks-x1001	  . #x2C6D)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      ))
    (=ucs		. #x044B)	; ы
    (cyrillic-iso8859-5 . #xEB)	; �����
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
    (=gb2312		. #x276D)	; �����
    (=jis-x0208		. #x276D)	; �����
    (=ks-x1001		. #x2C6D)	; �����
    (=big5-eten		. #xC871)	; ������
    (=ucs@jis		. #x044B)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER SOFT SIGN")
      (=gb2312		  . #x276E)	; �����
      (=jis-x0208	  . #x276E)	; �����
      (=ks-x1001	  . #x2C6E)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ь
      ))
    (=ucs		. #x044C)	; ь
    (cyrillic-iso8859-5 . #xEC)	; �����
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
    (=gb2312		. #x276E)	; �����
    (=jis-x0208		. #x276E)	; �����
    (=ks-x1001		. #x2C6E)	; �����
    (=big5-eten		. #xC872)	; ������
    (=ucs@jis		. #x044C)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER E")
      (=gb2312		  . #x276F)	; �����
      (=jis-x0208	  . #x276F)	; �����
      (=ks-x1001	  . #x2C6F)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      ))
    (=ucs		. #x044D)	; э
    (cyrillic-iso8859-5 . #xED)	; �����
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
    (=gb2312		. #x276F)	; �����
    (=jis-x0208		. #x276F)	; �����
    (=ks-x1001		. #x2C6F)	; �����
    (=big5-eten		. #xC873)	; ������
    (=ucs@jis		. #x044D)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YU")
      (=gb2312		  . #x2770)	; �����
      (=jis-x0208	  . #x2770)	; �����
      (=ks-x1001	  . #x2C70)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ю
      ))
    (=ucs		. #x044E)	; ю
    (cyrillic-iso8859-5 . #xEE)	; �����
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
    (=gb2312		. #x2770)	; �����
    (=jis-x0208		. #x2770)	; �����
    (=ks-x1001		. #x2C70)	; �����
    (=big5-eten		. #xC874)	; ������
    (=ucs@jis		. #x044E)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER YA")
      (=gb2312		  . #x2771)	; �����
      (=jis-x0208	  . #x2771)	; �����
      (=ks-x1001	  . #x2C71)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Я
      ))
    (=ucs		. #x044F)	; я
    (cyrillic-iso8859-5 . #xEF)	; �����
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
    (=gb2312		. #x2771)	; �����
    (=jis-x0208		. #x2771)	; �����
    (=ks-x1001		. #x2C71)	; �����
    (=big5-eten		. #xC875)	; ������
    (=ucs@jis		. #x044F)	; �����
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
      (=gb2312		  . #x2757)	; �����
      (=jis-x0208	  . #x2757)	; �����
      (=ks-x1001	  . #x2C57)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ё
      ))
    (=ucs		. #x0451)	; ё
    (cyrillic-iso8859-5 . #xF1)	; �����
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
    (=gb2312		. #x2757)	; �����
    (=jis-x0208		. #x2757)	; �����
    (=ks-x1001		. #x2C57)	; �����
    (=big5-eten		. #xC85B)	; ������
    (=ucs@jis		. #x0451)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DJE")
      (=jis-x0212	  . #x2772)	; �����
      (=ucs@jis		  . #x0452)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ђ
      ))
    (=ucs		. #x0452)	; ђ
    (cyrillic-iso8859-5 . #xF2)	; �����
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
    (=jis-x0212		. #x2772)	; �����
    (=ucs@jis		. #x0452)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0433 #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER GJE")
      (=jis-x0212	  . #x2773)	; �����
      (=ucs@jis		  . #x0453)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ѓ
      ))
    (=ucs		. #x0453)	; ѓ
    (cyrillic-iso8859-5 . #xF3)	; �����
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
    (=jis-x0212		. #x2773)	; �����
    (=ucs@jis		. #x0453)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UKRAINIAN IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=jis-x0212	  . #x2774)	; �����
      (=ucs@jis		  . #x0454)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Є
      ))
    (=ucs		. #x0454)	; є
    (cyrillic-iso8859-5 . #xF4)	; �����
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
    (=jis-x0212		. #x2774)	; �����
    (=ucs@jis		. #x0454)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZE")
      (=jis-x0212	  . #x2775)	; �����
      (=ucs@jis		  . #x0455)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ѕ
      ))
    (=ucs		. #x0455)	; ѕ
    (cyrillic-iso8859-5 . #xF5)	; �����
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
    (=jis-x0212		. #x2775)	; �����
    (=ucs@jis		. #x0455)	; �����
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name . "FULLWIDTH CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=jis-x0212	  . #x2776)	; �����
      (=ucs@jis		  . #x0456)	; �����
      ))
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      ))
    (=ucs		. #x0456)	; і
    (cyrillic-iso8859-5 . #xF6)	; �����
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
    (=jis-x0212		. #x2776)	; �����
    (=ucs@jis		. #x0456)	; �����
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
      (=jis-x0212	  . #x2777)	; �����
      (=ucs@jis		  . #x0457)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ї
      ))
    (=ucs		. #x0457)	; ї
    (cyrillic-iso8859-5 . #xF7)	; �����
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
    (=jis-x0212		. #x2777)	; �����
    (=ucs@jis		. #x0457)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER JE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER JE")
      (=jis-x0212	  . #x2778)	; �����
      (=ucs@jis		  . #x0458)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ј
      ))
    (=ucs		. #x0458)	; ј
    (cyrillic-iso8859-5 . #xF8)	; �����
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
    (=jis-x0212		. #x2778)	; �����
    (=ucs@jis		. #x0458)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER LJE")
      (=jis-x0212	  . #x2779)	; �����
      (=ucs@jis		  . #x0459)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Љ
      ))
    (=ucs		. #x0459)	; љ
    (cyrillic-iso8859-5 . #xF9)	; �����
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
    (=jis-x0212		. #x2779)	; �����
    (=ucs@jis		. #x0459)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER NJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER NJE")
      (=jis-x0212	  . #x277A)	; �����
      (=ucs@jis		  . #x045A)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; Њ
      ))
    (=ucs		. #x045A)	; њ
    (cyrillic-iso8859-5 . #xFA)	; �����
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
    (=jis-x0212		. #x277A)	; �����
    (=ucs@jis		. #x045A)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER TSHE")
      (=jis-x0212	  . #x277B)	; �����
      (=ucs@jis		  . #x045B)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSHE")
      (=ucs		  . #x040B)	; Ћ
      ))
    (=ucs		. #x045B)	; ћ
    (cyrillic-iso8859-5 . #xFB)	; �����
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
    (=jis-x0212		. #x277B)	; �����
    (=ucs@jis		. #x045B)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x043A #x0301)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER KJE")
      (=jis-x0212	  . #x277C)	; �����
      (=ucs@jis		  . #x045C)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; Ќ
      ))
    (=ucs		. #x045C)	; ќ
    (cyrillic-iso8859-5 . #xFC)	; �����
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
    (=jis-x0212		. #x277C)	; �����
    (=ucs@jis		. #x045C)	; �����
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
      (=jis-x0212	  . #x277D)	; �����
      (=ucs@jis		  . #x045E)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; Ў
      ))
    (=ucs		. #x045E)	; ў
    (cyrillic-iso8859-5 . #xFE)	; �����
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
    (=jis-x0212		. #x277D)	; �����
    (=ucs@jis		. #x045E)	; �����
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CYRILLIC SMALL LETTER DZHE")
      (=jis-x0212	  . #x277E)	; �����
      (=ucs@jis		  . #x045F)	; �����
      ))
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Џ
      ))
    (=ucs		. #x045F)	; џ
    (cyrillic-iso8859-5 . #xFF)	; �����
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
    (=jis-x0212		. #x277E)	; �����
    (=ucs@jis		. #x045F)	; �����
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
