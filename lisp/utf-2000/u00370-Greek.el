;; -*- coding: utf-8-mcs-er -*-
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
      (=jis-x0212	  . #x2238)	; &JSP-2238;
      (=ucs@jis		  . #x0384)	; &JSP-2238;
      ))
    (=ucs		. #x0384)	; ΄
    (greek-iso8859-7	. #xB4)	; &I-GREEK-34;
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
    (=jis-x0212		. #x2238)	; &JSP-2238;
    (=ucs@jis		. #x0384)	; &JSP-2238;
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (->fullwidth
     ((name		  . "fullwidth greek dialytika tonos")
      (=jis-x0212	  . #x2239)	; &JSP-2239;
      (=ucs@jis		  . #x0385)	; &JSP-2239;
      ))
    (=ucs		. #x0385)	; ΅
    (greek-iso8859-7	. #xB5)	; &I-GREEK-35;
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
    (=jis-x0212		. #x2239)	; &JSP-2239;
    (=ucs@jis		. #x0385)	; &JSP-2239;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter alpha with tonos")
      (=jis-x0212	  . #x2661)	; &JSP-2661;
      (=ucs@jis		  . #x0386)	; &JSP-2661;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (=ucs		. #x0386)	; Ά
    (greek-iso8859-7	. #xB6)	; &I-GREEK-36;
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
    (=jis-x0212		. #x2661)	; &JSP-2661;
    (=ucs@jis		. #x0386)	; &JSP-2661;
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
      (=jis-x0212	  . #x2662)	; &JSP-2662;
      (=ucs@jis		  . #x0388)	; &JSP-2662;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (=ucs		. #x0388)	; Έ
    (greek-iso8859-7	. #xB8)	; &I-GREEK-38;
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
    (=jis-x0212		. #x2662)	; &JSP-2662;
    (=ucs@jis		. #x0388)	; &JSP-2662;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter eta with tonos")
      (=jis-x0212	  . #x2663)	; &JSP-2663;
      (=ucs@jis		  . #x0389)	; &JSP-2663;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (=ucs		. #x0389)	; Ή
    (greek-iso8859-7	. #xB9)	; &I-GREEK-39;
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
    (=jis-x0212		. #x2663)	; &JSP-2663;
    (=ucs@jis		. #x0389)	; &JSP-2663;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with tonos")
      (=jis-x0212	  . #x2664)	; &JSP-2664;
      (=ucs@jis		  . #x038A)	; &JSP-2664;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (=ucs		. #x038A)	; Ί
    (greek-iso8859-7	. #xBA)	; &I-GREEK-3A;
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
    (=jis-x0212		. #x2664)	; &JSP-2664;
    (=ucs@jis		. #x038A)	; &JSP-2664;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omicron with tonos")
      (=jis-x0212	  . #x2667)	; &JSP-2667;
      (=ucs@jis		  . #x038C)	; &JSP-2667;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (=ucs		. #x038C)	; Ό
    (greek-iso8859-7	. #xBC)	; &I-GREEK-3C;
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
    (=jis-x0212		. #x2667)	; &JSP-2667;
    (=ucs@jis		. #x038C)	; &JSP-2667;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with tonos")
      (=jis-x0212	  . #x2669)	; &JSP-2669;
      (=ucs@jis		  . #x038E)	; &JSP-2669;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (=ucs		. #x038E)	; Ύ
    (greek-iso8859-7	. #xBE)	; &I-GREEK-3E;
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
    (=jis-x0212		. #x2669)	; &JSP-2669;
    (=ucs@jis		. #x038E)	; &JSP-2669;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek capital letter omega with tonos")
      (=jis-x0212	  . #x266C)	; &JSP-266C;
      (=ucs@jis		  . #x038F)	; &JSP-266C;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (=ucs		. #x038F)	; Ώ
    (greek-iso8859-7	. #xBF)	; &I-GREEK-3F;
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
    (=jis-x0212		. #x266C)	; &JSP-266C;
    (=ucs@jis		. #x038F)	; &JSP-266C;
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika and tonos")
      (=jis-x0212	  . #x2676)	; &JSP-2676;
      (=ucs@jis		  . #x0390)	; &JSP-2676;
      ))
    (=ucs		. #x0390)	; ΐ
    (greek-iso8859-7	. #xC0)	; &I-GREEK-40;
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
    (=jis-x0212		. #x2676)	; &JSP-2676;
    (=ucs@jis		. #x0390)	; &JSP-2676;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter alpha")
      (=jis-x0208	  . #x2621)	; &J90-2621;
      (=gb2312		  . #x2621)	; &I-G0-2621;
      (=ks-x1001	  . #x2541)	; &I-K0-2541;
      (=cns11643-1	  . #x2475)	; &I-C1-2475;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      ))
    (=ucs		. #x0391)	; Α
    (greek-iso8859-7	. #xC1)	; &I-GREEK-41;
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
    (=jis-x0208		. #x2621)	; &J90-2621;
    (=gb2312		. #x2621)	; &I-G0-2621;
    (=ks-x1001		. #x2541)	; &I-K0-2541;
    (=cns11643-1	. #x2475)	; &I-C1-2475;
    (=big5		. #xA344)	; &I-B-A344;
    (=ucs@jis		. #x0391)	; &J90-2621;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter beta")
      (=jis-x0208	  . #x2622)	; &J90-2622;
      (=gb2312		  . #x2622)	; &I-G0-2622;
      (=ks-x1001	  . #x2542)	; &I-K0-2542;
      (=cns11643-1	  . #x2476)	; &I-C1-2476;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; β
      ))
    (=ucs		. #x0392)	; Β
    (greek-iso8859-7	. #xC2)	; &I-GREEK-42;
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
    (=jis-x0208		. #x2622)	; &J90-2622;
    (=gb2312		. #x2622)	; &I-G0-2622;
    (=ks-x1001		. #x2542)	; &I-K0-2542;
    (=cns11643-1	. #x2476)	; &I-C1-2476;
    (=big5		. #xA345)	; &I-B-A345;
    (=ucs@jis		. #x0392)	; &J90-2622;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter gamma")
      (=jis-x0208	  . #x2623)	; &J90-2623;
      (=gb2312		  . #x2623)	; &I-G0-2623;
      (=ks-x1001	  . #x2543)	; &I-K0-2543;
      (=cns11643-1	  . #x2477)	; &I-C1-2477;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; γ
      ))
    (=ucs		. #x0393)	; Γ
    (greek-iso8859-7	. #xC3)	; &I-GREEK-43;
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
    (=jis-x0208		. #x2623)	; &J90-2623;
    (=gb2312		. #x2623)	; &I-G0-2623;
    (=ks-x1001		. #x2543)	; &I-K0-2543;
    (=cns11643-1	. #x2477)	; &I-C1-2477;
    (=big5		. #xA346)	; &I-B-A346;
    (=ucs@jis		. #x0393)	; &J90-2623;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter delta")
      (=jis-x0208	  . #x2624)	; &J90-2624;
      (=gb2312		  . #x2624)	; &I-G0-2624;
      (=ks-x1001	  . #x2544)	; &I-K0-2544;
      (=cns11643-1	  . #x2478)	; &I-C1-2478;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; δ
      ))
    (=ucs		. #x0394)	; Δ
    (greek-iso8859-7	. #xC4)	; &I-GREEK-44;
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
    (=jis-x0208		. #x2624)	; &J90-2624;
    (=gb2312		. #x2624)	; &I-G0-2624;
    (=ks-x1001		. #x2544)	; &I-K0-2544;
    (=cns11643-1	. #x2478)	; &I-C1-2478;
    (=big5		. #xA347)	; &I-B-A347;
    (=ucs@jis		. #x0394)	; &J90-2624;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter epsilon")
      (=jis-x0208	  . #x2625)	; &J90-2625;
      (=gb2312		  . #x2625)	; &I-G0-2625;
      (=ks-x1001	  . #x2545)	; &I-K0-2545;
      (=cns11643-1	  . #x2479)	; &I-C1-2479;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      ))
    (=ucs		. #x0395)	; Ε
    (greek-iso8859-7	. #xC5)	; &I-GREEK-45;
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
    (=jis-x0208		. #x2625)	; &J90-2625;
    (=gb2312		. #x2625)	; &I-G0-2625;
    (=ks-x1001		. #x2545)	; &I-K0-2545;
    (=cns11643-1	. #x2479)	; &I-C1-2479;
    (=big5		. #xA348)	; &I-B-A348;
    (=ucs@jis		. #x0395)	; &J90-2625;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter zeta")
      (=jis-x0208	  . #x2626)	; &J90-2626;
      (=gb2312		  . #x2626)	; &I-G0-2626;
      (=ks-x1001	  . #x2546)	; &I-K0-2546;
      (=cns11643-1	  . #x247A)	; &I-C1-247A;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; ζ
      ))
    (=ucs		. #x0396)	; Ζ
    (greek-iso8859-7	. #xC6)	; &I-GREEK-46;
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
    (=jis-x0208		. #x2626)	; &J90-2626;
    (=gb2312		. #x2626)	; &I-G0-2626;
    (=ks-x1001		. #x2546)	; &I-K0-2546;
    (=cns11643-1	. #x247A)	; &I-C1-247A;
    (=big5		. #xA349)	; &I-B-A349;
    (=ucs@jis		. #x0396)	; &J90-2626;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter eta")
      (=jis-x0208	  . #x2627)	; &J90-2627;
      (=gb2312		  . #x2627)	; &I-G0-2627;
      (=ks-x1001	  . #x2547)	; &I-K0-2547;
      (=cns11643-1	  . #x247B)	; &I-C1-247B;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      ))
    (=ucs		. #x0397)	; Η
    (greek-iso8859-7	. #xC7)	; &I-GREEK-47;
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
    (=jis-x0208		. #x2627)	; &J90-2627;
    (=gb2312		. #x2627)	; &I-G0-2627;
    (=ks-x1001		. #x2547)	; &I-K0-2547;
    (=cns11643-1	. #x247B)	; &I-C1-247B;
    (=big5		. #xA34A)	; &I-B-A34A;
    (=ucs@jis		. #x0397)	; &J90-2627;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter theta")
      (=jis-x0208	  . #x2628)	; &J90-2628;
      (=gb2312		  . #x2628)	; &I-G0-2628;
      (=ks-x1001	  . #x2548)	; &I-K0-2548;
      (=cns11643-1	  . #x247C)	; &I-C1-247C;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; θ
      ))
    (=ucs		. #x0398)	; Θ
    (greek-iso8859-7	. #xC8)	; &I-GREEK-48;
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
    (=jis-x0208		. #x2628)	; &J90-2628;
    (=gb2312		. #x2628)	; &I-G0-2628;
    (=ks-x1001		. #x2548)	; &I-K0-2548;
    (=cns11643-1	. #x247C)	; &I-C1-247C;
    (=big5		. #xA34B)	; &I-B-A34B;
    (=ucs@jis		. #x0398)	; &J90-2628;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter iota")
      (=jis-x0208	  . #x2629)	; &J90-2629;
      (=gb2312		  . #x2629)	; &I-G0-2629;
      (=ks-x1001	  . #x2549)	; &I-K0-2549;
      (=cns11643-1	  . #x247D)	; &I-C1-247D;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (=ucs		. #x0399)	; Ι
    (greek-iso8859-7	. #xC9)	; &I-GREEK-49;
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
    (=jis-x0208		. #x2629)	; &J90-2629;
    (=gb2312		. #x2629)	; &I-G0-2629;
    (=ks-x1001		. #x2549)	; &I-K0-2549;
    (=cns11643-1	. #x247D)	; &I-C1-247D;
    (=big5		. #xA34C)	; &I-B-A34C;
    (=ucs@jis		. #x0399)	; &J90-2629;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter kappa")
      (=jis-x0208	  . #x262A)	; &J90-262A;
      (=gb2312		  . #x262A)	; &I-G0-262A;
      (=ks-x1001	  . #x254A)	; &I-K0-254A;
      (=cns11643-1	  . #x247E)	; &I-C1-247E;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; κ
      ))
    (=ucs		. #x039A)	; Κ
    (greek-iso8859-7	. #xCA)	; &I-GREEK-4A;
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
    (=jis-x0208		. #x262A)	; &J90-262A;
    (=gb2312		. #x262A)	; &I-G0-262A;
    (=ks-x1001		. #x254A)	; &I-K0-254A;
    (=cns11643-1	. #x247E)	; &I-C1-247E;
    (=big5		. #xA34D)	; &I-B-A34D;
    (=ucs@jis		. #x039A)	; &J90-262A;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter lamda")
      (=jis-x0208	  . #x262B)	; &J90-262B;
      (=gb2312		  . #x262B)	; &I-G0-262B;
      (=ks-x1001	  . #x254B)	; &I-K0-254B;
      (=cns11643-1	  . #x2521)	; &I-C1-2521;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; λ
      ))
    (=ucs		. #x039B)	; Λ
    (greek-iso8859-7	. #xCB)	; &I-GREEK-4B;
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
    (=jis-x0208		. #x262B)	; &J90-262B;
    (=gb2312		. #x262B)	; &I-G0-262B;
    (=ks-x1001		. #x254B)	; &I-K0-254B;
    (=cns11643-1	. #x2521)	; &I-C1-2521;
    (=big5		. #xA34E)	; &I-B-A34E;
    (=ucs@jis		. #x039B)	; &J90-262B;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter mu")
      (=jis-x0208	  . #x262C)	; &J90-262C;
      (=gb2312		  . #x262C)	; &I-G0-262C;
      (=ks-x1001	  . #x254C)	; &I-K0-254C;
      (=cns11643-1	  . #x2522)	; &I-C1-2522;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    (=ucs		. #x039C)	; Μ
    (greek-iso8859-7	. #xCC)	; &I-GREEK-4C;
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
    (=jis-x0208		. #x262C)	; &J90-262C;
    (=gb2312		. #x262C)	; &I-G0-262C;
    (=ks-x1001		. #x254C)	; &I-K0-254C;
    (=cns11643-1	. #x2522)	; &I-C1-2522;
    (=big5		. #xA34F)	; &I-B-A34F;
    (=ucs@jis		. #x039C)	; &J90-262C;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter nu")
      (=jis-x0208	  . #x262D)	; &J90-262D;
      (=gb2312		  . #x262D)	; &I-G0-262D;
      (=ks-x1001	  . #x254D)	; &I-K0-254D;
      (=cns11643-1	  . #x2523)	; &I-C1-2523;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; ν
      ))
    (=ucs		. #x039D)	; Ν
    (greek-iso8859-7	. #xCD)	; &I-GREEK-4D;
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
    (=jis-x0208		. #x262D)	; &J90-262D;
    (=gb2312		. #x262D)	; &I-G0-262D;
    (=ks-x1001		. #x254D)	; &I-K0-254D;
    (=cns11643-1	. #x2523)	; &I-C1-2523;
    (=big5		. #xA350)	; &I-B-A350;
    (=ucs@jis		. #x039D)	; &J90-262D;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter xi")
      (=jis-x0208	  . #x262E)	; &J90-262E;
      (=gb2312		  . #x262E)	; &I-G0-262E;
      (=ks-x1001	  . #x254E)	; &I-K0-254E;
      (=cns11643-1	  . #x2524)	; &I-C1-2524;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; ξ
      ))
    (=ucs		. #x039E)	; Ξ
    (greek-iso8859-7	. #xCE)	; &I-GREEK-4E;
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
    (=jis-x0208		. #x262E)	; &J90-262E;
    (=gb2312		. #x262E)	; &I-G0-262E;
    (=ks-x1001		. #x254E)	; &I-K0-254E;
    (=cns11643-1	. #x2524)	; &I-C1-2524;
    (=big5		. #xA351)	; &I-B-A351;
    (=ucs@jis		. #x039E)	; &J90-262E;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omicron")
      (=jis-x0208	  . #x262F)	; &J90-262F;
      (=gb2312		  . #x262F)	; &I-G0-262F;
      (=ks-x1001	  . #x254F)	; &I-K0-254F;
      (=cns11643-1	  . #x2525)	; &I-C1-2525;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      ))
    (=ucs		. #x039F)	; Ο
    (greek-iso8859-7	. #xCF)	; &I-GREEK-4F;
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
    (=jis-x0208		. #x262F)	; &J90-262F;
    (=gb2312		. #x262F)	; &I-G0-262F;
    (=ks-x1001		. #x254F)	; &I-K0-254F;
    (=cns11643-1	. #x2525)	; &I-C1-2525;
    (=big5		. #xA352)	; &I-B-A352;
    (=ucs@jis		. #x039F)	; &J90-262F;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter pi")
      (=jis-x0208	  . #x2630)	; &J90-2630;
      (=gb2312		  . #x2630)	; &I-G0-2630;
      (=ks-x1001	  . #x2550)	; &I-K0-2550;
      (=cns11643-1	  . #x2526)	; &I-C1-2526;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; π
      ))
    (=ucs		. #x03A0)	; Π
    (greek-iso8859-7	. #xD0)	; &I-GREEK-50;
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
    (=jis-x0208		. #x2630)	; &J90-2630;
    (=gb2312		. #x2630)	; &I-G0-2630;
    (=ks-x1001		. #x2550)	; &I-K0-2550;
    (=cns11643-1	. #x2526)	; &I-C1-2526;
    (=big5		. #xA353)	; &I-B-A353;
    (=ucs@jis		. #x03A0)	; &J90-2630;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter rho")
      (=jis-x0208	  . #x2631)	; &J90-2631;
      (=gb2312		  . #x2631)	; &I-G0-2631;
      (=ks-x1001	  . #x2551)	; &I-K0-2551;
      (=cns11643-1	  . #x2527)	; &I-C1-2527;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      ))
    (=ucs		. #x03A1)	; Ρ
    (greek-iso8859-7	. #xD1)	; &I-GREEK-51;
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
    (=jis-x0208		. #x2631)	; &J90-2631;
    (=gb2312		. #x2631)	; &I-G0-2631;
    (=ks-x1001		. #x2551)	; &I-K0-2551;
    (=cns11643-1	. #x2527)	; &I-C1-2527;
    (=big5		. #xA354)	; &I-B-A354;
    (=ucs@jis		. #x03A1)	; &J90-2631;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter sigma")
      (=jis-x0208	  . #x2632)	; &J90-2632;
      (=gb2312		  . #x2632)	; &I-G0-2632;
      (=ks-x1001	  . #x2552)	; &I-K0-2552;
      (=cns11643-1	  . #x2528)	; &I-C1-2528;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; σ
      ))
    (=ucs		. #x03A3)	; Σ
    (greek-iso8859-7	. #xD3)	; &I-GREEK-53;
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
    (=jis-x0208		. #x2632)	; &J90-2632;
    (=gb2312		. #x2632)	; &I-G0-2632;
    (=ks-x1001		. #x2552)	; &I-K0-2552;
    (=cns11643-1	. #x2528)	; &I-C1-2528;
    (=big5		. #xA355)	; &I-B-A355;
    (=ucs@jis		. #x03A3)	; &J90-2632;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter tau")
      (=jis-x0208	  . #x2633)	; &J90-2633;
      (=gb2312		  . #x2633)	; &I-G0-2633;
      (=ks-x1001	  . #x2553)	; &I-K0-2553;
      (=cns11643-1	  . #x2529)	; &I-C1-2529;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; τ
      ))
    (=ucs		. #x03A4)	; Τ
    (greek-iso8859-7	. #xD4)	; &I-GREEK-54;
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
    (=jis-x0208		. #x2633)	; &J90-2633;
    (=gb2312		. #x2633)	; &I-G0-2633;
    (=ks-x1001		. #x2553)	; &I-K0-2553;
    (=cns11643-1	. #x2529)	; &I-C1-2529;
    (=big5		. #xA356)	; &I-B-A356;
    (=ucs@jis		. #x03A4)	; &J90-2633;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter upsilon")
      (=jis-x0208	  . #x2634)	; &J90-2634;
      (=gb2312		  . #x2634)	; &I-G0-2634;
      (=ks-x1001	  . #x2554)	; &I-K0-2554;
      (=cns11643-1	  . #x252A)	; &I-C1-252A;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      ))
    (=ucs		. #x03A5)	; Υ
    (greek-iso8859-7	. #xD5)	; &I-GREEK-55;
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
    (=jis-x0208		. #x2634)	; &J90-2634;
    (=gb2312		. #x2634)	; &I-G0-2634;
    (=ks-x1001		. #x2554)	; &I-K0-2554;
    (=cns11643-1	. #x252A)	; &I-C1-252A;
    (=big5		. #xA357)	; &I-B-A357;
    (=ucs@jis		. #x03A5)	; &J90-2634;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter phi")
      (=jis-x0208	  . #x2635)	; &J90-2635;
      (=gb2312		  . #x2635)	; &I-G0-2635;
      (=ks-x1001	  . #x2555)	; &I-K0-2555;
      (=cns11643-1	  . #x252B)	; &I-C1-252B;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; φ
      ))
    (=ucs		. #x03A6)	; Φ
    (greek-iso8859-7	. #xD6)	; &I-GREEK-56;
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
    (=jis-x0208		. #x2635)	; &J90-2635;
    (=gb2312		. #x2635)	; &I-G0-2635;
    (=ks-x1001		. #x2555)	; &I-K0-2555;
    (=cns11643-1	. #x252B)	; &I-C1-252B;
    (=big5		. #xA358)	; &I-B-A358;
    (=ucs@jis		. #x03A6)	; &J90-2635;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter chi")
      (=jis-x0208	  . #x2636)	; &J90-2636;
      (=gb2312		  . #x2636)	; &I-G0-2636;
      (=ks-x1001	  . #x2556)	; &I-K0-2556;
      (=cns11643-1	  . #x252C)	; &I-C1-252C;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; χ
      ))
    (=ucs		. #x03A7)	; Χ
    (greek-iso8859-7	. #xD7)	; &I-GREEK-57;
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
    (=jis-x0208		. #x2636)	; &J90-2636;
    (=gb2312		. #x2636)	; &I-G0-2636;
    (=ks-x1001		. #x2556)	; &I-K0-2556;
    (=cns11643-1	. #x252C)	; &I-C1-252C;
    (=big5		. #xA359)	; &I-B-A359;
    (=ucs@jis		. #x03A7)	; &J90-2636;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter psi")
      (=jis-x0208	  . #x2637)	; &J90-2637;
      (=gb2312		  . #x2637)	; &I-G0-2637;
      (=ks-x1001	  . #x2557)	; &I-K0-2557;
      (=cns11643-1	  . #x252D)	; &I-C1-252D;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; ψ
      ))
    (=ucs		. #x03A8)	; Ψ
    (greek-iso8859-7	. #xD8)	; &I-GREEK-58;
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
    (=jis-x0208		. #x2637)	; &J90-2637;
    (=gb2312		. #x2637)	; &I-G0-2637;
    (=ks-x1001		. #x2557)	; &I-K0-2557;
    (=cns11643-1	. #x252D)	; &I-C1-252D;
    (=big5		. #xA35A)	; &I-B-A35A;
    (=ucs@jis		. #x03A8)	; &J90-2637;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek capital letter omega")
      (=jis-x0208	  . #x2638)	; &J90-2638;
      (=gb2312		  . #x2638)	; &I-G0-2638;
      (=ks-x1001	  . #x2558)	; &I-K0-2558;
      (=cns11643-1	  . #x252E)	; &I-C1-252E;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      ))
    (=ucs		. #x03A9)	; Ω
    (greek-iso8859-7	. #xD9)	; &I-GREEK-59;
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
    (=jis-x0208		. #x2638)	; &J90-2638;
    (=gb2312		. #x2638)	; &I-G0-2638;
    (=ks-x1001		. #x2558)	; &I-K0-2558;
    (=cns11643-1	. #x252E)	; &I-C1-252E;
    (=big5		. #xA35B)	; &I-B-A35B;
    (=ucs@jis		. #x03A9)	; &J90-2638;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter iota with dialytika")
      (=jis-x0212	  . #x2665)	; &JSP-2665;
      (=ucs@jis		  . #x03AA)	; &JSP-2665;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      ))
    (=ucs		. #x03AA)	; Ϊ
    (greek-iso8859-7	. #xDA)	; &I-GREEK-5A;
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
    (=jis-x0212		. #x2665)	; &JSP-2665;
    (=ucs@jis		. #x03AA)	; &JSP-2665;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek capital letter upsilon with dialytika")
      (=jis-x0212	  . #x266A)	; &JSP-266A;
      (=ucs@jis		  . #x03AB)	; &JSP-266A;
      ))
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      ))
    (=ucs		. #x03AB)	; Ϋ
    (greek-iso8859-7	. #xDB)	; &I-GREEK-5B;
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
    (=jis-x0212		. #x266A)	; &JSP-266A;
    (=ucs@jis		. #x03AB)	; &JSP-266A;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter alpha with tonos")
      (=jis-x0212	  . #x2671)	; &JSP-2671;
      (=ucs@jis		  . #x03AC)	; &JSP-2671;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (=ucs		. #x03AC)	; ά
    (greek-iso8859-7	. #xDC)	; &I-GREEK-5C;
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
    (=jis-x0212		. #x2671)	; &JSP-2671;
    (=ucs@jis		. #x03AC)	; &JSP-2671;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter epsilon with tonos")
      (=jis-x0212	  . #x2672)	; &JSP-2672;
      (=ucs@jis		  . #x03AD)	; &JSP-2672;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (=ucs		. #x03AD)	; έ
    (greek-iso8859-7	. #xDD)	; &I-GREEK-5D;
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
    (=jis-x0212		. #x2672)	; &JSP-2672;
    (=ucs@jis		. #x03AD)	; &JSP-2672;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter eta with tonos")
      (=jis-x0212	  . #x2673)	; &JSP-2673;
      (=ucs@jis		  . #x03AE)	; &JSP-2673;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (=ucs		. #x03AE)	; ή
    (greek-iso8859-7	. #xDE)	; &I-GREEK-5E;
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
    (=jis-x0212		. #x2673)	; &JSP-2673;
    (=ucs@jis		. #x03AE)	; &JSP-2673;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with tonos")
      (=jis-x0212	  . #x2674)	; &JSP-2674;
      (=ucs@jis		  . #x03AF)	; &JSP-2674;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (=ucs		. #x03AF)	; ί
    (greek-iso8859-7	. #xDF)	; &I-GREEK-5F;
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
    (=jis-x0212		. #x2674)	; &JSP-2674;
    (=ucs@jis		. #x03AF)	; &JSP-2674;
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika and tonos")
      (=jis-x0212	  . #x267B)	; &JSP-267B;
      (=ucs@jis		  . #x03B0)	; &JSP-267B;
      ))
    (=ucs		. #x03B0)	; ΰ
    (greek-iso8859-7	. #xE0)	; &I-GREEK-60;
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
    (=jis-x0212		. #x267B)	; &JSP-267B;
    (=ucs@jis		. #x03B0)	; &JSP-267B;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter alpha")
      (=jis-x0208	  . #x2641)	; &J90-2641;
      (=gb2312		  . #x2641)	; &I-G0-2641;
      (=ks-x1001	  . #x2561)	; &I-K0-2561;
      (=cns11643-1	  . #x252F)	; &I-C1-252F;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      ))
    (=ucs		. #x03B1)	; α
    (greek-iso8859-7	. #xE1)	; &I-GREEK-61;
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
    (=jis-x0208		. #x2641)	; &J90-2641;
    (=gb2312		. #x2641)	; &I-G0-2641;
    (=ks-x1001		. #x2561)	; &I-K0-2561;
    (=cns11643-1	. #x252F)	; &I-C1-252F;
    (=big5		. #xA35C)	; &I-B-A35C;
    (=ucs@jis		. #x03B1)	; &J90-2641;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter beta")
      (=jis-x0208	  . #x2642)	; &J90-2642;
      (=gb2312		  . #x2642)	; &I-G0-2642;
      (=ks-x1001	  . #x2562)	; &I-K0-2562;
      (=cns11643-1	  . #x2530)	; &I-C1-2530;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (=ucs		. #x03B2)	; β
    (greek-iso8859-7	. #xE2)	; &I-GREEK-62;
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
    (=jis-x0208		. #x2642)	; &J90-2642;
    (=gb2312		. #x2642)	; &I-G0-2642;
    (=ks-x1001		. #x2562)	; &I-K0-2562;
    (=cns11643-1	. #x2530)	; &I-C1-2530;
    (=big5		. #xA35D)	; &I-B-A35D;
    (=ucs@jis		. #x03B2)	; &J90-2642;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter gamma")
      (=jis-x0208	  . #x2643)	; &J90-2643;
      (=gb2312		  . #x2643)	; &I-G0-2643;
      (=ks-x1001	  . #x2563)	; &I-K0-2563;
      (=cns11643-1	  . #x2531)	; &I-C1-2531;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Γ
      ))
    (=ucs		. #x03B3)	; γ
    (greek-iso8859-7	. #xE3)	; &I-GREEK-63;
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
    (=jis-x0208		. #x2643)	; &J90-2643;
    (=gb2312		. #x2643)	; &I-G0-2643;
    (=ks-x1001		. #x2563)	; &I-K0-2563;
    (=cns11643-1	. #x2531)	; &I-C1-2531;
    (=big5		. #xA35E)	; &I-B-A35E;
    (=ucs@jis		. #x03B3)	; &J90-2643;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter delta")
      (=jis-x0208	  . #x2644)	; &J90-2644;
      (=gb2312		  . #x2644)	; &I-G0-2644;
      (=ks-x1001	  . #x2564)	; &I-K0-2564;
      (=cns11643-1	  . #x2532)	; &I-C1-2532;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Δ
      ))
    (=ucs		. #x03B4)	; δ
    (greek-iso8859-7	. #xE4)	; &I-GREEK-64;
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
    (=jis-x0208		. #x2644)	; &J90-2644;
    (=gb2312		. #x2644)	; &I-G0-2644;
    (=ks-x1001		. #x2564)	; &I-K0-2564;
    (=cns11643-1	. #x2532)	; &I-C1-2532;
    (=big5		. #xA35F)	; &I-B-A35F;
    (=ucs@jis		. #x03B4)	; &J90-2644;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter epsilon")
      (=jis-x0208	  . #x2645)	; &J90-2645;
      (=gb2312		  . #x2645)	; &I-G0-2645;
      (=ks-x1001	  . #x2565)	; &I-K0-2565;
      (=cns11643-1	  . #x2533)	; &I-C1-2533;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      ))
    (=ucs		. #x03B5)	; ε
    (greek-iso8859-7	. #xE5)	; &I-GREEK-65;
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
    (=jis-x0208		. #x2645)	; &J90-2645;
    (=gb2312		. #x2645)	; &I-G0-2645;
    (=ks-x1001		. #x2565)	; &I-K0-2565;
    (=cns11643-1	. #x2533)	; &I-C1-2533;
    (=big5		. #xA360)	; &I-B-A360;
    (=ucs@jis		. #x03B5)	; &J90-2645;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter zeta")
      (=jis-x0208	  . #x2646)	; &J90-2646;
      (=gb2312		  . #x2646)	; &I-G0-2646;
      (=ks-x1001	  . #x2566)	; &I-K0-2566;
      (=cns11643-1	  . #x2534)	; &I-C1-2534;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Ζ
      ))
    (=ucs		. #x03B6)	; ζ
    (greek-iso8859-7	. #xE6)	; &I-GREEK-66;
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
    (=jis-x0208		. #x2646)	; &J90-2646;
    (=gb2312		. #x2646)	; &I-G0-2646;
    (=ks-x1001		. #x2566)	; &I-K0-2566;
    (=cns11643-1	. #x2534)	; &I-C1-2534;
    (=big5		. #xA361)	; &I-B-A361;
    (=ucs@jis		. #x03B6)	; &J90-2646;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter eta")
      (=jis-x0208	  . #x2647)	; &J90-2647;
      (=gb2312		  . #x2647)	; &I-G0-2647;
      (=ks-x1001	  . #x2567)	; &I-K0-2567;
      (=cns11643-1	  . #x2535)	; &I-C1-2535;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      ))
    (=ucs		. #x03B7)	; η
    (greek-iso8859-7	. #xE7)	; &I-GREEK-67;
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
    (=jis-x0208		. #x2647)	; &J90-2647;
    (=gb2312		. #x2647)	; &I-G0-2647;
    (=ks-x1001		. #x2567)	; &I-K0-2567;
    (=cns11643-1	. #x2535)	; &I-C1-2535;
    (=big5		. #xA362)	; &I-B-A362;
    (=ucs@jis		. #x03B7)	; &J90-2647;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter theta")
      (=jis-x0208	  . #x2648)	; &J90-2648;
      (=gb2312		  . #x2648)	; &I-G0-2648;
      (=ks-x1001	  . #x2568)	; &I-K0-2568;
      (=cns11643-1	  . #x2536)	; &I-C1-2536;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (=ucs		. #x03B8)	; θ
    (greek-iso8859-7	. #xE8)	; &I-GREEK-68;
    (ipa		. #xC8)	; &I-MULE-IPA-48;
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
    (=jis-x0208		. #x2648)	; &J90-2648;
    (=gb2312		. #x2648)	; &I-G0-2648;
    (=ks-x1001		. #x2568)	; &I-K0-2568;
    (=cns11643-1	. #x2536)	; &I-C1-2536;
    (=big5		. #xA363)	; &I-B-A363;
    (=ucs@jis		. #x03B8)	; &J90-2648;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter iota")
      (=jis-x0208	  . #x2649)	; &J90-2649;
      (=gb2312		  . #x2649)	; &I-G0-2649;
      (=ks-x1001	  . #x2569)	; &I-K0-2569;
      (=cns11643-1	  . #x2537)	; &I-C1-2537;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (=ucs		. #x03B9)	; ι
    (greek-iso8859-7	. #xE9)	; &I-GREEK-69;
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
    (=jis-x0208		. #x2649)	; &J90-2649;
    (=gb2312		. #x2649)	; &I-G0-2649;
    (=ks-x1001		. #x2569)	; &I-K0-2569;
    (=cns11643-1	. #x2537)	; &I-C1-2537;
    (=big5		. #xA364)	; &I-B-A364;
    (=ucs@jis		. #x03B9)	; &J90-2649;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter kappa")
      (=jis-x0208	  . #x264A)	; &J90-264A;
      (=gb2312		  . #x264A)	; &I-G0-264A;
      (=ks-x1001	  . #x256A)	; &I-K0-256A;
      (=cns11643-1	  . #x2538)	; &I-C1-2538;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (=ucs		. #x03BA)	; κ
    (greek-iso8859-7	. #xEA)	; &I-GREEK-6A;
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
    (=jis-x0208		. #x264A)	; &J90-264A;
    (=gb2312		. #x264A)	; &I-G0-264A;
    (=ks-x1001		. #x256A)	; &I-K0-256A;
    (=cns11643-1	. #x2538)	; &I-C1-2538;
    (=big5		. #xA365)	; &I-B-A365;
    (=ucs@jis		. #x03BA)	; &J90-264A;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter lamda")
      (=jis-x0208	  . #x264B)	; &J90-264B;
      (=gb2312		  . #x264B)	; &I-G0-264B;
      (=ks-x1001	  . #x256B)	; &I-K0-256B;
      (=cns11643-1	  . #x2539)	; &I-C1-2539;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Λ
      ))
    (=ucs		. #x03BB)	; λ
    (greek-iso8859-7	. #xEB)	; &I-GREEK-6B;
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
    (=jis-x0208		. #x264B)	; &J90-264B;
    (=gb2312		. #x264B)	; &I-G0-264B;
    (=ks-x1001		. #x256B)	; &I-K0-256B;
    (=cns11643-1	. #x2539)	; &I-C1-2539;
    (=big5		. #xA366)	; &I-B-A366;
    (=ucs@jis		. #x03BB)	; &J90-264B;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter mu")
      (=jis-x0208	  . #x264C)	; &J90-264C;
      (=gb2312		  . #x264C)	; &I-G0-264C;
      (=ks-x1001	  . #x256C)	; &I-K0-256C;
      (=cns11643-1	  . #x253A)	; &I-C1-253A;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Μ
      ))
    (=ucs		. #x03BC)	; μ
    (greek-iso8859-7	. #xEC)	; &I-GREEK-6C;
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
    (=jis-x0208		. #x264C)	; &J90-264C;
    (=gb2312		. #x264C)	; &I-G0-264C;
    (=ks-x1001		. #x256C)	; &I-K0-256C;
    (=cns11643-1	. #x253A)	; &I-C1-253A;
    (=big5		. #xA367)	; &I-B-A367;
    (=ucs@jis		. #x03BC)	; &J90-264C;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter nu")
      (=jis-x0208	  . #x264D)	; &J90-264D;
      (=gb2312		  . #x264D)	; &I-G0-264D;
      (=ks-x1001	  . #x256D)	; &I-K0-256D;
      (=cns11643-1	  . #x253B)	; &I-C1-253B;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Ν
      ))
    (=ucs		. #x03BD)	; ν
    (greek-iso8859-7	. #xED)	; &I-GREEK-6D;
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
    (=jis-x0208		. #x264D)	; &J90-264D;
    (=gb2312		. #x264D)	; &I-G0-264D;
    (=ks-x1001		. #x256D)	; &I-K0-256D;
    (=cns11643-1	. #x253B)	; &I-C1-253B;
    (=big5		. #xA368)	; &I-B-A368;
    (=ucs@jis		. #x03BD)	; &J90-264D;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter xi")
      (=jis-x0208	  . #x264E)	; &J90-264E;
      (=gb2312		  . #x264E)	; &I-G0-264E;
      (=ks-x1001	  . #x256E)	; &I-K0-256E;
      (=cns11643-1	  . #x253C)	; &I-C1-253C;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Ξ
      ))
    (=ucs		. #x03BE)	; ξ
    (greek-iso8859-7	. #xEE)	; &I-GREEK-6E;
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
    (=jis-x0208		. #x264E)	; &J90-264E;
    (=gb2312		. #x264E)	; &I-G0-264E;
    (=ks-x1001		. #x256E)	; &I-K0-256E;
    (=cns11643-1	. #x253C)	; &I-C1-253C;
    (=big5		. #xA369)	; &I-B-A369;
    (=ucs@jis		. #x03BE)	; &J90-264E;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omicron")
      (=jis-x0208	  . #x264F)	; &J90-264F;
      (=gb2312		  . #x264F)	; &I-G0-264F;
      (=ks-x1001	  . #x256F)	; &I-K0-256F;
      (=cns11643-1	  . #x253D)	; &I-C1-253D;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      ))
    (=ucs		. #x03BF)	; ο
    (greek-iso8859-7	. #xEF)	; &I-GREEK-6F;
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
    (=jis-x0208		. #x264F)	; &J90-264F;
    (=gb2312		. #x264F)	; &I-G0-264F;
    (=ks-x1001		. #x256F)	; &I-K0-256F;
    (=cns11643-1	. #x253D)	; &I-C1-253D;
    (=big5		. #xA36A)	; &I-B-A36A;
    (=ucs@jis		. #x03BF)	; &J90-264F;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter pi")
      (=jis-x0208	  . #x2650)	; &J90-2650;
      (=gb2312		  . #x2650)	; &I-G0-2650;
      (=ks-x1001	  . #x2570)	; &I-K0-2570;
      (=cns11643-1	  . #x253E)	; &I-C1-253E;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (=ucs		. #x03C0)	; π
    (greek-iso8859-7	. #xF0)	; &I-GREEK-70;
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
    (=jis-x0208		. #x2650)	; &J90-2650;
    (=gb2312		. #x2650)	; &I-G0-2650;
    (=ks-x1001		. #x2570)	; &I-K0-2570;
    (=cns11643-1	. #x253E)	; &I-C1-253E;
    (=big5		. #xA36B)	; &I-B-A36B;
    (=ucs@jis		. #x03C0)	; &J90-2650;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter rho")
      (=jis-x0208	  . #x2651)	; &J90-2651;
      (=gb2312		  . #x2651)	; &I-G0-2651;
      (=ks-x1001	  . #x2571)	; &I-K0-2571;
      (=cns11643-1	  . #x253F)	; &I-C1-253F;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (=ucs		. #x03C1)	; ρ
    (greek-iso8859-7	. #xF1)	; &I-GREEK-71;
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
    (=jis-x0208		. #x2651)	; &J90-2651;
    (=gb2312		. #x2651)	; &I-G0-2651;
    (=ks-x1001		. #x2571)	; &I-K0-2571;
    (=cns11643-1	. #x253F)	; &I-C1-253F;
    (=big5		. #xA36C)	; &I-B-A36C;
    (=ucs@jis		. #x03C1)	; &J90-2651;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter final sigma")
      (=jis-x0212	  . #x2678)	; &JX1-2659;
      (=jis-x0213-1-2000  . #x2659)	; &I-JX1-2659;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03C2)	; ς
    (greek-iso8859-7	. #xF2)	; &I-GREEK-72;
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
    (=jis-x0212		. #x2678)	; &JX1-2659;
    (=jis-x0213-1-2000	. #x2659)	; &I-JX1-2659;
    (=ucs@jis		. #x03C2)	; &JX1-2659;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter sigma")
      (=jis-x0208	  . #x2652)	; &J90-2652;
      (=gb2312		  . #x2652)	; &I-G0-2652;
      (=ks-x1001	  . #x2572)	; &I-K0-2572;
      (=cns11643-1	  . #x2540)	; &I-C1-2540;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03C3)	; σ
    (greek-iso8859-7	. #xF3)	; &I-GREEK-73;
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
    (=jis-x0208		. #x2652)	; &J90-2652;
    (=gb2312		. #x2652)	; &I-G0-2652;
    (=ks-x1001		. #x2572)	; &I-K0-2572;
    (=cns11643-1	. #x2540)	; &I-C1-2540;
    (=big5		. #xA36D)	; &I-B-A36D;
    (=ucs@jis		. #x03C3)	; &J90-2652;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter tau")
      (=jis-x0208	  . #x2653)	; &J90-2653;
      (=gb2312		  . #x2653)	; &I-G0-2653;
      (=ks-x1001	  . #x2573)	; &I-K0-2573;
      (=cns11643-1	  . #x2541)	; &I-C1-2541;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Τ
      ))
    (=ucs		. #x03C4)	; τ
    (greek-iso8859-7	. #xF4)	; &I-GREEK-74;
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
    (=jis-x0208		. #x2653)	; &J90-2653;
    (=gb2312		. #x2653)	; &I-G0-2653;
    (=ks-x1001		. #x2573)	; &I-K0-2573;
    (=cns11643-1	. #x2541)	; &I-C1-2541;
    (=big5		. #xA36E)	; &I-B-A36E;
    (=ucs@jis		. #x03C4)	; &J90-2653;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter upsilon")
      (=jis-x0208	  . #x2654)	; &J90-2654;
      (=gb2312		  . #x2654)	; &I-G0-2654;
      (=ks-x1001	  . #x2574)	; &I-K0-2574;
      (=cns11643-1	  . #x2542)	; &I-C1-2542;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      ))
    (=ucs		. #x03C5)	; υ
    (greek-iso8859-7	. #xF5)	; &I-GREEK-75;
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
    (=jis-x0208		. #x2654)	; &J90-2654;
    (=gb2312		. #x2654)	; &I-G0-2654;
    (=ks-x1001		. #x2574)	; &I-K0-2574;
    (=cns11643-1	. #x2542)	; &I-C1-2542;
    (=big5		. #xA36F)	; &I-B-A36F;
    (=ucs@jis		. #x03C5)	; &J90-2654;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter phi")
      (=jis-x0208	  . #x2655)	; &J90-2655;
      (=gb2312		  . #x2655)	; &I-G0-2655;
      (=ks-x1001	  . #x2575)	; &I-K0-2575;
      (=cns11643-1	  . #x2543)	; &I-C1-2543;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (=ucs		. #x03C6)	; φ
    (greek-iso8859-7	. #xF6)	; &I-GREEK-76;
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
    (=jis-x0208		. #x2655)	; &J90-2655;
    (=gb2312		. #x2655)	; &I-G0-2655;
    (=ks-x1001		. #x2575)	; &I-K0-2575;
    (=cns11643-1	. #x2543)	; &I-C1-2543;
    (=big5		. #xA370)	; &I-B-A370;
    (=ucs@jis		. #x03C6)	; &J90-2655;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter chi")
      (=jis-x0208	  . #x2656)	; &J90-2656;
      (=gb2312		  . #x2656)	; &I-G0-2656;
      (=ks-x1001	  . #x2576)	; &I-K0-2576;
      (=cns11643-1	  . #x2544)	; &I-C1-2544;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Χ
      ))
    (=ucs		. #x03C7)	; χ
    (greek-iso8859-7	. #xF7)	; &I-GREEK-77;
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
    (=jis-x0208		. #x2656)	; &J90-2656;
    (=gb2312		. #x2656)	; &I-G0-2656;
    (=ks-x1001		. #x2576)	; &I-K0-2576;
    (=cns11643-1	. #x2544)	; &I-C1-2544;
    (=big5		. #xA371)	; &I-B-A371;
    (=ucs@jis		. #x03C7)	; &J90-2656;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter psi")
      (=jis-x0208	  . #x2657)	; &J90-2657;
      (=gb2312		  . #x2657)	; &I-G0-2657;
      (=ks-x1001	  . #x2577)	; &I-K0-2577;
      (=cns11643-1	  . #x2545)	; &I-C1-2545;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Ψ
      ))
    (=ucs		. #x03C8)	; ψ
    (greek-iso8859-7	. #xF8)	; &I-GREEK-78;
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
    (=jis-x0208		. #x2657)	; &J90-2657;
    (=gb2312		. #x2657)	; &I-G0-2657;
    (=ks-x1001		. #x2577)	; &I-K0-2577;
    (=cns11643-1	. #x2545)	; &I-C1-2545;
    (=big5		. #xA372)	; &I-B-A372;
    (=ucs@jis		. #x03C8)	; &J90-2657;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "fullwidth greek small letter omega")
      (=jis-x0208	  . #x2658)	; &J90-2658;
      (=gb2312		  . #x2658)	; &I-G0-2658;
      (=ks-x1001	  . #x2578)	; &I-K0-2578;
      (=cns11643-1	  . #x2546)	; &I-C1-2546;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (=ucs		. #x03C9)	; ω
    (greek-iso8859-7	. #xF9)	; &I-GREEK-79;
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
    (=jis-x0208		. #x2658)	; &J90-2658;
    (=gb2312		. #x2658)	; &I-G0-2658;
    (=ks-x1001		. #x2578)	; &I-K0-2578;
    (=cns11643-1	. #x2546)	; &I-C1-2546;
    (=big5		. #xA373)	; &I-B-A373;
    (=ucs@jis		. #x03C9)	; &J90-2658;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter iota with dialytika")
      (=jis-x0212	  . #x2675)	; &JSP-2675;
      (=ucs@jis		  . #x03CA)	; &JSP-2675;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Ϊ
      ))
    (=ucs		. #x03CA)	; ϊ
    (greek-iso8859-7	. #xFA)	; &I-GREEK-7A;
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
    (=jis-x0212		. #x2675)	; &JSP-2675;
    (=ucs@jis		. #x03CA)	; &JSP-2675;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with dialytika")
      (=jis-x0212	  . #x267A)	; &JSP-267A;
      (=ucs@jis		  . #x03CB)	; &JSP-267A;
      ))
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Ϋ
      ))
    (=ucs		. #x03CB)	; ϋ
    (greek-iso8859-7	. #xFB)	; &I-GREEK-7B;
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
    (=jis-x0212		. #x267A)	; &JSP-267A;
    (=ucs@jis		. #x03CB)	; &JSP-267A;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omicron with tonos")
      (=jis-x0212	  . #x2677)	; &JSP-2677;
      (=ucs@jis		  . #x03CC)	; &JSP-2677;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (=ucs		. #x03CC)	; ό
    (greek-iso8859-7	. #xFC)	; &I-GREEK-7C;
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
    (=jis-x0212		. #x2677)	; &JSP-2677;
    (=ucs@jis		. #x03CC)	; &JSP-2677;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter upsilon with tonos")
      (=jis-x0212	  . #x2679)	; &JSP-2679;
      (=ucs@jis		  . #x03CD)	; &JSP-2679;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (=ucs		. #x03CD)	; ύ
    (greek-iso8859-7	. #xFD)	; &I-GREEK-7D;
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
    (=jis-x0212		. #x2679)	; &JSP-2679;
    (=ucs@jis		. #x03CD)	; &JSP-2679;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->fullwidth
     ((name . "fullwidth greek small letter omega with tonos")
      (=jis-x0212	  . #x267C)	; &JSP-267C;
      (=ucs@jis		  . #x03CE)	; &JSP-267C;
      ))
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (=ucs		. #x03CE)	; ώ
    (greek-iso8859-7	. #xFE)	; &I-GREEK-7E;
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
    (=jis-x0212		. #x267C)	; &JSP-267C;
    (=ucs@jis		. #x03CE)	; &JSP-267C;
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
