(define-char
  '((name		. "SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (ascii		. #x20)	; øº¿›
    (ipa		. #xFF)	; øº’›¿
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
      (ucs		  . #xFF01)	; ï¼
      ))
    (ascii		. #x21)	; øº¿œ
    (latin-jisx0201	. #x21)	; øº‘‹Œ
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
      (ucs		  . #xFF02)	; ï¼‚
      ))
    (ascii		. #x22)	; øº¿
    (latin-jisx0201	. #x22)	; øº‘‹
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
      (ucs		  . #xFF03)	; ï¼ƒ
      ))
    (ascii		. #x23)	; øº¿ž
    (latin-jisx0201	. #x23)	; øº‘‹Ž
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
      (ucs		  . #xFF04)	; ï¼„
      ))
    (ascii		. #x24)	; øº¿Ÿ
    (latin-jisx0201	. #x24)	; øº‘‹
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
      (ucs		  . #xFF05)	; ï¼…
      ))
    (ascii		. #x25)	; øº¿ 
    (latin-jisx0201	. #x25)	; øº‘‹
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
      (ucs		  . #xFF06)	; ï¼†
      ))
    (ascii		. #x26)	; øº¿¡
    (latin-jisx0201	. #x26)	; øº‘‹‘
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
      (ucs		  . #xFF07)	; ï¼‡
      ))
    (ascii		. #x27)	; øº¿¢
    (latin-jisx0201	. #x27)	; øº‘‹’
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
      (ucs		  . #xFF08)	; ï¼ˆ
      ))
    (ascii		. #x28)	; øº¿£
    (latin-jisx0201	. #x28)	; øº‘‹“
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
      (ucs		  . #xFF09)	; ï¼‰
      ))
    (ascii		. #x29)	; øº¿¤
    (latin-jisx0201	. #x29)	; øº‘‹”
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
      (ucs		  . #xFF0A)	; ï¼Š
      ))
    (ascii		. #x2A)	; øº¿¥
    (latin-jisx0201	. #x2A)	; øº‘‹•
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
      (ucs		  . #xFF0B)	; ï¼‹
      ))
    (ascii		. #x2B)	; øº¿¦
    (latin-jisx0201	. #x2B)	; øº‘‹–
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
      (ucs		  . #xFF0C)	; ï¼Œ
      ))
    (ascii		. #x2C)	; øº¿§
    (latin-jisx0201	. #x2C)	; øº‘‹—
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
      (ucs		  . #xFF0D)	; ï¼
      ))
    (ascii		. #x2D)	; øº¿¨
    (latin-jisx0201	. #x2D)	; øº‘‹˜
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
      (ucs		  . #xFF0E)	; ï¼Ž
      ))
    (ascii		. #x2E)	; øº¿©
    (latin-jisx0201	. #x2E)	; øº‘‹™
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
      (ucs		  . #xFF0F)	; ï¼
      ))
    (ascii		. #x2F)	; øº¿ª
    (latin-jisx0201	. #x2F)	; øº‘‹š
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
      (ucs		  . #xFF10)	; ï¼
      ))
    (ascii		. #x30)	; øº¿«
    (latin-jisx0201	. #x30)	; øº‘‹›
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
      (ucs		  . #xFF11)	; ï¼‘
      ))
    (ascii		. #x31)	; øº¿¬
    (latin-jisx0201	. #x31)	; øº‘‹œ
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
      (ucs		  . #xFF12)	; ï¼’
      ))
    (ascii		. #x32)	; øº¿­
    (latin-jisx0201	. #x32)	; øº‘‹
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
      (ucs		  . #xFF13)	; ï¼“
      ))
    (ascii		. #x33)	; øº¿®
    (latin-jisx0201	. #x33)	; øº‘‹ž
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
      (ucs		  . #xFF14)	; ï¼”
      ))
    (ascii		. #x34)	; øº¿¯
    (latin-jisx0201	. #x34)	; øº‘‹Ÿ
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
      (ucs		  . #xFF15)	; ï¼•
      ))
    (ascii		. #x35)	; øº¿°
    (latin-jisx0201	. #x35)	; øº‘‹ 
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
      (ucs		  . #xFF16)	; ï¼–
      ))
    (ascii		. #x36)	; øº¿±
    (latin-jisx0201	. #x36)	; øº‘‹¡
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
      (ucs		  . #xFF17)	; ï¼—
      ))
    (ascii		. #x37)	; øº¿²
    (latin-jisx0201	. #x37)	; øº‘‹¢
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
      (ucs		  . #xFF18)	; ï¼˜
      ))
    (ascii		. #x38)	; øº¿³
    (latin-jisx0201	. #x38)	; øº‘‹£
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
      (ucs		  . #xFF19)	; ï¼™
      ))
    (ascii		. #x39)	; øº¿´
    (latin-jisx0201	. #x39)	; øº‘‹¤
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
      (ucs		  . #xFF1A)	; ï¼š
      ))
    (ascii		. #x3A)	; øº¿µ
    (latin-jisx0201	. #x3A)	; øº‘‹¥
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
      (ucs		  . #xFF1B)	; ï¼›
      ))
    (ascii		. #x3B)	; øº¿¶
    (latin-jisx0201	. #x3B)	; øº‘‹¦
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
      (ucs		  . #xFF1C)	; ï¼œ
      ))
    (ascii		. #x3C)	; øº¿·
    (latin-jisx0201	. #x3C)	; øº‘‹§
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
      (ucs		  . #xFF1D)	; ï¼
      ))
    (ascii		. #x3D)	; øº¿¸
    (latin-jisx0201	. #x3D)	; øº‘‹¨
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
      (ucs		  . #xFF1E)	; ï¼ž
      ))
    (ascii		. #x3E)	; øº¿¹
    (latin-jisx0201	. #x3E)	; øº‘‹©
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
      (ucs		  . #xFF1F)	; ï¼Ÿ
      ))
    (ascii		. #x3F)	; øº¿º
    (latin-jisx0201	. #x3F)	; øº‘‹ª
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
      (ucs		  . #xFF20)	; ï¼ 
      ))
    (ascii		. #x40)	; øº¿»
    (latin-jisx0201	. #x40)	; øº‘‹«
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
      (ucs		  . #xFF21)	; ï¼¡
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A")
      (ucs		  . #x0061)	; a
      ))
    (ascii		. #x41)	; øº¿¼
    (latin-jisx0201	. #x41)	; øº‘‹¬
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
      (ucs		  . #xFF22)	; ï¼¢
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER B")
      (ucs		  . #x0062)	; b
      ))
    (ascii		. #x42)	; øº¿½
    (latin-jisx0201	. #x42)	; øº‘‹­
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
      (ucs		  . #xFF23)	; ï¼£
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C")
      (ucs		  . #x0063)	; c
      ))
    (ascii		. #x43)	; øº¿¾
    (latin-jisx0201	. #x43)	; øº‘‹®
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
      (ucs		  . #xFF24)	; ï¼¤
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D")
      (ucs		  . #x0064)	; d
      ))
    (ascii		. #x44)	; øº¿¿
    (latin-jisx0201	. #x44)	; øº‘‹¯
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
      (ucs		  . #xFF25)	; ï¼¥
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E")
      (ucs		  . #x0065)	; e
      ))
    (ascii		. #x45)	; øº‘€€
    (latin-jisx0201	. #x45)	; øº‘‹°
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
      (ucs		  . #xFF26)	; ï¼¦
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER F")
      (ucs		  . #x0066)	; f
      ))
    (ascii		. #x46)	; øº‘€
    (latin-jisx0201	. #x46)	; øº‘‹±
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
      (ucs		  . #xFF27)	; ï¼§
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G")
      (ucs		  . #x0067)	; g
      ))
    (ascii		. #x47)	; øº‘€‚
    (latin-jisx0201	. #x47)	; øº‘‹²
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
      (ucs		  . #xFF28)	; ï¼¨
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H")
      (ucs		  . #x0068)	; h
      ))
    (ascii		. #x48)	; øº‘€ƒ
    (latin-jisx0201	. #x48)	; øº‘‹³
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
      (ucs		  . #xFF29)	; ï¼©
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (ucs		  . #x0069)	; i
      ))
    (ascii		. #x49)	; øº‘€„
    (latin-jisx0201	. #x49)	; øº‘‹´
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
      (ucs		  . #xFF2A)	; ï¼ª
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J")
      (ucs		  . #x006A)	; j
      ))
    (ascii		. #x4A)	; øº‘€…
    (latin-jisx0201	. #x4A)	; øº‘‹µ
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
      (ucs		  . #xFF2B)	; ï¼«
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K")
      (ucs		  . #x006B)	; k
      ))
    (ascii		. #x4B)	; øº‘€†
    (latin-jisx0201	. #x4B)	; øº‘‹¶
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
      (ucs		  . #xFF2C)	; ï¼¬
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L")
      (ucs		  . #x006C)	; l
      ))
    (ascii		. #x4C)	; øº‘€‡
    (latin-jisx0201	. #x4C)	; øº‘‹·
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
      (ucs		  . #xFF2D)	; ï¼­
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER M")
      (ucs		  . #x006D)	; m
      ))
    (ascii		. #x4D)	; øº‘€ˆ
    (latin-jisx0201	. #x4D)	; øº‘‹¸
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
      (ucs		  . #xFF2E)	; ï¼®
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N")
      (ucs		  . #x006E)	; n
      ))
    (ascii		. #x4E)	; øº‘€‰
    (latin-jisx0201	. #x4E)	; øº‘‹¹
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
      (ucs		  . #xFF2F)	; ï¼¯
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O")
      (ucs		  . #x006F)	; o
      ))
    (ascii		. #x4F)	; øº‘€Š
    (latin-jisx0201	. #x4F)	; øº‘‹º
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
      (ucs		  . #xFF30)	; ï¼°
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER P")
      (ucs		  . #x0070)	; p
      ))
    (ascii		. #x50)	; øº‘€‹
    (latin-jisx0201	. #x50)	; øº‘‹»
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
      (ucs		  . #xFF31)	; ï¼±
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Q")
      (ucs		  . #x0071)	; q
      ))
    (ascii		. #x51)	; øº‘€Œ
    (latin-jisx0201	. #x51)	; øº‘‹¼
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
      (ucs		  . #xFF32)	; ï¼²
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R")
      (ucs		  . #x0072)	; r
      ))
    (ascii		. #x52)	; øº‘€
    (latin-jisx0201	. #x52)	; øº‘‹½
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
      (ucs		  . #xFF33)	; ï¼³
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S")
      (ucs		  . #x0073)	; s
      ))
    (ascii		. #x53)	; øº‘€Ž
    (latin-jisx0201	. #x53)	; øº‘‹¾
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
      (ucs		  . #xFF34)	; ï¼´
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T")
      (ucs		  . #x0074)	; t
      ))
    (ascii		. #x54)	; øº‘€
    (latin-jisx0201	. #x54)	; øº‘‹¿
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
      (ucs		  . #xFF35)	; ï¼µ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U")
      (ucs		  . #x0075)	; u
      ))
    (ascii		. #x55)	; øº‘€
    (latin-jisx0201	. #x55)	; øº‘Œ€
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
      (ucs		  . #xFF36)	; ï¼¶
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER V")
      (ucs		  . #x0076)	; v
      ))
    (ascii		. #x56)	; øº‘€‘
    (latin-jisx0201	. #x56)	; øº‘Œ
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
      (ucs		  . #xFF37)	; ï¼·
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W")
      (ucs		  . #x0077)	; w
      ))
    (ascii		. #x57)	; øº‘€’
    (latin-jisx0201	. #x57)	; øº‘Œ‚
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
      (ucs		  . #xFF38)	; ï¼¸
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER X")
      (ucs		  . #x0078)	; x
      ))
    (ascii		. #x58)	; øº‘€“
    (latin-jisx0201	. #x58)	; øº‘Œƒ
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
      (ucs		  . #xFF39)	; ï¼¹
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y")
      (ucs		  . #x0079)	; y
      ))
    (ascii		. #x59)	; øº‘€”
    (latin-jisx0201	. #x59)	; øº‘Œ„
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
      (ucs		  . #xFF3A)	; ï¼º
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z")
      (ucs		  . #x007A)	; z
      ))
    (ascii		. #x5A)	; øº‘€•
    (latin-jisx0201	. #x5A)	; øº‘Œ…
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
      (ucs		  . #xFF3B)	; ï¼»
      ))
    (ascii		. #x5B)	; øº‘€–
    (latin-jisx0201	. #x5B)	; øº‘Œ†
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
      (ucs		  . #xFF3C)	; ï¼¼
      ))
    (ascii		. #x5C)	; øº‘€—
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
      (ucs		  . #xFF3D)	; ï¼½
      ))
    (ascii		. #x5D)	; øº‘€˜
    (latin-jisx0201	. #x5D)	; øº‘Œˆ
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
      (ucs		  . #xFF3E)	; ï¼¾
      ))
    (ascii		. #x5E)	; øº‘€™
    (latin-jisx0201	. #x5E)	; øº‘Œ‰
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
      (ucs		  . #xFF3F)	; ï¼¿
      ))
    (ascii		. #x5F)	; øº‘€š
    (latin-jisx0201	. #x5F)	; øº‘ŒŠ
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
      (ucs		  . #xFF40)	; ï½€
      ))
    (ascii		. #x60)	; øº‘€›
    (latin-jisx0201	. #x60)	; øº‘Œ‹
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
      (ucs		  . #xFF41)	; ï½
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A")
      (ucs		  . #x0041)	; A
      ))
    (ascii		. #x61)	; øº‘€œ
    (latin-jisx0201	. #x61)	; øº‘ŒŒ
    (ipa		. #xA5)	; øº’š¥
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
      (ucs		  . #xFF42)	; ï½‚
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER B")
      (ucs		  . #x0042)	; B
      ))
    (ascii		. #x62)	; øº‘€
    (latin-jisx0201	. #x62)	; øº‘Œ
    (ipa		. #xC1)	; øº’›
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
      (ucs		  . #xFF43)	; ï½ƒ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C")
      (ucs		  . #x0043)	; C
      ))
    (ascii		. #x63)	; øº‘€ž
    (latin-jisx0201	. #x63)	; øº‘ŒŽ
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
      (ucs		  . #xFF44)	; ï½„
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D")
      (ucs		  . #x0044)	; D
      ))
    (ascii		. #x64)	; øº‘€Ÿ
    (latin-jisx0201	. #x64)	; øº‘Œ
    (ipa		. #xC3)	; øº’›ƒ
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
      (ucs		  . #xFF45)	; ï½…
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E")
      (ucs		  . #x0045)	; E
      ))
    (ascii		. #x65)	; øº‘€ 
    (latin-jisx0201	. #x65)	; øº‘Œ
    (ipa		. #xA2)	; øº’š¢
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
      (ucs		  . #xFF46)	; ï½†
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER F")
      (ucs		  . #x0046)	; F
      ))
    (ascii		. #x66)	; øº‘€¡
    (latin-jisx0201	. #x66)	; øº‘Œ‘
    (ipa		. #xC6)	; øº’›†
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
      (ucs		  . #xFF47)	; ï½‡
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G")
      (ucs		  . #x0047)	; G
      ))
    (ascii		. #x67)	; øº‘€¢
    (latin-jisx0201	. #x67)	; øº‘Œ’
    (ipa		. #xC5)	; øº’›…
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
      (ucs		  . #xFF48)	; ï½ˆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H")
      (ucs		  . #x0048)	; H
      ))
    (ascii		. #x68)	; øº‘€£
    (latin-jisx0201	. #x68)	; øº‘Œ“
    (ipa		. #xD1)	; øº’›‘
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
      (ucs		  . #xFF49)	; ï½‰
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (ucs		  . #x0049)	; I
      ))
    (ascii		. #x69)	; øº‘€¤
    (latin-jisx0201	. #x69)	; øº‘Œ”
    (ipa		. #xA0)	; øº’š 
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
      (ucs		  . #xFF4A)	; ï½Š
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J")
      (ucs		  . #x004A)	; J
      ))
    (ascii		. #x6A)	; øº‘€¥
    (latin-jisx0201	. #x6A)	; øº‘Œ•
    (ipa		. #xD9)	; øº’›™
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
      (ucs		  . #xFF4B)	; ï½‹
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K")
      (ucs		  . #x004B)	; K
      ))
    (ascii		. #x6B)	; øº‘€¦
    (latin-jisx0201	. #x6B)	; øº‘Œ–
    (ipa		. #xC4)	; øº’›„
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
      (ucs		  . #xFF4C)	; ï½Œ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L")
      (ucs		  . #x004C)	; L
      ))
    (ascii		. #x6C)	; øº‘€§
    (latin-jisx0201	. #x6C)	; øº‘Œ—
    (ipa		. #xDA)	; øº’›š
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
      (ucs		  . #xFF4D)	; ï½
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER M")
      (ucs		  . #x004D)	; M
      ))
    (ascii		. #x6D)	; øº‘€¨
    (latin-jisx0201	. #x6D)	; øº‘Œ˜
    (ipa		. #xD2)	; øº’›’
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
      (ucs		  . #xFF4E)	; ï½Ž
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N")
      (ucs		  . #x004E)	; N
      ))
    (ascii		. #x6E)	; øº‘€©
    (latin-jisx0201	. #x6E)	; øº‘Œ™
    (ipa		. #xD3)	; øº’›“
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
      (ucs		  . #xFF4F)	; ï½
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O")
      (ucs		  . #x004F)	; O
      ))
    (ascii		. #x6F)	; øº‘€ª
    (latin-jisx0201	. #x6F)	; øº‘Œš
    (ipa		. #xB6)	; øº’š¶
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
      (ucs		  . #xFF50)	; ï½
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER P")
      (ucs		  . #x0050)	; P
      ))
    (ascii		. #x70)	; øº‘€«
    (latin-jisx0201	. #x70)	; øº‘Œ›
    (ipa		. #xC0)	; øº’›€
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
      (ucs		  . #xFF51)	; ï½‘
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Q")
      (ucs		  . #x0051)	; Q
      ))
    (ascii		. #x71)	; øº‘€¬
    (latin-jisx0201	. #x71)	; øº‘Œœ
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
      (ucs		  . #xFF52)	; ï½’
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R")
      (ucs		  . #x0052)	; R
      ))
    (ascii		. #x72)	; øº‘€­
    (latin-jisx0201	. #x72)	; øº‘Œ
    (ipa		. #xD6)	; øº’›–
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
      (ucs		  . #xFF53)	; ï½“
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (ucs		  . #x0053)	; S
      ))
    (ascii		. #x73)	; øº‘€®
    (latin-jisx0201	. #x73)	; øº‘Œž
    (ipa		. #xCA)	; øº’›Š
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
      (ucs		  . #xFF54)	; ï½”
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T")
      (ucs		  . #x0054)	; T
      ))
    (ascii		. #x74)	; øº‘€¯
    (latin-jisx0201	. #x74)	; øº‘ŒŸ
    (ipa		. #xC2)	; øº’›‚
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
      (ucs		  . #xFF55)	; ï½•
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U")
      (ucs		  . #x0055)	; U
      ))
    (ascii		. #x75)	; øº‘€°
    (latin-jisx0201	. #x75)	; øº‘Œ 
    (ipa		. #xB4)	; øº’š´
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
      (ucs		  . #xFF56)	; ï½–
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER V")
      (ucs		  . #x0056)	; V
      ))
    (ascii		. #x76)	; øº‘€±
    (latin-jisx0201	. #x76)	; øº‘Œ¡
    (ipa		. #xC7)	; øº’›‡
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
      (ucs		  . #xFF57)	; ï½—
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W")
      (ucs		  . #x0057)	; W
      ))
    (ascii		. #x77)	; øº‘€²
    (latin-jisx0201	. #x77)	; øº‘Œ¢
    (ipa		. #xDE)	; øº’›ž
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
      (ucs		  . #xFF58)	; ï½˜
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER X")
      (ucs		  . #x0058)	; X
      ))
    (ascii		. #x78)	; øº‘€³
    (latin-jisx0201	. #x78)	; øº‘Œ£
    (ipa		. #xCF)	; øº’›
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
      (ucs		  . #xFF59)	; ï½™
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y")
      (ucs		  . #x0059)	; Y
      ))
    (ascii		. #x79)	; øº‘€´
    (latin-jisx0201	. #x79)	; øº‘Œ¤
    (ipa		. #xAD)	; øº’š­
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
      (ucs		  . #xFF5A)	; ï½š
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z")
      (ucs		  . #x005A)	; Z
      ))
    (ascii		. #x7A)	; øº‘€µ
    (latin-jisx0201	. #x7A)	; øº‘Œ¥
    (ipa		. #xCB)	; øº’›‹
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
      (ucs		  . #xFF5B)	; ï½›
      ))
    (ascii		. #x7B)	; øº‘€¶
    (latin-jisx0201	. #x7B)	; øº‘Œ¦
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
      (ucs		  . #xFF5C)	; ï½œ
      ))
    (ascii		. #x7C)	; øº‘€·
    (latin-jisx0201	. #x7C)	; øº‘Œ§
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
      (ucs		  . #xFF5D)	; ï½
      ))
    (ascii		. #x7D)	; øº‘€¸
    (latin-jisx0201	. #x7D)	; øº‘Œ¨
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
      (ucs		  . #xFF5E)	; ï½ž
      ))
    (ascii		. #x7E)	; øº‘€¹
    (latin-viscii	. #x7E)	; ~
    (ucs		. #x007E)	; ~
    ))
(define-char
  '((name		. "DELETE")
    (general-category	other control) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (ascii		. #x7F)	; øº‘€º
    (latin-viscii	. #x7F)	; â¡
    (ucs		. #x007F)	; â¡
    ))
