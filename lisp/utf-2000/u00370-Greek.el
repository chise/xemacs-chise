;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "GREEK NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Dexia keraia")
    (->decomposition	#x02B9)
    (=ucs		. #x0374)	; ʹ
    ))
(define-char
  '((name		. "GREEK LOWER NUMERAL SIGN")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Aristeri keraia")
    (=ucs		. #x0375)	; ͵
    ))
(define-char
  '((name		. "GREEK YPOGEGRAMMENI")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0345)
    (=ucs		. #x037A)	; ͺ
    ))
(define-char
  '((name		. "GREEK QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Erotimatiko")
    (->decomposition	#x003B)
    (=ucs		. #x037E)	; ;
    ))
(define-char
  '((name		. "GREEK TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	compat #x0020 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek tonos")
      (=jis-x0212	  . #x2238)	; �����
      (=ucs@jis		  . #x0384)	; �����
      ))
    (=ucs		. #x0384)	; ΄
    (greek-iso8859-7	. #xB4)	; �����
    ))
(define-char
  '((name		. "fullwidth greek tonos")
    (=>ucs		. #x0384)	; ΄
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0384)
    (<-fullwidth
     ((name		  . "GREEK TONOS")
      (=ucs		  . #x0384)	; ΄
      ))
    (=jis-x0212		. #x2238)	; �����
    (=ucs@jis		. #x0384)	; �����
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek dialytika tonos")
      (=jis-x0212	  . #x2239)	; �����
      (=ucs@jis		  . #x0385)	; �����
      ))
    (=ucs		. #x0385)	; ΅
    (greek-iso8859-7	. #xB5)	; �����
    ))
(define-char
  '((name		. "fullwidth greek dialytika tonos")
    (=>ucs		. #x0385)	; ΅
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	wide #x0385)
    (<-fullwidth
     ((name		  . "GREEK DIALYTIKA TONOS")
      (=ucs		  . #x0385)	; ΅
      ))
    (=jis-x0212		. #x2239)	; �����
    (=ucs@jis		. #x0385)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter alpha with tonos")
      (=jis-x0212	  . #x2661)	; �����
      (=ucs@jis		  . #x0386)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (=ucs		. #x0386)	; Ά
    (greek-iso8859-7	. #xB6)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter alpha with tonos")
    (=>ucs		. #x0386)	; Ά
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0386)
    (->lowercase
     ((name . "fullwidth greek small letter alpha with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (=jis-x0212		. #x2661)	; �����
    (=ucs@jis		. #x0386)	; �����
    ))
(define-char
  '((name		. "GREEK ANO TELEIA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00B7)
    (=ucs		. #x0387)	; ·
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0395 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter epsilon with tonos")
      (=jis-x0212	  . #x2662)	; �����
      (=ucs@jis		  . #x0388)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (=ucs		. #x0388)	; Έ
    (greek-iso8859-7	. #xB8)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter epsilon with tonos")
    (=>ucs		. #x0388)	; Έ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0388)
    (->lowercase
     ((name . "fullwidth greek small letter epsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (=jis-x0212		. #x2662)	; �����
    (=ucs@jis		. #x0388)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter eta with tonos")
      (=jis-x0212	  . #x2663)	; �����
      (=ucs@jis		  . #x0389)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (=ucs		. #x0389)	; Ή
    (greek-iso8859-7	. #xB9)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter eta with tonos")
    (=>ucs		. #x0389)	; Ή
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0389)
    (->lowercase
     ((name . "fullwidth greek small letter eta with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (=jis-x0212		. #x2663)	; �����
    (=ucs@jis		. #x0389)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with tonos")
      (=jis-x0212	  . #x2664)	; �����
      (=ucs@jis		  . #x038A)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (=ucs		. #x038A)	; Ί
    (greek-iso8859-7	. #xBA)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter iota with tonos")
    (=>ucs		. #x038A)	; Ί
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038A)
    (->lowercase
     ((name . "fullwidth greek small letter iota with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (=jis-x0212		. #x2664)	; �����
    (=ucs@jis		. #x038A)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omicron with tonos")
      (=jis-x0212	  . #x2667)	; �����
      (=ucs@jis		  . #x038C)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (=ucs		. #x038C)	; Ό
    (greek-iso8859-7	. #xBC)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter omicron with tonos")
    (=>ucs		. #x038C)	; Ό
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038C)
    (->lowercase
     ((name . "fullwidth greek small letter omicron with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (=jis-x0212		. #x2667)	; �����
    (=ucs@jis		. #x038C)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with tonos")
      (=jis-x0212	  . #x2669)	; �����
      (=ucs@jis		  . #x038E)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (=ucs		. #x038E)	; Ύ
    (greek-iso8859-7	. #xBE)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter upsilon with tonos")
    (=>ucs		. #x038E)	; Ύ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038E)
    (->lowercase
     ((name . "fullwidth greek small letter upsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (=jis-x0212		. #x2669)	; �����
    (=ucs@jis		. #x038E)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omega with tonos")
      (=jis-x0212	  . #x266C)	; �����
      (=ucs@jis		  . #x038F)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (=ucs		. #x038F)	; Ώ
    (greek-iso8859-7	. #xBF)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter omega with tonos")
    (=>ucs		. #x038F)	; Ώ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x038F)
    (->lowercase
     ((name . "fullwidth greek small letter omega with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (=jis-x0212		. #x266C)	; �����
    (=ucs@jis		. #x038F)	; �����
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika and tonos")
      (=jis-x0212	  . #x2676)	; �����
      (=ucs@jis		  . #x0390)	; �����
      ))
    (=ucs		. #x0390)	; ΐ
    (greek-iso8859-7	. #xC0)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter iota with dialytika and tonos")
    (=>ucs		. #x0390)	; ΐ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0390)
    (<-fullwidth
     ((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x0390)	; ΐ
      ))
    (=jis-x0212		. #x2676)	; �����
    (=ucs@jis		. #x0390)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter alpha")
      (=gb2312		  . #x2621)	; �����
      (=jis-x0208	  . #x2621)	; �����
      (=ks-x1001	  . #x2541)	; �����
      (=cns11643-1	  . #x2475)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      ))
    (=ucs		. #x0391)	; Α
    (greek-iso8859-7	. #xC1)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter alpha")
    (=>ucs		. #x0391)	; Α
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0391)
    (->lowercase
     ((name		  . "fullwidth greek small letter alpha")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      ))
    (=gb2312		. #x2621)	; �����
    (=jis-x0208		. #x2621)	; �����
    (=ks-x1001		. #x2541)	; �����
    (=cns11643-1	. #x2475)	; �����
    (=big5		. #xA344)	; ������
    (=ucs@jis		. #x0391)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter beta")
      (=gb2312		  . #x2622)	; �����
      (=jis-x0208	  . #x2622)	; �����
      (=ks-x1001	  . #x2542)	; �����
      (=cns11643-1	  . #x2476)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; β
      ))
    (=ucs		. #x0392)	; Β
    (greek-iso8859-7	. #xC2)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter beta")
    (=>ucs		. #x0392)	; Β
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0392)
    (->lowercase
     ((name		  . "fullwidth greek small letter beta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (=gb2312		. #x2622)	; �����
    (=jis-x0208		. #x2622)	; �����
    (=ks-x1001		. #x2542)	; �����
    (=cns11643-1	. #x2476)	; �����
    (=big5		. #xA345)	; ������
    (=ucs@jis		. #x0392)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter gamma")
      (=gb2312		  . #x2623)	; �����
      (=jis-x0208	  . #x2623)	; �����
      (=ks-x1001	  . #x2543)	; �����
      (=cns11643-1	  . #x2477)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; γ
      ))
    (=ucs		. #x0393)	; Γ
    (greek-iso8859-7	. #xC3)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter gamma")
    (=>ucs		. #x0393)	; Γ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0393)
    (->lowercase
     ((name		  . "fullwidth greek small letter gamma")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Γ
      ))
    (=gb2312		. #x2623)	; �����
    (=jis-x0208		. #x2623)	; �����
    (=ks-x1001		. #x2543)	; �����
    (=cns11643-1	. #x2477)	; �����
    (=big5		. #xA346)	; ������
    (=ucs@jis		. #x0393)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter delta")
      (=gb2312		  . #x2624)	; �����
      (=jis-x0208	  . #x2624)	; �����
      (=ks-x1001	  . #x2544)	; �����
      (=cns11643-1	  . #x2478)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; δ
      ))
    (=ucs		. #x0394)	; Δ
    (greek-iso8859-7	. #xC4)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter delta")
    (=>ucs		. #x0394)	; Δ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0394)
    (->lowercase
     ((name		  . "fullwidth greek small letter delta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Δ
      ))
    (=gb2312		. #x2624)	; �����
    (=jis-x0208		. #x2624)	; �����
    (=ks-x1001		. #x2544)	; �����
    (=cns11643-1	. #x2478)	; �����
    (=big5		. #xA347)	; ������
    (=ucs@jis		. #x0394)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter epsilon")
      (=gb2312		  . #x2625)	; �����
      (=jis-x0208	  . #x2625)	; �����
      (=ks-x1001	  . #x2545)	; �����
      (=cns11643-1	  . #x2479)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      ))
    (=ucs		. #x0395)	; Ε
    (greek-iso8859-7	. #xC5)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter epsilon")
    (=>ucs		. #x0395)	; Ε
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0395)
    (->lowercase
     ((name		  . "fullwidth greek small letter epsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      ))
    (=gb2312		. #x2625)	; �����
    (=jis-x0208		. #x2625)	; �����
    (=ks-x1001		. #x2545)	; �����
    (=cns11643-1	. #x2479)	; �����
    (=big5		. #xA348)	; ������
    (=ucs@jis		. #x0395)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter zeta")
      (=gb2312		  . #x2626)	; �����
      (=jis-x0208	  . #x2626)	; �����
      (=ks-x1001	  . #x2546)	; �����
      (=cns11643-1	  . #x247A)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; ζ
      ))
    (=ucs		. #x0396)	; Ζ
    (greek-iso8859-7	. #xC6)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter zeta")
    (=>ucs		. #x0396)	; Ζ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0396)
    (->lowercase
     ((name		  . "fullwidth greek small letter zeta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Ζ
      ))
    (=gb2312		. #x2626)	; �����
    (=jis-x0208		. #x2626)	; �����
    (=ks-x1001		. #x2546)	; �����
    (=cns11643-1	. #x247A)	; �����
    (=big5		. #xA349)	; ������
    (=ucs@jis		. #x0396)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter eta")
      (=gb2312		  . #x2627)	; �����
      (=jis-x0208	  . #x2627)	; �����
      (=ks-x1001	  . #x2547)	; �����
      (=cns11643-1	  . #x247B)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      ))
    (=ucs		. #x0397)	; Η
    (greek-iso8859-7	. #xC7)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter eta")
    (=>ucs		. #x0397)	; Η
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0397)
    (->lowercase
     ((name		  . "fullwidth greek small letter eta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      ))
    (=gb2312		. #x2627)	; �����
    (=jis-x0208		. #x2627)	; �����
    (=ks-x1001		. #x2547)	; �����
    (=cns11643-1	. #x247B)	; �����
    (=big5		. #xA34A)	; ������
    (=ucs@jis		. #x0397)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter theta")
      (=gb2312		  . #x2628)	; �����
      (=jis-x0208	  . #x2628)	; �����
      (=ks-x1001	  . #x2548)	; �����
      (=cns11643-1	  . #x247C)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; θ
      ))
    (=ucs		. #x0398)	; Θ
    (greek-iso8859-7	. #xC8)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter theta")
    (=>ucs		. #x0398)	; Θ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0398)
    (->lowercase
     ((name		  . "fullwidth greek small letter theta")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (=gb2312		. #x2628)	; �����
    (=jis-x0208		. #x2628)	; �����
    (=ks-x1001		. #x2548)	; �����
    (=cns11643-1	. #x247C)	; �����
    (=big5		. #xA34B)	; ������
    (=ucs@jis		. #x0398)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter iota")
      (=gb2312		  . #x2629)	; �����
      (=jis-x0208	  . #x2629)	; �����
      (=ks-x1001	  . #x2549)	; �����
      (=cns11643-1	  . #x247D)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (=ucs		. #x0399)	; Ι
    (greek-iso8859-7	. #xC9)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter iota")
    (=>ucs		. #x0399)	; Ι
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x0399)
    (->lowercase
     ((name		  . "fullwidth greek small letter iota")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (=gb2312		. #x2629)	; �����
    (=jis-x0208		. #x2629)	; �����
    (=ks-x1001		. #x2549)	; �����
    (=cns11643-1	. #x247D)	; �����
    (=big5		. #xA34C)	; ������
    (=ucs@jis		. #x0399)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter kappa")
      (=gb2312		  . #x262A)	; �����
      (=jis-x0208	  . #x262A)	; �����
      (=ks-x1001	  . #x254A)	; �����
      (=cns11643-1	  . #x247E)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; κ
      ))
    (=ucs		. #x039A)	; Κ
    (greek-iso8859-7	. #xCA)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter kappa")
    (=>ucs		. #x039A)	; Κ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039A)
    (->lowercase
     ((name		  . "fullwidth greek small letter kappa")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (=gb2312		. #x262A)	; �����
    (=jis-x0208		. #x262A)	; �����
    (=ks-x1001		. #x254A)	; �����
    (=cns11643-1	. #x247E)	; �����
    (=big5		. #xA34D)	; ������
    (=ucs@jis		. #x039A)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter lamda")
      (=gb2312		  . #x262B)	; �����
      (=jis-x0208	  . #x262B)	; �����
      (=ks-x1001	  . #x254B)	; �����
      (=cns11643-1	  . #x2521)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; λ
      ))
    (=ucs		. #x039B)	; Λ
    (greek-iso8859-7	. #xCB)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter lamda")
    (=>ucs		. #x039B)	; Λ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039B)
    (->lowercase
     ((name		  . "fullwidth greek small letter lamda")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Λ
      ))
    (=gb2312		. #x262B)	; �����
    (=jis-x0208		. #x262B)	; �����
    (=ks-x1001		. #x254B)	; �����
    (=cns11643-1	. #x2521)	; �����
    (=big5		. #xA34E)	; ������
    (=ucs@jis		. #x039B)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter mu")
      (=gb2312		  . #x262C)	; �����
      (=jis-x0208	  . #x262C)	; �����
      (=ks-x1001	  . #x254C)	; �����
      (=cns11643-1	  . #x2522)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    (=ucs		. #x039C)	; Μ
    (greek-iso8859-7	. #xCC)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter mu")
    (=>ucs		. #x039C)	; Μ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039C)
    (->lowercase
     ((name		  . "fullwidth greek small letter mu")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Μ
      ))
    (=gb2312		. #x262C)	; �����
    (=jis-x0208		. #x262C)	; �����
    (=ks-x1001		. #x254C)	; �����
    (=cns11643-1	. #x2522)	; �����
    (=big5		. #xA34F)	; ������
    (=ucs@jis		. #x039C)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter nu")
      (=gb2312		  . #x262D)	; �����
      (=jis-x0208	  . #x262D)	; �����
      (=ks-x1001	  . #x254D)	; �����
      (=cns11643-1	  . #x2523)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; ν
      ))
    (=ucs		. #x039D)	; Ν
    (greek-iso8859-7	. #xCD)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter nu")
    (=>ucs		. #x039D)	; Ν
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039D)
    (->lowercase
     ((name		  . "fullwidth greek small letter nu")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Ν
      ))
    (=gb2312		. #x262D)	; �����
    (=jis-x0208		. #x262D)	; �����
    (=ks-x1001		. #x254D)	; �����
    (=cns11643-1	. #x2523)	; �����
    (=big5		. #xA350)	; ������
    (=ucs@jis		. #x039D)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter xi")
      (=gb2312		  . #x262E)	; �����
      (=jis-x0208	  . #x262E)	; �����
      (=ks-x1001	  . #x254E)	; �����
      (=cns11643-1	  . #x2524)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; ξ
      ))
    (=ucs		. #x039E)	; Ξ
    (greek-iso8859-7	. #xCE)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter xi")
    (=>ucs		. #x039E)	; Ξ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039E)
    (->lowercase
     ((name		  . "fullwidth greek small letter xi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Ξ
      ))
    (=gb2312		. #x262E)	; �����
    (=jis-x0208		. #x262E)	; �����
    (=ks-x1001		. #x254E)	; �����
    (=cns11643-1	. #x2524)	; �����
    (=big5		. #xA351)	; ������
    (=ucs@jis		. #x039E)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omicron")
      (=gb2312		  . #x262F)	; �����
      (=jis-x0208	  . #x262F)	; �����
      (=ks-x1001	  . #x254F)	; �����
      (=cns11643-1	  . #x2525)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      ))
    (=ucs		. #x039F)	; Ο
    (greek-iso8859-7	. #xCF)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter omicron")
    (=>ucs		. #x039F)	; Ο
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x039F)
    (->lowercase
     ((name		  . "fullwidth greek small letter omicron")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      ))
    (=gb2312		. #x262F)	; �����
    (=jis-x0208		. #x262F)	; �����
    (=ks-x1001		. #x254F)	; �����
    (=cns11643-1	. #x2525)	; �����
    (=big5		. #xA352)	; ������
    (=ucs@jis		. #x039F)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter pi")
      (=gb2312		  . #x2630)	; �����
      (=jis-x0208	  . #x2630)	; �����
      (=ks-x1001	  . #x2550)	; �����
      (=cns11643-1	  . #x2526)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; π
      ))
    (=ucs		. #x03A0)	; Π
    (greek-iso8859-7	. #xD0)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter pi")
    (=>ucs		. #x03A0)	; Π
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A0)
    (->lowercase
     ((name		  . "fullwidth greek small letter pi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (=gb2312		. #x2630)	; �����
    (=jis-x0208		. #x2630)	; �����
    (=ks-x1001		. #x2550)	; �����
    (=cns11643-1	. #x2526)	; �����
    (=big5		. #xA353)	; ������
    (=ucs@jis		. #x03A0)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter rho")
      (=gb2312		  . #x2631)	; �����
      (=jis-x0208	  . #x2631)	; �����
      (=ks-x1001	  . #x2551)	; �����
      (=cns11643-1	  . #x2527)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      ))
    (=ucs		. #x03A1)	; Ρ
    (greek-iso8859-7	. #xD1)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter rho")
    (=>ucs		. #x03A1)	; Ρ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A1)
    (->lowercase
     ((name		  . "fullwidth greek small letter rho")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (=gb2312		. #x2631)	; �����
    (=jis-x0208		. #x2631)	; �����
    (=ks-x1001		. #x2551)	; �����
    (=cns11643-1	. #x2527)	; �����
    (=big5		. #xA354)	; ������
    (=ucs@jis		. #x03A1)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter sigma")
      (=gb2312		  . #x2632)	; �����
      (=jis-x0208	  . #x2632)	; �����
      (=ks-x1001	  . #x2552)	; �����
      (=cns11643-1	  . #x2528)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; σ
      ))
    (=ucs		. #x03A3)	; Σ
    (greek-iso8859-7	. #xD3)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter sigma")
    (=>ucs		. #x03A3)	; Σ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A3)
    (->lowercase
     ((name		  . "fullwidth greek small letter sigma")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=gb2312		. #x2632)	; �����
    (=jis-x0208		. #x2632)	; �����
    (=ks-x1001		. #x2552)	; �����
    (=cns11643-1	. #x2528)	; �����
    (=big5		. #xA355)	; ������
    (=ucs@jis		. #x03A3)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter tau")
      (=gb2312		  . #x2633)	; �����
      (=jis-x0208	  . #x2633)	; �����
      (=ks-x1001	  . #x2553)	; �����
      (=cns11643-1	  . #x2529)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; τ
      ))
    (=ucs		. #x03A4)	; Τ
    (greek-iso8859-7	. #xD4)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter tau")
    (=>ucs		. #x03A4)	; Τ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A4)
    (->lowercase
     ((name		  . "fullwidth greek small letter tau")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Τ
      ))
    (=gb2312		. #x2633)	; �����
    (=jis-x0208		. #x2633)	; �����
    (=ks-x1001		. #x2553)	; �����
    (=cns11643-1	. #x2529)	; �����
    (=big5		. #xA356)	; ������
    (=ucs@jis		. #x03A4)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter upsilon")
      (=gb2312		  . #x2634)	; �����
      (=jis-x0208	  . #x2634)	; �����
      (=ks-x1001	  . #x2554)	; �����
      (=cns11643-1	  . #x252A)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      ))
    (=ucs		. #x03A5)	; Υ
    (greek-iso8859-7	. #xD5)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter upsilon")
    (=>ucs		. #x03A5)	; Υ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A5)
    (->lowercase
     ((name		  . "fullwidth greek small letter upsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      ))
    (=gb2312		. #x2634)	; �����
    (=jis-x0208		. #x2634)	; �����
    (=ks-x1001		. #x2554)	; �����
    (=cns11643-1	. #x252A)	; �����
    (=big5		. #xA357)	; ������
    (=ucs@jis		. #x03A5)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter phi")
      (=gb2312		  . #x2635)	; �����
      (=jis-x0208	  . #x2635)	; �����
      (=ks-x1001	  . #x2555)	; �����
      (=cns11643-1	  . #x252B)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; φ
      ))
    (=ucs		. #x03A6)	; Φ
    (greek-iso8859-7	. #xD6)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter phi")
    (=>ucs		. #x03A6)	; Φ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A6)
    (->lowercase
     ((name		  . "fullwidth greek small letter phi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (=gb2312		. #x2635)	; �����
    (=jis-x0208		. #x2635)	; �����
    (=ks-x1001		. #x2555)	; �����
    (=cns11643-1	. #x252B)	; �����
    (=big5		. #xA358)	; ������
    (=ucs@jis		. #x03A6)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter chi")
      (=gb2312		  . #x2636)	; �����
      (=jis-x0208	  . #x2636)	; �����
      (=ks-x1001	  . #x2556)	; �����
      (=cns11643-1	  . #x252C)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; χ
      ))
    (=ucs		. #x03A7)	; Χ
    (greek-iso8859-7	. #xD7)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter chi")
    (=>ucs		. #x03A7)	; Χ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A7)
    (->lowercase
     ((name		  . "fullwidth greek small letter chi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Χ
      ))
    (=gb2312		. #x2636)	; �����
    (=jis-x0208		. #x2636)	; �����
    (=ks-x1001		. #x2556)	; �����
    (=cns11643-1	. #x252C)	; �����
    (=big5		. #xA359)	; ������
    (=ucs@jis		. #x03A7)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter psi")
      (=gb2312		  . #x2637)	; �����
      (=jis-x0208	  . #x2637)	; �����
      (=ks-x1001	  . #x2557)	; �����
      (=cns11643-1	  . #x252D)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; ψ
      ))
    (=ucs		. #x03A8)	; Ψ
    (greek-iso8859-7	. #xD8)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter psi")
    (=>ucs		. #x03A8)	; Ψ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A8)
    (->lowercase
     ((name		  . "fullwidth greek small letter psi")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Ψ
      ))
    (=gb2312		. #x2637)	; �����
    (=jis-x0208		. #x2637)	; �����
    (=ks-x1001		. #x2557)	; �����
    (=cns11643-1	. #x252D)	; �����
    (=big5		. #xA35A)	; ������
    (=ucs@jis		. #x03A8)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omega")
      (=gb2312		  . #x2638)	; �����
      (=jis-x0208	  . #x2638)	; �����
      (=ks-x1001	  . #x2558)	; �����
      (=cns11643-1	  . #x252E)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      ))
    (=ucs		. #x03A9)	; Ω
    (greek-iso8859-7	. #xD9)	; �����
    ))
(define-char
  '((name		. "fullwidth greek capital letter omega")
    (=>ucs		. #x03A9)	; Ω
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03A9)
    (->lowercase
     ((name		  . "fullwidth greek small letter omega")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (=gb2312		. #x2638)	; �����
    (=jis-x0208		. #x2638)	; �����
    (=ks-x1001		. #x2558)	; �����
    (=cns11643-1	. #x252E)	; �����
    (=big5		. #xA35B)	; ������
    (=ucs@jis		. #x03A9)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with dialytika")
      (=jis-x0212	  . #x2665)	; �����
      (=ucs@jis		  . #x03AA)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      ))
    (=ucs		. #x03AA)	; Ϊ
    (greek-iso8859-7	. #xDA)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter iota with dialytika")
    (=>ucs		. #x03AA)	; Ϊ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AA)
    (->lowercase
     ((name . "fullwidth greek small letter iota with dialytika")
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Ϊ
      ))
    (=jis-x0212		. #x2665)	; �����
    (=ucs@jis		. #x03AA)	; �����
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with dialytika")
      (=jis-x0212	  . #x266A)	; �����
      (=ucs@jis		  . #x03AB)	; �����
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      ))
    (=ucs		. #x03AB)	; Ϋ
    (greek-iso8859-7	. #xDB)	; �����
    ))
(define-char
  '((name . "fullwidth greek capital letter upsilon with dialytika")
    (=>ucs		. #x03AB)	; Ϋ
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AB)
    (->lowercase
     ((name . "fullwidth greek small letter upsilon with dialytika")
      ))
    (<-fullwidth
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Ϋ
      ))
    (=jis-x0212		. #x266A)	; �����
    (=ucs@jis		. #x03AB)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter alpha with tonos")
      (=jis-x0212	  . #x2671)	; �����
      (=ucs@jis		  . #x03AC)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (=ucs		. #x03AC)	; ά
    (greek-iso8859-7	. #xDC)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter alpha with tonos")
    (=>ucs		. #x03AC)	; ά
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AC)
    (->uppercase
     ((name . "fullwidth greek capital letter alpha with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (=jis-x0212		. #x2671)	; �����
    (=ucs@jis		. #x03AC)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter epsilon with tonos")
      (=jis-x0212	  . #x2672)	; �����
      (=ucs@jis		  . #x03AD)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (=ucs		. #x03AD)	; έ
    (greek-iso8859-7	. #xDD)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter epsilon with tonos")
    (=>ucs		. #x03AD)	; έ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AD)
    (->uppercase
     ((name . "fullwidth greek capital letter epsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (=jis-x0212		. #x2672)	; �����
    (=ucs@jis		. #x03AD)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter eta with tonos")
      (=jis-x0212	  . #x2673)	; �����
      (=ucs@jis		  . #x03AE)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (=ucs		. #x03AE)	; ή
    (greek-iso8859-7	. #xDE)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter eta with tonos")
    (=>ucs		. #x03AE)	; ή
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AE)
    (->uppercase
     ((name . "fullwidth greek capital letter eta with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (=jis-x0212		. #x2673)	; �����
    (=ucs@jis		. #x03AE)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with tonos")
      (=jis-x0212	  . #x2674)	; �����
      (=ucs@jis		  . #x03AF)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (=ucs		. #x03AF)	; ί
    (greek-iso8859-7	. #xDF)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter iota with tonos")
    (=>ucs		. #x03AF)	; ί
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03AF)
    (->uppercase
     ((name . "fullwidth greek capital letter iota with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (=jis-x0212		. #x2674)	; �����
    (=ucs@jis		. #x03AF)	; �����
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika and tonos")
      (=jis-x0212	  . #x267B)	; �����
      (=ucs@jis		  . #x03B0)	; �����
      ))
    (=ucs		. #x03B0)	; ΰ
    (greek-iso8859-7	. #xE0)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter upsilon with dialytika and tonos")
    (=>ucs		. #x03B0)	; ΰ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B0)
    (<-fullwidth
     ((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x03B0)	; ΰ
      ))
    (=jis-x0212		. #x267B)	; �����
    (=ucs@jis		. #x03B0)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter alpha")
      (=gb2312		  . #x2641)	; �����
      (=jis-x0208	  . #x2641)	; �����
      (=ks-x1001	  . #x2561)	; �����
      (=cns11643-1	  . #x252F)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      ))
    (=ucs		. #x03B1)	; α
    (greek-iso8859-7	. #xE1)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter alpha")
    (=>ucs		. #x03B1)	; α
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B1)
    (->uppercase
     ((name		  . "fullwidth greek capital letter alpha")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      ))
    (=gb2312		. #x2641)	; �����
    (=jis-x0208		. #x2641)	; �����
    (=ks-x1001		. #x2561)	; �����
    (=cns11643-1	. #x252F)	; �����
    (=big5		. #xA35C)	; ������
    (=ucs@jis		. #x03B1)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter beta")
      (=gb2312		  . #x2642)	; �����
      (=jis-x0208	  . #x2642)	; �����
      (=ks-x1001	  . #x2562)	; �����
      (=cns11643-1	  . #x2530)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (=ucs		. #x03B2)	; β
    (greek-iso8859-7	. #xE2)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter beta")
    (=>ucs		. #x03B2)	; β
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B2)
    (->uppercase
     ((name		  . "fullwidth greek capital letter beta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; β
      ))
    (=gb2312		. #x2642)	; �����
    (=jis-x0208		. #x2642)	; �����
    (=ks-x1001		. #x2562)	; �����
    (=cns11643-1	. #x2530)	; �����
    (=big5		. #xA35D)	; ������
    (=ucs@jis		. #x03B2)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter gamma")
      (=gb2312		  . #x2643)	; �����
      (=jis-x0208	  . #x2643)	; �����
      (=ks-x1001	  . #x2563)	; �����
      (=cns11643-1	  . #x2531)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Γ
      ))
    (=ucs		. #x03B3)	; γ
    (greek-iso8859-7	. #xE3)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter gamma")
    (=>ucs		. #x03B3)	; γ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B3)
    (->uppercase
     ((name		  . "fullwidth greek capital letter gamma")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; γ
      ))
    (=gb2312		. #x2643)	; �����
    (=jis-x0208		. #x2643)	; �����
    (=ks-x1001		. #x2563)	; �����
    (=cns11643-1	. #x2531)	; �����
    (=big5		. #xA35E)	; ������
    (=ucs@jis		. #x03B3)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter delta")
      (=gb2312		  . #x2644)	; �����
      (=jis-x0208	  . #x2644)	; �����
      (=ks-x1001	  . #x2564)	; �����
      (=cns11643-1	  . #x2532)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Δ
      ))
    (=ucs		. #x03B4)	; δ
    (greek-iso8859-7	. #xE4)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter delta")
    (=>ucs		. #x03B4)	; δ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B4)
    (->uppercase
     ((name		  . "fullwidth greek capital letter delta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; δ
      ))
    (=gb2312		. #x2644)	; �����
    (=jis-x0208		. #x2644)	; �����
    (=ks-x1001		. #x2564)	; �����
    (=cns11643-1	. #x2532)	; �����
    (=big5		. #xA35F)	; ������
    (=ucs@jis		. #x03B4)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter epsilon")
      (=gb2312		  . #x2645)	; �����
      (=jis-x0208	  . #x2645)	; �����
      (=ks-x1001	  . #x2565)	; �����
      (=cns11643-1	  . #x2533)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      ))
    (=ucs		. #x03B5)	; ε
    (greek-iso8859-7	. #xE5)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter epsilon")
    (=>ucs		. #x03B5)	; ε
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B5)
    (->uppercase
     ((name		  . "fullwidth greek capital letter epsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      ))
    (=gb2312		. #x2645)	; �����
    (=jis-x0208		. #x2645)	; �����
    (=ks-x1001		. #x2565)	; �����
    (=cns11643-1	. #x2533)	; �����
    (=big5		. #xA360)	; ������
    (=ucs@jis		. #x03B5)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter zeta")
      (=gb2312		  . #x2646)	; �����
      (=jis-x0208	  . #x2646)	; �����
      (=ks-x1001	  . #x2566)	; �����
      (=cns11643-1	  . #x2534)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Ζ
      ))
    (=ucs		. #x03B6)	; ζ
    (greek-iso8859-7	. #xE6)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter zeta")
    (=>ucs		. #x03B6)	; ζ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B6)
    (->uppercase
     ((name		  . "fullwidth greek capital letter zeta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; ζ
      ))
    (=gb2312		. #x2646)	; �����
    (=jis-x0208		. #x2646)	; �����
    (=ks-x1001		. #x2566)	; �����
    (=cns11643-1	. #x2534)	; �����
    (=big5		. #xA361)	; ������
    (=ucs@jis		. #x03B6)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter eta")
      (=gb2312		  . #x2647)	; �����
      (=jis-x0208	  . #x2647)	; �����
      (=ks-x1001	  . #x2567)	; �����
      (=cns11643-1	  . #x2535)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      ))
    (=ucs		. #x03B7)	; η
    (greek-iso8859-7	. #xE7)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter eta")
    (=>ucs		. #x03B7)	; η
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B7)
    (->uppercase
     ((name		  . "fullwidth greek capital letter eta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      ))
    (=gb2312		. #x2647)	; �����
    (=jis-x0208		. #x2647)	; �����
    (=ks-x1001		. #x2567)	; �����
    (=cns11643-1	. #x2535)	; �����
    (=big5		. #xA362)	; ������
    (=ucs@jis		. #x03B7)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter theta")
      (=gb2312		  . #x2648)	; �����
      (=jis-x0208	  . #x2648)	; �����
      (=ks-x1001	  . #x2568)	; �����
      (=cns11643-1	  . #x2536)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (=ucs		. #x03B8)	; θ
    (greek-iso8859-7	. #xE8)	; �����
    (ipa		. #xC8)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter theta")
    (=>ucs		. #x03B8)	; θ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B8)
    (->uppercase
     ((name		  . "fullwidth greek capital letter theta")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; θ
      ))
    (=gb2312		. #x2648)	; �����
    (=jis-x0208		. #x2648)	; �����
    (=ks-x1001		. #x2568)	; �����
    (=cns11643-1	. #x2536)	; �����
    (=big5		. #xA363)	; ������
    (=ucs@jis		. #x03B8)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter iota")
      (=gb2312		  . #x2649)	; �����
      (=jis-x0208	  . #x2649)	; �����
      (=ks-x1001	  . #x2569)	; �����
      (=cns11643-1	  . #x2537)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (=ucs		. #x03B9)	; ι
    (greek-iso8859-7	. #xE9)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter iota")
    (=>ucs		. #x03B9)	; ι
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03B9)
    (->uppercase
     ((name		  . "fullwidth greek capital letter iota")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (=gb2312		. #x2649)	; �����
    (=jis-x0208		. #x2649)	; �����
    (=ks-x1001		. #x2569)	; �����
    (=cns11643-1	. #x2537)	; �����
    (=big5		. #xA364)	; ������
    (=ucs@jis		. #x03B9)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter kappa")
      (=gb2312		  . #x264A)	; �����
      (=jis-x0208	  . #x264A)	; �����
      (=ks-x1001	  . #x256A)	; �����
      (=cns11643-1	  . #x2538)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (=ucs		. #x03BA)	; κ
    (greek-iso8859-7	. #xEA)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter kappa")
    (=>ucs		. #x03BA)	; κ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BA)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; κ
      ))
    (=gb2312		. #x264A)	; �����
    (=jis-x0208		. #x264A)	; �����
    (=ks-x1001		. #x256A)	; �����
    (=cns11643-1	. #x2538)	; �����
    (=big5		. #xA365)	; ������
    (=ucs@jis		. #x03BA)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter lamda")
      (=gb2312		  . #x264B)	; �����
      (=jis-x0208	  . #x264B)	; �����
      (=ks-x1001	  . #x256B)	; �����
      (=cns11643-1	  . #x2539)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Λ
      ))
    (=ucs		. #x03BB)	; λ
    (greek-iso8859-7	. #xEB)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter lamda")
    (=>ucs		. #x03BB)	; λ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BB)
    (->uppercase
     ((name		  . "fullwidth greek capital letter lamda")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; λ
      ))
    (=gb2312		. #x264B)	; �����
    (=jis-x0208		. #x264B)	; �����
    (=ks-x1001		. #x256B)	; �����
    (=cns11643-1	. #x2539)	; �����
    (=big5		. #xA366)	; ������
    (=ucs@jis		. #x03BB)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter mu")
      (=gb2312		  . #x264C)	; �����
      (=jis-x0208	  . #x264C)	; �����
      (=ks-x1001	  . #x256C)	; �����
      (=cns11643-1	  . #x253A)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Μ
      ))
    (=ucs		. #x03BC)	; μ
    (greek-iso8859-7	. #xEC)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter mu")
    (=>ucs		. #x03BC)	; μ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BC)
    (->uppercase
     ((name		  . "fullwidth greek capital letter mu")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    (=gb2312		. #x264C)	; �����
    (=jis-x0208		. #x264C)	; �����
    (=ks-x1001		. #x256C)	; �����
    (=cns11643-1	. #x253A)	; �����
    (=big5		. #xA367)	; ������
    (=ucs@jis		. #x03BC)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter nu")
      (=gb2312		  . #x264D)	; �����
      (=jis-x0208	  . #x264D)	; �����
      (=ks-x1001	  . #x256D)	; �����
      (=cns11643-1	  . #x253B)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Ν
      ))
    (=ucs		. #x03BD)	; ν
    (greek-iso8859-7	. #xED)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter nu")
    (=>ucs		. #x03BD)	; ν
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BD)
    (->uppercase
     ((name		  . "fullwidth greek capital letter nu")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; ν
      ))
    (=gb2312		. #x264D)	; �����
    (=jis-x0208		. #x264D)	; �����
    (=ks-x1001		. #x256D)	; �����
    (=cns11643-1	. #x253B)	; �����
    (=big5		. #xA368)	; ������
    (=ucs@jis		. #x03BD)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter xi")
      (=gb2312		  . #x264E)	; �����
      (=jis-x0208	  . #x264E)	; �����
      (=ks-x1001	  . #x256E)	; �����
      (=cns11643-1	  . #x253C)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Ξ
      ))
    (=ucs		. #x03BE)	; ξ
    (greek-iso8859-7	. #xEE)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter xi")
    (=>ucs		. #x03BE)	; ξ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BE)
    (->uppercase
     ((name		  . "fullwidth greek capital letter xi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; ξ
      ))
    (=gb2312		. #x264E)	; �����
    (=jis-x0208		. #x264E)	; �����
    (=ks-x1001		. #x256E)	; �����
    (=cns11643-1	. #x253C)	; �����
    (=big5		. #xA369)	; ������
    (=ucs@jis		. #x03BE)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omicron")
      (=gb2312		  . #x264F)	; �����
      (=jis-x0208	  . #x264F)	; �����
      (=ks-x1001	  . #x256F)	; �����
      (=cns11643-1	  . #x253D)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      ))
    (=ucs		. #x03BF)	; ο
    (greek-iso8859-7	. #xEF)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter omicron")
    (=>ucs		. #x03BF)	; ο
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03BF)
    (->uppercase
     ((name		  . "fullwidth greek capital letter omicron")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      ))
    (=gb2312		. #x264F)	; �����
    (=jis-x0208		. #x264F)	; �����
    (=ks-x1001		. #x256F)	; �����
    (=cns11643-1	. #x253D)	; �����
    (=big5		. #xA36A)	; ������
    (=ucs@jis		. #x03BF)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter pi")
      (=gb2312		  . #x2650)	; �����
      (=jis-x0208	  . #x2650)	; �����
      (=ks-x1001	  . #x2570)	; �����
      (=cns11643-1	  . #x253E)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (=ucs		. #x03C0)	; π
    (greek-iso8859-7	. #xF0)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter pi")
    (=>ucs		. #x03C0)	; π
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C0)
    (->uppercase
     ((name		  . "fullwidth greek capital letter pi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; π
      ))
    (=gb2312		. #x2650)	; �����
    (=jis-x0208		. #x2650)	; �����
    (=ks-x1001		. #x2570)	; �����
    (=cns11643-1	. #x253E)	; �����
    (=big5		. #xA36B)	; ������
    (=ucs@jis		. #x03C0)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter rho")
      (=gb2312		  . #x2651)	; �����
      (=jis-x0208	  . #x2651)	; �����
      (=ks-x1001	  . #x2571)	; �����
      (=cns11643-1	  . #x253F)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (=ucs		. #x03C1)	; ρ
    (greek-iso8859-7	. #xF1)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter rho")
    (=>ucs		. #x03C1)	; ρ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C1)
    (->uppercase
     ((name		  . "fullwidth greek capital letter rho")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      ))
    (=gb2312		. #x2651)	; �����
    (=jis-x0208		. #x2651)	; �����
    (=ks-x1001		. #x2571)	; �����
    (=cns11643-1	. #x253F)	; �����
    (=big5		. #xA36C)	; ������
    (=ucs@jis		. #x03C1)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter final sigma")
      (=jis-x0212	  . #x2678)	; �����
      (=jis-x0213-1-2000  . #x2659)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03C2)	; ς
    (greek-iso8859-7	. #xF2)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter final sigma")
    (=>ucs		. #x03C2)	; ς
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C2)
    (->uppercase
     ((name		  . "fullwidth greek capital letter final sigma")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER FINAL SIGMA")
      (=ucs		  . #x03C2)	; ς
      ))
    (=jis-x0212		. #x2678)	; �����
    (=jis-x0213-1-2000	. #x2659)	; �����
    (=ucs@jis		. #x03C2)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter sigma")
      (=gb2312		  . #x2652)	; �����
      (=jis-x0208	  . #x2652)	; �����
      (=ks-x1001	  . #x2572)	; �����
      (=cns11643-1	  . #x2540)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03C3)	; σ
    (greek-iso8859-7	. #xF3)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter sigma")
    (=>ucs		. #x03C3)	; σ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C3)
    (->uppercase
     ((name		  . "fullwidth greek capital letter sigma")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; σ
      ))
    (=gb2312		. #x2652)	; �����
    (=jis-x0208		. #x2652)	; �����
    (=ks-x1001		. #x2572)	; �����
    (=cns11643-1	. #x2540)	; �����
    (=big5		. #xA36D)	; ������
    (=ucs@jis		. #x03C3)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter tau")
      (=gb2312		  . #x2653)	; �����
      (=jis-x0208	  . #x2653)	; �����
      (=ks-x1001	  . #x2573)	; �����
      (=cns11643-1	  . #x2541)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Τ
      ))
    (=ucs		. #x03C4)	; τ
    (greek-iso8859-7	. #xF4)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter tau")
    (=>ucs		. #x03C4)	; τ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C4)
    (->uppercase
     ((name		  . "fullwidth greek capital letter tau")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; τ
      ))
    (=gb2312		. #x2653)	; �����
    (=jis-x0208		. #x2653)	; �����
    (=ks-x1001		. #x2573)	; �����
    (=cns11643-1	. #x2541)	; �����
    (=big5		. #xA36E)	; ������
    (=ucs@jis		. #x03C4)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter upsilon")
      (=gb2312		  . #x2654)	; �����
      (=jis-x0208	  . #x2654)	; �����
      (=ks-x1001	  . #x2574)	; �����
      (=cns11643-1	  . #x2542)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      ))
    (=ucs		. #x03C5)	; υ
    (greek-iso8859-7	. #xF5)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter upsilon")
    (=>ucs		. #x03C5)	; υ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C5)
    (->uppercase
     ((name		  . "fullwidth greek capital letter upsilon")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      ))
    (=gb2312		. #x2654)	; �����
    (=jis-x0208		. #x2654)	; �����
    (=ks-x1001		. #x2574)	; �����
    (=cns11643-1	. #x2542)	; �����
    (=big5		. #xA36F)	; ������
    (=ucs@jis		. #x03C5)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter phi")
      (=gb2312		  . #x2655)	; �����
      (=jis-x0208	  . #x2655)	; �����
      (=ks-x1001	  . #x2575)	; �����
      (=cns11643-1	  . #x2543)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (=ucs		. #x03C6)	; φ
    (greek-iso8859-7	. #xF6)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter phi")
    (=>ucs		. #x03C6)	; φ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C6)
    (->uppercase
     ((name		  . "fullwidth greek capital letter phi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; φ
      ))
    (=gb2312		. #x2655)	; �����
    (=jis-x0208		. #x2655)	; �����
    (=ks-x1001		. #x2575)	; �����
    (=cns11643-1	. #x2543)	; �����
    (=big5		. #xA370)	; ������
    (=ucs@jis		. #x03C6)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter chi")
      (=gb2312		  . #x2656)	; �����
      (=jis-x0208	  . #x2656)	; �����
      (=ks-x1001	  . #x2576)	; �����
      (=cns11643-1	  . #x2544)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Χ
      ))
    (=ucs		. #x03C7)	; χ
    (greek-iso8859-7	. #xF7)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter chi")
    (=>ucs		. #x03C7)	; χ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C7)
    (->uppercase
     ((name		  . "fullwidth greek capital letter chi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; χ
      ))
    (=gb2312		. #x2656)	; �����
    (=jis-x0208		. #x2656)	; �����
    (=ks-x1001		. #x2576)	; �����
    (=cns11643-1	. #x2544)	; �����
    (=big5		. #xA371)	; ������
    (=ucs@jis		. #x03C7)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter psi")
      (=gb2312		  . #x2657)	; �����
      (=jis-x0208	  . #x2657)	; �����
      (=ks-x1001	  . #x2577)	; �����
      (=cns11643-1	  . #x2545)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Ψ
      ))
    (=ucs		. #x03C8)	; ψ
    (greek-iso8859-7	. #xF8)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter psi")
    (=>ucs		. #x03C8)	; ψ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C8)
    (->uppercase
     ((name		  . "fullwidth greek capital letter psi")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; ψ
      ))
    (=gb2312		. #x2657)	; �����
    (=jis-x0208		. #x2657)	; �����
    (=ks-x1001		. #x2577)	; �����
    (=cns11643-1	. #x2545)	; �����
    (=big5		. #xA372)	; ������
    (=ucs@jis		. #x03C8)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omega")
      (=gb2312		  . #x2658)	; �����
      (=jis-x0208	  . #x2658)	; �����
      (=ks-x1001	  . #x2578)	; �����
      (=cns11643-1	  . #x2546)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (=ucs		. #x03C9)	; ω
    (greek-iso8859-7	. #xF9)	; �����
    ))
(define-char
  '((name		. "fullwidth greek small letter omega")
    (=>ucs		. #x03C9)	; ω
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03C9)
    (->uppercase
     ((name		  . "fullwidth greek capital letter omega")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      ))
    (=gb2312		. #x2658)	; �����
    (=jis-x0208		. #x2658)	; �����
    (=ks-x1001		. #x2578)	; �����
    (=cns11643-1	. #x2546)	; �����
    (=big5		. #xA373)	; ������
    (=ucs@jis		. #x03C9)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika")
      (=jis-x0212	  . #x2675)	; �����
      (=ucs@jis		  . #x03CA)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Ϊ
      ))
    (=ucs		. #x03CA)	; ϊ
    (greek-iso8859-7	. #xFA)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter iota with dialytika")
    (=>ucs		. #x03CA)	; ϊ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CA)
    (->uppercase
     ((name . "fullwidth greek capital letter iota with dialytika")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      ))
    (=jis-x0212		. #x2675)	; �����
    (=ucs@jis		. #x03CA)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika")
      (=jis-x0212	  . #x267A)	; �����
      (=ucs@jis		  . #x03CB)	; �����
      ))
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Ϋ
      ))
    (=ucs		. #x03CB)	; ϋ
    (greek-iso8859-7	. #xFB)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter upsilon with dialytika")
    (=>ucs		. #x03CB)	; ϋ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CB)
    (->uppercase
     ((name . "fullwidth greek capital letter upsilon with dialytika")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      ))
    (=jis-x0212		. #x267A)	; �����
    (=ucs@jis		. #x03CB)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omicron with tonos")
      (=jis-x0212	  . #x2677)	; �����
      (=ucs@jis		  . #x03CC)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (=ucs		. #x03CC)	; ό
    (greek-iso8859-7	. #xFC)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter omicron with tonos")
    (=>ucs		. #x03CC)	; ό
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CC)
    (->uppercase
     ((name . "fullwidth greek capital letter omicron with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (=jis-x0212		. #x2677)	; �����
    (=ucs@jis		. #x03CC)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with tonos")
      (=jis-x0212	  . #x2679)	; �����
      (=ucs@jis		  . #x03CD)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (=ucs		. #x03CD)	; ύ
    (greek-iso8859-7	. #xFD)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter upsilon with tonos")
    (=>ucs		. #x03CD)	; ύ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CD)
    (->uppercase
     ((name . "fullwidth greek capital letter upsilon with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (=jis-x0212		. #x2679)	; �����
    (=ucs@jis		. #x03CD)	; �����
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omega with tonos")
      (=jis-x0212	  . #x267C)	; �����
      (=ucs@jis		  . #x03CE)	; �����
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (=ucs		. #x03CE)	; ώ
    (greek-iso8859-7	. #xFE)	; �����
    ))
(define-char
  '((name . "fullwidth greek small letter omega with tonos")
    (=>ucs		. #x03CE)	; ώ
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	wide #x03CE)
    (->uppercase
     ((name . "fullwidth greek capital letter omega with tonos")
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (=jis-x0212		. #x267C)	; �����
    (=ucs@jis		. #x03CE)	; �����
    ))
(define-char
  '((name		. "GREEK BETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B2)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (=ucs		. #x03D0)	; ϐ
    ))
(define-char
  '((name		. "GREEK THETA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03B8)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (=ucs		. #x03D1)	; ϑ
    ))
(define-char
  '((name		. "GREEK UPSILON WITH HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03A5)
    (=ucs		. #x03D2)	; ϒ
    ))
(define-char
  '((name		. "GREEK UPSILON WITH ACUTE AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0301)
    (=ucs		. #x03D3)	; ϓ
    ))
(define-char
  '((name		. "GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03D2 #x0308)
    (=ucs		. #x03D4)	; ϔ
    ))
(define-char
  '((name		. "GREEK PHI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C6)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (=ucs		. #x03D5)	; ϕ
    ))
(define-char
  '((name		. "GREEK PI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C0)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (=ucs		. #x03D6)	; ϖ
    ))
(define-char
  '((name		. "GREEK KAI SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x03D7)	; ϗ
    ))
(define-char
  '((name		. "GREEK LETTER STIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER STIGMA")
      (=ucs		  . #x03DB)	; ϛ
      ))
    (=ucs		. #x03DA)	; Ϛ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER STIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER STIGMA")
      (=ucs		  . #x03DA)	; Ϛ
      ))
    (=ucs		. #x03DB)	; ϛ
    ))
(define-char
  '((name		. "GREEK LETTER DIGAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DIGAMMA")
      (=ucs		  . #x03DD)	; ϝ
      ))
    (=ucs		. #x03DC)	; Ϝ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DIGAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER DIGAMMA")
      (=ucs		  . #x03DC)	; Ϝ
      ))
    (=ucs		. #x03DD)	; ϝ
    ))
(define-char
  '((name		. "GREEK LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KOPPA")
      (=ucs		  . #x03DF)	; ϟ
      ))
    (=ucs		. #x03DE)	; Ϟ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER KOPPA")
      (=ucs		  . #x03DE)	; Ϟ
      ))
    (=ucs		. #x03DF)	; ϟ
    ))
(define-char
  '((name		. "GREEK LETTER SAMPI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SAMPI")
      (=ucs		  . #x03E1)	; ϡ
      ))
    (=ucs		. #x03E0)	; Ϡ
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SAMPI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK LETTER SAMPI")
      (=ucs		  . #x03E0)	; Ϡ
      ))
    (=ucs		. #x03E1)	; ϡ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER SHEI")
      (=ucs		  . #x03E3)	; ϣ
      ))
    (=ucs		. #x03E2)	; Ϣ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER SHEI")
      (=ucs		  . #x03E2)	; Ϣ
      ))
    (=ucs		. #x03E3)	; ϣ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER FEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER FEI")
      (=ucs		  . #x03E5)	; ϥ
      ))
    (=ucs		. #x03E4)	; Ϥ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER FEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER FEI")
      (=ucs		  . #x03E4)	; Ϥ
      ))
    (=ucs		. #x03E5)	; ϥ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER KHEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER KHEI")
      (=ucs		  . #x03E7)	; ϧ
      ))
    (=ucs		. #x03E6)	; Ϧ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER KHEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER KHEI")
      (=ucs		  . #x03E6)	; Ϧ
      ))
    (=ucs		. #x03E7)	; ϧ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER HORI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER HORI")
      (=ucs		  . #x03E9)	; ϩ
      ))
    (=ucs		. #x03E8)	; Ϩ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER HORI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER HORI")
      (=ucs		  . #x03E8)	; Ϩ
      ))
    (=ucs		. #x03E9)	; ϩ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER GANGIA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER GANGIA")
      (=ucs		  . #x03EB)	; ϫ
      ))
    (=ucs		. #x03EA)	; Ϫ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER GANGIA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER GANGIA")
      (=ucs		  . #x03EA)	; Ϫ
      ))
    (=ucs		. #x03EB)	; ϫ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER SHIMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER SHIMA")
      (=ucs		  . #x03ED)	; ϭ
      ))
    (=ucs		. #x03EC)	; Ϭ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER SHIMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER SHIMA")
      (=ucs		  . #x03EC)	; Ϭ
      ))
    (=ucs		. #x03ED)	; ϭ
    ))
(define-char
  '((name		. "COPTIC CAPITAL LETTER DEI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "COPTIC SMALL LETTER DEI")
      (=ucs		  . #x03EF)	; ϯ
      ))
    (=ucs		. #x03EE)	; Ϯ
    ))
(define-char
  '((name		. "COPTIC SMALL LETTER DEI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "COPTIC CAPITAL LETTER DEI")
      (=ucs		  . #x03EE)	; Ϯ
      ))
    (=ucs		. #x03EF)	; ϯ
    ))
(define-char
  '((name		. "GREEK KAPPA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03BA)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (=ucs		. #x03F0)	; ϰ
    ))
(define-char
  '((name		. "GREEK RHO SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C1)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (=ucs		. #x03F1)	; ϱ
    ))
(define-char
  '((name		. "GREEK LUNATE SIGMA SYMBOL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	compat #x03C2)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03F2)	; ϲ
    ))
(define-char
  '((name		. "GREEK LETTER YOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x03F3)	; ϳ
    ))
