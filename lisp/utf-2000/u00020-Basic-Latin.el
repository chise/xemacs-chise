(define-char
  '((name		. "SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (ascii		. #x20)	; �����
    (ipa		. #xFF)	; �����
    (latin-viscii	. #x20)	;
    (ucs		. #x0020)	;
    ))
(define-char
  '((name		. "EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH EXCLAMATION MARK")
      (ucs		  . #xFF01)	; ！
      ))
    (ascii		. #x21)	; �����
    (latin-jisx0201	. #x21)	; �����
    (latin-viscii	. #x21)	; !
    (ucs		. #x0021)	; !
    ))
(define-char
  '((name		. "QUOTATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH QUOTATION MARK")
      (ucs		  . #xFF02)	; ＂
      ))
    (ascii		. #x22)	; �����
    (latin-jisx0201	. #x22)	; �����
    (latin-viscii	. #x22)	; "
    (ucs		. #x0022)	; "
    ))
(define-char
  '((name		. "NUMBER SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH NUMBER SIGN")
      (ucs		  . #xFF03)	; ＃
      ))
    (ascii		. #x23)	; �����
    (latin-jisx0201	. #x23)	; �����
    (latin-viscii	. #x23)	; #
    (ucs		. #x0023)	; #
    ))
(define-char
  '((name		. "DOLLAR SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH DOLLAR SIGN")
      (ucs		  . #xFF04)	; ＄
      ))
    (ascii		. #x24)	; �����
    (latin-jisx0201	. #x24)	; �����
    (latin-viscii	. #x24)	; $
    (ucs		. #x0024)	; $
    ))
(define-char
  '((name		. "PERCENT SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH PERCENT SIGN")
      (ucs		  . #xFF05)	; ％
      ))
    (ascii		. #x25)	; �����
    (latin-jisx0201	. #x25)	; �����
    (latin-viscii	. #x25)	; %
    (ucs		. #x0025)	; %
    ))
(define-char
  '((name		. "AMPERSAND")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH AMPERSAND")
      (ucs		  . #xFF06)	; ＆
      ))
    (ascii		. #x26)	; �����
    (latin-jisx0201	. #x26)	; �����
    (latin-viscii	. #x26)	; &
    (ucs		. #x0026)	; &
    ))
(define-char
  '((name		. "APOSTROPHE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH APOSTROPHE")
      (ucs		  . #xFF07)	; ＇
      ))
    (ascii		. #x27)	; �����
    (latin-jisx0201	. #x27)	; �����
    (latin-viscii	. #x27)	; '
    (ucs		. #x0027)	; '
    ))
(define-char
  '((name		. "LEFT PARENTHESIS")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT PARENTHESIS")
      (ucs		  . #xFF08)	; （
      ))
    (ascii		. #x28)	; �����
    (latin-jisx0201	. #x28)	; �����
    (latin-viscii	. #x28)	; (
    (ucs		. #x0028)	; (
    ))
(define-char
  '((name		. "RIGHT PARENTHESIS")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT PARENTHESIS")
      (ucs		  . #xFF09)	; ）
      ))
    (ascii		. #x29)	; �����
    (latin-jisx0201	. #x29)	; �����
    (latin-viscii	. #x29)	; )
    (ucs		. #x0029)	; )
    ))
(define-char
  '((name		. "ASTERISK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH ASTERISK")
      (ucs		  . #xFF0A)	; ＊
      ))
    (ascii		. #x2A)	; �����
    (latin-jisx0201	. #x2A)	; �����
    (latin-viscii	. #x2A)	; *
    (ucs		. #x002A)	; *
    ))
(define-char
  '((name		. "PLUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH PLUS SIGN")
      (ucs		  . #xFF0B)	; ＋
      ))
    (ascii		. #x2B)	; �����
    (latin-jisx0201	. #x2B)	; �����
    (latin-viscii	. #x2B)	; +
    (ucs		. #x002B)	; +
    ))
(define-char
  '((name		. "COMMA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH COMMA")
      (ucs		  . #xFF0C)	; ，
      ))
    (ascii		. #x2C)	; �����
    (latin-jisx0201	. #x2C)	; �����
    (latin-viscii	. #x2C)	; ,
    (ucs		. #x002C)	; ,
    ))
(define-char
  '((name		. "HYPHEN-MINUS")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH HYPHEN-MINUS")
      (ucs		  . #xFF0D)	; －
      ))
    (ascii		. #x2D)	; �����
    (latin-jisx0201	. #x2D)	; �����
    (latin-viscii	. #x2D)	; -
    (ucs		. #x002D)	; -
    ))
(define-char
  '((name		. "FULL STOP")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH FULL STOP")
      (ucs		  . #xFF0E)	; ．
      ))
    (ascii		. #x2E)	; �����
    (latin-jisx0201	. #x2E)	; �����
    (latin-viscii	. #x2E)	; .
    (ucs		. #x002E)	; .
    ))
(define-char
  '((name		. "SOLIDUS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ES")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH SOLIDUS")
      (ucs		  . #xFF0F)	; ／
      ))
    (ascii		. #x2F)	; �����
    (latin-jisx0201	. #x2F)	; �����
    (latin-viscii	. #x2F)	; /
    (ucs		. #x002F)	; /
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
      (ucs		  . #xFF10)	; ０
      ))
    (ascii		. #x30)	; �����
    (latin-jisx0201	. #x30)	; �����
    (latin-viscii	. #x30)	; 0
    (ucs		. #x0030)	; 0
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
      (ucs		  . #xFF11)	; １
      ))
    (ascii		. #x31)	; �����
    (latin-jisx0201	. #x31)	; �����
    (latin-viscii	. #x31)	; 1
    (ucs		. #x0031)	; 1
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
      (ucs		  . #xFF12)	; ２
      ))
    (ascii		. #x32)	; �����
    (latin-jisx0201	. #x32)	; �����
    (latin-viscii	. #x32)	; 2
    (ucs		. #x0032)	; 2
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
      (ucs		  . #xFF13)	; ３
      ))
    (ascii		. #x33)	; �����
    (latin-jisx0201	. #x33)	; �����
    (latin-viscii	. #x33)	; 3
    (ucs		. #x0033)	; 3
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
      (ucs		  . #xFF14)	; ４
      ))
    (ascii		. #x34)	; �����
    (latin-jisx0201	. #x34)	; �����
    (latin-viscii	. #x34)	; 4
    (ucs		. #x0034)	; 4
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
      (ucs		  . #xFF15)	; ５
      ))
    (ascii		. #x35)	; �����
    (latin-jisx0201	. #x35)	; �����
    (latin-viscii	. #x35)	; 5
    (ucs		. #x0035)	; 5
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
      (ucs		  . #xFF16)	; ６
      ))
    (ascii		. #x36)	; �����
    (latin-jisx0201	. #x36)	; �����
    (latin-viscii	. #x36)	; 6
    (ucs		. #x0036)	; 6
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
      (ucs		  . #xFF17)	; ７
      ))
    (ascii		. #x37)	; �����
    (latin-jisx0201	. #x37)	; �����
    (latin-viscii	. #x37)	; 7
    (ucs		. #x0037)	; 7
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
      (ucs		  . #xFF18)	; ８
      ))
    (ascii		. #x38)	; �����
    (latin-jisx0201	. #x38)	; �����
    (latin-viscii	. #x38)	; 8
    (ucs		. #x0038)	; 8
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
      (ucs		  . #xFF19)	; ９
      ))
    (ascii		. #x39)	; �����
    (latin-jisx0201	. #x39)	; �����
    (latin-viscii	. #x39)	; 9
    (ucs		. #x0039)	; 9
    ))
(define-char
  '((name		. "COLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH COLON")
      (ucs		  . #xFF1A)	; ：
      ))
    (ascii		. #x3A)	; �����
    (latin-jisx0201	. #x3A)	; �����
    (latin-viscii	. #x3A)	; :
    (ucs		. #x003A)	; :
    ))
(define-char
  '((name		. "SEMICOLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH SEMICOLON")
      (ucs		  . #xFF1B)	; ；
      ))
    (ascii		. #x3B)	; �����
    (latin-jisx0201	. #x3B)	; �����
    (latin-viscii	. #x3B)	; ;
    (ucs		. #x003B)	; ;
    ))
(define-char
  '((name		. "LESS-THAN SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LESS-THAN SIGN")
      (ucs		  . #xFF1C)	; ＜
      ))
    (ascii		. #x3C)	; �����
    (latin-jisx0201	. #x3C)	; �����
    (latin-viscii	. #x3C)	; <
    (ucs		. #x003C)	; <
    ))
(define-char
  '((name		. "EQUALS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH EQUALS SIGN")
      (ucs		  . #xFF1D)	; ＝
      ))
    (ascii		. #x3D)	; �����
    (latin-jisx0201	. #x3D)	; �����
    (latin-viscii	. #x3D)	; =
    (ucs		. #x003D)	; =
    ))
(define-char
  '((name		. "GREATER-THAN SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH GREATER-THAN SIGN")
      (ucs		  . #xFF1E)	; ＞
      ))
    (ascii		. #x3E)	; �����
    (latin-jisx0201	. #x3E)	; �����
    (latin-viscii	. #x3E)	; >
    (ucs		. #x003E)	; >
    ))
(define-char
  '((name		. "QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH QUESTION MARK")
      (ucs		  . #xFF1F)	; ？
      ))
    (ascii		. #x3F)	; �����
    (latin-jisx0201	. #x3F)	; �����
    (latin-viscii	. #x3F)	; ?
    (ucs		. #x003F)	; ?
    ))
(define-char
  '((name		. "COMMERCIAL AT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH COMMERCIAL AT")
      (ucs		  . #xFF20)	; ＠
      ))
    (ascii		. #x40)	; �����
    (latin-jisx0201	. #x40)	; �����
    (latin-viscii	. #x40)	; @
    (ucs		. #x0040)	; @
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (ucs		  . #xFF21)	; Ａ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A")
      (ucs		  . #x0061)	; a
      ))
    (ascii		. #x41)	; �����
    (latin-jisx0201	. #x41)	; �����
    (latin-viscii	. #x41)	; A
    (ucs		. #x0041)	; A
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER B")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER B")
      (ucs		  . #xFF22)	; Ｂ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER B")
      (ucs		  . #x0062)	; b
      ))
    (ascii		. #x42)	; �����
    (latin-jisx0201	. #x42)	; �����
    (latin-viscii	. #x42)	; B
    (ucs		. #x0042)	; B
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (ucs		  . #xFF23)	; Ｃ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C")
      (ucs		  . #x0063)	; c
      ))
    (ascii		. #x43)	; �����
    (latin-jisx0201	. #x43)	; �����
    (latin-viscii	. #x43)	; C
    (ucs		. #x0043)	; C
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER D")
      (ucs		  . #xFF24)	; Ｄ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D")
      (ucs		  . #x0064)	; d
      ))
    (ascii		. #x44)	; �����
    (latin-jisx0201	. #x44)	; �����
    (latin-viscii	. #x44)	; D
    (ucs		. #x0044)	; D
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (ucs		  . #xFF25)	; Ｅ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E")
      (ucs		  . #x0065)	; e
      ))
    (ascii		. #x45)	; �����
    (latin-jisx0201	. #x45)	; �����
    (latin-viscii	. #x45)	; E
    (ucs		. #x0045)	; E
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER F")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER F")
      (ucs		  . #xFF26)	; Ｆ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER F")
      (ucs		  . #x0066)	; f
      ))
    (ascii		. #x46)	; �����
    (latin-jisx0201	. #x46)	; �����
    (latin-viscii	. #x46)	; F
    (ucs		. #x0046)	; F
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (ucs		  . #xFF27)	; Ｇ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G")
      (ucs		  . #x0067)	; g
      ))
    (ascii		. #x47)	; �����
    (latin-jisx0201	. #x47)	; �����
    (latin-viscii	. #x47)	; G
    (ucs		. #x0047)	; G
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER H")
      (ucs		  . #xFF28)	; Ｈ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H")
      (ucs		  . #x0068)	; h
      ))
    (ascii		. #x48)	; �����
    (latin-jisx0201	. #x48)	; �����
    (latin-viscii	. #x48)	; H
    (ucs		. #x0048)	; H
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (ucs		  . #xFF29)	; Ｉ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (ucs		  . #x0069)	; i
      ))
    (ascii		. #x49)	; �����
    (latin-jisx0201	. #x49)	; �����
    (latin-viscii	. #x49)	; I
    (ucs		. #x0049)	; I
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER J")
      (ucs		  . #xFF2A)	; Ｊ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J")
      (ucs		  . #x006A)	; j
      ))
    (ascii		. #x4A)	; �����
    (latin-jisx0201	. #x4A)	; �����
    (latin-viscii	. #x4A)	; J
    (ucs		. #x004A)	; J
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER K")
      (ucs		  . #xFF2B)	; Ｋ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K")
      (ucs		  . #x006B)	; k
      ))
    (ascii		. #x4B)	; �����
    (latin-jisx0201	. #x4B)	; �����
    (latin-viscii	. #x4B)	; K
    (ucs		. #x004B)	; K
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (ucs		  . #xFF2C)	; Ｌ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L")
      (ucs		  . #x006C)	; l
      ))
    (ascii		. #x4C)	; �����
    (latin-jisx0201	. #x4C)	; �����
    (latin-viscii	. #x4C)	; L
    (ucs		. #x004C)	; L
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER M")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER M")
      (ucs		  . #xFF2D)	; Ｍ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER M")
      (ucs		  . #x006D)	; m
      ))
    (ascii		. #x4D)	; �����
    (latin-jisx0201	. #x4D)	; �����
    (latin-viscii	. #x4D)	; M
    (ucs		. #x004D)	; M
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (ucs		  . #xFF2E)	; Ｎ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N")
      (ucs		  . #x006E)	; n
      ))
    (ascii		. #x4E)	; �����
    (latin-jisx0201	. #x4E)	; �����
    (latin-viscii	. #x4E)	; N
    (ucs		. #x004E)	; N
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (ucs		  . #xFF2F)	; Ｏ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O")
      (ucs		  . #x006F)	; o
      ))
    (ascii		. #x4F)	; �����
    (latin-jisx0201	. #x4F)	; �����
    (latin-viscii	. #x4F)	; O
    (ucs		. #x004F)	; O
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER P")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER P")
      (ucs		  . #xFF30)	; Ｐ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER P")
      (ucs		  . #x0070)	; p
      ))
    (ascii		. #x50)	; �����
    (latin-jisx0201	. #x50)	; �����
    (latin-viscii	. #x50)	; P
    (ucs		. #x0050)	; P
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Q")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Q")
      (ucs		  . #xFF31)	; Ｑ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Q")
      (ucs		  . #x0071)	; q
      ))
    (ascii		. #x51)	; �����
    (latin-jisx0201	. #x51)	; �����
    (latin-viscii	. #x51)	; Q
    (ucs		. #x0051)	; Q
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER R")
      (ucs		  . #xFF32)	; Ｒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R")
      (ucs		  . #x0072)	; r
      ))
    (ascii		. #x52)	; �����
    (latin-jisx0201	. #x52)	; �����
    (latin-viscii	. #x52)	; R
    (ucs		. #x0052)	; R
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (ucs		  . #xFF33)	; Ｓ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S")
      (ucs		  . #x0073)	; s
      ))
    (ascii		. #x53)	; �����
    (latin-jisx0201	. #x53)	; �����
    (latin-viscii	. #x53)	; S
    (ucs		. #x0053)	; S
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER T")
      (ucs		  . #xFF34)	; Ｔ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T")
      (ucs		  . #x0074)	; t
      ))
    (ascii		. #x54)	; �����
    (latin-jisx0201	. #x54)	; �����
    (latin-viscii	. #x54)	; T
    (ucs		. #x0054)	; T
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (ucs		  . #xFF35)	; Ｕ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U")
      (ucs		  . #x0075)	; u
      ))
    (ascii		. #x55)	; �����
    (latin-jisx0201	. #x55)	; �����
    (latin-viscii	. #x55)	; U
    (ucs		. #x0055)	; U
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER V")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER V")
      (ucs		  . #xFF36)	; Ｖ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER V")
      (ucs		  . #x0076)	; v
      ))
    (ascii		. #x56)	; �����
    (latin-jisx0201	. #x56)	; �����
    (latin-viscii	. #x56)	; V
    (ucs		. #x0056)	; V
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER W")
      (ucs		  . #xFF37)	; Ｗ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W")
      (ucs		  . #x0077)	; w
      ))
    (ascii		. #x57)	; �����
    (latin-jisx0201	. #x57)	; �����
    (latin-viscii	. #x57)	; W
    (ucs		. #x0057)	; W
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER X")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER X")
      (ucs		  . #xFF38)	; Ｘ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER X")
      (ucs		  . #x0078)	; x
      ))
    (ascii		. #x58)	; �����
    (latin-jisx0201	. #x58)	; �����
    (latin-viscii	. #x58)	; X
    (ucs		. #x0058)	; X
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Y")
      (ucs		  . #xFF39)	; Ｙ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y")
      (ucs		  . #x0079)	; y
      ))
    (ascii		. #x59)	; �����
    (latin-jisx0201	. #x59)	; �����
    (latin-viscii	. #x59)	; Y
    (ucs		. #x0059)	; Y
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Z")
      (ucs		  . #xFF3A)	; Ｚ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z")
      (ucs		  . #x007A)	; z
      ))
    (ascii		. #x5A)	; �����
    (latin-jisx0201	. #x5A)	; �����
    (latin-viscii	. #x5A)	; Z
    (ucs		. #x005A)	; Z
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT SQUARE BRACKET")
      (ucs		  . #xFF3B)	; ［
      ))
    (ascii		. #x5B)	; �����
    (latin-jisx0201	. #x5B)	; �����
    (latin-viscii	. #x5B)	; [
    (ucs		. #x005B)	; [
    ))
(define-char
  '((name		. "REVERSE SOLIDUS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH REVERSE SOLIDUS")
      (ucs		  . #xFF3C)	; ＼
      ))
    (ascii		. #x5C)	; �����
    (latin-viscii	. #x5C)	; \
    (ucs		. #x005C)	; \
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT SQUARE BRACKET")
      (ucs		  . #xFF3D)	; ］
      ))
    (ascii		. #x5D)	; �����
    (latin-jisx0201	. #x5D)	; �����
    (latin-viscii	. #x5D)	; ]
    (ucs		. #x005D)	; ]
    ))
(define-char
  '((name		. "CIRCUMFLEX ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH CIRCUMFLEX ACCENT")
      (ucs		  . #xFF3E)	; ＾
      ))
    (ascii		. #x5E)	; �����
    (latin-jisx0201	. #x5E)	; �����
    (latin-viscii	. #x5E)	; ^
    (ucs		. #x005E)	; ^
    ))
(define-char
  '((name		. "LOW LINE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LOW LINE")
      (ucs		  . #xFF3F)	; ＿
      ))
    (ascii		. #x5F)	; �����
    (latin-jisx0201	. #x5F)	; �����
    (latin-viscii	. #x5F)	; _
    (ucs		. #x005F)	; _
    ))
(define-char
  '((name		. "GRAVE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH GRAVE ACCENT")
      (ucs		  . #xFF40)	; ｀
      ))
    (ascii		. #x60)	; �����
    (latin-jisx0201	. #x60)	; �����
    (latin-viscii	. #x60)	; `
    (ucs		. #x0060)	; `
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (ucs		  . #xFF41)	; ａ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A")
      (ucs		  . #x0041)	; A
      ))
    (ascii		. #x61)	; �����
    (latin-jisx0201	. #x61)	; �����
    (ipa		. #xA5)	; �����
    (latin-viscii	. #x61)	; a
    (ucs		. #x0061)	; a
    ))
(define-char
  '((name		. "LATIN SMALL LETTER B")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER B")
      (ucs		  . #xFF42)	; ｂ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER B")
      (ucs		  . #x0042)	; B
      ))
    (ascii		. #x62)	; �����
    (latin-jisx0201	. #x62)	; �����
    (ipa		. #xC1)	; �����
    (latin-viscii	. #x62)	; b
    (ucs		. #x0062)	; b
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (ucs		  . #xFF43)	; ｃ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C")
      (ucs		  . #x0043)	; C
      ))
    (ascii		. #x63)	; �����
    (latin-jisx0201	. #x63)	; �����
    (latin-viscii	. #x63)	; c
    (ucs		. #x0063)	; c
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER D")
      (ucs		  . #xFF44)	; ｄ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D")
      (ucs		  . #x0044)	; D
      ))
    (ascii		. #x64)	; �����
    (latin-jisx0201	. #x64)	; �����
    (ipa		. #xC3)	; �����
    (latin-viscii	. #x64)	; d
    (ucs		. #x0064)	; d
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (ucs		  . #xFF45)	; ｅ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E")
      (ucs		  . #x0045)	; E
      ))
    (ascii		. #x65)	; �����
    (latin-jisx0201	. #x65)	; �����
    (ipa		. #xA2)	; �����
    (latin-viscii	. #x65)	; e
    (ucs		. #x0065)	; e
    ))
(define-char
  '((name		. "LATIN SMALL LETTER F")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER F")
      (ucs		  . #xFF46)	; ｆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER F")
      (ucs		  . #x0046)	; F
      ))
    (ascii		. #x66)	; �����
    (latin-jisx0201	. #x66)	; �����
    (ipa		. #xC6)	; �����
    (latin-viscii	. #x66)	; f
    (ucs		. #x0066)	; f
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G")
      (ucs		  . #xFF47)	; ｇ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G")
      (ucs		  . #x0047)	; G
      ))
    (ascii		. #x67)	; �����
    (latin-jisx0201	. #x67)	; �����
    (ipa		. #xC5)	; �����
    (latin-viscii	. #x67)	; g
    (ucs		. #x0067)	; g
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER H")
      (ucs		  . #xFF48)	; ｈ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H")
      (ucs		  . #x0048)	; H
      ))
    (ascii		. #x68)	; �����
    (latin-jisx0201	. #x68)	; �����
    (ipa		. #xD1)	; �����
    (latin-viscii	. #x68)	; h
    (ucs		. #x0068)	; h
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (ucs		  . #xFF49)	; ｉ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (ucs		  . #x0049)	; I
      ))
    (ascii		. #x69)	; �����
    (latin-jisx0201	. #x69)	; �����
    (ipa		. #xA0)	; �����
    (latin-viscii	. #x69)	; i
    (ucs		. #x0069)	; i
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER J")
      (ucs		  . #xFF4A)	; ｊ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J")
      (ucs		  . #x004A)	; J
      ))
    (ascii		. #x6A)	; �����
    (latin-jisx0201	. #x6A)	; �����
    (ipa		. #xD9)	; �����
    (latin-viscii	. #x6A)	; j
    (ucs		. #x006A)	; j
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER K")
      (ucs		  . #xFF4B)	; ｋ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K")
      (ucs		  . #x004B)	; K
      ))
    (ascii		. #x6B)	; �����
    (latin-jisx0201	. #x6B)	; �����
    (ipa		. #xC4)	; �����
    (latin-viscii	. #x6B)	; k
    (ucs		. #x006B)	; k
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (ucs		  . #xFF4C)	; ｌ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L")
      (ucs		  . #x004C)	; L
      ))
    (ascii		. #x6C)	; �����
    (latin-jisx0201	. #x6C)	; �����
    (ipa		. #xDA)	; �����
    (latin-viscii	. #x6C)	; l
    (ucs		. #x006C)	; l
    ))
(define-char
  '((name		. "LATIN SMALL LETTER M")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER M")
      (ucs		  . #xFF4D)	; ｍ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER M")
      (ucs		  . #x004D)	; M
      ))
    (ascii		. #x6D)	; �����
    (latin-jisx0201	. #x6D)	; �����
    (ipa		. #xD2)	; �����
    (latin-viscii	. #x6D)	; m
    (ucs		. #x006D)	; m
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (ucs		  . #xFF4E)	; ｎ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N")
      (ucs		  . #x004E)	; N
      ))
    (ascii		. #x6E)	; �����
    (latin-jisx0201	. #x6E)	; �����
    (ipa		. #xD3)	; �����
    (latin-viscii	. #x6E)	; n
    (ucs		. #x006E)	; n
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (ucs		  . #xFF4F)	; ｏ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O")
      (ucs		  . #x004F)	; O
      ))
    (ascii		. #x6F)	; �����
    (latin-jisx0201	. #x6F)	; �����
    (ipa		. #xB6)	; �����
    (latin-viscii	. #x6F)	; o
    (ucs		. #x006F)	; o
    ))
(define-char
  '((name		. "LATIN SMALL LETTER P")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER P")
      (ucs		  . #xFF50)	; ｐ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER P")
      (ucs		  . #x0050)	; P
      ))
    (ascii		. #x70)	; �����
    (latin-jisx0201	. #x70)	; �����
    (ipa		. #xC0)	; �����
    (latin-viscii	. #x70)	; p
    (ucs		. #x0070)	; p
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Q")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Q")
      (ucs		  . #xFF51)	; ｑ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Q")
      (ucs		  . #x0051)	; Q
      ))
    (ascii		. #x71)	; �����
    (latin-jisx0201	. #x71)	; �����
    (latin-viscii	. #x71)	; q
    (ucs		. #x0071)	; q
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER R")
      (ucs		  . #xFF52)	; ｒ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R")
      (ucs		  . #x0052)	; R
      ))
    (ascii		. #x72)	; �����
    (latin-jisx0201	. #x72)	; �����
    (ipa		. #xD6)	; �����
    (latin-viscii	. #x72)	; r
    (ucs		. #x0072)	; r
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (ucs		  . #xFF53)	; ｓ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (ucs		  . #x0053)	; S
      ))
    (ascii		. #x73)	; �����
    (latin-jisx0201	. #x73)	; �����
    (ipa		. #xCA)	; �����
    (latin-viscii	. #x73)	; s
    (ucs		. #x0073)	; s
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER T")
      (ucs		  . #xFF54)	; ｔ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T")
      (ucs		  . #x0054)	; T
      ))
    (ascii		. #x74)	; �����
    (latin-jisx0201	. #x74)	; �����
    (ipa		. #xC2)	; �����
    (latin-viscii	. #x74)	; t
    (ucs		. #x0074)	; t
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (ucs		  . #xFF55)	; ｕ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U")
      (ucs		  . #x0055)	; U
      ))
    (ascii		. #x75)	; �����
    (latin-jisx0201	. #x75)	; �����
    (ipa		. #xB4)	; �����
    (latin-viscii	. #x75)	; u
    (ucs		. #x0075)	; u
    ))
(define-char
  '((name		. "LATIN SMALL LETTER V")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER V")
      (ucs		  . #xFF56)	; ｖ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER V")
      (ucs		  . #x0056)	; V
      ))
    (ascii		. #x76)	; �����
    (latin-jisx0201	. #x76)	; �����
    (ipa		. #xC7)	; �����
    (latin-viscii	. #x76)	; v
    (ucs		. #x0076)	; v
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER W")
      (ucs		  . #xFF57)	; ｗ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W")
      (ucs		  . #x0057)	; W
      ))
    (ascii		. #x77)	; �����
    (latin-jisx0201	. #x77)	; �����
    (ipa		. #xDE)	; �����
    (latin-viscii	. #x77)	; w
    (ucs		. #x0077)	; w
    ))
(define-char
  '((name		. "LATIN SMALL LETTER X")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER X")
      (ucs		  . #xFF58)	; ｘ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER X")
      (ucs		  . #x0058)	; X
      ))
    (ascii		. #x78)	; �����
    (latin-jisx0201	. #x78)	; �����
    (ipa		. #xCF)	; �����
    (latin-viscii	. #x78)	; x
    (ucs		. #x0078)	; x
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Y")
      (ucs		  . #xFF59)	; ｙ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y")
      (ucs		  . #x0059)	; Y
      ))
    (ascii		. #x79)	; �����
    (latin-jisx0201	. #x79)	; �����
    (ipa		. #xAD)	; �����
    (latin-viscii	. #x79)	; y
    (ucs		. #x0079)	; y
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Z")
      (ucs		  . #xFF5A)	; ｚ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z")
      (ucs		  . #x005A)	; Z
      ))
    (ascii		. #x7A)	; �����
    (latin-jisx0201	. #x7A)	; �����
    (ipa		. #xCB)	; �����
    (latin-viscii	. #x7A)	; z
    (ucs		. #x007A)	; z
    ))
(define-char
  '((name		. "LEFT CURLY BRACKET")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT CURLY BRACKET")
      (ucs		  . #xFF5B)	; ｛
      ))
    (ascii		. #x7B)	; �����
    (latin-jisx0201	. #x7B)	; �����
    (latin-viscii	. #x7B)	; {
    (ucs		. #x007B)	; {
    ))
(define-char
  '((name		. "VERTICAL LINE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH VERTICAL LINE")
      (ucs		  . #xFF5C)	; ｜
      ))
    (ascii		. #x7C)	; �����
    (latin-jisx0201	. #x7C)	; �����
    (latin-viscii	. #x7C)	; |
    (ucs		. #x007C)	; |
    ))
(define-char
  '((name		. "RIGHT CURLY BRACKET")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT CURLY BRACKET")
      (ucs		  . #xFF5D)	; ｝
      ))
    (ascii		. #x7D)	; �����
    (latin-jisx0201	. #x7D)	; �����
    (latin-viscii	. #x7D)	; }
    (ucs		. #x007D)	; }
    ))
(define-char
  '((name		. "TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (->fullwidth
     ((name		  . "FULLWIDTH TILDE")
      (ucs		  . #xFF5E)	; ～
      ))
    (ascii		. #x7E)	; �����
    (latin-viscii	. #x7E)	; ~
    (ucs		. #x007E)	; ~
    ))
(define-char
  '((name		. "DELETE")
    (general-category	other control) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ascii		. #x7F)	; �����
    (latin-viscii	. #x7F)	; ␡
    (ucs		. #x007F)	; ␡
    ))
