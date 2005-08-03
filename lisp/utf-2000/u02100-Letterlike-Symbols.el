;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "ACCOUNT OF")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "SOLIDUS")
      (=ucs		  . #x002F)	; /
      )
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      ))
    (=ucs		. #x2100)	; ℀
    ))
(define-char
  '((name		. "ADDRESSED TO THE SUBJECT")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "SOLIDUS")
      (=ucs		  . #x002F)	; /
      )
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      ))
    (=ucs		. #x2101)	; ℁
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL C")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      ))
    (=ucs		. #x2102)	; ℂ
    ))
(define-char
  '((name		. "DEGREE CELSIUS")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat/unit
     ((name		  . "DEGREE SIGN")
      (=ucs		  . #x00B0)	; °
      )
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      ))
    (=ucs		. #x2103)	; ℃
    ))
(define-char
  '((<-denotational
     ((name		  . "DEGREE CELSIUS")
      (=ucs		  . #x2103)	; ℃
      ))
    (<-fullwidth
     ((name		  . "DEGREE CELSIUS")
      (=ucs		  . #x2103)	; ℃
      ))
    (=>decomposition@compat/unit
     ((name		  . "DEGREE SIGN")
      (=ucs		  . #x00B0)	; °
      )
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      ))
    (=jis-x0208		. #x216E)	; &J90-216E; [01-78]
    (=gb2312		. #x2166)	; &I-G0-2166; [01-70]
    (=ks-x1001		. #x2149)	; &I-K0-2149; [01-41]
    (=cns11643-1	. #x226A)	; &I-C1-226A; [02-74]
    (=big5		. #xA24A)	; &I-B-A24A;
    (=ucs@gb		. #x2103)	; &J90-216E;
    (=ucs@jis		. #x2103)	; &J90-216E;
    ))
(define-char
  '((name		. "CENTRE LINE SYMBOL")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2104)	; ℄
    ))
(define-char
  '((name		. "CARE OF")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "SOLIDUS")
      (=ucs		  . #x002F)	; /
      )
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      ))
    (=ucs		. #x2105)	; ℅
    ))
(define-char
  '((<-denotational
     ((name		  . "CARE OF")
      (=ucs		  . #x2105)	; ℅
      ))
    (<-fullwidth
     ((name		  . "CARE OF")
      (=ucs		  . #x2105)	; ℅
      ))
    (=cns11643-1	. #x2222)	; &C1-2222; [02-02]
    (=big5		. #xA1C1)	; &I-B-A1C1;
    (=ucs@cns		. #x2105)	; &C1-2222;
    (=ucs@big5		. #x2105)	; &C1-2222;
    ))
(define-char
  '((name		. "CADA UNA")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "SOLIDUS")
      (=ucs		  . #x002F)	; /
      )
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      ))
    (=ucs		. #x2106)	; ℆
    ))
(define-char
  '((name		. "EULER CONSTANT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-compat/math
     ((name		  . "LATIN CAPITAL LETTER OPEN E")
      (=ucs		  . #x0190)	; Ɛ
      ))
    (=ucs		. #x2107)	; ℇ
    ))
(define-char
  '((name		. "SCRUPLE")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2108)	; ℈
    ))
(define-char
  '((name		. "DEGREE FAHRENHEIT")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat/unit
     ((name		  . "DEGREE SIGN")
      (=ucs		  . #x00B0)	; °
      )
     ((name		  . "LATIN CAPITAL LETTER F")
      (=ucs		  . #x0046)	; F
      ))
    (=ucs		. #x2109)	; ℉
    ))
(define-char
  '((<-denotational
     ((name		  . "DEGREE FAHRENHEIT")
      (=ucs		  . #x2109)	; ℉
      ))
    (<-fullwidth
     ((name		  . "DEGREE FAHRENHEIT")
      (=ucs		  . #x2109)	; ℉
      ))
    (=>decomposition@compat/unit
     ((name		  . "DEGREE SIGN")
      (=ucs		  . #x00B0)	; °
      )
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER F")
      (=ucs		  . #xFF26)	; Ｆ
      ))
    (=ks-x1001		. #x2235)	; &C1-226B; [02-21]
    (=cns11643-1	. #x226B)	; &I-C1-226B; [02-75]
    (=big5		. #xA24B)	; &I-B-A24B;
    ))
(define-char
  '((name		. "SCRIPT SMALL G")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      ))
    (=ucs		. #x210A)	; ℊ
    ))
(define-char
  '((name		. "SCRIPT CAPITAL H")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER H")
      (=ucs		  . #x0048)	; H
      ))
    (=ucs		. #x210B)	; ℋ
    ))
(define-char
  '((name		. "BLACK-LETTER CAPITAL H")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER H")
      (=ucs		  . #x0048)	; H
      ))
    (=ucs		. #x210C)	; ℌ
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL H")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER H")
      (=ucs		  . #x0048)	; H
      ))
    (=ucs		. #x210D)	; ℍ
    ))
(define-char
  '((name		. "PLANCK CONSTANT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER H")
      (=ucs		  . #x0068)	; h
      ))
    (=ucs		. #x210E)	; ℎ
    ))
(define-char
  '((name		. "PLANCK CONSTANT OVER TWO PI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=ucs		. #x210F)	; ℏ
    ))
(define-char
  '((<-denotational
     ((name		  . "PLANCK CONSTANT OVER TWO PI")
      (=ucs		  . #x210F)	; ℏ
      ))
    (<-fullwidth
     ((name		  . "PLANCK CONSTANT OVER TWO PI")
      (=ucs		  . #x210F)	; ℏ
      ))
    (=jis-x0213-1-2000	. #x235D)	; &JX1-235D; [03-61]
    (=ucs@jis/fw	. #x210F)	; &JX1-235D;
    ))
(define-char
  '((name		. "SCRIPT CAPITAL I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      ))
    (=ucs		. #x2110)	; ℐ
    ))
(define-char
  '((name		. "BLACK-LETTER CAPITAL I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      ))
    (=ucs		. #x2111)	; ℑ
    ))
(define-char
  '((name		. "SCRIPT CAPITAL L")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      ))
    (=ucs		. #x2112)	; ℒ
    ))
(define-char
  '((name		. "SCRIPT SMALL L")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      ))
    (=ucs		. #x2113)	; ℓ
    ))
(define-char
  '((<-denotational
     ((name		  . "SCRIPT SMALL L")
      (=ucs		  . #x2113)	; ℓ
      ))
    (<-fullwidth
     ((name		  . "SCRIPT SMALL L")
      (=ucs		  . #x2113)	; ℓ
      ))
    (=decomposition
     font
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      ))
    (=ks-x1001		. #x2724)	; &JX1-235F; [07-04]
    (=jis-x0213-1-2000	. #x235F)	; &I-JX1-235F; [03-63]
    (=ucs@jis/fw	. #x2113)	; &JX1-235F;
    ))
(define-char
  '((name		. "L B BAR SYMBOL")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2114)	; ℔
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL N")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      ))
    (=ucs		. #x2115)	; ℕ
    ))
(define-char
  '((name		. "NUMERO SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      )
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      ))
    (=ucs		. #x2116)	; №
    (cyrillic-iso8859-5 . #xF0)	; &I-CYRILLIC-70;
    ))
(define-char
  '((<-denotational
     ((name		  . "NUMERO SIGN")
      (=ucs		  . #x2116)	; №
      ))
    (<-fullwidth
     ((name		  . "NUMERO SIGN")
      (=ucs		  . #x2116)	; №
      ))
    (=gb2312		. #x216D)	; &JX1-2D62; [01-77]
    (=ks-x1001		. #x2260)	; &I-K0-2260; [02-64]
    (=jis-x0212		. #x2271)	; &I-JSP-2271; [02-81]
    (=jis-x0213-1-2000	. #x2D62)	; &I-JX1-2D62; [13-66]
    (=big5-eten		. #xC8D2)	; &B-C8D2;
    (=ucs@unicode	. #x2116)	; &JX1-2D62;
    ))
(define-char
  '((name		. "SOUND RECORDING COPYRIGHT")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2117)	; ℗
    ))
(define-char
  '((name		. "SCRIPT CAPITAL P")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2118)	; ℘
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL P")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER P")
      (=ucs		  . #x0050)	; P
      ))
    (=ucs		. #x2119)	; ℙ
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL Q")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER Q")
      (=ucs		  . #x0051)	; Q
      ))
    (=ucs		. #x211A)	; ℚ
    ))
(define-char
  '((name		. "SCRIPT CAPITAL R")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      ))
    (=ucs		. #x211B)	; ℛ
    ))
(define-char
  '((name		. "BLACK-LETTER CAPITAL R")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      ))
    (=ucs		. #x211C)	; ℜ
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL R")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      ))
    (=ucs		. #x211D)	; ℝ
    ))
(define-char
  '((name		. "PRESCRIPTION TAKE")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x211E)	; ℞
    ))
(define-char
  '((name		. "RESPONSE")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x211F)	; ℟
    ))
(define-char
  '((name		. "SERVICE MARK")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@superscript
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      )
     ((name		  . "LATIN CAPITAL LETTER M")
      (=ucs		  . #x004D)	; M
      ))
    (=ucs		. #x2120)	; ℠
    ))
(define-char
  '((name		. "TELEPHONE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN CAPITAL LETTER T")
      (=ucs		  . #x0054)	; T
      )
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      ))
    (=ucs		. #x2121)	; ℡
    ))
(define-char
  '((<-denotational
     ((name		  . "TELEPHONE SIGN")
      (=ucs		  . #x2121)	; ℡
      ))
    (<-fullwidth
     ((name		  . "TELEPHONE SIGN")
      (=ucs		  . #x2121)	; ℡
      ))
    (=ks-x1001		. #x2265)	; &JX1-2D64; [02-69]
    (=jis-x0213-1-2000	. #x2D64)	; &I-JX1-2D64; [13-68]
    (=big5-eten		. #xC8D3)	; &B-C8D3;
    (=ucs@unicode	. #x2121)	; &JX1-2D64;
    ))
(define-char
  '((name		. "TRADE MARK SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@superscript
     ((name		  . "LATIN CAPITAL LETTER T")
      (=ucs		  . #x0054)	; T
      )
     ((name		  . "LATIN CAPITAL LETTER M")
      (=ucs		  . #x004D)	; M
      ))
    (=ucs		. #x2122)	; ™
    ))
(define-char
  '((<-denotational
     ((name		  . "TRADE MARK SIGN")
      (=ucs		  . #x2122)	; ™
      ))
    (<-fullwidth
     ((name		  . "TRADE MARK SIGN")
      (=ucs		  . #x2122)	; ™
      ))
    (=ks-x1001		. #x2262)	; &JSP-226F; [02-66]
    (=jis-x0212		. #x226F)	; &I-JSP-226F; [02-79]
    (=ucs@jis		. #x2122)	; &JSP-226F;
    ))
(define-char
  '((name		. "VERSICLE")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2123)	; ℣
    ))
(define-char
  '((name		. "DOUBLE-STRUCK CAPITAL Z")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      ))
    (=ucs		. #x2124)	; ℤ
    ))
(define-char
  '((name		. "OUNCE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2125)	; ℥
    ))
(define-char
  '((name		. "OHM SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "GREEK CAPITAL LETTER OMEGA")
      (=ucs		  . #x03A9)	; Ω
      ))
    (=ucs		. #x2126)	; Ω
    ))
(define-char
  '((<-denotational
     ((name		  . "OHM SIGN")
      (=ucs		  . #x2126)	; Ω
      ))
    (<-fullwidth
     ((name		  . "OHM SIGN")
      (=ucs		  . #x2126)	; Ω
      ))
    (=ks-x1001		. #x2759)	; &K0-2759; [07-57]
    ))
(define-char
  '((name		. "INVERTED OHM SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2127)	; ℧
    ))
(define-char
  '((<-denotational
     ((name		  . "INVERTED OHM SIGN")
      (=ucs		  . #x2127)	; ℧
      ))
    (<-fullwidth
     ((name		  . "INVERTED OHM SIGN")
      (=ucs		  . #x2127)	; ℧
      ))
    (=jis-x0213-1-2000	. #x2360)	; &JX1-2360; [03-64]
    (=ucs@jis/fw	. #x2127)	; &JX1-2360;
    ))
(define-char
  '((name		. "BLACK-LETTER CAPITAL Z")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      ))
    (=ucs		. #x2128)	; ℨ
    ))
(define-char
  '((name		. "TURNED GREEK SMALL LETTER IOTA")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2129)	; ℩
    ))
(define-char
  '((name		. "KELVIN SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "LATIN CAPITAL LETTER K")
      (=ucs		  . #x004B)	; K
      ))
    (=ucs		. #x212A)	; K
    ))
(define-char
  '((name		. "ANGSTROM SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->canonical
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00C5)	; Å
      ))
    (=ucs		. #x212B)	; Å
    ))
(define-char
  '((<-denotational
     ((name		  . "ANGSTROM SIGN")
      (=ucs		  . #x212B)	; Å
      ))
    (<-fullwidth
     ((name		  . "ANGSTROM SIGN")
      (=ucs		  . #x212B)	; Å
      ))
    (=jis-x0208@1983	. #x2272)	; &J90-2272; [02-82]
    (=ks-x1001		. #x214A)	; &I-K0-214A; [01-42]
    (=jis-x0208@1990	. #x2272)	; &I-J90-2272; [02-82]
    (=ucs@jis		. #x212B)	; &J90-2272;
    ))
(define-char
  '((name		. "SCRIPT CAPITAL B")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER B")
      (=ucs		  . #x0042)	; B
      ))
    (=ucs		. #x212C)	; ℬ
    ))
(define-char
  '((name		. "BLACK-LETTER CAPITAL C")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      ))
    (=ucs		. #x212D)	; ℭ
    ))
(define-char
  '((name		. "ESTIMATED SYMBOL")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x212E)	; ℮
    ))
(define-char
  '((name		. "SCRIPT SMALL E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      ))
    (=ucs		. #x212F)	; ℯ
    ))
(define-char
  '((name		. "SCRIPT CAPITAL E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      ))
    (=ucs		. #x2130)	; ℰ
    ))
(define-char
  '((name		. "SCRIPT CAPITAL F")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER F")
      (=ucs		  . #x0046)	; F
      ))
    (=ucs		. #x2131)	; ℱ
    ))
(define-char
  '((name		. "TURNED CAPITAL F")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2132)	; Ⅎ
    ))
(define-char
  '((name		. "SCRIPT CAPITAL M")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN CAPITAL LETTER M")
      (=ucs		  . #x004D)	; M
      ))
    (=ucs		. #x2133)	; ℳ
    ))
(define-char
  '((name		. "SCRIPT SMALL O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      ))
    (=ucs		. #x2134)	; ℴ
    ))
(define-char
  '((name		. "ALEF SYMBOL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-compat/math
     ((name		  . "HEBREW LETTER ALEF")
      (=ucs		  . #x05D0)	; א
      ))
    (=ucs		. #x2135)	; ℵ
    ))
(define-char
  '((<-denotational
     ((name		  . "ALEF SYMBOL")
      (=ucs		  . #x2135)	; ℵ
      ))
    (<-fullwidth
     ((name		  . "ALEF SYMBOL")
      (=ucs		  . #x2135)	; ℵ
      ))
    (=jis-x0213-1-2000	. #x235C)	; &JX1-235C; [03-60]
    (=ucs@jis		. #x2135)	; &JX1-235C;
    ))
(define-char
  '((name		. "BET SYMBOL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-compat/math
     ((name		  . "HEBREW LETTER BET")
      (=ucs		  . #x05D1)	; ב
      ))
    (=ucs		. #x2136)	; ℶ
    ))
(define-char
  '((name		. "GIMEL SYMBOL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-compat/math
     ((name		  . "HEBREW LETTER GIMEL")
      (=ucs		  . #x05D2)	; ג
      ))
    (=ucs		. #x2137)	; ℷ
    ))
(define-char
  '((name		. "DALET SYMBOL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (<-compat/math
     ((name		  . "HEBREW LETTER DALET")
      (=ucs		  . #x05D3)	; ד
      ))
    (=ucs		. #x2138)	; ℸ
    ))
(define-char
  '((name		. "INFORMATION SOURCE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     font
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    (=ucs		. #x2139)	; ℹ
    ))
(define-char
  '((name		. "ROTATED CAPITAL Q")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x213A)	; ℺
    ))
