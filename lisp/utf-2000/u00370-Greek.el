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
    (=ucs		. #x0384)	; ΄
    (greek-iso8859-7	. #xB4)	; &I-GREEK-34;
    ))
(define-char
  '((<-denotational
     ((name		  . "GREEK TONOS")
      (=ucs		  . #x0384)	; ΄
      ))
    (<-fullwidth
     ((name		  . "GREEK TONOS")
      (=ucs		  . #x0384)	; ΄
      ))
    (=jis-x0212		. #x2238)	; &JSP-2238; [02-24]
    (=ucs@jis/fw	. #x0384)	; &JSP-2238;
    ))
(define-char
  '((name		. "GREEK DIALYTIKA TONOS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->decomposition	#x00A8 #x0301)
    (=ucs		. #x0385)	; ΅
    (greek-iso8859-7	. #xB5)	; &I-GREEK-35;
    ))
(define-char
  '((<-denotational
     ((name		  . "GREEK DIALYTIKA TONOS")
      (=ucs		  . #x0385)	; ΅
      ))
    (<-fullwidth
     ((name		  . "GREEK DIALYTIKA TONOS")
      (=ucs		  . #x0385)	; ΅
      ))
    (=jis-x0212		. #x2239)	; &JSP-2239; [02-25]
    (=ucs@jis/fw	. #x0385)	; &JSP-2239;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0391 #x0301)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (=ucs		. #x0386)	; Ά
    (greek-iso8859-7	. #xB6)	; &I-GREEK-36;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2671)	; &JSP-2671; [06-81]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (=jis-x0212		. #x2661)	; &JSP-2661; [06-65]
    (=ucs@jis/fw	. #x0386)	; &JSP-2661;
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
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (=ucs		. #x0388)	; Έ
    (greek-iso8859-7	. #xB8)	; &I-GREEK-38;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2672)	; &JSP-2672; [06-82]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (=jis-x0212		. #x2662)	; &JSP-2662; [06-66]
    (=ucs@jis/fw	. #x0388)	; &JSP-2662;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0397 #x0301)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (=ucs		. #x0389)	; Ή
    (greek-iso8859-7	. #xB9)	; &I-GREEK-39;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2673)	; &JSP-2673; [06-83]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (=jis-x0212		. #x2663)	; &JSP-2663; [06-67]
    (=ucs@jis/fw	. #x0389)	; &JSP-2663;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0301)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (=ucs		. #x038A)	; Ί
    (greek-iso8859-7	. #xBA)	; &I-GREEK-3A;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2674)	; &JSP-2674; [06-84]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (=jis-x0212		. #x2664)	; &JSP-2664; [06-68]
    (=ucs@jis/fw	. #x038A)	; &JSP-2664;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x039F #x0301)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (=ucs		. #x038C)	; Ό
    (greek-iso8859-7	. #xBC)	; &I-GREEK-3C;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2677)	; &JSP-2677; [06-87]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (=jis-x0212		. #x2667)	; &JSP-2667; [06-71]
    (=ucs@jis/fw	. #x038C)	; &JSP-2667;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0301)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (=ucs		. #x038E)	; Ύ
    (greek-iso8859-7	. #xBE)	; &I-GREEK-3E;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2679)	; &JSP-2679; [06-89]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (=jis-x0212		. #x2669)	; &JSP-2669; [06-73]
    (=ucs@jis/fw	. #x038E)	; &JSP-2669;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA WITH TONOS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A9 #x0301)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (=ucs		. #x038F)	; Ώ
    (greek-iso8859-7	. #xBF)	; &I-GREEK-3F;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x267C)	; &JSP-267C; [06-92]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (=jis-x0212		. #x266C)	; &JSP-266C; [06-76]
    (=ucs@jis/fw	. #x038F)	; &JSP-266C;
    ))
(define-char
  '((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CA #x0301)
    (=ucs		. #x0390)	; ΐ
    (greek-iso8859-7	. #xC0)	; &I-GREEK-40;
    ))
(define-char
  '((<-denotational
     ((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x0390)	; ΐ
      ))
    (<-fullwidth
     ((name . "GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x0390)	; ΐ
      ))
    (=jis-x0212		. #x2676)	; &JSP-2676; [06-86]
    (=ucs@jis/fw	. #x0390)	; &JSP-2676;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ALPHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      ))
    (=ucs		. #x0391)	; Α
    (greek-iso8859-7	. #xC1)	; &I-GREEK-41;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2641)	; &J90-2641; [06-33]
      (=gb2312		  . #x2641)	; &I-G0-2641; [06-33]
      (=ks-x1001	  . #x2561)	; &I-K0-2561; [05-65]
      (=cns11643-1	  . #x252F)	; &I-C1-252F; [05-15]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      ))
    (=jis-x0208		. #x2621)	; &J90-2621; [06-01]
    (=gb2312		. #x2621)	; &I-G0-2621; [06-01]
    (=ks-x1001		. #x2541)	; &I-K0-2541; [05-33]
    (=cns11643-1	. #x2475)	; &I-C1-2475; [04-85]
    (=big5		. #xA344)	; &I-B-A344;
    (=ucs@gb/fw		. #x0391)	; &J90-2621;
    (=ucs@jis/fw	. #x0391)	; &J90-2621;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER BETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; β
      ))
    (=ucs		. #x0392)	; Β
    (greek-iso8859-7	. #xC2)	; &I-GREEK-42;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2642)	; &J90-2642; [06-34]
      (=gb2312		  . #x2642)	; &I-G0-2642; [06-34]
      (=ks-x1001	  . #x2562)	; &I-K0-2562; [05-66]
      (=cns11643-1	  . #x2530)	; &I-C1-2530; [05-16]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (=jis-x0208		. #x2622)	; &J90-2622; [06-02]
    (=gb2312		. #x2622)	; &I-G0-2622; [06-02]
    (=ks-x1001		. #x2542)	; &I-K0-2542; [05-34]
    (=cns11643-1	. #x2476)	; &I-C1-2476; [04-86]
    (=big5		. #xA345)	; &I-B-A345;
    (=ucs@gb/fw		. #x0392)	; &J90-2622;
    (=ucs@jis/fw	. #x0392)	; &J90-2622;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER GAMMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; γ
      ))
    (=ucs		. #x0393)	; Γ
    (greek-iso8859-7	. #xC3)	; &I-GREEK-43;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2643)	; &J90-2643; [06-35]
      (=gb2312		  . #x2643)	; &I-G0-2643; [06-35]
      (=ks-x1001	  . #x2563)	; &I-K0-2563; [05-67]
      (=cns11643-1	  . #x2531)	; &I-C1-2531; [05-17]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Γ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Γ
      ))
    (=jis-x0208		. #x2623)	; &J90-2623; [06-03]
    (=gb2312		. #x2623)	; &I-G0-2623; [06-03]
    (=ks-x1001		. #x2543)	; &I-K0-2543; [05-35]
    (=cns11643-1	. #x2477)	; &I-C1-2477; [04-87]
    (=big5		. #xA346)	; &I-B-A346;
    (=ucs@gb/fw		. #x0393)	; &J90-2623;
    (=ucs@jis/fw	. #x0393)	; &J90-2623;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER DELTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; δ
      ))
    (=ucs		. #x0394)	; Δ
    (greek-iso8859-7	. #xC4)	; &I-GREEK-44;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2644)	; &J90-2644; [06-36]
      (=gb2312		  . #x2644)	; &I-G0-2644; [06-36]
      (=ks-x1001	  . #x2564)	; &I-K0-2564; [05-68]
      (=cns11643-1	  . #x2532)	; &I-C1-2532; [05-18]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Δ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Δ
      ))
    (=jis-x0208		. #x2624)	; &J90-2624; [06-04]
    (=gb2312		. #x2624)	; &I-G0-2624; [06-04]
    (=ks-x1001		. #x2544)	; &I-K0-2544; [05-36]
    (=cns11643-1	. #x2478)	; &I-C1-2478; [04-88]
    (=big5		. #xA347)	; &I-B-A347;
    (=ucs@gb/fw		. #x0394)	; &J90-2624;
    (=ucs@jis/fw	. #x0394)	; &J90-2624;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER EPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      ))
    (=ucs		. #x0395)	; Ε
    (greek-iso8859-7	. #xC5)	; &I-GREEK-45;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2645)	; &J90-2645; [06-37]
      (=gb2312		  . #x2645)	; &I-G0-2645; [06-37]
      (=ks-x1001	  . #x2565)	; &I-K0-2565; [05-69]
      (=cns11643-1	  . #x2533)	; &I-C1-2533; [05-19]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      ))
    (=jis-x0208		. #x2625)	; &J90-2625; [06-05]
    (=gb2312		. #x2625)	; &I-G0-2625; [06-05]
    (=ks-x1001		. #x2545)	; &I-K0-2545; [05-37]
    (=cns11643-1	. #x2479)	; &I-C1-2479; [04-89]
    (=big5		. #xA348)	; &I-B-A348;
    (=ucs@gb/fw		. #x0395)	; &J90-2625;
    (=ucs@jis/fw	. #x0395)	; &J90-2625;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ZETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; ζ
      ))
    (=ucs		. #x0396)	; Ζ
    (greek-iso8859-7	. #xC6)	; &I-GREEK-46;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2646)	; &J90-2646; [06-38]
      (=gb2312		  . #x2646)	; &I-G0-2646; [06-38]
      (=ks-x1001	  . #x2566)	; &I-K0-2566; [05-70]
      (=cns11643-1	  . #x2534)	; &I-C1-2534; [05-20]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Ζ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Ζ
      ))
    (=jis-x0208		. #x2626)	; &J90-2626; [06-06]
    (=gb2312		. #x2626)	; &I-G0-2626; [06-06]
    (=ks-x1001		. #x2546)	; &I-K0-2546; [05-38]
    (=cns11643-1	. #x247A)	; &I-C1-247A; [04-90]
    (=big5		. #xA349)	; &I-B-A349;
    (=ucs@gb/fw		. #x0396)	; &J90-2626;
    (=ucs@jis/fw	. #x0396)	; &J90-2626;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER ETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      ))
    (=ucs		. #x0397)	; Η
    (greek-iso8859-7	. #xC7)	; &I-GREEK-47;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2647)	; &J90-2647; [06-39]
      (=gb2312		  . #x2647)	; &I-G0-2647; [06-39]
      (=ks-x1001	  . #x2567)	; &I-K0-2567; [05-71]
      (=cns11643-1	  . #x2535)	; &I-C1-2535; [05-21]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      ))
    (=jis-x0208		. #x2627)	; &J90-2627; [06-07]
    (=gb2312		. #x2627)	; &I-G0-2627; [06-07]
    (=ks-x1001		. #x2547)	; &I-K0-2547; [05-39]
    (=cns11643-1	. #x247B)	; &I-C1-247B; [04-91]
    (=big5		. #xA34A)	; &I-B-A34A;
    (=ucs@gb/fw		. #x0397)	; &J90-2627;
    (=ucs@jis/fw	. #x0397)	; &J90-2627;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER THETA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; θ
      ))
    (=ucs		. #x0398)	; Θ
    (greek-iso8859-7	. #xC8)	; &I-GREEK-48;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2648)	; &J90-2648; [06-40]
      (=gb2312		  . #x2648)	; &I-G0-2648; [06-40]
      (=ks-x1001	  . #x2568)	; &I-K0-2568; [05-72]
      (=cns11643-1	  . #x2536)	; &I-C1-2536; [05-22]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (=jis-x0208		. #x2628)	; &J90-2628; [06-08]
    (=gb2312		. #x2628)	; &I-G0-2628; [06-08]
    (=ks-x1001		. #x2548)	; &I-K0-2548; [05-40]
    (=cns11643-1	. #x247C)	; &I-C1-247C; [04-92]
    (=big5		. #xA34B)	; &I-B-A34B;
    (=ucs@gb/fw		. #x0398)	; &J90-2628;
    (=ucs@jis/fw	. #x0398)	; &J90-2628;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (=ucs		. #x0399)	; Ι
    (greek-iso8859-7	. #xC9)	; &I-GREEK-49;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2649)	; &J90-2649; [06-41]
      (=gb2312		  . #x2649)	; &I-G0-2649; [06-41]
      (=ks-x1001	  . #x2569)	; &I-K0-2569; [05-73]
      (=cns11643-1	  . #x2537)	; &I-C1-2537; [05-23]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (=jis-x0208		. #x2629)	; &J90-2629; [06-09]
    (=gb2312		. #x2629)	; &I-G0-2629; [06-09]
    (=ks-x1001		. #x2549)	; &I-K0-2549; [05-41]
    (=cns11643-1	. #x247D)	; &I-C1-247D; [04-93]
    (=big5		. #xA34C)	; &I-B-A34C;
    (=ucs@gb/fw		. #x0399)	; &J90-2629;
    (=ucs@jis/fw	. #x0399)	; &J90-2629;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER KAPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; κ
      ))
    (=ucs		. #x039A)	; Κ
    (greek-iso8859-7	. #xCA)	; &I-GREEK-4A;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x264A)	; &J90-264A; [06-42]
      (=gb2312		  . #x264A)	; &I-G0-264A; [06-42]
      (=ks-x1001	  . #x256A)	; &I-K0-256A; [05-74]
      (=cns11643-1	  . #x2538)	; &I-C1-2538; [05-24]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (=jis-x0208		. #x262A)	; &J90-262A; [06-10]
    (=gb2312		. #x262A)	; &I-G0-262A; [06-10]
    (=ks-x1001		. #x254A)	; &I-K0-254A; [05-42]
    (=cns11643-1	. #x247E)	; &I-C1-247E; [04-94]
    (=big5		. #xA34D)	; &I-B-A34D;
    (=ucs@gb/fw		. #x039A)	; &J90-262A;
    (=ucs@jis/fw	. #x039A)	; &J90-262A;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER LAMDA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; λ
      ))
    (=ucs		. #x039B)	; Λ
    (greek-iso8859-7	. #xCB)	; &I-GREEK-4B;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x264B)	; &J90-264B; [06-43]
      (=gb2312		  . #x264B)	; &I-G0-264B; [06-43]
      (=ks-x1001	  . #x256B)	; &I-K0-256B; [05-75]
      (=cns11643-1	  . #x2539)	; &I-C1-2539; [05-25]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Λ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Λ
      ))
    (=jis-x0208		. #x262B)	; &J90-262B; [06-11]
    (=gb2312		. #x262B)	; &I-G0-262B; [06-11]
    (=ks-x1001		. #x254B)	; &I-K0-254B; [05-43]
    (=cns11643-1	. #x2521)	; &I-C1-2521; [05-01]
    (=big5		. #xA34E)	; &I-B-A34E;
    (=ucs@gb/fw		. #x039B)	; &J90-262B;
    (=ucs@jis/fw	. #x039B)	; &J90-262B;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER MU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    (=ucs		. #x039C)	; Μ
    (greek-iso8859-7	. #xCC)	; &I-GREEK-4C;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x264C)	; &J90-264C; [06-44]
      (=gb2312		  . #x264C)	; &I-G0-264C; [06-44]
      (=ks-x1001	  . #x256C)	; &I-K0-256C; [05-76]
      (=cns11643-1	  . #x253A)	; &I-C1-253A; [05-26]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Μ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Μ
      ))
    (=jis-x0208		. #x262C)	; &J90-262C; [06-12]
    (=gb2312		. #x262C)	; &I-G0-262C; [06-12]
    (=ks-x1001		. #x254C)	; &I-K0-254C; [05-44]
    (=cns11643-1	. #x2522)	; &I-C1-2522; [05-02]
    (=big5		. #xA34F)	; &I-B-A34F;
    (=ucs@gb/fw		. #x039C)	; &J90-262C;
    (=ucs@jis/fw	. #x039C)	; &J90-262C;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER NU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; ν
      ))
    (=ucs		. #x039D)	; Ν
    (greek-iso8859-7	. #xCD)	; &I-GREEK-4D;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x264D)	; &J90-264D; [06-45]
      (=gb2312		  . #x264D)	; &I-G0-264D; [06-45]
      (=ks-x1001	  . #x256D)	; &I-K0-256D; [05-77]
      (=cns11643-1	  . #x253B)	; &I-C1-253B; [05-27]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Ν
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Ν
      ))
    (=jis-x0208		. #x262D)	; &J90-262D; [06-13]
    (=gb2312		. #x262D)	; &I-G0-262D; [06-13]
    (=ks-x1001		. #x254D)	; &I-K0-254D; [05-45]
    (=cns11643-1	. #x2523)	; &I-C1-2523; [05-03]
    (=big5		. #xA350)	; &I-B-A350;
    (=ucs@gb/fw		. #x039D)	; &J90-262D;
    (=ucs@jis/fw	. #x039D)	; &J90-262D;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER XI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; ξ
      ))
    (=ucs		. #x039E)	; Ξ
    (greek-iso8859-7	. #xCE)	; &I-GREEK-4E;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x264E)	; &J90-264E; [06-46]
      (=gb2312		  . #x264E)	; &I-G0-264E; [06-46]
      (=ks-x1001	  . #x256E)	; &I-K0-256E; [05-78]
      (=cns11643-1	  . #x253C)	; &I-C1-253C; [05-28]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Ξ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Ξ
      ))
    (=jis-x0208		. #x262E)	; &J90-262E; [06-14]
    (=gb2312		. #x262E)	; &I-G0-262E; [06-14]
    (=ks-x1001		. #x254E)	; &I-K0-254E; [05-46]
    (=cns11643-1	. #x2524)	; &I-C1-2524; [05-04]
    (=big5		. #xA351)	; &I-B-A351;
    (=ucs@gb/fw		. #x039E)	; &J90-262E;
    (=ucs@jis/fw	. #x039E)	; &J90-262E;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMICRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      ))
    (=ucs		. #x039F)	; Ο
    (greek-iso8859-7	. #xCF)	; &I-GREEK-4F;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x264F)	; &J90-264F; [06-47]
      (=gb2312		  . #x264F)	; &I-G0-264F; [06-47]
      (=ks-x1001	  . #x256F)	; &I-K0-256F; [05-79]
      (=cns11643-1	  . #x253D)	; &I-C1-253D; [05-29]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      ))
    (=jis-x0208		. #x262F)	; &J90-262F; [06-15]
    (=gb2312		. #x262F)	; &I-G0-262F; [06-15]
    (=ks-x1001		. #x254F)	; &I-K0-254F; [05-47]
    (=cns11643-1	. #x2525)	; &I-C1-2525; [05-05]
    (=big5		. #xA352)	; &I-B-A352;
    (=ucs@gb/fw		. #x039F)	; &J90-262F;
    (=ucs@jis/fw	. #x039F)	; &J90-262F;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; π
      ))
    (=ucs		. #x03A0)	; Π
    (greek-iso8859-7	. #xD0)	; &I-GREEK-50;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2650)	; &J90-2650; [06-48]
      (=gb2312		  . #x2650)	; &I-G0-2650; [06-48]
      (=ks-x1001	  . #x2570)	; &I-K0-2570; [05-80]
      (=cns11643-1	  . #x253E)	; &I-C1-253E; [05-30]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (=jis-x0208		. #x2630)	; &J90-2630; [06-16]
    (=gb2312		. #x2630)	; &I-G0-2630; [06-16]
    (=ks-x1001		. #x2550)	; &I-K0-2550; [05-48]
    (=cns11643-1	. #x2526)	; &I-C1-2526; [05-06]
    (=big5		. #xA353)	; &I-B-A353;
    (=ucs@gb/fw		. #x03A0)	; &J90-2630;
    (=ucs@jis/fw	. #x03A0)	; &J90-2630;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER RHO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      ))
    (=ucs		. #x03A1)	; Ρ
    (greek-iso8859-7	. #xD1)	; &I-GREEK-51;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2651)	; &J90-2651; [06-49]
      (=gb2312		  . #x2651)	; &I-G0-2651; [06-49]
      (=ks-x1001	  . #x2571)	; &I-K0-2571; [05-81]
      (=cns11643-1	  . #x253F)	; &I-C1-253F; [05-31]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (=jis-x0208		. #x2631)	; &J90-2631; [06-17]
    (=gb2312		. #x2631)	; &I-G0-2631; [06-17]
    (=ks-x1001		. #x2551)	; &I-K0-2551; [05-49]
    (=cns11643-1	. #x2527)	; &I-C1-2527; [05-07]
    (=big5		. #xA354)	; &I-B-A354;
    (=ucs@gb/fw		. #x03A1)	; &J90-2631;
    (=ucs@jis/fw	. #x03A1)	; &J90-2631;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER SIGMA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; σ
      ))
    (=ucs		. #x03A3)	; Σ
    (greek-iso8859-7	. #xD3)	; &I-GREEK-53;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2652)	; &J90-2652; [06-50]
      (=gb2312		  . #x2652)	; &I-G0-2652; [06-50]
      (=ks-x1001	  . #x2572)	; &I-K0-2572; [05-82]
      (=cns11643-1	  . #x2540)	; &I-C1-2540; [05-32]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=jis-x0208		. #x2632)	; &J90-2632; [06-18]
    (=gb2312		. #x2632)	; &I-G0-2632; [06-18]
    (=ks-x1001		. #x2552)	; &I-K0-2552; [05-50]
    (=cns11643-1	. #x2528)	; &I-C1-2528; [05-08]
    (=big5		. #xA355)	; &I-B-A355;
    (=ucs@gb/fw		. #x03A3)	; &J90-2632;
    (=ucs@jis/fw	. #x03A3)	; &J90-2632;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER TAU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; τ
      ))
    (=ucs		. #x03A4)	; Τ
    (greek-iso8859-7	. #xD4)	; &I-GREEK-54;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2653)	; &J90-2653; [06-51]
      (=gb2312		  . #x2653)	; &I-G0-2653; [06-51]
      (=ks-x1001	  . #x2573)	; &I-K0-2573; [05-83]
      (=cns11643-1	  . #x2541)	; &I-C1-2541; [05-33]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Τ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Τ
      ))
    (=jis-x0208		. #x2633)	; &J90-2633; [06-19]
    (=gb2312		. #x2633)	; &I-G0-2633; [06-19]
    (=ks-x1001		. #x2553)	; &I-K0-2553; [05-51]
    (=cns11643-1	. #x2529)	; &I-C1-2529; [05-09]
    (=big5		. #xA356)	; &I-B-A356;
    (=ucs@gb/fw		. #x03A4)	; &J90-2633;
    (=ucs@jis/fw	. #x03A4)	; &J90-2633;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      ))
    (=ucs		. #x03A5)	; Υ
    (greek-iso8859-7	. #xD5)	; &I-GREEK-55;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2654)	; &J90-2654; [06-52]
      (=gb2312		  . #x2654)	; &I-G0-2654; [06-52]
      (=ks-x1001	  . #x2574)	; &I-K0-2574; [05-84]
      (=cns11643-1	  . #x2542)	; &I-C1-2542; [05-34]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      ))
    (=jis-x0208		. #x2634)	; &J90-2634; [06-20]
    (=gb2312		. #x2634)	; &I-G0-2634; [06-20]
    (=ks-x1001		. #x2554)	; &I-K0-2554; [05-52]
    (=cns11643-1	. #x252A)	; &I-C1-252A; [05-10]
    (=big5		. #xA357)	; &I-B-A357;
    (=ucs@gb/fw		. #x03A5)	; &J90-2634;
    (=ucs@jis/fw	. #x03A5)	; &J90-2634;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; φ
      ))
    (=ucs		. #x03A6)	; Φ
    (greek-iso8859-7	. #xD6)	; &I-GREEK-56;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2655)	; &J90-2655; [06-53]
      (=gb2312		  . #x2655)	; &I-G0-2655; [06-53]
      (=ks-x1001	  . #x2575)	; &I-K0-2575; [05-85]
      (=cns11643-1	  . #x2543)	; &I-C1-2543; [05-35]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (=jis-x0208		. #x2635)	; &J90-2635; [06-21]
    (=gb2312		. #x2635)	; &I-G0-2635; [06-21]
    (=ks-x1001		. #x2555)	; &I-K0-2555; [05-53]
    (=cns11643-1	. #x252B)	; &I-C1-252B; [05-11]
    (=big5		. #xA358)	; &I-B-A358;
    (=ucs@gb/fw		. #x03A6)	; &J90-2635;
    (=ucs@jis/fw	. #x03A6)	; &J90-2635;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER CHI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; χ
      ))
    (=ucs		. #x03A7)	; Χ
    (greek-iso8859-7	. #xD7)	; &I-GREEK-57;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2656)	; &J90-2656; [06-54]
      (=gb2312		  . #x2656)	; &I-G0-2656; [06-54]
      (=ks-x1001	  . #x2576)	; &I-K0-2576; [05-86]
      (=cns11643-1	  . #x2544)	; &I-C1-2544; [05-36]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Χ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Χ
      ))
    (=jis-x0208		. #x2636)	; &J90-2636; [06-22]
    (=gb2312		. #x2636)	; &I-G0-2636; [06-22]
    (=ks-x1001		. #x2556)	; &I-K0-2556; [05-54]
    (=cns11643-1	. #x252C)	; &I-C1-252C; [05-12]
    (=big5		. #xA359)	; &I-B-A359;
    (=ucs@gb/fw		. #x03A7)	; &J90-2636;
    (=ucs@jis/fw	. #x03A7)	; &J90-2636;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; ψ
      ))
    (=ucs		. #x03A8)	; Ψ
    (greek-iso8859-7	. #xD8)	; &I-GREEK-58;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2657)	; &J90-2657; [06-55]
      (=gb2312		  . #x2657)	; &I-G0-2657; [06-55]
      (=ks-x1001	  . #x2577)	; &I-K0-2577; [05-87]
      (=cns11643-1	  . #x2545)	; &I-C1-2545; [05-37]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Ψ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Ψ
      ))
    (=jis-x0208		. #x2637)	; &J90-2637; [06-23]
    (=gb2312		. #x2637)	; &I-G0-2637; [06-23]
    (=ks-x1001		. #x2557)	; &I-K0-2557; [05-55]
    (=cns11643-1	. #x252D)	; &I-C1-252D; [05-13]
    (=big5		. #xA35A)	; &I-B-A35A;
    (=ucs@gb/fw		. #x03A8)	; &J90-2637;
    (=ucs@jis/fw	. #x03A8)	; &J90-2637;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      ))
    (=ucs		. #x03A9)	; Ω
    (greek-iso8859-7	. #xD9)	; &I-GREEK-59;
    ))
(define-char
  '((->lowercase
     ((=jis-x0208	  . #x2658)	; &J90-2658; [06-56]
      (=gb2312		  . #x2658)	; &I-G0-2658; [06-56]
      (=ks-x1001	  . #x2578)	; &I-K0-2578; [05-88]
      (=cns11643-1	  . #x2546)	; &I-C1-2546; [05-38]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (=jis-x0208		. #x2638)	; &J90-2638; [06-24]
    (=gb2312		. #x2638)	; &I-G0-2638; [06-24]
    (=ks-x1001		. #x2558)	; &I-K0-2558; [05-56]
    (=cns11643-1	. #x252E)	; &I-C1-252E; [05-14]
    (=big5		. #xA35B)	; &I-B-A35B;
    (=ucs@gb/fw		. #x03A9)	; &J90-2638;
    (=ucs@jis/fw	. #x03A9)	; &J90-2638;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x0399 #x0308)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      ))
    (=ucs		. #x03AA)	; Ϊ
    (greek-iso8859-7	. #xDA)	; &I-GREEK-5A;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x2675)	; &JSP-2675; [06-85]
      ))
    (<-denotational
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Ϊ
      ))
    (<-fullwidth
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Ϊ
      ))
    (=jis-x0212		. #x2665)	; &JSP-2665; [06-69]
    (=ucs@jis/fw	. #x03AA)	; &JSP-2665;
    ))
(define-char
  '((name		. "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03A5 #x0308)
    (->lowercase
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      ))
    (=ucs		. #x03AB)	; Ϋ
    (greek-iso8859-7	. #xDB)	; &I-GREEK-5B;
    ))
(define-char
  '((->lowercase
     ((=jis-x0212	  . #x267A)	; &JSP-267A; [06-90]
      ))
    (<-denotational
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Ϋ
      ))
    (<-fullwidth
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Ϋ
      ))
    (=jis-x0212		. #x266A)	; &JSP-266A; [06-74]
    (=ucs@jis/fw	. #x03AB)	; &JSP-266A;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B1 #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x0386)	; Ά
      ))
    (=ucs		. #x03AC)	; ά
    (greek-iso8859-7	. #xDC)	; &I-GREEK-5C;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2661)	; &JSP-2661; [06-65]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ALPHA WITH TONOS")
      (=ucs		  . #x03AC)	; ά
      ))
    (=jis-x0212		. #x2671)	; &JSP-2671; [06-81]
    (=ucs@jis/fw	. #x03AC)	; &JSP-2671;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B5 #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x0388)	; Έ
      ))
    (=ucs		. #x03AD)	; έ
    (greek-iso8859-7	. #xDD)	; &I-GREEK-5D;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2662)	; &JSP-2662; [06-66]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER EPSILON WITH TONOS")
      (=ucs		  . #x03AD)	; έ
      ))
    (=jis-x0212		. #x2672)	; &JSP-2672; [06-82]
    (=ucs@jis/fw	. #x03AD)	; &JSP-2672;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B7 #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA WITH TONOS")
      (=ucs		  . #x0389)	; Ή
      ))
    (=ucs		. #x03AE)	; ή
    (greek-iso8859-7	. #xDE)	; &I-GREEK-5E;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2663)	; &JSP-2663; [06-67]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ETA WITH TONOS")
      (=ucs		  . #x03AE)	; ή
      ))
    (=jis-x0212		. #x2673)	; &JSP-2673; [06-83]
    (=ucs@jis/fw	. #x03AE)	; &JSP-2673;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH TONOS")
      (=ucs		  . #x038A)	; Ί
      ))
    (=ucs		. #x03AF)	; ί
    (greek-iso8859-7	. #xDF)	; &I-GREEK-5F;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2664)	; &JSP-2664; [06-68]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA WITH TONOS")
      (=ucs		  . #x03AF)	; ί
      ))
    (=jis-x0212		. #x2674)	; &JSP-2674; [06-84]
    (=ucs@jis/fw	. #x03AF)	; &JSP-2674;
    ))
(define-char
  '((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03CB #x0301)
    (=ucs		. #x03B0)	; ΰ
    (greek-iso8859-7	. #xE0)	; &I-GREEK-60;
    ))
(define-char
  '((<-denotational
     ((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x03B0)	; ΰ
      ))
    (<-fullwidth
     ((name . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS")
      (=ucs		  . #x03B0)	; ΰ
      ))
    (=jis-x0212		. #x267B)	; &JSP-267B; [06-91]
    (=ucs@jis/fw	. #x03B0)	; &JSP-267B;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ALPHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ALPHA")
      (=ucs		  . #x0391)	; Α
      ))
    (=ucs		. #x03B1)	; α
    (greek-iso8859-7	. #xE1)	; &I-GREEK-61;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2621)	; &J90-2621; [06-01]
      (=gb2312		  . #x2621)	; &I-G0-2621; [06-01]
      (=ks-x1001	  . #x2541)	; &I-K0-2541; [05-33]
      (=cns11643-1	  . #x2475)	; &I-C1-2475; [04-85]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ALPHA")
      (=ucs		  . #x03B1)	; α
      ))
    (=jis-x0208		. #x2641)	; &J90-2641; [06-33]
    (=gb2312		. #x2641)	; &I-G0-2641; [06-33]
    (=ks-x1001		. #x2561)	; &I-K0-2561; [05-65]
    (=cns11643-1	. #x252F)	; &I-C1-252F; [05-15]
    (=big5		. #xA35C)	; &I-B-A35C;
    (=ucs@gb/fw		. #x03B1)	; &J90-2641;
    (=ucs@jis/fw	. #x03B1)	; &J90-2641;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER BETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER BETA")
      (=ucs		  . #x0392)	; Β
      ))
    (=ucs		. #x03B2)	; β
    (greek-iso8859-7	. #xE2)	; &I-GREEK-62;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2622)	; &J90-2622; [06-02]
      (=gb2312		  . #x2622)	; &I-G0-2622; [06-02]
      (=ks-x1001	  . #x2542)	; &I-K0-2542; [05-34]
      (=cns11643-1	  . #x2476)	; &I-C1-2476; [04-86]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; β
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER BETA")
      (=ucs		  . #x03B2)	; β
      ))
    (=jis-x0208		. #x2642)	; &J90-2642; [06-34]
    (=gb2312		. #x2642)	; &I-G0-2642; [06-34]
    (=ks-x1001		. #x2562)	; &I-K0-2562; [05-66]
    (=cns11643-1	. #x2530)	; &I-C1-2530; [05-16]
    (=big5		. #xA35D)	; &I-B-A35D;
    (=ucs@gb/fw		. #x03B2)	; &J90-2642;
    (=ucs@jis/fw	. #x03B2)	; &J90-2642;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER GAMMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER GAMMA")
      (=ucs		  . #x0393)	; Γ
      ))
    (=ucs		. #x03B3)	; γ
    (greek-iso8859-7	. #xE3)	; &I-GREEK-63;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2623)	; &J90-2623; [06-03]
      (=gb2312		  . #x2623)	; &I-G0-2623; [06-03]
      (=ks-x1001	  . #x2543)	; &I-K0-2543; [05-35]
      (=cns11643-1	  . #x2477)	; &I-C1-2477; [04-87]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; γ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER GAMMA")
      (=ucs		  . #x03B3)	; γ
      ))
    (=jis-x0208		. #x2643)	; &J90-2643; [06-35]
    (=gb2312		. #x2643)	; &I-G0-2643; [06-35]
    (=ks-x1001		. #x2563)	; &I-K0-2563; [05-67]
    (=cns11643-1	. #x2531)	; &I-C1-2531; [05-17]
    (=big5		. #xA35E)	; &I-B-A35E;
    (=ucs@gb/fw		. #x03B3)	; &J90-2643;
    (=ucs@jis/fw	. #x03B3)	; &J90-2643;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER DELTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER DELTA")
      (=ucs		  . #x0394)	; Δ
      ))
    (=ucs		. #x03B4)	; δ
    (greek-iso8859-7	. #xE4)	; &I-GREEK-64;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2624)	; &J90-2624; [06-04]
      (=gb2312		  . #x2624)	; &I-G0-2624; [06-04]
      (=ks-x1001	  . #x2544)	; &I-K0-2544; [05-36]
      (=cns11643-1	  . #x2478)	; &I-C1-2478; [04-88]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; δ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER DELTA")
      (=ucs		  . #x03B4)	; δ
      ))
    (=jis-x0208		. #x2644)	; &J90-2644; [06-36]
    (=gb2312		. #x2644)	; &I-G0-2644; [06-36]
    (=ks-x1001		. #x2564)	; &I-K0-2564; [05-68]
    (=cns11643-1	. #x2532)	; &I-C1-2532; [05-18]
    (=big5		. #xA35F)	; &I-B-A35F;
    (=ucs@gb/fw		. #x03B4)	; &J90-2644;
    (=ucs@jis/fw	. #x03B4)	; &J90-2644;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER EPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER EPSILON")
      (=ucs		  . #x0395)	; Ε
      ))
    (=ucs		. #x03B5)	; ε
    (greek-iso8859-7	. #xE5)	; &I-GREEK-65;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2625)	; &J90-2625; [06-05]
      (=gb2312		  . #x2625)	; &I-G0-2625; [06-05]
      (=ks-x1001	  . #x2545)	; &I-K0-2545; [05-37]
      (=cns11643-1	  . #x2479)	; &I-C1-2479; [04-89]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER EPSILON")
      (=ucs		  . #x03B5)	; ε
      ))
    (=jis-x0208		. #x2645)	; &J90-2645; [06-37]
    (=gb2312		. #x2645)	; &I-G0-2645; [06-37]
    (=ks-x1001		. #x2565)	; &I-K0-2565; [05-69]
    (=cns11643-1	. #x2533)	; &I-C1-2533; [05-19]
    (=big5		. #xA360)	; &I-B-A360;
    (=ucs@gb/fw		. #x03B5)	; &J90-2645;
    (=ucs@jis/fw	. #x03B5)	; &J90-2645;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ZETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ZETA")
      (=ucs		  . #x0396)	; Ζ
      ))
    (=ucs		. #x03B6)	; ζ
    (greek-iso8859-7	. #xE6)	; &I-GREEK-66;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2626)	; &J90-2626; [06-06]
      (=gb2312		  . #x2626)	; &I-G0-2626; [06-06]
      (=ks-x1001	  . #x2546)	; &I-K0-2546; [05-38]
      (=cns11643-1	  . #x247A)	; &I-C1-247A; [04-90]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; ζ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ZETA")
      (=ucs		  . #x03B6)	; ζ
      ))
    (=jis-x0208		. #x2646)	; &J90-2646; [06-38]
    (=gb2312		. #x2646)	; &I-G0-2646; [06-38]
    (=ks-x1001		. #x2566)	; &I-K0-2566; [05-70]
    (=cns11643-1	. #x2534)	; &I-C1-2534; [05-20]
    (=big5		. #xA361)	; &I-B-A361;
    (=ucs@gb/fw		. #x03B6)	; &J90-2646;
    (=ucs@jis/fw	. #x03B6)	; &J90-2646;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER ETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER ETA")
      (=ucs		  . #x0397)	; Η
      ))
    (=ucs		. #x03B7)	; η
    (greek-iso8859-7	. #xE7)	; &I-GREEK-67;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2627)	; &J90-2627; [06-07]
      (=gb2312		  . #x2627)	; &I-G0-2627; [06-07]
      (=ks-x1001	  . #x2547)	; &I-K0-2547; [05-39]
      (=cns11643-1	  . #x247B)	; &I-C1-247B; [04-91]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER ETA")
      (=ucs		  . #x03B7)	; η
      ))
    (=jis-x0208		. #x2647)	; &J90-2647; [06-39]
    (=gb2312		. #x2647)	; &I-G0-2647; [06-39]
    (=ks-x1001		. #x2567)	; &I-K0-2567; [05-71]
    (=cns11643-1	. #x2535)	; &I-C1-2535; [05-21]
    (=big5		. #xA362)	; &I-B-A362;
    (=ucs@gb/fw		. #x03B7)	; &J90-2647;
    (=ucs@jis/fw	. #x03B7)	; &J90-2647;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER THETA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER THETA")
      (=ucs		  . #x0398)	; Θ
      ))
    (=ucs		. #x03B8)	; θ
    (greek-iso8859-7	. #xE8)	; &I-GREEK-68;
    (ipa		. #xC8)	; &I-MULE-IPA-48;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2628)	; &J90-2628; [06-08]
      (=gb2312		  . #x2628)	; &I-G0-2628; [06-08]
      (=ks-x1001	  . #x2548)	; &I-K0-2548; [05-40]
      (=cns11643-1	  . #x247C)	; &I-C1-247C; [04-92]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; θ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER THETA")
      (=ucs		  . #x03B8)	; θ
      ))
    (=jis-x0208		. #x2648)	; &J90-2648; [06-40]
    (=gb2312		. #x2648)	; &I-G0-2648; [06-40]
    (=ks-x1001		. #x2568)	; &I-K0-2568; [05-72]
    (=cns11643-1	. #x2536)	; &I-C1-2536; [05-22]
    (=big5		. #xA363)	; &I-B-A363;
    (=ucs@gb/fw		. #x03B8)	; &J90-2648;
    (=ucs@jis/fw	. #x03B8)	; &J90-2648;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA")
      (=ucs		  . #x0399)	; Ι
      ))
    (=ucs		. #x03B9)	; ι
    (greek-iso8859-7	. #xE9)	; &I-GREEK-69;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2629)	; &J90-2629; [06-09]
      (=gb2312		  . #x2629)	; &I-G0-2629; [06-09]
      (=ks-x1001	  . #x2549)	; &I-K0-2549; [05-41]
      (=cns11643-1	  . #x247D)	; &I-C1-247D; [04-93]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA")
      (=ucs		  . #x03B9)	; ι
      ))
    (=jis-x0208		. #x2649)	; &J90-2649; [06-41]
    (=gb2312		. #x2649)	; &I-G0-2649; [06-41]
    (=ks-x1001		. #x2569)	; &I-K0-2569; [05-73]
    (=cns11643-1	. #x2537)	; &I-C1-2537; [05-23]
    (=big5		. #xA364)	; &I-B-A364;
    (=ucs@gb/fw		. #x03B9)	; &J90-2649;
    (=ucs@jis/fw	. #x03B9)	; &J90-2649;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER KAPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER KAPPA")
      (=ucs		  . #x039A)	; Κ
      ))
    (=ucs		. #x03BA)	; κ
    (greek-iso8859-7	. #xEA)	; &I-GREEK-6A;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x262A)	; &J90-262A; [06-10]
      (=gb2312		  . #x262A)	; &I-G0-262A; [06-10]
      (=ks-x1001	  . #x254A)	; &I-K0-254A; [05-42]
      (=cns11643-1	  . #x247E)	; &I-C1-247E; [04-94]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; κ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER KAPPA")
      (=ucs		  . #x03BA)	; κ
      ))
    (=jis-x0208		. #x264A)	; &J90-264A; [06-42]
    (=gb2312		. #x264A)	; &I-G0-264A; [06-42]
    (=ks-x1001		. #x256A)	; &I-K0-256A; [05-74]
    (=cns11643-1	. #x2538)	; &I-C1-2538; [05-24]
    (=big5		. #xA365)	; &I-B-A365;
    (=ucs@gb/fw		. #x03BA)	; &J90-264A;
    (=ucs@jis/fw	. #x03BA)	; &J90-264A;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER LAMDA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER LAMDA")
      (=ucs		  . #x039B)	; Λ
      ))
    (=ucs		. #x03BB)	; λ
    (greek-iso8859-7	. #xEB)	; &I-GREEK-6B;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x262B)	; &J90-262B; [06-11]
      (=gb2312		  . #x262B)	; &I-G0-262B; [06-11]
      (=ks-x1001	  . #x254B)	; &I-K0-254B; [05-43]
      (=cns11643-1	  . #x2521)	; &I-C1-2521; [05-01]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; λ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER LAMDA")
      (=ucs		  . #x03BB)	; λ
      ))
    (=jis-x0208		. #x264B)	; &J90-264B; [06-43]
    (=gb2312		. #x264B)	; &I-G0-264B; [06-43]
    (=ks-x1001		. #x256B)	; &I-K0-256B; [05-75]
    (=cns11643-1	. #x2539)	; &I-C1-2539; [05-25]
    (=big5		. #xA366)	; &I-B-A366;
    (=ucs@gb/fw		. #x03BB)	; &J90-264B;
    (=ucs@jis/fw	. #x03BB)	; &J90-264B;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER MU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER MU")
      (=ucs		  . #x039C)	; Μ
      ))
    (=ucs		. #x03BC)	; μ
    (greek-iso8859-7	. #xEC)	; &I-GREEK-6C;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x262C)	; &J90-262C; [06-12]
      (=gb2312		  . #x262C)	; &I-G0-262C; [06-12]
      (=ks-x1001	  . #x254C)	; &I-K0-254C; [05-44]
      (=cns11643-1	  . #x2522)	; &I-C1-2522; [05-02]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    (=jis-x0208		. #x264C)	; &J90-264C; [06-44]
    (=gb2312		. #x264C)	; &I-G0-264C; [06-44]
    (=ks-x1001		. #x256C)	; &I-K0-256C; [05-76]
    (=cns11643-1	. #x253A)	; &I-C1-253A; [05-26]
    (=big5		. #xA367)	; &I-B-A367;
    (=ucs@gb/fw		. #x03BC)	; &J90-264C;
    (=ucs@jis/fw	. #x03BC)	; &J90-264C;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER NU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER NU")
      (=ucs		  . #x039D)	; Ν
      ))
    (=ucs		. #x03BD)	; ν
    (greek-iso8859-7	. #xED)	; &I-GREEK-6D;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x262D)	; &J90-262D; [06-13]
      (=gb2312		  . #x262D)	; &I-G0-262D; [06-13]
      (=ks-x1001	  . #x254D)	; &I-K0-254D; [05-45]
      (=cns11643-1	  . #x2523)	; &I-C1-2523; [05-03]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; ν
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER NU")
      (=ucs		  . #x03BD)	; ν
      ))
    (=jis-x0208		. #x264D)	; &J90-264D; [06-45]
    (=gb2312		. #x264D)	; &I-G0-264D; [06-45]
    (=ks-x1001		. #x256D)	; &I-K0-256D; [05-77]
    (=cns11643-1	. #x253B)	; &I-C1-253B; [05-27]
    (=big5		. #xA368)	; &I-B-A368;
    (=ucs@gb/fw		. #x03BD)	; &J90-264D;
    (=ucs@jis/fw	. #x03BD)	; &J90-264D;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER XI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER XI")
      (=ucs		  . #x039E)	; Ξ
      ))
    (=ucs		. #x03BE)	; ξ
    (greek-iso8859-7	. #xEE)	; &I-GREEK-6E;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x262E)	; &J90-262E; [06-14]
      (=gb2312		  . #x262E)	; &I-G0-262E; [06-14]
      (=ks-x1001	  . #x254E)	; &I-K0-254E; [05-46]
      (=cns11643-1	  . #x2524)	; &I-C1-2524; [05-04]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; ξ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER XI")
      (=ucs		  . #x03BE)	; ξ
      ))
    (=jis-x0208		. #x264E)	; &J90-264E; [06-46]
    (=gb2312		. #x264E)	; &I-G0-264E; [06-46]
    (=ks-x1001		. #x256E)	; &I-K0-256E; [05-78]
    (=cns11643-1	. #x253C)	; &I-C1-253C; [05-28]
    (=big5		. #xA369)	; &I-B-A369;
    (=ucs@gb/fw		. #x03BE)	; &J90-264E;
    (=ucs@jis/fw	. #x03BE)	; &J90-264E;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON")
      (=ucs		  . #x039F)	; Ο
      ))
    (=ucs		. #x03BF)	; ο
    (greek-iso8859-7	. #xEF)	; &I-GREEK-6F;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x262F)	; &J90-262F; [06-15]
      (=gb2312		  . #x262F)	; &I-G0-262F; [06-15]
      (=ks-x1001	  . #x254F)	; &I-K0-254F; [05-47]
      (=cns11643-1	  . #x2525)	; &I-C1-2525; [05-05]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMICRON")
      (=ucs		  . #x03BF)	; ο
      ))
    (=jis-x0208		. #x264F)	; &J90-264F; [06-47]
    (=gb2312		. #x264F)	; &I-G0-264F; [06-47]
    (=ks-x1001		. #x256F)	; &I-K0-256F; [05-79]
    (=cns11643-1	. #x253D)	; &I-C1-253D; [05-29]
    (=big5		. #xA36A)	; &I-B-A36A;
    (=ucs@gb/fw		. #x03BF)	; &J90-264F;
    (=ucs@jis/fw	. #x03BF)	; &J90-264F;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PI")
      (=ucs		  . #x03A0)	; Π
      ))
    (=ucs		. #x03C0)	; π
    (greek-iso8859-7	. #xF0)	; &I-GREEK-70;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2630)	; &J90-2630; [06-16]
      (=gb2312		  . #x2630)	; &I-G0-2630; [06-16]
      (=ks-x1001	  . #x2550)	; &I-K0-2550; [05-48]
      (=cns11643-1	  . #x2526)	; &I-C1-2526; [05-06]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; π
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PI")
      (=ucs		  . #x03C0)	; π
      ))
    (=jis-x0208		. #x2650)	; &J90-2650; [06-48]
    (=gb2312		. #x2650)	; &I-G0-2650; [06-48]
    (=ks-x1001		. #x2570)	; &I-K0-2570; [05-80]
    (=cns11643-1	. #x253E)	; &I-C1-253E; [05-30]
    (=big5		. #xA36B)	; &I-B-A36B;
    (=ucs@gb/fw		. #x03C0)	; &J90-2650;
    (=ucs@jis/fw	. #x03C0)	; &J90-2650;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER RHO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER RHO")
      (=ucs		  . #x03A1)	; Ρ
      ))
    (=ucs		. #x03C1)	; ρ
    (greek-iso8859-7	. #xF1)	; &I-GREEK-71;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2631)	; &J90-2631; [06-17]
      (=gb2312		  . #x2631)	; &I-G0-2631; [06-17]
      (=ks-x1001	  . #x2551)	; &I-K0-2551; [05-49]
      (=cns11643-1	  . #x2527)	; &I-C1-2527; [05-07]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER RHO")
      (=ucs		  . #x03C1)	; ρ
      ))
    (=jis-x0208		. #x2651)	; &J90-2651; [06-49]
    (=gb2312		. #x2651)	; &I-G0-2651; [06-49]
    (=ks-x1001		. #x2571)	; &I-K0-2571; [05-81]
    (=cns11643-1	. #x253F)	; &I-C1-253F; [05-31]
    (=big5		. #xA36C)	; &I-B-A36C;
    (=ucs@gb/fw		. #x03C1)	; &J90-2651;
    (=ucs@jis/fw	. #x03C1)	; &J90-2651;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER FINAL SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03C2)	; ς
    (greek-iso8859-7	. #xF2)	; &I-GREEK-72;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2632)	; &J90-2632; [06-18]
      (=gb2312		  . #x2632)	; &I-G0-2632; [06-18]
      (=ks-x1001	  . #x2552)	; &I-K0-2552; [05-50]
      (=cns11643-1	  . #x2528)	; &I-C1-2528; [05-08]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER FINAL SIGMA")
      (=ucs		  . #x03C2)	; ς
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER FINAL SIGMA")
      (=ucs		  . #x03C2)	; ς
      ))
    (=jis-x0212		. #x2678)	; &JX1-2659; [06-88]
    (=jis-x0213-1-2000	. #x2659)	; &I-JX1-2659; [06-57]
    (=ucs@jis/fw	. #x03C2)	; &JX1-2659;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER SIGMA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER SIGMA")
      (=ucs		  . #x03A3)	; Σ
      ))
    (=ucs		. #x03C3)	; σ
    (greek-iso8859-7	. #xF3)	; &I-GREEK-73;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2632)	; &J90-2632; [06-18]
      (=gb2312		  . #x2632)	; &I-G0-2632; [06-18]
      (=ks-x1001	  . #x2552)	; &I-K0-2552; [05-50]
      (=cns11643-1	  . #x2528)	; &I-C1-2528; [05-08]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; σ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER SIGMA")
      (=ucs		  . #x03C3)	; σ
      ))
    (=jis-x0208		. #x2652)	; &J90-2652; [06-50]
    (=gb2312		. #x2652)	; &I-G0-2652; [06-50]
    (=ks-x1001		. #x2572)	; &I-K0-2572; [05-82]
    (=cns11643-1	. #x2540)	; &I-C1-2540; [05-32]
    (=big5		. #xA36D)	; &I-B-A36D;
    (=ucs@gb/fw		. #x03C3)	; &J90-2652;
    (=ucs@jis/fw	. #x03C3)	; &J90-2652;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER TAU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER TAU")
      (=ucs		  . #x03A4)	; Τ
      ))
    (=ucs		. #x03C4)	; τ
    (greek-iso8859-7	. #xF4)	; &I-GREEK-74;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2633)	; &J90-2633; [06-19]
      (=gb2312		  . #x2633)	; &I-G0-2633; [06-19]
      (=ks-x1001	  . #x2553)	; &I-K0-2553; [05-51]
      (=cns11643-1	  . #x2529)	; &I-C1-2529; [05-09]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; τ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER TAU")
      (=ucs		  . #x03C4)	; τ
      ))
    (=jis-x0208		. #x2653)	; &J90-2653; [06-51]
    (=gb2312		. #x2653)	; &I-G0-2653; [06-51]
    (=ks-x1001		. #x2573)	; &I-K0-2573; [05-83]
    (=cns11643-1	. #x2541)	; &I-C1-2541; [05-33]
    (=big5		. #xA36E)	; &I-B-A36E;
    (=ucs@gb/fw		. #x03C4)	; &J90-2653;
    (=ucs@jis/fw	. #x03C4)	; &J90-2653;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON")
      (=ucs		  . #x03A5)	; Υ
      ))
    (=ucs		. #x03C5)	; υ
    (greek-iso8859-7	. #xF5)	; &I-GREEK-75;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2634)	; &J90-2634; [06-20]
      (=gb2312		  . #x2634)	; &I-G0-2634; [06-20]
      (=ks-x1001	  . #x2554)	; &I-K0-2554; [05-52]
      (=cns11643-1	  . #x252A)	; &I-C1-252A; [05-10]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON")
      (=ucs		  . #x03C5)	; υ
      ))
    (=jis-x0208		. #x2654)	; &J90-2654; [06-52]
    (=gb2312		. #x2654)	; &I-G0-2654; [06-52]
    (=ks-x1001		. #x2574)	; &I-K0-2574; [05-84]
    (=cns11643-1	. #x2542)	; &I-C1-2542; [05-34]
    (=big5		. #xA36F)	; &I-B-A36F;
    (=ucs@gb/fw		. #x03C5)	; &J90-2654;
    (=ucs@jis/fw	. #x03C5)	; &J90-2654;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PHI")
      (=ucs		  . #x03A6)	; Φ
      ))
    (=ucs		. #x03C6)	; φ
    (greek-iso8859-7	. #xF6)	; &I-GREEK-76;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2635)	; &J90-2635; [06-21]
      (=gb2312		  . #x2635)	; &I-G0-2635; [06-21]
      (=ks-x1001	  . #x2555)	; &I-K0-2555; [05-53]
      (=cns11643-1	  . #x252B)	; &I-C1-252B; [05-11]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; φ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PHI")
      (=ucs		  . #x03C6)	; φ
      ))
    (=jis-x0208		. #x2655)	; &J90-2655; [06-53]
    (=gb2312		. #x2655)	; &I-G0-2655; [06-53]
    (=ks-x1001		. #x2575)	; &I-K0-2575; [05-85]
    (=cns11643-1	. #x2543)	; &I-C1-2543; [05-35]
    (=big5		. #xA370)	; &I-B-A370;
    (=ucs@gb/fw		. #x03C6)	; &J90-2655;
    (=ucs@jis/fw	. #x03C6)	; &J90-2655;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER CHI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER CHI")
      (=ucs		  . #x03A7)	; Χ
      ))
    (=ucs		. #x03C7)	; χ
    (greek-iso8859-7	. #xF7)	; &I-GREEK-77;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2636)	; &J90-2636; [06-22]
      (=gb2312		  . #x2636)	; &I-G0-2636; [06-22]
      (=ks-x1001	  . #x2556)	; &I-K0-2556; [05-54]
      (=cns11643-1	  . #x252C)	; &I-C1-252C; [05-12]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; χ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER CHI")
      (=ucs		  . #x03C7)	; χ
      ))
    (=jis-x0208		. #x2656)	; &J90-2656; [06-54]
    (=gb2312		. #x2656)	; &I-G0-2656; [06-54]
    (=ks-x1001		. #x2576)	; &I-K0-2576; [05-86]
    (=cns11643-1	. #x2544)	; &I-C1-2544; [05-36]
    (=big5		. #xA371)	; &I-B-A371;
    (=ucs@gb/fw		. #x03C7)	; &J90-2656;
    (=ucs@jis/fw	. #x03C7)	; &J90-2656;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER PSI")
      (=ucs		  . #x03A8)	; Ψ
      ))
    (=ucs		. #x03C8)	; ψ
    (greek-iso8859-7	. #xF8)	; &I-GREEK-78;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2637)	; &J90-2637; [06-23]
      (=gb2312		  . #x2637)	; &I-G0-2637; [06-23]
      (=ks-x1001	  . #x2557)	; &I-K0-2557; [05-55]
      (=cns11643-1	  . #x252D)	; &I-C1-252D; [05-13]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; ψ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER PSI")
      (=ucs		  . #x03C8)	; ψ
      ))
    (=jis-x0208		. #x2657)	; &J90-2657; [06-55]
    (=gb2312		. #x2657)	; &I-G0-2657; [06-55]
    (=ks-x1001		. #x2577)	; &I-K0-2577; [05-87]
    (=cns11643-1	. #x2545)	; &I-C1-2545; [05-37]
    (=big5		. #xA372)	; &I-B-A372;
    (=ucs@gb/fw		. #x03C8)	; &J90-2657;
    (=ucs@jis/fw	. #x03C8)	; &J90-2657;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (=ucs		. #x03C9)	; ω
    (greek-iso8859-7	. #xF9)	; &I-GREEK-79;
    ))
(define-char
  '((->uppercase
     ((=jis-x0208	  . #x2638)	; &J90-2638; [06-24]
      (=gb2312		  . #x2638)	; &I-G0-2638; [06-24]
      (=ks-x1001	  . #x2558)	; &I-K0-2558; [05-56]
      (=cns11643-1	  . #x252E)	; &I-C1-252E; [05-14]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMEGA")
      (=ucs		  . #x03C9)	; ω
      ))
    (=jis-x0208		. #x2658)	; &J90-2658; [06-56]
    (=gb2312		. #x2658)	; &I-G0-2658; [06-56]
    (=ks-x1001		. #x2578)	; &I-K0-2578; [05-88]
    (=cns11643-1	. #x2546)	; &I-C1-2546; [05-38]
    (=big5		. #xA373)	; &I-B-A373;
    (=ucs@gb/fw		. #x03C9)	; &J90-2658;
    (=ucs@jis/fw	. #x03C9)	; &J90-2658;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03B9 #x0308)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03AA)	; Ϊ
      ))
    (=ucs		. #x03CA)	; ϊ
    (greek-iso8859-7	. #xFA)	; &I-GREEK-7A;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2665)	; &JSP-2665; [06-69]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER IOTA WITH DIALYTIKA")
      (=ucs		  . #x03CA)	; ϊ
      ))
    (=jis-x0212		. #x2675)	; &JSP-2675; [06-85]
    (=ucs@jis/fw	. #x03CA)	; &JSP-2675;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0308)
    (->uppercase
     ((name . "GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03AB)	; Ϋ
      ))
    (=ucs		. #x03CB)	; ϋ
    (greek-iso8859-7	. #xFB)	; &I-GREEK-7B;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x266A)	; &JSP-266A; [06-74]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON WITH DIALYTIKA")
      (=ucs		  . #x03CB)	; ϋ
      ))
    (=jis-x0212		. #x267A)	; &JSP-267A; [06-90]
    (=ucs@jis/fw	. #x03CB)	; &JSP-267A;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMICRON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03BF #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x038C)	; Ό
      ))
    (=ucs		. #x03CC)	; ό
    (greek-iso8859-7	. #xFC)	; &I-GREEK-7C;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2667)	; &JSP-2667; [06-71]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMICRON WITH TONOS")
      (=ucs		  . #x03CC)	; ό
      ))
    (=jis-x0212		. #x2677)	; &JSP-2677; [06-87]
    (=ucs@jis/fw	. #x03CC)	; &JSP-2677;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER UPSILON WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C5 #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x038E)	; Ύ
      ))
    (=ucs		. #x03CD)	; ύ
    (greek-iso8859-7	. #xFD)	; &I-GREEK-7D;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x2669)	; &JSP-2669; [06-73]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER UPSILON WITH TONOS")
      (=ucs		  . #x03CD)	; ύ
      ))
    (=jis-x0212		. #x2679)	; &JSP-2679; [06-89]
    (=ucs@jis/fw	. #x03CD)	; &JSP-2679;
    ))
(define-char
  '((name		. "GREEK SMALL LETTER OMEGA WITH TONOS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->decomposition	#x03C9 #x0301)
    (->uppercase
     ((name		  . "GREEK CAPITAL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x038F)	; Ώ
      ))
    (=ucs		. #x03CE)	; ώ
    (greek-iso8859-7	. #xFE)	; &I-GREEK-7E;
    ))
(define-char
  '((->uppercase
     ((=jis-x0212	  . #x266C)	; &JSP-266C; [06-76]
      ))
    (<-denotational
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (<-fullwidth
     ((name		  . "GREEK SMALL LETTER OMEGA WITH TONOS")
      (=ucs		  . #x03CE)	; ώ
      ))
    (=jis-x0212		. #x267C)	; &JSP-267C; [06-92]
    (=ucs@jis/fw	. #x03CE)	; &JSP-267C;
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
