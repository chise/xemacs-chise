;; -*- coding: utf-8-mcs -*-
(define-char
  '((name		. "SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x0020)	;
    (ascii		. #x20)	;
    (latin-viscii	. #x20)	;
    (ipa		. #xFF)	; �����
    (arabic-1-column	. #x21)	; �����
    ))
(define-char
  '((name		. "EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH EXCLAMATION MARK")
      (=ucs		  . #xFF01)	; ！
      ))
    (=ucs		. #x0021)	; !
    (latin-jisx0201	. #x21)	; �����
    (ascii		. #x21)	; !
    (latin-viscii	. #x21)	; !
    (arabic-1-column	. #x22)	; �����
    ))
(define-char
  '((name		. "QUOTATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH QUOTATION MARK")
      (=ucs		  . #xFF02)	; ＂
      ))
    (=ucs		. #x0022)	; "
    (latin-jisx0201	. #x22)	; �����
    (ascii		. #x22)	; "
    (latin-viscii	. #x22)	; "
    ))
(define-char
  '((name		. "NUMBER SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH NUMBER SIGN")
      (=ucs		  . #xFF03)	; ＃
      ))
    (=ucs		. #x0023)	; #
    (latin-jisx0201	. #x23)	; �����
    (ascii		. #x23)	; #
    (latin-viscii	. #x23)	; #
    ))
(define-char
  '((name		. "DOLLAR SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH DOLLAR SIGN")
      (=ucs		  . #xFF04)	; ＄
      ))
    (=ucs		. #x0024)	; $
    (latin-jisx0201	. #x24)	; �����
    (ascii		. #x24)	; $
    (latin-viscii	. #x24)	; $
    ))
(define-char
  '((name		. "PERCENT SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH PERCENT SIGN")
      (=ucs		  . #xFF05)	; ％
      ))
    (=ucs		. #x0025)	; %
    (latin-jisx0201	. #x25)	; �����
    (ascii		. #x25)	; %
    (latin-viscii	. #x25)	; %
    ))
(define-char
  '((name		. "AMPERSAND")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH AMPERSAND")
      (=ucs		  . #xFF06)	; ＆
      ))
    (=ucs		. #x0026)	; &
    (latin-jisx0201	. #x26)	; �����
    (ascii		. #x26)	; &
    (latin-viscii	. #x26)	; &
    ))
(define-char
  '((name		. "APOSTROPHE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH APOSTROPHE")
      (=ucs		  . #xFF07)	; ＇
      ))
    (=ucs		. #x0027)	; '
    (latin-jisx0201	. #x27)	; �����
    (ascii		. #x27)	; '
    (latin-viscii	. #x27)	; '
    ))
(define-char
  '((name		. "LEFT PARENTHESIS")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT PARENTHESIS")
      (=ucs		  . #xFF08)	; （
      ))
    (=ucs		. #x0028)	; (
    (latin-jisx0201	. #x28)	; �����
    (ascii		. #x28)	; (
    (latin-viscii	. #x28)	; (
    (arabic-1-column	. #x24)	; �����
    ))
(define-char
  '((name		. "RIGHT PARENTHESIS")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT PARENTHESIS")
      (=ucs		  . #xFF09)	; ）
      ))
    (=ucs		. #x0029)	; )
    (latin-jisx0201	. #x29)	; �����
    (ascii		. #x29)	; )
    (latin-viscii	. #x29)	; )
    (arabic-1-column	. #x23)	; �����
    ))
(define-char
  '((name		. "ASTERISK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH ASTERISK")
      (=ucs		  . #xFF0A)	; ＊
      ))
    (=ucs		. #x002A)	; *
    (latin-jisx0201	. #x2A)	; �����
    (ascii		. #x2A)	; *
    (latin-viscii	. #x2A)	; *
    ))
(define-char
  '((name		. "PLUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH PLUS SIGN")
      (=ucs		  . #xFF0B)	; ＋
      ))
    (=ucs		. #x002B)	; +
    (latin-jisx0201	. #x2B)	; �����
    (ascii		. #x2B)	; +
    (latin-viscii	. #x2B)	; +
    ))
(define-char
  '((name		. "COMMA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH COMMA")
      (=ucs		  . #xFF0C)	; ，
      ))
    (=ucs		. #x002C)	; ,
    (latin-jisx0201	. #x2C)	; �����
    (ascii		. #x2C)	; ,
    (latin-viscii	. #x2C)	; ,
    ))
(define-char
  '((name		. "HYPHEN-MINUS")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH HYPHEN-MINUS")
      (=ucs		  . #xFF0D)	; －
      ))
    (=ucs		. #x002D)	; -
    (latin-jisx0201	. #x2D)	; �����
    (ascii		. #x2D)	; -
    (latin-viscii	. #x2D)	; -
    ))
(define-char
  '((name		. "FULL STOP")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH FULL STOP")
      (=ucs		  . #xFF0E)	; ．
      ))
    (=ucs		. #x002E)	; .
    (latin-jisx0201	. #x2E)	; �����
    (ascii		. #x2E)	; .
    (latin-viscii	. #x2E)	; .
    (arabic-1-column	. #x26)	; �����
    ))
(define-char
  '((name		. "SOLIDUS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ES")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH SOLIDUS")
      (=ucs		  . #xFF0F)	; ／
      ))
    (=ucs		. #x002F)	; /
    (latin-jisx0201	. #x2F)	; �����
    (ascii		. #x2F)	; /
    (latin-viscii	. #x2F)	; /
    ))
(define-char
  '((name		. "DIGIT ZERO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 0)
    (digit-value	 . 0)
    (numeric-value	 . 0)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT ZERO")
      (=ucs		  . #xFF10)	; ０
      ))
    (=ucs		. #x0030)	; 0
    (latin-jisx0201	. #x30)	; �����
    (ascii		. #x30)	; 0
    (latin-viscii	. #x30)	; 0
    ))
(define-char
  '((name		. "DIGIT ONE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT ONE")
      (=ucs		  . #xFF11)	; １
      ))
    (=ucs		. #x0031)	; 1
    (latin-jisx0201	. #x31)	; �����
    (ascii		. #x31)	; 1
    (latin-viscii	. #x31)	; 1
    ))
(define-char
  '((name		. "DIGIT TWO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT TWO")
      (=ucs		  . #xFF12)	; ２
      ))
    (=ucs		. #x0032)	; 2
    (latin-jisx0201	. #x32)	; �����
    (ascii		. #x32)	; 2
    (latin-viscii	. #x32)	; 2
    ))
(define-char
  '((name		. "DIGIT THREE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT THREE")
      (=ucs		  . #xFF13)	; ３
      ))
    (=ucs		. #x0033)	; 3
    (latin-jisx0201	. #x33)	; �����
    (ascii		. #x33)	; 3
    (latin-viscii	. #x33)	; 3
    ))
(define-char
  '((name		. "DIGIT FOUR")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 4)
    (digit-value	 . 4)
    (numeric-value	 . 4)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT FOUR")
      (=ucs		  . #xFF14)	; ４
      ))
    (=ucs		. #x0034)	; 4
    (latin-jisx0201	. #x34)	; �����
    (ascii		. #x34)	; 4
    (latin-viscii	. #x34)	; 4
    ))
(define-char
  '((name		. "DIGIT FIVE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 5)
    (digit-value	 . 5)
    (numeric-value	 . 5)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT FIVE")
      (=ucs		  . #xFF15)	; ５
      ))
    (=ucs		. #x0035)	; 5
    (latin-jisx0201	. #x35)	; �����
    (ascii		. #x35)	; 5
    (latin-viscii	. #x35)	; 5
    ))
(define-char
  '((name		. "DIGIT SIX")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 6)
    (digit-value	 . 6)
    (numeric-value	 . 6)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT SIX")
      (=ucs		  . #xFF16)	; ６
      ))
    (=ucs		. #x0036)	; 6
    (latin-jisx0201	. #x36)	; �����
    (ascii		. #x36)	; 6
    (latin-viscii	. #x36)	; 6
    ))
(define-char
  '((name		. "DIGIT SEVEN")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 7)
    (digit-value	 . 7)
    (numeric-value	 . 7)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT SEVEN")
      (=ucs		  . #xFF17)	; ７
      ))
    (=ucs		. #x0037)	; 7
    (latin-jisx0201	. #x37)	; �����
    (ascii		. #x37)	; 7
    (latin-viscii	. #x37)	; 7
    ))
(define-char
  '((name		. "DIGIT EIGHT")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 8)
    (digit-value	 . 8)
    (numeric-value	 . 8)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT EIGHT")
      (=ucs		  . #xFF18)	; ８
      ))
    (=ucs		. #x0038)	; 8
    (latin-jisx0201	. #x38)	; �����
    (ascii		. #x38)	; 8
    (latin-viscii	. #x38)	; 8
    ))
(define-char
  '((name		. "DIGIT NINE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 9)
    (digit-value	 . 9)
    (numeric-value	 . 9)
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT NINE")
      (=ucs		  . #xFF19)	; ９
      ))
    (=ucs		. #x0039)	; 9
    (latin-jisx0201	. #x39)	; �����
    (ascii		. #x39)	; 9
    (latin-viscii	. #x39)	; 9
    ))
(define-char
  '((name		. "COLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH COLON")
      (=ucs		  . #xFF1A)	; ：
      ))
    (=ucs		. #x003A)	; :
    (latin-jisx0201	. #x3A)	; �����
    (ascii		. #x3A)	; :
    (latin-viscii	. #x3A)	; :
    (arabic-1-column	. #x27)	; �����
    ))
(define-char
  '((name		. "SEMICOLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH SEMICOLON")
      (=ucs		  . #xFF1B)	; ；
      ))
    (=ucs		. #x003B)	; ;
    (latin-jisx0201	. #x3B)	; �����
    (ascii		. #x3B)	; ;
    (latin-viscii	. #x3B)	; ;
    ))
(define-char
  '((name		. "LESS-THAN SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LESS-THAN SIGN")
      (=ucs		  . #xFF1C)	; ＜
      ))
    (=ucs		. #x003C)	; <
    (latin-jisx0201	. #x3C)	; �����
    (ascii		. #x3C)	; <
    (latin-viscii	. #x3C)	; <
    ))
(define-char
  '((name		. "EQUALS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH EQUALS SIGN")
      (=ucs		  . #xFF1D)	; ＝
      ))
    (=ucs		. #x003D)	; =
    (latin-jisx0201	. #x3D)	; �����
    (ascii		. #x3D)	; =
    (latin-viscii	. #x3D)	; =
    ))
(define-char
  '((name		. "GREATER-THAN SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH GREATER-THAN SIGN")
      (=ucs		  . #xFF1E)	; ＞
      ))
    (=ucs		. #x003E)	; >
    (latin-jisx0201	. #x3E)	; �����
    (ascii		. #x3E)	; >
    (latin-viscii	. #x3E)	; >
    ))
(define-char
  '((name		. "QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH QUESTION MARK")
      (=ucs		  . #xFF1F)	; ？
      ))
    (=ucs		. #x003F)	; ?
    (latin-jisx0201	. #x3F)	; �����
    (ascii		. #x3F)	; ?
    (latin-viscii	. #x3F)	; ?
    ))
(define-char
  '((name		. "COMMERCIAL AT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH COMMERCIAL AT")
      (=ucs		  . #xFF20)	; ＠
      ))
    (=ucs		. #x0040)	; @
    (latin-jisx0201	. #x40)	; �����
    (ascii		. #x40)	; @
    (latin-viscii	. #x40)	; @
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      ))
    (=ucs		. #x0041)	; A
    (latin-jisx0201	. #x41)	; �����
    (ascii		. #x41)	; A
    (latin-viscii	. #x41)	; A
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER B")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER B")
      (=ucs		  . #xFF22)	; Ｂ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER B")
      (=ucs		  . #x0062)	; b
      ))
    (=ucs		. #x0042)	; B
    (latin-jisx0201	. #x42)	; �����
    (ascii		. #x42)	; B
    (latin-viscii	. #x42)	; B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      ))
    (=ucs		. #x0043)	; C
    (latin-jisx0201	. #x43)	; �����
    (ascii		. #x43)	; C
    (latin-viscii	. #x43)	; C
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER D")
      (=ucs		  . #xFF24)	; Ｄ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D")
      (=ucs		  . #x0064)	; d
      ))
    (=ucs		. #x0044)	; D
    (latin-jisx0201	. #x44)	; �����
    (ascii		. #x44)	; D
    (latin-viscii	. #x44)	; D
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      ))
    (=ucs		. #x0045)	; E
    (latin-jisx0201	. #x45)	; �����
    (ascii		. #x45)	; E
    (latin-viscii	. #x45)	; E
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER F")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER F")
      (=ucs		  . #xFF26)	; Ｆ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER F")
      (=ucs		  . #x0066)	; f
      ))
    (=ucs		. #x0046)	; F
    (latin-jisx0201	. #x46)	; �����
    (ascii		. #x46)	; F
    (latin-viscii	. #x46)	; F
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (=ucs		  . #xFF27)	; Ｇ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      ))
    (=ucs		. #x0047)	; G
    (latin-jisx0201	. #x47)	; �����
    (ascii		. #x47)	; G
    (latin-viscii	. #x47)	; G
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER H")
      (=ucs		  . #xFF28)	; Ｈ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H")
      (=ucs		  . #x0068)	; h
      ))
    (=ucs		. #x0048)	; H
    (latin-jisx0201	. #x48)	; �����
    (ascii		. #x48)	; H
    (latin-viscii	. #x48)	; H
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    (=ucs		. #x0049)	; I
    (latin-jisx0201	. #x49)	; �����
    (ascii		. #x49)	; I
    (latin-viscii	. #x49)	; I
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER J")
      (=ucs		  . #xFF2A)	; Ｊ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J")
      (=ucs		  . #x006A)	; j
      ))
    (=ucs		. #x004A)	; J
    (latin-jisx0201	. #x4A)	; �����
    (ascii		. #x4A)	; J
    (latin-viscii	. #x4A)	; J
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER K")
      (=ucs		  . #xFF2B)	; Ｋ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K")
      (=ucs		  . #x006B)	; k
      ))
    (=ucs		. #x004B)	; K
    (latin-jisx0201	. #x4B)	; �����
    (ascii		. #x4B)	; K
    (latin-viscii	. #x4B)	; K
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (=ucs		  . #xFF2C)	; Ｌ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      ))
    (=ucs		. #x004C)	; L
    (latin-jisx0201	. #x4C)	; �����
    (ascii		. #x4C)	; L
    (latin-viscii	. #x4C)	; L
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER M")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER M")
      (=ucs		  . #xFF2D)	; Ｍ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER M")
      (=ucs		  . #x006D)	; m
      ))
    (=ucs		. #x004D)	; M
    (latin-jisx0201	. #x4D)	; �����
    (ascii		. #x4D)	; M
    (latin-viscii	. #x4D)	; M
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (=ucs		  . #xFF2E)	; Ｎ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      ))
    (=ucs		. #x004E)	; N
    (latin-jisx0201	. #x4E)	; �����
    (ascii		. #x4E)	; N
    (latin-viscii	. #x4E)	; N
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      ))
    (=ucs		. #x004F)	; O
    (latin-jisx0201	. #x4F)	; �����
    (ascii		. #x4F)	; O
    (latin-viscii	. #x4F)	; O
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER P")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER P")
      (=ucs		  . #xFF30)	; Ｐ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER P")
      (=ucs		  . #x0070)	; p
      ))
    (=ucs		. #x0050)	; P
    (latin-jisx0201	. #x50)	; �����
    (ascii		. #x50)	; P
    (latin-viscii	. #x50)	; P
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Q")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Q")
      (=ucs		  . #xFF31)	; Ｑ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Q")
      (=ucs		  . #x0071)	; q
      ))
    (=ucs		. #x0051)	; Q
    (latin-jisx0201	. #x51)	; �����
    (ascii		. #x51)	; Q
    (latin-viscii	. #x51)	; Q
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER R")
      (=ucs		  . #xFF32)	; Ｒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R")
      (=ucs		  . #x0072)	; r
      ))
    (=ucs		. #x0052)	; R
    (latin-jisx0201	. #x52)	; �����
    (ascii		. #x52)	; R
    (latin-viscii	. #x52)	; R
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (=ucs		  . #xFF33)	; Ｓ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      ))
    (=ucs		. #x0053)	; S
    (latin-jisx0201	. #x53)	; �����
    (ascii		. #x53)	; S
    (latin-viscii	. #x53)	; S
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER T")
      (=ucs		  . #xFF34)	; Ｔ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T")
      (=ucs		  . #x0074)	; t
      ))
    (=ucs		. #x0054)	; T
    (latin-jisx0201	. #x54)	; �����
    (ascii		. #x54)	; T
    (latin-viscii	. #x54)	; T
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      ))
    (=ucs		. #x0055)	; U
    (latin-jisx0201	. #x55)	; �����
    (ascii		. #x55)	; U
    (latin-viscii	. #x55)	; U
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER V")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER V")
      (=ucs		  . #xFF36)	; Ｖ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER V")
      (=ucs		  . #x0076)	; v
      ))
    (=ucs		. #x0056)	; V
    (latin-jisx0201	. #x56)	; �����
    (ascii		. #x56)	; V
    (latin-viscii	. #x56)	; V
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER W")
      (=ucs		  . #xFF37)	; Ｗ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W")
      (=ucs		  . #x0077)	; w
      ))
    (=ucs		. #x0057)	; W
    (latin-jisx0201	. #x57)	; �����
    (ascii		. #x57)	; W
    (latin-viscii	. #x57)	; W
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER X")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER X")
      (=ucs		  . #xFF38)	; Ｘ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER X")
      (=ucs		  . #x0078)	; x
      ))
    (=ucs		. #x0058)	; X
    (latin-jisx0201	. #x58)	; �����
    (ascii		. #x58)	; X
    (latin-viscii	. #x58)	; X
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Y")
      (=ucs		  . #xFF39)	; Ｙ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y")
      (=ucs		  . #x0079)	; y
      ))
    (=ucs		. #x0059)	; Y
    (latin-jisx0201	. #x59)	; �����
    (ascii		. #x59)	; Y
    (latin-viscii	. #x59)	; Y
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Z")
      (=ucs		  . #xFF3A)	; Ｚ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z")
      (=ucs		  . #x007A)	; z
      ))
    (=ucs		. #x005A)	; Z
    (latin-jisx0201	. #x5A)	; �����
    (ascii		. #x5A)	; Z
    (latin-viscii	. #x5A)	; Z
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT SQUARE BRACKET")
      (=ucs		  . #xFF3B)	; ［
      ))
    (=ucs		. #x005B)	; [
    (latin-jisx0201	. #x5B)	; �����
    (ascii		. #x5B)	; [
    (latin-viscii	. #x5B)	; [
    ))
(define-char
  '((name		. "REVERSE SOLIDUS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH REVERSE SOLIDUS")
      (=ucs		  . #xFF3C)	; ＼
      ))
    (=ucs		. #x005C)	; \
    (ascii		. #x5C)	; \
    (latin-viscii	. #x5C)	; \
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT SQUARE BRACKET")
      (=ucs		  . #xFF3D)	; ］
      ))
    (=ucs		. #x005D)	; ]
    (latin-jisx0201	. #x5D)	; �����
    (ascii		. #x5D)	; ]
    (latin-viscii	. #x5D)	; ]
    ))
(define-char
  '((name		. "CIRCUMFLEX ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CIRCUMFLEX ACCENT")
      (=ucs		  . #xFF3E)	; ＾
      ))
    (=ucs		. #x005E)	; ^
    (latin-jisx0201	. #x5E)	; �����
    (ascii		. #x5E)	; ^
    (latin-viscii	. #x5E)	; ^
    ))
(define-char
  '((name		. "LOW LINE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LOW LINE")
      (=ucs		  . #xFF3F)	; ＿
      ))
    (=ucs		. #x005F)	; _
    (latin-jisx0201	. #x5F)	; �����
    (ascii		. #x5F)	; _
    (latin-viscii	. #x5F)	; _
    ))
(define-char
  '((name		. "GRAVE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH GRAVE ACCENT")
      (=ucs		  . #xFF40)	; ｀
      ))
    (=ucs		. #x0060)	; `
    (latin-jisx0201	. #x60)	; �����
    (ascii		. #x60)	; `
    (latin-viscii	. #x60)	; `
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      ))
    (=ucs		. #x0061)	; a
    (latin-jisx0201	. #x61)	; �����
    (ascii		. #x61)	; a
    (latin-viscii	. #x61)	; a
    (ipa		. #xA5)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER B")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER B")
      (=ucs		  . #xFF42)	; ｂ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER B")
      (=ucs		  . #x0042)	; B
      ))
    (=ucs		. #x0062)	; b
    (latin-jisx0201	. #x62)	; �����
    (ascii		. #x62)	; b
    (latin-viscii	. #x62)	; b
    (ipa		. #xC1)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      ))
    (=ucs		. #x0063)	; c
    (latin-jisx0201	. #x63)	; �����
    (ascii		. #x63)	; c
    (latin-viscii	. #x63)	; c
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER D")
      (=ucs		  . #xFF44)	; ｄ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D")
      (=ucs		  . #x0044)	; D
      ))
    (=ucs		. #x0064)	; d
    (latin-jisx0201	. #x64)	; �����
    (ascii		. #x64)	; d
    (latin-viscii	. #x64)	; d
    (ipa		. #xC3)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      ))
    (=ucs		. #x0065)	; e
    (latin-jisx0201	. #x65)	; �����
    (ascii		. #x65)	; e
    (latin-viscii	. #x65)	; e
    (ipa		. #xA2)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER F")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER F")
      (=ucs		  . #xFF46)	; ｆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER F")
      (=ucs		  . #x0046)	; F
      ))
    (=ucs		. #x0066)	; f
    (latin-jisx0201	. #x66)	; �����
    (ascii		. #x66)	; f
    (latin-viscii	. #x66)	; f
    (ipa		. #xC6)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G")
      (=ucs		  . #xFF47)	; ｇ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G")
      (=ucs		  . #x0047)	; G
      ))
    (=ucs		. #x0067)	; g
    (latin-jisx0201	. #x67)	; �����
    (ascii		. #x67)	; g
    (latin-viscii	. #x67)	; g
    (ipa		. #xC5)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER H")
      (=ucs		  . #xFF48)	; ｈ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H")
      (=ucs		  . #x0048)	; H
      ))
    (=ucs		. #x0068)	; h
    (latin-jisx0201	. #x68)	; �����
    (ascii		. #x68)	; h
    (latin-viscii	. #x68)	; h
    (ipa		. #xD1)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      ))
    (=ucs		. #x0069)	; i
    (latin-jisx0201	. #x69)	; �����
    (ascii		. #x69)	; i
    (latin-viscii	. #x69)	; i
    (ipa		. #xA0)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER J")
      (=ucs		  . #xFF4A)	; ｊ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J")
      (=ucs		  . #x004A)	; J
      ))
    (=ucs		. #x006A)	; j
    (latin-jisx0201	. #x6A)	; �����
    (ascii		. #x6A)	; j
    (latin-viscii	. #x6A)	; j
    (ipa		. #xD9)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER K")
      (=ucs		  . #xFF4B)	; ｋ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K")
      (=ucs		  . #x004B)	; K
      ))
    (=ucs		. #x006B)	; k
    (latin-jisx0201	. #x6B)	; �����
    (ascii		. #x6B)	; k
    (latin-viscii	. #x6B)	; k
    (ipa		. #xC4)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      ))
    (=ucs		. #x006C)	; l
    (latin-jisx0201	. #x6C)	; �����
    (ascii		. #x6C)	; l
    (latin-viscii	. #x6C)	; l
    (ipa		. #xDA)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER M")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER M")
      (=ucs		  . #xFF4D)	; ｍ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER M")
      (=ucs		  . #x004D)	; M
      ))
    (=ucs		. #x006D)	; m
    (latin-jisx0201	. #x6D)	; �����
    (ascii		. #x6D)	; m
    (latin-viscii	. #x6D)	; m
    (ipa		. #xD2)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      ))
    (=ucs		. #x006E)	; n
    (latin-jisx0201	. #x6E)	; �����
    (ascii		. #x6E)	; n
    (latin-viscii	. #x6E)	; n
    (ipa		. #xD3)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      ))
    (=ucs		. #x006F)	; o
    (latin-jisx0201	. #x6F)	; �����
    (ascii		. #x6F)	; o
    (latin-viscii	. #x6F)	; o
    (ipa		. #xB6)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER P")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER P")
      (=ucs		  . #xFF50)	; ｐ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER P")
      (=ucs		  . #x0050)	; P
      ))
    (=ucs		. #x0070)	; p
    (latin-jisx0201	. #x70)	; �����
    (ascii		. #x70)	; p
    (latin-viscii	. #x70)	; p
    (ipa		. #xC0)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Q")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Q")
      (=ucs		  . #xFF51)	; ｑ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Q")
      (=ucs		  . #x0051)	; Q
      ))
    (=ucs		. #x0071)	; q
    (latin-jisx0201	. #x71)	; �����
    (ascii		. #x71)	; q
    (latin-viscii	. #x71)	; q
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER R")
      (=ucs		  . #xFF52)	; ｒ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      ))
    (=ucs		. #x0072)	; r
    (latin-jisx0201	. #x72)	; �����
    (ascii		. #x72)	; r
    (latin-viscii	. #x72)	; r
    (ipa		. #xD6)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (=ucs		  . #xFF53)	; ｓ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      ))
    (=ucs		. #x0073)	; s
    (latin-jisx0201	. #x73)	; �����
    (ascii		. #x73)	; s
    (latin-viscii	. #x73)	; s
    (ipa		. #xCA)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER T")
      (=ucs		  . #xFF54)	; ｔ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T")
      (=ucs		  . #x0054)	; T
      ))
    (=ucs		. #x0074)	; t
    (latin-jisx0201	. #x74)	; �����
    (ascii		. #x74)	; t
    (latin-viscii	. #x74)	; t
    (ipa		. #xC2)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      ))
    (=ucs		. #x0075)	; u
    (latin-jisx0201	. #x75)	; �����
    (ascii		. #x75)	; u
    (latin-viscii	. #x75)	; u
    (ipa		. #xB4)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER V")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER V")
      (=ucs		  . #xFF56)	; ｖ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER V")
      (=ucs		  . #x0056)	; V
      ))
    (=ucs		. #x0076)	; v
    (latin-jisx0201	. #x76)	; �����
    (ascii		. #x76)	; v
    (latin-viscii	. #x76)	; v
    (ipa		. #xC7)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER W")
      (=ucs		  . #xFF57)	; ｗ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W")
      (=ucs		  . #x0057)	; W
      ))
    (=ucs		. #x0077)	; w
    (latin-jisx0201	. #x77)	; �����
    (ascii		. #x77)	; w
    (latin-viscii	. #x77)	; w
    (ipa		. #xDE)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER X")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER X")
      (=ucs		  . #xFF58)	; ｘ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER X")
      (=ucs		  . #x0058)	; X
      ))
    (=ucs		. #x0078)	; x
    (latin-jisx0201	. #x78)	; �����
    (ascii		. #x78)	; x
    (latin-viscii	. #x78)	; x
    (ipa		. #xCF)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Y")
      (=ucs		  . #xFF59)	; ｙ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y")
      (=ucs		  . #x0059)	; Y
      ))
    (=ucs		. #x0079)	; y
    (latin-jisx0201	. #x79)	; �����
    (ascii		. #x79)	; y
    (latin-viscii	. #x79)	; y
    (ipa		. #xAD)	; �����
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Z")
      (=ucs		  . #xFF5A)	; ｚ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      ))
    (=ucs		. #x007A)	; z
    (latin-jisx0201	. #x7A)	; �����
    (ascii		. #x7A)	; z
    (latin-viscii	. #x7A)	; z
    (ipa		. #xCB)	; �����
    ))
(define-char
  '((name		. "LEFT CURLY BRACKET")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT CURLY BRACKET")
      (=ucs		  . #xFF5B)	; ｛
      ))
    (=ucs		. #x007B)	; {
    (latin-jisx0201	. #x7B)	; �����
    (ascii		. #x7B)	; {
    (latin-viscii	. #x7B)	; {
    ))
(define-char
  '((name		. "VERTICAL LINE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH VERTICAL LINE")
      (=ucs		  . #xFF5C)	; ｜
      ))
    (=ucs		. #x007C)	; |
    (latin-jisx0201	. #x7C)	; �����
    (ascii		. #x7C)	; |
    (latin-viscii	. #x7C)	; |
    ))
(define-char
  '((name		. "RIGHT CURLY BRACKET")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT CURLY BRACKET")
      (=ucs		  . #xFF5D)	; ｝
      ))
    (=ucs		. #x007D)	; }
    (latin-jisx0201	. #x7D)	; �����
    (ascii		. #x7D)	; }
    (latin-viscii	. #x7D)	; }
    ))
(define-char
  '((name		. "TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH TILDE")
      (=ucs		  . #xFF5E)	; ～
      ))
    (=ucs		. #x007E)	; ~
    (ascii		. #x7E)	; ~
    (latin-viscii	. #x7E)	; ~
    ))
(define-char
  '((name		. "DELETE")
    (general-category	other control) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x007F)	; ␡
    (ascii		. #x7F)	; ␡
    (latin-viscii	. #x7F)	; ␡
    ))
